LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_Arith.all;
USE ieee.std_logic_Unsigned.all;
use ieee.numeric_std.all;

LIBRARY NX;
USE NX.nxpackage.all;

entity top is
port (
    clk_i                   : in std_logic;
    rstn_i                  : in std_logic;
    led_s_awvalid_o         : out std_logic;
    led_m_awvalid_o         : out std_logic
);
end top;


architecture rtl of top is

constant S_AXI_ADDR_WIDTH       : integer := 40;
constant S_AXI_DATA_WIDTH       : integer := 128;
constant S_AXI_ID_WIDTH         : integer := 12;
constant M_AXI_ADDR_WIDTH       : integer := 40;
constant M_AXI_DATA_WIDTH       : integer := 128;
constant M_AXI_ID_WIDTH         : integer := 5;
constant BASE_ADDRESS           : integer := 268435456;

signal clk_rstn_fpga        : std_logic_vector(1 downto 0) := (others => '0');
signal clk_nic_fabric       : std_logic_vector(18 downto 2) := (others => '0');
signal rstn_nic_fabric      : std_logic_vector(9 downto 0) := (others => '1');

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


Begin

clk_nic_fabric <= (others => clk_i);
rstn_nic_fabric <= (others => rstn_i);

process(clk_i)
begin
    if rising_edge(clk_i) then 
        if (rstn_i = '0') then
            led_s_awvalid_o <= '0';
            led_m_awvalid_o <= '0';
        else
            if (S_AXI_awvalid = '1') then
                led_s_awvalid_o <= '1';
            end if;
            if (M_AXI_awvalid = '1') then
                led_m_awvalid_o <= '1';
            end if;
        end if;
    end if;
end process;

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
    clk_i               => clk_i,
    rstn_i              => rstn_i,

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


i_NX_SOC_INTERFACE_WRAP : NX_SOC_INTERFACE_WRAP
  PORT MAP(
    -- dahlia -> fabric
    fabric_lowskew_o                         => clk_rstn_fpga,
    fabric_lowskew_i                         => clk_nic_fabric,
    fabric_fpga_nic_rstn_i                   => rstn_nic_fabric,
    fabric_fpga_pmrstn_i                     => '1',
    fabric_fpga_sysrstn_i                    => '1',
    fabric_fpga_trigger_in_o                 => OPEN,
    fabric_fpga_trigger_out_i                => (others => '0'),
    fabric_fpga_interrupt_in_i               => OPEN,
    fabric_sysc_hold_on_debug_i              => '0',
    fabric_fpga_events60_i                   => (others => '0'),

    fabric_fpga_araddr_axi_s1_o              => S_AXI_araddr,
    fabric_fpga_arburst_axi_s1_o             => S_AXI_arburst,
    fabric_fpga_arcache_axi_s1_o             => S_AXI_arcache,
    fabric_fpga_arid_axi_s1_o                => S_AXI_arid,
    fabric_fpga_arlen_axi_s1_o               => S_AXI_arlen,
    fabric_fpga_arlock_axi_s1_o              => S_AXI_arlock,
    fabric_fpga_arprot_axi_s1_o              => S_AXI_arprot,
    fabric_fpga_arqos_axi_s1_o               => OPEN,
    fabric_fpga_arregion_axi_s1_o            => OPEN,
    fabric_fpga_arsize_axi_s1_o              => S_AXI_arsize,
    fabric_fpga_arvalid_axi_s1_o             => S_AXI_arvalid,
    fabric_fpga_awaddr_axi_s1_o              => S_AXI_awaddr,
    fabric_fpga_awburst_axi_s1_o             => S_AXI_awburst,
    fabric_fpga_awcache_axi_s1_o             => S_AXI_awcache,
    fabric_fpga_awid_axi_s1_o                => S_AXI_awid,
    fabric_fpga_awlen_axi_s1_o               => S_AXI_awlen,
    fabric_fpga_awlock_axi_s1_o              => S_AXI_awlock,
    fabric_fpga_awprot_axi_s1_o              => S_AXI_awprot,
    fabric_fpga_awqos_axi_s1_o               => OPEN,
    fabric_fpga_awregion_axi_s1_o            => OPEN,
    fabric_fpga_awsize_axi_s1_o              => S_AXI_awsize,
    fabric_fpga_bready_axi_s1_o              => S_AXI_bready,
    fabric_fpga_rready_axi_s1_o              => S_AXI_rready,
    fabric_fpga_wdata_axi_s1_o               => S_AXI_wdata,
    fabric_fpga_wlast_axi_s1_o               => S_AXI_wlast,
    fabric_fpga_wstrb_axi_s1_o               => S_AXI_wstrb,
    fabric_fpga_wvalid_axi_s1_o              => S_AXI_wvalid,
    fabric_fpga_awvalid_axi_s1_o             => S_AXI_awvalid,
    fabric_fpga_arready_axi_s1_i             => S_AXI_arready,
    fabric_fpga_awready_axi_s1_i             => S_AXI_awready,
    fabric_fpga_bid_axi_s1_i                 => S_AXI_bid,
    fabric_fpga_bresp_axi_s1_i               => S_AXI_bresp,
    fabric_fpga_bvalid_axi_s1_i              => S_AXI_bvalid,
    fabric_fpga_rdata_axi_s1_i               => S_AXI_rdata,
    fabric_fpga_rid_axi_s1_i                 => S_AXI_rid,
    fabric_fpga_rlast_axi_s1_i               => S_AXI_rlast,
    fabric_fpga_rresp_axi_s1_i               => S_AXI_rresp,
    fabric_fpga_rvalid_axi_s1_i              => S_AXI_rvalid,
    fabric_fpga_wready_axi_s1_i              => S_AXI_wready,

    fabric_fpga_araddr_axi_s2_o              => OPEN,
    fabric_fpga_arburst_axi_s2_o             => OPEN,
    fabric_fpga_arcache_axi_s2_o             => OPEN,
    fabric_fpga_arid_axi_s2_o                => OPEN,
    fabric_fpga_arlen_axi_s2_o               => OPEN,
    fabric_fpga_arlock_axi_s2_o              => OPEN,
    fabric_fpga_arprot_axi_s2_o              => OPEN,
    fabric_fpga_arqos_axi_s2_o               => OPEN,
    fabric_fpga_arregion_axi_s2_o            => OPEN,
    fabric_fpga_arsize_axi_s2_o              => OPEN,
    fabric_fpga_arvalid_axi_s2_o             => OPEN,
    fabric_fpga_awaddr_axi_s2_o              => OPEN,
    fabric_fpga_awburst_axi_s2_o             => OPEN,
    fabric_fpga_awcache_axi_s2_o             => OPEN,
    fabric_fpga_awid_axi_s2_o                => OPEN,
    fabric_fpga_awlen_axi_s2_o               => OPEN,
    fabric_fpga_awlock_axi_s2_o              => OPEN,
    fabric_fpga_awprot_axi_s2_o              => OPEN,
    fabric_fpga_awqos_axi_s2_o               => OPEN,
    fabric_fpga_awregion_axi_s2_o            => OPEN,
    fabric_fpga_awsize_axi_s2_o              => OPEN,
    fabric_fpga_bready_axi_s2_o              => OPEN,
    fabric_fpga_rready_axi_s2_o              => OPEN,
    fabric_fpga_wdata_axi_s2_o               => OPEN,
    fabric_fpga_wlast_axi_s2_o               => OPEN,
    fabric_fpga_wstrb_axi_s2_o               => OPEN,
    fabric_fpga_wvalid_axi_s2_o              => OPEN,
    fabric_fpga_awvalid_axi_s2_o             => OPEN,
    fabric_fpga_arready_axi_s2_i             => '0',
    fabric_fpga_awready_axi_s2_i             => '0',
    fabric_fpga_bid_axi_s2_i                 => (others => '0'),
    fabric_fpga_bresp_axi_s2_i               => (others => '0'),
    fabric_fpga_bvalid_axi_s2_i              => '0',
    fabric_fpga_rdata_axi_s2_i               => (others => '0'),
    fabric_fpga_rid_axi_s2_i                 => (others => '0'),
    fabric_fpga_rlast_axi_s2_i               => '0',
    fabric_fpga_rresp_axi_s2_i               => (others => '0'),
    fabric_fpga_rvalid_axi_s2_i              => '0',
    fabric_fpga_wready_axi_s2_i              => '0',

    fabric_fpga_arready_axi_m1_o             => M_AXI_arready,
    fabric_fpga_awready_axi_m1_o             => M_AXI_awready,
    fabric_fpga_bid_axi_m1_o                 => M_AXI_bid,
    fabric_fpga_bresp_axi_m1_o               => M_AXI_bresp,
    fabric_fpga_bvalid_axi_m1_o              => M_AXI_bvalid,
    fabric_fpga_dma_ack_m1_o                 => OPEN,
    fabric_fpga_dma_finish_m1_o              => OPEN,
    fabric_fpga_rdata_axi_m1_o               => M_AXI_rdata,
    fabric_fpga_rid_axi_m1_o                 => M_AXI_rid,
    fabric_fpga_rlast_axi_m1_o               => M_AXI_rlast,
    fabric_fpga_rresp_axi_m1_o               => M_AXI_rresp,
    fabric_fpga_rvalid_axi_m1_o              => M_AXI_rvalid,
    fabric_fpga_wready_axi_m1_o              => M_AXI_wready,
    fabric_fpga_araddr_axi_m1_i              => M_AXI_araddr,
    fabric_fpga_arburst_axi_m1_i             => M_AXI_arburst,
    fabric_fpga_arcache_axi_m1_i             => M_AXI_arcache,
    fabric_fpga_arid_axi_m1_i                => M_AXI_arid,
    fabric_fpga_arlen_axi_m1_i               => M_AXI_arlen,
    fabric_fpga_arlock_axi_m1_i              => M_AXI_arlock,
    fabric_fpga_arprot_axi_m1_i              => M_AXI_arprot,
    fabric_fpga_arqos_axi_m1_i               => (others => '0'),
    fabric_fpga_arsize_axi_m1_i              => M_AXI_arsize,
    fabric_fpga_arvalid_axi_m1_i             => M_AXI_arvalid,
    fabric_fpga_awaddr_axi_m1_i              => M_AXI_awaddr,
    fabric_fpga_awburst_axi_m1_i             => M_AXI_awburst,
    fabric_fpga_awcache_axi_m1_i             => M_AXI_awcache,
    fabric_fpga_awid_axi_m1_i                => M_AXI_awid,
    fabric_fpga_awlen_axi_m1_i               => M_AXI_awlen,
    fabric_fpga_awlock_axi_m1_i              => M_AXI_awlock,
    fabric_fpga_awprot_axi_m1_i              => M_AXI_awprot,
    fabric_fpga_awqos_axi_m1_i               => (others => '0'),
    fabric_fpga_awsize_axi_m1_i              => M_AXI_awsize,
    fabric_fpga_awvalid_axi_m1_i             => M_AXI_awvalid,
    fabric_fpga_bready_axi_m1_i              => M_AXI_bready,
    fabric_fpga_dma_last_m1_i                => (others => '0'),
    fabric_fpga_dma_req_m1_i                 => (others => '0'),
    fabric_fpga_dma_single_m1_i              => (others => '0'),
    fabric_fpga_rready_axi_m1_i              => M_AXI_rready,
    fabric_fpga_wdata_axi_m1_i               => M_AXI_wdata,
    fabric_fpga_wlast_axi_m1_i               => M_AXI_wlast,
    fabric_fpga_wstrb_axi_m1_i               => M_AXI_wstrb,
    fabric_fpga_wvalid_axi_m1_i              => M_AXI_wvalid,

    fabric_fpga_arready_axi_m2_o             => OPEN,
    fabric_fpga_awready_axi_m2_o             => OPEN,
    fabric_fpga_bid_axi_m2_o                 => OPEN,
    fabric_fpga_bresp_axi_m2_o               => OPEN,
    fabric_fpga_bvalid_axi_m2_o              => OPEN,
    fabric_fpga_dma_ack_m2_o                 => OPEN,
    fabric_fpga_dma_finish_m2_o              => OPEN,
    fabric_fpga_rdata_axi_m2_o               => OPEN,
    fabric_fpga_rid_axi_m2_o                 => OPEN,
    fabric_fpga_rlast_axi_m2_o               => OPEN,
    fabric_fpga_rresp_axi_m2_o               => OPEN,
    fabric_fpga_rvalid_axi_m2_o              => OPEN,
    fabric_fpga_wready_axi_m2_o              => OPEN,
    fabric_fpga_araddr_axi_m2_i              => (others => '0'),
    fabric_fpga_arburst_axi_m2_i             => (others => '0'),
    fabric_fpga_arcache_axi_m2_i             => (others => '0'),
    fabric_fpga_arid_axi_m2_i                => (others => '0'),
    fabric_fpga_arlen_axi_m2_i               => (others => '0'),
    fabric_fpga_arlock_axi_m2_i              => '0',
    fabric_fpga_arprot_axi_m2_i              => (others => '0'),
    fabric_fpga_arqos_axi_m2_i               => (others => '0'),
    fabric_fpga_arsize_axi_m2_i              => (others => '0'),
    fabric_fpga_arvalid_axi_m2_i             => '0',
    fabric_fpga_awaddr_axi_m2_i              => (others => '0'),
    fabric_fpga_awburst_axi_m2_i             => (others => '0'),
    fabric_fpga_awcache_axi_m2_i             => (others => '0'),
    fabric_fpga_awid_axi_m2_i                => (others => '0'),
    fabric_fpga_awlen_axi_m2_i               => (others => '0'),
    fabric_fpga_awlock_axi_m2_i              => '0',
    fabric_fpga_awprot_axi_m2_i              => (others => '0'),
    fabric_fpga_awqos_axi_m2_i               => (others => '0'),
    fabric_fpga_awsize_axi_m2_i              => (others => '0'),
    fabric_fpga_awvalid_axi_m2_i             => '0',
    fabric_fpga_bready_axi_m2_i              => '0',
    fabric_fpga_dma_last_m2_i                => (others => '0'),
    fabric_fpga_dma_req_m2_i                 => (others => '0'),
    fabric_fpga_dma_single_m2_i              => (others => '0'),
    fabric_fpga_rready_axi_m2_i              => '0',
    fabric_fpga_wdata_axi_m2_i               => (others => '0'),
    fabric_fpga_wlast_axi_m2_i               => '0',
    fabric_fpga_wstrb_axi_m2_i               => (others => '0'),
    fabric_fpga_wvalid_axi_m2_i              => '0',
    
    fabric_fpga_ddr0_arready_o               => OPEN,
    fabric_fpga_ddr0_awready_o               => OPEN,
    fabric_fpga_ddr0_bid_o                   => OPEN,
    fabric_fpga_ddr0_bresp_o                 => OPEN,
    fabric_fpga_ddr0_bvalid_o                => OPEN,
    fabric_fpga_ddr0_rdata_o                 => OPEN,
    fabric_fpga_ddr0_rid_o                   => OPEN,
    fabric_fpga_ddr0_rlast_o                 => OPEN,
    fabric_fpga_ddr0_rresp_o                 => OPEN,
    fabric_fpga_ddr0_rvalid_o                => OPEN,
    fabric_fpga_ddr0_wready_o                => OPEN,
    fabric_fpga_ddr0_araddr_i                => (others => '0'),
    fabric_fpga_ddr0_arburst_i               => (others => '0'),
    fabric_fpga_ddr0_arcache_i               => (others => '0'),
    fabric_fpga_ddr0_arid_i                  => (others => '0'),
    fabric_fpga_ddr0_arlen_i                 => (others => '0'),
    fabric_fpga_ddr0_arlock_i                => '0',
    fabric_fpga_ddr0_arprot_i                => (others => '0'),
    fabric_fpga_ddr0_arqos_i                 => (others => '0'),
    fabric_fpga_ddr0_arsize_i                => (others => '0'),
    fabric_fpga_ddr0_arvalid_i               => '0',
    fabric_fpga_ddr0_awaddr_i                => (others => '0'),
    fabric_fpga_ddr0_awburst_i               => (others => '0'),
    fabric_fpga_ddr0_awcache_i               => (others => '0'),
    fabric_fpga_ddr0_awid_i                  => (others => '0'),
    fabric_fpga_ddr0_awlen_i                 => (others => '0'),
    fabric_fpga_ddr0_awlock_i                => '0',
    fabric_fpga_ddr0_awprot_i                => (others => '0'),
    fabric_fpga_ddr0_awqos_i                 => (others => '0'),
    fabric_fpga_ddr0_awsize_i                => (others => '0'),
    fabric_fpga_ddr0_awvalid_i               => '0',
    fabric_fpga_ddr0_bready_i                => '0',
    fabric_fpga_ddr0_rready_i                => '0',
    fabric_fpga_ddr0_wdata_i                 => (others => '0'),
    fabric_fpga_ddr0_wlast_i                 => '0',
    fabric_fpga_ddr0_wstrb_i                 => (others => '0'),
    fabric_fpga_ddr0_wvalid_i                => '0',
    fabric_fpga_paddr_apb_o                  => OPEN,
    fabric_fpga_penable_apb_o                => OPEN,
    fabric_fpga_psel_apb_o                   => OPEN,
    fabric_fpga_pwdata_apb_o                 => OPEN,
    fabric_fpga_pwrite_apb_o                 => OPEN,
    fabric_fpga_prdata_apb_i                 => (others => '0'),
    fabric_fpga_pready_apb_i                 => '0',
    fabric_fpga_pslverr_apb_i                => '0',
    fabric_llpp0_araddr_s_o                  => OPEN,
    fabric_llpp0_arburst_s_o                 => OPEN,
    fabric_llpp0_arcache_s_o                 => OPEN,
    fabric_llpp0_arid_s_o                    => OPEN,
    fabric_llpp0_arlen_s_o                   => OPEN,
    fabric_llpp0_arlock_s_o                  => OPEN,
    fabric_llpp0_arprot_s_o                  => OPEN,
    fabric_llpp0_arqos_s_o                   => OPEN,
    fabric_llpp0_arsize_s_o                  => OPEN,
    fabric_llpp0_arvalid_s_o                 => OPEN,
    fabric_llpp0_awaddr_s_o                  => OPEN,
    fabric_llpp0_awburst_s_o                 => OPEN,
    fabric_llpp0_awcache_s_o                 => OPEN,
    fabric_llpp0_awid_s_o                    => OPEN,
    fabric_llpp0_awlen_s_o                   => OPEN,
    fabric_llpp0_awlock_s_o                  => OPEN,
    fabric_llpp0_awprot_s_o                  => OPEN,
    fabric_llpp0_awqos_s_o                   => OPEN,
    fabric_llpp0_awsize_s_o                  => OPEN,
    fabric_llpp0_awvalid_s_o                 => OPEN,
    fabric_llpp0_bready_s_o                  => OPEN,
    fabric_llpp0_rready_s_o                  => OPEN,
    fabric_llpp0_wdata_s_o                   => OPEN,
    fabric_llpp0_wlast_s_o                   => OPEN,
    fabric_llpp0_wstrb_s_o                   => OPEN,
    fabric_llpp0_wvalid_s_o                  => OPEN,
    fabric_llpp0_arready_s_i                 => '0',
    fabric_llpp0_awready_s_i                 => '0',
    fabric_llpp0_bid_s_i                     => (others => '0'),
    fabric_llpp0_bresp_s_i                   => (others => '0'),
    fabric_llpp0_bvalid_s_i                  => '0',
    fabric_llpp0_rdata_s_i                   => (others => '0'),
    fabric_llpp0_rid_s_i                     => (others => '0'),
    fabric_llpp0_rlast_s_i                   => '0',
    fabric_llpp0_rresp_s_i                   => (others => '0'),
    fabric_llpp0_rvalid_s_i                  => '0',
    fabric_llpp0_wready_s_i                  => '0',
    fabric_llpp1_araddr_s_o                  => OPEN,
    fabric_llpp1_arburst_s_o                 => OPEN,
    fabric_llpp1_arcache_s_o                 => OPEN,
    fabric_llpp1_arid_s_o                    => OPEN,
    fabric_llpp1_arlen_s_o                   => OPEN,
    fabric_llpp1_arlock_s_o                  => OPEN,
    fabric_llpp1_arprot_s_o                  => OPEN,
    fabric_llpp1_arqos_s_o                   => OPEN,
    fabric_llpp1_arsize_s_o                  => OPEN,
    fabric_llpp1_arvalid_s_o                 => OPEN,
    fabric_llpp1_awaddr_s_o                  => OPEN,
    fabric_llpp1_awburst_s_o                 => OPEN,
    fabric_llpp1_awcache_s_o                 => OPEN,
    fabric_llpp1_awid_s_o                    => OPEN,
    fabric_llpp1_awlen_s_o                   => OPEN,
    fabric_llpp1_awlock_s_o                  => OPEN,
    fabric_llpp1_awprot_s_o                  => OPEN,
    fabric_llpp1_awqos_s_o                   => OPEN,
    fabric_llpp1_awsize_s_o                  => OPEN,
    fabric_llpp1_awvalid_s_o                 => OPEN,
    fabric_llpp1_bready_s_o                  => OPEN,
    fabric_llpp1_rready_s_o                  => OPEN,
    fabric_llpp1_wdata_s_o                   => OPEN,
    fabric_llpp1_wlast_s_o                   => OPEN,
    fabric_llpp1_wstrb_s_o                   => OPEN,
    fabric_llpp1_wvalid_s_o                  => OPEN,
    fabric_llpp1_arready_s_i                 => '0',
    fabric_llpp1_awready_s_i                 => '0',
    fabric_llpp1_bid_s_i                     => (others => '0'),
    fabric_llpp1_bresp_s_i                   => (others => '0'),
    fabric_llpp1_bvalid_s_i                  => '0',
    fabric_llpp1_rdata_s_i                   => (others => '0'),
    fabric_llpp1_rid_s_i                     => (others => '0'),
    fabric_llpp1_rlast_s_i                   => '0',
    fabric_llpp1_rresp_s_i                   => (others => '0'),
    fabric_llpp1_rvalid_s_i                  => '0',
    fabric_llpp1_wready_s_i                  => '0',
    fabric_llpp2_araddr_s_o                  => OPEN,
    fabric_llpp2_arburst_s_o                 => OPEN,
    fabric_llpp2_arcache_s_o                 => OPEN,
    fabric_llpp2_arid_s_o                    => OPEN,
    fabric_llpp2_arlen_s_o                   => OPEN,
    fabric_llpp2_arlock_s_o                  => OPEN,
    fabric_llpp2_arprot_s_o                  => OPEN,
    fabric_llpp2_arqos_s_o                   => OPEN,
    fabric_llpp2_arsize_s_o                  => OPEN,
    fabric_llpp2_arvalid_s_o                 => OPEN,
    fabric_llpp2_awaddr_s_o                  => OPEN,
    fabric_llpp2_awburst_s_o                 => OPEN,
    fabric_llpp2_awcache_s_o                 => OPEN,
    fabric_llpp2_awid_s_o                    => OPEN,
    fabric_llpp2_awlen_s_o                   => OPEN,
    fabric_llpp2_awlock_s_o                  => OPEN,
    fabric_llpp2_awprot_s_o                  => OPEN,
    fabric_llpp2_awqos_s_o                   => OPEN,
    fabric_llpp2_awsize_s_o                  => OPEN,
    fabric_llpp2_awvalid_s_o                 => OPEN,
    fabric_llpp2_bready_s_o                  => OPEN,
    fabric_llpp2_rready_s_o                  => OPEN,
    fabric_llpp2_wdata_s_o                   => OPEN,
    fabric_llpp2_wlast_s_o                   => OPEN,
    fabric_llpp2_wstrb_s_o                   => OPEN,
    fabric_llpp2_wvalid_s_o                  => OPEN,
    fabric_llpp2_arready_s_i                 => '0',
    fabric_llpp2_awready_s_i                 => '0',
    fabric_llpp2_bid_s_i                     => (others => '0'),
    fabric_llpp2_bresp_s_i                   => (others => '0'),
    fabric_llpp2_bvalid_s_i                  => '0',
    fabric_llpp2_rdata_s_i                   => (others => '0'),
    fabric_llpp2_rid_s_i                     => (others => '0'),
    fabric_llpp2_rlast_s_i                   => '0',
    fabric_llpp2_rresp_s_i                   => (others => '0'),
    fabric_llpp2_rvalid_s_i                  => '0',
    fabric_llpp2_wready_s_i                  => '0',
    fabric_llpp3_araddr_s_o                  => OPEN,
    fabric_llpp3_arburst_s_o                 => OPEN,
    fabric_llpp3_arcache_s_o                 => OPEN,
    fabric_llpp3_arid_s_o                    => OPEN,
    fabric_llpp3_arlen_s_o                   => OPEN,
    fabric_llpp3_arlock_s_o                  => OPEN,
    fabric_llpp3_arprot_s_o                  => OPEN,
    fabric_llpp3_arqos_s_o                   => OPEN,
    fabric_llpp3_arsize_s_o                  => OPEN,
    fabric_llpp3_arvalid_s_o                 => OPEN,
    fabric_llpp3_awaddr_s_o                  => OPEN,
    fabric_llpp3_awburst_s_o                 => OPEN,
    fabric_llpp3_awcache_s_o                 => OPEN,
    fabric_llpp3_awid_s_o                    => OPEN,
    fabric_llpp3_awlen_s_o                   => OPEN,
    fabric_llpp3_awlock_s_o                  => OPEN,
    fabric_llpp3_awprot_s_o                  => OPEN,
    fabric_llpp3_awqos_s_o                   => OPEN,
    fabric_llpp3_awsize_s_o                  => OPEN,
    fabric_llpp3_awvalid_s_o                 => OPEN,
    fabric_llpp3_bready_s_o                  => OPEN,
    fabric_llpp3_rready_s_o                  => OPEN,
    fabric_llpp3_wdata_s_o                   => OPEN,
    fabric_llpp3_wlast_s_o                   => OPEN,
    fabric_llpp3_wstrb_s_o                   => OPEN,
    fabric_llpp3_wvalid_s_o                  => OPEN,
    fabric_llpp3_arready_s_i                 => '0',
    fabric_llpp3_awready_s_i                 => '0',
    fabric_llpp3_bid_s_i                     => (others => '0'),
    fabric_llpp3_bresp_s_i                   => (others => '0'),
    fabric_llpp3_bvalid_s_i                  => '0',
    fabric_llpp3_rdata_s_i                   => (others => '0'),
    fabric_llpp3_rid_s_i                     => (others => '0'),
    fabric_llpp3_rlast_s_i                   => '0',
    fabric_llpp3_rresp_s_i                   => (others => '0'),
    fabric_llpp3_rvalid_s_i                  => '0',
    fabric_llpp3_wready_s_i                  => '0',
    fabric_qos_pprdata_o                     => OPEN,
    fabric_qos_ppready_o                     => OPEN,
    fabric_qos_ppslverr_o                    => OPEN,
    fabric_qos_ppaddr_i                      => (others => '0'),
    fabric_qos_ppenable_i                    => '0',
    fabric_qos_ppwdata_i                     => (others => '0'),
    fabric_qos_ppwrite_i                     => '0',
    fabric_qos_presetn_i                     => '0',
    fabric_qos_psel_i                        => '0',
    fabric_tnd_hssl_flushin_o                => OPEN,
    fabric_tnd_hssl_trigin_o                 => OPEN,
    fabric_tnd_fpga_apb_master_paddr_o       => OPEN,
    fabric_tnd_fpga_apb_master_penable_o     => OPEN,
    fabric_tnd_fpga_apb_master_psel_o        => OPEN,
    fabric_tnd_fpga_apb_master_pwdata_o      => OPEN,
    fabric_tnd_fpga_apb_master_pwrite_o      => OPEN,
    fabric_tnd_fpga_atb_master_afvalid_o     => OPEN,
    fabric_tnd_fpga_atb_master_atready_o     => OPEN,
    fabric_tnd_fpga_atb_master_syncreq_o     => OPEN,
    fabric_tnd_hssl_apb_master_paddr_o       => OPEN,
    fabric_tnd_hssl_apb_master_penable_o     => OPEN,
    fabric_tnd_hssl_apb_master_psel_o        => OPEN,
    fabric_tnd_hssl_apb_master_pwdata_o      => OPEN,
    fabric_tnd_hssl_apb_master_pwrite_o      => OPEN,
    fabric_tnd_hssl_atb_master_afready_o     => OPEN,
    fabric_tnd_hssl_atb_master_atbytes_o     => OPEN,
    fabric_tnd_hssl_atb_master_atdata_o      => OPEN,
    fabric_tnd_hssl_atb_master_atid_o        => OPEN,
    fabric_tnd_hssl_atb_master_atvalid_o     => OPEN,
    fabric_tnd_trace_clk_traceoutportintf_o  => OPEN,
    fabric_tnd_trace_ctl_traceoutportintf_o  => OPEN,
    fabric_tnd_trace_data_traceoutportintf_o => OPEN,
    fabric_tsvalue_tsgen_fpga_o              => OPEN,
    fabric_tnd_fpga_apb_master_prdata_i      => (others => '0'),
    fabric_tnd_fpga_apb_master_pready_i      => '0',
    fabric_tnd_fpga_apb_master_pslverr_i     => '0',
    fabric_tnd_fpga_atb_master_afready_i     => '0',
    fabric_tnd_fpga_atb_master_atbytes_i     => (others => '0'),
    fabric_tnd_fpga_atb_master_atdata_i      => (others => '0'),
    fabric_tnd_fpga_atb_master_atid_i        => (others => '0'),
    fabric_tnd_fpga_atb_master_atvalid_i     => '0',
    fabric_tnd_hssl_apb_master_prdata_i      => (others => '0'),
    fabric_tnd_hssl_apb_master_pready_i      => '0',
    fabric_tnd_hssl_apb_master_pslverr_i     => '0',
    fabric_tnd_hssl_atb_master_afvalid_i     => '0',
    fabric_tnd_hssl_atb_master_atready_i     => '0',
    fabric_tnd_hssl_atb_master_syncreq_i     => '0',
    fabric_watchdog0_signal_0_o              => OPEN,
    fabric_watchdog0_signal_1_o              => OPEN,
    fabric_watchdog1_signal_0_o              => OPEN,
    fabric_watchdog1_signal_1_o              => OPEN,
    fabric_watchdog2_signal_0_o              => OPEN,
    fabric_watchdog2_signal_1_o              => OPEN,
    fabric_watchdog3_signal_0_o              => OPEN,
    fabric_watchdog3_signal_1_o              => OPEN,
    fabric_tst_pll_lock_o                    => OPEN,
    fabric_soc_mon_sensor_alarm_o            => OPEN,
    fabric_erom_fpga_cpu0_dbgen_i            => '0',
    fabric_erom_fpga_cpu0_hiden_i            => '0',
    fabric_erom_fpga_cpu0_hniden_i           => '0',
    fabric_erom_fpga_cpu0_niden_i            => '0',
    fabric_erom_fpga_cpu1_dbgen_i            => '0',
    fabric_erom_fpga_cpu1_hiden_i            => '0',
    fabric_erom_fpga_cpu1_hniden_i           => '0',
    fabric_erom_fpga_cpu1_niden_i            => '0',
    fabric_erom_fpga_cpu2_dbgen_i            => '0',
    fabric_erom_fpga_cpu2_hiden_i            => '0',
    fabric_erom_fpga_cpu2_hniden_i           => '0',
    fabric_erom_fpga_cpu2_niden_i            => '0',
    fabric_erom_fpga_cpu3_dbgen_i            => '0',
    fabric_erom_fpga_cpu3_hiden_i            => '0',
    fabric_erom_fpga_cpu3_hniden_i           => '0',
    fabric_erom_fpga_cpu3_niden_i            => '0',
    fabric_erom_fpga_cs_dbgen_i              => '0',
    fabric_erom_fpga_cs_niden_i              => '0',
    fabric_erom_fpga_cs_deviceen_i           => '0',
    fabric_erom_fpga_cs_rst_n_i              => '0',
    fabric_erom_fpga_debug_en_i              => '0',
    fabric_enable_TMR_i                      => (others => '1')
  );


end rtl;
