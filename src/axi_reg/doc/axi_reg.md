# axi_reg : AXI Registers block

## Description

<img src="axi_reg.drawio.svg" width="300" align="right"/>

This IP provides registers accessible through an AXI4 Lite interface.

These registers are designed to be interfaced with the differents accelerator blocs of the Locod design to control them : start, reset, input address and output address.

A tri-state input with a size equal to the number of registers allows to select the direction of the registers. Each register is the same size than the AXI data bus. The addresses are coded over integers. Therefore, the first register is at the address 0, the second at the address 4, etc...

<br>

## Files

This IP regroup the followings files :
- [axi_reg.vhd](../rtl/axi_reg.vhd) : axi_reg component
- [axi_reg_ip.vhd](../rtl/axi_reg_ip.vhd) : wrapper of axi_reg component to make it work with CocoTB for testing. This wrapper just split the AXI bus and the registers array

<br>

## Requierments

The Locod package ([locod_package.vhd](../../common/locod_package.vhd)) is needed to compile the AXI Reg component (to get the AXI bus types and constants).

<br>

## Ports and parameters

| Generic name | Type | Default | Description |
|---|---|---|---|
| NB_REGISTERS | integer | none | The number of registers that we want |


| Port name | I/O | Type | Description |
|---|---|---|---|
| clk | I | std_logic | Clock signal, must be connected to AXI clock |
| rst | I | std_logic | Reset signal, must be connected to AXI reset |
| S_AXI_in | I | AXI4Lite_m_to_s | Master to slave signals of AXI4 Lite bus |
| S_AXI_out | O | AXI4Lite_s_to_m | Slave to master signals of AXI4 Lite bus |
| TRI_STATE | I | std_logic_vector | Tri-state value, each bit specifying the direction of the corresponding register : 0 for output or 1 for input |
| REG_ARRAY_PORT | I/O | reg_array | Array of NB_REGISTERS registers, direction depending on the TRI_STATE port value |

<br>

## Registers address map

Here are the addresses to acces registers of axi_reg component :

| Register | Address | Acces |
|---|---|---|
| REG_ARRAY_PORT[0] | 0 | R/W if output, R if input |
| ... | ... | ... |
| REG_ARRAY_PORT[NB_REGISTERS-1] | 4 * (NB_REGISTERS - 1) | R/W if output, R if input |