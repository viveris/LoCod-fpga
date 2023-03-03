library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

package locod_pkg is
        constant MAX_ACCELERATORS       : integer := 8;
        constant NB_ACCELERATORS        : integer := 3;
        constant NB_REGISTERS           : integer := 2*NB_ACCELERATORS;
        constant AXI_REG_ADDR_WIDTH     : integer := 7; --integer(ceil(log2(real((NB_REGISTERS+2)*4))))
        constant AXI_ADDR_WIDTH         : integer := 32;
        constant AXI_DATA_WIDTH         : integer := 32;
       
        type reg_array is array(NB_REGISTERS-1 downto 0) of std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
		
        type AXI4Lite_m_to_s is record
            awaddr : std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
            awprot : std_logic_vector(2 downto 0);
            awvalid : std_logic;       
            wdata : std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
            wstrb : std_logic_vector(3 downto 0);
            wvalid : std_logic;         
            bready : std_logic;          
            araddr : std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
            arprot : std_logic_vector(2 downto 0);
            arvalid : std_logic;
            rready : std_logic;
        end record AXI4Lite_m_to_s;
        
        type AXI4Lite_s_to_m is record
            awready : std_logic;
            wready : std_logic;         
            bresp : std_logic_vector(1 downto 0);
            bvalid : std_logic;         
            arready : std_logic;         
            rdata : std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
            rresp : std_logic_vector(1 downto 0);
            rvalid : std_logic;     
        end record AXI4Lite_s_to_m;
        
        -- TODO : replace MAX_ACCELERATORS by NB_ACCELERATORS to optimize design
        type AXI4Lite_m_to_s_array is array(MAX_ACCELERATORS-1 downto 0) of AXI4Lite_m_to_s;
        type AXI4Lite_s_to_m_array is array(MAX_ACCELERATORS-1 downto 0) of AXI4Lite_s_to_m;
       
end package;