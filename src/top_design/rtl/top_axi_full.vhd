library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

use work.locod_pkg.all;

entity top_axi_full is
port(
	-- Clock and reset
    clk             : in std_logic;
    rst             : in std_logic;

    -- AXI4 full slave
    S_AXI_awid  	: in std_logic_vector(15 downto 0);
    S_AXI_awaddr    : in std_logic_vector(31 downto 0);
	S_AXI_awlen     : in std_logic_vector(7 downto 0);
	S_AXI_awsize    : in std_logic_vector(2 downto 0);
	S_AXI_awburst   : in std_logic_vector(1 downto 0);
	S_AXI_awlock    : in std_logic;
	S_AXI_awcache   : in std_logic_vector(3 downto 0);
	S_AXI_awprot    : in std_logic_vector(2 downto 0);
	S_AXI_awqos     : in std_logic_vector(3 downto 0);
	S_AXI_awvalid   : in std_logic;
	S_AXI_awready   : out std_logic;

	S_AXI_wdata     : in std_logic_vector(127 downto 0);
	S_AXI_wstrb     : in std_logic_vector(15 downto 0);
	S_AXI_wlast     : in std_logic;
	S_AXI_wvalid    : in std_logic;
	S_AXI_wready    : out std_logic;

	S_AXI_bresp     : out std_logic_vector(1 downto 0);
	S_AXI_bvalid    : out std_logic;
	S_AXI_bready    : in std_logic;

	S_AXI_arid  	: in std_logic_vector(15 downto 0);
	S_AXI_araddr    : in std_logic_vector(31 downto 0);
	S_AXI_arlen     : in std_logic_vector(7 downto 0);
	S_AXI_arsize    : in std_logic_vector(2 downto 0);
	S_AXI_arburst   : in std_logic_vector(1 downto 0);
	S_AXI_arlock    : in std_logic;
	S_AXI_arcache   : in std_logic_vector(3 downto 0);
	S_AXI_arprot    : in std_logic_vector(2 downto 0);
	S_AXI_arqos     : in std_logic_vector(3 downto 0);
	S_AXI_arvalid   : in std_logic;
	S_AXI_arready   : out std_logic;

	S_AXI_rdata     : out std_logic_vector(127 downto 0);
	S_AXI_rresp     : out std_logic_vector(1 downto 0);
	S_AXI_rlast     : out std_logic;
	S_AXI_rvalid    : out std_logic;
	S_AXI_rready    : in std_logic;

    -- AXI4 full master
    M_AXI_awid  	: out std_logic_vector(5 downto 0);
	M_AXI_awaddr    : out std_logic_vector(31 downto 0);
	M_AXI_awlen     : out std_logic_vector(7 downto 0);
	M_AXI_awsize    : out std_logic_vector(2 downto 0);
	M_AXI_awburst   : out std_logic_vector(1 downto 0);
	M_AXI_awlock    : out std_logic;
	M_AXI_awcache   : out std_logic_vector(3 downto 0);
	M_AXI_awprot    : out std_logic_vector(2 downto 0);
	M_AXI_awqos     : out std_logic_vector(3 downto 0);
	M_AXI_awvalid   : out std_logic;
	M_AXI_awready   : in std_logic;

	M_AXI_wdata     : out std_logic_vector(127 downto 0);
	M_AXI_wstrb     : out std_logic_vector(15 downto 0);
	M_AXI_wlast     : out std_logic;
	M_AXI_wvalid    : out std_logic;
	M_AXI_wready    : in std_logic;

	M_AXI_bresp     : in std_logic_vector(1 downto 0);
	M_AXI_bvalid    : in std_logic;
	M_AXI_bready    : out std_logic;

	M_AXI_arid  	: out std_logic_vector(5 downto 0);
	M_AXI_araddr    : out std_logic_vector(31 downto 0);
	M_AXI_arlen     : out std_logic_vector(7 downto 0);
	M_AXI_arsize    : out std_logic_vector(2 downto 0);
	M_AXI_arburst   : out std_logic_vector(1 downto 0);
	M_AXI_arlock    : out std_logic;
	M_AXI_arcache   : out std_logic_vector(3 downto 0);
	M_AXI_arprot    : out std_logic_vector(2 downto 0);
	M_AXI_arqos     : out std_logic_vector(3 downto 0);
	M_AXI_arvalid   : out std_logic;
	M_AXI_arready   : in std_logic;

	M_AXI_rdata     : in std_logic_vector(127 downto 0);
	M_AXI_rresp     : in std_logic_vector(1 downto 0);
	M_AXI_rlast     : in std_logic;
	M_AXI_rvalid    : in std_logic;
	M_AXI_rready    : out std_logic
);
end top_axi_full;


architecture Behavioral of top_axi_full is


signal S_AXIL_awaddr : std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
signal S_AXIL_awprot : std_logic_vector(2 downto 0);
signal S_AXIL_awvalid : std_logic;
signal S_AXIL_awready : std_logic;
signal S_AXIL_wdata : std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
signal S_AXIL_wstrb : std_logic_vector(3 downto 0);
signal S_AXIL_wvalid : std_logic;
signal S_AXIL_wready : std_logic;
signal S_AXIL_bresp : std_logic_vector(1 downto 0);
signal S_AXIL_bvalid :  std_logic;
signal S_AXIL_bready : std_logic;
signal S_AXIL_araddr : std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
signal S_AXIL_arprot : std_logic_vector(2 downto 0);
signal S_AXIL_arvalid : std_logic;
signal S_AXIL_arready : std_logic;
signal S_AXIL_rdata : std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
signal S_AXIL_rresp : std_logic_vector(1 downto 0);
signal S_AXIL_rvalid : std_logic;
signal S_AXIL_rready : std_logic;

signal M_AXIL_awaddr : std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
signal M_AXIL_awprot : std_logic_vector(2 downto 0);
signal M_AXIL_awvalid : std_logic;
signal M_AXIL_awready : std_logic;
signal M_AXIL_wdata : std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
signal M_AXIL_wstrb : std_logic_vector(3 downto 0);
signal M_AXIL_wvalid : std_logic;
signal M_AXIL_wready : std_logic;
signal M_AXIL_bresp : std_logic_vector(1 downto 0);
signal M_AXIL_bvalid :  std_logic;
signal M_AXIL_bready : std_logic;
signal M_AXIL_araddr : std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
signal M_AXIL_arprot : std_logic_vector(2 downto 0);
signal M_AXIL_arvalid : std_logic;
signal M_AXIL_arready : std_logic;
signal M_AXIL_rdata : std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
signal M_AXIL_rresp : std_logic_vector(1 downto 0);
signal M_AXIL_rvalid : std_logic;
signal M_AXIL_rready : std_logic;

signal M_AXIL_awaddr_2 : std_logic_vector(31 downto 0);
signal M_AXIL_awprot_2 : std_logic_vector(2 downto 0);
signal M_AXIL_awvalid_2 : std_logic;
signal M_AXIL_awready_2 : std_logic;
signal M_AXIL_wdata_2 : std_logic_vector(127 downto 0);
signal M_AXIL_wstrb_2 : std_logic_vector(15 downto 0);
signal M_AXIL_wvalid_2 : std_logic;
signal M_AXIL_wready_2 : std_logic;
signal M_AXIL_bresp_2 : std_logic_vector(1 downto 0);
signal M_AXIL_bvalid_2 :  std_logic;
signal M_AXIL_bready_2 : std_logic;
signal M_AXIL_araddr_2 : std_logic_vector(31 downto 0);
signal M_AXIL_arprot_2 : std_logic_vector(2 downto 0);
signal M_AXIL_arvalid_2 : std_logic;
signal M_AXIL_arready_2 : std_logic;
signal M_AXIL_rdata_2 : std_logic_vector(127 downto 0);
signal M_AXIL_rresp_2 : std_logic_vector(1 downto 0);
signal M_AXIL_rvalid_2 : std_logic;
signal M_AXIL_rready_2 : std_logic;


begin


axi_axil_adapter_inst : entity work.axi_axil_adapter
generic map (
	ADDR_WIDTH 			=> 32,
	AXI_DATA_WIDTH 		=> 128,
	AXI_ID_WIDTH 		=> 16,
	AXIL_DATA_WIDTH 	=> AXI_DATA_WIDTH
)
port map (
	clk 				=> clk,
	rst 				=> not rst,

	s_axi_awid   		=> S_AXI_awid,
	s_axi_awaddr 		=> S_AXI_awaddr,
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
	s_axi_araddr		=> S_AXI_araddr,
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

	m_axil_awaddr  		=> S_AXIL_awaddr ,
	m_axil_awprot  		=> S_AXIL_awprot ,
	m_axil_awvalid  	=> S_AXIL_awvalid,
	m_axil_awready  	=> S_AXIL_awready,
	m_axil_wdata  		=> S_AXIL_wdata,
	m_axil_wstrb  		=> S_AXIL_wstrb,
	m_axil_wvalid  		=> S_AXIL_wvalid,
	m_axil_wready  		=> S_AXIL_wready,
	m_axil_bresp  		=> S_AXIL_bresp,
	m_axil_bvalid  		=> S_AXIL_bvalid,
	m_axil_bready  		=> S_AXIL_bready,
	m_axil_araddr  		=> S_AXIL_araddr,
	m_axil_arprot  		=> S_AXIL_arprot,
	m_axil_arvalid  	=> S_AXIL_arvalid,
	m_axil_arready  	=> S_AXIL_arready,
	m_axil_rdata  		=> S_AXIL_rdata,
	m_axil_rresp  		=> S_AXIL_rresp,
	m_axil_rvalid  		=> S_AXIL_rvalid,
	m_axil_rready  		=> S_AXIL_rready  
);


axil_adapter_inst : entity work.axil_adapter
generic map (
	ADDR_WIDTH 			=> 32,
	S_DATA_WIDTH 		=> AXI_DATA_WIDTH,
	M_DATA_WIDTH 		=> 128
)
port map (
	clk 				=> clk,
	rst 				=> not rst,

	s_axil_awaddr		=> M_AXIL_awaddr,
	s_axil_awprot		=> M_AXIL_awprot,
	s_axil_awvalid		=> M_AXIL_awvalid,
	s_axil_awready		=> M_AXIL_awready,
	s_axil_wdata		=> M_AXIL_wdata,
	s_axil_wstrb		=> M_AXIL_wstrb,
	s_axil_wvalid		=> M_AXIL_wvalid,
	s_axil_wready		=> M_AXIL_wready,
	s_axil_bresp		=> M_AXIL_bresp,
	s_axil_bvalid		=> M_AXIL_bvalid,
	s_axil_bready		=> M_AXIL_bready,
	s_axil_araddr		=> M_AXIL_araddr,
	s_axil_arprot		=> M_AXIL_arprot,
	s_axil_arvalid		=> M_AXIL_arvalid,
	s_axil_arready		=> M_AXIL_arready,
	s_axil_rdata		=> M_AXIL_rdata,
	s_axil_rresp		=> M_AXIL_rresp,
	s_axil_rvalid		=> M_AXIL_rvalid,
	s_axil_rready		=> M_AXIL_rready,

	m_axil_awaddr		=> M_AXIL_awaddr_2,
	m_axil_awprot		=> M_AXIL_awprot_2,
	m_axil_awvalid		=> M_AXIL_awvalid_2,
	m_axil_awready		=> M_AXIL_awready_2,
	m_axil_wdata		=> M_AXIL_wdata_2,
	m_axil_wstrb		=> M_AXIL_wstrb_2,
	m_axil_wvalid		=> M_AXIL_wvalid_2,
	m_axil_wready		=> M_AXIL_wready_2,
	m_axil_bresp		=> M_AXIL_bresp_2,
	m_axil_bvalid		=> M_AXIL_bvalid_2,
	m_axil_bready		=> M_AXIL_bready_2,
	m_axil_araddr		=> M_AXIL_araddr_2,
	m_axil_arprot		=> M_AXIL_arprot_2,
	m_axil_arvalid		=> M_AXIL_arvalid_2,
	m_axil_arready		=> M_AXIL_arready_2,
	m_axil_rdata		=> M_AXIL_rdata_2,
	m_axil_rresp		=> M_AXIL_rresp_2,
	m_axil_rvalid		=> M_AXIL_rvalid_2,
	m_axil_rready		=> M_AXIL_rready_2
);


top_inst : entity work.top
port map (
    clk             => clk,
    rst             => rst,

    S_AXI_awaddr    => S_AXIL_awaddr,  
    S_AXI_awprot    => S_AXIL_awprot,  
    S_AXI_awvalid   => S_AXIL_awvalid, 
    S_AXI_awready   => S_AXIL_awready, 
    S_AXI_wdata     => S_AXIL_wdata,   
    S_AXI_wstrb     => S_AXIL_wstrb,   
    S_AXI_wvalid    => S_AXIL_wvalid,  
    S_AXI_wready    => S_AXIL_wready,  
    S_AXI_bresp     => S_AXIL_bresp,   
    S_AXI_bvalid    => S_AXIL_bvalid,  
    S_AXI_bready    => S_AXIL_bready,  
    S_AXI_araddr    => S_AXIL_araddr,  
    S_AXI_arprot    => S_AXIL_arprot,  
    S_AXI_arvalid   => S_AXIL_arvalid, 
    S_AXI_arready   => S_AXIL_arready, 
    S_AXI_rdata     => S_AXIL_rdata,   
    S_AXI_rresp     => S_AXIL_rresp,   
    S_AXI_rvalid    => S_AXIL_rvalid,  
    S_AXI_rready    => S_AXIL_rready, 

    M_AXI_awaddr    => M_AXIL_awaddr, 
    M_AXI_awprot    => M_AXIL_awprot, 
    M_AXI_awvalid   => M_AXIL_awvalid,
    M_AXI_awready   => M_AXIL_awready,
    M_AXI_wdata     => M_AXIL_wdata,  
    M_AXI_wstrb     => M_AXIL_wstrb,  
    M_AXI_wvalid    => M_AXIL_wvalid, 
    M_AXI_wready    => M_AXIL_wready, 
    M_AXI_bresp     => M_AXIL_bresp,  
    M_AXI_bvalid    => M_AXIL_bvalid, 
    M_AXI_bready    => M_AXIL_bready, 
    M_AXI_araddr    => M_AXIL_araddr, 
    M_AXI_arprot    => M_AXIL_arprot, 
    M_AXI_arvalid   => M_AXIL_arvalid,
    M_AXI_arready   => M_AXIL_arready,
    M_AXI_rdata     => M_AXIL_rdata,  
    M_AXI_rresp     => M_AXIL_rresp,  
    M_AXI_rvalid    => M_AXIL_rvalid, 
    M_AXI_rready    => M_AXIL_rready 
);


M_AXI_awid 			<= "000000";
M_AXI_awaddr		<= M_AXIL_awaddr_2;
M_AXI_awlen			<= "00000000";
M_AXI_awsize		<= "100";
M_AXI_awburst		<= "01";
M_AXI_awlock		<= '0';
M_AXI_awcache		<= "0000";
M_AXI_awprot		<= M_AXIL_awprot_2;
M_AXI_awqos			<= "0000";
M_AXI_awvalid		<= M_AXIL_awvalid_2;
M_AXIL_awready_2	<= M_AXI_awready;

M_AXI_wdata     	<= M_AXIL_wdata_2;
M_AXI_wstrb     	<= M_AXIL_wstrb_2;
M_AXI_wlast			<= '1';
M_AXI_wvalid		<= M_AXIL_wvalid_2;
M_AXIL_wready_2 	<= M_AXI_wready;

M_AXIL_bresp_2 		<= M_AXI_bresp;
M_AXIL_bvalid_2 	<= M_AXI_bvalid;
M_AXI_bready 		<= M_AXIL_bready_2;

M_AXI_arid 			<= "000000";
M_AXI_araddr		<= M_AXIL_araddr_2;
M_AXI_arlen			<= "00000000";
M_AXI_arsize		<= "100";
M_AXI_arburst		<= "01";
M_AXI_arlock		<= '0';
M_AXI_arcache		<= "0000";
M_AXI_arprot		<= M_AXIL_arprot_2;
M_AXI_arqos			<= "0000";
M_AXI_arvalid		<= M_AXIL_arvalid_2;
M_AXIL_arready_2 	<= M_AXI_arready;

M_AXIL_rdata_2     	<= M_AXI_rdata;
M_AXIL_rresp_2 		<= M_AXI_rresp; 
M_AXIL_rvalid_2 	<= M_AXI_rvalid;
M_AXI_rready		<= M_AXIL_rready_2;


end Behavioral;

