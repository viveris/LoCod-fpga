library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use work.locod_pkg.all;


entity top is
port(
	-- Clock and reset
    clk 				: in std_logic;
    rst 				: in std_logic;
    
    -- AXI Slave Control
    S_AXI_in 			: in AXI4Lite_m_to_s;
    S_AXI_out 			: out AXI4Lite_s_to_m;
    
    -- AXI Master Accelerator array
    M_AXI_out_array 	: out AXI4Lite_m_to_s_array;
    M_AXI_in_array 		: in AXI4Lite_s_to_m_array
);
end top;

architecture Behavioral of top is

signal ctrl_reg_out : std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
signal ctrl_reg_in : std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
signal registers : reg_array; 


begin


axi_reg_inst : entity work.axi_reg
port map(
	clk 		    => clk,
	rst 	        => rst,
    S_AXI_in        => S_AXI_in,
    S_AXI_out       => S_AXI_out,
    CTRL_REG_OUT    => ctrl_reg_out,
    CTRL_REG_IN     => ctrl_reg_in,
    REG_ARRAY_PORT  => registers
);


accelerators_inst : for i in 0 to NB_ACCELERATORS-1 generate
    accelerator_inst : entity work.accelerator
    generic map(
        acc_num => i
    )
    port map(
        clk					=> clk,
        rst 				=> rst,
        start 				=> ctrl_reg_out(3*i),
        reset 				=> ctrl_reg_out(3*i+1),
        param 				=> registers(2*i),
        result  			=> registers(2*i+1),
        status_end_process 	=> ctrl_reg_in(3*i+2),
        M_AXI_out           => M_AXI_out_array(i),
        M_AXI_in            => M_AXI_in_array(i)
    );
end generate;

end Behavioral;

