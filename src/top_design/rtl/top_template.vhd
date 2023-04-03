library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

use work.locod_pkg.all;

entity top is
port(
	-- Clock and reset
    clk 				: in std_logic;
    rst 				: in std_logic;
    
    -- AXI Slave Control
    S_AXI_in 			: in AXI4Lite_m_to_s;
    S_AXI_out 			: out AXI4Lite_s_to_m;
    
    -- AXI Master Accelerator
    M_AXI_out 	       	: out AXI4Lite_m_to_s;
    M_AXI_in 		   	: in AXI4Lite_s_to_m
);
end top;

architecture Behavioral of top is

function generate_tri_state_value(NB_ACC: integer)
return std_logic_vector
is
    variable result : std_logic_vector((3*NB_ACC+2)-1 downto 0);
    variable control_tri_state : std_logic_vector(2-1 downto 0) := "10";
    variable acc_tri_state : std_logic_vector(3-1 downto 0) := "100";
begin
    result(1 downto 0) := control_tri_state;
    for i in 1 to NB_ACC loop
        result(2+i*3-1 downto 2+(i-1)*3) := acc_tri_state;
    end loop;
    return result;
end;

signal registers : reg_array(0 to (3*NB_ACCELERATORS+2)-1);
signal M_AXI_out_array : AXI4Lite_m_to_s_array(0 to NB_ACCELERATORS-1);
signal M_AXI_in_array : AXI4Lite_s_to_m_array(0 to NB_ACCELERATORS-1);


begin


axi_reg_inst : entity work.axi_reg
generic map(
    NB_REGISTERS    => 3*NB_ACCELERATORS+2
)
port map(
	clk 		    => clk,
	rst 	        => rst,
    S_AXI_in        => S_AXI_in,
    S_AXI_out       => S_AXI_out,
    TRI_STATE       => generate_tri_state_value(NB_ACCELERATORS),
    REG_ARRAY_PORT  => registers
);

axi_interconnect_inst : entity work.axi_interconnect
generic map(
    NB_MASTERS          => NB_ACCELERATORS
)
port map(
    clk                 => clk,
    rst                 => rst,
    S_AXI_in_array      => M_AXI_out_array,
    S_AXI_out_array     => M_AXI_in_array,
    M_AXI_out           => M_AXI_out,
    M_AXI_in            => M_AXI_in
);


--accelerator_inst : entity work.accelerator_i
--port map(
--	clk					    => clk,
--	rst 				    => rst,
--	start 				    => registers(0)(2*i),
--	reset 				    => registers(0)(2*i+1),
--	param 				    => registers(3*i+2),
--	result  			    => registers(3*i+2+1),
--	status_end_process 	    => registers(1)(i),
--	duration_count_latched  => registers(3*i+2+2),
--	M_AXI_out               => M_AXI_out_array(i),
--	M_AXI_in                => M_AXI_in_array(i)
--);

--end Behavioral;


-- end Behavioral;

