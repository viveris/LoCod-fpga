#                     __            ___             _ 
#                    / /    ___    / __\  ___    __| |
#                   / /    / _ \  / /    / _ \  / _` |
#                  / /___ | (_) |/ /___ | (_) || (_| |
#                  \____/  \___/ \____/  \___/  \__,_|
#
#            ***********************************************
#                             LoCod Project
#                 URL: https://github.com/viveris/LoCod
#            ***********************************************
#                 Copyright © 2024 Viveris Technologies
#
#                  Developed in partnership with CNES
#              (DTN/TVO/ET: On-Board Data Handling Office)
#
#  This file is part of the LoCod framework.
#
#  The LoCod framework is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 3 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

# Xilinx available targets for LoCod FPGA design :
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
			../src/axi_interconnect/rtl/axi_channel_buffer.vhd \
			../src/axi_interconnect/rtl/axi_interconnect.vhd \
			../src/axi_interconnect/rtl/axi_master_interface.vhd \
			../src/axi_interconnect/rtl/axi_slave_interface.vhd \
			../src/axi_axil_adapter/rtl/axi_axil_adapter.v \
			../src/axi_axil_adapter/rtl/axi_axil_adapter_rd.v \
			../src/axi_axil_adapter/rtl/axi_axil_adapter_wr.v \
			../src/axil_adapter/rtl/axil_adapter.v \
			../src/axil_adapter/rtl/axil_adapter_rd.v \
			../src/axil_adapter/rtl/axil_adapter_wr.v \
			../src/axil_axi_adapter/rtl/axil_axi_adapter.vhd \
			../src/common/locod_package.vhd}	


# Importing generated files
add_files ../src/generated_files


# Target specific operations
switch $target {
	ultra96 {
		source ultra96/configure_project_ultra96.tcl
	}
	enclustra {
		source enclustra/configure_project_enclustra.tcl
	} 
	default {
		puts "$target not available"
		break
	}
}


# Launch Synthesis
launch_runs -jobs 16 synth_1
wait_on_run synth_1


# Launch Implementation
launch_runs -jobs 16 impl_1
wait_on_run impl_1


# Writing bitstream
open_run impl_1
write_bitstream -force fpga.bit


# End
exit 0