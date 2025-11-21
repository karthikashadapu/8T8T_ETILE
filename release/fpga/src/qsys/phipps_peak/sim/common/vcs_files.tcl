source [file join [file dirname [info script]] ./../../../ip/phipps_peak/phipps_peak_reset_bridge_csr/sim/common/vcs_files.tcl]
source [file join [file dirname [info script]] ./../../../ecpri_oran_top/sim/common/vcs_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/phipps_peak/phipps_peak_clock_bridge_csr/sim/common/vcs_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/phipps_peak/phipps_peak_clock_bridge_eth/sim/common/vcs_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/phipps_peak/phipps_peak_reset_bridge_eth/sim/common/vcs_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/phipps_peak/rst_bridge_ecpri/sim/common/vcs_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/phipps_peak/phipps_peak_clock_bridge_dsp/sim/common/vcs_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/phipps_peak/phipps_peak_reset_bridge_dsp/sim/common/vcs_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/phipps_peak/phipps_peak_signal_replicator_0/sim/common/vcs_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/phipps_peak/phipps_peak_h2f_lw_bridge/sim/common/vcs_files.tcl]
source [file join [file dirname [info script]] ./../../../lphy_ss_top/sim/common/vcs_files.tcl]
source [file join [file dirname [info script]] ./../../../dxc_ss_top/sim/common/vcs_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/phipps_peak/phipps_peak_clock_bridge_ecpri_tx/sim/common/vcs_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/phipps_peak/phipps_peak_h2f_bridge/sim/common/vcs_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/phipps_peak/phipps_peak_clock_bridge_ecpri_rx/sim/common/vcs_files.tcl]

namespace eval phipps_peak {
  proc get_memory_files {QSYS_SIMDIR} {
    set memory_files [list]
    set memory_files [concat $memory_files [phipps_peak_reset_bridge_csr::get_memory_files "$QSYS_SIMDIR/../../ip/phipps_peak/phipps_peak_reset_bridge_csr/sim/"]]
    set memory_files [concat $memory_files [ecpri_oran_top::get_memory_files "$QSYS_SIMDIR/../../ecpri_oran_top/sim/"]]
    set memory_files [concat $memory_files [phipps_peak_clock_bridge_csr::get_memory_files "$QSYS_SIMDIR/../../ip/phipps_peak/phipps_peak_clock_bridge_csr/sim/"]]
    set memory_files [concat $memory_files [phipps_peak_clock_bridge_eth::get_memory_files "$QSYS_SIMDIR/../../ip/phipps_peak/phipps_peak_clock_bridge_eth/sim/"]]
    set memory_files [concat $memory_files [phipps_peak_reset_bridge_eth::get_memory_files "$QSYS_SIMDIR/../../ip/phipps_peak/phipps_peak_reset_bridge_eth/sim/"]]
    set memory_files [concat $memory_files [rst_bridge_ecpri::get_memory_files "$QSYS_SIMDIR/../../ip/phipps_peak/rst_bridge_ecpri/sim/"]]
    set memory_files [concat $memory_files [phipps_peak_clock_bridge_dsp::get_memory_files "$QSYS_SIMDIR/../../ip/phipps_peak/phipps_peak_clock_bridge_dsp/sim/"]]
    set memory_files [concat $memory_files [phipps_peak_reset_bridge_dsp::get_memory_files "$QSYS_SIMDIR/../../ip/phipps_peak/phipps_peak_reset_bridge_dsp/sim/"]]
    set memory_files [concat $memory_files [phipps_peak_signal_replicator_0::get_memory_files "$QSYS_SIMDIR/../../ip/phipps_peak/phipps_peak_signal_replicator_0/sim/"]]
    set memory_files [concat $memory_files [phipps_peak_h2f_lw_bridge::get_memory_files "$QSYS_SIMDIR/../../ip/phipps_peak/phipps_peak_h2f_lw_bridge/sim/"]]
    set memory_files [concat $memory_files [lphy_ss_top::get_memory_files "$QSYS_SIMDIR/../../lphy_ss_top/sim/"]]
    set memory_files [concat $memory_files [dxc_ss_top::get_memory_files "$QSYS_SIMDIR/../../dxc_ss_top/sim/"]]
    set memory_files [concat $memory_files [phipps_peak_clock_bridge_ecpri_tx::get_memory_files "$QSYS_SIMDIR/../../ip/phipps_peak/phipps_peak_clock_bridge_ecpri_tx/sim/"]]
    set memory_files [concat $memory_files [phipps_peak_h2f_bridge::get_memory_files "$QSYS_SIMDIR/../../ip/phipps_peak/phipps_peak_h2f_bridge/sim/"]]
    set memory_files [concat $memory_files [phipps_peak_clock_bridge_ecpri_rx::get_memory_files "$QSYS_SIMDIR/../../ip/phipps_peak/phipps_peak_clock_bridge_ecpri_rx/sim/"]]
    return $memory_files
  }
  
  proc get_common_design_files {QSYS_SIMDIR} {
    set design_files [dict create]
    set design_files [dict merge $design_files [phipps_peak_reset_bridge_csr::get_common_design_files "$QSYS_SIMDIR/../../ip/phipps_peak/phipps_peak_reset_bridge_csr/sim/"]]
    set design_files [dict merge $design_files [ecpri_oran_top::get_common_design_files "$QSYS_SIMDIR/../../ecpri_oran_top/sim/"]]
    set design_files [dict merge $design_files [phipps_peak_clock_bridge_csr::get_common_design_files "$QSYS_SIMDIR/../../ip/phipps_peak/phipps_peak_clock_bridge_csr/sim/"]]
    set design_files [dict merge $design_files [phipps_peak_clock_bridge_eth::get_common_design_files "$QSYS_SIMDIR/../../ip/phipps_peak/phipps_peak_clock_bridge_eth/sim/"]]
    set design_files [dict merge $design_files [phipps_peak_reset_bridge_eth::get_common_design_files "$QSYS_SIMDIR/../../ip/phipps_peak/phipps_peak_reset_bridge_eth/sim/"]]
    set design_files [dict merge $design_files [rst_bridge_ecpri::get_common_design_files "$QSYS_SIMDIR/../../ip/phipps_peak/rst_bridge_ecpri/sim/"]]
    set design_files [dict merge $design_files [phipps_peak_clock_bridge_dsp::get_common_design_files "$QSYS_SIMDIR/../../ip/phipps_peak/phipps_peak_clock_bridge_dsp/sim/"]]
    set design_files [dict merge $design_files [phipps_peak_reset_bridge_dsp::get_common_design_files "$QSYS_SIMDIR/../../ip/phipps_peak/phipps_peak_reset_bridge_dsp/sim/"]]
    set design_files [dict merge $design_files [phipps_peak_signal_replicator_0::get_common_design_files "$QSYS_SIMDIR/../../ip/phipps_peak/phipps_peak_signal_replicator_0/sim/"]]
    set design_files [dict merge $design_files [phipps_peak_h2f_lw_bridge::get_common_design_files "$QSYS_SIMDIR/../../ip/phipps_peak/phipps_peak_h2f_lw_bridge/sim/"]]
    set design_files [dict merge $design_files [lphy_ss_top::get_common_design_files "$QSYS_SIMDIR/../../lphy_ss_top/sim/"]]
    set design_files [dict merge $design_files [dxc_ss_top::get_common_design_files "$QSYS_SIMDIR/../../dxc_ss_top/sim/"]]
    set design_files [dict merge $design_files [phipps_peak_clock_bridge_ecpri_tx::get_common_design_files "$QSYS_SIMDIR/../../ip/phipps_peak/phipps_peak_clock_bridge_ecpri_tx/sim/"]]
    set design_files [dict merge $design_files [phipps_peak_h2f_bridge::get_common_design_files "$QSYS_SIMDIR/../../ip/phipps_peak/phipps_peak_h2f_bridge/sim/"]]
    set design_files [dict merge $design_files [phipps_peak_clock_bridge_ecpri_rx::get_common_design_files "$QSYS_SIMDIR/../../ip/phipps_peak/phipps_peak_clock_bridge_ecpri_rx/sim/"]]
    return $design_files
  }
  
  proc get_design_files {QSYS_SIMDIR} {
    set design_files [dict create]
    set design_files [dict merge $design_files [phipps_peak_reset_bridge_csr::get_design_files "$QSYS_SIMDIR/../../ip/phipps_peak/phipps_peak_reset_bridge_csr/sim/"]]
    set design_files [dict merge $design_files [ecpri_oran_top::get_design_files "$QSYS_SIMDIR/../../ecpri_oran_top/sim/"]]
    set design_files [dict merge $design_files [phipps_peak_clock_bridge_csr::get_design_files "$QSYS_SIMDIR/../../ip/phipps_peak/phipps_peak_clock_bridge_csr/sim/"]]
    set design_files [dict merge $design_files [phipps_peak_clock_bridge_eth::get_design_files "$QSYS_SIMDIR/../../ip/phipps_peak/phipps_peak_clock_bridge_eth/sim/"]]
    set design_files [dict merge $design_files [phipps_peak_reset_bridge_eth::get_design_files "$QSYS_SIMDIR/../../ip/phipps_peak/phipps_peak_reset_bridge_eth/sim/"]]
    set design_files [dict merge $design_files [rst_bridge_ecpri::get_design_files "$QSYS_SIMDIR/../../ip/phipps_peak/rst_bridge_ecpri/sim/"]]
    set design_files [dict merge $design_files [phipps_peak_clock_bridge_dsp::get_design_files "$QSYS_SIMDIR/../../ip/phipps_peak/phipps_peak_clock_bridge_dsp/sim/"]]
    set design_files [dict merge $design_files [phipps_peak_reset_bridge_dsp::get_design_files "$QSYS_SIMDIR/../../ip/phipps_peak/phipps_peak_reset_bridge_dsp/sim/"]]
    set design_files [dict merge $design_files [phipps_peak_signal_replicator_0::get_design_files "$QSYS_SIMDIR/../../ip/phipps_peak/phipps_peak_signal_replicator_0/sim/"]]
    set design_files [dict merge $design_files [phipps_peak_h2f_lw_bridge::get_design_files "$QSYS_SIMDIR/../../ip/phipps_peak/phipps_peak_h2f_lw_bridge/sim/"]]
    set design_files [dict merge $design_files [lphy_ss_top::get_design_files "$QSYS_SIMDIR/../../lphy_ss_top/sim/"]]
    set design_files [dict merge $design_files [dxc_ss_top::get_design_files "$QSYS_SIMDIR/../../dxc_ss_top/sim/"]]
    set design_files [dict merge $design_files [phipps_peak_clock_bridge_ecpri_tx::get_design_files "$QSYS_SIMDIR/../../ip/phipps_peak/phipps_peak_clock_bridge_ecpri_tx/sim/"]]
    set design_files [dict merge $design_files [phipps_peak_h2f_bridge::get_design_files "$QSYS_SIMDIR/../../ip/phipps_peak/phipps_peak_h2f_bridge/sim/"]]
    set design_files [dict merge $design_files [phipps_peak_clock_bridge_ecpri_rx::get_design_files "$QSYS_SIMDIR/../../ip/phipps_peak/phipps_peak_clock_bridge_ecpri_rx/sim/"]]
    dict set design_files "phipps_peak_altera_merlin_master_translator_192_lykd4la.sv"                     "$QSYS_SIMDIR/../altera_merlin_master_translator_192/sim/phipps_peak_altera_merlin_master_translator_192_lykd4la.sv"                   
    dict set design_files "phipps_peak_altera_merlin_slave_translator_191_x56fcki.sv"                      "$QSYS_SIMDIR/../altera_merlin_slave_translator_191/sim/phipps_peak_altera_merlin_slave_translator_191_x56fcki.sv"                     
    dict set design_files "phipps_peak_altera_merlin_master_agent_1922_fy3n5ti.sv"                         "$QSYS_SIMDIR/../altera_merlin_master_agent_1922/sim/phipps_peak_altera_merlin_master_agent_1922_fy3n5ti.sv"                           
    dict set design_files "phipps_peak_altera_merlin_slave_agent_1921_b6r3djy.sv"                          "$QSYS_SIMDIR/../altera_merlin_slave_agent_1921/sim/phipps_peak_altera_merlin_slave_agent_1921_b6r3djy.sv"                             
    dict set design_files "altera_merlin_burst_uncompressor.sv"                                            "$QSYS_SIMDIR/../altera_merlin_slave_agent_1921/sim/altera_merlin_burst_uncompressor.sv"                                               
    dict set design_files "phipps_peak_altera_avalon_sc_fifo_1932_w27kryi.v"                               "$QSYS_SIMDIR/../altera_avalon_sc_fifo_1932/sim/phipps_peak_altera_avalon_sc_fifo_1932_w27kryi.v"                                      
    dict set design_files "phipps_peak_altera_merlin_router_1921_rgfeqxi.sv"                               "$QSYS_SIMDIR/../altera_merlin_router_1921/sim/phipps_peak_altera_merlin_router_1921_rgfeqxi.sv"                                       
    dict set design_files "phipps_peak_altera_merlin_router_1921_wmekdwi.sv"                               "$QSYS_SIMDIR/../altera_merlin_router_1921/sim/phipps_peak_altera_merlin_router_1921_wmekdwi.sv"                                       
    dict set design_files "phipps_peak_altera_merlin_traffic_limiter_altera_avalon_sc_fifo_1921_3aaowpa.v" "$QSYS_SIMDIR/../altera_merlin_traffic_limiter_1921/sim/phipps_peak_altera_merlin_traffic_limiter_altera_avalon_sc_fifo_1921_3aaowpa.v"
    dict set design_files "altera_merlin_reorder_memory.sv"                                                "$QSYS_SIMDIR/../altera_merlin_traffic_limiter_1921/sim/altera_merlin_reorder_memory.sv"                                               
    dict set design_files "altera_avalon_st_pipeline_base.v"                                               "$QSYS_SIMDIR/../altera_merlin_traffic_limiter_1921/sim/altera_avalon_st_pipeline_base.v"                                              
    dict set design_files "phipps_peak_altera_merlin_traffic_limiter_1921_74hvqpa.sv"                      "$QSYS_SIMDIR/../altera_merlin_traffic_limiter_1921/sim/phipps_peak_altera_merlin_traffic_limiter_1921_74hvqpa.sv"                     
    dict set design_files "phipps_peak_altera_merlin_demultiplexer_1921_e4hkmiy.sv"                        "$QSYS_SIMDIR/../altera_merlin_demultiplexer_1921/sim/phipps_peak_altera_merlin_demultiplexer_1921_e4hkmiy.sv"                         
    dict set design_files "phipps_peak_altera_merlin_multiplexer_1922_5xyj72q.sv"                          "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/phipps_peak_altera_merlin_multiplexer_1922_5xyj72q.sv"                             
    dict set design_files "altera_merlin_arbitrator.sv"                                                    "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/altera_merlin_arbitrator.sv"                                                       
    dict set design_files "phipps_peak_altera_merlin_demultiplexer_1921_6fab5ka.sv"                        "$QSYS_SIMDIR/../altera_merlin_demultiplexer_1921/sim/phipps_peak_altera_merlin_demultiplexer_1921_6fab5ka.sv"                         
    dict set design_files "phipps_peak_altera_merlin_multiplexer_1922_b6avyny.sv"                          "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/phipps_peak_altera_merlin_multiplexer_1922_b6avyny.sv"                             
    dict set design_files "altera_merlin_arbitrator.sv"                                                    "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/altera_merlin_arbitrator.sv"                                                       
    dict set design_files "phipps_peak_altera_mm_interconnect_1920_vtiyxgy.v"                              "$QSYS_SIMDIR/../altera_mm_interconnect_1920/sim/phipps_peak_altera_mm_interconnect_1920_vtiyxgy.v"                                    
    dict set design_files "phipps_peak_altera_merlin_router_1921_jcj72dy.sv"                               "$QSYS_SIMDIR/../altera_merlin_router_1921/sim/phipps_peak_altera_merlin_router_1921_jcj72dy.sv"                                       
    dict set design_files "phipps_peak_altera_merlin_router_1921_4kcw2ra.sv"                               "$QSYS_SIMDIR/../altera_merlin_router_1921/sim/phipps_peak_altera_merlin_router_1921_4kcw2ra.sv"                                       
    dict set design_files "phipps_peak_altera_merlin_router_1921_orooxxa.sv"                               "$QSYS_SIMDIR/../altera_merlin_router_1921/sim/phipps_peak_altera_merlin_router_1921_orooxxa.sv"                                       
    dict set design_files "phipps_peak_altera_merlin_traffic_limiter_altera_avalon_sc_fifo_1921_rspjw2y.v" "$QSYS_SIMDIR/../altera_merlin_traffic_limiter_1921/sim/phipps_peak_altera_merlin_traffic_limiter_altera_avalon_sc_fifo_1921_rspjw2y.v"
    dict set design_files "altera_merlin_reorder_memory.sv"                                                "$QSYS_SIMDIR/../altera_merlin_traffic_limiter_1921/sim/altera_merlin_reorder_memory.sv"                                               
    dict set design_files "altera_avalon_st_pipeline_base.v"                                               "$QSYS_SIMDIR/../altera_merlin_traffic_limiter_1921/sim/altera_avalon_st_pipeline_base.v"                                              
    dict set design_files "phipps_peak_altera_merlin_traffic_limiter_1921_ggluely.sv"                      "$QSYS_SIMDIR/../altera_merlin_traffic_limiter_1921/sim/phipps_peak_altera_merlin_traffic_limiter_1921_ggluely.sv"                     
    dict set design_files "phipps_peak_altera_merlin_demultiplexer_1921_54oeqsi.sv"                        "$QSYS_SIMDIR/../altera_merlin_demultiplexer_1921/sim/phipps_peak_altera_merlin_demultiplexer_1921_54oeqsi.sv"                         
    dict set design_files "phipps_peak_altera_merlin_multiplexer_1922_cdmpy6i.sv"                          "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/phipps_peak_altera_merlin_multiplexer_1922_cdmpy6i.sv"                             
    dict set design_files "altera_merlin_arbitrator.sv"                                                    "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/altera_merlin_arbitrator.sv"                                                       
    dict set design_files "phipps_peak_altera_merlin_demultiplexer_1921_qdvqwaa.sv"                        "$QSYS_SIMDIR/../altera_merlin_demultiplexer_1921/sim/phipps_peak_altera_merlin_demultiplexer_1921_qdvqwaa.sv"                         
    dict set design_files "phipps_peak_altera_merlin_multiplexer_1922_afnh3sy.sv"                          "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/phipps_peak_altera_merlin_multiplexer_1922_afnh3sy.sv"                             
    dict set design_files "altera_merlin_arbitrator.sv"                                                    "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/altera_merlin_arbitrator.sv"                                                       
    dict set design_files "phipps_peak_altera_merlin_width_adapter_1940_i2frn3q.sv"                        "$QSYS_SIMDIR/../altera_merlin_width_adapter_1940/sim/phipps_peak_altera_merlin_width_adapter_1940_i2frn3q.sv"                         
    dict set design_files "altera_merlin_address_alignment.sv"                                             "$QSYS_SIMDIR/../altera_merlin_width_adapter_1940/sim/altera_merlin_address_alignment.sv"                                              
    dict set design_files "altera_merlin_burst_uncompressor.sv"                                            "$QSYS_SIMDIR/../altera_merlin_width_adapter_1940/sim/altera_merlin_burst_uncompressor.sv"                                             
    dict set design_files "phipps_peak_altera_merlin_width_adapter_1940_3dl3oli.sv"                        "$QSYS_SIMDIR/../altera_merlin_width_adapter_1940/sim/phipps_peak_altera_merlin_width_adapter_1940_3dl3oli.sv"                         
    dict set design_files "altera_merlin_address_alignment.sv"                                             "$QSYS_SIMDIR/../altera_merlin_width_adapter_1940/sim/altera_merlin_address_alignment.sv"                                              
    dict set design_files "altera_merlin_burst_uncompressor.sv"                                            "$QSYS_SIMDIR/../altera_merlin_width_adapter_1940/sim/altera_merlin_burst_uncompressor.sv"                                             
    dict set design_files "phipps_peak_altera_mm_interconnect_1920_tz5bhqi.v"                              "$QSYS_SIMDIR/../altera_mm_interconnect_1920/sim/phipps_peak_altera_mm_interconnect_1920_tz5bhqi.v"                                    
    dict set design_files "altera_reset_controller.v"                                                      "$QSYS_SIMDIR/../altera_reset_controller_1922/sim/altera_reset_controller.v"                                                           
    dict set design_files "altera_reset_synchronizer.v"                                                    "$QSYS_SIMDIR/../altera_reset_controller_1922/sim/altera_reset_synchronizer.v"                                                         
    dict set design_files "phipps_peak.v"                                                                  "$QSYS_SIMDIR/phipps_peak.v"                                                                                                           
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
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [phipps_peak_reset_bridge_csr::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [ecpri_oran_top::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [phipps_peak_clock_bridge_csr::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [phipps_peak_clock_bridge_eth::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [phipps_peak_reset_bridge_eth::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [rst_bridge_ecpri::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [phipps_peak_clock_bridge_dsp::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [phipps_peak_reset_bridge_dsp::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [phipps_peak_signal_replicator_0::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [phipps_peak_h2f_lw_bridge::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [lphy_ss_top::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [dxc_ss_top::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [phipps_peak_clock_bridge_ecpri_tx::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [phipps_peak_h2f_bridge::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [phipps_peak_clock_bridge_ecpri_rx::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $ELAB_OPTIONS
  }
  
  
  proc get_sim_options {SIMULATOR_TOOL_BITNESS} {
    set SIM_OPTIONS ""
    append SIM_OPTIONS [phipps_peak_reset_bridge_csr::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [ecpri_oran_top::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [phipps_peak_clock_bridge_csr::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [phipps_peak_clock_bridge_eth::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [phipps_peak_reset_bridge_eth::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [rst_bridge_ecpri::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [phipps_peak_clock_bridge_dsp::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [phipps_peak_reset_bridge_dsp::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [phipps_peak_signal_replicator_0::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [phipps_peak_h2f_lw_bridge::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [lphy_ss_top::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [dxc_ss_top::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [phipps_peak_clock_bridge_ecpri_tx::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [phipps_peak_h2f_bridge::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [phipps_peak_clock_bridge_ecpri_rx::get_sim_options $SIMULATOR_TOOL_BITNESS]
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $SIM_OPTIONS
  }
  
  
  proc get_env_variables {SIMULATOR_TOOL_BITNESS} {
    set ENV_VARIABLES [dict create]
    set LD_LIBRARY_PATH [dict create]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [phipps_peak_reset_bridge_csr::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [ecpri_oran_top::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [phipps_peak_clock_bridge_csr::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [phipps_peak_clock_bridge_eth::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [phipps_peak_reset_bridge_eth::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [rst_bridge_ecpri::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [phipps_peak_clock_bridge_dsp::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [phipps_peak_reset_bridge_dsp::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [phipps_peak_signal_replicator_0::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [phipps_peak_h2f_lw_bridge::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [lphy_ss_top::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [dxc_ss_top::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [phipps_peak_clock_bridge_ecpri_tx::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [phipps_peak_h2f_bridge::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [phipps_peak_clock_bridge_ecpri_rx::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    dict set ENV_VARIABLES "LD_LIBRARY_PATH" $LD_LIBRARY_PATH
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $ENV_VARIABLES
  }
  
  
  proc get_dpi_libraries {QSYS_SIMDIR} {
    set libraries [dict create]
    set libraries [dict merge $libraries [phipps_peak_reset_bridge_csr::get_dpi_libraries "$QSYS_SIMDIR/../../ip/phipps_peak/phipps_peak_reset_bridge_csr/sim/"]]
    set libraries [dict merge $libraries [ecpri_oran_top::get_dpi_libraries "$QSYS_SIMDIR/../../ecpri_oran_top/sim/"]]
    set libraries [dict merge $libraries [phipps_peak_clock_bridge_csr::get_dpi_libraries "$QSYS_SIMDIR/../../ip/phipps_peak/phipps_peak_clock_bridge_csr/sim/"]]
    set libraries [dict merge $libraries [phipps_peak_clock_bridge_eth::get_dpi_libraries "$QSYS_SIMDIR/../../ip/phipps_peak/phipps_peak_clock_bridge_eth/sim/"]]
    set libraries [dict merge $libraries [phipps_peak_reset_bridge_eth::get_dpi_libraries "$QSYS_SIMDIR/../../ip/phipps_peak/phipps_peak_reset_bridge_eth/sim/"]]
    set libraries [dict merge $libraries [rst_bridge_ecpri::get_dpi_libraries "$QSYS_SIMDIR/../../ip/phipps_peak/rst_bridge_ecpri/sim/"]]
    set libraries [dict merge $libraries [phipps_peak_clock_bridge_dsp::get_dpi_libraries "$QSYS_SIMDIR/../../ip/phipps_peak/phipps_peak_clock_bridge_dsp/sim/"]]
    set libraries [dict merge $libraries [phipps_peak_reset_bridge_dsp::get_dpi_libraries "$QSYS_SIMDIR/../../ip/phipps_peak/phipps_peak_reset_bridge_dsp/sim/"]]
    set libraries [dict merge $libraries [phipps_peak_signal_replicator_0::get_dpi_libraries "$QSYS_SIMDIR/../../ip/phipps_peak/phipps_peak_signal_replicator_0/sim/"]]
    set libraries [dict merge $libraries [phipps_peak_h2f_lw_bridge::get_dpi_libraries "$QSYS_SIMDIR/../../ip/phipps_peak/phipps_peak_h2f_lw_bridge/sim/"]]
    set libraries [dict merge $libraries [lphy_ss_top::get_dpi_libraries "$QSYS_SIMDIR/../../lphy_ss_top/sim/"]]
    set libraries [dict merge $libraries [dxc_ss_top::get_dpi_libraries "$QSYS_SIMDIR/../../dxc_ss_top/sim/"]]
    set libraries [dict merge $libraries [phipps_peak_clock_bridge_ecpri_tx::get_dpi_libraries "$QSYS_SIMDIR/../../ip/phipps_peak/phipps_peak_clock_bridge_ecpri_tx/sim/"]]
    set libraries [dict merge $libraries [phipps_peak_h2f_bridge::get_dpi_libraries "$QSYS_SIMDIR/../../ip/phipps_peak/phipps_peak_h2f_bridge/sim/"]]
    set libraries [dict merge $libraries [phipps_peak_clock_bridge_ecpri_rx::get_dpi_libraries "$QSYS_SIMDIR/../../ip/phipps_peak/phipps_peak_clock_bridge_ecpri_rx/sim/"]]
    
    return $libraries
  }
  
}
