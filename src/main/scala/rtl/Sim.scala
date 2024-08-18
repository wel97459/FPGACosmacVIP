//Generate the MyTopLevel's Verilog using the above custom configuration.
package Cosmac

import spinal.core._
import spinal.lib._
import spinal.core.sim._

import Spinal1802._
import Spinal1861._

object CommacSpinalConfig extends SpinalConfig(
    targetDirectory = "./gen",
    oneFilePerComponent = false,
    defaultConfigForClockDomains = ClockDomainConfig(resetKind = SYNC)
)

object VIPGen {
    def main(args: Array[String]) {

        CommacSpinalConfig.generateVerilog({
            val dut = new VIP(0);
            dut.Cpu.OP.simPublic();
            dut.Cpu.D.simPublic();
            dut.Cpu.R(0).simPublic();
            dut.Cpu.R(1).simPublic();
            dut.Cpu.R(2).simPublic();
            dut.Cpu.R(3).simPublic();
            dut.Cpu.R(4).simPublic();
            dut.Cpu.R(5).simPublic();
            dut.Cpu.R(6).simPublic();
            dut.Cpu.R(7).simPublic();
            dut.Cpu.R(8).simPublic();
            dut.Cpu.R(9).simPublic();
            dut.Cpu.R(10).simPublic();
            dut.Cpu.R(11).simPublic();
            dut.Cpu.R(12).simPublic();
            dut.Cpu.R(13).simPublic();
            dut.Cpu.R(14).simPublic();
            dut.Cpu.R(15).simPublic();
            dut
        }).printPruned
    }
}

object VIPSim {
    def main(args: Array[String]) {
        SimConfig.withWave.compile{
            val dut = new VIP(0)
            dut.Cpu.OP.simPublic();
            dut.Cpu.io.Addr16.simPublic();
            dut.Cpu.io.MWR.simPublic();
            dut.Cpu.io.MRD.simPublic();
            dut.Cpu.P.simPublic()
            dut.Cpu.D.simPublic()
            dut.Cpu.R(0).simPublic()
            dut.Cpu.R(1).simPublic()
            dut.Cpu.R(2).simPublic()
            dut.Cpu.R(3).simPublic()
            dut.Cpu.R(4).simPublic()
            dut.Cpu.R(5).simPublic()
            dut.Cpu.R(6).simPublic()
            dut.Cpu.R(7).simPublic()
            dut.Cpu.R(8).simPublic()
            dut.Cpu.R(9).simPublic()
            dut.Cpu.R(10).simPublic()
            dut.Cpu.R(11).simPublic()
            dut.Cpu.R(12).simPublic()
            dut.Cpu.R(13).simPublic()
            dut.Cpu.R(14).simPublic()
            dut.Cpu.R(15).simPublic()
            dut
        }
    }
}