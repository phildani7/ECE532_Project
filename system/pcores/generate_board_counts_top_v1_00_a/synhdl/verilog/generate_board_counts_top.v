// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2012.2
// Copyright (C) 2012 Xilinx Inc. All rights reserved.
// 
// ==============================================================

`timescale 1 ns / 1 ps
module generate_board_counts_top (
m_axi_master_ACLK,
m_axi_master_ARESETN,
m_axi_master_AWID,
m_axi_master_AWADDR,
m_axi_master_AWLEN,
m_axi_master_AWSIZE,
m_axi_master_AWBURST,
m_axi_master_AWLOCK,
m_axi_master_AWCACHE,
m_axi_master_AWPROT,
m_axi_master_AWQOS,
m_axi_master_AWUSER,
m_axi_master_AWVALID,
m_axi_master_AWREADY,
m_axi_master_WDATA,
m_axi_master_WSTRB,
m_axi_master_WLAST,
m_axi_master_WUSER,
m_axi_master_WVALID,
m_axi_master_WREADY,
m_axi_master_BID,
m_axi_master_BRESP,
m_axi_master_BUSER,
m_axi_master_BVALID,
m_axi_master_BREADY,
m_axi_master_ARID,
m_axi_master_ARADDR,
m_axi_master_ARLEN,
m_axi_master_ARSIZE,
m_axi_master_ARBURST,
m_axi_master_ARLOCK,
m_axi_master_ARCACHE,
m_axi_master_ARPROT,
m_axi_master_ARQOS,
m_axi_master_ARUSER,
m_axi_master_ARVALID,
m_axi_master_ARREADY,
m_axi_master_RID,
m_axi_master_RDATA,
m_axi_master_RRESP,
m_axi_master_RLAST,
m_axi_master_RUSER,
m_axi_master_RVALID,
m_axi_master_RREADY,
s_axi_ctrl_ACLK,
s_axi_ctrl_ARESETN,
s_axi_ctrl_AWADDR,
s_axi_ctrl_AWVALID,
s_axi_ctrl_AWREADY,
s_axi_ctrl_WDATA,
s_axi_ctrl_WSTRB,
s_axi_ctrl_WVALID,
s_axi_ctrl_WREADY,
s_axi_ctrl_BRESP,
s_axi_ctrl_BVALID,
s_axi_ctrl_BREADY,
s_axi_ctrl_ARADDR,
s_axi_ctrl_ARVALID,
s_axi_ctrl_ARREADY,
s_axi_ctrl_RDATA,
s_axi_ctrl_RRESP,
s_axi_ctrl_RVALID,
s_axi_ctrl_RREADY,
interrupt,
SYS_RESET,
SYS_CLK
);

parameter C_M_AXI_MASTER_THREAD_ID_WIDTH = 1;
parameter C_M_AXI_MASTER_ADDR_WIDTH = 32;
parameter C_M_AXI_MASTER_DATA_WIDTH = 32;
parameter C_M_AXI_MASTER_AWUSER_WIDTH = 1;
parameter C_M_AXI_MASTER_ARUSER_WIDTH = 1;
parameter C_M_AXI_MASTER_WUSER_WIDTH = 1;
parameter C_M_AXI_MASTER_RUSER_WIDTH = 1;
parameter C_M_AXI_MASTER_BUSER_WIDTH = 1;
parameter C_M_AXI_MASTER_USER_DATA_WIDTH = 32;
parameter C_M_AXI_MASTER_TARGET_ADDR = 32'h00000000;
parameter C_M_AXI_MASTER_USER_VALUE = 1'b0;
parameter C_M_AXI_MASTER_PROT_VALUE = 3'b010;
parameter C_M_AXI_MASTER_CACHE_VALUE = 4'b0000;
parameter C_S_AXI_CTRL_ADDR_WIDTH = 32;
parameter C_S_AXI_CTRL_DATA_WIDTH = 32;
parameter RESET_ACTIVE_LOW = 1;
input m_axi_master_ACLK ;
input m_axi_master_ARESETN ;
output [C_M_AXI_MASTER_THREAD_ID_WIDTH - 1:0] m_axi_master_AWID ;
output [C_M_AXI_MASTER_ADDR_WIDTH - 1:0] m_axi_master_AWADDR ;
output [8 - 1:0] m_axi_master_AWLEN ;
output [3 - 1:0] m_axi_master_AWSIZE ;
output [2 - 1:0] m_axi_master_AWBURST ;
output [2 - 1:0] m_axi_master_AWLOCK ;
output [4 - 1:0] m_axi_master_AWCACHE ;
output [3 - 1:0] m_axi_master_AWPROT ;
output [4 - 1:0] m_axi_master_AWQOS ;
output [C_M_AXI_MASTER_AWUSER_WIDTH - 1:0] m_axi_master_AWUSER ;
output m_axi_master_AWVALID ;
input m_axi_master_AWREADY ;
output [C_M_AXI_MASTER_DATA_WIDTH - 1:0] m_axi_master_WDATA ;
output [C_M_AXI_MASTER_DATA_WIDTH/8 - 1:0] m_axi_master_WSTRB ;
output m_axi_master_WLAST ;
output [C_M_AXI_MASTER_WUSER_WIDTH - 1:0] m_axi_master_WUSER ;
output m_axi_master_WVALID ;
input m_axi_master_WREADY ;
input [C_M_AXI_MASTER_THREAD_ID_WIDTH - 1:0] m_axi_master_BID ;
input [2 - 1:0] m_axi_master_BRESP ;
input [C_M_AXI_MASTER_BUSER_WIDTH - 1:0] m_axi_master_BUSER ;
input m_axi_master_BVALID ;
output m_axi_master_BREADY ;
output [C_M_AXI_MASTER_THREAD_ID_WIDTH - 1:0] m_axi_master_ARID ;
output [C_M_AXI_MASTER_ADDR_WIDTH - 1:0] m_axi_master_ARADDR ;
output [8 - 1:0] m_axi_master_ARLEN ;
output [3 - 1:0] m_axi_master_ARSIZE ;
output [2 - 1:0] m_axi_master_ARBURST ;
output [2 - 1:0] m_axi_master_ARLOCK ;
output [4 - 1:0] m_axi_master_ARCACHE ;
output [3 - 1:0] m_axi_master_ARPROT ;
output [4 - 1:0] m_axi_master_ARQOS ;
output [C_M_AXI_MASTER_ARUSER_WIDTH - 1:0] m_axi_master_ARUSER ;
output m_axi_master_ARVALID ;
input m_axi_master_ARREADY ;
input [C_M_AXI_MASTER_THREAD_ID_WIDTH - 1:0] m_axi_master_RID ;
input [C_M_AXI_MASTER_DATA_WIDTH - 1:0] m_axi_master_RDATA ;
input [2 - 1:0] m_axi_master_RRESP ;
input m_axi_master_RLAST ;
input [C_M_AXI_MASTER_RUSER_WIDTH - 1:0] m_axi_master_RUSER ;
input m_axi_master_RVALID ;
output m_axi_master_RREADY ;

input s_axi_ctrl_ACLK ;
input s_axi_ctrl_ARESETN ;
input [C_S_AXI_CTRL_ADDR_WIDTH - 1:0] s_axi_ctrl_AWADDR ;
input s_axi_ctrl_AWVALID ;
output s_axi_ctrl_AWREADY ;
input [C_S_AXI_CTRL_DATA_WIDTH - 1:0] s_axi_ctrl_WDATA ;
input [C_S_AXI_CTRL_DATA_WIDTH/8 - 1:0] s_axi_ctrl_WSTRB ;
input s_axi_ctrl_WVALID ;
output s_axi_ctrl_WREADY ;
output [2 - 1:0] s_axi_ctrl_BRESP ;
output s_axi_ctrl_BVALID ;
input s_axi_ctrl_BREADY ;
input [C_S_AXI_CTRL_ADDR_WIDTH - 1:0] s_axi_ctrl_ARADDR ;
input s_axi_ctrl_ARVALID ;
output s_axi_ctrl_ARREADY ;
output [C_S_AXI_CTRL_DATA_WIDTH - 1:0] s_axi_ctrl_RDATA ;
output [2 - 1:0] s_axi_ctrl_RRESP ;
output s_axi_ctrl_RVALID ;
input s_axi_ctrl_RREADY ;
output interrupt ;

input SYS_RESET ;

input SYS_CLK ;

wire m_axi_master_ACLK;
wire m_axi_master_ARESETN;
wire [C_M_AXI_MASTER_THREAD_ID_WIDTH - 1:0] m_axi_master_AWID;
wire [C_M_AXI_MASTER_ADDR_WIDTH - 1:0] m_axi_master_AWADDR;
wire [8 - 1:0] m_axi_master_AWLEN;
wire [3 - 1:0] m_axi_master_AWSIZE;
wire [2 - 1:0] m_axi_master_AWBURST;
wire [2 - 1:0] m_axi_master_AWLOCK;
wire [4 - 1:0] m_axi_master_AWCACHE;
wire [3 - 1:0] m_axi_master_AWPROT;
wire [4 - 1:0] m_axi_master_AWQOS;
wire [C_M_AXI_MASTER_AWUSER_WIDTH - 1:0] m_axi_master_AWUSER;
wire m_axi_master_AWVALID;
wire m_axi_master_AWREADY;
wire [C_M_AXI_MASTER_DATA_WIDTH - 1:0] m_axi_master_WDATA;
wire [C_M_AXI_MASTER_DATA_WIDTH/8 - 1:0] m_axi_master_WSTRB;
wire m_axi_master_WLAST;
wire [C_M_AXI_MASTER_WUSER_WIDTH - 1:0] m_axi_master_WUSER;
wire m_axi_master_WVALID;
wire m_axi_master_WREADY;
wire [C_M_AXI_MASTER_THREAD_ID_WIDTH - 1:0] m_axi_master_BID;
wire [2 - 1:0] m_axi_master_BRESP;
wire [C_M_AXI_MASTER_BUSER_WIDTH - 1:0] m_axi_master_BUSER;
wire m_axi_master_BVALID;
wire m_axi_master_BREADY;
wire [C_M_AXI_MASTER_THREAD_ID_WIDTH - 1:0] m_axi_master_ARID;
wire [C_M_AXI_MASTER_ADDR_WIDTH - 1:0] m_axi_master_ARADDR;
wire [8 - 1:0] m_axi_master_ARLEN;
wire [3 - 1:0] m_axi_master_ARSIZE;
wire [2 - 1:0] m_axi_master_ARBURST;
wire [2 - 1:0] m_axi_master_ARLOCK;
wire [4 - 1:0] m_axi_master_ARCACHE;
wire [3 - 1:0] m_axi_master_ARPROT;
wire [4 - 1:0] m_axi_master_ARQOS;
wire [C_M_AXI_MASTER_ARUSER_WIDTH - 1:0] m_axi_master_ARUSER;
wire m_axi_master_ARVALID;
wire m_axi_master_ARREADY;
wire [C_M_AXI_MASTER_THREAD_ID_WIDTH - 1:0] m_axi_master_RID;
wire [C_M_AXI_MASTER_DATA_WIDTH - 1:0] m_axi_master_RDATA;
wire [2 - 1:0] m_axi_master_RRESP;
wire m_axi_master_RLAST;
wire [C_M_AXI_MASTER_RUSER_WIDTH - 1:0] m_axi_master_RUSER;
wire m_axi_master_RVALID;
wire m_axi_master_RREADY;

wire s_axi_ctrl_ACLK;
wire s_axi_ctrl_ARESETN;
wire [C_S_AXI_CTRL_ADDR_WIDTH - 1:0] s_axi_ctrl_AWADDR;
wire s_axi_ctrl_AWVALID;
wire s_axi_ctrl_AWREADY;
wire [C_S_AXI_CTRL_DATA_WIDTH - 1:0] s_axi_ctrl_WDATA;
wire [C_S_AXI_CTRL_DATA_WIDTH/8 - 1:0] s_axi_ctrl_WSTRB;
wire s_axi_ctrl_WVALID;
wire s_axi_ctrl_WREADY;
wire [2 - 1:0] s_axi_ctrl_BRESP;
wire s_axi_ctrl_BVALID;
wire s_axi_ctrl_BREADY;
wire [C_S_AXI_CTRL_ADDR_WIDTH - 1:0] s_axi_ctrl_ARADDR;
wire s_axi_ctrl_ARVALID;
wire s_axi_ctrl_ARREADY;
wire [C_S_AXI_CTRL_DATA_WIDTH - 1:0] s_axi_ctrl_RDATA;
wire [2 - 1:0] s_axi_ctrl_RRESP;
wire s_axi_ctrl_RVALID;
wire s_axi_ctrl_RREADY;
wire interrupt;

wire SYS_RESET;


wire [32 - 1:0] sig_generate_board_counts_master_datain;
wire [32 - 1:0] sig_generate_board_counts_master_dataout;
wire [32 - 1:0] sig_generate_board_counts_master_address;
wire [32 - 1:0] sig_generate_board_counts_master_size;
wire sig_generate_board_counts_master_req_din;
wire sig_generate_board_counts_master_req_full_n;
wire sig_generate_board_counts_master_req_write;
wire sig_generate_board_counts_master_rsp_empty_n;
wire sig_generate_board_counts_master_rsp_read;

wire [32 - 1:0] sig_generate_board_counts_board_addr;
wire [32 - 1:0] sig_generate_board_counts_result_addr;
wire sig_generate_board_counts_ap_start;
wire sig_generate_board_counts_ap_done;
wire sig_generate_board_counts_ap_idle;

wire sig_generate_board_counts_ap_rst;




generate_board_counts generate_board_counts_U(
    .master_datain(sig_generate_board_counts_master_datain),
    .master_dataout(sig_generate_board_counts_master_dataout),
    .master_address(sig_generate_board_counts_master_address),
    .master_size(sig_generate_board_counts_master_size),
    .master_req_din(sig_generate_board_counts_master_req_din),
    .master_req_full_n(sig_generate_board_counts_master_req_full_n),
    .master_req_write(sig_generate_board_counts_master_req_write),
    .master_rsp_empty_n(sig_generate_board_counts_master_rsp_empty_n),
    .master_rsp_read(sig_generate_board_counts_master_rsp_read),
    .board_addr(sig_generate_board_counts_board_addr),
    .result_addr(sig_generate_board_counts_result_addr),
    .ap_start(sig_generate_board_counts_ap_start),
    .ap_done(sig_generate_board_counts_ap_done),
    .ap_idle(sig_generate_board_counts_ap_idle),
    .ap_rst(sig_generate_board_counts_ap_rst),
    .ap_clk(SYS_CLK)
);

master_if #(
    .C_THREAD_ID_WIDTH(C_M_AXI_MASTER_THREAD_ID_WIDTH),
    .C_ADDR_WIDTH(C_M_AXI_MASTER_ADDR_WIDTH),
    .C_DATA_WIDTH(C_M_AXI_MASTER_DATA_WIDTH),
    .C_AWUSER_WIDTH(C_M_AXI_MASTER_AWUSER_WIDTH),
    .C_ARUSER_WIDTH(C_M_AXI_MASTER_ARUSER_WIDTH),
    .C_WUSER_WIDTH(C_M_AXI_MASTER_WUSER_WIDTH),
    .C_RUSER_WIDTH(C_M_AXI_MASTER_RUSER_WIDTH),
    .C_BUSER_WIDTH(C_M_AXI_MASTER_BUSER_WIDTH),
    .C_USER_DATA_WIDTH(C_M_AXI_MASTER_USER_DATA_WIDTH),
    .C_TARGET_ADDR(C_M_AXI_MASTER_TARGET_ADDR),
    .C_USER_VALUE(C_M_AXI_MASTER_USER_VALUE),
    .C_PROT_VALUE(C_M_AXI_MASTER_PROT_VALUE),
    .C_CACHE_VALUE(C_M_AXI_MASTER_CACHE_VALUE))
master_if_U(
    .USER_datain(sig_generate_board_counts_master_datain),
    .USER_dataout(sig_generate_board_counts_master_dataout),
    .USER_address(sig_generate_board_counts_master_address),
    .USER_size(sig_generate_board_counts_master_size),
    .USER_req_din(sig_generate_board_counts_master_req_din),
    .USER_req_full_n(sig_generate_board_counts_master_req_full_n),
    .USER_req_write(sig_generate_board_counts_master_req_write),
    .USER_rsp_empty_n(sig_generate_board_counts_master_rsp_empty_n),
    .USER_rsp_read(sig_generate_board_counts_master_rsp_read),
    .ACLK(m_axi_master_ACLK),
    .ARESETN(m_axi_master_ARESETN),
    .AWID(m_axi_master_AWID),
    .AWADDR(m_axi_master_AWADDR),
    .AWLEN(m_axi_master_AWLEN),
    .AWSIZE(m_axi_master_AWSIZE),
    .AWBURST(m_axi_master_AWBURST),
    .AWLOCK(m_axi_master_AWLOCK),
    .AWCACHE(m_axi_master_AWCACHE),
    .AWPROT(m_axi_master_AWPROT),
    .AWQOS(m_axi_master_AWQOS),
    .AWUSER(m_axi_master_AWUSER),
    .AWVALID(m_axi_master_AWVALID),
    .AWREADY(m_axi_master_AWREADY),
    .WDATA(m_axi_master_WDATA),
    .WSTRB(m_axi_master_WSTRB),
    .WLAST(m_axi_master_WLAST),
    .WUSER(m_axi_master_WUSER),
    .WVALID(m_axi_master_WVALID),
    .WREADY(m_axi_master_WREADY),
    .BID(m_axi_master_BID),
    .BRESP(m_axi_master_BRESP),
    .BUSER(m_axi_master_BUSER),
    .BVALID(m_axi_master_BVALID),
    .BREADY(m_axi_master_BREADY),
    .ARID(m_axi_master_ARID),
    .ARADDR(m_axi_master_ARADDR),
    .ARLEN(m_axi_master_ARLEN),
    .ARSIZE(m_axi_master_ARSIZE),
    .ARBURST(m_axi_master_ARBURST),
    .ARLOCK(m_axi_master_ARLOCK),
    .ARCACHE(m_axi_master_ARCACHE),
    .ARPROT(m_axi_master_ARPROT),
    .ARQOS(m_axi_master_ARQOS),
    .ARUSER(m_axi_master_ARUSER),
    .ARVALID(m_axi_master_ARVALID),
    .ARREADY(m_axi_master_ARREADY),
    .RID(m_axi_master_RID),
    .RDATA(m_axi_master_RDATA),
    .RRESP(m_axi_master_RRESP),
    .RLAST(m_axi_master_RLAST),
    .RUSER(m_axi_master_RUSER),
    .RVALID(m_axi_master_RVALID),
    .RREADY(m_axi_master_RREADY));

ctrl_if #(
    .C_ADDR_WIDTH(C_S_AXI_CTRL_ADDR_WIDTH),
    .C_DATA_WIDTH(C_S_AXI_CTRL_DATA_WIDTH))
ctrl_if_U(
    .I_board_addr(sig_generate_board_counts_board_addr),
    .I_result_addr(sig_generate_board_counts_result_addr),
    .I_ap_start(sig_generate_board_counts_ap_start),
    .O_ap_done(sig_generate_board_counts_ap_done),
    .O_ap_idle(sig_generate_board_counts_ap_idle),
    .ACLK(s_axi_ctrl_ACLK),
    .ARESETN(s_axi_ctrl_ARESETN),
    .AWADDR(s_axi_ctrl_AWADDR),
    .AWVALID(s_axi_ctrl_AWVALID),
    .AWREADY(s_axi_ctrl_AWREADY),
    .WDATA(s_axi_ctrl_WDATA),
    .WSTRB(s_axi_ctrl_WSTRB),
    .WVALID(s_axi_ctrl_WVALID),
    .WREADY(s_axi_ctrl_WREADY),
    .BRESP(s_axi_ctrl_BRESP),
    .BVALID(s_axi_ctrl_BVALID),
    .BREADY(s_axi_ctrl_BREADY),
    .ARADDR(s_axi_ctrl_ARADDR),
    .ARVALID(s_axi_ctrl_ARVALID),
    .ARREADY(s_axi_ctrl_ARREADY),
    .RDATA(s_axi_ctrl_RDATA),
    .RRESP(s_axi_ctrl_RRESP),
    .RVALID(s_axi_ctrl_RVALID),
    .RREADY(s_axi_ctrl_RREADY),
    .interrupt(interrupt));

generate_board_counts_ap_rst_if #(
    .RESET_ACTIVE_LOW(RESET_ACTIVE_LOW))
ap_rst_if_U(
    .dout(sig_generate_board_counts_ap_rst),
    .din(SYS_RESET));

endmodule