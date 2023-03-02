library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

package locod_pkg is
        constant MAX_ACCELERATORS       : integer := 8;
        constant NB_ACCELERATORS        : integer := 3;
        constant NB_REGISTERS           : integer := 2*NB_ACCELERATORS;
        constant AXI_REG_ADDR_WIDTH     : integer := 7; --integer(ceil(log2(real((NB_REGISTERS+2)*4))))
        constant AXI_MASTER_ADDR_WIDTH  : integer := 32;
        constant DATA_WIDTH             : integer := 32;
       
        type reg_array is array(NB_REGISTERS-1 downto 0) of std_logic_vector(DATA_WIDTH-1 downto 0);
		
		type m_axi_awaddr_array is array(MAX_ACCELERATORS-1 downto 0) of std_logic_vector(AXI_MASTER_ADDR_WIDTH-1 downto 0);
		type m_axi_awprot_array is array(MAX_ACCELERATORS-1 downto 0) of std_logic_vector(2 downto 0);
		type m_axi_awvalid_array is array(MAX_ACCELERATORS-1 downto 0) of std_logic;
		type m_axi_awready_array is array(MAX_ACCELERATORS-1 downto 0) of std_logic;
		
		type m_axi_wdata_array is array(MAX_ACCELERATORS-1 downto 0) of std_logic_vector(DATA_WIDTH-1 downto 0);
		type m_axi_wstrb_array is array(MAX_ACCELERATORS-1 downto 0) of std_logic_vector(3 downto 0);
		type m_axi_wvalid_array is array(MAX_ACCELERATORS-1 downto 0) of std_logic;
		type m_axi_wready_array is array(MAX_ACCELERATORS-1 downto 0) of std_logic;
		
		type m_axi_bresp_array is array(MAX_ACCELERATORS-1 downto 0) of std_logic_vector(1 downto 0);
		type m_axi_bvalid_array is array(MAX_ACCELERATORS-1 downto 0) of std_logic;
		type m_axi_bready_array is array(MAX_ACCELERATORS-1 downto 0) of std_logic;
		
		type m_axi_araddr_array is array(MAX_ACCELERATORS-1 downto 0) of std_logic_vector(AXI_MASTER_ADDR_WIDTH-1 downto 0);
		type m_axi_arprot_array is array(MAX_ACCELERATORS-1 downto 0) of std_logic_vector(2 downto 0);
		type m_axi_arvalid_array is array(MAX_ACCELERATORS-1 downto 0) of std_logic;
		type m_axi_arready_array is array(MAX_ACCELERATORS-1 downto 0) of std_logic;
		
		type m_axi_rdata_array is array(MAX_ACCELERATORS-1 downto 0) of std_logic_vector(DATA_WIDTH-1 downto 0);
		type m_axi_rresp_array is array(MAX_ACCELERATORS-1 downto 0) of std_logic_vector(1 downto 0);
		type m_axi_rvalid_array is array(MAX_ACCELERATORS-1 downto 0) of std_logic;
		type m_axi_rready_array is array(MAX_ACCELERATORS-1 downto 0) of std_logic;
end package;