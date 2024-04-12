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
use ieee.numeric_std.all;

use work.locod_pkg.all;

entity locod_top is
generic(
    S_AXI_ADDR_WIDTH    : integer := 0;
    S_AXI_DATA_WIDTH    : integer := 0;
    S_AXI_ID_WIDTH      : integer := 0;
    M_AXI_ADDR_WIDTH    : integer := 0;
    M_AXI_DATA_WIDTH    : integer := 0;
    M_AXI_ID_WIDTH      : integer := 0;
    BASE_ADDRESS        : std_logic_vector(AXIL_ADDR_WIDTH-1 downto 0) := (others => '0')
);
port(
	-- Clock and reset
    clk_i               : in std_logic;
    rstn_i              : in std_logic;

    -- AXI4 full slave
    S_AXI_awid  	    : in std_logic_vector(S_AXI_ID_WIDTH-1 downto 0);
    S_AXI_awaddr        : in std_logic_vector(S_AXI_ADDR_WIDTH-1 downto 0);
	S_AXI_awlen         : in std_logic_vector(7 downto 0);
	S_AXI_awsize        : in std_logic_vector(2 downto 0);
	S_AXI_awburst       : in std_logic_vector(1 downto 0);
	S_AXI_awlock        : in std_logic;
	S_AXI_awcache       : in std_logic_vector(3 downto 0);
	S_AXI_awprot        : in std_logic_vector(2 downto 0);
	S_AXI_awqos         : in std_logic_vector(3 downto 0);
	S_AXI_awvalid       : in std_logic;
	S_AXI_awready       : out std_logic;

	S_AXI_wdata         : in std_logic_vector(S_AXI_DATA_WIDTH-1 downto 0);
	S_AXI_wstrb         : in std_logic_vector((S_AXI_DATA_WIDTH/8)-1 downto 0);
	S_AXI_wlast         : in std_logic;
	S_AXI_wvalid        : in std_logic;
	S_AXI_wready        : out std_logic;

	S_AXI_bid           : out std_logic_vector(S_AXI_ID_WIDTH-1 downto 0);
	S_AXI_bresp         : out std_logic_vector(1 downto 0);
	S_AXI_bvalid        : out std_logic;
	S_AXI_bready        : in std_logic;

	S_AXI_arid  	    : in std_logic_vector(S_AXI_ID_WIDTH-1 downto 0);
	S_AXI_araddr        : in std_logic_vector(S_AXI_ADDR_WIDTH-1 downto 0);
	S_AXI_arlen         : in std_logic_vector(7 downto 0);
	S_AXI_arsize        : in std_logic_vector(2 downto 0);
	S_AXI_arburst       : in std_logic_vector(1 downto 0);
	S_AXI_arlock        : in std_logic;
	S_AXI_arcache       : in std_logic_vector(3 downto 0);
	S_AXI_arprot        : in std_logic_vector(2 downto 0);
	S_AXI_arqos         : in std_logic_vector(3 downto 0);
	S_AXI_arvalid       : in std_logic;
	S_AXI_arready       : out std_logic;

	S_AXI_rid 	        : out std_logic_vector(S_AXI_ID_WIDTH-1 downto 0);
	S_AXI_rdata         : out std_logic_vector(S_AXI_DATA_WIDTH-1 downto 0);
	S_AXI_rresp         : out std_logic_vector(1 downto 0);
	S_AXI_rlast         : out std_logic;
	S_AXI_rvalid        : out std_logic;
	S_AXI_rready        : in std_logic;

    -- AXI4 full master
    M_AXI_awid  	    : out std_logic_vector(M_AXI_ID_WIDTH-1 downto 0);
	M_AXI_awaddr        : out std_logic_vector(M_AXI_ADDR_WIDTH-1 downto 0);
	M_AXI_awlen         : out std_logic_vector(7 downto 0);
	M_AXI_awsize        : out std_logic_vector(2 downto 0);
	M_AXI_awburst       : out std_logic_vector(1 downto 0);
	M_AXI_awlock        : out std_logic;
	M_AXI_awcache       : out std_logic_vector(3 downto 0);
	M_AXI_awprot        : out std_logic_vector(2 downto 0);
	M_AXI_awqos         : out std_logic_vector(3 downto 0);
	M_AXI_awvalid       : out std_logic;
	M_AXI_awready       : in std_logic;

	M_AXI_wdata         : out std_logic_vector(M_AXI_DATA_WIDTH-1 downto 0);
	M_AXI_wstrb         : out std_logic_vector((M_AXI_DATA_WIDTH/8)-1 downto 0);
	M_AXI_wlast         : out std_logic;
	M_AXI_wvalid        : out std_logic;
	M_AXI_wready        : in std_logic;

	M_AXI_bid 		    : in std_logic_vector(M_AXI_ID_WIDTH-1 downto 0);
	M_AXI_bresp         : in std_logic_vector(1 downto 0);
	M_AXI_bvalid        : in std_logic;
	M_AXI_bready        : out std_logic;

	M_AXI_arid  	    : out std_logic_vector(M_AXI_ID_WIDTH-1 downto 0);
	M_AXI_araddr        : out std_logic_vector(M_AXI_ADDR_WIDTH-1 downto 0);
	M_AXI_arlen         : out std_logic_vector(7 downto 0);
	M_AXI_arsize        : out std_logic_vector(2 downto 0);
	M_AXI_arburst       : out std_logic_vector(1 downto 0);
	M_AXI_arlock        : out std_logic;
	M_AXI_arcache       : out std_logic_vector(3 downto 0);
	M_AXI_arprot        : out std_logic_vector(2 downto 0);
	M_AXI_arqos         : out std_logic_vector(3 downto 0);
	M_AXI_arvalid       : out std_logic;
	M_AXI_arready       : in std_logic;

	M_AXI_rid           : in std_logic_vector(M_AXI_ID_WIDTH-1 downto 0);
	M_AXI_rdata         : in std_logic_vector(M_AXI_DATA_WIDTH-1 downto 0);
	M_AXI_rresp         : in std_logic_vector(1 downto 0);
	M_AXI_rlast         : in std_logic;
	M_AXI_rvalid        : in std_logic;
	M_AXI_rready        : out std_logic
);
end locod_top;

architecture Behavioral of locod_top is


-- Constants
constant NB_REGISTERS_OUT : integer := (2*NB_ACCELERATORS)+1;
constant NB_REGISTERS_IN : integer := NB_ACCELERATORS+1;

-- AXI Lite signals between AXI to AXIL Adapter and AXI Reg
signal S_AXIL_in : AXI4Lite_m_to_s;
signal S_AXIL_out : AXI4Lite_s_to_m;

-- Control registers
signal registers_out : reg_array(NB_REGISTERS_OUT-1 downto 0);
signal registers_in : reg_array(NB_REGISTERS_IN-1 downto 0);

-- Array of AXI Lite signals between LoCod accelerators and AXIL Interconnect
signal M_AXIL_out_array : AXI4Lite_m_to_s_array(NB_ACCELERATORS-1 downto 0);
signal M_AXIL_in_array : AXI4Lite_s_to_m_array(NB_ACCELERATORS-1 downto 0);

-- AXI Lite signals between AXIL Interconnect and AXIL to AXI Adapter
signal M_AXIL_out : AXI4Lite_m_to_s;
signal M_AXIL_in : AXI4Lite_s_to_m;


begin


axi_axil_adapter_i : entity work.axi_axil_adapter
generic map (
    ADDR_WIDTH 			=> AXIL_ADDR_WIDTH,
    AXI_DATA_WIDTH 	    => S_AXI_DATA_WIDTH,
    AXI_ID_WIDTH 		=> S_AXI_ID_WIDTH,
    AXIL_DATA_WIDTH 	=> AXIL_DATA_WIDTH
)
port map (
    clk 				=> clk_i,
    rst 				=> not rstn_i,

    s_axi_awid   		=> S_AXI_awid,
    s_axi_awaddr 		=> S_AXI_awaddr(AXIL_ADDR_WIDTH-1 downto 0),
    s_axi_awlen			=> S_AXI_awlen,
    s_axi_awsize		=> S_AXI_awsize,
    s_axi_awburst		=> S_AXI_awburst,
    s_axi_awlock		=> S_AXI_awlock,
    s_axi_awcache		=> S_AXI_awcache,
    s_axi_awprot		=> S_AXI_awprot,
    s_axi_awvalid		=> S_AXI_awvalid,
    s_axi_awready		=> S_AXI_awready,
    s_axi_wdata			=> S_AXI_wdata,
    s_axi_wstrb			=> S_AXI_wstrb,
    s_axi_wlast			=> S_AXI_wlast,
    s_axi_wvalid		=> S_AXI_wvalid,
    s_axi_wready		=> S_AXI_wready,
    s_axi_bid			=> S_AXI_bid,
    s_axi_bresp			=> S_AXI_bresp,
    s_axi_bvalid		=> S_AXI_bvalid,
    s_axi_bready		=> S_AXI_bready,
    s_axi_arid			=> S_AXI_arid,
    s_axi_araddr		=> S_AXI_araddr(AXIL_ADDR_WIDTH-1 downto 0),
    s_axi_arlen			=> S_AXI_arlen,
    s_axi_arsize		=> S_AXI_arsize,
    s_axi_arburst		=> S_AXI_arburst,
    s_axi_arlock		=> S_AXI_arlock,
    s_axi_arcache		=> S_AXI_arcache,
    s_axi_arprot		=> S_AXI_arprot,
    s_axi_arvalid		=> S_AXI_arvalid,
    s_axi_arready		=> S_AXI_arready,
    s_axi_rid			=> S_AXI_rid,
    s_axi_rdata			=> S_AXI_rdata,
    s_axi_rresp			=> S_AXI_rresp,
    s_axi_rlast			=> S_AXI_rlast,
    s_axi_rvalid		=> S_AXI_rvalid,
    s_axi_rready		=> S_AXI_rready,

    m_axil_awaddr  		=> S_AXIL_in.awaddr,
    m_axil_awprot  		=> S_AXIL_in.awprot,
    m_axil_awvalid  	=> S_AXIL_in.awvalid,
    m_axil_awready  	=> S_AXIL_out.awready,
    m_axil_wdata  		=> S_AXIL_in.wdata,
    m_axil_wstrb  		=> S_AXIL_in.wstrb,
    m_axil_wvalid  		=> S_AXIL_in.wvalid,
    m_axil_wready  		=> S_AXIL_out.wready,
    m_axil_bresp  		=> S_AXIL_out.bresp,
    m_axil_bvalid  		=> S_AXIL_out.bvalid,
    m_axil_bready  		=> S_AXIL_in.bready,
    m_axil_araddr  		=> S_AXIL_in.araddr,
    m_axil_arprot  		=> S_AXIL_in.arprot,
    m_axil_arvalid  	=> S_AXIL_in.arvalid,
    m_axil_arready  	=> S_AXIL_out.arready,
    m_axil_rdata  		=> S_AXIL_out.rdata,
    m_axil_rresp  		=> S_AXIL_out.rresp,
    m_axil_rvalid  		=> S_AXIL_out.rvalid,
    m_axil_rready  		=> S_AXIL_in.rready 
);


axi_reg_i : entity work.axi_reg
generic map(
    NB_REGISTERS_OUT    => NB_REGISTERS_OUT,
    NB_REGISTERS_IN     => NB_REGISTERS_IN,
    BASE_ADDRESS        => BASE_ADDRESS
)
port map(
    clk_i 		        => clk_i,
    rstn_i 	            => rstn_i,
    S_AXIL_in           => S_AXIL_in,
    S_AXIL_out          => S_AXIL_out,
    REG_ARRAY_PORT_o    => registers_out,
    REG_ARRAY_PORT_i    => registers_in
);


axi_interconnect_inst : entity work.axi_interconnect
generic map(
    NB_MASTER           => NB_ACCELERATORS,
    ADDR_SIZE           => AXIL_ADDR_WIDTH,
    DATA_SIZE           => AXIL_DATA_WIDTH
)
port map(
    i_clk               => clk_i,
    i_rst_n             => rstn_i,
    i_s_axi_array       => M_AXIL_out_array,
    o_s_axi_array       => M_AXIL_in_array,
    o_m_axi             => M_AXIL_out,
    i_m_axi             => M_AXIL_in
);


axil_axi_adapter_inst : entity work.axil_axi_adapter
generic map(
    ADDR_WIDTH          => AXIL_ADDR_WIDTH,
    AXIL_DATA_WIDTH     => AXIL_DATA_WIDTH,
    AXIL_STRB_WIDTH     => (AXIL_DATA_WIDTH/8),
    AXI_DATA_WIDTH      => M_AXI_DATA_WIDTH,
    AXI_STRB_WIDTH      => (M_AXI_DATA_WIDTH/8),
    AXI_ID_WIDTH        => M_AXI_ID_WIDTH
)
port map(
    clk_i      			=> clk_i,
    rstn_i   			=> rstn_i,
    
    S_AXIL_awaddr_i     => M_AXIL_out.awaddr,
    S_AXIL_awprot_i     => M_AXIL_out.awprot,
    S_AXIL_awvalid_i    => M_AXIL_out.awvalid,
    S_AXIL_awready_o    => M_AXIL_in.awready,
    S_AXIL_wdata_i      => M_AXIL_out.wdata,
    S_AXIL_wstrb_i      => M_AXIL_out.wstrb,
    S_AXIL_wvalid_i     => M_AXIL_out.wvalid,
    S_AXIL_wready_o     => M_AXIL_in.wready,
    S_AXIL_bresp_o      => M_AXIL_in.bresp,
    S_AXIL_bvalid_o     => M_AXIL_in.bvalid,
    S_AXIL_bready_i     => M_AXIL_out.bready,
    S_AXIL_araddr_i     => M_AXIL_out.araddr,
    S_AXIL_arprot_i     => M_AXIL_out.arprot,
    S_AXIL_arvalid_i    => M_AXIL_out.arvalid,
    S_AXIL_arready_o    => M_AXIL_in.arready,
    S_AXIL_rdata_o      => M_AXIL_in.rdata,
    S_AXIL_rresp_o      => M_AXIL_in.rresp,
    S_AXIL_rvalid_o     => M_AXIL_in.rvalid,
    S_AXIL_rready_i     => M_AXIL_out.rready,

    M_AXI_awid_o  	    => M_AXI_awid,
	M_AXI_awaddr_o      => M_AXI_awaddr(AXIL_ADDR_WIDTH-1 downto 0),
	M_AXI_awlen_o       => M_AXI_awlen,
	M_AXI_awsize_o      => M_AXI_awsize,
	M_AXI_awburst_o     => M_AXI_awburst,
	M_AXI_awlock_o      => M_AXI_awlock,
	M_AXI_awcache_o     => M_AXI_awcache,
	M_AXI_awprot_o      => M_AXI_awprot,
	M_AXI_awqos_o       => M_AXI_awqos,
	M_AXI_awvalid_o     => M_AXI_awvalid,
	M_AXI_awready_i     => M_AXI_awready,
	M_AXI_wdata_o       => M_AXI_wdata,
	M_AXI_wstrb_o       => M_AXI_wstrb,
	M_AXI_wlast_o       => M_AXI_wlast,
	M_AXI_wvalid_o      => M_AXI_wvalid,
	M_AXI_wready_i      => M_AXI_wready,
	M_AXI_bid_i 		=> M_AXI_bid,
	M_AXI_bresp_i       => M_AXI_bresp,
	M_AXI_bvalid_i      => M_AXI_bvalid,
	M_AXI_bready_o      => M_AXI_bready,
	M_AXI_arid_o  	    => M_AXI_arid,
	M_AXI_araddr_o      => M_AXI_araddr(AXIL_ADDR_WIDTH-1 downto 0),
	M_AXI_arlen_o       => M_AXI_arlen,
	M_AXI_arsize_o      => M_AXI_arsize,
	M_AXI_arburst_o     => M_AXI_arburst,
	M_AXI_arlock_o      => M_AXI_arlock,
	M_AXI_arcache_o     => M_AXI_arcache,
	M_AXI_arprot_o      => M_AXI_arprot,
	M_AXI_arqos_o       => M_AXI_arqos,
	M_AXI_arvalid_o     => M_AXI_arvalid,
	M_AXI_arready_i     => M_AXI_arready,
	M_AXI_rid_i 		=> M_AXI_rid,
	M_AXI_rdata_i       => M_AXI_rdata,
	M_AXI_rresp_i       => M_AXI_rresp,
	M_AXI_rlast_i       => M_AXI_rlast,
	M_AXI_rvalid_i      => M_AXI_rvalid,
	M_AXI_rready_o      => M_AXI_rready
);


--accelerator_inst : entity work.accelerator_i
--port map(
--	clk					    => clk_i,
--	rst 				    => rstn_i,
--	start 				    => registers_out(0)(2*${ACC_NUM}),
--  reset 				    => registers_out(0)(2*${ACC_NUM}+1),
--  param 				    => registers_out(2*${ACC_NUM}+1),
--  result  			    => registers_out(2*${ACC_NUM}+1+1),
--  status_end_process 	    => registers_in(0)(${ACC_NUM}),
--  duration_count_latched  => registers_in(${ACC_NUM}+1),
--	M_AXI_out               => M_AXIL_out_array(i),
--	M_AXI_in                => M_AXIL_in_array(i)
--);

--end Behavioral;

