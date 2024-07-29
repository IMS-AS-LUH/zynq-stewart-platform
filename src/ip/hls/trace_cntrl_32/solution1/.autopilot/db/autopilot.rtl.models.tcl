set SynModuleInfo {
  {SRCNAME trace_cntrl_32_Pipeline_VITIS_LOOP_28_1 MODELNAME trace_cntrl_32_Pipeline_VITIS_LOOP_28_1 RTLNAME trace_cntrl_32_trace_cntrl_32_Pipeline_VITIS_LOOP_28_1
    SUBMODULES {
      {MODELNAME trace_cntrl_32_flow_control_loop_pipe_sequential_init RTLNAME trace_cntrl_32_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME trace_cntrl_32_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME trace_cntrl_32 MODELNAME trace_cntrl_32 RTLNAME trace_cntrl_32 IS_TOP 1
    SUBMODULES {
      {MODELNAME trace_cntrl_32_trace_cntrl_s_axi RTLNAME trace_cntrl_32_trace_cntrl_s_axi BINDTYPE interface TYPE interface_s_axilite}
      {MODELNAME trace_cntrl_32_regslice_both RTLNAME trace_cntrl_32_regslice_both BINDTYPE interface TYPE interface_regslice INSTNAME trace_cntrl_32_regslice_both_U}
    }
  }
}
