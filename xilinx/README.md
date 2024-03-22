# LoCoD bitstream generation for the Ultra96 V2

This file will present the steps to generate a bitstream for the **Ultra96 V2 evaluation board** using Vivado 2020.1.

<br>

## Requierments

- Vivado 2020.1 installed

- Avenet board files installed (especially the ultra96v2) : https://github.com/Avnet/bdf<br>
Copy it in ~/.Xilinx/Vivado/2020.1/data/boards/borad_files

<br>

## Generation of the Vivado project

To generate the Vivado project, first run the script [**generate_vivado.tcl**](generate_vivado.tcl) in this directory.

This script will create a Vivado 2020.1 project named **locod-vivado**, with all the LoCoD FPGA design ready to generate the bitstream.

This project will have as target the Ultra96 V2 evaluation board.

Sources files are imported with soft link in the project. So, if you modify some of them in Vivado, the files are modified in the design folder.

The script also uses specific source files, present in the directory `vivado_src/`, to connect the top IP of the LoCoD FPGA design to the Zynq Ultrascale SoC (these files are Xilinx IPs, for example AXI interconnects, SoC wrapper, etc...).