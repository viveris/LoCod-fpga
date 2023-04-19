library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

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
    S_AXI_wdata     : in std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    S_AXI_wstrb     : in std_logic_vector(3 downto 0);
    S_AXI_wvalid    : in std_logic;
    S_AXI_wready    : out std_logic;
    S_AXI_bresp     : out std_logic_vector(1 downto 0);
    S_AXI_bvalid    : out std_logic;
    S_AXI_bready    : in std_logic;
    S_AXI_araddr    : in std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
    S_AXI_arprot    : in std_logic_vector(2 downto 0);
    S_AXI_arvalid   : in std_logic;
    S_AXI_arready   : out std_logic;
    S_AXI_rdata     : out std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    S_AXI_rresp     : out std_logic_vector(1 downto 0);
    S_AXI_rvalid    : out std_logic;
    S_AXI_rready    : in std_logic;

    -- Registers
    REG0            : in std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    REG1            : out std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    REG2            : in std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    REG3            : out std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    REG4            : in std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    REG5            : out std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    REG6            : in std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    REG7            : out std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    REG8            : in std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    REG9            : out std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    REG10           : in std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    REG11           : out std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    REG12           : in std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    REG13           : out std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    REG14           : in std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    REG15           : out std_logic_vector(AXI_DATA_WIDTH-1 downto 0)
);
end axi_reg_ip;

architecture Behavioral of axi_reg_ip is

constant NB_REGISTERS   : integer := 16;
constant TRI_STATE      : std_logic_vector(NB_REGISTERS-1 downto 0) := "0101010101010101";

signal S_AXI_in         : AXI4Lite_m_to_s;
signal S_AXI_out        : AXI4Lite_s_to_m;
signal registers        : reg_array(0 to NB_REGISTERS-1);

begin

registers(0) <= REG0;
REG1 <= registers(1);
registers(2) <= REG2;
REG3 <= registers(3);
registers(4) <= REG4;
REG5 <= registers(5);
registers(6) <= REG6;
REG7 <= registers(7);
registers(8) <= REG8;
REG9 <= registers(9);
registers(10) <= REG10;
REG11 <= registers(11);
registers(12) <= REG12;
REG13 <= registers(13);
registers(14) <= REG14;
REG15 <= registers(15);


axi_reg_inst : entity work.axi_reg
generic map (
    NB_REGISTERS    => NB_REGISTERS
)
port map (
    clk             => clk,
    rst             => rst,
    S_AXI_in        => S_AXI_in,
    S_AXI_out       => S_AXI_out,
    TRI_STATE       => TRI_STATE,
    REG_ARRAY_PORT  => registers
);


axi_slave_if : entity work.axi_slave_if
port map (
    S_AXI_awaddr    => S_AXI_awaddr,
    S_AXI_awprot    => S_AXI_awprot,
    S_AXI_awvalid   => S_AXI_awvalid,
    S_AXI_awready   => S_AXI_awready,
    S_AXI_wdata     => S_AXI_wdata,
    S_AXI_wstrb     => S_AXI_wstrb,
    S_AXI_wvalid    => S_AXI_wvalid,
    S_AXI_wready    => S_AXI_wready,
    S_AXI_bresp     => S_AXI_bresp,
    S_AXI_bvalid    => S_AXI_bvalid,
    S_AXI_bready    => S_AXI_bready,
    S_AXI_araddr    => S_AXI_araddr,
    S_AXI_arprot    => S_AXI_arprot,
    S_AXI_arvalid   => S_AXI_arvalid,
    S_AXI_arready   => S_AXI_arready,
    S_AXI_rdata     => S_AXI_rdata,
    S_AXI_rresp     => S_AXI_rresp,
    S_AXI_rvalid    => S_AXI_rvalid,
    S_AXI_rready    => S_AXI_rready,
    S_AXI_in        => S_AXI_in,
    S_AXI_out       => S_AXI_out
);

end Behavioral;
