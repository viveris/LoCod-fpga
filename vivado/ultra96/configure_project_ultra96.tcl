# Set project properties
set_property part xczu3eg-sbva484-1-i [current_project]
set_property default_lib work [current_project]
set_property target_language VHDL [current_project]


# Importing target specific source files
add_files {	ultra96/src/top_ultra96.vhd }

	
# Setting top module	
set_property top top_ultra96 [current_fileset]


# Creating block design form BD TCL script
source ultra96/scripts/create_bd_soc_wrapper_ultra96.tcl