
namespace eval lphy_ss_top_streamtoblock_fft_DUT_0 {
  proc get_design_libraries {} {
    set libraries [dict create]
    dict set libraries streamtoblock_fft_DUT_10            1
    dict set libraries lphy_ss_top_streamtoblock_fft_DUT_0 1
    return $libraries
  }
  
  proc get_memory_files {QSYS_SIMDIR} {
    set memory_files [list]
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../streamtoblock_fft_DUT_10/sim/busFabric_streamtoblock_fft_DUT_2ouisy506j6x6m6b6u0qu5xajz_streamtoblock_fft_DUT0000e_100MHz_mem_x_part0.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../streamtoblock_fft_DUT_10/sim/busFabric_streamtoblock_fft_DUT_2ouisy506j6x6m6b6u0qu5xajz_streamtoblock_fft_DUT0000e_100MHz_mem_x_part1.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../streamtoblock_fft_DUT_10/sim/busFabric_streamtoblock_fft_DUT_2ouisy506j6x6m6b6u0qu5xajz_streamtoblock_fft_DUT0000le_60MHz_mem_x_part0.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../streamtoblock_fft_DUT_10/sim/busFabric_streamtoblock_fft_DUT_2ouisy506j6x6m6b6u0qu5xajz_streamtoblock_fft_DUT0000le_60MHz_mem_x_part1.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../streamtoblock_fft_DUT_10/sim/busFabric_streamtoblock_fft_DUT_2ouisy506j6x6m6b6u0qu5xajz_streamtoblock_fft_DUT0000100MHz_mem_x_a_part0.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../streamtoblock_fft_DUT_10/sim/busFabric_streamtoblock_fft_DUT_2ouisy506j6x6m6b6u0qu5xajz_streamtoblock_fft_DUT0000100MHz_mem_x_a_part1.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../streamtoblock_fft_DUT_10/sim/busFabric_streamtoblock_fft_DUT_2ouisy506j6x6m6b6u0qu5xajz_streamtoblock_fft_DUT0000_60MHz_mem_x_a_part0.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../streamtoblock_fft_DUT_10/sim/busFabric_streamtoblock_fft_DUT_2ouisy506j6x6m6b6u0qu5xajz_streamtoblock_fft_DUT0000_60MHz_mem_x_a_part1.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../streamtoblock_fft_DUT_10/sim/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_NCO_u0_sinTable.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../streamtoblock_fft_DUT_10/sim/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_NCO_u0_cosTable.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../streamtoblock_fft_DUT_10/sim/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_VFFT_btb_streamtoblock0000OptimizedDualMem_x_a.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../streamtoblock_fft_DUT_10/sim/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_VFFT_btb_streamtoblock0000OptimizedDualMem_x_b.hex"]"
    return $memory_files
  }
  
  proc get_common_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [dict create]
    return $design_files
  }
  
  proc get_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [list]
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../streamtoblock_fft_DUT_10/sim/dspba_library_ver.sv"]\"  -work streamtoblock_fft_DUT_10"                                                                                       
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../streamtoblock_fft_DUT_10/sim/streamtoblock_fft_DUT_safe_path_flat_ver.sv"]\"  -work streamtoblock_fft_DUT_10"                                                                
    lappend design_files "vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../streamtoblock_fft_DUT_10/sim/streamtoblock_fft_DUT_safe_path_flat.vhd"]\"  -work streamtoblock_fft_DUT_10"                                                                          
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../streamtoblock_fft_DUT_10/sim/streamtoblock_fft_DUT.sv"]\"  -work streamtoblock_fft_DUT_10"                                                                                   
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../streamtoblock_fft_DUT_10/sim/busFabric_streamtoblock_fft_DUT_2ouisy506j6x6m6b6u0qu5xajz.sv"]\"  -work streamtoblock_fft_DUT_10"                                              
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../streamtoblock_fft_DUT_10/sim/streamtoblock_fft_DUT_S2B_FFT_PC.sv"]\"  -work streamtoblock_fft_DUT_10"                                                                        
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../streamtoblock_fft_DUT_10/sim/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B.sv"]\"  -work streamtoblock_fft_DUT_10"                                                                
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../streamtoblock_fft_DUT_10/sim/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval.sv"]\"  -work streamtoblock_fft_DUT_10"                                                      
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../streamtoblock_fft_DUT_10/sim/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Finite_State_Machine.sv"]\"  -work streamtoblock_fft_DUT_10"                     
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../streamtoblock_fft_DUT_10/sim/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Finite_State_Machine.sv"]\"  -work streamtoblock_fft_DUT_10"                
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../streamtoblock_fft_DUT_10/sim/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing.sv"]\"  -work streamtoblock_fft_DUT_10"                                               
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../streamtoblock_fft_DUT_10/sim/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1.sv"]\"  -work streamtoblock_fft_DUT_10"                                
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../streamtoblock_fft_DUT_10/sim/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Rising_0000Finite_State_Machine.sv"]\"  -work streamtoblock_fft_DUT_10"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../streamtoblock_fft_DUT_10/sim/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Rising_0001Finite_State_Machine.sv"]\"  -work streamtoblock_fft_DUT_10"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../streamtoblock_fft_DUT_10/sim/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpo0000Finite_State_Machine.sv"]\"  -work streamtoblock_fft_DUT_10"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../streamtoblock_fft_DUT_10/sim/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpo0001Finite_State_Machine.sv"]\"  -work streamtoblock_fft_DUT_10"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../streamtoblock_fft_DUT_10/sim/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpo0002Finite_State_Machine.sv"]\"  -work streamtoblock_fft_DUT_10"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../streamtoblock_fft_DUT_10/sim/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpo0003Finite_State_Machine.sv"]\"  -work streamtoblock_fft_DUT_10"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../streamtoblock_fft_DUT_10/sim/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpo0004Finite_State_Machine.sv"]\"  -work streamtoblock_fft_DUT_10"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../streamtoblock_fft_DUT_10/sim/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpo0005Finite_State_Machine.sv"]\"  -work streamtoblock_fft_DUT_10"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../streamtoblock_fft_DUT_10/sim/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift.sv"]\"  -work streamtoblock_fft_DUT_10"                                       
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../streamtoblock_fft_DUT_10/sim/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_ComplexMixer.sv"]\"  -work streamtoblock_fft_DUT_10"                          
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../streamtoblock_fft_DUT_10/sim/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_NCO.sv"]\"  -work streamtoblock_fft_DUT_10"                                   
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../streamtoblock_fft_DUT_10/sim/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_Scale.sv"]\"  -work streamtoblock_fft_DUT_10"                                 
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../streamtoblock_fft_DUT_10/sim/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_Subsystem.sv"]\"  -work streamtoblock_fft_DUT_10"                             
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../streamtoblock_fft_DUT_10/sim/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_pipe.sv"]\"  -work streamtoblock_fft_DUT_10"                                  
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../streamtoblock_fft_DUT_10/sim/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_pipe1.sv"]\"  -work streamtoblock_fft_DUT_10"                                 
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../streamtoblock_fft_DUT_10/sim/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_RXGainComp.sv"]\"  -work streamtoblock_fft_DUT_10"                                    
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../streamtoblock_fft_DUT_10/sim/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_RXScaling.sv"]\"  -work streamtoblock_fft_DUT_10"                                     
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../streamtoblock_fft_DUT_10/sim/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_VFFT_btb.sv"]\"  -work streamtoblock_fft_DUT_10"                                      
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../streamtoblock_fft_DUT_10/sim/streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite.sv"]\"  -work streamtoblock_fft_DUT_10"                                                 
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../streamtoblock_fft_DUT_10/sim/streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_ComplexMixer.sv"]\"  -work streamtoblock_fft_DUT_10"                                    
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../streamtoblock_fft_DUT_10/sim/streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_ComplexMixer_ComplexMixer.sv"]\"  -work streamtoblock_fft_DUT_10"                       
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../streamtoblock_fft_DUT_10/sim/streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_ComplexMixer_Scalei.sv"]\"  -work streamtoblock_fft_DUT_10"                             
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../streamtoblock_fft_DUT_10/sim/streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_ComplexMixer_Scaleq.sv"]\"  -work streamtoblock_fft_DUT_10"                             
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../streamtoblock_fft_DUT_10/sim/streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate.sv"]\"  -work streamtoblock_fft_DUT_10"                                  
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../streamtoblock_fft_DUT_10/sim/streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_SOP_EOP_gen.sv"]\"  -work streamtoblock_fft_DUT_10"                                     
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../streamtoblock_fft_DUT_10/sim/streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_SOP_EOP_gen_Rising_edge_Finite_State_Machine.sv"]\"  -work streamtoblock_fft_DUT_10"    
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../streamtoblock_fft_DUT_10/sim/streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_SOP_EOP_gen_falling_edge_Finite_State_Machine.sv"]\"  -work streamtoblock_fft_DUT_10"   
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/lphy_ss_top_streamtoblock_fft_DUT_0.v"]\"  -work lphy_ss_top_streamtoblock_fft_DUT_0"                                                                                               
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
