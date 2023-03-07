library ieee;
use ieee.std_logic_1164.all;

use work.locod_pkg.all;

entity axi_master_if is
port (
	-- AXI4 LITE signals
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
    M_AXI_rready 	: out std_logic;

    -- Defined types AXI4 LITE signals to be converted
    M_AXI_out       : in AXI4Lite_m_to_s;
    M_AXI_in        : out AXI4Lite_s_to_m
);
end axi_master_if;

architecture Behavioral of axi_master_if is

begin

M_AXI_awaddr 		<= M_AXI_out.awaddr;
M_AXI_awprot 		<= M_AXI_out.awprot;
M_AXI_awvalid 		<= M_AXI_out.awvalid;
M_AXI_in.awready 	<= M_AXI_awready;
M_AXI_wdata 		<= M_AXI_out.wdata;
M_AXI_wstrb 		<= M_AXI_out.wstrb;
M_AXI_wvalid 		<= M_AXI_out.wvalid;	
M_AXI_in.wready 	<= M_AXI_wready;
M_AXI_in.bresp 		<= M_AXI_bresp;
M_AXI_in.bvalid 	<= M_AXI_bvalid;
M_AXI_bready 		<= M_AXI_out.bready;
M_AXI_araddr 		<= M_AXI_out.araddr;
M_AXI_arprot 		<= M_AXI_out.arprot;
M_AXI_arvalid 		<= M_AXI_out.arvalid;
M_AXI_in.arready 	<= M_AXI_arready;
M_AXI_in.rdata 		<= M_AXI_rdata;
M_AXI_in.rresp 		<= M_AXI_rresp;
M_AXI_in.rvalid 	<= M_AXI_rvalid;
M_AXI_rready 		<= M_AXI_out.rready;

end Behavioral;