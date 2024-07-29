set moduleName color_convert
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type function
set FunctionProtocol ap_ctrl_none
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {color_convert}
set C_modelType { void 0 }
set C_modelArgList {
	{ stream_in_24_V_data_V int 24 regular {axi_s 0 volatile  { stream_in_24 Data } }  }
	{ stream_in_24_V_keep_V int 3 regular {axi_s 0 volatile  { stream_in_24 Keep } }  }
	{ stream_in_24_V_strb_V int 3 regular {axi_s 0 volatile  { stream_in_24 Strb } }  }
	{ stream_in_24_V_user_V int 1 regular {axi_s 0 volatile  { stream_in_24 User } }  }
	{ stream_in_24_V_last_V int 1 regular {axi_s 0 volatile  { stream_in_24 Last } }  }
	{ stream_out_24_V_data_V int 24 regular {axi_s 1 volatile  { stream_out_24 Data } }  }
	{ stream_out_24_V_keep_V int 3 regular {axi_s 1 volatile  { stream_out_24 Keep } }  }
	{ stream_out_24_V_strb_V int 3 regular {axi_s 1 volatile  { stream_out_24 Strb } }  }
	{ stream_out_24_V_user_V int 1 regular {axi_s 1 volatile  { stream_out_24 User } }  }
	{ stream_out_24_V_last_V int 1 regular {axi_s 1 volatile  { stream_out_24 Last } }  }
	{ c1_c1 int 10 regular {axi_slave 0}  }
	{ c1_c2 int 10 regular {axi_slave 0}  }
	{ c1_c3 int 10 regular {axi_slave 0}  }
	{ c2_c1 int 10 regular {axi_slave 0}  }
	{ c2_c2 int 10 regular {axi_slave 0}  }
	{ c2_c3 int 10 regular {axi_slave 0}  }
	{ c3_c1 int 10 regular {axi_slave 0}  }
	{ c3_c2 int 10 regular {axi_slave 0}  }
	{ c3_c3 int 10 regular {axi_slave 0}  }
	{ bias_c1 int 10 regular {axi_slave 0}  }
	{ bias_c2 int 10 regular {axi_slave 0}  }
	{ bias_c3 int 10 regular {axi_slave 0}  }
	{ ap_local_deadlock int 1 unused {axi_slave 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "stream_in_24_V_data_V", "interface" : "axis", "bitwidth" : 24, "direction" : "READONLY"} , 
 	{ "Name" : "stream_in_24_V_keep_V", "interface" : "axis", "bitwidth" : 3, "direction" : "READONLY"} , 
 	{ "Name" : "stream_in_24_V_strb_V", "interface" : "axis", "bitwidth" : 3, "direction" : "READONLY"} , 
 	{ "Name" : "stream_in_24_V_user_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "stream_in_24_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "stream_out_24_V_data_V", "interface" : "axis", "bitwidth" : 24, "direction" : "WRITEONLY"} , 
 	{ "Name" : "stream_out_24_V_keep_V", "interface" : "axis", "bitwidth" : 3, "direction" : "WRITEONLY"} , 
 	{ "Name" : "stream_out_24_V_strb_V", "interface" : "axis", "bitwidth" : 3, "direction" : "WRITEONLY"} , 
 	{ "Name" : "stream_out_24_V_user_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "stream_out_24_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "c1_c1", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 10, "direction" : "READONLY", "offset" : {"in":16}, "offset_end" : {"in":23}} , 
 	{ "Name" : "c1_c2", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 10, "direction" : "READONLY", "offset" : {"in":24}, "offset_end" : {"in":31}} , 
 	{ "Name" : "c1_c3", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 10, "direction" : "READONLY", "offset" : {"in":32}, "offset_end" : {"in":39}} , 
 	{ "Name" : "c2_c1", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 10, "direction" : "READONLY", "offset" : {"in":40}, "offset_end" : {"in":47}} , 
 	{ "Name" : "c2_c2", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 10, "direction" : "READONLY", "offset" : {"in":48}, "offset_end" : {"in":55}} , 
 	{ "Name" : "c2_c3", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 10, "direction" : "READONLY", "offset" : {"in":56}, "offset_end" : {"in":63}} , 
 	{ "Name" : "c3_c1", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 10, "direction" : "READONLY", "offset" : {"in":64}, "offset_end" : {"in":71}} , 
 	{ "Name" : "c3_c2", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 10, "direction" : "READONLY", "offset" : {"in":72}, "offset_end" : {"in":79}} , 
 	{ "Name" : "c3_c3", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 10, "direction" : "READONLY", "offset" : {"in":80}, "offset_end" : {"in":87}} , 
 	{ "Name" : "bias_c1", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 10, "direction" : "READONLY", "offset" : {"in":88}, "offset_end" : {"in":95}} , 
 	{ "Name" : "bias_c2", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 10, "direction" : "READONLY", "offset" : {"in":96}, "offset_end" : {"in":103}} , 
 	{ "Name" : "bias_c3", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 10, "direction" : "READONLY", "offset" : {"in":104}, "offset_end" : {"in":111}} , 
 	{ "Name" : "ap_local_deadlock", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 1, "direction" : "WRITEONLY", "offset" : {"out":0}, "offset_end" : {"out":4294967295}} ]}
# RTL Port declarations: 
set portNum 34
set portList { 
	{ ap_local_block sc_out sc_logic 1 signal -1 } 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ stream_in_24_TDATA sc_in sc_lv 24 signal 0 } 
	{ stream_in_24_TVALID sc_in sc_logic 1 invld 4 } 
	{ stream_in_24_TREADY sc_out sc_logic 1 inacc 4 } 
	{ stream_in_24_TKEEP sc_in sc_lv 3 signal 1 } 
	{ stream_in_24_TSTRB sc_in sc_lv 3 signal 2 } 
	{ stream_in_24_TUSER sc_in sc_lv 1 signal 3 } 
	{ stream_in_24_TLAST sc_in sc_lv 1 signal 4 } 
	{ stream_out_24_TDATA sc_out sc_lv 24 signal 5 } 
	{ stream_out_24_TVALID sc_out sc_logic 1 outvld 9 } 
	{ stream_out_24_TREADY sc_in sc_logic 1 outacc 9 } 
	{ stream_out_24_TKEEP sc_out sc_lv 3 signal 6 } 
	{ stream_out_24_TSTRB sc_out sc_lv 3 signal 7 } 
	{ stream_out_24_TUSER sc_out sc_lv 1 signal 8 } 
	{ stream_out_24_TLAST sc_out sc_lv 1 signal 9 } 
	{ s_axi_control_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_AWADDR sc_in sc_lv 7 signal -1 } 
	{ s_axi_control_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_control_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_ARADDR sc_in sc_lv 7 signal -1 } 
	{ s_axi_control_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_control_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_control_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_BRESP sc_out sc_lv 2 signal -1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_control_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "control", "role": "AWADDR" },"address":[{"name":"c1_c1","role":"data","value":"16"},{"name":"c1_c2","role":"data","value":"24"},{"name":"c1_c3","role":"data","value":"32"},{"name":"c2_c1","role":"data","value":"40"},{"name":"c2_c2","role":"data","value":"48"},{"name":"c2_c3","role":"data","value":"56"},{"name":"c3_c1","role":"data","value":"64"},{"name":"c3_c2","role":"data","value":"72"},{"name":"c3_c3","role":"data","value":"80"},{"name":"bias_c1","role":"data","value":"88"},{"name":"bias_c2","role":"data","value":"96"},{"name":"bias_c3","role":"data","value":"104"}] },
	{ "name": "s_axi_control_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWVALID" } },
	{ "name": "s_axi_control_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWREADY" } },
	{ "name": "s_axi_control_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WVALID" } },
	{ "name": "s_axi_control_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WREADY" } },
	{ "name": "s_axi_control_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "WDATA" } },
	{ "name": "s_axi_control_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "WSTRB" } },
	{ "name": "s_axi_control_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "control", "role": "ARADDR" },"address":[{"name":"ap_local_deadlock","role":"data","value":"0"}] },
	{ "name": "s_axi_control_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARVALID" } },
	{ "name": "s_axi_control_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARREADY" } },
	{ "name": "s_axi_control_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RVALID" } },
	{ "name": "s_axi_control_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RREADY" } },
	{ "name": "s_axi_control_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "RDATA" } },
	{ "name": "s_axi_control_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "RRESP" } },
	{ "name": "s_axi_control_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BVALID" } },
	{ "name": "s_axi_control_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BREADY" } },
	{ "name": "s_axi_control_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "BRESP" } }, 
 	{ "name": "ap_local_block", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_local_block", "role": "default" }} , 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "stream_in_24_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "stream_in_24_V_data_V", "role": "default" }} , 
 	{ "name": "stream_in_24_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "stream_in_24_V_last_V", "role": "default" }} , 
 	{ "name": "stream_in_24_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "stream_in_24_V_last_V", "role": "default" }} , 
 	{ "name": "stream_in_24_TKEEP", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "stream_in_24_V_keep_V", "role": "default" }} , 
 	{ "name": "stream_in_24_TSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "stream_in_24_V_strb_V", "role": "default" }} , 
 	{ "name": "stream_in_24_TUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "stream_in_24_V_user_V", "role": "default" }} , 
 	{ "name": "stream_in_24_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "stream_in_24_V_last_V", "role": "default" }} , 
 	{ "name": "stream_out_24_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "stream_out_24_V_data_V", "role": "default" }} , 
 	{ "name": "stream_out_24_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "stream_out_24_V_last_V", "role": "default" }} , 
 	{ "name": "stream_out_24_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "stream_out_24_V_last_V", "role": "default" }} , 
 	{ "name": "stream_out_24_TKEEP", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "stream_out_24_V_keep_V", "role": "default" }} , 
 	{ "name": "stream_out_24_TSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "stream_out_24_V_strb_V", "role": "default" }} , 
 	{ "name": "stream_out_24_TUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "stream_out_24_V_user_V", "role": "default" }} , 
 	{ "name": "stream_out_24_TLAST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "stream_out_24_V_last_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20"],
		"CDFG" : "color_convert",
		"Protocol" : "ap_ctrl_none",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "6", "EstimateLatencyMin" : "6", "EstimateLatencyMax" : "6",
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
			{"Name" : "stream_out_24_V_data_V", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "stream_out_24_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "stream_out_24_V_keep_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "stream_out_24_V_strb_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "stream_out_24_V_user_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "stream_out_24_V_last_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "c1_c1", "Type" : "None", "Direction" : "I"},
			{"Name" : "c1_c2", "Type" : "None", "Direction" : "I"},
			{"Name" : "c1_c3", "Type" : "None", "Direction" : "I"},
			{"Name" : "c2_c1", "Type" : "None", "Direction" : "I"},
			{"Name" : "c2_c2", "Type" : "None", "Direction" : "I"},
			{"Name" : "c2_c3", "Type" : "None", "Direction" : "I"},
			{"Name" : "c3_c1", "Type" : "None", "Direction" : "I"},
			{"Name" : "c3_c2", "Type" : "None", "Direction" : "I"},
			{"Name" : "c3_c3", "Type" : "None", "Direction" : "I"},
			{"Name" : "bias_c1", "Type" : "None", "Direction" : "I"},
			{"Name" : "bias_c2", "Type" : "None", "Direction" : "I"},
			{"Name" : "bias_c3", "Type" : "None", "Direction" : "I"},
			{"Name" : "ap_local_deadlock", "Type" : "None", "Direction" : "O"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.control_s_axi_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_10s_8ns_18_1_1_U1", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_10s_8ns_18_1_1_U2", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_10s_8ns_18_1_1_U3", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_10s_8ns_18_1_1_U4", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_10s_8ns_18_1_1_U5", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_10s_8ns_18_1_1_U6", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_10s_8ns_18_1_1_U7", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_10s_8ns_18_1_1_U8", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_10s_8ns_18_1_1_U9", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_stream_in_24_V_data_V_U", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_stream_in_24_V_keep_V_U", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_stream_in_24_V_strb_V_U", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_stream_in_24_V_user_V_U", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_stream_in_24_V_last_V_U", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_stream_out_24_V_data_V_U", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_stream_out_24_V_keep_V_U", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_stream_out_24_V_strb_V_U", "Parent" : "0"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_stream_out_24_V_user_V_U", "Parent" : "0"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_stream_out_24_V_last_V_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	color_convert {
		stream_in_24_V_data_V {Type I LastRead 0 FirstWrite -1}
		stream_in_24_V_keep_V {Type I LastRead 0 FirstWrite -1}
		stream_in_24_V_strb_V {Type I LastRead 0 FirstWrite -1}
		stream_in_24_V_user_V {Type I LastRead 0 FirstWrite -1}
		stream_in_24_V_last_V {Type I LastRead 0 FirstWrite -1}
		stream_out_24_V_data_V {Type O LastRead -1 FirstWrite 5}
		stream_out_24_V_keep_V {Type O LastRead -1 FirstWrite 5}
		stream_out_24_V_strb_V {Type O LastRead -1 FirstWrite 5}
		stream_out_24_V_user_V {Type O LastRead -1 FirstWrite 5}
		stream_out_24_V_last_V {Type O LastRead -1 FirstWrite 5}
		c1_c1 {Type I LastRead 0 FirstWrite -1}
		c1_c2 {Type I LastRead 0 FirstWrite -1}
		c1_c3 {Type I LastRead 0 FirstWrite -1}
		c2_c1 {Type I LastRead 0 FirstWrite -1}
		c2_c2 {Type I LastRead 0 FirstWrite -1}
		c2_c3 {Type I LastRead 0 FirstWrite -1}
		c3_c1 {Type I LastRead 0 FirstWrite -1}
		c3_c2 {Type I LastRead 0 FirstWrite -1}
		c3_c3 {Type I LastRead 0 FirstWrite -1}
		bias_c1 {Type I LastRead 0 FirstWrite -1}
		bias_c2 {Type I LastRead 0 FirstWrite -1}
		bias_c3 {Type I LastRead 0 FirstWrite -1}
		ap_local_deadlock {Type O LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "6", "Max" : "6"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	stream_in_24_V_data_V { axis {  { stream_in_24_TDATA in_data 0 24 } } }
	stream_in_24_V_keep_V { axis {  { stream_in_24_TKEEP in_data 0 3 } } }
	stream_in_24_V_strb_V { axis {  { stream_in_24_TSTRB in_data 0 3 } } }
	stream_in_24_V_user_V { axis {  { stream_in_24_TUSER in_data 0 1 } } }
	stream_in_24_V_last_V { axis {  { stream_in_24_TVALID in_vld 0 1 }  { stream_in_24_TREADY in_acc 1 1 }  { stream_in_24_TLAST in_data 0 1 } } }
	stream_out_24_V_data_V { axis {  { stream_out_24_TDATA out_data 1 24 } } }
	stream_out_24_V_keep_V { axis {  { stream_out_24_TKEEP out_data 1 3 } } }
	stream_out_24_V_strb_V { axis {  { stream_out_24_TSTRB out_data 1 3 } } }
	stream_out_24_V_user_V { axis {  { stream_out_24_TUSER out_data 1 1 } } }
	stream_out_24_V_last_V { axis {  { stream_out_24_TVALID out_vld 1 1 }  { stream_out_24_TREADY out_acc 0 1 }  { stream_out_24_TLAST out_data 1 1 } } }
}

set busDeadlockParameterList { 
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
set moduleName color_convert
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type function
set FunctionProtocol ap_ctrl_none
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set C_modelName {color_convert}
set C_modelType { void 0 }
set C_modelArgList {
	{ stream_in_24_V_data_V int 24 regular {axi_s 0 volatile  { stream_in_24 Data } }  }
	{ stream_in_24_V_keep_V int 3 regular {axi_s 0 volatile  { stream_in_24 Keep } }  }
	{ stream_in_24_V_strb_V int 3 regular {axi_s 0 volatile  { stream_in_24 Strb } }  }
	{ stream_in_24_V_user_V int 1 regular {axi_s 0 volatile  { stream_in_24 User } }  }
	{ stream_in_24_V_last_V int 1 regular {axi_s 0 volatile  { stream_in_24 Last } }  }
	{ stream_out_24_V_data_V int 24 regular {axi_s 1 volatile  { stream_out_24 Data } }  }
	{ stream_out_24_V_keep_V int 3 regular {axi_s 1 volatile  { stream_out_24 Keep } }  }
	{ stream_out_24_V_strb_V int 3 regular {axi_s 1 volatile  { stream_out_24 Strb } }  }
	{ stream_out_24_V_user_V int 1 regular {axi_s 1 volatile  { stream_out_24 User } }  }
	{ stream_out_24_V_last_V int 1 regular {axi_s 1 volatile  { stream_out_24 Last } }  }
	{ c1_c1 int 10 regular {axi_slave 0}  }
	{ c1_c2 int 10 regular {axi_slave 0}  }
	{ c1_c3 int 10 regular {axi_slave 0}  }
	{ c2_c1 int 10 regular {axi_slave 0}  }
	{ c2_c2 int 10 regular {axi_slave 0}  }
	{ c2_c3 int 10 regular {axi_slave 0}  }
	{ c3_c1 int 10 regular {axi_slave 0}  }
	{ c3_c2 int 10 regular {axi_slave 0}  }
	{ c3_c3 int 10 regular {axi_slave 0}  }
	{ bias_c1 int 10 regular {axi_slave 0}  }
	{ bias_c2 int 10 regular {axi_slave 0}  }
	{ bias_c3 int 10 regular {axi_slave 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "stream_in_24_V_data_V", "interface" : "axis", "bitwidth" : 24, "direction" : "READONLY"} , 
 	{ "Name" : "stream_in_24_V_keep_V", "interface" : "axis", "bitwidth" : 3, "direction" : "READONLY"} , 
 	{ "Name" : "stream_in_24_V_strb_V", "interface" : "axis", "bitwidth" : 3, "direction" : "READONLY"} , 
 	{ "Name" : "stream_in_24_V_user_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "stream_in_24_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "stream_out_24_V_data_V", "interface" : "axis", "bitwidth" : 24, "direction" : "WRITEONLY"} , 
 	{ "Name" : "stream_out_24_V_keep_V", "interface" : "axis", "bitwidth" : 3, "direction" : "WRITEONLY"} , 
 	{ "Name" : "stream_out_24_V_strb_V", "interface" : "axis", "bitwidth" : 3, "direction" : "WRITEONLY"} , 
 	{ "Name" : "stream_out_24_V_user_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "stream_out_24_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "c1_c1", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 10, "direction" : "READONLY", "offset" : {"in":16}, "offset_end" : {"in":23}} , 
 	{ "Name" : "c1_c2", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 10, "direction" : "READONLY", "offset" : {"in":24}, "offset_end" : {"in":31}} , 
 	{ "Name" : "c1_c3", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 10, "direction" : "READONLY", "offset" : {"in":32}, "offset_end" : {"in":39}} , 
 	{ "Name" : "c2_c1", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 10, "direction" : "READONLY", "offset" : {"in":40}, "offset_end" : {"in":47}} , 
 	{ "Name" : "c2_c2", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 10, "direction" : "READONLY", "offset" : {"in":48}, "offset_end" : {"in":55}} , 
 	{ "Name" : "c2_c3", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 10, "direction" : "READONLY", "offset" : {"in":56}, "offset_end" : {"in":63}} , 
 	{ "Name" : "c3_c1", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 10, "direction" : "READONLY", "offset" : {"in":64}, "offset_end" : {"in":71}} , 
 	{ "Name" : "c3_c2", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 10, "direction" : "READONLY", "offset" : {"in":72}, "offset_end" : {"in":79}} , 
 	{ "Name" : "c3_c3", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 10, "direction" : "READONLY", "offset" : {"in":80}, "offset_end" : {"in":87}} , 
 	{ "Name" : "bias_c1", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 10, "direction" : "READONLY", "offset" : {"in":88}, "offset_end" : {"in":95}} , 
 	{ "Name" : "bias_c2", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 10, "direction" : "READONLY", "offset" : {"in":96}, "offset_end" : {"in":103}} , 
 	{ "Name" : "bias_c3", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 10, "direction" : "READONLY", "offset" : {"in":104}, "offset_end" : {"in":111}} ]}
# RTL Port declarations: 
set portNum 33
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ stream_in_24_TDATA sc_in sc_lv 24 signal 0 } 
	{ stream_in_24_TVALID sc_in sc_logic 1 invld 4 } 
	{ stream_in_24_TREADY sc_out sc_logic 1 inacc 4 } 
	{ stream_in_24_TKEEP sc_in sc_lv 3 signal 1 } 
	{ stream_in_24_TSTRB sc_in sc_lv 3 signal 2 } 
	{ stream_in_24_TUSER sc_in sc_lv 1 signal 3 } 
	{ stream_in_24_TLAST sc_in sc_lv 1 signal 4 } 
	{ stream_out_24_TDATA sc_out sc_lv 24 signal 5 } 
	{ stream_out_24_TVALID sc_out sc_logic 1 outvld 9 } 
	{ stream_out_24_TREADY sc_in sc_logic 1 outacc 9 } 
	{ stream_out_24_TKEEP sc_out sc_lv 3 signal 6 } 
	{ stream_out_24_TSTRB sc_out sc_lv 3 signal 7 } 
	{ stream_out_24_TUSER sc_out sc_lv 1 signal 8 } 
	{ stream_out_24_TLAST sc_out sc_lv 1 signal 9 } 
	{ s_axi_control_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_AWADDR sc_in sc_lv 7 signal -1 } 
	{ s_axi_control_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_control_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_ARADDR sc_in sc_lv 7 signal -1 } 
	{ s_axi_control_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_control_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_control_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_BRESP sc_out sc_lv 2 signal -1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_control_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "control", "role": "AWADDR" },"address":[{"name":"c1_c1","role":"data","value":"16"},{"name":"c1_c2","role":"data","value":"24"},{"name":"c1_c3","role":"data","value":"32"},{"name":"c2_c1","role":"data","value":"40"},{"name":"c2_c2","role":"data","value":"48"},{"name":"c2_c3","role":"data","value":"56"},{"name":"c3_c1","role":"data","value":"64"},{"name":"c3_c2","role":"data","value":"72"},{"name":"c3_c3","role":"data","value":"80"},{"name":"bias_c1","role":"data","value":"88"},{"name":"bias_c2","role":"data","value":"96"},{"name":"bias_c3","role":"data","value":"104"}] },
	{ "name": "s_axi_control_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWVALID" } },
	{ "name": "s_axi_control_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWREADY" } },
	{ "name": "s_axi_control_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WVALID" } },
	{ "name": "s_axi_control_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WREADY" } },
	{ "name": "s_axi_control_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "WDATA" } },
	{ "name": "s_axi_control_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "WSTRB" } },
	{ "name": "s_axi_control_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "control", "role": "ARADDR" },"address":[] },
	{ "name": "s_axi_control_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARVALID" } },
	{ "name": "s_axi_control_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARREADY" } },
	{ "name": "s_axi_control_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RVALID" } },
	{ "name": "s_axi_control_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RREADY" } },
	{ "name": "s_axi_control_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "RDATA" } },
	{ "name": "s_axi_control_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "RRESP" } },
	{ "name": "s_axi_control_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BVALID" } },
	{ "name": "s_axi_control_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BREADY" } },
	{ "name": "s_axi_control_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "BRESP" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "stream_in_24_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "stream_in_24_V_data_V", "role": "default" }} , 
 	{ "name": "stream_in_24_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "stream_in_24_V_last_V", "role": "default" }} , 
 	{ "name": "stream_in_24_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "stream_in_24_V_last_V", "role": "default" }} , 
 	{ "name": "stream_in_24_TKEEP", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "stream_in_24_V_keep_V", "role": "default" }} , 
 	{ "name": "stream_in_24_TSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "stream_in_24_V_strb_V", "role": "default" }} , 
 	{ "name": "stream_in_24_TUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "stream_in_24_V_user_V", "role": "default" }} , 
 	{ "name": "stream_in_24_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "stream_in_24_V_last_V", "role": "default" }} , 
 	{ "name": "stream_out_24_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "stream_out_24_V_data_V", "role": "default" }} , 
 	{ "name": "stream_out_24_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "stream_out_24_V_last_V", "role": "default" }} , 
 	{ "name": "stream_out_24_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "stream_out_24_V_last_V", "role": "default" }} , 
 	{ "name": "stream_out_24_TKEEP", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "stream_out_24_V_keep_V", "role": "default" }} , 
 	{ "name": "stream_out_24_TSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "stream_out_24_V_strb_V", "role": "default" }} , 
 	{ "name": "stream_out_24_TUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "stream_out_24_V_user_V", "role": "default" }} , 
 	{ "name": "stream_out_24_TLAST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "stream_out_24_V_last_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20"],
		"CDFG" : "color_convert",
		"Protocol" : "ap_ctrl_none",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "6", "EstimateLatencyMin" : "6", "EstimateLatencyMax" : "6",
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
			{"Name" : "stream_out_24_V_data_V", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "stream_out_24_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "stream_out_24_V_keep_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "stream_out_24_V_strb_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "stream_out_24_V_user_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "stream_out_24_V_last_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "c1_c1", "Type" : "None", "Direction" : "I"},
			{"Name" : "c1_c2", "Type" : "None", "Direction" : "I"},
			{"Name" : "c1_c3", "Type" : "None", "Direction" : "I"},
			{"Name" : "c2_c1", "Type" : "None", "Direction" : "I"},
			{"Name" : "c2_c2", "Type" : "None", "Direction" : "I"},
			{"Name" : "c2_c3", "Type" : "None", "Direction" : "I"},
			{"Name" : "c3_c1", "Type" : "None", "Direction" : "I"},
			{"Name" : "c3_c2", "Type" : "None", "Direction" : "I"},
			{"Name" : "c3_c3", "Type" : "None", "Direction" : "I"},
			{"Name" : "bias_c1", "Type" : "None", "Direction" : "I"},
			{"Name" : "bias_c2", "Type" : "None", "Direction" : "I"},
			{"Name" : "bias_c3", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.control_s_axi_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_10s_8ns_18_1_1_U1", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_10s_8ns_18_1_1_U2", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_10s_8ns_18_1_1_U3", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_10s_8ns_18_1_1_U4", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_10s_8ns_18_1_1_U5", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_10s_8ns_18_1_1_U6", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_10s_8ns_18_1_1_U7", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_10s_8ns_18_1_1_U8", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_10s_8ns_18_1_1_U9", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_stream_in_24_V_data_V_U", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_stream_in_24_V_keep_V_U", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_stream_in_24_V_strb_V_U", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_stream_in_24_V_user_V_U", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_stream_in_24_V_last_V_U", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_stream_out_24_V_data_V_U", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_stream_out_24_V_keep_V_U", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_stream_out_24_V_strb_V_U", "Parent" : "0"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_stream_out_24_V_user_V_U", "Parent" : "0"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_stream_out_24_V_last_V_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	color_convert {
		stream_in_24_V_data_V {Type I LastRead 0 FirstWrite -1}
		stream_in_24_V_keep_V {Type I LastRead 0 FirstWrite -1}
		stream_in_24_V_strb_V {Type I LastRead 0 FirstWrite -1}
		stream_in_24_V_user_V {Type I LastRead 0 FirstWrite -1}
		stream_in_24_V_last_V {Type I LastRead 0 FirstWrite -1}
		stream_out_24_V_data_V {Type O LastRead -1 FirstWrite 5}
		stream_out_24_V_keep_V {Type O LastRead -1 FirstWrite 5}
		stream_out_24_V_strb_V {Type O LastRead -1 FirstWrite 5}
		stream_out_24_V_user_V {Type O LastRead -1 FirstWrite 5}
		stream_out_24_V_last_V {Type O LastRead -1 FirstWrite 5}
		c1_c1 {Type I LastRead 0 FirstWrite -1}
		c1_c2 {Type I LastRead 0 FirstWrite -1}
		c1_c3 {Type I LastRead 0 FirstWrite -1}
		c2_c1 {Type I LastRead 0 FirstWrite -1}
		c2_c2 {Type I LastRead 0 FirstWrite -1}
		c2_c3 {Type I LastRead 0 FirstWrite -1}
		c3_c1 {Type I LastRead 0 FirstWrite -1}
		c3_c2 {Type I LastRead 0 FirstWrite -1}
		c3_c3 {Type I LastRead 0 FirstWrite -1}
		bias_c1 {Type I LastRead 0 FirstWrite -1}
		bias_c2 {Type I LastRead 0 FirstWrite -1}
		bias_c3 {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "6", "Max" : "6"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	stream_in_24_V_data_V { axis {  { stream_in_24_TDATA in_data 0 24 } } }
	stream_in_24_V_keep_V { axis {  { stream_in_24_TKEEP in_data 0 3 } } }
	stream_in_24_V_strb_V { axis {  { stream_in_24_TSTRB in_data 0 3 } } }
	stream_in_24_V_user_V { axis {  { stream_in_24_TUSER in_data 0 1 } } }
	stream_in_24_V_last_V { axis {  { stream_in_24_TVALID in_vld 0 1 }  { stream_in_24_TREADY in_acc 1 1 }  { stream_in_24_TLAST in_data 0 1 } } }
	stream_out_24_V_data_V { axis {  { stream_out_24_TDATA out_data 1 24 } } }
	stream_out_24_V_keep_V { axis {  { stream_out_24_TKEEP out_data 1 3 } } }
	stream_out_24_V_strb_V { axis {  { stream_out_24_TSTRB out_data 1 3 } } }
	stream_out_24_V_user_V { axis {  { stream_out_24_TUSER out_data 1 1 } } }
	stream_out_24_V_last_V { axis {  { stream_out_24_TVALID out_vld 1 1 }  { stream_out_24_TREADY out_acc 0 1 }  { stream_out_24_TLAST out_data 1 1 } } }
}

set maxi_interface_dict [dict create]

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
