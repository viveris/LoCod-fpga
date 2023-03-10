import cocotb
from cocotb.triggers import RisingEdge, FallingEdge
from cocotb.clock import Clock
from cocotbext.axi import AxiLiteBus, AxiLiteMaster
from pprint import pprint

# Retrieve generics parameters
if cocotb.simulator.is_running():
	NB_REGISTERS = int(cocotb.top.NB_REGISTERS)


# Test routine
@cocotb.test()
async def test_axi_reg(dut):
	# DUT ports
	clk = dut.clk
	rst = dut.rst
	ctrl_reg_out = dut.CTRL_REG_OUT
	ctrl_reg_in = dut.CTRL_REG_IN
	output_ports = [dut.REG0, dut.REG1, dut.REG2, dut.REG3, dut.REG4, dut.REG5, dut.REG6, dut.REG7, dut.REG8, dut.REG9, dut.REG10, dut.REG11, dut.REG12, dut.REG13, dut.REG14, dut.REG15]

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
	test_data = 123

	for i in range(NB_REGISTERS+2):
		addr = 4*i
		if addr == 0 :
			await master.write_dword(addr, test_data)
			assert await master.read_dword(addr) == test_data, "ctrl_reg_out axi reading value not OK"
			assert ctrl_reg_out.value == test_data, "ctrl_reg_out port value not OK"
		elif addr == 4 :
			ctrl_reg_in.value = test_data
			assert await master.read_dword(addr) == test_data, "ctrl_reg_in axi reading value not OK"
		else :
			await master.write_dword(addr, test_data)
			assert await master.read_dword(addr) == test_data, "register axi reading value not OK"
			assert output_ports[i-2].value == test_data, "output reg port value not OK"
		test_data += 1