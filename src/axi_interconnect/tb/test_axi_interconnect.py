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

import cocotb
from cocotb.triggers import RisingEdge, FallingEdge
from cocotb.clock import Clock
from cocotbext.axi import AxiLiteBus, AxiLiteMaster, AxiLiteRam


# Test routine
@cocotb.test()
async def test_axi_interconnect(dut):
	# DUT ports
	clk = dut.i_clk
	rst = dut.i_rst
	rst_n = dut.i_rst_n

	# AXI Lite Bus
	master0 = AxiLiteMaster(AxiLiteBus.from_prefix(dut, "S00_AXI"), clk, rst_n, False)
	master1 = AxiLiteMaster(AxiLiteBus.from_prefix(dut, "S01_AXI"), clk, rst_n, False)
	ram0 = AxiLiteRam(AxiLiteBus.from_prefix(dut, "M_AXI"), clk, rst, size=2**32)

	# Clock Generation
	cocotb.start_soon(Clock(clk, period=10, units="ns").start())

	# Reseting the DUT
	rst.value = 1
	rst_n.value = 0
	for i in range(5):
		await FallingEdge(clk)
	rst.value = 0
	rst_n.value = 1
	await FallingEdge(clk)

	# Testing the DUT

	# Writing data throught AXI interconnect with simultaneous writes
	write_op_0 = master0.init_write(0x0, b'1111')
	write_op_1 = master1.init_write(0x4, b'2222')
	await write_op_0.wait()
	write_op_0 = master0.init_write(0x8, b'3333')
	await write_op_1.wait()
	write_op_1 = master1.init_write(0xC, b'4444')
	await write_op_1.wait()
	await write_op_0.wait()

	# Reading data throught AXI interconnect with simultaneous reads
	read_op_1 = master1.init_read(0x4, 4)
	read_op_0 = master1.init_read(0xC, 4)
	await read_op_1.wait()
	assert read_op_1.data.data == b'2222'
	read_op_1 = master1.init_read(0x8, 4)
	await read_op_0.wait()
	assert read_op_0.data.data == b'4444'
	read_op_0 = master0.init_read(0x0, 4)
	await read_op_0.wait()
	assert read_op_0.data.data == b'1111'
	await read_op_1.wait()
	assert read_op_1.data.data == b'3333'
