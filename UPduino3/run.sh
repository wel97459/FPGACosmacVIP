#!/bin/bash
set -x
rm -fy Top* 
cp ../gen/Top_ice* ./
yosys -p "synth_ice40 -top Top_ice40 -json hardware.json" -q Top_ice40.v
nextpnr-ice40 --up5k --package sg48 --opt-timing --json hardware.json --asc hardware.asc --pcf upduino.pcf
icepack hardware.asc hardware.bin
iceprog -d i:0x0403:0x6014:0 hardware.bin