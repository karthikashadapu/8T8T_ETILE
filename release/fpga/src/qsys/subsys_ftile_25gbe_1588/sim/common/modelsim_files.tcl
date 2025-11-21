source [file join [file dirname [info script]] ./../../../ip/subsys_ftile_25gbe_1588/subsys_ftile_25gbe_1588_reset/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/subsys_ftile_25gbe_1588/rx_dma_reset_bridge/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../subsys_ftile_25gbe_rx_dma/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/subsys_ftile_25gbe_1588/subsys_ftile_25gbe_1588_dmaclkout/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/subsys_ftile_25gbe_1588/subsys_ftile_25gbe_1588_o_pll_clk/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../subsys_ftile_25gbe_tx_dma/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/subsys_ftile_25gbe_1588/subsys_ftile_25gbe_1588_csrclk/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/subsys_ftile_25gbe_1588/subsys_ftile_25gbe_1588_csr/sim/common/modelsim_files.tcl]

namespace eval subsys_ftile_25gbe_1588 {
  proc get_design_libraries {} {
    set libraries [dict create]
    set libraries [dict merge $libraries [subsys_ftile_25gbe_1588_reset::get_design_libraries]]
    set libraries [dict merge $libraries [rx_dma_reset_bridge::get_design_libraries]]
    set libraries [dict merge $libraries [subsys_ftile_25gbe_rx_dma::get_design_libraries]]
    set libraries [dict merge $libraries [subsys_ftile_25gbe_1588_dmaclkout::get_design_libraries]]
    set libraries [dict merge $libraries [subsys_ftile_25gbe_1588_o_pll_clk::get_design_libraries]]
    set libraries [dict merge $libraries [subsys_ftile_25gbe_tx_dma::get_design_libraries]]
    set libraries [dict merge $libraries [subsys_ftile_25gbe_1588_csrclk::get_design_libraries]]
    set libraries [dict merge $libraries [subsys_ftile_25gbe_1588_csr::get_design_libraries]]
    dict set libraries altera_merlin_master_translator_192 1
    dict set libraries altera_merlin_slave_translator_191  1
    dict set libraries altera_merlin_master_agent_1922     1
    dict set libraries altera_merlin_slave_agent_1921      1
    dict set libraries altera_avalon_sc_fifo_1932          1
    dict set libraries altera_merlin_router_1921           1
    dict set libraries altera_merlin_traffic_limiter_1921  1
    dict set libraries altera_merlin_demultiplexer_1921    1
    dict set libraries altera_merlin_multiplexer_1922      1
    dict set libraries hs_clk_xer_1940                     1
    dict set libraries altera_mm_interconnect_1920         1
    dict set libraries altera_reset_controller_1922        1
    dict set libraries subsys_ftile_25gbe_1588             1
    return $libraries
  }
  
  proc get_memory_files {QSYS_SIMDIR} {
    set memory_files [list]
    set memory_files [concat $memory_files [subsys_ftile_25gbe_1588_reset::get_memory_files "$QSYS_SIMDIR/../../ip/subsys_ftile_25gbe_1588/subsys_ftile_25gbe_1588_reset/sim/"]]
    set memory_files [concat $memory_files [rx_dma_reset_bridge::get_memory_files "$QSYS_SIMDIR/../../ip/subsys_ftile_25gbe_1588/rx_dma_reset_bridge/sim/"]]
    set memory_files [concat $memory_files [subsys_ftile_25gbe_rx_dma::get_memory_files "$QSYS_SIMDIR/../../subsys_ftile_25gbe_rx_dma/sim/"]]
    set memory_files [concat $memory_files [subsys_ftile_25gbe_1588_dmaclkout::get_memory_files "$QSYS_SIMDIR/../../ip/subsys_ftile_25gbe_1588/subsys_ftile_25gbe_1588_dmaclkout/sim/"]]
    set memory_files [concat $memory_files [subsys_ftile_25gbe_1588_o_pll_clk::get_memory_files "$QSYS_SIMDIR/../../ip/subsys_ftile_25gbe_1588/subsys_ftile_25gbe_1588_o_pll_clk/sim/"]]
    set memory_files [concat $memory_files [subsys_ftile_25gbe_tx_dma::get_memory_files "$QSYS_SIMDIR/../../subsys_ftile_25gbe_tx_dma/sim/"]]
    set memory_files [concat $memory_files [subsys_ftile_25gbe_1588_csrclk::get_memory_files "$QSYS_SIMDIR/../../ip/subsys_ftile_25gbe_1588/subsys_ftile_25gbe_1588_csrclk/sim/"]]
    set memory_files [concat $memory_files [subsys_ftile_25gbe_1588_csr::get_memory_files "$QSYS_SIMDIR/../../ip/subsys_ftile_25gbe_1588/subsys_ftile_25gbe_1588_csr/sim/"]]
    return $memory_files
  }
  
  proc get_common_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [dict create]
    set design_files [dict merge $design_files [subsys_ftile_25gbe_1588_reset::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/subsys_ftile_25gbe_1588/subsys_ftile_25gbe_1588_reset/sim/"]]
    set design_files [dict merge $design_files [rx_dma_reset_bridge::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/subsys_ftile_25gbe_1588/rx_dma_reset_bridge/sim/"]]
    set design_files [dict merge $design_files [subsys_ftile_25gbe_rx_dma::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../subsys_ftile_25gbe_rx_dma/sim/"]]
    set design_files [dict merge $design_files [subsys_ftile_25gbe_1588_dmaclkout::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/subsys_ftile_25gbe_1588/subsys_ftile_25gbe_1588_dmaclkout/sim/"]]
    set design_files [dict merge $design_files [subsys_ftile_25gbe_1588_o_pll_clk::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/subsys_ftile_25gbe_1588/subsys_ftile_25gbe_1588_o_pll_clk/sim/"]]
    set design_files [dict merge $design_files [subsys_ftile_25gbe_tx_dma::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../subsys_ftile_25gbe_tx_dma/sim/"]]
    set design_files [dict merge $design_files [subsys_ftile_25gbe_1588_csrclk::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/subsys_ftile_25gbe_1588/subsys_ftile_25gbe_1588_csrclk/sim/"]]
    set design_files [dict merge $design_files [subsys_ftile_25gbe_1588_csr::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/subsys_ftile_25gbe_1588/subsys_ftile_25gbe_1588_csr/sim/"]]
    return $design_files
  }
  
  proc get_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [list]
    set design_files [concat $design_files [subsys_ftile_25gbe_1588_reset::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/subsys_ftile_25gbe_1588/subsys_ftile_25gbe_1588_reset/sim/"]]
    set design_files [concat $design_files [rx_dma_reset_bridge::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/subsys_ftile_25gbe_1588/rx_dma_reset_bridge/sim/"]]
    set design_files [concat $design_files [subsys_ftile_25gbe_rx_dma::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../subsys_ftile_25gbe_rx_dma/sim/"]]
    set design_files [concat $design_files [subsys_ftile_25gbe_1588_dmaclkout::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/subsys_ftile_25gbe_1588/subsys_ftile_25gbe_1588_dmaclkout/sim/"]]
    set design_files [concat $design_files [subsys_ftile_25gbe_1588_o_pll_clk::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/subsys_ftile_25gbe_1588/subsys_ftile_25gbe_1588_o_pll_clk/sim/"]]
    set design_files [concat $design_files [subsys_ftile_25gbe_tx_dma::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../subsys_ftile_25gbe_tx_dma/sim/"]]
    set design_files [concat $design_files [subsys_ftile_25gbe_1588_csrclk::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/subsys_ftile_25gbe_1588/subsys_ftile_25gbe_1588_csrclk/sim/"]]
    set design_files [concat $design_files [subsys_ftile_25gbe_1588_csr::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/subsys_ftile_25gbe_1588/subsys_ftile_25gbe_1588_csr/sim/"]]
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_master_translator_192/sim/subsys_ftile_25gbe_1588_altera_merlin_master_translator_192_lykd4la.sv"]\"  -work altera_merlin_master_translator_192"              
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_slave_translator_191/sim/subsys_ftile_25gbe_1588_altera_merlin_slave_translator_191_x56fcki.sv"]\"  -work altera_merlin_slave_translator_191"                 
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_master_agent_1922/sim/subsys_ftile_25gbe_1588_altera_merlin_master_agent_1922_fy3n5ti.sv"]\"  -work altera_merlin_master_agent_1922"                          
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_slave_agent_1921/sim/subsys_ftile_25gbe_1588_altera_merlin_slave_agent_1921_b6r3djy.sv"]\"  -work altera_merlin_slave_agent_1921"                             
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_slave_agent_1921/sim/altera_merlin_burst_uncompressor.sv"]\"  -work altera_merlin_slave_agent_1921"                                                           
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_avalon_sc_fifo_1932/sim/subsys_ftile_25gbe_1588_altera_avalon_sc_fifo_1932_w27kryi.v"]\"  -work altera_avalon_sc_fifo_1932"                                              
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_router_1921/sim/subsys_ftile_25gbe_1588_altera_merlin_router_1921_yblmvqi.sv"]\"  -work altera_merlin_router_1921"                                            
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_router_1921/sim/subsys_ftile_25gbe_1588_altera_merlin_router_1921_l27qicy.sv"]\"  -work altera_merlin_router_1921"                                            
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_traffic_limiter_1921/sim/subsys_ftile_25gbe_1588_altera_merlin_traffic_limiter_altera_avalon_sc_fifo_1921_pb5uyxq.v"]\"  -work altera_merlin_traffic_limiter_1921"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_traffic_limiter_1921/sim/altera_merlin_reorder_memory.sv"]\"  -work altera_merlin_traffic_limiter_1921"                                                       
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_traffic_limiter_1921/sim/altera_avalon_st_pipeline_base.v"]\"  -work altera_merlin_traffic_limiter_1921"                                                      
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_traffic_limiter_1921/sim/subsys_ftile_25gbe_1588_altera_merlin_traffic_limiter_1921_4fqxf7q.sv"]\"  -work altera_merlin_traffic_limiter_1921"                 
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_demultiplexer_1921/sim/subsys_ftile_25gbe_1588_altera_merlin_demultiplexer_1921_jtkdvly.sv"]\"  -work altera_merlin_demultiplexer_1921"                       
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/subsys_ftile_25gbe_1588_altera_merlin_multiplexer_1922_kxryuwa.sv"]\"  -work altera_merlin_multiplexer_1922"                             
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/altera_merlin_arbitrator.sv"]\"  -work altera_merlin_multiplexer_1922"                                                                   
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_demultiplexer_1921/sim/subsys_ftile_25gbe_1588_altera_merlin_demultiplexer_1921_zpn2qzq.sv"]\"  -work altera_merlin_demultiplexer_1921"                       
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/subsys_ftile_25gbe_1588_altera_merlin_multiplexer_1922_5vdjcfy.sv"]\"  -work altera_merlin_multiplexer_1922"                             
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/altera_merlin_arbitrator.sv"]\"  -work altera_merlin_multiplexer_1922"                                                                   
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../hs_clk_xer_1940/sim/subsys_ftile_25gbe_1588_hs_clk_xer_1940_uibngoq.v"]\"  -work hs_clk_xer_1940"                                                                               
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../hs_clk_xer_1940/sim/alt_hiconnect_clock_crosser.v"]\"  -work hs_clk_xer_1940"                                                                                               
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../hs_clk_xer_1940/sim/altera_reset_synchronizer.v"]\"  -work hs_clk_xer_1940"                                                                                                 
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../hs_clk_xer_1940/sim/alt_hiconnect_pipeline_base.v"]\"  -work hs_clk_xer_1940"                                                                                               
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../hs_clk_xer_1940/sim/altera_std_synchronizer.v"]\"  -work hs_clk_xer_1940"                                                                                                   
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_mm_interconnect_1920/sim/subsys_ftile_25gbe_1588_altera_mm_interconnect_1920_z5yfcuy.v"]\"  -work altera_mm_interconnect_1920"                                           
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_reset_controller_1922/sim/altera_reset_controller.v"]\"  -work altera_reset_controller_1922"                                                                             
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_reset_controller_1922/sim/altera_reset_synchronizer.v"]\"  -work altera_reset_controller_1922"                                                                           
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/subsys_ftile_25gbe_1588.v"]\"  -work subsys_ftile_25gbe_1588"                                                                                                                      
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
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [subsys_ftile_25gbe_1588_reset::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [rx_dma_reset_bridge::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [subsys_ftile_25gbe_rx_dma::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [subsys_ftile_25gbe_1588_dmaclkout::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [subsys_ftile_25gbe_1588_o_pll_clk::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [subsys_ftile_25gbe_tx_dma::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [subsys_ftile_25gbe_1588_csrclk::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [subsys_ftile_25gbe_1588_csr::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $ELAB_OPTIONS
  }
  
  
  proc get_sim_options {SIMULATOR_TOOL_BITNESS} {
    set SIM_OPTIONS ""
    append SIM_OPTIONS [subsys_ftile_25gbe_1588_reset::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [rx_dma_reset_bridge::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [subsys_ftile_25gbe_rx_dma::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [subsys_ftile_25gbe_1588_dmaclkout::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [subsys_ftile_25gbe_1588_o_pll_clk::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [subsys_ftile_25gbe_tx_dma::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [subsys_ftile_25gbe_1588_csrclk::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [subsys_ftile_25gbe_1588_csr::get_sim_options $SIMULATOR_TOOL_BITNESS]
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $SIM_OPTIONS
  }
  
  
  proc get_env_variables {SIMULATOR_TOOL_BITNESS} {
    set ENV_VARIABLES [dict create]
    set LD_LIBRARY_PATH [dict create]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [subsys_ftile_25gbe_1588_reset::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [rx_dma_reset_bridge::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [subsys_ftile_25gbe_rx_dma::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [subsys_ftile_25gbe_1588_dmaclkout::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [subsys_ftile_25gbe_1588_o_pll_clk::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [subsys_ftile_25gbe_tx_dma::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [subsys_ftile_25gbe_1588_csrclk::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [subsys_ftile_25gbe_1588_csr::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
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
    set libraries [dict merge $libraries [subsys_ftile_25gbe_1588_reset::get_dpi_libraries "$QSYS_SIMDIR/../../ip/subsys_ftile_25gbe_1588/subsys_ftile_25gbe_1588_reset/sim/"]]
    set libraries [dict merge $libraries [rx_dma_reset_bridge::get_dpi_libraries "$QSYS_SIMDIR/../../ip/subsys_ftile_25gbe_1588/rx_dma_reset_bridge/sim/"]]
    set libraries [dict merge $libraries [subsys_ftile_25gbe_rx_dma::get_dpi_libraries "$QSYS_SIMDIR/../../subsys_ftile_25gbe_rx_dma/sim/"]]
    set libraries [dict merge $libraries [subsys_ftile_25gbe_1588_dmaclkout::get_dpi_libraries "$QSYS_SIMDIR/../../ip/subsys_ftile_25gbe_1588/subsys_ftile_25gbe_1588_dmaclkout/sim/"]]
    set libraries [dict merge $libraries [subsys_ftile_25gbe_1588_o_pll_clk::get_dpi_libraries "$QSYS_SIMDIR/../../ip/subsys_ftile_25gbe_1588/subsys_ftile_25gbe_1588_o_pll_clk/sim/"]]
    set libraries [dict merge $libraries [subsys_ftile_25gbe_tx_dma::get_dpi_libraries "$QSYS_SIMDIR/../../subsys_ftile_25gbe_tx_dma/sim/"]]
    set libraries [dict merge $libraries [subsys_ftile_25gbe_1588_csrclk::get_dpi_libraries "$QSYS_SIMDIR/../../ip/subsys_ftile_25gbe_1588/subsys_ftile_25gbe_1588_csrclk/sim/"]]
    set libraries [dict merge $libraries [subsys_ftile_25gbe_1588_csr::get_dpi_libraries "$QSYS_SIMDIR/../../ip/subsys_ftile_25gbe_1588/subsys_ftile_25gbe_1588_csr/sim/"]]
    
    return $libraries
  }
  
}
