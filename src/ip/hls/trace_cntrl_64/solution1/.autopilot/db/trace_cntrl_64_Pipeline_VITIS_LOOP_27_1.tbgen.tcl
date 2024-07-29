set moduleName trace_cntrl_64_Pipeline_VITIS_LOOP_27_1
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {trace_cntrl_64_Pipeline_VITIS_LOOP_27_1}
set C_modelType { void 0 }
set C_modelArgList {
	{ length_r int 32 regular  }
	{ sub int 32 regular  }
	{ capture_64_V_data_V int 64 regular {axi_s 1 volatile  { capture_64 Data } }  }
	{ capture_64_V_keep_V int 8 regular {axi_s 1 volatile  { capture_64 Keep } }  }
	{ capture_64_V_strb_V int 8 regular {axi_s 1 volatile  { capture_64 Strb } }  }
	{ capture_64_V_user_V int 1 regular {axi_s 1 volatile  { capture_64 User } }  }
	{ capture_64_V_last_V int 1 regular {axi_s 1 volatile  { capture_64 Last } }  }
	{ capture_64_V_id_V int 1 regular {axi_s 1 volatile  { capture_64 ID } }  }
	{ capture_64_V_dest_V int 1 regular {axi_s 1 volatile  { capture_64 Dest } }  }
	{ trace_64_V_data_V int 64 regular {axi_s 0 volatile  { trace_64 Data } }  }
	{ trace_64_V_keep_V int 8 regular {axi_s 0 volatile  { trace_64 Keep } }  }
	{ trace_64_V_strb_V int 8 regular {axi_s 0 volatile  { trace_64 Strb } }  }
	{ trace_64_V_user_V int 1 regular {axi_s 0 volatile  { trace_64 User } }  }
	{ trace_64_V_last_V int 1 regular {axi_s 0 volatile  { trace_64 Last } }  }
	{ trace_64_V_id_V int 1 regular {axi_s 0 volatile  { trace_64 ID } }  }
	{ trace_64_V_dest_V int 1 regular {axi_s 0 volatile  { trace_64 Dest } }  }
	{ conv_i int 32 regular  }
}
set C_modelArgMapList {[ 
	{ "Name" : "length_r", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "sub", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "capture_64_V_data_V", "interface" : "axis", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "capture_64_V_keep_V", "interface" : "axis", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "capture_64_V_strb_V", "interface" : "axis", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "capture_64_V_user_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "capture_64_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "capture_64_V_id_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "capture_64_V_dest_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "trace_64_V_data_V", "interface" : "axis", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "trace_64_V_keep_V", "interface" : "axis", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "trace_64_V_strb_V", "interface" : "axis", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "trace_64_V_user_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "trace_64_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "trace_64_V_id_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "trace_64_V_dest_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "conv_i", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 27
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ trace_64_TVALID sc_in sc_logic 1 invld 9 } 
	{ capture_64_TREADY sc_in sc_logic 1 outacc 2 } 
	{ length_r sc_in sc_lv 32 signal 0 } 
	{ sub sc_in sc_lv 32 signal 1 } 
	{ capture_64_TDATA sc_out sc_lv 64 signal 2 } 
	{ capture_64_TVALID sc_out sc_logic 1 outvld 8 } 
	{ capture_64_TKEEP sc_out sc_lv 8 signal 3 } 
	{ capture_64_TSTRB sc_out sc_lv 8 signal 4 } 
	{ capture_64_TUSER sc_out sc_lv 1 signal 5 } 
	{ capture_64_TLAST sc_out sc_lv 1 signal 6 } 
	{ capture_64_TID sc_out sc_lv 1 signal 7 } 
	{ capture_64_TDEST sc_out sc_lv 1 signal 8 } 
	{ trace_64_TDATA sc_in sc_lv 64 signal 9 } 
	{ trace_64_TREADY sc_out sc_logic 1 inacc 15 } 
	{ trace_64_TKEEP sc_in sc_lv 8 signal 10 } 
	{ trace_64_TSTRB sc_in sc_lv 8 signal 11 } 
	{ trace_64_TUSER sc_in sc_lv 1 signal 12 } 
	{ trace_64_TLAST sc_in sc_lv 1 signal 13 } 
	{ trace_64_TID sc_in sc_lv 1 signal 14 } 
	{ trace_64_TDEST sc_in sc_lv 1 signal 15 } 
	{ conv_i sc_in sc_lv 32 signal 16 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "trace_64_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "trace_64_V_data_V", "role": "default" }} , 
 	{ "name": "capture_64_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "capture_64_V_data_V", "role": "default" }} , 
 	{ "name": "length_r", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "length_r", "role": "default" }} , 
 	{ "name": "sub", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "sub", "role": "default" }} , 
 	{ "name": "capture_64_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "capture_64_V_data_V", "role": "default" }} , 
 	{ "name": "capture_64_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "capture_64_V_dest_V", "role": "default" }} , 
 	{ "name": "capture_64_TKEEP", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "capture_64_V_keep_V", "role": "default" }} , 
 	{ "name": "capture_64_TSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "capture_64_V_strb_V", "role": "default" }} , 
 	{ "name": "capture_64_TUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "capture_64_V_user_V", "role": "default" }} , 
 	{ "name": "capture_64_TLAST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "capture_64_V_last_V", "role": "default" }} , 
 	{ "name": "capture_64_TID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "capture_64_V_id_V", "role": "default" }} , 
 	{ "name": "capture_64_TDEST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "capture_64_V_dest_V", "role": "default" }} , 
 	{ "name": "trace_64_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "trace_64_V_data_V", "role": "default" }} , 
 	{ "name": "trace_64_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "trace_64_V_dest_V", "role": "default" }} , 
 	{ "name": "trace_64_TKEEP", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "trace_64_V_keep_V", "role": "default" }} , 
 	{ "name": "trace_64_TSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "trace_64_V_strb_V", "role": "default" }} , 
 	{ "name": "trace_64_TUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "trace_64_V_user_V", "role": "default" }} , 
 	{ "name": "trace_64_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "trace_64_V_last_V", "role": "default" }} , 
 	{ "name": "trace_64_TID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "trace_64_V_id_V", "role": "default" }} , 
 	{ "name": "trace_64_TDEST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "trace_64_V_dest_V", "role": "default" }} , 
 	{ "name": "conv_i", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "conv_i", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "trace_cntrl_64_Pipeline_VITIS_LOOP_27_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "length_r", "Type" : "None", "Direction" : "I"},
			{"Name" : "sub", "Type" : "None", "Direction" : "I"},
			{"Name" : "capture_64_V_data_V", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "capture_64_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "capture_64_V_keep_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "capture_64_V_strb_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "capture_64_V_user_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "capture_64_V_last_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "capture_64_V_id_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "capture_64_V_dest_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "trace_64_V_data_V", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "trace_64_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "trace_64_V_keep_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "trace_64_V_strb_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "trace_64_V_user_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "trace_64_V_last_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "trace_64_V_id_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "trace_64_V_dest_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "conv_i", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_27_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	trace_cntrl_64_Pipeline_VITIS_LOOP_27_1 {
		length_r {Type I LastRead 0 FirstWrite -1}
		sub {Type I LastRead 0 FirstWrite -1}
		capture_64_V_data_V {Type O LastRead -1 FirstWrite 1}
		capture_64_V_keep_V {Type O LastRead -1 FirstWrite 1}
		capture_64_V_strb_V {Type O LastRead -1 FirstWrite 1}
		capture_64_V_user_V {Type O LastRead -1 FirstWrite 1}
		capture_64_V_last_V {Type O LastRead -1 FirstWrite 1}
		capture_64_V_id_V {Type O LastRead -1 FirstWrite 1}
		capture_64_V_dest_V {Type O LastRead -1 FirstWrite 1}
		trace_64_V_data_V {Type I LastRead 0 FirstWrite -1}
		trace_64_V_keep_V {Type I LastRead 0 FirstWrite -1}
		trace_64_V_strb_V {Type I LastRead 0 FirstWrite -1}
		trace_64_V_user_V {Type I LastRead 0 FirstWrite -1}
		trace_64_V_last_V {Type I LastRead 0 FirstWrite -1}
		trace_64_V_id_V {Type I LastRead 0 FirstWrite -1}
		trace_64_V_dest_V {Type I LastRead 0 FirstWrite -1}
		conv_i {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	length_r { ap_none {  { length_r in_data 0 32 } } }
	sub { ap_none {  { sub in_data 0 32 } } }
	capture_64_V_data_V { axis {  { capture_64_TREADY out_acc 0 1 }  { capture_64_TDATA out_data 1 64 } } }
	capture_64_V_keep_V { axis {  { capture_64_TKEEP out_data 1 8 } } }
	capture_64_V_strb_V { axis {  { capture_64_TSTRB out_data 1 8 } } }
	capture_64_V_user_V { axis {  { capture_64_TUSER out_data 1 1 } } }
	capture_64_V_last_V { axis {  { capture_64_TLAST out_data 1 1 } } }
	capture_64_V_id_V { axis {  { capture_64_TID out_data 1 1 } } }
	capture_64_V_dest_V { axis {  { capture_64_TVALID out_vld 1 1 }  { capture_64_TDEST out_data 1 1 } } }
	trace_64_V_data_V { axis {  { trace_64_TVALID in_vld 0 1 }  { trace_64_TDATA in_data 0 64 } } }
	trace_64_V_keep_V { axis {  { trace_64_TKEEP in_data 0 8 } } }
	trace_64_V_strb_V { axis {  { trace_64_TSTRB in_data 0 8 } } }
	trace_64_V_user_V { axis {  { trace_64_TUSER in_data 0 1 } } }
	trace_64_V_last_V { axis {  { trace_64_TLAST in_data 0 1 } } }
	trace_64_V_id_V { axis {  { trace_64_TID in_data 0 1 } } }
	trace_64_V_dest_V { axis {  { trace_64_TREADY in_acc 1 1 }  { trace_64_TDEST in_data 0 1 } } }
	conv_i { ap_none {  { conv_i in_data 0 32 } } }
}
set moduleName trace_cntrl_64_Pipeline_VITIS_LOOP_27_1
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set C_modelName {trace_cntrl_64_Pipeline_VITIS_LOOP_27_1}
set C_modelType { void 0 }
set C_modelArgList {
	{ length_r int 32 regular  }
	{ sub int 32 regular  }
	{ capture_64_V_data_V int 64 regular {axi_s 1 volatile  { capture_64 Data } }  }
	{ capture_64_V_keep_V int 8 regular {axi_s 1 volatile  { capture_64 Keep } }  }
	{ capture_64_V_strb_V int 8 regular {axi_s 1 volatile  { capture_64 Strb } }  }
	{ capture_64_V_user_V int 1 regular {axi_s 1 volatile  { capture_64 User } }  }
	{ capture_64_V_last_V int 1 regular {axi_s 1 volatile  { capture_64 Last } }  }
	{ capture_64_V_id_V int 1 regular {axi_s 1 volatile  { capture_64 ID } }  }
	{ capture_64_V_dest_V int 1 regular {axi_s 1 volatile  { capture_64 Dest } }  }
	{ trace_64_V_data_V int 64 regular {axi_s 0 volatile  { trace_64 Data } }  }
	{ trace_64_V_keep_V int 8 regular {axi_s 0 volatile  { trace_64 Keep } }  }
	{ trace_64_V_strb_V int 8 regular {axi_s 0 volatile  { trace_64 Strb } }  }
	{ trace_64_V_user_V int 1 regular {axi_s 0 volatile  { trace_64 User } }  }
	{ trace_64_V_last_V int 1 regular {axi_s 0 volatile  { trace_64 Last } }  }
	{ trace_64_V_id_V int 1 regular {axi_s 0 volatile  { trace_64 ID } }  }
	{ trace_64_V_dest_V int 1 regular {axi_s 0 volatile  { trace_64 Dest } }  }
	{ conv_i int 32 regular  }
}
set C_modelArgMapList {[ 
	{ "Name" : "length_r", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "sub", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "capture_64_V_data_V", "interface" : "axis", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "capture_64_V_keep_V", "interface" : "axis", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "capture_64_V_strb_V", "interface" : "axis", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "capture_64_V_user_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "capture_64_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "capture_64_V_id_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "capture_64_V_dest_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "trace_64_V_data_V", "interface" : "axis", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "trace_64_V_keep_V", "interface" : "axis", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "trace_64_V_strb_V", "interface" : "axis", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "trace_64_V_user_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "trace_64_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "trace_64_V_id_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "trace_64_V_dest_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "conv_i", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 27
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ trace_64_TVALID sc_in sc_logic 1 invld 9 } 
	{ capture_64_TREADY sc_in sc_logic 1 outacc 2 } 
	{ length_r sc_in sc_lv 32 signal 0 } 
	{ sub sc_in sc_lv 32 signal 1 } 
	{ capture_64_TDATA sc_out sc_lv 64 signal 2 } 
	{ capture_64_TVALID sc_out sc_logic 1 outvld 8 } 
	{ capture_64_TKEEP sc_out sc_lv 8 signal 3 } 
	{ capture_64_TSTRB sc_out sc_lv 8 signal 4 } 
	{ capture_64_TUSER sc_out sc_lv 1 signal 5 } 
	{ capture_64_TLAST sc_out sc_lv 1 signal 6 } 
	{ capture_64_TID sc_out sc_lv 1 signal 7 } 
	{ capture_64_TDEST sc_out sc_lv 1 signal 8 } 
	{ trace_64_TDATA sc_in sc_lv 64 signal 9 } 
	{ trace_64_TREADY sc_out sc_logic 1 inacc 15 } 
	{ trace_64_TKEEP sc_in sc_lv 8 signal 10 } 
	{ trace_64_TSTRB sc_in sc_lv 8 signal 11 } 
	{ trace_64_TUSER sc_in sc_lv 1 signal 12 } 
	{ trace_64_TLAST sc_in sc_lv 1 signal 13 } 
	{ trace_64_TID sc_in sc_lv 1 signal 14 } 
	{ trace_64_TDEST sc_in sc_lv 1 signal 15 } 
	{ conv_i sc_in sc_lv 32 signal 16 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "trace_64_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "trace_64_V_data_V", "role": "default" }} , 
 	{ "name": "capture_64_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "capture_64_V_data_V", "role": "default" }} , 
 	{ "name": "length_r", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "length_r", "role": "default" }} , 
 	{ "name": "sub", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "sub", "role": "default" }} , 
 	{ "name": "capture_64_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "capture_64_V_data_V", "role": "default" }} , 
 	{ "name": "capture_64_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "capture_64_V_dest_V", "role": "default" }} , 
 	{ "name": "capture_64_TKEEP", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "capture_64_V_keep_V", "role": "default" }} , 
 	{ "name": "capture_64_TSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "capture_64_V_strb_V", "role": "default" }} , 
 	{ "name": "capture_64_TUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "capture_64_V_user_V", "role": "default" }} , 
 	{ "name": "capture_64_TLAST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "capture_64_V_last_V", "role": "default" }} , 
 	{ "name": "capture_64_TID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "capture_64_V_id_V", "role": "default" }} , 
 	{ "name": "capture_64_TDEST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "capture_64_V_dest_V", "role": "default" }} , 
 	{ "name": "trace_64_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "trace_64_V_data_V", "role": "default" }} , 
 	{ "name": "trace_64_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "trace_64_V_dest_V", "role": "default" }} , 
 	{ "name": "trace_64_TKEEP", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "trace_64_V_keep_V", "role": "default" }} , 
 	{ "name": "trace_64_TSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "trace_64_V_strb_V", "role": "default" }} , 
 	{ "name": "trace_64_TUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "trace_64_V_user_V", "role": "default" }} , 
 	{ "name": "trace_64_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "trace_64_V_last_V", "role": "default" }} , 
 	{ "name": "trace_64_TID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "trace_64_V_id_V", "role": "default" }} , 
 	{ "name": "trace_64_TDEST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "trace_64_V_dest_V", "role": "default" }} , 
 	{ "name": "conv_i", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "conv_i", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "trace_cntrl_64_Pipeline_VITIS_LOOP_27_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "length_r", "Type" : "None", "Direction" : "I"},
			{"Name" : "sub", "Type" : "None", "Direction" : "I"},
			{"Name" : "capture_64_V_data_V", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "capture_64_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "capture_64_V_keep_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "capture_64_V_strb_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "capture_64_V_user_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "capture_64_V_last_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "capture_64_V_id_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "capture_64_V_dest_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "trace_64_V_data_V", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "trace_64_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "trace_64_V_keep_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "trace_64_V_strb_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "trace_64_V_user_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "trace_64_V_last_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "trace_64_V_id_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "trace_64_V_dest_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "conv_i", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_27_1", "PipelineType" : "NotSupport"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	trace_cntrl_64_Pipeline_VITIS_LOOP_27_1 {
		length_r {Type I LastRead 0 FirstWrite -1}
		sub {Type I LastRead 0 FirstWrite -1}
		capture_64_V_data_V {Type O LastRead -1 FirstWrite 1}
		capture_64_V_keep_V {Type O LastRead -1 FirstWrite 1}
		capture_64_V_strb_V {Type O LastRead -1 FirstWrite 1}
		capture_64_V_user_V {Type O LastRead -1 FirstWrite 1}
		capture_64_V_last_V {Type O LastRead -1 FirstWrite 1}
		capture_64_V_id_V {Type O LastRead -1 FirstWrite 1}
		capture_64_V_dest_V {Type O LastRead -1 FirstWrite 1}
		trace_64_V_data_V {Type I LastRead 0 FirstWrite -1}
		trace_64_V_keep_V {Type I LastRead 0 FirstWrite -1}
		trace_64_V_strb_V {Type I LastRead 0 FirstWrite -1}
		trace_64_V_user_V {Type I LastRead 0 FirstWrite -1}
		trace_64_V_last_V {Type I LastRead 0 FirstWrite -1}
		trace_64_V_id_V {Type I LastRead 0 FirstWrite -1}
		trace_64_V_dest_V {Type I LastRead 0 FirstWrite -1}
		conv_i {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	length_r { ap_none {  { length_r in_data 0 32 } } }
	sub { ap_none {  { sub in_data 0 32 } } }
	capture_64_V_data_V { axis {  { capture_64_TREADY out_acc 0 1 }  { capture_64_TDATA out_data 1 64 } } }
	capture_64_V_keep_V { axis {  { capture_64_TKEEP out_data 1 8 } } }
	capture_64_V_strb_V { axis {  { capture_64_TSTRB out_data 1 8 } } }
	capture_64_V_user_V { axis {  { capture_64_TUSER out_data 1 1 } } }
	capture_64_V_last_V { axis {  { capture_64_TLAST out_data 1 1 } } }
	capture_64_V_id_V { axis {  { capture_64_TID out_data 1 1 } } }
	capture_64_V_dest_V { axis {  { capture_64_TVALID out_vld 1 1 }  { capture_64_TDEST out_data 1 1 } } }
	trace_64_V_data_V { axis {  { trace_64_TVALID in_vld 0 1 }  { trace_64_TDATA in_data 0 64 } } }
	trace_64_V_keep_V { axis {  { trace_64_TKEEP in_data 0 8 } } }
	trace_64_V_strb_V { axis {  { trace_64_TSTRB in_data 0 8 } } }
	trace_64_V_user_V { axis {  { trace_64_TUSER in_data 0 1 } } }
	trace_64_V_last_V { axis {  { trace_64_TLAST in_data 0 1 } } }
	trace_64_V_id_V { axis {  { trace_64_TID in_data 0 1 } } }
	trace_64_V_dest_V { axis {  { trace_64_TREADY in_acc 1 1 }  { trace_64_TDEST in_data 0 1 } } }
	conv_i { ap_none {  { conv_i in_data 0 32 } } }
}
