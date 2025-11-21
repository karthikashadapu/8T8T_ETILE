
namespace eval lphy_ss_lphy_ss_top {
  proc get_memory_files {QSYS_SIMDIR} {
    set memory_files [list]
    lappend memory_files "$QSYS_SIMDIR/../lphy_ss_10/sim/prach_data_in_short.mif"
    lappend memory_files "$QSYS_SIMDIR/../lphy_ss_10/sim/prach_data_in_long.mif"
    lappend memory_files "$QSYS_SIMDIR/../lphy_ss_10/sim/cplane_pusch_fdv.mif"
    lappend memory_files "$QSYS_SIMDIR/../lphy_ss_10/sim/cplane_prach_fdv.mif"
    lappend memory_files "$QSYS_SIMDIR/../lphy_ss_10/sim/dl_blanking.mif"
    return $memory_files
  }
  
  proc get_common_design_files {QSYS_SIMDIR} {
    set design_files [dict create]
    return $design_files
  }
  
  proc get_design_files {QSYS_SIMDIR} {
    set design_files [dict create]
    dict set design_files "struct_typedef.sv"                 "$QSYS_SIMDIR/../lphy_ss_10/sim/struct_typedef.sv"                
    dict set design_files "lphy_ss.sv"                        "$QSYS_SIMDIR/../lphy_ss_10/sim/lphy_ss.sv"                       
    dict set design_files "clock_crossing.v"                  "$QSYS_SIMDIR/../lphy_ss_10/sim/clock_crossing.v"                 
    dict set design_files "ValidLowCounter.v"                 "$QSYS_SIMDIR/../lphy_ss_10/sim/ValidLowCounter.v"                
    dict set design_files "dl_fdv_buffer.sv"                  "$QSYS_SIMDIR/../lphy_ss_10/sim/dl_fdv_buffer.sv"                 
    dict set design_files "dl_ant_scheduler.v"                "$QSYS_SIMDIR/../lphy_ss_10/sim/dl_ant_scheduler.v"               
    dict set design_files "ifft_if.v"                         "$QSYS_SIMDIR/../lphy_ss_10/sim/ifft_if.v"                        
    dict set design_files "fft_if.v"                          "$QSYS_SIMDIR/../lphy_ss_10/sim/fft_if.v"                         
    dict set design_files "ul_ant_scheduler.v"                "$QSYS_SIMDIR/../lphy_ss_10/sim/ul_ant_scheduler.v"               
    dict set design_files "prach_ant_mux.v"                   "$QSYS_SIMDIR/../lphy_ss_10/sim/prach_ant_mux.v"                  
    dict set design_files "prach_if.v"                        "$QSYS_SIMDIR/../lphy_ss_10/sim/prach_if.v"                       
    dict set design_files "pb_st.v"                           "$QSYS_SIMDIR/../lphy_ss_10/sim/pb_st.v"                          
    dict set design_files "short_prach_c_m_config.v"          "$QSYS_SIMDIR/../lphy_ss_10/sim/short_prach_c_m_config.v"         
    dict set design_files "prach_top.v"                       "$QSYS_SIMDIR/../lphy_ss_10/sim/prach_top.v"                      
    dict set design_files "pipeline.v"                        "$QSYS_SIMDIR/../lphy_ss_10/sim/pipeline.v"                       
    dict set design_files "prach_cplane_decode.v"             "$QSYS_SIMDIR/../lphy_ss_10/sim/prach_cplane_decode.v"            
    dict set design_files "long_prach_nco_config.v"           "$QSYS_SIMDIR/../lphy_ss_10/sim/long_prach_nco_config.v"          
    dict set design_files "short_long_prach_config_wrapper.v" "$QSYS_SIMDIR/../lphy_ss_10/sim/short_long_prach_config_wrapper.v"
    dict set design_files "prach_config_ip_top.v"             "$QSYS_SIMDIR/../lphy_ss_10/sim/prach_config_ip_top.v"            
    dict set design_files "channel_calc.v"                    "$QSYS_SIMDIR/../lphy_ss_10/sim/channel_calc.v"                   
    dict set design_files "dl_lphy_ss.v"                      "$QSYS_SIMDIR/../lphy_ss_10/sim/dl_lphy_ss.v"                     
    dict set design_files "ul_lphy_ss.v"                      "$QSYS_SIMDIR/../lphy_ss_10/sim/ul_lphy_ss.v"                     
    dict set design_files "lphy_ss_config.v"                  "$QSYS_SIMDIR/../lphy_ss_10/sim/lphy_ss_config.v"                 
    dict set design_files "LPHY_SS_Registers.v"               "$QSYS_SIMDIR/../lphy_ss_10/sim/LPHY_SS_Registers.v"              
    dict set design_files "Short_PRACH_Registers_L1.v"        "$QSYS_SIMDIR/../lphy_ss_10/sim/Short_PRACH_Registers_L1.v"       
    dict set design_files "Short_PRACH_Registers_L2.v"        "$QSYS_SIMDIR/../lphy_ss_10/sim/Short_PRACH_Registers_L2.v"       
    dict set design_files "Long_PRACH_Registers_L1.v"         "$QSYS_SIMDIR/../lphy_ss_10/sim/Long_PRACH_Registers_L1.v"        
    dict set design_files "Long_PRACH_Registers_L2.v"         "$QSYS_SIMDIR/../lphy_ss_10/sim/Long_PRACH_Registers_L2.v"        
    dict set design_files "power_meter_top_ss.v"              "$QSYS_SIMDIR/../lphy_ss_10/sim/power_meter_top_ss.v"             
    dict set design_files "power_meter_ss.v"                  "$QSYS_SIMDIR/../lphy_ss_10/sim/power_meter_ss.v"                 
    dict set design_files "mean_ss.v"                         "$QSYS_SIMDIR/../lphy_ss_10/sim/mean_ss.v"                        
    dict set design_files "square_ss.v"                       "$QSYS_SIMDIR/../lphy_ss_10/sim/square_ss.v"                      
    dict set design_files "accumulator_ss.v"                  "$QSYS_SIMDIR/../lphy_ss_10/sim/accumulator_ss.v"                 
    dict set design_files "enable_ss.v"                       "$QSYS_SIMDIR/../lphy_ss_10/sim/enable_ss.v"                      
    dict set design_files "histogram_state_machine.v"         "$QSYS_SIMDIR/../lphy_ss_10/sim/histogram_state_machine.v"        
    dict set design_files "pulsegen_ss.v"                     "$QSYS_SIMDIR/../lphy_ss_10/sim/pulsegen_ss.v"                    
    dict set design_files "PWR_MTR_SS_Registers.v"            "$QSYS_SIMDIR/../lphy_ss_10/sim/PWR_MTR_SS_Registers.v"           
    dict set design_files "dl_blanking.sv"                    "$QSYS_SIMDIR/../lphy_ss_10/sim/dl_blanking.sv"                   
    dict set design_files "incremental_counter.sv"            "$QSYS_SIMDIR/../lphy_ss_10/sim/incremental_counter.sv"           
    dict set design_files "lphy_ss_lphy_ss_top.v"             "$QSYS_SIMDIR/lphy_ss_lphy_ss_top.v"                              
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
  
  
  proc get_dpi_libraries {QSYS_SIMDIR} {
    set libraries [dict create]
    
    return $libraries
  }
  
}
