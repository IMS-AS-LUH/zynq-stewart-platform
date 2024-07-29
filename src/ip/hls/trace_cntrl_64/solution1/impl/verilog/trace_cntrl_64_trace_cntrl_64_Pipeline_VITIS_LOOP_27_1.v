// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Version: 2021.2
// Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module trace_cntrl_64_trace_cntrl_64_Pipeline_VITIS_LOOP_27_1 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        trace_64_TVALID,
        capture_64_TREADY,
        length_r,
        sub,
        capture_64_TDATA,
        capture_64_TVALID,
        capture_64_TKEEP,
        capture_64_TSTRB,
        capture_64_TUSER,
        capture_64_TLAST,
        capture_64_TID,
        capture_64_TDEST,
        trace_64_TDATA,
        trace_64_TREADY,
        trace_64_TKEEP,
        trace_64_TSTRB,
        trace_64_TUSER,
        trace_64_TLAST,
        trace_64_TID,
        trace_64_TDEST,
        conv_i
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input   trace_64_TVALID;
input   capture_64_TREADY;
input  [31:0] length_r;
input  [31:0] sub;
output  [63:0] capture_64_TDATA;
output   capture_64_TVALID;
output  [7:0] capture_64_TKEEP;
output  [7:0] capture_64_TSTRB;
output  [0:0] capture_64_TUSER;
output  [0:0] capture_64_TLAST;
output  [0:0] capture_64_TID;
output  [0:0] capture_64_TDEST;
input  [63:0] trace_64_TDATA;
output   trace_64_TREADY;
input  [7:0] trace_64_TKEEP;
input  [7:0] trace_64_TSTRB;
input  [0:0] trace_64_TUSER;
input  [0:0] trace_64_TLAST;
input  [0:0] trace_64_TID;
input  [0:0] trace_64_TDEST;
input  [31:0] conv_i;

reg ap_idle;
reg capture_64_TVALID;
reg trace_64_TREADY;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire   [0:0] icmp_ln27_fu_156_p2;
reg    ap_block_state1_pp0_stage0_iter0;
reg   [0:0] match_1_reg_307;
reg    ap_block_state2_pp0_stage0_iter1;
reg    ap_block_state2_io;
reg    ap_block_pp0_stage0_subdone;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg    capture_64_TDATA_blk_n;
wire    ap_block_pp0_stage0;
reg    trace_64_TDATA_blk_n;
reg    ap_block_pp0_stage0_11001;
reg   [0:0] icmp_ln27_reg_273;
reg   [63:0] tmp_data_V_reg_277;
reg   [7:0] tmp_keep_V_reg_282;
reg   [7:0] tmp_strb_V_reg_287;
reg   [0:0] tmp_user_V_reg_292;
reg   [0:0] tmp_id_V_reg_297;
reg   [0:0] tmp_dest_V_reg_302;
wire   [0:0] match_1_fu_202_p2;
wire   [31:0] i_2_fu_208_p2;
reg   [31:0] i_2_reg_312;
reg   [0:0] ap_phi_mux_match_phi_fu_136_p4;
wire    ap_loop_init;
reg   [31:0] samples_fu_64;
wire   [31:0] samples_1_fu_227_p2;
reg   [31:0] i_fu_68;
wire   [31:0] i_5_fu_241_p2;
reg   [31:0] ap_sig_allocacmp_i_1;
reg   [31:0] ap_sig_allocacmp_i_4;
reg    ap_block_pp0_stage0_01001;
wire   [31:0] trunc_ln30_fu_186_p1;
wire   [31:0] and_ln30_fu_190_p2;
wire   [0:0] icmp_ln30_fu_196_p2;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
reg    ap_condition_281;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_done_reg = 1'b0;
end

trace_cntrl_64_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage0),
    .ap_loop_exit_done(ap_done_int),
    .ap_continue_int(ap_continue_int),
    .ap_done_int(ap_done_int)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue_int == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter0_stage0)) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter1 <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            i_fu_68 <= 32'd0;
        end else if (((ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln27_reg_273 == 1'd1))) begin
            i_fu_68 <= i_5_fu_241_p2;
        end else if (((match_1_reg_307 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
            i_fu_68 <= i_2_reg_312;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            samples_fu_64 <= 32'd0;
        end else if (((match_1_reg_307 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
            samples_fu_64 <= samples_1_fu_227_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln27_fu_156_p2 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (match_1_fu_202_p2 == 1'd0))) begin
        i_2_reg_312 <= i_2_fu_208_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln27_reg_273 <= icmp_ln27_fu_156_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln27_fu_156_p2 == 1'd1) & (ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        match_1_reg_307 <= match_1_fu_202_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln27_fu_156_p2 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        tmp_data_V_reg_277 <= trace_64_TDATA;
        tmp_dest_V_reg_302 <= trace_64_TDEST;
        tmp_id_V_reg_297 <= trace_64_TID;
        tmp_keep_V_reg_282 <= trace_64_TKEEP;
        tmp_strb_V_reg_287 <= trace_64_TSTRB;
        tmp_user_V_reg_292 <= trace_64_TUSER;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (icmp_ln27_fu_156_p2 == 1'd0) & (ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b0) & (ap_idle_pp0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_pp0_stage0)) begin
        if ((1'b1 == ap_condition_281)) begin
            ap_phi_mux_match_phi_fu_136_p4 = match_1_reg_307;
        end else if ((ap_loop_init == 1'b1)) begin
            ap_phi_mux_match_phi_fu_136_p4 = 1'd0;
        end else begin
            ap_phi_mux_match_phi_fu_136_p4 = match_1_reg_307;
        end
    end else begin
        ap_phi_mux_match_phi_fu_136_p4 = match_1_reg_307;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            ap_sig_allocacmp_i_1 = 32'd0;
        end else if (((ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln27_reg_273 == 1'd1))) begin
            ap_sig_allocacmp_i_1 = i_5_fu_241_p2;
        end else if (((match_1_reg_307 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
            ap_sig_allocacmp_i_1 = i_2_reg_312;
        end else begin
            ap_sig_allocacmp_i_1 = i_fu_68;
        end
    end else begin
        ap_sig_allocacmp_i_1 = i_fu_68;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (match_1_reg_307 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_sig_allocacmp_i_4 = i_2_reg_312;
    end else begin
        ap_sig_allocacmp_i_4 = i_fu_68;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (match_1_reg_307 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        capture_64_TDATA_blk_n = capture_64_TREADY;
    end else begin
        capture_64_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (match_1_reg_307 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        capture_64_TVALID = 1'b1;
    end else begin
        capture_64_TVALID = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (icmp_ln27_fu_156_p2 == 1'd1) & (ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        trace_64_TDATA_blk_n = trace_64_TVALID;
    end else begin
        trace_64_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln27_fu_156_p2 == 1'd1) & (ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        trace_64_TREADY = 1'b1;
    end else begin
        trace_64_TREADY = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign and_ln30_fu_190_p2 = (trunc_ln30_fu_186_p1 & conv_i);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = (((match_1_reg_307 == 1'd1) & (capture_64_TREADY == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((icmp_ln27_fu_156_p2 == 1'd1) & (trace_64_TVALID == 1'b0) & (ap_start_int == 1'b1)));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = (((ap_enable_reg_pp0_iter1 == 1'b1) & ((1'b1 == ap_block_state2_io) | ((match_1_reg_307 == 1'd1) & (capture_64_TREADY == 1'b0)))) | ((icmp_ln27_fu_156_p2 == 1'd1) & (trace_64_TVALID == 1'b0) & (ap_start_int == 1'b1)));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = (((ap_enable_reg_pp0_iter1 == 1'b1) & ((1'b1 == ap_block_state2_io) | ((match_1_reg_307 == 1'd1) & (capture_64_TREADY == 1'b0)))) | ((icmp_ln27_fu_156_p2 == 1'd1) & (trace_64_TVALID == 1'b0) & (ap_start_int == 1'b1)));
end

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = ((icmp_ln27_fu_156_p2 == 1'd1) & (trace_64_TVALID == 1'b0));
end

always @ (*) begin
    ap_block_state2_io = ((match_1_reg_307 == 1'd1) & (capture_64_TREADY == 1'b0));
end

always @ (*) begin
    ap_block_state2_pp0_stage0_iter1 = ((match_1_reg_307 == 1'd1) & (capture_64_TREADY == 1'b0));
end

always @ (*) begin
    ap_condition_281 = ((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln27_reg_273 == 1'd1));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign capture_64_TDATA = tmp_data_V_reg_277;

assign capture_64_TDEST = tmp_dest_V_reg_302;

assign capture_64_TID = tmp_id_V_reg_297;

assign capture_64_TKEEP = tmp_keep_V_reg_282;

assign capture_64_TLAST = ((samples_fu_64 == sub) ? 1'b1 : 1'b0);

assign capture_64_TSTRB = tmp_strb_V_reg_287;

assign capture_64_TUSER = tmp_user_V_reg_292;

assign i_2_fu_208_p2 = ($signed(ap_sig_allocacmp_i_1) + $signed(32'd4294967295));

assign i_5_fu_241_p2 = (ap_sig_allocacmp_i_4 + 32'd1);

assign icmp_ln27_fu_156_p2 = (($signed(ap_sig_allocacmp_i_1) < $signed(length_r)) ? 1'b1 : 1'b0);

assign icmp_ln30_fu_196_p2 = ((and_ln30_fu_190_p2 == conv_i) ? 1'b1 : 1'b0);

assign match_1_fu_202_p2 = (icmp_ln30_fu_196_p2 | ap_phi_mux_match_phi_fu_136_p4);

assign samples_1_fu_227_p2 = (samples_fu_64 + 32'd1);

assign trunc_ln30_fu_186_p1 = trace_64_TDATA[31:0];

endmodule //trace_cntrl_64_trace_cntrl_64_Pipeline_VITIS_LOOP_27_1
