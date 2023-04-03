# Xilinx available targets for Locod FPGA design :
# ultra96
# enclustra

set target [lindex $argv 0]

if {![info exists target]} {
	puts "target varible not defined"
	exit 1
}

# Set the default project name
set proj_name locod-vivado_${target}


#Creating Vivado project
create_project -force ${proj_name} ./${proj_name}


# Importing common source files
add_files { ../src/axi_reg/rtl/axi_reg.vhd \
			../src/start_stop_ctrl/rtl/start_stop_ctrl.vhd \
			../src/master_memory_ctrl/rtl/master_memory_ctrl.v \
			../src/axi_interconnect_colin/rtl/axi_channel_buffer.vhd \
			../src/axi_interconnect_colin/rtl/axi_interconnect.vhd \
			../src/axi_interconnect_colin/rtl/axi_master_interface.vhd \
			../src/axi_interconnect_colin/rtl/axi_slave_interface.vhd \
			../src/common/memory_ctrl_d21.vhd \
			../src/common/axi_master_if.vhd \
			../src/common/axi_slave_if.vhd \
			../src/common/locod_package.vhd }		


# Importing generated files
add_files ../src/generated_files


# Target specific operations
switch $target {
	ultra96 {
		source ultra96/configure_project.tcl
	}
	enclustra {
		source enclustra/configure_project.tcl
	} 
	default {
		puts "$target not available"
		break
	}
}


# Launch Synthesis
launch_runs synth_1
wait_on_run synth_1


# Launch Implementation
launch_runs impl_1
wait_on_run impl_1


# Writing bitstream
open_run impl_1
write_bitstream fpga.bit


# End
exit 0
