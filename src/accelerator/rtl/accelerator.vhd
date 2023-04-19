library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use work.locod_pkg.all;

entity accelerator is
generic(
    acc_num : integer := 0
);
port(
    -- IN
    clk 				    : in std_logic;
    rst 				    : in std_logic;
    start 				    : in std_logic;
    reset 				    : in std_logic;
    param 				    : in std_logic_vector(31 downto 0);
    result 				    : in std_logic_vector(31 downto 0);
    
    -- OUT
    status_end_process 	    : out std_logic;
    duration_count_latched  : out std_logic_vector(31 downto 0);
    
    -- AXI4 LITE Bus
	M_AXI_out       	    : out AXI4Lite_m_to_s;
    M_AXI_in        	    : in AXI4Lite_s_to_m
);
end accelerator;


architecture Behavioral of accelerator is

signal ip_start : std_logic;
signal ip_stop : std_logic;
signal ip_reset : std_logic;

signal oe_ram : std_logic;
signal we_ram : std_logic;
signal addr_ram : std_logic_vector(31 downto 0);
signal w_data_ram : std_logic_vector(31 downto 0);
signal r_data_ram : std_logic_vector(31 downto 0);
signal data_rdy : std_logic;

constant C_INIT_AXI_TXN : std_logic := '0';
constant C_SIN_DATA_RAM_SIZE : std_logic_vector(5 downto 0) := "000000";


component acc_0 is 
port (
    clock : in std_logic;
    reset : in std_logic;
    start_port : in std_logic;
    param : in std_logic_vector(31 downto 0) ;
    result : in std_logic_vector(31 downto 0) ;
    M_Rdata_ram : in std_logic_vector(31 downto 0) ;
    M_DataRdy : in std_logic;
    done_port : out std_logic;
    Mout_oe_ram : out std_logic;
    Mout_we_ram : out std_logic;
    Mout_addr_ram : out std_logic_vector(31 downto 0) ;
    Mout_Wdata_ram : out std_logic_vector(31 downto 0) ;
    Mout_data_ram_size : out std_logic_vector(5 downto 0) 
);
end component;

component acc_1 is 
port (
    clock : in std_logic;
    reset : in std_logic;
    start_port : in std_logic;
    param : in std_logic_vector(31 downto 0) ;
    result : in std_logic_vector(31 downto 0) ;
    M_Rdata_ram : in std_logic_vector(31 downto 0) ;
    M_DataRdy : in std_logic;
    done_port : out std_logic;
    Mout_oe_ram : out std_logic;
    Mout_we_ram : out std_logic;
    Mout_addr_ram : out std_logic_vector(31 downto 0) ;
    Mout_Wdata_ram : out std_logic_vector(31 downto 0) ;
    Mout_data_ram_size : out std_logic_vector(5 downto 0) 
);
end component;

component acc_2 is 
port (
    clock : in std_logic;
    reset : in std_logic;
    start_port : in std_logic;
    param : in std_logic_vector(31 downto 0) ;
    result : in std_logic_vector(31 downto 0) ;
    M_Rdata_ram : in std_logic_vector(31 downto 0) ;
    M_DataRdy : in std_logic;
    done_port : out std_logic;
    Mout_oe_ram : out std_logic;
    Mout_we_ram : out std_logic;
    Mout_addr_ram : out std_logic_vector(31 downto 0) ;
    Mout_Wdata_ram : out std_logic_vector(31 downto 0) ;
    Mout_data_ram_size : out std_logic_vector(5 downto 0) 
);
end component;

component acc_3 is 
port (
    clock : in std_logic;
    reset : in std_logic;
    start_port : in std_logic;
    param : in std_logic_vector(31 downto 0) ;
    result : in std_logic_vector(31 downto 0) ;
    M_Rdata_ram : in std_logic_vector(31 downto 0) ;
    M_DataRdy : in std_logic;
    done_port : out std_logic;
    Mout_oe_ram : out std_logic;
    Mout_we_ram : out std_logic;
    Mout_addr_ram : out std_logic_vector(31 downto 0) ;
    Mout_Wdata_ram : out std_logic_vector(31 downto 0) ;
    Mout_data_ram_size : out std_logic_vector(5 downto 0) 
);
end component;

component acc_4 is 
port (
    clock : in std_logic;
    reset : in std_logic;
    start_port : in std_logic;
    param : in std_logic_vector(31 downto 0) ;
    result : in std_logic_vector(31 downto 0) ;
    M_Rdata_ram : in std_logic_vector(31 downto 0) ;
    M_DataRdy : in std_logic;
    done_port : out std_logic;
    Mout_oe_ram : out std_logic;
    Mout_we_ram : out std_logic;
    Mout_addr_ram : out std_logic_vector(31 downto 0) ;
    Mout_Wdata_ram : out std_logic_vector(31 downto 0) ;
    Mout_data_ram_size : out std_logic_vector(5 downto 0) 
);
end component;

component acc_5 is 
port (
    clock : in std_logic;
    reset : in std_logic;
    start_port : in std_logic;
    param : in std_logic_vector(31 downto 0) ;
    result : in std_logic_vector(31 downto 0) ;
    M_Rdata_ram : in std_logic_vector(31 downto 0) ;
    M_DataRdy : in std_logic;
    done_port : out std_logic;
    Mout_oe_ram : out std_logic;
    Mout_we_ram : out std_logic;
    Mout_addr_ram : out std_logic_vector(31 downto 0) ;
    Mout_Wdata_ram : out std_logic_vector(31 downto 0) ;
    Mout_data_ram_size : out std_logic_vector(5 downto 0) 
);
end component;

component acc_6 is 
port (
    clock : in std_logic;
    reset : in std_logic;
    start_port : in std_logic;
    param : in std_logic_vector(31 downto 0) ;
    result : in std_logic_vector(31 downto 0) ;
    M_Rdata_ram : in std_logic_vector(31 downto 0) ;
    M_DataRdy : in std_logic;
    done_port : out std_logic;
    Mout_oe_ram : out std_logic;
    Mout_we_ram : out std_logic;
    Mout_addr_ram : out std_logic_vector(31 downto 0) ;
    Mout_Wdata_ram : out std_logic_vector(31 downto 0) ;
    Mout_data_ram_size : out std_logic_vector(5 downto 0) 
);
end component;

component acc_7 is 
port (
    clock : in std_logic;
    reset : in std_logic;
    start_port : in std_logic;
    param : in std_logic_vector(31 downto 0) ;
    result : in std_logic_vector(31 downto 0) ;
    M_Rdata_ram : in std_logic_vector(31 downto 0) ;
    M_DataRdy : in std_logic;
    done_port : out std_logic;
    Mout_oe_ram : out std_logic;
    Mout_we_ram : out std_logic;
    Mout_addr_ram : out std_logic_vector(31 downto 0) ;
    Mout_Wdata_ram : out std_logic_vector(31 downto 0) ;
    Mout_data_ram_size : out std_logic_vector(5 downto 0) 
);
end component;


begin


start_stop_ctrl_inst : entity work.start_stop_ctrl
port map (
    clk                         => clk,
    reset_n                     => rst,
    ctrl_start                  => start,
    ctrl_reset_ip               => reset,
    ctrl_auto_restart           => '0',
    status_running              => open,
    status_end_process          => status_end_process,
    duration_count              => open,
    duration_count_latched      => duration_count_latched,
    iteration_count             => open,
    ip_start                    => ip_start,
    ip_reset                    => ip_reset,
    ip_stop                     => ip_stop
);


master_memory_ctrl_inst : entity work.master_memory_ctrl
port map (
    SIN_WDATA_RAM => w_data_ram,
    SIN_OE_RAM => oe_ram,
    SIN_WE_RAM => we_ram,
    SIN_ADDR_RAM => addr_ram,
    SIN_DATA_RAM_SIZE => C_SIN_DATA_RAM_SIZE,
    INIT_AXI_TXN => C_INIT_AXI_TXN,
    M_AXI_ACLK => clk,
    M_AXI_ARESETN => rst,
    S_DATARDY => data_rdy,
    SOUT_RDATA_RAM => r_data_ram,
    ERROR => open,
    TXN_DONE => open,   
    M_AXI_AWADDR => M_AXI_out.awaddr,
    M_AXI_AWPROT => M_AXI_out.awprot,
    M_AXI_AWVALID => M_AXI_out.awvalid,
    M_AXI_AWREADY => M_AXI_in.awready,    
    M_AXI_WDATA => M_AXI_out.wdata,
    M_AXI_WSTRB => M_AXI_out.wstrb,
    M_AXI_WVALID => M_AXI_out.wvalid,
    M_AXI_WREADY => M_AXI_in.wready,   
    M_AXI_BRESP => M_AXI_in.bresp,
    M_AXI_BVALID => M_AXI_in.bvalid,
    M_AXI_BREADY => M_AXI_out.bready,   
    M_AXI_ARADDR => M_AXI_out.araddr,
    M_AXI_ARPROT => M_AXI_out.arprot,
    M_AXI_ARVALID => M_AXI_out.arvalid,
    M_AXI_ARREADY => M_AXI_in.arready, 
    M_AXI_RDATA => M_AXI_in.rdata,
    M_AXI_RRESP => M_AXI_in.rresp,
    M_AXI_RVALID => M_AXI_in.rvalid,
    M_AXI_RREADY => M_AXI_out.rready
);


accel_0_inst :  if (acc_num = 0) generate
                acc_0_inst : acc_0
                port map (
                    clock => clk,
                    reset => ip_reset,
                    start_port => ip_start,
                    param => param,
                    result => result,
                    M_Rdata_ram => r_data_ram,
                    M_DataRdy => data_rdy,
                    done_port => ip_stop,
                    Mout_oe_ram => oe_ram,
                    Mout_we_ram => we_ram,
                    Mout_addr_ram => addr_ram,
                    Mout_Wdata_ram => w_data_ram,
                    Mout_data_ram_size => open
                );
end generate;

accel_1_inst :  if (acc_num = 1) generate
                acc_1_inst : acc_1
                port map (
                    clock => clk,
                    reset => ip_reset,
                    start_port => ip_start,
                    param => param,
                    result => result,
                    M_Rdata_ram => r_data_ram,
                    M_DataRdy => data_rdy,
                    done_port => ip_stop,
                    Mout_oe_ram => oe_ram,
                    Mout_we_ram => we_ram,
                    Mout_addr_ram => addr_ram,
                    Mout_Wdata_ram => w_data_ram,
                    Mout_data_ram_size => open
                );
end generate;

accel_2_inst :  if (acc_num = 2) generate
                acc_2_inst : acc_2
                port map (
                    clock => clk,
                    reset => ip_reset,
                    start_port => ip_start,
                    param => param,
                    result => result,
                    M_Rdata_ram => r_data_ram,
                    M_DataRdy => data_rdy,
                    done_port => ip_stop,
                    Mout_oe_ram => oe_ram,
                    Mout_we_ram => we_ram,
                    Mout_addr_ram => addr_ram,
                    Mout_Wdata_ram => w_data_ram,
                    Mout_data_ram_size => open
                );
end generate;

accel_3_inst :  if (acc_num = 3) generate
                acc_3_inst : acc_3
                port map (
                    clock => clk,
                    reset => ip_reset,
                    start_port => ip_start,
                    param => param,
                    result => result,
                    M_Rdata_ram => r_data_ram,
                    M_DataRdy => data_rdy,
                    done_port => ip_stop,
                    Mout_oe_ram => oe_ram,
                    Mout_we_ram => we_ram,
                    Mout_addr_ram => addr_ram,
                    Mout_Wdata_ram => w_data_ram,
                    Mout_data_ram_size => open
                );
end generate;

accel_4_inst :  if (acc_num = 4) generate
                acc_4_inst : acc_4
                port map (
                    clock => clk,
                    reset => ip_reset,
                    start_port => ip_start,
                    param => param,
                    result => result,
                    M_Rdata_ram => r_data_ram,
                    M_DataRdy => data_rdy,
                    done_port => ip_stop,
                    Mout_oe_ram => oe_ram,
                    Mout_we_ram => we_ram,
                    Mout_addr_ram => addr_ram,
                    Mout_Wdata_ram => w_data_ram,
                    Mout_data_ram_size => open
                );
end generate;

accel_5_inst :  if (acc_num = 5) generate
                acc_5_inst : acc_5
                port map (
                    clock => clk,
                    reset => ip_reset,
                    start_port => ip_start,
                    param => param,
                    result => result,
                    M_Rdata_ram => r_data_ram,
                    M_DataRdy => data_rdy,
                    done_port => ip_stop,
                    Mout_oe_ram => oe_ram,
                    Mout_we_ram => we_ram,
                    Mout_addr_ram => addr_ram,
                    Mout_Wdata_ram => w_data_ram,
                    Mout_data_ram_size => open
                );
end generate;

accel_6_inst :  if (acc_num = 6) generate
                acc_6_inst : acc_6
                port map (
                    clock => clk,
                    reset => ip_reset,
                    start_port => ip_start,
                    param => param,
                    result => result,
                    M_Rdata_ram => r_data_ram,
                    M_DataRdy => data_rdy,
                    done_port => ip_stop,
                    Mout_oe_ram => oe_ram,
                    Mout_we_ram => we_ram,
                    Mout_addr_ram => addr_ram,
                    Mout_Wdata_ram => w_data_ram,
                    Mout_data_ram_size => open
                );
end generate;

accel_7_inst :  if (acc_num = 7) generate
                acc_7_inst : acc_7
                port map (
                    clock => clk,
                    reset => ip_reset,
                    start_port => ip_start,
                    param => param,
                    result => result,
                    M_Rdata_ram => r_data_ram,
                    M_DataRdy => data_rdy,
                    done_port => ip_stop,
                    Mout_oe_ram => oe_ram,
                    Mout_we_ram => we_ram,
                    Mout_addr_ram => addr_ram,
                    Mout_Wdata_ram => w_data_ram,
                    Mout_data_ram_size => open
                );
end generate;


end Behavioral;
