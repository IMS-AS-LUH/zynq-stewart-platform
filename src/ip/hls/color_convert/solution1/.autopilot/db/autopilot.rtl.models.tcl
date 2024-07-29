set SynModuleInfo {
  {SRCNAME color_convert MODELNAME color_convert RTLNAME color_convert IS_TOP 1
    SUBMODULES {
      {MODELNAME color_convert_mul_10s_8ns_18_1_1 RTLNAME color_convert_mul_10s_8ns_18_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME color_convert_control_s_axi RTLNAME color_convert_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
      {MODELNAME color_convert_regslice_both RTLNAME color_convert_regslice_both BINDTYPE interface TYPE interface_regslice INSTNAME color_convert_regslice_both_U}
    }
  }
}
