import cocotb
from cocotb.triggers import RisingEdge, FallingEdge
from cocotb.clock import Clock
from cocotbext.axi import AxiLiteBus, AxiLiteMaster
from pprint import pprint


@cocotb.test()
async def test_axi_reg(dut):
	# DUT ports
	clk = dut.clk
	rst = dut.rst

	# AXI Lite Bus
	bus = AxiLiteBus.from_prefix(dut, "S_AXI")
	master = AxiLiteMaster(bus, clk, rst, False)

	# Clock Generation
	cocotb.start_soon(Clock(clk, period=10, units="ns").start())

	# Reseting the DUT
	rst.value = 0
	for _ in range(5):
		await FallingEdge(clk)
	rst.value = 1
	await FallingEdge(clk)

	# Testing the DUT
	nb_reg = 8
	test_data = 123

	for i in range(nb_reg):
		addr = 4*i
		if addr == 0 :
			await master.write_dword(addr, test_data)
			assert dut.CTRL_REG_OUT.value == test_data, "ctrl_reg_out port value not OK"
		elif addr == 4 :
			dut.CTRL_REG_IN.value = test_data
			assert await master.read_dword(addr) == test_data, "ctrl_reg_in axi reading value not OK"
		else :
			await master.write_dword(addr, test_data)
			assert await master.read_dword(addr) == test_data, "register axi reading value not OK"
			#TODO : see how to acces array port (maybe not possible with cocotb/ghdl)
			#assert dut.REG_ARRAY_PORT[i].value == test_data, "output reg port value not OK"
		test_data += 1

