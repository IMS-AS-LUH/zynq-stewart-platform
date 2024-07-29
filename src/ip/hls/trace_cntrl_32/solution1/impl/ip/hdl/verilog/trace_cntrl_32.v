// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="trace_cntrl_32_trace_cntrl_32,hls_ip_2022_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020-clg484-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=5.924000,HLS_SYN_LAT=-1,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=358,HLS_SYN_LUT=568,HLS_VERSION=2022_1}" *)

module trace_cntrl_32 (
        ap_clk,
        ap_rst_n,
        trace_32_TDATA,
        trace_32_TVALID,
        trace_32_TREADY,
        trace_32_TKEEP,
        trace_32_TSTRB,
        trace_32_TUSER,
        trace_32_TLAST,
        trace_32_TID,
        trace_32_TDEST,
        capture_32_TDATA,
        capture_32_TVALID,
        capture_32_TREADY,
        capture_32_TKEEP,
        capture_32_TSTRB,
        capture_32_TUSER,
        capture_32_TLAST,
        capture_32_TID,
        capture_32_TDEST,
        s_axi_trace_cntrl_AWVALID,
        s_axi_trace_cntrl_AWREADY,
        s_axi_trace_cntrl_AWADDR,
        s_axi_trace_cntrl_WVALID,
        s_axi_trace_cntrl_WREADY,
        s_axi_trace_cntrl_WDATA,
        s_axi_trace_cntrl_WSTRB,
        s_axi_trace_cntrl_ARVALID,
        s_axi_trace_cntrl_ARREADY,
        s_axi_trace_cntrl_ARADDR,
        s_axi_trace_cntrl_RVALID,
        s_axi_trace_cntrl_RREADY,
        s_axi_trace_cntrl_RDATA,
        s_axi_trace_cntrl_RRESP,
        s_axi_trace_cntrl_BVALID,
        s_axi_trace_cntrl_BREADY,
        s_axi_trace_cntrl_BRESP,
        interrupt
);

parameter    ap_ST_fsm_state1 = 4'd1;
parameter    ap_ST_fsm_state2 = 4'd2;
parameter    ap_ST_fsm_state3 = 4'd4;
parameter    ap_ST_fsm_state4 = 4'd8;
parameter    C_S_AXI_TRACE_CNTRL_DATA_WIDTH = 32;
parameter    C_S_AXI_TRACE_CNTRL_ADDR_WIDTH = 5;
parameter    C_S_AXI_DATA_WIDTH = 32;

parameter C_S_AXI_TRACE_CNTRL_WSTRB_WIDTH = (32 / 8);
parameter C_S_AXI_WSTRB_WIDTH = (32 / 8);

input   ap_clk;
input   ap_rst_n;
input  [31:0] trace_32_TDATA;
input   trace_32_TVALID;
output   trace_32_TREADY;
input  [3:0] trace_32_TKEEP;
input  [3:0] trace_32_TSTRB;
input  [0:0] trace_32_TUSER;
input  [0:0] trace_32_TLAST;
input  [0:0] trace_32_TID;
input  [0:0] trace_32_TDEST;
output  [31:0] capture_32_TDATA;
output   capture_32_TVALID;
input   capture_32_TREADY;
output  [3:0] capture_32_TKEEP;
output  [3:0] capture_32_TSTRB;
output  [0:0] capture_32_TUSER;
output  [0:0] capture_32_TLAST;
output  [0:0] capture_32_TID;
output  [0:0] capture_32_TDEST;
input   s_axi_trace_cntrl_AWVALID;
output   s_axi_trace_cntrl_AWREADY;
input  [C_S_AXI_TRACE_CNTRL_ADDR_WIDTH - 1:0] s_axi_trace_cntrl_AWADDR;
input   s_axi_trace_cntrl_WVALID;
output   s_axi_trace_cntrl_WREADY;
input  [C_S_AXI_TRACE_CNTRL_DATA_WIDTH - 1:0] s_axi_trace_cntrl_WDATA;
input  [C_S_AXI_TRACE_CNTRL_WSTRB_WIDTH - 1:0] s_axi_trace_cntrl_WSTRB;
input   s_axi_trace_cntrl_ARVALID;
output   s_axi_trace_cntrl_ARREADY;
input  [C_S_AXI_TRACE_CNTRL_ADDR_WIDTH - 1:0] s_axi_trace_cntrl_ARADDR;
output   s_axi_trace_cntrl_RVALID;
input   s_axi_trace_cntrl_RREADY;
output  [C_S_AXI_TRACE_CNTRL_DATA_WIDTH - 1:0] s_axi_trace_cntrl_RDATA;
output  [1:0] s_axi_trace_cntrl_RRESP;
output   s_axi_trace_cntrl_BVALID;
input   s_axi_trace_cntrl_BREADY;
output  [1:0] s_axi_trace_cntrl_BRESP;
output   interrupt;

 reg    ap_rst_n_inv;
wire    ap_start;
reg    ap_done;
reg    ap_idle;
(* fsm_encoding = "none" *) reg   [3:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    ap_ready;
wire   [31:0] trigger;
wire   [31:0] length_r;
reg   [31:0] length_r_read_reg_123;
reg   [31:0] trigger_read_reg_128;
wire   [31:0] sub_fu_117_p2;
reg   [31:0] sub_reg_133;
wire    grp_trace_cntrl_32_Pipeline_VITIS_LOOP_28_1_fu_82_ap_start;
wire    grp_trace_cntrl_32_Pipeline_VITIS_LOOP_28_1_fu_82_ap_done;
wire    grp_trace_cntrl_32_Pipeline_VITIS_LOOP_28_1_fu_82_ap_idle;
wire    grp_trace_cntrl_32_Pipeline_VITIS_LOOP_28_1_fu_82_ap_ready;
wire    grp_trace_cntrl_32_Pipeline_VITIS_LOOP_28_1_fu_82_capture_32_TREADY;
wire   [31:0] grp_trace_cntrl_32_Pipeline_VITIS_LOOP_28_1_fu_82_capture_32_TDATA;
wire    grp_trace_cntrl_32_Pipeline_VITIS_LOOP_28_1_fu_82_capture_32_TVALID;
wire   [3:0] grp_trace_cntrl_32_Pipeline_VITIS_LOOP_28_1_fu_82_capture_32_TKEEP;
wire   [3:0] grp_trace_cntrl_32_Pipeline_VITIS_LOOP_28_1_fu_82_capture_32_TSTRB;
wire   [0:0] grp_trace_cntrl_32_Pipeline_VITIS_LOOP_28_1_fu_82_capture_32_TUSER;
wire   [0:0] grp_trace_cntrl_32_Pipeline_VITIS_LOOP_28_1_fu_82_capture_32_TLAST;
wire   [0:0] grp_trace_cntrl_32_Pipeline_VITIS_LOOP_28_1_fu_82_capture_32_TID;
wire   [0:0] grp_trace_cntrl_32_Pipeline_VITIS_LOOP_28_1_fu_82_capture_32_TDEST;
wire    grp_trace_cntrl_32_Pipeline_VITIS_LOOP_28_1_fu_82_trace_32_TREADY;
reg    grp_trace_cntrl_32_Pipeline_VITIS_LOOP_28_1_fu_82_ap_start_reg;
wire    ap_CS_fsm_state2;
wire    ap_CS_fsm_state3;
wire    ap_CS_fsm_state4;
wire    regslice_both_capture_32_V_data_V_U_apdone_blk;
reg   [3:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
reg    ap_ST_fsm_state3_blk;
reg    ap_ST_fsm_state4_blk;
wire    regslice_both_trace_32_V_data_V_U_apdone_blk;
wire   [31:0] trace_32_TDATA_int_regslice;
wire    trace_32_TVALID_int_regslice;
reg    trace_32_TREADY_int_regslice;
wire    regslice_both_trace_32_V_data_V_U_ack_in;
wire    regslice_both_trace_32_V_keep_V_U_apdone_blk;
wire   [3:0] trace_32_TKEEP_int_regslice;
wire    regslice_both_trace_32_V_keep_V_U_vld_out;
wire    regslice_both_trace_32_V_keep_V_U_ack_in;
wire    regslice_both_trace_32_V_strb_V_U_apdone_blk;
wire   [3:0] trace_32_TSTRB_int_regslice;
wire    regslice_both_trace_32_V_strb_V_U_vld_out;
wire    regslice_both_trace_32_V_strb_V_U_ack_in;
wire    regslice_both_trace_32_V_user_V_U_apdone_blk;
wire   [0:0] trace_32_TUSER_int_regslice;
wire    regslice_both_trace_32_V_user_V_U_vld_out;
wire    regslice_both_trace_32_V_user_V_U_ack_in;
wire    regslice_both_trace_32_V_last_V_U_apdone_blk;
wire   [0:0] trace_32_TLAST_int_regslice;
wire    regslice_both_trace_32_V_last_V_U_vld_out;
wire    regslice_both_trace_32_V_last_V_U_ack_in;
wire    regslice_both_trace_32_V_id_V_U_apdone_blk;
wire   [0:0] trace_32_TID_int_regslice;
wire    regslice_both_trace_32_V_id_V_U_vld_out;
wire    regslice_both_trace_32_V_id_V_U_ack_in;
wire    regslice_both_trace_32_V_dest_V_U_apdone_blk;
wire   [0:0] trace_32_TDEST_int_regslice;
wire    regslice_both_trace_32_V_dest_V_U_vld_out;
wire    regslice_both_trace_32_V_dest_V_U_ack_in;
wire    capture_32_TVALID_int_regslice;
wire    capture_32_TREADY_int_regslice;
wire    regslice_both_capture_32_V_data_V_U_vld_out;
wire    regslice_both_capture_32_V_keep_V_U_apdone_blk;
wire    regslice_both_capture_32_V_keep_V_U_ack_in_dummy;
wire    regslice_both_capture_32_V_keep_V_U_vld_out;
wire    regslice_both_capture_32_V_strb_V_U_apdone_blk;
wire    regslice_both_capture_32_V_strb_V_U_ack_in_dummy;
wire    regslice_both_capture_32_V_strb_V_U_vld_out;
wire    regslice_both_capture_32_V_user_V_U_apdone_blk;
wire    regslice_both_capture_32_V_user_V_U_ack_in_dummy;
wire    regslice_both_capture_32_V_user_V_U_vld_out;
wire    regslice_both_capture_32_V_last_V_U_apdone_blk;
wire    regslice_both_capture_32_V_last_V_U_ack_in_dummy;
wire    regslice_both_capture_32_V_last_V_U_vld_out;
wire    regslice_both_capture_32_V_id_V_U_apdone_blk;
wire    regslice_both_capture_32_V_id_V_U_ack_in_dummy;
wire    regslice_both_capture_32_V_id_V_U_vld_out;
wire    regslice_both_capture_32_V_dest_V_U_apdone_blk;
wire    regslice_both_capture_32_V_dest_V_U_ack_in_dummy;
wire    regslice_both_capture_32_V_dest_V_U_vld_out;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 4'd1;
#0 grp_trace_cntrl_32_Pipeline_VITIS_LOOP_28_1_fu_82_ap_start_reg = 1'b0;
end

trace_cntrl_32_trace_cntrl_32_Pipeline_VITIS_LOOP_28_1 grp_trace_cntrl_32_Pipeline_VITIS_LOOP_28_1_fu_82(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(grp_trace_cntrl_32_Pipeline_VITIS_LOOP_28_1_fu_82_ap_start),
    .ap_done(grp_trace_cntrl_32_Pipeline_VITIS_LOOP_28_1_fu_82_ap_done),
    .ap_idle(grp_trace_cntrl_32_Pipeline_VITIS_LOOP_28_1_fu_82_ap_idle),
    .ap_ready(grp_trace_cntrl_32_Pipeline_VITIS_LOOP_28_1_fu_82_ap_ready),
    .trace_32_TVALID(trace_32_TVALID_int_regslice),
    .capture_32_TREADY(grp_trace_cntrl_32_Pipeline_VITIS_LOOP_28_1_fu_82_capture_32_TREADY),
    .length_r(length_r_read_reg_123),
    .sub(sub_reg_133),
    .capture_32_TDATA(grp_trace_cntrl_32_Pipeline_VITIS_LOOP_28_1_fu_82_capture_32_TDATA),
    .capture_32_TVALID(grp_trace_cntrl_32_Pipeline_VITIS_LOOP_28_1_fu_82_capture_32_TVALID),
    .capture_32_TKEEP(grp_trace_cntrl_32_Pipeline_VITIS_LOOP_28_1_fu_82_capture_32_TKEEP),
    .capture_32_TSTRB(grp_trace_cntrl_32_Pipeline_VITIS_LOOP_28_1_fu_82_capture_32_TSTRB),
    .capture_32_TUSER(grp_trace_cntrl_32_Pipeline_VITIS_LOOP_28_1_fu_82_capture_32_TUSER),
    .capture_32_TLAST(grp_trace_cntrl_32_Pipeline_VITIS_LOOP_28_1_fu_82_capture_32_TLAST),
    .capture_32_TID(grp_trace_cntrl_32_Pipeline_VITIS_LOOP_28_1_fu_82_capture_32_TID),
    .capture_32_TDEST(grp_trace_cntrl_32_Pipeline_VITIS_LOOP_28_1_fu_82_capture_32_TDEST),
    .trace_32_TDATA(trace_32_TDATA_int_regslice),
    .trace_32_TREADY(grp_trace_cntrl_32_Pipeline_VITIS_LOOP_28_1_fu_82_trace_32_TREADY),
    .trace_32_TKEEP(trace_32_TKEEP_int_regslice),
    .trace_32_TSTRB(trace_32_TSTRB_int_regslice),
    .trace_32_TUSER(trace_32_TUSER_int_regslice),
    .trace_32_TLAST(trace_32_TLAST_int_regslice),
    .trace_32_TID(trace_32_TID_int_regslice),
    .trace_32_TDEST(trace_32_TDEST_int_regslice),
    .trigger(trigger_read_reg_128)
);

trace_cntrl_32_trace_cntrl_s_axi #(
    .C_S_AXI_ADDR_WIDTH( C_S_AXI_TRACE_CNTRL_ADDR_WIDTH ),
    .C_S_AXI_DATA_WIDTH( C_S_AXI_TRACE_CNTRL_DATA_WIDTH ))
trace_cntrl_s_axi_U(
    .AWVALID(s_axi_trace_cntrl_AWVALID),
    .AWREADY(s_axi_trace_cntrl_AWREADY),
    .AWADDR(s_axi_trace_cntrl_AWADDR),
    .WVALID(s_axi_trace_cntrl_WVALID),
    .WREADY(s_axi_trace_cntrl_WREADY),
    .WDATA(s_axi_trace_cntrl_WDATA),
    .WSTRB(s_axi_trace_cntrl_WSTRB),
    .ARVALID(s_axi_trace_cntrl_ARVALID),
    .ARREADY(s_axi_trace_cntrl_ARREADY),
    .ARADDR(s_axi_trace_cntrl_ARADDR),
    .RVALID(s_axi_trace_cntrl_RVALID),
    .RREADY(s_axi_trace_cntrl_RREADY),
    .RDATA(s_axi_trace_cntrl_RDATA),
    .RRESP(s_axi_trace_cntrl_RRESP),
    .BVALID(s_axi_trace_cntrl_BVALID),
    .BREADY(s_axi_trace_cntrl_BREADY),
    .BRESP(s_axi_trace_cntrl_BRESP),
    .ACLK(ap_clk),
    .ARESET(ap_rst_n_inv),
    .ACLK_EN(1'b1),
    .trigger(trigger),
    .length_r(length_r),
    .ap_start(ap_start),
    .interrupt(interrupt),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_idle(ap_idle)
);

trace_cntrl_32_regslice_both #(
    .DataWidth( 32 ))
regslice_both_trace_32_V_data_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(trace_32_TDATA),
    .vld_in(trace_32_TVALID),
    .ack_in(regslice_both_trace_32_V_data_V_U_ack_in),
    .data_out(trace_32_TDATA_int_regslice),
    .vld_out(trace_32_TVALID_int_regslice),
    .ack_out(trace_32_TREADY_int_regslice),
    .apdone_blk(regslice_both_trace_32_V_data_V_U_apdone_blk)
);

trace_cntrl_32_regslice_both #(
    .DataWidth( 4 ))
regslice_both_trace_32_V_keep_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(trace_32_TKEEP),
    .vld_in(trace_32_TVALID),
    .ack_in(regslice_both_trace_32_V_keep_V_U_ack_in),
    .data_out(trace_32_TKEEP_int_regslice),
    .vld_out(regslice_both_trace_32_V_keep_V_U_vld_out),
    .ack_out(trace_32_TREADY_int_regslice),
    .apdone_blk(regslice_both_trace_32_V_keep_V_U_apdone_blk)
);

trace_cntrl_32_regslice_both #(
    .DataWidth( 4 ))
regslice_both_trace_32_V_strb_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(trace_32_TSTRB),
    .vld_in(trace_32_TVALID),
    .ack_in(regslice_both_trace_32_V_strb_V_U_ack_in),
    .data_out(trace_32_TSTRB_int_regslice),
    .vld_out(regslice_both_trace_32_V_strb_V_U_vld_out),
    .ack_out(trace_32_TREADY_int_regslice),
    .apdone_blk(regslice_both_trace_32_V_strb_V_U_apdone_blk)
);

trace_cntrl_32_regslice_both #(
    .DataWidth( 1 ))
regslice_both_trace_32_V_user_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(trace_32_TUSER),
    .vld_in(trace_32_TVALID),
    .ack_in(regslice_both_trace_32_V_user_V_U_ack_in),
    .data_out(trace_32_TUSER_int_regslice),
    .vld_out(regslice_both_trace_32_V_user_V_U_vld_out),
    .ack_out(trace_32_TREADY_int_regslice),
    .apdone_blk(regslice_both_trace_32_V_user_V_U_apdone_blk)
);

trace_cntrl_32_regslice_both #(
    .DataWidth( 1 ))
regslice_both_trace_32_V_last_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(trace_32_TLAST),
    .vld_in(trace_32_TVALID),
    .ack_in(regslice_both_trace_32_V_last_V_U_ack_in),
    .data_out(trace_32_TLAST_int_regslice),
    .vld_out(regslice_both_trace_32_V_last_V_U_vld_out),
    .ack_out(trace_32_TREADY_int_regslice),
    .apdone_blk(regslice_both_trace_32_V_last_V_U_apdone_blk)
);

trace_cntrl_32_regslice_both #(
    .DataWidth( 1 ))
regslice_both_trace_32_V_id_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(trace_32_TID),
    .vld_in(trace_32_TVALID),
    .ack_in(regslice_both_trace_32_V_id_V_U_ack_in),
    .data_out(trace_32_TID_int_regslice),
    .vld_out(regslice_both_trace_32_V_id_V_U_vld_out),
    .ack_out(trace_32_TREADY_int_regslice),
    .apdone_blk(regslice_both_trace_32_V_id_V_U_apdone_blk)
);

trace_cntrl_32_regslice_both #(
    .DataWidth( 1 ))
regslice_both_trace_32_V_dest_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(trace_32_TDEST),
    .vld_in(trace_32_TVALID),
    .ack_in(regslice_both_trace_32_V_dest_V_U_ack_in),
    .data_out(trace_32_TDEST_int_regslice),
    .vld_out(regslice_both_trace_32_V_dest_V_U_vld_out),
    .ack_out(trace_32_TREADY_int_regslice),
    .apdone_blk(regslice_both_trace_32_V_dest_V_U_apdone_blk)
);

trace_cntrl_32_regslice_both #(
    .DataWidth( 32 ))
regslice_both_capture_32_V_data_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(grp_trace_cntrl_32_Pipeline_VITIS_LOOP_28_1_fu_82_capture_32_TDATA),
    .vld_in(grp_trace_cntrl_32_Pipeline_VITIS_LOOP_28_1_fu_82_capture_32_TVALID),
    .ack_in(capture_32_TREADY_int_regslice),
    .data_out(capture_32_TDATA),
    .vld_out(regslice_both_capture_32_V_data_V_U_vld_out),
    .ack_out(capture_32_TREADY),
    .apdone_blk(regslice_both_capture_32_V_data_V_U_apdone_blk)
);

trace_cntrl_32_regslice_both #(
    .DataWidth( 4 ))
regslice_both_capture_32_V_keep_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(grp_trace_cntrl_32_Pipeline_VITIS_LOOP_28_1_fu_82_capture_32_TKEEP),
    .vld_in(grp_trace_cntrl_32_Pipeline_VITIS_LOOP_28_1_fu_82_capture_32_TVALID),
    .ack_in(regslice_both_capture_32_V_keep_V_U_ack_in_dummy),
    .data_out(capture_32_TKEEP),
    .vld_out(regslice_both_capture_32_V_keep_V_U_vld_out),
    .ack_out(capture_32_TREADY),
    .apdone_blk(regslice_both_capture_32_V_keep_V_U_apdone_blk)
);

trace_cntrl_32_regslice_both #(
    .DataWidth( 4 ))
regslice_both_capture_32_V_strb_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(grp_trace_cntrl_32_Pipeline_VITIS_LOOP_28_1_fu_82_capture_32_TSTRB),
    .vld_in(grp_trace_cntrl_32_Pipeline_VITIS_LOOP_28_1_fu_82_capture_32_TVALID),
    .ack_in(regslice_both_capture_32_V_strb_V_U_ack_in_dummy),
    .data_out(capture_32_TSTRB),
    .vld_out(regslice_both_capture_32_V_strb_V_U_vld_out),
    .ack_out(capture_32_TREADY),
    .apdone_blk(regslice_both_capture_32_V_strb_V_U_apdone_blk)
);

trace_cntrl_32_regslice_both #(
    .DataWidth( 1 ))
regslice_both_capture_32_V_user_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(grp_trace_cntrl_32_Pipeline_VITIS_LOOP_28_1_fu_82_capture_32_TUSER),
    .vld_in(grp_trace_cntrl_32_Pipeline_VITIS_LOOP_28_1_fu_82_capture_32_TVALID),
    .ack_in(regslice_both_capture_32_V_user_V_U_ack_in_dummy),
    .data_out(capture_32_TUSER),
    .vld_out(regslice_both_capture_32_V_user_V_U_vld_out),
    .ack_out(capture_32_TREADY),
    .apdone_blk(regslice_both_capture_32_V_user_V_U_apdone_blk)
);

trace_cntrl_32_regslice_both #(
    .DataWidth( 1 ))
regslice_both_capture_32_V_last_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(grp_trace_cntrl_32_Pipeline_VITIS_LOOP_28_1_fu_82_capture_32_TLAST),
    .vld_in(grp_trace_cntrl_32_Pipeline_VITIS_LOOP_28_1_fu_82_capture_32_TVALID),
    .ack_in(regslice_both_capture_32_V_last_V_U_ack_in_dummy),
    .data_out(capture_32_TLAST),
    .vld_out(regslice_both_capture_32_V_last_V_U_vld_out),
    .ack_out(capture_32_TREADY),
    .apdone_blk(regslice_both_capture_32_V_last_V_U_apdone_blk)
);

trace_cntrl_32_regslice_both #(
    .DataWidth( 1 ))
regslice_both_capture_32_V_id_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(grp_trace_cntrl_32_Pipeline_VITIS_LOOP_28_1_fu_82_capture_32_TID),
    .vld_in(grp_trace_cntrl_32_Pipeline_VITIS_LOOP_28_1_fu_82_capture_32_TVALID),
    .ack_in(regslice_both_capture_32_V_id_V_U_ack_in_dummy),
    .data_out(capture_32_TID),
    .vld_out(regslice_both_capture_32_V_id_V_U_vld_out),
    .ack_out(capture_32_TREADY),
    .apdone_blk(regslice_both_capture_32_V_id_V_U_apdone_blk)
);

trace_cntrl_32_regslice_both #(
    .DataWidth( 1 ))
regslice_both_capture_32_V_dest_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(grp_trace_cntrl_32_Pipeline_VITIS_LOOP_28_1_fu_82_capture_32_TDEST),
    .vld_in(grp_trace_cntrl_32_Pipeline_VITIS_LOOP_28_1_fu_82_capture_32_TVALID),
    .ack_in(regslice_both_capture_32_V_dest_V_U_ack_in_dummy),
    .data_out(capture_32_TDEST),
    .vld_out(regslice_both_capture_32_V_dest_V_U_vld_out),
    .ack_out(capture_32_TREADY),
    .apdone_blk(regslice_both_capture_32_V_dest_V_U_apdone_blk)
);

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        grp_trace_cntrl_32_Pipeline_VITIS_LOOP_28_1_fu_82_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state2)) begin
            grp_trace_cntrl_32_Pipeline_VITIS_LOOP_28_1_fu_82_ap_start_reg <= 1'b1;
        end else if ((grp_trace_cntrl_32_Pipeline_VITIS_LOOP_28_1_fu_82_ap_ready == 1'b1)) begin
            grp_trace_cntrl_32_Pipeline_VITIS_LOOP_28_1_fu_82_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        length_r_read_reg_123 <= length_r;
        sub_reg_133 <= sub_fu_117_p2;
        trigger_read_reg_128 <= trigger;
    end
end

always @ (*) begin
    if ((ap_start == 1'b0)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

assign ap_ST_fsm_state2_blk = 1'b0;

always @ (*) begin
    if ((grp_trace_cntrl_32_Pipeline_VITIS_LOOP_28_1_fu_82_ap_done == 1'b0)) begin
        ap_ST_fsm_state3_blk = 1'b1;
    end else begin
        ap_ST_fsm_state3_blk = 1'b0;
    end
end

always @ (*) begin
    if ((regslice_both_capture_32_V_data_V_U_apdone_blk == 1'b1)) begin
        ap_ST_fsm_state4_blk = 1'b1;
    end else begin
        ap_ST_fsm_state4_blk = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) & (regslice_both_capture_32_V_data_V_U_apdone_blk == 1'b0))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) & (regslice_both_capture_32_V_data_V_U_apdone_blk == 1'b0))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        trace_32_TREADY_int_regslice = grp_trace_cntrl_32_Pipeline_VITIS_LOOP_28_1_fu_82_trace_32_TREADY;
    end else begin
        trace_32_TREADY_int_regslice = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        ap_ST_fsm_state3 : begin
            if (((grp_trace_cntrl_32_Pipeline_VITIS_LOOP_28_1_fu_82_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state4 : begin
            if (((1'b1 == ap_CS_fsm_state4) & (regslice_both_capture_32_V_data_V_U_apdone_blk == 1'b0))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign capture_32_TVALID = regslice_both_capture_32_V_data_V_U_vld_out;

assign capture_32_TVALID_int_regslice = grp_trace_cntrl_32_Pipeline_VITIS_LOOP_28_1_fu_82_capture_32_TVALID;

assign grp_trace_cntrl_32_Pipeline_VITIS_LOOP_28_1_fu_82_ap_start = grp_trace_cntrl_32_Pipeline_VITIS_LOOP_28_1_fu_82_ap_start_reg;

assign grp_trace_cntrl_32_Pipeline_VITIS_LOOP_28_1_fu_82_capture_32_TREADY = (capture_32_TREADY_int_regslice & ap_CS_fsm_state3);

assign sub_fu_117_p2 = ($signed(length_r) + $signed(32'd4294967295));

assign trace_32_TREADY = regslice_both_trace_32_V_data_V_U_ack_in;


reg find_kernel_block = 0;
// synthesis translate_off
`include "trace_cntrl_32_hls_deadlock_kernel_monitor_top.vh"
// synthesis translate_on

endmodule //trace_cntrl_32

