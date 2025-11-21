source [file join [file dirname [info script]] ./../../../ip/ddr4_wr_rd/ddr4_wr_rd_address_span_extender_2/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/ddr4_wr_rd/ddr4_wr_rd_mm_bridge_1/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/ddr4_wr_rd/ddr4_wr_rd_intel_onchip_memory_1/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/ddr4_wr_rd/ddr4_wr_rd_reset_bridge_0/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/ddr4_wr_rd/ed_synth_msgdma_0/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/ddr4_wr_rd/ed_synth_mm_bridge_0/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/ddr4_wr_rd/ddr4_wr_rd_clock_bridge_0/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/ddr4_wr_rd/ed_synth_address_span_extender_0/sim/common/modelsim_files.tcl]

namespace eval ddr4_wr_rd {
  proc get_design_libraries {} {
    set libraries [dict create]
    set libraries [dict merge $libraries [ddr4_wr_rd_address_span_extender_2::get_design_libraries]]
    set libraries [dict merge $libraries [ddr4_wr_rd_mm_bridge_1::get_design_libraries]]
    set libraries [dict merge $libraries [ddr4_wr_rd_intel_onchip_memory_1::get_design_libraries]]
    set libraries [dict merge $libraries [ddr4_wr_rd_reset_bridge_0::get_design_libraries]]
    set libraries [dict merge $libraries [ed_synth_msgdma_0::get_design_libraries]]
    set libraries [dict merge $libraries [ed_synth_mm_bridge_0::get_design_libraries]]
    set libraries [dict merge $libraries [ddr4_wr_rd_clock_bridge_0::get_design_libraries]]
    set libraries [dict merge $libraries [ed_synth_address_span_extender_0::get_design_libraries]]
    dict set libraries altera_merlin_master_translator_192  1
    dict set libraries altera_merlin_slave_translator_191   1
    dict set libraries altera_mm_interconnect_1920          1
    dict set libraries altera_merlin_master_agent_1922      1
    dict set libraries altera_merlin_slave_agent_1921       1
    dict set libraries altera_avalon_sc_fifo_1932           1
    dict set libraries altera_merlin_router_1921            1
    dict set libraries altera_merlin_traffic_limiter_1921   1
    dict set libraries altera_merlin_demultiplexer_1921     1
    dict set libraries altera_merlin_multiplexer_1922       1
    dict set libraries altera_merlin_width_adapter_1940     1
    dict set libraries altera_avalon_st_pipeline_stage_1930 1
    dict set libraries altera_merlin_burst_adapter_1932     1
    dict set libraries altera_reset_controller_1922         1
    dict set libraries ddr4_wr_rd                           1
    return $libraries
  }
  
  proc get_memory_files {QSYS_SIMDIR} {
    set memory_files [list]
    set memory_files [concat $memory_files [ddr4_wr_rd_address_span_extender_2::get_memory_files "$QSYS_SIMDIR/../../ip/ddr4_wr_rd/ddr4_wr_rd_address_span_extender_2/sim/"]]
    set memory_files [concat $memory_files [ddr4_wr_rd_mm_bridge_1::get_memory_files "$QSYS_SIMDIR/../../ip/ddr4_wr_rd/ddr4_wr_rd_mm_bridge_1/sim/"]]
    set memory_files [concat $memory_files [ddr4_wr_rd_intel_onchip_memory_1::get_memory_files "$QSYS_SIMDIR/../../ip/ddr4_wr_rd/ddr4_wr_rd_intel_onchip_memory_1/sim/"]]
    set memory_files [concat $memory_files [ddr4_wr_rd_reset_bridge_0::get_memory_files "$QSYS_SIMDIR/../../ip/ddr4_wr_rd/ddr4_wr_rd_reset_bridge_0/sim/"]]
    set memory_files [concat $memory_files [ed_synth_msgdma_0::get_memory_files "$QSYS_SIMDIR/../../ip/ddr4_wr_rd/ed_synth_msgdma_0/sim/"]]
    set memory_files [concat $memory_files [ed_synth_mm_bridge_0::get_memory_files "$QSYS_SIMDIR/../../ip/ddr4_wr_rd/ed_synth_mm_bridge_0/sim/"]]
    set memory_files [concat $memory_files [ddr4_wr_rd_clock_bridge_0::get_memory_files "$QSYS_SIMDIR/../../ip/ddr4_wr_rd/ddr4_wr_rd_clock_bridge_0/sim/"]]
    set memory_files [concat $memory_files [ed_synth_address_span_extender_0::get_memory_files "$QSYS_SIMDIR/../../ip/ddr4_wr_rd/ed_synth_address_span_extender_0/sim/"]]
    return $memory_files
  }
  
  proc get_common_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [dict create]
    set design_files [dict merge $design_files [ddr4_wr_rd_address_span_extender_2::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/ddr4_wr_rd/ddr4_wr_rd_address_span_extender_2/sim/"]]
    set design_files [dict merge $design_files [ddr4_wr_rd_mm_bridge_1::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/ddr4_wr_rd/ddr4_wr_rd_mm_bridge_1/sim/"]]
    set design_files [dict merge $design_files [ddr4_wr_rd_intel_onchip_memory_1::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/ddr4_wr_rd/ddr4_wr_rd_intel_onchip_memory_1/sim/"]]
    set design_files [dict merge $design_files [ddr4_wr_rd_reset_bridge_0::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/ddr4_wr_rd/ddr4_wr_rd_reset_bridge_0/sim/"]]
    set design_files [dict merge $design_files [ed_synth_msgdma_0::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/ddr4_wr_rd/ed_synth_msgdma_0/sim/"]]
    set design_files [dict merge $design_files [ed_synth_mm_bridge_0::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/ddr4_wr_rd/ed_synth_mm_bridge_0/sim/"]]
    set design_files [dict merge $design_files [ddr4_wr_rd_clock_bridge_0::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/ddr4_wr_rd/ddr4_wr_rd_clock_bridge_0/sim/"]]
    set design_files [dict merge $design_files [ed_synth_address_span_extender_0::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/ddr4_wr_rd/ed_synth_address_span_extender_0/sim/"]]
    return $design_files
  }
  
  proc get_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [list]
    set design_files [concat $design_files [ddr4_wr_rd_address_span_extender_2::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/ddr4_wr_rd/ddr4_wr_rd_address_span_extender_2/sim/"]]
    set design_files [concat $design_files [ddr4_wr_rd_mm_bridge_1::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/ddr4_wr_rd/ddr4_wr_rd_mm_bridge_1/sim/"]]
    set design_files [concat $design_files [ddr4_wr_rd_intel_onchip_memory_1::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/ddr4_wr_rd/ddr4_wr_rd_intel_onchip_memory_1/sim/"]]
    set design_files [concat $design_files [ddr4_wr_rd_reset_bridge_0::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/ddr4_wr_rd/ddr4_wr_rd_reset_bridge_0/sim/"]]
    set design_files [concat $design_files [ed_synth_msgdma_0::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/ddr4_wr_rd/ed_synth_msgdma_0/sim/"]]
    set design_files [concat $design_files [ed_synth_mm_bridge_0::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/ddr4_wr_rd/ed_synth_mm_bridge_0/sim/"]]
    set design_files [concat $design_files [ddr4_wr_rd_clock_bridge_0::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/ddr4_wr_rd/ddr4_wr_rd_clock_bridge_0/sim/"]]
    set design_files [concat $design_files [ed_synth_address_span_extender_0::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/ddr4_wr_rd/ed_synth_address_span_extender_0/sim/"]]
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_master_translator_192/sim/ddr4_wr_rd_altera_merlin_master_translator_192_lykd4la.sv"]\"  -work altera_merlin_master_translator_192"                  
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_slave_translator_191/sim/ddr4_wr_rd_altera_merlin_slave_translator_191_x56fcki.sv"]\"  -work altera_merlin_slave_translator_191"                     
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_mm_interconnect_1920/sim/ddr4_wr_rd_altera_mm_interconnect_1920_co3wyjy.v"]\"  -work altera_mm_interconnect_1920"                                               
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_master_agent_1922/sim/ddr4_wr_rd_altera_merlin_master_agent_1922_fy3n5ti.sv"]\"  -work altera_merlin_master_agent_1922"                              
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_slave_agent_1921/sim/ddr4_wr_rd_altera_merlin_slave_agent_1921_b6r3djy.sv"]\"  -work altera_merlin_slave_agent_1921"                                 
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_slave_agent_1921/sim/altera_merlin_burst_uncompressor.sv"]\"  -work altera_merlin_slave_agent_1921"                                                  
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_avalon_sc_fifo_1932/sim/ddr4_wr_rd_altera_avalon_sc_fifo_1932_w27kryi.v"]\"  -work altera_avalon_sc_fifo_1932"                                                  
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_router_1921/sim/ddr4_wr_rd_altera_merlin_router_1921_drh4sty.sv"]\"  -work altera_merlin_router_1921"                                                
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_router_1921/sim/ddr4_wr_rd_altera_merlin_router_1921_4xpo7xa.sv"]\"  -work altera_merlin_router_1921"                                                
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_router_1921/sim/ddr4_wr_rd_altera_merlin_router_1921_3f32ddi.sv"]\"  -work altera_merlin_router_1921"                                                
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_traffic_limiter_1921/sim/ddr4_wr_rd_altera_merlin_traffic_limiter_altera_avalon_sc_fifo_1921_wq7ojcq.v"]\"  -work altera_merlin_traffic_limiter_1921"    
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_traffic_limiter_1921/sim/altera_merlin_reorder_memory.sv"]\"  -work altera_merlin_traffic_limiter_1921"                                              
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_traffic_limiter_1921/sim/altera_avalon_st_pipeline_base.v"]\"  -work altera_merlin_traffic_limiter_1921"                                             
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_traffic_limiter_1921/sim/ddr4_wr_rd_altera_merlin_traffic_limiter_1921_js7yfey.sv"]\"  -work altera_merlin_traffic_limiter_1921"                     
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_demultiplexer_1921/sim/ddr4_wr_rd_altera_merlin_demultiplexer_1921_jtkdvly.sv"]\"  -work altera_merlin_demultiplexer_1921"                           
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/ddr4_wr_rd_altera_merlin_multiplexer_1922_nft4wwa.sv"]\"  -work altera_merlin_multiplexer_1922"                                 
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/altera_merlin_arbitrator.sv"]\"  -work altera_merlin_multiplexer_1922"                                                          
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_demultiplexer_1921/sim/ddr4_wr_rd_altera_merlin_demultiplexer_1921_zpn2qzq.sv"]\"  -work altera_merlin_demultiplexer_1921"                           
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/ddr4_wr_rd_altera_merlin_multiplexer_1922_gahj7nq.sv"]\"  -work altera_merlin_multiplexer_1922"                                 
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/altera_merlin_arbitrator.sv"]\"  -work altera_merlin_multiplexer_1922"                                                          
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_width_adapter_1940/sim/ddr4_wr_rd_altera_merlin_width_adapter_1940_wifzxvi.sv"]\"  -work altera_merlin_width_adapter_1940"                           
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_width_adapter_1940/sim/altera_merlin_address_alignment.sv"]\"  -work altera_merlin_width_adapter_1940"                                               
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_width_adapter_1940/sim/altera_merlin_burst_uncompressor.sv"]\"  -work altera_merlin_width_adapter_1940"                                              
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_width_adapter_1940/sim/ddr4_wr_rd_altera_merlin_width_adapter_1940_puenm3y.sv"]\"  -work altera_merlin_width_adapter_1940"                           
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_width_adapter_1940/sim/altera_merlin_address_alignment.sv"]\"  -work altera_merlin_width_adapter_1940"                                               
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_width_adapter_1940/sim/altera_merlin_burst_uncompressor.sv"]\"  -work altera_merlin_width_adapter_1940"                                              
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_mm_interconnect_1920/sim/ddr4_wr_rd_altera_mm_interconnect_1920_dgurhwa.v"]\"  -work altera_mm_interconnect_1920"                                               
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_router_1921/sim/ddr4_wr_rd_altera_merlin_router_1921_h2hawyy.sv"]\"  -work altera_merlin_router_1921"                                                
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_router_1921/sim/ddr4_wr_rd_altera_merlin_router_1921_h43qxpi.sv"]\"  -work altera_merlin_router_1921"                                                
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_avalon_st_pipeline_stage_1930/sim/ddr4_wr_rd_altera_avalon_st_pipeline_stage_1930_bv2ucky.sv"]\"  -work altera_avalon_st_pipeline_stage_1930"               
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_avalon_st_pipeline_stage_1930/sim/altera_avalon_st_pipeline_base.v"]\"  -work altera_avalon_st_pipeline_stage_1930"                                         
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_burst_adapter_1932/sim/ddr4_wr_rd_altera_merlin_burst_adapter_altera_avalon_st_pipeline_stage_1932_ju72msa.v"]\"  -work altera_merlin_burst_adapter_1932"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_burst_adapter_1932/sim/ddr4_wr_rd_altera_merlin_burst_adapter_1932_577eeai.sv"]\"  -work altera_merlin_burst_adapter_1932"                           
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_burst_adapter_1932/sim/altera_merlin_burst_adapter_uncmpr.sv"]\"  -work altera_merlin_burst_adapter_1932"                                            
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_burst_adapter_1932/sim/altera_merlin_burst_adapter_13_1.sv"]\"  -work altera_merlin_burst_adapter_1932"                                              
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_burst_adapter_1932/sim/altera_merlin_burst_adapter_new.sv"]\"  -work altera_merlin_burst_adapter_1932"                                               
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_burst_adapter_1932/sim/altera_incr_burst_converter.sv"]\"  -work altera_merlin_burst_adapter_1932"                                                   
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_burst_adapter_1932/sim/altera_wrap_burst_converter.sv"]\"  -work altera_merlin_burst_adapter_1932"                                                   
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_burst_adapter_1932/sim/altera_default_burst_converter.sv"]\"  -work altera_merlin_burst_adapter_1932"                                                
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_burst_adapter_1932/sim/altera_merlin_address_alignment.sv"]\"  -work altera_merlin_burst_adapter_1932"                                               
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_demultiplexer_1921/sim/ddr4_wr_rd_altera_merlin_demultiplexer_1921_klex2oi.sv"]\"  -work altera_merlin_demultiplexer_1921"                           
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/ddr4_wr_rd_altera_merlin_multiplexer_1922_yjunmey.sv"]\"  -work altera_merlin_multiplexer_1922"                                 
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/altera_merlin_arbitrator.sv"]\"  -work altera_merlin_multiplexer_1922"                                                          
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_demultiplexer_1921/sim/ddr4_wr_rd_altera_merlin_demultiplexer_1921_nwqillq.sv"]\"  -work altera_merlin_demultiplexer_1921"                           
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/ddr4_wr_rd_altera_merlin_multiplexer_1922_slxoffy.sv"]\"  -work altera_merlin_multiplexer_1922"                                 
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/altera_merlin_arbitrator.sv"]\"  -work altera_merlin_multiplexer_1922"                                                          
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_mm_interconnect_1920/sim/ddr4_wr_rd_altera_mm_interconnect_1920_6lb3vry.v"]\"  -work altera_mm_interconnect_1920"                                               
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_reset_controller_1922/sim/altera_reset_controller.v"]\"  -work altera_reset_controller_1922"                                                                    
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_reset_controller_1922/sim/altera_reset_synchronizer.v"]\"  -work altera_reset_controller_1922"                                                                  
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/ddr4_wr_rd.v"]\"  -work ddr4_wr_rd"                                                                                                                                       
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
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [ddr4_wr_rd_address_span_extender_2::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [ddr4_wr_rd_mm_bridge_1::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [ddr4_wr_rd_intel_onchip_memory_1::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [ddr4_wr_rd_reset_bridge_0::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [ed_synth_msgdma_0::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [ed_synth_mm_bridge_0::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [ddr4_wr_rd_clock_bridge_0::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [ed_synth_address_span_extender_0::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $ELAB_OPTIONS
  }
  
  
  proc get_sim_options {SIMULATOR_TOOL_BITNESS} {
    set SIM_OPTIONS ""
    append SIM_OPTIONS [ddr4_wr_rd_address_span_extender_2::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [ddr4_wr_rd_mm_bridge_1::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [ddr4_wr_rd_intel_onchip_memory_1::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [ddr4_wr_rd_reset_bridge_0::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [ed_synth_msgdma_0::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [ed_synth_mm_bridge_0::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [ddr4_wr_rd_clock_bridge_0::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [ed_synth_address_span_extender_0::get_sim_options $SIMULATOR_TOOL_BITNESS]
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $SIM_OPTIONS
  }
  
  
  proc get_env_variables {SIMULATOR_TOOL_BITNESS} {
    set ENV_VARIABLES [dict create]
    set LD_LIBRARY_PATH [dict create]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [ddr4_wr_rd_address_span_extender_2::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [ddr4_wr_rd_mm_bridge_1::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [ddr4_wr_rd_intel_onchip_memory_1::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [ddr4_wr_rd_reset_bridge_0::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [ed_synth_msgdma_0::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [ed_synth_mm_bridge_0::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [ddr4_wr_rd_clock_bridge_0::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [ed_synth_address_span_extender_0::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
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
    set libraries [dict merge $libraries [ddr4_wr_rd_address_span_extender_2::get_dpi_libraries "$QSYS_SIMDIR/../../ip/ddr4_wr_rd/ddr4_wr_rd_address_span_extender_2/sim/"]]
    set libraries [dict merge $libraries [ddr4_wr_rd_mm_bridge_1::get_dpi_libraries "$QSYS_SIMDIR/../../ip/ddr4_wr_rd/ddr4_wr_rd_mm_bridge_1/sim/"]]
    set libraries [dict merge $libraries [ddr4_wr_rd_intel_onchip_memory_1::get_dpi_libraries "$QSYS_SIMDIR/../../ip/ddr4_wr_rd/ddr4_wr_rd_intel_onchip_memory_1/sim/"]]
    set libraries [dict merge $libraries [ddr4_wr_rd_reset_bridge_0::get_dpi_libraries "$QSYS_SIMDIR/../../ip/ddr4_wr_rd/ddr4_wr_rd_reset_bridge_0/sim/"]]
    set libraries [dict merge $libraries [ed_synth_msgdma_0::get_dpi_libraries "$QSYS_SIMDIR/../../ip/ddr4_wr_rd/ed_synth_msgdma_0/sim/"]]
    set libraries [dict merge $libraries [ed_synth_mm_bridge_0::get_dpi_libraries "$QSYS_SIMDIR/../../ip/ddr4_wr_rd/ed_synth_mm_bridge_0/sim/"]]
    set libraries [dict merge $libraries [ddr4_wr_rd_clock_bridge_0::get_dpi_libraries "$QSYS_SIMDIR/../../ip/ddr4_wr_rd/ddr4_wr_rd_clock_bridge_0/sim/"]]
    set libraries [dict merge $libraries [ed_synth_address_span_extender_0::get_dpi_libraries "$QSYS_SIMDIR/../../ip/ddr4_wr_rd/ed_synth_address_span_extender_0/sim/"]]
    
    return $libraries
  }
  
}
