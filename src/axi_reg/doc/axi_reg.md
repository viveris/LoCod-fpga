# axi_reg : AXI Registers block

## Description

<img src="axi_reg.drawio.svg" width="300" align="right"/>

This IP provides registers accessible through an AXI4 Lite interface.

These registers are designed to be interfaced with the differents accelerator blocs of the LoCod design to control them : start, reset, input address and output address.

There is a table of output registers and a table of input registers, the number of each can be changed using generic parameters to suit the design. Each register is the same size than the AXIL data bus. The addresses are coded over integers. Therefore, the first register is at the address 0, the second at the address 4, etc...

<br>

## Files

This IP regroup the followings files :
- [axi_reg.vhd](../rtl/axi_reg.vhd) : axi_reg component
- [axi_reg_ip.vhd](../rtl/axi_reg_ip.vhd) : wrapper of axi_reg component to make it work with CocoTB for testing. This wrapper just split the register arrays

<br>

## Requierments

The LoCod package ([locod_package_xilinx.vhd](../../common/locod_package.vhd)) is needed to compile the AXI Reg component (to get the register arrays types and AXIL constants).

<br>

## Ports and parameters

| Generic name | Type | Default | Description |
|---|---|---|---|
| NB_REGISTERS_OUT | integer | 1 | The number of output registers, must be >= 1 |
| NB_REGISTERS_IN | integer | 1 | The number of input registers, must be >= 1 |
| BASE_ADDRESS | std_logic_vector | 0 | The base adress to acces registers through AXIL interface |


| Port name | I/O | Type | Description |
|---|---|---|---|
| clk_i | I | std_logic | Clock signal |
| rstn_i | I | std_logic | Reset signal, active low |
| S_AXIL_... | I/O | std_logic/vectors | AXI4 Lite interface signals |
| REG_ARRAY_PORT_o | O | reg_array | Array of NB_REGISTERS_OUT output registers |
| REG_ARRAY_PORT_i | I | reg_array | Array of NB_REGISTERS_IN input registers |

<br>

## Registers address map

Here are the addresses to acces registers of axi_reg component :

| Register | Address | Acces |
|---|---|---|
| REG_ARRAY_PORT_o[0] | BASE_ADDRESS | R/W |
| ... | ... | ... |
| REG_ARRAY_PORT_o[NB_REGISTERS_OUT-1] | BASE_ADDRESS + 4 * (NB_REGISTERS_OUT - 1) | R/W |
| REG_ARRAY_PORT_i[0] | BASE_ADDRESS + 4 * NB_REGISTERS_OUT | R |
| ... | ... | ... |
| REG_ARRAY_PORT_i[NB_REGISTERS_IN-1] | BASE_ADDRESS + 4 * (NB_REGISTERS_OUT + NB_REGISTERS_IN - 1) | R |