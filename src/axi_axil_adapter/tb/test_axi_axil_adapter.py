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