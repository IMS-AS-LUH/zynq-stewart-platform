set REFERENCE_DIR "../."


# Set the project name
set _proj_name_ "VideoDetectionPipeline"

variable script_file
set script_file "create_project.tcl"

# Create project
create_project ${_proj_name_} ./${_proj_name_} -part xc7z020clg400-1

# Set the directory path for the new project
set proj_dir [get_property directory [current_project]]

# Set project properties
set obj [current_project]
set_property -name "corecontainer.enable" -value "1" -objects $obj
set_property -name "default_lib" -value "xil_defaultlib" -objects $obj
set_property -name "enable_core_container" -value "1" -objects $obj
set_property -name "enable_vhdl_2008" -value "1" -objects $obj
set_property -name "ip_cache_permissions" -value "read write" -objects $obj
set_property -name "ip_output_repo" -value "$proj_dir/${_proj_name_}.cache/ip" -objects $obj
set_property -name "mem.enable_memory_map_generation" -value "1" -objects $obj
set_property -name "part" -value "xc7z020clg400-1" -objects $obj
set_property -name "platform.board_id" -value "xd" -objects $obj
set_property -name "platform.extensible" -value "1" -objects $obj
set_property -name "platform.name" -value "VideoDetectionPipeline" -objects $obj
set_property -name "platform.vendor" -value "ims.uni-hannover.de" -objects $obj
set_property -name "platform.version" -value "1.0" -objects $obj
set_property -name "revised_directory_structure" -value "1" -objects $obj
set_property -name "sim.central_dir" -value "$proj_dir/${_proj_name_}.ip_user_files" -objects $obj
set_property -name "sim.ip.auto_export_scripts" -value "1" -objects $obj
set_property -name "simulator_language" -value "Mixed" -objects $obj
set_property -name "target_language" -value "VHDL" -objects $obj
set_property -name "webtalk.activehdl_export_sim" -value "310" -objects $obj
set_property -name "webtalk.modelsim_export_sim" -value "311" -objects $obj
set_property -name "webtalk.questa_export_sim" -value "311" -objects $obj
set_property -name "webtalk.questa_launch_sim" -value "5" -objects $obj
set_property -name "webtalk.riviera_export_sim" -value "310" -objects $obj
set_property -name "webtalk.vcs_export_sim" -value "310" -objects $obj
set_property -name "webtalk.xcelium_export_sim" -value "1" -objects $obj
set_property -name "webtalk.xsim_export_sim" -value "311" -objects $obj
set_property -name "webtalk.xsim_launch_sim" -value "444" -objects $obj
set_property -name "xpm_libraries" -value "XPM_CDC XPM_FIFO XPM_MEMORY" -objects $obj

set_property "ip_repo_paths" "[file normalize "$REFERENCE_DIR/ip"]" $obj

# Rebuild user ip_repo's index before adding any source files
update_ip_catalog -rebuild

# Create 'sources_1' fileset (if not found)
if {[string equal [get_filesets -quiet sources_1] ""]} {
  create_fileset -srcset sources_1
}
puts "Test"

# Add files and Set Library based on folder name
foreach dir [glob $REFERENCE_DIR/rtl/*] {
	add_files -fileset sources_1 $dir
	set lib_name  [string map [list $REFERENCE_DIR/rtl/ ""] $dir]
	set_property library $lib_name [get_files *rtl/$lib_name*]
}

foreach dir [glob $REFERENCE_DIR/bd/*] {
	set lib_name  [string map [list $REFERENCE_DIR/bd/ ""] $dir]
	add_files -fileset sources_1 [glob $dir/*.bd]
	add_files -fileset sources_1 $dir/hdl
	set_property library $lib_name [get_files *bd/$lib_name/hdl/*]
}

# Set 'sources_1' fileset properties
set obj [get_filesets sources_1]
set_property -name "top" -value "top_level" -objects $obj
set_property -name "top_auto_set" -value "0" -objects $obj

add_files -fileset constrs_1 -norecurse $REFERENCE_DIR/vivado/constraints/base.xdc


update_compile_order -fileset sources_1

add_files -fileset utils_1 -norecurse $REFERENCE_DIR/scripts/post_write_bitstream.tcl
set_property STEPS.WRITE_BITSTREAM.TCL.POST [ get_files $REFERENCE_DIR/scripts/post_write_bitstream.tcl -of [get_fileset utils_1] ] [get_runs impl_1]


# Simulation
add_files -fileset sim_1 $REFERENCE_DIR/sim/tb.sv



