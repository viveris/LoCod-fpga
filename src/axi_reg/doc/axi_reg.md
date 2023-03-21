# axi_reg : AXI Registers block

## Description

<img src="axi_reg.drawio.svg" width="300" align="right"/>

This IP provides registers accessible through an AXI4 Lite interface.

These registers are designed to be interfaced with the differents accelerator blocs of the Locod design. To control them (start, reset and watch end state), the first 2 registers are used : the first is the control out register and the second the control in register.

Each register is the same size than the AXI data bus. The addresses are coded over integers. Therefore, the first register is at the address 0, the second at the address 4, etc...

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
| NB_REGISTERS | integer | none | The number of registers that we want, in addition to the 2 control registers |


| Port name | I/O | Type | Description |
|---|---|---|---|
| clk | I | std_logic | Clock signal, must be connected to AXI clock |
| rst | I | std_logic | Reset signal, must be connected to AXI reset |
| S_AXI_in | I | AXI4Lite_m_to_s | Master to slave signals of AXI4 Lite bus |
| S_AXI_out | O | AXI4Lite_s_to_m | Slave to master signals of AXI4 Lite bus |
| CTRL_REG_OUT | O | std_logic_vector | Control register out, size of AXI data bus |
| CTRL_REG_IN | I | std_logic_vector | Control register in, size of AXI data bus |
| REG_ARRAY_PORT | O | reg_array | Array of NB_REGISTERS registers |

<br>

## Registers address map

Here are the addresses to acces registers of axi_reg component :

| Register | Address | Acces |
|---|---|---|
| CTRL_REG_OUT | 0 | R/W |
| CTRL_REG_IN | 4 | R |
| REG_ARRAY_PORT[0] | 8 | R/W |
| ... | ... | ... |
| REG_ARRAY_PORT[NB_REGISTERS-1] | 8 + 4 * (NB_REGISTERS - 1) | R/W |