-------------------------------------------------------------------------------
-- Title      : AXI_MASTER_INTERFACE
-- Project    : LOCOD
-------------------------------------------------------------------------------
-- File       : axi_master_interface.vhd
-- Author     : Colin Constans
-- Date       : 2023-05-12
-- Company    : VIVERIS
-- Platform   : Vivado 2021.2
-- Standard   : VHDL 93/02
-------------------------------------------------------------------------------
-- Description: Signal transmitter for axi_interconnect master interface
-------------------------------------------------------------------------------
-- Copyright (c) 2023
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

use work.locod_pkg.all;

entity axi_master_interface is
    Generic (
        NB_MASTER                      : integer := 2;
        ADDR_SIZE                      : integer := 32;
        DATA_SIZE                      : integer := 32;
        PROT_SIZE                      : integer := 3;
        STRB_SIZE                      : integer := 4;
        RESP_SIZE                      : integer := 2
    );
    Port (
        i_clk                         : in  std_logic;
        i_rst_n                       : in  std_logic;
        o_master_interface            : out AXI4Lite_m_to_s;
        i_master_interface            : in  AXI4Lite_s_to_m;
        i_internal_interface          : in  AXI4Lite_m_to_s_array(0 to NB_MASTER-1);
        o_internal_interface          : out AXI4Lite_s_to_m_array(0 to NB_MASTER-1)
    );
end axi_master_interface;

architecture Behavioral of axi_master_interface is

type t_state is (idle, ar, r, aw, aw_wait, w, b);
signal sm_state                       : t_state := idle;
signal s_master_index                 : integer range 0 to NB_MASTER-1 := 0;
signal s_araddr                       : std_logic_vector(ADDR_SIZE-1 downto 0) := (others=>'0');
signal s_arprot                       : std_logic_vector(PROT_SIZE-1 downto 0) := (others=>'0');
signal s_awaddr                       : std_logic_vector(ADDR_SIZE-1 downto 0) := (others=>'0');
signal s_awprot                       : std_logic_vector(PROT_SIZE-1 downto 0) := (others=>'0');
signal s_wdata                        : std_logic_vector(ADDR_SIZE-1 downto 0) := (others=>'0');
signal s_wstrb                        : std_logic_vector(STRB_SIZE-1 downto 0) := (others=>'0');
signal s_read_done                    : std_logic := '0';
signal s_write_done                   : std_logic := '0';

signal s_o_master_interface           : AXI4Lite_m_to_s := c_m_to_s;
signal s_i_master_interface           : AXI4Lite_s_to_m := c_s_to_m;
signal s_i_internal_interface         : AXI4Lite_m_to_s_array(0 to NB_MASTER-1) := (others=>c_m_to_s);
signal s_o_internal_interface         : AXI4Lite_s_to_m_array(0 to NB_MASTER-1) := (others=>c_s_to_m);

begin

p_master : process(i_clk)
    begin
        if rising_edge(i_clk) then
            if (i_rst_n = '0') then
                o_master_interface.arvalid <= '0';
                o_master_interface.awvalid <= '0';
                o_master_interface.wvalid <= '0';
                o_master_interface.bready <= '0';
                o_master_interface.rready <= '0';
                s_write_done <= '0';
                s_read_done  <= '0';
                sm_state <= idle;
            else
                case (sm_state) is
                    when idle =>
                        o_internal_interface(s_master_index).rvalid <= '0';
                        o_master_interface.arvalid <= '0';
                        o_internal_interface(s_master_index).bvalid <= '0';
                        o_master_interface.awvalid <= '0';
                        o_master_interface.wvalid <= '0';
                        if i_internal_interface(s_master_index).awvalid='1' and s_write_done='0' then
                            s_awaddr <= i_internal_interface(s_master_index).awaddr;
                            s_awprot <= i_internal_interface(s_master_index).awprot;
                            o_internal_interface(s_master_index).awready <= '1'; --ACK that buffer have been cleared
                            s_write_done <= '1'; --Only complete one write transmission per slave to avoid starvation
                            sm_state <= aw;
                        elsif i_internal_interface(s_master_index).arvalid='1' and s_read_done='0' then
                            s_araddr <= i_internal_interface(s_master_index).araddr;
                            s_arprot <= i_internal_interface(s_master_index).arprot;
                            o_internal_interface(s_master_index).arready <= '1'; --ACK that buffer have been cleared
                            s_read_done <= '1'; --Only complete one write transmission per slave to avoid starvation
                            sm_state <= ar;
                        else
                            s_write_done <= '0';
                            s_read_done  <= '0';
                            o_internal_interface(s_master_index).awready <= '0';
                            if s_master_index=NB_MASTER-1 then
                                s_master_index <= 0;
                            else
                                s_master_index <= s_master_index + 1;
                            end if;
                        end if;

                    when aw =>
                        o_internal_interface(s_master_index).awready <= '0';
                        if i_master_interface.awready='1' then --External slave ready to listen
                            o_master_interface.awaddr <= s_awaddr;
                            o_master_interface.awprot <= s_awprot;
                            o_master_interface.awvalid <= '1';
                            sm_state <= aw_wait;
                        end if;

                    when aw_wait =>
                        o_master_interface.awvalid <= '0';
                        if i_internal_interface(s_master_index).wvalid='1' then
                            s_wdata <= i_internal_interface(s_master_index).wdata;
                            s_wstrb <= i_internal_interface(s_master_index).wstrb;
                            o_internal_interface(s_master_index).wready <= '1'; --ACK that buffer have been cleared
                            sm_state <= w;
                        end if;

                    when w =>
                        o_internal_interface(s_master_index).wready <= '0';
                        if i_master_interface.wready='1' then --External slave ready to listen
                            o_master_interface.wdata <= s_wdata;
                            o_master_interface.wstrb <= s_wstrb;
                            o_master_interface.wvalid <= '1';
                            o_master_interface.bready <= '1';
                            sm_state <= b;
                        end if;

                    when b =>
                        o_master_interface.wvalid <= '0';
                        if i_master_interface.bvalid='1' then -- Response received
                            o_internal_interface(s_master_index).bresp <= i_master_interface.bresp;
                            o_internal_interface(s_master_index).bvalid <= '1';
                            o_master_interface.bready <= '0';
                            sm_state <= idle;
                        end if;

                    when ar =>
                        o_internal_interface(s_master_index).arready <= '0';
                        if i_master_interface.arready='1' then --External slave ready to listen
                            o_master_interface.araddr <= s_araddr;
                            o_master_interface.arprot <= s_arprot;
                            o_master_interface.arvalid <= '1';
                            o_master_interface.rready <= '1';
                            sm_state <= r;
                        end if;

                    when r =>
                        o_master_interface.arvalid <= '0';
                        if i_master_interface.rvalid='1' then -- Response received
                            o_internal_interface(s_master_index).rdata <= i_master_interface.rdata;
                            o_internal_interface(s_master_index).rresp <= i_master_interface.rresp;
                            o_internal_interface(s_master_index).rvalid <= '1';
                            o_master_interface.rready <= '0';
                            sm_state <= idle;
                        end if;

                    when others =>
                        sm_state <= idle;

                end case;
            end if;
        end if;
end process;

end Behavioral;
