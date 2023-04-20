import random
import cocotb
from cocotb.triggers import RisingEdge, FallingEdge
from cocotb.clock import Clock
from cocotbext.axi import AxiLiteBus, AxiLiteMaster


class TB:
	def __init__(self, dut):
		self.dut = dut

		#Retrieve generics parameters
		self.NB_REGISTERS = int(cocotb.top.NB_REGISTERS)

		#DUT ports
		self.ports = [dut.REG0, dut.REG1, dut.REG2, dut.REG3, dut.REG4, dut.REG5, dut.REG6, dut.REG7, dut.REG8, dut.REG9, dut.REG10, dut.REG11, dut.REG12, dut.REG13, dut.REG14, dut.REG15]

		#AXI Lite Bus
		self.axi_master = AxiLiteMaster(AxiLiteBus.from_prefix(dut, "S_AXI"), dut.clk, dut.rst, False)

		#Start clock
		cocotb.start_soon(Clock(dut.clk, period=10, units="ns").start())


	async def cycle_reset(self):
		for i in range(self.NB_REGISTERS):
			if (i%2 == 0):
				self.ports[i].value = 0

		self.dut.rst.value = 0
		for i in range(5):
			await FallingEdge(self.dut.clk)
		self.dut.rst.value = 1
		await FallingEdge(self.dut.clk)


	async def test_port(self, port, reg_addr, direction):
		data = random.randrange(0, 0xffffffff)
		other_addr = random.randrange(0, 4 * self.NB_REGISTERS, 4)
		while other_addr == reg_addr:
			other_addr = random.randrange(0, 4 * self.NB_REGISTERS, 4)
		if direction == 0:			#Output port
			await self.axi_master.write_dword(reg_addr, data)
			assert await self.axi_master.read_dword(reg_addr) == data, "output port axi reading value not OK"
			assert port.value == data, "output port value not OK"
			assert await self.axi_master.read_dword(other_addr) != data, "axi reading at another address is the same"
		elif direction == 1:		#Input port
			port.value = data
			assert await self.axi_master.read_dword(reg_addr) == data, "register in axi reading value not OK"



# Test routine
@cocotb.test()
async def test_axi_reg(dut):	
	tb = TB(dut)

	#Reseting DUT
	await tb.cycle_reset()

	#Testing registers
	for i in range(tb.NB_REGISTERS):
		await tb.test_port(tb.ports[i], i*4, (i+1)%2)
