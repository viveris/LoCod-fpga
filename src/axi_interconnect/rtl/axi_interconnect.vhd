library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use work.locod_pkg.all;


entity axi_interconnect is
generic(
    NB_MASTERS          : integer          
);
port(
	-- Clock and reset
    clk 				: in std_logic;
    rst 				: in std_logic;
	
	-- AXI Slave in array
    S_AXI_in_array 	    : in AXI4Lite_m_to_s_array(0 to NB_MASTERS-1);
    S_AXI_out_array 	: out AXI4Lite_s_to_m_array(0 to NB_MASTERS-1);
    
    -- AXI Master out
    M_AXI_out 			: out AXI4Lite_m_to_s;
    M_AXI_in			: in AXI4Lite_s_to_m
);
end axi_interconnect;

architecture Behavioral of axi_interconnect is


signal S_AXI_AWADDR : std_logic_vector((NB_MASTERS*AXI_ADDR_WIDTH)-1 downto 0);
signal S_AXI_AWPROT	: std_logic_vector((NB_MASTERS*3)-1 downto 0);  
signal S_AXI_AWVALID : std_logic_vector(NB_MASTERS-1 downto 0); 
signal S_AXI_AWREADY : std_logic_vector(NB_MASTERS-1 downto 0); 
signal S_AXI_WDATA : std_logic_vector((NB_MASTERS*AXI_DATA_WIDTH)-1 downto 0);   
signal S_AXI_WSTRB : std_logic_vector((NB_MASTERS*AXI_DATA_WIDTH/8)-1 downto 0);   
signal S_AXI_WVALID : std_logic_vector(NB_MASTERS-1 downto 0);  
signal S_AXI_WREADY : std_logic_vector(NB_MASTERS-1 downto 0);  
signal S_AXI_BRESP : std_logic_vector((NB_MASTERS*2)-1 downto 0);   
signal S_AXI_BVALID : std_logic_vector(NB_MASTERS-1 downto 0);  
signal S_AXI_BREADY : std_logic_vector(NB_MASTERS-1 downto 0);  
signal S_AXI_ARADDR : std_logic_vector((NB_MASTERS*AXI_ADDR_WIDTH)-1 downto 0);  
signal S_AXI_ARPROT : std_logic_vector((NB_MASTERS*3)-1 downto 0);  
signal S_AXI_ARVALID : std_logic_vector(NB_MASTERS-1 downto 0);
signal S_AXI_ARREADY : std_logic_vector(NB_MASTERS-1 downto 0);
signal S_AXI_RDATA : std_logic_vector((NB_MASTERS*AXI_DATA_WIDTH)-1 downto 0);   
signal S_AXI_RRESP : std_logic_vector((NB_MASTERS*2)-1 downto 0);   
signal S_AXI_RVALID : std_logic_vector(NB_MASTERS-1 downto 0);  
signal S_AXI_RREADY : std_logic_vector(NB_MASTERS-1 downto 0); 

signal M_AXI_AWADDR : std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
signal M_AXI_AWPROT : std_logic_vector(3-1 downto 0);  
signal M_AXI_AWVALID : std_logic; 
signal M_AXI_AWREADY : std_logic; 
signal M_AXI_WDATA : std_logic_vector(AXI_DATA_WIDTH-1 downto 0);   
signal M_AXI_WSTRB : std_logic_vector((AXI_DATA_WIDTH/8)-1 downto 0);   
signal M_AXI_WVALID : std_logic;  
signal M_AXI_WREADY : std_logic;  
signal M_AXI_BRESP : std_logic_vector(2-1 downto 0);   
signal M_AXI_BVALID : std_logic;  
signal M_AXI_BREADY : std_logic;  
signal M_AXI_ARADDR : std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);  
signal M_AXI_ARPROT : std_logic_vector(3-1 downto 0);  
signal M_AXI_ARVALID : std_logic; 
signal M_AXI_ARREADY : std_logic; 
signal M_AXI_RDATA : std_logic_vector(AXI_DATA_WIDTH-1 downto 0);   
signal M_AXI_RRESP : std_logic_vector(2-1 downto 0);   
signal M_AXI_RVALID : std_logic;  
signal M_AXI_RREADY : std_logic;   


begin

M_AXI_out.awaddr <= M_AXI_AWADDR;
M_AXI_out.awprot <= M_AXI_AWPROT;
M_AXI_out.awvalid <= M_AXI_AWVALID;
M_AXI_AWREADY <= M_AXI_in.awready;
M_AXI_out.wdata <= M_AXI_WDATA;
M_AXI_out.wstrb <= M_AXI_WSTRB;
M_AXI_out.wvalid <= M_AXI_WVALID;
M_AXI_WREADY <= M_AXI_in.wready;
M_AXI_BRESP <= M_AXI_in.bresp;
M_AXI_BVALID <= M_AXI_in.bvalid;
M_AXI_out.bready <= M_AXI_BREADY;
M_AXI_out.araddr <= M_AXI_ARADDR;
M_AXI_out.arprot <= M_AXI_ARPROT;
M_AXI_out.arvalid <= M_AXI_ARVALID;
M_AXI_ARREADY <= M_AXI_in.arready;
M_AXI_RDATA <= M_AXI_in.rdata;
M_AXI_RRESP <= M_AXI_in.rresp;
M_AXI_RVALID <= M_AXI_in.rvalid;
M_AXI_out.rready <= M_AXI_RREADY;

process(clk)
begin
	if rising_edge(clk) then
		for i in 0 to NB_MASTERS-1 loop
            S_AXI_AWADDR(((i+1)*AXI_ADDR_WIDTH)-1 downto i*AXI_ADDR_WIDTH) <= S_AXI_in_array(i).awaddr;
			S_AXI_AWPROT(((i+1)*3)-1 downto i*3) <= S_AXI_in_array(i).awprot;
			S_AXI_AWVALID(i) <= S_AXI_in_array(i).awvalid;
			S_AXI_out_array(i).awready <= S_AXI_AWREADY(i);
			S_AXI_WDATA(((i+1)*AXI_DATA_WIDTH)-1 downto i*AXI_DATA_WIDTH) <= S_AXI_in_array(i).wdata;
			S_AXI_WSTRB(((i+1)*AXI_DATA_WIDTH/8)-1 downto i*AXI_DATA_WIDTH/8) <= S_AXI_in_array(i).wstrb;
			S_AXI_WVALID(i) <= S_AXI_in_array(i).wvalid;
			S_AXI_out_array(i).wready <= S_AXI_WREADY(i);
			S_AXI_out_array(i).bresp <= S_AXI_BRESP(((i+1)*2)-1 downto i*2);
			S_AXI_out_array(i).bvalid <= S_AXI_BVALID(i);
			S_AXI_BREADY(i) <= S_AXI_in_array(i).bready;
			S_AXI_ARADDR(((i+1)*AXI_ADDR_WIDTH)-1 downto i*AXI_ADDR_WIDTH) <= S_AXI_in_array(i).araddr;
			S_AXI_ARPROT(((i+1)*3)-1 downto i*3) <= S_AXI_in_array(i).arprot;
			S_AXI_ARVALID(i) <= S_AXI_in_array(i).arvalid;
			S_AXI_out_array(i).arready <= S_AXI_ARREADY(i);
			S_AXI_out_array(i).rdata <= S_AXI_RDATA(((i+1)*AXI_DATA_WIDTH)-1 downto i*AXI_DATA_WIDTH);
			S_AXI_out_array(i).rresp <= S_AXI_RRESP(((i+1)*2)-1 downto i*2);
			S_AXI_out_array(i).rvalid <= S_AXI_RVALID(i);
			S_AXI_RREADY(i) <= S_AXI_in_array(i).rready;
        end loop;
	end if;
end process;



axil_bar_inst : entity work.axilxbar
generic map (
    C_AXI_DATA_WIDTH    => 32,
    C_AXI_ADDR_WIDTH    => 32,
    NM                  => NB_MASTERS,
    NS                  => 1,
    OPT_LOWPOWER        => 1,
    OPT_LINGER          => 4,
    LGMAXBURST          => 5    
)
port map (
    S_AXI_ACLK          => clk,
    S_AXI_ARESETN       => rst,
    -- Slaves connections
    S_AXI_AWADDR        => S_AXI_AWADDR,
    S_AXI_AWPROT        => S_AXI_AWPROT,
    S_AXI_AWVALID       => S_AXI_AWVALID,
    S_AXI_AWREADY       => S_AXI_AWREADY,
    S_AXI_WDATA         => S_AXI_WDATA,
    S_AXI_WSTRB         => S_AXI_WSTRB,
    S_AXI_WVALID        => S_AXI_WVALID,
    S_AXI_WREADY        => S_AXI_WREADY,
    S_AXI_BRESP         => S_AXI_BRESP,
    S_AXI_BVALID        => S_AXI_BVALID,
    S_AXI_BREADY        => S_AXI_BREADY,
    S_AXI_ARADDR        => S_AXI_ARADDR,
    S_AXI_ARPROT        => S_AXI_ARPROT,
    S_AXI_ARVALID       => S_AXI_ARVALID,
    S_AXI_ARREADY       => S_AXI_ARREADY,
    S_AXI_RDATA         => S_AXI_RDATA,
    S_AXI_RRESP         => S_AXI_RRESP,
    S_AXI_RVALID        => S_AXI_RVALID,
    S_AXI_RREADY        => S_AXI_RREADY,
    
    -- Masters connections
    M_AXI_AWADDR		=> M_AXI_AWADDR,
    M_AXI_AWPROT		=> M_AXI_AWPROT,
	M_AXI_AWVALID		=> M_AXI_AWVALID,
	M_AXI_AWREADY		=> M_AXI_AWREADY,
	M_AXI_WDATA			=> M_AXI_WDATA,
	M_AXI_WSTRB			=> M_AXI_WSTRB,
	M_AXI_WVALID		=> M_AXI_WVALID,
	M_AXI_WREADY		=> M_AXI_WREADY,
	M_AXI_BRESP			=> M_AXI_BRESP,
	M_AXI_BVALID		=> M_AXI_BVALID,
	M_AXI_BREADY		=> M_AXI_BREADY,
	M_AXI_ARADDR		=> M_AXI_ARADDR,
	M_AXI_ARPROT		=> M_AXI_ARPROT,
	M_AXI_ARVALID		=> M_AXI_ARVALID,
	M_AXI_ARREADY		=> M_AXI_ARREADY,
	M_AXI_RDATA			=> M_AXI_RDATA,
	M_AXI_RRESP			=> M_AXI_RRESP,
	M_AXI_RVALID		=> M_AXI_RVALID,
	M_AXI_RREADY		=> M_AXI_RREADY
);

end Behavioral;
