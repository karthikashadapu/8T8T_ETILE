
namespace eval lphy_ss_top_ifft_blocktostream_DUT_0 {
  proc get_design_libraries {} {
    set libraries [dict create]
    dict set libraries ifft_blocktostream_DUT_10            1
    dict set libraries lphy_ss_top_ifft_blocktostream_DUT_0 1
    return $libraries
  }
  
  proc get_memory_files {QSYS_SIMDIR} {
    set memory_files [list]
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../ifft_blocktostream_DUT_10/sim/busFabric_ifft_blocktostream_DUT_2ouiy5b06j6e6s6h6u0qu5xajz_ifft_blocktostream_D0000e_100MHz_mem_x_part0.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../ifft_blocktostream_DUT_10/sim/busFabric_ifft_blocktostream_DUT_2ouiy5b06j6e6s6h6u0qu5xajz_ifft_blocktostream_D0000e_100MHz_mem_x_part1.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../ifft_blocktostream_DUT_10/sim/busFabric_ifft_blocktostream_DUT_2ouiy5b06j6e6s6h6u0qu5xajz_ifft_blocktostream_D0000le_60MHz_mem_x_part0.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../ifft_blocktostream_DUT_10/sim/busFabric_ifft_blocktostream_DUT_2ouiy5b06j6e6s6h6u0qu5xajz_ifft_blocktostream_D0000le_60MHz_mem_x_part1.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../ifft_blocktostream_DUT_10/sim/busFabric_ifft_blocktostream_DUT_2ouiy5b06j6e6s6h6u0qu5xajz_ifft_blocktostream_D0000100MHz_mem_x_a_part0.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../ifft_blocktostream_DUT_10/sim/busFabric_ifft_blocktostream_DUT_2ouiy5b06j6e6s6h6u0qu5xajz_ifft_blocktostream_D0000100MHz_mem_x_a_part1.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../ifft_blocktostream_DUT_10/sim/busFabric_ifft_blocktostream_DUT_2ouiy5b06j6e6s6h6u0qu5xajz_ifft_blocktostream_D0000_60MHz_mem_x_a_part0.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../ifft_blocktostream_DUT_10/sim/busFabric_ifft_blocktostream_DUT_2ouiy5b06j6e6s6h6u0qu5xajz_ifft_blocktostream_D0000_60MHz_mem_x_a_part1.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../ifft_blocktostream_DUT_10/sim/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_VFFT_ifft_blocktostream_DU0000OptimizedDualMem_x_a.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../ifft_blocktostream_DUT_10/sim/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_VFFT_ifft_blocktostream_DU0000OptimizedDualMem_x_b.hex"]"
    return $memory_files
  }
  
  proc get_common_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [dict create]
    return $design_files
  }
  
  proc get_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [list]
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../ifft_blocktostream_DUT_10/sim/dspba_library_ver.sv"]\"  -work ifft_blocktostream_DUT_10"                                                                                       
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../ifft_blocktostream_DUT_10/sim/ifft_blocktostream_DUT_safe_path_flat_ver.sv"]\"  -work ifft_blocktostream_DUT_10"                                                               
    lappend design_files "vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../ifft_blocktostream_DUT_10/sim/ifft_blocktostream_DUT_safe_path_flat.vhd"]\"  -work ifft_blocktostream_DUT_10"                                                                         
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../ifft_blocktostream_DUT_10/sim/ifft_blocktostream_DUT.sv"]\"  -work ifft_blocktostream_DUT_10"                                                                                  
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../ifft_blocktostream_DUT_10/sim/busFabric_ifft_blocktostream_DUT_2ouiy5b06j6e6s6h6u0qu5xajz.sv"]\"  -work ifft_blocktostream_DUT_10"                                             
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../ifft_blocktostream_DUT_10/sim/ifft_blocktostream_DUT_low_phy_dl.sv"]\"  -work ifft_blocktostream_DUT_10"                                                                       
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../ifft_blocktostream_DUT_10/sim/ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite.sv"]\"  -work ifft_blocktostream_DUT_10"                                                
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../ifft_blocktostream_DUT_10/sim/ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_ComplexMixer.sv"]\"  -work ifft_blocktostream_DUT_10"                                   
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../ifft_blocktostream_DUT_10/sim/ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_ComplexMixer_ComplexMixer.sv"]\"  -work ifft_blocktostream_DUT_10"                      
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../ifft_blocktostream_DUT_10/sim/ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_ComplexMixer_Scalei.sv"]\"  -work ifft_blocktostream_DUT_10"                            
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../ifft_blocktostream_DUT_10/sim/ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_ComplexMixer_Scaleq.sv"]\"  -work ifft_blocktostream_DUT_10"                            
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../ifft_blocktostream_DUT_10/sim/ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate.sv"]\"  -work ifft_blocktostream_DUT_10"                                 
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../ifft_blocktostream_DUT_10/sim/ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_SOP_EOP_gen.sv"]\"  -work ifft_blocktostream_DUT_10"                                    
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../ifft_blocktostream_DUT_10/sim/ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_SOP_EOP_gen_Rising_edge_Finite_State_Machine.sv"]\"  -work ifft_blocktostream_DUT_10"   
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../ifft_blocktostream_DUT_10/sim/ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_SOP_EOP_gen_falling_edge_Finite_State_Machine.sv"]\"  -work ifft_blocktostream_DUT_10"  
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../ifft_blocktostream_DUT_10/sim/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S.sv"]\"  -work ifft_blocktostream_DUT_10"                                                              
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../ifft_blocktostream_DUT_10/sim/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S.sv"]\"  -work ifft_blocktostream_DUT_10"                                                          
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../ifft_blocktostream_DUT_10/sim/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst.sv"]\"  -work ifft_blocktostream_DUT_10"                                                 
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../ifft_blocktostream_DUT_10/sim/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT.sv"]\"  -work ifft_blocktostream_DUT_10"                                                         
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../ifft_blocktostream_DUT_10/sim/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch.sv"]\"  -work ifft_blocktostream_DUT_10"                                      
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../ifft_blocktostream_DUT_10/sim/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT.sv"]\"  -work ifft_blocktostream_DUT_10"                                                   
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../ifft_blocktostream_DUT_10/sim/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap.sv"]\"  -work ifft_blocktostream_DUT_10"                                        
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../ifft_blocktostream_DUT_10/sim/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Risin0000Finite_State_Machine.sv"]\"  -work ifft_blocktostream_DUT_10"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../ifft_blocktostream_DUT_10/sim/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Risin0001Finite_State_Machine.sv"]\"  -work ifft_blocktostream_DUT_10"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../ifft_blocktostream_DUT_10/sim/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Risin0002Finite_State_Machine.sv"]\"  -work ifft_blocktostream_DUT_10"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../ifft_blocktostream_DUT_10/sim/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_falli0000Finite_State_Machine.sv"]\"  -work ifft_blocktostream_DUT_10"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../ifft_blocktostream_DUT_10/sim/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_falli0001Finite_State_Machine.sv"]\"  -work ifft_blocktostream_DUT_10"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../ifft_blocktostream_DUT_10/sim/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_TXGainComp.sv"]\"  -work ifft_blocktostream_DUT_10"                                        
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../ifft_blocktostream_DUT_10/sim/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_VFFT.sv"]\"  -work ifft_blocktostream_DUT_10"                                              
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/lphy_ss_top_ifft_blocktostream_DUT_0.v"]\"  -work lphy_ss_top_ifft_blocktostream_DUT_0"                                                                                               
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
