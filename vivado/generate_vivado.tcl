# Set the default project name
set proj_name "locod-vivado"

#Creating Vivado project
create_project ${proj_name} ./${proj_name} -part xczu3eg-sbva484-1-i

# Set project properties
set_property board_part avnet.com:ultra96v2:part0:1.2 [current_project]
set_property default_lib work [current_project]
set_property target_language VHDL [current_project]

# Importing source files
add_files {	vivado_src/design_1_wrapper.vhd \
			../src/generated_files/acc_0.vhd \
			../src/generated_files/acc_1.vhd \
			../src/generated_files/acc_2.vhd \
			../src/generated_files/acc_3.vhd \
			../src/generated_files/acc_4.vhd \
			../src/generated_files/acc_5.vhd \
			../src/generated_files/acc_6.vhd \
			../src/generated_files/acc_7.vhd \
			../src/accelerator/rtl/accelerator.vhd \
			../src/axi_reg/rtl/axi_reg.vhd \
			../src/start_stop_ctrl/rtl/start_stop_ctrl.vhd \
			../src/master_memory_ctrl/rtl/master_memory_ctrl.v \
			../src/top_design/rtl/top.vhd \
			../src/top_design/rtl/top_ip.vhd \
			../src/common/memory_ctrl_d21.vhd \
			../src/common/axi_master_if.vhd \
			../src/common/axi_slave_if.vhd \
			../src/common/locod_package.vhd }
	
# Setting top module	
set_property top design_1_wrapper [current_fileset]

# Creating block design form BD TCL script
source design_1.tcl