//Generate the MyTopLevel's Verilog using the above custom configuration.
package mylib

import spinal.core._
import spinal.lib._
import spinal.lib.blackbox.lattice.ice40._

import Spinal1802._
import MyHardware._
import TFT_Driver._
import MyHardware._

object ComxGen {
    def main(args: Array[String]) {

        ComxSpinalConfig.generateVerilog({
            val dut = new Top();
            dut.clockedArea.CPU.OP.simPublic();
            dut.clockedArea.CPU.D.simPublic()
            dut.clockedArea.CPU.R(0).simPublic()
            dut.clockedArea.CPU.R(1).simPublic()
            dut.clockedArea.CPU.R(2).simPublic()
            dut.clockedArea.CPU.R(3).simPublic()
            dut.clockedArea.CPU.R(4).simPublic()
            dut.clockedArea.CPU.R(5).simPublic()
            dut.clockedArea.CPU.R(6).simPublic()
            dut.clockedArea.CPU.R(7).simPublic()
            dut.clockedArea.CPU.R(8).simPublic()
            dut.clockedArea.CPU.R(9).simPublic()
            dut.clockedArea.CPU.R(10).simPublic()
            dut.clockedArea.CPU.R(11).simPublic()
            dut.clockedArea.CPU.R(12).simPublic()
            dut.clockedArea.CPU.R(13).simPublic()
            dut.clockedArea.CPU.R(14).simPublic()
            dut.clockedArea.CPU.R(15).simPublic()
            dut
        }).printPruned
    }
}