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


def configure_project_ngultra(project):

    # Set project properties
    project.setVariantName("NG-ULTRA")

    # Options
    options = { 'ManageUnconnectedOutputs'    : 'Ground',
                'ManageUnconnectedSignals'    : 'Ground'}
    project.setOptions(options)

    # IOs
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

    # Constraints
    project.createClock(period=40, target="getClockNet(clk_i)")

    # Importing target specific source files
    project.addFiles("work", ["../ngultra/src/top_ngultra.vhd"])
  
    # Setting top module	
    project.setTopCellName("work", "top_ngultra")