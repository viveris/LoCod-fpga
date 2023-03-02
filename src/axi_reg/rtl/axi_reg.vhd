library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

use work.locod_pkg.all;


entity axi_reg is
port (
	-- AXI4 LITE Bus
    S_AXI_ACLK      : in std_logic;
    S_AXI_ARESETN   : in std_logic;

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

    -- Output registers
    CTRL_REG_OUT    : out std_logic_vector(DATA_WIDTH-1 downto 0);
    CTRL_REG_IN     : in std_logic_vector(DATA_WIDTH-1 downto 0);
    REG_ARRAY_PORT  : out reg_array  
);
end axi_reg;

architecture behavioral of axi_reg is

-- Constants
constant VALID_ADDR_WIDTH 	: integer := AXI_REG_ADDR_WIDTH - 2;

-- AXI4 LITE signals
signal axi_awaddr   : std_logic_vector(AXI_REG_ADDR_WIDTH-1 downto 0);
signal axi_awready  : std_logic;
signal axi_wready   : std_logic;
signal axi_bresp    : std_logic_vector(1 downto 0);
signal axi_bvalid   : std_logic;
signal axi_araddr   : std_logic_vector(AXI_REG_ADDR_WIDTH-1 downto 0);
signal axi_arready  : std_logic;
signal axi_rdata    : std_logic_vector(DATA_WIDTH-1 downto 0);
signal axi_rresp    : std_logic_vector(1 downto 0);
signal axi_rvalid   : std_logic;

-- Valid addresses
signal s_axi_awaddr_valid : integer;
signal s_axi_araddr_valid : integer;


-- Registers
signal ctrl_reg_out_s : std_logic_vector(DATA_WIDTH-1 downto 0);
signal ctrl_reg_in_s : std_logic_vector(DATA_WIDTH-1 downto 0);
signal registers : reg_array;


-- Others
signal slv_reg_rden : std_logic;
signal slv_reg_wren : std_logic;


begin

-- Always
S_AXI_AWREADY   <= axi_awready;
S_AXI_WREADY    <= axi_wready;
S_AXI_BRESP 	<= axi_bresp;
S_AXI_BVALID    <= axi_bvalid;
S_AXI_ARREADY   <= axi_arready;
S_AXI_RDATA 	<= axi_rdata;
S_AXI_RRESP 	<= axi_rresp;
S_AXI_RVALID    <= axi_rvalid;

s_axi_awaddr_valid <= to_integer(shift_right(unsigned(axi_awaddr), (AXI_REG_ADDR_WIDTH-VALID_ADDR_WIDTH)));
s_axi_araddr_valid <= to_integer(shift_right(unsigned(axi_araddr), (AXI_REG_ADDR_WIDTH-VALID_ADDR_WIDTH)));

CTRL_REG_OUT <= ctrl_reg_out_s;
ctrl_reg_in_s <= CTRL_REG_IN;
REG_ARRAY_PORT <= registers;


-- ======================================= Processes ========================================
-- Implement axi_awready generation
-- axi_awready is asserted for one S_AXI_ACLK clock cycle when both
-- S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_awready is
-- de-asserted when reset is low.
process (S_AXI_ACLK)
begin
	if rising_edge(S_AXI_ACLK) then 
    	if S_AXI_ARESETN = '0' then
      		axi_awready <= '0';
    	else
			if (axi_awready = '0' and S_AXI_AWVALID = '1' and S_AXI_WVALID = '1') then
        		axi_awready <= '1';
      		else
        		axi_awready <= '0';
      		end if;
    	end if;
  	end if;
end process;



-- Implement axi_awaddr latching
-- This process is used to latch the address when both 
-- S_AXI_AWVALID and S_AXI_WVALID are valid. 
process (S_AXI_ACLK)
begin
  	if rising_edge(S_AXI_ACLK) then 
    	if S_AXI_ARESETN = '0' then
      		axi_awaddr <= (others => '0');
    	else
      		if (axi_awready = '0' and S_AXI_AWVALID = '1' and S_AXI_WVALID = '1') then
        		-- Write Address latching
        		axi_awaddr <= S_AXI_AWADDR;
      		end if;
    	end if;
  	end if;                   
end process;



-- Implement axi_wready generation
-- axi_wready is asserted for one S_AXI_ACLK clock cycle when both
-- S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_wready is 
-- de-asserted when reset is low. 
process (S_AXI_ACLK)
begin
  	if rising_edge(S_AXI_ACLK) then 
    	if S_AXI_ARESETN = '0' then
      		axi_wready <= '0';
    	else
		   	if (axi_wready = '0' and S_AXI_WVALID = '1' and S_AXI_AWVALID = '1') then
		        -- slave is ready to accept write data when 
		        -- there is a valid write address and write data
		        -- on the write address and data bus. This design 
		        -- expects no outstanding transactions.           
		        axi_wready <= '1';
		    else
		      	axi_wready <= '0';
		    end if;
    	end if;
  	end if;
end process;



-- Implement memory mapped register select and write logic generation
-- The write data is accepted and written to memory mapped registers when
-- axi_awready, S_AXI_AWVALID, axi_wready and S_AXI_WVALID are asserted. Write strobes are used to
-- select byte enables of slave registers while writing.
-- These registers are cleared when reset (active low) is applied.
-- Slave register write enable is asserted when valid address and data are available
-- and the slave is ready to accept the write address and write data.
slv_reg_wren <= axi_wready and S_AXI_WVALID and axi_awready and S_AXI_AWVALID;

process (S_AXI_ACLK, CTRL_REG_IN)
begin
	if rising_edge(S_AXI_ACLK) then 
		if S_AXI_ARESETN = '0' then
		    ctrl_reg_out_s <= (others => '0');
			registers <= (others => (others => '0'));
		else
		    if (slv_reg_wren = '1') then
                if (s_axi_awaddr_valid = 0) then
                    ctrl_reg_out_s <= S_AXI_WDATA;
                elsif ((s_axi_awaddr_valid >= 2) and (s_axi_awaddr_valid <= NB_REGISTERS + 1)) then    
                    registers(s_axi_awaddr_valid-2) <= S_AXI_WDATA;
                end if;
            end if;
		end if;
	end if;                   
end process;



-- Implement write response logic generation
-- The write response and response valid signals are asserted by the slave 
-- when axi_awready, S_AXI_AWVALID, axi_wready and S_AXI_WVALID are asserted.  
-- This marks the acceptance of address and indicates the status of 
-- write transaction.
process (S_AXI_ACLK)
begin
  	if rising_edge(S_AXI_ACLK) then 
    	if S_AXI_ARESETN = '0' then
      		axi_bvalid  <= '0';
      		axi_bresp   <= "00"; --need to work more on the responses
    	else
      		if (axi_awready = '1' and S_AXI_AWVALID = '1' and axi_wready = '1' and S_AXI_WVALID = '1' and axi_bvalid = '0'  ) then
        		axi_bvalid <= '1';
        		axi_bresp  <= "00"; 
      		elsif (S_AXI_BREADY = '1' and axi_bvalid = '1') then   --check if bready is asserted while bvalid is high)
        		axi_bvalid <= '0';                                 -- (there is a possibility that bready is always asserted high)
      		end if;
    	end if;
  	end if;                   
end process; 



-- Implement axi_arready generation
-- axi_arready is asserted for one S_AXI_ACLK clock cycle when
-- S_AXI_ARVALID is asserted. axi_awready is 
-- de-asserted when reset (active low) is asserted. 
-- The read address is also latched when S_AXI_ARVALID is 
-- asserted. axi_araddr is reset to zero on reset assertion.
process (S_AXI_ACLK)
begin
  	if rising_edge(S_AXI_ACLK) then 
    	if S_AXI_ARESETN = '0' then
      		axi_arready <= '0';
      		axi_araddr  <= (others => '1');
    	else
      		if (axi_arready = '0' and S_AXI_ARVALID = '1') then
        		-- indicates that the slave has acceped the valid read address
        		axi_arready <= '1';
        		-- Read Address latching 
        		axi_araddr  <= S_AXI_ARADDR;           
      		else
        		axi_arready <= '0';
      		end if;
    	end if;
  	end if;                   
end process;



-- Implement axi_rvalid generation
-- axi_rvalid is asserted for one S_AXI_ACLK clock cycle when both 
-- S_AXI_ARVALID and axi_arready are asserted. The slave registers 
-- data are available on the axi_rdata bus at this instance. The 
-- assertion of axi_rvalid marks the validity of read data on the 
-- bus and axi_rresp indicates the status of read transaction.axi_rvalid 
-- is deasserted on reset (active low). axi_rresp and axi_rdata are 
-- cleared to zero on reset (active low).  
process (S_AXI_ACLK)
begin
  	if rising_edge(S_AXI_ACLK) then
    	if S_AXI_ARESETN = '0' then
      		axi_rvalid <= '0';
      		axi_rresp  <= "00";
    	else
      		if (axi_arready = '1' and S_AXI_ARVALID = '1' and axi_rvalid = '0') then
        		-- Valid read data is available at the read data bus
        		axi_rvalid <= '1';
        		axi_rresp  <= "00"; -- 'OKAY' response
      		elsif (axi_rvalid = '1' and S_AXI_RREADY = '1') then
        		-- Read data is accepted by the master
        		axi_rvalid <= '0';
      		end if;            
    	end if;
  	end if;
end process;



-- Implement memory mapped register select and read logic generation
-- Slave register read enable is asserted when valid address is available
-- and the slave is ready to accept the read address.
slv_reg_rden <= axi_arready and S_AXI_ARVALID and (not axi_rvalid);

-- Output register or memory read data
process( S_AXI_ACLK ) is
begin
	if (rising_edge (S_AXI_ACLK)) then
		if ( S_AXI_ARESETN = '0' ) then
		  	axi_rdata  <= (others => '0');
		else
            if (slv_reg_rden = '1') then
		    	-- When there is a valid read address (S_AXI_ARVALID) with 
		    	-- acceptance of read address by the slave (axi_arready), 
		    	-- output the read dada 
		    	-- Read address mux
		      	if (s_axi_araddr_valid = 1) then
		      	    axi_rdata <= ctrl_reg_in_s;
                elsif ((s_axi_araddr_valid >= 2) and (s_axi_araddr_valid <= NB_REGISTERS + 1)) then    
                    axi_rdata <= registers(s_axi_araddr_valid-2);       -- register read data
                end if;
		  	end if;   
		end if;
	end if;
end process;


end behavioral;