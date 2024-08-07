// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Version: 2021.2
// Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module trace_cntrl_32_trace_cntrl_32_Pipeline_VITIS_LOOP_28_1 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        trace_32_TVALID,
        capture_32_TREADY,
        length_r,
        sub,
        capture_32_TDATA,
        capture_32_TVALID,
        capture_32_TKEEP,
        capture_32_TSTRB,
        capture_32_TUSER,
        capture_32_TLAST,
        capture_32_TID,
        capture_32_TDEST,
        trace_32_TDATA,
        trace_32_TREADY,
        trace_32_TKEEP,
        trace_32_TSTRB,
        trace_32_TUSER,
        trace_32_TLAST,
        trace_32_TID,
        trace_32_TDEST,
        trigger
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input   trace_32_TVALID;
input   capture_32_TREADY;
input  [31:0] length_r;
input  [31:0] sub;
output  [31:0] capture_32_TDATA;
output   capture_32_TVALID;
output  [3:0] capture_32_TKEEP;
output  [3:0] capture_32_TSTRB;
output  [0:0] capture_32_TUSER;
output  [0:0] capture_32_TLAST;
output  [0:0] capture_32_TID;
output  [0:0] capture_32_TDEST;
input  [31:0] trace_32_TDATA;
output   trace_32_TREADY;
input  [3:0] trace_32_TKEEP;
input  [3:0] trace_32_TSTRB;
input  [0:0] trace_32_TUSER;
input  [0:0] trace_32_TLAST;
input  [0:0] trace_32_TID;
input  [0:0] trace_32_TDEST;
input  [31:0] trigger;

reg ap_idle;
reg capture_32_TVALID;
reg trace_32_TREADY;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire   [0:0] icmp_ln28_fu_156_p2;
reg    ap_block_state1_pp0_stage0_iter0;
reg   [0:0] match_1_reg_303;
reg    ap_block_state2_pp0_stage0_iter1;
reg    ap_block_state2_io;
reg    ap_block_pp0_stage0_subdone;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg    capture_32_TDATA_blk_n;
wire    ap_block_pp0_stage0;
reg    trace_32_TDATA_blk_n;
reg    ap_block_pp0_stage0_11001;
reg   [0:0] icmp_ln28_reg_269;
reg   [31:0] tmp_data_V_reg_273;
reg   [3:0] tmp_keep_V_reg_278;
reg   [3:0] tmp_strb_V_reg_283;
reg   [0:0] tmp_user_V_reg_288;
reg   [0:0] tmp_id_V_reg_293;
reg   [0:0] tmp_dest_V_reg_298;
wire   [0:0] match_1_fu_198_p2;
wire   [31:0] i_2_fu_204_p2;
reg   [31:0] i_2_reg_308;
reg   [0:0] ap_phi_mux_match_phi_fu_136_p4;
wire    ap_loop_init;
reg   [31:0] samples_fu_64;
wire   [31:0] samples_1_fu_223_p2;
reg   [31:0] i_fu_68;
wire   [31:0] i_5_fu_237_p2;
reg   [31:0] ap_sig_allocacmp_i_1;
reg   [31:0] ap_sig_allocacmp_i_4;
reg    ap_block_pp0_stage0_01001;
wire   [31:0] and_ln31_fu_186_p2;
wire   [0:0] icmp_ln31_fu_192_p2;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
reg    ap_condition_278;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_done_reg = 1'b0;
end

trace_cntrl_32_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
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
        end else if (((ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln28_reg_269 == 1'd1))) begin
            i_fu_68 <= i_5_fu_237_p2;
        end else if (((match_1_reg_303 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
            i_fu_68 <= i_2_reg_308;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            samples_fu_64 <= 32'd0;
        end else if (((match_1_reg_303 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
            samples_fu_64 <= samples_1_fu_223_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln28_fu_156_p2 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (match_1_fu_198_p2 == 1'd0))) begin
        i_2_reg_308 <= i_2_fu_204_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln28_reg_269 <= icmp_ln28_fu_156_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln28_fu_156_p2 == 1'd1) & (ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        match_1_reg_303 <= match_1_fu_198_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln28_fu_156_p2 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        tmp_data_V_reg_273 <= trace_32_TDATA;
        tmp_dest_V_reg_298 <= trace_32_TDEST;
        tmp_id_V_reg_293 <= trace_32_TID;
        tmp_keep_V_reg_278 <= trace_32_TKEEP;
        tmp_strb_V_reg_283 <= trace_32_TSTRB;
        tmp_user_V_reg_288 <= trace_32_TUSER;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (icmp_ln28_fu_156_p2 == 1'd0) & (ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
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
        if ((1'b1 == ap_condition_278)) begin
            ap_phi_mux_match_phi_fu_136_p4 = match_1_reg_303;
        end else if ((ap_loop_init == 1'b1)) begin
            ap_phi_mux_match_phi_fu_136_p4 = 1'd0;
        end else begin
            ap_phi_mux_match_phi_fu_136_p4 = match_1_reg_303;
        end
    end else begin
        ap_phi_mux_match_phi_fu_136_p4 = match_1_reg_303;
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
        end else if (((ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln28_reg_269 == 1'd1))) begin
            ap_sig_allocacmp_i_1 = i_5_fu_237_p2;
        end else if (((match_1_reg_303 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
            ap_sig_allocacmp_i_1 = i_2_reg_308;
        end else begin
            ap_sig_allocacmp_i_1 = i_fu_68;
        end
    end else begin
        ap_sig_allocacmp_i_1 = i_fu_68;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (match_1_reg_303 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_sig_allocacmp_i_4 = i_2_reg_308;
    end else begin
        ap_sig_allocacmp_i_4 = i_fu_68;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (match_1_reg_303 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        capture_32_TDATA_blk_n = capture_32_TREADY;
    end else begin
        capture_32_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (match_1_reg_303 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        capture_32_TVALID = 1'b1;
    end else begin
        capture_32_TVALID = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (icmp_ln28_fu_156_p2 == 1'd1) & (ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        trace_32_TDATA_blk_n = trace_32_TVALID;
    end else begin
        trace_32_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln28_fu_156_p2 == 1'd1) & (ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        trace_32_TREADY = 1'b1;
    end else begin
        trace_32_TREADY = 1'b0;
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

assign and_ln31_fu_186_p2 = (trigger & trace_32_TDATA);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = (((match_1_reg_303 == 1'd1) & (capture_32_TREADY == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((icmp_ln28_fu_156_p2 == 1'd1) & (trace_32_TVALID == 1'b0) & (ap_start_int == 1'b1)));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = (((ap_enable_reg_pp0_iter1 == 1'b1) & ((1'b1 == ap_block_state2_io) | ((match_1_reg_303 == 1'd1) & (capture_32_TREADY == 1'b0)))) | ((icmp_ln28_fu_156_p2 == 1'd1) & (trace_32_TVALID == 1'b0) & (ap_start_int == 1'b1)));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = (((ap_enable_reg_pp0_iter1 == 1'b1) & ((1'b1 == ap_block_state2_io) | ((match_1_reg_303 == 1'd1) & (capture_32_TREADY == 1'b0)))) | ((icmp_ln28_fu_156_p2 == 1'd1) & (trace_32_TVALID == 1'b0) & (ap_start_int == 1'b1)));
end

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = ((icmp_ln28_fu_156_p2 == 1'd1) & (trace_32_TVALID == 1'b0));
end

always @ (*) begin
    ap_block_state2_io = ((match_1_reg_303 == 1'd1) & (capture_32_TREADY == 1'b0));
end

always @ (*) begin
    ap_block_state2_pp0_stage0_iter1 = ((match_1_reg_303 == 1'd1) & (capture_32_TREADY == 1'b0));
end

always @ (*) begin
    ap_condition_278 = ((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln28_reg_269 == 1'd1));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign capture_32_TDATA = tmp_data_V_reg_273;

assign capture_32_TDEST = tmp_dest_V_reg_298;

assign capture_32_TID = tmp_id_V_reg_293;

assign capture_32_TKEEP = tmp_keep_V_reg_278;

assign capture_32_TLAST = ((samples_fu_64 == sub) ? 1'b1 : 1'b0);

assign capture_32_TSTRB = tmp_strb_V_reg_283;

assign capture_32_TUSER = tmp_user_V_reg_288;

assign i_2_fu_204_p2 = ($signed(ap_sig_allocacmp_i_1) + $signed(32'd4294967295));

assign i_5_fu_237_p2 = (ap_sig_allocacmp_i_4 + 32'd1);

assign icmp_ln28_fu_156_p2 = (($signed(ap_sig_allocacmp_i_1) < $signed(length_r)) ? 1'b1 : 1'b0);

assign icmp_ln31_fu_192_p2 = ((and_ln31_fu_186_p2 == trigger) ? 1'b1 : 1'b0);

assign match_1_fu_198_p2 = (icmp_ln31_fu_192_p2 | ap_phi_mux_match_phi_fu_136_p4);

assign samples_1_fu_223_p2 = (samples_fu_64 + 32'd1);

endmodule //trace_cntrl_32_trace_cntrl_32_Pipeline_VITIS_LOOP_28_1
