library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

use work.locod_pkg.all;

entity axi_reg_ip is
port (
    -- Clock and reset
    clk             : in std_logic;
    rstn            : in std_logic;
    
    -- AXI4 LITE Bus
    S_AXI_awaddr    : in std_logic_vector(AXIL_ADDR_WIDTH-1 downto 0);
    S_AXI_awprot    : in std_logic_vector(2 downto 0);
    S_AXI_awvalid   : in std_logic;
    S_AXI_awready   : out std_logic;
    S_AXI_wdata     : in std_logic_vector(AXIL_DATA_WIDTH-1 downto 0);
    S_AXI_wstrb     : in std_logic_vector((AXIL_DATA_WIDTH/8)-1 downto 0);
    S_AXI_wvalid    : in std_logic;
    S_AXI_wready    : out std_logic;
    S_AXI_bresp     : out std_logic_vector(1 downto 0);
    S_AXI_bvalid    : out std_logic;
    S_AXI_bready    : in std_logic;
    S_AXI_araddr    : in std_logic_vector(AXIL_ADDR_WIDTH-1 downto 0);
    S_AXI_arprot    : in std_logic_vector(2 downto 0);
    S_AXI_arvalid   : in std_logic;
    S_AXI_arready   : out std_logic;
    S_AXI_rdata     : out std_logic_vector(AXIL_DATA_WIDTH-1 downto 0);
    S_AXI_rresp     : out std_logic_vector(1 downto 0);
    S_AXI_rvalid    : out std_logic;
    S_AXI_rready    : in std_logic;

    -- Registers
    REG0            : out std_logic_vector(AXIL_DATA_WIDTH-1 downto 0);
    REG1            : out std_logic_vector(AXIL_DATA_WIDTH-1 downto 0);
    REG2            : out std_logic_vector(AXIL_DATA_WIDTH-1 downto 0);
    REG3            : out std_logic_vector(AXIL_DATA_WIDTH-1 downto 0);
    REG4            : in std_logic_vector(AXIL_DATA_WIDTH-1 downto 0);
    REG5            : in std_logic_vector(AXIL_DATA_WIDTH-1 downto 0);
    REG6            : in std_logic_vector(AXIL_DATA_WIDTH-1 downto 0);
    REG7            : in std_logic_vector(AXIL_DATA_WIDTH-1 downto 0)
);
end axi_reg_ip;

architecture Behavioral of axi_reg_ip is

constant NB_REGISTERS_OUT   : integer := 4;
constant NB_REGISTERS_IN    : integer := 4;
constant BASE_ADDRESS       : integer := 1024;

signal registers_out        : reg_array(NB_REGISTERS_OUT-1 downto 0);
signal registers_in         : reg_array(NB_REGISTERS_IN-1 downto 0);

begin

REG0 <= registers_out(0);
REG1 <= registers_out(1);
REG2 <= registers_out(2);
REG3 <= registers_out(3);
registers_in(0) <= REG4;
registers_in(1) <= REG5;
registers_in(2) <= REG6;
registers_in(3) <= REG7;


axi_reg_inst : entity work.axi_reg
generic map (
    NB_REGISTERS_OUT    => NB_REGISTERS_OUT,
    NB_REGISTERS_IN     => NB_REGISTERS_IN,
    BASE_ADDRESS        => std_logic_vector(to_unsigned(BASE_ADDRESS, AXIL_ADDR_WIDTH))
)
port map (
    clk_i               => clk,
    rstn_i              => rstn,
    S_AXIL_awaddr_i     => S_AXI_awaddr,
    S_AXIL_awprot_i     => S_AXI_awprot,
    S_AXIL_awvalid_i    => S_AXI_awvalid,
    S_AXIL_awready_o    => S_AXI_awready,
    S_AXIL_wdata_i      => S_AXI_wdata, 
    S_AXIL_wstrb_i      => S_AXI_wstrb,
    S_AXIL_wvalid_i     => S_AXI_wvalid,
    S_AXIL_wready_o     => S_AXI_wready,
    S_AXIL_bresp_o      => S_AXI_bresp,
    S_AXIL_bvalid_o     => S_AXI_bvalid,
    S_AXIL_bready_i     => S_AXI_bready,
    S_AXIL_araddr_i     => S_AXI_araddr,
    S_AXIL_arprot_i     => S_AXI_arprot,
    S_AXIL_arvalid_i    => S_AXI_arvalid,
    S_AXIL_arready_o    => S_AXI_arready,
    S_AXIL_rdata_o      => S_AXI_rdata,
    S_AXIL_rresp_o      => S_AXI_rresp, 
    S_AXIL_rvalid_o     => S_AXI_rvalid, 
    S_AXIL_rready_i     => S_AXI_rready,
    REG_ARRAY_PORT_o    => registers_out,
    REG_ARRAY_PORT_i    => registers_in
);


end Behavioral;
