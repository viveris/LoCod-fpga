--                     __            ___             _ 
--                    / /    ___    / __\  ___    __| |
--                   / /    / _ \  / /    / _ \  / _` |
--                  / /___ | (_) |/ /___ | (_) || (_| |
--                  \____/  \___/ \____/  \___/  \__,_|
--
--            ***********************************************
--                             LoCod Project
--                 URL: https://github.com/viveris/LoCod
--            ***********************************************
--                 Copyright © 2024 Viveris Technologies
--
--                  Developed in partnership with CNES
--              (DTN/TVO/ET: On-Board Data Handling Office)
--
--  This file is part of the LoCod framework.
--
--  The LoCod framework is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License as published by
--  the Free Software Foundation; either version 3 of the License, or
--  (at your option) any later version.
--
--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU General Public License for more details.
--
--  You should have received a copy of the GNU General Public License
--  along with this program.  If not, see <http://www.gnu.org/licenses/>.
--

-------------------------------------------------------------------------------
-- Title      : AXI_SLAVE_INTERFACE
-- Project    : LoCod
-------------------------------------------------------------------------------
-- File       : axi_slave_interface.vhd
-- Author     : Colin Constans
-- Date       : 2023-05-11
-- Company    : VIVERIS
-- Platform   : Vivado 2021.2
-- Standard   : VHDL 93/02
-------------------------------------------------------------------------------
-- Description: Signal receiver for axi_interconnect slave interface
-------------------------------------------------------------------------------
-- Copyright (c) 2023
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

use work.locod_pkg.all;

entity axi_slave_interface is
    Generic (
        ADDR_SIZE                      : integer := 32;
        DATA_SIZE                      : integer := 32;
        PROT_SIZE                      : integer := 3;
        STRB_SIZE                      : integer := 4;
        RESP_SIZE                      : integer := 2
    );
    Port (
        i_clk                         : in  std_logic;
        i_rst_n                       : in  std_logic;
        i_slave_interface             : in  AXI4Lite_m_to_s;
        o_slave_interface             : out AXI4Lite_s_to_m;
        o_internal_interface          : out AXI4Lite_m_to_s;
        i_internal_interface          : in  AXI4Lite_s_to_m
    );
end axi_slave_interface;

architecture Behavioral of axi_slave_interface is

    component axi_channel_buffer is
        Generic (
            BUS_SIZE                      : integer := 32;
            AUX_BUS_SIZE                  : integer := 4
        );
        Port (
            i_clk                         : in  std_logic;
            i_rst_n                       : in  std_logic;
            -- Live interface
            i_data                        : in  std_logic_vector(BUS_SIZE-1 downto 0);
            i_data_aux                    : in  std_logic_vector(AUX_BUS_SIZE-1 downto 0);
            i_data_valid                  : in  std_logic;
            o_ready                       : out std_logic;
            -- Buffered interface
            o_data                        : out std_logic_vector(BUS_SIZE-1 downto 0);
            o_data_aux                    : out std_logic_vector(AUX_BUS_SIZE-1 downto 0);
            o_data_valid                  : out std_logic;
            i_ack                         : in  std_logic
        );
    end component;

begin

    -- Read Addr Channel
    axi_ar_buffer:  axi_channel_buffer
        Generic Map (
            BUS_SIZE                      => ADDR_SIZE,
            AUX_BUS_SIZE                  => PROT_SIZE
        )
        Port Map (
            i_clk                         => i_clk,
            i_rst_n                       => i_rst_n,
            -- Live interface
            i_data                        => i_slave_interface.araddr,
            i_data_aux                    => i_slave_interface.arprot,
            i_data_valid                  => i_slave_interface.arvalid,
            o_ready                       => o_slave_interface.arready,
            -- Buffered interface
            o_data                        => o_internal_interface.araddr,
            o_data_aux                    => o_internal_interface.arprot,
            o_data_valid                  => o_internal_interface.arvalid,
            i_ack                         => i_internal_interface.arready
        );

    -- Write Addr Channel
    axi_aw_buffer:  axi_channel_buffer
        Generic Map (
            BUS_SIZE                      => ADDR_SIZE,
            AUX_BUS_SIZE                  => PROT_SIZE
        )
        Port Map (
            i_clk                         => i_clk,
            i_rst_n                       => i_rst_n,
            -- Live interface
            i_data                        => i_slave_interface.awaddr,
            i_data_aux                    => i_slave_interface.awprot,
            i_data_valid                  => i_slave_interface.awvalid,
            o_ready                       => o_slave_interface.awready,
            -- Buffered interface
            o_data                        => o_internal_interface.awaddr,
            o_data_aux                    => o_internal_interface.awprot,
            o_data_valid                  => o_internal_interface.awvalid,
            i_ack                         => i_internal_interface.awready
        );

    -- Write Data Channel
    axi_w_buffer:  axi_channel_buffer
        Generic Map (
            BUS_SIZE                      => DATA_SIZE,
            AUX_BUS_SIZE                  => STRB_SIZE
        )
        Port Map (
            i_clk                         => i_clk,
            i_rst_n                       => i_rst_n,
            -- Live interface
            i_data                        => i_slave_interface.wdata,
            i_data_aux                    => i_slave_interface.wstrb,
            i_data_valid                  => i_slave_interface.wvalid,
            o_ready                       => o_slave_interface.wready,
            -- Buffered interface
            o_data                        => o_internal_interface.wdata,
            o_data_aux                    => o_internal_interface.wstrb,
            o_data_valid                  => o_internal_interface.wvalid,
            i_ack                         => i_internal_interface.wready
        );

    axi_r_buffer:  axi_channel_buffer
        Generic Map (
            BUS_SIZE                      => DATA_SIZE,
            AUX_BUS_SIZE                  => RESP_SIZE
        )
        Port Map (
            i_clk                         => i_clk,
            i_rst_n                       => i_rst_n,
            -- Live interface
            i_data                        => i_internal_interface.rdata,
            i_data_aux                    => i_internal_interface.rresp,
            i_data_valid                  => i_internal_interface.rvalid,
            o_ready                       => o_internal_interface.rready,
            -- Buffered interface
            o_data                        => o_slave_interface.rdata,
            o_data_aux                    => o_slave_interface.rresp,
            o_data_valid                  => o_slave_interface.rvalid,
            i_ack                         => i_slave_interface.rready
        );

    axi_b_buffer:  axi_channel_buffer
        Generic Map (
            BUS_SIZE                      => RESP_SIZE,
            AUX_BUS_SIZE                  => RESP_SIZE
        )
        Port Map (
            i_clk                         => i_clk,
            i_rst_n                       => i_rst_n,
            -- Live interface
            i_data                        => i_internal_interface.bresp,
            i_data_aux                    => (others=>'0'),
            i_data_valid                  => i_internal_interface.bvalid,
            o_ready                       => o_internal_interface.bready,
            -- Buffered interface
            o_data                        => o_slave_interface.bresp,
            o_data_aux                    => OPEN,
            o_data_valid                  => o_slave_interface.bvalid,
            i_ack                         => i_slave_interface.bready
        );


end Behavioral;
