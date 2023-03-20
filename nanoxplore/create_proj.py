import sys
import traceback
from nxpython import *

#================== Creating project ======================
project = createProject("locod-nx")


#====================== Target ============================
project.setVariantName("NG-ULTRA", "FF-1760")


#================== Importing files =======================
#Top
project.addFile("work", "../../src/top_design/rtl/top_ip.vhd")
project.addFile("work", "../../src/top_design/rtl/top.vhd")

#Common
project.addFile("work", "../../src/common/locod_package.vhd")
project.addFile("work", "../../src/common/memory_ctrl_d21.vhd")
project.addFile("work", "../../src/common/axi_master_if.vhd")
project.addFile("work", "../../src/common/axi_slave_if.vhd")

#AXI Reg
project.addFile("work", "../../src/axi_reg/rtl/axi_reg.vhd")

#Accelerator
project.addFile("work", "../../src/accelerator/rtl/accelerator.vhd")

#Master memory controller
project.addFile("work", "../../src/master_memory_ctrl/rtl/master_memory_ctrl.v")

#Start stop controller
project.addFile("work", "../../src/start_stop_ctrl/rtl/start_stop_ctrl.vhd")

#Generated files
project.addFile("work", "../../src/generated_files/acc_0.vhd")
project.addFile("work", "../../src/generated_files/acc_1.vhd")
project.addFile("work", "../../src/generated_files/acc_2.vhd")
project.addFile("work", "../../src/generated_files/acc_3.vhd")
project.addFile("work", "../../src/generated_files/acc_4.vhd")
project.addFile("work", "../../src/generated_files/acc_5.vhd")
project.addFile("work", "../../src/generated_files/acc_6.vhd")
project.addFile("work", "../../src/generated_files/acc_7.vhd")


#==================== Top cell name ======================
project.setTopCellName("work", "top_ip")


#===================Generics parameters ==================
project.addParameter("NB_ACCELERATORS", "1")


#==================== Project options ====================
getProject().setOption("AlternateModuleAttribute", "Unused")
getProject().setOption("ManageUnconnectedOutputs", "Ground")
getProject().setOption("ManageUnconnectedSignals", "Ground")


#==================== Synthesis step =====================
project.synthesize()


#=================== Destorying project ==================
project.destroy()
