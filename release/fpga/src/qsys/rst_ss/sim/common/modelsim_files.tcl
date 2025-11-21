source [file join [file dirname [info script]] ./../../../ip/rst_ss/dsp_rst_cntrl/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/rst_ss/ecpri_rst_cntrl/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/rst_ss/rst_ss_reset_bridge_tx_div/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/rst_ss/eth_rst_cntrl/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/rst_ss/rst_csr/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/rst_ss/rst_ss_reset_bridge_rec_rx/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/rst_ss/reset_bridge_act_high/sim/common/modelsim_files.tcl]

namespace eval rst_ss {
  proc get_design_libraries {} {
    set libraries [dict create]
    set libraries [dict merge $libraries [dsp_rst_cntrl::get_design_libraries]]
    set libraries [dict merge $libraries [ecpri_rst_cntrl::get_design_libraries]]
    set libraries [dict merge $libraries [rst_ss_reset_bridge_tx_div::get_design_libraries]]
    set libraries [dict merge $libraries [eth_rst_cntrl::get_design_libraries]]
    set libraries [dict merge $libraries [rst_csr::get_design_libraries]]
    set libraries [dict merge $libraries [rst_ss_reset_bridge_rec_rx::get_design_libraries]]
    set libraries [dict merge $libraries [reset_bridge_act_high::get_design_libraries]]
    dict set libraries rst_ss 1
    return $libraries
  }
  
  proc get_memory_files {QSYS_SIMDIR} {
    set memory_files [list]
    set memory_files [concat $memory_files [dsp_rst_cntrl::get_memory_files "$QSYS_SIMDIR/../../ip/rst_ss/dsp_rst_cntrl/sim/"]]
    set memory_files [concat $memory_files [ecpri_rst_cntrl::get_memory_files "$QSYS_SIMDIR/../../ip/rst_ss/ecpri_rst_cntrl/sim/"]]
    set memory_files [concat $memory_files [rst_ss_reset_bridge_tx_div::get_memory_files "$QSYS_SIMDIR/../../ip/rst_ss/rst_ss_reset_bridge_tx_div/sim/"]]
    set memory_files [concat $memory_files [eth_rst_cntrl::get_memory_files "$QSYS_SIMDIR/../../ip/rst_ss/eth_rst_cntrl/sim/"]]
    set memory_files [concat $memory_files [rst_csr::get_memory_files "$QSYS_SIMDIR/../../ip/rst_ss/rst_csr/sim/"]]
    set memory_files [concat $memory_files [rst_ss_reset_bridge_rec_rx::get_memory_files "$QSYS_SIMDIR/../../ip/rst_ss/rst_ss_reset_bridge_rec_rx/sim/"]]
    set memory_files [concat $memory_files [reset_bridge_act_high::get_memory_files "$QSYS_SIMDIR/../../ip/rst_ss/reset_bridge_act_high/sim/"]]
    return $memory_files
  }
  
  proc get_common_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [dict create]
    set design_files [dict merge $design_files [dsp_rst_cntrl::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/rst_ss/dsp_rst_cntrl/sim/"]]
    set design_files [dict merge $design_files [ecpri_rst_cntrl::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/rst_ss/ecpri_rst_cntrl/sim/"]]
    set design_files [dict merge $design_files [rst_ss_reset_bridge_tx_div::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/rst_ss/rst_ss_reset_bridge_tx_div/sim/"]]
    set design_files [dict merge $design_files [eth_rst_cntrl::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/rst_ss/eth_rst_cntrl/sim/"]]
    set design_files [dict merge $design_files [rst_csr::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/rst_ss/rst_csr/sim/"]]
    set design_files [dict merge $design_files [rst_ss_reset_bridge_rec_rx::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/rst_ss/rst_ss_reset_bridge_rec_rx/sim/"]]
    set design_files [dict merge $design_files [reset_bridge_act_high::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/rst_ss/reset_bridge_act_high/sim/"]]
    return $design_files
  }
  
  proc get_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [list]
    set design_files [concat $design_files [dsp_rst_cntrl::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/rst_ss/dsp_rst_cntrl/sim/"]]
    set design_files [concat $design_files [ecpri_rst_cntrl::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/rst_ss/ecpri_rst_cntrl/sim/"]]
    set design_files [concat $design_files [rst_ss_reset_bridge_tx_div::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/rst_ss/rst_ss_reset_bridge_tx_div/sim/"]]
    set design_files [concat $design_files [eth_rst_cntrl::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/rst_ss/eth_rst_cntrl/sim/"]]
    set design_files [concat $design_files [rst_csr::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/rst_ss/rst_csr/sim/"]]
    set design_files [concat $design_files [rst_ss_reset_bridge_rec_rx::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/rst_ss/rst_ss_reset_bridge_rec_rx/sim/"]]
    set design_files [concat $design_files [reset_bridge_act_high::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/rst_ss/reset_bridge_act_high/sim/"]]
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/rst_ss.v"]\"  -work rst_ss"
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
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [dsp_rst_cntrl::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [ecpri_rst_cntrl::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [rst_ss_reset_bridge_tx_div::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [eth_rst_cntrl::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [rst_csr::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [rst_ss_reset_bridge_rec_rx::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [reset_bridge_act_high::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $ELAB_OPTIONS
  }
  
  
  proc get_sim_options {SIMULATOR_TOOL_BITNESS} {
    set SIM_OPTIONS ""
    append SIM_OPTIONS [dsp_rst_cntrl::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [ecpri_rst_cntrl::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [rst_ss_reset_bridge_tx_div::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [eth_rst_cntrl::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [rst_csr::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [rst_ss_reset_bridge_rec_rx::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [reset_bridge_act_high::get_sim_options $SIMULATOR_TOOL_BITNESS]
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $SIM_OPTIONS
  }
  
  
  proc get_env_variables {SIMULATOR_TOOL_BITNESS} {
    set ENV_VARIABLES [dict create]
    set LD_LIBRARY_PATH [dict create]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [dsp_rst_cntrl::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [ecpri_rst_cntrl::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [rst_ss_reset_bridge_tx_div::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [eth_rst_cntrl::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [rst_csr::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [rst_ss_reset_bridge_rec_rx::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [reset_bridge_act_high::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
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
    set libraries [dict merge $libraries [dsp_rst_cntrl::get_dpi_libraries "$QSYS_SIMDIR/../../ip/rst_ss/dsp_rst_cntrl/sim/"]]
    set libraries [dict merge $libraries [ecpri_rst_cntrl::get_dpi_libraries "$QSYS_SIMDIR/../../ip/rst_ss/ecpri_rst_cntrl/sim/"]]
    set libraries [dict merge $libraries [rst_ss_reset_bridge_tx_div::get_dpi_libraries "$QSYS_SIMDIR/../../ip/rst_ss/rst_ss_reset_bridge_tx_div/sim/"]]
    set libraries [dict merge $libraries [eth_rst_cntrl::get_dpi_libraries "$QSYS_SIMDIR/../../ip/rst_ss/eth_rst_cntrl/sim/"]]
    set libraries [dict merge $libraries [rst_csr::get_dpi_libraries "$QSYS_SIMDIR/../../ip/rst_ss/rst_csr/sim/"]]
    set libraries [dict merge $libraries [rst_ss_reset_bridge_rec_rx::get_dpi_libraries "$QSYS_SIMDIR/../../ip/rst_ss/rst_ss_reset_bridge_rec_rx/sim/"]]
    set libraries [dict merge $libraries [reset_bridge_act_high::get_dpi_libraries "$QSYS_SIMDIR/../../ip/rst_ss/reset_bridge_act_high/sim/"]]
    
    return $libraries
  }
  
}
