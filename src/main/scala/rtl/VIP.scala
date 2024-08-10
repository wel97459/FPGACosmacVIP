package mylib

import spinal.core._
import spinal.lib._
import spinal.lib.blackbox.lattice.ice40._

import Spinal1802._
import Spinal1861._
import MySpinalHardware._


//Hardware definition
class VIP() extends Component {
    val io = new Bundle {
        val reset = in Bool()
        val video = out Bool()
        val sync = out Bool()
        val q = out Bool()

        val rom = new Bundle {
            val addr = out Bits(9 bits)
            val data = in Bits(8 bits)
            val rd = out Bool()
        }

        val ram = new Bundle {
            val addr = out Bits(13 bits)
            val din = in Bits(8 bits)
            val dout = out Bits(8 bits)
            val rd = out Bool()
            val wr = out Bool()
        }

        val keypad = new Bundle {
            val col = in Bits(4 bits)
            val row = out Bits(4 bits)
        }

        val Pixie = new Bundle {
            val INT = out Bool()
            val DMAO = out Bool()
        }

        val CPU = new Bundle {
            val TPB = out Bool()
            val SC = out Bits(2 bit)
            val DataOut = out Bits(8 bits)
        }
    }        

    val Cpu = new Spinal1802()
        Cpu.io.Wait_n := True
        Cpu.io.DMA_In_n := True
        io.CPU.TPB := Cpu.io.TPB
        io.CPU.SC := Cpu.io.SC
        io.CPU.DataOut := Cpu.io.DataOut

    val Pixie = new Spinal1861(10)
        //Connection to Pixie
        Pixie.io.DataIn := Cpu.io.DataOut
        Pixie.io.SC := Cpu.io.SC
        Pixie.io.TPA := Cpu.io.TPA
        Pixie.io.TPB := Cpu.io.TPB
        Pixie.io.Disp_On := (Cpu.io.N === 1 && Cpu.io.TPB && !Cpu.io.MWR)
        Pixie.io.Disp_Off := (Cpu.io.N === 1 && Cpu.io.TPB && !Cpu.io.MRD)
        Pixie.io.Reset_ := io.reset

        io.Pixie.INT := Pixie.io.INT
        io.Pixie.DMAO := Pixie.io.DMAO
        
    //Connection to CPU from Pixie
    Cpu.io.Interrupt_n := Pixie.io.INT
    Cpu.io.DMA_Out_n := Pixie.io.DMAO
    Cpu.io.Clear_n := Pixie.io.Clear
    
    io.rom.addr := Cpu.io.Addr16(8 downto 0)
    
    io.ram.wr := !Cpu.io.MWR
    io.ram.dout := Cpu.io.DataOut
    io.ram.addr := Cpu.io.Addr16(12 downto 0)

    val romBootLatch = Reg(Bool) init (False)
        //When reset, clear the latch so system boots from ROM. 
        when(!Pixie.io.Clear) {
            romBootLatch := False
        //The ROM contains the monitor program which uses a 64h instruction to pulse the N2 line.
        } elsewhen (Cpu.io.N === 4) {
            romBootLatch := True
        }

        when(!romBootLatch || Cpu.io.Addr16.asUInt >= 0x8000 && Cpu.io.Addr16.asUInt <= 0x81ff) {
            Cpu.io.DataIn := io.rom.data
        }elsewhen(Cpu.io.Addr16.asUInt < 0x2000) {
            Cpu.io.DataIn := io.ram.dout
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

    io.q := !(Cpu.io.Q & beeper < 100)
}