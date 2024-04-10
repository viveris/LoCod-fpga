# Makefile

# Simulator
SIM = verilator

# Language
TOPLEVEL_LANG = verilog

# Source files
VERILOG_SOURCES += $(PWD)/../rtl/axi_axil_adapter.v
VERILOG_SOURCES += $(PWD)/../rtl/axi_axil_adapter_wr.v
VERILOG_SOURCES += $(PWD)/../rtl/axi_axil_adapter_rd.v

# TOPLEVEL is the name of the toplevel module in your Verilog or VHDL file
TOPLEVEL = axi_axil_adapter

# MODULE is the basename of the Python test file
MODULE = test_axi_axil_adapter

# module parameters
export PARAM_ADDR_WIDTH := 32
export PARAM_AXI_DATA_WIDTH := 128
export PARAM_AXI_STRB_WIDTH := $(shell expr $(PARAM_AXI_DATA_WIDTH) / 8 )
export PARAM_AXI_ID_WIDTH := 12
export PARAM_AXIL_DATA_WIDTH := 32
export PARAM_AXIL_STRB_WIDTH := $(shell expr $(PARAM_AXIL_DATA_WIDTH) / 8 )
export PARAM_CONVERT_BURST := 1
export PARAM_CONVERT_NARROW_BURST := 1

# Simulator parameters
COMPILE_ARGS += -Wno-SELRANGE -Wno-WIDTH -Wno-CASEINCOMPLETE -Wno-ZEROREPL
COMPILE_ARGS += $(foreach v,$(filter PARAM_%,$(.VARIABLES)),-G$(subst PARAM_,,$(v))=$($(v)))
EXTRA_ARGS += --trace --trace-structs

# include cocotb's make rules to take care of the simulator setup
include $(shell cocotb-config --makefiles)/Makefile.sim