# Set project properties
set_property part xczu3eg-sbva484-1-i [current_project]
set_property board_part avnet.com:ultra96v2:part0:1.2 [current_project]
set_property default_lib work [current_project]
set_property target_language VHDL [current_project]


# Importing target specific source files
add_files {	ultra96/src/bd_ultra96_wrapper.vhd }

	
# Setting top module	
set_property top bd_ultra96_wrapper [current_fileset]


# Creating block design form BD TCL script
source ultra96/scripts/create_bd.tcl