set moduleName trace_cntrl_64
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {trace_cntrl_64}
set C_modelType { void 0 }
set C_modelArgList {
	{ trace_64_V_data_V int 64 regular {axi_s 0 volatile  { trace_64 Data } }  }
	{ trace_64_V_keep_V int 8 regular {axi_s 0 volatile  { trace_64 Keep } }  }
	{ trace_64_V_strb_V int 8 regular {axi_s 0 volatile  { trace_64 Strb } }  }
	{ trace_64_V_user_V int 1 regular {axi_s 0 volatile  { trace_64 User } }  }
	{ trace_64_V_last_V int 1 regular {axi_s 0 volatile  { trace_64 Last } }  }
	{ trace_64_V_id_V int 1 regular {axi_s 0 volatile  { trace_64 ID } }  }
	{ trace_64_V_dest_V int 1 regular {axi_s 0 volatile  { trace_64 Dest } }  }
	{ capture_64_V_data_V int 64 regular {axi_s 1 volatile  { capture_64 Data } }  }
	{ capture_64_V_keep_V int 8 regular {axi_s 1 volatile  { capture_64 Keep } }  }
	{ capture_64_V_strb_V int 8 regular {axi_s 1 volatile  { capture_64 Strb } }  }
	{ capture_64_V_user_V int 1 regular {axi_s 1 volatile  { capture_64 User } }  }
	{ capture_64_V_last_V int 1 regular {axi_s 1 volatile  { capture_64 Last } }  }
	{ capture_64_V_id_V int 1 regular {axi_s 1 volatile  { capture_64 ID } }  }
	{ capture_64_V_dest_V int 1 regular {axi_s 1 volatile  { capture_64 Dest } }  }
	{ trigger int 64 regular {axi_slave 0}  }
	{ length_r int 32 regular {axi_slave 0}  }
	{ ap_local_deadlock int 1 unused {axi_slave 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "trace_64_V_data_V", "interface" : "axis", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "trace_64_V_keep_V", "interface" : "axis", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "trace_64_V_strb_V", "interface" : "axis", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "trace_64_V_user_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "trace_64_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "trace_64_V_id_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "trace_64_V_dest_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "capture_64_V_data_V", "interface" : "axis", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "capture_64_V_keep_V", "interface" : "axis", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "capture_64_V_strb_V", "interface" : "axis", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "capture_64_V_user_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "capture_64_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "capture_64_V_id_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "capture_64_V_dest_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "trigger", "interface" : "axi_slave", "bundle":"trace_cntrl","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":16}, "offset_end" : {"in":27}} , 
 	{ "Name" : "length_r", "interface" : "axi_slave", "bundle":"trace_cntrl","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":28}, "offset_end" : {"in":35}} , 
 	{ "Name" : "ap_local_deadlock", "interface" : "axi_slave", "bundle":"trace_cntrl","type":"ap_none","bitwidth" : 1, "direction" : "WRITEONLY", "offset" : {"out":0}, "offset_end" : {"out":4294967295}} ]}
# RTL Port declarations: 
set portNum 39
set portList { 
	{ ap_local_block sc_out sc_logic 1 signal -1 } 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ trace_64_TDATA sc_in sc_lv 64 signal 0 } 
	{ trace_64_TVALID sc_in sc_logic 1 invld 6 } 
	{ trace_64_TREADY sc_out sc_logic 1 inacc 6 } 
	{ trace_64_TKEEP sc_in sc_lv 8 signal 1 } 
	{ trace_64_TSTRB sc_in sc_lv 8 signal 2 } 
	{ trace_64_TUSER sc_in sc_lv 1 signal 3 } 
	{ trace_64_TLAST sc_in sc_lv 1 signal 4 } 
	{ trace_64_TID sc_in sc_lv 1 signal 5 } 
	{ trace_64_TDEST sc_in sc_lv 1 signal 6 } 
	{ capture_64_TDATA sc_out sc_lv 64 signal 7 } 
	{ capture_64_TVALID sc_out sc_logic 1 outvld 13 } 
	{ capture_64_TREADY sc_in sc_logic 1 outacc 13 } 
	{ capture_64_TKEEP sc_out sc_lv 8 signal 8 } 
	{ capture_64_TSTRB sc_out sc_lv 8 signal 9 } 
	{ capture_64_TUSER sc_out sc_lv 1 signal 10 } 
	{ capture_64_TLAST sc_out sc_lv 1 signal 11 } 
	{ capture_64_TID sc_out sc_lv 1 signal 12 } 
	{ capture_64_TDEST sc_out sc_lv 1 signal 13 } 
	{ s_axi_trace_cntrl_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_trace_cntrl_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_trace_cntrl_AWADDR sc_in sc_lv 6 signal -1 } 
	{ s_axi_trace_cntrl_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_trace_cntrl_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_trace_cntrl_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_trace_cntrl_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_trace_cntrl_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_trace_cntrl_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_trace_cntrl_ARADDR sc_in sc_lv 6 signal -1 } 
	{ s_axi_trace_cntrl_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_trace_cntrl_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_trace_cntrl_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_trace_cntrl_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_trace_cntrl_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_trace_cntrl_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_trace_cntrl_BRESP sc_out sc_lv 2 signal -1 } 
	{ interrupt sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_trace_cntrl_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "trace_cntrl", "role": "AWADDR" },"address":[{"name":"trace_cntrl_64","role":"start","value":"0","valid_bit":"0"},{"name":"trace_cntrl_64","role":"continue","value":"0","valid_bit":"4"},{"name":"trace_cntrl_64","role":"auto_start","value":"0","valid_bit":"7"},{"name":"trigger","role":"data","value":"16"},{"name":"length_r","role":"data","value":"28"}] },
	{ "name": "s_axi_trace_cntrl_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "trace_cntrl", "role": "AWVALID" } },
	{ "name": "s_axi_trace_cntrl_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "trace_cntrl", "role": "AWREADY" } },
	{ "name": "s_axi_trace_cntrl_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "trace_cntrl", "role": "WVALID" } },
	{ "name": "s_axi_trace_cntrl_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "trace_cntrl", "role": "WREADY" } },
	{ "name": "s_axi_trace_cntrl_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "trace_cntrl", "role": "WDATA" } },
	{ "name": "s_axi_trace_cntrl_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "trace_cntrl", "role": "WSTRB" } },
	{ "name": "s_axi_trace_cntrl_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "trace_cntrl", "role": "ARADDR" },"address":[{"name":"trace_cntrl_64","role":"start","value":"0","valid_bit":"0"},{"name":"trace_cntrl_64","role":"done","value":"0","valid_bit":"1"},{"name":"trace_cntrl_64","role":"idle","value":"0","valid_bit":"2"},{"name":"trace_cntrl_64","role":"ready","value":"0","valid_bit":"3"},{"name":"trace_cntrl_64","role":"auto_start","value":"0","valid_bit":"7"},{"name":"ap_local_deadlock","role":"data","value":"0"}] },
	{ "name": "s_axi_trace_cntrl_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "trace_cntrl", "role": "ARVALID" } },
	{ "name": "s_axi_trace_cntrl_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "trace_cntrl", "role": "ARREADY" } },
	{ "name": "s_axi_trace_cntrl_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "trace_cntrl", "role": "RVALID" } },
	{ "name": "s_axi_trace_cntrl_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "trace_cntrl", "role": "RREADY" } },
	{ "name": "s_axi_trace_cntrl_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "trace_cntrl", "role": "RDATA" } },
	{ "name": "s_axi_trace_cntrl_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "trace_cntrl", "role": "RRESP" } },
	{ "name": "s_axi_trace_cntrl_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "trace_cntrl", "role": "BVALID" } },
	{ "name": "s_axi_trace_cntrl_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "trace_cntrl", "role": "BREADY" } },
	{ "name": "s_axi_trace_cntrl_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "trace_cntrl", "role": "BRESP" } },
	{ "name": "interrupt", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "trace_cntrl", "role": "interrupt" } }, 
 	{ "name": "ap_local_block", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_local_block", "role": "default" }} , 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "trace_64_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "trace_64_V_data_V", "role": "default" }} , 
 	{ "name": "trace_64_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "trace_64_V_dest_V", "role": "default" }} , 
 	{ "name": "trace_64_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "trace_64_V_dest_V", "role": "default" }} , 
 	{ "name": "trace_64_TKEEP", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "trace_64_V_keep_V", "role": "default" }} , 
 	{ "name": "trace_64_TSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "trace_64_V_strb_V", "role": "default" }} , 
 	{ "name": "trace_64_TUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "trace_64_V_user_V", "role": "default" }} , 
 	{ "name": "trace_64_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "trace_64_V_last_V", "role": "default" }} , 
 	{ "name": "trace_64_TID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "trace_64_V_id_V", "role": "default" }} , 
 	{ "name": "trace_64_TDEST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "trace_64_V_dest_V", "role": "default" }} , 
 	{ "name": "capture_64_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "capture_64_V_data_V", "role": "default" }} , 
 	{ "name": "capture_64_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "capture_64_V_dest_V", "role": "default" }} , 
 	{ "name": "capture_64_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "capture_64_V_dest_V", "role": "default" }} , 
 	{ "name": "capture_64_TKEEP", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "capture_64_V_keep_V", "role": "default" }} , 
 	{ "name": "capture_64_TSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "capture_64_V_strb_V", "role": "default" }} , 
 	{ "name": "capture_64_TUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "capture_64_V_user_V", "role": "default" }} , 
 	{ "name": "capture_64_TLAST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "capture_64_V_last_V", "role": "default" }} , 
 	{ "name": "capture_64_TID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "capture_64_V_id_V", "role": "default" }} , 
 	{ "name": "capture_64_TDEST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "capture_64_V_dest_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17"],
		"CDFG" : "trace_cntrl_64",
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
			{"Name" : "trace_64_V_data_V", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_trace_cntrl_64_Pipeline_VITIS_LOOP_27_1_fu_84", "Port" : "trace_64_V_data_V", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "trace_64_V_keep_V", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_trace_cntrl_64_Pipeline_VITIS_LOOP_27_1_fu_84", "Port" : "trace_64_V_keep_V", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "trace_64_V_strb_V", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_trace_cntrl_64_Pipeline_VITIS_LOOP_27_1_fu_84", "Port" : "trace_64_V_strb_V", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "trace_64_V_user_V", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_trace_cntrl_64_Pipeline_VITIS_LOOP_27_1_fu_84", "Port" : "trace_64_V_user_V", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "trace_64_V_last_V", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_trace_cntrl_64_Pipeline_VITIS_LOOP_27_1_fu_84", "Port" : "trace_64_V_last_V", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "trace_64_V_id_V", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_trace_cntrl_64_Pipeline_VITIS_LOOP_27_1_fu_84", "Port" : "trace_64_V_id_V", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "trace_64_V_dest_V", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_trace_cntrl_64_Pipeline_VITIS_LOOP_27_1_fu_84", "Port" : "trace_64_V_dest_V", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "capture_64_V_data_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_trace_cntrl_64_Pipeline_VITIS_LOOP_27_1_fu_84", "Port" : "capture_64_V_data_V", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "capture_64_V_keep_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_trace_cntrl_64_Pipeline_VITIS_LOOP_27_1_fu_84", "Port" : "capture_64_V_keep_V", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "capture_64_V_strb_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_trace_cntrl_64_Pipeline_VITIS_LOOP_27_1_fu_84", "Port" : "capture_64_V_strb_V", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "capture_64_V_user_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_trace_cntrl_64_Pipeline_VITIS_LOOP_27_1_fu_84", "Port" : "capture_64_V_user_V", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "capture_64_V_last_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_trace_cntrl_64_Pipeline_VITIS_LOOP_27_1_fu_84", "Port" : "capture_64_V_last_V", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "capture_64_V_id_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_trace_cntrl_64_Pipeline_VITIS_LOOP_27_1_fu_84", "Port" : "capture_64_V_id_V", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "capture_64_V_dest_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_trace_cntrl_64_Pipeline_VITIS_LOOP_27_1_fu_84", "Port" : "capture_64_V_dest_V", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "trigger", "Type" : "None", "Direction" : "I"},
			{"Name" : "length_r", "Type" : "None", "Direction" : "I"},
			{"Name" : "ap_local_deadlock", "Type" : "None", "Direction" : "O"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_trace_cntrl_64_Pipeline_VITIS_LOOP_27_1_fu_84", "Parent" : "0", "Child" : ["2"],
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
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_trace_cntrl_64_Pipeline_VITIS_LOOP_27_1_fu_84.flow_control_loop_pipe_sequential_init_U", "Parent" : "1"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.trace_cntrl_s_axi_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_trace_64_V_data_V_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_trace_64_V_keep_V_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_trace_64_V_strb_V_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_trace_64_V_user_V_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_trace_64_V_last_V_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_trace_64_V_id_V_U", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_trace_64_V_dest_V_U", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_capture_64_V_data_V_U", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_capture_64_V_keep_V_U", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_capture_64_V_strb_V_U", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_capture_64_V_user_V_U", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_capture_64_V_last_V_U", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_capture_64_V_id_V_U", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_capture_64_V_dest_V_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	trace_cntrl_64 {
		trace_64_V_data_V {Type I LastRead 0 FirstWrite -1}
		trace_64_V_keep_V {Type I LastRead 0 FirstWrite -1}
		trace_64_V_strb_V {Type I LastRead 0 FirstWrite -1}
		trace_64_V_user_V {Type I LastRead 0 FirstWrite -1}
		trace_64_V_last_V {Type I LastRead 0 FirstWrite -1}
		trace_64_V_id_V {Type I LastRead 0 FirstWrite -1}
		trace_64_V_dest_V {Type I LastRead 0 FirstWrite -1}
		capture_64_V_data_V {Type O LastRead -1 FirstWrite 1}
		capture_64_V_keep_V {Type O LastRead -1 FirstWrite 1}
		capture_64_V_strb_V {Type O LastRead -1 FirstWrite 1}
		capture_64_V_user_V {Type O LastRead -1 FirstWrite 1}
		capture_64_V_last_V {Type O LastRead -1 FirstWrite 1}
		capture_64_V_id_V {Type O LastRead -1 FirstWrite 1}
		capture_64_V_dest_V {Type O LastRead -1 FirstWrite 1}
		trigger {Type I LastRead 0 FirstWrite -1}
		length_r {Type I LastRead 0 FirstWrite -1}
		ap_local_deadlock {Type O LastRead -1 FirstWrite -1}}
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
	, {"Name" : "Interval", "Min" : "0", "Max" : "0"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	trace_64_V_data_V { axis {  { trace_64_TDATA in_data 0 64 } } }
	trace_64_V_keep_V { axis {  { trace_64_TKEEP in_data 0 8 } } }
	trace_64_V_strb_V { axis {  { trace_64_TSTRB in_data 0 8 } } }
	trace_64_V_user_V { axis {  { trace_64_TUSER in_data 0 1 } } }
	trace_64_V_last_V { axis {  { trace_64_TLAST in_data 0 1 } } }
	trace_64_V_id_V { axis {  { trace_64_TID in_data 0 1 } } }
	trace_64_V_dest_V { axis {  { trace_64_TVALID in_vld 0 1 }  { trace_64_TREADY in_acc 1 1 }  { trace_64_TDEST in_data 0 1 } } }
	capture_64_V_data_V { axis {  { capture_64_TDATA out_data 1 64 } } }
	capture_64_V_keep_V { axis {  { capture_64_TKEEP out_data 1 8 } } }
	capture_64_V_strb_V { axis {  { capture_64_TSTRB out_data 1 8 } } }
	capture_64_V_user_V { axis {  { capture_64_TUSER out_data 1 1 } } }
	capture_64_V_last_V { axis {  { capture_64_TLAST out_data 1 1 } } }
	capture_64_V_id_V { axis {  { capture_64_TID out_data 1 1 } } }
	capture_64_V_dest_V { axis {  { capture_64_TVALID out_vld 1 1 }  { capture_64_TREADY out_acc 0 1 }  { capture_64_TDEST out_data 1 1 } } }
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
set moduleName trace_cntrl_64
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set C_modelName {trace_cntrl_64}
set C_modelType { void 0 }
set C_modelArgList {
	{ trace_64_V_data_V int 64 regular {axi_s 0 volatile  { trace_64 Data } }  }
	{ trace_64_V_keep_V int 8 regular {axi_s 0 volatile  { trace_64 Keep } }  }
	{ trace_64_V_strb_V int 8 regular {axi_s 0 volatile  { trace_64 Strb } }  }
	{ trace_64_V_user_V int 1 regular {axi_s 0 volatile  { trace_64 User } }  }
	{ trace_64_V_last_V int 1 regular {axi_s 0 volatile  { trace_64 Last } }  }
	{ trace_64_V_id_V int 1 regular {axi_s 0 volatile  { trace_64 ID } }  }
	{ trace_64_V_dest_V int 1 regular {axi_s 0 volatile  { trace_64 Dest } }  }
	{ capture_64_V_data_V int 64 regular {axi_s 1 volatile  { capture_64 Data } }  }
	{ capture_64_V_keep_V int 8 regular {axi_s 1 volatile  { capture_64 Keep } }  }
	{ capture_64_V_strb_V int 8 regular {axi_s 1 volatile  { capture_64 Strb } }  }
	{ capture_64_V_user_V int 1 regular {axi_s 1 volatile  { capture_64 User } }  }
	{ capture_64_V_last_V int 1 regular {axi_s 1 volatile  { capture_64 Last } }  }
	{ capture_64_V_id_V int 1 regular {axi_s 1 volatile  { capture_64 ID } }  }
	{ capture_64_V_dest_V int 1 regular {axi_s 1 volatile  { capture_64 Dest } }  }
	{ trigger int 64 regular {axi_slave 0}  }
	{ length_r int 32 regular {axi_slave 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "trace_64_V_data_V", "interface" : "axis", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "trace_64_V_keep_V", "interface" : "axis", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "trace_64_V_strb_V", "interface" : "axis", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "trace_64_V_user_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "trace_64_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "trace_64_V_id_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "trace_64_V_dest_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "capture_64_V_data_V", "interface" : "axis", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "capture_64_V_keep_V", "interface" : "axis", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "capture_64_V_strb_V", "interface" : "axis", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "capture_64_V_user_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "capture_64_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "capture_64_V_id_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "capture_64_V_dest_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "trigger", "interface" : "axi_slave", "bundle":"trace_cntrl","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":16}, "offset_end" : {"in":27}} , 
 	{ "Name" : "length_r", "interface" : "axi_slave", "bundle":"trace_cntrl","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":28}, "offset_end" : {"in":35}} ]}
# RTL Port declarations: 
set portNum 38
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ trace_64_TDATA sc_in sc_lv 64 signal 0 } 
	{ trace_64_TVALID sc_in sc_logic 1 invld 6 } 
	{ trace_64_TREADY sc_out sc_logic 1 inacc 6 } 
	{ trace_64_TKEEP sc_in sc_lv 8 signal 1 } 
	{ trace_64_TSTRB sc_in sc_lv 8 signal 2 } 
	{ trace_64_TUSER sc_in sc_lv 1 signal 3 } 
	{ trace_64_TLAST sc_in sc_lv 1 signal 4 } 
	{ trace_64_TID sc_in sc_lv 1 signal 5 } 
	{ trace_64_TDEST sc_in sc_lv 1 signal 6 } 
	{ capture_64_TDATA sc_out sc_lv 64 signal 7 } 
	{ capture_64_TVALID sc_out sc_logic 1 outvld 13 } 
	{ capture_64_TREADY sc_in sc_logic 1 outacc 13 } 
	{ capture_64_TKEEP sc_out sc_lv 8 signal 8 } 
	{ capture_64_TSTRB sc_out sc_lv 8 signal 9 } 
	{ capture_64_TUSER sc_out sc_lv 1 signal 10 } 
	{ capture_64_TLAST sc_out sc_lv 1 signal 11 } 
	{ capture_64_TID sc_out sc_lv 1 signal 12 } 
	{ capture_64_TDEST sc_out sc_lv 1 signal 13 } 
	{ s_axi_trace_cntrl_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_trace_cntrl_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_trace_cntrl_AWADDR sc_in sc_lv 6 signal -1 } 
	{ s_axi_trace_cntrl_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_trace_cntrl_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_trace_cntrl_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_trace_cntrl_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_trace_cntrl_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_trace_cntrl_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_trace_cntrl_ARADDR sc_in sc_lv 6 signal -1 } 
	{ s_axi_trace_cntrl_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_trace_cntrl_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_trace_cntrl_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_trace_cntrl_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_trace_cntrl_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_trace_cntrl_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_trace_cntrl_BRESP sc_out sc_lv 2 signal -1 } 
	{ interrupt sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_trace_cntrl_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "trace_cntrl", "role": "AWADDR" },"address":[{"name":"trace_cntrl_64","role":"start","value":"0","valid_bit":"0"},{"name":"trace_cntrl_64","role":"continue","value":"0","valid_bit":"4"},{"name":"trace_cntrl_64","role":"auto_start","value":"0","valid_bit":"7"},{"name":"trigger","role":"data","value":"16"},{"name":"length_r","role":"data","value":"28"}] },
	{ "name": "s_axi_trace_cntrl_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "trace_cntrl", "role": "AWVALID" } },
	{ "name": "s_axi_trace_cntrl_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "trace_cntrl", "role": "AWREADY" } },
	{ "name": "s_axi_trace_cntrl_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "trace_cntrl", "role": "WVALID" } },
	{ "name": "s_axi_trace_cntrl_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "trace_cntrl", "role": "WREADY" } },
	{ "name": "s_axi_trace_cntrl_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "trace_cntrl", "role": "WDATA" } },
	{ "name": "s_axi_trace_cntrl_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "trace_cntrl", "role": "WSTRB" } },
	{ "name": "s_axi_trace_cntrl_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "trace_cntrl", "role": "ARADDR" },"address":[{"name":"trace_cntrl_64","role":"start","value":"0","valid_bit":"0"},{"name":"trace_cntrl_64","role":"done","value":"0","valid_bit":"1"},{"name":"trace_cntrl_64","role":"idle","value":"0","valid_bit":"2"},{"name":"trace_cntrl_64","role":"ready","value":"0","valid_bit":"3"},{"name":"trace_cntrl_64","role":"auto_start","value":"0","valid_bit":"7"}] },
	{ "name": "s_axi_trace_cntrl_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "trace_cntrl", "role": "ARVALID" } },
	{ "name": "s_axi_trace_cntrl_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "trace_cntrl", "role": "ARREADY" } },
	{ "name": "s_axi_trace_cntrl_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "trace_cntrl", "role": "RVALID" } },
	{ "name": "s_axi_trace_cntrl_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "trace_cntrl", "role": "RREADY" } },
	{ "name": "s_axi_trace_cntrl_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "trace_cntrl", "role": "RDATA" } },
	{ "name": "s_axi_trace_cntrl_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "trace_cntrl", "role": "RRESP" } },
	{ "name": "s_axi_trace_cntrl_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "trace_cntrl", "role": "BVALID" } },
	{ "name": "s_axi_trace_cntrl_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "trace_cntrl", "role": "BREADY" } },
	{ "name": "s_axi_trace_cntrl_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "trace_cntrl", "role": "BRESP" } },
	{ "name": "interrupt", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "trace_cntrl", "role": "interrupt" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "trace_64_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "trace_64_V_data_V", "role": "default" }} , 
 	{ "name": "trace_64_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "trace_64_V_dest_V", "role": "default" }} , 
 	{ "name": "trace_64_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "trace_64_V_dest_V", "role": "default" }} , 
 	{ "name": "trace_64_TKEEP", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "trace_64_V_keep_V", "role": "default" }} , 
 	{ "name": "trace_64_TSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "trace_64_V_strb_V", "role": "default" }} , 
 	{ "name": "trace_64_TUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "trace_64_V_user_V", "role": "default" }} , 
 	{ "name": "trace_64_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "trace_64_V_last_V", "role": "default" }} , 
 	{ "name": "trace_64_TID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "trace_64_V_id_V", "role": "default" }} , 
 	{ "name": "trace_64_TDEST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "trace_64_V_dest_V", "role": "default" }} , 
 	{ "name": "capture_64_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "capture_64_V_data_V", "role": "default" }} , 
 	{ "name": "capture_64_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "capture_64_V_dest_V", "role": "default" }} , 
 	{ "name": "capture_64_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "capture_64_V_dest_V", "role": "default" }} , 
 	{ "name": "capture_64_TKEEP", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "capture_64_V_keep_V", "role": "default" }} , 
 	{ "name": "capture_64_TSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "capture_64_V_strb_V", "role": "default" }} , 
 	{ "name": "capture_64_TUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "capture_64_V_user_V", "role": "default" }} , 
 	{ "name": "capture_64_TLAST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "capture_64_V_last_V", "role": "default" }} , 
 	{ "name": "capture_64_TID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "capture_64_V_id_V", "role": "default" }} , 
 	{ "name": "capture_64_TDEST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "capture_64_V_dest_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17"],
		"CDFG" : "trace_cntrl_64",
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
			{"Name" : "trace_64_V_data_V", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_trace_cntrl_64_Pipeline_VITIS_LOOP_27_1_fu_84", "Port" : "trace_64_V_data_V", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "trace_64_V_keep_V", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_trace_cntrl_64_Pipeline_VITIS_LOOP_27_1_fu_84", "Port" : "trace_64_V_keep_V", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "trace_64_V_strb_V", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_trace_cntrl_64_Pipeline_VITIS_LOOP_27_1_fu_84", "Port" : "trace_64_V_strb_V", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "trace_64_V_user_V", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_trace_cntrl_64_Pipeline_VITIS_LOOP_27_1_fu_84", "Port" : "trace_64_V_user_V", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "trace_64_V_last_V", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_trace_cntrl_64_Pipeline_VITIS_LOOP_27_1_fu_84", "Port" : "trace_64_V_last_V", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "trace_64_V_id_V", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_trace_cntrl_64_Pipeline_VITIS_LOOP_27_1_fu_84", "Port" : "trace_64_V_id_V", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "trace_64_V_dest_V", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_trace_cntrl_64_Pipeline_VITIS_LOOP_27_1_fu_84", "Port" : "trace_64_V_dest_V", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "capture_64_V_data_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_trace_cntrl_64_Pipeline_VITIS_LOOP_27_1_fu_84", "Port" : "capture_64_V_data_V", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "capture_64_V_keep_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_trace_cntrl_64_Pipeline_VITIS_LOOP_27_1_fu_84", "Port" : "capture_64_V_keep_V", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "capture_64_V_strb_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_trace_cntrl_64_Pipeline_VITIS_LOOP_27_1_fu_84", "Port" : "capture_64_V_strb_V", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "capture_64_V_user_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_trace_cntrl_64_Pipeline_VITIS_LOOP_27_1_fu_84", "Port" : "capture_64_V_user_V", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "capture_64_V_last_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_trace_cntrl_64_Pipeline_VITIS_LOOP_27_1_fu_84", "Port" : "capture_64_V_last_V", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "capture_64_V_id_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_trace_cntrl_64_Pipeline_VITIS_LOOP_27_1_fu_84", "Port" : "capture_64_V_id_V", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "capture_64_V_dest_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_trace_cntrl_64_Pipeline_VITIS_LOOP_27_1_fu_84", "Port" : "capture_64_V_dest_V", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "trigger", "Type" : "None", "Direction" : "I"},
			{"Name" : "length_r", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_trace_cntrl_64_Pipeline_VITIS_LOOP_27_1_fu_84", "Parent" : "0", "Child" : ["2"],
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
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_trace_cntrl_64_Pipeline_VITIS_LOOP_27_1_fu_84.flow_control_loop_pipe_sequential_init_U", "Parent" : "1"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.trace_cntrl_s_axi_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_trace_64_V_data_V_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_trace_64_V_keep_V_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_trace_64_V_strb_V_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_trace_64_V_user_V_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_trace_64_V_last_V_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_trace_64_V_id_V_U", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_trace_64_V_dest_V_U", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_capture_64_V_data_V_U", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_capture_64_V_keep_V_U", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_capture_64_V_strb_V_U", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_capture_64_V_user_V_U", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_capture_64_V_last_V_U", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_capture_64_V_id_V_U", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_capture_64_V_dest_V_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	trace_cntrl_64 {
		trace_64_V_data_V {Type I LastRead 0 FirstWrite -1}
		trace_64_V_keep_V {Type I LastRead 0 FirstWrite -1}
		trace_64_V_strb_V {Type I LastRead 0 FirstWrite -1}
		trace_64_V_user_V {Type I LastRead 0 FirstWrite -1}
		trace_64_V_last_V {Type I LastRead 0 FirstWrite -1}
		trace_64_V_id_V {Type I LastRead 0 FirstWrite -1}
		trace_64_V_dest_V {Type I LastRead 0 FirstWrite -1}
		capture_64_V_data_V {Type O LastRead -1 FirstWrite 1}
		capture_64_V_keep_V {Type O LastRead -1 FirstWrite 1}
		capture_64_V_strb_V {Type O LastRead -1 FirstWrite 1}
		capture_64_V_user_V {Type O LastRead -1 FirstWrite 1}
		capture_64_V_last_V {Type O LastRead -1 FirstWrite 1}
		capture_64_V_id_V {Type O LastRead -1 FirstWrite 1}
		capture_64_V_dest_V {Type O LastRead -1 FirstWrite 1}
		trigger {Type I LastRead 0 FirstWrite -1}
		length_r {Type I LastRead 0 FirstWrite -1}}
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
	, {"Name" : "Interval", "Min" : "0", "Max" : "0"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	trace_64_V_data_V { axis {  { trace_64_TDATA in_data 0 64 } } }
	trace_64_V_keep_V { axis {  { trace_64_TKEEP in_data 0 8 } } }
	trace_64_V_strb_V { axis {  { trace_64_TSTRB in_data 0 8 } } }
	trace_64_V_user_V { axis {  { trace_64_TUSER in_data 0 1 } } }
	trace_64_V_last_V { axis {  { trace_64_TLAST in_data 0 1 } } }
	trace_64_V_id_V { axis {  { trace_64_TID in_data 0 1 } } }
	trace_64_V_dest_V { axis {  { trace_64_TVALID in_vld 0 1 }  { trace_64_TREADY in_acc 1 1 }  { trace_64_TDEST in_data 0 1 } } }
	capture_64_V_data_V { axis {  { capture_64_TDATA out_data 1 64 } } }
	capture_64_V_keep_V { axis {  { capture_64_TKEEP out_data 1 8 } } }
	capture_64_V_strb_V { axis {  { capture_64_TSTRB out_data 1 8 } } }
	capture_64_V_user_V { axis {  { capture_64_TUSER out_data 1 1 } } }
	capture_64_V_last_V { axis {  { capture_64_TLAST out_data 1 1 } } }
	capture_64_V_id_V { axis {  { capture_64_TID out_data 1 1 } } }
	capture_64_V_dest_V { axis {  { capture_64_TVALID out_vld 1 1 }  { capture_64_TREADY out_acc 0 1 }  { capture_64_TDEST out_data 1 1 } } }
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
