# Makefile

# Simulator
SIM = verilator

# Language
TOPLEVEL_LANG = verilog

# Simulator parameters
#SIM_ARGS := --ieee-asserts=disable-at-0 --wave=waveform.ghw
EXTRA_ARGS := -Wno-SELRANGE -Wno-WIDTHTRUNC --trace --trace-structs

# Source files
VERILOG_SOURCES += $(PWD)/../rtl/axi_interconnect_ip.v
VERILOG_SOURCES += $(PWD)/../rtl/axil_interconnect.v
VERILOG_SOURCES += $(PWD)/../rtl/arbiter.v
VERILOG_SOURCES += $(PWD)/../rtl/priority_encoder.v


# TOPLEVEL is the name of the toplevel module in your Verilog or VHDL file
TOPLEVEL = axi_interconnect_ip

# MODULE is the basename of the Python test file
MODULE = test_axi_interconnect

# include cocotb's make rules to take care of the simulator setup
include $(shell cocotb-config --makefiles)/Makefile.sim
