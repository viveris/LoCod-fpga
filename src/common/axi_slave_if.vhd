library ieee;
use ieee.std_logic_1164.all;

use work.locod_pkg.all;

entity axi_slave_if is
port (
	-- AXI4 LITE signals
    S_AXI_awaddr 	: in std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
    S_AXI_awprot 	: in std_logic_vector(2 downto 0);
    S_AXI_awvalid   : in std_logic;
    S_AXI_awready   : out std_logic;  
    S_AXI_wdata 	: in std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    S_AXI_wstrb 	: in std_logic_vector(3 downto 0);
    S_AXI_wvalid 	: in std_logic;
    S_AXI_wready 	: out std_logic;  
    S_AXI_bresp 	: out std_logic_vector(1 downto 0);
    S_AXI_bvalid 	: out std_logic;
    S_AXI_bready 	: in std_logic;  
    S_AXI_araddr 	: in std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
    S_AXI_arprot 	: in std_logic_vector(2 downto 0);
    S_AXI_arvalid   : in std_logic;
    S_AXI_arready   : out std_logic;   
    S_AXI_rdata 	: out std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    S_AXI_rresp 	: out std_logic_vector(1 downto 0);
    S_AXI_rvalid 	: out std_logic;
    S_AXI_rready 	: in std_logic;

    -- Defined types AXI4 LITE signals to be converted
	S_AXI_in        : out AXI4Lite_m_to_s;
    S_AXI_out       : in AXI4Lite_s_to_m 
);
end axi_slave_if;

architecture Behavioral of axi_slave_if is

begin

S_AXI_in.awaddr 	<= S_AXI_awaddr;
S_AXI_in.awprot 	<= S_AXI_awprot;
S_AXI_in.awvalid 	<= S_AXI_awvalid;
S_AXI_awready 		<= S_AXI_out.awready;
S_AXI_in.wdata 		<= S_AXI_wdata;
S_AXI_in.wstrb 		<= S_AXI_wstrb;
S_AXI_in.wvalid 	<= S_AXI_wvalid;	
S_AXI_wready 		<= S_AXI_out.wready;
S_AXI_bresp 		<= S_AXI_out.bresp;
S_AXI_bvalid 		<= S_AXI_out.bvalid;
S_AXI_in.bready 	<= S_AXI_bready;
S_AXI_in.araddr 	<= S_AXI_araddr;
S_AXI_in.arprot 	<= S_AXI_arprot;
S_AXI_in.arvalid 	<= S_AXI_arvalid;
S_AXI_arready 		<= S_AXI_out.arready;
S_AXI_rdata 		<= S_AXI_out.rdata;
S_AXI_rresp 		<= S_AXI_out.rresp;
S_AXI_rvalid 		<= S_AXI_out.rvalid;
S_AXI_in.rready 	<= S_AXI_rready;

end Behavioral;