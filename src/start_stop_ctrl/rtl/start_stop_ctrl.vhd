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
--                 Copyright Â© 2024 Viveris Technologies
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

--============================================================================-
-- Revision list
-- Version   Author                 Date                        Changes
--
-- 1.0    Jean-François DEL NERO  4 December 2020          First version
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

entity start_stop_ctrl is
	port(
		clk : in std_logic;
		reset_n : in std_logic;

		ctrl_start                   : in  std_logic;

		ctrl_reset_ip                : in  std_logic;

		ctrl_auto_restart            : in  std_logic;

		status_running               : out std_logic;

		status_end_process           : out std_logic;

		duration_count               : out  std_logic_vector(31 downto 0);
		duration_count_latched       : out  std_logic_vector(31 downto 0);

		iteration_count              : out  std_logic_vector(31 downto 0);

		ip_start                     : out std_logic;
		ip_reset                     : out std_logic;
		ip_stop                      : in  std_logic

		);
end start_stop_ctrl;

architecture arch of start_stop_ctrl is

signal cnt : std_logic_vector(31 downto 0);
signal cnt_iter : std_logic_vector(31 downto 0);

signal ctrl_start_ff : std_logic;
signal ctrl_start_pulse : std_logic;

signal ctrl_reset_ip_ff : std_logic;
signal ctrl_reset_ip_pulse : std_logic;

signal ip_stop_ff : std_logic;
signal ip_stop_pulse : std_logic;
signal ip_stop_state : std_logic;

signal running_state : std_logic;

begin

	iteration_count <= cnt_iter;
	duration_count <= cnt;
	status_running <= running_state;

	process(clk, reset_n ) begin
		if(reset_n = '0') then

			ctrl_start_ff <= '0';
			ctrl_start_pulse <= '0';

		elsif(clk'event and clk = '1') then
			ctrl_start_pulse <= '0';
			ctrl_start_ff <= ctrl_start;

			if( ctrl_start = '1' and ctrl_start_ff = '0')
			then
				ctrl_start_pulse <= '1';
			end if;

		end if;
	end process;

	process(clk, reset_n ) begin
		if(reset_n = '0') then

			ctrl_reset_ip_ff <= '0';
			ctrl_reset_ip_pulse <= '0';

		elsif(clk'event and clk = '1') then
			ctrl_reset_ip_pulse <= '0';
			ctrl_reset_ip_ff <= ctrl_reset_ip;

			if( ctrl_reset_ip = '1' and ctrl_reset_ip_ff = '0')
			then
				ctrl_reset_ip_pulse <= '1';
			end if;

		end if;
	end process;

	process(clk, reset_n ) begin
		if(reset_n = '0') then

			ip_stop_ff <= '0';
			ip_stop_pulse <= '0';

		elsif(clk'event and clk = '1') then
			ip_stop_pulse <= '0';
			ip_stop_ff <= ip_stop;

			if( ip_stop = '1' and ip_stop_ff = '0')
			then
				ip_stop_pulse <= '1';
			end if;
		end if;
	end process;

	process(clk, reset_n ) begin
		if(reset_n = '0') then

			cnt <= (others=>'0');
			cnt_iter <= (others=>'0');
			duration_count_latched <= (others=>'0');

			ip_start  <= '0';
			ip_reset  <= '0';
			running_state <= '0';
			status_end_process <= '0';

		elsif(clk'event and clk = '1') then

			ip_start  <= '0';
			ip_reset  <= '1';

			if( ctrl_start_pulse = '1' and running_state = '0')
			then
				running_state <='1';
				ip_start <= '1';
				cnt <= (others => '0');
				status_end_process <= '0';
			end if;

			if( ip_stop_pulse = '1')
			then
				running_state <= '0';
				duration_count_latched <= cnt;
				status_end_process <= '1';
				if( ctrl_auto_restart = '1' )
				then
					status_end_process <= '0';
					running_state <='1';
					ip_start <= '1';
					cnt <= (others => '0');
					cnt_iter <= cnt_iter + conv_std_logic_vector(1,32);
				end if;
			else
				if( running_state = '1' )
				then
					cnt <= cnt + conv_std_logic_vector(1,32);
				end if;
			end if;

			if( ctrl_reset_ip_pulse = '1')
			then
				ip_reset <= '0';
				running_state <='0';
				status_end_process <= '0';
				cnt_iter <= (others => '0');
				cnt <= (others => '0');
			end if;

		end if;
	end process;

end arch;
