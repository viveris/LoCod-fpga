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

library ieee;
use ieee.std_logic_1164.all;

package locod_pkg is

        constant AXIL_ADDR_WIDTH        : integer := 32;
        constant AXIL_DATA_WIDTH        : integer := 32;
        
        -- LoCod types definitions
        type reg_array is array(natural range <>) of std_logic_vector(AXIL_DATA_WIDTH-1 downto 0);

        type AXI4Lite_m_to_s is record
            awaddr : std_logic_vector(AXIL_ADDR_WIDTH-1 downto 0);
            awprot : std_logic_vector(2 downto 0);
            awvalid : std_logic;
            wdata : std_logic_vector(AXIL_DATA_WIDTH-1 downto 0);
            wstrb : std_logic_vector((AXIL_DATA_WIDTH/8)-1 downto 0);
            wvalid : std_logic;
            bready : std_logic;
            araddr : std_logic_vector(AXIL_ADDR_WIDTH-1 downto 0);
            arprot : std_logic_vector(2 downto 0);
            arvalid : std_logic;
            rready : std_logic;
        end record AXI4Lite_m_to_s;

        type AXI4Lite_s_to_m is record
            awready : std_logic;
            wready : std_logic;
            bresp : std_logic_vector(1 downto 0);
            bvalid : std_logic;
            arready : std_logic;
            rdata : std_logic_vector(AXIL_DATA_WIDTH-1 downto 0);
            rresp : std_logic_vector(1 downto 0);
            rvalid : std_logic;
        end record AXI4Lite_s_to_m;

        type AXI4Lite_m_to_s_array is array(natural range <>) of AXI4Lite_m_to_s;
        type AXI4Lite_s_to_m_array is array(natural range <>) of AXI4Lite_s_to_m;


        -- LoCod constants definitions
        constant c_m_to_s : AXI4Lite_m_to_s := (
            awaddr => (others=>'0'),
            awprot => (others=>'0'),
            awvalid => '0',
            wdata => (others=>'0'),
            wstrb => (others=>'0'),
            wvalid => '0',
            bready => '1',
            araddr => (others=>'0'),
            arprot => (others=>'0'),
            arvalid => '0',
            rready => '1'
        );

        constant c_s_to_m : AXI4Lite_s_to_m := (
            awready => '1',
            wready => '1',
            bresp => (others=>'0'),
            bvalid => '0',
            arready => '1',
            rdata => (others=>'0'),
            rresp => (others=>'0'),
            rvalid => '0'
        );

end package;
