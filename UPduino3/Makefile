TARGET=Top_ICE40
OBJS+=../src/main/scala/rtl/$(TARGET).scala
OBJS+=../src/main/scala/rtl/Config.scala
HW_FILES=../gen/$(TARGET)* # TODO: add support to vhdl somehow
TOP_FILE=../gen/$(TARGET).v
PIN_BINDING_FILE=upduino.pcf

all: prog

# generate hardware code from spinal code
$(TOP_FILE): $(OBJS)
	cd .. && sbt "runMain Cosmac.$(TARGET)_Verilog"

# synthetize rtl (generates a json file)
$(TARGET).json: $(HW_FILES)
	yosys -p "synth_ice40 -top $(TARGET) -json $@" -q $(TOP_FILE)

# transform synthetized rtl + pin mapping into fpga config file
$(TARGET)_out.config: $(TARGET).json $(PIN_BINDING_FILE)
	nextpnr-ice40 --up5k --package sg48 --opt-timing  --timing-allow-fail --pcf-allow-unconstrained --json $< --asc $@ --pcf $(PIN_BINDING_FILE)

# generate bitstream from config file
$(TARGET).bit: $(TARGET)_out.config
	icepack $< $@

# upload bitstream to fpga
prog: $(TARGET).bit
	iceprog -d i:0x0403:0x6014:0 $(TARGET).bit

clean:
	rm -f *.svf *.bit *.config *.json *.ys -r target gen project .bsp
