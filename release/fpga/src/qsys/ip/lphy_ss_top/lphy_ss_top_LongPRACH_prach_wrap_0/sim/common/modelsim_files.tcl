
namespace eval lphy_ss_top_LongPRACH_prach_wrap_0 {
  proc get_design_libraries {} {
    set libraries [dict create]
    dict set libraries LongPRACH_sim_prach_wrap_10        1
    dict set libraries lphy_ss_top_LongPRACH_prach_wrap_0 1
    return $libraries
  }
  
  proc get_memory_files {QSYS_SIMDIR} {
    set memory_files [list]
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_MIXER_NCO1_u0_phaseIncrMem.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_MIXER_NCO1_readbackMem.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_MIXER_NCO1_u0_sinTable.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_MIXER_NCO1_u0_cosTable.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FF0000OptimizedDualMem_x_a.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FF0000OptimizedDualMem_x_b.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_startsym_lutmem.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_LongPRAC0000Index_SufF0_x_lutmem.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_LongPRAC0000Index_SufF1_x_lutmem.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_LongPRAC0000Index_SufF2_x_lutmem.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_LongPRAC0000Index_SufF3_x_lutmem.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_LongPRAC0000Index_SufF4_x_lutmem.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_LongPRAC0000Index_SufF5_x_lutmem.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_LongPRAC0000Index_SufF6_x_lutmem.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_LongPRAC0000Index_SufF7_x_lutmem.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_LongPRAC0000Index_SufF8_x_lutmem.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_LongPRAC0000Index_SufF9_x_lutmem.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_LongPRAC0000fig_Index_X_x_lutmem.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_LongPRAC0000aired_SufF1_x_lutmem.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_LongPRAC0000aired_SufF6_x_lutmem.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_LongPRAC0000aired_SufF7_x_lutmem.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_LongPRAC0000aired_SufF8_x_lutmem.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_LongPRAC0000aired_SufF9_x_lutmem.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_LongPRAC0000_unpaired_X_x_lutmem.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_LongPRAC0000_unpaired_Y_x_lutmem.hex"]"
    return $memory_files
  }
  
  proc get_common_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [dict create]
    return $design_files
  }
  
  proc get_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [list]
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/dspba_library_ver.sv"]\"  -work LongPRACH_sim_prach_wrap_10"                                                                                       
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_safe_path_flat_ver.sv"]\"  -work LongPRACH_sim_prach_wrap_10"                                                             
    lappend design_files "vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_safe_path_flat.vhd"]\"  -work LongPRACH_sim_prach_wrap_10"                                                                       
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap.sv"]\"  -work LongPRACH_sim_prach_wrap_10"                                                                                
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT.sv"]\"  -work LongPRACH_sim_prach_wrap_10"                                                                  
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane.sv"]\"  -work LongPRACH_sim_prach_wrap_10"                                              
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core.sv"]\"  -work LongPRACH_sim_prach_wrap_10"                               
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_Timeref_capture_fifo.sv"]\"  -work LongPRACH_sim_prach_wrap_10"          
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL.sv"]\"  -work LongPRACH_sim_prach_wrap_10"                    
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5.sv"]\"  -work LongPRACH_sim_prach_wrap_10"          
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMATION1.sv"]\"  -work LongPRACH_sim_prach_wrap_10"                   
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMATION1_Stage1.sv"]\"  -work LongPRACH_sim_prach_wrap_10"            
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMA0000Filt_DEC_by_3_stage1.sv"]\"  -work LongPRACH_sim_prach_wrap_10"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMA0000tage1_DecimatingFIR1.sv"]\"  -work LongPRACH_sim_prach_wrap_10"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMA0000tage1_DecimatingFIR2.sv"]\"  -work LongPRACH_sim_prach_wrap_10"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMA0000EC_by_3_stage1_Scale.sv"]\"  -work LongPRACH_sim_prach_wrap_10"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMA0000C_by_3_stage1_Scale1.sv"]\"  -work LongPRACH_sim_prach_wrap_10"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMA0000Stage1_filt_flush_in.sv"]\"  -work LongPRACH_sim_prach_wrap_10"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMATION1_Stage2.sv"]\"  -work LongPRACH_sim_prach_wrap_10"            
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMA0000Filt_DEC_by_2_stage2.sv"]\"  -work LongPRACH_sim_prach_wrap_10"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMA0000stage2_DecimatingFIR.sv"]\"  -work LongPRACH_sim_prach_wrap_10"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMA0000tage2_DecimatingFIR1.sv"]\"  -work LongPRACH_sim_prach_wrap_10"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMA0000EC_by_2_stage2_Scale.sv"]\"  -work LongPRACH_sim_prach_wrap_10"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMA0000C_by_2_stage2_Scale1.sv"]\"  -work LongPRACH_sim_prach_wrap_10"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMATION1_Stage3.sv"]\"  -work LongPRACH_sim_prach_wrap_10"            
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMA0000Filt_DEC_by_2_stage3.sv"]\"  -work LongPRACH_sim_prach_wrap_10"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMA0000stage3_DecimatingFIR.sv"]\"  -work LongPRACH_sim_prach_wrap_10"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMA0000tage3_DecimatingFIR1.sv"]\"  -work LongPRACH_sim_prach_wrap_10"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMA0000EC_by_2_stage3_Scale.sv"]\"  -work LongPRACH_sim_prach_wrap_10"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMA0000C_by_2_stage3_Scale1.sv"]\"  -work LongPRACH_sim_prach_wrap_10"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMATION1_Stage5.sv"]\"  -work LongPRACH_sim_prach_wrap_10"            
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMA0000Filt_DEC_by_2_stage5.sv"]\"  -work LongPRACH_sim_prach_wrap_10"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMA0000stage5_DecimatingFIR.sv"]\"  -work LongPRACH_sim_prach_wrap_10"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMA0000tage5_DecimatingFIR1.sv"]\"  -work LongPRACH_sim_prach_wrap_10"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMA0000EC_by_2_stage5_Scale.sv"]\"  -work LongPRACH_sim_prach_wrap_10"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMA0000C_by_2_stage5_Scale1.sv"]\"  -work LongPRACH_sim_prach_wrap_10"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMATION1_Stage6.sv"]\"  -work LongPRACH_sim_prach_wrap_10"            
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMA0000Filt_DEC_by_2_stage6.sv"]\"  -work LongPRACH_sim_prach_wrap_10"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMA0000stage6_DecimatingFIR.sv"]\"  -work LongPRACH_sim_prach_wrap_10"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMA0000tage6_DecimatingFIR1.sv"]\"  -work LongPRACH_sim_prach_wrap_10"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMA0000EC_by_2_stage6_Scale.sv"]\"  -work LongPRACH_sim_prach_wrap_10"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMA0000C_by_2_stage6_Scale1.sv"]\"  -work LongPRACH_sim_prach_wrap_10"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMA0000tage6_filt_flush_out.sv"]\"  -work LongPRACH_sim_prach_wrap_10"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMATION1_stage4.sv"]\"  -work LongPRACH_sim_prach_wrap_10"            
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMA0000Filt_DEC_by_2_stage4.sv"]\"  -work LongPRACH_sim_prach_wrap_10"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMA0000stage4_DecimatingFIR.sv"]\"  -work LongPRACH_sim_prach_wrap_10"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMA0000tage4_DecimatingFIR1.sv"]\"  -work LongPRACH_sim_prach_wrap_10"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMA0000EC_by_2_stage4_Scale.sv"]\"  -work LongPRACH_sim_prach_wrap_10"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMA0000C_by_2_stage4_Scale1.sv"]\"  -work LongPRACH_sim_prach_wrap_10"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift.sv"]\"  -work LongPRACH_sim_prach_wrap_10"                      
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_MIXER.sv"]\"  -work LongPRACH_sim_prach_wrap_10"                         
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_MIXER_ComplexMixer1.sv"]\"  -work LongPRACH_sim_prach_wrap_10"           
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_MIXER_NCO1.sv"]\"  -work LongPRACH_sim_prach_wrap_10"                    
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_MIXER_Scale.sv"]\"  -work LongPRACH_sim_prach_wrap_10"                   
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_MIXER_Scale1.sv"]\"  -work LongPRACH_sim_prach_wrap_10"                  
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT.sv"]\"  -work LongPRACH_sim_prach_wrap_10"                       
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_Scale.sv"]\"  -work LongPRACH_sim_prach_wrap_10"                 
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_Scale1.sv"]\"  -work LongPRACH_sim_prach_wrap_10"                
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_FFT1.sv"]\"  -work LongPRACH_sim_prach_wrap_10"                  
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B.sv"]\"  -work LongPRACH_sim_prach_wrap_10"                   
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FF0000nite_State_Machine12.sv"]\"  -work LongPRACH_sim_prach_wrap_10"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_gain.sv"]\"  -work LongPRACH_sim_prach_wrap_10"                  
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT.sv"]\"  -work LongPRACH_sim_prach_wrap_10"                    
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../LongPRACH_sim_prach_wrap_10/sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId.sv"]\"  -work LongPRACH_sim_prach_wrap_10"                                 
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/lphy_ss_top_LongPRACH_prach_wrap_0.v"]\"  -work lphy_ss_top_LongPRACH_prach_wrap_0"                                                                                                       
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
