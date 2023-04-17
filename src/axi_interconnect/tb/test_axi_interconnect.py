import cocotb
from cocotb.triggers import RisingEdge, FallingEdge
from cocotb.clock import Clock
from cocotbext.axi import AxiLiteBus, AxiLiteMaster, AxiLiteRam


# Test routine
@cocotb.test()
async def test_axi_interconnect(dut):
	# DUT ports
	clk = dut.clk
	rst = dut.rst

	# AXI Lite Bus
	master0 = AxiLiteMaster(AxiLiteBus.from_prefix(dut, "S00_AXI"), clk, rst)
	ram0 = AxiLiteRam(AxiLiteBus.from_prefix(dut, "M_AXI"), clk, rst, size=2**32)

	# Clock Generation
	cocotb.start_soon(Clock(clk, period=10, units="ns").start())

	# Reseting the DUT
	rst.value = 1
	for i in range(5):
		await FallingEdge(clk)
	rst.value = 0
	await FallingEdge(clk)

	# Testing the DUT
	await master0.write(0x2, b'test')
	#await master1.write_dword(4, 456)