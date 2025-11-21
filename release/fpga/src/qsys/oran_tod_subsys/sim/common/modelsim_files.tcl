source [file join [file dirname [info script]] ./../../../ip/oran_tod_subsys/eth_1588_tod_synchronizer/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/oran_tod_subsys/oran_tod_subsys_ptp2gps_conv_0/sim/common/modelsim_files.tcl]

namespace eval oran_tod_subsys {
  proc get_design_libraries {} {
    set libraries [dict create]
    set libraries [dict merge $libraries [eth_1588_tod_synchronizer::get_design_libraries]]
    set libraries [dict merge $libraries [oran_tod_subsys_ptp2gps_conv_0::get_design_libraries]]
    dict set libraries oran_tod_subsys 1
    return $libraries
  }
  
  proc get_memory_files {QSYS_SIMDIR} {
    set memory_files [list]
    set memory_files [concat $memory_files [eth_1588_tod_synchronizer::get_memory_files "$QSYS_SIMDIR/../../ip/oran_tod_subsys/eth_1588_tod_synchronizer/sim/"]]
    set memory_files [concat $memory_files [oran_tod_subsys_ptp2gps_conv_0::get_memory_files "$QSYS_SIMDIR/../../ip/oran_tod_subsys/oran_tod_subsys_ptp2gps_conv_0/sim/"]]
    return $memory_files
  }
  
  proc get_common_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [dict create]
    set design_files [dict merge $design_files [eth_1588_tod_synchronizer::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/oran_tod_subsys/eth_1588_tod_synchronizer/sim/"]]
    set design_files [dict merge $design_files [oran_tod_subsys_ptp2gps_conv_0::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/oran_tod_subsys/oran_tod_subsys_ptp2gps_conv_0/sim/"]]
    return $design_files
  }
  
  proc get_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [list]
    set design_files [concat $design_files [eth_1588_tod_synchronizer::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/oran_tod_subsys/eth_1588_tod_synchronizer/sim/"]]
    set design_files [concat $design_files [oran_tod_subsys_ptp2gps_conv_0::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/oran_tod_subsys/oran_tod_subsys_ptp2gps_conv_0/sim/"]]
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/oran_tod_subsys.v"]\"  -work oran_tod_subsys"
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
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [eth_1588_tod_synchronizer::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [oran_tod_subsys_ptp2gps_conv_0::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $ELAB_OPTIONS
  }
  
  
  proc get_sim_options {SIMULATOR_TOOL_BITNESS} {
    set SIM_OPTIONS ""
    append SIM_OPTIONS [eth_1588_tod_synchronizer::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [oran_tod_subsys_ptp2gps_conv_0::get_sim_options $SIMULATOR_TOOL_BITNESS]
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $SIM_OPTIONS
  }
  
  
  proc get_env_variables {SIMULATOR_TOOL_BITNESS} {
    set ENV_VARIABLES [dict create]
    set LD_LIBRARY_PATH [dict create]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [eth_1588_tod_synchronizer::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [oran_tod_subsys_ptp2gps_conv_0::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
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
    set libraries [dict merge $libraries [eth_1588_tod_synchronizer::get_dpi_libraries "$QSYS_SIMDIR/../../ip/oran_tod_subsys/eth_1588_tod_synchronizer/sim/"]]
    set libraries [dict merge $libraries [oran_tod_subsys_ptp2gps_conv_0::get_dpi_libraries "$QSYS_SIMDIR/../../ip/oran_tod_subsys/oran_tod_subsys_ptp2gps_conv_0/sim/"]]
    
    return $libraries
  }
  
}
