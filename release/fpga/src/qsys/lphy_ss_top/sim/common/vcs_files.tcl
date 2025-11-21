source [file join [file dirname [info script]] ./../../../ip/lphy_ss_top/lphy_ss_top_h2f_bridge/sim/common/vcs_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/lphy_ss_top/lphy_ss_reset_csr/sim/common/vcs_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/lphy_ss_top/lphy_ss_top_mm_bridge_0/sim/common/vcs_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/lphy_ss_top/lphy_ss_reset_xran_dl/sim/common/vcs_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/lphy_ss_top/lphy_ss_reset_xran_ul/sim/common/vcs_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/lphy_ss_top/lphy_ss_lphy_ss_top/sim/common/vcs_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/lphy_ss_top/lphy_ss_clk_csr/sim/common/vcs_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/lphy_ss_top/lphy_ss_clk_xran_ul/sim/common/vcs_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/lphy_ss_top/lphy_ss_clk_dsp/sim/common/vcs_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/lphy_ss_top/lphy_ss_clk_xran_dl/sim/common/vcs_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/lphy_ss_top/lphy_ss_reset_dsp/sim/common/vcs_files.tcl]

namespace eval lphy_ss_top {
  proc get_memory_files {QSYS_SIMDIR} {
    set memory_files [list]
    set memory_files [concat $memory_files [lphy_ss_top_h2f_bridge::get_memory_files "$QSYS_SIMDIR/../../ip/lphy_ss_top/lphy_ss_top_h2f_bridge/sim/"]]
    set memory_files [concat $memory_files [lphy_ss_reset_csr::get_memory_files "$QSYS_SIMDIR/../../ip/lphy_ss_top/lphy_ss_reset_csr/sim/"]]
    set memory_files [concat $memory_files [lphy_ss_top_mm_bridge_0::get_memory_files "$QSYS_SIMDIR/../../ip/lphy_ss_top/lphy_ss_top_mm_bridge_0/sim/"]]
    set memory_files [concat $memory_files [lphy_ss_reset_xran_dl::get_memory_files "$QSYS_SIMDIR/../../ip/lphy_ss_top/lphy_ss_reset_xran_dl/sim/"]]
    set memory_files [concat $memory_files [lphy_ss_reset_xran_ul::get_memory_files "$QSYS_SIMDIR/../../ip/lphy_ss_top/lphy_ss_reset_xran_ul/sim/"]]
    set memory_files [concat $memory_files [lphy_ss_lphy_ss_top::get_memory_files "$QSYS_SIMDIR/../../ip/lphy_ss_top/lphy_ss_lphy_ss_top/sim/"]]
    set memory_files [concat $memory_files [lphy_ss_clk_csr::get_memory_files "$QSYS_SIMDIR/../../ip/lphy_ss_top/lphy_ss_clk_csr/sim/"]]
    set memory_files [concat $memory_files [lphy_ss_clk_xran_ul::get_memory_files "$QSYS_SIMDIR/../../ip/lphy_ss_top/lphy_ss_clk_xran_ul/sim/"]]
    set memory_files [concat $memory_files [lphy_ss_clk_dsp::get_memory_files "$QSYS_SIMDIR/../../ip/lphy_ss_top/lphy_ss_clk_dsp/sim/"]]
    set memory_files [concat $memory_files [lphy_ss_clk_xran_dl::get_memory_files "$QSYS_SIMDIR/../../ip/lphy_ss_top/lphy_ss_clk_xran_dl/sim/"]]
    set memory_files [concat $memory_files [lphy_ss_reset_dsp::get_memory_files "$QSYS_SIMDIR/../../ip/lphy_ss_top/lphy_ss_reset_dsp/sim/"]]
    return $memory_files
  }
  
  proc get_common_design_files {QSYS_SIMDIR} {
    set design_files [dict create]
    set design_files [dict merge $design_files [lphy_ss_top_h2f_bridge::get_common_design_files "$QSYS_SIMDIR/../../ip/lphy_ss_top/lphy_ss_top_h2f_bridge/sim/"]]
    set design_files [dict merge $design_files [lphy_ss_reset_csr::get_common_design_files "$QSYS_SIMDIR/../../ip/lphy_ss_top/lphy_ss_reset_csr/sim/"]]
    set design_files [dict merge $design_files [lphy_ss_top_mm_bridge_0::get_common_design_files "$QSYS_SIMDIR/../../ip/lphy_ss_top/lphy_ss_top_mm_bridge_0/sim/"]]
    set design_files [dict merge $design_files [lphy_ss_reset_xran_dl::get_common_design_files "$QSYS_SIMDIR/../../ip/lphy_ss_top/lphy_ss_reset_xran_dl/sim/"]]
    set design_files [dict merge $design_files [lphy_ss_reset_xran_ul::get_common_design_files "$QSYS_SIMDIR/../../ip/lphy_ss_top/lphy_ss_reset_xran_ul/sim/"]]
    set design_files [dict merge $design_files [lphy_ss_lphy_ss_top::get_common_design_files "$QSYS_SIMDIR/../../ip/lphy_ss_top/lphy_ss_lphy_ss_top/sim/"]]
    set design_files [dict merge $design_files [lphy_ss_clk_csr::get_common_design_files "$QSYS_SIMDIR/../../ip/lphy_ss_top/lphy_ss_clk_csr/sim/"]]
    set design_files [dict merge $design_files [lphy_ss_clk_xran_ul::get_common_design_files "$QSYS_SIMDIR/../../ip/lphy_ss_top/lphy_ss_clk_xran_ul/sim/"]]
    set design_files [dict merge $design_files [lphy_ss_clk_dsp::get_common_design_files "$QSYS_SIMDIR/../../ip/lphy_ss_top/lphy_ss_clk_dsp/sim/"]]
    set design_files [dict merge $design_files [lphy_ss_clk_xran_dl::get_common_design_files "$QSYS_SIMDIR/../../ip/lphy_ss_top/lphy_ss_clk_xran_dl/sim/"]]
    set design_files [dict merge $design_files [lphy_ss_reset_dsp::get_common_design_files "$QSYS_SIMDIR/../../ip/lphy_ss_top/lphy_ss_reset_dsp/sim/"]]
    return $design_files
  }
  
  proc get_design_files {QSYS_SIMDIR} {
    set design_files [dict create]
    set design_files [dict merge $design_files [lphy_ss_top_h2f_bridge::get_design_files "$QSYS_SIMDIR/../../ip/lphy_ss_top/lphy_ss_top_h2f_bridge/sim/"]]
    set design_files [dict merge $design_files [lphy_ss_reset_csr::get_design_files "$QSYS_SIMDIR/../../ip/lphy_ss_top/lphy_ss_reset_csr/sim/"]]
    set design_files [dict merge $design_files [lphy_ss_top_mm_bridge_0::get_design_files "$QSYS_SIMDIR/../../ip/lphy_ss_top/lphy_ss_top_mm_bridge_0/sim/"]]
    set design_files [dict merge $design_files [lphy_ss_reset_xran_dl::get_design_files "$QSYS_SIMDIR/../../ip/lphy_ss_top/lphy_ss_reset_xran_dl/sim/"]]
    set design_files [dict merge $design_files [lphy_ss_reset_xran_ul::get_design_files "$QSYS_SIMDIR/../../ip/lphy_ss_top/lphy_ss_reset_xran_ul/sim/"]]
    set design_files [dict merge $design_files [lphy_ss_lphy_ss_top::get_design_files "$QSYS_SIMDIR/../../ip/lphy_ss_top/lphy_ss_lphy_ss_top/sim/"]]
    set design_files [dict merge $design_files [lphy_ss_clk_csr::get_design_files "$QSYS_SIMDIR/../../ip/lphy_ss_top/lphy_ss_clk_csr/sim/"]]
    set design_files [dict merge $design_files [lphy_ss_clk_xran_ul::get_design_files "$QSYS_SIMDIR/../../ip/lphy_ss_top/lphy_ss_clk_xran_ul/sim/"]]
    set design_files [dict merge $design_files [lphy_ss_clk_dsp::get_design_files "$QSYS_SIMDIR/../../ip/lphy_ss_top/lphy_ss_clk_dsp/sim/"]]
    set design_files [dict merge $design_files [lphy_ss_clk_xran_dl::get_design_files "$QSYS_SIMDIR/../../ip/lphy_ss_top/lphy_ss_clk_xran_dl/sim/"]]
    set design_files [dict merge $design_files [lphy_ss_reset_dsp::get_design_files "$QSYS_SIMDIR/../../ip/lphy_ss_top/lphy_ss_reset_dsp/sim/"]]
    dict set design_files "lphy_ss_top_altera_merlin_master_translator_192_lykd4la.sv"                     "$QSYS_SIMDIR/../altera_merlin_master_translator_192/sim/lphy_ss_top_altera_merlin_master_translator_192_lykd4la.sv"                   
    dict set design_files "lphy_ss_top_altera_merlin_slave_translator_191_x56fcki.sv"                      "$QSYS_SIMDIR/../altera_merlin_slave_translator_191/sim/lphy_ss_top_altera_merlin_slave_translator_191_x56fcki.sv"                     
    dict set design_files "lphy_ss_top_altera_merlin_master_agent_1922_fy3n5ti.sv"                         "$QSYS_SIMDIR/../altera_merlin_master_agent_1922/sim/lphy_ss_top_altera_merlin_master_agent_1922_fy3n5ti.sv"                           
    dict set design_files "lphy_ss_top_altera_merlin_slave_agent_1921_b6r3djy.sv"                          "$QSYS_SIMDIR/../altera_merlin_slave_agent_1921/sim/lphy_ss_top_altera_merlin_slave_agent_1921_b6r3djy.sv"                             
    dict set design_files "altera_merlin_burst_uncompressor.sv"                                            "$QSYS_SIMDIR/../altera_merlin_slave_agent_1921/sim/altera_merlin_burst_uncompressor.sv"                                               
    dict set design_files "lphy_ss_top_altera_avalon_sc_fifo_1932_w27kryi.v"                               "$QSYS_SIMDIR/../altera_avalon_sc_fifo_1932/sim/lphy_ss_top_altera_avalon_sc_fifo_1932_w27kryi.v"                                      
    dict set design_files "lphy_ss_top_altera_merlin_router_1921_4q5zbjy.sv"                               "$QSYS_SIMDIR/../altera_merlin_router_1921/sim/lphy_ss_top_altera_merlin_router_1921_4q5zbjy.sv"                                       
    dict set design_files "lphy_ss_top_altera_merlin_router_1921_aeiraia.sv"                               "$QSYS_SIMDIR/../altera_merlin_router_1921/sim/lphy_ss_top_altera_merlin_router_1921_aeiraia.sv"                                       
    dict set design_files "lphy_ss_top_altera_merlin_traffic_limiter_altera_avalon_sc_fifo_1921_wq7ojcq.v" "$QSYS_SIMDIR/../altera_merlin_traffic_limiter_1921/sim/lphy_ss_top_altera_merlin_traffic_limiter_altera_avalon_sc_fifo_1921_wq7ojcq.v"
    dict set design_files "altera_merlin_reorder_memory.sv"                                                "$QSYS_SIMDIR/../altera_merlin_traffic_limiter_1921/sim/altera_merlin_reorder_memory.sv"                                               
    dict set design_files "altera_avalon_st_pipeline_base.v"                                               "$QSYS_SIMDIR/../altera_merlin_traffic_limiter_1921/sim/altera_avalon_st_pipeline_base.v"                                              
    dict set design_files "lphy_ss_top_altera_merlin_traffic_limiter_1921_js7yfey.sv"                      "$QSYS_SIMDIR/../altera_merlin_traffic_limiter_1921/sim/lphy_ss_top_altera_merlin_traffic_limiter_1921_js7yfey.sv"                     
    dict set design_files "lphy_ss_top_altera_merlin_demultiplexer_1921_rjwt5pi.sv"                        "$QSYS_SIMDIR/../altera_merlin_demultiplexer_1921/sim/lphy_ss_top_altera_merlin_demultiplexer_1921_rjwt5pi.sv"                         
    dict set design_files "lphy_ss_top_altera_merlin_multiplexer_1922_hsyjhvq.sv"                          "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/lphy_ss_top_altera_merlin_multiplexer_1922_hsyjhvq.sv"                             
    dict set design_files "altera_merlin_arbitrator.sv"                                                    "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/altera_merlin_arbitrator.sv"                                                       
    dict set design_files "lphy_ss_top_altera_merlin_demultiplexer_1921_uipdcui.sv"                        "$QSYS_SIMDIR/../altera_merlin_demultiplexer_1921/sim/lphy_ss_top_altera_merlin_demultiplexer_1921_uipdcui.sv"                         
    dict set design_files "lphy_ss_top_altera_merlin_multiplexer_1922_b7phukq.sv"                          "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/lphy_ss_top_altera_merlin_multiplexer_1922_b7phukq.sv"                             
    dict set design_files "altera_merlin_arbitrator.sv"                                                    "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/altera_merlin_arbitrator.sv"                                                       
    dict set design_files "lphy_ss_top_altera_mm_interconnect_1920_zqsa5uq.v"                              "$QSYS_SIMDIR/../altera_mm_interconnect_1920/sim/lphy_ss_top_altera_mm_interconnect_1920_zqsa5uq.v"                                    
    dict set design_files "lphy_ss_top_altera_merlin_router_1921_pwcz6vy.sv"                               "$QSYS_SIMDIR/../altera_merlin_router_1921/sim/lphy_ss_top_altera_merlin_router_1921_pwcz6vy.sv"                                       
    dict set design_files "lphy_ss_top_altera_merlin_router_1921_ux5fcni.sv"                               "$QSYS_SIMDIR/../altera_merlin_router_1921/sim/lphy_ss_top_altera_merlin_router_1921_ux5fcni.sv"                                       
    dict set design_files "lphy_ss_top_altera_merlin_traffic_limiter_altera_avalon_sc_fifo_1921_rspjw2y.v" "$QSYS_SIMDIR/../altera_merlin_traffic_limiter_1921/sim/lphy_ss_top_altera_merlin_traffic_limiter_altera_avalon_sc_fifo_1921_rspjw2y.v"
    dict set design_files "altera_merlin_reorder_memory.sv"                                                "$QSYS_SIMDIR/../altera_merlin_traffic_limiter_1921/sim/altera_merlin_reorder_memory.sv"                                               
    dict set design_files "altera_avalon_st_pipeline_base.v"                                               "$QSYS_SIMDIR/../altera_merlin_traffic_limiter_1921/sim/altera_avalon_st_pipeline_base.v"                                              
    dict set design_files "lphy_ss_top_altera_merlin_traffic_limiter_1921_ggluely.sv"                      "$QSYS_SIMDIR/../altera_merlin_traffic_limiter_1921/sim/lphy_ss_top_altera_merlin_traffic_limiter_1921_ggluely.sv"                     
    dict set design_files "lphy_ss_top_altera_merlin_demultiplexer_1921_25kyafy.sv"                        "$QSYS_SIMDIR/../altera_merlin_demultiplexer_1921/sim/lphy_ss_top_altera_merlin_demultiplexer_1921_25kyafy.sv"                         
    dict set design_files "lphy_ss_top_altera_merlin_multiplexer_1922_2xgiedi.sv"                          "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/lphy_ss_top_altera_merlin_multiplexer_1922_2xgiedi.sv"                             
    dict set design_files "altera_merlin_arbitrator.sv"                                                    "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/altera_merlin_arbitrator.sv"                                                       
    dict set design_files "lphy_ss_top_altera_merlin_demultiplexer_1921_2tunami.sv"                        "$QSYS_SIMDIR/../altera_merlin_demultiplexer_1921/sim/lphy_ss_top_altera_merlin_demultiplexer_1921_2tunami.sv"                         
    dict set design_files "lphy_ss_top_altera_merlin_multiplexer_1922_gs3zk2a.sv"                          "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/lphy_ss_top_altera_merlin_multiplexer_1922_gs3zk2a.sv"                             
    dict set design_files "altera_merlin_arbitrator.sv"                                                    "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/altera_merlin_arbitrator.sv"                                                       
    dict set design_files "lphy_ss_top_altera_mm_interconnect_1920_sjiabna.v"                              "$QSYS_SIMDIR/../altera_mm_interconnect_1920/sim/lphy_ss_top_altera_mm_interconnect_1920_sjiabna.v"                                    
    dict set design_files "altera_reset_controller.v"                                                      "$QSYS_SIMDIR/../altera_reset_controller_1922/sim/altera_reset_controller.v"                                                           
    dict set design_files "altera_reset_synchronizer.v"                                                    "$QSYS_SIMDIR/../altera_reset_controller_1922/sim/altera_reset_synchronizer.v"                                                         
    dict set design_files "lphy_ss_top.v"                                                                  "$QSYS_SIMDIR/lphy_ss_top.v"                                                                                                           
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
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [lphy_ss_top_h2f_bridge::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [lphy_ss_reset_csr::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [lphy_ss_top_mm_bridge_0::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [lphy_ss_reset_xran_dl::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [lphy_ss_reset_xran_ul::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [lphy_ss_lphy_ss_top::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [lphy_ss_clk_csr::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [lphy_ss_clk_xran_ul::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [lphy_ss_clk_dsp::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [lphy_ss_clk_xran_dl::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [lphy_ss_reset_dsp::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $ELAB_OPTIONS
  }
  
  
  proc get_sim_options {SIMULATOR_TOOL_BITNESS} {
    set SIM_OPTIONS ""
    append SIM_OPTIONS [lphy_ss_top_h2f_bridge::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [lphy_ss_reset_csr::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [lphy_ss_top_mm_bridge_0::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [lphy_ss_reset_xran_dl::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [lphy_ss_reset_xran_ul::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [lphy_ss_lphy_ss_top::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [lphy_ss_clk_csr::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [lphy_ss_clk_xran_ul::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [lphy_ss_clk_dsp::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [lphy_ss_clk_xran_dl::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [lphy_ss_reset_dsp::get_sim_options $SIMULATOR_TOOL_BITNESS]
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $SIM_OPTIONS
  }
  
  
  proc get_env_variables {SIMULATOR_TOOL_BITNESS} {
    set ENV_VARIABLES [dict create]
    set LD_LIBRARY_PATH [dict create]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [lphy_ss_top_h2f_bridge::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [lphy_ss_reset_csr::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [lphy_ss_top_mm_bridge_0::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [lphy_ss_reset_xran_dl::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [lphy_ss_reset_xran_ul::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [lphy_ss_lphy_ss_top::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [lphy_ss_clk_csr::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [lphy_ss_clk_xran_ul::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [lphy_ss_clk_dsp::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [lphy_ss_clk_xran_dl::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [lphy_ss_reset_dsp::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    dict set ENV_VARIABLES "LD_LIBRARY_PATH" $LD_LIBRARY_PATH
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $ENV_VARIABLES
  }
  
  
  proc get_dpi_libraries {QSYS_SIMDIR} {
    set libraries [dict create]
    set libraries [dict merge $libraries [lphy_ss_top_h2f_bridge::get_dpi_libraries "$QSYS_SIMDIR/../../ip/lphy_ss_top/lphy_ss_top_h2f_bridge/sim/"]]
    set libraries [dict merge $libraries [lphy_ss_reset_csr::get_dpi_libraries "$QSYS_SIMDIR/../../ip/lphy_ss_top/lphy_ss_reset_csr/sim/"]]
    set libraries [dict merge $libraries [lphy_ss_top_mm_bridge_0::get_dpi_libraries "$QSYS_SIMDIR/../../ip/lphy_ss_top/lphy_ss_top_mm_bridge_0/sim/"]]
    set libraries [dict merge $libraries [lphy_ss_reset_xran_dl::get_dpi_libraries "$QSYS_SIMDIR/../../ip/lphy_ss_top/lphy_ss_reset_xran_dl/sim/"]]
    set libraries [dict merge $libraries [lphy_ss_reset_xran_ul::get_dpi_libraries "$QSYS_SIMDIR/../../ip/lphy_ss_top/lphy_ss_reset_xran_ul/sim/"]]
    set libraries [dict merge $libraries [lphy_ss_lphy_ss_top::get_dpi_libraries "$QSYS_SIMDIR/../../ip/lphy_ss_top/lphy_ss_lphy_ss_top/sim/"]]
    set libraries [dict merge $libraries [lphy_ss_clk_csr::get_dpi_libraries "$QSYS_SIMDIR/../../ip/lphy_ss_top/lphy_ss_clk_csr/sim/"]]
    set libraries [dict merge $libraries [lphy_ss_clk_xran_ul::get_dpi_libraries "$QSYS_SIMDIR/../../ip/lphy_ss_top/lphy_ss_clk_xran_ul/sim/"]]
    set libraries [dict merge $libraries [lphy_ss_clk_dsp::get_dpi_libraries "$QSYS_SIMDIR/../../ip/lphy_ss_top/lphy_ss_clk_dsp/sim/"]]
    set libraries [dict merge $libraries [lphy_ss_clk_xran_dl::get_dpi_libraries "$QSYS_SIMDIR/../../ip/lphy_ss_top/lphy_ss_clk_xran_dl/sim/"]]
    set libraries [dict merge $libraries [lphy_ss_reset_dsp::get_dpi_libraries "$QSYS_SIMDIR/../../ip/lphy_ss_top/lphy_ss_reset_dsp/sim/"]]
    
    return $libraries
  }
  
}
