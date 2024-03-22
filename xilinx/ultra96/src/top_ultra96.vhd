library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

use work.locod_pkg.all;

entity top_ultra96 is
end top_ultra96;

architecture Behavioral of top_ultra96 is

constant S_AXI_ADDR_WIDTH   : integer := 40;
constant S_AXI_DATA_WIDTH   : integer := 128;
constant S_AXI_ID_WIDTH     : integer := 16;
constant M_AXI_ADDR_WIDTH   : integer := 49;
constant M_AXI_DATA_WIDTH   : integer := 128;
constant M_AXI_ID_WIDTH     : integer := 6;
constant BASE_ADDRESS       : std_logic_vector(AXIL_ADDR_WIDTH-1 downto 0) := x"A0000000";

signal clk                  : std_logic;
signal peripheral_rstn      : std_logic_vector(0 downto 0);

signal S_AXI_awid  	        : std_logic_vector(S_AXI_ID_WIDTH-1 downto 0);
signal S_AXI_awaddr         : std_logic_vector(S_AXI_ADDR_WIDTH-1 downto 0);
signal S_AXI_awlen          : std_logic_vector(7 downto 0);
signal S_AXI_awsize         : std_logic_vector(2 downto 0);
signal S_AXI_awburst        : std_logic_vector(1 downto 0);
signal S_AXI_awlock         : std_logic;
signal S_AXI_awcache        : std_logic_vector(3 downto 0);
signal S_AXI_awprot         : std_logic_vector(2 downto 0);
signal S_AXI_awqos          : std_logic_vector(3 downto 0);
signal S_AXI_awvalid        : std_logic;
signal S_AXI_awready        : std_logic;
signal S_AXI_wdata          : std_logic_vector(S_AXI_DATA_WIDTH-1 downto 0);
signal S_AXI_wstrb          : std_logic_vector((S_AXI_DATA_WIDTH/8)-1 downto 0);
signal S_AXI_wlast          : std_logic;
signal S_AXI_wvalid         : std_logic;
signal S_AXI_wready         : std_logic;
signal S_AXI_bid            : std_logic_vector(S_AXI_ID_WIDTH-1 downto 0);
signal S_AXI_bresp          : std_logic_vector(1 downto 0);
signal S_AXI_bvalid         : std_logic;
signal S_AXI_bready         : std_logic;
signal S_AXI_arid  	        : std_logic_vector(S_AXI_ID_WIDTH-1 downto 0);
signal S_AXI_araddr         : std_logic_vector(S_AXI_ADDR_WIDTH-1 downto 0);
signal S_AXI_arlen          : std_logic_vector(7 downto 0);
signal S_AXI_arsize         : std_logic_vector(2 downto 0);
signal S_AXI_arburst        : std_logic_vector(1 downto 0);
signal S_AXI_arlock         : std_logic;
signal S_AXI_arcache        : std_logic_vector(3 downto 0);
signal S_AXI_arprot         : std_logic_vector(2 downto 0);
signal S_AXI_arqos          : std_logic_vector(3 downto 0);
signal S_AXI_arvalid        : std_logic;
signal S_AXI_arready        : std_logic;
signal S_AXI_rid 	        : std_logic_vector(S_AXI_ID_WIDTH-1 downto 0);
signal S_AXI_rdata          : std_logic_vector(S_AXI_DATA_WIDTH-1 downto 0);
signal S_AXI_rresp          : std_logic_vector(1 downto 0);
signal S_AXI_rlast          : std_logic;
signal S_AXI_rvalid         : std_logic;
signal S_AXI_rready         : std_logic;

signal M_AXI_awid  	        : std_logic_vector(M_AXI_ID_WIDTH-1 downto 0);
signal M_AXI_awaddr         : std_logic_vector(M_AXI_ADDR_WIDTH-1 downto 0);
signal M_AXI_awlen          : std_logic_vector(7 downto 0);
signal M_AXI_awsize         : std_logic_vector(2 downto 0);
signal M_AXI_awburst        : std_logic_vector(1 downto 0);
signal M_AXI_awlock         : std_logic;
signal M_AXI_awcache        : std_logic_vector(3 downto 0);
signal M_AXI_awprot         : std_logic_vector(2 downto 0);
signal M_AXI_awqos          : std_logic_vector(3 downto 0);
signal M_AXI_awvalid        : std_logic;
signal M_AXI_awready        : std_logic;
signal M_AXI_wdata          : std_logic_vector(M_AXI_DATA_WIDTH-1 downto 0);
signal M_AXI_wstrb          : std_logic_vector((M_AXI_DATA_WIDTH/8)-1 downto 0);
signal M_AXI_wlast          : std_logic;
signal M_AXI_wvalid         : std_logic;
signal M_AXI_wready         : std_logic;
signal M_AXI_bid 		    : std_logic_vector(M_AXI_ID_WIDTH-1 downto 0);
signal M_AXI_bresp          : std_logic_vector(1 downto 0);
signal M_AXI_bvalid         : std_logic;
signal M_AXI_bready         : std_logic;
signal M_AXI_arid  	        : std_logic_vector(M_AXI_ID_WIDTH-1 downto 0);
signal M_AXI_araddr         : std_logic_vector(M_AXI_ADDR_WIDTH-1 downto 0);
signal M_AXI_arlen          : std_logic_vector(7 downto 0);
signal M_AXI_arsize         : std_logic_vector(2 downto 0);
signal M_AXI_arburst        : std_logic_vector(1 downto 0);
signal M_AXI_arlock         : std_logic;
signal M_AXI_arcache        : std_logic_vector(3 downto 0);
signal M_AXI_arprot         : std_logic_vector(2 downto 0);
signal M_AXI_arqos          : std_logic_vector(3 downto 0);
signal M_AXI_arvalid        : std_logic;
signal M_AXI_arready        : std_logic;
signal M_AXI_rid 		    : std_logic_vector(M_AXI_ID_WIDTH-1 downto 0);
signal M_AXI_rdata          : std_logic_vector(M_AXI_DATA_WIDTH-1 downto 0);
signal M_AXI_rresp          : std_logic_vector(1 downto 0);
signal M_AXI_rlast          : std_logic;
signal M_AXI_rvalid         : std_logic;
signal M_AXI_rready         : std_logic;
  
begin


locod_top_inst : entity work.locod_top
generic map(
    S_AXI_ADDR_WIDTH    => S_AXI_ADDR_WIDTH,
    S_AXI_DATA_WIDTH    => S_AXI_DATA_WIDTH,
    S_AXI_ID_WIDTH      => S_AXI_ID_WIDTH,
    M_AXI_ADDR_WIDTH    => M_AXI_ADDR_WIDTH,
    M_AXI_DATA_WIDTH    => M_AXI_DATA_WIDTH,
    M_AXI_ID_WIDTH      => M_AXI_ID_WIDTH,
    BASE_ADDRESS        => BASE_ADDRESS
)
port map(
    clk_i               => clk,
    rstn_i              => peripheral_rstn(0),

    S_AXI_awid  	    => S_AXI_awid,
    S_AXI_awaddr        => S_AXI_awaddr,
	S_AXI_awlen         => S_AXI_awlen,
	S_AXI_awsize        => S_AXI_awsize,
	S_AXI_awburst       => S_AXI_awburst,
	S_AXI_awlock        => S_AXI_awlock,
	S_AXI_awcache       => S_AXI_awcache,
	S_AXI_awprot        => S_AXI_awprot,
	S_AXI_awqos         => S_AXI_awqos,
	S_AXI_awvalid       => S_AXI_awvalid,
	S_AXI_awready       => S_AXI_awready,
	S_AXI_wdata         => S_AXI_wdata,
	S_AXI_wstrb         => S_AXI_wstrb,
	S_AXI_wlast         => S_AXI_wlast,
	S_AXI_wvalid        => S_AXI_wvalid,
	S_AXI_wready        => S_AXI_wready,
	S_AXI_bid           => S_AXI_bid,
	S_AXI_bresp         => S_AXI_bresp,
	S_AXI_bvalid        => S_AXI_bvalid,
	S_AXI_bready        => S_AXI_bready,
	S_AXI_arid  	    => S_AXI_arid,
	S_AXI_araddr        => S_AXI_araddr,
	S_AXI_arlen         => S_AXI_arlen,
	S_AXI_arsize        => S_AXI_arsize,
	S_AXI_arburst       => S_AXI_arburst,
	S_AXI_arlock        => S_AXI_arlock ,
	S_AXI_arcache       => S_AXI_arcache,
	S_AXI_arprot        => S_AXI_arprot,
	S_AXI_arqos         => S_AXI_arqos,
	S_AXI_arvalid       => S_AXI_arvalid,
	S_AXI_arready       => S_AXI_arready,
	S_AXI_rid 	        => S_AXI_rid,
	S_AXI_rdata         => S_AXI_rdata,
	S_AXI_rresp         => S_AXI_rresp,
	S_AXI_rlast         => S_AXI_rlast,
	S_AXI_rvalid        => S_AXI_rvalid,
	S_AXI_rready        => S_AXI_rready,

    M_AXI_awid  	    => M_AXI_awid,
	M_AXI_awaddr        => M_AXI_awaddr,
	M_AXI_awlen         => M_AXI_awlen,
	M_AXI_awsize        => M_AXI_awsize,
	M_AXI_awburst       => M_AXI_awburst,
	M_AXI_awlock        => M_AXI_awlock,
	M_AXI_awcache       => M_AXI_awcache,
	M_AXI_awprot        => M_AXI_awprot,
	M_AXI_awqos         => M_AXI_awqos,
	M_AXI_awvalid       => M_AXI_awvalid,
	M_AXI_awready       => M_AXI_awready,
	M_AXI_wdata         => M_AXI_wdata,
	M_AXI_wstrb         => M_AXI_wstrb,
	M_AXI_wlast         => M_AXI_wlast,
	M_AXI_wvalid        => M_AXI_wvalid,
	M_AXI_wready        => M_AXI_wready,
	M_AXI_bid 		    => M_AXI_bid,
	M_AXI_bresp         => M_AXI_bresp,
	M_AXI_bvalid        => M_AXI_bvalid,
	M_AXI_bready        => M_AXI_bready,
	M_AXI_arid  	    => M_AXI_arid,
	M_AXI_araddr        => M_AXI_araddr,
	M_AXI_arlen         => M_AXI_arlen,
	M_AXI_arsize        => M_AXI_arsize,
	M_AXI_arburst       => M_AXI_arburst,
	M_AXI_arlock        => M_AXI_arlock,
	M_AXI_arcache       => M_AXI_arcache,
	M_AXI_arprot        => M_AXI_arprot,
	M_AXI_arqos         => M_AXI_arqos ,
	M_AXI_arvalid       => M_AXI_arvalid,
	M_AXI_arready       => M_AXI_arready,
	M_AXI_rid 		    => M_AXI_rid,
	M_AXI_rdata         => M_AXI_rdata,
	M_AXI_rresp         => M_AXI_rresp,
	M_AXI_rlast         => M_AXI_rlast,
	M_AXI_rvalid        => M_AXI_rvalid,
	M_AXI_rready        => M_AXI_rready
);


bd_soc_wrapper_ultra96_i: entity work.bd_soc_wrapper_ultra96
port map (
    pl_clk0 => clk,
    peripheral_aresetn => peripheral_rstn,

    M_AXI_HPM0_FPD_araddr => S_AXI_araddr,
    M_AXI_HPM0_FPD_arburst => S_AXI_arburst,
    M_AXI_HPM0_FPD_arcache => S_AXI_arcache,
    M_AXI_HPM0_FPD_arid => S_AXI_arid,
    M_AXI_HPM0_FPD_arlen => S_AXI_arlen,
    M_AXI_HPM0_FPD_arlock => S_AXI_arlock,
    M_AXI_HPM0_FPD_arprot => S_AXI_arprot,
    M_AXI_HPM0_FPD_arqos => S_AXI_arqos,
    M_AXI_HPM0_FPD_arready => S_AXI_arready,
    M_AXI_HPM0_FPD_arsize => S_AXI_arsize,
    M_AXI_HPM0_FPD_aruser => OPEN,
    M_AXI_HPM0_FPD_arvalid => S_AXI_arvalid,
    M_AXI_HPM0_FPD_awaddr => S_AXI_awaddr,
    M_AXI_HPM0_FPD_awburst => S_AXI_awburst,
    M_AXI_HPM0_FPD_awcache => S_AXI_awcache,
    M_AXI_HPM0_FPD_awid => S_AXI_awid,
    M_AXI_HPM0_FPD_awlen => S_AXI_awlen,
    M_AXI_HPM0_FPD_awlock => S_AXI_awlock,
    M_AXI_HPM0_FPD_awprot => S_AXI_awprot,
    M_AXI_HPM0_FPD_awqos => S_AXI_awqos,
    M_AXI_HPM0_FPD_awready => S_AXI_awready,
    M_AXI_HPM0_FPD_awsize => S_AXI_awsize,
    M_AXI_HPM0_FPD_awuser => OPEN,
    M_AXI_HPM0_FPD_awvalid => S_AXI_awvalid,
    M_AXI_HPM0_FPD_bid => S_AXI_bid,
    M_AXI_HPM0_FPD_bready => S_AXI_bready,
    M_AXI_HPM0_FPD_bresp => S_AXI_bresp,
    M_AXI_HPM0_FPD_bvalid => S_AXI_bvalid,
    M_AXI_HPM0_FPD_rdata => S_AXI_rdata,
    M_AXI_HPM0_FPD_rid => S_AXI_rid,
    M_AXI_HPM0_FPD_rlast => S_AXI_rlast,
    M_AXI_HPM0_FPD_rready => S_AXI_rready,
    M_AXI_HPM0_FPD_rresp => S_AXI_rresp,
    M_AXI_HPM0_FPD_rvalid => S_AXI_rvalid,
    M_AXI_HPM0_FPD_wdata => S_AXI_wdata,
    M_AXI_HPM0_FPD_wlast => S_AXI_wlast,
    M_AXI_HPM0_FPD_wready => S_AXI_wready,
    M_AXI_HPM0_FPD_wstrb => S_AXI_wstrb,
    M_AXI_HPM0_FPD_wvalid => S_AXI_wvalid,

    S_AXI_HPC0_FPD_araddr => M_AXI_araddr,
    S_AXI_HPC0_FPD_arburst => M_AXI_arburst,
    S_AXI_HPC0_FPD_arcache => M_AXI_arcache,
    S_AXI_HPC0_FPD_arid => M_AXI_arid,
    S_AXI_HPC0_FPD_arlen => M_AXI_arlen,
    S_AXI_HPC0_FPD_arlock => M_AXI_arlock,
    S_AXI_HPC0_FPD_arprot => M_AXI_arprot,
    S_AXI_HPC0_FPD_arqos => M_AXI_arqos,
    S_AXI_HPC0_FPD_arready => M_AXI_arready,
    S_AXI_HPC0_FPD_arsize => M_AXI_arsize,
    S_AXI_HPC0_FPD_aruser => '0',
    S_AXI_HPC0_FPD_arvalid => M_AXI_arvalid,
    S_AXI_HPC0_FPD_awaddr => M_AXI_awaddr,
    S_AXI_HPC0_FPD_awburst => M_AXI_awburst,
    S_AXI_HPC0_FPD_awcache => M_AXI_awcache,
    S_AXI_HPC0_FPD_awid => M_AXI_awid,
    S_AXI_HPC0_FPD_awlen => M_AXI_awlen,
    S_AXI_HPC0_FPD_awlock => M_AXI_awlock,
    S_AXI_HPC0_FPD_awprot => M_AXI_awprot,
    S_AXI_HPC0_FPD_awqos => M_AXI_awqos,
    S_AXI_HPC0_FPD_awready => M_AXI_awready,
    S_AXI_HPC0_FPD_awsize => M_AXI_awsize,
    S_AXI_HPC0_FPD_awuser => '0',
    S_AXI_HPC0_FPD_awvalid => M_AXI_awvalid,
    S_AXI_HPC0_FPD_bid => M_AXI_bid,
    S_AXI_HPC0_FPD_bready => M_AXI_bready,
    S_AXI_HPC0_FPD_bresp => M_AXI_bresp,
    S_AXI_HPC0_FPD_bvalid => M_AXI_bvalid,
    S_AXI_HPC0_FPD_rdata => M_AXI_rdata,
    S_AXI_HPC0_FPD_rid => M_AXI_rid,
    S_AXI_HPC0_FPD_rlast => M_AXI_rlast,
    S_AXI_HPC0_FPD_rready => M_AXI_rready,
    S_AXI_HPC0_FPD_rresp => M_AXI_rresp,
    S_AXI_HPC0_FPD_rvalid => M_AXI_rvalid,
    S_AXI_HPC0_FPD_wdata => M_AXI_wdata,
    S_AXI_HPC0_FPD_wlast => M_AXI_wlast,
    S_AXI_HPC0_FPD_wready => M_AXI_wready,
    S_AXI_HPC0_FPD_wstrb => M_AXI_wstrb,
    S_AXI_HPC0_FPD_wvalid => M_AXI_wvalid
);
    
end Behavioral;
