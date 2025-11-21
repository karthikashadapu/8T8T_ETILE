source [file join [file dirname [info script]] ./../../../ip/j204c_f_rx_tx_ip/j204c_f_rx_tx_ip_systemclk_f/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/j204c_f_rx_tx_ip/j204c_f_rx_tx_ip_clock_bridge_1/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/j204c_f_rx_tx_ip/j204c_f_rx_tx_ip_intel_jesd204c_f/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/j204c_f_rx_tx_ip/j204c_f_rx_tx_ip_clock_bridge_0/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/j204c_f_rx_tx_ip/j204c_f_rx_tx_ip_reset_controller_0/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/j204c_f_rx_tx_ip/j204c_f_rx_tx_ip_reset_sequencer_0/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/j204c_f_rx_tx_ip/j204c_f_rx_tx_ip_tx_reset_0/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/j204c_f_rx_tx_ip/j204c_f_rx_tx_ip_reset_bridge_2/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/j204c_f_rx_tx_ip/j204c_f_rx_tx_ip_avs_reset_0/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/j204c_f_rx_tx_ip/j204c_f_rx_tx_ip_reset_bridge_0/sim/common/modelsim_files.tcl]

namespace eval j204c_f_rx_tx_ip {
  proc get_design_libraries {} {
    set libraries [dict create]
    set libraries [dict merge $libraries [j204c_f_rx_tx_ip_systemclk_f::get_design_libraries]]
    set libraries [dict merge $libraries [j204c_f_rx_tx_ip_clock_bridge_1::get_design_libraries]]
    set libraries [dict merge $libraries [j204c_f_rx_tx_ip_intel_jesd204c_f::get_design_libraries]]
    set libraries [dict merge $libraries [j204c_f_rx_tx_ip_clock_bridge_0::get_design_libraries]]
    set libraries [dict merge $libraries [j204c_f_rx_tx_ip_reset_controller_0::get_design_libraries]]
    set libraries [dict merge $libraries [j204c_f_rx_tx_ip_reset_sequencer_0::get_design_libraries]]
    set libraries [dict merge $libraries [j204c_f_rx_tx_ip_tx_reset_0::get_design_libraries]]
    set libraries [dict merge $libraries [j204c_f_rx_tx_ip_reset_bridge_2::get_design_libraries]]
    set libraries [dict merge $libraries [j204c_f_rx_tx_ip_avs_reset_0::get_design_libraries]]
    set libraries [dict merge $libraries [j204c_f_rx_tx_ip_reset_bridge_0::get_design_libraries]]
    dict set libraries j204c_f_rx_tx_ip 1
    return $libraries
  }
  
  proc get_memory_files {QSYS_SIMDIR} {
    set memory_files [list]
    set memory_files [concat $memory_files [j204c_f_rx_tx_ip_systemclk_f::get_memory_files "$QSYS_SIMDIR/../../ip/j204c_f_rx_tx_ip/j204c_f_rx_tx_ip_systemclk_f/sim/"]]
    set memory_files [concat $memory_files [j204c_f_rx_tx_ip_clock_bridge_1::get_memory_files "$QSYS_SIMDIR/../../ip/j204c_f_rx_tx_ip/j204c_f_rx_tx_ip_clock_bridge_1/sim/"]]
    set memory_files [concat $memory_files [j204c_f_rx_tx_ip_intel_jesd204c_f::get_memory_files "$QSYS_SIMDIR/../../ip/j204c_f_rx_tx_ip/j204c_f_rx_tx_ip_intel_jesd204c_f/sim/"]]
    set memory_files [concat $memory_files [j204c_f_rx_tx_ip_clock_bridge_0::get_memory_files "$QSYS_SIMDIR/../../ip/j204c_f_rx_tx_ip/j204c_f_rx_tx_ip_clock_bridge_0/sim/"]]
    set memory_files [concat $memory_files [j204c_f_rx_tx_ip_reset_controller_0::get_memory_files "$QSYS_SIMDIR/../../ip/j204c_f_rx_tx_ip/j204c_f_rx_tx_ip_reset_controller_0/sim/"]]
    set memory_files [concat $memory_files [j204c_f_rx_tx_ip_reset_sequencer_0::get_memory_files "$QSYS_SIMDIR/../../ip/j204c_f_rx_tx_ip/j204c_f_rx_tx_ip_reset_sequencer_0/sim/"]]
    set memory_files [concat $memory_files [j204c_f_rx_tx_ip_tx_reset_0::get_memory_files "$QSYS_SIMDIR/../../ip/j204c_f_rx_tx_ip/j204c_f_rx_tx_ip_tx_reset_0/sim/"]]
    set memory_files [concat $memory_files [j204c_f_rx_tx_ip_reset_bridge_2::get_memory_files "$QSYS_SIMDIR/../../ip/j204c_f_rx_tx_ip/j204c_f_rx_tx_ip_reset_bridge_2/sim/"]]
    set memory_files [concat $memory_files [j204c_f_rx_tx_ip_avs_reset_0::get_memory_files "$QSYS_SIMDIR/../../ip/j204c_f_rx_tx_ip/j204c_f_rx_tx_ip_avs_reset_0/sim/"]]
    set memory_files [concat $memory_files [j204c_f_rx_tx_ip_reset_bridge_0::get_memory_files "$QSYS_SIMDIR/../../ip/j204c_f_rx_tx_ip/j204c_f_rx_tx_ip_reset_bridge_0/sim/"]]
    return $memory_files
  }
  
  proc get_common_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [dict create]
    set design_files [dict merge $design_files [j204c_f_rx_tx_ip_systemclk_f::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/j204c_f_rx_tx_ip/j204c_f_rx_tx_ip_systemclk_f/sim/"]]
    set design_files [dict merge $design_files [j204c_f_rx_tx_ip_clock_bridge_1::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/j204c_f_rx_tx_ip/j204c_f_rx_tx_ip_clock_bridge_1/sim/"]]
    set design_files [dict merge $design_files [j204c_f_rx_tx_ip_intel_jesd204c_f::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/j204c_f_rx_tx_ip/j204c_f_rx_tx_ip_intel_jesd204c_f/sim/"]]
    set design_files [dict merge $design_files [j204c_f_rx_tx_ip_clock_bridge_0::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/j204c_f_rx_tx_ip/j204c_f_rx_tx_ip_clock_bridge_0/sim/"]]
    set design_files [dict merge $design_files [j204c_f_rx_tx_ip_reset_controller_0::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/j204c_f_rx_tx_ip/j204c_f_rx_tx_ip_reset_controller_0/sim/"]]
    set design_files [dict merge $design_files [j204c_f_rx_tx_ip_reset_sequencer_0::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/j204c_f_rx_tx_ip/j204c_f_rx_tx_ip_reset_sequencer_0/sim/"]]
    set design_files [dict merge $design_files [j204c_f_rx_tx_ip_tx_reset_0::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/j204c_f_rx_tx_ip/j204c_f_rx_tx_ip_tx_reset_0/sim/"]]
    set design_files [dict merge $design_files [j204c_f_rx_tx_ip_reset_bridge_2::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/j204c_f_rx_tx_ip/j204c_f_rx_tx_ip_reset_bridge_2/sim/"]]
    set design_files [dict merge $design_files [j204c_f_rx_tx_ip_avs_reset_0::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/j204c_f_rx_tx_ip/j204c_f_rx_tx_ip_avs_reset_0/sim/"]]
    set design_files [dict merge $design_files [j204c_f_rx_tx_ip_reset_bridge_0::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/j204c_f_rx_tx_ip/j204c_f_rx_tx_ip_reset_bridge_0/sim/"]]
    return $design_files
  }
  
  proc get_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [list]
    set design_files [concat $design_files [j204c_f_rx_tx_ip_systemclk_f::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/j204c_f_rx_tx_ip/j204c_f_rx_tx_ip_systemclk_f/sim/"]]
    set design_files [concat $design_files [j204c_f_rx_tx_ip_clock_bridge_1::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/j204c_f_rx_tx_ip/j204c_f_rx_tx_ip_clock_bridge_1/sim/"]]
    set design_files [concat $design_files [j204c_f_rx_tx_ip_intel_jesd204c_f::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/j204c_f_rx_tx_ip/j204c_f_rx_tx_ip_intel_jesd204c_f/sim/"]]
    set design_files [concat $design_files [j204c_f_rx_tx_ip_clock_bridge_0::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/j204c_f_rx_tx_ip/j204c_f_rx_tx_ip_clock_bridge_0/sim/"]]
    set design_files [concat $design_files [j204c_f_rx_tx_ip_reset_controller_0::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/j204c_f_rx_tx_ip/j204c_f_rx_tx_ip_reset_controller_0/sim/"]]
    set design_files [concat $design_files [j204c_f_rx_tx_ip_reset_sequencer_0::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/j204c_f_rx_tx_ip/j204c_f_rx_tx_ip_reset_sequencer_0/sim/"]]
    set design_files [concat $design_files [j204c_f_rx_tx_ip_tx_reset_0::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/j204c_f_rx_tx_ip/j204c_f_rx_tx_ip_tx_reset_0/sim/"]]
    set design_files [concat $design_files [j204c_f_rx_tx_ip_reset_bridge_2::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/j204c_f_rx_tx_ip/j204c_f_rx_tx_ip_reset_bridge_2/sim/"]]
    set design_files [concat $design_files [j204c_f_rx_tx_ip_avs_reset_0::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/j204c_f_rx_tx_ip/j204c_f_rx_tx_ip_avs_reset_0/sim/"]]
    set design_files [concat $design_files [j204c_f_rx_tx_ip_reset_bridge_0::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/j204c_f_rx_tx_ip/j204c_f_rx_tx_ip_reset_bridge_0/sim/"]]
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/j204c_f_rx_tx_ip.v"]\"  -work j204c_f_rx_tx_ip"
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
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [j204c_f_rx_tx_ip_systemclk_f::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [j204c_f_rx_tx_ip_clock_bridge_1::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [j204c_f_rx_tx_ip_intel_jesd204c_f::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [j204c_f_rx_tx_ip_clock_bridge_0::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [j204c_f_rx_tx_ip_reset_controller_0::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [j204c_f_rx_tx_ip_reset_sequencer_0::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [j204c_f_rx_tx_ip_tx_reset_0::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [j204c_f_rx_tx_ip_reset_bridge_2::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [j204c_f_rx_tx_ip_avs_reset_0::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [j204c_f_rx_tx_ip_reset_bridge_0::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $ELAB_OPTIONS
  }
  
  
  proc get_sim_options {SIMULATOR_TOOL_BITNESS} {
    set SIM_OPTIONS ""
    append SIM_OPTIONS [j204c_f_rx_tx_ip_systemclk_f::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [j204c_f_rx_tx_ip_clock_bridge_1::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [j204c_f_rx_tx_ip_intel_jesd204c_f::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [j204c_f_rx_tx_ip_clock_bridge_0::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [j204c_f_rx_tx_ip_reset_controller_0::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [j204c_f_rx_tx_ip_reset_sequencer_0::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [j204c_f_rx_tx_ip_tx_reset_0::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [j204c_f_rx_tx_ip_reset_bridge_2::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [j204c_f_rx_tx_ip_avs_reset_0::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [j204c_f_rx_tx_ip_reset_bridge_0::get_sim_options $SIMULATOR_TOOL_BITNESS]
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $SIM_OPTIONS
  }
  
  
  proc get_env_variables {SIMULATOR_TOOL_BITNESS} {
    set ENV_VARIABLES [dict create]
    set LD_LIBRARY_PATH [dict create]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [j204c_f_rx_tx_ip_systemclk_f::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [j204c_f_rx_tx_ip_clock_bridge_1::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [j204c_f_rx_tx_ip_intel_jesd204c_f::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [j204c_f_rx_tx_ip_clock_bridge_0::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [j204c_f_rx_tx_ip_reset_controller_0::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [j204c_f_rx_tx_ip_reset_sequencer_0::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [j204c_f_rx_tx_ip_tx_reset_0::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [j204c_f_rx_tx_ip_reset_bridge_2::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [j204c_f_rx_tx_ip_avs_reset_0::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [j204c_f_rx_tx_ip_reset_bridge_0::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
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
    set libraries [dict merge $libraries [j204c_f_rx_tx_ip_systemclk_f::get_dpi_libraries "$QSYS_SIMDIR/../../ip/j204c_f_rx_tx_ip/j204c_f_rx_tx_ip_systemclk_f/sim/"]]
    set libraries [dict merge $libraries [j204c_f_rx_tx_ip_clock_bridge_1::get_dpi_libraries "$QSYS_SIMDIR/../../ip/j204c_f_rx_tx_ip/j204c_f_rx_tx_ip_clock_bridge_1/sim/"]]
    set libraries [dict merge $libraries [j204c_f_rx_tx_ip_intel_jesd204c_f::get_dpi_libraries "$QSYS_SIMDIR/../../ip/j204c_f_rx_tx_ip/j204c_f_rx_tx_ip_intel_jesd204c_f/sim/"]]
    set libraries [dict merge $libraries [j204c_f_rx_tx_ip_clock_bridge_0::get_dpi_libraries "$QSYS_SIMDIR/../../ip/j204c_f_rx_tx_ip/j204c_f_rx_tx_ip_clock_bridge_0/sim/"]]
    set libraries [dict merge $libraries [j204c_f_rx_tx_ip_reset_controller_0::get_dpi_libraries "$QSYS_SIMDIR/../../ip/j204c_f_rx_tx_ip/j204c_f_rx_tx_ip_reset_controller_0/sim/"]]
    set libraries [dict merge $libraries [j204c_f_rx_tx_ip_reset_sequencer_0::get_dpi_libraries "$QSYS_SIMDIR/../../ip/j204c_f_rx_tx_ip/j204c_f_rx_tx_ip_reset_sequencer_0/sim/"]]
    set libraries [dict merge $libraries [j204c_f_rx_tx_ip_tx_reset_0::get_dpi_libraries "$QSYS_SIMDIR/../../ip/j204c_f_rx_tx_ip/j204c_f_rx_tx_ip_tx_reset_0/sim/"]]
    set libraries [dict merge $libraries [j204c_f_rx_tx_ip_reset_bridge_2::get_dpi_libraries "$QSYS_SIMDIR/../../ip/j204c_f_rx_tx_ip/j204c_f_rx_tx_ip_reset_bridge_2/sim/"]]
    set libraries [dict merge $libraries [j204c_f_rx_tx_ip_avs_reset_0::get_dpi_libraries "$QSYS_SIMDIR/../../ip/j204c_f_rx_tx_ip/j204c_f_rx_tx_ip_avs_reset_0/sim/"]]
    set libraries [dict merge $libraries [j204c_f_rx_tx_ip_reset_bridge_0::get_dpi_libraries "$QSYS_SIMDIR/../../ip/j204c_f_rx_tx_ip/j204c_f_rx_tx_ip_reset_bridge_0/sim/"]]
    
    return $libraries
  }
  
}
