package mylib

import spinal.core._
import spinal.lib._
import spinal.lib.blackbox.lattice.ice40._

import Spinal1802._
import Spinal1861._
import MyHardware._



//Hardware definition
class Top extends Component {
    val io = new Bundle {
        val reset_ = in Bool
        val clk_12Mhz = in Bool //12Mhz CLK

        val video = out Bool
        val sync = out Bool

        val led_red = out Bool
        val led_green = out Bool

        val keypad_col = in Bits(4 bits)
        val keypad_row = out Bits(4 bits)
    }
    noIoPrefix()
    

    val clk17Domain = ClockDomain.internal(name = "Core17",  frequency = FixedFrequency(17.625 MHz))
    val clk1Domain = ClockDomain.internal(name = "Core1",  frequency = FixedFrequency(1.7625 MHz))

    //PLL Settings 
    val PLL_CONFIG = SB_PLL40_PAD_CONFIG(
        DIVR = B"0000", DIVF = B"0101110", DIVQ = B"101", FILTER_RANGE = B"001",
        FEEDBACK_PATH = "SIMPLE", PLLOUT_SELECT = "GENCLK", 
        DELAY_ADJUSTMENT_MODE_FEEDBACK = "FIXED", DELAY_ADJUSTMENT_MODE_RELATIVE = "FIXED", //NO DELAY
        FDA_FEEDBACK = B"0000", FDA_RELATIVE = B"0000", SHIFTREG_DIV_MODE = B"0", ENABLE_ICEGATE = False //NOT USED
    ) 

    val PLL = new SB_PLL40_CORE(PLL_CONFIG);
    
    PLL.BYPASS := False
    PLL.RESETB := True
    PLL.REFERENCECLK := io.clk_12Mhz

    clk17Domain.clock := PLL.PLLOUTGLOBAL
    clk17Domain.reset := !io.reset_

    val Core17 = new ClockingArea(clk17Domain) {
        var div10 = CounterFreeRun(10) //Divide by 10

        var reset = Reg(Bool) init (False)
        var rstCounter = CounterFreeRun(100)
        when(rstCounter.willOverflow){
            reset := True
        }
    }
    //Buffer the clock signal from the divide by 10 counter
    var gclk = SB_GB(Core17.div10.willOverflow)
    clk1Domain.clock := gclk
    clk1Domain.reset := !Core17.reset

    val Core1 = new ClockingArea(clk1Domain) {
        var reset = Reg(Bool) init (False)
        var rstCounter = CounterFreeRun(10)
        when(rstCounter.willOverflow){
            reset := True
        }

        val Cpu = new CDP1802()
        Cpu.io.Wait_n := True
        Cpu.io.DMA_In_n := True

        val Pixie = new CDP1861()
        Pixie.io.DataIn := Cpu.io.DataOut
        Pixie.io.SC := Cpu.io.SC
        Pixie.io.TPA := Cpu.io.TPA
        Pixie.io.TPB := Cpu.io.TPB
        Pixie.io.Disp_On := (Cpu.io.N === 1 && Cpu.io.TPB && !Cpu.io.MWR)
        Pixie.io.Disp_Off := (Cpu.io.N === 1 && Cpu.io.TPB && !Cpu.io.MRD)
        Pixie.io.Reset_ := reset

        Cpu.io.Interrupt_n := Pixie.io.INT
        Cpu.io.DMA_Out_n := Pixie.io.DMAO
        Cpu.io.Clear_n := Pixie.io.Clear
        
        val remapper = Reg(Bool) init (False)
            when(!Pixie.io.Clear) {
                remapper := False
            } elsewhen (Cpu.io.N === 4) {
                remapper := True
            }

        val addressRemapped = Bits(13 bits)
            when(!remapper || Cpu.io.Addr16.asUInt >= 0x8000) {
                addressRemapped := 0x1e00 | Cpu.io.Addr16(8 downto 0).resize(13)
            } otherwise (addressRemapped := Cpu.io.Addr16(12 downto 0))

        val ram = new Ram("./data/test_1861.bin", log2Up(0x1fff))
            ram.io.ena := True
            ram.io.wea := (!(Cpu.io.MWR || (addressRemapped.asUInt >= 0x1e00))).asBits 
            ram.io.dina := Cpu.io.DataOut
            ram.io.addra := addressRemapped
            Cpu.io.DataIn := ram.io.douta

        val keypad = new Keypad()
            keypad.io.LatchKey := (Cpu.io.N === 2 && Cpu.io.TPB && !Cpu.io.MRD)
            keypad.io.Key := Cpu.io.DataOut(3 downto 0)
            io.keypad_row := ~keypad.io.KeypadRow
            keypad.io.KeypadCol := io.keypad_col

        Cpu.io.EF_n := Cat(B"1", keypad.io.KeyOut, B"1", Pixie.io.EFx)

        val beeper = CounterFreeRun(1000)
        io.sync := Pixie.io.CompSync_
        io.video := Pixie.io.Video

        io.led_red := !(Cpu.io.Q & beeper < 25)
        io.led_green := !(remapper & beeper < 25)
    }
}

//Generate the MyTopLevel's Verilog
object TopVerilog {
    def main(args: Array[String]) {
        SpinalVerilog(new Top)
    }
}

//Define a custom SpinalHDL configuration with synchronous reset instead of the default asynchronous one. This configuration can be resued everywhere
object TopSpinalConfig extends SpinalConfig(defaultConfigForClockDomains = ClockDomainConfig(resetKind = SYNC))

//Generate the MyTopLevel's Verilog using the above custom configuration.
object TopVerilogWithCustomConfig {
    def main(args: Array[String]) {
        TopSpinalConfig.generateVerilog(new Top)
    }
}