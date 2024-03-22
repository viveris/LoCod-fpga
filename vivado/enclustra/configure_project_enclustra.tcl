# Set project properties
set_property part xczu6eg-ffvc900-1-i [current_project]
set_property default_lib work [current_project]
set_property target_language VHDL [current_project]


# Importing target specific source files
add_files {	enclustra/src/top_enclustra.vhd }

	
# Setting top module	
set_property top top_enclustra [current_fileset]


# Creating block design form BD TCL script
source enclustra/scripts/create_bd_soc_wrapper_enclustra.tcl