# (C) 2001-2022 Intel Corporation. All rights reserved.
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


set_time_format -unit ns -decimal_places 3

#[BCW]#create_clock -name {altera_reserved_tck} [get_ports { altera_reserved_tck }] -period 16MHz
#[BCW]#create_clock -name clk_ref -period 156.25MHz [get_ports clk_ref]

#Currently only supported for NUM_IWF_CPRI == 1, bit[0]- channel 1

# Automatically calculate clock uncertainty to jitter and other effects.
derive_clock_uncertainty

#[BCW]#set ALT_RSV_CLK     [get_clocks altera_reserved_tck]

#[BCW]#set CLK_REF         [get_clocks clk_ref]
#[BCW]#set CLK100          [get_clocks ptp_iopll_inst|ptp_iopll_refclk]

#[BCW]#set_input_delay -clock $CLK100 1 [get_ports {mgmt_reset_n}] -add_delay 


#[BCW]#set OSC_CLK	        [get_clocks ALTERA_INSERTED_INTOSC_FOR_TRS|divided_osc_clk]

#[BCW]#set CORE_CLK0        [get_clocks {ECPRI_CORE_IOPLL_GEN[0].ecpri_clk_pll|ecpri_clk_pll_outclk0}]

# Clock groups
#[BCW]#set_clock_groups -asynchronous -group $CLK100 -group $ALT_RSV_CLK
#[BCW]#set_clock_groups -asynchronous -group $CLK100 -group $OSC_CLK
#[BCW]#set_clock_groups -asynchronous -group $CLK100 -group $CLK_REF


#[BCW]#set_clock_groups -asynchronous -group $CLK100  -group $CORE_CLK0




#[BCW]#set_false_path -to   {dut|eth_mac_inst|gen_eth_f_ptp_tod*u_rst_sync_tx_tod|alt_mge_reset_synchronizer_int_chain[*]}
#[BCW]#set_false_path -to   {dut|eth_mac_inst|gen_eth_f_ptp_tod*u_rst_sync_tx_tod|alt_mge_reset_synchronizer_int_chain_out}
#[BCW]#set_false_path -to   {dut|eth_mac_inst|gen_eth_f_ptp_tod*u_rst_sync_rx_tod|alt_mge_reset_synchronizer_int_chain[*]}
#[BCW]#set_false_path -to   {dut|eth_mac_inst|gen_eth_f_ptp_tod*u_rst_sync_rx_tod|alt_mge_reset_synchronizer_int_chain_out}
#[BCW]#set_false_path -from {dut|eth_mac_inst|*|ex_25g_ftile|*|o_rx_pcs_ready} -to {dut|reset_logic_sync_inst|ECPRI_PLL_ETHERNET_STATUS_RESET_SYNC[*].pcs_ready_mgmt_clk_sync|*_std_synchronizer_nocut|dreg[*]}
#[BCW]#set_false_path -from {dut|eth_mac_inst|*|ex_25g_ftile|*|o_rx_pcs_ready} -to {dut|reset_logic_sync_inst|ECPRI_PLL_ETHERNET_STATUS_RESET_SYNC[*].pcs_ready_mgmt_clk_sync|*_std_synchronizer_nocut|din_s1}
#[BCW]#set_false_path -from {dut|eth_mac_inst|*|ex_25g_ftile|*|o_tx_lanes_stable} -to {dut|reset_logic_sync_inst|ECPRI_PLL_ETHERNET_STATUS_RESET_SYNC[*].lanes_stable_mgmt_clk_sync|*_std_synchronizer_nocut|dreg[*]}
#[BCW]#set_false_path -from {dut|eth_mac_inst|*|ex_25g_ftile|*|o_tx_lanes_stable} -to {dut|reset_logic_sync_inst|ECPRI_PLL_ETHERNET_STATUS_RESET_SYNC[*].lanes_stable_mgmt_clk_sync|*_std_synchronizer_nocut|din_s1}

#[BCW]#if { [string equal quartus_fit $::TimeQuestInfo(nameofexecutable)] } { set_max_delay -to [get_ports { altera_reserved_tdo } ] 0 }
#[BCW]#set_clock_groups -asynchronous -group {altera_reserved_tck}

#[BCW]#set_clock_groups -asynchronous -group $CLK100  -group {dut|eth_mac_inst|*|tx_clkout|ch*}

#[BCW]#set_max_delay -from [get_keepers {ECPRI_CORE_IOPLL_GEN[*].ecpri_clk_pll|ecpri_clk_pll|*nm_pll~pll_e_reg__nff}] -to [get_keepers {*ecpri_pll_locked_*|expand[0].*_std_synchronizer_nocut|*}] 200			  
#[BCW]#set_min_delay -from [get_keepers {ECPRI_CORE_IOPLL_GEN[*].ecpri_clk_pll|ecpri_clk_pll|*nm_pll~pll_e_reg__nff}] -to [get_keepers {*ecpri_pll_locked_*|expand[0].*_std_synchronizer_nocut|*}] -200		  

#[BCW]#set_max_delay -from [get_keepers {ptp_iopll*|*|*nm_pll~pll_e_reg__nff}] -to [get_keepers {dut|reset_logic_sync_inst|ptp_iopll*|expand[0].*_std_synchronizer_nocut|*}] 200			  
#[BCW]#set_min_delay -from [get_keepers {ptp_iopll*|*|*nm_pll~pll_e_reg__nff}] -to [get_keepers {dut|reset_logic_sync_inst|ptp_iopll*|expand[0].*_std_synchronizer_nocut|*}] -200		  

			
proc ethernet_constraint_net_delay {from_reg to_reg max_net_delay {check_exist 0} {get_pins 1}} {
    
    # Check for instances
    set inst [get_registers -nowarn ${to_reg}]
    
    # Check number of instances
    set inst_num [llength [query_collection -report -all $inst]]
    if {$inst_num > 0} {
        # Uncomment line below for debug purpose
        #puts "${inst_num} ${to_reg} instance(s) found"
    } else {
        # Uncomment line below for debug purpose
        #puts "No ${to_reg} instance found"
    }
    
    if {($check_exist == 0) || ($inst_num > 0)} {
        if { [string equal "quartus_sta" $::TimeQuestInfo(nameofexecutable)] } {
            set_max_delay -from [get_registers ${from_reg}] -to [get_registers ${to_reg}] 200ns
            set_min_delay -from [get_registers ${from_reg}] -to [get_registers ${to_reg}] -200ns
        } else {
            if {$get_pins == 0} {
                set_net_delay -from [get_registers ${from_reg}] -to [get_registers ${to_reg}] -max $max_net_delay
            } else {
                set_net_delay -from [get_pins -compatibility_mode ${from_reg}|q] -to [get_registers ${to_reg}] -max $max_net_delay
            }
            
            # Relax the fitter effort
            set_max_delay -from [get_registers ${from_reg}] -to [get_registers ${to_reg}] 200ns
            set_min_delay -from [get_registers ${from_reg}] -to [get_registers ${to_reg}] -200ns
        }
    }
}


# mtod/stod synchronizers
#[BCW]#eth_f_constraint_net_delay  {dut|eth_mac_inst|gen_eth_f_ptp_tod*master_tod|o_tod_96b_valid*} \
#[BCW]#                            {dut|eth_mac_inst|gen_eth_f_ptp_tod*tx_tod|mtod_valid_sync_inst|din_s1} \
#[BCW]#                            2.2ns 1

#[BCW]#eth_f_constraint_net_delay  {dut|eth_mac_inst|gen_eth_f_ptp_tod*master_tod|o_tod_96b_valid*} \
#[BCW]#                            {dut|eth_mac_inst|gen_eth_f_ptp_tod*rx_tod|mtod_valid_sync_inst|din_s1} \
#[BCW]#                            2.2ns 1

#[BCW]#eth_f_constraint_net_delay  * \
#[BCW]#                            {dut|eth_mac_inst|gen_eth_f_ptp_tod*master_tod|csr_tod_load_sync_inst|din_s1} \
#[BCW]#                            2.2ns 1

# From Timequest cookbook
#[BCW]#set_clock_groups -exclusive -group [get_clocks altera_reserved_tck]

#[BCW]#set_input_delay -add_delay -clock altera_reserved_tck -clock_fall 3 [get_ports altera_reserved_tdi]
#[BCW]#set_input_delay -add_delay -clock altera_reserved_tck -clock_fall 3 [get_ports altera_reserved_tms]
#[BCW]#set_output_delay -add_delay -clock altera_reserved_tck 3 [get_ports altera_reserved_tdo]

# false path the reset sync signals
#[BCW]#set_false_path -from {*ecpri_top_inst|*_std_synchronizer_nocut|dreg*} -to {*ecpri_top_inst|*fifo*|auto_generated|*aclr|dffe*}

#[BCW]#set_max_delay -from [get_keepers {dut|sys_top_inst|*|ecpri_i|csrunit|ipv4_header_checksum*}] -to [get_keepers {dut|sys_top_inst|*|ecpri_i|ecpri_mac_inst|ethframe_inst|ethframe_ins_inst|ipv4_header_length_checksum_d1*}] 100			  
#[BCW]#set_min_delay -from [get_keepers {dut|sys_top_inst|*|ecpri_i|csrunit|ipv4_header_checksum*}] -to [get_keepers {dut|sys_top_inst|*|ecpri_i|ecpri_mac_inst|ethframe_inst|ethframe_ins_inst|ipv4_header_length_checksum_d1*}] -100		  

#[BCW]#set_max_delay -from [get_keepers {dut|*|ecpri_i|csrunit|ecpri_csr_inst|packet_type_enable_vlan_en}] -to [get_keepers {dut|sys_top_inst|*|ecpri_i|ecpri_mac_inst|ethframe_inst|ethframe_ins_inst|data_src_mac_data*_ff*}] 100			  
#[BCW]#set_min_delay -from [get_keepers {dut|*|ecpri_i|csrunit|ecpri_csr_inst|packet_type_enable_vlan_en}] -to [get_keepers {dut|sys_top_inst|*|ecpri_i|ecpri_mac_inst|ethframe_inst|ethframe_ins_inst|data_src_mac_data*_ff*}] -100		  

#[BCW]#set_max_delay -from [get_keepers {dut|sys_top_inst|*|ecpri_i|csrunit|ecpri_csr_inst|*}] -to [get_keepers {dut|sys_top_inst|*|rx_packet_parser_inst|*}] 100			  
#[BCW]#set_min_delay -from [get_keepers {dut|sys_top_inst|*|ecpri_i|csrunit|ecpri_csr_inst|*}] -to [get_keepers {dut|sys_top_inst|*|rx_packet_parser_inst|*}] -100		  

#[BCW]#set_max_delay -from [get_keepers {dut|sys_top_inst|*|ecpri_i|csrunit|ecpri_csr_inst|*}] -to [get_keepers {dut|sys_top_inst|*|ecpri_i|ecpri_mac_inst|ethframe_inst|ethframe_ins_inst|*}] 100			  
#[BCW]#set_min_delay -from [get_keepers {dut|sys_top_inst|*|ecpri_i|csrunit|ecpri_csr_inst|*}] -to [get_keepers {dut|sys_top_inst|*|ecpri_i|ecpri_mac_inst|ethframe_inst|ethframe_ins_inst|*}] -100		  

#[BCW]#set_max_delay -from [get_keepers {dut|sys_top_inst|*|reset_logic_inst|*_mm_sync|expand[0].inst_uflex_std_synchronizer_nocut|dreg*}] -to [get_keepers {dut|sys_top_inst|*|reset_logic_inst|*_srst_*_mac_clk|expand[0].inst_uflex_std_synchronizer_nocut|*}] 100			  
#[BCW]#set_min_delay -from [get_keepers {dut|sys_top_inst|*|reset_logic_inst|*_mm_sync|expand[0].inst_uflex_std_synchronizer_nocut|dreg*}] -to [get_keepers {dut|sys_top_inst|*|reset_logic_inst|*_srst_*_mac_clk|expand[0].inst_uflex_std_synchronizer_nocut|*}] -100		  

proc apply_sdc_dcfifo_for_ptrs {from_node_list to_node_list} {
 # control skew for bits
 set_max_skew -from $from_node_list -to $to_node_list -get_skew_value_from_clock_period src_clock_period -skew_value_multiplier 0.8
 # path delay (exception for net delay)
 if { ![string equal "quartus_syn" $::TimeQuestInfo(nameofexecutable)] } {
 set_net_delay -from $from_node_list -to $to_node_list -max -get_value_from_clock_period dst_clock_period -value_multiplier 0.8
}
 #relax setup and hold calculation
 set_max_delay -from $from_node_list -to $to_node_list 100
 set_min_delay -from $from_node_list -to $to_node_list -100
}

#
# mstable propgation delay
#
proc apply_sdc_dcfifo_mstable_delay {from_node_list to_node_list} {
 # mstable delay
 if { ![string equal "quartus_syn" $::TimeQuestInfo(nameofexecutable)] } {
 set_net_delay -from $from_node_list -to $to_node_list -max -get_value_from_clock_period dst_clock_period -value_multiplier 0.8
 }
}

#
# rptr constraints
#
proc apply_sdc_dcfifo_rdptr {hier_path} {
 # get from and to list
 set from_node_list [get_keepers -nowarn $hier_path|auto_generated|*rdptr_g*]
 set to_node_list [get_keepers -nowarn $hier_path|auto_generated|ws_dgrp|dffpipe*|dffe*]
 if { ([get_collection_size $from_node_list] > 0) && ([get_collection_size $from_node_list] > 0) } {
   apply_sdc_dcfifo_for_ptrs $from_node_list $to_node_list
 }
 # mstable
 set from_node_mstable_list [get_keepers -nowarn $hier_path|auto_generated|ws_dgrp|dffpipe*|dffe*]
 set to_node_mstable_list [get_keepers -nowarn $hier_path|auto_generated|ws_dgrp|dffpipe*|dffe*]
 if { ([get_collection_size $from_node_mstable_list] > 0) && ([get_collection_size $to_node_mstable_list] > 0) } {
   apply_sdc_dcfifo_mstable_delay $from_node_mstable_list $to_node_mstable_list
 }
}

#
# wrptr constraints
#
proc apply_sdc_dcfifo_wrptr {hier_path} {
 # control skew for bits
 set from_node_list [get_keepers -nowarn $hier_path|auto_generated|delayed_wrptr_g*]
 set to_node_list [get_keepers -nowarn $hier_path|auto_generated|rs_dgwp|dffpipe*|dffe*]
 if { ([get_collection_size $from_node_list] > 0) && ([get_collection_size $from_node_list] > 0) } {
   apply_sdc_dcfifo_for_ptrs $from_node_list $to_node_list
 }
 # mstable
 set from_node_mstable_list [get_keepers -nowarn $hier_path|auto_generated|rs_dgwp|dffpipe*|dffe*]
 set to_node_mstable_list [get_keepers -nowarn $hier_path|auto_generated|rs_dgwp|dffpipe*|dffe*]
 if { ([get_collection_size $from_node_mstable_list] > 0) && ([get_collection_size $to_node_mstable_list] > 0) } {
   apply_sdc_dcfifo_mstable_delay $from_node_mstable_list $to_node_mstable_list
 }
}


set dc_component { \
"*|ecpri_i|ecpri_mac_inst|ethframe_inst|ethframe_ins_inst|fifo_pcid_pkt|fifo|dcfifo_en.inst_fifo" \
"*|ecpri_i|ecpri_mac_inst|ethframe_inst|ethframe_ins_inst|fifo_pkt|fifo|dcfifo_en.inst_fifo" \
"*|packet_queue_inst|misc_queue_fifo|control_fifo|dcfifo_en.inst_fifo" \
"*|packet_queue_inst|misc_queue_fifo|data_fifo|dcfifo_en.inst_fifo" \
"*|packet_queue_inst|ptp_queue_fifo|control_fifo|dcfifo_en.inst_fifo" \
"*|packet_queue_inst|ptp_queue_fifo|data_fifo|dcfifo_en.inst_fifo" \
"*|packet_queue_inst|tx_packet_parser_inst|ext_scfifo_ctrl|dcfifo_en.inst_fifo" \
"*|packet_queue_inst|tx_packet_parser_inst|ext_scfifo|dcfifo_en.inst_fifo" \
"*|rx_packet_parser_inst|enable_ext_rx_sync.ext_dcfifo|dcfifo_en.inst_fifo" \
"*|rx_packet_parser_inst|ext_scfifo_ctrl|dcfifo_en.inst_fifo" \
"*|rx_packet_parser_inst|ext_scfifo|dcfifo_en.inst_fifo" \
"*|tx_ts_fifo|dcfifo_en.inst_fifo" \
"*|ext_tx_ts_fifo|dcfifo_en.inst_fifo" \
}

for {set i 0} {$i<1} {incr i} {
set channel_hier "dut|sys_top_inst|*NUM_CHANNELS_LOOP[$i].ecpri_top_inst|"
foreach pathc $dc_component {
 set temp $pathc
 set temp "$channel_hier$temp"
 apply_sdc_dcfifo_rdptr $temp
 apply_sdc_dcfifo_wrptr $temp
}
}


