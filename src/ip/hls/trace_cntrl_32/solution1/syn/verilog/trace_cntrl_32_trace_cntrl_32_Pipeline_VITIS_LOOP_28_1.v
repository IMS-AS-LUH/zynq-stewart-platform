// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
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

parameter    ap_ST_fsm_state1 = 2'd1;
parameter    ap_ST_fsm_state2 = 2'd2;

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

(* fsm_encoding = "none" *) reg   [1:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [0:0] icmp_ln28_fu_156_p2;
reg    ap_block_state1_pp0_stage0_iter0;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire    ap_CS_fsm_state2;
reg   [0:0] icmp_ln28_reg_265;
reg   [0:0] match_1_reg_299;
reg    ap_predicate_op37_write_state2;
reg    ap_block_state2_pp0_stage1_iter0;
reg    ap_block_state2_io;
reg    capture_32_TDATA_blk_n;
reg    trace_32_TDATA_blk_n;
reg   [0:0] match_reg_133;
reg   [31:0] tmp_data_V_reg_269;
reg   [3:0] tmp_keep_V_reg_274;
reg   [3:0] tmp_strb_V_reg_279;
reg   [0:0] tmp_user_V_reg_284;
reg   [0:0] tmp_id_V_reg_289;
reg   [0:0] tmp_dest_V_reg_294;
wire   [0:0] match_1_fu_198_p2;
wire   [31:0] i_2_fu_204_p2;
reg   [31:0] i_2_reg_304;
reg   [0:0] ap_phi_mux_match_phi_fu_136_p4;
wire    ap_loop_init;
reg   [31:0] samples_fu_64;
wire   [31:0] samples_1_fu_223_p2;
reg   [31:0] i_fu_68;
wire   [31:0] i_5_fu_234_p2;
reg   [31:0] ap_sig_allocacmp_i_4;
reg   [31:0] ap_sig_allocacmp_i_1;
reg   [31:0] grp_load_fu_143_p1;
wire   [31:0] and_ln31_fu_186_p2;
wire   [0:0] icmp_ln31_fu_192_p2;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [1:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
reg    ap_ST_fsm_state2_blk;
wire    ap_start_int;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 2'd1;
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
        ap_CS_fsm <= ap_ST_fsm_state1;
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
        end else if ((~((ap_start_int == 1'b0) | ((icmp_ln28_fu_156_p2 == 1'd1) & (trace_32_TVALID == 1'b0))) & (ap_loop_exit_ready == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_start_int == 1'b0) | ((icmp_ln28_fu_156_p2 == 1'd1) & (trace_32_TVALID == 1'b0))) & (1'b1 == ap_CS_fsm_state1) & (ap_loop_init == 1'b1))) begin
        i_fu_68 <= 32'd0;
    end else if ((~((1'b1 == ap_block_state2_io) | ((ap_predicate_op37_write_state2 == 1'b1) & (capture_32_TREADY == 1'b0))) & (icmp_ln28_reg_265 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        i_fu_68 <= i_5_fu_234_p2;
    end else if ((~((1'b1 == ap_block_state2_io) | ((ap_predicate_op37_write_state2 == 1'b1) & (capture_32_TREADY == 1'b0))) & (match_1_reg_299 == 1'd0) & (icmp_ln28_reg_265 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        i_fu_68 <= i_2_reg_304;
    end
end

always @ (posedge ap_clk) begin
    if ((~((1'b1 == ap_block_state2_io) | ((ap_predicate_op37_write_state2 == 1'b1) & (capture_32_TREADY == 1'b0))) & (icmp_ln28_reg_265 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        match_reg_133 <= match_1_reg_299;
    end else if ((~((ap_start_int == 1'b0) | ((icmp_ln28_fu_156_p2 == 1'd1) & (trace_32_TVALID == 1'b0))) & (1'b1 == ap_CS_fsm_state1) & (ap_loop_init == 1'b1))) begin
        match_reg_133 <= 1'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_start_int == 1'b0) | ((icmp_ln28_fu_156_p2 == 1'd1) & (trace_32_TVALID == 1'b0))) & (1'b1 == ap_CS_fsm_state1) & (ap_loop_init == 1'b1))) begin
        samples_fu_64 <= 32'd0;
    end else if ((~((1'b1 == ap_block_state2_io) | ((ap_predicate_op37_write_state2 == 1'b1) & (capture_32_TREADY == 1'b0))) & (match_1_reg_299 == 1'd1) & (icmp_ln28_reg_265 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        samples_fu_64 <= samples_1_fu_223_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_start_int == 1'b0) | ((icmp_ln28_fu_156_p2 == 1'd1) & (trace_32_TVALID == 1'b0))) & (icmp_ln28_fu_156_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (match_1_fu_198_p2 == 1'd0))) begin
        i_2_reg_304 <= i_2_fu_204_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_start_int == 1'b0) | ((icmp_ln28_fu_156_p2 == 1'd1) & (trace_32_TVALID == 1'b0))) & (1'b1 == ap_CS_fsm_state1))) begin
        icmp_ln28_reg_265 <= icmp_ln28_fu_156_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_start_int == 1'b0) | ((icmp_ln28_fu_156_p2 == 1'd1) & (trace_32_TVALID == 1'b0))) & (icmp_ln28_fu_156_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        match_1_reg_299 <= match_1_fu_198_p2;
        tmp_data_V_reg_269 <= trace_32_TDATA;
        tmp_dest_V_reg_294 <= trace_32_TDEST;
        tmp_id_V_reg_289 <= trace_32_TID;
        tmp_keep_V_reg_274 <= trace_32_TKEEP;
        tmp_strb_V_reg_279 <= trace_32_TSTRB;
        tmp_user_V_reg_284 <= trace_32_TUSER;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b0) | ((icmp_ln28_fu_156_p2 == 1'd1) & (trace_32_TVALID == 1'b0)))) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_block_state2_io) | ((ap_predicate_op37_write_state2 == 1'b1) & (capture_32_TREADY == 1'b0)))) begin
        ap_ST_fsm_state2_blk = 1'b1;
    end else begin
        ap_ST_fsm_state2_blk = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((icmp_ln28_fu_156_p2 == 1'd1) & (trace_32_TVALID == 1'b0))) & (icmp_ln28_fu_156_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((icmp_ln28_fu_156_p2 == 1'd1) & (trace_32_TVALID == 1'b0))) & (ap_loop_exit_ready == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_loop_init == 1'b1))) begin
        ap_phi_mux_match_phi_fu_136_p4 = 1'd0;
    end else begin
        ap_phi_mux_match_phi_fu_136_p4 = match_reg_133;
    end
end

always @ (*) begin
    if ((~((1'b1 == ap_block_state2_io) | ((ap_predicate_op37_write_state2 == 1'b1) & (capture_32_TREADY == 1'b0))) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_i_1 = 32'd0;
    end else begin
        ap_sig_allocacmp_i_1 = i_fu_68;
    end
end

always @ (*) begin
    if (((match_1_reg_299 == 1'd0) & (icmp_ln28_reg_265 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_sig_allocacmp_i_4 = i_2_reg_304;
    end else begin
        ap_sig_allocacmp_i_4 = i_fu_68;
    end
end

always @ (*) begin
    if (((ap_predicate_op37_write_state2 == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
        capture_32_TDATA_blk_n = capture_32_TREADY;
    end else begin
        capture_32_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((1'b1 == ap_block_state2_io) | ((ap_predicate_op37_write_state2 == 1'b1) & (capture_32_TREADY == 1'b0))) & (ap_predicate_op37_write_state2 == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
        capture_32_TVALID = 1'b1;
    end else begin
        capture_32_TVALID = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln28_reg_265 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        grp_load_fu_143_p1 = ap_sig_allocacmp_i_4;
    end else if ((1'b1 == ap_CS_fsm_state1)) begin
        grp_load_fu_143_p1 = ap_sig_allocacmp_i_1;
    end else begin
        grp_load_fu_143_p1 = 'bx;
    end
end

always @ (*) begin
    if (((icmp_ln28_fu_156_p2 == 1'd1) & (ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        trace_32_TDATA_blk_n = trace_32_TVALID;
    end else begin
        trace_32_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((icmp_ln28_fu_156_p2 == 1'd1) & (trace_32_TVALID == 1'b0))) & (icmp_ln28_fu_156_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        trace_32_TREADY = 1'b1;
    end else begin
        trace_32_TREADY = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_start_int == 1'b0) | ((icmp_ln28_fu_156_p2 == 1'd1) & (trace_32_TVALID == 1'b0))) & (icmp_ln28_fu_156_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else if ((~((ap_start_int == 1'b0) | ((icmp_ln28_fu_156_p2 == 1'd1) & (trace_32_TVALID == 1'b0))) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if ((~((1'b1 == ap_block_state2_io) | ((ap_predicate_op37_write_state2 == 1'b1) & (capture_32_TREADY == 1'b0))) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign and_ln31_fu_186_p2 = (trigger & trace_32_TDATA);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = ((ap_start_int == 1'b0) | ((icmp_ln28_fu_156_p2 == 1'd1) & (trace_32_TVALID == 1'b0)));
end

always @ (*) begin
    ap_block_state2_io = ((ap_predicate_op37_write_state2 == 1'b1) & (capture_32_TREADY == 1'b0));
end

always @ (*) begin
    ap_block_state2_pp0_stage1_iter0 = ((ap_predicate_op37_write_state2 == 1'b1) & (capture_32_TREADY == 1'b0));
end

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

always @ (*) begin
    ap_predicate_op37_write_state2 = ((match_1_reg_299 == 1'd1) & (icmp_ln28_reg_265 == 1'd1));
end

assign capture_32_TDATA = tmp_data_V_reg_269;

assign capture_32_TDEST = tmp_dest_V_reg_294;

assign capture_32_TID = tmp_id_V_reg_289;

assign capture_32_TKEEP = tmp_keep_V_reg_274;

assign capture_32_TLAST = ((samples_fu_64 == sub) ? 1'b1 : 1'b0);

assign capture_32_TSTRB = tmp_strb_V_reg_279;

assign capture_32_TUSER = tmp_user_V_reg_284;

assign i_2_fu_204_p2 = ($signed(grp_load_fu_143_p1) + $signed(32'd4294967295));

assign i_5_fu_234_p2 = (grp_load_fu_143_p1 + 32'd1);

assign icmp_ln28_fu_156_p2 = (($signed(grp_load_fu_143_p1) < $signed(length_r)) ? 1'b1 : 1'b0);

assign icmp_ln31_fu_192_p2 = ((and_ln31_fu_186_p2 == trigger) ? 1'b1 : 1'b0);

assign match_1_fu_198_p2 = (icmp_ln31_fu_192_p2 | ap_phi_mux_match_phi_fu_136_p4);

assign samples_1_fu_223_p2 = (samples_fu_64 + 32'd1);

endmodule //trace_cntrl_32_trace_cntrl_32_Pipeline_VITIS_LOOP_28_1