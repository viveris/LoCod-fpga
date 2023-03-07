library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use work.locod_pkg.all;

entity axi_reg_ip is
port (
    -- Clock and reset
    clk             : in std_logic;
    rst             : in std_logic;
    
    -- AXI4 LITE Bus
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

    -- Output registers
    CTRL_REG_OUT    : out std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    CTRL_REG_IN     : in std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    REG_ARRAY_PORT  : out reg_array  
);
end axi_reg_ip;

architecture Behavioral of axi_reg_ip is

signal S_AXI_in : AXI4Lite_m_to_s;
signal S_AXI_out : AXI4Lite_s_to_m;

begin

axi_reg_inst : entity work.axi_reg
port map (
    clk      		=> clk,
    rst   			=> rst,
    S_AXI_in        => S_AXI_in,
    S_AXI_out       => S_AXI_out,
    CTRL_REG_OUT    => CTRL_REG_OUT,
    CTRL_REG_IN     => CTRL_REG_IN,
    REG_ARRAY_PORT  => REG_ARRAY_PORT
);

axi_slave_if : entity work.axi_slave_if
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

end Behavioral;
