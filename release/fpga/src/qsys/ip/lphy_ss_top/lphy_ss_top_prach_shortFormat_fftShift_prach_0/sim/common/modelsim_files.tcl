
namespace eval lphy_ss_top_prach_shortFormat_fftShift_prach_0 {
  proc get_design_libraries {} {
    set libraries [dict create]
    dict set libraries prach_shortFormat_fftShift_prach_10            1
    dict set libraries lphy_ss_top_prach_shortFormat_fftShift_prach_0 1
    return $libraries
  }
  
  proc get_memory_files {QSYS_SIMDIR} {
    set memory_files [list]
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../prach_shortFormat_fftShift_prach_10/sim/prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_LutX_lutmem.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../prach_shortFormat_fftShift_prach_10/sim/prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_LutY_lutmem.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../prach_shortFormat_fftShift_prach_10/sim/prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_PRACHSymDuration_LUT_lutmem.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../prach_shortFormat_fftShift_prach_10/sim/prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_PrachOccPerSlotMinus1_lutmem.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../prach_shortFormat_fftShift_prach_10/sim/prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_StartOfSymbol_LUT_lutmem.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../prach_shortFormat_fftShift_prach_10/sim/prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_ActiveSubF_LUT_0_x_lutmem.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../prach_shortFormat_fftShift_prach_10/sim/prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_ActiveSubF_LUT_1_x_lutmem.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../prach_shortFormat_fftShift_prach_10/sim/prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_ActiveSubF_LUT_2_x_lutmem.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../prach_shortFormat_fftShift_prach_10/sim/prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_ActiveSubF_LUT_3_x_lutmem.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../prach_shortFormat_fftShift_prach_10/sim/prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_ActiveSubF_LUT_4_x_lutmem.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../prach_shortFormat_fftShift_prach_10/sim/prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_ActiveSubF_LUT_5_x_lutmem.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../prach_shortFormat_fftShift_prach_10/sim/prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_ActiveSubF_LUT_6_x_lutmem.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../prach_shortFormat_fftShift_prach_10/sim/prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_ActiveSubF_LUT_7_x_lutmem.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../prach_shortFormat_fftShift_prach_10/sim/prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_ActiveSubF_LUT_8_x_lutmem.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../prach_shortFormat_fftShift_prach_10/sim/prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_ActiveSubF_LUT_9_x_lutmem.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../prach_shortFormat_fftShift_prach_10/sim/prach_shortFormat_fftShift_prach_PRACH_CC_VFFT_prach_shortFormat_fftShift_prach_0000OptimizedDualMem_x_a.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../prach_shortFormat_fftShift_prach_10/sim/prach_shortFormat_fftShift_prach_PRACH_CC_VFFT_prach_shortFormat_fftShift_prach_0000OptimizedDualMem_x_b.hex"]"
    return $memory_files
  }
  
  proc get_common_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [dict create]
    return $design_files
  }
  
  proc get_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [list]
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../prach_shortFormat_fftShift_prach_10/sim/dspba_library_ver.sv"]\"  -work prach_shortFormat_fftShift_prach_10"                                                                 
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../prach_shortFormat_fftShift_prach_10/sim/prach_shortFormat_fftShift_prach_safe_path_flat_ver.sv"]\"  -work prach_shortFormat_fftShift_prach_10"                               
    lappend design_files "vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../prach_shortFormat_fftShift_prach_10/sim/prach_shortFormat_fftShift_prach_safe_path_flat.vhd"]\"  -work prach_shortFormat_fftShift_prach_10"                                         
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../prach_shortFormat_fftShift_prach_10/sim/prach_shortFormat_fftShift_prach.sv"]\"  -work prach_shortFormat_fftShift_prach_10"                                                  
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../prach_shortFormat_fftShift_prach_10/sim/busFabric_prach_shortFormat_fftShift_prach_3i06i3ib0063663c63o60160760uq5ux5gubo0u.sv"]\"  -work prach_shortFormat_fftShift_prach_10"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../prach_shortFormat_fftShift_prach_10/sim/prach_shortFormat_fftShift_prach_PRACH_CC.sv"]\"  -work prach_shortFormat_fftShift_prach_10"                                         
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../prach_shortFormat_fftShift_prach_10/sim/prach_shortFormat_fftShift_prach_PRACH_CC_Cbar_mplane_selection.sv"]\"  -work prach_shortFormat_fftShift_prach_10"                   
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../prach_shortFormat_fftShift_prach_10/sim/prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode.sv"]\"  -work prach_shortFormat_fftShift_prach_10"                           
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../prach_shortFormat_fftShift_prach_10/sim/prach_shortFormat_fftShift_prach_PRACH_CC_RemoveCP.sv"]\"  -work prach_shortFormat_fftShift_prach_10"                                
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../prach_shortFormat_fftShift_prach_10/sim/prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect.sv"]\"  -work prach_shortFormat_fftShift_prach_10"                          
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../prach_shortFormat_fftShift_prach_10/sim/prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv.sv"]\"  -work prach_shortFormat_fftShift_prach_10"                        
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../prach_shortFormat_fftShift_prach_10/sim/prach_shortFormat_fftShift_prach_PRACH_CC_VFFT.sv"]\"  -work prach_shortFormat_fftShift_prach_10"                                    
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../prach_shortFormat_fftShift_prach_10/sim/prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane.sv"]\"  -work prach_shortFormat_fftShift_prach_10"                   
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../prach_shortFormat_fftShift_prach_10/sim/prach_shortFormat_fftShift_prach_PRACH_CC_gain.sv"]\"  -work prach_shortFormat_fftShift_prach_10"                                    
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/lphy_ss_top_prach_shortFormat_fftShift_prach_0.v"]\"  -work lphy_ss_top_prach_shortFormat_fftShift_prach_0"                                                                         
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
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    append ELAB_OPTIONS { -t fs}
    return $ELAB_OPTIONS
  }
  
  
  proc get_sim_options {SIMULATOR_TOOL_BITNESS} {
    set SIM_OPTIONS ""
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $SIM_OPTIONS
  }
  
  
  proc get_env_variables {SIMULATOR_TOOL_BITNESS} {
    set ENV_VARIABLES [dict create]
    set LD_LIBRARY_PATH [dict create]
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
    
    return $libraries
  }
  
}
