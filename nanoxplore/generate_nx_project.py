import sys
import os
import traceback
from nxpython import *

# Import targets subscripts
sys.path.insert(1, 'ngultra')
import configure_project_ngultra


# Variables
target = sys.argv[1]


# Creating NX project
project = createProject("locod-nx_" + target)


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
                            "../../src/common/locod_package.vhd"])


# Importing generated files
generated_files = os.listdir("../../src/generated_files")
generated_files.remove(".gitignore")
project.addFiles("work", ["../../src/generated_files/"+i for i in generated_files])


# Target specific operations
if target == "ngultra":
    configure_project_ngultra.configure_project_ngultra(project)


# Synthesis step
project.synthesize()


# Place step
project.place()


# Route step
project.route()


# Generate bitstream
project.generateBitstream("fpga.nxb")


# Destorying project
project.destroy()
