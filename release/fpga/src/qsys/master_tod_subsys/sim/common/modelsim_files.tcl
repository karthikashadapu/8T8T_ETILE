source [file join [file dirname [info script]] ./../../../ip/qsys_top/master_tod_top_0/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/master_tod_subsys/mtod_subsys_pps_load_tod_0/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/master_tod_subsys/mtod_subsys_clk100/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/master_tod_subsys/mtod_subsys_rstn/sim/common/modelsim_files.tcl]

namespace eval master_tod_subsys {
  proc get_design_libraries {} {
    set libraries [dict create]
    set libraries [dict merge $libraries [master_tod_top_0::get_design_libraries]]
    set libraries [dict merge $libraries [mtod_subsys_pps_load_tod_0::get_design_libraries]]
    set libraries [dict merge $libraries [mtod_subsys_clk100::get_design_libraries]]
    set libraries [dict merge $libraries [mtod_subsys_rstn::get_design_libraries]]
    dict set libraries master_tod_subsys 1
    return $libraries
  }
  
  proc get_memory_files {QSYS_SIMDIR} {
    set memory_files [list]
    set memory_files [concat $memory_files [master_tod_top_0::get_memory_files "$QSYS_SIMDIR/../../ip/qsys_top/master_tod_top_0/sim/"]]
    set memory_files [concat $memory_files [mtod_subsys_pps_load_tod_0::get_memory_files "$QSYS_SIMDIR/../../ip/master_tod_subsys/mtod_subsys_pps_load_tod_0/sim/"]]
    set memory_files [concat $memory_files [mtod_subsys_clk100::get_memory_files "$QSYS_SIMDIR/../../ip/master_tod_subsys/mtod_subsys_clk100/sim/"]]
    set memory_files [concat $memory_files [mtod_subsys_rstn::get_memory_files "$QSYS_SIMDIR/../../ip/master_tod_subsys/mtod_subsys_rstn/sim/"]]
    return $memory_files
  }
  
  proc get_common_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [dict create]
    set design_files [dict merge $design_files [master_tod_top_0::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/qsys_top/master_tod_top_0/sim/"]]
    set design_files [dict merge $design_files [mtod_subsys_pps_load_tod_0::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/master_tod_subsys/mtod_subsys_pps_load_tod_0/sim/"]]
    set design_files [dict merge $design_files [mtod_subsys_clk100::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/master_tod_subsys/mtod_subsys_clk100/sim/"]]
    set design_files [dict merge $design_files [mtod_subsys_rstn::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/master_tod_subsys/mtod_subsys_rstn/sim/"]]
    return $design_files
  }
  
  proc get_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [list]
    set design_files [concat $design_files [master_tod_top_0::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/qsys_top/master_tod_top_0/sim/"]]
    set design_files [concat $design_files [mtod_subsys_pps_load_tod_0::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/master_tod_subsys/mtod_subsys_pps_load_tod_0/sim/"]]
    set design_files [concat $design_files [mtod_subsys_clk100::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/master_tod_subsys/mtod_subsys_clk100/sim/"]]
    set design_files [concat $design_files [mtod_subsys_rstn::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/master_tod_subsys/mtod_subsys_rstn/sim/"]]
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/master_tod_subsys.v"]\"  -work master_tod_subsys"
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
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [master_tod_top_0::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [mtod_subsys_pps_load_tod_0::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [mtod_subsys_clk100::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [mtod_subsys_rstn::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $ELAB_OPTIONS
  }
  
  
  proc get_sim_options {SIMULATOR_TOOL_BITNESS} {
    set SIM_OPTIONS ""
    append SIM_OPTIONS [master_tod_top_0::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [mtod_subsys_pps_load_tod_0::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [mtod_subsys_clk100::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [mtod_subsys_rstn::get_sim_options $SIMULATOR_TOOL_BITNESS]
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $SIM_OPTIONS
  }
  
  
  proc get_env_variables {SIMULATOR_TOOL_BITNESS} {
    set ENV_VARIABLES [dict create]
    set LD_LIBRARY_PATH [dict create]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [master_tod_top_0::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [mtod_subsys_pps_load_tod_0::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [mtod_subsys_clk100::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [mtod_subsys_rstn::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
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
    set libraries [dict merge $libraries [master_tod_top_0::get_dpi_libraries "$QSYS_SIMDIR/../../ip/qsys_top/master_tod_top_0/sim/"]]
    set libraries [dict merge $libraries [mtod_subsys_pps_load_tod_0::get_dpi_libraries "$QSYS_SIMDIR/../../ip/master_tod_subsys/mtod_subsys_pps_load_tod_0/sim/"]]
    set libraries [dict merge $libraries [mtod_subsys_clk100::get_dpi_libraries "$QSYS_SIMDIR/../../ip/master_tod_subsys/mtod_subsys_clk100/sim/"]]
    set libraries [dict merge $libraries [mtod_subsys_rstn::get_dpi_libraries "$QSYS_SIMDIR/../../ip/master_tod_subsys/mtod_subsys_rstn/sim/"]]
    
    return $libraries
  }
  
}
