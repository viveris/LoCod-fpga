-------------------------------------------------------------------------------
-- Title      : AXI_INTERCONNECT
-- Project    : LOCOD
-------------------------------------------------------------------------------
-- File       : axi_interconnect.vhd
-- Author     : Colin Constans
-- Date       : 2023-05-12
-- Company    : VIVERIS
-- Platform   : Vivado 2021.2
-- Standard   : VHDL 93/02
-------------------------------------------------------------------------------
-- Description: N-to-1 AXI Master interconnect
-------------------------------------------------------------------------------
-- Copyright (c) 2023
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

use work.locod_pkg.all;

entity axi_interconnect is
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
    	  -- Slave Interface
        i_s_axi_array                  : in  AXI4Lite_m_to_s_array(0 to NB_MASTER-1);
        o_s_axi_array                  : out AXI4Lite_s_to_m_array(0 to NB_MASTER-1);
        -- Master Interface
        o_m_axi                        : out AXI4Lite_m_to_s;
        i_m_axi                        : in  AXI4Lite_s_to_m
    );
end axi_interconnect;

architecture Behavioral of axi_interconnect is

signal s_internal_interface_n_to_1     : AXI4Lite_m_to_s_array(0 to NB_MASTER-1);
signal s_internal_interface_1_to_n     : AXI4Lite_s_to_m_array(0 to NB_MASTER-1);

component axi_master_interface is
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
        o_master_interface             : out AXI4Lite_m_to_s;
        i_master_interface             : in  AXI4Lite_s_to_m;
        i_internal_interface           : in  AXI4Lite_m_to_s_array(0 to NB_MASTER-1);
        o_internal_interface           : out AXI4Lite_s_to_m_array(0 to NB_MASTER-1)
    );
end component;

component axi_slave_interface is
    Generic (
        ADDR_SIZE                      : integer := 32;
        DATA_SIZE                      : integer := 32;
        PROT_SIZE                      : integer := 3;
        STRB_SIZE                      : integer := 4;
        RESP_SIZE                      : integer := 2
    );
    Port (
        i_clk                          : in  std_logic;
        i_rst_n                        : in  std_logic;
        i_slave_interface              : in  AXI4Lite_m_to_s;
        o_slave_interface              : out AXI4Lite_s_to_m;
        o_internal_interface           : out AXI4Lite_m_to_s;
        i_internal_interface           : in  AXI4Lite_s_to_m
    );
end component;

begin

axi_master_interface_inst: axi_master_interface
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
        o_master_interface             => o_m_axi,
        i_master_interface             => i_m_axi,
        i_internal_interface           => s_internal_interface_n_to_1,
        o_internal_interface           => s_internal_interface_1_to_n
    );

axi_slave_interface_gen : for i in 0 to NB_MASTER-1 generate
begin
	axi_slave_interface_inst: axi_slave_interface
    Generic Map (
        ADDR_SIZE                      => ADDR_SIZE,
        DATA_SIZE                      => DATA_SIZE,
        PROT_SIZE                      => PROT_SIZE,
        STRB_SIZE                      => STRB_SIZE,
        RESP_SIZE                      => RESP_SIZE
    )
    Port Map (
        i_clk                          => i_clk,
        i_rst_n                        => i_rst_n,
        i_slave_interface              => i_s_axi_array(i),
        o_slave_interface              => o_s_axi_array(i),
        o_internal_interface           => s_internal_interface_n_to_1(i),
        i_internal_interface           => s_internal_interface_1_to_n(i)
    );
end generate;

end Behavioral;
