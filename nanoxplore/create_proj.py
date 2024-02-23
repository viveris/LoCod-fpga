import sys
import os
import traceback
from nxpython import *

#================== Creating project ======================
project = createProject("locod-nx")


#====================== Target ============================
project.setVariantName("NG-ULTRA")


#================== Importing files =======================
# Importing common source files
project.addFiles("work", [	"../../src/axi_reg/rtl/axi_reg.vhd", 
							"../../src/start_stop_ctrl/rtl/start_stop_ctrl.vhd",
							"../../src/master_memory_ctrl/rtl/master_memory_ctrl.v",
							"../../src/axi_interconnect/rtl/axi_channel_buffer.vhd",
							"../../src/axi_interconnect/rtl/axi_interconnect.vhd",
							"../../src/axi_interconnect/rtl/axi_master_interface.vhd",
							"../../src/axi_interconnect/rtl/axi_slave_interface.vhd",
							"../../src/axi_axil_adapter/rtl/axi_axil_adapter.v",
							"../../src/axi_axil_adapter/rtl/axi_axil_adapter_rd.v",
							"../../src/axi_axil_adapter/rtl/axi_axil_adapter_wr.v",
							"../../src/axil_adapter/rtl/axil_adapter.v",
							"../../src/axil_adapter/rtl/axil_adapter_rd.v",
							"../../src/axil_adapter/rtl/axil_adapter_wr.v",
							"../../src/axil_axi_adapter/rtl/axil_axi_adapter.vhd",
							"../../src/common/memory_ctrl_d21.vhd",
							"../../src/common/locod_package_nx.vhd"])

# Importing generated files
generated_files = os.listdir("../../src/generated_files")
generated_files.remove(".gitignore")
project.addFiles("work", ["../../src/generated_files/"+i for i in generated_files])

# Import NX specific files
project.addFiles("work", [	"../src/top.vhd"])


#==================== Top cell name ======================
project.setTopCellName("work", "top")


#==================== Project options ====================
options = { 'ManageUnconnectedOutputs'    : 'Ground',
            'ManageUnconnectedSignals'    : 'Ground'}
project.setOptions(options)


#=================== Project IOs =========================
banks = {   'IOB3'          	: {'voltage': '1.8'},
            'IOB5'          	: {'voltage': '1.8'},
            'IOB6'          	: {'voltage': '3.3'}, 
            'IOB7'          	: {'voltage': '3.3'},
            'IOB8'          	: {'voltage': '1.8'}, 
            'IOB9'          	: {'voltage': '1.8'}, 
            'IOB10'         	: {'voltage': '1.8'},
            'IOB11'         	: {'voltage': '1.8'},
            'IOB12'         	: {'voltage': '1.8'},
            'IOB13'         	: {'voltage': '1.8'}}
pads =  {   'clk_i'         	: {'location': 'IOB05_D08'},    # GCLK_BOT_L
            'rstn_i'        	: {'location': 'IOB07_D08'},    # PushB1
            'led_s_awvalid_o' 	: {'location': 'IOB07_D16'},    # Uled1
			'led_m_awvalid_o' 	: {'location': 'IOB07_D17'}}    # Uled2
project.addBanks(banks)
project.addPads(pads)


#==================== Project constraints =================
project.createClock(period=40, target="getClockNet(clk_i)")


#==================== Synthesis step =====================
project.synthesize()


#==================== Place step =====================
project.place()


#==================== Route step =====================
project.route()


#==================== Generate bitstream =====================
project.generateBitstream("fpga.nxb")


#=================== Destorying project ==================
project.destroy()
