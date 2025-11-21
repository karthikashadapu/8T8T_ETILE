source [file join [file dirname [info script]] ./../../../ip/dxc_ss_top/clk_bridge_dsp/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/dxc_ss_top/dxc_ss_top_mm_bridge_0/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/dxc_ss_top/rst_bridge_csr/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/dxc_ss_top/dxc_ss_top_dxc_ss_0/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/dxc_ss_top/rst_bridge_dsp/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/dxc_ss_top/clk_bridge_csr/sim/common/modelsim_files.tcl]

namespace eval dxc_ss_top {
  proc get_design_libraries {} {
    set libraries [dict create]
    set libraries [dict merge $libraries [clk_bridge_dsp::get_design_libraries]]
    set libraries [dict merge $libraries [dxc_ss_top_mm_bridge_0::get_design_libraries]]
    set libraries [dict merge $libraries [rst_bridge_csr::get_design_libraries]]
    set libraries [dict merge $libraries [dxc_ss_top_dxc_ss_0::get_design_libraries]]
    set libraries [dict merge $libraries [rst_bridge_dsp::get_design_libraries]]
    set libraries [dict merge $libraries [clk_bridge_csr::get_design_libraries]]
    dict set libraries altera_merlin_master_translator_192 1
    dict set libraries altera_merlin_slave_translator_191  1
    dict set libraries altera_merlin_master_agent_1922     1
    dict set libraries altera_merlin_slave_agent_1921      1
    dict set libraries altera_avalon_sc_fifo_1932          1
    dict set libraries altera_merlin_router_1921           1
    dict set libraries altera_merlin_traffic_limiter_1921  1
    dict set libraries altera_merlin_demultiplexer_1921    1
    dict set libraries altera_merlin_multiplexer_1922      1
    dict set libraries altera_mm_interconnect_1920         1
    dict set libraries altera_reset_controller_1922        1
    dict set libraries dxc_ss_top                          1
    return $libraries
  }
  
  proc get_memory_files {QSYS_SIMDIR} {
    set memory_files [list]
    set memory_files [concat $memory_files [clk_bridge_dsp::get_memory_files "$QSYS_SIMDIR/../../ip/dxc_ss_top/clk_bridge_dsp/sim/"]]
    set memory_files [concat $memory_files [dxc_ss_top_mm_bridge_0::get_memory_files "$QSYS_SIMDIR/../../ip/dxc_ss_top/dxc_ss_top_mm_bridge_0/sim/"]]
    set memory_files [concat $memory_files [rst_bridge_csr::get_memory_files "$QSYS_SIMDIR/../../ip/dxc_ss_top/rst_bridge_csr/sim/"]]
    set memory_files [concat $memory_files [dxc_ss_top_dxc_ss_0::get_memory_files "$QSYS_SIMDIR/../../ip/dxc_ss_top/dxc_ss_top_dxc_ss_0/sim/"]]
    set memory_files [concat $memory_files [rst_bridge_dsp::get_memory_files "$QSYS_SIMDIR/../../ip/dxc_ss_top/rst_bridge_dsp/sim/"]]
    set memory_files [concat $memory_files [clk_bridge_csr::get_memory_files "$QSYS_SIMDIR/../../ip/dxc_ss_top/clk_bridge_csr/sim/"]]
    return $memory_files
  }
  
  proc get_common_design_files {QSYS_SIMDIR} {
    set design_files [dict create]
    set design_files [dict merge $design_files [clk_bridge_dsp::get_common_design_files "$QSYS_SIMDIR/../../ip/dxc_ss_top/clk_bridge_dsp/sim/"]]
    set design_files [dict merge $design_files [dxc_ss_top_mm_bridge_0::get_common_design_files "$QSYS_SIMDIR/../../ip/dxc_ss_top/dxc_ss_top_mm_bridge_0/sim/"]]
    set design_files [dict merge $design_files [rst_bridge_csr::get_common_design_files "$QSYS_SIMDIR/../../ip/dxc_ss_top/rst_bridge_csr/sim/"]]
    set design_files [dict merge $design_files [dxc_ss_top_dxc_ss_0::get_common_design_files "$QSYS_SIMDIR/../../ip/dxc_ss_top/dxc_ss_top_dxc_ss_0/sim/"]]
    set design_files [dict merge $design_files [rst_bridge_dsp::get_common_design_files "$QSYS_SIMDIR/../../ip/dxc_ss_top/rst_bridge_dsp/sim/"]]
    set design_files [dict merge $design_files [clk_bridge_csr::get_common_design_files "$QSYS_SIMDIR/../../ip/dxc_ss_top/clk_bridge_csr/sim/"]]
    return $design_files
  }
  
  proc get_design_files {QSYS_SIMDIR} {
    set design_files [list]
    set design_files [concat $design_files [clk_bridge_dsp::get_design_files "$QSYS_SIMDIR/../../ip/dxc_ss_top/clk_bridge_dsp/sim/"]]
    set design_files [concat $design_files [dxc_ss_top_mm_bridge_0::get_design_files "$QSYS_SIMDIR/../../ip/dxc_ss_top/dxc_ss_top_mm_bridge_0/sim/"]]
    set design_files [concat $design_files [rst_bridge_csr::get_design_files "$QSYS_SIMDIR/../../ip/dxc_ss_top/rst_bridge_csr/sim/"]]
    set design_files [concat $design_files [dxc_ss_top_dxc_ss_0::get_design_files "$QSYS_SIMDIR/../../ip/dxc_ss_top/dxc_ss_top_dxc_ss_0/sim/"]]
    set design_files [concat $design_files [rst_bridge_dsp::get_design_files "$QSYS_SIMDIR/../../ip/dxc_ss_top/rst_bridge_dsp/sim/"]]
    set design_files [concat $design_files [clk_bridge_csr::get_design_files "$QSYS_SIMDIR/../../ip/dxc_ss_top/clk_bridge_csr/sim/"]]
    lappend design_files "-makelib altera_merlin_master_translator_192 \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_master_translator_192/sim/dxc_ss_top_altera_merlin_master_translator_192_lykd4la.sv"]\"   -end"                  
    lappend design_files "-makelib altera_merlin_slave_translator_191 \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_slave_translator_191/sim/dxc_ss_top_altera_merlin_slave_translator_191_x56fcki.sv"]\"   -end"                     
    lappend design_files "-makelib altera_merlin_master_agent_1922 \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_master_agent_1922/sim/dxc_ss_top_altera_merlin_master_agent_1922_fy3n5ti.sv"]\"   -end"                              
    lappend design_files "-makelib altera_merlin_slave_agent_1921 \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_slave_agent_1921/sim/dxc_ss_top_altera_merlin_slave_agent_1921_b6r3djy.sv"]\"   -end"                                 
    lappend design_files "-makelib altera_merlin_slave_agent_1921 \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_slave_agent_1921/sim/altera_merlin_burst_uncompressor.sv"]\"   -end"                                                  
    lappend design_files "-makelib altera_avalon_sc_fifo_1932 \"[normalize_path "$QSYS_SIMDIR/../altera_avalon_sc_fifo_1932/sim/dxc_ss_top_altera_avalon_sc_fifo_1932_w27kryi.v"]\"   -end"                                              
    lappend design_files "-makelib altera_merlin_router_1921 \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_router_1921/sim/dxc_ss_top_altera_merlin_router_1921_tgakkfa.sv"]\"   -end"                                                
    lappend design_files "-makelib altera_merlin_router_1921 \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_router_1921/sim/dxc_ss_top_altera_merlin_router_1921_ikwl4uy.sv"]\"   -end"                                                
    lappend design_files "-makelib altera_merlin_traffic_limiter_1921 \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_traffic_limiter_1921/sim/dxc_ss_top_altera_merlin_traffic_limiter_altera_avalon_sc_fifo_1921_wq7ojcq.v"]\"   -end"
    lappend design_files "-makelib altera_merlin_traffic_limiter_1921 \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_traffic_limiter_1921/sim/altera_merlin_reorder_memory.sv"]\"   -end"                                              
    lappend design_files "-makelib altera_merlin_traffic_limiter_1921 \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_traffic_limiter_1921/sim/altera_avalon_st_pipeline_base.v"]\"   -end"                                             
    lappend design_files "-makelib altera_merlin_traffic_limiter_1921 \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_traffic_limiter_1921/sim/dxc_ss_top_altera_merlin_traffic_limiter_1921_js7yfey.sv"]\"   -end"                     
    lappend design_files "-makelib altera_merlin_demultiplexer_1921 \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_demultiplexer_1921/sim/dxc_ss_top_altera_merlin_demultiplexer_1921_cmilary.sv"]\"   -end"                           
    lappend design_files "-makelib altera_merlin_multiplexer_1922 \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/dxc_ss_top_altera_merlin_multiplexer_1922_p25q2xy.sv"]\"   -end"                                 
    lappend design_files "-makelib altera_merlin_multiplexer_1922 \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/altera_merlin_arbitrator.sv"]\"   -end"                                                          
    lappend design_files "-makelib altera_merlin_demultiplexer_1921 \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_demultiplexer_1921/sim/dxc_ss_top_altera_merlin_demultiplexer_1921_zp55myy.sv"]\"   -end"                           
    lappend design_files "-makelib altera_merlin_multiplexer_1922 \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/dxc_ss_top_altera_merlin_multiplexer_1922_cxravzi.sv"]\"   -end"                                 
    lappend design_files "-makelib altera_merlin_multiplexer_1922 \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/altera_merlin_arbitrator.sv"]\"   -end"                                                          
    lappend design_files "-makelib altera_mm_interconnect_1920 \"[normalize_path "$QSYS_SIMDIR/../altera_mm_interconnect_1920/sim/dxc_ss_top_altera_mm_interconnect_1920_666ssxa.v"]\"   -end"                                           
    lappend design_files "-makelib altera_reset_controller_1922 \"[normalize_path "$QSYS_SIMDIR/../altera_reset_controller_1922/sim/altera_reset_controller.v"]\"   -end"                                                                
    lappend design_files "-makelib altera_reset_controller_1922 \"[normalize_path "$QSYS_SIMDIR/../altera_reset_controller_1922/sim/altera_reset_synchronizer.v"]\"   -end"                                                              
    lappend design_files "-makelib dxc_ss_top \"[normalize_path "$QSYS_SIMDIR/dxc_ss_top.v"]\"   -end"                                                                                                                                   
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
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [clk_bridge_dsp::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [dxc_ss_top_mm_bridge_0::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [rst_bridge_csr::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [dxc_ss_top_dxc_ss_0::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [rst_bridge_dsp::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [clk_bridge_csr::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $ELAB_OPTIONS
  }
  
  
  proc get_sim_options {SIMULATOR_TOOL_BITNESS} {
    set SIM_OPTIONS ""
    append SIM_OPTIONS [clk_bridge_dsp::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [dxc_ss_top_mm_bridge_0::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [rst_bridge_csr::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [dxc_ss_top_dxc_ss_0::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [rst_bridge_dsp::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [clk_bridge_csr::get_sim_options $SIMULATOR_TOOL_BITNESS]
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $SIM_OPTIONS
  }
  
  
  proc get_env_variables {SIMULATOR_TOOL_BITNESS} {
    set ENV_VARIABLES [dict create]
    set LD_LIBRARY_PATH [dict create]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [clk_bridge_dsp::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [dxc_ss_top_mm_bridge_0::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [rst_bridge_csr::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [dxc_ss_top_dxc_ss_0::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [rst_bridge_dsp::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [clk_bridge_csr::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
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
    set libraries [dict merge $libraries [clk_bridge_dsp::get_dpi_libraries "$QSYS_SIMDIR/../../ip/dxc_ss_top/clk_bridge_dsp/sim/"]]
    set libraries [dict merge $libraries [dxc_ss_top_mm_bridge_0::get_dpi_libraries "$QSYS_SIMDIR/../../ip/dxc_ss_top/dxc_ss_top_mm_bridge_0/sim/"]]
    set libraries [dict merge $libraries [rst_bridge_csr::get_dpi_libraries "$QSYS_SIMDIR/../../ip/dxc_ss_top/rst_bridge_csr/sim/"]]
    set libraries [dict merge $libraries [dxc_ss_top_dxc_ss_0::get_dpi_libraries "$QSYS_SIMDIR/../../ip/dxc_ss_top/dxc_ss_top_dxc_ss_0/sim/"]]
    set libraries [dict merge $libraries [rst_bridge_dsp::get_dpi_libraries "$QSYS_SIMDIR/../../ip/dxc_ss_top/rst_bridge_dsp/sim/"]]
    set libraries [dict merge $libraries [clk_bridge_csr::get_dpi_libraries "$QSYS_SIMDIR/../../ip/dxc_ss_top/clk_bridge_csr/sim/"]]
    
    return $libraries
  }
  
}
