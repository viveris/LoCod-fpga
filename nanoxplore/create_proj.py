import sys
import os
import traceback
from nxpython import *

#================== Creating project ======================
project = createProject("locod-nx")


#====================== Target ============================
project.setVariantName("NG-ULTRA", "FF-1760")


#================== Importing files =======================
# Importing common source files
project.addFiles("work", [	"../../src/axi_reg/rtl/axi_reg.vhd", 
							"../../src/start_stop_ctrl/rtl/start_stop_ctrl.vhd",
							"../../src/master_memory_ctrl/rtl/master_memory_ctrl.v",
							"../../src/axi_interconnect_colin/rtl/axi_channel_buffer.vhd",
							"../../src/axi_interconnect_colin/rtl/axi_interconnect.vhd",
							"../../src/axi_interconnect_colin/rtl/axi_master_interface.vhd",
							"../../src/axi_interconnect_colin/rtl/axi_slave_interface.vhd",
							"../../src/common/memory_ctrl_d21.vhd",
							"../../src/common/axi_master_if.vhd",
							"../../src/common/axi_slave_if.vhd",
							"../../src/common/locod_package.vhd"])

# Importing generated files
generated_files = os.listdir("../../src/generated_files")
generated_files.remove(".gitignore")
project.addFiles("work", ["../../src/generated_files/"+i for i in generated_files])


#==================== Top cell name ======================
project.setTopCellName("work", "top")


#==================== Project options ====================
getProject().setOption("AlternateModuleAttribute", "Unused")
getProject().setOption("ManageUnconnectedOutputs", "Ground")
getProject().setOption("ManageUnconnectedSignals", "Ground")


#==================== Synthesis step =====================
project.synthesize()


#=================== Destorying project ==================
project.destroy()
