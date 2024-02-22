library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.locod_pkg.all;

entity axil_axi_adapter is
generic (
    ADDR_WIDTH 			: integer := 32;
    AXIL_DATA_WIDTH 	: integer := 32;
    AXIL_STRB_WIDTH 	: integer := 4;
    AXI_DATA_WIDTH 		: integer := 128;
    AXI_STRB_WIDTH 		: integer := 16;
    AXI_ID_WIDTH 		: integer := 12
);
port (
    -- Clock and reset
    clk_i      			: in std_logic;
    rstn_i   			: in std_logic;
    
    -- AXI4 LITE Slave
    S_AXIL_awaddr_i     : in std_logic_vector(ADDR_WIDTH-1 downto 0);
    S_AXIL_awprot_i     : in std_logic_vector(2 downto 0);
    S_AXIL_awvalid_i    : in std_logic;
    S_AXIL_awready_o    : out std_logic;
    S_AXIL_wdata_i      : in std_logic_vector(AXIL_DATA_WIDTH-1 downto 0);
    S_AXIL_wstrb_i      : in std_logic_vector((AXIL_DATA_WIDTH/8)-1 downto 0);
    S_AXIL_wvalid_i     : in std_logic;
    S_AXIL_wready_o     : out std_logic;
    S_AXIL_bresp_o      : out std_logic_vector(1 downto 0);
    S_AXIL_bvalid_o     : out std_logic;
    S_AXIL_bready_i     : in std_logic;
    S_AXIL_araddr_i     : in std_logic_vector(ADDR_WIDTH-1 downto 0);
    S_AXIL_arprot_i     : in std_logic_vector(2 downto 0);
    S_AXIL_arvalid_i    : in std_logic;
    S_AXIL_arready_o    : out std_logic;
    S_AXIL_rdata_o      : out std_logic_vector(AXIL_DATA_WIDTH-1 downto 0);
    S_AXIL_rresp_o      : out std_logic_vector(1 downto 0);
    S_AXIL_rvalid_o     : out std_logic;
    S_AXIL_rready_i     : in std_logic;

    -- AXI4 FULL Master
    M_AXI_awid_o  	    : out std_logic_vector(AXI_ID_WIDTH-1 downto 0);
	M_AXI_awaddr_o      : out std_logic_vector(ADDR_WIDTH-1 downto 0);
	M_AXI_awlen_o       : out std_logic_vector(7 downto 0);
	M_AXI_awsize_o      : out std_logic_vector(2 downto 0);
	M_AXI_awburst_o     : out std_logic_vector(1 downto 0);
	M_AXI_awlock_o      : out std_logic;
	M_AXI_awcache_o     : out std_logic_vector(3 downto 0);
	M_AXI_awprot_o      : out std_logic_vector(2 downto 0);
	M_AXI_awqos_o       : out std_logic_vector(3 downto 0);
	M_AXI_awvalid_o     : out std_logic;
	M_AXI_awready_i     : in std_logic;

	M_AXI_wdata_o       : out std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
	M_AXI_wstrb_o       : out std_logic_vector((AXI_DATA_WIDTH/8)-1 downto 0);
	M_AXI_wlast_o       : out std_logic;
	M_AXI_wvalid_o      : out std_logic;
	M_AXI_wready_i      : in std_logic;

	M_AXI_bid_i 		: in std_logic_vector(AXI_ID_WIDTH-1 downto 0);
	M_AXI_bresp_i       : in std_logic_vector(1 downto 0);
	M_AXI_bvalid_i      : in std_logic;
	M_AXI_bready_o      : out std_logic;

	M_AXI_arid_o  	    : out std_logic_vector(AXI_ID_WIDTH-1 downto 0);
	M_AXI_araddr_o      : out std_logic_vector(ADDR_WIDTH-1 downto 0);
	M_AXI_arlen_o       : out std_logic_vector(7 downto 0);
	M_AXI_arsize_o      : out std_logic_vector(2 downto 0);
	M_AXI_arburst_o     : out std_logic_vector(1 downto 0);
	M_AXI_arlock_o      : out std_logic;
	M_AXI_arcache_o     : out std_logic_vector(3 downto 0);
	M_AXI_arprot_o      : out std_logic_vector(2 downto 0);
	M_AXI_arqos_o       : out std_logic_vector(3 downto 0);
	M_AXI_arvalid_o     : out std_logic;
	M_AXI_arready_i     : in std_logic;

	M_AXI_rid_i 		: in std_logic_vector(AXI_ID_WIDTH-1 downto 0);
	M_AXI_rdata_i       : in std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
	M_AXI_rresp_i       : in std_logic_vector(1 downto 0);
	M_AXI_rlast_i       : in std_logic;
	M_AXI_rvalid_i      : in std_logic;
	M_AXI_rready_o      : out std_logic
);
end axil_axi_adapter;

architecture Behavioral of axil_axi_adapter is

-- Master AXI Lite signals between AXIL Adapter and output logic conversion
signal M_AXIL_awaddr : std_logic_vector(ADDR_WIDTH-1 downto 0);
signal M_AXIL_awprot : std_logic_vector(2 downto 0);
signal M_AXIL_awvalid : std_logic;
signal M_AXIL_awready : std_logic;
signal M_AXIL_wdata : std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
signal M_AXIL_wstrb : std_logic_vector((AXI_DATA_WIDTH/8)-1 downto 0);
signal M_AXIL_wvalid : std_logic;
signal M_AXIL_wready : std_logic;
signal M_AXIL_bresp : std_logic_vector(1 downto 0);
signal M_AXIL_bvalid :  std_logic;
signal M_AXIL_bready : std_logic;
signal M_AXIL_araddr : std_logic_vector(ADDR_WIDTH-1 downto 0);
signal M_AXIL_arprot : std_logic_vector(2 downto 0);
signal M_AXIL_arvalid : std_logic;
signal M_AXIL_arready : std_logic;
signal M_AXIL_rdata : std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
signal M_AXIL_rresp : std_logic_vector(1 downto 0);
signal M_AXIL_rvalid : std_logic;
signal M_AXIL_rready : std_logic;


begin

axil_adapter_inst : entity work.axil_adapter
generic map (
	ADDR_WIDTH 			=> ADDR_WIDTH,
	S_DATA_WIDTH 		=> AXIL_DATA_WIDTH,
	M_DATA_WIDTH 		=> AXI_DATA_WIDTH
)
port map (
	clk 				=> clk_i,
	rst 				=> not rstn_i,

	s_axil_awaddr		=> S_AXIL_awaddr_i,
	s_axil_awprot		=> S_AXIL_awprot_i,
	s_axil_awvalid		=> S_AXIL_awvalid_i,
	s_axil_awready		=> S_AXIL_awready_o,
	s_axil_wdata		=> S_AXIL_wdata_i,
	s_axil_wstrb		=> S_AXIL_wstrb_i,
	s_axil_wvalid		=> S_AXIL_wvalid_i,
	s_axil_wready		=> S_AXIL_wready_o,
	s_axil_bresp		=> S_AXIL_bresp_o,
	s_axil_bvalid		=> S_AXIL_bvalid_o,
	s_axil_bready		=> S_AXIL_bready_i,
	s_axil_araddr		=> S_AXIL_araddr_i,
	s_axil_arprot		=> S_AXIL_arprot_i,
	s_axil_arvalid		=> S_AXIL_arvalid_i,
	s_axil_arready		=> S_AXIL_arready_o,
	s_axil_rdata		=> S_AXIL_rdata_o,
	s_axil_rresp		=> S_AXIL_rresp_o,
	s_axil_rvalid		=> S_AXIL_rvalid_o,
	s_axil_rready		=> S_AXIL_rready_i,

	m_axil_awaddr		=> M_AXIL_awaddr,
	m_axil_awprot		=> M_AXIL_awprot,
	m_axil_awvalid		=> M_AXIL_awvalid,
	m_axil_awready		=> M_AXIL_awready,
	m_axil_wdata		=> M_AXIL_wdata,
	m_axil_wstrb		=> M_AXIL_wstrb,
	m_axil_wvalid		=> M_AXIL_wvalid,
	m_axil_wready		=> M_AXIL_wready,
	m_axil_bresp		=> M_AXIL_bresp,
	m_axil_bvalid		=> M_AXIL_bvalid,
	m_axil_bready		=> M_AXIL_bready,
	m_axil_araddr		=> M_AXIL_araddr,
	m_axil_arprot		=> M_AXIL_arprot,
	m_axil_arvalid		=> M_AXIL_arvalid,
	m_axil_arready		=> M_AXIL_arready,
	m_axil_rdata		=> M_AXIL_rdata,
	m_axil_rresp		=> M_AXIL_rresp,
	m_axil_rvalid		=> M_AXIL_rvalid,
	m_axil_rready		=> M_AXIL_rready
);

M_AXI_awid_o 		<= (others => '0');
M_AXI_awaddr_o		<= M_AXIL_awaddr;
M_AXI_awlen_o		<= "00000000";
M_AXI_awsize_o		<= "100";
M_AXI_awburst_o		<= "01";
M_AXI_awlock_o		<= '0';
M_AXI_awcache_o		<= "0000";
M_AXI_awprot_o		<= M_AXIL_awprot;
M_AXI_awqos_o		<= "0000";
M_AXI_awvalid_o		<= M_AXIL_awvalid;
M_AXIL_awready	    <= M_AXI_awready_i;

M_AXI_wdata_o     	<= M_AXIL_wdata;
M_AXI_wstrb_o     	<= M_AXIL_wstrb;
M_AXI_wlast_o		<= '1';
M_AXI_wvalid_o		<= M_AXIL_wvalid;
M_AXIL_wready 	    <= M_AXI_wready_i;

M_AXIL_bresp 		<= M_AXI_bresp_i;
M_AXIL_bvalid 	    <= M_AXI_bvalid_i;
M_AXI_bready_o 		<= M_AXIL_bready;

M_AXI_arid_o 		<= (others => '0');
M_AXI_araddr_o		<= M_AXIL_araddr;
M_AXI_arlen_o		<= "00000000";
M_AXI_arsize_o		<= "100";
M_AXI_arburst_o		<= "01";
M_AXI_arlock_o		<= '0';
M_AXI_arcache_o		<= "0000";
M_AXI_arprot_o		<= M_AXIL_arprot;
M_AXI_arqos_o		<= "0000";
M_AXI_arvalid_o		<= M_AXIL_arvalid;
M_AXIL_arready 	    <= M_AXI_arready_i;

M_AXIL_rdata     	<= M_AXI_rdata_i;
M_AXIL_rresp 		<= M_AXI_rresp_i; 
M_AXIL_rvalid 	    <= M_AXI_rvalid_i;
M_AXI_rready_o		<= M_AXIL_rready;

end Behavioral;