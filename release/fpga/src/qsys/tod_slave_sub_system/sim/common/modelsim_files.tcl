source [file join [file dirname [info script]] ./../../../ip/tod_slave_sub_system/oran_ptp2gps_conv_0/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/tod_slave_sub_system/tod_subsys_clk_100/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/tod_slave_sub_system/port_0_tod_stack/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/tod_slave_sub_system/tod_subsys_rst_100/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/tod_slave_sub_system/master_tod_split/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/tod_slave_sub_system/todsync_sample_plllock_split/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/tod_slave_sub_system/port_0_tod_stack_1/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/tod_slave_sub_system/tod_156_reset_controller_0/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/tod_slave_sub_system/tod_subsys_mtod_clk/sim/common/modelsim_files.tcl]

namespace eval tod_slave_sub_system {
  proc get_design_libraries {} {
    set libraries [dict create]
    set libraries [dict merge $libraries [oran_ptp2gps_conv_0::get_design_libraries]]
    set libraries [dict merge $libraries [tod_subsys_clk_100::get_design_libraries]]
    set libraries [dict merge $libraries [port_0_tod_stack::get_design_libraries]]
    set libraries [dict merge $libraries [tod_subsys_rst_100::get_design_libraries]]
    set libraries [dict merge $libraries [master_tod_split::get_design_libraries]]
    set libraries [dict merge $libraries [todsync_sample_plllock_split::get_design_libraries]]
    set libraries [dict merge $libraries [port_0_tod_stack_1::get_design_libraries]]
    set libraries [dict merge $libraries [tod_156_reset_controller_0::get_design_libraries]]
    set libraries [dict merge $libraries [tod_subsys_mtod_clk::get_design_libraries]]
    dict set libraries altera_reset_controller_1922 1
    dict set libraries tod_slave_sub_system         1
    return $libraries
  }
  
  proc get_memory_files {QSYS_SIMDIR} {
    set memory_files [list]
    set memory_files [concat $memory_files [oran_ptp2gps_conv_0::get_memory_files "$QSYS_SIMDIR/../../ip/tod_slave_sub_system/oran_ptp2gps_conv_0/sim/"]]
    set memory_files [concat $memory_files [tod_subsys_clk_100::get_memory_files "$QSYS_SIMDIR/../../ip/tod_slave_sub_system/tod_subsys_clk_100/sim/"]]
    set memory_files [concat $memory_files [port_0_tod_stack::get_memory_files "$QSYS_SIMDIR/../../ip/tod_slave_sub_system/port_0_tod_stack/sim/"]]
    set memory_files [concat $memory_files [tod_subsys_rst_100::get_memory_files "$QSYS_SIMDIR/../../ip/tod_slave_sub_system/tod_subsys_rst_100/sim/"]]
    set memory_files [concat $memory_files [master_tod_split::get_memory_files "$QSYS_SIMDIR/../../ip/tod_slave_sub_system/master_tod_split/sim/"]]
    set memory_files [concat $memory_files [todsync_sample_plllock_split::get_memory_files "$QSYS_SIMDIR/../../ip/tod_slave_sub_system/todsync_sample_plllock_split/sim/"]]
    set memory_files [concat $memory_files [port_0_tod_stack_1::get_memory_files "$QSYS_SIMDIR/../../ip/tod_slave_sub_system/port_0_tod_stack_1/sim/"]]
    set memory_files [concat $memory_files [tod_156_reset_controller_0::get_memory_files "$QSYS_SIMDIR/../../ip/tod_slave_sub_system/tod_156_reset_controller_0/sim/"]]
    set memory_files [concat $memory_files [tod_subsys_mtod_clk::get_memory_files "$QSYS_SIMDIR/../../ip/tod_slave_sub_system/tod_subsys_mtod_clk/sim/"]]
    return $memory_files
  }
  
  proc get_common_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [dict create]
    set design_files [dict merge $design_files [oran_ptp2gps_conv_0::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/tod_slave_sub_system/oran_ptp2gps_conv_0/sim/"]]
    set design_files [dict merge $design_files [tod_subsys_clk_100::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/tod_slave_sub_system/tod_subsys_clk_100/sim/"]]
    set design_files [dict merge $design_files [port_0_tod_stack::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/tod_slave_sub_system/port_0_tod_stack/sim/"]]
    set design_files [dict merge $design_files [tod_subsys_rst_100::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/tod_slave_sub_system/tod_subsys_rst_100/sim/"]]
    set design_files [dict merge $design_files [master_tod_split::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/tod_slave_sub_system/master_tod_split/sim/"]]
    set design_files [dict merge $design_files [todsync_sample_plllock_split::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/tod_slave_sub_system/todsync_sample_plllock_split/sim/"]]
    set design_files [dict merge $design_files [port_0_tod_stack_1::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/tod_slave_sub_system/port_0_tod_stack_1/sim/"]]
    set design_files [dict merge $design_files [tod_156_reset_controller_0::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/tod_slave_sub_system/tod_156_reset_controller_0/sim/"]]
    set design_files [dict merge $design_files [tod_subsys_mtod_clk::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/tod_slave_sub_system/tod_subsys_mtod_clk/sim/"]]
    return $design_files
  }
  
  proc get_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [list]
    set design_files [concat $design_files [oran_ptp2gps_conv_0::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/tod_slave_sub_system/oran_ptp2gps_conv_0/sim/"]]
    set design_files [concat $design_files [tod_subsys_clk_100::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/tod_slave_sub_system/tod_subsys_clk_100/sim/"]]
    set design_files [concat $design_files [port_0_tod_stack::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/tod_slave_sub_system/port_0_tod_stack/sim/"]]
    set design_files [concat $design_files [tod_subsys_rst_100::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/tod_slave_sub_system/tod_subsys_rst_100/sim/"]]
    set design_files [concat $design_files [master_tod_split::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/tod_slave_sub_system/master_tod_split/sim/"]]
    set design_files [concat $design_files [todsync_sample_plllock_split::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/tod_slave_sub_system/todsync_sample_plllock_split/sim/"]]
    set design_files [concat $design_files [port_0_tod_stack_1::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/tod_slave_sub_system/port_0_tod_stack_1/sim/"]]
    set design_files [concat $design_files [tod_156_reset_controller_0::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/tod_slave_sub_system/tod_156_reset_controller_0/sim/"]]
    set design_files [concat $design_files [tod_subsys_mtod_clk::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/tod_slave_sub_system/tod_subsys_mtod_clk/sim/"]]
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_reset_controller_1922/sim/altera_reset_controller.v"]\"  -work altera_reset_controller_1922"  
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_reset_controller_1922/sim/altera_reset_synchronizer.v"]\"  -work altera_reset_controller_1922"
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/tod_slave_sub_system.v"]\"  -work tod_slave_sub_system"                                                 
    return $design_files
  }
  
  proc get_non_duplicate_elab_option {ELAB_OPTIONS NEW_ELAB_OPTION} {
    set IS_DUPLICATE [string first $NEW_ELAB_OPTION $ELAB_OPTIONS]
    if {$IS_DUPLICATE == -1} {
      return $NEW_ELAB_OPTION
    } else {
      return ""
    }
  }
  
  
  proc get_elab_options {SIMULATOR_TOOL_BITNESS} {
    set ELAB_OPTIONS ""
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [oran_ptp2gps_conv_0::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [tod_subsys_clk_100::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [port_0_tod_stack::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [tod_subsys_rst_100::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [master_tod_split::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [todsync_sample_plllock_split::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [port_0_tod_stack_1::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [tod_156_reset_controller_0::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [tod_subsys_mtod_clk::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $ELAB_OPTIONS
  }
  
  
  proc get_sim_options {SIMULATOR_TOOL_BITNESS} {
    set SIM_OPTIONS ""
    append SIM_OPTIONS [oran_ptp2gps_conv_0::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [tod_subsys_clk_100::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [port_0_tod_stack::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [tod_subsys_rst_100::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [master_tod_split::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [todsync_sample_plllock_split::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [port_0_tod_stack_1::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [tod_156_reset_controller_0::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [tod_subsys_mtod_clk::get_sim_options $SIMULATOR_TOOL_BITNESS]
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $SIM_OPTIONS
  }
  
  
  proc get_env_variables {SIMULATOR_TOOL_BITNESS} {
    set ENV_VARIABLES [dict create]
    set LD_LIBRARY_PATH [dict create]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [oran_ptp2gps_conv_0::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [tod_subsys_clk_100::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [port_0_tod_stack::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [tod_subsys_rst_100::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [master_tod_split::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [todsync_sample_plllock_split::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [port_0_tod_stack_1::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [tod_156_reset_controller_0::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [tod_subsys_mtod_clk::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    dict set ENV_VARIABLES "LD_LIBRARY_PATH" $LD_LIBRARY_PATH
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $ENV_VARIABLES
  }
  
  
  proc normalize_path {FILEPATH} {
      if {[catch { package require fileutil } err]} { 
          return $FILEPATH 
      } 
      set path [fileutil::lexnormalize [file join [pwd] $FILEPATH]]  
      if {[file pathtype $FILEPATH] eq "relative"} { 
          set path [fileutil::relative [pwd] $path] 
      } 
      return $path 
  } 
  proc get_dpi_libraries {QSYS_SIMDIR} {
    set libraries [dict create]
    set libraries [dict merge $libraries [oran_ptp2gps_conv_0::get_dpi_libraries "$QSYS_SIMDIR/../../ip/tod_slave_sub_system/oran_ptp2gps_conv_0/sim/"]]
    set libraries [dict merge $libraries [tod_subsys_clk_100::get_dpi_libraries "$QSYS_SIMDIR/../../ip/tod_slave_sub_system/tod_subsys_clk_100/sim/"]]
    set libraries [dict merge $libraries [port_0_tod_stack::get_dpi_libraries "$QSYS_SIMDIR/../../ip/tod_slave_sub_system/port_0_tod_stack/sim/"]]
    set libraries [dict merge $libraries [tod_subsys_rst_100::get_dpi_libraries "$QSYS_SIMDIR/../../ip/tod_slave_sub_system/tod_subsys_rst_100/sim/"]]
    set libraries [dict merge $libraries [master_tod_split::get_dpi_libraries "$QSYS_SIMDIR/../../ip/tod_slave_sub_system/master_tod_split/sim/"]]
    set libraries [dict merge $libraries [todsync_sample_plllock_split::get_dpi_libraries "$QSYS_SIMDIR/../../ip/tod_slave_sub_system/todsync_sample_plllock_split/sim/"]]
    set libraries [dict merge $libraries [port_0_tod_stack_1::get_dpi_libraries "$QSYS_SIMDIR/../../ip/tod_slave_sub_system/port_0_tod_stack_1/sim/"]]
    set libraries [dict merge $libraries [tod_156_reset_controller_0::get_dpi_libraries "$QSYS_SIMDIR/../../ip/tod_slave_sub_system/tod_156_reset_controller_0/sim/"]]
    set libraries [dict merge $libraries [tod_subsys_mtod_clk::get_dpi_libraries "$QSYS_SIMDIR/../../ip/tod_slave_sub_system/tod_subsys_mtod_clk/sim/"]]
    
    return $libraries
  }
  
}
