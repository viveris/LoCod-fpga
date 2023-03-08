library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.locod_pkg.all;


entity axi_reg is
port (
	-- Clock and reset
    clk      		: in std_logic;
    rst   			: in std_logic;
    
	-- AXI4 LITE Bus
    S_AXI_in        : in AXI4Lite_m_to_s;
    S_AXI_out       : out AXI4Lite_s_to_m;

    -- Output registers
    CTRL_REG_OUT    : out std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    CTRL_REG_IN     : in std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    REG_ARRAY_PORT  : out reg_array  
);
end axi_reg;

architecture Behavioral of axi_reg is

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
signal axi_rdata    : std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
signal axi_rresp    : std_logic_vector(1 downto 0);
signal axi_rvalid   : std_logic;

-- Valid addresses
signal axi_awaddr_valid : integer;
signal axi_araddr_valid : integer;

-- Registers
signal ctrl_reg_out_s : std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
signal ctrl_reg_in_s : std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
signal registers : reg_array;

-- Others
signal slv_reg_rden : std_logic;
signal slv_reg_wren : std_logic;


begin

-- Always
S_AXI_out.awready	<= axi_awready;
S_AXI_out.wready    <= axi_wready;
S_AXI_out.bresp 	<= axi_bresp;
S_AXI_out.bvalid    <= axi_bvalid;
S_AXI_out.arready   <= axi_arready;
S_AXI_out.rdata 	<= axi_rdata;
S_AXI_out.rresp 	<= axi_rresp;
S_AXI_out.rvalid    <= axi_rvalid;

axi_awaddr_valid <= to_integer(shift_right(unsigned(axi_awaddr), (AXI_REG_ADDR_WIDTH-VALID_ADDR_WIDTH)));
axi_araddr_valid <= to_integer(shift_right(unsigned(axi_araddr), (AXI_REG_ADDR_WIDTH-VALID_ADDR_WIDTH)));

CTRL_REG_OUT <= ctrl_reg_out_s;
ctrl_reg_in_s <= CTRL_REG_IN;
REG_ARRAY_PORT <= registers;


-- ======================================= Processes ========================================
-- Implement axi_awready generation
-- axi_awready is asserted for one clk clock cycle when both
-- S_AXI_awvalid and S_AXI_wvalid are asserted. axi_awready is
-- de-asserted when reset is low.
process (clk)
begin
	if rising_edge(clk) then 
    	if rst = '0' then
      		axi_awready <= '0';
    	else
			if (axi_awready = '0' and S_AXI_in.awvalid = '1' and S_AXI_in.wvalid = '1') then
        		axi_awready <= '1';
      		else
        		axi_awready <= '0';
      		end if;
    	end if;
  	end if;
end process;



-- Implement axi_awaddr latching
-- This process is used to latch the address when both 
-- S_AXI_awvalid and S_AXI_wvalid are valid. 
process (clk)
begin
  	if rising_edge(clk) then 
    	if rst = '0' then
      		axi_awaddr <= (others => '0');
    	else
      		if (axi_awready = '0' and S_AXI_in.awvalid = '1' and S_AXI_in.wvalid = '1') then
        		-- Write Address latching
        		axi_awaddr <= S_AXI_in.awaddr(AXI_REG_ADDR_WIDTH-1 downto 0);
      		end if;
    	end if;
  	end if;                   
end process;



-- Implement axi_wready generation
-- axi_wready is asserted for one clk clock cycle when both
-- S_AXI_awvalid and S_AXI_wvalid are asserted. axi_wready is 
-- de-asserted when reset is low. 
process (clk)
begin
  	if rising_edge(clk) then 
    	if rst = '0' then
      		axi_wready <= '0';
    	else
		   	if (axi_wready = '0' and S_AXI_in.wvalid = '1' and S_AXI_in.awvalid = '1') then
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
-- axi_awready, S_AXI_awvalid, axi_wready and S_AXI_wvalid are asserted. Write strobes are used to
-- select byte enables of slave registers while writing.
-- These registers are cleared when reset (active low) is applied.
-- Slave register write enable is asserted when valid address and data are available
-- and the slave is ready to accept the write address and write data.
slv_reg_wren <= axi_wready and S_AXI_in.wvalid and axi_awready and S_AXI_in.awvalid;

process (clk)
begin
	if rising_edge(clk) then 
		if rst = '0' then
		    ctrl_reg_out_s <= (others => '0');
			registers <= (others => (others => '0'));
		else
		    if (slv_reg_wren = '1') then
                if (axi_awaddr_valid = 0) then
                    ctrl_reg_out_s <= S_AXI_in.wdata;
                elsif ((axi_awaddr_valid >= 2) and (axi_awaddr_valid <= NB_REGISTERS + 1)) then    
                    registers(axi_awaddr_valid-2) <= S_AXI_in.wdata;
                end if;
            end if;
		end if;
	end if;                   
end process;



-- Implement write response logic generation
-- The write response and response valid signals are asserted by the slave 
-- when axi_awready, S_AXI_awvalid, axi_wready and S_AXI_wvalid are asserted.  
-- This marks the acceptance of address and indicates the status of 
-- write transaction.
process (clk)
begin
  	if rising_edge(clk) then 
    	if rst = '0' then
      		axi_bvalid  <= '0';
      		axi_bresp   <= "00"; --need to work more on the responses
    	else
      		if (axi_awready = '1' and S_AXI_in.awvalid = '1' and axi_wready = '1' and S_AXI_in.wvalid = '1' and axi_bvalid = '0'  ) then
        		axi_bvalid <= '1';
        		axi_bresp  <= "00"; 
      		elsif (S_AXI_in.bready = '1' and axi_bvalid = '1') then   --check if bready is asserted while bvalid is high)
        		axi_bvalid <= '0';                                 -- (there is a possibility that bready is always asserted high)
      		end if;
    	end if;
  	end if;                   
end process; 



-- Implement axi_arready generation
-- axi_arready is asserted for one clk clock cycle when
-- S_AXI_arvalid is asserted. axi_awready is 
-- de-asserted when reset (active low) is asserted. 
-- The read address is also latched when S_AXI_arvalid is 
-- asserted. axi_araddr is reset to zero on reset assertion.
process (clk)
begin
  	if rising_edge(clk) then 
    	if rst = '0' then
      		axi_arready <= '0';
      		axi_araddr  <= (others => '1');
    	else
      		if (axi_arready = '0' and S_AXI_in.arvalid = '1') then
        		-- indicates that the slave has acceped the valid read address
        		axi_arready <= '1';
        		-- Read Address latching 
        		axi_araddr  <= S_AXI_in.araddr(AXI_REG_ADDR_WIDTH-1 downto 0);
      		else
        		axi_arready <= '0';
      		end if;
    	end if;
  	end if;                   
end process;



-- Implement axi_rvalid generation
-- axi_rvalid is asserted for one clk clock cycle when both 
-- S_AXI_arvalid and axi_arready are asserted. The slave registers 
-- data are available on the axi_rdata bus at this instance. The 
-- assertion of axi_rvalid marks the validity of read data on the 
-- bus and axi_rresp indicates the status of read transaction. axi_rvalid 
-- is deasserted on reset (active low). axi_rresp and axi_rdata are 
-- cleared to zero on reset (active low).  
process (clk)
begin
  	if rising_edge(clk) then
    	if rst = '0' then
      		axi_rvalid <= '0';
      		axi_rresp  <= "00";
    	else
      		if (axi_arready = '1' and S_AXI_in.arvalid = '1' and axi_rvalid = '0') then
        		-- Valid read data is available at the read data bus
        		axi_rvalid <= '1';
        		axi_rresp  <= "00"; -- 'OKAY' response
      		elsif (axi_rvalid = '1' and S_AXI_in.rready = '1') then
        		-- Read data is accepted by the master
        		axi_rvalid <= '0';
      		end if;            
    	end if;
  	end if;
end process;



-- Implement memory mapped register select and read logic generation
-- Slave register read enable is asserted when valid address is available
-- and the slave is ready to accept the read address.
slv_reg_rden <= axi_arready and S_AXI_in.arvalid and (not axi_rvalid);

-- Output register or memory read data
process( clk ) is
begin
	if (rising_edge (clk)) then
		if ( rst = '0' ) then
		  	axi_rdata  <= (others => '0');
		else
            if (slv_reg_rden = '1') then
		    	-- When there is a valid read address (S_AXI_arvalid) with 
		    	-- acceptance of read address by the slave (axi_arready), 
		    	-- output the read dada 
		    	-- Read address mux
		    	if (axi_araddr_valid = 0) then
		      	    axi_rdata <= ctrl_reg_out_s;
		      	elsif (axi_araddr_valid = 1) then
		      	    axi_rdata <= ctrl_reg_in_s;
                elsif ((axi_araddr_valid >= 2) and (axi_araddr_valid <= NB_REGISTERS + 1)) then    
                    axi_rdata <= registers(axi_araddr_valid-2);       -- register read data
                end if;
		  	end if;   
		end if;
	end if;
end process;


end Behavioral;