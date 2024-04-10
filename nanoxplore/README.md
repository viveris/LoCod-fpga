# LoCod bitstream generation for NanoXplore targets

This file will present the steps to generate a bitstream for a NanoXplore board using NxPython. For the moment, only the NG-Ultra target is available.

<br>

## Requierments

- **NX Design Suite 23.5.1.2** installed with a working NX license

<br>

## Generation of the NanoXplore project

The NanoXplore project is generated with a NxPython script. This script will automatically delete the project at the end to start again on a clean project.

To generate the NX project, first run in this directory the nxpython script [**generate_nx_project.py**](generate_nx_project.py) and specify the target as argument with the command:

```console
nxpython generate_nx_project.py ${TARGET}
```

The targets currently available are: `ngultra`

The script uses specific source files and other NxPython scripts, present in the directory `${TARGET}/src`, to connect the top IP of the LoCod FPGA design to the NanoXplore SoC (these files are NanoXplore IPs, for example AXI interconnects, SoC wrapper, etc...).