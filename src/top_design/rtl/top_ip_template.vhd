library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use work.locod_pkg.all;


entity top_ip is
port(
	-- Clock and reset
    clk             : in std_logic;
    rst             : in std_logic;
    -- AXI Slave Control
    S_AXI_awaddr    : in std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
    S_AXI_awprot    : in std_logic_vector(2 downto 0);
    S_AXI_awvalid   : in std_logic;
    S_AXI_awready   : out std_logic;
    S_AXI_wdata 	: in std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    S_AXI_wstrb 	: in std_logic_vector(3 downto 0);
    S_AXI_wvalid    : in std_logic;
    S_AXI_wready    : out std_logic;
    S_AXI_bresp 	: out std_logic_vector(1 downto 0);
    S_AXI_bvalid    : out std_logic;
    S_AXI_bready    : in std_logic;
    S_AXI_araddr    : in std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
    S_AXI_arprot    : in std_logic_vector(2 downto 0);
    S_AXI_arvalid   : in std_logic;
    S_AXI_arready   : out std_logic;
    S_AXI_rdata 	: out std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    S_AXI_rresp 	: out std_logic_vector(1 downto 0);
    S_AXI_rvalid    : out std_logic;
    S_AXI_rready    : in std_logic;
    -- AXI Master
    M_AXI_awaddr 	: out std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
    M_AXI_awprot 	: out std_logic_vector(2 downto 0);
    M_AXI_awvalid   : out std_logic;
    M_AXI_awready   : in std_logic;  
    M_AXI_wdata 	: out std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    M_AXI_wstrb 	: out std_logic_vector(3 downto 0);
    M_AXI_wvalid 	: out std_logic;
    M_AXI_wready 	: in std_logic;  
    M_AXI_bresp 	: in std_logic_vector(1 downto 0);
    M_AXI_bvalid 	: in std_logic;
    M_AXI_bready 	: out std_logic;  
    M_AXI_araddr 	: out std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
    M_AXI_arprot 	: out std_logic_vector(2 downto 0);
    M_AXI_arvalid   : out std_logic;
    M_AXI_arready   : in std_logic;   
    M_AXI_rdata 	: in std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    M_AXI_rresp 	: in std_logic_vector(1 downto 0);
    M_AXI_rvalid 	: in std_logic;
    M_AXI_rready 	: out std_logic
);

end top_ip;


architecture Behavioral of top_ip is


signal S_AXI_in : AXI4Lite_m_to_s;
signal S_AXI_out : AXI4Lite_s_to_m;
signal M_AXI_out : AXI4Lite_m_to_s;
signal M_AXI_in : AXI4Lite_s_to_m;	


begin

top_inst : entity work.top
port map(
    clk 				=> clk,
    rst 				=> rst,
    S_AXI_in 			=> S_AXI_in,
    S_AXI_out 			=> S_AXI_out,
    M_AXI_out 	        => M_AXI_out,
    M_AXI_in 		    => M_AXI_in
);

axi_slave_if_inst : entity work.axi_slave_if
port map (
    S_AXI_awaddr 	=> S_AXI_awaddr, 	
    S_AXI_awprot 	=> S_AXI_awprot, 	
    S_AXI_awvalid   => S_AXI_awvalid,  
    S_AXI_awready   => S_AXI_awready,  
    S_AXI_wdata 	=> S_AXI_wdata, 	
    S_AXI_wstrb 	=> S_AXI_wstrb, 	
    S_AXI_wvalid 	=> S_AXI_wvalid, 	
    S_AXI_wready 	=> S_AXI_wready, 	
    S_AXI_bresp 	=> S_AXI_bresp, 	
    S_AXI_bvalid 	=> S_AXI_bvalid, 	
    S_AXI_bready 	=> S_AXI_bready, 	
    S_AXI_araddr 	=> S_AXI_araddr, 	
    S_AXI_arprot 	=> S_AXI_arprot, 	
    S_AXI_arvalid   => S_AXI_arvalid,  
    S_AXI_arready   => S_AXI_arready,  
    S_AXI_rdata 	=> S_AXI_rdata, 	
    S_AXI_rresp 	=> S_AXI_rresp, 	
    S_AXI_rvalid 	=> S_AXI_rvalid, 	
    S_AXI_rready 	=> S_AXI_rready, 	
	S_AXI_in        => S_AXI_in,       
    S_AXI_out       => S_AXI_out      
);

axi_master_if_inst : entity work.axi_master_if
port map (
	M_AXI_awaddr 	=> M_AXI_awaddr,
    M_AXI_awprot 	=> M_AXI_awprot,
    M_AXI_awvalid   => M_AXI_awvalid,
    M_AXI_awready   => M_AXI_awready,
    M_AXI_wdata 	=> M_AXI_wdata,
    M_AXI_wstrb 	=> M_AXI_wstrb,
    M_AXI_wvalid 	=> M_AXI_wvalid,
    M_AXI_wready 	=> M_AXI_wready,
    M_AXI_bresp 	=> M_AXI_bresp,
    M_AXI_bvalid 	=> M_AXI_bvalid,
    M_AXI_bready 	=> M_AXI_bready,
    M_AXI_araddr 	=> M_AXI_araddr,
    M_AXI_arprot 	=> M_AXI_arprot,
    M_AXI_arvalid   => M_AXI_arvalid,
    M_AXI_arready   => M_AXI_arready,
    M_AXI_rdata 	=> M_AXI_rdata,
    M_AXI_rresp 	=> M_AXI_rresp,
    M_AXI_rvalid 	=> M_AXI_rvalid,
    M_AXI_rready 	=> M_AXI_rready,
    M_AXI_out       => M_AXI_out,
    M_AXI_in        => M_AXI_in
);

end Behavioral;
