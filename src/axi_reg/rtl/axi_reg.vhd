library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

use work.locod_pkg.all;


entity axi_reg is
generic (
    NB_REGISTERS_OUT    : integer := 1;
    NB_REGISTERS_IN     : integer := 1;
    BASE_ADDRESS        : std_logic_vector(AXIL_ADDR_WIDTH-1 downto 0) := (others => '0')
);
port (
    -- Clock and reset
    clk_i      			: in std_logic;
    rstn_i   			: in std_logic;
    
    -- AXI4 LITE Slave
    S_AXIL_awaddr_i     : in std_logic_vector(AXIL_ADDR_WIDTH-1 downto 0);
    S_AXIL_awprot_i     : in std_logic_vector(2 downto 0);
    S_AXIL_awvalid_i    : in std_logic;
    S_AXIL_awready_o    : out std_logic;
    S_AXIL_wdata_i      : in std_logic_vector(AXIL_DATA_WIDTH-1 downto 0);
    S_AXIL_wstrb_i      : in std_logic_vector((AXIL_DATA_WIDTH/8)-1 downto 0);
    S_AXIL_wvalid_i     : in std_logic;
    S_AXIL_wready_o     : out std_logic;
    S_AXIL_bresp_o      : out std_logic_vector(1 downto 0);
    S_AXIL_bvalid_o     : out std_logic;
    S_AXIL_bready_i     : in std_logic;
    S_AXIL_araddr_i     : in std_logic_vector(AXIL_ADDR_WIDTH-1 downto 0);
    S_AXIL_arprot_i     : in std_logic_vector(2 downto 0);
    S_AXIL_arvalid_i    : in std_logic;
    S_AXIL_arready_o    : out std_logic;
    S_AXIL_rdata_o      : out std_logic_vector(AXIL_DATA_WIDTH-1 downto 0);
    S_AXIL_rresp_o      : out std_logic_vector(1 downto 0);
    S_AXIL_rvalid_o     : out std_logic;
    S_AXIL_rready_i     : in std_logic;

    -- Registers
    REG_ARRAY_PORT_o   : out reg_array(NB_REGISTERS_OUT-1 downto 0);
    REG_ARRAY_PORT_i   : in reg_array(NB_REGISTERS_IN-1 downto 0)
);
end axi_reg;


architecture Behavioral of axi_reg is


-- Constants
-- ADDR_LSB is used for addressing 32/64 bit registers/memories
-- ADDR_LSB = 2 for 32 bits (n downto 2)
-- ADDR_LSB = 3 for 64 bits (n downto 3)
constant ADDR_LSB       : integer := (AXIL_DATA_WIDTH/32)+ 1;
constant REG_ADDR_WIDTH : integer := integer(ceil(log2(real((NB_REGISTERS_OUT+NB_REGISTERS_IN)*4)))); --Address range that we use over bytes

-- AXI4 LITE signals
signal axil_awaddr      : std_logic_vector(AXIL_ADDR_WIDTH-1 downto 0);
signal axil_awready     : std_logic;
signal axil_wready      : std_logic;
signal axil_bresp       : std_logic_vector(1 downto 0);
signal axil_bvalid      : std_logic;
signal axil_araddr      : std_logic_vector(AXIL_ADDR_WIDTH-1 downto 0);
signal axil_arready     : std_logic;
signal axil_rdata       : std_logic_vector(AXIL_DATA_WIDTH-1 downto 0);
signal axil_rresp       : std_logic_vector(1 downto 0);
signal axil_rvalid      : std_logic;

-- Valid addresses
signal axil_awaddr_valid    : integer;
signal axil_araddr_valid    : integer;

-- Registers
signal registers_out : reg_array(NB_REGISTERS_OUT-1 downto 0) := (others => (others => '0')); --DFF that stores value from AXI writes

-- Others
signal aw_en	        : std_logic;
signal slv_reg_rden     : std_logic;
signal slv_reg_wren     : std_logic;


begin


-- Always
S_AXIL_awready_o	<= axil_awready;
S_AXIL_wready_o	    <= axil_wready;
S_AXIL_bresp_o	    <= axil_bresp;
S_AXIL_bvalid_o	    <= axil_bvalid;
S_AXIL_arready_o	<= axil_arready;
S_AXIL_rdata_o	    <= axil_rdata;
S_AXIL_rresp_o	    <= axil_rresp;
S_AXIL_rvalid_o	    <= axil_rvalid;

axil_awaddr_valid <= to_integer(shift_right(unsigned(axil_awaddr(REG_ADDR_WIDTH-1 downto 0)), ADDR_LSB));
axil_araddr_valid <= to_integer(shift_right(unsigned(axil_araddr(REG_ADDR_WIDTH-1 downto 0)), ADDR_LSB));

REG_ARRAY_PORT_o <= registers_out;


-- ======================================= Processes ========================================
-- Implement axil_awready generation
-- axil_awready is asserted for one clk_i clock cycle when both
-- S_AXIL_awvalid_i and S_AXIL_wvalid_i are asserted. axil_awready is
-- de-asserted when reset is low.
process(clk_i)
begin
    if rising_edge(clk_i) then 
        if rstn_i = '0' then
            axil_awready <= '0';
            aw_en <= '1';
        else
            if (axil_awready = '0' and S_AXIL_awvalid_i = '1' and S_AXIL_wvalid_i = '1' and aw_en = '1') then
            -- slave is ready to accept write address when
            -- there is a valid write address and write data
            -- on the write address and data bus. This design 
            -- expects no outstanding transactions. 
                axil_awready <= '1';
                aw_en <= '0';
            elsif (S_AXIL_bready_i = '1' and axil_bvalid = '1') then
                aw_en <= '1';
                axil_awready <= '0';
            else
                axil_awready <= '0';
            end if;
        end if;
    end if;
end process;


-- Implement axil_awaddr latching
-- This process is used to latch the address when both 
-- S_AXIL_awvalid_i and S_AXIL_wvalid_i are valid. 
process (clk_i)
begin
    if rising_edge(clk_i) then 
        if rstn_i = '0' then
            axil_awaddr <= (others => '0');
        else
            if (axil_awready = '0' and S_AXIL_awvalid_i = '1' and S_AXIL_wvalid_i = '1' and aw_en = '1') then
            -- Write Address latching
            axil_awaddr <= std_logic_vector(unsigned(S_AXIL_awaddr_i) - unsigned(BASE_ADDRESS));
            end if;
        end if;
    end if;                   
end process;


-- Implement axil_wready generation
-- axil_wready is asserted for one clk_i clock cycle when both
-- S_AXIL_awvalid_i and S_AXIL_wvalid_i are asserted. axil_wready is 
-- de-asserted when reset is low. 
process (clk_i)
begin
    if rising_edge(clk_i) then 
        if rstn_i = '0' then
            axil_wready <= '0';
        else
            if (axil_wready = '0' and S_AXIL_wvalid_i = '1' and S_AXIL_awvalid_i = '1' and aw_en = '1') then
                -- slave is ready to accept write data when 
                -- there is a valid write address and write data
                -- on the write address and data bus. This design 
                -- expects no outstanding transactions.           
                axil_wready <= '1';
            else
                axil_wready <= '0';
            end if;
        end if;
    end if;
end process;


-- Implement memory mapped register select and write logic generation
-- The write data is accepted and written to memory mapped registers when
-- axil_awready, S_AXIL_wvalid_i, axil_wready and S_AXIL_wvalid_i are asserted.
-- These registers are cleared when reset (active low) is applied.
-- Slave register write enable is asserted when valid address and data are available
-- and the slave is ready to accept the write address and write data.
slv_reg_wren <= axil_wready and S_AXIL_wvalid_i and axil_awready and S_AXIL_awvalid_i;

process (clk_i)
begin
    if rising_edge(clk_i) then 
        if rstn_i = '0' then
            registers_out <= (others => (others => '0'));
        else
            if (slv_reg_wren = '1') then
                if (axil_awaddr_valid < NB_REGISTERS_OUT) then  --Output port
                    registers_out(axil_awaddr_valid) <= S_AXIL_wdata_i;
                else                                            --Input port
                    --nothing
                end if;
            end if;
        end if;
    end if;                  
end process;


-- Implement write response logic generation
-- The write response and response valid signals are asserted by the slave 
-- when axil_awready, S_AXIL_awvalid_i, axil_wready and S_AXIL_wvalid_i are asserted.  
-- This marks the acceptance of address and indicates the status of 
-- write transaction.
process (clk_i)
begin
    if rising_edge(clk_i) then 
        if rstn_i = '0' then
            axil_bvalid  <= '0';
            axil_bresp   <= "00"; --need to work more on the responses
        else
            if (axil_awready = '1' and S_AXIL_awvalid_i = '1' and axil_wready = '1' and S_AXIL_wvalid_i = '1' and axil_bvalid = '0'  ) then
                axil_bvalid <= '1';
                axil_bresp  <= "00"; 
            elsif (S_AXIL_bready_i = '1' and axil_bvalid = '1') then    --check if bready is asserted while bvalid is high)
                axil_bvalid <= '0';                                     -- (there is a possibility that bready is always asserted high)
            end if;
        end if;
    end if;                   
end process;


-- Implement axil_arready generation
-- axil_arready is asserted for one clk_i clock cycle when
-- S_AXIL_arvalid_i is asserted. axi_awready is 
-- de-asserted when reset (active low) is asserted. 
-- The read address is also latched when S_AXIL_arvalid_i is 
-- asserted. axil_araddr is reset to zero on reset assertion.
process (clk_i)
begin
    if rising_edge(clk_i) then 
        if rstn_i = '0' then
            axil_arready <= '0';
            axil_araddr  <= (others => '1');
        else
            if (axil_arready = '0' and S_AXIL_arvalid_i = '1' and (axil_rvalid = '0' or S_AXIL_rready_i = '1')) then
                -- indicates that the slave has acceped the valid read address
                axil_arready <= '1';
                -- Read Address latching 
                axil_araddr <= std_logic_vector(unsigned(S_AXIL_araddr_i) - unsigned(BASE_ADDRESS));         
            else
                axil_arready <= '0';
            end if;
        end if;
    end if;                   
end process; 


-- Implement axil_arvalid generation
-- axil_rvalid is asserted for one clk_i clock cycle when both 
-- S_AXIL_arvalid_i and axil_arready are asserted. The slave registers 
-- data are available on the axil_rdata bus at this instance. The 
-- assertion of axil_rvalid marks the validity of read data on the 
-- bus and axil_rresp indicates the status of read transaction. axil_rvalid 
-- is deasserted on reset (active low). axil_rresp and axil_rdata are 
-- cleared to zero on reset (active low).  
process (clk_i)
begin
    if rising_edge(clk_i) then
        if rstn_i = '0' then
            axil_rvalid <= '0';
            axil_rresp  <= "00";
        else
            if (axil_arready = '1' and S_AXIL_arvalid_i = '1' and axil_rvalid = '0') then
                -- Valid read data is available at the read data bus
                axil_rvalid <= '1';
                axil_rresp  <= "00"; -- 'OKAY' response
            elsif (axil_rvalid = '1' and S_AXIL_rready_i = '1') then
                -- Read data is accepted by the master
                axil_rvalid <= '0';
            end if;            
        end if;
    end if;
end process;


-- Implement memory mapped register select and read logic generation
-- Slave register read enable is asserted when valid address is available
-- and the slave is ready to accept the read address.
slv_reg_rden <= axil_arready and S_AXIL_arvalid_i and (not axil_rvalid) ;

-- Output register or memory read data
process (clk_i)
begin
    if rising_edge(clk_i) then
        if rstn_i = '0' then
            axil_rdata <= (others => '0');
        else
            if (slv_reg_rden = '1') then
                -- When there is a valid read address (S_AXIL_arvalid_i) with 
                -- acceptance of read address by the slave (axil_arready), 
                -- output the read dada 
                -- Read address mux
                if (axil_araddr_valid < NB_REGISTERS_OUT) then    --Output port
                    axil_rdata <= registers_out(axil_araddr_valid);
                else                                                --Input port
                    axil_rdata <= REG_ARRAY_PORT_i(axil_araddr_valid - NB_REGISTERS_OUT);
                end if;
            end if;
        end if;
    end if;
end process;


end Behavioral;