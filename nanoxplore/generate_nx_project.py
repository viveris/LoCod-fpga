#                     __            ___             _ 
#                    / /    ___    / __\  ___    __| |
#                   / /    / _ \  / /    / _ \  / _` |
#                  / /___ | (_) |/ /___ | (_) || (_| |
#                  \____/  \___/ \____/  \___/  \__,_|
#
#            ***********************************************
#                             LoCod Project
#                 URL: https://github.com/viveris/LoCod
#            ***********************************************
#                 Copyright © 2024 Viveris Technologies
#
#                  Developed in partnership with CNES
#              (DTN/TVO/ET: On-Board Data Handling Office)
#
#  This file is part of the LoCod framework.
#
#  The LoCod framework is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 3 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

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
