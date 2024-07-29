
################################################################
# This is a generated script based on design: design_base
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2022.2
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_gid_msg -ssname BD::TCL -id 2041 -severity "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source design_base_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# pwm_generator, crop_stream, filter_axis, histogram_projection, filter_axis, filter_axis, filter_axis, filter_axis, filter_axis

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7z020clg400-1
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name base

# This script was generated for a remote BD. To create a non-remote design,
# change the variable <run_remote_bd_flow> to <0>.

set run_remote_bd_flow 1
if { $run_remote_bd_flow == 1 } {
  # Set the reference directory for source file relative paths (by default 
  # the value is script directory path)
  set origin_dir ./bd_base

  # Use origin directory path location variable, if specified in the tcl shell
  if { [info exists ::origin_dir_loc] } {
     set origin_dir $::origin_dir_loc
  }

  set str_bd_folder [file normalize ${origin_dir}]
  set str_bd_filepath ${str_bd_folder}/${design_name}/${design_name}.bd

  # Check if remote design exists on disk
  if { [file exists $str_bd_filepath ] == 1 } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2030 -severity "ERROR" "The remote BD file path <$str_bd_filepath> already exists!"}
     common::send_gid_msg -ssname BD::TCL -id 2031 -severity "INFO" "To create a non-remote BD, change the variable <run_remote_bd_flow> to <0>."
     common::send_gid_msg -ssname BD::TCL -id 2032 -severity "INFO" "Also make sure there is no design <$design_name> existing in your current project."

     return 1
  }

  # Check if design exists in memory
  set list_existing_designs [get_bd_designs -quiet $design_name]
  if { $list_existing_designs ne "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2033 -severity "ERROR" "The design <$design_name> already exists in this project! Will not create the remote BD <$design_name> at the folder <$str_bd_folder>."}

     common::send_gid_msg -ssname BD::TCL -id 2034 -severity "INFO" "To create a non-remote BD, change the variable <run_remote_bd_flow> to <0> or please set a different value to variable <design_name>."

     return 1
  }

  # Check if design exists on disk within project
  set list_existing_designs [get_files -quiet */${design_name}.bd]
  if { $list_existing_designs ne "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2035 -severity "ERROR" "The design <$design_name> already exists in this project at location:
    $list_existing_designs"}
     catch {common::send_gid_msg -ssname BD::TCL -id 2036 -severity "ERROR" "Will not create the remote BD <$design_name> at the folder <$str_bd_folder>."}

     common::send_gid_msg -ssname BD::TCL -id 2037 -severity "INFO" "To create a non-remote BD, change the variable <run_remote_bd_flow> to <0> or please set a different value to variable <design_name>."

     return 1
  }

  # Now can create the remote BD
  # NOTE - usage of <-dir> will create <$str_bd_folder/$design_name/$design_name.bd>
  create_bd_design -dir $str_bd_folder $design_name
} else {

  # Create regular design
  if { [catch {create_bd_design $design_name} errmsg] } {
     common::send_gid_msg -ssname BD::TCL -id 2038 -severity "INFO" "Please set a different value to variable <design_name>."

     return 1
  }
}

current_bd_design $design_name

set bCheckIPsPassed 1
##################################################################
# CHECK IPs
##################################################################
set bCheckIPs 1
if { $bCheckIPs == 1 } {
   set list_check_ips "\ 
xilinx.com:ip:axi_gpio:2.0\
xilinx.com:ip:xlconcat:2.1\
xilinx.com:ip:processing_system7:5.5\
xilinx.com:ip:proc_sys_reset:5.0\
xilinx.com:ip:axi_intc:4.1\
xilinx.com:ip:xlconstant:1.1\
xilinx.com:ip:axis_switch:1.1\
xilinx.com:ip:axi_vdma:6.3\
xilinx.com:ip:axis_register_slice:1.1\
xilinx.com:hls:color_convert:1.0\
xilinx.com:hls:pixel_pack:1.0\
xilinx.com:hls:pixel_unpack:1.0\
xilinx.com:user:color_swap:1.1\
digilentinc.com:ip:dvi2rgb:1.7\
xilinx.com:ip:v_vid_in_axi4s:5.0\
xilinx.com:ip:v_tc:6.2\
digilentinc.com:ip:axi_dynclk:1.0\
digilentinc.com:ip:rgb2dvi:1.2\
xilinx.com:ip:v_axi4s_vid_out:4.0\
"

   set list_ips_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2011 -severity "INFO" "Checking if the following IPs exist in the project's IP catalog: $list_check_ips ."

   foreach ip_vlnv $list_check_ips {
      set ip_obj [get_ipdefs -all $ip_vlnv]
      if { $ip_obj eq "" } {
         lappend list_ips_missing $ip_vlnv
      }
   }

   if { $list_ips_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2012 -severity "ERROR" "The following IPs are not found in the IP Catalog:\n  $list_ips_missing\n\nResolution: Please add the repository containing the IP(s) to the project." }
      set bCheckIPsPassed 0
   }

}

##################################################################
# CHECK Modules
##################################################################
set bCheckModules 1
if { $bCheckModules == 1 } {
   set list_check_mods "\ 
pwm_generator\
crop_stream\
filter_axis\
histogram_projection\
filter_axis\
filter_axis\
filter_axis\
filter_axis\
filter_axis\
"

   set list_mods_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2020 -severity "INFO" "Checking if the following modules exist in the project's sources: $list_check_mods ."

   foreach mod_vlnv $list_check_mods {
      if { [can_resolve_reference $mod_vlnv] == 0 } {
         lappend list_mods_missing $mod_vlnv
      }
   }

   if { $list_mods_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2021 -severity "ERROR" "The following module(s) are not found in the project: $list_mods_missing" }
      common::send_gid_msg -ssname BD::TCL -id 2022 -severity "INFO" "Please add source files for the missing module(s) above."
      set bCheckIPsPassed 0
   }
}

if { $bCheckIPsPassed != 1 } {
  common::send_gid_msg -ssname BD::TCL -id 2023 -severity "WARNING" "Will not continue with creation of design due to the error(s) above."
  return 3
}

##################################################################
# DESIGN PROCs
##################################################################


# Hierarchical cell: frontend
proc create_hier_cell_frontend_1 { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_frontend_1() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S00_AXILite

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S02_AXILite

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S04_AXILite

  create_bd_intf_pin -mode Master -vlnv digilentinc.com:interface:tmds_rtl:1.0 hdmi_out

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 video_in


  # Create pins
  create_bd_pin -dir I -type clk clk_100M
  create_bd_pin -dir I -type clk clk_142M
  create_bd_pin -dir O -from 0 -to 0 hdmi_out_hpd
  create_bd_pin -dir O -type intr hdmi_out_hpd_irq
  create_bd_pin -dir I -from 0 -to 0 -type rst periph_resetn_clk100M
  create_bd_pin -dir O -type intr vtc_out_irq

  # Create instance: axi_dynclk, and set properties
  set axi_dynclk [ create_bd_cell -type ip -vlnv digilentinc.com:ip:axi_dynclk:1.0 axi_dynclk ]

  # Create instance: color_swap_0, and set properties
  set color_swap_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:color_swap:1.1 color_swap_0 ]

  # Create instance: hdmi_out_hpd_video, and set properties
  set hdmi_out_hpd_video [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 hdmi_out_hpd_video ]
  set_property -dict [list \
    CONFIG.C_ALL_OUTPUTS {1} \
    CONFIG.C_GPIO_WIDTH {1} \
    CONFIG.C_INTERRUPT_PRESENT {1} \
  ] $hdmi_out_hpd_video


  # Create instance: rgb2dvi_0, and set properties
  set rgb2dvi_0 [ create_bd_cell -type ip -vlnv digilentinc.com:ip:rgb2dvi:1.2 rgb2dvi_0 ]
  set_property -dict [list \
    CONFIG.kClkRange {2} \
    CONFIG.kGenerateSerialClk {false} \
    CONFIG.kRstActiveHigh {false} \
  ] $rgb2dvi_0


  # Create instance: v_axi4s_vid_out_0, and set properties
  set v_axi4s_vid_out_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:v_axi4s_vid_out:4.0 v_axi4s_vid_out_0 ]
  set_property -dict [list \
    CONFIG.C_ADDR_WIDTH {11} \
    CONFIG.C_HAS_ASYNC_CLK {1} \
    CONFIG.C_HYSTERESIS_LEVEL {1024} \
    CONFIG.C_VTG_MASTER_SLAVE {1} \
  ] $v_axi4s_vid_out_0


  # Create instance: vtc_out, and set properties
  set vtc_out [ create_bd_cell -type ip -vlnv xilinx.com:ip:v_tc:6.2 vtc_out ]
  set_property CONFIG.enable_detection {false} $vtc_out


  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins hdmi_out] [get_bd_intf_pins rgb2dvi_0/TMDS]
  connect_bd_intf_net -intf_net Conn2 [get_bd_intf_pins S02_AXILite] [get_bd_intf_pins vtc_out/ctrl]
  connect_bd_intf_net -intf_net color_swap_0_pixel_output [get_bd_intf_pins color_swap_0/pixel_output] [get_bd_intf_pins rgb2dvi_0/RGB]
  connect_bd_intf_net -intf_net ps7_0_axi_periph_M06_AXI [get_bd_intf_pins S00_AXILite] [get_bd_intf_pins hdmi_out_hpd_video/S_AXI]
  connect_bd_intf_net -intf_net ps7_0_axi_periph_M08_AXI [get_bd_intf_pins S04_AXILite] [get_bd_intf_pins axi_dynclk/s00_axi]
  connect_bd_intf_net -intf_net v_axi4s_vid_out_0_vid_io_out [get_bd_intf_pins color_swap_0/pixel_input] [get_bd_intf_pins v_axi4s_vid_out_0/vid_io_out]
  connect_bd_intf_net -intf_net v_tc_0_vtiming_out [get_bd_intf_pins v_axi4s_vid_out_0/vtiming_in] [get_bd_intf_pins vtc_out/vtiming_out]
  connect_bd_intf_net -intf_net video_in_1 [get_bd_intf_pins video_in] [get_bd_intf_pins v_axi4s_vid_out_0/video_in]

  # Create port connections
  connect_bd_net -net Net [get_bd_pins clk_100M] [get_bd_pins axi_dynclk/REF_CLK_I] [get_bd_pins axi_dynclk/s00_axi_aclk] [get_bd_pins hdmi_out_hpd_video/s_axi_aclk] [get_bd_pins vtc_out/s_axi_aclk]
  connect_bd_net -net Net1 [get_bd_pins periph_resetn_clk100M] [get_bd_pins axi_dynclk/s00_axi_aresetn] [get_bd_pins hdmi_out_hpd_video/s_axi_aresetn] [get_bd_pins vtc_out/s_axi_aresetn]
  connect_bd_net -net aclk_1 [get_bd_pins clk_142M] [get_bd_pins v_axi4s_vid_out_0/aclk]
  connect_bd_net -net axi_dynclk_0_LOCKED_O [get_bd_pins axi_dynclk/LOCKED_O] [get_bd_pins rgb2dvi_0/aRst_n]
  connect_bd_net -net axi_dynclk_0_PXL_CLK_5X_O [get_bd_pins axi_dynclk/PXL_CLK_5X_O] [get_bd_pins rgb2dvi_0/SerialClk]
  connect_bd_net -net axi_dynclk_0_PXL_CLK_O [get_bd_pins axi_dynclk/PXL_CLK_O] [get_bd_pins rgb2dvi_0/PixelClk] [get_bd_pins v_axi4s_vid_out_0/vid_io_out_clk] [get_bd_pins vtc_out/clk]
  connect_bd_net -net hdmi_out_hpd_video_gpio_io_o [get_bd_pins hdmi_out_hpd] [get_bd_pins hdmi_out_hpd_video/gpio_io_o]
  connect_bd_net -net hdmi_out_hpd_video_ip2intc_irpt [get_bd_pins hdmi_out_hpd_irq] [get_bd_pins hdmi_out_hpd_video/ip2intc_irpt]
  connect_bd_net -net v_tc_0_irq [get_bd_pins vtc_out_irq] [get_bd_pins vtc_out/irq]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: frontend
proc create_hier_cell_frontend { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_frontend() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:iic_rtl:1.0 DDC

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S00_AXILite

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S02_AXILite

  create_bd_intf_pin -mode Slave -vlnv digilentinc.com:interface:tmds_rtl:1.0 hdmi_in

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 video_out


  # Create pins
  create_bd_pin -dir O -type clk PixelClk
  create_bd_pin -dir O aPixelClkLckd
  create_bd_pin -dir I -type clk clk_100M
  create_bd_pin -dir I -type clk clk_142M
  create_bd_pin -dir I -type clk clk_200M
  create_bd_pin -dir O -from 0 -to 0 hdmi_in_hpd
  create_bd_pin -dir O -type intr hdmi_in_hpd_irq
  create_bd_pin -dir I -from 0 -to 0 -type rst periph_resetn_clk100M
  create_bd_pin -dir I -from 0 -to 0 -type rst resetn
  create_bd_pin -dir I -from 0 -to 0 -type rst vid_io_in_reset
  create_bd_pin -dir O -type intr vtc_in_irq

  # Create instance: axi_gpio_hdmiin, and set properties
  set axi_gpio_hdmiin [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_hdmiin ]
  set_property -dict [list \
    CONFIG.C_ALL_INPUTS_2 {1} \
    CONFIG.C_ALL_OUTPUTS {1} \
    CONFIG.C_GPIO2_WIDTH {1} \
    CONFIG.C_GPIO_WIDTH {1} \
    CONFIG.C_INTERRUPT_PRESENT {1} \
    CONFIG.C_IS_DUAL {1} \
  ] $axi_gpio_hdmiin


  # Create instance: color_swap_0, and set properties
  set color_swap_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:color_swap:1.1 color_swap_0 ]
  set_property -dict [list \
    CONFIG.input_format {rbg} \
    CONFIG.output_format {rgb} \
  ] $color_swap_0


  # Create instance: dvi2rgb_0, and set properties
  set dvi2rgb_0 [ create_bd_cell -type ip -vlnv digilentinc.com:ip:dvi2rgb:1.7 dvi2rgb_0 ]
  set_property -dict [list \
    CONFIG.kAddBUFG {false} \
    CONFIG.kClkRange {1} \
    CONFIG.kEdidFileName {720p_edid.data} \
    CONFIG.kRstActiveHigh {false} \
  ] $dvi2rgb_0


  # Create instance: v_vid_in_axi4s_0, and set properties
  set v_vid_in_axi4s_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:v_vid_in_axi4s:5.0 v_vid_in_axi4s_0 ]
  set_property -dict [list \
    CONFIG.C_ADDR_WIDTH {12} \
    CONFIG.C_HAS_ASYNC_CLK {1} \
  ] $v_vid_in_axi4s_0


  # Create instance: vtc_in, and set properties
  set vtc_in [ create_bd_cell -type ip -vlnv xilinx.com:ip:v_tc:6.2 vtc_in ]
  set_property -dict [list \
    CONFIG.HAS_INTC_IF {true} \
    CONFIG.enable_generation {false} \
    CONFIG.horizontal_blank_detection {false} \
    CONFIG.max_lines_per_frame {2048} \
    CONFIG.vertical_blank_detection {false} \
  ] $vtc_in


  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins DDC] [get_bd_intf_pins dvi2rgb_0/DDC]
  connect_bd_intf_net -intf_net Conn2 [get_bd_intf_pins hdmi_in] [get_bd_intf_pins dvi2rgb_0/TMDS]
  connect_bd_intf_net -intf_net Conn3 [get_bd_intf_pins S02_AXILite] [get_bd_intf_pins vtc_in/ctrl]
  connect_bd_intf_net -intf_net color_swap_0_pixel_output [get_bd_intf_pins color_swap_0/pixel_output] [get_bd_intf_pins v_vid_in_axi4s_0/vid_io_in]
  connect_bd_intf_net -intf_net dvi2rgb_0_RGB [get_bd_intf_pins color_swap_0/pixel_input] [get_bd_intf_pins dvi2rgb_0/RGB]
  connect_bd_intf_net -intf_net hdmi_in_video_out [get_bd_intf_pins video_out] [get_bd_intf_pins v_vid_in_axi4s_0/video_out]
  connect_bd_intf_net -intf_net ps7_0_axi_periph_M07_AXI [get_bd_intf_pins S00_AXILite] [get_bd_intf_pins axi_gpio_hdmiin/S_AXI]
  connect_bd_intf_net -intf_net v_vid_in_axi4s_0_vtiming_out [get_bd_intf_pins v_vid_in_axi4s_0/vtiming_out] [get_bd_intf_pins vtc_in/vtiming_in]

  # Create port connections
  connect_bd_net -net Net [get_bd_pins clk_100M] [get_bd_pins axi_gpio_hdmiin/s_axi_aclk] [get_bd_pins vtc_in/s_axi_aclk]
  connect_bd_net -net Net1 [get_bd_pins periph_resetn_clk100M] [get_bd_pins axi_gpio_hdmiin/s_axi_aresetn] [get_bd_pins dvi2rgb_0/aRst_n] [get_bd_pins vtc_in/s_axi_aresetn]
  connect_bd_net -net RefClk_1 [get_bd_pins clk_200M] [get_bd_pins dvi2rgb_0/RefClk]
  connect_bd_net -net aclk_1 [get_bd_pins clk_142M] [get_bd_pins v_vid_in_axi4s_0/aclk]
  connect_bd_net -net axi_gpio_video_gpio_io_o [get_bd_pins hdmi_in_hpd] [get_bd_pins axi_gpio_hdmiin/gpio_io_o]
  connect_bd_net -net axi_gpio_video_ip2intc_irpt [get_bd_pins hdmi_in_hpd_irq] [get_bd_pins axi_gpio_hdmiin/ip2intc_irpt]
  connect_bd_net -net dvi2rgb_0_PixelClk1 [get_bd_pins PixelClk] [get_bd_pins dvi2rgb_0/PixelClk] [get_bd_pins v_vid_in_axi4s_0/vid_io_in_clk] [get_bd_pins vtc_in/clk]
  connect_bd_net -net dvi2rgb_0_aPixelClkLckd [get_bd_pins aPixelClkLckd] [get_bd_pins axi_gpio_hdmiin/gpio2_io_i] [get_bd_pins dvi2rgb_0/aPixelClkLckd]
  connect_bd_net -net resetn_1 [get_bd_pins resetn] [get_bd_pins vtc_in/resetn]
  connect_bd_net -net v_tc_1_irq [get_bd_pins vtc_in_irq] [get_bd_pins vtc_in/irq]
  connect_bd_net -net vid_io_in_reset_1 [get_bd_pins vid_io_in_reset] [get_bd_pins v_vid_in_axi4s_0/vid_io_in_reset]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: hdmi_out
proc create_hier_cell_hdmi_out { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_hdmi_out() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S00_AXILite

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S01_AXILite

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S02_AXILite

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S03_AXILite

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S04_AXILite

  create_bd_intf_pin -mode Master -vlnv digilentinc.com:interface:tmds_rtl:1.0 hdmi_out

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 in_stream

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 stream_in_24

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 to_video_processing


  # Create pins
  create_bd_pin -dir I -type clk clk_100M
  create_bd_pin -dir I -type clk clk_142M
  create_bd_pin -dir O -from 0 -to 0 hdmi_out_hpd
  create_bd_pin -dir O -type intr hdmi_out_hpd_irq
  create_bd_pin -dir I -from 0 -to 0 -type rst periph_resetn_clk100M
  create_bd_pin -dir I -from 0 -to 0 -type rst periph_resetn_clk142M
  create_bd_pin -dir O -type intr vtc_out_irq

  # Create instance: axis_register_slice_0, and set properties
  set axis_register_slice_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_register_slice:1.1 axis_register_slice_0 ]

  # Create instance: color_convert, and set properties
  set color_convert [ create_bd_cell -type ip -vlnv xilinx.com:hls:color_convert:1.0 color_convert ]

  # Create instance: frontend
  create_hier_cell_frontend_1 $hier_obj frontend

  # Create instance: pixel_unpack, and set properties
  set pixel_unpack [ create_bd_cell -type ip -vlnv xilinx.com:hls:pixel_unpack:1.0 pixel_unpack ]

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins hdmi_out] [get_bd_intf_pins frontend/hdmi_out]
  connect_bd_intf_net -intf_net Conn2 [get_bd_intf_pins S02_AXILite] [get_bd_intf_pins frontend/S02_AXILite]
  connect_bd_intf_net -intf_net Conn7 [get_bd_intf_pins S03_AXILite] [get_bd_intf_pins color_convert/s_axi_control]
  connect_bd_intf_net -intf_net Conn8 [get_bd_intf_pins S01_AXILite] [get_bd_intf_pins pixel_unpack/s_axi_control]
  connect_bd_intf_net -intf_net axis_register_slice_0_M_AXIS [get_bd_intf_pins to_video_processing] [get_bd_intf_pins axis_register_slice_0/M_AXIS]
  connect_bd_intf_net -intf_net color_convert_stream_out_24 [get_bd_intf_pins color_convert/stream_out_24] [get_bd_intf_pins frontend/video_in]
  connect_bd_intf_net -intf_net in_stream_1 [get_bd_intf_pins in_stream] [get_bd_intf_pins pixel_unpack/stream_in_32]
  connect_bd_intf_net -intf_net pixel_unpack_stream_out_24 [get_bd_intf_pins axis_register_slice_0/S_AXIS] [get_bd_intf_pins pixel_unpack/stream_out_24]
  connect_bd_intf_net -intf_net ps7_0_axi_periph_M06_AXI [get_bd_intf_pins S00_AXILite] [get_bd_intf_pins frontend/S00_AXILite]
  connect_bd_intf_net -intf_net ps7_0_axi_periph_M08_AXI [get_bd_intf_pins S04_AXILite] [get_bd_intf_pins frontend/S04_AXILite]
  connect_bd_intf_net -intf_net stream_in_24_1 [get_bd_intf_pins stream_in_24] [get_bd_intf_pins color_convert/stream_in_24]

  # Create port connections
  connect_bd_net -net Net [get_bd_pins clk_100M] [get_bd_pins frontend/clk_100M]
  connect_bd_net -net Net1 [get_bd_pins periph_resetn_clk100M] [get_bd_pins frontend/periph_resetn_clk100M]
  connect_bd_net -net aclk_1 [get_bd_pins clk_142M] [get_bd_pins axis_register_slice_0/aclk] [get_bd_pins color_convert/ap_clk] [get_bd_pins frontend/clk_142M] [get_bd_pins pixel_unpack/ap_clk]
  connect_bd_net -net hdmi_out_hpd_video_gpio_io_o [get_bd_pins hdmi_out_hpd] [get_bd_pins frontend/hdmi_out_hpd]
  connect_bd_net -net hdmi_out_hpd_video_ip2intc_irpt [get_bd_pins hdmi_out_hpd_irq] [get_bd_pins frontend/hdmi_out_hpd_irq]
  connect_bd_net -net rst_ps7_0_100M_peripheral_aresetn [get_bd_pins periph_resetn_clk142M] [get_bd_pins axis_register_slice_0/aresetn] [get_bd_pins color_convert/ap_rst_n] [get_bd_pins pixel_unpack/ap_rst_n]
  connect_bd_net -net v_tc_0_irq [get_bd_pins vtc_out_irq] [get_bd_pins frontend/vtc_out_irq]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: hdmi_in
proc create_hier_cell_hdmi_in { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_hdmi_in() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:iic_rtl:1.0 DDC

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S00_AXILite

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S01_AXILite

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S02_AXILite

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S03_AXILite

  create_bd_intf_pin -mode Slave -vlnv digilentinc.com:interface:tmds_rtl:1.0 hdmi_in

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 stream_out_33


  # Create pins
  create_bd_pin -dir O -type clk PixelClk
  create_bd_pin -dir O aPixelClkLckd
  create_bd_pin -dir I -type clk clk_100M
  create_bd_pin -dir I -type clk clk_142M
  create_bd_pin -dir I -type clk clk_200M
  create_bd_pin -dir O -from 0 -to 0 hdmi_in_hpd
  create_bd_pin -dir O -type intr hdmi_in_hpd_irq
  create_bd_pin -dir I -from 0 -to 0 -type rst periph_resetn_clk100M
  create_bd_pin -dir I -from 0 -to 0 -type rst periph_resetn_clk142M
  create_bd_pin -dir I -from 0 -to 0 -type rst resetn
  create_bd_pin -dir I -from 0 -to 0 -type rst vid_io_in_reset
  create_bd_pin -dir O -type intr vtc_in_irq

  # Create instance: axis_register_slice_0, and set properties
  set axis_register_slice_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_register_slice:1.1 axis_register_slice_0 ]

  # Create instance: color_convert, and set properties
  set color_convert [ create_bd_cell -type ip -vlnv xilinx.com:hls:color_convert:1.0 color_convert ]

  # Create instance: frontend
  create_hier_cell_frontend $hier_obj frontend

  # Create instance: pixel_pack, and set properties
  set pixel_pack [ create_bd_cell -type ip -vlnv xilinx.com:hls:pixel_pack:1.0 pixel_pack ]

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins hdmi_in] [get_bd_intf_pins frontend/hdmi_in]
  connect_bd_intf_net -intf_net Conn2 [get_bd_intf_pins stream_out_33] [get_bd_intf_pins pixel_pack/stream_out_32]
  connect_bd_intf_net -intf_net Conn3 [get_bd_intf_pins S02_AXILite] [get_bd_intf_pins frontend/S02_AXILite]
  connect_bd_intf_net -intf_net Conn5 [get_bd_intf_pins S03_AXILite] [get_bd_intf_pins pixel_pack/s_axi_control]
  connect_bd_intf_net -intf_net Conn6 [get_bd_intf_pins S01_AXILite] [get_bd_intf_pins color_convert/s_axi_control]
  connect_bd_intf_net -intf_net axis_register_slice_0_M_AXIS [get_bd_intf_pins axis_register_slice_0/M_AXIS] [get_bd_intf_pins pixel_pack/stream_in_24]
  connect_bd_intf_net -intf_net color_convert_stream_out_24 [get_bd_intf_pins axis_register_slice_0/S_AXIS] [get_bd_intf_pins color_convert/stream_out_24]
  connect_bd_intf_net -intf_net frontend_DDC [get_bd_intf_pins DDC] [get_bd_intf_pins frontend/DDC]
  connect_bd_intf_net -intf_net frontend_video_out [get_bd_intf_pins color_convert/stream_in_24] [get_bd_intf_pins frontend/video_out]
  connect_bd_intf_net -intf_net ps7_0_axi_periph_M07_AXI [get_bd_intf_pins S00_AXILite] [get_bd_intf_pins frontend/S00_AXILite]

  # Create port connections
  connect_bd_net -net Net [get_bd_pins clk_100M] [get_bd_pins frontend/clk_100M]
  connect_bd_net -net RefClk_1 [get_bd_pins clk_200M] [get_bd_pins frontend/clk_200M]
  connect_bd_net -net aclk_1 [get_bd_pins clk_142M] [get_bd_pins axis_register_slice_0/aclk] [get_bd_pins color_convert/ap_clk] [get_bd_pins frontend/clk_142M] [get_bd_pins pixel_pack/ap_clk]
  connect_bd_net -net axi_gpio_video_gpio_io_o [get_bd_pins hdmi_in_hpd] [get_bd_pins frontend/hdmi_in_hpd]
  connect_bd_net -net axi_gpio_video_ip2intc_irpt [get_bd_pins hdmi_in_hpd_irq] [get_bd_pins frontend/hdmi_in_hpd_irq]
  connect_bd_net -net dvi2rgb_0_PixelClk [get_bd_pins PixelClk] [get_bd_pins frontend/PixelClk]
  connect_bd_net -net dvi2rgb_0_aPixelClkLckd [get_bd_pins aPixelClkLckd] [get_bd_pins frontend/aPixelClkLckd]
  connect_bd_net -net periph_resetn_clk100M_1 [get_bd_pins periph_resetn_clk100M] [get_bd_pins frontend/periph_resetn_clk100M]
  connect_bd_net -net resetn_1 [get_bd_pins resetn] [get_bd_pins frontend/resetn]
  connect_bd_net -net rst_ps7_0_100M_peripheral_aresetn [get_bd_pins periph_resetn_clk142M] [get_bd_pins axis_register_slice_0/aresetn] [get_bd_pins color_convert/ap_rst_n] [get_bd_pins pixel_pack/ap_rst_n]
  connect_bd_net -net v_tc_1_irq [get_bd_pins vtc_in_irq] [get_bd_pins frontend/vtc_in_irq]
  connect_bd_net -net vid_io_in_reset_1 [get_bd_pins vid_io_in_reset] [get_bd_pins frontend/vid_io_in_reset]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: video
proc create_hier_cell_video { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_video() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:iic_rtl:1.0 DDC

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M_AXI

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI

  create_bd_intf_pin -mode Slave -vlnv digilentinc.com:interface:tmds_rtl:1.0 hdmi_in1

  create_bd_intf_pin -mode Master -vlnv digilentinc.com:interface:tmds_rtl:1.0 hdmi_out1

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 stream_in_24

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 to_video_processing


  # Create pins
  create_bd_pin -dir I -type clk clk_100M
  create_bd_pin -dir I clk_142M
  create_bd_pin -dir I -type clk clk_200M
  create_bd_pin -dir O -from 0 -to 0 hdmi_in_hpd
  create_bd_pin -dir O -from 0 -to 0 hdmi_out_hpd
  create_bd_pin -dir I -from 0 -to 0 -type rst ic_resetn_clk100M
  create_bd_pin -dir I -from 0 -to 0 -type rst ic_resetn_clk142M
  create_bd_pin -dir I -from 0 -to 0 -type rst periph_resetn_clk100M
  create_bd_pin -dir I -from 0 -to 0 -type rst periph_resetn_clk142M
  create_bd_pin -dir I -type rst system_resetn
  create_bd_pin -dir O -from 5 -to 0 video_irq

  # Create instance: axi_interconnect_0, and set properties
  set axi_interconnect_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_0 ]
  set_property -dict [list \
    CONFIG.M00_HAS_REGSLICE {1} \
    CONFIG.M01_HAS_REGSLICE {1} \
    CONFIG.M02_HAS_REGSLICE {1} \
    CONFIG.M03_HAS_REGSLICE {1} \
    CONFIG.M04_HAS_REGSLICE {1} \
    CONFIG.M05_HAS_REGSLICE {1} \
    CONFIG.M06_HAS_REGSLICE {1} \
    CONFIG.M07_HAS_REGSLICE {1} \
    CONFIG.M08_HAS_REGSLICE {1} \
    CONFIG.M09_HAS_REGSLICE {1} \
    CONFIG.NUM_MI {10} \
    CONFIG.S00_HAS_REGSLICE {1} \
  ] $axi_interconnect_0


  # Create instance: axi_mem_intercon, and set properties
  set axi_mem_intercon [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_mem_intercon ]
  set_property -dict [list \
    CONFIG.NUM_MI {1} \
    CONFIG.NUM_SI {2} \
  ] $axi_mem_intercon


  # Create instance: axi_vdma, and set properties
  set axi_vdma [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_vdma:6.3 axi_vdma ]
  set_property -dict [list \
    CONFIG.c_m_axi_mm2s_data_width {32} \
    CONFIG.c_m_axis_mm2s_tdata_width {32} \
    CONFIG.c_mm2s_genlock_mode {1} \
    CONFIG.c_mm2s_linebuffer_depth {512} \
    CONFIG.c_mm2s_max_burst_length {32} \
    CONFIG.c_num_fstores {4} \
    CONFIG.c_s2mm_genlock_mode {0} \
    CONFIG.c_s2mm_linebuffer_depth {4096} \
    CONFIG.c_s2mm_max_burst_length {32} \
  ] $axi_vdma


  # Create instance: hdmi_in
  create_hier_cell_hdmi_in $hier_obj hdmi_in

  # Create instance: hdmi_out
  create_hier_cell_hdmi_out $hier_obj hdmi_out

  # Create instance: proc_sys_reset_pixelclk, and set properties
  set proc_sys_reset_pixelclk [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_pixelclk ]

  # Create instance: xlconcat_0, and set properties
  set xlconcat_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_0 ]
  set_property CONFIG.NUM_PORTS {6} $xlconcat_0


  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins hdmi_in1] [get_bd_intf_pins hdmi_in/hdmi_in]
  connect_bd_intf_net -intf_net Conn2 [get_bd_intf_pins S_AXI] [get_bd_intf_pins axi_interconnect_0/S00_AXI]
  connect_bd_intf_net -intf_net Conn3 [get_bd_intf_pins hdmi_out1] [get_bd_intf_pins hdmi_out/hdmi_out]
  connect_bd_intf_net -intf_net axi_interconnect_0_M00_AXI [get_bd_intf_pins axi_interconnect_0/M00_AXI] [get_bd_intf_pins axi_vdma/S_AXI_LITE]
  connect_bd_intf_net -intf_net axi_interconnect_0_M01_AXI [get_bd_intf_pins axi_interconnect_0/M01_AXI] [get_bd_intf_pins hdmi_out/S01_AXILite]
  connect_bd_intf_net -intf_net axi_interconnect_0_M02_AXI [get_bd_intf_pins axi_interconnect_0/M02_AXI] [get_bd_intf_pins hdmi_out/S03_AXILite]
  connect_bd_intf_net -intf_net axi_interconnect_0_M03_AXI [get_bd_intf_pins axi_interconnect_0/M03_AXI] [get_bd_intf_pins hdmi_out/S04_AXILite]
  connect_bd_intf_net -intf_net axi_interconnect_0_M04_AXI [get_bd_intf_pins axi_interconnect_0/M04_AXI] [get_bd_intf_pins hdmi_out/S02_AXILite]
  connect_bd_intf_net -intf_net axi_interconnect_0_M05_AXI [get_bd_intf_pins axi_interconnect_0/M05_AXI] [get_bd_intf_pins hdmi_out/S00_AXILite]
  connect_bd_intf_net -intf_net axi_interconnect_0_M06_AXI [get_bd_intf_pins axi_interconnect_0/M06_AXI] [get_bd_intf_pins hdmi_in/S01_AXILite]
  connect_bd_intf_net -intf_net axi_interconnect_0_M07_AXI [get_bd_intf_pins axi_interconnect_0/M07_AXI] [get_bd_intf_pins hdmi_in/S03_AXILite]
  connect_bd_intf_net -intf_net axi_interconnect_0_M08_AXI [get_bd_intf_pins axi_interconnect_0/M08_AXI] [get_bd_intf_pins hdmi_in/S00_AXILite]
  connect_bd_intf_net -intf_net axi_interconnect_0_M09_AXI [get_bd_intf_pins axi_interconnect_0/M09_AXI] [get_bd_intf_pins hdmi_in/S02_AXILite]
  connect_bd_intf_net -intf_net axi_mem_intercon_M00_AXI [get_bd_intf_pins M_AXI] [get_bd_intf_pins axi_mem_intercon/M00_AXI]
  connect_bd_intf_net -intf_net axi_vdma_0_M_AXI_MM2S [get_bd_intf_pins axi_mem_intercon/S01_AXI] [get_bd_intf_pins axi_vdma/M_AXI_MM2S]
  connect_bd_intf_net -intf_net axi_vdma_0_M_AXI_S2MM [get_bd_intf_pins axi_mem_intercon/S00_AXI] [get_bd_intf_pins axi_vdma/M_AXI_S2MM]
  connect_bd_intf_net -intf_net axi_vdma_M_AXIS_MM2S [get_bd_intf_pins axi_vdma/M_AXIS_MM2S] [get_bd_intf_pins hdmi_out/in_stream]
  connect_bd_intf_net -intf_net frontend_DDC [get_bd_intf_pins DDC] [get_bd_intf_pins hdmi_in/DDC]
  connect_bd_intf_net -intf_net hdmi_in_stream_out_33 [get_bd_intf_pins axi_vdma/S_AXIS_S2MM] [get_bd_intf_pins hdmi_in/stream_out_33]
  connect_bd_intf_net -intf_net hdmi_out_to_video_processing [get_bd_intf_pins to_video_processing] [get_bd_intf_pins hdmi_out/to_video_processing]
  connect_bd_intf_net -intf_net stream_in_24_1 [get_bd_intf_pins stream_in_24] [get_bd_intf_pins hdmi_out/stream_in_24]

  # Create port connections
  connect_bd_net -net ARESETN_1 [get_bd_pins ic_resetn_clk100M] [get_bd_pins axi_interconnect_0/ARESETN]
  connect_bd_net -net Net [get_bd_pins clk_100M] [get_bd_pins axi_interconnect_0/ACLK] [get_bd_pins axi_interconnect_0/M00_ACLK] [get_bd_pins axi_interconnect_0/M03_ACLK] [get_bd_pins axi_interconnect_0/M04_ACLK] [get_bd_pins axi_interconnect_0/M05_ACLK] [get_bd_pins axi_interconnect_0/M08_ACLK] [get_bd_pins axi_interconnect_0/M09_ACLK] [get_bd_pins axi_interconnect_0/S00_ACLK] [get_bd_pins axi_vdma/s_axi_lite_aclk] [get_bd_pins hdmi_in/clk_100M] [get_bd_pins hdmi_out/clk_100M]
  connect_bd_net -net Net1 [get_bd_pins periph_resetn_clk100M] [get_bd_pins axi_interconnect_0/M00_ARESETN] [get_bd_pins axi_interconnect_0/M03_ARESETN] [get_bd_pins axi_interconnect_0/M04_ARESETN] [get_bd_pins axi_interconnect_0/M05_ARESETN] [get_bd_pins axi_interconnect_0/M08_ARESETN] [get_bd_pins axi_interconnect_0/M09_ARESETN] [get_bd_pins axi_interconnect_0/S00_ARESETN] [get_bd_pins axi_vdma/axi_resetn] [get_bd_pins hdmi_in/periph_resetn_clk100M] [get_bd_pins hdmi_out/periph_resetn_clk100M]
  connect_bd_net -net RefClk_1 [get_bd_pins clk_200M] [get_bd_pins hdmi_in/clk_200M]
  connect_bd_net -net aclk_1 [get_bd_pins clk_142M] [get_bd_pins axi_interconnect_0/M01_ACLK] [get_bd_pins axi_interconnect_0/M02_ACLK] [get_bd_pins axi_interconnect_0/M06_ACLK] [get_bd_pins axi_interconnect_0/M07_ACLK] [get_bd_pins axi_mem_intercon/ACLK] [get_bd_pins axi_mem_intercon/M00_ACLK] [get_bd_pins axi_mem_intercon/S00_ACLK] [get_bd_pins axi_mem_intercon/S01_ACLK] [get_bd_pins axi_vdma/m_axi_mm2s_aclk] [get_bd_pins axi_vdma/m_axi_s2mm_aclk] [get_bd_pins axi_vdma/m_axis_mm2s_aclk] [get_bd_pins axi_vdma/s_axis_s2mm_aclk] [get_bd_pins hdmi_in/clk_142M] [get_bd_pins hdmi_out/clk_142M]
  connect_bd_net -net axi_gpio_video_gpio_io_o [get_bd_pins hdmi_in_hpd] [get_bd_pins hdmi_in/hdmi_in_hpd]
  connect_bd_net -net axi_gpio_video_ip2intc_irpt [get_bd_pins hdmi_in/hdmi_in_hpd_irq] [get_bd_pins xlconcat_0/In4]
  connect_bd_net -net axi_vdma_0_mm2s_introut [get_bd_pins axi_vdma/mm2s_introut] [get_bd_pins xlconcat_0/In1]
  connect_bd_net -net axi_vdma_0_s2mm_introut [get_bd_pins axi_vdma/s2mm_introut] [get_bd_pins xlconcat_0/In0]
  connect_bd_net -net ext_reset_in_1 [get_bd_pins system_resetn] [get_bd_pins proc_sys_reset_pixelclk/ext_reset_in]
  connect_bd_net -net hdmi_in_PixelClk [get_bd_pins hdmi_in/PixelClk] [get_bd_pins proc_sys_reset_pixelclk/slowest_sync_clk]
  connect_bd_net -net hdmi_in_aPixelClkLckd [get_bd_pins hdmi_in/aPixelClkLckd] [get_bd_pins proc_sys_reset_pixelclk/aux_reset_in]
  connect_bd_net -net hdmi_out_hpd_video_gpio_io_o [get_bd_pins hdmi_out_hpd] [get_bd_pins hdmi_out/hdmi_out_hpd]
  connect_bd_net -net hdmi_out_hpd_video_ip2intc_irpt [get_bd_pins hdmi_out/hdmi_out_hpd_irq] [get_bd_pins xlconcat_0/In5]
  connect_bd_net -net rst_ps7_0_100M_interconnect_aresetn [get_bd_pins ic_resetn_clk142M] [get_bd_pins axi_mem_intercon/ARESETN]
  connect_bd_net -net rst_ps7_0_100M_peripheral_aresetn [get_bd_pins periph_resetn_clk142M] [get_bd_pins axi_interconnect_0/M01_ARESETN] [get_bd_pins axi_interconnect_0/M02_ARESETN] [get_bd_pins axi_interconnect_0/M06_ARESETN] [get_bd_pins axi_interconnect_0/M07_ARESETN] [get_bd_pins axi_mem_intercon/M00_ARESETN] [get_bd_pins axi_mem_intercon/S00_ARESETN] [get_bd_pins axi_mem_intercon/S01_ARESETN] [get_bd_pins hdmi_in/periph_resetn_clk142M] [get_bd_pins hdmi_out/periph_resetn_clk142M]
  connect_bd_net -net v_tc_0_irq [get_bd_pins hdmi_out/vtc_out_irq] [get_bd_pins xlconcat_0/In2]
  connect_bd_net -net v_tc_1_irq [get_bd_pins hdmi_in/vtc_in_irq] [get_bd_pins xlconcat_0/In3]
  connect_bd_net -net vid_io_in_reset_1 [get_bd_pins hdmi_in/vid_io_in_reset] [get_bd_pins proc_sys_reset_pixelclk/peripheral_reset]
  connect_bd_net -net vtc_in_resetn_1 [get_bd_pins hdmi_in/resetn] [get_bd_pins proc_sys_reset_pixelclk/peripheral_aresetn]
  connect_bd_net -net xlconcat_0_dout [get_bd_pins video_irq] [get_bd_pins xlconcat_0/dout]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: image_processing_v2
proc create_hier_cell_image_processing_v2 { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_image_processing_v2() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 M_AXIS

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 S_AXIS

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL


  # Create pins
  create_bd_pin -dir I -type clk aclk
  create_bd_pin -dir I -type rst aresetn
  create_bd_pin -dir I -type clk clk
  create_bd_pin -dir I -type rst reset

  # Create instance: axis_switch_0, and set properties
  set axis_switch_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_switch:1.1 axis_switch_0 ]
  set_property -dict [list \
    CONFIG.DECODER_REG {1} \
    CONFIG.HAS_TKEEP {0} \
    CONFIG.HAS_TLAST {1} \
    CONFIG.HAS_TREADY {1} \
    CONFIG.HAS_TSTRB {0} \
    CONFIG.M00_S00_CONNECTIVITY {1} \
    CONFIG.M01_S01_CONNECTIVITY {0} \
    CONFIG.M02_S02_CONNECTIVITY {0} \
    CONFIG.M03_S03_CONNECTIVITY {0} \
    CONFIG.M04_S04_CONNECTIVITY {0} \
    CONFIG.M05_S05_CONNECTIVITY {0} \
    CONFIG.M06_S06_CONNECTIVITY {0} \
    CONFIG.NUM_MI {9} \
    CONFIG.NUM_SI {9} \
    CONFIG.OUTPUT_REG {1} \
    CONFIG.ROUTING_MODE {1} \
    CONFIG.TDATA_NUM_BYTES {3} \
    CONFIG.TUSER_WIDTH {1} \
  ] $axis_switch_0


  # Create instance: crop_stream_0, and set properties
  set block_name crop_stream
  set block_cell_name crop_stream_0
  if { [catch {set crop_stream_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $crop_stream_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: edgeDetection, and set properties
  set block_name filter_axis
  set block_cell_name edgeDetection
  if { [catch {set edgeDetection [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $edgeDetection eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [list \
    CONFIG.BUFFER_SIZE {1920} \
    CONFIG.FILTER_TYPE {1} \
  ] $edgeDetection


  # Create instance: histogram_projection_0, and set properties
  set block_name histogram_projection
  set block_cell_name histogram_projection_0
  if { [catch {set histogram_projection_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $histogram_projection_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: ps7_0_axi_periph, and set properties
  set ps7_0_axi_periph [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 ps7_0_axi_periph ]
  set_property -dict [list \
    CONFIG.M00_HAS_REGSLICE {1} \
    CONFIG.M01_HAS_REGSLICE {1} \
    CONFIG.M02_HAS_REGSLICE {1} \
    CONFIG.M03_HAS_REGSLICE {1} \
    CONFIG.M04_HAS_REGSLICE {1} \
    CONFIG.M05_HAS_REGSLICE {1} \
    CONFIG.M06_HAS_REGSLICE {1} \
    CONFIG.M07_HAS_REGSLICE {1} \
    CONFIG.M08_HAS_REGSLICE {1} \
    CONFIG.M09_HAS_REGSLICE {1} \
    CONFIG.NUM_MI {2} \
    CONFIG.NUM_SI {1} \
    CONFIG.S00_HAS_REGSLICE {1} \
  ] $ps7_0_axi_periph


  # Create instance: smooth0, and set properties
  set block_name filter_axis
  set block_cell_name smooth0
  if { [catch {set smooth0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $smooth0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property CONFIG.BUFFER_SIZE {1920} $smooth0


  # Create instance: smooth1, and set properties
  set block_name filter_axis
  set block_cell_name smooth1
  if { [catch {set smooth1 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $smooth1 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property CONFIG.BUFFER_SIZE {1920} $smooth1


  # Create instance: smooth2, and set properties
  set block_name filter_axis
  set block_cell_name smooth2
  if { [catch {set smooth2 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $smooth2 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property CONFIG.BUFFER_SIZE {1920} $smooth2


  # Create instance: smooth3, and set properties
  set block_name filter_axis
  set block_cell_name smooth3
  if { [catch {set smooth3 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $smooth3 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property CONFIG.BUFFER_SIZE {1920} $smooth3


  # Create instance: testSignalGeneration, and set properties
  set block_name filter_axis
  set block_cell_name testSignalGeneration
  if { [catch {set testSignalGeneration [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $testSignalGeneration eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [list \
    CONFIG.BUFFER_SIZE {1920} \
    CONFIG.FILTER_TYPE {3} \
  ] $testSignalGeneration


  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins S_AXI_CTRL] [get_bd_intf_pins axis_switch_0/S_AXI_CTRL]
  connect_bd_intf_net -intf_net S_AXIS_1 [get_bd_intf_pins S_AXIS] [get_bd_intf_pins axis_switch_0/S00_AXIS]
  connect_bd_intf_net -intf_net S_AXI_1 [get_bd_intf_pins S_AXI] [get_bd_intf_pins ps7_0_axi_periph/S00_AXI]
  connect_bd_intf_net -intf_net axis_switch_0_M00_AXIS [get_bd_intf_pins M_AXIS] [get_bd_intf_pins axis_switch_0/M00_AXIS]
  connect_bd_intf_net -intf_net axis_switch_0_M01_AXIS [get_bd_intf_pins axis_switch_0/M01_AXIS] [get_bd_intf_pins smooth0/S_AXIS]
  connect_bd_intf_net -intf_net axis_switch_0_M02_AXIS [get_bd_intf_pins axis_switch_0/M02_AXIS] [get_bd_intf_pins edgeDetection/S_AXIS]
  connect_bd_intf_net -intf_net axis_switch_0_M03_AXIS [get_bd_intf_pins axis_switch_0/M03_AXIS] [get_bd_intf_pins histogram_projection_0/S_AXIS]
  connect_bd_intf_net -intf_net axis_switch_0_M04_AXIS [get_bd_intf_pins axis_switch_0/M04_AXIS] [get_bd_intf_pins smooth1/S_AXIS]
  connect_bd_intf_net -intf_net axis_switch_0_M05_AXIS [get_bd_intf_pins axis_switch_0/M05_AXIS] [get_bd_intf_pins smooth2/S_AXIS]
  connect_bd_intf_net -intf_net axis_switch_0_M06_AXIS [get_bd_intf_pins axis_switch_0/M06_AXIS] [get_bd_intf_pins smooth3/S_AXIS]
  connect_bd_intf_net -intf_net axis_switch_0_M07_AXIS [get_bd_intf_pins axis_switch_0/M07_AXIS] [get_bd_intf_pins testSignalGeneration/S_AXIS]
  connect_bd_intf_net -intf_net axis_switch_0_M08_AXIS [get_bd_intf_pins axis_switch_0/M08_AXIS] [get_bd_intf_pins crop_stream_0/s]
  connect_bd_intf_net -intf_net crop_stream_0_m [get_bd_intf_pins axis_switch_0/S08_AXIS] [get_bd_intf_pins crop_stream_0/m]
  connect_bd_intf_net -intf_net edge_detection_M_AXIS [get_bd_intf_pins axis_switch_0/S02_AXIS] [get_bd_intf_pins edgeDetection/M_AXIS]
  connect_bd_intf_net -intf_net histogram_projection_0_M_AXIS [get_bd_intf_pins axis_switch_0/S03_AXIS] [get_bd_intf_pins histogram_projection_0/M_AXIS]
  connect_bd_intf_net -intf_net ps7_0_axi_periph_M00_AXI [get_bd_intf_pins histogram_projection_0/S_AXI] [get_bd_intf_pins ps7_0_axi_periph/M00_AXI]
  connect_bd_intf_net -intf_net ps7_0_axi_periph_M01_AXI [get_bd_intf_pins crop_stream_0/S_AXI] [get_bd_intf_pins ps7_0_axi_periph/M01_AXI]
  connect_bd_intf_net -intf_net smooth1_M_AXIS [get_bd_intf_pins axis_switch_0/S04_AXIS] [get_bd_intf_pins smooth1/M_AXIS]
  connect_bd_intf_net -intf_net smooth2_M_AXIS [get_bd_intf_pins axis_switch_0/S05_AXIS] [get_bd_intf_pins smooth2/M_AXIS]
  connect_bd_intf_net -intf_net smooth3_M_AXIS [get_bd_intf_pins axis_switch_0/S06_AXIS] [get_bd_intf_pins smooth3/M_AXIS]
  connect_bd_intf_net -intf_net smooth_M_AXIS [get_bd_intf_pins axis_switch_0/S01_AXIS] [get_bd_intf_pins smooth0/M_AXIS]
  connect_bd_intf_net -intf_net testSignalGeneration_M_AXIS [get_bd_intf_pins axis_switch_0/S07_AXIS] [get_bd_intf_pins testSignalGeneration/M_AXIS]

  # Create port connections
  connect_bd_net -net aclk_1 [get_bd_pins aclk] [get_bd_pins axis_switch_0/s_axi_ctrl_aclk] [get_bd_pins crop_stream_0/S_AXI_ACLK] [get_bd_pins histogram_projection_0/S_AXI_ACLK] [get_bd_pins ps7_0_axi_periph/ACLK] [get_bd_pins ps7_0_axi_periph/M00_ACLK] [get_bd_pins ps7_0_axi_periph/M01_ACLK] [get_bd_pins ps7_0_axi_periph/S00_ACLK]
  connect_bd_net -net aresetn_1 [get_bd_pins aresetn] [get_bd_pins axis_switch_0/s_axi_ctrl_aresetn] [get_bd_pins crop_stream_0/S_AXI_ARESETN] [get_bd_pins histogram_projection_0/S_AXI_ARESETN] [get_bd_pins ps7_0_axi_periph/ARESETN] [get_bd_pins ps7_0_axi_periph/M00_ARESETN] [get_bd_pins ps7_0_axi_periph/M01_ARESETN] [get_bd_pins ps7_0_axi_periph/S00_ARESETN]
  connect_bd_net -net clk_1 [get_bd_pins clk] [get_bd_pins axis_switch_0/aclk] [get_bd_pins crop_stream_0/clk] [get_bd_pins edgeDetection/clk] [get_bd_pins histogram_projection_0/clk] [get_bd_pins smooth0/clk] [get_bd_pins smooth1/clk] [get_bd_pins smooth2/clk] [get_bd_pins smooth3/clk] [get_bd_pins testSignalGeneration/clk]
  connect_bd_net -net reset_1 [get_bd_pins reset] [get_bd_pins axis_switch_0/aresetn] [get_bd_pins crop_stream_0/rst_n] [get_bd_pins edgeDetection/reset] [get_bd_pins histogram_projection_0/rst_n] [get_bd_pins smooth0/reset] [get_bd_pins smooth1/reset] [get_bd_pins smooth2/reset] [get_bd_pins smooth3/reset] [get_bd_pins testSignalGeneration/reset]

  # Restore current instance
  current_bd_instance $oldCurInst
}


# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set DDR [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 DDR ]

  set FIXED_IO [ create_bd_intf_port -mode Master -vlnv xilinx.com:display_processing_system7:fixedio_rtl:1.0 FIXED_IO ]

  set IIC_1 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:iic_rtl:1.0 IIC_1 ]

  set btns_4bits [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 btns_4bits ]

  set hdmi_in [ create_bd_intf_port -mode Slave -vlnv digilentinc.com:interface:tmds_rtl:1.0 hdmi_in ]

  set hdmi_in_ddc [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:iic_rtl:1.0 hdmi_in_ddc ]

  set hdmi_out [ create_bd_intf_port -mode Master -vlnv digilentinc.com:interface:tmds_rtl:1.0 hdmi_out ]

  set leds_4bits [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 leds_4bits ]

  set sws_2bits [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 sws_2bits ]


  # Create ports
  set hdmi_in_hpd [ create_bd_port -dir O -from 0 -to 0 hdmi_in_hpd ]
  set hdmi_out_hpd [ create_bd_port -dir O -from 0 -to 0 hdmi_out_hpd ]
  set rpi_gpio [ create_bd_port -dir O -from 19 -to 0 -type data rpi_gpio ]

  # Create instance: btns_gpio, and set properties
  set btns_gpio [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 btns_gpio ]
  set_property -dict [list \
    CONFIG.C_ALL_INPUTS {1} \
    CONFIG.C_GPIO_WIDTH {4} \
    CONFIG.C_INTERRUPT_PRESENT {1} \
  ] $btns_gpio


  # Create instance: concat_interrupts, and set properties
  set concat_interrupts [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 concat_interrupts ]
  set_property CONFIG.NUM_PORTS {7} $concat_interrupts


  # Create instance: image_processing_v2
  create_hier_cell_image_processing_v2 [current_bd_instance .] image_processing_v2

  # Create instance: leds_gpio, and set properties
  set leds_gpio [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 leds_gpio ]
  set_property -dict [list \
    CONFIG.C_ALL_INPUTS {0} \
    CONFIG.C_ALL_OUTPUTS {1} \
    CONFIG.C_GPIO_WIDTH {4} \
    CONFIG.C_INTERRUPT_PRESENT {1} \
  ] $leds_gpio


  # Create instance: ps7_0, and set properties
  set ps7_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 ps7_0 ]
  set_property -dict [list \
    CONFIG.PCW_ACT_APU_PERIPHERAL_FREQMHZ {650.000000} \
    CONFIG.PCW_ACT_CAN0_PERIPHERAL_FREQMHZ {23.8095} \
    CONFIG.PCW_ACT_CAN1_PERIPHERAL_FREQMHZ {23.8095} \
    CONFIG.PCW_ACT_CAN_PERIPHERAL_FREQMHZ {10.000000} \
    CONFIG.PCW_ACT_DCI_PERIPHERAL_FREQMHZ {10.096154} \
    CONFIG.PCW_ACT_ENET0_PERIPHERAL_FREQMHZ {125.000000} \
    CONFIG.PCW_ACT_ENET1_PERIPHERAL_FREQMHZ {10.000000} \
    CONFIG.PCW_ACT_FPGA0_PERIPHERAL_FREQMHZ {100.000000} \
    CONFIG.PCW_ACT_FPGA1_PERIPHERAL_FREQMHZ {142.857132} \
    CONFIG.PCW_ACT_FPGA2_PERIPHERAL_FREQMHZ {200.000000} \
    CONFIG.PCW_ACT_FPGA3_PERIPHERAL_FREQMHZ {1.000000} \
    CONFIG.PCW_ACT_I2C_PERIPHERAL_FREQMHZ {50} \
    CONFIG.PCW_ACT_PCAP_PERIPHERAL_FREQMHZ {200.000000} \
    CONFIG.PCW_ACT_QSPI_PERIPHERAL_FREQMHZ {200.000000} \
    CONFIG.PCW_ACT_SDIO_PERIPHERAL_FREQMHZ {50.000000} \
    CONFIG.PCW_ACT_SMC_PERIPHERAL_FREQMHZ {10.000000} \
    CONFIG.PCW_ACT_SPI_PERIPHERAL_FREQMHZ {10.000000} \
    CONFIG.PCW_ACT_TPIU_PERIPHERAL_FREQMHZ {200.000000} \
    CONFIG.PCW_ACT_TTC0_CLK0_PERIPHERAL_FREQMHZ {108.333336} \
    CONFIG.PCW_ACT_TTC0_CLK1_PERIPHERAL_FREQMHZ {108.333336} \
    CONFIG.PCW_ACT_TTC0_CLK2_PERIPHERAL_FREQMHZ {108.333336} \
    CONFIG.PCW_ACT_TTC1_CLK0_PERIPHERAL_FREQMHZ {108.333336} \
    CONFIG.PCW_ACT_TTC1_CLK1_PERIPHERAL_FREQMHZ {108.333336} \
    CONFIG.PCW_ACT_TTC1_CLK2_PERIPHERAL_FREQMHZ {108.333336} \
    CONFIG.PCW_ACT_TTC_PERIPHERAL_FREQMHZ {50} \
    CONFIG.PCW_ACT_UART_PERIPHERAL_FREQMHZ {100.000000} \
    CONFIG.PCW_ACT_USB0_PERIPHERAL_FREQMHZ {60} \
    CONFIG.PCW_ACT_USB1_PERIPHERAL_FREQMHZ {60} \
    CONFIG.PCW_ACT_WDT_PERIPHERAL_FREQMHZ {108.333336} \
    CONFIG.PCW_APU_CLK_RATIO_ENABLE {6:2:1} \
    CONFIG.PCW_APU_PERIPHERAL_FREQMHZ {650} \
    CONFIG.PCW_CAN0_PERIPHERAL_CLKSRC {External} \
    CONFIG.PCW_CAN0_PERIPHERAL_ENABLE {0} \
    CONFIG.PCW_CAN1_PERIPHERAL_CLKSRC {External} \
    CONFIG.PCW_CAN1_PERIPHERAL_ENABLE {0} \
    CONFIG.PCW_CAN_PERIPHERAL_CLKSRC {IO PLL} \
    CONFIG.PCW_CAN_PERIPHERAL_VALID {0} \
    CONFIG.PCW_CLK0_FREQ {100000000} \
    CONFIG.PCW_CLK1_FREQ {142857132} \
    CONFIG.PCW_CLK2_FREQ {200000000} \
    CONFIG.PCW_CLK3_FREQ {1000000} \
    CONFIG.PCW_CORE0_FIQ_INTR {0} \
    CONFIG.PCW_CORE0_IRQ_INTR {0} \
    CONFIG.PCW_CORE1_FIQ_INTR {0} \
    CONFIG.PCW_CORE1_IRQ_INTR {0} \
    CONFIG.PCW_CPU_CPU_6X4X_MAX_RANGE {667} \
    CONFIG.PCW_CPU_PERIPHERAL_CLKSRC {ARM PLL} \
    CONFIG.PCW_CRYSTAL_PERIPHERAL_FREQMHZ {50} \
    CONFIG.PCW_DCI_PERIPHERAL_CLKSRC {DDR PLL} \
    CONFIG.PCW_DCI_PERIPHERAL_FREQMHZ {10.159} \
    CONFIG.PCW_DDR_PERIPHERAL_CLKSRC {DDR PLL} \
    CONFIG.PCW_DDR_RAM_BASEADDR {0x00100000} \
    CONFIG.PCW_DDR_RAM_HIGHADDR {0x1FFFFFFF} \
    CONFIG.PCW_DM_WIDTH {4} \
    CONFIG.PCW_DQS_WIDTH {4} \
    CONFIG.PCW_DQ_WIDTH {32} \
    CONFIG.PCW_ENET0_BASEADDR {0xE000B000} \
    CONFIG.PCW_ENET0_ENET0_IO {MIO 16 .. 27} \
    CONFIG.PCW_ENET0_GRP_MDIO_ENABLE {1} \
    CONFIG.PCW_ENET0_GRP_MDIO_IO {MIO 52 .. 53} \
    CONFIG.PCW_ENET0_HIGHADDR {0xE000BFFF} \
    CONFIG.PCW_ENET0_PERIPHERAL_CLKSRC {IO PLL} \
    CONFIG.PCW_ENET0_PERIPHERAL_ENABLE {1} \
    CONFIG.PCW_ENET0_PERIPHERAL_FREQMHZ {1000 Mbps} \
    CONFIG.PCW_ENET1_PERIPHERAL_CLKSRC {IO PLL} \
    CONFIG.PCW_ENET1_PERIPHERAL_ENABLE {0} \
    CONFIG.PCW_ENET_RESET_POLARITY {Active Low} \
    CONFIG.PCW_EN_4K_TIMER {0} \
    CONFIG.PCW_EN_CAN0 {0} \
    CONFIG.PCW_EN_CAN1 {0} \
    CONFIG.PCW_EN_CLK0_PORT {1} \
    CONFIG.PCW_EN_CLK1_PORT {1} \
    CONFIG.PCW_EN_CLK2_PORT {1} \
    CONFIG.PCW_EN_CLK3_PORT {1} \
    CONFIG.PCW_EN_CLKTRIG0_PORT {0} \
    CONFIG.PCW_EN_CLKTRIG1_PORT {0} \
    CONFIG.PCW_EN_CLKTRIG2_PORT {0} \
    CONFIG.PCW_EN_CLKTRIG3_PORT {0} \
    CONFIG.PCW_EN_DDR {1} \
    CONFIG.PCW_EN_EMIO_CAN0 {0} \
    CONFIG.PCW_EN_EMIO_CAN1 {0} \
    CONFIG.PCW_EN_EMIO_CD_SDIO0 {0} \
    CONFIG.PCW_EN_EMIO_CD_SDIO1 {0} \
    CONFIG.PCW_EN_EMIO_ENET0 {0} \
    CONFIG.PCW_EN_EMIO_ENET1 {0} \
    CONFIG.PCW_EN_EMIO_GPIO {1} \
    CONFIG.PCW_EN_EMIO_I2C0 {0} \
    CONFIG.PCW_EN_EMIO_I2C1 {1} \
    CONFIG.PCW_EN_EMIO_MODEM_UART0 {0} \
    CONFIG.PCW_EN_EMIO_MODEM_UART1 {0} \
    CONFIG.PCW_EN_EMIO_PJTAG {0} \
    CONFIG.PCW_EN_EMIO_SDIO0 {0} \
    CONFIG.PCW_EN_EMIO_SDIO1 {0} \
    CONFIG.PCW_EN_EMIO_SPI0 {0} \
    CONFIG.PCW_EN_EMIO_SPI1 {0} \
    CONFIG.PCW_EN_EMIO_SRAM_INT {0} \
    CONFIG.PCW_EN_EMIO_TRACE {0} \
    CONFIG.PCW_EN_EMIO_TTC0 {0} \
    CONFIG.PCW_EN_EMIO_TTC1 {0} \
    CONFIG.PCW_EN_EMIO_UART0 {0} \
    CONFIG.PCW_EN_EMIO_UART1 {0} \
    CONFIG.PCW_EN_EMIO_WDT {0} \
    CONFIG.PCW_EN_EMIO_WP_SDIO0 {0} \
    CONFIG.PCW_EN_EMIO_WP_SDIO1 {0} \
    CONFIG.PCW_EN_ENET0 {1} \
    CONFIG.PCW_EN_ENET1 {0} \
    CONFIG.PCW_EN_GPIO {0} \
    CONFIG.PCW_EN_I2C0 {1} \
    CONFIG.PCW_EN_I2C1 {1} \
    CONFIG.PCW_EN_MODEM_UART0 {0} \
    CONFIG.PCW_EN_MODEM_UART1 {0} \
    CONFIG.PCW_EN_PJTAG {0} \
    CONFIG.PCW_EN_PTP_ENET0 {0} \
    CONFIG.PCW_EN_PTP_ENET1 {0} \
    CONFIG.PCW_EN_QSPI {1} \
    CONFIG.PCW_EN_RST0_PORT {1} \
    CONFIG.PCW_EN_RST1_PORT {0} \
    CONFIG.PCW_EN_RST2_PORT {0} \
    CONFIG.PCW_EN_RST3_PORT {0} \
    CONFIG.PCW_EN_SDIO0 {1} \
    CONFIG.PCW_EN_SDIO1 {0} \
    CONFIG.PCW_EN_SMC {0} \
    CONFIG.PCW_EN_SPI0 {0} \
    CONFIG.PCW_EN_SPI1 {0} \
    CONFIG.PCW_EN_TRACE {0} \
    CONFIG.PCW_EN_TTC0 {0} \
    CONFIG.PCW_EN_TTC1 {0} \
    CONFIG.PCW_EN_UART0 {1} \
    CONFIG.PCW_EN_UART1 {0} \
    CONFIG.PCW_EN_USB0 {1} \
    CONFIG.PCW_EN_USB1 {0} \
    CONFIG.PCW_EN_WDT {0} \
    CONFIG.PCW_FCLK0_PERIPHERAL_CLKSRC {IO PLL} \
    CONFIG.PCW_FCLK1_PERIPHERAL_CLKSRC {IO PLL} \
    CONFIG.PCW_FCLK2_PERIPHERAL_CLKSRC {IO PLL} \
    CONFIG.PCW_FCLK3_PERIPHERAL_CLKSRC {IO PLL} \
    CONFIG.PCW_FCLK_CLK0_BUF {TRUE} \
    CONFIG.PCW_FCLK_CLK1_BUF {TRUE} \
    CONFIG.PCW_FCLK_CLK2_BUF {TRUE} \
    CONFIG.PCW_FCLK_CLK3_BUF {TRUE} \
    CONFIG.PCW_FPGA0_PERIPHERAL_FREQMHZ {100} \
    CONFIG.PCW_FPGA1_PERIPHERAL_FREQMHZ {142} \
    CONFIG.PCW_FPGA2_PERIPHERAL_FREQMHZ {200} \
    CONFIG.PCW_FPGA3_PERIPHERAL_FREQMHZ {1} \
    CONFIG.PCW_FPGA_FCLK0_ENABLE {1} \
    CONFIG.PCW_FPGA_FCLK1_ENABLE {1} \
    CONFIG.PCW_FPGA_FCLK2_ENABLE {1} \
    CONFIG.PCW_FPGA_FCLK3_ENABLE {1} \
    CONFIG.PCW_GP0_EN_MODIFIABLE_TXN {1} \
    CONFIG.PCW_GP0_NUM_READ_THREADS {4} \
    CONFIG.PCW_GP0_NUM_WRITE_THREADS {4} \
    CONFIG.PCW_GP1_EN_MODIFIABLE_TXN {1} \
    CONFIG.PCW_GP1_NUM_READ_THREADS {4} \
    CONFIG.PCW_GP1_NUM_WRITE_THREADS {4} \
    CONFIG.PCW_GPIO_EMIO_GPIO_ENABLE {1} \
    CONFIG.PCW_GPIO_EMIO_GPIO_IO {10} \
    CONFIG.PCW_GPIO_EMIO_GPIO_WIDTH {10} \
    CONFIG.PCW_GPIO_MIO_GPIO_ENABLE {0} \
    CONFIG.PCW_GPIO_PERIPHERAL_ENABLE {0} \
    CONFIG.PCW_I2C0_BASEADDR {0xE0004000} \
    CONFIG.PCW_I2C0_GRP_INT_ENABLE {1} \
    CONFIG.PCW_I2C0_GRP_INT_IO {EMIO} \
    CONFIG.PCW_I2C0_HIGHADDR {0xE0004FFF} \
    CONFIG.PCW_I2C0_I2C0_IO {MIO 50 .. 51} \
    CONFIG.PCW_I2C0_PERIPHERAL_ENABLE {1} \
    CONFIG.PCW_I2C1_BASEADDR {0xE0005000} \
    CONFIG.PCW_I2C1_HIGHADDR {0xE0005FFF} \
    CONFIG.PCW_I2C1_I2C1_IO {EMIO} \
    CONFIG.PCW_I2C1_PERIPHERAL_ENABLE {1} \
    CONFIG.PCW_I2C_PERIPHERAL_FREQMHZ {108.333336} \
    CONFIG.PCW_I2C_RESET_POLARITY {Active Low} \
    CONFIG.PCW_IMPORT_BOARD_PRESET {None} \
    CONFIG.PCW_INCLUDE_ACP_TRANS_CHECK {0} \
    CONFIG.PCW_IRQ_F2P_INTR {1} \
    CONFIG.PCW_IRQ_F2P_MODE {DIRECT} \
    CONFIG.PCW_MIO_14_IOTYPE {LVCMOS 3.3V} \
    CONFIG.PCW_MIO_14_PULLUP {enabled} \
    CONFIG.PCW_MIO_14_SLEW {slow} \
    CONFIG.PCW_MIO_15_IOTYPE {LVCMOS 3.3V} \
    CONFIG.PCW_MIO_15_PULLUP {enabled} \
    CONFIG.PCW_MIO_15_SLEW {slow} \
    CONFIG.PCW_MIO_16_IOTYPE {LVCMOS 1.8V} \
    CONFIG.PCW_MIO_16_PULLUP {enabled} \
    CONFIG.PCW_MIO_16_SLEW {slow} \
    CONFIG.PCW_MIO_17_IOTYPE {LVCMOS 1.8V} \
    CONFIG.PCW_MIO_17_PULLUP {enabled} \
    CONFIG.PCW_MIO_17_SLEW {slow} \
    CONFIG.PCW_MIO_18_IOTYPE {LVCMOS 1.8V} \
    CONFIG.PCW_MIO_18_PULLUP {enabled} \
    CONFIG.PCW_MIO_18_SLEW {slow} \
    CONFIG.PCW_MIO_19_IOTYPE {LVCMOS 1.8V} \
    CONFIG.PCW_MIO_19_PULLUP {enabled} \
    CONFIG.PCW_MIO_19_SLEW {slow} \
    CONFIG.PCW_MIO_1_IOTYPE {LVCMOS 3.3V} \
    CONFIG.PCW_MIO_1_PULLUP {enabled} \
    CONFIG.PCW_MIO_1_SLEW {slow} \
    CONFIG.PCW_MIO_20_IOTYPE {LVCMOS 1.8V} \
    CONFIG.PCW_MIO_20_PULLUP {enabled} \
    CONFIG.PCW_MIO_20_SLEW {slow} \
    CONFIG.PCW_MIO_21_IOTYPE {LVCMOS 1.8V} \
    CONFIG.PCW_MIO_21_PULLUP {enabled} \
    CONFIG.PCW_MIO_21_SLEW {slow} \
    CONFIG.PCW_MIO_22_IOTYPE {LVCMOS 1.8V} \
    CONFIG.PCW_MIO_22_PULLUP {enabled} \
    CONFIG.PCW_MIO_22_SLEW {slow} \
    CONFIG.PCW_MIO_23_IOTYPE {LVCMOS 1.8V} \
    CONFIG.PCW_MIO_23_PULLUP {enabled} \
    CONFIG.PCW_MIO_23_SLEW {slow} \
    CONFIG.PCW_MIO_24_IOTYPE {LVCMOS 1.8V} \
    CONFIG.PCW_MIO_24_PULLUP {enabled} \
    CONFIG.PCW_MIO_24_SLEW {slow} \
    CONFIG.PCW_MIO_25_IOTYPE {LVCMOS 1.8V} \
    CONFIG.PCW_MIO_25_PULLUP {enabled} \
    CONFIG.PCW_MIO_25_SLEW {slow} \
    CONFIG.PCW_MIO_26_IOTYPE {LVCMOS 1.8V} \
    CONFIG.PCW_MIO_26_PULLUP {enabled} \
    CONFIG.PCW_MIO_26_SLEW {slow} \
    CONFIG.PCW_MIO_27_IOTYPE {LVCMOS 1.8V} \
    CONFIG.PCW_MIO_27_PULLUP {enabled} \
    CONFIG.PCW_MIO_27_SLEW {slow} \
    CONFIG.PCW_MIO_28_IOTYPE {LVCMOS 1.8V} \
    CONFIG.PCW_MIO_28_PULLUP {enabled} \
    CONFIG.PCW_MIO_28_SLEW {slow} \
    CONFIG.PCW_MIO_29_IOTYPE {LVCMOS 1.8V} \
    CONFIG.PCW_MIO_29_PULLUP {enabled} \
    CONFIG.PCW_MIO_29_SLEW {slow} \
    CONFIG.PCW_MIO_2_IOTYPE {LVCMOS 3.3V} \
    CONFIG.PCW_MIO_2_SLEW {slow} \
    CONFIG.PCW_MIO_30_IOTYPE {LVCMOS 1.8V} \
    CONFIG.PCW_MIO_30_PULLUP {enabled} \
    CONFIG.PCW_MIO_30_SLEW {slow} \
    CONFIG.PCW_MIO_31_IOTYPE {LVCMOS 1.8V} \
    CONFIG.PCW_MIO_31_PULLUP {enabled} \
    CONFIG.PCW_MIO_31_SLEW {slow} \
    CONFIG.PCW_MIO_32_IOTYPE {LVCMOS 1.8V} \
    CONFIG.PCW_MIO_32_PULLUP {enabled} \
    CONFIG.PCW_MIO_32_SLEW {slow} \
    CONFIG.PCW_MIO_33_IOTYPE {LVCMOS 1.8V} \
    CONFIG.PCW_MIO_33_PULLUP {enabled} \
    CONFIG.PCW_MIO_33_SLEW {slow} \
    CONFIG.PCW_MIO_34_IOTYPE {LVCMOS 1.8V} \
    CONFIG.PCW_MIO_34_PULLUP {enabled} \
    CONFIG.PCW_MIO_34_SLEW {slow} \
    CONFIG.PCW_MIO_35_IOTYPE {LVCMOS 1.8V} \
    CONFIG.PCW_MIO_35_PULLUP {enabled} \
    CONFIG.PCW_MIO_35_SLEW {slow} \
    CONFIG.PCW_MIO_36_IOTYPE {LVCMOS 1.8V} \
    CONFIG.PCW_MIO_36_PULLUP {enabled} \
    CONFIG.PCW_MIO_36_SLEW {slow} \
    CONFIG.PCW_MIO_37_IOTYPE {LVCMOS 1.8V} \
    CONFIG.PCW_MIO_37_PULLUP {enabled} \
    CONFIG.PCW_MIO_37_SLEW {slow} \
    CONFIG.PCW_MIO_38_IOTYPE {LVCMOS 1.8V} \
    CONFIG.PCW_MIO_38_PULLUP {enabled} \
    CONFIG.PCW_MIO_38_SLEW {slow} \
    CONFIG.PCW_MIO_39_IOTYPE {LVCMOS 1.8V} \
    CONFIG.PCW_MIO_39_PULLUP {enabled} \
    CONFIG.PCW_MIO_39_SLEW {slow} \
    CONFIG.PCW_MIO_3_IOTYPE {LVCMOS 3.3V} \
    CONFIG.PCW_MIO_3_SLEW {slow} \
    CONFIG.PCW_MIO_40_IOTYPE {LVCMOS 1.8V} \
    CONFIG.PCW_MIO_40_PULLUP {enabled} \
    CONFIG.PCW_MIO_40_SLEW {slow} \
    CONFIG.PCW_MIO_41_IOTYPE {LVCMOS 1.8V} \
    CONFIG.PCW_MIO_41_PULLUP {enabled} \
    CONFIG.PCW_MIO_41_SLEW {slow} \
    CONFIG.PCW_MIO_42_IOTYPE {LVCMOS 1.8V} \
    CONFIG.PCW_MIO_42_PULLUP {enabled} \
    CONFIG.PCW_MIO_42_SLEW {slow} \
    CONFIG.PCW_MIO_43_IOTYPE {LVCMOS 1.8V} \
    CONFIG.PCW_MIO_43_PULLUP {enabled} \
    CONFIG.PCW_MIO_43_SLEW {slow} \
    CONFIG.PCW_MIO_44_IOTYPE {LVCMOS 1.8V} \
    CONFIG.PCW_MIO_44_PULLUP {enabled} \
    CONFIG.PCW_MIO_44_SLEW {slow} \
    CONFIG.PCW_MIO_45_IOTYPE {LVCMOS 1.8V} \
    CONFIG.PCW_MIO_45_PULLUP {enabled} \
    CONFIG.PCW_MIO_45_SLEW {slow} \
    CONFIG.PCW_MIO_47_IOTYPE {LVCMOS 1.8V} \
    CONFIG.PCW_MIO_47_PULLUP {enabled} \
    CONFIG.PCW_MIO_47_SLEW {slow} \
    CONFIG.PCW_MIO_4_IOTYPE {LVCMOS 3.3V} \
    CONFIG.PCW_MIO_4_SLEW {slow} \
    CONFIG.PCW_MIO_50_IOTYPE {LVCMOS 1.8V} \
    CONFIG.PCW_MIO_50_PULLUP {enabled} \
    CONFIG.PCW_MIO_50_SLEW {slow} \
    CONFIG.PCW_MIO_51_IOTYPE {LVCMOS 1.8V} \
    CONFIG.PCW_MIO_51_PULLUP {enabled} \
    CONFIG.PCW_MIO_51_SLEW {slow} \
    CONFIG.PCW_MIO_52_IOTYPE {LVCMOS 1.8V} \
    CONFIG.PCW_MIO_52_PULLUP {enabled} \
    CONFIG.PCW_MIO_52_SLEW {slow} \
    CONFIG.PCW_MIO_53_IOTYPE {LVCMOS 1.8V} \
    CONFIG.PCW_MIO_53_PULLUP {enabled} \
    CONFIG.PCW_MIO_53_SLEW {slow} \
    CONFIG.PCW_MIO_5_IOTYPE {LVCMOS 3.3V} \
    CONFIG.PCW_MIO_5_SLEW {slow} \
    CONFIG.PCW_MIO_6_IOTYPE {LVCMOS 3.3V} \
    CONFIG.PCW_MIO_6_SLEW {slow} \
    CONFIG.PCW_MIO_8_IOTYPE {LVCMOS 3.3V} \
    CONFIG.PCW_MIO_8_SLEW {slow} \
    CONFIG.PCW_MIO_PRIMITIVE {54} \
    CONFIG.PCW_MIO_TREE_PERIPHERALS {unassigned#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#unassigned#Quad SPI Flash#unassigned#unassigned#unassigned#unassigned#unassigned#UART\
0#UART 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#SD 0#SD 0#SD 0#SD 0#SD 0#SD 0#unassigned#SD\
0#unassigned#unassigned#I2C 0#I2C 0#Enet 0#Enet 0} \
    CONFIG.PCW_MIO_TREE_SIGNALS {unassigned#qspi0_ss_b#qspi0_io[0]#qspi0_io[1]#qspi0_io[2]#qspi0_io[3]/HOLD_B#qspi0_sclk#unassigned#qspi_fbclk#unassigned#unassigned#unassigned#unassigned#unassigned#rx#tx#tx_clk#txd[0]#txd[1]#txd[2]#txd[3]#tx_ctl#rx_clk#rxd[0]#rxd[1]#rxd[2]#rxd[3]#rx_ctl#data[4]#dir#stp#nxt#data[0]#data[1]#data[2]#data[3]#clk#data[5]#data[6]#data[7]#clk#cmd#data[0]#data[1]#data[2]#data[3]#unassigned#cd#unassigned#unassigned#scl#sda#mdc#mdio}\
\
    CONFIG.PCW_M_AXI_GP0_ENABLE_STATIC_REMAP {0} \
    CONFIG.PCW_M_AXI_GP0_ID_WIDTH {12} \
    CONFIG.PCW_M_AXI_GP0_SUPPORT_NARROW_BURST {0} \
    CONFIG.PCW_M_AXI_GP0_THREAD_ID_WIDTH {12} \
    CONFIG.PCW_M_AXI_GP1_ENABLE_STATIC_REMAP {0} \
    CONFIG.PCW_M_AXI_GP1_ID_WIDTH {12} \
    CONFIG.PCW_M_AXI_GP1_SUPPORT_NARROW_BURST {0} \
    CONFIG.PCW_M_AXI_GP1_THREAD_ID_WIDTH {12} \
    CONFIG.PCW_NAND_CYCLES_T_AR {1} \
    CONFIG.PCW_NAND_CYCLES_T_CLR {1} \
    CONFIG.PCW_NAND_CYCLES_T_RC {11} \
    CONFIG.PCW_NAND_CYCLES_T_REA {1} \
    CONFIG.PCW_NAND_CYCLES_T_RR {1} \
    CONFIG.PCW_NAND_CYCLES_T_WC {11} \
    CONFIG.PCW_NAND_CYCLES_T_WP {1} \
    CONFIG.PCW_NOR_CS0_T_CEOE {1} \
    CONFIG.PCW_NOR_CS0_T_PC {1} \
    CONFIG.PCW_NOR_CS0_T_RC {11} \
    CONFIG.PCW_NOR_CS0_T_TR {1} \
    CONFIG.PCW_NOR_CS0_T_WC {11} \
    CONFIG.PCW_NOR_CS0_T_WP {1} \
    CONFIG.PCW_NOR_CS0_WE_TIME {0} \
    CONFIG.PCW_NOR_CS1_T_CEOE {1} \
    CONFIG.PCW_NOR_CS1_T_PC {1} \
    CONFIG.PCW_NOR_CS1_T_RC {11} \
    CONFIG.PCW_NOR_CS1_T_TR {1} \
    CONFIG.PCW_NOR_CS1_T_WC {11} \
    CONFIG.PCW_NOR_CS1_T_WP {1} \
    CONFIG.PCW_NOR_CS1_WE_TIME {0} \
    CONFIG.PCW_NOR_SRAM_CS0_T_CEOE {1} \
    CONFIG.PCW_NOR_SRAM_CS0_T_PC {1} \
    CONFIG.PCW_NOR_SRAM_CS0_T_RC {11} \
    CONFIG.PCW_NOR_SRAM_CS0_T_TR {1} \
    CONFIG.PCW_NOR_SRAM_CS0_T_WC {11} \
    CONFIG.PCW_NOR_SRAM_CS0_T_WP {1} \
    CONFIG.PCW_NOR_SRAM_CS0_WE_TIME {0} \
    CONFIG.PCW_NOR_SRAM_CS1_T_CEOE {1} \
    CONFIG.PCW_NOR_SRAM_CS1_T_PC {1} \
    CONFIG.PCW_NOR_SRAM_CS1_T_RC {11} \
    CONFIG.PCW_NOR_SRAM_CS1_T_TR {1} \
    CONFIG.PCW_NOR_SRAM_CS1_T_WC {11} \
    CONFIG.PCW_NOR_SRAM_CS1_T_WP {1} \
    CONFIG.PCW_NOR_SRAM_CS1_WE_TIME {0} \
    CONFIG.PCW_OVERRIDE_BASIC_CLOCK {0} \
    CONFIG.PCW_P2F_ENET0_INTR {0} \
    CONFIG.PCW_P2F_I2C0_INTR {0} \
    CONFIG.PCW_P2F_I2C1_INTR {0} \
    CONFIG.PCW_P2F_QSPI_INTR {0} \
    CONFIG.PCW_P2F_SDIO0_INTR {0} \
    CONFIG.PCW_P2F_UART0_INTR {0} \
    CONFIG.PCW_P2F_USB0_INTR {0} \
    CONFIG.PCW_PACKAGE_DDR_BOARD_DELAY0 {0.223} \
    CONFIG.PCW_PACKAGE_DDR_BOARD_DELAY1 {0.212} \
    CONFIG.PCW_PACKAGE_DDR_BOARD_DELAY2 {0.085} \
    CONFIG.PCW_PACKAGE_DDR_BOARD_DELAY3 {0.092} \
    CONFIG.PCW_PACKAGE_DDR_DQS_TO_CLK_DELAY_0 {0.040} \
    CONFIG.PCW_PACKAGE_DDR_DQS_TO_CLK_DELAY_1 {0.058} \
    CONFIG.PCW_PACKAGE_DDR_DQS_TO_CLK_DELAY_2 {-0.009} \
    CONFIG.PCW_PACKAGE_DDR_DQS_TO_CLK_DELAY_3 {-0.033} \
    CONFIG.PCW_PACKAGE_NAME {clg400} \
    CONFIG.PCW_PCAP_PERIPHERAL_CLKSRC {IO PLL} \
    CONFIG.PCW_PCAP_PERIPHERAL_FREQMHZ {200} \
    CONFIG.PCW_PERIPHERAL_BOARD_PRESET {None} \
    CONFIG.PCW_PJTAG_PERIPHERAL_ENABLE {0} \
    CONFIG.PCW_PLL_BYPASSMODE_ENABLE {0} \
    CONFIG.PCW_PRESET_BANK0_VOLTAGE {LVCMOS 3.3V} \
    CONFIG.PCW_PRESET_BANK1_VOLTAGE {LVCMOS 1.8V} \
    CONFIG.PCW_PS7_SI_REV {PRODUCTION} \
    CONFIG.PCW_QSPI_GRP_FBCLK_ENABLE {1} \
    CONFIG.PCW_QSPI_GRP_FBCLK_IO {MIO 8} \
    CONFIG.PCW_QSPI_GRP_IO1_ENABLE {0} \
    CONFIG.PCW_QSPI_GRP_SINGLE_SS_ENABLE {1} \
    CONFIG.PCW_QSPI_GRP_SINGLE_SS_IO {MIO 1 .. 6} \
    CONFIG.PCW_QSPI_GRP_SS1_ENABLE {0} \
    CONFIG.PCW_QSPI_INTERNAL_HIGHADDRESS {0xFCFFFFFF} \
    CONFIG.PCW_QSPI_PERIPHERAL_CLKSRC {IO PLL} \
    CONFIG.PCW_QSPI_PERIPHERAL_ENABLE {1} \
    CONFIG.PCW_QSPI_PERIPHERAL_FREQMHZ {200} \
    CONFIG.PCW_QSPI_QSPI_IO {MIO 1 .. 6} \
    CONFIG.PCW_SD0_GRP_CD_ENABLE {1} \
    CONFIG.PCW_SD0_GRP_CD_IO {MIO 47} \
    CONFIG.PCW_SD0_GRP_POW_ENABLE {0} \
    CONFIG.PCW_SD0_GRP_WP_ENABLE {0} \
    CONFIG.PCW_SD0_PERIPHERAL_ENABLE {1} \
    CONFIG.PCW_SD0_SD0_IO {MIO 40 .. 45} \
    CONFIG.PCW_SD1_PERIPHERAL_ENABLE {0} \
    CONFIG.PCW_SDIO0_BASEADDR {0xE0100000} \
    CONFIG.PCW_SDIO0_HIGHADDR {0xE0100FFF} \
    CONFIG.PCW_SDIO_PERIPHERAL_CLKSRC {IO PLL} \
    CONFIG.PCW_SDIO_PERIPHERAL_FREQMHZ {50} \
    CONFIG.PCW_SDIO_PERIPHERAL_VALID {1} \
    CONFIG.PCW_SINGLE_QSPI_DATA_MODE {x4} \
    CONFIG.PCW_SMC_CYCLE_T0 {NA} \
    CONFIG.PCW_SMC_CYCLE_T1 {NA} \
    CONFIG.PCW_SMC_CYCLE_T2 {NA} \
    CONFIG.PCW_SMC_CYCLE_T3 {NA} \
    CONFIG.PCW_SMC_CYCLE_T4 {NA} \
    CONFIG.PCW_SMC_CYCLE_T5 {NA} \
    CONFIG.PCW_SMC_CYCLE_T6 {NA} \
    CONFIG.PCW_SMC_PERIPHERAL_CLKSRC {IO PLL} \
    CONFIG.PCW_SMC_PERIPHERAL_VALID {0} \
    CONFIG.PCW_SPI0_PERIPHERAL_ENABLE {0} \
    CONFIG.PCW_SPI1_PERIPHERAL_ENABLE {0} \
    CONFIG.PCW_SPI_PERIPHERAL_CLKSRC {IO PLL} \
    CONFIG.PCW_SPI_PERIPHERAL_VALID {0} \
    CONFIG.PCW_S_AXI_GP0_ID_WIDTH {6} \
    CONFIG.PCW_S_AXI_HP0_DATA_WIDTH {64} \
    CONFIG.PCW_S_AXI_HP0_ID_WIDTH {6} \
    CONFIG.PCW_S_AXI_HP1_DATA_WIDTH {64} \
    CONFIG.PCW_S_AXI_HP2_DATA_WIDTH {64} \
    CONFIG.PCW_S_AXI_HP2_ID_WIDTH {6} \
    CONFIG.PCW_S_AXI_HP3_DATA_WIDTH {64} \
    CONFIG.PCW_TPIU_PERIPHERAL_CLKSRC {External} \
    CONFIG.PCW_TRACE_INTERNAL_WIDTH {2} \
    CONFIG.PCW_TRACE_PERIPHERAL_ENABLE {0} \
    CONFIG.PCW_TTC0_CLK0_PERIPHERAL_CLKSRC {CPU_1X} \
    CONFIG.PCW_TTC0_CLK0_PERIPHERAL_DIVISOR0 {1} \
    CONFIG.PCW_TTC0_CLK1_PERIPHERAL_CLKSRC {CPU_1X} \
    CONFIG.PCW_TTC0_CLK1_PERIPHERAL_DIVISOR0 {1} \
    CONFIG.PCW_TTC0_CLK2_PERIPHERAL_CLKSRC {CPU_1X} \
    CONFIG.PCW_TTC0_CLK2_PERIPHERAL_DIVISOR0 {1} \
    CONFIG.PCW_TTC0_PERIPHERAL_ENABLE {0} \
    CONFIG.PCW_TTC1_CLK0_PERIPHERAL_CLKSRC {CPU_1X} \
    CONFIG.PCW_TTC1_CLK0_PERIPHERAL_DIVISOR0 {1} \
    CONFIG.PCW_TTC1_CLK1_PERIPHERAL_CLKSRC {CPU_1X} \
    CONFIG.PCW_TTC1_CLK1_PERIPHERAL_DIVISOR0 {1} \
    CONFIG.PCW_TTC1_CLK2_PERIPHERAL_CLKSRC {CPU_1X} \
    CONFIG.PCW_TTC1_CLK2_PERIPHERAL_DIVISOR0 {1} \
    CONFIG.PCW_TTC1_PERIPHERAL_ENABLE {0} \
    CONFIG.PCW_UART0_BASEADDR {0xE0000000} \
    CONFIG.PCW_UART0_BAUD_RATE {115200} \
    CONFIG.PCW_UART0_GRP_FULL_ENABLE {0} \
    CONFIG.PCW_UART0_HIGHADDR {0xE0000FFF} \
    CONFIG.PCW_UART0_PERIPHERAL_ENABLE {1} \
    CONFIG.PCW_UART0_UART0_IO {MIO 14 .. 15} \
    CONFIG.PCW_UART1_PERIPHERAL_ENABLE {0} \
    CONFIG.PCW_UART_PERIPHERAL_CLKSRC {IO PLL} \
    CONFIG.PCW_UART_PERIPHERAL_FREQMHZ {100} \
    CONFIG.PCW_UART_PERIPHERAL_VALID {1} \
    CONFIG.PCW_UIPARAM_ACT_DDR_FREQ_MHZ {525.000000} \
    CONFIG.PCW_UIPARAM_DDR_ADV_ENABLE {0} \
    CONFIG.PCW_UIPARAM_DDR_AL {0} \
    CONFIG.PCW_UIPARAM_DDR_BANK_ADDR_COUNT {3} \
    CONFIG.PCW_UIPARAM_DDR_BL {8} \
    CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY0 {0.223} \
    CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY1 {0.212} \
    CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY2 {0.085} \
    CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY3 {0.092} \
    CONFIG.PCW_UIPARAM_DDR_BUS_WIDTH {16 Bit} \
    CONFIG.PCW_UIPARAM_DDR_CL {7} \
    CONFIG.PCW_UIPARAM_DDR_CLOCK_0_LENGTH_MM {25.8} \
    CONFIG.PCW_UIPARAM_DDR_CLOCK_0_PACKAGE_LENGTH {80.4535} \
    CONFIG.PCW_UIPARAM_DDR_CLOCK_0_PROPOGATION_DELAY {160} \
    CONFIG.PCW_UIPARAM_DDR_CLOCK_1_LENGTH_MM {25.8} \
    CONFIG.PCW_UIPARAM_DDR_CLOCK_1_PACKAGE_LENGTH {80.4535} \
    CONFIG.PCW_UIPARAM_DDR_CLOCK_1_PROPOGATION_DELAY {160} \
    CONFIG.PCW_UIPARAM_DDR_CLOCK_2_LENGTH_MM {0} \
    CONFIG.PCW_UIPARAM_DDR_CLOCK_2_PACKAGE_LENGTH {80.4535} \
    CONFIG.PCW_UIPARAM_DDR_CLOCK_2_PROPOGATION_DELAY {160} \
    CONFIG.PCW_UIPARAM_DDR_CLOCK_3_LENGTH_MM {0} \
    CONFIG.PCW_UIPARAM_DDR_CLOCK_3_PACKAGE_LENGTH {80.4535} \
    CONFIG.PCW_UIPARAM_DDR_CLOCK_3_PROPOGATION_DELAY {160} \
    CONFIG.PCW_UIPARAM_DDR_CLOCK_STOP_EN {0} \
    CONFIG.PCW_UIPARAM_DDR_COL_ADDR_COUNT {10} \
    CONFIG.PCW_UIPARAM_DDR_CWL {6} \
    CONFIG.PCW_UIPARAM_DDR_DEVICE_CAPACITY {4096 MBits} \
    CONFIG.PCW_UIPARAM_DDR_DQS_0_LENGTH_MM {15.6} \
    CONFIG.PCW_UIPARAM_DDR_DQS_0_PACKAGE_LENGTH {105.056} \
    CONFIG.PCW_UIPARAM_DDR_DQS_0_PROPOGATION_DELAY {160} \
    CONFIG.PCW_UIPARAM_DDR_DQS_1_LENGTH_MM {18.8} \
    CONFIG.PCW_UIPARAM_DDR_DQS_1_PACKAGE_LENGTH {66.904} \
    CONFIG.PCW_UIPARAM_DDR_DQS_1_PROPOGATION_DELAY {160} \
    CONFIG.PCW_UIPARAM_DDR_DQS_2_LENGTH_MM {0} \
    CONFIG.PCW_UIPARAM_DDR_DQS_2_PACKAGE_LENGTH {89.1715} \
    CONFIG.PCW_UIPARAM_DDR_DQS_2_PROPOGATION_DELAY {160} \
    CONFIG.PCW_UIPARAM_DDR_DQS_3_LENGTH_MM {0} \
    CONFIG.PCW_UIPARAM_DDR_DQS_3_PACKAGE_LENGTH {113.63} \
    CONFIG.PCW_UIPARAM_DDR_DQS_3_PROPOGATION_DELAY {160} \
    CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_0 {0.040} \
    CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_1 {0.058} \
    CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_2 {0.0} \
    CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_3 {0.0} \
    CONFIG.PCW_UIPARAM_DDR_DQ_0_LENGTH_MM {16.5} \
    CONFIG.PCW_UIPARAM_DDR_DQ_0_PACKAGE_LENGTH {98.503} \
    CONFIG.PCW_UIPARAM_DDR_DQ_0_PROPOGATION_DELAY {160} \
    CONFIG.PCW_UIPARAM_DDR_DQ_1_LENGTH_MM {18} \
    CONFIG.PCW_UIPARAM_DDR_DQ_1_PACKAGE_LENGTH {68.5855} \
    CONFIG.PCW_UIPARAM_DDR_DQ_1_PROPOGATION_DELAY {160} \
    CONFIG.PCW_UIPARAM_DDR_DQ_2_LENGTH_MM {0} \
    CONFIG.PCW_UIPARAM_DDR_DQ_2_PACKAGE_LENGTH {90.295} \
    CONFIG.PCW_UIPARAM_DDR_DQ_2_PROPOGATION_DELAY {160} \
    CONFIG.PCW_UIPARAM_DDR_DQ_3_LENGTH_MM {0} \
    CONFIG.PCW_UIPARAM_DDR_DQ_3_PACKAGE_LENGTH {103.977} \
    CONFIG.PCW_UIPARAM_DDR_DQ_3_PROPOGATION_DELAY {160} \
    CONFIG.PCW_UIPARAM_DDR_DRAM_WIDTH {16 Bits} \
    CONFIG.PCW_UIPARAM_DDR_ECC {Disabled} \
    CONFIG.PCW_UIPARAM_DDR_ENABLE {1} \
    CONFIG.PCW_UIPARAM_DDR_FREQ_MHZ {525} \
    CONFIG.PCW_UIPARAM_DDR_HIGH_TEMP {Normal (0-85)} \
    CONFIG.PCW_UIPARAM_DDR_MEMORY_TYPE {DDR 3} \
    CONFIG.PCW_UIPARAM_DDR_PARTNO {Custom} \
    CONFIG.PCW_UIPARAM_DDR_ROW_ADDR_COUNT {15} \
    CONFIG.PCW_UIPARAM_DDR_SPEED_BIN {DDR3_1066F} \
    CONFIG.PCW_UIPARAM_DDR_TRAIN_DATA_EYE {1} \
    CONFIG.PCW_UIPARAM_DDR_TRAIN_READ_GATE {1} \
    CONFIG.PCW_UIPARAM_DDR_TRAIN_WRITE_LEVEL {1} \
    CONFIG.PCW_UIPARAM_DDR_T_FAW {40.0} \
    CONFIG.PCW_UIPARAM_DDR_T_RAS_MIN {35.0} \
    CONFIG.PCW_UIPARAM_DDR_T_RC {50.625} \
    CONFIG.PCW_UIPARAM_DDR_T_RCD {13.125} \
    CONFIG.PCW_UIPARAM_DDR_T_RP {13.125} \
    CONFIG.PCW_UIPARAM_DDR_USE_INTERNAL_VREF {0} \
    CONFIG.PCW_UIPARAM_GENERATE_SUMMARY {NA} \
    CONFIG.PCW_USB0_BASEADDR {0xE0102000} \
    CONFIG.PCW_USB0_HIGHADDR {0xE0102fff} \
    CONFIG.PCW_USB0_PERIPHERAL_ENABLE {1} \
    CONFIG.PCW_USB0_USB0_IO {MIO 28 .. 39} \
    CONFIG.PCW_USB1_PERIPHERAL_ENABLE {0} \
    CONFIG.PCW_USB_RESET_POLARITY {Active Low} \
    CONFIG.PCW_USE_AXI_FABRIC_IDLE {0} \
    CONFIG.PCW_USE_AXI_NONSECURE {0} \
    CONFIG.PCW_USE_CORESIGHT {0} \
    CONFIG.PCW_USE_CROSS_TRIGGER {0} \
    CONFIG.PCW_USE_CR_FABRIC {1} \
    CONFIG.PCW_USE_DDR_BYPASS {0} \
    CONFIG.PCW_USE_DEBUG {0} \
    CONFIG.PCW_USE_DMA0 {0} \
    CONFIG.PCW_USE_DMA1 {0} \
    CONFIG.PCW_USE_DMA2 {0} \
    CONFIG.PCW_USE_DMA3 {0} \
    CONFIG.PCW_USE_EXPANDED_IOP {0} \
    CONFIG.PCW_USE_FABRIC_INTERRUPT {1} \
    CONFIG.PCW_USE_HIGH_OCM {0} \
    CONFIG.PCW_USE_M_AXI_GP0 {1} \
    CONFIG.PCW_USE_M_AXI_GP1 {1} \
    CONFIG.PCW_USE_PROC_EVENT_BUS {0} \
    CONFIG.PCW_USE_PS_SLCR_REGISTERS {0} \
    CONFIG.PCW_USE_S_AXI_ACP {0} \
    CONFIG.PCW_USE_S_AXI_GP0 {1} \
    CONFIG.PCW_USE_S_AXI_GP1 {0} \
    CONFIG.PCW_USE_S_AXI_HP0 {1} \
    CONFIG.PCW_USE_S_AXI_HP1 {0} \
    CONFIG.PCW_USE_S_AXI_HP2 {1} \
    CONFIG.PCW_USE_S_AXI_HP3 {0} \
    CONFIG.PCW_USE_TRACE {0} \
    CONFIG.PCW_VALUE_SILVERSION {3} \
    CONFIG.PCW_WDT_PERIPHERAL_CLKSRC {CPU_1X} \
    CONFIG.PCW_WDT_PERIPHERAL_DIVISOR0 {1} \
    CONFIG.PCW_WDT_PERIPHERAL_ENABLE {0} \
  ] $ps7_0


  # Create instance: ps7_0_axi_periph, and set properties
  set ps7_0_axi_periph [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 ps7_0_axi_periph ]
  set_property -dict [list \
    CONFIG.M00_HAS_REGSLICE {1} \
    CONFIG.M01_HAS_REGSLICE {1} \
    CONFIG.M02_HAS_REGSLICE {1} \
    CONFIG.M03_HAS_REGSLICE {1} \
    CONFIG.M04_HAS_REGSLICE {1} \
    CONFIG.M05_HAS_REGSLICE {1} \
    CONFIG.M06_HAS_REGSLICE {1} \
    CONFIG.M07_HAS_REGSLICE {1} \
    CONFIG.M08_HAS_REGSLICE {1} \
    CONFIG.M09_HAS_REGSLICE {1} \
    CONFIG.NUM_MI {8} \
    CONFIG.S00_HAS_REGSLICE {1} \
  ] $ps7_0_axi_periph


  # Create instance: pwm_generator_0, and set properties
  set block_name pwm_generator
  set block_cell_name pwm_generator_0
  if { [catch {set pwm_generator_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $pwm_generator_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: rst_ps7_0_fclk0, and set properties
  set rst_ps7_0_fclk0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_ps7_0_fclk0 ]

  # Create instance: rst_ps7_0_fclk1, and set properties
  set rst_ps7_0_fclk1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_ps7_0_fclk1 ]

  # Create instance: rst_ps7_0_fclk2, and set properties
  set rst_ps7_0_fclk2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_ps7_0_fclk2 ]

  # Create instance: switches_gpio, and set properties
  set switches_gpio [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 switches_gpio ]
  set_property -dict [list \
    CONFIG.C_ALL_INPUTS {1} \
    CONFIG.C_GPIO_WIDTH {2} \
    CONFIG.C_INTERRUPT_PRESENT {1} \
  ] $switches_gpio


  # Create instance: system_interrupts, and set properties
  set system_interrupts [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_intc:4.1 system_interrupts ]

  # Create instance: video
  create_hier_cell_video [current_bd_instance .] video

  # Create instance: xlconcat_0, and set properties
  set xlconcat_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_0 ]
  set_property CONFIG.NUM_PORTS {16} $xlconcat_0


  # Create instance: xlconcat_1, and set properties
  set xlconcat_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_1 ]
  set_property CONFIG.NUM_PORTS {20} $xlconcat_1


  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]

  # Create interface connections
  connect_bd_intf_net -intf_net axi_gpio_0_GPIO [get_bd_intf_ports btns_4bits] [get_bd_intf_pins btns_gpio/GPIO]
  connect_bd_intf_net -intf_net axi_mem_intercon_M00_AXI [get_bd_intf_pins ps7_0/S_AXI_HP0] [get_bd_intf_pins video/M_AXI]
  connect_bd_intf_net -intf_net dvi2rgb_0_DDC [get_bd_intf_ports hdmi_in_ddc] [get_bd_intf_pins video/DDC]
  connect_bd_intf_net -intf_net hdmi_in_1 [get_bd_intf_ports hdmi_in] [get_bd_intf_pins video/hdmi_in1]
  connect_bd_intf_net -intf_net leds_gpio_GPIO [get_bd_intf_ports leds_4bits] [get_bd_intf_pins leds_gpio/GPIO]
  connect_bd_intf_net -intf_net processing_system7_0_FIXED_IO [get_bd_intf_ports FIXED_IO] [get_bd_intf_pins ps7_0/FIXED_IO]
  connect_bd_intf_net -intf_net ps7_0_DDR [get_bd_intf_ports DDR] [get_bd_intf_pins ps7_0/DDR]
  connect_bd_intf_net -intf_net ps7_0_IIC_1 [get_bd_intf_ports IIC_1] [get_bd_intf_pins ps7_0/IIC_1]
  connect_bd_intf_net -intf_net ps7_0_M_AXI_GP0 [get_bd_intf_pins ps7_0/M_AXI_GP0] [get_bd_intf_pins ps7_0_axi_periph/S00_AXI]
  connect_bd_intf_net -intf_net ps7_0_axi_periph_M00_AXI [get_bd_intf_pins ps7_0_axi_periph/M00_AXI] [get_bd_intf_pins system_interrupts/s_axi]
  connect_bd_intf_net -intf_net ps7_0_axi_periph_M01_AXI [get_bd_intf_pins ps7_0_axi_periph/M01_AXI] [get_bd_intf_pins video/S_AXI]
  connect_bd_intf_net -intf_net ps7_0_axi_periph_M02_AXI [get_bd_intf_pins image_processing_v2/S_AXI_CTRL] [get_bd_intf_pins ps7_0_axi_periph/M02_AXI]
  connect_bd_intf_net -intf_net ps7_0_axi_periph_M03_AXI [get_bd_intf_pins btns_gpio/S_AXI] [get_bd_intf_pins ps7_0_axi_periph/M03_AXI]
  connect_bd_intf_net -intf_net ps7_0_axi_periph_M04_AXI [get_bd_intf_pins leds_gpio/S_AXI] [get_bd_intf_pins ps7_0_axi_periph/M04_AXI]
  connect_bd_intf_net -intf_net ps7_0_axi_periph_M05_AXI [get_bd_intf_pins ps7_0_axi_periph/M05_AXI] [get_bd_intf_pins switches_gpio/S_AXI]
  connect_bd_intf_net -intf_net ps7_0_axi_periph_M06_AXI [get_bd_intf_pins image_processing_v2/S_AXI] [get_bd_intf_pins ps7_0_axi_periph/M06_AXI]
  connect_bd_intf_net -intf_net ps7_0_axi_periph_M07_AXI [get_bd_intf_pins ps7_0_axi_periph/M07_AXI] [get_bd_intf_pins pwm_generator_0/S_AXI]
  connect_bd_intf_net -intf_net stream_in_24_1 [get_bd_intf_pins image_processing_v2/M_AXIS] [get_bd_intf_pins video/stream_in_24]
  connect_bd_intf_net -intf_net switches_gpio_GPIO [get_bd_intf_ports sws_2bits] [get_bd_intf_pins switches_gpio/GPIO]
  connect_bd_intf_net -intf_net video_hdmi_out1 [get_bd_intf_ports hdmi_out] [get_bd_intf_pins video/hdmi_out1]
  connect_bd_intf_net -intf_net video_to_video_processing [get_bd_intf_pins image_processing_v2/S_AXIS] [get_bd_intf_pins video/to_video_processing]

  # Create port connections
  connect_bd_net -net axi_gpio_0_ip2intc_irpt [get_bd_pins btns_gpio/ip2intc_irpt] [get_bd_pins concat_interrupts/In5]
  connect_bd_net -net axi_gpio_video_gpio_io_o [get_bd_ports hdmi_in_hpd] [get_bd_pins video/hdmi_in_hpd]
  connect_bd_net -net concat_interrupts_dout [get_bd_pins concat_interrupts/dout] [get_bd_pins system_interrupts/intr]
  connect_bd_net -net hdmi_out_hpd_video_gpio_io_o [get_bd_ports hdmi_out_hpd] [get_bd_pins video/hdmi_out_hpd]
  connect_bd_net -net leds_gpio_ip2intc_irpt [get_bd_pins concat_interrupts/In3] [get_bd_pins leds_gpio/ip2intc_irpt]
  connect_bd_net -net ps7_0_FCLK_CLK0 [get_bd_pins btns_gpio/s_axi_aclk] [get_bd_pins image_processing_v2/aclk] [get_bd_pins leds_gpio/s_axi_aclk] [get_bd_pins ps7_0/FCLK_CLK0] [get_bd_pins ps7_0/M_AXI_GP0_ACLK] [get_bd_pins ps7_0/M_AXI_GP1_ACLK] [get_bd_pins ps7_0/S_AXI_GP0_ACLK] [get_bd_pins ps7_0/S_AXI_HP2_ACLK] [get_bd_pins ps7_0_axi_periph/ACLK] [get_bd_pins ps7_0_axi_periph/M00_ACLK] [get_bd_pins ps7_0_axi_periph/M01_ACLK] [get_bd_pins ps7_0_axi_periph/M02_ACLK] [get_bd_pins ps7_0_axi_periph/M03_ACLK] [get_bd_pins ps7_0_axi_periph/M04_ACLK] [get_bd_pins ps7_0_axi_periph/M05_ACLK] [get_bd_pins ps7_0_axi_periph/M06_ACLK] [get_bd_pins ps7_0_axi_periph/M07_ACLK] [get_bd_pins ps7_0_axi_periph/S00_ACLK] [get_bd_pins pwm_generator_0/S_AXI_ACLK] [get_bd_pins pwm_generator_0/clk] [get_bd_pins rst_ps7_0_fclk0/slowest_sync_clk] [get_bd_pins switches_gpio/s_axi_aclk] [get_bd_pins system_interrupts/s_axi_aclk] [get_bd_pins video/clk_100M]
  connect_bd_net -net ps7_0_FCLK_CLK1 [get_bd_pins image_processing_v2/clk] [get_bd_pins ps7_0/FCLK_CLK1] [get_bd_pins ps7_0/S_AXI_HP0_ACLK] [get_bd_pins rst_ps7_0_fclk1/slowest_sync_clk] [get_bd_pins video/clk_142M]
  connect_bd_net -net ps7_0_FCLK_CLK2 [get_bd_pins ps7_0/FCLK_CLK2] [get_bd_pins rst_ps7_0_fclk2/slowest_sync_clk] [get_bd_pins video/clk_200M]
  connect_bd_net -net ps7_0_FCLK_CLK3 [get_bd_pins ps7_0/FCLK_CLK3] [get_bd_pins pwm_generator_0/clk_1m]
  connect_bd_net -net ps7_0_FCLK_RESET0_N [get_bd_pins ps7_0/FCLK_RESET0_N] [get_bd_pins rst_ps7_0_fclk0/ext_reset_in] [get_bd_pins rst_ps7_0_fclk1/ext_reset_in] [get_bd_pins rst_ps7_0_fclk2/ext_reset_in] [get_bd_pins video/system_resetn]
  connect_bd_net -net pwm_generator_0_pwm0 [get_bd_pins pwm_generator_0/pwm0] [get_bd_pins xlconcat_1/In5]
  connect_bd_net -net pwm_generator_0_pwm1 [get_bd_pins pwm_generator_0/pwm1] [get_bd_pins xlconcat_1/In8]
  connect_bd_net -net pwm_generator_0_pwm2 [get_bd_pins pwm_generator_0/pwm2] [get_bd_pins xlconcat_1/In11]
  connect_bd_net -net pwm_generator_0_pwm3 [get_bd_pins pwm_generator_0/pwm3] [get_bd_pins xlconcat_1/In12]
  connect_bd_net -net pwm_generator_0_pwm4 [get_bd_pins pwm_generator_0/pwm4] [get_bd_pins xlconcat_1/In13]
  connect_bd_net -net pwm_generator_0_pwm5 [get_bd_pins pwm_generator_0/pwm5] [get_bd_pins xlconcat_1/In18]
  connect_bd_net -net rst_ps7_0_fclk0_interconnect_aresetn [get_bd_pins ps7_0_axi_periph/ARESETN] [get_bd_pins pwm_generator_0/S_AXI_ARESETN] [get_bd_pins pwm_generator_0/rst] [get_bd_pins rst_ps7_0_fclk0/interconnect_aresetn] [get_bd_pins video/ic_resetn_clk100M]
  connect_bd_net -net rst_ps7_0_fclk0_peripheral_aresetn [get_bd_pins btns_gpio/s_axi_aresetn] [get_bd_pins image_processing_v2/aresetn] [get_bd_pins leds_gpio/s_axi_aresetn] [get_bd_pins ps7_0_axi_periph/M00_ARESETN] [get_bd_pins ps7_0_axi_periph/M01_ARESETN] [get_bd_pins ps7_0_axi_periph/M02_ARESETN] [get_bd_pins ps7_0_axi_periph/M03_ARESETN] [get_bd_pins ps7_0_axi_periph/M04_ARESETN] [get_bd_pins ps7_0_axi_periph/M05_ARESETN] [get_bd_pins ps7_0_axi_periph/M06_ARESETN] [get_bd_pins ps7_0_axi_periph/M07_ARESETN] [get_bd_pins ps7_0_axi_periph/S00_ARESETN] [get_bd_pins rst_ps7_0_fclk0/peripheral_aresetn] [get_bd_pins switches_gpio/s_axi_aresetn] [get_bd_pins system_interrupts/s_axi_aresetn] [get_bd_pins video/periph_resetn_clk100M]
  connect_bd_net -net rst_ps7_0_fclk1_interconnect_aresetn [get_bd_pins rst_ps7_0_fclk1/interconnect_aresetn] [get_bd_pins video/ic_resetn_clk142M]
  connect_bd_net -net rst_ps7_0_fclk1_peripheral_aresetn [get_bd_pins image_processing_v2/reset] [get_bd_pins rst_ps7_0_fclk1/peripheral_aresetn] [get_bd_pins video/periph_resetn_clk142M]
  connect_bd_net -net switches_gpio_ip2intc_irpt [get_bd_pins concat_interrupts/In6] [get_bd_pins switches_gpio/ip2intc_irpt]
  connect_bd_net -net system_interrupts_irq [get_bd_pins system_interrupts/irq] [get_bd_pins xlconcat_0/In0]
  connect_bd_net -net video_dout [get_bd_pins concat_interrupts/In0] [get_bd_pins video/video_irq]
  connect_bd_net -net xlconcat_0_dout [get_bd_pins ps7_0/IRQ_F2P] [get_bd_pins xlconcat_0/dout]
  connect_bd_net -net xlconcat_1_dout [get_bd_ports rpi_gpio] [get_bd_pins xlconcat_1/dout]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins xlconcat_1/In0] [get_bd_pins xlconcat_1/In1] [get_bd_pins xlconcat_1/In2] [get_bd_pins xlconcat_1/In3] [get_bd_pins xlconcat_1/In4] [get_bd_pins xlconcat_1/In6] [get_bd_pins xlconcat_1/In7] [get_bd_pins xlconcat_1/In9] [get_bd_pins xlconcat_1/In10] [get_bd_pins xlconcat_1/In14] [get_bd_pins xlconcat_1/In15] [get_bd_pins xlconcat_1/In16] [get_bd_pins xlconcat_1/In17] [get_bd_pins xlconcat_1/In19] [get_bd_pins xlconstant_0/dout]

  # Create address segments
  assign_bd_address -offset 0x43C10000 -range 0x00010000 -target_address_space [get_bd_addr_spaces ps7_0/Data] [get_bd_addr_segs video/hdmi_out/frontend/axi_dynclk/s00_axi/reg0] -force
  assign_bd_address -offset 0x41220000 -range 0x00010000 -target_address_space [get_bd_addr_spaces ps7_0/Data] [get_bd_addr_segs video/hdmi_in/frontend/axi_gpio_hdmiin/S_AXI/Reg] -force
  assign_bd_address -offset 0x43000000 -range 0x00010000 -target_address_space [get_bd_addr_spaces ps7_0/Data] [get_bd_addr_segs video/axi_vdma/S_AXI_LITE/Reg] -force
  assign_bd_address -offset 0x40000000 -range 0x00010000 -target_address_space [get_bd_addr_spaces ps7_0/Data] [get_bd_addr_segs image_processing_v2/axis_switch_0/S_AXI_CTRL/Reg] -force
  assign_bd_address -offset 0x41210000 -range 0x00010000 -target_address_space [get_bd_addr_spaces ps7_0/Data] [get_bd_addr_segs btns_gpio/S_AXI/Reg] -force
  assign_bd_address -offset 0x43C50000 -range 0x00010000 -target_address_space [get_bd_addr_spaces ps7_0/Data] [get_bd_addr_segs video/hdmi_in/color_convert/s_axi_control/Reg] -force
  assign_bd_address -offset 0x43C60000 -range 0x00010000 -target_address_space [get_bd_addr_spaces ps7_0/Data] [get_bd_addr_segs video/hdmi_out/color_convert/s_axi_control/Reg] -force
  assign_bd_address -offset 0x40030000 -range 0x00001000 -target_address_space [get_bd_addr_spaces ps7_0/Data] [get_bd_addr_segs image_processing_v2/crop_stream_0/S_AXI/reg0] -force
  assign_bd_address -offset 0x41230000 -range 0x00010000 -target_address_space [get_bd_addr_spaces ps7_0/Data] [get_bd_addr_segs video/hdmi_out/frontend/hdmi_out_hpd_video/S_AXI/Reg] -force
  assign_bd_address -offset 0x40010000 -range 0x00001000 -target_address_space [get_bd_addr_spaces ps7_0/Data] [get_bd_addr_segs image_processing_v2/histogram_projection_0/S_AXI/reg0] -force
  assign_bd_address -offset 0x41250000 -range 0x00010000 -target_address_space [get_bd_addr_spaces ps7_0/Data] [get_bd_addr_segs leds_gpio/S_AXI/Reg] -force
  assign_bd_address -offset 0x43C40000 -range 0x00010000 -target_address_space [get_bd_addr_spaces ps7_0/Data] [get_bd_addr_segs video/hdmi_in/pixel_pack/s_axi_control/Reg] -force
  assign_bd_address -offset 0x43C70000 -range 0x00010000 -target_address_space [get_bd_addr_spaces ps7_0/Data] [get_bd_addr_segs video/hdmi_out/pixel_unpack/s_axi_control/Reg] -force
  assign_bd_address -offset 0x40020000 -range 0x00001000 -target_address_space [get_bd_addr_spaces ps7_0/Data] [get_bd_addr_segs pwm_generator_0/S_AXI/reg0] -force
  assign_bd_address -offset 0x41200000 -range 0x00010000 -target_address_space [get_bd_addr_spaces ps7_0/Data] [get_bd_addr_segs switches_gpio/S_AXI/Reg] -force
  assign_bd_address -offset 0x41800000 -range 0x00010000 -target_address_space [get_bd_addr_spaces ps7_0/Data] [get_bd_addr_segs system_interrupts/S_AXI/Reg] -force
  assign_bd_address -offset 0x43C30000 -range 0x00010000 -target_address_space [get_bd_addr_spaces ps7_0/Data] [get_bd_addr_segs video/hdmi_in/frontend/vtc_in/ctrl/Reg] -force
  assign_bd_address -offset 0x43C20000 -range 0x00010000 -target_address_space [get_bd_addr_spaces ps7_0/Data] [get_bd_addr_segs video/hdmi_out/frontend/vtc_out/ctrl/Reg] -force
  assign_bd_address -offset 0x10000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces video/axi_vdma/Data_MM2S] [get_bd_addr_segs ps7_0/S_AXI_HP0/HP0_DDR_LOWOCM] -force
  assign_bd_address -offset 0x10000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces video/axi_vdma/Data_S2MM] [get_bd_addr_segs ps7_0/S_AXI_HP0/HP0_DDR_LOWOCM] -force


  # Restore current instance
  current_bd_instance $oldCurInst

  # Create PFM attributes
  set_property PFM.AXI_PORT {M_AXI_GP1 {memport "M_AXI_GP" sptag "" memory "" is_range "false"} S_AXI_ACP {memport "S_AXI_ACP" sptag "" memory "" is_range "false"} S_AXI_HP1 {memport "S_AXI_HP" sptag "" memory "" is_range "false"} S_AXI_HP2 {memport "S_AXI_HP" sptag "" memory "" is_range "false"} S_AXI_HP3 {memport "S_AXI_HP" sptag "" memory "" is_range "false"}} [get_bd_cells /ps7_0]
  set_property PFM.CLOCK {FCLK_CLK0 {id "0" is_default "true" proc_sys_reset "rst_ps7_0_fclk0" status "fixed" freq_hz "100000000"} FCLK_CLK1 {id "1" is_default "false" proc_sys_reset "rst_ps7_0_fclk1" status "fixed" freq_hz "142857132"} FCLK_CLK2 {id "4" is_default "false" proc_sys_reset "rst_ps7_0_fclk2" status "fixed" freq_hz "200000000"}} [get_bd_cells /ps7_0]
  set_property PFM.IRQ {In1 {} In2 {} In3 {} In4 {} In5 {} In6 {} In7 {} In8 {} In9 {} In10 {} In11 {} In12 {} In13 {} In14 {} In15 {}} [get_bd_cells /xlconcat_0]


  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


common::send_gid_msg -ssname BD::TCL -id 2053 -severity "WARNING" "This Tcl script was generated from a block design that has not been validated. It is possible that design <$design_name> may result in errors during validation."

