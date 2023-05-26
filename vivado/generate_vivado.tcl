# Xilinx available targets for Locod FPGA design :
# ultra96
# enclustra

# Number of accelerators possible : [1-8]

if {![info exists target]} {
	puts "target varible not defined"
}
if {![info exists nb_accel]} {
	puts "nb_accel variable not defined"
}


# Set the default project name
set proj_name locod-vivado_${target}


#Creating Vivado project
create_project ${proj_name} ./${proj_name}


# Importing common source files
add_files { ../src/accelerator/rtl/accelerator.vhd \
			../src/axi_reg/rtl/axi_reg.vhd \
			../src/start_stop_ctrl/rtl/start_stop_ctrl.vhd \
			../src/master_memory_ctrl/rtl/master_memory_ctrl.v \
			../src/top_design/rtl/top.vhd \
			../src/top_design/rtl/top_ip.vhd \
			../src/common/memory_ctrl_d21.vhd \
			../src/common/axi_master_if.vhd \
			../src/common/axi_slave_if.vhd \
			../src/common/locod_package.vhd }		


# Importing accelerators source files
# TODO: replace 8 by $nb_accel and find a solution to addapt accelerator.vhd depending on that
for {set i 0} {$i < 8} {incr i} {
	add_files ../src/generated_files/acc_${i}.vhd
}


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