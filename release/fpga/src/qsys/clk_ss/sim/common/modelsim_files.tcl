source [file join [file dirname [info script]] ./../../../ip/clk_ss/clk_ss_clock_bridge_rec_rx/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/clk_ss/clk_ss_clock_bridge_0/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/clk_ss/clk_eth/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/clk_ss/clk_ftile_402/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/clk_ss/clk_csr/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/clk_ss/clk_dsp/sim/common/modelsim_files.tcl]

namespace eval clk_ss {
  proc get_design_libraries {} {
    set libraries [dict create]
    set libraries [dict merge $libraries [clk_ss_clock_bridge_rec_rx::get_design_libraries]]
    set libraries [dict merge $libraries [clk_ss_clock_bridge_0::get_design_libraries]]
    set libraries [dict merge $libraries [clk_eth::get_design_libraries]]
    set libraries [dict merge $libraries [clk_ftile_402::get_design_libraries]]
    set libraries [dict merge $libraries [clk_csr::get_design_libraries]]
    set libraries [dict merge $libraries [clk_dsp::get_design_libraries]]
    dict set libraries clk_ss 1
    return $libraries
  }
  
  proc get_memory_files {QSYS_SIMDIR} {
    set memory_files [list]
    set memory_files [concat $memory_files [clk_ss_clock_bridge_rec_rx::get_memory_files "$QSYS_SIMDIR/../../ip/clk_ss/clk_ss_clock_bridge_rec_rx/sim/"]]
    set memory_files [concat $memory_files [clk_ss_clock_bridge_0::get_memory_files "$QSYS_SIMDIR/../../ip/clk_ss/clk_ss_clock_bridge_0/sim/"]]
    set memory_files [concat $memory_files [clk_eth::get_memory_files "$QSYS_SIMDIR/../../ip/clk_ss/clk_eth/sim/"]]
    set memory_files [concat $memory_files [clk_ftile_402::get_memory_files "$QSYS_SIMDIR/../../ip/clk_ss/clk_ftile_402/sim/"]]
    set memory_files [concat $memory_files [clk_csr::get_memory_files "$QSYS_SIMDIR/../../ip/clk_ss/clk_csr/sim/"]]
    set memory_files [concat $memory_files [clk_dsp::get_memory_files "$QSYS_SIMDIR/../../ip/clk_ss/clk_dsp/sim/"]]
    return $memory_files
  }
  
  proc get_common_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [dict create]
    set design_files [dict merge $design_files [clk_ss_clock_bridge_rec_rx::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/clk_ss/clk_ss_clock_bridge_rec_rx/sim/"]]
    set design_files [dict merge $design_files [clk_ss_clock_bridge_0::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/clk_ss/clk_ss_clock_bridge_0/sim/"]]
    set design_files [dict merge $design_files [clk_eth::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/clk_ss/clk_eth/sim/"]]
    set design_files [dict merge $design_files [clk_ftile_402::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/clk_ss/clk_ftile_402/sim/"]]
    set design_files [dict merge $design_files [clk_csr::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/clk_ss/clk_csr/sim/"]]
    set design_files [dict merge $design_files [clk_dsp::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/clk_ss/clk_dsp/sim/"]]
    return $design_files
  }
  
  proc get_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [list]
    set design_files [concat $design_files [clk_ss_clock_bridge_rec_rx::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/clk_ss/clk_ss_clock_bridge_rec_rx/sim/"]]
    set design_files [concat $design_files [clk_ss_clock_bridge_0::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/clk_ss/clk_ss_clock_bridge_0/sim/"]]
    set design_files [concat $design_files [clk_eth::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/clk_ss/clk_eth/sim/"]]
    set design_files [concat $design_files [clk_ftile_402::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/clk_ss/clk_ftile_402/sim/"]]
    set design_files [concat $design_files [clk_csr::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/clk_ss/clk_csr/sim/"]]
    set design_files [concat $design_files [clk_dsp::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/clk_ss/clk_dsp/sim/"]]
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/clk_ss.v"]\"  -work clk_ss"
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
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [clk_ss_clock_bridge_rec_rx::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [clk_ss_clock_bridge_0::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [clk_eth::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [clk_ftile_402::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [clk_csr::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [clk_dsp::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $ELAB_OPTIONS
  }
  
  
  proc get_sim_options {SIMULATOR_TOOL_BITNESS} {
    set SIM_OPTIONS ""
    append SIM_OPTIONS [clk_ss_clock_bridge_rec_rx::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [clk_ss_clock_bridge_0::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [clk_eth::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [clk_ftile_402::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [clk_csr::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [clk_dsp::get_sim_options $SIMULATOR_TOOL_BITNESS]
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $SIM_OPTIONS
  }
  
  
  proc get_env_variables {SIMULATOR_TOOL_BITNESS} {
    set ENV_VARIABLES [dict create]
    set LD_LIBRARY_PATH [dict create]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [clk_ss_clock_bridge_rec_rx::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [clk_ss_clock_bridge_0::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [clk_eth::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [clk_ftile_402::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [clk_csr::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [clk_dsp::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
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
    set libraries [dict merge $libraries [clk_ss_clock_bridge_rec_rx::get_dpi_libraries "$QSYS_SIMDIR/../../ip/clk_ss/clk_ss_clock_bridge_rec_rx/sim/"]]
    set libraries [dict merge $libraries [clk_ss_clock_bridge_0::get_dpi_libraries "$QSYS_SIMDIR/../../ip/clk_ss/clk_ss_clock_bridge_0/sim/"]]
    set libraries [dict merge $libraries [clk_eth::get_dpi_libraries "$QSYS_SIMDIR/../../ip/clk_ss/clk_eth/sim/"]]
    set libraries [dict merge $libraries [clk_ftile_402::get_dpi_libraries "$QSYS_SIMDIR/../../ip/clk_ss/clk_ftile_402/sim/"]]
    set libraries [dict merge $libraries [clk_csr::get_dpi_libraries "$QSYS_SIMDIR/../../ip/clk_ss/clk_csr/sim/"]]
    set libraries [dict merge $libraries [clk_dsp::get_dpi_libraries "$QSYS_SIMDIR/../../ip/clk_ss/clk_dsp/sim/"]]
    
    return $libraries
  }
  
}
