
namespace eval lphy_ss_lphy_ss_top {
  proc get_design_libraries {} {
    set libraries [dict create]
    dict set libraries lphy_ss_10          1
    dict set libraries lphy_ss_lphy_ss_top 1
    return $libraries
  }
  
  proc get_memory_files {QSYS_SIMDIR} {
    set memory_files [list]
    lappend memory_files "$QSYS_SIMDIR/../lphy_ss_10/sim/prach_data_in_short.mif"
    lappend memory_files "$QSYS_SIMDIR/../lphy_ss_10/sim/prach_data_in_long.mif"
    lappend memory_files "$QSYS_SIMDIR/../lphy_ss_10/sim/cplane_pusch_fdv.mif"
    lappend memory_files "$QSYS_SIMDIR/../lphy_ss_10/sim/cplane_prach_fdv.mif"
    lappend memory_files "$QSYS_SIMDIR/../lphy_ss_10/sim/dl_blanking.mif"
    return $memory_files
  }
  
  proc get_common_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [dict create]
    return $design_files
  }
  
  proc get_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [list]
    lappend design_files "xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../lphy_ss_10/sim/struct_typedef.sv\"  -work lphy_ss_10 -cdslib  ./cds_libs/lphy_ss_10.cds.lib"            
    lappend design_files "xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../lphy_ss_10/sim/lphy_ss.sv\"  -work lphy_ss_10 -cdslib  ./cds_libs/lphy_ss_10.cds.lib"                   
    lappend design_files "xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../lphy_ss_10/sim/clock_crossing.v\"  -work lphy_ss_10 -cdslib  ./cds_libs/lphy_ss_10.cds.lib"                 
    lappend design_files "xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../lphy_ss_10/sim/ValidLowCounter.v\"  -work lphy_ss_10 -cdslib  ./cds_libs/lphy_ss_10.cds.lib"                
    lappend design_files "xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../lphy_ss_10/sim/dl_fdv_buffer.sv\"  -work lphy_ss_10 -cdslib  ./cds_libs/lphy_ss_10.cds.lib"             
    lappend design_files "xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../lphy_ss_10/sim/dl_ant_scheduler.v\"  -work lphy_ss_10 -cdslib  ./cds_libs/lphy_ss_10.cds.lib"               
    lappend design_files "xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../lphy_ss_10/sim/ifft_if.v\"  -work lphy_ss_10 -cdslib  ./cds_libs/lphy_ss_10.cds.lib"                        
    lappend design_files "xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../lphy_ss_10/sim/fft_if.v\"  -work lphy_ss_10 -cdslib  ./cds_libs/lphy_ss_10.cds.lib"                         
    lappend design_files "xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../lphy_ss_10/sim/ul_ant_scheduler.v\"  -work lphy_ss_10 -cdslib  ./cds_libs/lphy_ss_10.cds.lib"               
    lappend design_files "xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../lphy_ss_10/sim/prach_ant_mux.v\"  -work lphy_ss_10 -cdslib  ./cds_libs/lphy_ss_10.cds.lib"                  
    lappend design_files "xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../lphy_ss_10/sim/prach_if.v\"  -work lphy_ss_10 -cdslib  ./cds_libs/lphy_ss_10.cds.lib"                       
    lappend design_files "xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../lphy_ss_10/sim/pb_st.v\"  -work lphy_ss_10 -cdslib  ./cds_libs/lphy_ss_10.cds.lib"                          
    lappend design_files "xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../lphy_ss_10/sim/short_prach_c_m_config.v\"  -work lphy_ss_10 -cdslib  ./cds_libs/lphy_ss_10.cds.lib"         
    lappend design_files "xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../lphy_ss_10/sim/prach_top.v\"  -work lphy_ss_10 -cdslib  ./cds_libs/lphy_ss_10.cds.lib"                      
    lappend design_files "xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../lphy_ss_10/sim/pipeline.v\"  -work lphy_ss_10 -cdslib  ./cds_libs/lphy_ss_10.cds.lib"                       
    lappend design_files "xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../lphy_ss_10/sim/prach_cplane_decode.v\"  -work lphy_ss_10 -cdslib  ./cds_libs/lphy_ss_10.cds.lib"            
    lappend design_files "xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../lphy_ss_10/sim/long_prach_nco_config.v\"  -work lphy_ss_10 -cdslib  ./cds_libs/lphy_ss_10.cds.lib"          
    lappend design_files "xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../lphy_ss_10/sim/short_long_prach_config_wrapper.v\"  -work lphy_ss_10 -cdslib  ./cds_libs/lphy_ss_10.cds.lib"
    lappend design_files "xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../lphy_ss_10/sim/prach_config_ip_top.v\"  -work lphy_ss_10 -cdslib  ./cds_libs/lphy_ss_10.cds.lib"            
    lappend design_files "xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../lphy_ss_10/sim/channel_calc.v\"  -work lphy_ss_10 -cdslib  ./cds_libs/lphy_ss_10.cds.lib"                   
    lappend design_files "xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../lphy_ss_10/sim/dl_lphy_ss.v\"  -work lphy_ss_10 -cdslib  ./cds_libs/lphy_ss_10.cds.lib"                     
    lappend design_files "xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../lphy_ss_10/sim/ul_lphy_ss.v\"  -work lphy_ss_10 -cdslib  ./cds_libs/lphy_ss_10.cds.lib"                     
    lappend design_files "xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../lphy_ss_10/sim/lphy_ss_config.v\"  -work lphy_ss_10 -cdslib  ./cds_libs/lphy_ss_10.cds.lib"                 
    lappend design_files "xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../lphy_ss_10/sim/LPHY_SS_Registers.v\"  -work lphy_ss_10 -cdslib  ./cds_libs/lphy_ss_10.cds.lib"              
    lappend design_files "xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../lphy_ss_10/sim/Short_PRACH_Registers_L1.v\"  -work lphy_ss_10 -cdslib  ./cds_libs/lphy_ss_10.cds.lib"       
    lappend design_files "xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../lphy_ss_10/sim/Short_PRACH_Registers_L2.v\"  -work lphy_ss_10 -cdslib  ./cds_libs/lphy_ss_10.cds.lib"       
    lappend design_files "xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../lphy_ss_10/sim/Long_PRACH_Registers_L1.v\"  -work lphy_ss_10 -cdslib  ./cds_libs/lphy_ss_10.cds.lib"        
    lappend design_files "xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../lphy_ss_10/sim/Long_PRACH_Registers_L2.v\"  -work lphy_ss_10 -cdslib  ./cds_libs/lphy_ss_10.cds.lib"        
    lappend design_files "xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../lphy_ss_10/sim/power_meter_top_ss.v\"  -work lphy_ss_10 -cdslib  ./cds_libs/lphy_ss_10.cds.lib"             
    lappend design_files "xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../lphy_ss_10/sim/power_meter_ss.v\"  -work lphy_ss_10 -cdslib  ./cds_libs/lphy_ss_10.cds.lib"                 
    lappend design_files "xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../lphy_ss_10/sim/mean_ss.v\"  -work lphy_ss_10 -cdslib  ./cds_libs/lphy_ss_10.cds.lib"                        
    lappend design_files "xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../lphy_ss_10/sim/square_ss.v\"  -work lphy_ss_10 -cdslib  ./cds_libs/lphy_ss_10.cds.lib"                      
    lappend design_files "xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../lphy_ss_10/sim/accumulator_ss.v\"  -work lphy_ss_10 -cdslib  ./cds_libs/lphy_ss_10.cds.lib"                 
    lappend design_files "xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../lphy_ss_10/sim/enable_ss.v\"  -work lphy_ss_10 -cdslib  ./cds_libs/lphy_ss_10.cds.lib"                      
    lappend design_files "xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../lphy_ss_10/sim/histogram_state_machine.v\"  -work lphy_ss_10 -cdslib  ./cds_libs/lphy_ss_10.cds.lib"        
    lappend design_files "xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../lphy_ss_10/sim/pulsegen_ss.v\"  -work lphy_ss_10 -cdslib  ./cds_libs/lphy_ss_10.cds.lib"                    
    lappend design_files "xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../lphy_ss_10/sim/PWR_MTR_SS_Registers.v\"  -work lphy_ss_10 -cdslib  ./cds_libs/lphy_ss_10.cds.lib"           
    lappend design_files "xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../lphy_ss_10/sim/dl_blanking.sv\"  -work lphy_ss_10 -cdslib  ./cds_libs/lphy_ss_10.cds.lib"               
    lappend design_files "xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../lphy_ss_10/sim/incremental_counter.sv\"  -work lphy_ss_10 -cdslib  ./cds_libs/lphy_ss_10.cds.lib"       
    lappend design_files "xmvlog -compcnfg $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/lphy_ss_lphy_ss_top.v\"  -work lphy_ss_lphy_ss_top"                                                  
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
