#                     __            ___             _ 
#                    / /    ___    / __\  ___    __| |
#                   / /    / _ \  / /    / _ \  / _` |
#                  / /___ | (_) |/ /___ | (_) || (_| |
#                  \____/  \___/ \____/  \___/  \__,_|
#
#            ***********************************************
#                             LoCod Project
#                 URL: https://github.com/viveris/LoCod
#            ***********************************************
#                 Copyright © 2024 Viveris Technologies
#
#                  Developed in partnership with CNES
#              (DTN/TVO/ET: On-Board Data Handling Office)
#
#  This file is part of the LoCod framework.
#
#  The LoCod framework is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 3 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

import random
import cocotb
from cocotb.triggers import RisingEdge, FallingEdge
from cocotb.clock import Clock
from cocotbext.axi import AxiBus, AxiMaster, AxiLiteBus, AxiLiteRam

@cocotb.test()
async def test_axi_axil_adapter(dut):
    # DUT ports
    clk = dut.clk
    rst = dut.rst

    # AXI Bus
    axi_bus = AxiBus.from_prefix(dut, "s_axi")
    axi_master = AxiMaster(axi_bus, clk, rst)
    lite_bus = AxiLiteBus.from_prefix(dut, "m_axil")
    axil_ram = AxiLiteRam(lite_bus, clk, rst, size=2**16)

    # Clock Generation
    cocotb.start_soon(Clock(clk, period=10, units="ns").start())

    # Reseting the DUT
    rst.value = 1
    for _ in range(5):
        await FallingEdge(clk)
    rst.value = 0
    await FallingEdge(clk)

    # Testing the DUT
    test_data = 123

    addr = 268435456   #0x10000000
    await axi_master.write_dword(addr, test_data)

    addr = 268435460   #0x10000004
    await axi_master.write_dword(addr, test_data)

    addr = 268435464   #0x10000008
    await axi_master.write_dword(addr, test_data)

    addr = 268435468   #0x1000000C
    await axi_master.write_dword(addr, test_data)

    addr = 268435472   #0x10000010
    await axi_master.write_dword(addr, test_data)