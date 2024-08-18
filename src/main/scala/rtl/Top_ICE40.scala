package Cosmac

import spinal.core._
import spinal.lib._
import spinal.lib.blackbox.lattice.ice40._

import Spinal1802._
import Spinal1861._
import TFT_Driver._
import MySpinalHardware._


//Hardware definition
class Top_ICE40(val withLcd: Boolean, val ramFile: String, val romFile: String) extends Component {
    val io = new Bundle {
        val reset_ = in Bool()
        val clk_12Mhz = in Bool() //12Mhz CLK
        val video = out Bool()
        val sync = out Bool()

        val serial_txd = out Bool()
        val serial_rxd = in Bool()

        val led_red = out Bool()
        val keypad = new Bundle {
            val col = in Bits(4 bits)
            val row = out Bits(4 bits)
        }
        val lcd = new Bundle {
            val sck = ifGen(withLcd) (out Bool())
            val rst = ifGen(withLcd) (out Bool())
            val dc = ifGen(withLcd) (out Bool())
            val sdo = ifGen(withLcd) (out Bool())
        }
    }
    noIoPrefix()
    
    //Define clock domains
    val clk48Domain = ClockDomain.internal(name = "Core48",  frequency = FixedFrequency(48 MHz))
    val clk17Domain = ClockDomain.internal(name = "Core17",  frequency = FixedFrequency(17.625 MHz))
    val clk12Domain = ClockDomain.internal(name = "Core12",  frequency = FixedFrequency(12 MHz))

    val Core12 = new ClockingArea(clk12Domain) {
        var reset = Reg(Bool) init (False)
        var rstCounter = CounterFreeRun(255)
        when(rstCounter.willOverflow){
            reset := True
        }
    }

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
    
    //Connect the PLL output of 12Mhz to the 12MHz clock domain
    clk12Domain.clock := io.clk_12Mhz
    clk12Domain.reset := !io.reset_

    //Connect the PLL output of 17.625Mhz to the 17.625MHz clock domain
    clk17Domain.clock := PLL.PLLOUTGLOBAL
    clk17Domain.reset := !Core12.reset

    //Connect the internal oscillator output to the 48MHz clock domain
    clk48Domain.clock := intOSC.io.CLKHF
    clk48Domain.reset := !Core12.reset

    val Core17 = new ClockingArea(clk17Domain) {
        val pro = new ProgrammingInterface(57600)
        io.serial_txd := pro.io.UartTX
        pro.io.UartRX := io.serial_rxd
        pro.io.FlagIn := 0x00
        val keyReady = False
        pro.io.keys.ready := keyReady.fall()
        
        val Ram = new RamInit(ramFile, log2Up(0x1fff))
            Ram.io.ena := True

        //Dived the 17.625Mhz by 10 = 1.7625Mhz
        val areaDiv = new SlowArea(10) {
            var cosmacVIP = new VIP(10)
                cosmacVIP.io.reset := !pro.io.FlagOut(0)
                cosmacVIP.io.Start := !pro.io.FlagOut(1)
                cosmacVIP.io.Wait := !pro.io.FlagOut(2)
                cosmacVIP.io.ram.din := Ram.io.douta

            val Rom = new RamInit(romFile, log2Up(0x1ff))
                Rom.io.ena := True
                Rom.io.wea := 0
                Rom.io.dina := 0x00
                Rom.io.addra := cosmacVIP.io.rom.addr
                cosmacVIP.io.rom.data := Rom.io.douta

            
            io.sync := cosmacVIP.io.sync
            io.video := cosmacVIP.io.video
            io.led_red := cosmacVIP.io.q
            io.keypad <> cosmacVIP.io.keypad
        }

        pro.io.RamInterface.DataIn := Ram.io.douta
        when(pro.io.FlagOut(2))
        {
            Ram.io.dina := pro.io.RamInterface.DataOut
            Ram.io.wea := pro.io.RamInterface.Write.asBits
            Ram.io.addra := pro.io.RamInterface.Address.resized
        }otherwise{
            Ram.io.dina := areaDiv.cosmacVIP.io.ram.dout
            Ram.io.wea := areaDiv.cosmacVIP.io.ram.wr.asBits
            Ram.io.addra := areaDiv.cosmacVIP.io.ram.addr
        }

        val lcd = ifGen(withLcd) (new Area(){  
            val startFrame = !areaDiv.cosmacVIP.io.Pixie.INT
            val startLine = !areaDiv.cosmacVIP.io.Pixie.DMAO
            val dataClk = (areaDiv.cosmacVIP.io.CPU.TPB && areaDiv.cosmacVIP.io.CPU.SC === 2)
            val data = areaDiv.cosmacVIP.io.CPU.DataOut
        })
    }

    val lcd = ifGen(withLcd) (new Area(){    
        val Core48 = new ClockingArea(clk48Domain) {
            
            //Clock Crossing
            val startFrame = BufferCC(Core17.lcd.startFrame, False)
            val startLine = BufferCC(Core17.lcd.startLine, False)
            val dataClkB = BufferCC(Core17.lcd.dataClk, False)
            val dataClk = dataClkB.fall()
            val dataClkD = RegNext(dataClk)
            val data = RegNextWhen(Core17.lcd.data, dataClk) init(0)
            
            var LCD = LCD_Pixie(10 ms)
            LCD.io.startFrame := startFrame
            LCD.io.startLine := startLine
            LCD.io.dataClk := dataClkD
            LCD.io.data := data
            
            io.lcd <> LCD.io.lcd
        }
    })
}

object Top_ICE40_Verilog extends App {
  Config.spinal.generateVerilog(new Top_ICE40(false, "./data/test_1861.bin", "./data/vip.rom"))
}