# LoCod bitstream generation for Xilinx targets

This file will present the steps to generate a bitstream for a Xilinx target using Vivado 2022.1. For the moment, targets availables are the Ultra96 board and Enclustra Mercury+ XU7-6EG.

<br>

## Requierments

- Vivado 2022.1 installed
- A working Vivado 2022.1 ML Entreprise licence if the target is the Enclustra board

<br>

## Generation of the Vivado project

To generate the Vivado project, first run in this directory the script [**generate_vivado_project.tcl**](generate_vivado_project.tcl) and specify the target as argument with the command:

```console
vivado -mode tcl -nojournal -nolog -source generate_vivado_project.tcl -tclargs ${TARGET}
```

The targets currently available are: `ultra96`, `enclustra`

This script will create a Vivado 2022.1 project named **locod-vivado_${TARGET}**, with all the LoCod FPGA design ready to generate the bitstream.

The script uses specific source files and other TCL scripts, present in the directory `${TARGET}/src`, to connect the top IP of the LoCod FPGA design to the Xilinx SoC (these files are Xilinx IPs, for example AXI interconnects, SoC Processing system, etc...).