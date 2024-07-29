-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
-- Version: 2021.2
-- Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity trace_cntrl_32_trace_cntrl_32_Pipeline_VITIS_LOOP_28_1 is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    trace_32_TVALID : IN STD_LOGIC;
    capture_32_TREADY : IN STD_LOGIC;
    length_r : IN STD_LOGIC_VECTOR (31 downto 0);
    sub : IN STD_LOGIC_VECTOR (31 downto 0);
    capture_32_TDATA : OUT STD_LOGIC_VECTOR (31 downto 0);
    capture_32_TVALID : OUT STD_LOGIC;
    capture_32_TKEEP : OUT STD_LOGIC_VECTOR (3 downto 0);
    capture_32_TSTRB : OUT STD_LOGIC_VECTOR (3 downto 0);
    capture_32_TUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    capture_32_TLAST : OUT STD_LOGIC_VECTOR (0 downto 0);
    capture_32_TID : OUT STD_LOGIC_VECTOR (0 downto 0);
    capture_32_TDEST : OUT STD_LOGIC_VECTOR (0 downto 0);
    trace_32_TDATA : IN STD_LOGIC_VECTOR (31 downto 0);
    trace_32_TREADY : OUT STD_LOGIC;
    trace_32_TKEEP : IN STD_LOGIC_VECTOR (3 downto 0);
    trace_32_TSTRB : IN STD_LOGIC_VECTOR (3 downto 0);
    trace_32_TUSER : IN STD_LOGIC_VECTOR (0 downto 0);
    trace_32_TLAST : IN STD_LOGIC_VECTOR (0 downto 0);
    trace_32_TID : IN STD_LOGIC_VECTOR (0 downto 0);
    trace_32_TDEST : IN STD_LOGIC_VECTOR (0 downto 0);
    trigger : IN STD_LOGIC_VECTOR (31 downto 0) );
end;


architecture behav of trace_cntrl_32_trace_cntrl_32_Pipeline_VITIS_LOOP_28_1 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_FFFFFFFF : STD_LOGIC_VECTOR (31 downto 0) := "11111111111111111111111111111111";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC;
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_idle_pp0 : STD_LOGIC;
    signal icmp_ln28_fu_156_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_state1_pp0_stage0_iter0 : BOOLEAN;
    signal match_1_reg_303 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_state2_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_state2_io : BOOLEAN;
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal ap_condition_exit_pp0_iter0_stage0 : STD_LOGIC;
    signal ap_loop_exit_ready : STD_LOGIC;
    signal ap_ready_int : STD_LOGIC;
    signal capture_32_TDATA_blk_n : STD_LOGIC;
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal trace_32_TDATA_blk_n : STD_LOGIC;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal icmp_ln28_reg_269 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_data_V_reg_273 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_keep_V_reg_278 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_strb_V_reg_283 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_user_V_reg_288 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_id_V_reg_293 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_dest_V_reg_298 : STD_LOGIC_VECTOR (0 downto 0);
    signal match_1_fu_198_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_2_fu_204_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_2_reg_308 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_phi_mux_match_phi_fu_136_p4 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_loop_init : STD_LOGIC;
    signal samples_fu_64 : STD_LOGIC_VECTOR (31 downto 0);
    signal samples_1_fu_223_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_fu_68 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_5_fu_237_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_sig_allocacmp_i_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_sig_allocacmp_i_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal and_ln31_fu_186_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal icmp_ln31_fu_192_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_continue_int : STD_LOGIC;
    signal ap_done_int : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_start_int : STD_LOGIC;
    signal ap_condition_278 : BOOLEAN;
    signal ap_ce_reg : STD_LOGIC;

    component trace_cntrl_32_flow_control_loop_pipe_sequential_init IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_start_int : OUT STD_LOGIC;
        ap_loop_init : OUT STD_LOGIC;
        ap_ready_int : IN STD_LOGIC;
        ap_loop_exit_ready : IN STD_LOGIC;
        ap_loop_exit_done : IN STD_LOGIC;
        ap_continue_int : OUT STD_LOGIC;
        ap_done_int : IN STD_LOGIC );
    end component;



begin
    flow_control_loop_pipe_sequential_init_U : component trace_cntrl_32_flow_control_loop_pipe_sequential_init
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => ap_start,
        ap_ready => ap_ready,
        ap_done => ap_done,
        ap_start_int => ap_start_int,
        ap_loop_init => ap_loop_init,
        ap_ready_int => ap_ready_int,
        ap_loop_exit_ready => ap_condition_exit_pp0_iter0_stage0,
        ap_loop_exit_done => ap_done_int,
        ap_continue_int => ap_continue_int,
        ap_done_int => ap_done_int);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_done_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_done_reg <= ap_const_logic_0;
            else
                if ((ap_continue_int = ap_const_logic_1)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif (((ap_loop_exit_ready = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_condition_exit_pp0_iter0_stage0)) then 
                    ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    ap_enable_reg_pp0_iter1 <= ap_start_int;
                end if; 
            end if;
        end if;
    end process;


    i_fu_68_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    i_fu_68 <= ap_const_lv32_0;
                elsif (((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (icmp_ln28_reg_269 = ap_const_lv1_1))) then 
                    i_fu_68 <= i_5_fu_237_p2;
                elsif (((match_1_reg_303 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                    i_fu_68 <= i_2_reg_308;
                end if;
            end if; 
        end if;
    end process;

    samples_fu_64_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    samples_fu_64 <= ap_const_lv32_0;
                elsif (((match_1_reg_303 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                    samples_fu_64 <= samples_1_fu_223_p2;
                end if;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln28_fu_156_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (match_1_fu_198_p2 = ap_const_lv1_0))) then
                i_2_reg_308 <= i_2_fu_204_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                icmp_ln28_reg_269 <= icmp_ln28_fu_156_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln28_fu_156_p2 = ap_const_lv1_1) and (ap_start_int = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                match_1_reg_303 <= match_1_fu_198_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln28_fu_156_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                tmp_data_V_reg_273 <= trace_32_TDATA;
                tmp_dest_V_reg_298 <= trace_32_TDEST;
                tmp_id_V_reg_293 <= trace_32_TID;
                tmp_keep_V_reg_278 <= trace_32_TKEEP;
                tmp_strb_V_reg_283 <= trace_32_TSTRB;
                tmp_user_V_reg_288 <= trace_32_TUSER;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_CS_fsm)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_pp0_stage0 => 
                ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
            when others =>  
                ap_NS_fsm <= "X";
        end case;
    end process;
    and_ln31_fu_186_p2 <= (trigger and trace_32_TDATA);
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage0_01001_assign_proc : process(ap_enable_reg_pp0_iter1, trace_32_TVALID, icmp_ln28_fu_156_p2, capture_32_TREADY, match_1_reg_303, ap_start_int)
    begin
                ap_block_pp0_stage0_01001 <= (((match_1_reg_303 = ap_const_lv1_1) and (capture_32_TREADY = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1)) or ((icmp_ln28_fu_156_p2 = ap_const_lv1_1) and (trace_32_TVALID = ap_const_logic_0) and (ap_start_int = ap_const_logic_1)));
    end process;


    ap_block_pp0_stage0_11001_assign_proc : process(ap_enable_reg_pp0_iter1, trace_32_TVALID, icmp_ln28_fu_156_p2, capture_32_TREADY, match_1_reg_303, ap_block_state2_io, ap_start_int)
    begin
                ap_block_pp0_stage0_11001 <= (((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and ((ap_const_boolean_1 = ap_block_state2_io) or ((match_1_reg_303 = ap_const_lv1_1) and (capture_32_TREADY = ap_const_logic_0)))) or ((icmp_ln28_fu_156_p2 = ap_const_lv1_1) and (trace_32_TVALID = ap_const_logic_0) and (ap_start_int = ap_const_logic_1)));
    end process;


    ap_block_pp0_stage0_subdone_assign_proc : process(ap_enable_reg_pp0_iter1, trace_32_TVALID, icmp_ln28_fu_156_p2, capture_32_TREADY, match_1_reg_303, ap_block_state2_io, ap_start_int)
    begin
                ap_block_pp0_stage0_subdone <= (((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and ((ap_const_boolean_1 = ap_block_state2_io) or ((match_1_reg_303 = ap_const_lv1_1) and (capture_32_TREADY = ap_const_logic_0)))) or ((icmp_ln28_fu_156_p2 = ap_const_lv1_1) and (trace_32_TVALID = ap_const_logic_0) and (ap_start_int = ap_const_logic_1)));
    end process;


    ap_block_state1_pp0_stage0_iter0_assign_proc : process(trace_32_TVALID, icmp_ln28_fu_156_p2)
    begin
                ap_block_state1_pp0_stage0_iter0 <= ((icmp_ln28_fu_156_p2 = ap_const_lv1_1) and (trace_32_TVALID = ap_const_logic_0));
    end process;


    ap_block_state2_io_assign_proc : process(capture_32_TREADY, match_1_reg_303)
    begin
                ap_block_state2_io <= ((match_1_reg_303 = ap_const_lv1_1) and (capture_32_TREADY = ap_const_logic_0));
    end process;


    ap_block_state2_pp0_stage0_iter1_assign_proc : process(capture_32_TREADY, match_1_reg_303)
    begin
                ap_block_state2_pp0_stage0_iter1 <= ((match_1_reg_303 = ap_const_lv1_1) and (capture_32_TREADY = ap_const_logic_0));
    end process;


    ap_condition_278_assign_proc : process(ap_enable_reg_pp0_iter1, ap_block_pp0_stage0, icmp_ln28_reg_269)
    begin
                ap_condition_278 <= ((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (icmp_ln28_reg_269 = ap_const_lv1_1));
    end process;


    ap_condition_exit_pp0_iter0_stage0_assign_proc : process(ap_CS_fsm_pp0_stage0, icmp_ln28_fu_156_p2, ap_block_pp0_stage0_subdone, ap_start_int)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (icmp_ln28_fu_156_p2 = ap_const_lv1_0) and (ap_start_int = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_condition_exit_pp0_iter0_stage0 <= ap_const_logic_1;
        else 
            ap_condition_exit_pp0_iter0_stage0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_int_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_subdone, ap_loop_exit_ready, ap_done_reg)
    begin
        if (((ap_loop_exit_ready = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_done_int <= ap_const_logic_1;
        else 
            ap_done_int <= ap_done_reg;
        end if; 
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);
    ap_enable_reg_pp0_iter0 <= ap_start_int;

    ap_idle_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_idle_pp0, ap_start_int)
    begin
        if (((ap_start_int = ap_const_logic_0) and (ap_idle_pp0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1)
    begin
        if (((ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;

    ap_loop_exit_ready <= ap_condition_exit_pp0_iter0_stage0;

    ap_phi_mux_match_phi_fu_136_p4_assign_proc : process(ap_CS_fsm_pp0_stage0, match_1_reg_303, ap_loop_init, ap_condition_278)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_pp0_stage0)) then
            if ((ap_const_boolean_1 = ap_condition_278)) then 
                ap_phi_mux_match_phi_fu_136_p4 <= match_1_reg_303;
            elsif ((ap_loop_init = ap_const_logic_1)) then 
                ap_phi_mux_match_phi_fu_136_p4 <= ap_const_lv1_0;
            else 
                ap_phi_mux_match_phi_fu_136_p4 <= match_1_reg_303;
            end if;
        else 
            ap_phi_mux_match_phi_fu_136_p4 <= match_1_reg_303;
        end if; 
    end process;


    ap_ready_int_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_subdone, ap_start_int)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_start_int = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_ready_int <= ap_const_logic_1;
        else 
            ap_ready_int <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_allocacmp_i_1_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, match_1_reg_303, ap_block_pp0_stage0, icmp_ln28_reg_269, i_2_reg_308, ap_loop_init, i_fu_68, i_5_fu_237_p2)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
            if ((ap_loop_init = ap_const_logic_1)) then 
                ap_sig_allocacmp_i_1 <= ap_const_lv32_0;
            elsif (((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (icmp_ln28_reg_269 = ap_const_lv1_1))) then 
                ap_sig_allocacmp_i_1 <= i_5_fu_237_p2;
            elsif (((match_1_reg_303 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                ap_sig_allocacmp_i_1 <= i_2_reg_308;
            else 
                ap_sig_allocacmp_i_1 <= i_fu_68;
            end if;
        else 
            ap_sig_allocacmp_i_1 <= i_fu_68;
        end if; 
    end process;


    ap_sig_allocacmp_i_4_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, match_1_reg_303, ap_block_pp0_stage0, i_2_reg_308, i_fu_68)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (match_1_reg_303 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_sig_allocacmp_i_4 <= i_2_reg_308;
        else 
            ap_sig_allocacmp_i_4 <= i_fu_68;
        end if; 
    end process;

    capture_32_TDATA <= tmp_data_V_reg_273;

    capture_32_TDATA_blk_n_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, capture_32_TREADY, match_1_reg_303, ap_block_pp0_stage0)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (match_1_reg_303 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            capture_32_TDATA_blk_n <= capture_32_TREADY;
        else 
            capture_32_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    capture_32_TDEST <= tmp_dest_V_reg_298;
    capture_32_TID <= tmp_id_V_reg_293;
    capture_32_TKEEP <= tmp_keep_V_reg_278;
    capture_32_TLAST <= "1" when (samples_fu_64 = sub) else "0";
    capture_32_TSTRB <= tmp_strb_V_reg_283;
    capture_32_TUSER <= tmp_user_V_reg_288;

    capture_32_TVALID_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, match_1_reg_303, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (match_1_reg_303 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            capture_32_TVALID <= ap_const_logic_1;
        else 
            capture_32_TVALID <= ap_const_logic_0;
        end if; 
    end process;

    i_2_fu_204_p2 <= std_logic_vector(unsigned(ap_sig_allocacmp_i_1) + unsigned(ap_const_lv32_FFFFFFFF));
    i_5_fu_237_p2 <= std_logic_vector(unsigned(ap_sig_allocacmp_i_4) + unsigned(ap_const_lv32_1));
    icmp_ln28_fu_156_p2 <= "1" when (signed(ap_sig_allocacmp_i_1) < signed(length_r)) else "0";
    icmp_ln31_fu_192_p2 <= "1" when (and_ln31_fu_186_p2 = trigger) else "0";
    match_1_fu_198_p2 <= (icmp_ln31_fu_192_p2 or ap_phi_mux_match_phi_fu_136_p4);
    samples_1_fu_223_p2 <= std_logic_vector(unsigned(samples_fu_64) + unsigned(ap_const_lv32_1));

    trace_32_TDATA_blk_n_assign_proc : process(ap_CS_fsm_pp0_stage0, trace_32_TVALID, icmp_ln28_fu_156_p2, ap_block_pp0_stage0, ap_start_int)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (icmp_ln28_fu_156_p2 = ap_const_lv1_1) and (ap_start_int = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            trace_32_TDATA_blk_n <= trace_32_TVALID;
        else 
            trace_32_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    trace_32_TREADY_assign_proc : process(ap_CS_fsm_pp0_stage0, icmp_ln28_fu_156_p2, ap_block_pp0_stage0_11001, ap_start_int)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln28_fu_156_p2 = ap_const_lv1_1) and (ap_start_int = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            trace_32_TREADY <= ap_const_logic_1;
        else 
            trace_32_TREADY <= ap_const_logic_0;
        end if; 
    end process;

end behav;
