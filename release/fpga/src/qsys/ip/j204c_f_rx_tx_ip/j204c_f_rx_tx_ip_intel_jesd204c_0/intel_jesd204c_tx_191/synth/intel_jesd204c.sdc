# (C) 2001-2024 Intel Corporation. All rights reserved.
# Your use of Intel Corporation's design tools, logic functions and other 
# software and tools, and its AMPP partner logic functions, and any output 
# files from any of the foregoing (including device programming or simulation 
# files), and any associated documentation or information are expressly subject 
# to the terms and conditions of the Intel Program License Subscription 
# Agreement, Intel FPGA IP License Agreement, or other applicable 
# license agreement, including, without limitation, that your use is for the 
# sole purpose of programming logic devices manufactured by Intel and sold by 
# Intel or its authorized distributors.  Please refer to the applicable 
# agreement for further details.



set jesd204_sdc_debug 0

# Check if port exists
proc jesd204_port_existence {port_name} {
   set port_collection [get_ports -nowarn $port_name]
   if { [get_collection_size $port_collection] > 0 } {
      return 1
   } else {
      return 0
   }
}

# Return existing clock target list
proc jesd204_get_clock_target_list {} {
   upvar 1 jesd204_sdc_debug jesd204_sdc_debug

   set result [list]
   set clocks_collection [get_clocks -nowarn]
   foreach_in_collection clock $clocks_collection { 
      set clock_name       [get_clock_info -name $clock] 
      set clock_target_col [get_clock_info -targets $clock]
      lappend result       [query_collection -report -all $clock_target_col]
      if {$jesd204_sdc_debug} { post_message -type info "clock_name : $clock_name" }
   }
   if {$jesd204_sdc_debug} { post_message -type info "JESD204 clock_target list: $result" }

   return $result
}

      set jesd204_clock_target_list [jesd204_get_clock_target_list]
      set j204c_txlink_clk_ext  [jesd204_port_existence j204c_txlink_clk]
      set j204c_txlink_clk_lsrc [lsearch -exact $jesd204_clock_target_list j204c_txlink_clk]
      set j204c_tx_avs_clk_ext  [jesd204_port_existence j204c_tx_avs_clk]
      set j204c_tx_avs_clk_lsrc [lsearch -exact $jesd204_clock_target_list j204c_tx_avs_clk]
      set j204c_pll_refclk_ext  [jesd204_port_existence j204c_pll_refclk]
      set j204c_pll_refclk_lsrc [lsearch -exact $jesd204_clock_target_list j204c_pll_refclk]
      set j204c_rxlink_clk_ext  [jesd204_port_existence j204c_rxlink_clk]
      set j204c_rxlink_clk_lsrc [lsearch -exact $jesd204_clock_target_list j204c_rxlink_clk]
      set j204c_rx_avs_clk_ext  [jesd204_port_existence j204c_rx_avs_clk]
      set j204c_rx_avs_clk_lsrc [lsearch -exact $jesd204_clock_target_list j204c_rx_avs_clk]
      set j204c_reconfig_clk_ext  [jesd204_port_existence j204c_reconfig_clk]
      set j204c_reconfig_clk_lsrc [lsearch -exact $jesd204_clock_target_list j204c_reconfig_clk]
      set j204c_rxframe_clk_ext  [jesd204_port_existence j204c_rxframe_clk]
      set j204c_rxframe_clk_lsrc [lsearch -exact $jesd204_clock_target_list j204c_rxframe_clk]
      set j204c_txframe_clk_ext  [jesd204_port_existence j204c_txframe_clk]
      set j204c_txframe_clk_lsrc [lsearch -exact $jesd204_clock_target_list j204c_txframe_clk]
      set j204c_rxphy_clk_ext  [jesd204_port_existence j204c_rxphy_clk]
      set j204c_rxphy_clk_lsrc [lsearch -exact $jesd204_clock_target_list j204c_rxphy_clk]
      set j204c_txphy_clk_ext  [jesd204_port_existence j204c_txphy_clk]
      set j204c_txphy_clk_lsrc [lsearch -exact $jesd204_clock_target_list j204c_txphy_clk]

		if {$j204c_pll_refclk_ext && $j204c_pll_refclk_lsrc == -1} {
			create_clock -name "j204c_pll_refclk"   -period 	4.068ns 			[get_ports j204c_pll_refclk]
		}
		if {$j204c_reconfig_clk_ext && $j204c_reconfig_clk_lsrc == -1} {
			create_clock -name "j204c_reconfig_clk" -period 	8.000ns 		[get_ports *j204c_reconfig_clk]
		}
		if {$j204c_txlink_clk_ext && $j204c_txlink_clk_lsrc == -1} {
			create_clock -name "j204c_txlink_clk"   -period 	8.137ns 			[get_ports j204c_txlink_clk]
		}
		if {$j204c_tx_avs_clk_ext && $j204c_tx_avs_clk_lsrc == -1} {
			create_clock -name "j204c_tx_avs_clk"   -period 	8.000ns 			[get_ports j204c_tx_avs_clk]
		}
		if {$j204c_rxlink_clk_ext && $j204c_rxlink_clk_lsrc == -1} {
			create_clock -name "j204c_rxlink_clk"   -period 	8.137ns      		[get_ports j204c_rxlink_clk]
		}
		if {$j204c_rx_avs_clk_ext && $j204c_rx_avs_clk_lsrc == -1} {
			create_clock -name "j204c_rx_avs_clk"   -period 	8.000ns       		[get_ports j204c_rx_avs_clk]
		}	
			if {$j204c_txframe_clk_ext && $j204c_txframe_clk_lsrc == -1} {
				create_clock -name "j204c_txframe_clk" -period	4.068ns 	[get_ports j204c_txframe_clk]
			}
			if {$j204c_rxframe_clk_ext && $j204c_rxframe_clk_lsrc == -1} {
				create_clock -name "j204c_rxframe_clk"  -period 4.068ns     [get_ports j204c_rxframe_clk]
			}
		if {$j204c_txframe_clk_ext && $j204c_txlink_clk_ext && $j204c_tx_avs_clk_ext && $j204c_reconfig_clk_ext} {	
			set_clock_groups -asynchronous -group {j204c_txframe_clk j204c_txlink_clk} -group {j204c_tx_avs_clk} -group {j204c_reconfig_clk} -group {*|j204c_phy_hip_inst|inst_xcvr|tx_clkout|ch0} -group {ALTERA_INSERTED_INTOSC_FOR_TRS|divided_osc_clk} 
		}
		if {$j204c_rx_avs_clk_ext && $j204c_rxlink_clk_ext && $j204c_rxframe_clk_ext} {
			set_clock_groups -asynchronous -group {j204c_rx_avs_clk} -group {ALTERA_INSERTED_INTOSC_FOR_TRS|divided_osc_clk} -group {j204c_rxlink_clk j204c_rxframe_clk} -group [get_clocks {*|j204c_phy_hip_inst|inst_xcvr|rx_clkout|ch*}]
		}
		if {$j204c_rx_avs_clk_ext} {
			set_clock_groups -asynchronous -group {j204c_rx_avs_clk} -group {*|j204c_phy_hip_inst|inst_xcvr|rx_transfer_clk|ch*}
		}
		  if {$j204c_txlink_clk_ext && $j204c_txframe_clk_ext} {
				set_multicycle_path -end -setup -from j204c_txlink_clk -to j204c_txframe_clk 2
				set_multicycle_path -end -hold -from j204c_txlink_clk -to j204c_txframe_clk 1

				set_multicycle_path -start -setup -from j204c_txframe_clk -to j204c_txlink_clk 2
				set_multicycle_path -start -hold -from j204c_txframe_clk -to j204c_txlink_clk 1
			
		  }
		    if {$j204c_rxlink_clk_ext && $j204c_rxframe_clk_ext} {
				set_multicycle_path -end -setup -from j204c_rxlink_clk -to j204c_rxframe_clk 2
				set_multicycle_path -end -hold -from j204c_rxlink_clk -to j204c_rxframe_clk 1

				set_multicycle_path -start -setup -from j204c_rxframe_clk -to j204c_rxlink_clk 2
				set_multicycle_path -start -hold -from j204c_rxframe_clk -to j204c_rxlink_clk 1	
			
		    }



