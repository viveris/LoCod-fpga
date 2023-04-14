import cocotb
from cocotb.triggers import RisingEdge, FallingEdge
from cocotb.clock import Clock
from cocotbext.axi import AxiLiteBus, AxiLiteMaster, AxiLiteSlave


# Test routine
@cocotb.test()
async def test_axi_crossbar(dut):
	# DUT ports
	clk = dut.clk
	rst = dut.rst

	# AXI Lite Bus
	master0 = AxiLiteMaster(AxiLiteBus.from_prefix(dut, "S00_AXI"), clk, rst, False)
	#master1 = AxiLiteMaster(AxiLiteBus.from_prefix(dut, "S01_AXI"), clk, rst, False)
	#slave0 = AxiLiteSlave(AxiLiteBus.from_prefix(dut, "M_AXI"), clk, rst, False)

	# Clock Generation
	cocotb.start_soon(Clock(clk, period=10, units="ns").start())

	# Reseting the DUT
	rst.value = 0
	for i in range(5):
		await FallingEdge(clk)
	rst.value = 1
	await FallingEdge(clk)

	# Testing the DUT
	await master0.write(0x2, b'test')
	#await master1.write_dword(4, 456)