-- Title      : AXI_INTERCONNECT_IP
-- Project    : LoCod
-------------------------------------------------------------------------------
-- File       : axi_interconnect_ip.vhd
-- Author     : Colin Constans
-- Date       : 2023-05-17
-- Company    : VIVERIS
-- Platform   : Vivado 2021.2
-- Standard   : VHDL 93/02
-------------------------------------------------------------------------------
-- Description: Wrapper for axi_interconnect
-------------------------------------------------------------------------------
-- Copyright (c) 2023
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

use work.locod_pkg.all;

entity axi_interconnect_ip is
    Generic (
        NB_MASTER                      : integer := 2;
        ADDR_SIZE                      : integer := 32;
        DATA_SIZE                      : integer := 32;
        PROT_SIZE                      : integer := 3;
        STRB_SIZE                      : integer := 4;
        RESP_SIZE                      : integer := 2
    );
    Port (
        i_clk                          : in  std_logic;
        i_rst_n                        : in  std_logic;
        i_rst                          : in  std_logic;
        -- Slave #0 Interface
        S00_AXI_awaddr                 : in  std_logic_vector(ADDR_SIZE-1 downto 0);
        S00_AXI_awprot                 : in  std_logic_vector(PROT_SIZE-1 downto 0);
        S00_AXI_awvalid                : in  std_logic;
        S00_AXI_wdata                  : in  std_logic_vector(DATA_SIZE-1 downto 0);
        S00_AXI_wstrb                  : in  std_logic_vector(STRB_SIZE-1 downto 0);
        S00_AXI_wvalid                 : in  std_logic;
        S00_AXI_bready                 : in  std_logic;
        S00_AXI_araddr                 : in  std_logic_vector(ADDR_SIZE-1 downto 0);
        S00_AXI_arprot                 : in  std_logic_vector(PROT_SIZE-1 downto 0);
        S00_AXI_arvalid                : in  std_logic;
        S00_AXI_rready                 : in  std_logic;
        S00_AXI_awready                : out std_logic;
        S00_AXI_wready                 : out std_logic;
        S00_AXI_bresp                  : out std_logic_vector(RESP_SIZE-1 downto 0);
        S00_AXI_bvalid                 : out std_logic;
        S00_AXI_arready                : out std_logic;
        S00_AXI_rdata                  : out std_logic_vector(DATA_SIZE-1 downto 0);
        S00_AXI_rresp                  : out std_logic_vector(RESP_SIZE-1 downto 0);
        S00_AXI_rvalid                 : out std_logic;
        -- Slave #1 Interface
        S01_AXI_awaddr                 : in  std_logic_vector(ADDR_SIZE-1 downto 0);
        S01_AXI_awprot                 : in  std_logic_vector(PROT_SIZE-1 downto 0);
        S01_AXI_awvalid                : in  std_logic;
        S01_AXI_wdata                  : in  std_logic_vector(DATA_SIZE-1 downto 0);
        S01_AXI_wstrb                  : in  std_logic_vector(STRB_SIZE-1 downto 0);
        S01_AXI_wvalid                 : in  std_logic;
        S01_AXI_bready                 : in  std_logic;
        S01_AXI_araddr                 : in  std_logic_vector(ADDR_SIZE-1 downto 0);
        S01_AXI_arprot                 : in  std_logic_vector(PROT_SIZE-1 downto 0);
        S01_AXI_arvalid                : in  std_logic;
        S01_AXI_rready                 : in  std_logic;
        S01_AXI_awready                : out std_logic;
        S01_AXI_wready                 : out std_logic;
        S01_AXI_bresp                  : out std_logic_vector(RESP_SIZE-1 downto 0);
        S01_AXI_bvalid                 : out std_logic;
        S01_AXI_arready                : out std_logic;
        S01_AXI_rdata                  : out std_logic_vector(DATA_SIZE-1 downto 0);
        S01_AXI_rresp                  : out std_logic_vector(RESP_SIZE-1 downto 0);
        S01_AXI_rvalid                 : out std_logic;
        -- Master Interface
        M_AXI_awaddr                   : out std_logic_vector(ADDR_SIZE-1 downto 0);
        M_AXI_awprot                   : out std_logic_vector(PROT_SIZE-1 downto 0);
        M_AXI_awvalid                  : out std_logic;
        M_AXI_wdata                    : out std_logic_vector(DATA_SIZE-1 downto 0);
        M_AXI_wstrb                    : out std_logic_vector(STRB_SIZE-1 downto 0);
        M_AXI_wvalid                   : out std_logic;
        M_AXI_bready                   : out std_logic;
        M_AXI_araddr                   : out std_logic_vector(ADDR_SIZE-1 downto 0);
        M_AXI_arprot                   : out std_logic_vector(PROT_SIZE-1 downto 0);
        M_AXI_arvalid                  : out std_logic;
        M_AXI_rready                   : out std_logic;
        M_AXI_awready                  : in  std_logic;
        M_AXI_wready                   : in  std_logic;
        M_AXI_bresp                    : in  std_logic_vector(RESP_SIZE-1 downto 0);
        M_AXI_bvalid                   : in  std_logic;
        M_AXI_arready                  : in  std_logic;
        M_AXI_rdata                    : in  std_logic_vector(DATA_SIZE-1 downto 0);
        M_AXI_rresp                    : in  std_logic_vector(RESP_SIZE-1 downto 0);
        M_AXI_rvalid                   : in  std_logic
    );
end axi_interconnect_ip;

architecture Behavioral of axi_interconnect_ip is

    signal s_master_out_axi           : AXI4Lite_m_to_s;
    signal s_master_in_axi            : AXI4Lite_s_to_m;
    signal s_slave_in_axi_array       : AXI4Lite_m_to_s_array(0 to NB_MASTER-1);
    signal s_slave_out_axi_array      : AXI4Lite_s_to_m_array(0 to NB_MASTER-1);

begin

    axi_interconnect_inst: entity work.axi_interconnect
        Generic Map (
            NB_MASTER                      => NB_MASTER,
            ADDR_SIZE                      => ADDR_SIZE,
            DATA_SIZE                      => DATA_SIZE,
            PROT_SIZE                      => PROT_SIZE,
            STRB_SIZE                      => STRB_SIZE,
            RESP_SIZE                      => RESP_SIZE
        )
        Port Map (
            i_clk                          => i_clk,
            i_rst_n                        => i_rst_n,
              -- Slave Interface
            i_s_axi_array                  => s_slave_in_axi_array,
            o_s_axi_array                  => s_slave_out_axi_array,
            -- Master Interface
            o_m_axi                        => s_master_out_axi,
            i_m_axi                        => s_master_in_axi
        );

    s_slave_in_axi_array(0).awaddr <= S00_AXI_awaddr;
    s_slave_in_axi_array(0).awprot <= S00_AXI_awprot;
    s_slave_in_axi_array(0).awvalid <= S00_AXI_awvalid;
    s_slave_in_axi_array(0).wdata <= S00_AXI_wdata;
    s_slave_in_axi_array(0).wstrb <= S00_AXI_wstrb;
    s_slave_in_axi_array(0).wvalid <= S00_AXI_wvalid;
    s_slave_in_axi_array(0).bready <= S00_AXI_bready;
    s_slave_in_axi_array(0).araddr <= S00_AXI_araddr;
    s_slave_in_axi_array(0).arprot <= S00_AXI_arprot;
    s_slave_in_axi_array(0).arvalid <= S00_AXI_arvalid;
    s_slave_in_axi_array(0).rready <= S00_AXI_rready;
    S00_AXI_awready <= s_slave_out_axi_array(0).awready;
    S00_AXI_wready <= s_slave_out_axi_array(0).wready;
    S00_AXI_bresp <= s_slave_out_axi_array(0).bresp;
    S00_AXI_bvalid <= s_slave_out_axi_array(0).bvalid;
    S00_AXI_arready <= s_slave_out_axi_array(0).arready;
    S00_AXI_rdata <= s_slave_out_axi_array(0).rdata;
    S00_AXI_rresp <= s_slave_out_axi_array(0).rresp;
    S00_AXI_rvalid <= s_slave_out_axi_array(0).rvalid;

    s_slave_in_axi_array(1).awaddr <= S01_AXI_awaddr;
    s_slave_in_axi_array(1).awprot <= S01_AXI_awprot;
    s_slave_in_axi_array(1).awvalid <= S01_AXI_awvalid;
    s_slave_in_axi_array(1).wdata <= S01_AXI_wdata;
    s_slave_in_axi_array(1).wstrb <= S01_AXI_wstrb;
    s_slave_in_axi_array(1).wvalid <= S01_AXI_wvalid;
    s_slave_in_axi_array(1).bready <= S01_AXI_bready;
    s_slave_in_axi_array(1).araddr <= S01_AXI_araddr;
    s_slave_in_axi_array(1).arprot <= S01_AXI_arprot;
    s_slave_in_axi_array(1).arvalid <= S01_AXI_arvalid;
    s_slave_in_axi_array(1).rready <= S01_AXI_rready;
    S01_AXI_awready <= s_slave_out_axi_array(1).awready;
    S01_AXI_wready <= s_slave_out_axi_array(1).wready;
    S01_AXI_bresp <= s_slave_out_axi_array(1).bresp;
    S01_AXI_bvalid <= s_slave_out_axi_array(1).bvalid;
    S01_AXI_arready <= s_slave_out_axi_array(1).arready;
    S01_AXI_rdata <= s_slave_out_axi_array(1).rdata;
    S01_AXI_rresp <= s_slave_out_axi_array(1).rresp;
    S01_AXI_rvalid <= s_slave_out_axi_array(1).rvalid;

    M_AXI_awaddr <= s_master_out_axi.awaddr;
    M_AXI_awprot <= s_master_out_axi.awprot;
    M_AXI_awvalid <= s_master_out_axi.awvalid;
    M_AXI_wdata <= s_master_out_axi.wdata;
    M_AXI_wstrb <= s_master_out_axi.wstrb;
    M_AXI_wvalid <= s_master_out_axi.wvalid;
    M_AXI_bready <= s_master_out_axi.bready;
    M_AXI_araddr <= s_master_out_axi.araddr;
    M_AXI_arprot <= s_master_out_axi.arprot;
    M_AXI_arvalid <= s_master_out_axi.arvalid;
    M_AXI_rready <= s_master_out_axi.rready;
    s_master_in_axi.awready <= M_AXI_awready;
    s_master_in_axi.wready <= M_AXI_wready;
    s_master_in_axi.bresp <= M_AXI_bresp;
    s_master_in_axi.bvalid <= M_AXI_bvalid;
    s_master_in_axi.arready <= M_AXI_arready;
    s_master_in_axi.rdata <= M_AXI_rdata;
    s_master_in_axi.rresp <= M_AXI_rresp;
    s_master_in_axi.rvalid <= M_AXI_rvalid;

end Behavioral;