#include "hls_design_meta.h"
const Port_Property HLS_Design_Meta::port_props[]={
	Port_Property("ap_clk", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_rst_n", 1, hls_in, -1, "", "", 1),
	Port_Property("stream_in_32_TDATA", 32, hls_in, 0, "axis", "in_data", 1),
	Port_Property("stream_in_32_TVALID", 1, hls_in, 4, "axis", "in_vld", 1),
	Port_Property("stream_in_32_TREADY", 1, hls_out, 4, "axis", "in_acc", 1),
	Port_Property("stream_in_32_TKEEP", 4, hls_in, 1, "axis", "in_data", 1),
	Port_Property("stream_in_32_TSTRB", 4, hls_in, 2, "axis", "in_data", 1),
	Port_Property("stream_in_32_TUSER", 1, hls_in, 3, "axis", "in_data", 1),
	Port_Property("stream_in_32_TLAST", 1, hls_in, 4, "axis", "in_data", 1),
	Port_Property("stream_out_24_TDATA", 24, hls_out, 5, "axis", "out_data", 1),
	Port_Property("stream_out_24_TVALID", 1, hls_out, 9, "axis", "out_vld", 1),
	Port_Property("stream_out_24_TREADY", 1, hls_in, 9, "axis", "out_acc", 1),
	Port_Property("stream_out_24_TKEEP", 3, hls_out, 6, "axis", "out_data", 1),
	Port_Property("stream_out_24_TSTRB", 3, hls_out, 7, "axis", "out_data", 1),
	Port_Property("stream_out_24_TUSER", 1, hls_out, 8, "axis", "out_data", 1),
	Port_Property("stream_out_24_TLAST", 1, hls_out, 9, "axis", "out_data", 1),
	Port_Property("s_axi_control_AWVALID", 1, hls_in, -1, "", "", 1),
	Port_Property("s_axi_control_AWREADY", 1, hls_out, -1, "", "", 1),
	Port_Property("s_axi_control_AWADDR", 5, hls_in, -1, "", "", 1),
	Port_Property("s_axi_control_WVALID", 1, hls_in, -1, "", "", 1),
	Port_Property("s_axi_control_WREADY", 1, hls_out, -1, "", "", 1),
	Port_Property("s_axi_control_WDATA", 32, hls_in, -1, "", "", 1),
	Port_Property("s_axi_control_WSTRB", 4, hls_in, -1, "", "", 1),
	Port_Property("s_axi_control_ARVALID", 1, hls_in, -1, "", "", 1),
	Port_Property("s_axi_control_ARREADY", 1, hls_out, -1, "", "", 1),
	Port_Property("s_axi_control_ARADDR", 5, hls_in, -1, "", "", 1),
	Port_Property("s_axi_control_RVALID", 1, hls_out, -1, "", "", 1),
	Port_Property("s_axi_control_RREADY", 1, hls_in, -1, "", "", 1),
	Port_Property("s_axi_control_RDATA", 32, hls_out, -1, "", "", 1),
	Port_Property("s_axi_control_RRESP", 2, hls_out, -1, "", "", 1),
	Port_Property("s_axi_control_BVALID", 1, hls_out, -1, "", "", 1),
	Port_Property("s_axi_control_BREADY", 1, hls_in, -1, "", "", 1),
	Port_Property("s_axi_control_BRESP", 2, hls_out, -1, "", "", 1),
};
const char* HLS_Design_Meta::dut_name = "pixel_unpack";
