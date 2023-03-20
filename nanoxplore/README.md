# LoCoD bitstream generation for the NanoXplore NG-Ultra

This file will present the steps to generate a bitstream for the NanoXplore NG-Ultra board using NxPython.

<br>

## Requierments

- **NX Design Suite 22.3.0.2** installed with a working NX license

<br>

## Generation of the NanoXplore project

The NanoXplore project is generated with a NxPython script. This script will automatically delete the project at the end to start again on a clean project.

To generate the NX project, first run the nxpython script [**create_project.py**](create_project.py) with the command

```console
nxpython create_project.py
```

launched in this directory.

The script uses specific source files, present in the directory `nanoxplore_src/`, to connect the top IP of the LoCoD FPGA design to the NG-Ultra SoC (these files are NanoXplore IPs, for example AXI interconnects, SoC wrapper, etc...).