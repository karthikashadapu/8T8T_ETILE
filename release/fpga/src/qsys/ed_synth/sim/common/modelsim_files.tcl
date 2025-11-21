source [file join [file dirname [info script]] ./../../../ip/ed_synth/ed_synth_reset_bridge_eth/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/ed_synth/ed_synth_clock_bridge_eth/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/ed_synth/ed_synth_capture_if_top_0/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/ed_synth/ed_synth_ninit_done_inst/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ddr4_wr_rd/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/ed_synth/ed_synth_clock_bridge_dspby2/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/ed_synth/ed_synth_clock_bridge_dsp/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/ed_synth/reset_csr/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/ed_synth/ed_synth_reset_bridge_dsp/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/ed_synth/clock_csr/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/ed_synth/ed_synth_h2f_bridge/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/ed_synth/ed_synth_h2f_lw_bridge/sim/common/modelsim_files.tcl]

namespace eval ed_synth {
  proc get_design_libraries {} {
    set libraries [dict create]
    set libraries [dict merge $libraries [ed_synth_reset_bridge_eth::get_design_libraries]]
    set libraries [dict merge $libraries [ed_synth_clock_bridge_eth::get_design_libraries]]
    set libraries [dict merge $libraries [ed_synth_capture_if_top_0::get_design_libraries]]
    set libraries [dict merge $libraries [ed_synth_ninit_done_inst::get_design_libraries]]
    set libraries [dict merge $libraries [ddr4_wr_rd::get_design_libraries]]
    set libraries [dict merge $libraries [ed_synth_clock_bridge_dspby2::get_design_libraries]]
    set libraries [dict merge $libraries [ed_synth_clock_bridge_dsp::get_design_libraries]]
    set libraries [dict merge $libraries [reset_csr::get_design_libraries]]
    set libraries [dict merge $libraries [ed_synth_reset_bridge_dsp::get_design_libraries]]
    set libraries [dict merge $libraries [clock_csr::get_design_libraries]]
    set libraries [dict merge $libraries [ed_synth_h2f_bridge::get_design_libraries]]
    set libraries [dict merge $libraries [ed_synth_h2f_lw_bridge::get_design_libraries]]
    dict set libraries altera_merlin_master_translator_192  1
    dict set libraries altera_merlin_slave_translator_191   1
    dict set libraries altera_merlin_master_agent_1922      1
    dict set libraries altera_merlin_slave_agent_1921       1
    dict set libraries altera_avalon_sc_fifo_1932           1
    dict set libraries altera_merlin_router_1921            1
    dict set libraries altera_merlin_traffic_limiter_1921   1
    dict set libraries altera_merlin_demultiplexer_1921     1
    dict set libraries altera_merlin_multiplexer_1922       1
    dict set libraries hs_clk_xer_1940                      1
    dict set libraries altera_mm_interconnect_1920          1
    dict set libraries altera_avalon_st_pipeline_stage_1930 1
    dict set libraries altera_merlin_burst_adapter_1932     1
    dict set libraries altera_merlin_width_adapter_1940     1
    dict set libraries altera_reset_controller_1922         1
    dict set libraries ed_synth                             1
    return $libraries
  }
  
  proc get_memory_files {QSYS_SIMDIR} {
    set memory_files [list]
    set memory_files [concat $memory_files [ed_synth_reset_bridge_eth::get_memory_files "$QSYS_SIMDIR/../../ip/ed_synth/ed_synth_reset_bridge_eth/sim/"]]
    set memory_files [concat $memory_files [ed_synth_clock_bridge_eth::get_memory_files "$QSYS_SIMDIR/../../ip/ed_synth/ed_synth_clock_bridge_eth/sim/"]]
    set memory_files [concat $memory_files [ed_synth_capture_if_top_0::get_memory_files "$QSYS_SIMDIR/../../ip/ed_synth/ed_synth_capture_if_top_0/sim/"]]
    set memory_files [concat $memory_files [ed_synth_ninit_done_inst::get_memory_files "$QSYS_SIMDIR/../../ip/ed_synth/ed_synth_ninit_done_inst/sim/"]]
    set memory_files [concat $memory_files [ddr4_wr_rd::get_memory_files "$QSYS_SIMDIR/../../ddr4_wr_rd/sim/"]]
    set memory_files [concat $memory_files [ed_synth_clock_bridge_dspby2::get_memory_files "$QSYS_SIMDIR/../../ip/ed_synth/ed_synth_clock_bridge_dspby2/sim/"]]
    set memory_files [concat $memory_files [ed_synth_clock_bridge_dsp::get_memory_files "$QSYS_SIMDIR/../../ip/ed_synth/ed_synth_clock_bridge_dsp/sim/"]]
    set memory_files [concat $memory_files [reset_csr::get_memory_files "$QSYS_SIMDIR/../../ip/ed_synth/reset_csr/sim/"]]
    set memory_files [concat $memory_files [ed_synth_reset_bridge_dsp::get_memory_files "$QSYS_SIMDIR/../../ip/ed_synth/ed_synth_reset_bridge_dsp/sim/"]]
    set memory_files [concat $memory_files [clock_csr::get_memory_files "$QSYS_SIMDIR/../../ip/ed_synth/clock_csr/sim/"]]
    set memory_files [concat $memory_files [ed_synth_h2f_bridge::get_memory_files "$QSYS_SIMDIR/../../ip/ed_synth/ed_synth_h2f_bridge/sim/"]]
    set memory_files [concat $memory_files [ed_synth_h2f_lw_bridge::get_memory_files "$QSYS_SIMDIR/../../ip/ed_synth/ed_synth_h2f_lw_bridge/sim/"]]
    return $memory_files
  }
  
  proc get_common_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [dict create]
    set design_files [dict merge $design_files [ed_synth_reset_bridge_eth::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/ed_synth/ed_synth_reset_bridge_eth/sim/"]]
    set design_files [dict merge $design_files [ed_synth_clock_bridge_eth::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/ed_synth/ed_synth_clock_bridge_eth/sim/"]]
    set design_files [dict merge $design_files [ed_synth_capture_if_top_0::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/ed_synth/ed_synth_capture_if_top_0/sim/"]]
    set design_files [dict merge $design_files [ed_synth_ninit_done_inst::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/ed_synth/ed_synth_ninit_done_inst/sim/"]]
    set design_files [dict merge $design_files [ddr4_wr_rd::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ddr4_wr_rd/sim/"]]
    set design_files [dict merge $design_files [ed_synth_clock_bridge_dspby2::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/ed_synth/ed_synth_clock_bridge_dspby2/sim/"]]
    set design_files [dict merge $design_files [ed_synth_clock_bridge_dsp::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/ed_synth/ed_synth_clock_bridge_dsp/sim/"]]
    set design_files [dict merge $design_files [reset_csr::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/ed_synth/reset_csr/sim/"]]
    set design_files [dict merge $design_files [ed_synth_reset_bridge_dsp::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/ed_synth/ed_synth_reset_bridge_dsp/sim/"]]
    set design_files [dict merge $design_files [clock_csr::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/ed_synth/clock_csr/sim/"]]
    set design_files [dict merge $design_files [ed_synth_h2f_bridge::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/ed_synth/ed_synth_h2f_bridge/sim/"]]
    set design_files [dict merge $design_files [ed_synth_h2f_lw_bridge::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/ed_synth/ed_synth_h2f_lw_bridge/sim/"]]
    return $design_files
  }
  
  proc get_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [list]
    set design_files [concat $design_files [ed_synth_reset_bridge_eth::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/ed_synth/ed_synth_reset_bridge_eth/sim/"]]
    set design_files [concat $design_files [ed_synth_clock_bridge_eth::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/ed_synth/ed_synth_clock_bridge_eth/sim/"]]
    set design_files [concat $design_files [ed_synth_capture_if_top_0::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/ed_synth/ed_synth_capture_if_top_0/sim/"]]
    set design_files [concat $design_files [ed_synth_ninit_done_inst::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/ed_synth/ed_synth_ninit_done_inst/sim/"]]
    set design_files [concat $design_files [ddr4_wr_rd::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ddr4_wr_rd/sim/"]]
    set design_files [concat $design_files [ed_synth_clock_bridge_dspby2::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/ed_synth/ed_synth_clock_bridge_dspby2/sim/"]]
    set design_files [concat $design_files [ed_synth_clock_bridge_dsp::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/ed_synth/ed_synth_clock_bridge_dsp/sim/"]]
    set design_files [concat $design_files [reset_csr::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/ed_synth/reset_csr/sim/"]]
    set design_files [concat $design_files [ed_synth_reset_bridge_dsp::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/ed_synth/ed_synth_reset_bridge_dsp/sim/"]]
    set design_files [concat $design_files [clock_csr::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/ed_synth/clock_csr/sim/"]]
    set design_files [concat $design_files [ed_synth_h2f_bridge::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/ed_synth/ed_synth_h2f_bridge/sim/"]]
    set design_files [concat $design_files [ed_synth_h2f_lw_bridge::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/ed_synth/ed_synth_h2f_lw_bridge/sim/"]]
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_master_translator_192/sim/ed_synth_altera_merlin_master_translator_192_lykd4la.sv"]\"  -work altera_merlin_master_translator_192"                  
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_slave_translator_191/sim/ed_synth_altera_merlin_slave_translator_191_x56fcki.sv"]\"  -work altera_merlin_slave_translator_191"                     
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_master_agent_1922/sim/ed_synth_altera_merlin_master_agent_1922_fy3n5ti.sv"]\"  -work altera_merlin_master_agent_1922"                              
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_slave_agent_1921/sim/ed_synth_altera_merlin_slave_agent_1921_b6r3djy.sv"]\"  -work altera_merlin_slave_agent_1921"                                 
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_slave_agent_1921/sim/altera_merlin_burst_uncompressor.sv"]\"  -work altera_merlin_slave_agent_1921"                                                
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_avalon_sc_fifo_1932/sim/ed_synth_altera_avalon_sc_fifo_1932_w27kryi.v"]\"  -work altera_avalon_sc_fifo_1932"                                                  
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_router_1921/sim/ed_synth_altera_merlin_router_1921_6o4duly.sv"]\"  -work altera_merlin_router_1921"                                                
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_router_1921/sim/ed_synth_altera_merlin_router_1921_rw4aowa.sv"]\"  -work altera_merlin_router_1921"                                                
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_traffic_limiter_1921/sim/ed_synth_altera_merlin_traffic_limiter_altera_avalon_sc_fifo_1921_lz6y5lq.v"]\"  -work altera_merlin_traffic_limiter_1921"    
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_traffic_limiter_1921/sim/altera_merlin_reorder_memory.sv"]\"  -work altera_merlin_traffic_limiter_1921"                                            
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_traffic_limiter_1921/sim/altera_avalon_st_pipeline_base.v"]\"  -work altera_merlin_traffic_limiter_1921"                                           
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_traffic_limiter_1921/sim/ed_synth_altera_merlin_traffic_limiter_1921_szstqri.sv"]\"  -work altera_merlin_traffic_limiter_1921"                     
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_demultiplexer_1921/sim/ed_synth_altera_merlin_demultiplexer_1921_neeot2q.sv"]\"  -work altera_merlin_demultiplexer_1921"                           
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/ed_synth_altera_merlin_multiplexer_1922_dev6hai.sv"]\"  -work altera_merlin_multiplexer_1922"                                 
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/altera_merlin_arbitrator.sv"]\"  -work altera_merlin_multiplexer_1922"                                                        
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_demultiplexer_1921/sim/ed_synth_altera_merlin_demultiplexer_1921_nfut5ki.sv"]\"  -work altera_merlin_demultiplexer_1921"                           
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/ed_synth_altera_merlin_multiplexer_1922_oc7ugyi.sv"]\"  -work altera_merlin_multiplexer_1922"                                 
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/altera_merlin_arbitrator.sv"]\"  -work altera_merlin_multiplexer_1922"                                                        
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../hs_clk_xer_1940/sim/ed_synth_hs_clk_xer_1940_atfpa3y.v"]\"  -work hs_clk_xer_1940"                                                                                   
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../hs_clk_xer_1940/sim/alt_hiconnect_clock_crosser.v"]\"  -work hs_clk_xer_1940"                                                                                    
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../hs_clk_xer_1940/sim/altera_reset_synchronizer.v"]\"  -work hs_clk_xer_1940"                                                                                      
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../hs_clk_xer_1940/sim/alt_hiconnect_pipeline_base.v"]\"  -work hs_clk_xer_1940"                                                                                    
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../hs_clk_xer_1940/sim/altera_std_synchronizer.v"]\"  -work hs_clk_xer_1940"                                                                                        
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_mm_interconnect_1920/sim/ed_synth_altera_mm_interconnect_1920_ff4yeri.v"]\"  -work altera_mm_interconnect_1920"                                               
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_router_1921/sim/ed_synth_altera_merlin_router_1921_jb32znq.sv"]\"  -work altera_merlin_router_1921"                                                
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_router_1921/sim/ed_synth_altera_merlin_router_1921_lddaspi.sv"]\"  -work altera_merlin_router_1921"                                                
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_traffic_limiter_1921/sim/ed_synth_altera_merlin_traffic_limiter_altera_avalon_sc_fifo_1921_yakoiti.v"]\"  -work altera_merlin_traffic_limiter_1921"    
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_traffic_limiter_1921/sim/altera_merlin_reorder_memory.sv"]\"  -work altera_merlin_traffic_limiter_1921"                                            
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_traffic_limiter_1921/sim/altera_avalon_st_pipeline_base.v"]\"  -work altera_merlin_traffic_limiter_1921"                                           
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_traffic_limiter_1921/sim/ed_synth_altera_merlin_traffic_limiter_1921_png7fji.sv"]\"  -work altera_merlin_traffic_limiter_1921"                     
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_avalon_st_pipeline_stage_1930/sim/ed_synth_altera_avalon_st_pipeline_stage_1930_bv2ucky.sv"]\"  -work altera_avalon_st_pipeline_stage_1930"               
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_avalon_st_pipeline_stage_1930/sim/altera_avalon_st_pipeline_base.v"]\"  -work altera_avalon_st_pipeline_stage_1930"                                       
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_burst_adapter_1932/sim/ed_synth_altera_merlin_burst_adapter_altera_avalon_st_pipeline_stage_1932_uhc7owi.v"]\"  -work altera_merlin_burst_adapter_1932"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_burst_adapter_1932/sim/ed_synth_altera_merlin_burst_adapter_1932_nqmwb7q.sv"]\"  -work altera_merlin_burst_adapter_1932"                           
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_burst_adapter_1932/sim/altera_merlin_burst_adapter_uncmpr.sv"]\"  -work altera_merlin_burst_adapter_1932"                                          
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_burst_adapter_1932/sim/altera_merlin_burst_adapter_13_1.sv"]\"  -work altera_merlin_burst_adapter_1932"                                            
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_burst_adapter_1932/sim/altera_merlin_burst_adapter_new.sv"]\"  -work altera_merlin_burst_adapter_1932"                                             
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_burst_adapter_1932/sim/altera_incr_burst_converter.sv"]\"  -work altera_merlin_burst_adapter_1932"                                                 
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_burst_adapter_1932/sim/altera_wrap_burst_converter.sv"]\"  -work altera_merlin_burst_adapter_1932"                                                 
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_burst_adapter_1932/sim/altera_default_burst_converter.sv"]\"  -work altera_merlin_burst_adapter_1932"                                              
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_burst_adapter_1932/sim/altera_merlin_address_alignment.sv"]\"  -work altera_merlin_burst_adapter_1932"                                             
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_demultiplexer_1921/sim/ed_synth_altera_merlin_demultiplexer_1921_3b7u5vy.sv"]\"  -work altera_merlin_demultiplexer_1921"                           
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/ed_synth_altera_merlin_multiplexer_1922_lyvfqtq.sv"]\"  -work altera_merlin_multiplexer_1922"                                 
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/altera_merlin_arbitrator.sv"]\"  -work altera_merlin_multiplexer_1922"                                                        
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_demultiplexer_1921/sim/ed_synth_altera_merlin_demultiplexer_1921_i5h7mzy.sv"]\"  -work altera_merlin_demultiplexer_1921"                           
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/ed_synth_altera_merlin_multiplexer_1922_sxcm7mi.sv"]\"  -work altera_merlin_multiplexer_1922"                                 
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/altera_merlin_arbitrator.sv"]\"  -work altera_merlin_multiplexer_1922"                                                        
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_width_adapter_1940/sim/ed_synth_altera_merlin_width_adapter_1940_tauypsy.sv"]\"  -work altera_merlin_width_adapter_1940"                           
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_width_adapter_1940/sim/altera_merlin_address_alignment.sv"]\"  -work altera_merlin_width_adapter_1940"                                             
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_width_adapter_1940/sim/altera_merlin_burst_uncompressor.sv"]\"  -work altera_merlin_width_adapter_1940"                                            
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_width_adapter_1940/sim/ed_synth_altera_merlin_width_adapter_1940_tqsyyjy.sv"]\"  -work altera_merlin_width_adapter_1940"                           
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_width_adapter_1940/sim/altera_merlin_address_alignment.sv"]\"  -work altera_merlin_width_adapter_1940"                                             
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_width_adapter_1940/sim/altera_merlin_burst_uncompressor.sv"]\"  -work altera_merlin_width_adapter_1940"                                            
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../hs_clk_xer_1940/sim/ed_synth_hs_clk_xer_1940_u3a772q.v"]\"  -work hs_clk_xer_1940"                                                                                   
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../hs_clk_xer_1940/sim/alt_hiconnect_clock_crosser.v"]\"  -work hs_clk_xer_1940"                                                                                    
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../hs_clk_xer_1940/sim/altera_reset_synchronizer.v"]\"  -work hs_clk_xer_1940"                                                                                      
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../hs_clk_xer_1940/sim/alt_hiconnect_pipeline_base.v"]\"  -work hs_clk_xer_1940"                                                                                    
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../hs_clk_xer_1940/sim/altera_std_synchronizer.v"]\"  -work hs_clk_xer_1940"                                                                                        
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_mm_interconnect_1920/sim/ed_synth_altera_mm_interconnect_1920_urzwi2q.v"]\"  -work altera_mm_interconnect_1920"                                               
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_reset_controller_1922/sim/altera_reset_controller.v"]\"  -work altera_reset_controller_1922"                                                                  
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_reset_controller_1922/sim/altera_reset_synchronizer.v"]\"  -work altera_reset_controller_1922"                                                                
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/ed_synth.v"]\"  -work ed_synth"                                                                                                                                         
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
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [ed_synth_reset_bridge_eth::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [ed_synth_clock_bridge_eth::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [ed_synth_capture_if_top_0::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [ed_synth_ninit_done_inst::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [ddr4_wr_rd::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [ed_synth_clock_bridge_dspby2::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [ed_synth_clock_bridge_dsp::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [reset_csr::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [ed_synth_reset_bridge_dsp::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [clock_csr::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [ed_synth_h2f_bridge::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [ed_synth_h2f_lw_bridge::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $ELAB_OPTIONS
  }
  
  
  proc get_sim_options {SIMULATOR_TOOL_BITNESS} {
    set SIM_OPTIONS ""
    append SIM_OPTIONS [ed_synth_reset_bridge_eth::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [ed_synth_clock_bridge_eth::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [ed_synth_capture_if_top_0::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [ed_synth_ninit_done_inst::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [ddr4_wr_rd::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [ed_synth_clock_bridge_dspby2::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [ed_synth_clock_bridge_dsp::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [reset_csr::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [ed_synth_reset_bridge_dsp::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [clock_csr::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [ed_synth_h2f_bridge::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [ed_synth_h2f_lw_bridge::get_sim_options $SIMULATOR_TOOL_BITNESS]
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $SIM_OPTIONS
  }
  
  
  proc get_env_variables {SIMULATOR_TOOL_BITNESS} {
    set ENV_VARIABLES [dict create]
    set LD_LIBRARY_PATH [dict create]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [ed_synth_reset_bridge_eth::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [ed_synth_clock_bridge_eth::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [ed_synth_capture_if_top_0::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [ed_synth_ninit_done_inst::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [ddr4_wr_rd::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [ed_synth_clock_bridge_dspby2::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [ed_synth_clock_bridge_dsp::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [reset_csr::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [ed_synth_reset_bridge_dsp::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [clock_csr::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [ed_synth_h2f_bridge::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [ed_synth_h2f_lw_bridge::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
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
    set libraries [dict merge $libraries [ed_synth_reset_bridge_eth::get_dpi_libraries "$QSYS_SIMDIR/../../ip/ed_synth/ed_synth_reset_bridge_eth/sim/"]]
    set libraries [dict merge $libraries [ed_synth_clock_bridge_eth::get_dpi_libraries "$QSYS_SIMDIR/../../ip/ed_synth/ed_synth_clock_bridge_eth/sim/"]]
    set libraries [dict merge $libraries [ed_synth_capture_if_top_0::get_dpi_libraries "$QSYS_SIMDIR/../../ip/ed_synth/ed_synth_capture_if_top_0/sim/"]]
    set libraries [dict merge $libraries [ed_synth_ninit_done_inst::get_dpi_libraries "$QSYS_SIMDIR/../../ip/ed_synth/ed_synth_ninit_done_inst/sim/"]]
    set libraries [dict merge $libraries [ddr4_wr_rd::get_dpi_libraries "$QSYS_SIMDIR/../../ddr4_wr_rd/sim/"]]
    set libraries [dict merge $libraries [ed_synth_clock_bridge_dspby2::get_dpi_libraries "$QSYS_SIMDIR/../../ip/ed_synth/ed_synth_clock_bridge_dspby2/sim/"]]
    set libraries [dict merge $libraries [ed_synth_clock_bridge_dsp::get_dpi_libraries "$QSYS_SIMDIR/../../ip/ed_synth/ed_synth_clock_bridge_dsp/sim/"]]
    set libraries [dict merge $libraries [reset_csr::get_dpi_libraries "$QSYS_SIMDIR/../../ip/ed_synth/reset_csr/sim/"]]
    set libraries [dict merge $libraries [ed_synth_reset_bridge_dsp::get_dpi_libraries "$QSYS_SIMDIR/../../ip/ed_synth/ed_synth_reset_bridge_dsp/sim/"]]
    set libraries [dict merge $libraries [clock_csr::get_dpi_libraries "$QSYS_SIMDIR/../../ip/ed_synth/clock_csr/sim/"]]
    set libraries [dict merge $libraries [ed_synth_h2f_bridge::get_dpi_libraries "$QSYS_SIMDIR/../../ip/ed_synth/ed_synth_h2f_bridge/sim/"]]
    set libraries [dict merge $libraries [ed_synth_h2f_lw_bridge::get_dpi_libraries "$QSYS_SIMDIR/../../ip/ed_synth/ed_synth_h2f_lw_bridge/sim/"]]
    
    return $libraries
  }
  
}
