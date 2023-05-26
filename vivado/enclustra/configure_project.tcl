# Set project properties
set_property part xczu6eg-ffvc900-1-i [current_project]
set_property default_lib work [current_project]
set_property target_language VHDL [current_project]


# Importing target specific source files
add_files {	enclustra/src/bd_enclustra_wrapper.vhd }

	
# Setting top module	
set_property top bd_enclustra_wrapper [current_fileset]


# Creating block design form BD TCL script
source enclustra/scripts/create_bd.tcl