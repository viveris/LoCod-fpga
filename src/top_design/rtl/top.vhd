library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use work.locod_pkg.all;


entity top is
port(
    clk : in std_logic;
    rst : in std_logic;
    -- AXI Slave Control
    S_AXI_AWADDR    : in std_logic_vector(AXI_REG_ADDR_WIDTH-1 downto 0);
    S_AXI_AWPROT    : in std_logic_vector(2 downto 0);
    S_AXI_AWVALID   : in std_logic;
    S_AXI_AWREADY   : out std_logic;
    S_AXI_WDATA 	: in std_logic_vector(DATA_WIDTH-1 downto 0);
    S_AXI_WSTRB 	: in std_logic_vector(3 downto 0);
    S_AXI_WVALID    : in std_logic;
    S_AXI_WREADY    : out std_logic;
    S_AXI_BRESP 	: out std_logic_vector(1 downto 0);
    S_AXI_BVALID    : out std_logic;
    S_AXI_BREADY    : in std_logic;
    S_AXI_ARADDR    : in std_logic_vector(AXI_REG_ADDR_WIDTH-1 downto 0);
    S_AXI_ARPROT    : in std_logic_vector(2 downto 0);
    S_AXI_ARVALID   : in std_logic;
    S_AXI_ARREADY   : out std_logic;
    S_AXI_RDATA 	: out std_logic_vector(DATA_WIDTH-1 downto 0);
    S_AXI_RRESP 	: out std_logic_vector(1 downto 0);
    S_AXI_RVALID    : out std_logic;
    S_AXI_RREADY    : in std_logic;
    -- AXI Master Accelerator 0
    M00_AXI_awaddr : out std_logic_vector(31 downto 0);
    M00_AXI_awprot : out std_logic_vector(2 downto 0);
    M00_AXI_awvalid : out std_logic;
    M00_AXI_awready : in std_logic;  
    M00_AXI_wdata : out std_logic_vector(31 downto 0);
    M00_AXI_wstrb : out std_logic_vector(3 downto 0);
    M00_AXI_wvalid : out std_logic;
    M00_AXI_wready : in std_logic;  
    M00_AXI_bresp : in std_logic_vector(1 downto 0);
    M00_AXI_bvalid : in std_logic;
    M00_AXI_bready : out std_logic;  
    M00_AXI_araddr : out std_logic_vector(31 downto 0);
    M00_AXI_arprot : out std_logic_vector(2 downto 0);
    M00_AXI_arvalid : out std_logic;
    M00_AXI_arready : in std_logic;   
    M00_AXI_rdata : in std_logic_vector(31 downto 0);
    M00_AXI_rresp : in std_logic_vector(1 downto 0);
    M00_AXI_rvalid : in std_logic;
    M00_AXI_rready : out std_logic;
    -- AXI Master Accelerator 1
    M01_AXI_awaddr : out std_logic_vector(31 downto 0);
    M01_AXI_awprot : out std_logic_vector(2 downto 0);
    M01_AXI_awvalid : out std_logic;
    M01_AXI_awready : in std_logic;  
    M01_AXI_wdata : out std_logic_vector(31 downto 0);
    M01_AXI_wstrb : out std_logic_vector(3 downto 0);
    M01_AXI_wvalid : out std_logic;
    M01_AXI_wready : in std_logic;  
    M01_AXI_bresp : in std_logic_vector(1 downto 0);
    M01_AXI_bvalid : in std_logic;
    M01_AXI_bready : out std_logic;  
    M01_AXI_araddr : out std_logic_vector(31 downto 0);
    M01_AXI_arprot : out std_logic_vector(2 downto 0);
    M01_AXI_arvalid : out std_logic;
    M01_AXI_arready : in std_logic;   
    M01_AXI_rdata : in std_logic_vector(31 downto 0);
    M01_AXI_rresp : in std_logic_vector(1 downto 0);
    M01_AXI_rvalid : in std_logic;
    M01_AXI_rready : out std_logic;
    -- AXI Master Accelerator 2
    M02_AXI_awaddr : out std_logic_vector(31 downto 0);
    M02_AXI_awprot : out std_logic_vector(2 downto 0);
    M02_AXI_awvalid : out std_logic;
    M02_AXI_awready : in std_logic;  
    M02_AXI_wdata : out std_logic_vector(31 downto 0);
    M02_AXI_wstrb : out std_logic_vector(3 downto 0);
    M02_AXI_wvalid : out std_logic;
    M02_AXI_wready : in std_logic;  
    M02_AXI_bresp : in std_logic_vector(1 downto 0);
    M02_AXI_bvalid : in std_logic;
    M02_AXI_bready : out std_logic;  
    M02_AXI_araddr : out std_logic_vector(31 downto 0);
    M02_AXI_arprot : out std_logic_vector(2 downto 0);
    M02_AXI_arvalid : out std_logic;
    M02_AXI_arready : in std_logic;   
    M02_AXI_rdata : in std_logic_vector(31 downto 0);
    M02_AXI_rresp : in std_logic_vector(1 downto 0);
    M02_AXI_rvalid : in std_logic;
    M02_AXI_rready : out std_logic;
    -- AXI Master Accelerator 3
    M03_AXI_awaddr : out std_logic_vector(31 downto 0);
    M03_AXI_awprot : out std_logic_vector(2 downto 0);
    M03_AXI_awvalid : out std_logic;
    M03_AXI_awready : in std_logic;  
    M03_AXI_wdata : out std_logic_vector(31 downto 0);
    M03_AXI_wstrb : out std_logic_vector(3 downto 0);
    M03_AXI_wvalid : out std_logic;
    M03_AXI_wready : in std_logic;  
    M03_AXI_bresp : in std_logic_vector(1 downto 0);
    M03_AXI_bvalid : in std_logic;
    M03_AXI_bready : out std_logic;  
    M03_AXI_araddr : out std_logic_vector(31 downto 0);
    M03_AXI_arprot : out std_logic_vector(2 downto 0);
    M03_AXI_arvalid : out std_logic;
    M03_AXI_arready : in std_logic;   
    M03_AXI_rdata : in std_logic_vector(31 downto 0);
    M03_AXI_rresp : in std_logic_vector(1 downto 0);
    M03_AXI_rvalid : in std_logic;
    M03_AXI_rready : out std_logic;
    -- AXI Master Accelerator 4
    M04_AXI_awaddr : out std_logic_vector(31 downto 0);
    M04_AXI_awprot : out std_logic_vector(2 downto 0);
    M04_AXI_awvalid : out std_logic;
    M04_AXI_awready : in std_logic;  
    M04_AXI_wdata : out std_logic_vector(31 downto 0);
    M04_AXI_wstrb : out std_logic_vector(3 downto 0);
    M04_AXI_wvalid : out std_logic;
    M04_AXI_wready : in std_logic;  
    M04_AXI_bresp : in std_logic_vector(1 downto 0);
    M04_AXI_bvalid : in std_logic;
    M04_AXI_bready : out std_logic;  
    M04_AXI_araddr : out std_logic_vector(31 downto 0);
    M04_AXI_arprot : out std_logic_vector(2 downto 0);
    M04_AXI_arvalid : out std_logic;
    M04_AXI_arready : in std_logic;   
    M04_AXI_rdata : in std_logic_vector(31 downto 0);
    M04_AXI_rresp : in std_logic_vector(1 downto 0);
    M04_AXI_rvalid : in std_logic;
    M04_AXI_rready : out std_logic;
    -- AXI Master Accelerator 5
    M05_AXI_awaddr : out std_logic_vector(31 downto 0);
    M05_AXI_awprot : out std_logic_vector(2 downto 0);
    M05_AXI_awvalid : out std_logic;
    M05_AXI_awready : in std_logic;  
    M05_AXI_wdata : out std_logic_vector(31 downto 0);
    M05_AXI_wstrb : out std_logic_vector(3 downto 0);
    M05_AXI_wvalid : out std_logic;
    M05_AXI_wready : in std_logic;  
    M05_AXI_bresp : in std_logic_vector(1 downto 0);
    M05_AXI_bvalid : in std_logic;
    M05_AXI_bready : out std_logic;  
    M05_AXI_araddr : out std_logic_vector(31 downto 0);
    M05_AXI_arprot : out std_logic_vector(2 downto 0);
    M05_AXI_arvalid : out std_logic;
    M05_AXI_arready : in std_logic;   
    M05_AXI_rdata : in std_logic_vector(31 downto 0);
    M05_AXI_rresp : in std_logic_vector(1 downto 0);
    M05_AXI_rvalid : in std_logic;
    M05_AXI_rready : out std_logic;
    -- AXI Master Accelerator 6
    M06_AXI_awaddr : out std_logic_vector(31 downto 0);
    M06_AXI_awprot : out std_logic_vector(2 downto 0);
    M06_AXI_awvalid : out std_logic;
    M06_AXI_awready : in std_logic;  
    M06_AXI_wdata : out std_logic_vector(31 downto 0);
    M06_AXI_wstrb : out std_logic_vector(3 downto 0);
    M06_AXI_wvalid : out std_logic;
    M06_AXI_wready : in std_logic;  
    M06_AXI_bresp : in std_logic_vector(1 downto 0);
    M06_AXI_bvalid : in std_logic;
    M06_AXI_bready : out std_logic;  
    M06_AXI_araddr : out std_logic_vector(31 downto 0);
    M06_AXI_arprot : out std_logic_vector(2 downto 0);
    M06_AXI_arvalid : out std_logic;
    M06_AXI_arready : in std_logic;   
    M06_AXI_rdata : in std_logic_vector(31 downto 0);
    M06_AXI_rresp : in std_logic_vector(1 downto 0);
    M06_AXI_rvalid : in std_logic;
    M06_AXI_rready : out std_logic;
	-- AXI Master Accelerator 7
    M07_AXI_awaddr : out std_logic_vector(31 downto 0);
    M07_AXI_awprot : out std_logic_vector(2 downto 0);
    M07_AXI_awvalid : out std_logic;
    M07_AXI_awready : in std_logic;  
    M07_AXI_wdata : out std_logic_vector(31 downto 0);
    M07_AXI_wstrb : out std_logic_vector(3 downto 0);
    M07_AXI_wvalid : out std_logic;
    M07_AXI_wready : in std_logic;  
    M07_AXI_bresp : in std_logic_vector(1 downto 0);
    M07_AXI_bvalid : in std_logic;
    M07_AXI_bready : out std_logic;  
    M07_AXI_araddr : out std_logic_vector(31 downto 0);
    M07_AXI_arprot : out std_logic_vector(2 downto 0);
    M07_AXI_arvalid : out std_logic;
    M07_AXI_arready : in std_logic;   
    M07_AXI_rdata : in std_logic_vector(31 downto 0);
    M07_AXI_rresp : in std_logic_vector(1 downto 0);
    M07_AXI_rvalid : in std_logic;
    M07_AXI_rready : out std_logic
);
end top;

architecture Behavioral of top is

signal ctrl_reg_out : std_logic_vector(DATA_WIDTH-1 downto 0);
signal ctrl_reg_in : std_logic_vector(DATA_WIDTH-1 downto 0);
signal registers : reg_array;


signal M_AXI_awaddr : m_axi_awaddr_array;	
signal M_AXI_awprot : m_axi_awprot_array; 	
signal M_AXI_awvalid : m_axi_awvalid_array;
signal M_AXI_awready : m_axi_awready_array; 
signal M_AXI_wdata : m_axi_wdata_array;    
signal M_AXI_wstrb : m_axi_wstrb_array;    
signal M_AXI_wvalid : m_axi_wvalid_array;  
signal M_AXI_wready : m_axi_wready_array;   
signal M_AXI_bresp : m_axi_bresp_array;   
signal M_AXI_bvalid : m_axi_bvalid_array;  
signal M_AXI_bready : m_axi_bready_array;   
signal M_AXI_araddr : m_axi_araddr_array;   
signal M_AXI_arprot : m_axi_arprot_array;   
signal M_AXI_arvalid : m_axi_arvalid_array; 
signal M_AXI_arready : m_axi_arready_array;  
signal M_AXI_rdata : m_axi_rdata_array;   
signal M_AXI_rresp : m_axi_rresp_array;   
signal M_AXI_rvalid : m_axi_rvalid_array;   
signal M_AXI_rready : m_axi_rready_array;   



begin


M00_AXI_awaddr 		<= M_AXI_awaddr(0);
M00_AXI_awprot 		<= M_AXI_awprot(0);
M00_AXI_awvalid 	<= M_AXI_awvalid(0); 
M_AXI_awready(0)	<= M00_AXI_awready; 
M00_AXI_wdata 		<= M_AXI_wdata(0);
M00_AXI_wstrb 		<= M_AXI_wstrb(0);
M00_AXI_wvalid 		<= M_AXI_wvalid(0);
M_AXI_wready(0) 	<= M00_AXI_wready;
M_AXI_bresp(0)  	<= M00_AXI_bresp; 
M_AXI_bvalid(0) 	<= M00_AXI_bvalid;
M00_AXI_bready 		<= M_AXI_bready(0);
M00_AXI_araddr 		<= M_AXI_araddr(0);
M00_AXI_arprot 		<= M_AXI_arprot(0);
M00_AXI_arvalid 	<= M_AXI_arvalid(0); 
M_AXI_arready(0)	<= M00_AXI_arready; 
M_AXI_rdata(0)  	<= M00_AXI_rdata; 
M_AXI_rresp(0)  	<= M00_AXI_rresp; 
M_AXI_rvalid(0) 	<= M00_AXI_rvalid;
M00_AXI_rready 		<= M_AXI_rready(0);

M01_AXI_awaddr 		<= M_AXI_awaddr(1);
M01_AXI_awprot 		<= M_AXI_awprot(1);
M01_AXI_awvalid 	<= M_AXI_awvalid(1); 
M_AXI_awready(1)	<= M01_AXI_awready; 
M01_AXI_wdata 		<= M_AXI_wdata(1);
M01_AXI_wstrb 		<= M_AXI_wstrb(1);
M01_AXI_wvalid 		<= M_AXI_wvalid(1);
M_AXI_wready(1) 	<= M01_AXI_wready;
M_AXI_bresp(1)  	<= M01_AXI_bresp; 
M_AXI_bvalid(1) 	<= M01_AXI_bvalid;
M01_AXI_bready 		<= M_AXI_bready(1);
M01_AXI_araddr 		<= M_AXI_araddr(1);
M01_AXI_arprot 		<= M_AXI_arprot(1);
M01_AXI_arvalid 	<= M_AXI_arvalid(1); 
M_AXI_arready(1)	<= M01_AXI_arready; 
M_AXI_rdata(1)  	<= M01_AXI_rdata; 
M_AXI_rresp(1)  	<= M01_AXI_rresp; 
M_AXI_rvalid(1) 	<= M01_AXI_rvalid;
M01_AXI_rready 		<= M_AXI_rready(1);

M02_AXI_awaddr 		<= M_AXI_awaddr(2);
M02_AXI_awprot 		<= M_AXI_awprot(2);
M02_AXI_awvalid 	<= M_AXI_awvalid(2); 
M_AXI_awready(2)	<= M02_AXI_awready; 
M02_AXI_wdata 		<= M_AXI_wdata(2);
M02_AXI_wstrb 		<= M_AXI_wstrb(2);
M02_AXI_wvalid 		<= M_AXI_wvalid(2);
M_AXI_wready(2) 	<= M02_AXI_wready;
M_AXI_bresp(2)  	<= M02_AXI_bresp; 
M_AXI_bvalid(2) 	<= M02_AXI_bvalid;
M02_AXI_bready 		<= M_AXI_bready(2);
M02_AXI_araddr 		<= M_AXI_araddr(2);
M02_AXI_arprot 		<= M_AXI_arprot(2);
M02_AXI_arvalid 	<= M_AXI_arvalid(2); 
M_AXI_arready(2)	<= M02_AXI_arready; 
M_AXI_rdata(2)  	<= M02_AXI_rdata; 
M_AXI_rresp(2)  	<= M02_AXI_rresp; 
M_AXI_rvalid(2) 	<= M02_AXI_rvalid;
M02_AXI_rready 		<= M_AXI_rready(2);

M03_AXI_awaddr 		<= M_AXI_awaddr(3);
M03_AXI_awprot 		<= M_AXI_awprot(3);
M03_AXI_awvalid 	<= M_AXI_awvalid(3); 
M_AXI_awready(3)	<= M03_AXI_awready; 
M03_AXI_wdata 		<= M_AXI_wdata(3);
M03_AXI_wstrb 		<= M_AXI_wstrb(3);
M03_AXI_wvalid 		<= M_AXI_wvalid(3);
M_AXI_wready(3) 	<= M03_AXI_wready;
M_AXI_bresp(3)  	<= M03_AXI_bresp; 
M_AXI_bvalid(3) 	<= M03_AXI_bvalid;
M03_AXI_bready 		<= M_AXI_bready(3);
M03_AXI_araddr 		<= M_AXI_araddr(3);
M03_AXI_arprot 		<= M_AXI_arprot(3);
M03_AXI_arvalid 	<= M_AXI_arvalid(3); 
M_AXI_arready(3)	<= M03_AXI_arready; 
M_AXI_rdata(3)  	<= M03_AXI_rdata; 
M_AXI_rresp(3)  	<= M03_AXI_rresp; 
M_AXI_rvalid(3) 	<= M03_AXI_rvalid;
M03_AXI_rready 		<= M_AXI_rready(3);

M04_AXI_awaddr 		<= M_AXI_awaddr(4);
M04_AXI_awprot 		<= M_AXI_awprot(4);
M04_AXI_awvalid 	<= M_AXI_awvalid(4); 
M_AXI_awready(4)	<= M04_AXI_awready; 
M04_AXI_wdata 		<= M_AXI_wdata(4);
M04_AXI_wstrb 		<= M_AXI_wstrb(4);
M04_AXI_wvalid 		<= M_AXI_wvalid(4);
M_AXI_wready(4) 	<= M04_AXI_wready;
M_AXI_bresp(4)  	<= M04_AXI_bresp; 
M_AXI_bvalid(4) 	<= M04_AXI_bvalid;
M04_AXI_bready 		<= M_AXI_bready(4);
M04_AXI_araddr 		<= M_AXI_araddr(4);
M04_AXI_arprot 		<= M_AXI_arprot(4);
M04_AXI_arvalid 	<= M_AXI_arvalid(4); 
M_AXI_arready(4)	<= M04_AXI_arready; 
M_AXI_rdata(4)  	<= M04_AXI_rdata; 
M_AXI_rresp(4)  	<= M04_AXI_rresp; 
M_AXI_rvalid(4) 	<= M04_AXI_rvalid;
M04_AXI_rready 		<= M_AXI_rready(4);

M05_AXI_awaddr 		<= M_AXI_awaddr(5);
M05_AXI_awprot 		<= M_AXI_awprot(5);
M05_AXI_awvalid 	<= M_AXI_awvalid(5); 
M_AXI_awready(5)	<= M05_AXI_awready; 
M05_AXI_wdata 		<= M_AXI_wdata(5);
M05_AXI_wstrb 		<= M_AXI_wstrb(5);
M05_AXI_wvalid 		<= M_AXI_wvalid(5);
M_AXI_wready(5) 	<= M05_AXI_wready;
M_AXI_bresp(5)  	<= M05_AXI_bresp; 
M_AXI_bvalid(5) 	<= M05_AXI_bvalid;
M05_AXI_bready 		<= M_AXI_bready(5);
M05_AXI_araddr 		<= M_AXI_araddr(5);
M05_AXI_arprot 		<= M_AXI_arprot(5);
M05_AXI_arvalid 	<= M_AXI_arvalid(5); 
M_AXI_arready(5)	<= M05_AXI_arready; 
M_AXI_rdata(5)  	<= M05_AXI_rdata; 
M_AXI_rresp(5)  	<= M05_AXI_rresp; 
M_AXI_rvalid(5) 	<= M05_AXI_rvalid;
M05_AXI_rready 		<= M_AXI_rready(5);

M06_AXI_awaddr 		<= M_AXI_awaddr(6);
M06_AXI_awprot 		<= M_AXI_awprot(6);
M06_AXI_awvalid 	<= M_AXI_awvalid(6); 
M_AXI_awready(6)	<= M06_AXI_awready; 
M06_AXI_wdata 		<= M_AXI_wdata(6);
M06_AXI_wstrb 		<= M_AXI_wstrb(6);
M06_AXI_wvalid 		<= M_AXI_wvalid(6);
M_AXI_wready(6) 	<= M06_AXI_wready;
M_AXI_bresp(6)  	<= M06_AXI_bresp; 
M_AXI_bvalid(6) 	<= M06_AXI_bvalid;
M06_AXI_bready 		<= M_AXI_bready(6);
M06_AXI_araddr 		<= M_AXI_araddr(6);
M06_AXI_arprot 		<= M_AXI_arprot(6);
M06_AXI_arvalid 	<= M_AXI_arvalid(6); 
M_AXI_arready(6)	<= M06_AXI_arready; 
M_AXI_rdata(6)  	<= M06_AXI_rdata; 
M_AXI_rresp(6)  	<= M06_AXI_rresp; 
M_AXI_rvalid(6) 	<= M06_AXI_rvalid;
M06_AXI_rready 		<= M_AXI_rready(6);

M07_AXI_awaddr 		<= M_AXI_awaddr(7);
M07_AXI_awprot 		<= M_AXI_awprot(7);
M07_AXI_awvalid 	<= M_AXI_awvalid(7); 
M_AXI_awready(7)	<= M07_AXI_awready; 
M07_AXI_wdata 		<= M_AXI_wdata(7);
M07_AXI_wstrb 		<= M_AXI_wstrb(7);
M07_AXI_wvalid 		<= M_AXI_wvalid(7);
M_AXI_wready(7) 	<= M07_AXI_wready;
M_AXI_bresp(7)  	<= M07_AXI_bresp; 
M_AXI_bvalid(7) 	<= M07_AXI_bvalid;
M07_AXI_bready 		<= M_AXI_bready(7);
M07_AXI_araddr 		<= M_AXI_araddr(7);
M07_AXI_arprot 		<= M_AXI_arprot(7);
M07_AXI_arvalid 	<= M_AXI_arvalid(7); 
M_AXI_arready(7)	<= M07_AXI_arready; 
M_AXI_rdata(7)  	<= M07_AXI_rdata; 
M_AXI_rresp(7)  	<= M07_AXI_rresp; 
M_AXI_rvalid(7) 	<= M07_AXI_rvalid;
M07_AXI_rready 		<= M_AXI_rready(7);



axi_reg_inst : entity work.axi_reg
port map(
	S_AXI_ACLK 		=> clk,
	S_AXI_ARESETN 	=> rst,
    S_AXI_AWADDR    => S_AXI_AWADDR, 
    S_AXI_AWPROT    => S_AXI_AWPROT,
    S_AXI_AWVALID   => S_AXI_AWVALID,
    S_AXI_AWREADY   => S_AXI_AWREADY,
    S_AXI_WDATA 	=> S_AXI_WDATA, 
    S_AXI_WSTRB 	=> S_AXI_WSTRB, 
    S_AXI_WVALID    => S_AXI_WVALID, 
    S_AXI_WREADY    => S_AXI_WREADY, 
    S_AXI_BRESP 	=> S_AXI_BRESP, 
    S_AXI_BVALID    => S_AXI_BVALID, 
    S_AXI_BREADY    => S_AXI_BREADY, 
    S_AXI_ARADDR    => S_AXI_ARADDR, 
    S_AXI_ARPROT    => S_AXI_ARPROT, 
    S_AXI_ARVALID   => S_AXI_ARVALID,
    S_AXI_ARREADY   => S_AXI_ARREADY,
    S_AXI_RDATA 	=> S_AXI_RDATA, 
    S_AXI_RRESP 	=> S_AXI_RRESP, 
    S_AXI_RVALID    => S_AXI_RVALID, 
    S_AXI_RREADY    => S_AXI_RREADY,
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
        M_AXI_awaddr 		=> M_AXI_awaddr(i),
        M_AXI_awprot 		=> M_AXI_awprot(i), 
        M_AXI_awvalid       => M_AXI_awvalid(i), 
        M_AXI_awready       => M_AXI_awready(i), 
        M_AXI_wdata         => M_AXI_wdata(i),   
        M_AXI_wstrb         => M_AXI_wstrb(i),   
        M_AXI_wvalid        => M_AXI_wvalid(i),  
        M_AXI_wready        => M_AXI_wready(i),  
        M_AXI_bresp         => M_AXI_bresp(i),   
        M_AXI_bvalid        => M_AXI_bvalid(i),  
        M_AXI_bready        => M_AXI_bready(i),  
        M_AXI_araddr        => M_AXI_araddr(i),  
        M_AXI_arprot        => M_AXI_arprot(i),  
        M_AXI_arvalid       => M_AXI_arvalid(i), 
        M_AXI_arready       => M_AXI_arready(i), 
        M_AXI_rdata         => M_AXI_rdata(i),   
        M_AXI_rresp         => M_AXI_rresp(i),   
        M_AXI_rvalid        => M_AXI_rvalid(i),  
        M_AXI_rready        => M_AXI_rready(i)  
    );
end generate;

end Behavioral;

