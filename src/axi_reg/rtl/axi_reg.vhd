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
use ieee.numeric_std.all;
use ieee.math_real.all;

use work.locod_pkg.all;


entity axi_reg is
generic (
    NB_REGISTERS_OUT        : integer := 1;
    NB_REGISTERS_IN         : integer := 1;
    BASE_ADDRESS            : std_logic_vector(AXIL_ADDR_WIDTH-1 downto 0) := (others => '0')
);
port (
    -- Clock and reset
    clk_i      			    : in std_logic;
    rstn_i   			    : in std_logic;
    
    -- AXI4 LITE Slave
    S_AXIL_in               : in AXI4Lite_m_to_s;
    S_AXIL_out              : out AXI4Lite_s_to_m;

    -- Registers
    REG_ARRAY_PORT_o        : out reg_array(NB_REGISTERS_OUT-1 downto 0);
    REG_ARRAY_PORT_i        : in reg_array(NB_REGISTERS_IN-1 downto 0)
);
end axi_reg;


architecture Behavioral of axi_reg is


-- Constants
-- ADDR_LSB is used for addressing 32/64 bit registers/memories
-- ADDR_LSB = 2 for 32 bits (n downto 2)
-- ADDR_LSB = 3 for 64 bits (n downto 3)
constant ADDR_LSB           : integer := (AXIL_DATA_WIDTH/32)+ 1;
constant REG_ADDR_WIDTH     : integer := integer(ceil(log2(real((NB_REGISTERS_OUT+NB_REGISTERS_IN)*4)))); --Address range that we use over bytes
constant REG_ADDR_MASK      : std_logic_vector(AXIL_ADDR_WIDTH-1 downto 0) := (AXIL_ADDR_WIDTH-1 downto REG_ADDR_WIDTH => '0') & (REG_ADDR_WIDTH-1 downto 0 => '1');
constant NULL_VECTOR        : std_logic_vector(AXIL_ADDR_WIDTH-1 downto 0) := (others => '0');


-- AXI4 LITE signals
signal axil_awaddr          : std_logic_vector(AXIL_ADDR_WIDTH-1 downto 0);
signal axil_awready         : std_logic;
signal axil_wready          : std_logic;
signal axil_bresp           : std_logic_vector(1 downto 0);
signal axil_bvalid          : std_logic;
signal axil_araddr          : std_logic_vector(AXIL_ADDR_WIDTH-1 downto 0);
signal axil_arready         : std_logic;
signal axil_rdata           : std_logic_vector(AXIL_DATA_WIDTH-1 downto 0);
signal axil_rresp           : std_logic_vector(1 downto 0);
signal axil_rvalid          : std_logic;

-- Valid addresses
signal axil_awaddr_valid    : integer;
signal axil_araddr_valid    : integer;

-- Registers
signal registers_out        : reg_array(NB_REGISTERS_OUT-1 downto 0) := (others => (others => '0')); --DFF that stores value from AXI writes

-- Others
signal aw_en                : std_logic;
signal slv_reg_rden         : std_logic;
signal slv_reg_wren         : std_logic;


begin


-- Always
S_AXIL_out.awready          <= axil_awready;
S_AXIL_out.wready           <= axil_wready;
S_AXIL_out.bresp            <= axil_bresp;
S_AXIL_out.bvalid           <= axil_bvalid;
S_AXIL_out.arready          <= axil_arready;
S_AXIL_out.rdata            <= axil_rdata;
S_AXIL_out.rresp            <= axil_rresp;
S_AXIL_out.rvalid           <= axil_rvalid;

axil_awaddr_valid           <= to_integer(shift_right(unsigned(axil_awaddr(REG_ADDR_WIDTH-1 downto 0)), ADDR_LSB)) when ((axil_awaddr and (not REG_ADDR_MASK)) = NULL_VECTOR) else -1;
axil_araddr_valid           <= to_integer(shift_right(unsigned(axil_araddr(REG_ADDR_WIDTH-1 downto 0)), ADDR_LSB)) when ((axil_araddr and (not REG_ADDR_MASK)) = NULL_VECTOR) else -1;

REG_ARRAY_PORT_o            <= registers_out;


-- ======================================= Processes ========================================
-- Implement awready generation
-- awready is asserted for one clock cycle when both
-- awvalid and wvalid are asserted. awready is
-- de-asserted when reset is low.
process(clk_i)
begin
    if rising_edge(clk_i) then 
        if rstn_i = '0' then
            axil_awready <= '0';
            aw_en <= '1';
        else
            if (axil_awready = '0' and S_AXIL_in.awvalid = '1' and S_AXIL_in.wvalid = '1' and aw_en = '1') then
            -- slave is ready to accept write address when
            -- there is a valid write address and write data
            -- on the write address and data bus. This design 
            -- expects no outstanding transactions. 
                axil_awready <= '1';
                aw_en <= '0';
            elsif (S_AXIL_in.bready = '1' and axil_bvalid = '1') then
                aw_en <= '1';
                axil_awready <= '0';
            else
                axil_awready <= '0';
            end if;
        end if;
    end if;
end process;


-- Implement awaddr latching
-- This process is used to latch the address when both 
-- awvalid and wvalid are valid.
process (clk_i)
begin
    if rising_edge(clk_i) then 
        if rstn_i = '0' then
            axil_awaddr <= (others => '0');
        else
            if (axil_awready = '0' and S_AXIL_in.awvalid = '1' and S_AXIL_in.wvalid = '1' and aw_en = '1') then
            -- Write Address latching
            axil_awaddr <= std_logic_vector(unsigned(S_AXIL_in.awaddr) - unsigned(BASE_ADDRESS));
            end if;
        end if;
    end if;                   
end process;


-- Implement wready generation
-- wready is asserted for one clock cycle when both
-- awvalid and wvalid are asserted. wready is 
-- de-asserted when reset is low. 
process (clk_i)
begin
    if rising_edge(clk_i) then 
        if rstn_i = '0' then
            axil_wready <= '0';
        else
            if (axil_wready = '0' and S_AXIL_in.wvalid = '1' and S_AXIL_in.awvalid = '1' and aw_en = '1') then
                -- slave is ready to accept write data when 
                -- there is a valid write address and write data
                -- on the write address and data bus. This design 
                -- expects no outstanding transactions.           
                axil_wready <= '1';
            else
                axil_wready <= '0';
            end if;
        end if;
    end if;
end process;


-- Implement memory mapped register select and write logic generation
-- The write data is accepted and written to memory mapped registers when
-- awready, wvalid, wready and wvalid are asserted.
-- These registers are cleared when reset (active low) is applied.
-- Slave register write enable is asserted when valid address and data are available
-- and the slave is ready to accept the write address and write data.
slv_reg_wren <= axil_wready and S_AXIL_in.wvalid and axil_awready and S_AXIL_in.awvalid;

process (clk_i)
begin
    if rising_edge(clk_i) then 
        if rstn_i = '0' then
            registers_out <= (others => (others => '0'));
        else
            if (slv_reg_wren = '1') then
                if ((axil_awaddr_valid >= 0) and (axil_awaddr_valid < NB_REGISTERS_OUT)) then   --Output port
                    registers_out(axil_awaddr_valid) <= S_AXIL_in.wdata;
                else                                                                            --Not output port
                    --nothing
                end if;
            end if;
        end if;
    end if;                  
end process;


-- Implement write response logic generation
-- The write response and response valid signals are asserted by the slave 
-- when awready, awvalid, wready and wvalid are asserted.  
-- This marks the acceptance of address and indicates the status of 
-- write transaction.
process (clk_i)
begin
    if rising_edge(clk_i) then 
        if rstn_i = '0' then
            axil_bvalid  <= '0';
            axil_bresp   <= "00"; --need to work more on the responses
        else
            if (axil_awready = '1' and S_AXIL_in.awvalid = '1' and axil_wready = '1' and S_AXIL_in.wvalid = '1' and axil_bvalid = '0'  ) then
                axil_bvalid <= '1';
                axil_bresp  <= "00"; 
            elsif (S_AXIL_in.bready = '1' and axil_bvalid = '1') then   --check if bready is asserted while bvalid is high)
                axil_bvalid <= '0';                                     -- (there is a possibility that bready is always asserted high)
            end if;
        end if;
    end if;                   
end process;


-- Implement arready generation
-- arready is asserted for one clock cycle when
-- arvalid is asserted. awready is 
-- de-asserted when reset (active low) is asserted. 
-- The read address is also latched when arvalid is 
-- asserted. araddr is reset to zero on reset assertion.
process (clk_i)
begin
    if rising_edge(clk_i) then 
        if rstn_i = '0' then
            axil_arready <= '0';
            axil_araddr  <= (others => '0');
        else
            if (axil_arready = '0' and S_AXIL_in.arvalid = '1') then
                -- indicates that the slave has acceped the valid read address
                axil_arready <= '1';
                -- Read Address latching 
                axil_araddr <= std_logic_vector(unsigned(S_AXIL_in.araddr) - unsigned(BASE_ADDRESS));         
            else
                axil_arready <= '0';
            end if;
        end if;
    end if;                   
end process; 


-- Implement rvalid generation
-- rvalid is asserted for one clock cycle when both 
-- arvalid and arready are asserted. The slave registers 
-- data are available on the rdata bus at this instance. The 
-- assertion of rvalid marks the validity of read data on the 
-- bus and rresp indicates the status of read transaction. rvalid 
-- is deasserted on reset (active low). rresp and rdata are 
-- cleared to zero on reset (active low).
process (clk_i)
begin
    if rising_edge(clk_i) then
        if rstn_i = '0' then
            axil_rvalid <= '0';
            axil_rresp  <= "00";
        else
            if (axil_arready = '1' and S_AXIL_in.arvalid = '1' and axil_rvalid = '0') then
                -- Valid read data is available at the read data bus
                axil_rvalid <= '1';
                axil_rresp  <= "00"; -- 'OKAY' response
            elsif (axil_rvalid = '1' and S_AXIL_in.rready = '1') then
                -- Read data is accepted by the master
                axil_rvalid <= '0';
            end if;            
        end if;
    end if;
end process;


-- Implement memory mapped register select and read logic generation
-- Slave register read enable is asserted when valid address is available
-- and the slave is ready to accept the read address.
slv_reg_rden <= axil_arready and S_AXIL_in.arvalid and (not axil_rvalid) ;

-- Output register or memory read data
process (clk_i)
begin
    if rising_edge(clk_i) then
        if rstn_i = '0' then
            axil_rdata <= (others => '0');
        else
            if (slv_reg_rden = '1') then
                -- When there is a valid read address (S_AXIL_in.arvalid) with 
                -- acceptance of read address by the slave (axil_arready), 
                -- output the read dada 
                -- Read address mux
                if ((axil_araddr_valid >= 0) and (axil_araddr_valid < NB_REGISTERS_OUT)) then                                       --Output port
                    axil_rdata <= registers_out(axil_araddr_valid);
                elsif ((axil_araddr_valid >= NB_REGISTERS_OUT) and (axil_araddr_valid < (NB_REGISTERS_OUT+NB_REGISTERS_IN))) then   --Input port
                    axil_rdata <= REG_ARRAY_PORT_i(axil_araddr_valid - NB_REGISTERS_OUT);
                else                                                                                                                --Not output or input port
                    axil_rdata <= (others => '0');
                end if;
            end if;
        end if;
    end if;
end process;


end Behavioral;