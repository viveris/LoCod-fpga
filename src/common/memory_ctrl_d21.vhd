library ieee;
use ieee.std_logic_1164.all;


entity MEMORY_CTRL_D21 is
generic (
	BITSIZE_in1: integer;
	BITSIZE_in2: integer;
	BITSIZE_in3: integer;
	BITSIZE_out1: integer;
	BITSIZE_Min_addr_ram: integer;
	BITSIZE_Mout_addr_ram: integer;
	BITSIZE_M_Rdata_ram: integer;
	BITSIZE_Min_Wdata_ram: integer;
	BITSIZE_Mout_Wdata_ram: integer;
	BITSIZE_Min_data_ram_size: integer;
	BITSIZE_Mout_data_ram_size: integer
);
port (
	-- IN
	clock : in std_logic;
	start_port : in std_logic;
	in1 : in std_logic_vector(BITSIZE_in1-1 downto 0) ;
	in2 : in std_logic_vector(BITSIZE_in2-1 downto 0) ;
	in3 : in std_logic_vector(BITSIZE_in3-1 downto 0) ;
	in4 : in std_logic;
	sel_LOAD : in std_logic;
	sel_STORE : in std_logic;
	Min_oe_ram : in std_logic;
	Min_we_ram : in std_logic;
	Min_addr_ram : in std_logic_vector(BITSIZE_Min_addr_ram-1 downto 0) ;
	M_Rdata_ram : in std_logic_vector(BITSIZE_M_Rdata_ram-1 downto 0) ;
	Min_Wdata_ram : in std_logic_vector(BITSIZE_Min_Wdata_ram-1 downto 0) ;
	Min_data_ram_size : in std_logic_vector(BITSIZE_Min_data_ram_size-1 downto 0) ;
	M_DataRdy : in std_logic;
	-- OUT
	done_port : out std_logic;
	out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) ;
	Mout_oe_ram : out std_logic;
	Mout_we_ram : out std_logic;
	Mout_addr_ram : out std_logic_vector(BITSIZE_Mout_addr_ram-1 downto 0) ;
	Mout_Wdata_ram : out std_logic_vector(BITSIZE_Mout_Wdata_ram-1 downto 0) ;
	Mout_data_ram_size : out std_logic_vector(BITSIZE_Mout_data_ram_size-1 downto 0) 
);
end MEMORY_CTRL_D21;


architecture Behavioral of MEMORY_CTRL_D21 is


signal tmp_addr : std_logic_vector(BITSIZE_in2-1 downto 0);
signal delayed_out1 : std_logic_vector(BITSIZE_out1-1 downto 0) := (others => '0');
signal delayed_M_DataRdy : std_logic := '0';
signal delayed_sel_LOAD : std_logic := '0';
signal delayed_sel_STORE : std_logic := '0';
signal delayed_in1 : std_logic_vector(BITSIZE_in1-1 downto 0) := (others => '0');
signal delayed_in2 : std_logic_vector(BITSIZE_in2-1 downto 0) := (others => '0');
signal delayed_in3 : std_logic_vector(BITSIZE_in3-1 downto 0) := (others => '0');


begin


tmp_addr <= delayed_in2;
Mout_addr_ram <= tmp_addr when (delayed_sel_LOAD or delayed_sel_STORE)='1' else Min_addr_ram;
Mout_oe_ram <= '1' when delayed_sel_LOAD='1' else Min_oe_ram;
Mout_we_ram <= '1' when delayed_sel_STORE='1' else Min_we_ram;
out1 <= delayed_out1;
Mout_Wdata_ram <= delayed_in1 when delayed_sel_STORE='1' else Min_Wdata_ram;
Mout_data_ram_size <= delayed_in3(BITSIZE_in3-1 downto 0) when (delayed_sel_STORE or delayed_sel_LOAD)='1' else Min_data_ram_size;
done_port <= delayed_M_DataRdy;


process(clock) is
begin
	if (rising_edge(clock)) then
		delayed_sel_LOAD <= sel_LOAD and (not M_DataRdy) and (not delayed_M_DataRdy);
		delayed_sel_STORE <= sel_STORE and (not M_DataRdy) and (not delayed_M_DataRdy);
		delayed_in1 <= in1;
		delayed_in2 <= in2;
		delayed_in3 <= in3;
		delayed_out1 <= M_Rdata_ram;
		delayed_M_DataRdy <= M_DataRdy and (delayed_sel_STORE or delayed_sel_LOAD);
	end if;
end process;

end Behavioral;
