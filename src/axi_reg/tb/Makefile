# Makefile

# Simulator
SIM = ghdl

# Language
TOPLEVEL_LANG = vhdl
VHDL_GPI_INTERFACE = vpi

# Simulator parameters
SIM_ARGS := --ieee-asserts=disable-at-0 --wave=waveform.ghw
EXTRA_ARGS := --ieee=synopsys -fexplicit --std=08 -frelaxed

# Source files
VHDL_SOURCES += $(PWD)/../rtl/axi_reg.vhd
VHDL_SOURCES += $(PWD)/../rtl/axi_reg_ip.vhd
VHDL_SOURCES += $(PWD)/../../common/locod_package.vhd

# TOPLEVEL is the name of the toplevel module in your Verilog or VHDL file
TOPLEVEL = axi_reg_ip

# MODULE is the basename of the Python test file
MODULE = test_axi_reg

# include cocotb's make rules to take care of the simulator setup
include $(shell cocotb-config --makefiles)/Makefile.sim
