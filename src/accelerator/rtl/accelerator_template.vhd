--                     __            ___             _ 
--                    / /    ___    / __\  ___    __| |
--                   / /    / _ \  / /    / _ \  / _` |
--                  / /___ | (_) |/ /___ | (_) || (_| |
--                  \____/  \___/ \____/  \___/  \__,_|
--
--            ***********************************************
--                             LoCod Project
--                 URL: https://github.com/viveris/LoCod
--            ***********************************************
--                 Copyright © 2024 Viveris Technologies
--
--                  Developed in partnership with CNES
--              (DTN/TVO/ET: On-Board Data Handling Office)
--
--  This file is part of the LoCod framework.
--
--  The LoCod framework is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License as published by
--  the Free Software Foundation; either version 3 of the License, or
--  (at your option) any later version.
--
--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU General Public License for more details.
--
--  You should have received a copy of the GNU General Public License
--  along with this program.  If not, see <http://www.gnu.org/licenses/>.
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use work.locod_pkg.all;

entity accelerator_X is
port(
    -- IN
    clk 				    : in std_logic;
    rst 				    : in std_logic;
    start 				    : in std_logic;
    reset 				    : in std_logic;
    param 				    : in std_logic_vector(31 downto 0);
    result 				    : in std_logic_vector(31 downto 0);
    
    -- OUT
    status_end_process 	    : out std_logic;
    duration_count_latched  : out std_logic_vector(31 downto 0);
    
    -- AXI4 LITE Bus
	M_AXI_out       	    : out AXI4Lite_m_to_s;
    M_AXI_in        	    : in AXI4Lite_s_to_m
);
end accelerator_X;


architecture Behavioral of accelerator_X is

signal ip_start : std_logic;
signal ip_stop : std_logic;
signal ip_reset : std_logic;

signal oe_ram : std_logic;
signal we_ram : std_logic;
signal addr_ram : std_logic_vector(31 downto 0);
signal w_data_ram : std_logic_vector(31 downto 0);
signal r_data_ram : std_logic_vector(31 downto 0);
signal data_rdy : std_logic;

constant C_INIT_AXI_TXN : std_logic := '0';
constant C_SIN_DATA_RAM_SIZE : std_logic_vector(5 downto 0) := "000000";


begin


start_stop_ctrl_inst : entity work.start_stop_ctrl
port map (
    clk                         => clk,
    reset_n                     => rst,
    ctrl_start                  => start,
    ctrl_reset_ip               => reset,
    ctrl_auto_restart           => '0',
    status_running              => open,
    status_end_process          => status_end_process,
    duration_count              => open,
    duration_count_latched      => duration_count_latched,
    iteration_count             => open,
    ip_start                    => ip_start,
    ip_reset                    => ip_reset,
    ip_stop                     => ip_stop
);


master_memory_ctrl_inst : entity work.master_memory_ctrl
port map (
    SIN_WDATA_RAM => w_data_ram,
    SIN_OE_RAM => oe_ram,
    SIN_WE_RAM => we_ram,
    SIN_ADDR_RAM => addr_ram,
    SIN_DATA_RAM_SIZE => C_SIN_DATA_RAM_SIZE,
    INIT_AXI_TXN => C_INIT_AXI_TXN,
    M_AXI_ACLK => clk,
    M_AXI_ARESETN => rst,
    S_DATARDY => data_rdy,
    SOUT_RDATA_RAM => r_data_ram,
    ERROR => open,
    TXN_DONE => open,   
    M_AXI_AWADDR => M_AXI_out.awaddr,
    M_AXI_AWPROT => M_AXI_out.awprot,
    M_AXI_AWVALID => M_AXI_out.awvalid,
    M_AXI_AWREADY => M_AXI_in.awready,    
    M_AXI_WDATA => M_AXI_out.wdata,
    M_AXI_WSTRB => M_AXI_out.wstrb,
    M_AXI_WVALID => M_AXI_out.wvalid,
    M_AXI_WREADY => M_AXI_in.wready,   
    M_AXI_BRESP => M_AXI_in.bresp,
    M_AXI_BVALID => M_AXI_in.bvalid,
    M_AXI_BREADY => M_AXI_out.bready,   
    M_AXI_ARADDR => M_AXI_out.araddr,
    M_AXI_ARPROT => M_AXI_out.arprot,
    M_AXI_ARVALID => M_AXI_out.arvalid,
    M_AXI_ARREADY => M_AXI_in.arready, 
    M_AXI_RDATA => M_AXI_in.rdata,
    M_AXI_RRESP => M_AXI_in.rresp,
    M_AXI_RVALID => M_AXI_in.rvalid,
    M_AXI_RREADY => M_AXI_out.rready
);


generated_ip_inst : entity work.XXXX
port map (
	clock => clk,
	reset => ip_reset,
	start_port => ip_start,
	param => param,
	result => result,
	M_Rdata_ram => r_data_ram,
	M_DataRdy => data_rdy,
	done_port => ip_stop,
	Mout_oe_ram => oe_ram,
	Mout_we_ram => we_ram,
	Mout_addr_ram => addr_ram,
	Mout_Wdata_ram => w_data_ram,
	Mout_data_ram_size => open
);


end Behavioral;
