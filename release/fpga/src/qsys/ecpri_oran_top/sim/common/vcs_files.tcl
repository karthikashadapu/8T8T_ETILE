source [file join [file dirname [info script]] ./../../../ip/ecpri_oran_top/ecpri_oran_top_reset_bridge_csr/sim/common/vcs_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/ecpri_oran_top/clock_bridge_dsp/sim/common/vcs_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/ecpri_oran_top/ecpri_oran_top_mm_bridge_0/sim/common/vcs_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/ecpri_oran_top/reset_bridge_dsp/sim/common/vcs_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/ecpri_oran_top/ecpri_oran_top_reset_bridge_0/sim/common/vcs_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/ecpri_oran_top/ecpri_oran_top_ecpri_oran_0/sim/common/vcs_files.tcl]

namespace eval ecpri_oran_top {
  proc get_memory_files {QSYS_SIMDIR} {
    set memory_files [list]
    set memory_files [concat $memory_files [ecpri_oran_top_reset_bridge_csr::get_memory_files "$QSYS_SIMDIR/../../ip/ecpri_oran_top/ecpri_oran_top_reset_bridge_csr/sim/"]]
    set memory_files [concat $memory_files [clock_bridge_dsp::get_memory_files "$QSYS_SIMDIR/../../ip/ecpri_oran_top/clock_bridge_dsp/sim/"]]
    set memory_files [concat $memory_files [ecpri_oran_top_mm_bridge_0::get_memory_files "$QSYS_SIMDIR/../../ip/ecpri_oran_top/ecpri_oran_top_mm_bridge_0/sim/"]]
    set memory_files [concat $memory_files [reset_bridge_dsp::get_memory_files "$QSYS_SIMDIR/../../ip/ecpri_oran_top/reset_bridge_dsp/sim/"]]
    set memory_files [concat $memory_files [ecpri_oran_top_reset_bridge_0::get_memory_files "$QSYS_SIMDIR/../../ip/ecpri_oran_top/ecpri_oran_top_reset_bridge_0/sim/"]]
    set memory_files [concat $memory_files [ecpri_oran_top_ecpri_oran_0::get_memory_files "$QSYS_SIMDIR/../../ip/ecpri_oran_top/ecpri_oran_top_ecpri_oran_0/sim/"]]
    return $memory_files
  }
  
  proc get_common_design_files {QSYS_SIMDIR} {
    set design_files [dict create]
    set design_files [dict merge $design_files [ecpri_oran_top_reset_bridge_csr::get_common_design_files "$QSYS_SIMDIR/../../ip/ecpri_oran_top/ecpri_oran_top_reset_bridge_csr/sim/"]]
    set design_files [dict merge $design_files [clock_bridge_dsp::get_common_design_files "$QSYS_SIMDIR/../../ip/ecpri_oran_top/clock_bridge_dsp/sim/"]]
    set design_files [dict merge $design_files [ecpri_oran_top_mm_bridge_0::get_common_design_files "$QSYS_SIMDIR/../../ip/ecpri_oran_top/ecpri_oran_top_mm_bridge_0/sim/"]]
    set design_files [dict merge $design_files [reset_bridge_dsp::get_common_design_files "$QSYS_SIMDIR/../../ip/ecpri_oran_top/reset_bridge_dsp/sim/"]]
    set design_files [dict merge $design_files [ecpri_oran_top_reset_bridge_0::get_common_design_files "$QSYS_SIMDIR/../../ip/ecpri_oran_top/ecpri_oran_top_reset_bridge_0/sim/"]]
    set design_files [dict merge $design_files [ecpri_oran_top_ecpri_oran_0::get_common_design_files "$QSYS_SIMDIR/../../ip/ecpri_oran_top/ecpri_oran_top_ecpri_oran_0/sim/"]]
    return $design_files
  }
  
  proc get_design_files {QSYS_SIMDIR} {
    set design_files [dict create]
    set design_files [dict merge $design_files [ecpri_oran_top_reset_bridge_csr::get_design_files "$QSYS_SIMDIR/../../ip/ecpri_oran_top/ecpri_oran_top_reset_bridge_csr/sim/"]]
    set design_files [dict merge $design_files [clock_bridge_dsp::get_design_files "$QSYS_SIMDIR/../../ip/ecpri_oran_top/clock_bridge_dsp/sim/"]]
    set design_files [dict merge $design_files [ecpri_oran_top_mm_bridge_0::get_design_files "$QSYS_SIMDIR/../../ip/ecpri_oran_top/ecpri_oran_top_mm_bridge_0/sim/"]]
    set design_files [dict merge $design_files [reset_bridge_dsp::get_design_files "$QSYS_SIMDIR/../../ip/ecpri_oran_top/reset_bridge_dsp/sim/"]]
    set design_files [dict merge $design_files [ecpri_oran_top_reset_bridge_0::get_design_files "$QSYS_SIMDIR/../../ip/ecpri_oran_top/ecpri_oran_top_reset_bridge_0/sim/"]]
    set design_files [dict merge $design_files [ecpri_oran_top_ecpri_oran_0::get_design_files "$QSYS_SIMDIR/../../ip/ecpri_oran_top/ecpri_oran_top_ecpri_oran_0/sim/"]]
    dict set design_files "ftile_ghrd_avst_axist_bridge.sv"                                                   "$QSYS_SIMDIR/../ecpri_oran_top_avst_axist_bridge_0/sim/ftile_ghrd_avst_axist_bridge.sv"                                                  
    dict set design_files "ecpri_oran_top_altera_merlin_master_translator_192_lykd4la.sv"                     "$QSYS_SIMDIR/../altera_merlin_master_translator_192/sim/ecpri_oran_top_altera_merlin_master_translator_192_lykd4la.sv"                   
    dict set design_files "ecpri_oran_top_altera_merlin_slave_translator_191_x56fcki.sv"                      "$QSYS_SIMDIR/../altera_merlin_slave_translator_191/sim/ecpri_oran_top_altera_merlin_slave_translator_191_x56fcki.sv"                     
    dict set design_files "ecpri_oran_top_altera_merlin_master_agent_1922_fy3n5ti.sv"                         "$QSYS_SIMDIR/../altera_merlin_master_agent_1922/sim/ecpri_oran_top_altera_merlin_master_agent_1922_fy3n5ti.sv"                           
    dict set design_files "ecpri_oran_top_altera_merlin_slave_agent_1921_b6r3djy.sv"                          "$QSYS_SIMDIR/../altera_merlin_slave_agent_1921/sim/ecpri_oran_top_altera_merlin_slave_agent_1921_b6r3djy.sv"                             
    dict set design_files "altera_merlin_burst_uncompressor.sv"                                               "$QSYS_SIMDIR/../altera_merlin_slave_agent_1921/sim/altera_merlin_burst_uncompressor.sv"                                                  
    dict set design_files "ecpri_oran_top_altera_avalon_sc_fifo_1932_w27kryi.v"                               "$QSYS_SIMDIR/../altera_avalon_sc_fifo_1932/sim/ecpri_oran_top_altera_avalon_sc_fifo_1932_w27kryi.v"                                      
    dict set design_files "ecpri_oran_top_altera_merlin_router_1921_6fp3vva.sv"                               "$QSYS_SIMDIR/../altera_merlin_router_1921/sim/ecpri_oran_top_altera_merlin_router_1921_6fp3vva.sv"                                       
    dict set design_files "ecpri_oran_top_altera_merlin_router_1921_iimzh7i.sv"                               "$QSYS_SIMDIR/../altera_merlin_router_1921/sim/ecpri_oran_top_altera_merlin_router_1921_iimzh7i.sv"                                       
    dict set design_files "ecpri_oran_top_altera_merlin_traffic_limiter_altera_avalon_sc_fifo_1921_wq7ojcq.v" "$QSYS_SIMDIR/../altera_merlin_traffic_limiter_1921/sim/ecpri_oran_top_altera_merlin_traffic_limiter_altera_avalon_sc_fifo_1921_wq7ojcq.v"
    dict set design_files "altera_merlin_reorder_memory.sv"                                                   "$QSYS_SIMDIR/../altera_merlin_traffic_limiter_1921/sim/altera_merlin_reorder_memory.sv"                                                  
    dict set design_files "altera_avalon_st_pipeline_base.v"                                                  "$QSYS_SIMDIR/../altera_merlin_traffic_limiter_1921/sim/altera_avalon_st_pipeline_base.v"                                                 
    dict set design_files "ecpri_oran_top_altera_merlin_traffic_limiter_1921_js7yfey.sv"                      "$QSYS_SIMDIR/../altera_merlin_traffic_limiter_1921/sim/ecpri_oran_top_altera_merlin_traffic_limiter_1921_js7yfey.sv"                     
    dict set design_files "ecpri_oran_top_altera_merlin_demultiplexer_1921_qdhafey.sv"                        "$QSYS_SIMDIR/../altera_merlin_demultiplexer_1921/sim/ecpri_oran_top_altera_merlin_demultiplexer_1921_qdhafey.sv"                         
    dict set design_files "ecpri_oran_top_altera_merlin_multiplexer_1922_4xmqb4q.sv"                          "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/ecpri_oran_top_altera_merlin_multiplexer_1922_4xmqb4q.sv"                             
    dict set design_files "altera_merlin_arbitrator.sv"                                                       "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/altera_merlin_arbitrator.sv"                                                          
    dict set design_files "ecpri_oran_top_altera_merlin_demultiplexer_1921_4kurn6q.sv"                        "$QSYS_SIMDIR/../altera_merlin_demultiplexer_1921/sim/ecpri_oran_top_altera_merlin_demultiplexer_1921_4kurn6q.sv"                         
    dict set design_files "ecpri_oran_top_altera_merlin_multiplexer_1922_jfnui6q.sv"                          "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/ecpri_oran_top_altera_merlin_multiplexer_1922_jfnui6q.sv"                             
    dict set design_files "altera_merlin_arbitrator.sv"                                                       "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/altera_merlin_arbitrator.sv"                                                          
    dict set design_files "ecpri_oran_top_altera_mm_interconnect_1920_u73qfxa.v"                              "$QSYS_SIMDIR/../altera_mm_interconnect_1920/sim/ecpri_oran_top_altera_mm_interconnect_1920_u73qfxa.v"                                    
    dict set design_files "ecpri_oran_top_timing_adapter_1940_almb5ea.sv"                                     "$QSYS_SIMDIR/../timing_adapter_1940/sim/ecpri_oran_top_timing_adapter_1940_almb5ea.sv"                                                   
    dict set design_files "ecpri_oran_top_altera_avalon_st_adapter_1920_jd3c5fa.v"                            "$QSYS_SIMDIR/../altera_avalon_st_adapter_1920/sim/ecpri_oran_top_altera_avalon_st_adapter_1920_jd3c5fa.v"                                
    dict set design_files "ecpri_oran_top_error_adapter_1920_tb2uqmq.sv"                                      "$QSYS_SIMDIR/../error_adapter_1920/sim/ecpri_oran_top_error_adapter_1920_tb2uqmq.sv"                                                     
    dict set design_files "ecpri_oran_top_altera_avalon_st_adapter_1920_x2kj6fa.v"                            "$QSYS_SIMDIR/../altera_avalon_st_adapter_1920/sim/ecpri_oran_top_altera_avalon_st_adapter_1920_x2kj6fa.v"                                
    dict set design_files "altera_reset_controller.v"                                                         "$QSYS_SIMDIR/../altera_reset_controller_1922/sim/altera_reset_controller.v"                                                              
    dict set design_files "altera_reset_synchronizer.v"                                                       "$QSYS_SIMDIR/../altera_reset_controller_1922/sim/altera_reset_synchronizer.v"                                                            
    dict set design_files "ecpri_oran_top.v"                                                                  "$QSYS_SIMDIR/ecpri_oran_top.v"                                                                                                           
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
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [ecpri_oran_top_reset_bridge_csr::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [clock_bridge_dsp::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [ecpri_oran_top_mm_bridge_0::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [reset_bridge_dsp::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [ecpri_oran_top_reset_bridge_0::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [ecpri_oran_top_ecpri_oran_0::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $ELAB_OPTIONS
  }
  
  
  proc get_sim_options {SIMULATOR_TOOL_BITNESS} {
    set SIM_OPTIONS ""
    append SIM_OPTIONS [ecpri_oran_top_reset_bridge_csr::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [clock_bridge_dsp::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [ecpri_oran_top_mm_bridge_0::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [reset_bridge_dsp::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [ecpri_oran_top_reset_bridge_0::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [ecpri_oran_top_ecpri_oran_0::get_sim_options $SIMULATOR_TOOL_BITNESS]
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $SIM_OPTIONS
  }
  
  
  proc get_env_variables {SIMULATOR_TOOL_BITNESS} {
    set ENV_VARIABLES [dict create]
    set LD_LIBRARY_PATH [dict create]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [ecpri_oran_top_reset_bridge_csr::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [clock_bridge_dsp::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [ecpri_oran_top_mm_bridge_0::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [reset_bridge_dsp::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [ecpri_oran_top_reset_bridge_0::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [ecpri_oran_top_ecpri_oran_0::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    dict set ENV_VARIABLES "LD_LIBRARY_PATH" $LD_LIBRARY_PATH
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $ENV_VARIABLES
  }
  
  
  proc get_dpi_libraries {QSYS_SIMDIR} {
    set libraries [dict create]
    set libraries [dict merge $libraries [ecpri_oran_top_reset_bridge_csr::get_dpi_libraries "$QSYS_SIMDIR/../../ip/ecpri_oran_top/ecpri_oran_top_reset_bridge_csr/sim/"]]
    set libraries [dict merge $libraries [clock_bridge_dsp::get_dpi_libraries "$QSYS_SIMDIR/../../ip/ecpri_oran_top/clock_bridge_dsp/sim/"]]
    set libraries [dict merge $libraries [ecpri_oran_top_mm_bridge_0::get_dpi_libraries "$QSYS_SIMDIR/../../ip/ecpri_oran_top/ecpri_oran_top_mm_bridge_0/sim/"]]
    set libraries [dict merge $libraries [reset_bridge_dsp::get_dpi_libraries "$QSYS_SIMDIR/../../ip/ecpri_oran_top/reset_bridge_dsp/sim/"]]
    set libraries [dict merge $libraries [ecpri_oran_top_reset_bridge_0::get_dpi_libraries "$QSYS_SIMDIR/../../ip/ecpri_oran_top/ecpri_oran_top_reset_bridge_0/sim/"]]
    set libraries [dict merge $libraries [ecpri_oran_top_ecpri_oran_0::get_dpi_libraries "$QSYS_SIMDIR/../../ip/ecpri_oran_top/ecpri_oran_top_ecpri_oran_0/sim/"]]
    
    return $libraries
  }
  
}
