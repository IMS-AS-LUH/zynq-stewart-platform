; ModuleID = 'C:/Users/Sebastian/Documents/Studium/Master/HwP/PYNQ/boards/ip/hls/pixel_unpack/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%"class.hls::stream<hls::axis<ap_uint<32>, 1, 0, 0>, 0>" = type { %"struct.hls::axis<ap_uint<32>, 1, 0, 0>" }
%"struct.hls::axis<ap_uint<32>, 1, 0, 0>" = type { %"struct.ap_uint<32>", %"struct.ap_uint<4>", %"struct.ap_uint<4>", %"struct.ap_uint<1>", %"struct.ap_uint<1>", %"struct.ap_uint<1>", %"struct.ap_uint<1>" }
%"struct.ap_uint<32>" = type { %"struct.ap_int_base<32, false>" }
%"struct.ap_int_base<32, false>" = type { %"struct.ssdm_int<32, false>" }
%"struct.ssdm_int<32, false>" = type { i32 }
%"struct.ap_uint<4>" = type { %"struct.ap_int_base<4, false>" }
%"struct.ap_int_base<4, false>" = type { %"struct.ssdm_int<4, false>" }
%"struct.ssdm_int<4, false>" = type { i4 }
%"struct.ap_uint<1>" = type { %"struct.ap_int_base<1, false>" }
%"struct.ap_int_base<1, false>" = type { %"struct.ssdm_int<1, false>" }
%"struct.ssdm_int<1, false>" = type { i1 }
%"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>" = type { %"struct.hls::axis<ap_uint<24>, 1, 0, 0>" }
%"struct.hls::axis<ap_uint<24>, 1, 0, 0>" = type { %"struct.ap_uint<24>", %"struct.ap_uint<3>", %"struct.ap_uint<3>", %"struct.ap_uint<1>", %"struct.ap_uint<1>", %"struct.ap_uint<1>", %"struct.ap_uint<1>" }
%"struct.ap_uint<24>" = type { %"struct.ap_int_base<24, false>" }
%"struct.ap_int_base<24, false>" = type { %"struct.ssdm_int<24, false>" }
%"struct.ssdm_int<24, false>" = type { i24 }
%"struct.ap_uint<3>" = type { %"struct.ap_int_base<3, false>" }
%"struct.ap_int_base<3, false>" = type { %"struct.ssdm_int<3, false>" }
%"struct.ssdm_int<3, false>" = type { i3 }

; Function Attrs: noinline
define void @apatb_pixel_unpack_ir(%"class.hls::stream<hls::axis<ap_uint<32>, 1, 0, 0>, 0>"* noalias nonnull dereferenceable(12) %stream_in_32, %"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* noalias nonnull dereferenceable(12) %stream_out_24, i32 %mode) local_unnamed_addr #0 {
entry:
  %stream_in_32_copy.data = alloca i32
  %stream_in_32_copy.keep = alloca i4
  %stream_in_32_copy.strb = alloca i4
  %stream_in_32_copy.user = alloca i1
  %stream_in_32_copy.last = alloca i1
  %stream_out_24_copy.data = alloca i24
  %stream_out_24_copy.keep = alloca i3
  %stream_out_24_copy.strb = alloca i3
  %stream_out_24_copy.user = alloca i1
  %stream_out_24_copy.last = alloca i1
  call fastcc void @copy_in(%"class.hls::stream<hls::axis<ap_uint<32>, 1, 0, 0>, 0>"* nonnull %stream_in_32, i32* %stream_in_32_copy.data, i4* %stream_in_32_copy.keep, i4* %stream_in_32_copy.strb, i1* %stream_in_32_copy.user, i1* %stream_in_32_copy.last, %"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* nonnull %stream_out_24, i24* %stream_out_24_copy.data, i3* %stream_out_24_copy.keep, i3* %stream_out_24_copy.strb, i1* %stream_out_24_copy.user, i1* %stream_out_24_copy.last)
  call void @apatb_pixel_unpack_hw(i32* %stream_in_32_copy.data, i4* %stream_in_32_copy.keep, i4* %stream_in_32_copy.strb, i1* %stream_in_32_copy.user, i1* %stream_in_32_copy.last, i24* %stream_out_24_copy.data, i3* %stream_out_24_copy.keep, i3* %stream_out_24_copy.strb, i1* %stream_out_24_copy.user, i1* %stream_out_24_copy.last, i32 %mode)
  call void @copy_back(%"class.hls::stream<hls::axis<ap_uint<32>, 1, 0, 0>, 0>"* %stream_in_32, i32* %stream_in_32_copy.data, i4* %stream_in_32_copy.keep, i4* %stream_in_32_copy.strb, i1* %stream_in_32_copy.user, i1* %stream_in_32_copy.last, %"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* %stream_out_24, i24* %stream_out_24_copy.data, i3* %stream_out_24_copy.keep, i3* %stream_out_24_copy.strb, i1* %stream_out_24_copy.user, i1* %stream_out_24_copy.last)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_in(%"class.hls::stream<hls::axis<ap_uint<32>, 1, 0, 0>, 0>"* noalias, i32* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.0" %_V_data_V, i4* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.1" %_V_keep_V, i4* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.2" %_V_strb_V, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.3" %_V_user_V, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.4" %_V_last_V, %"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* noalias, i24* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="3.0" %_V_data_V1, i3* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="3.1" %_V_keep_V2, i3* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="3.2" %_V_strb_V3, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="3.3" %_V_user_V4, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="3.4" %_V_last_V5) unnamed_addr #1 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<32>, 1, 0, 0>, 0>.15"(i32* %_V_data_V, i4* %_V_keep_V, i4* %_V_strb_V, i1* %_V_user_V, i1* %_V_last_V, %"class.hls::stream<hls::axis<ap_uint<32>, 1, 0, 0>, 0>"* %0)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"(i24* %_V_data_V1, i3* %_V_keep_V2, i3* %_V_strb_V3, i1* %_V_user_V4, i1* %_V_last_V5, %"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* %1)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<32>, 1, 0, 0>, 0>"(%"class.hls::stream<hls::axis<ap_uint<32>, 1, 0, 0>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", i32* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.0" %_V_data_V, i4* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.1" %_V_keep_V, i4* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.2" %_V_strb_V, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.3" %_V_user_V, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.4" %_V_last_V) unnamed_addr #2 {
entry:
  %1 = icmp eq %"class.hls::stream<hls::axis<ap_uint<32>, 1, 0, 0>, 0>"* %0, null
  %2 = or i1 %1, false
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<hls::axis<ap_uint<32>, 1, 0, 0>, 0>"(%"class.hls::stream<hls::axis<ap_uint<32>, 1, 0, 0>, 0>"* nonnull align 512 %0, i32* %_V_data_V, i4* %_V_keep_V, i4* %_V_strb_V, i1* %_V_user_V, i1* %_V_last_V)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<hls::axis<ap_uint<32>, 1, 0, 0>, 0>"(%"class.hls::stream<hls::axis<ap_uint<32>, 1, 0, 0>, 0>"* noalias nocapture align 512 "fpga.caller.interfaces"="layout_transformed", i32* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.0" %_V_data_V, i4* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.1" %_V_keep_V, i4* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.2" %_V_strb_V, i1* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.3" %_V_user_V, i1* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.4" %_V_last_V) unnamed_addr #3 {
entry:
  %1 = alloca %"class.hls::stream<hls::axis<ap_uint<32>, 1, 0, 0>, 0>"
  %2 = alloca i1
  %3 = alloca i1
  %4 = alloca i32
  %5 = alloca i4
  %6 = alloca i4
  br label %empty

empty:                                            ; preds = %push, %entry
  %7 = bitcast i32* %_V_data_V to i8*
  %8 = call i1 @fpga_fifo_not_empty_4(i8* %7)
  br i1 %8, label %push, label %ret

push:                                             ; preds = %empty
  %9 = bitcast i32* %4 to i8*
  %10 = bitcast i32* %_V_data_V to i8*
  call void @fpga_fifo_pop_4(i8* %9, i8* %10)
  %11 = load volatile i32, i32* %4
  %12 = getelementptr inbounds %"class.hls::stream<hls::axis<ap_uint<32>, 1, 0, 0>, 0>", %"class.hls::stream<hls::axis<ap_uint<32>, 1, 0, 0>, 0>"* %1, i32 0, i32 0, i32 0
  %13 = bitcast %"struct.ap_uint<32>"* %12 to i32*
  store i32 %11, i32* %13
  %14 = bitcast i4* %6 to i8*
  %15 = bitcast i4* %_V_keep_V to i8*
  call void @fpga_fifo_pop_1(i8* %14, i8* %15)
  %16 = bitcast i4* %6 to i8*
  %17 = load i8, i8* %16
  %18 = trunc i8 %17 to i4
  %19 = getelementptr inbounds %"class.hls::stream<hls::axis<ap_uint<32>, 1, 0, 0>, 0>", %"class.hls::stream<hls::axis<ap_uint<32>, 1, 0, 0>, 0>"* %1, i32 0, i32 0, i32 1
  %20 = bitcast %"struct.ap_uint<4>"* %19 to i4*
  store i4 %18, i4* %20
  %21 = bitcast i4* %5 to i8*
  %22 = bitcast i4* %_V_strb_V to i8*
  call void @fpga_fifo_pop_1(i8* %21, i8* %22)
  %23 = bitcast i4* %5 to i8*
  %24 = load i8, i8* %23
  %25 = trunc i8 %24 to i4
  %26 = getelementptr inbounds %"class.hls::stream<hls::axis<ap_uint<32>, 1, 0, 0>, 0>", %"class.hls::stream<hls::axis<ap_uint<32>, 1, 0, 0>, 0>"* %1, i32 0, i32 0, i32 2
  %27 = bitcast %"struct.ap_uint<4>"* %26 to i4*
  store i4 %25, i4* %27
  %28 = bitcast i1* %3 to i8*
  %29 = bitcast i1* %_V_user_V to i8*
  call void @fpga_fifo_pop_1(i8* %28, i8* %29)
  %30 = bitcast i1* %3 to i8*
  %31 = load i8, i8* %30
  %32 = trunc i8 %31 to i1
  %33 = getelementptr inbounds %"class.hls::stream<hls::axis<ap_uint<32>, 1, 0, 0>, 0>", %"class.hls::stream<hls::axis<ap_uint<32>, 1, 0, 0>, 0>"* %1, i32 0, i32 0, i32 3
  %34 = bitcast %"struct.ap_uint<1>"* %33 to i1*
  store i1 %32, i1* %34
  %35 = bitcast i1* %2 to i8*
  %36 = bitcast i1* %_V_last_V to i8*
  call void @fpga_fifo_pop_1(i8* %35, i8* %36)
  %37 = bitcast i1* %2 to i8*
  %38 = load i8, i8* %37
  %39 = trunc i8 %38 to i1
  %40 = getelementptr inbounds %"class.hls::stream<hls::axis<ap_uint<32>, 1, 0, 0>, 0>", %"class.hls::stream<hls::axis<ap_uint<32>, 1, 0, 0>, 0>"* %1, i32 0, i32 0, i32 4
  %41 = bitcast %"struct.ap_uint<1>"* %40 to i1*
  store i1 %39, i1* %41
  %42 = bitcast %"class.hls::stream<hls::axis<ap_uint<32>, 1, 0, 0>, 0>"* %1 to i8*
  %43 = bitcast %"class.hls::stream<hls::axis<ap_uint<32>, 1, 0, 0>, 0>"* %0 to i8*
  call void @fpga_fifo_push_12(i8* %42, i8* %43)
  br label %empty, !llvm.loop !5

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"(i24* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.0" %_V_data_V, i3* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.1" %_V_keep_V, i3* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.2" %_V_strb_V, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.3" %_V_user_V, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.4" %_V_last_V, %"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* noalias "fpga.caller.interfaces"="layout_transformed") unnamed_addr #2 {
entry:
  %1 = icmp eq %"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* %0, null
  %2 = or i1 false, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"(i24* %_V_data_V, i3* %_V_keep_V, i3* %_V_strb_V, i1* %_V_user_V, i1* %_V_last_V, %"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* nonnull %0)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"(i24* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.0" %_V_data_V, i3* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.1" %_V_keep_V, i3* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.2" %_V_strb_V, i1* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.3" %_V_user_V, i1* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.4" %_V_last_V, %"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* noalias nocapture "fpga.caller.interfaces"="layout_transformed") unnamed_addr #3 {
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
  br label %empty, !llvm.loop !7

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_out(%"class.hls::stream<hls::axis<ap_uint<32>, 1, 0, 0>, 0>"* noalias, i32* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.0" %_V_data_V, i4* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.1" %_V_keep_V, i4* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.2" %_V_strb_V, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.3" %_V_user_V, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.4" %_V_last_V, %"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* noalias, i24* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="3.0" %_V_data_V1, i3* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="3.1" %_V_keep_V2, i3* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="3.2" %_V_strb_V3, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="3.3" %_V_user_V4, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="3.4" %_V_last_V5) unnamed_addr #4 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<32>, 1, 0, 0>, 0>"(%"class.hls::stream<hls::axis<ap_uint<32>, 1, 0, 0>, 0>"* %0, i32* %_V_data_V, i4* %_V_keep_V, i4* %_V_strb_V, i1* %_V_user_V, i1* %_V_last_V)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>.4"(%"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* %1, i24* %_V_data_V1, i3* %_V_keep_V2, i3* %_V_strb_V3, i1* %_V_user_V4, i1* %_V_last_V5)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>.4"(%"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", i24* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.0" %_V_data_V, i3* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.1" %_V_keep_V, i3* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.2" %_V_strb_V, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.3" %_V_user_V, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.4" %_V_last_V) unnamed_addr #2 {
entry:
  %1 = icmp eq %"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* %0, null
  %2 = or i1 %1, false
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>.7"(%"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* nonnull align 512 %0, i24* %_V_data_V, i3* %_V_keep_V, i3* %_V_strb_V, i1* %_V_user_V, i1* %_V_last_V)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>.7"(%"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* noalias nocapture align 512 "fpga.caller.interfaces"="layout_transformed", i24* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.0" %_V_data_V, i3* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.1" %_V_keep_V, i3* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.2" %_V_strb_V, i1* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.3" %_V_user_V, i1* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.4" %_V_last_V) unnamed_addr #3 {
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
  br label %empty, !llvm.loop !7

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<32>, 1, 0, 0>, 0>.15"(i32* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.0" %_V_data_V, i4* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.1" %_V_keep_V, i4* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.2" %_V_strb_V, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.3" %_V_user_V, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.4" %_V_last_V, %"class.hls::stream<hls::axis<ap_uint<32>, 1, 0, 0>, 0>"* noalias "fpga.caller.interfaces"="layout_transformed") unnamed_addr #2 {
entry:
  %1 = icmp eq %"class.hls::stream<hls::axis<ap_uint<32>, 1, 0, 0>, 0>"* %0, null
  %2 = or i1 false, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<hls::axis<ap_uint<32>, 1, 0, 0>, 0>.18"(i32* %_V_data_V, i4* %_V_keep_V, i4* %_V_strb_V, i1* %_V_user_V, i1* %_V_last_V, %"class.hls::stream<hls::axis<ap_uint<32>, 1, 0, 0>, 0>"* nonnull %0)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<hls::axis<ap_uint<32>, 1, 0, 0>, 0>.18"(i32* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.0" %_V_data_V, i4* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.1" %_V_keep_V, i4* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.2" %_V_strb_V, i1* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.3" %_V_user_V, i1* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.4" %_V_last_V, %"class.hls::stream<hls::axis<ap_uint<32>, 1, 0, 0>, 0>"* noalias nocapture "fpga.caller.interfaces"="layout_transformed") unnamed_addr #3 {
entry:
  %1 = alloca %"class.hls::stream<hls::axis<ap_uint<32>, 1, 0, 0>, 0>"
  %2 = alloca %"class.hls::stream<hls::axis<ap_uint<32>, 1, 0, 0>, 0>"
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %"class.hls::stream<hls::axis<ap_uint<32>, 1, 0, 0>, 0>"* %0 to i8*
  %4 = call i1 @fpga_fifo_not_empty_12(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %"class.hls::stream<hls::axis<ap_uint<32>, 1, 0, 0>, 0>"* %2 to i8*
  %6 = bitcast %"class.hls::stream<hls::axis<ap_uint<32>, 1, 0, 0>, 0>"* %0 to i8*
  call void @fpga_fifo_pop_12(i8* %5, i8* %6)
  %7 = load volatile %"class.hls::stream<hls::axis<ap_uint<32>, 1, 0, 0>, 0>", %"class.hls::stream<hls::axis<ap_uint<32>, 1, 0, 0>, 0>"* %2
  store %"class.hls::stream<hls::axis<ap_uint<32>, 1, 0, 0>, 0>" %7, %"class.hls::stream<hls::axis<ap_uint<32>, 1, 0, 0>, 0>"* %1
  %8 = getelementptr inbounds %"class.hls::stream<hls::axis<ap_uint<32>, 1, 0, 0>, 0>", %"class.hls::stream<hls::axis<ap_uint<32>, 1, 0, 0>, 0>"* %1, i32 0, i32 0, i32 0
  %9 = bitcast %"struct.ap_uint<32>"* %8 to i32*
  %10 = bitcast i32* %9 to i8*
  %11 = bitcast i32* %_V_data_V to i8*
  call void @fpga_fifo_push_4(i8* %10, i8* %11)
  %12 = getelementptr inbounds %"class.hls::stream<hls::axis<ap_uint<32>, 1, 0, 0>, 0>", %"class.hls::stream<hls::axis<ap_uint<32>, 1, 0, 0>, 0>"* %1, i32 0, i32 0, i32 1
  %13 = bitcast %"struct.ap_uint<4>"* %12 to i4*
  %14 = bitcast i4* %13 to i8*
  %15 = bitcast i4* %_V_keep_V to i8*
  call void @fpga_fifo_push_1(i8* %14, i8* %15)
  %16 = getelementptr inbounds %"class.hls::stream<hls::axis<ap_uint<32>, 1, 0, 0>, 0>", %"class.hls::stream<hls::axis<ap_uint<32>, 1, 0, 0>, 0>"* %1, i32 0, i32 0, i32 2
  %17 = bitcast %"struct.ap_uint<4>"* %16 to i4*
  %18 = bitcast i4* %17 to i8*
  %19 = bitcast i4* %_V_strb_V to i8*
  call void @fpga_fifo_push_1(i8* %18, i8* %19)
  %20 = getelementptr inbounds %"class.hls::stream<hls::axis<ap_uint<32>, 1, 0, 0>, 0>", %"class.hls::stream<hls::axis<ap_uint<32>, 1, 0, 0>, 0>"* %1, i32 0, i32 0, i32 3
  %21 = bitcast %"struct.ap_uint<1>"* %20 to i1*
  %22 = bitcast i1* %21 to i8*
  %23 = bitcast i1* %_V_user_V to i8*
  call void @fpga_fifo_push_1(i8* %22, i8* %23)
  %24 = getelementptr inbounds %"class.hls::stream<hls::axis<ap_uint<32>, 1, 0, 0>, 0>", %"class.hls::stream<hls::axis<ap_uint<32>, 1, 0, 0>, 0>"* %1, i32 0, i32 0, i32 4
  %25 = bitcast %"struct.ap_uint<1>"* %24 to i1*
  %26 = bitcast i1* %25 to i8*
  %27 = bitcast i1* %_V_last_V to i8*
  call void @fpga_fifo_push_1(i8* %26, i8* %27)
  br label %empty, !llvm.loop !5

ret:                                              ; preds = %empty
  ret void
}

declare void @apatb_pixel_unpack_hw(i32*, i4*, i4*, i1*, i1*, i24*, i3*, i3*, i1*, i1*, i32)

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_back(%"class.hls::stream<hls::axis<ap_uint<32>, 1, 0, 0>, 0>"* noalias, i32* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.0" %_V_data_V, i4* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.1" %_V_keep_V, i4* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.2" %_V_strb_V, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.3" %_V_user_V, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.4" %_V_last_V, %"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* noalias, i24* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="3.0" %_V_data_V1, i3* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="3.1" %_V_keep_V2, i3* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="3.2" %_V_strb_V3, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="3.3" %_V_user_V4, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="3.4" %_V_last_V5) unnamed_addr #4 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<32>, 1, 0, 0>, 0>"(%"class.hls::stream<hls::axis<ap_uint<32>, 1, 0, 0>, 0>"* %0, i32* %_V_data_V, i4* %_V_keep_V, i4* %_V_strb_V, i1* %_V_user_V, i1* %_V_last_V)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>.4"(%"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* %1, i24* %_V_data_V1, i3* %_V_keep_V2, i3* %_V_strb_V3, i1* %_V_user_V4, i1* %_V_last_V5)
  ret void
}

define void @pixel_unpack_hw_stub_wrapper(i32*, i4*, i4*, i1*, i1*, i24*, i3*, i3*, i1*, i1*, i32) #5 {
entry:
  %11 = alloca %"class.hls::stream<hls::axis<ap_uint<32>, 1, 0, 0>, 0>"
  %12 = alloca %"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"
  call void @copy_out(%"class.hls::stream<hls::axis<ap_uint<32>, 1, 0, 0>, 0>"* %11, i32* %0, i4* %1, i4* %2, i1* %3, i1* %4, %"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* %12, i24* %5, i3* %6, i3* %7, i1* %8, i1* %9)
  call void @pixel_unpack_hw_stub(%"class.hls::stream<hls::axis<ap_uint<32>, 1, 0, 0>, 0>"* %11, %"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* %12, i32 %10)
  call void @copy_in(%"class.hls::stream<hls::axis<ap_uint<32>, 1, 0, 0>, 0>"* %11, i32* %0, i4* %1, i4* %2, i1* %3, i1* %4, %"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"* %12, i24* %5, i3* %6, i3* %7, i1* %8, i1* %9)
  ret void
}

declare void @pixel_unpack_hw_stub(%"class.hls::stream<hls::axis<ap_uint<32>, 1, 0, 0>, 0>"*, %"class.hls::stream<hls::axis<ap_uint<24>, 1, 0, 0>, 0>"*, i32)

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
attributes #2 = { argmemonly noinline "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #3 = { argmemonly noinline "fpga.wrapper.func"="streamcpy_hls" }
attributes #4 = { argmemonly noinline "fpga.wrapper.func"="copyout" }
attributes #5 = { "fpga.wrapper.func"="stub" }

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
!7 = distinct !{!7, !6}
