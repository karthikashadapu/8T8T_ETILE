source [file join [file dirname [info script]] ./../../../ip/subsys_ftile_25gbe_tx_dma/tx_dma_clock/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/subsys_ftile_25gbe_tx_dma/tx_dma_csr/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/subsys_ftile_25gbe_tx_dma/tx_dma_prefetcher/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/subsys_ftile_25gbe_tx_dma/tx_dma_read_master/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/subsys_ftile_25gbe_tx_dma/tx_dma_reset/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/subsys_ftile_25gbe_tx_dma/tx_dma_ftile_clock/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/subsys_ftile_25gbe_tx_dma/tx_dma_dispatcher/sim/common/modelsim_files.tcl]

namespace eval subsys_ftile_25gbe_tx_dma {
  proc get_design_libraries {} {
    set libraries [dict create]
    set libraries [dict merge $libraries [tx_dma_clock::get_design_libraries]]
    set libraries [dict merge $libraries [tx_dma_csr::get_design_libraries]]
    set libraries [dict merge $libraries [tx_dma_prefetcher::get_design_libraries]]
    set libraries [dict merge $libraries [tx_dma_read_master::get_design_libraries]]
    set libraries [dict merge $libraries [tx_dma_reset::get_design_libraries]]
    set libraries [dict merge $libraries [tx_dma_ftile_clock::get_design_libraries]]
    set libraries [dict merge $libraries [tx_dma_dispatcher::get_design_libraries]]
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
    dict set libraries data_format_adapter_1930            1
    dict set libraries altera_avalon_st_adapter_1920       1
    dict set libraries altera_reset_controller_1922        1
    dict set libraries subsys_ftile_25gbe_tx_dma           1
    return $libraries
  }
  
  proc get_memory_files {QSYS_SIMDIR} {
    set memory_files [list]
    set memory_files [concat $memory_files [tx_dma_clock::get_memory_files "$QSYS_SIMDIR/../../ip/subsys_ftile_25gbe_tx_dma/tx_dma_clock/sim/"]]
    set memory_files [concat $memory_files [tx_dma_csr::get_memory_files "$QSYS_SIMDIR/../../ip/subsys_ftile_25gbe_tx_dma/tx_dma_csr/sim/"]]
    set memory_files [concat $memory_files [tx_dma_prefetcher::get_memory_files "$QSYS_SIMDIR/../../ip/subsys_ftile_25gbe_tx_dma/tx_dma_prefetcher/sim/"]]
    set memory_files [concat $memory_files [tx_dma_read_master::get_memory_files "$QSYS_SIMDIR/../../ip/subsys_ftile_25gbe_tx_dma/tx_dma_read_master/sim/"]]
    set memory_files [concat $memory_files [tx_dma_reset::get_memory_files "$QSYS_SIMDIR/../../ip/subsys_ftile_25gbe_tx_dma/tx_dma_reset/sim/"]]
    set memory_files [concat $memory_files [tx_dma_ftile_clock::get_memory_files "$QSYS_SIMDIR/../../ip/subsys_ftile_25gbe_tx_dma/tx_dma_ftile_clock/sim/"]]
    set memory_files [concat $memory_files [tx_dma_dispatcher::get_memory_files "$QSYS_SIMDIR/../../ip/subsys_ftile_25gbe_tx_dma/tx_dma_dispatcher/sim/"]]
    return $memory_files
  }
  
  proc get_common_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [dict create]
    set design_files [dict merge $design_files [tx_dma_clock::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/subsys_ftile_25gbe_tx_dma/tx_dma_clock/sim/"]]
    set design_files [dict merge $design_files [tx_dma_csr::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/subsys_ftile_25gbe_tx_dma/tx_dma_csr/sim/"]]
    set design_files [dict merge $design_files [tx_dma_prefetcher::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/subsys_ftile_25gbe_tx_dma/tx_dma_prefetcher/sim/"]]
    set design_files [dict merge $design_files [tx_dma_read_master::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/subsys_ftile_25gbe_tx_dma/tx_dma_read_master/sim/"]]
    set design_files [dict merge $design_files [tx_dma_reset::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/subsys_ftile_25gbe_tx_dma/tx_dma_reset/sim/"]]
    set design_files [dict merge $design_files [tx_dma_ftile_clock::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/subsys_ftile_25gbe_tx_dma/tx_dma_ftile_clock/sim/"]]
    set design_files [dict merge $design_files [tx_dma_dispatcher::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/subsys_ftile_25gbe_tx_dma/tx_dma_dispatcher/sim/"]]
    return $design_files
  }
  
  proc get_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [list]
    set design_files [concat $design_files [tx_dma_clock::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/subsys_ftile_25gbe_tx_dma/tx_dma_clock/sim/"]]
    set design_files [concat $design_files [tx_dma_csr::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/subsys_ftile_25gbe_tx_dma/tx_dma_csr/sim/"]]
    set design_files [concat $design_files [tx_dma_prefetcher::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/subsys_ftile_25gbe_tx_dma/tx_dma_prefetcher/sim/"]]
    set design_files [concat $design_files [tx_dma_read_master::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/subsys_ftile_25gbe_tx_dma/tx_dma_read_master/sim/"]]
    set design_files [concat $design_files [tx_dma_reset::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/subsys_ftile_25gbe_tx_dma/tx_dma_reset/sim/"]]
    set design_files [concat $design_files [tx_dma_ftile_clock::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/subsys_ftile_25gbe_tx_dma/tx_dma_ftile_clock/sim/"]]
    set design_files [concat $design_files [tx_dma_dispatcher::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/subsys_ftile_25gbe_tx_dma/tx_dma_dispatcher/sim/"]]
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_master_translator_192/sim/subsys_ftile_25gbe_tx_dma_altera_merlin_master_translator_192_lykd4la.sv"]\"  -work altera_merlin_master_translator_192"              
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_slave_translator_191/sim/subsys_ftile_25gbe_tx_dma_altera_merlin_slave_translator_191_x56fcki.sv"]\"  -work altera_merlin_slave_translator_191"                 
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_master_agent_1922/sim/subsys_ftile_25gbe_tx_dma_altera_merlin_master_agent_1922_fy3n5ti.sv"]\"  -work altera_merlin_master_agent_1922"                          
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_slave_agent_1921/sim/subsys_ftile_25gbe_tx_dma_altera_merlin_slave_agent_1921_b6r3djy.sv"]\"  -work altera_merlin_slave_agent_1921"                             
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_slave_agent_1921/sim/altera_merlin_burst_uncompressor.sv"]\"  -work altera_merlin_slave_agent_1921"                                                             
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_avalon_sc_fifo_1932/sim/subsys_ftile_25gbe_tx_dma_altera_avalon_sc_fifo_1932_w27kryi.v"]\"  -work altera_avalon_sc_fifo_1932"                                              
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_router_1921/sim/subsys_ftile_25gbe_tx_dma_altera_merlin_router_1921_fojawpq.sv"]\"  -work altera_merlin_router_1921"                                            
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_router_1921/sim/subsys_ftile_25gbe_tx_dma_altera_merlin_router_1921_vik365y.sv"]\"  -work altera_merlin_router_1921"                                            
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_traffic_limiter_1921/sim/subsys_ftile_25gbe_tx_dma_altera_merlin_traffic_limiter_altera_avalon_sc_fifo_1921_wq7ojcq.v"]\"  -work altera_merlin_traffic_limiter_1921"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_traffic_limiter_1921/sim/altera_merlin_reorder_memory.sv"]\"  -work altera_merlin_traffic_limiter_1921"                                                         
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_traffic_limiter_1921/sim/altera_avalon_st_pipeline_base.v"]\"  -work altera_merlin_traffic_limiter_1921"                                                        
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_traffic_limiter_1921/sim/subsys_ftile_25gbe_tx_dma_altera_merlin_traffic_limiter_1921_js7yfey.sv"]\"  -work altera_merlin_traffic_limiter_1921"                 
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_demultiplexer_1921/sim/subsys_ftile_25gbe_tx_dma_altera_merlin_demultiplexer_1921_lym5ila.sv"]\"  -work altera_merlin_demultiplexer_1921"                       
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/subsys_ftile_25gbe_tx_dma_altera_merlin_multiplexer_1922_btmbfii.sv"]\"  -work altera_merlin_multiplexer_1922"                             
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/altera_merlin_arbitrator.sv"]\"  -work altera_merlin_multiplexer_1922"                                                                     
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_demultiplexer_1921/sim/subsys_ftile_25gbe_tx_dma_altera_merlin_demultiplexer_1921_o4yxuty.sv"]\"  -work altera_merlin_demultiplexer_1921"                       
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/subsys_ftile_25gbe_tx_dma_altera_merlin_multiplexer_1922_7hnkwka.sv"]\"  -work altera_merlin_multiplexer_1922"                             
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/altera_merlin_arbitrator.sv"]\"  -work altera_merlin_multiplexer_1922"                                                                     
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_mm_interconnect_1920/sim/subsys_ftile_25gbe_tx_dma_altera_mm_interconnect_1920_4olduea.v"]\"  -work altera_mm_interconnect_1920"                                           
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../data_format_adapter_1930/sim/subsys_ftile_25gbe_tx_dma_data_format_adapter_1930_zypyqnq.sv"]\"  -work data_format_adapter_1930"                                               
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../data_format_adapter_1930/sim/subsys_ftile_25gbe_tx_dma_data_format_adapter_1930_zypyqnq_state_ram.sv"]\"  -work data_format_adapter_1930"                                     
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../data_format_adapter_1930/sim/subsys_ftile_25gbe_tx_dma_data_format_adapter_1930_zypyqnq_data_ram.sv"]\"  -work data_format_adapter_1930"                                      
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_avalon_st_adapter_1920/sim/subsys_ftile_25gbe_tx_dma_altera_avalon_st_adapter_1920_whdx2tq.v"]\"  -work altera_avalon_st_adapter_1920"                                     
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_reset_controller_1922/sim/altera_reset_controller.v"]\"  -work altera_reset_controller_1922"                                                                               
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_reset_controller_1922/sim/altera_reset_synchronizer.v"]\"  -work altera_reset_controller_1922"                                                                             
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/subsys_ftile_25gbe_tx_dma.v"]\"  -work subsys_ftile_25gbe_tx_dma"                                                                                                                    
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
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [tx_dma_clock::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [tx_dma_csr::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [tx_dma_prefetcher::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [tx_dma_read_master::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [tx_dma_reset::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [tx_dma_ftile_clock::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [tx_dma_dispatcher::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $ELAB_OPTIONS
  }
  
  
  proc get_sim_options {SIMULATOR_TOOL_BITNESS} {
    set SIM_OPTIONS ""
    append SIM_OPTIONS [tx_dma_clock::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [tx_dma_csr::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [tx_dma_prefetcher::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [tx_dma_read_master::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [tx_dma_reset::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [tx_dma_ftile_clock::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [tx_dma_dispatcher::get_sim_options $SIMULATOR_TOOL_BITNESS]
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $SIM_OPTIONS
  }
  
  
  proc get_env_variables {SIMULATOR_TOOL_BITNESS} {
    set ENV_VARIABLES [dict create]
    set LD_LIBRARY_PATH [dict create]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [tx_dma_clock::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [tx_dma_csr::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [tx_dma_prefetcher::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [tx_dma_read_master::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [tx_dma_reset::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [tx_dma_ftile_clock::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [tx_dma_dispatcher::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
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
    set libraries [dict merge $libraries [tx_dma_clock::get_dpi_libraries "$QSYS_SIMDIR/../../ip/subsys_ftile_25gbe_tx_dma/tx_dma_clock/sim/"]]
    set libraries [dict merge $libraries [tx_dma_csr::get_dpi_libraries "$QSYS_SIMDIR/../../ip/subsys_ftile_25gbe_tx_dma/tx_dma_csr/sim/"]]
    set libraries [dict merge $libraries [tx_dma_prefetcher::get_dpi_libraries "$QSYS_SIMDIR/../../ip/subsys_ftile_25gbe_tx_dma/tx_dma_prefetcher/sim/"]]
    set libraries [dict merge $libraries [tx_dma_read_master::get_dpi_libraries "$QSYS_SIMDIR/../../ip/subsys_ftile_25gbe_tx_dma/tx_dma_read_master/sim/"]]
    set libraries [dict merge $libraries [tx_dma_reset::get_dpi_libraries "$QSYS_SIMDIR/../../ip/subsys_ftile_25gbe_tx_dma/tx_dma_reset/sim/"]]
    set libraries [dict merge $libraries [tx_dma_ftile_clock::get_dpi_libraries "$QSYS_SIMDIR/../../ip/subsys_ftile_25gbe_tx_dma/tx_dma_ftile_clock/sim/"]]
    set libraries [dict merge $libraries [tx_dma_dispatcher::get_dpi_libraries "$QSYS_SIMDIR/../../ip/subsys_ftile_25gbe_tx_dma/tx_dma_dispatcher/sim/"]]
    
    return $libraries
  }
  
}
