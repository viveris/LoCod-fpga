library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

use work.locod_pkg.all;

entity top is
port(
	-- Clock and reset
    clk             : in std_logic;
    rst             : in std_logic;

    -- AXI Slave Control
    S_AXI_awaddr    : in std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
    S_AXI_awprot    : in std_logic_vector(2 downto 0);
    S_AXI_awvalid   : in std_logic;
    S_AXI_awready   : out std_logic;
    S_AXI_wdata     : in std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    S_AXI_wstrb     : in std_logic_vector(3 downto 0);
    S_AXI_wvalid    : in std_logic;
    S_AXI_wready    : out std_logic;
    S_AXI_bresp     : out std_logic_vector(1 downto 0);
    S_AXI_bvalid    : out std_logic;
    S_AXI_bready    : in std_logic;
    S_AXI_araddr    : in std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
    S_AXI_arprot    : in std_logic_vector(2 downto 0);
    S_AXI_arvalid   : in std_logic;
    S_AXI_arready   : out std_logic;
    S_AXI_rdata     : out std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    S_AXI_rresp     : out std_logic_vector(1 downto 0);
    S_AXI_rvalid    : out std_logic;
    S_AXI_rready    : in std_logic;

    -- AXI Master
    M_AXI_awaddr    : out std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
    M_AXI_awprot    : out std_logic_vector(2 downto 0);
    M_AXI_awvalid   : out std_logic;
    M_AXI_awready   : in std_logic;  
    M_AXI_wdata     : out std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    M_AXI_wstrb     : out std_logic_vector(3 downto 0);
    M_AXI_wvalid    : out std_logic;
    M_AXI_wready    : in std_logic;  
    M_AXI_bresp     : in std_logic_vector(1 downto 0);
    M_AXI_bvalid    : in std_logic;
    M_AXI_bready    : out std_logic;  
    M_AXI_araddr    : out std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
    M_AXI_arprot    : out std_logic_vector(2 downto 0);
    M_AXI_arvalid   : out std_logic;
    M_AXI_arready   : in std_logic;   
    M_AXI_rdata     : in std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    M_AXI_rresp     : in std_logic_vector(1 downto 0);
    M_AXI_rvalid    : in std_logic;
    M_AXI_rready    : out std_logic
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

signal S_AXI_in : AXI4Lite_m_to_s;
signal S_AXI_out : AXI4Lite_s_to_m;

signal M_AXI_out_array : AXI4Lite_m_to_s_array(0 to NB_ACCELERATORS-1);
signal M_AXI_in_array : AXI4Lite_s_to_m_array(0 to NB_ACCELERATORS-1);

signal M_AXI_out : AXI4Lite_m_to_s;
signal M_AXI_in : AXI4Lite_s_to_m;


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

axi_slave_if_inst : entity work.axi_slave_if
port map (
    S_AXI_awaddr    => S_AXI_awaddr,    
    S_AXI_awprot    => S_AXI_awprot,    
    S_AXI_awvalid   => S_AXI_awvalid,  
    S_AXI_awready   => S_AXI_awready,  
    S_AXI_wdata     => S_AXI_wdata,     
    S_AXI_wstrb     => S_AXI_wstrb,     
    S_AXI_wvalid    => S_AXI_wvalid,    
    S_AXI_wready    => S_AXI_wready,    
    S_AXI_bresp     => S_AXI_bresp,     
    S_AXI_bvalid    => S_AXI_bvalid,    
    S_AXI_bready    => S_AXI_bready,    
    S_AXI_araddr    => S_AXI_araddr,    
    S_AXI_arprot    => S_AXI_arprot,    
    S_AXI_arvalid   => S_AXI_arvalid,  
    S_AXI_arready   => S_AXI_arready,  
    S_AXI_rdata     => S_AXI_rdata,     
    S_AXI_rresp     => S_AXI_rresp,     
    S_AXI_rvalid    => S_AXI_rvalid,    
    S_AXI_rready    => S_AXI_rready,    
    S_AXI_in        => S_AXI_in,       
    S_AXI_out       => S_AXI_out      
);

axi_master_if_inst : entity work.axi_master_if
port map (
    M_AXI_awaddr    => M_AXI_awaddr,
    M_AXI_awprot    => M_AXI_awprot,
    M_AXI_awvalid   => M_AXI_awvalid,
    M_AXI_awready   => M_AXI_awready,
    M_AXI_wdata     => M_AXI_wdata,
    M_AXI_wstrb     => M_AXI_wstrb,
    M_AXI_wvalid    => M_AXI_wvalid,
    M_AXI_wready    => M_AXI_wready,
    M_AXI_bresp     => M_AXI_bresp,
    M_AXI_bvalid    => M_AXI_bvalid,
    M_AXI_bready    => M_AXI_bready,
    M_AXI_araddr    => M_AXI_araddr,
    M_AXI_arprot    => M_AXI_arprot,
    M_AXI_arvalid   => M_AXI_arvalid,
    M_AXI_arready   => M_AXI_arready,
    M_AXI_rdata     => M_AXI_rdata,
    M_AXI_rresp     => M_AXI_rresp,
    M_AXI_rvalid    => M_AXI_rvalid,
    M_AXI_rready    => M_AXI_rready,
    M_AXI_out       => M_AXI_out,
    M_AXI_in        => M_AXI_in
);

axi_interconnect_inst : entity work.axi_interconnect_c
generic map(
    NB_MASTER           => NB_ACCELERATORS,
    ADDR_SIZE           => AXI_ADDR_WIDTH,
    DATA_SIZE           => AXI_DATA_WIDTH
)
port map(
    i_clk               => clk,
    i_rst_n             => rst,
    i_s_axi_array       => M_AXI_out_array,
    o_s_axi_array       => M_AXI_in_array,
    o_m_axi             => M_AXI_out,
    i_m_axi             => M_AXI_in
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

