`timescale 1ns / 1ps

module axi_interconnect_ip #(
	parameter AXI_DATA_WIDTH = 32,
	parameter AXI_ADDR_WIDTH = 32
)
(
	// Clock and reset
	input			clk,
	input			rst,
	input			rst_n,

	// AXI Slave in 0
	input [AXI_ADDR_WIDTH-1:0]		S00_AXI_awaddr,  
	input [2:0]						S00_AXI_awprot,  
	input							S00_AXI_awvalid, 
	output							S00_AXI_awready, 
	input [AXI_DATA_WIDTH-1:0]		S00_AXI_wdata, 	
	input [AXI_DATA_WIDTH/8-1:0]	S00_AXI_wstrb, 	
	input							S00_AXI_wvalid,  
	output							S00_AXI_wready,  
	output [1:0]					S00_AXI_bresp, 	
	output							S00_AXI_bvalid,  
	input							S00_AXI_bready,  
	input [AXI_ADDR_WIDTH-1:0]		S00_AXI_araddr,  
	input [2:0]						S00_AXI_arprot,  
	input							S00_AXI_arvalid, 
	output							S00_AXI_arready, 
	output [AXI_DATA_WIDTH-1:0]		S00_AXI_rdata, 	
	output [1:0]					S00_AXI_rresp, 	
	output							S00_AXI_rvalid,  
	input							S00_AXI_rready,

	// AXI Slave in 1
	input [AXI_ADDR_WIDTH-1:0]		S01_AXI_awaddr,  
	input [2:0]						S01_AXI_awprot,  
	input							S01_AXI_awvalid, 
	output							S01_AXI_awready, 
	input [AXI_DATA_WIDTH-1:0]		S01_AXI_wdata, 	
	input [AXI_DATA_WIDTH/8-1:0]	S01_AXI_wstrb, 	
	input							S01_AXI_wvalid,  
	output							S01_AXI_wready,  
	output [1:0]					S01_AXI_bresp, 	
	output							S01_AXI_bvalid,  
	input							S01_AXI_bready,  
	input [AXI_ADDR_WIDTH-1:0]		S01_AXI_araddr,  
	input [2:0]						S01_AXI_arprot,  
	input							S01_AXI_arvalid, 
	output							S01_AXI_arready, 
	output [AXI_DATA_WIDTH-1:0]		S01_AXI_rdata, 	
	output [1:0]					S01_AXI_rresp, 	
	output							S01_AXI_rvalid,  
	input							S01_AXI_rready,  

	// AXI Master out
	output [AXI_ADDR_WIDTH-1:0]		M_AXI_awaddr,  
	output [2:0]					M_AXI_awprot,  
	output							M_AXI_awvalid, 
	input							M_AXI_awready, 
	output [AXI_DATA_WIDTH-1:0]		M_AXI_wdata, 	
	output [AXI_DATA_WIDTH/8-1:0]	M_AXI_wstrb, 	
	output							M_AXI_wvalid,  
	input							M_AXI_wready,  
	input [1:0]						M_AXI_bresp, 	
	input							M_AXI_bvalid,  
	output							M_AXI_bready,  
	output [AXI_ADDR_WIDTH-1:0]		M_AXI_araddr,  
	output [2:0]					M_AXI_arprot,  
	output							M_AXI_arvalid, 
	input							M_AXI_arready, 
	input [AXI_DATA_WIDTH-1:0]		M_AXI_rdata, 	
	input [1:0]						M_AXI_rresp, 	
	input							M_AXI_rvalid,  
	output							M_AXI_rready
);


axil_interconnect #( 
	.S_COUNT(2), 
	.M_COUNT(1), 
	.DATA_WIDTH(AXI_DATA_WIDTH), 
	.ADDR_WIDTH(AXI_ADDR_WIDTH),
	.M_BASE_ADDR(32'd0),
	.M_ADDR_WIDTH(32'd32)
)
axil_interconnect_inst (
	.clk				(clk),
	.rst				(rst),

	.s_axil_awaddr		({S01_AXI_awaddr,S00_AXI_awaddr}),
	.s_axil_awprot		({S01_AXI_awprot,S00_AXI_awprot}),
	.s_axil_awvalid		({S01_AXI_awvalid,S00_AXI_awvalid}),
	.s_axil_awready		({S01_AXI_awready,S00_AXI_awready}),
	.s_axil_wdata		({S01_AXI_wdata,S00_AXI_wdata}),
	.s_axil_wstrb		({S01_AXI_wstrb,S00_AXI_wstrb}),
	.s_axil_wvalid		({S01_AXI_wvalid,S00_AXI_wvalid}),
	.s_axil_wready		({S01_AXI_wready,S00_AXI_wready}),
	.s_axil_bresp		({S01_AXI_bresp,S00_AXI_bresp}),
	.s_axil_bvalid		({S01_AXI_bvalid,S00_AXI_bvalid}),
	.s_axil_bready		({S01_AXI_bready,S00_AXI_bready}),
	.s_axil_araddr		({S01_AXI_araddr,S00_AXI_araddr}),
	.s_axil_arprot		({S01_AXI_arprot,S00_AXI_arprot}),
	.s_axil_arvalid		({S01_AXI_arvalid,S00_AXI_arvalid}),
	.s_axil_arready		({S01_AXI_arready,S00_AXI_arready}),
	.s_axil_rdata		({S01_AXI_rdata,S00_AXI_rdata}),
	.s_axil_rresp		({S01_AXI_rresp,S00_AXI_rresp}),
	.s_axil_rvalid		({S01_AXI_rvalid,S00_AXI_rvalid}),
	.s_axil_rready		({S01_AXI_rready,S00_AXI_rready}),

	.m_axil_awaddr		(M_AXI_awaddr),
	.m_axil_awprot		(M_AXI_awprot),
	.m_axil_awvalid		(M_AXI_awvalid),
	.m_axil_awready		(M_AXI_awready),
	.m_axil_wdata		(M_AXI_wdata),
	.m_axil_wstrb		(M_AXI_wstrb),
	.m_axil_wvalid		(M_AXI_wvalid),
	.m_axil_wready		(M_AXI_wready),
	.m_axil_bresp		(M_AXI_bresp),
	.m_axil_bvalid		(M_AXI_bvalid),
	.m_axil_bready		(M_AXI_bready),
	.m_axil_araddr		(M_AXI_araddr),
	.m_axil_arprot		(M_AXI_arprot),
	.m_axil_arvalid		(M_AXI_arvalid),
	.m_axil_arready		(M_AXI_arready),
	.m_axil_rdata		(M_AXI_rdata),
	.m_axil_rresp		(M_AXI_rresp),
	.m_axil_rvalid		(M_AXI_rvalid),
	.m_axil_rready		(M_AXI_rready)
);


endmodule