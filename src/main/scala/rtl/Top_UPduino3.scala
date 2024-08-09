package mylib

import spinal.core._
import spinal.lib._
import spinal.lib.blackbox.lattice.ice40._

import Spinal1802._
import MyHardware._
import TFT_Driver._
import MyHardware._


//Hardware definition
class Top(val withLcd: Boolean, val ramFile: String, val romFile: String) extends Component {
    val io = new Bundle {
        val reset_ = in Bool
        val clk_12Mhz = in Bool //12Mhz CLK
        val video = out Bool
        val sync = out Bool

        val led_red = out Bool
        val keypad = new Bundle {
            val col = in Bits(4 bits)
            val row = out Bits(4 bits)
        }
        val lcd = new Bundle {
            val sck = ifGen(withLcd) (out Bool)
            val rst = ifGen(withLcd) (out Bool)
            val dc = ifGen(withLcd) (out Bool)
            val sdo = ifGen(withLcd) (out Bool)
        }
    }
    noIoPrefix()
    
    //Define clock domains
    val clk48Domain = ClockDomain.internal(name = "Core48",  frequency = FixedFrequency(48 MHz))
    val clk17Domain = ClockDomain.internal(name = "Core17",  frequency = FixedFrequency(17.625 MHz))

    //Allow clock domain crossing.
    clk48Domain.setSyncronousWith(clk17Domain)

    //PLL Settings for 17.625MHz
    val PLL_CONFIG = SB_PLL40_PAD_CONFIG(
        DIVR = B"0000", DIVF = B"0101110", DIVQ = B"101", FILTER_RANGE = B"001",
        FEEDBACK_PATH = "SIMPLE", PLLOUT_SELECT = "GENCLK", 
        DELAY_ADJUSTMENT_MODE_FEEDBACK = "FIXED", DELAY_ADJUSTMENT_MODE_RELATIVE = "FIXED", //NO DELAY
        FDA_FEEDBACK = B"0000", FDA_RELATIVE = B"0000", SHIFTREG_DIV_MODE = B"0", ENABLE_ICEGATE = False //NOT USED
    ) 

    //Define PLL
    val PLL = new SB_PLL40_CORE(PLL_CONFIG)
    //Setup signals of PLL
    PLL.BYPASS := False
    PLL.RESETB := True
    PLL.REFERENCECLK := io.clk_12Mhz

    //Define the internal oscillator
    val intOSC = new IntOSC()
    intOSC.io.CLKHFEN := True
    intOSC.io.CLKHFPU := True
    
    //Connect the PLL output of 17.625Mhz to the 17.625MHz clock domain
    clk17Domain.clock := PLL.PLLOUTGLOBAL
    clk17Domain.reset := !io.reset_

    //Connect the internal oscillator output to the 48MHz clock domain
    clk48Domain.clock := intOSC.io.CLKHF
    clk48Domain.reset := !io.reset_

    val Core17 = new ClockingArea(clk17Domain) {
        var reset = Reg(Bool) init (False)
        var rstCounter = CounterFreeRun(25)
        when(rstCounter.willOverflow){
            reset := True
        }

        //Dived the 17.625Mhz by 10 = 1.7625Mhz
        val areaDiv = new SlowArea(10) {
            var VIP = new Top()

            val Rom = new Ram(romFile, log2Up(0x1ff))
                Rom.io.ena := True
                Rom.io.wea := 0
                Rom.io.dina := 0x00
                Rom.io.addra := VIP.io.rom.addr

            val Ram = new Ram(ramFile, log2Up(0x1fff))
                Ram.io.ena := True
                Ram.io.wea := (!Cpu.io.MWR).asBits 
                Ram.io.dina := Cpu.io.DataOut
                Ram.io.addra := Cpu.io.Addr16(12 downto 0)
        }
    }

    val lcd = ifGen(withLcd) (new Area(){    
        val lcd_startFrame = !Core17.areaDiv.Pixie.io.INT
        val lcd_startLine = !Core17.areaDiv.Pixie.io.DMAO
        val lcd_dataClk = (Core17.areaDiv.Cpu.io.TPB && Core17.areaDiv.Cpu.io.SC === 2)
        val lcd_data = Core17.areaDiv.Cpu.io.DataOut

        val Core48 = new ClockingArea(clk48Domain) {
            //Clock Crossing
            val startFrame = BufferCC(lcd_startFrame, False)
            val startLine = BufferCC(lcd_startLine, False)
            val dataClkB = BufferCC(lcd_dataClk, False)
            val dataClk = dataClkB.rise()
            val dataClkD = RegNext(dataClk)
            val data = RegNextWhen(lcd_data, dataClk) init(0)
            
            var LCD = LCD_Pixie(10 ms)
            LCD.io.startFrame := startFrame
            LCD.io.startLine := startLine
            LCD.io.dataClk := dataClkD
            LCD.io.data := data
            
            io.lcd <> LCD.io.lcd
        }
    })
}

object TopVerilog {
    def main(args: Array[String]) {
        SpinalVerilog(new Top(false, "./data/Chip8_Tetris2.bin", "./data/vip.rom"))
    }
}