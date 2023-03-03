library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use work.locod_pkg.all;


entity top_wrapper is
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

end top_wrapper;


architecture Behavioral of top_wrapper is

signal S_AXI_in : AXI4Lite_m_to_s;
signal S_AXI_out : AXI4Lite_s_to_m;
signal M_AXI_out_array : AXI4Lite_m_to_s_array;
signal M_AXI_in_array : AXI4Lite_s_to_m_array; 		


begin

S_AXI_in.awaddr		<= S_AXI_awaddr;		
S_AXI_in.awprot		<= S_AXI_awprot;		
S_AXI_in.awvalid	<= S_AXI_awvalid;	
S_AXI_in.wdata		<= S_AXI_wdata;				
S_AXI_in.wstrb		<= S_AXI_wstrb;				
S_AXI_in.wvalid		<= S_AXI_wvalid;		
S_AXI_in.bready		<= S_AXI_bready;	
S_AXI_in.araddr		<= S_AXI_araddr;		
S_AXI_in.arprot		<= S_AXI_arprot;		
S_AXI_in.arvalid	<= S_AXI_arvalid;	
S_AXI_in.rready		<= S_AXI_rready;		
S_AXI_awready		<= S_AXI_out.awready;	
S_AXI_wready		<= S_AXI_out.wready; 	
S_AXI_bresp			<= S_AXI_out.bresp;			
S_AXI_bvalid		<= S_AXI_out.bvalid; 	
S_AXI_arready		<= S_AXI_out.arready;	
S_AXI_rdata			<= S_AXI_out.rdata;			
S_AXI_rresp			<= S_AXI_out.rresp;			
S_AXI_rvalid  		<= S_AXI_out.rvalid;

M00_AXI_awaddr 				<= M_AXI_out_array(0).awaddr;
M00_AXI_awprot 				<= M_AXI_out_array(0).awprot;
M00_AXI_awvalid 			<= M_AXI_out_array(0).awvalid; 
M_AXI_in_array(0).awready	<= M00_AXI_awready; 
M00_AXI_wdata 				<= M_AXI_out_array(0).wdata;
M00_AXI_wstrb 				<= M_AXI_out_array(0).wstrb;
M00_AXI_wvalid 				<= M_AXI_out_array(0).wvalid;
M_AXI_in_array(0).wready 	<= M00_AXI_wready;
M_AXI_in_array(0).bresp  	<= M00_AXI_bresp; 
M_AXI_in_array(0).bvalid 	<= M00_AXI_bvalid;
M00_AXI_bready 				<= M_AXI_out_array(0).bready;
M00_AXI_araddr 				<= M_AXI_out_array(0).araddr;
M00_AXI_arprot 				<= M_AXI_out_array(0).arprot;
M00_AXI_arvalid 			<= M_AXI_out_array(0).arvalid; 
M_AXI_in_array(0).arready	<= M00_AXI_arready; 
M_AXI_in_array(0).rdata  	<= M00_AXI_rdata; 
M_AXI_in_array(0).rresp  	<= M00_AXI_rresp; 
M_AXI_in_array(0).rvalid 	<= M00_AXI_rvalid;
M00_AXI_rready 				<= M_AXI_out_array(0).rready;

M01_AXI_awaddr 				<= M_AXI_out_array(1).awaddr;
M01_AXI_awprot 				<= M_AXI_out_array(1).awprot;
M01_AXI_awvalid 			<= M_AXI_out_array(1).awvalid; 
M_AXI_in_array(1).awready	<= M01_AXI_awready; 
M01_AXI_wdata 				<= M_AXI_out_array(1).wdata;
M01_AXI_wstrb 				<= M_AXI_out_array(1).wstrb;
M01_AXI_wvalid 				<= M_AXI_out_array(1).wvalid;
M_AXI_in_array(1).wready 	<= M01_AXI_wready;
M_AXI_in_array(1).bresp  	<= M01_AXI_bresp; 
M_AXI_in_array(1).bvalid 	<= M01_AXI_bvalid;
M01_AXI_bready 				<= M_AXI_out_array(1).bready;
M01_AXI_araddr 				<= M_AXI_out_array(1).araddr;
M01_AXI_arprot 				<= M_AXI_out_array(1).arprot;
M01_AXI_arvalid 			<= M_AXI_out_array(1).arvalid; 
M_AXI_in_array(1).arready	<= M01_AXI_arready; 
M_AXI_in_array(1).rdata  	<= M01_AXI_rdata; 
M_AXI_in_array(1).rresp  	<= M01_AXI_rresp; 
M_AXI_in_array(1).rvalid 	<= M01_AXI_rvalid;
M01_AXI_rready 				<= M_AXI_out_array(1).rready;

M02_AXI_awaddr 				<= M_AXI_out_array(2).awaddr;
M02_AXI_awprot 				<= M_AXI_out_array(2).awprot;
M02_AXI_awvalid 			<= M_AXI_out_array(2).awvalid; 
M_AXI_in_array(2).awready	<= M02_AXI_awready; 
M02_AXI_wdata 				<= M_AXI_out_array(2).wdata;
M02_AXI_wstrb 				<= M_AXI_out_array(2).wstrb;
M02_AXI_wvalid 				<= M_AXI_out_array(2).wvalid;
M_AXI_in_array(2).wready 	<= M02_AXI_wready;
M_AXI_in_array(2).bresp  	<= M02_AXI_bresp; 
M_AXI_in_array(2).bvalid 	<= M02_AXI_bvalid;
M02_AXI_bready 				<= M_AXI_out_array(2).bready;
M02_AXI_araddr 				<= M_AXI_out_array(2).araddr;
M02_AXI_arprot 				<= M_AXI_out_array(2).arprot;
M02_AXI_arvalid 			<= M_AXI_out_array(2).arvalid; 
M_AXI_in_array(2).arready	<= M02_AXI_arready; 
M_AXI_in_array(2).rdata  	<= M02_AXI_rdata; 
M_AXI_in_array(2).rresp  	<= M02_AXI_rresp; 
M_AXI_in_array(2).rvalid 	<= M02_AXI_rvalid;
M02_AXI_rready 				<= M_AXI_out_array(2).rready;

M03_AXI_awaddr 				<= M_AXI_out_array(3).awaddr;
M03_AXI_awprot 				<= M_AXI_out_array(3).awprot;
M03_AXI_awvalid 			<= M_AXI_out_array(3).awvalid; 
M_AXI_in_array(3).awready	<= M03_AXI_awready; 
M03_AXI_wdata 				<= M_AXI_out_array(3).wdata;
M03_AXI_wstrb 				<= M_AXI_out_array(3).wstrb;
M03_AXI_wvalid 				<= M_AXI_out_array(3).wvalid;
M_AXI_in_array(3).wready 	<= M03_AXI_wready;
M_AXI_in_array(3).bresp  	<= M03_AXI_bresp; 
M_AXI_in_array(3).bvalid 	<= M03_AXI_bvalid;
M03_AXI_bready 				<= M_AXI_out_array(3).bready;
M03_AXI_araddr 				<= M_AXI_out_array(3).araddr;
M03_AXI_arprot 				<= M_AXI_out_array(3).arprot;
M03_AXI_arvalid 			<= M_AXI_out_array(3).arvalid; 
M_AXI_in_array(3).arready	<= M03_AXI_arready; 
M_AXI_in_array(3).rdata  	<= M03_AXI_rdata; 
M_AXI_in_array(3).rresp  	<= M03_AXI_rresp; 
M_AXI_in_array(3).rvalid 	<= M03_AXI_rvalid;
M03_AXI_rready 				<= M_AXI_out_array(3).rready;

M04_AXI_awaddr 				<= M_AXI_out_array(4).awaddr;
M04_AXI_awprot 				<= M_AXI_out_array(4).awprot;
M04_AXI_awvalid 			<= M_AXI_out_array(4).awvalid; 
M_AXI_in_array(4).awready	<= M04_AXI_awready; 
M04_AXI_wdata 				<= M_AXI_out_array(4).wdata;
M04_AXI_wstrb 				<= M_AXI_out_array(4).wstrb;
M04_AXI_wvalid 				<= M_AXI_out_array(4).wvalid;
M_AXI_in_array(4).wready 	<= M04_AXI_wready;
M_AXI_in_array(4).bresp  	<= M04_AXI_bresp; 
M_AXI_in_array(4).bvalid 	<= M04_AXI_bvalid;
M04_AXI_bready 				<= M_AXI_out_array(4).bready;
M04_AXI_araddr 				<= M_AXI_out_array(4).araddr;
M04_AXI_arprot 				<= M_AXI_out_array(4).arprot;
M04_AXI_arvalid 			<= M_AXI_out_array(4).arvalid; 
M_AXI_in_array(4).arready	<= M04_AXI_arready; 
M_AXI_in_array(4).rdata  	<= M04_AXI_rdata; 
M_AXI_in_array(4).rresp  	<= M04_AXI_rresp; 
M_AXI_in_array(4).rvalid 	<= M04_AXI_rvalid;
M04_AXI_rready 				<= M_AXI_out_array(4).rready;

M05_AXI_awaddr 				<= M_AXI_out_array(5).awaddr;
M05_AXI_awprot 				<= M_AXI_out_array(5).awprot;
M05_AXI_awvalid 			<= M_AXI_out_array(5).awvalid; 
M_AXI_in_array(5).awready	<= M05_AXI_awready; 
M05_AXI_wdata 				<= M_AXI_out_array(5).wdata;
M05_AXI_wstrb 				<= M_AXI_out_array(5).wstrb;
M05_AXI_wvalid 				<= M_AXI_out_array(5).wvalid;
M_AXI_in_array(5).wready 	<= M05_AXI_wready;
M_AXI_in_array(5).bresp  	<= M05_AXI_bresp; 
M_AXI_in_array(5).bvalid 	<= M05_AXI_bvalid;
M05_AXI_bready 				<= M_AXI_out_array(5).bready;
M05_AXI_araddr 				<= M_AXI_out_array(5).araddr;
M05_AXI_arprot 				<= M_AXI_out_array(5).arprot;
M05_AXI_arvalid 			<= M_AXI_out_array(5).arvalid; 
M_AXI_in_array(5).arready	<= M05_AXI_arready; 
M_AXI_in_array(5).rdata  	<= M05_AXI_rdata; 
M_AXI_in_array(5).rresp  	<= M05_AXI_rresp; 
M_AXI_in_array(5).rvalid 	<= M05_AXI_rvalid;
M05_AXI_rready 				<= M_AXI_out_array(5).rready;

M06_AXI_awaddr 				<= M_AXI_out_array(6).awaddr;
M06_AXI_awprot 				<= M_AXI_out_array(6).awprot;
M06_AXI_awvalid 			<= M_AXI_out_array(6).awvalid; 
M_AXI_in_array(6).awready	<= M06_AXI_awready; 
M06_AXI_wdata 				<= M_AXI_out_array(6).wdata;
M06_AXI_wstrb 				<= M_AXI_out_array(6).wstrb;
M06_AXI_wvalid 				<= M_AXI_out_array(6).wvalid;
M_AXI_in_array(6).wready 	<= M06_AXI_wready;
M_AXI_in_array(6).bresp  	<= M06_AXI_bresp; 
M_AXI_in_array(6).bvalid 	<= M06_AXI_bvalid;
M06_AXI_bready 				<= M_AXI_out_array(6).bready;
M06_AXI_araddr 				<= M_AXI_out_array(6).araddr;
M06_AXI_arprot 				<= M_AXI_out_array(6).arprot;
M06_AXI_arvalid 			<= M_AXI_out_array(6).arvalid; 
M_AXI_in_array(6).arready	<= M06_AXI_arready; 
M_AXI_in_array(6).rdata  	<= M06_AXI_rdata; 
M_AXI_in_array(6).rresp  	<= M06_AXI_rresp; 
M_AXI_in_array(6).rvalid 	<= M06_AXI_rvalid;
M06_AXI_rready 				<= M_AXI_out_array(6).rready;

M07_AXI_awaddr 				<= M_AXI_out_array(7).awaddr;
M07_AXI_awprot 				<= M_AXI_out_array(7).awprot;
M07_AXI_awvalid 			<= M_AXI_out_array(7).awvalid; 
M_AXI_in_array(7).awready	<= M07_AXI_awready; 
M07_AXI_wdata 				<= M_AXI_out_array(7).wdata;
M07_AXI_wstrb 				<= M_AXI_out_array(7).wstrb;
M07_AXI_wvalid 				<= M_AXI_out_array(7).wvalid;
M_AXI_in_array(7).wready 	<= M07_AXI_wready;
M_AXI_in_array(7).bresp  	<= M07_AXI_bresp; 
M_AXI_in_array(7).bvalid 	<= M07_AXI_bvalid;
M07_AXI_bready 				<= M_AXI_out_array(7).bready;
M07_AXI_araddr 				<= M_AXI_out_array(7).araddr;
M07_AXI_arprot 				<= M_AXI_out_array(7).arprot;
M07_AXI_arvalid 			<= M_AXI_out_array(7).arvalid; 
M_AXI_in_array(7).arready	<= M07_AXI_arready; 
M_AXI_in_array(7).rdata  	<= M07_AXI_rdata; 
M_AXI_in_array(7).rresp  	<= M07_AXI_rresp; 
M_AXI_in_array(7).rvalid 	<= M07_AXI_rvalid;
M07_AXI_rready 				<= M_AXI_out_array(7).rready;


top_inst : entity work.top
port map(
    clk 				=> clk,
    rst 				=> rst,
    S_AXI_in 			=> S_AXI_in,
    S_AXI_out 			=> S_AXI_out,
    M_AXI_out_array 	=> M_AXI_out_array,
    M_AXI_in_array 		=> M_AXI_in_array
);

end Behavioral;
