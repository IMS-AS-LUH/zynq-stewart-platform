; ModuleID = 'C:/Users/Sebastian/Documents/Studium/Master/HwP/PYNQ/boards/ip/hls/color_convert/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>" = type { %"struct.hls::axis<ap_uint<24>, 1, 0, 0>" }
%"struct.hls::axis<ap_uint<24>, 1, 0, 0>" = type { %"struct.ap_uint<24>", %"struct.ap_uint<3>", %"struct.ap_uint<3>", %"struct.ap_uint<1>", %"struct.ap_uint<1>", %"struct.ap_uint<1>", %"struct.ap_uint<1>" }
%"struct.ap_uint<24>" = type { %"struct.ap_int_base<24, false>" }
%"struct.ap_int_base<24, false>" = type { %"struct.ssdm_int<24, false>" }
%"struct.ssdm_int<24, false>" = type { i24 }
%"struct.ap_uint<3>" = type { %"struct.ap_int_base<3, false>" }
%"struct.ap_int_base<3, false>" = type { %"struct.ssdm_int<3, false>" }
%"struct.ssdm_int<3, false>" = type { i3 }
%"struct.ap_uint<1>" = type { %"struct.ap_int_base<1, false>" }
%"struct.ap_int_base<1, false>" = type { %"struct.ssdm_int<1, false>" }
%"struct.ssdm_int<1, false>" = type { i1 }
%struct.coeffs = type { %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>", %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>", %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>" }
%"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>" = type { %"struct.ap_fixed_base<10, 2, true, AP_RND, AP_SAT, 0>" }
%"struct.ap_fixed_base<10, 2, true, AP_RND, AP_SAT, 0>" = type { %"struct.ssdm_int<10, true>" }
%"struct.ssdm_int<10, true>" = type { i10 }

; Function Attrs: noinline
define void @apatb_color_convert_ir(%"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* noalias nonnull dereferenceable(12) %stream_in_24, %"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* noalias nonnull dereferenceable(12) %stream_out_24, %struct.coeffs* noalias nocapture nonnull readonly dereferenceable(6) %c1, %struct.coeffs* noalias nocapture nonnull readonly dereferenceable(6) %c2, %struct.coeffs* noalias nocapture nonnull readonly dereferenceable(6) %c3, %struct.coeffs* noalias nocapture nonnull readonly dereferenceable(6) %bias) local_unnamed_addr #0 {
entry:
  %stream_in_24_copy.data = alloca i24
  %stream_in_24_copy.keep = alloca i3
  %stream_in_24_copy.strb = alloca i3
  %stream_in_24_copy.user = alloca i1
  %stream_in_24_copy.last = alloca i1
  %stream_out_24_copy.data = alloca i24
  %stream_out_24_copy.keep = alloca i3
  %stream_out_24_copy.strb = alloca i3
  %stream_out_24_copy.user = alloca i1
  %stream_out_24_copy.last = alloca i1
  %c1_copy.0 = alloca %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>", align 512
  %c1_copy.1 = alloca %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>", align 512
  %c1_copy.2 = alloca %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>", align 512
  %c2_copy.0 = alloca %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>", align 512
  %c2_copy.1 = alloca %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>", align 512
  %c2_copy.2 = alloca %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>", align 512
  %c3_copy.0 = alloca %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>", align 512
  %c3_copy.1 = alloca %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>", align 512
  %c3_copy.2 = alloca %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>", align 512
  %bias_copy.0 = alloca %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>", align 512
  %bias_copy.1 = alloca %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>", align 512
  %bias_copy.2 = alloca %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>", align 512
  call fastcc void @copy_in(%"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* nonnull %stream_in_24, i24* %stream_in_24_copy.data, i3* %stream_in_24_copy.keep, i3* %stream_in_24_copy.strb, i1* %stream_in_24_copy.user, i1* %stream_in_24_copy.last, %"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* nonnull %stream_out_24, i24* %stream_out_24_copy.data, i3* %stream_out_24_copy.keep, i3* %stream_out_24_copy.strb, i1* %stream_out_24_copy.user, i1* %stream_out_24_copy.last, %struct.coeffs* nonnull %c1, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* nonnull align 512 %c1_copy.0, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* nonnull align 512 %c1_copy.1, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* nonnull align 512 %c1_copy.2, %struct.coeffs* nonnull %c2, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* nonnull align 512 %c2_copy.0, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* nonnull align 512 %c2_copy.1, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* nonnull align 512 %c2_copy.2, %struct.coeffs* nonnull %c3, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* nonnull align 512 %c3_copy.0, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* nonnull align 512 %c3_copy.1, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* nonnull align 512 %c3_copy.2, %struct.coeffs* nonnull %bias, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* nonnull align 512 %bias_copy.0, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* nonnull align 512 %bias_copy.1, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* nonnull align 512 %bias_copy.2)
  call void @apatb_color_convert_hw(i24* %stream_in_24_copy.data, i3* %stream_in_24_copy.keep, i3* %stream_in_24_copy.strb, i1* %stream_in_24_copy.user, i1* %stream_in_24_copy.last, i24* %stream_out_24_copy.data, i3* %stream_out_24_copy.keep, i3* %stream_out_24_copy.strb, i1* %stream_out_24_copy.user, i1* %stream_out_24_copy.last, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* %c1_copy.0, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* %c1_copy.1, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* %c1_copy.2, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* %c2_copy.0, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* %c2_copy.1, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* %c2_copy.2, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* %c3_copy.0, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* %c3_copy.1, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* %c3_copy.2, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* %bias_copy.0, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* %bias_copy.1, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* %bias_copy.2)
  call void @copy_back(%"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* %stream_in_24, i24* %stream_in_24_copy.data, i3* %stream_in_24_copy.keep, i3* %stream_in_24_copy.strb, i1* %stream_in_24_copy.user, i1* %stream_in_24_copy.last, %"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* %stream_out_24, i24* %stream_out_24_copy.data, i3* %stream_out_24_copy.keep, i3* %stream_out_24_copy.strb, i1* %stream_out_24_copy.user, i1* %stream_out_24_copy.last, %struct.coeffs* %c1, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* %c1_copy.0, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* %c1_copy.1, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* %c1_copy.2, %struct.coeffs* %c2, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* %c2_copy.0, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* %c2_copy.1, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* %c2_copy.2, %struct.coeffs* %c3, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* %c3_copy.0, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* %c3_copy.1, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* %c3_copy.2, %struct.coeffs* %bias, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* %bias_copy.0, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* %bias_copy.1, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* %bias_copy.2)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_in(%"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* noalias "unpacked"="0", i24* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.0" %_V_data_V, i3* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.1" %_V_keep_V, i3* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.2" %_V_strb_V, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.3" %_V_user_V, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.4" %_V_last_V, %"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* noalias "unpacked"="2", i24* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="3.0" %_V_data_V1, i3* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="3.1" %_V_keep_V2, i3* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="3.2" %_V_strb_V3, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="3.3" %_V_user_V4, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="3.4" %_V_last_V5, %struct.coeffs* noalias readonly "unpacked"="4", %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* noalias nocapture align 512 "unpacked"="5.0" %.0, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* noalias nocapture align 512 "unpacked"="5.1" %.1, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* noalias nocapture align 512 "unpacked"="5.2" %.2, %struct.coeffs* noalias readonly "unpacked"="6", %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* noalias nocapture align 512 "unpacked"="7.0" %.01, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* noalias nocapture align 512 "unpacked"="7.1" %.12, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* noalias nocapture align 512 "unpacked"="7.2" %.23, %struct.coeffs* noalias readonly "unpacked"="8", %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* noalias nocapture align 512 "unpacked"="9.0" %.02, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* noalias nocapture align 512 "unpacked"="9.1" %.13, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* noalias nocapture align 512 "unpacked"="9.2" %.24, %struct.coeffs* noalias readonly "unpacked"="10", %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* noalias nocapture align 512 "unpacked"="11.0" %.03, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* noalias nocapture align 512 "unpacked"="11.1" %.14, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* noalias nocapture align 512 "unpacked"="11.2" %.25) unnamed_addr #1 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>.44"(i24* %_V_data_V, i3* %_V_keep_V, i3* %_V_strb_V, i1* %_V_user_V, i1* %_V_last_V, %"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* %0)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>.44"(i24* %_V_data_V1, i3* %_V_keep_V2, i3* %_V_strb_V3, i1* %_V_user_V4, i1* %_V_last_V5, %"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* %1)
  call fastcc void @onebyonecpy_hls.p0struct.coeffs.22(%"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* align 512 %.0, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* align 512 %.1, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* align 512 %.2, %struct.coeffs* %2)
  call fastcc void @onebyonecpy_hls.p0struct.coeffs.22(%"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* align 512 %.01, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* align 512 %.12, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* align 512 %.23, %struct.coeffs* %3)
  call fastcc void @onebyonecpy_hls.p0struct.coeffs.22(%"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* align 512 %.02, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* align 512 %.13, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* align 512 %.24, %struct.coeffs* %4)
  call fastcc void @onebyonecpy_hls.p0struct.coeffs.22(%"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* align 512 %.03, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* align 512 %.14, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* align 512 %.25, %struct.coeffs* %5)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_out(%"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* noalias "unpacked"="0", i24* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.0" %_V_data_V, i3* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.1" %_V_keep_V, i3* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.2" %_V_strb_V, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.3" %_V_user_V, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.4" %_V_last_V, %"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* noalias "unpacked"="2", i24* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="3.0" %_V_data_V1, i3* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="3.1" %_V_keep_V2, i3* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="3.2" %_V_strb_V3, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="3.3" %_V_user_V4, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="3.4" %_V_last_V5, %struct.coeffs* noalias "unpacked"="4", %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* noalias nocapture readonly align 512 "unpacked"="5.0" %.0, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* noalias nocapture readonly align 512 "unpacked"="5.1" %.1, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* noalias nocapture readonly align 512 "unpacked"="5.2" %.2, %struct.coeffs* noalias "unpacked"="6", %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* noalias nocapture readonly align 512 "unpacked"="7.0" %.01, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* noalias nocapture readonly align 512 "unpacked"="7.1" %.12, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* noalias nocapture readonly align 512 "unpacked"="7.2" %.23, %struct.coeffs* noalias "unpacked"="8", %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* noalias nocapture readonly align 512 "unpacked"="9.0" %.02, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* noalias nocapture readonly align 512 "unpacked"="9.1" %.13, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* noalias nocapture readonly align 512 "unpacked"="9.2" %.24, %struct.coeffs* noalias "unpacked"="10", %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* noalias nocapture readonly align 512 "unpacked"="11.0" %.03, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* noalias nocapture readonly align 512 "unpacked"="11.1" %.14, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* noalias nocapture readonly align 512 "unpacked"="11.2" %.25) unnamed_addr #2 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"(%"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* %0, i24* %_V_data_V, i3* %_V_keep_V, i3* %_V_strb_V, i1* %_V_user_V, i1* %_V_last_V)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"(%"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* %1, i24* %_V_data_V1, i3* %_V_keep_V2, i3* %_V_strb_V3, i1* %_V_user_V4, i1* %_V_last_V5)
  call fastcc void @onebyonecpy_hls.p0struct.coeffs(%struct.coeffs* %2, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* align 512 %.0, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* align 512 %.1, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* align 512 %.2)
  call fastcc void @onebyonecpy_hls.p0struct.coeffs(%struct.coeffs* %3, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* align 512 %.01, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* align 512 %.12, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* align 512 %.23)
  call fastcc void @onebyonecpy_hls.p0struct.coeffs(%struct.coeffs* %4, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* align 512 %.02, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* align 512 %.13, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* align 512 %.24)
  call fastcc void @onebyonecpy_hls.p0struct.coeffs(%struct.coeffs* %5, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* align 512 %.03, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* align 512 %.14, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* align 512 %.25)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @onebyonecpy_hls.p0struct.coeffs(%struct.coeffs* noalias "unpacked"="0", %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* noalias nocapture readonly align 512 "unpacked"="1.0" %.0, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* noalias nocapture readonly align 512 "unpacked"="1.1" %.1, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* noalias nocapture readonly align 512 "unpacked"="1.2" %.2) unnamed_addr #3 {
entry:
  %1 = icmp eq %struct.coeffs* %0, null
  br i1 %1, label %ret, label %copy

copy:                                             ; preds = %entry
  %.0.0.0.08 = getelementptr %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>", %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* %.0, i32 0, i32 0, i32 0, i32 0
  %.01.0.0.09 = getelementptr %struct.coeffs, %struct.coeffs* %0, i32 0, i32 0, i32 0, i32 0, i32 0
  %2 = bitcast i10* %.0.0.0.08 to i16*
  %3 = load i16, i16* %2
  %4 = trunc i16 %3 to i10
  store i10 %4, i10* %.01.0.0.09, align 2
  %.1.0.0.014 = getelementptr %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>", %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* %.1, i32 0, i32 0, i32 0, i32 0
  %.12.0.0.015 = getelementptr %struct.coeffs, %struct.coeffs* %0, i32 0, i32 1, i32 0, i32 0, i32 0
  %5 = bitcast i10* %.1.0.0.014 to i16*
  %6 = load i16, i16* %5
  %7 = trunc i16 %6 to i10
  store i10 %7, i10* %.12.0.0.015, align 2
  %.2.0.0.020 = getelementptr %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>", %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* %.2, i32 0, i32 0, i32 0, i32 0
  %.23.0.0.021 = getelementptr %struct.coeffs, %struct.coeffs* %0, i32 0, i32 2, i32 0, i32 0, i32 0
  %8 = bitcast i10* %.2.0.0.020 to i16*
  %9 = load i16, i16* %8
  %10 = trunc i16 %9 to i10
  store i10 %10, i10* %.23.0.0.021, align 2
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @onebyonecpy_hls.p0struct.coeffs.22(%"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* noalias nocapture align 512 "unpacked"="0.0" %.0, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* noalias nocapture align 512 "unpacked"="0.1" %.1, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* noalias nocapture align 512 "unpacked"="0.2" %.2, %struct.coeffs* noalias readonly "unpacked"="1") unnamed_addr #3 {
entry:
  %1 = icmp eq %struct.coeffs* %0, null
  br i1 %1, label %ret, label %copy

copy:                                             ; preds = %entry
  %.0.0.0.08 = getelementptr %struct.coeffs, %struct.coeffs* %0, i32 0, i32 0, i32 0, i32 0, i32 0
  %.01.0.0.09 = getelementptr %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>", %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* %.0, i32 0, i32 0, i32 0, i32 0
  %2 = bitcast i10* %.0.0.0.08 to i16*
  %3 = load i16, i16* %2
  %4 = trunc i16 %3 to i10
  store i10 %4, i10* %.01.0.0.09, align 512
  %.1.0.0.014 = getelementptr %struct.coeffs, %struct.coeffs* %0, i32 0, i32 1, i32 0, i32 0, i32 0
  %.12.0.0.015 = getelementptr %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>", %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* %.1, i32 0, i32 0, i32 0, i32 0
  %5 = bitcast i10* %.1.0.0.014 to i16*
  %6 = load i16, i16* %5
  %7 = trunc i16 %6 to i10
  store i10 %7, i10* %.12.0.0.015, align 512
  %.2.0.0.020 = getelementptr %struct.coeffs, %struct.coeffs* %0, i32 0, i32 2, i32 0, i32 0, i32 0
  %.23.0.0.021 = getelementptr %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>", %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* %.2, i32 0, i32 0, i32 0, i32 0
  %8 = bitcast i10* %.2.0.0.020 to i16*
  %9 = load i16, i16* %8
  %10 = trunc i16 %9 to i10
  store i10 %10, i10* %.23.0.0.021, align 512
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"(%"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", i24* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.0" %_V_data_V, i3* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.1" %_V_keep_V, i3* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.2" %_V_strb_V, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.3" %_V_user_V, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.4" %_V_last_V) unnamed_addr #4 {
entry:
  %1 = icmp eq %"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* %0, null
  %2 = or i1 %1, false
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>.39"(%"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* nonnull align 512 %0, i24* %_V_data_V, i3* %_V_keep_V, i3* %_V_strb_V, i1* %_V_user_V, i1* %_V_last_V)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>.39"(%"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* noalias nocapture align 512 "fpga.caller.interfaces"="layout_transformed", i24* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.0" %_V_data_V, i3* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.1" %_V_keep_V, i3* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.2" %_V_strb_V, i1* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.3" %_V_user_V, i1* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.4" %_V_last_V) unnamed_addr #5 {
entry:
  %1 = alloca %"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"
  %2 = alloca i24
  %3 = alloca i3
  %4 = alloca i3
  %5 = alloca i1
  %6 = alloca i1
  br label %empty

empty:                                            ; preds = %push, %entry
  %7 = bitcast i24* %_V_data_V to i8*
  %8 = call i1 @fpga_fifo_not_empty_4(i8* %7)
  br i1 %8, label %push, label %ret

push:                                             ; preds = %empty
  %9 = bitcast i24* %2 to i8*
  %10 = bitcast i24* %_V_data_V to i8*
  call void @fpga_fifo_pop_4(i8* %9, i8* %10)
  %11 = load volatile i24, i24* %2
  %12 = getelementptr inbounds %"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>", %"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* %1, i32 0, i32 0, i32 0
  %13 = bitcast %"struct.ap_uint<24>"* %12 to i24*
  store i24 %11, i24* %13
  %14 = bitcast i3* %4 to i8*
  %15 = bitcast i3* %_V_keep_V to i8*
  call void @fpga_fifo_pop_1(i8* %14, i8* %15)
  %16 = bitcast i3* %4 to i8*
  %17 = load i8, i8* %16
  %18 = trunc i8 %17 to i3
  %19 = getelementptr inbounds %"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>", %"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* %1, i32 0, i32 0, i32 1
  %20 = bitcast %"struct.ap_uint<3>"* %19 to i3*
  store i3 %18, i3* %20
  %21 = bitcast i3* %3 to i8*
  %22 = bitcast i3* %_V_strb_V to i8*
  call void @fpga_fifo_pop_1(i8* %21, i8* %22)
  %23 = bitcast i3* %3 to i8*
  %24 = load i8, i8* %23
  %25 = trunc i8 %24 to i3
  %26 = getelementptr inbounds %"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>", %"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* %1, i32 0, i32 0, i32 2
  %27 = bitcast %"struct.ap_uint<3>"* %26 to i3*
  store i3 %25, i3* %27
  %28 = bitcast i1* %6 to i8*
  %29 = bitcast i1* %_V_user_V to i8*
  call void @fpga_fifo_pop_1(i8* %28, i8* %29)
  %30 = bitcast i1* %6 to i8*
  %31 = load i8, i8* %30
  %32 = trunc i8 %31 to i1
  %33 = getelementptr inbounds %"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>", %"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* %1, i32 0, i32 0, i32 3
  %34 = bitcast %"struct.ap_uint<1>"* %33 to i1*
  store i1 %32, i1* %34
  %35 = bitcast i1* %5 to i8*
  %36 = bitcast i1* %_V_last_V to i8*
  call void @fpga_fifo_pop_1(i8* %35, i8* %36)
  %37 = bitcast i1* %5 to i8*
  %38 = load i8, i8* %37
  %39 = trunc i8 %38 to i1
  %40 = getelementptr inbounds %"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>", %"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* %1, i32 0, i32 0, i32 4
  %41 = bitcast %"struct.ap_uint<1>"* %40 to i1*
  store i1 %39, i1* %41
  %42 = bitcast %"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* %1 to i8*
  %43 = bitcast %"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* %0 to i8*
  call void @fpga_fifo_push_12(i8* %42, i8* %43)
  br label %empty, !llvm.loop !5

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>.44"(i24* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.0" %_V_data_V, i3* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.1" %_V_keep_V, i3* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.2" %_V_strb_V, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.3" %_V_user_V, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.4" %_V_last_V, %"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* noalias "fpga.caller.interfaces"="layout_transformed") unnamed_addr #4 {
entry:
  %1 = icmp eq %"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* %0, null
  %2 = or i1 false, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>.47"(i24* %_V_data_V, i3* %_V_keep_V, i3* %_V_strb_V, i1* %_V_user_V, i1* %_V_last_V, %"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* nonnull %0)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>.47"(i24* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.0" %_V_data_V, i3* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.1" %_V_keep_V, i3* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.2" %_V_strb_V, i1* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.3" %_V_user_V, i1* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.4" %_V_last_V, %"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* noalias nocapture "fpga.caller.interfaces"="layout_transformed") unnamed_addr #5 {
entry:
  %1 = alloca %"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"
  %2 = alloca %"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* %0 to i8*
  %4 = call i1 @fpga_fifo_not_empty_12(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* %2 to i8*
  %6 = bitcast %"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* %0 to i8*
  call void @fpga_fifo_pop_12(i8* %5, i8* %6)
  %7 = load volatile %"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>", %"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* %2
  store %"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>" %7, %"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* %1
  %8 = getelementptr inbounds %"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>", %"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* %1, i32 0, i32 0, i32 0
  %9 = bitcast %"struct.ap_uint<24>"* %8 to i24*
  %10 = bitcast i24* %9 to i8*
  %11 = bitcast i24* %_V_data_V to i8*
  call void @fpga_fifo_push_4(i8* %10, i8* %11)
  %12 = getelementptr inbounds %"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>", %"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* %1, i32 0, i32 0, i32 1
  %13 = bitcast %"struct.ap_uint<3>"* %12 to i3*
  %14 = bitcast i3* %13 to i8*
  %15 = bitcast i3* %_V_keep_V to i8*
  call void @fpga_fifo_push_1(i8* %14, i8* %15)
  %16 = getelementptr inbounds %"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>", %"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* %1, i32 0, i32 0, i32 2
  %17 = bitcast %"struct.ap_uint<3>"* %16 to i3*
  %18 = bitcast i3* %17 to i8*
  %19 = bitcast i3* %_V_strb_V to i8*
  call void @fpga_fifo_push_1(i8* %18, i8* %19)
  %20 = getelementptr inbounds %"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>", %"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* %1, i32 0, i32 0, i32 3
  %21 = bitcast %"struct.ap_uint<1>"* %20 to i1*
  %22 = bitcast i1* %21 to i8*
  %23 = bitcast i1* %_V_user_V to i8*
  call void @fpga_fifo_push_1(i8* %22, i8* %23)
  %24 = getelementptr inbounds %"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>", %"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* %1, i32 0, i32 0, i32 4
  %25 = bitcast %"struct.ap_uint<1>"* %24 to i1*
  %26 = bitcast i1* %25 to i8*
  %27 = bitcast i1* %_V_last_V to i8*
  call void @fpga_fifo_push_1(i8* %26, i8* %27)
  br label %empty, !llvm.loop !5

ret:                                              ; preds = %empty
  ret void
}

declare void @apatb_color_convert_hw(i24*, i3*, i3*, i1*, i1*, i24*, i3*, i3*, i1*, i1*, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"*, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"*, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"*, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"*, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"*, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"*, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"*, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"*, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"*, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"*, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"*, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"*)

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_back(%"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* noalias "unpacked"="0", i24* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.0" %_V_data_V, i3* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.1" %_V_keep_V, i3* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.2" %_V_strb_V, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.3" %_V_user_V, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.4" %_V_last_V, %"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* noalias "unpacked"="2", i24* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="3.0" %_V_data_V1, i3* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="3.1" %_V_keep_V2, i3* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="3.2" %_V_strb_V3, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="3.3" %_V_user_V4, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="3.4" %_V_last_V5, %struct.coeffs* noalias "unpacked"="4", %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* noalias nocapture readonly align 512 "unpacked"="5.0" %.0, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* noalias nocapture readonly align 512 "unpacked"="5.1" %.1, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* noalias nocapture readonly align 512 "unpacked"="5.2" %.2, %struct.coeffs* noalias "unpacked"="6", %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* noalias nocapture readonly align 512 "unpacked"="7.0" %.01, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* noalias nocapture readonly align 512 "unpacked"="7.1" %.12, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* noalias nocapture readonly align 512 "unpacked"="7.2" %.23, %struct.coeffs* noalias "unpacked"="8", %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* noalias nocapture readonly align 512 "unpacked"="9.0" %.02, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* noalias nocapture readonly align 512 "unpacked"="9.1" %.13, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* noalias nocapture readonly align 512 "unpacked"="9.2" %.24, %struct.coeffs* noalias "unpacked"="10", %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* noalias nocapture readonly align 512 "unpacked"="11.0" %.03, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* noalias nocapture readonly align 512 "unpacked"="11.1" %.14, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* noalias nocapture readonly align 512 "unpacked"="11.2" %.25) unnamed_addr #2 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"(%"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* %0, i24* %_V_data_V, i3* %_V_keep_V, i3* %_V_strb_V, i1* %_V_user_V, i1* %_V_last_V)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"(%"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* %1, i24* %_V_data_V1, i3* %_V_keep_V2, i3* %_V_strb_V3, i1* %_V_user_V4, i1* %_V_last_V5)
  ret void
}

define void @color_convert_hw_stub_wrapper(i24*, i3*, i3*, i1*, i1*, i24*, i3*, i3*, i1*, i1*, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"*, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"*, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"*, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"*, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"*, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"*, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"*, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"*, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"*, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"*, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"*, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"*) #6 {
entry:
  %22 = alloca %"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"
  %23 = alloca %"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"
  %24 = alloca %struct.coeffs
  %25 = alloca %struct.coeffs
  %26 = alloca %struct.coeffs
  %27 = alloca %struct.coeffs
  call void @copy_out(%"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* %22, i24* %0, i3* %1, i3* %2, i1* %3, i1* %4, %"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* %23, i24* %5, i3* %6, i3* %7, i1* %8, i1* %9, %struct.coeffs* %24, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* %10, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* %11, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* %12, %struct.coeffs* %25, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* %13, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* %14, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* %15, %struct.coeffs* %26, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* %16, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* %17, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* %18, %struct.coeffs* %27, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* %19, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* %20, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* %21)
  call void @color_convert_hw_stub(%"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* %22, %"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* %23, %struct.coeffs* %24, %struct.coeffs* %25, %struct.coeffs* %26, %struct.coeffs* %27)
  call void @copy_in(%"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* %22, i24* %0, i3* %1, i3* %2, i1* %3, i1* %4, %"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* %23, i24* %5, i3* %6, i3* %7, i1* %8, i1* %9, %struct.coeffs* %24, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* %10, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* %11, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* %12, %struct.coeffs* %25, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* %13, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* %14, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* %15, %struct.coeffs* %26, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* %16, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* %17, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* %18, %struct.coeffs* %27, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* %19, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* %20, %"struct.ap_fixed<10, 2, AP_RND, AP_SAT, 0>"* %21)
  ret void
}

declare void @color_convert_hw_stub(%"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"*, %"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"*, %struct.coeffs*, %struct.coeffs*, %struct.coeffs*, %struct.coeffs*)

declare i1 @fpga_fifo_not_empty_12(i8*)

declare i1 @fpga_fifo_not_empty_4(i8*)

declare void @fpga_fifo_pop_12(i8*, i8*)

declare void @fpga_fifo_pop_4(i8*, i8*)

declare void @fpga_fifo_pop_1(i8*, i8*)

declare void @fpga_fifo_push_12(i8*, i8*)

declare void @fpga_fifo_push_4(i8*, i8*)

declare void @fpga_fifo_push_1(i8*, i8*)

attributes #0 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #1 = { argmemonly noinline "fpga.wrapper.func"="copyin" }
attributes #2 = { argmemonly noinline "fpga.wrapper.func"="copyout" }
attributes #3 = { argmemonly noinline norecurse "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #4 = { argmemonly noinline "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #5 = { argmemonly noinline "fpga.wrapper.func"="streamcpy_hls" }
attributes #6 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.rotate.disable"}
