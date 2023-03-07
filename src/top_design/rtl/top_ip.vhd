library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use work.locod_pkg.all;


entity top_ip is
port(
	-- Clock and reset
    clk : in std_logic;
    rst : in std_logic;
    -- AXI Slave Control
    S_AXI_awaddr    : in std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
    S_AXI_awprot    : in std_logic_vector(2 downto 0);
    S_AXI_awvalid   : in std_logic;
    S_AXI_awready   : out std_logic;
    S_AXI_wdata 	: in std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    S_AXI_wstrb 	: in std_logic_vector(3 downto 0);
    S_AXI_wvalid    : in std_logic;
    S_AXI_wready    : out std_logic;
    S_AXI_bresp 	: out std_logic_vector(1 downto 0);
    S_AXI_bvalid    : out std_logic;
    S_AXI_bready    : in std_logic;
    S_AXI_araddr    : in std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
    S_AXI_arprot    : in std_logic_vector(2 downto 0);
    S_AXI_arvalid   : in std_logic;
    S_AXI_arready   : out std_logic;
    S_AXI_rdata 	: out std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    S_AXI_rresp 	: out std_logic_vector(1 downto 0);
    S_AXI_rvalid    : out std_logic;
    S_AXI_rready    : in std_logic;
    -- AXI Master Accelerator 0
    M00_AXI_awaddr 	: out std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
    M00_AXI_awprot 	: out std_logic_vector(2 downto 0);
    M00_AXI_awvalid : out std_logic;
    M00_AXI_awready : in std_logic;  
    M00_AXI_wdata 	: out std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    M00_AXI_wstrb 	: out std_logic_vector(3 downto 0);
    M00_AXI_wvalid 	: out std_logic;
    M00_AXI_wready 	: in std_logic;  
    M00_AXI_bresp 	: in std_logic_vector(1 downto 0);
    M00_AXI_bvalid 	: in std_logic;
    M00_AXI_bready 	: out std_logic;  
    M00_AXI_araddr 	: out std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
    M00_AXI_arprot 	: out std_logic_vector(2 downto 0);
    M00_AXI_arvalid : out std_logic;
    M00_AXI_arready : in std_logic;   
    M00_AXI_rdata 	: in std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    M00_AXI_rresp 	: in std_logic_vector(1 downto 0);
    M00_AXI_rvalid 	: in std_logic;
    M00_AXI_rready 	: out std_logic;
    -- AXI Master Accelerator 1
    M01_AXI_awaddr 	: out std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
    M01_AXI_awprot 	: out std_logic_vector(2 downto 0);
    M01_AXI_awvalid : out std_logic;
    M01_AXI_awready : in std_logic;  
    M01_AXI_wdata 	: out std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    M01_AXI_wstrb 	: out std_logic_vector(3 downto 0);
    M01_AXI_wvalid 	: out std_logic;
    M01_AXI_wready 	: in std_logic;  
    M01_AXI_bresp 	: in std_logic_vector(1 downto 0);
    M01_AXI_bvalid 	: in std_logic;
    M01_AXI_bready 	: out std_logic;  
    M01_AXI_araddr 	: out std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
    M01_AXI_arprot 	: out std_logic_vector(2 downto 0);
    M01_AXI_arvalid : out std_logic;
    M01_AXI_arready : in std_logic;   
    M01_AXI_rdata 	: in std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    M01_AXI_rresp 	: in std_logic_vector(1 downto 0);
    M01_AXI_rvalid 	: in std_logic;
    M01_AXI_rready 	: out std_logic;
    -- AXI Master Accelerator 2
    M02_AXI_awaddr 	: out std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
    M02_AXI_awprot 	: out std_logic_vector(2 downto 0);
    M02_AXI_awvalid : out std_logic;
    M02_AXI_awready : in std_logic;  
    M02_AXI_wdata 	: out std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    M02_AXI_wstrb 	: out std_logic_vector(3 downto 0);
    M02_AXI_wvalid 	: out std_logic;
    M02_AXI_wready 	: in std_logic;  
    M02_AXI_bresp 	: in std_logic_vector(1 downto 0);
    M02_AXI_bvalid 	: in std_logic;
    M02_AXI_bready 	: out std_logic;  
    M02_AXI_araddr 	: out std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
    M02_AXI_arprot 	: out std_logic_vector(2 downto 0);
    M02_AXI_arvalid : out std_logic;
    M02_AXI_arready : in std_logic;   
    M02_AXI_rdata 	: in std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    M02_AXI_rresp 	: in std_logic_vector(1 downto 0);
    M02_AXI_rvalid 	: in std_logic;
    M02_AXI_rready 	: out std_logic;
    -- AXI Master Accelerator 3
    M03_AXI_awaddr 	: out std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
    M03_AXI_awprot 	: out std_logic_vector(2 downto 0);
    M03_AXI_awvalid : out std_logic;
    M03_AXI_awready : in std_logic;  
    M03_AXI_wdata 	: out std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    M03_AXI_wstrb 	: out std_logic_vector(3 downto 0);
    M03_AXI_wvalid 	: out std_logic;
    M03_AXI_wready 	: in std_logic;  
    M03_AXI_bresp 	: in std_logic_vector(1 downto 0);
    M03_AXI_bvalid 	: in std_logic;
    M03_AXI_bready 	: out std_logic;  
    M03_AXI_araddr 	: out std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
    M03_AXI_arprot 	: out std_logic_vector(2 downto 0);
    M03_AXI_arvalid : out std_logic;
    M03_AXI_arready : in std_logic;   
    M03_AXI_rdata 	: in std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    M03_AXI_rresp 	: in std_logic_vector(1 downto 0);
    M03_AXI_rvalid 	: in std_logic;
    M03_AXI_rready 	: out std_logic;
    -- AXI Master Accelerator 4
    M04_AXI_awaddr 	: out std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
    M04_AXI_awprot 	: out std_logic_vector(2 downto 0);
    M04_AXI_awvalid : out std_logic;
    M04_AXI_awready : in std_logic;  
    M04_AXI_wdata 	: out std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    M04_AXI_wstrb 	: out std_logic_vector(3 downto 0);
    M04_AXI_wvalid 	: out std_logic;
    M04_AXI_wready 	: in std_logic;  
    M04_AXI_bresp 	: in std_logic_vector(1 downto 0);
    M04_AXI_bvalid 	: in std_logic;
    M04_AXI_bready 	: out std_logic;  
    M04_AXI_araddr 	: out std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
    M04_AXI_arprot 	: out std_logic_vector(2 downto 0);
    M04_AXI_arvalid : out std_logic;
    M04_AXI_arready : in std_logic;   
    M04_AXI_rdata 	: in std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    M04_AXI_rresp 	: in std_logic_vector(1 downto 0);
    M04_AXI_rvalid 	: in std_logic;
    M04_AXI_rready 	: out std_logic;
    -- AXI Master Accelerator 5
    M05_AXI_awaddr 	: out std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
    M05_AXI_awprot 	: out std_logic_vector(2 downto 0);
    M05_AXI_awvalid : out std_logic;
    M05_AXI_awready : in std_logic;  
    M05_AXI_wdata 	: out std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    M05_AXI_wstrb 	: out std_logic_vector(3 downto 0);
    M05_AXI_wvalid 	: out std_logic;
    M05_AXI_wready 	: in std_logic;  
    M05_AXI_bresp 	: in std_logic_vector(1 downto 0);
    M05_AXI_bvalid 	: in std_logic;
    M05_AXI_bready 	: out std_logic;  
    M05_AXI_araddr 	: out std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
    M05_AXI_arprot 	: out std_logic_vector(2 downto 0);
    M05_AXI_arvalid : out std_logic;
    M05_AXI_arready : in std_logic;   
    M05_AXI_rdata 	: in std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    M05_AXI_rresp 	: in std_logic_vector(1 downto 0);
    M05_AXI_rvalid 	: in std_logic;
    M05_AXI_rready 	: out std_logic;
    -- AXI Master Accelerator 6
    M06_AXI_awaddr 	: out std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
    M06_AXI_awprot 	: out std_logic_vector(2 downto 0);
    M06_AXI_awvalid : out std_logic;
    M06_AXI_awready : in std_logic;  
    M06_AXI_wdata 	: out std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    M06_AXI_wstrb 	: out std_logic_vector(3 downto 0);
    M06_AXI_wvalid 	: out std_logic;
    M06_AXI_wready 	: in std_logic;  
    M06_AXI_bresp 	: in std_logic_vector(1 downto 0);
    M06_AXI_bvalid 	: in std_logic;
    M06_AXI_bready 	: out std_logic;  
    M06_AXI_araddr 	: out std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
    M06_AXI_arprot 	: out std_logic_vector(2 downto 0);
    M06_AXI_arvalid : out std_logic;
    M06_AXI_arready : in std_logic;   
    M06_AXI_rdata 	: in std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    M06_AXI_rresp 	: in std_logic_vector(1 downto 0);
    M06_AXI_rvalid 	: in std_logic;
    M06_AXI_rready 	: out std_logic;
	-- AXI Master Accelerator 7
    M07_AXI_awaddr 	: out std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
    M07_AXI_awprot 	: out std_logic_vector(2 downto 0);
    M07_AXI_awvalid : out std_logic;
    M07_AXI_awready : in std_logic;  
    M07_AXI_wdata 	: out std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    M07_AXI_wstrb 	: out std_logic_vector(3 downto 0);
    M07_AXI_wvalid 	: out std_logic;
    M07_AXI_wready 	: in std_logic;  
    M07_AXI_bresp 	: in std_logic_vector(1 downto 0);
    M07_AXI_bvalid 	: in std_logic;
    M07_AXI_bready 	: out std_logic;  
    M07_AXI_araddr 	: out std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
    M07_AXI_arprot 	: out std_logic_vector(2 downto 0);
    M07_AXI_arvalid : out std_logic;
    M07_AXI_arready : in std_logic;   
    M07_AXI_rdata 	: in std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    M07_AXI_rresp 	: in std_logic_vector(1 downto 0);
    M07_AXI_rvalid 	: in std_logic;
    M07_AXI_rready 	: out std_logic
);

end top_ip;


architecture Behavioral of top_ip is


signal S_AXI_in : AXI4Lite_m_to_s;
signal S_AXI_out : AXI4Lite_s_to_m;
signal M_AXI_out_array : AXI4Lite_m_to_s_array;
signal M_AXI_in_array : AXI4Lite_s_to_m_array; 		


begin

top_inst : entity work.top
port map(
    clk 				=> clk,
    rst 				=> rst,
    S_AXI_in 			=> S_AXI_in,
    S_AXI_out 			=> S_AXI_out,
    M_AXI_out_array 	=> M_AXI_out_array,
    M_AXI_in_array 		=> M_AXI_in_array
);

axi_slave_if_0 : entity work.axi_slave_if
port map (
    S_AXI_awaddr 	=> S_AXI_awaddr, 	
    S_AXI_awprot 	=> S_AXI_awprot, 	
    S_AXI_awvalid   => S_AXI_awvalid,  
    S_AXI_awready   => S_AXI_awready,  
    S_AXI_wdata 	=> S_AXI_wdata, 	
    S_AXI_wstrb 	=> S_AXI_wstrb, 	
    S_AXI_wvalid 	=> S_AXI_wvalid, 	
    S_AXI_wready 	=> S_AXI_wready, 	
    S_AXI_bresp 	=> S_AXI_bresp, 	
    S_AXI_bvalid 	=> S_AXI_bvalid, 	
    S_AXI_bready 	=> S_AXI_bready, 	
    S_AXI_araddr 	=> S_AXI_araddr, 	
    S_AXI_arprot 	=> S_AXI_arprot, 	
    S_AXI_arvalid   => S_AXI_arvalid,  
    S_AXI_arready   => S_AXI_arready,  
    S_AXI_rdata 	=> S_AXI_rdata, 	
    S_AXI_rresp 	=> S_AXI_rresp, 	
    S_AXI_rvalid 	=> S_AXI_rvalid, 	
    S_AXI_rready 	=> S_AXI_rready, 	
	S_AXI_in        => S_AXI_in,       
    S_AXI_out       => S_AXI_out      
);

axi_master_if_0 : entity work.axi_master_if
port map (
	M_AXI_awaddr 	=> M00_AXI_awaddr,
    M_AXI_awprot 	=> M00_AXI_awprot,
    M_AXI_awvalid   => M00_AXI_awvalid,
    M_AXI_awready   => M00_AXI_awready,
    M_AXI_wdata 	=> M00_AXI_wdata,
    M_AXI_wstrb 	=> M00_AXI_wstrb,
    M_AXI_wvalid 	=> M00_AXI_wvalid,
    M_AXI_wready 	=> M00_AXI_wready,
    M_AXI_bresp 	=> M00_AXI_bresp,
    M_AXI_bvalid 	=> M00_AXI_bvalid,
    M_AXI_bready 	=> M00_AXI_bready,
    M_AXI_araddr 	=> M00_AXI_araddr,
    M_AXI_arprot 	=> M00_AXI_arprot,
    M_AXI_arvalid   => M00_AXI_arvalid,
    M_AXI_arready   => M00_AXI_arready,
    M_AXI_rdata 	=> M00_AXI_rdata,
    M_AXI_rresp 	=> M00_AXI_rresp,
    M_AXI_rvalid 	=> M00_AXI_rvalid,
    M_AXI_rready 	=> M00_AXI_rready,
    M_AXI_out       => M_AXI_out_array(0),
    M_AXI_in        => M_AXI_in_array(0)
);

axi_master_if_1 : entity work.axi_master_if
port map (
	M_AXI_awaddr 	=> M01_AXI_awaddr,
    M_AXI_awprot 	=> M01_AXI_awprot,
    M_AXI_awvalid   => M01_AXI_awvalid,
    M_AXI_awready   => M01_AXI_awready,
    M_AXI_wdata 	=> M01_AXI_wdata,
    M_AXI_wstrb 	=> M01_AXI_wstrb,
    M_AXI_wvalid 	=> M01_AXI_wvalid,
    M_AXI_wready 	=> M01_AXI_wready,
    M_AXI_bresp 	=> M01_AXI_bresp,
    M_AXI_bvalid 	=> M01_AXI_bvalid,
    M_AXI_bready 	=> M01_AXI_bready,
    M_AXI_araddr 	=> M01_AXI_araddr,
    M_AXI_arprot 	=> M01_AXI_arprot,
    M_AXI_arvalid   => M01_AXI_arvalid,
    M_AXI_arready   => M01_AXI_arready,
    M_AXI_rdata 	=> M01_AXI_rdata,
    M_AXI_rresp 	=> M01_AXI_rresp,
    M_AXI_rvalid 	=> M01_AXI_rvalid,
    M_AXI_rready 	=> M01_AXI_rready,
    M_AXI_out       => M_AXI_out_array(1),
    M_AXI_in        => M_AXI_in_array(1)
);

axi_master_if_2 : entity work.axi_master_if
port map (
	M_AXI_awaddr 	=> M02_AXI_awaddr,
    M_AXI_awprot 	=> M02_AXI_awprot,
    M_AXI_awvalid   => M02_AXI_awvalid,
    M_AXI_awready   => M02_AXI_awready,
    M_AXI_wdata 	=> M02_AXI_wdata,
    M_AXI_wstrb 	=> M02_AXI_wstrb,
    M_AXI_wvalid 	=> M02_AXI_wvalid,
    M_AXI_wready 	=> M02_AXI_wready,
    M_AXI_bresp 	=> M02_AXI_bresp,
    M_AXI_bvalid 	=> M02_AXI_bvalid,
    M_AXI_bready 	=> M02_AXI_bready,
    M_AXI_araddr 	=> M02_AXI_araddr,
    M_AXI_arprot 	=> M02_AXI_arprot,
    M_AXI_arvalid   => M02_AXI_arvalid,
    M_AXI_arready   => M02_AXI_arready,
    M_AXI_rdata 	=> M02_AXI_rdata,
    M_AXI_rresp 	=> M02_AXI_rresp,
    M_AXI_rvalid 	=> M02_AXI_rvalid,
    M_AXI_rready 	=> M02_AXI_rready,
    M_AXI_out       => M_AXI_out_array(2),
    M_AXI_in        => M_AXI_in_array(2)
);

axi_master_if_3 : entity work.axi_master_if
port map (
	M_AXI_awaddr 	=> M03_AXI_awaddr,
    M_AXI_awprot 	=> M03_AXI_awprot,
    M_AXI_awvalid   => M03_AXI_awvalid,
    M_AXI_awready   => M03_AXI_awready,
    M_AXI_wdata 	=> M03_AXI_wdata,
    M_AXI_wstrb 	=> M03_AXI_wstrb,
    M_AXI_wvalid 	=> M03_AXI_wvalid,
    M_AXI_wready 	=> M03_AXI_wready,
    M_AXI_bresp 	=> M03_AXI_bresp,
    M_AXI_bvalid 	=> M03_AXI_bvalid,
    M_AXI_bready 	=> M03_AXI_bready,
    M_AXI_araddr 	=> M03_AXI_araddr,
    M_AXI_arprot 	=> M03_AXI_arprot,
    M_AXI_arvalid   => M03_AXI_arvalid,
    M_AXI_arready   => M03_AXI_arready,
    M_AXI_rdata 	=> M03_AXI_rdata,
    M_AXI_rresp 	=> M03_AXI_rresp,
    M_AXI_rvalid 	=> M03_AXI_rvalid,
    M_AXI_rready 	=> M03_AXI_rready,
    M_AXI_out       => M_AXI_out_array(3),
    M_AXI_in        => M_AXI_in_array(3)
);

axi_master_if_4 : entity work.axi_master_if
port map (
	M_AXI_awaddr 	=> M04_AXI_awaddr,
    M_AXI_awprot 	=> M04_AXI_awprot,
    M_AXI_awvalid   => M04_AXI_awvalid,
    M_AXI_awready   => M04_AXI_awready,
    M_AXI_wdata 	=> M04_AXI_wdata,
    M_AXI_wstrb 	=> M04_AXI_wstrb,
    M_AXI_wvalid 	=> M04_AXI_wvalid,
    M_AXI_wready 	=> M04_AXI_wready,
    M_AXI_bresp 	=> M04_AXI_bresp,
    M_AXI_bvalid 	=> M04_AXI_bvalid,
    M_AXI_bready 	=> M04_AXI_bready,
    M_AXI_araddr 	=> M04_AXI_araddr,
    M_AXI_arprot 	=> M04_AXI_arprot,
    M_AXI_arvalid   => M04_AXI_arvalid,
    M_AXI_arready   => M04_AXI_arready,
    M_AXI_rdata 	=> M04_AXI_rdata,
    M_AXI_rresp 	=> M04_AXI_rresp,
    M_AXI_rvalid 	=> M04_AXI_rvalid,
    M_AXI_rready 	=> M04_AXI_rready,
    M_AXI_out       => M_AXI_out_array(4),
    M_AXI_in        => M_AXI_in_array(4)
);

axi_master_if_5 : entity work.axi_master_if
port map (
	M_AXI_awaddr 	=> M05_AXI_awaddr,
    M_AXI_awprot 	=> M05_AXI_awprot,
    M_AXI_awvalid   => M05_AXI_awvalid,
    M_AXI_awready   => M05_AXI_awready,
    M_AXI_wdata 	=> M05_AXI_wdata,
    M_AXI_wstrb 	=> M05_AXI_wstrb,
    M_AXI_wvalid 	=> M05_AXI_wvalid,
    M_AXI_wready 	=> M05_AXI_wready,
    M_AXI_bresp 	=> M05_AXI_bresp,
    M_AXI_bvalid 	=> M05_AXI_bvalid,
    M_AXI_bready 	=> M05_AXI_bready,
    M_AXI_araddr 	=> M05_AXI_araddr,
    M_AXI_arprot 	=> M05_AXI_arprot,
    M_AXI_arvalid   => M05_AXI_arvalid,
    M_AXI_arready   => M05_AXI_arready,
    M_AXI_rdata 	=> M05_AXI_rdata,
    M_AXI_rresp 	=> M05_AXI_rresp,
    M_AXI_rvalid 	=> M05_AXI_rvalid,
    M_AXI_rready 	=> M05_AXI_rready,
    M_AXI_out       => M_AXI_out_array(5),
    M_AXI_in        => M_AXI_in_array(5)
);

axi_master_if_6 : entity work.axi_master_if
port map (
	M_AXI_awaddr 	=> M06_AXI_awaddr,
    M_AXI_awprot 	=> M06_AXI_awprot,
    M_AXI_awvalid   => M06_AXI_awvalid,
    M_AXI_awready   => M06_AXI_awready,
    M_AXI_wdata 	=> M06_AXI_wdata,
    M_AXI_wstrb 	=> M06_AXI_wstrb,
    M_AXI_wvalid 	=> M06_AXI_wvalid,
    M_AXI_wready 	=> M06_AXI_wready,
    M_AXI_bresp 	=> M06_AXI_bresp,
    M_AXI_bvalid 	=> M06_AXI_bvalid,
    M_AXI_bready 	=> M06_AXI_bready,
    M_AXI_araddr 	=> M06_AXI_araddr,
    M_AXI_arprot 	=> M06_AXI_arprot,
    M_AXI_arvalid   => M06_AXI_arvalid,
    M_AXI_arready   => M06_AXI_arready,
    M_AXI_rdata 	=> M06_AXI_rdata,
    M_AXI_rresp 	=> M06_AXI_rresp,
    M_AXI_rvalid 	=> M06_AXI_rvalid,
    M_AXI_rready 	=> M06_AXI_rready,
    M_AXI_out       => M_AXI_out_array(6),
    M_AXI_in        => M_AXI_in_array(6)
);

axi_master_if_7 : entity work.axi_master_if
port map (
	M_AXI_awaddr 	=> M07_AXI_awaddr,
    M_AXI_awprot 	=> M07_AXI_awprot,
    M_AXI_awvalid   => M07_AXI_awvalid,
    M_AXI_awready   => M07_AXI_awready,
    M_AXI_wdata 	=> M07_AXI_wdata,
    M_AXI_wstrb 	=> M07_AXI_wstrb,
    M_AXI_wvalid 	=> M07_AXI_wvalid,
    M_AXI_wready 	=> M07_AXI_wready,
    M_AXI_bresp 	=> M07_AXI_bresp,
    M_AXI_bvalid 	=> M07_AXI_bvalid,
    M_AXI_bready 	=> M07_AXI_bready,
    M_AXI_araddr 	=> M07_AXI_araddr,
    M_AXI_arprot 	=> M07_AXI_arprot,
    M_AXI_arvalid   => M07_AXI_arvalid,
    M_AXI_arready   => M07_AXI_arready,
    M_AXI_rdata 	=> M07_AXI_rdata,
    M_AXI_rresp 	=> M07_AXI_rresp,
    M_AXI_rvalid 	=> M07_AXI_rvalid,
    M_AXI_rready 	=> M07_AXI_rready,
    M_AXI_out       => M_AXI_out_array(7),
    M_AXI_in        => M_AXI_in_array(7)
);

end Behavioral;
