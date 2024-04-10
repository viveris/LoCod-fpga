# LoCod FPGA design

This repository contains the FPGA design of the LoCod project. This design provides instantiation of several FPGA accelerators and all the external logic to control these accelerators through an AXI4 Full interface.

The design described by the source files in the src folder is generic and can addapt to all the platforms. However, this repository contains also scripts and specific source files to implement the design on Xilinx or Nanoxplore platforms. The platform specific files are present in the corresponding directory (xilinx, nanoxplore, etc...). The way to generate a bitstream for each platform is described with a README in these directories.

Allong with the source files are also present test-bench files to test each component of the design separately. The simulator used for the tests is GHDL for VHDL files or Verilator for Verilog files, allong with CocoTB to generate and execute test-benches easily.

<br>

## Repository organization
- `src/` : contains source code that describe the LoCod FPGA design. The top design architecture is described in the file [architecture.md](doc/architecture.md). Each component of the design have also a `tb/` directory to run a test, and a `doc/` directory that describe the component
- `doc/` : contains documentation files of the global LoCod FPGA design
- `xilinx/` : contains specific files and scripts to generate a Vivado project to implement the design on a Xilinx target. A [README.md](xilinx/README.md) in this directory present the steps to generate the bitstream
- `nanoxplore/` : contains specific files and scripts to generate a NanoXplore project to implement the design on a NanoXplore target. A [README.md](nanoxplore/README.md) in this directory present the steps to generate the bitstream

<br>

## Requierments

Differents softwares are needed depending on the things to do :
- to run the different unit tests : **GHDL**, **Verilator**, **CocoTB** and **GTKWave** for visualization
- to generate bitstream for Xilinx targets : **Vivado 2022.1**
- to generate bitstream for NanoXplore targets : all the **NanoXplore software suite**