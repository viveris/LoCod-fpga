-------------------------------------------------------------------------------
-- Title      : AXI_CHANNEL BUFFER
-- Project    : LoCod
-------------------------------------------------------------------------------
-- File       : axi_channel_buffer.vhd
-- Author     : Colin Constans
-- Date       : 2023-05-11
-- Company    : VIVERIS
-- Platform   : Vivado 2021.2
-- Standard   : VHDL 93/02
-------------------------------------------------------------------------------
-- Description: Input buffer storing signals for master round robin
-------------------------------------------------------------------------------
-- Copyright (c) 2023
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity axi_channel_buffer is
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
end axi_channel_buffer;

architecture Behavioral of axi_channel_buffer is

    signal s_empty_buffer             : std_logic := '1';

begin

p_buffer : process(i_clk)
    begin
        if rising_edge(i_clk) then
            if (i_rst_n = '0') then
                o_ready <= '1';
                o_data_valid <= '0';
            else
                if i_data_valid='1' and s_empty_buffer='1' then
                    o_ready <= '0';
                    o_data <= i_data;
                    o_data_aux <= i_data_aux;
                    o_data_valid <= '1';
                    s_empty_buffer <= '0';
                elsif i_ack='1' and s_empty_buffer='0' then
                    o_ready <= '1';
                    o_data_valid <= '0';
                    s_empty_buffer <= '1';
                end if;
            end if;
        end if;
end process;

end Behavioral;
