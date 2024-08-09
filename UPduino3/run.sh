#!/bin/bash
set -x
rm -fy Top_ICE* 
rm -fy hardware* 
cp ../gen/Top_ICE* .
yosys -p "synth_ice40 -top Top_ICE40 -json hardware.json" -q Top_ICE40.v
nextpnr-ice40 --up5k --package sg48 --opt-timing --pcf-allow-unconstrained --json hardware.json --asc hardware.asc --pcf upduino.pcf
icepack hardware.asc hardware.bin
iceprog -d i:0x0403:0x6014:0 hardware.bin
