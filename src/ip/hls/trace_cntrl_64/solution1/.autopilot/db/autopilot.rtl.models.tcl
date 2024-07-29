set SynModuleInfo {
  {SRCNAME trace_cntrl_64_Pipeline_VITIS_LOOP_27_1 MODELNAME trace_cntrl_64_Pipeline_VITIS_LOOP_27_1 RTLNAME trace_cntrl_64_trace_cntrl_64_Pipeline_VITIS_LOOP_27_1
    SUBMODULES {
      {MODELNAME trace_cntrl_64_flow_control_loop_pipe_sequential_init RTLNAME trace_cntrl_64_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME trace_cntrl_64_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME trace_cntrl_64 MODELNAME trace_cntrl_64 RTLNAME trace_cntrl_64 IS_TOP 1
    SUBMODULES {
      {MODELNAME trace_cntrl_64_trace_cntrl_s_axi RTLNAME trace_cntrl_64_trace_cntrl_s_axi BINDTYPE interface TYPE interface_s_axilite}
      {MODELNAME trace_cntrl_64_regslice_both RTLNAME trace_cntrl_64_regslice_both BINDTYPE interface TYPE interface_regslice INSTNAME trace_cntrl_64_regslice_both_U}
    }
  }
}
