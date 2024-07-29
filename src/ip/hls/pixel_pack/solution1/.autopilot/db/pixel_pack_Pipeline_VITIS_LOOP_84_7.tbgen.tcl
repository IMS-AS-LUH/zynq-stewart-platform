set moduleName pixel_pack_Pipeline_VITIS_LOOP_84_7
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
set C_modelName {pixel_pack_Pipeline_VITIS_LOOP_84_7}
set C_modelType { void 0 }
set C_modelArgList {
	{ stream_in_24_V_data_V int 24 regular {axi_s 0 volatile  { stream_in_24 Data } }  }
	{ stream_in_24_V_keep_V int 3 regular {axi_s 0 volatile  { stream_in_24 Keep } }  }
	{ stream_in_24_V_strb_V int 3 regular {axi_s 0 volatile  { stream_in_24 Strb } }  }
	{ stream_in_24_V_user_V int 1 regular {axi_s 0 volatile  { stream_in_24 User } }  }
	{ stream_in_24_V_last_V int 1 regular {axi_s 0 volatile  { stream_in_24 Last } }  }
	{ stream_out_32_V_data_V int 32 regular {axi_s 1 volatile  { stream_out_32 Data } }  }
	{ stream_out_32_V_keep_V int 4 regular {axi_s 1 volatile  { stream_out_32 Keep } }  }
	{ stream_out_32_V_strb_V int 4 regular {axi_s 1 volatile  { stream_out_32 Strb } }  }
	{ stream_out_32_V_user_V int 1 regular {axi_s 1 volatile  { stream_out_32 User } }  }
	{ stream_out_32_V_last_V int 1 regular {axi_s 1 volatile  { stream_out_32 Last } }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "stream_in_24_V_data_V", "interface" : "axis", "bitwidth" : 24, "direction" : "READONLY"} , 
 	{ "Name" : "stream_in_24_V_keep_V", "interface" : "axis", "bitwidth" : 3, "direction" : "READONLY"} , 
 	{ "Name" : "stream_in_24_V_strb_V", "interface" : "axis", "bitwidth" : 3, "direction" : "READONLY"} , 
 	{ "Name" : "stream_in_24_V_user_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "stream_in_24_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "stream_out_32_V_data_V", "interface" : "axis", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "stream_out_32_V_keep_V", "interface" : "axis", "bitwidth" : 4, "direction" : "WRITEONLY"} , 
 	{ "Name" : "stream_out_32_V_strb_V", "interface" : "axis", "bitwidth" : 4, "direction" : "WRITEONLY"} , 
 	{ "Name" : "stream_out_32_V_user_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "stream_out_32_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 20
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ stream_in_24_TVALID sc_in sc_logic 1 invld 0 } 
	{ stream_out_32_TREADY sc_in sc_logic 1 outacc 5 } 
	{ stream_in_24_TDATA sc_in sc_lv 24 signal 0 } 
	{ stream_in_24_TREADY sc_out sc_logic 1 inacc 4 } 
	{ stream_in_24_TKEEP sc_in sc_lv 3 signal 1 } 
	{ stream_in_24_TSTRB sc_in sc_lv 3 signal 2 } 
	{ stream_in_24_TUSER sc_in sc_lv 1 signal 3 } 
	{ stream_in_24_TLAST sc_in sc_lv 1 signal 4 } 
	{ stream_out_32_TDATA sc_out sc_lv 32 signal 5 } 
	{ stream_out_32_TVALID sc_out sc_logic 1 outvld 9 } 
	{ stream_out_32_TKEEP sc_out sc_lv 4 signal 6 } 
	{ stream_out_32_TSTRB sc_out sc_lv 4 signal 7 } 
	{ stream_out_32_TUSER sc_out sc_lv 1 signal 8 } 
	{ stream_out_32_TLAST sc_out sc_lv 1 signal 9 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "stream_in_24_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "stream_in_24_V_data_V", "role": "default" }} , 
 	{ "name": "stream_out_32_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "stream_out_32_V_data_V", "role": "default" }} , 
 	{ "name": "stream_in_24_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "stream_in_24_V_data_V", "role": "default" }} , 
 	{ "name": "stream_in_24_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "stream_in_24_V_last_V", "role": "default" }} , 
 	{ "name": "stream_in_24_TKEEP", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "stream_in_24_V_keep_V", "role": "default" }} , 
 	{ "name": "stream_in_24_TSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "stream_in_24_V_strb_V", "role": "default" }} , 
 	{ "name": "stream_in_24_TUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "stream_in_24_V_user_V", "role": "default" }} , 
 	{ "name": "stream_in_24_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "stream_in_24_V_last_V", "role": "default" }} , 
 	{ "name": "stream_out_32_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "stream_out_32_V_data_V", "role": "default" }} , 
 	{ "name": "stream_out_32_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "stream_out_32_V_last_V", "role": "default" }} , 
 	{ "name": "stream_out_32_TKEEP", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "stream_out_32_V_keep_V", "role": "default" }} , 
 	{ "name": "stream_out_32_TSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "stream_out_32_V_strb_V", "role": "default" }} , 
 	{ "name": "stream_out_32_TUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "stream_out_32_V_user_V", "role": "default" }} , 
 	{ "name": "stream_out_32_TLAST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "stream_out_32_V_last_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "pixel_pack_Pipeline_VITIS_LOOP_84_7",
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
			{"Name" : "stream_in_24_V_data_V", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "stream_in_24_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "stream_in_24_V_keep_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "stream_in_24_V_strb_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "stream_in_24_V_user_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "stream_in_24_V_last_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "stream_out_32_V_data_V", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "stream_out_32_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "stream_out_32_V_keep_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "stream_out_32_V_strb_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "stream_out_32_V_user_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "stream_out_32_V_last_V", "Type" : "Axis", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_84_7", "PipelineType" : "NotSupport"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	pixel_pack_Pipeline_VITIS_LOOP_84_7 {
		stream_in_24_V_data_V {Type I LastRead 1 FirstWrite -1}
		stream_in_24_V_keep_V {Type I LastRead 1 FirstWrite -1}
		stream_in_24_V_strb_V {Type I LastRead 1 FirstWrite -1}
		stream_in_24_V_user_V {Type I LastRead 1 FirstWrite -1}
		stream_in_24_V_last_V {Type I LastRead 1 FirstWrite -1}
		stream_out_32_V_data_V {Type O LastRead -1 FirstWrite 1}
		stream_out_32_V_keep_V {Type O LastRead -1 FirstWrite 1}
		stream_out_32_V_strb_V {Type O LastRead -1 FirstWrite 1}
		stream_out_32_V_user_V {Type O LastRead -1 FirstWrite 1}
		stream_out_32_V_last_V {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	stream_in_24_V_data_V { axis {  { stream_in_24_TVALID in_vld 0 1 }  { stream_in_24_TDATA in_data 0 24 } } }
	stream_in_24_V_keep_V { axis {  { stream_in_24_TKEEP in_data 0 3 } } }
	stream_in_24_V_strb_V { axis {  { stream_in_24_TSTRB in_data 0 3 } } }
	stream_in_24_V_user_V { axis {  { stream_in_24_TUSER in_data 0 1 } } }
	stream_in_24_V_last_V { axis {  { stream_in_24_TREADY in_acc 1 1 }  { stream_in_24_TLAST in_data 0 1 } } }
	stream_out_32_V_data_V { axis {  { stream_out_32_TREADY out_acc 0 1 }  { stream_out_32_TDATA out_data 1 32 } } }
	stream_out_32_V_keep_V { axis {  { stream_out_32_TKEEP out_data 1 4 } } }
	stream_out_32_V_strb_V { axis {  { stream_out_32_TSTRB out_data 1 4 } } }
	stream_out_32_V_user_V { axis {  { stream_out_32_TUSER out_data 1 1 } } }
	stream_out_32_V_last_V { axis {  { stream_out_32_TVALID out_vld 1 1 }  { stream_out_32_TLAST out_data 1 1 } } }
}
set moduleName pixel_pack_Pipeline_VITIS_LOOP_84_7
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
set C_modelName {pixel_pack_Pipeline_VITIS_LOOP_84_7}
set C_modelType { void 0 }
set C_modelArgList {
	{ stream_in_24_V_data_V int 24 regular {axi_s 0 volatile  { stream_in_24 Data } }  }
	{ stream_in_24_V_keep_V int 3 regular {axi_s 0 volatile  { stream_in_24 Keep } }  }
	{ stream_in_24_V_strb_V int 3 regular {axi_s 0 volatile  { stream_in_24 Strb } }  }
	{ stream_in_24_V_user_V int 1 regular {axi_s 0 volatile  { stream_in_24 User } }  }
	{ stream_in_24_V_last_V int 1 regular {axi_s 0 volatile  { stream_in_24 Last } }  }
	{ stream_out_32_V_data_V int 32 regular {axi_s 1 volatile  { stream_out_32 Data } }  }
	{ stream_out_32_V_keep_V int 4 regular {axi_s 1 volatile  { stream_out_32 Keep } }  }
	{ stream_out_32_V_strb_V int 4 regular {axi_s 1 volatile  { stream_out_32 Strb } }  }
	{ stream_out_32_V_user_V int 1 regular {axi_s 1 volatile  { stream_out_32 User } }  }
	{ stream_out_32_V_last_V int 1 regular {axi_s 1 volatile  { stream_out_32 Last } }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "stream_in_24_V_data_V", "interface" : "axis", "bitwidth" : 24, "direction" : "READONLY"} , 
 	{ "Name" : "stream_in_24_V_keep_V", "interface" : "axis", "bitwidth" : 3, "direction" : "READONLY"} , 
 	{ "Name" : "stream_in_24_V_strb_V", "interface" : "axis", "bitwidth" : 3, "direction" : "READONLY"} , 
 	{ "Name" : "stream_in_24_V_user_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "stream_in_24_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "stream_out_32_V_data_V", "interface" : "axis", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "stream_out_32_V_keep_V", "interface" : "axis", "bitwidth" : 4, "direction" : "WRITEONLY"} , 
 	{ "Name" : "stream_out_32_V_strb_V", "interface" : "axis", "bitwidth" : 4, "direction" : "WRITEONLY"} , 
 	{ "Name" : "stream_out_32_V_user_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "stream_out_32_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 20
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ stream_in_24_TVALID sc_in sc_logic 1 invld 0 } 
	{ stream_out_32_TREADY sc_in sc_logic 1 outacc 5 } 
	{ stream_in_24_TDATA sc_in sc_lv 24 signal 0 } 
	{ stream_in_24_TREADY sc_out sc_logic 1 inacc 4 } 
	{ stream_in_24_TKEEP sc_in sc_lv 3 signal 1 } 
	{ stream_in_24_TSTRB sc_in sc_lv 3 signal 2 } 
	{ stream_in_24_TUSER sc_in sc_lv 1 signal 3 } 
	{ stream_in_24_TLAST sc_in sc_lv 1 signal 4 } 
	{ stream_out_32_TDATA sc_out sc_lv 32 signal 5 } 
	{ stream_out_32_TVALID sc_out sc_logic 1 outvld 9 } 
	{ stream_out_32_TKEEP sc_out sc_lv 4 signal 6 } 
	{ stream_out_32_TSTRB sc_out sc_lv 4 signal 7 } 
	{ stream_out_32_TUSER sc_out sc_lv 1 signal 8 } 
	{ stream_out_32_TLAST sc_out sc_lv 1 signal 9 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "stream_in_24_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "stream_in_24_V_data_V", "role": "default" }} , 
 	{ "name": "stream_out_32_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "stream_out_32_V_data_V", "role": "default" }} , 
 	{ "name": "stream_in_24_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "stream_in_24_V_data_V", "role": "default" }} , 
 	{ "name": "stream_in_24_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "stream_in_24_V_last_V", "role": "default" }} , 
 	{ "name": "stream_in_24_TKEEP", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "stream_in_24_V_keep_V", "role": "default" }} , 
 	{ "name": "stream_in_24_TSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "stream_in_24_V_strb_V", "role": "default" }} , 
 	{ "name": "stream_in_24_TUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "stream_in_24_V_user_V", "role": "default" }} , 
 	{ "name": "stream_in_24_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "stream_in_24_V_last_V", "role": "default" }} , 
 	{ "name": "stream_out_32_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "stream_out_32_V_data_V", "role": "default" }} , 
 	{ "name": "stream_out_32_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "stream_out_32_V_last_V", "role": "default" }} , 
 	{ "name": "stream_out_32_TKEEP", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "stream_out_32_V_keep_V", "role": "default" }} , 
 	{ "name": "stream_out_32_TSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "stream_out_32_V_strb_V", "role": "default" }} , 
 	{ "name": "stream_out_32_TUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "stream_out_32_V_user_V", "role": "default" }} , 
 	{ "name": "stream_out_32_TLAST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "stream_out_32_V_last_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "pixel_pack_Pipeline_VITIS_LOOP_84_7",
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
			{"Name" : "stream_in_24_V_data_V", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "stream_in_24_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "stream_in_24_V_keep_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "stream_in_24_V_strb_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "stream_in_24_V_user_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "stream_in_24_V_last_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "stream_out_32_V_data_V", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "stream_out_32_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "stream_out_32_V_keep_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "stream_out_32_V_strb_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "stream_out_32_V_user_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "stream_out_32_V_last_V", "Type" : "Axis", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_84_7", "PipelineType" : "NotSupport"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	pixel_pack_Pipeline_VITIS_LOOP_84_7 {
		stream_in_24_V_data_V {Type I LastRead 1 FirstWrite -1}
		stream_in_24_V_keep_V {Type I LastRead 1 FirstWrite -1}
		stream_in_24_V_strb_V {Type I LastRead 1 FirstWrite -1}
		stream_in_24_V_user_V {Type I LastRead 1 FirstWrite -1}
		stream_in_24_V_last_V {Type I LastRead 1 FirstWrite -1}
		stream_out_32_V_data_V {Type O LastRead -1 FirstWrite 1}
		stream_out_32_V_keep_V {Type O LastRead -1 FirstWrite 1}
		stream_out_32_V_strb_V {Type O LastRead -1 FirstWrite 1}
		stream_out_32_V_user_V {Type O LastRead -1 FirstWrite 1}
		stream_out_32_V_last_V {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	stream_in_24_V_data_V { axis {  { stream_in_24_TVALID in_vld 0 1 }  { stream_in_24_TDATA in_data 0 24 } } }
	stream_in_24_V_keep_V { axis {  { stream_in_24_TKEEP in_data 0 3 } } }
	stream_in_24_V_strb_V { axis {  { stream_in_24_TSTRB in_data 0 3 } } }
	stream_in_24_V_user_V { axis {  { stream_in_24_TUSER in_data 0 1 } } }
	stream_in_24_V_last_V { axis {  { stream_in_24_TREADY in_acc 1 1 }  { stream_in_24_TLAST in_data 0 1 } } }
	stream_out_32_V_data_V { axis {  { stream_out_32_TREADY out_acc 0 1 }  { stream_out_32_TDATA out_data 1 32 } } }
	stream_out_32_V_keep_V { axis {  { stream_out_32_TKEEP out_data 1 4 } } }
	stream_out_32_V_strb_V { axis {  { stream_out_32_TSTRB out_data 1 4 } } }
	stream_out_32_V_user_V { axis {  { stream_out_32_TUSER out_data 1 1 } } }
	stream_out_32_V_last_V { axis {  { stream_out_32_TVALID out_vld 1 1 }  { stream_out_32_TLAST out_data 1 1 } } }
}
