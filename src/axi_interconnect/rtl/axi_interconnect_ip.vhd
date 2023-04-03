library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use work.locod_pkg.all;

entity axi_reg_ip is
generic (
    NB_MASTERS      : integer   --Must be inferior or equal to 4
);
port (
    -- Clock and reset
    clk             : in std_logic;
    rst             : in std_logic;
    
    -- AXI Slave in 0
    S00_AXI_awaddr  : in std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
    S00_AXI_awprot  : in std_logic_vector(2 downto 0);
    S00_AXI_awvalid : in std_logic;
    S00_AXI_awready : out std_logic;
    S00_AXI_wdata 	: in std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    S00_AXI_wstrb 	: in std_logic_vector(3 downto 0);
    S00_AXI_wvalid  : in std_logic;
    S00_AXI_wready  : out std_logic;
    S00_AXI_bresp 	: out std_logic_vector(1 downto 0);
    S00_AXI_bvalid  : out std_logic;
    S00_AXI_bready  : in std_logic;
    S00_AXI_araddr  : in std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
    S00_AXI_arprot  : in std_logic_vector(2 downto 0);
    S00_AXI_arvalid : in std_logic;
    S00_AXI_arready : out std_logic;
    S00_AXI_rdata 	: out std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    S00_AXI_rresp 	: out std_logic_vector(1 downto 0);
    S00_AXI_rvalid  : out std_logic;
    S00_AXI_rready  : in std_logic;

    -- AXI Slave in 1
    S01_AXI_awaddr  : in std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
    S01_AXI_awprot  : in std_logic_vector(2 downto 0);
    S01_AXI_awvalid : in std_logic;
    S01_AXI_awready : out std_logic;
    S01_AXI_wdata   : in std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    S01_AXI_wstrb   : in std_logic_vector(3 downto 0);
    S01_AXI_wvalid  : in std_logic;
    S01_AXI_wready  : out std_logic;
    S01_AXI_bresp   : out std_logic_vector(1 downto 0);
    S01_AXI_bvalid  : out std_logic;
    S01_AXI_bready  : in std_logic;
    S01_AXI_araddr  : in std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
    S01_AXI_arprot  : in std_logic_vector(2 downto 0);
    S01_AXI_arvalid : in std_logic;
    S01_AXI_arready : out std_logic;
    S01_AXI_rdata   : out std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    S01_AXI_rresp   : out std_logic_vector(1 downto 0);
    S01_AXI_rvalid  : out std_logic;
    S01_AXI_rready  : in std_logic;

    -- AXI Slave in 2
    S02_AXI_awaddr  : in std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
    S02_AXI_awprot  : in std_logic_vector(2 downto 0);
    S02_AXI_awvalid : in std_logic;
    S02_AXI_awready : out std_logic;
    S02_AXI_wdata   : in std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    S02_AXI_wstrb   : in std_logic_vector(3 downto 0);
    S02_AXI_wvalid  : in std_logic;
    S02_AXI_wready  : out std_logic;
    S02_AXI_bresp   : out std_logic_vector(1 downto 0);
    S02_AXI_bvalid  : out std_logic;
    S02_AXI_bready  : in std_logic;
    S02_AXI_araddr  : in std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
    S02_AXI_arprot  : in std_logic_vector(2 downto 0);
    S02_AXI_arvalid : in std_logic;
    S02_AXI_arready : out std_logic;
    S02_AXI_rdata   : out std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    S02_AXI_rresp   : out std_logic_vector(1 downto 0);
    S02_AXI_rvalid  : out std_logic;
    S02_AXI_rready  : in std_logic;

    -- AXI Slave in 3
    S03_AXI_awaddr  : in std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
    S03_AXI_awprot  : in std_logic_vector(2 downto 0);
    S03_AXI_awvalid : in std_logic;
    S03_AXI_awready : out std_logic;
    S03_AXI_wdata   : in std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    S03_AXI_wstrb   : in std_logic_vector(3 downto 0);
    S03_AXI_wvalid  : in std_logic;
    S03_AXI_wready  : out std_logic;
    S03_AXI_bresp   : out std_logic_vector(1 downto 0);
    S03_AXI_bvalid  : out std_logic;
    S03_AXI_bready  : in std_logic;
    S03_AXI_araddr  : in std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
    S03_AXI_arprot  : in std_logic_vector(2 downto 0);
    S03_AXI_arvalid : in std_logic;
    S03_AXI_arready : out std_logic;
    S03_AXI_rdata   : out std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    S03_AXI_rresp   : out std_logic_vector(1 downto 0);
    S03_AXI_rvalid  : out std_logic;
    S03_AXI_rready  : in std_logic;

    -- AXI Master out
    M_AXI_awaddr    : out std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
    M_AXI_awprot    : out std_logic_vector(2 downto 0);
    M_AXI_awvalid   : out std_logic;
    M_AXI_awready   : in std_logic;
    M_AXI_wdata     : out std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    M_AXI_wstrb     : out std_logic_vector(3 downto 0);
    M_AXI_wvalid    : out std_logic;
    M_AXI_wready    : in std_logic;
    M_AXI_bresp     : in std_logic_vector(1 downto 0);
    M_AXI_bvalid    : in std_logic;
    M_AXI_bready    : out std_logic;
    M_AXI_araddr    : out std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
    M_AXI_arprot    : out std_logic_vector(2 downto 0);
    M_AXI_arvalid   : out std_logic;
    M_AXI_arready   : in std_logic;
    M_AXI_rdata     : in std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    M_AXI_rresp     : in std_logic_vector(1 downto 0);
    M_AXI_rvalid    : in std_logic;
    M_AXI_rready    : out std_logic
);
end axi_reg_ip;

architecture Behavioral of axi_reg_ip is


constant MAX_MASTERS : integer := 4;

signal S_AXI_in_array : AXI4Lite_m_to_s_array(0 to NB_MASTERS-1);
signal S_AXI_out_array : AXI4Lite_s_to_m_array(0 to NB_MASTERS-1);
signal M_AXI_out : AXI4Lite_m_to_s;
signal M_AXI_in : AXI4Lite_s_to_s;


begin


axi_master_if_inst : entity work.axi_master_if
port map(
    M_AXI_awaddr        => M_AXI_awaddr,
    M_AXI_awprot        => M_AXI_awprot,
    M_AXI_awvalid       => M_AXI_awvalid,
    M_AXI_awready       => M_AXI_awready,
    M_AXI_wdata         => M_AXI_wdata,
    M_AXI_wstrb         => M_AXI_wstrb,
    M_AXI_wvalid        => M_AXI_wvalid,
    M_AXI_wready        => M_AXI_wready,
    M_AXI_bresp         => M_AXI_bresp,
    M_AXI_bvalid        => M_AXI_bvalid,
    M_AXI_bready        => M_AXI_bready,
    M_AXI_araddr        => M_AXI_araddr,
    M_AXI_arprot        => M_AXI_arprot,
    M_AXI_arvalid       => M_AXI_arvalid,
    M_AXI_arready       => M_AXI_arready,
    M_AXI_rdata         => M_AXI_rdata,
    M_AXI_rresp         => M_AXI_rresp,
    M_AXI_rvalid        => M_AXI_rvalid,
    M_AXI_rready        => M_AXI_rready,
    M_AXI_out           => M_AXI_out,
    M_AXI_in            => M_AXI_in
);


axi_slave_if_0 : entity work.axi_slave_if
port map(       
    S_AXI_awaddr        => S00_AXI_awaddr,
    S_AXI_awprot        => S00_AXI_awprot,
    S_AXI_awvalid       => S00_AXI_awvalid,
    S_AXI_awready       => S00_AXI_awready,
    S_AXI_wdata         => S00_AXI_wdata,
    S_AXI_wstrb         => S00_AXI_wstrb,
    S_AXI_wvalid        => S00_AXI_wvalid,
    S_AXI_wready        => S00_AXI_wready,
    S_AXI_bresp         => S00_AXI_bresp,
    S_AXI_bvalid        => S00_AXI_bvalid,
    S_AXI_bready        => S00_AXI_bready,
    S_AXI_araddr        => S00_AXI_araddr,
    S_AXI_arprot        => S00_AXI_arprot,
    S_AXI_arvalid       => S00_AXI_arvalid,
    S_AXI_arready       => S00_AXI_arready,
    S_AXI_rdata         => S00_AXI_rdata,
    S_AXI_rresp         => S00_AXI_rresp,
    S_AXI_rvalid        => S00_AXI_rvalid,
    S_AXI_rready        => S00_AXI_rready,
    S_AXI_in            => S_AXI_in_array(0),
    S_AXI_out           => S_AXI_out_array(0)
);


axi_slave_if_1 : entity work.axi_slave_if
port map(       
    S_AXI_awaddr        => S01_AXI_awaddr,
    S_AXI_awprot        => S01_AXI_awprot,
    S_AXI_awvalid       => S01_AXI_awvalid,
    S_AXI_awready       => S01_AXI_awready,
    S_AXI_wdata         => S01_AXI_wdata,
    S_AXI_wstrb         => S01_AXI_wstrb,
    S_AXI_wvalid        => S01_AXI_wvalid,
    S_AXI_wready        => S01_AXI_wready,
    S_AXI_bresp         => S01_AXI_bresp,
    S_AXI_bvalid        => S01_AXI_bvalid,
    S_AXI_bready        => S01_AXI_bready,
    S_AXI_araddr        => S01_AXI_araddr,
    S_AXI_arprot        => S01_AXI_arprot,
    S_AXI_arvalid       => S01_AXI_arvalid,
    S_AXI_arready       => S01_AXI_arready,
    S_AXI_rdata         => S01_AXI_rdata,
    S_AXI_rresp         => S01_AXI_rresp,
    S_AXI_rvalid        => S01_AXI_rvalid,
    S_AXI_rready        => S01_AXI_rready,
    S_AXI_in            => S_AXI_in_array(1),
    S_AXI_out           => S_AXI_out_array(1)
);


axi_slave_if_2 : entity work.axi_slave_if
port map(       
    S_AXI_awaddr        => S02_AXI_awaddr,
    S_AXI_awprot        => S02_AXI_awprot,
    S_AXI_awvalid       => S02_AXI_awvalid,
    S_AXI_awready       => S02_AXI_awready,
    S_AXI_wdata         => S02_AXI_wdata,
    S_AXI_wstrb         => S02_AXI_wstrb,
    S_AXI_wvalid        => S02_AXI_wvalid,
    S_AXI_wready        => S02_AXI_wready,
    S_AXI_bresp         => S02_AXI_bresp,
    S_AXI_bvalid        => S02_AXI_bvalid,
    S_AXI_bready        => S02_AXI_bready,
    S_AXI_araddr        => S02_AXI_araddr,
    S_AXI_arprot        => S02_AXI_arprot,
    S_AXI_arvalid       => S02_AXI_arvalid,
    S_AXI_arready       => S02_AXI_arready,
    S_AXI_rdata         => S02_AXI_rdata,
    S_AXI_rresp         => S02_AXI_rresp,
    S_AXI_rvalid        => S02_AXI_rvalid,
    S_AXI_rready        => S02_AXI_rready,
    S_AXI_in            => S_AXI_in_array(2),
    S_AXI_out           => S_AXI_out_array(2)
);


axi_slave_if_3 : entity work.axi_slave_if
port map(       
    S_AXI_awaddr        => S03_AXI_awaddr,
    S_AXI_awprot        => S03_AXI_awprot,
    S_AXI_awvalid       => S03_AXI_awvalid,
    S_AXI_awready       => S03_AXI_awready,
    S_AXI_wdata         => S03_AXI_wdata,
    S_AXI_wstrb         => S03_AXI_wstrb,
    S_AXI_wvalid        => S03_AXI_wvalid,
    S_AXI_wready        => S03_AXI_wready,
    S_AXI_bresp         => S03_AXI_bresp,
    S_AXI_bvalid        => S03_AXI_bvalid,
    S_AXI_bready        => S03_AXI_bready,
    S_AXI_araddr        => S03_AXI_araddr,
    S_AXI_arprot        => S03_AXI_arprot,
    S_AXI_arvalid       => S03_AXI_arvalid,
    S_AXI_arready       => S03_AXI_arready,
    S_AXI_rdata         => S03_AXI_rdata,
    S_AXI_rresp         => S03_AXI_rresp,
    S_AXI_rvalid        => S03_AXI_rvalid,
    S_AXI_rready        => S03_AXI_rready,
    S_AXI_in            => S_AXI_in_array(3),
    S_AXI_out           => S_AXI_out_array(3)
);



axi_interconnect_inst : entity work.axi_interconnect
generic map(
    NB_MASTERS          => NB_MASTERS        
)
port map(
    -- Clock and reset
    clk                 => clk,
    rst                 => rst,
    S_AXI_in_array      => S_AXI_in_array,
    S_AXI_out_array     => S_AXI_out_array,
    M_AXI_out           => M_AXI_out,
    M_AXI_in            => M_AXI_in
);

end Behavioral;
