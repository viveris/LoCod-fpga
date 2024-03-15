import random
import cocotb
from cocotb.triggers import RisingEdge, FallingEdge
from cocotb.clock import Clock
from cocotbext.axi import AxiLiteBus, AxiLiteMaster


class TB:
	def __init__(self, dut):
		self.dut = dut

		#Retrieve generics parameters
		self.NB_REGISTERS_OUT = int(cocotb.top.NB_REGISTERS_OUT)
		self.NB_REGISTERS_IN = int(cocotb.top.NB_REGISTERS_IN)
		self.BASE_ADDRESS = int(cocotb.top.BASE_ADDRESS)

		#DUT reg_ports
		self.reg_ports_out = [dut.REG0, dut.REG1, dut.REG2, dut.REG3]
		self.reg_ports_in = [dut.REG4, dut.REG5, dut.REG6, dut.REG7]

		#AXI Lite Bus
		self.axi_master = AxiLiteMaster(AxiLiteBus.from_prefix(dut, "S_AXIL"), dut.clk_i, dut.rstn_i, False)

		#Start clock
		cocotb.start_soon(Clock(dut.clk_i, period=10, units="ns").start())


	async def cycle_reset(self):
		for i in range(self.NB_REGISTERS_IN):
			if (i%2 == 0):
				self.reg_ports_in[i].value = 0

		self.dut.rstn_i.value = 0
		for i in range(5):
			await FallingEdge(self.dut.clk_i)
		self.dut.rstn_i.value = 1
		await FallingEdge(self.dut.clk_i)


	async def test_port(self, port, reg_addr, direction):
		data = random.randrange(0, 0xffffffff)
		if direction == 0:			#Output port
			await self.axi_master.write_dword(reg_addr, data)
			assert await self.axi_master.read_dword(reg_addr) == data, "output port axi reading value not OK"
			assert port.value == data, "output port value not OK"
		elif direction == 1:		#Input port
			port.value = data
			assert await self.axi_master.read_dword(reg_addr) == data, "register in axi reading value not OK"



# Test routine
@cocotb.test()
async def test_axi_reg(dut):	
	tb = TB(dut)

	#Reseting DUT
	await tb.cycle_reset()

	#Testing registers out
	for i in range(tb.NB_REGISTERS_OUT):
		await tb.test_port(tb.reg_ports_out[i], tb.BASE_ADDRESS + i*4, 0)

	#Testing registers in
	for i in range(tb.NB_REGISTERS_IN):
		await tb.test_port(tb.reg_ports_in[i], tb.BASE_ADDRESS + (tb.NB_REGISTERS_OUT + i)*4, 1)
