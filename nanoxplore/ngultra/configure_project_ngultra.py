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