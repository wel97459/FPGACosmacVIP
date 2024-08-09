package rtl

import spinal.core._
import spinal.lib._
import spinal.lib.blackbox.lattice.ice40._

import Spinal1802._
import MySpinalHardware._
import TFT_Driver._


//Hardware definition
class Top_ICE40(val withLcd: Boolean, val ramFile: String, val romFile: String) extends Component {
    val io = new Bundle {
        val reset_ = in Bool()
        val clk_12Mhz = in Bool() //12Mhz CLK
        val video = out Bool()
        val sync = out Bool()

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
            
            val Cpu = new Spinal1802()
            //val Cpu = new new1802.new1802()
            Cpu.io.Wait_n := True
            Cpu.io.DMA_In_n := True

            val Pixie = new Spinal1861(10)
            //Connection to Pixie
            Pixie.io.DataIn := Cpu.io.DataOut
            Pixie.io.SC := Cpu.io.SC
            Pixie.io.TPA := Cpu.io.TPA
            Pixie.io.TPB := Cpu.io.TPB
            Pixie.io.Disp_On := (Cpu.io.N === 1 && Cpu.io.TPB && !Cpu.io.MWR)
            Pixie.io.Disp_Off := (Cpu.io.N === 1 && Cpu.io.TPB && !Cpu.io.MRD)
            Pixie.io.Reset_ := reset

            //Connection to CPU from Pixie
            Cpu.io.Interrupt_n := Pixie.io.INT
            Cpu.io.DMA_Out_n := Pixie.io.DMAO
            Cpu.io.Clear_n := Pixie.io.Clear
            
            val Rom = new RamInit(romFile, log2Up(0x1ff))
                Rom.io.ena := True
                Rom.io.wea := 0
                Rom.io.dina := 0x00
                Rom.io.addra := Cpu.io.Addr16(8 downto 0)

            val Ram = new RamInit(ramFile, log2Up(0x1fff))
                Ram.io.ena := True
                Ram.io.wea := (!Cpu.io.MWR).asBits 
                Ram.io.dina := Cpu.io.DataOut
                Ram.io.addra := Cpu.io.Addr16(12 downto 0)

            val romBootLatch = Reg(Bool) init (False)
                //When reset, clear the latch so system boots from ROM. 
                when(!Pixie.io.Clear) {
                    romBootLatch := False
                //The ROM contains the monitor program which uses a 64h instruction to pulse the N2 line.
                } elsewhen (Cpu.io.N === 4) {
                    romBootLatch := True
                }

                when(!romBootLatch || Cpu.io.Addr16.asUInt >= 0x8000 && Cpu.io.Addr16.asUInt <= 0x81ff) {
                    Cpu.io.DataIn := Rom.io.douta
                }elsewhen(Cpu.io.Addr16.asUInt < 0x2000) {
                    Cpu.io.DataIn := Ram.io.douta
                }otherwise{
                    Cpu.io.DataIn := 0x00
                }

            val keypad = new Keypad()
                keypad.io.LatchKey := (Cpu.io.N === 2 && Cpu.io.TPB && !Cpu.io.MRD)
                keypad.io.Key := Cpu.io.DataOut(3 downto 0)
                io.keypad.row := ~keypad.io.KeypadRow
                keypad.io.KeypadCol := io.keypad.col

            Cpu.io.EF_n := Cat(B"1", keypad.io.KeyOut, B"1", Pixie.io.EFx)

            //Good beeper sounds
            val beeper = CounterFreeRun(1000)
            io.sync := Pixie.io.CompSync_
            io.video := Pixie.io.Video

            io.led_red := !(Cpu.io.Q & beeper < 50)
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

object Top_ICE40_Verilog extends App {
  Config.spinal.generateVerilog(new Top_ICE40(true, "./data/test_1861.bin", "./data/vip.rom"))
}