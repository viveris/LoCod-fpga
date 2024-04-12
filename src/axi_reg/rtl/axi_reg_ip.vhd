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

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

use work.locod_pkg.all;

entity axi_reg_ip is
port (
    -- Clock and reset
    clk_i                   : in std_logic;
    rstn_i                  : in std_logic;
    
    -- AXI4 LITE Bus
    S_AXIL_awaddr           : in std_logic_vector(AXIL_ADDR_WIDTH-1 downto 0);
    S_AXIL_awprot           : in std_logic_vector(2 downto 0);
    S_AXIL_awvalid          : in std_logic;
    S_AXIL_awready          : out std_logic;
    S_AXIL_wdata            : in std_logic_vector(AXIL_DATA_WIDTH-1 downto 0);
    S_AXIL_wstrb            : in std_logic_vector((AXIL_DATA_WIDTH/8)-1 downto 0);
    S_AXIL_wvalid           : in std_logic;
    S_AXIL_wready           : out std_logic;
    S_AXIL_bresp            : out std_logic_vector(1 downto 0);
    S_AXIL_bvalid           : out std_logic;
    S_AXIL_bready           : in std_logic;
    S_AXIL_araddr           : in std_logic_vector(AXIL_ADDR_WIDTH-1 downto 0);
    S_AXIL_arprot           : in std_logic_vector(2 downto 0);
    S_AXIL_arvalid          : in std_logic;
    S_AXIL_arready          : out std_logic;
    S_AXIL_rdata            : out std_logic_vector(AXIL_DATA_WIDTH-1 downto 0);
    S_AXIL_rresp            : out std_logic_vector(1 downto 0);
    S_AXIL_rvalid           : out std_logic;
    S_AXIL_rready           : in std_logic;

    -- Registers
    REG0                    : out std_logic_vector(AXIL_DATA_WIDTH-1 downto 0);
    REG1                    : out std_logic_vector(AXIL_DATA_WIDTH-1 downto 0);
    REG2                    : out std_logic_vector(AXIL_DATA_WIDTH-1 downto 0);
    REG3                    : out std_logic_vector(AXIL_DATA_WIDTH-1 downto 0);
    REG4                    : in std_logic_vector(AXIL_DATA_WIDTH-1 downto 0);
    REG5                    : in std_logic_vector(AXIL_DATA_WIDTH-1 downto 0);
    REG6                    : in std_logic_vector(AXIL_DATA_WIDTH-1 downto 0);
    REG7                    : in std_logic_vector(AXIL_DATA_WIDTH-1 downto 0)
);
end axi_reg_ip;

architecture Behavioral of axi_reg_ip is


constant NB_REGISTERS_OUT   : integer := 4;
constant NB_REGISTERS_IN    : integer := 4;
constant BASE_ADDRESS       : integer := 1024;

signal S_AXIL_in             : AXI4Lite_m_to_s;
signal S_AXIL_out            : AXI4Lite_s_to_m;

signal registers_out        : reg_array(NB_REGISTERS_OUT-1 downto 0);
signal registers_in         : reg_array(NB_REGISTERS_IN-1 downto 0);


begin


S_AXIL_in.awaddr <= S_AXIL_awaddr; 
S_AXIL_in.awprot <= S_AXIL_awprot; 
S_AXIL_in.awvalid <= S_AXIL_awvalid;
S_AXIL_awready <= S_AXIL_out.awready;
S_AXIL_in.wdata <= S_AXIL_wdata; 
S_AXIL_in.wstrb <= S_AXIL_wstrb;  
S_AXIL_in.wvalid <= S_AXIL_wvalid; 
S_AXIL_wready <= S_AXIL_out.wready; 
S_AXIL_bresp <= S_AXIL_out.bresp;  
S_AXIL_bvalid <= S_AXIL_out.bvalid; 
S_AXIL_in.bready <= S_AXIL_bready; 
S_AXIL_in.araddr <= S_AXIL_araddr; 
S_AXIL_in.arprot <= S_AXIL_arprot; 
S_AXIL_in.arvalid <= S_AXIL_arvalid;
S_AXIL_arready <= S_AXIL_out.arready;
S_AXIL_rdata <= S_AXIL_out.rdata;  
S_AXIL_rresp <= S_AXIL_out.rresp;  
S_AXIL_rvalid <= S_AXIL_out.rvalid; 
S_AXIL_in.rready <= S_AXIL_rready;

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
    clk_i               => clk_i,
    rstn_i              => rstn_i,
    S_AXIL_in           => S_AXIL_in,
    S_AXIL_out          => S_AXIL_out,
    REG_ARRAY_PORT_o    => registers_out,
    REG_ARRAY_PORT_i    => registers_in
);

end Behavioral;
