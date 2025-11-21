source [file join [file dirname [info script]] ./../../../ip/dma_subsystem/dma_clk_out_bridge_0/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../subsys_ftile_25gbe_1588/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/dma_subsystem/rx_dma_reset_bridge_0/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/dma_subsystem/rx_dma_reset_bridge_1/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/subsys_ftile_25gbe_1588/subsys_ftile_25gbe_1588_ninitdone_reset/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/subsys_ftile_25gbe_1588/subsys_ftile_25gbe_1588_dmaclkout_reset/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/subsys_ftile_25gbe_1588/iopll_clk_avst_div2/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/dma_subsystem/dma_ss_master/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/dma_subsystem/acp_bridge_in_clk/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/dma_subsystem/dma_rst_100/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/dma_subsystem/dma_clk_100/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/qsys_top/ext_hps_m_master/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/dma_subsystem/oclk_pll_clock_bridge_0/sim/common/modelsim_files.tcl]

namespace eval dma_subsystem {
  proc get_design_libraries {} {
    set libraries [dict create]
    set libraries [dict merge $libraries [dma_clk_out_bridge_0::get_design_libraries]]
    set libraries [dict merge $libraries [subsys_ftile_25gbe_1588::get_design_libraries]]
    set libraries [dict merge $libraries [rx_dma_reset_bridge_0::get_design_libraries]]
    set libraries [dict merge $libraries [rx_dma_reset_bridge_1::get_design_libraries]]
    set libraries [dict merge $libraries [subsys_ftile_25gbe_1588_ninitdone_reset::get_design_libraries]]
    set libraries [dict merge $libraries [subsys_ftile_25gbe_1588_dmaclkout_reset::get_design_libraries]]
    set libraries [dict merge $libraries [iopll_clk_avst_div2::get_design_libraries]]
    set libraries [dict merge $libraries [dma_ss_master::get_design_libraries]]
    set libraries [dict merge $libraries [acp_bridge_in_clk::get_design_libraries]]
    set libraries [dict merge $libraries [dma_rst_100::get_design_libraries]]
    set libraries [dict merge $libraries [dma_clk_100::get_design_libraries]]
    set libraries [dict merge $libraries [ext_hps_m_master::get_design_libraries]]
    set libraries [dict merge $libraries [oclk_pll_clock_bridge_0::get_design_libraries]]
    dict set libraries altera_merlin_master_translator_192 1
    dict set libraries altera_merlin_slave_translator_191  1
    dict set libraries altera_merlin_master_agent_1922     1
    dict set libraries altera_merlin_slave_agent_1921      1
    dict set libraries altera_avalon_sc_fifo_1932          1
    dict set libraries altera_merlin_router_1921           1
    dict set libraries altera_merlin_demultiplexer_1921    1
    dict set libraries altera_merlin_multiplexer_1922      1
    dict set libraries altera_merlin_width_adapter_1940    1
    dict set libraries altera_mm_interconnect_1920         1
    dict set libraries altera_reset_controller_1922        1
    dict set libraries dma_subsystem                       1
    return $libraries
  }
  
  proc get_memory_files {QSYS_SIMDIR} {
    set memory_files [list]
    set memory_files [concat $memory_files [dma_clk_out_bridge_0::get_memory_files "$QSYS_SIMDIR/../../ip/dma_subsystem/dma_clk_out_bridge_0/sim/"]]
    set memory_files [concat $memory_files [subsys_ftile_25gbe_1588::get_memory_files "$QSYS_SIMDIR/../../subsys_ftile_25gbe_1588/sim/"]]
    set memory_files [concat $memory_files [rx_dma_reset_bridge_0::get_memory_files "$QSYS_SIMDIR/../../ip/dma_subsystem/rx_dma_reset_bridge_0/sim/"]]
    set memory_files [concat $memory_files [rx_dma_reset_bridge_1::get_memory_files "$QSYS_SIMDIR/../../ip/dma_subsystem/rx_dma_reset_bridge_1/sim/"]]
    set memory_files [concat $memory_files [subsys_ftile_25gbe_1588_ninitdone_reset::get_memory_files "$QSYS_SIMDIR/../../ip/subsys_ftile_25gbe_1588/subsys_ftile_25gbe_1588_ninitdone_reset/sim/"]]
    set memory_files [concat $memory_files [subsys_ftile_25gbe_1588_dmaclkout_reset::get_memory_files "$QSYS_SIMDIR/../../ip/subsys_ftile_25gbe_1588/subsys_ftile_25gbe_1588_dmaclkout_reset/sim/"]]
    set memory_files [concat $memory_files [iopll_clk_avst_div2::get_memory_files "$QSYS_SIMDIR/../../ip/subsys_ftile_25gbe_1588/iopll_clk_avst_div2/sim/"]]
    set memory_files [concat $memory_files [dma_ss_master::get_memory_files "$QSYS_SIMDIR/../../ip/dma_subsystem/dma_ss_master/sim/"]]
    set memory_files [concat $memory_files [acp_bridge_in_clk::get_memory_files "$QSYS_SIMDIR/../../ip/dma_subsystem/acp_bridge_in_clk/sim/"]]
    set memory_files [concat $memory_files [dma_rst_100::get_memory_files "$QSYS_SIMDIR/../../ip/dma_subsystem/dma_rst_100/sim/"]]
    set memory_files [concat $memory_files [dma_clk_100::get_memory_files "$QSYS_SIMDIR/../../ip/dma_subsystem/dma_clk_100/sim/"]]
    set memory_files [concat $memory_files [ext_hps_m_master::get_memory_files "$QSYS_SIMDIR/../../ip/qsys_top/ext_hps_m_master/sim/"]]
    set memory_files [concat $memory_files [oclk_pll_clock_bridge_0::get_memory_files "$QSYS_SIMDIR/../../ip/dma_subsystem/oclk_pll_clock_bridge_0/sim/"]]
    return $memory_files
  }
  
  proc get_common_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [dict create]
    set design_files [dict merge $design_files [dma_clk_out_bridge_0::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/dma_subsystem/dma_clk_out_bridge_0/sim/"]]
    set design_files [dict merge $design_files [subsys_ftile_25gbe_1588::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../subsys_ftile_25gbe_1588/sim/"]]
    set design_files [dict merge $design_files [rx_dma_reset_bridge_0::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/dma_subsystem/rx_dma_reset_bridge_0/sim/"]]
    set design_files [dict merge $design_files [rx_dma_reset_bridge_1::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/dma_subsystem/rx_dma_reset_bridge_1/sim/"]]
    set design_files [dict merge $design_files [subsys_ftile_25gbe_1588_ninitdone_reset::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/subsys_ftile_25gbe_1588/subsys_ftile_25gbe_1588_ninitdone_reset/sim/"]]
    set design_files [dict merge $design_files [subsys_ftile_25gbe_1588_dmaclkout_reset::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/subsys_ftile_25gbe_1588/subsys_ftile_25gbe_1588_dmaclkout_reset/sim/"]]
    set design_files [dict merge $design_files [iopll_clk_avst_div2::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/subsys_ftile_25gbe_1588/iopll_clk_avst_div2/sim/"]]
    set design_files [dict merge $design_files [dma_ss_master::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/dma_subsystem/dma_ss_master/sim/"]]
    set design_files [dict merge $design_files [acp_bridge_in_clk::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/dma_subsystem/acp_bridge_in_clk/sim/"]]
    set design_files [dict merge $design_files [dma_rst_100::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/dma_subsystem/dma_rst_100/sim/"]]
    set design_files [dict merge $design_files [dma_clk_100::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/dma_subsystem/dma_clk_100/sim/"]]
    set design_files [dict merge $design_files [ext_hps_m_master::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/qsys_top/ext_hps_m_master/sim/"]]
    set design_files [dict merge $design_files [oclk_pll_clock_bridge_0::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/dma_subsystem/oclk_pll_clock_bridge_0/sim/"]]
    return $design_files
  }
  
  proc get_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [list]
    set design_files [concat $design_files [dma_clk_out_bridge_0::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/dma_subsystem/dma_clk_out_bridge_0/sim/"]]
    set design_files [concat $design_files [subsys_ftile_25gbe_1588::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../subsys_ftile_25gbe_1588/sim/"]]
    set design_files [concat $design_files [rx_dma_reset_bridge_0::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/dma_subsystem/rx_dma_reset_bridge_0/sim/"]]
    set design_files [concat $design_files [rx_dma_reset_bridge_1::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/dma_subsystem/rx_dma_reset_bridge_1/sim/"]]
    set design_files [concat $design_files [subsys_ftile_25gbe_1588_ninitdone_reset::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/subsys_ftile_25gbe_1588/subsys_ftile_25gbe_1588_ninitdone_reset/sim/"]]
    set design_files [concat $design_files [subsys_ftile_25gbe_1588_dmaclkout_reset::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/subsys_ftile_25gbe_1588/subsys_ftile_25gbe_1588_dmaclkout_reset/sim/"]]
    set design_files [concat $design_files [iopll_clk_avst_div2::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/subsys_ftile_25gbe_1588/iopll_clk_avst_div2/sim/"]]
    set design_files [concat $design_files [dma_ss_master::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/dma_subsystem/dma_ss_master/sim/"]]
    set design_files [concat $design_files [acp_bridge_in_clk::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/dma_subsystem/acp_bridge_in_clk/sim/"]]
    set design_files [concat $design_files [dma_rst_100::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/dma_subsystem/dma_rst_100/sim/"]]
    set design_files [concat $design_files [dma_clk_100::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/dma_subsystem/dma_clk_100/sim/"]]
    set design_files [concat $design_files [ext_hps_m_master::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/qsys_top/ext_hps_m_master/sim/"]]
    set design_files [concat $design_files [oclk_pll_clock_bridge_0::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/dma_subsystem/oclk_pll_clock_bridge_0/sim/"]]
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_master_translator_192/sim/dma_subsystem_altera_merlin_master_translator_192_lykd4la.sv"]\"  -work altera_merlin_master_translator_192"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_slave_translator_191/sim/dma_subsystem_altera_merlin_slave_translator_191_x56fcki.sv"]\"  -work altera_merlin_slave_translator_191"   
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_master_agent_1922/sim/dma_subsystem_altera_merlin_master_agent_1922_fy3n5ti.sv"]\"  -work altera_merlin_master_agent_1922"            
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_slave_agent_1921/sim/dma_subsystem_altera_merlin_slave_agent_1921_b6r3djy.sv"]\"  -work altera_merlin_slave_agent_1921"               
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_slave_agent_1921/sim/altera_merlin_burst_uncompressor.sv"]\"  -work altera_merlin_slave_agent_1921"                                   
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_avalon_sc_fifo_1932/sim/dma_subsystem_altera_avalon_sc_fifo_1932_w27kryi.v"]\"  -work altera_avalon_sc_fifo_1932"                                
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_router_1921/sim/dma_subsystem_altera_merlin_router_1921_4z4erfy.sv"]\"  -work altera_merlin_router_1921"                              
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_router_1921/sim/dma_subsystem_altera_merlin_router_1921_b2yjicy.sv"]\"  -work altera_merlin_router_1921"                              
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_demultiplexer_1921/sim/dma_subsystem_altera_merlin_demultiplexer_1921_alpsjpq.sv"]\"  -work altera_merlin_demultiplexer_1921"         
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/dma_subsystem_altera_merlin_multiplexer_1922_kdc5rdy.sv"]\"  -work altera_merlin_multiplexer_1922"               
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/altera_merlin_arbitrator.sv"]\"  -work altera_merlin_multiplexer_1922"                                           
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_demultiplexer_1921/sim/dma_subsystem_altera_merlin_demultiplexer_1921_xf52ssy.sv"]\"  -work altera_merlin_demultiplexer_1921"         
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/dma_subsystem_altera_merlin_multiplexer_1922_wrp2kuy.sv"]\"  -work altera_merlin_multiplexer_1922"               
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/altera_merlin_arbitrator.sv"]\"  -work altera_merlin_multiplexer_1922"                                           
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_width_adapter_1940/sim/dma_subsystem_altera_merlin_width_adapter_1940_ej7cnji.sv"]\"  -work altera_merlin_width_adapter_1940"         
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_width_adapter_1940/sim/altera_merlin_address_alignment.sv"]\"  -work altera_merlin_width_adapter_1940"                                
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_width_adapter_1940/sim/altera_merlin_burst_uncompressor.sv"]\"  -work altera_merlin_width_adapter_1940"                               
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_width_adapter_1940/sim/dma_subsystem_altera_merlin_width_adapter_1940_qtyqhia.sv"]\"  -work altera_merlin_width_adapter_1940"         
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_width_adapter_1940/sim/altera_merlin_address_alignment.sv"]\"  -work altera_merlin_width_adapter_1940"                                
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_width_adapter_1940/sim/altera_merlin_burst_uncompressor.sv"]\"  -work altera_merlin_width_adapter_1940"                               
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_mm_interconnect_1920/sim/dma_subsystem_altera_mm_interconnect_1920_3nhysga.v"]\"  -work altera_mm_interconnect_1920"                             
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_reset_controller_1922/sim/altera_reset_controller.v"]\"  -work altera_reset_controller_1922"                                                     
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_reset_controller_1922/sim/altera_reset_synchronizer.v"]\"  -work altera_reset_controller_1922"                                                   
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/dma_subsystem.v"]\"  -work dma_subsystem"                                                                                                                  
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
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [dma_clk_out_bridge_0::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [subsys_ftile_25gbe_1588::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [rx_dma_reset_bridge_0::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [rx_dma_reset_bridge_1::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [subsys_ftile_25gbe_1588_ninitdone_reset::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [subsys_ftile_25gbe_1588_dmaclkout_reset::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [iopll_clk_avst_div2::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [dma_ss_master::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [acp_bridge_in_clk::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [dma_rst_100::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [dma_clk_100::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [ext_hps_m_master::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [oclk_pll_clock_bridge_0::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $ELAB_OPTIONS
  }
  
  
  proc get_sim_options {SIMULATOR_TOOL_BITNESS} {
    set SIM_OPTIONS ""
    append SIM_OPTIONS [dma_clk_out_bridge_0::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [subsys_ftile_25gbe_1588::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [rx_dma_reset_bridge_0::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [rx_dma_reset_bridge_1::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [subsys_ftile_25gbe_1588_ninitdone_reset::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [subsys_ftile_25gbe_1588_dmaclkout_reset::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [iopll_clk_avst_div2::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [dma_ss_master::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [acp_bridge_in_clk::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [dma_rst_100::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [dma_clk_100::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [ext_hps_m_master::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [oclk_pll_clock_bridge_0::get_sim_options $SIMULATOR_TOOL_BITNESS]
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $SIM_OPTIONS
  }
  
  
  proc get_env_variables {SIMULATOR_TOOL_BITNESS} {
    set ENV_VARIABLES [dict create]
    set LD_LIBRARY_PATH [dict create]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [dma_clk_out_bridge_0::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [subsys_ftile_25gbe_1588::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [rx_dma_reset_bridge_0::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [rx_dma_reset_bridge_1::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [subsys_ftile_25gbe_1588_ninitdone_reset::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [subsys_ftile_25gbe_1588_dmaclkout_reset::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [iopll_clk_avst_div2::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [dma_ss_master::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [acp_bridge_in_clk::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [dma_rst_100::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [dma_clk_100::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [ext_hps_m_master::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [oclk_pll_clock_bridge_0::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
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
    set libraries [dict merge $libraries [dma_clk_out_bridge_0::get_dpi_libraries "$QSYS_SIMDIR/../../ip/dma_subsystem/dma_clk_out_bridge_0/sim/"]]
    set libraries [dict merge $libraries [subsys_ftile_25gbe_1588::get_dpi_libraries "$QSYS_SIMDIR/../../subsys_ftile_25gbe_1588/sim/"]]
    set libraries [dict merge $libraries [rx_dma_reset_bridge_0::get_dpi_libraries "$QSYS_SIMDIR/../../ip/dma_subsystem/rx_dma_reset_bridge_0/sim/"]]
    set libraries [dict merge $libraries [rx_dma_reset_bridge_1::get_dpi_libraries "$QSYS_SIMDIR/../../ip/dma_subsystem/rx_dma_reset_bridge_1/sim/"]]
    set libraries [dict merge $libraries [subsys_ftile_25gbe_1588_ninitdone_reset::get_dpi_libraries "$QSYS_SIMDIR/../../ip/subsys_ftile_25gbe_1588/subsys_ftile_25gbe_1588_ninitdone_reset/sim/"]]
    set libraries [dict merge $libraries [subsys_ftile_25gbe_1588_dmaclkout_reset::get_dpi_libraries "$QSYS_SIMDIR/../../ip/subsys_ftile_25gbe_1588/subsys_ftile_25gbe_1588_dmaclkout_reset/sim/"]]
    set libraries [dict merge $libraries [iopll_clk_avst_div2::get_dpi_libraries "$QSYS_SIMDIR/../../ip/subsys_ftile_25gbe_1588/iopll_clk_avst_div2/sim/"]]
    set libraries [dict merge $libraries [dma_ss_master::get_dpi_libraries "$QSYS_SIMDIR/../../ip/dma_subsystem/dma_ss_master/sim/"]]
    set libraries [dict merge $libraries [acp_bridge_in_clk::get_dpi_libraries "$QSYS_SIMDIR/../../ip/dma_subsystem/acp_bridge_in_clk/sim/"]]
    set libraries [dict merge $libraries [dma_rst_100::get_dpi_libraries "$QSYS_SIMDIR/../../ip/dma_subsystem/dma_rst_100/sim/"]]
    set libraries [dict merge $libraries [dma_clk_100::get_dpi_libraries "$QSYS_SIMDIR/../../ip/dma_subsystem/dma_clk_100/sim/"]]
    set libraries [dict merge $libraries [ext_hps_m_master::get_dpi_libraries "$QSYS_SIMDIR/../../ip/qsys_top/ext_hps_m_master/sim/"]]
    set libraries [dict merge $libraries [oclk_pll_clock_bridge_0::get_dpi_libraries "$QSYS_SIMDIR/../../ip/dma_subsystem/oclk_pll_clock_bridge_0/sim/"]]
    
    return $libraries
  }
  
}
