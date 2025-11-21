
namespace eval ecpri_oran_top_ecpri_oran_0 {
  proc get_memory_files {QSYS_SIMDIR} {
    set memory_files [list]
    lappend memory_files "$QSYS_SIMDIR/../ecpri_oran_10/sim/prach_data_in_long.mif"
    lappend memory_files "$QSYS_SIMDIR/../ecpri_oran_10/sim/cplane_pusch_fdv.mif"
    lappend memory_files "$QSYS_SIMDIR/../ecpri_oran_10/sim/cplane_prach_fdv.mif"
    lappend memory_files "$QSYS_SIMDIR/../ecpri_oran_10/sim/map_table.mif"
    return $memory_files
  }
  
  proc get_common_design_files {QSYS_SIMDIR} {
    set design_files [dict create]
    return $design_files
  }
  
  proc get_design_files {QSYS_SIMDIR} {
    set design_files [dict create]
    dict set design_files "struct_typedef.sv"                 "$QSYS_SIMDIR/../ecpri_oran_10/sim/struct_typedef.sv"                
    dict set design_files "ecpri_oran_ss.sv"                  "$QSYS_SIMDIR/../ecpri_oran_10/sim/ecpri_oran_ss.sv"                 
    dict set design_files "ul_eaxc_config.v"                  "$QSYS_SIMDIR/../ecpri_oran_10/sim/ul_eaxc_config.v"                 
    dict set design_files "ul_rtc_id_config.v"                "$QSYS_SIMDIR/../ecpri_oran_10/sim/ul_rtc_id_config.v"               
    dict set design_files "dl_rtc_id_config.v"                "$QSYS_SIMDIR/../ecpri_oran_10/sim/dl_rtc_id_config.v"               
    dict set design_files "dl_eaxc_config.v"                  "$QSYS_SIMDIR/../ecpri_oran_10/sim/dl_eaxc_config.v"                 
    dict set design_files "uplink_arbiter.v"                  "$QSYS_SIMDIR/../ecpri_oran_10/sim/uplink_arbiter.v"                 
    dict set design_files "cu_plane_coupling_top.v"           "$QSYS_SIMDIR/../ecpri_oran_10/sim/cu_plane_coupling_top.v"          
    dict set design_files "cu_plane_coupling_prach_wrapper.v" "$QSYS_SIMDIR/../ecpri_oran_10/sim/cu_plane_coupling_prach_wrapper.v"
    dict set design_files "cu_plane_coupling_pusch_wrapper.v" "$QSYS_SIMDIR/../ecpri_oran_10/sim/cu_plane_coupling_pusch_wrapper.v"
    dict set design_files "prach_fdv_read_state_machine.v"    "$QSYS_SIMDIR/../ecpri_oran_10/sim/prach_fdv_read_state_machine.v"   
    dict set design_files "pusch_fdv_read_state_machine.v"    "$QSYS_SIMDIR/../ecpri_oran_10/sim/pusch_fdv_read_state_machine.v"   
    dict set design_files "pusch_fifo_read_state_machine.v"   "$QSYS_SIMDIR/../ecpri_oran_10/sim/pusch_fifo_read_state_machine.v"  
    dict set design_files "prach_fifo_read_state_machine.v"   "$QSYS_SIMDIR/../ecpri_oran_10/sim/prach_fifo_read_state_machine.v"  
    dict set design_files "pusch_raw_packet_formation.v"      "$QSYS_SIMDIR/../ecpri_oran_10/sim/pusch_raw_packet_formation.v"     
    dict set design_files "prach_raw_packet_formation.v"      "$QSYS_SIMDIR/../ecpri_oran_10/sim/prach_raw_packet_formation.v"     
    dict set design_files "pusch_cplane_fdv_buffer.v"         "$QSYS_SIMDIR/../ecpri_oran_10/sim/pusch_cplane_fdv_buffer.v"        
    dict set design_files "prach_cplane_fdv_buffer.v"         "$QSYS_SIMDIR/../ecpri_oran_10/sim/prach_cplane_fdv_buffer.v"        
    dict set design_files "oran_wrapper.v"                    "$QSYS_SIMDIR/../ecpri_oran_10/sim/oran_wrapper.v"                   
    dict set design_files "Oran_SS_Registers.v"               "$QSYS_SIMDIR/../ecpri_oran_10/sim/Oran_SS_Registers.v"              
    dict set design_files "idle_time_counter.v"               "$QSYS_SIMDIR/../ecpri_oran_10/sim/idle_time_counter.v"              
    dict set design_files "xran_timestamp.v"                  "$QSYS_SIMDIR/../ecpri_oran_10/sim/xran_timestamp.v"                 
    dict set design_files "ecpri_oran_top_ecpri_oran_0.v"     "$QSYS_SIMDIR/ecpri_oran_top_ecpri_oran_0.v"                         
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
