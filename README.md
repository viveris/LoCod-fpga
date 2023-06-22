# LoCoD FPGA design

This repository contains the FPGA design of the LoCoD project. This design provides instantiation of several FPGA accelerators and all the external logic to control these accelerators through an AXI interface.

The design described by the source files in the src folder is generic and can addapt to all the platforms. However, this repository contains also scripts and specific source files to implement the design on Xilinx Ultrascale or Nanoxplore NG-Ultra platforms. The platform specific files are present in the corresponding directory (vivado, nanoxplore, etc...). The way to generate a bitstream for each platfor is described with a README in these directories.

Allong with the source files are also present test-bench files to test each component of the design separately. The simulator used for the tests is GHDL allong with CocoTB to generate test-benches.

<br>

## Repository organization
- `src/` : contains source code that describe the LoCod FPGA design. The top design architecture is described in the file [architecture.md](doc/architecture.md). Each component of the design have also a `tb/` directory to run a test, and a `doc/` directory that describe the component
- `doc/` : contains documentation files of the global LoCoD FPGA design
- `vivado/` : contains specific files and scripts to generate a Vivado project to implement the design on an Ultra96 V2 evaluation board. A [README.md](vivado/README.md) in this directory present the steps to generate the bitstream
- `nanoxplore/` : contains specific files and scripts to generate a NanoXplore project to implement the design on an NG-Ultra board. A [README.md](nanoxplore/README.md) in this directory present the steps to generate the bitstream

<br>

## Requierments

Differents softwares are needed depending on the things to do :
- to run the different unit tests : **GHDL**, **CocoTB** and **GTKWave** for visualization
- to generate bitstream for Ultra96 v2 : **Vivado 2020.1**
- to generate bitstream for NanoXplore NG-Ultra : all the **NanoXplore software suite**