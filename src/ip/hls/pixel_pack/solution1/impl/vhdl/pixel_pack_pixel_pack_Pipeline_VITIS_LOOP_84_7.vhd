-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
-- Version: 2021.2
-- Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity pixel_pack_pixel_pack_Pipeline_VITIS_LOOP_84_7 is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    stream_in_24_TVALID : IN STD_LOGIC;
    stream_out_32_TREADY : IN STD_LOGIC;
    stream_in_24_TDATA : IN STD_LOGIC_VECTOR (23 downto 0);
    stream_in_24_TREADY : OUT STD_LOGIC;
    stream_in_24_TKEEP : IN STD_LOGIC_VECTOR (2 downto 0);
    stream_in_24_TSTRB : IN STD_LOGIC_VECTOR (2 downto 0);
    stream_in_24_TUSER : IN STD_LOGIC_VECTOR (0 downto 0);
    stream_in_24_TLAST : IN STD_LOGIC_VECTOR (0 downto 0);
    stream_out_32_TDATA : OUT STD_LOGIC_VECTOR (31 downto 0);
    stream_out_32_TVALID : OUT STD_LOGIC;
    stream_out_32_TKEEP : OUT STD_LOGIC_VECTOR (3 downto 0);
    stream_out_32_TSTRB : OUT STD_LOGIC_VECTOR (3 downto 0);
    stream_out_32_TUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    stream_out_32_TLAST : OUT STD_LOGIC_VECTOR (0 downto 0) );
end;


architecture behav of pixel_pack_pixel_pack_Pipeline_VITIS_LOOP_84_7 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (1 downto 0) := "10";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv4_0 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    constant ap_const_boolean_1 : BOOLEAN := true;

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (1 downto 0) := "01";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal ap_block_state2_pp0_stage1_iter0 : BOOLEAN;
    signal tmp_last_V_fu_98_p1 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_condition_exit_pp0_iter0_stage1 : STD_LOGIC;
    signal ap_loop_exit_ready : STD_LOGIC;
    signal ap_ready_int : STD_LOGIC;
    signal stream_in_24_TDATA_blk_n : STD_LOGIC;
    signal stream_out_32_TDATA_blk_n : STD_LOGIC;
    signal empty_reg_122_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_state1_pp0_stage0_iter0 : BOOLEAN;
    signal trunc_ln232_fu_87_p1 : STD_LOGIC_VECTOR (15 downto 0);
    signal trunc_ln232_reg_127 : STD_LOGIC_VECTOR (15 downto 0);
    signal trunc_ln232_1_fu_110_p1 : STD_LOGIC_VECTOR (15 downto 0);
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_continue_int : STD_LOGIC;
    signal ap_done_int : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (1 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_start_int : STD_LOGIC;
    signal ap_loop_init : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component pixel_pack_flow_control_loop_pipe_sequential_init IS
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
    flow_control_loop_pipe_sequential_init_U : component pixel_pack_flow_control_loop_pipe_sequential_init
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => ap_start,
        ap_ready => ap_ready,
        ap_done => ap_done,
        ap_start_int => ap_start_int,
        ap_loop_init => ap_loop_init,
        ap_ready_int => ap_ready_int,
        ap_loop_exit_ready => ap_condition_exit_pp0_iter0_stage1,
        ap_loop_exit_done => ap_done_int,
        ap_continue_int => ap_continue_int,
        ap_done_int => ap_done_int);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
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
                elsif ((not(((stream_out_32_TREADY = ap_const_logic_0) or (stream_in_24_TVALID = ap_const_logic_0))) and (ap_loop_exit_ready = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;

    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((not(((stream_in_24_TVALID = ap_const_logic_0) or (ap_start_int = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                empty_reg_122_3 <= stream_in_24_TUSER;
                trunc_ln232_reg_127 <= trunc_ln232_fu_87_p1;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_CS_fsm, ap_CS_fsm_state1, ap_CS_fsm_state2, stream_in_24_TVALID, stream_out_32_TREADY, ap_start_int)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if ((not(((stream_in_24_TVALID = ap_const_logic_0) or (ap_start_int = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if ((not(((stream_out_32_TREADY = ap_const_logic_0) or (stream_in_24_TVALID = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state2;
                end if;
            when others =>  
                ap_NS_fsm <= "XX";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);

    ap_ST_fsm_state1_blk_assign_proc : process(stream_in_24_TVALID, ap_start_int)
    begin
        if (((stream_in_24_TVALID = ap_const_logic_0) or (ap_start_int = ap_const_logic_0))) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_ST_fsm_state2_blk_assign_proc : process(stream_in_24_TVALID, stream_out_32_TREADY)
    begin
        if (((stream_out_32_TREADY = ap_const_logic_0) or (stream_in_24_TVALID = ap_const_logic_0))) then 
            ap_ST_fsm_state2_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state2_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_block_state1_pp0_stage0_iter0_assign_proc : process(stream_in_24_TVALID, ap_start_int)
    begin
                ap_block_state1_pp0_stage0_iter0 <= ((stream_in_24_TVALID = ap_const_logic_0) or (ap_start_int = ap_const_logic_0));
    end process;


    ap_block_state2_pp0_stage1_iter0_assign_proc : process(stream_in_24_TVALID, stream_out_32_TREADY)
    begin
                ap_block_state2_pp0_stage1_iter0 <= ((stream_out_32_TREADY = ap_const_logic_0) or (stream_in_24_TVALID = ap_const_logic_0));
    end process;


    ap_condition_exit_pp0_iter0_stage1_assign_proc : process(ap_CS_fsm_state2, stream_in_24_TVALID, stream_out_32_TREADY, tmp_last_V_fu_98_p1)
    begin
        if ((not(((stream_out_32_TREADY = ap_const_logic_0) or (stream_in_24_TVALID = ap_const_logic_0))) and (tmp_last_V_fu_98_p1 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            ap_condition_exit_pp0_iter0_stage1 <= ap_const_logic_1;
        else 
            ap_condition_exit_pp0_iter0_stage1 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_int_assign_proc : process(ap_CS_fsm_state2, stream_in_24_TVALID, stream_out_32_TREADY, ap_loop_exit_ready, ap_done_reg)
    begin
        if ((not(((stream_out_32_TREADY = ap_const_logic_0) or (stream_in_24_TVALID = ap_const_logic_0))) and (ap_loop_exit_ready = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            ap_done_int <= ap_const_logic_1;
        else 
            ap_done_int <= ap_done_reg;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_CS_fsm_state1, ap_start_int)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start_int = ap_const_logic_0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;

    ap_loop_exit_ready <= ap_condition_exit_pp0_iter0_stage1;

    ap_ready_int_assign_proc : process(ap_CS_fsm_state2, stream_in_24_TVALID, stream_out_32_TREADY)
    begin
        if ((not(((stream_out_32_TREADY = ap_const_logic_0) or (stream_in_24_TVALID = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            ap_ready_int <= ap_const_logic_1;
        else 
            ap_ready_int <= ap_const_logic_0;
        end if; 
    end process;


    stream_in_24_TDATA_blk_n_assign_proc : process(ap_CS_fsm_state1, ap_CS_fsm_state2, stream_in_24_TVALID, ap_start_int)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) or ((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start_int = ap_const_logic_1)))) then 
            stream_in_24_TDATA_blk_n <= stream_in_24_TVALID;
        else 
            stream_in_24_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    stream_in_24_TREADY_assign_proc : process(ap_CS_fsm_state1, ap_CS_fsm_state2, stream_in_24_TVALID, stream_out_32_TREADY, ap_start_int)
    begin
        if (((not(((stream_out_32_TREADY = ap_const_logic_0) or (stream_in_24_TVALID = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state2)) or (not(((stream_in_24_TVALID = ap_const_logic_0) or (ap_start_int = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1)))) then 
            stream_in_24_TREADY <= ap_const_logic_1;
        else 
            stream_in_24_TREADY <= ap_const_logic_0;
        end if; 
    end process;

    stream_out_32_TDATA <= (trunc_ln232_1_fu_110_p1 & trunc_ln232_reg_127);

    stream_out_32_TDATA_blk_n_assign_proc : process(ap_CS_fsm_state2, stream_out_32_TREADY)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            stream_out_32_TDATA_blk_n <= stream_out_32_TREADY;
        else 
            stream_out_32_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    stream_out_32_TKEEP <= ap_const_lv4_0;
    stream_out_32_TLAST <= stream_in_24_TLAST;
    stream_out_32_TSTRB <= ap_const_lv4_0;
    stream_out_32_TUSER <= (stream_in_24_TUSER or empty_reg_122_3);

    stream_out_32_TVALID_assign_proc : process(ap_CS_fsm_state2, stream_in_24_TVALID, stream_out_32_TREADY)
    begin
        if ((not(((stream_out_32_TREADY = ap_const_logic_0) or (stream_in_24_TVALID = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            stream_out_32_TVALID <= ap_const_logic_1;
        else 
            stream_out_32_TVALID <= ap_const_logic_0;
        end if; 
    end process;

    tmp_last_V_fu_98_p1 <= stream_in_24_TLAST;
    trunc_ln232_1_fu_110_p1 <= stream_in_24_TDATA(16 - 1 downto 0);
    trunc_ln232_fu_87_p1 <= stream_in_24_TDATA(16 - 1 downto 0);
end behav;
