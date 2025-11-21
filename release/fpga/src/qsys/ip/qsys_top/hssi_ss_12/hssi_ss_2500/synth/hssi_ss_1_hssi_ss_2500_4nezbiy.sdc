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


set dir_name [file dirname [info script]] 


## get current IP instance 
set ip_inst_name [get_current_instance]



#########################################################################################################################
#########################################################################################################################
proc eth_f_constraint_net_delay {from_reg to_reg max_net_delay {check_exist 0} {get_pins 1} {set_skew_constraint 1} {set_mstable 1} {set_no_synchronizer 0}} {
    
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

  if {($set_skew_constraint == 0)} {   
    if {($check_exist == 0) || ($inst_num > 0)} {
        if { [string equal "quartus_sta" $::TimeQuestInfo(nameofexecutable)] } {
            if {$set_no_synchronizer == 1} {
                set_max_delay -no_synchronizer -from [get_registers ${from_reg}] -to [get_registers ${to_reg}] 200ns
            } else {
                set_max_delay -from [get_registers ${from_reg}] -to [get_registers ${to_reg}] 200ns
            }
            set_min_delay -from [get_registers ${from_reg}] -to [get_registers ${to_reg}] -200ns
        } else {
            if {$get_pins == 0} {
                set_net_delay -from [get_registers ${from_reg}] -to [get_registers ${to_reg}] -max $max_net_delay
            } else {
                set_net_delay -from [get_pins -compatibility_mode ${from_reg}|q] -to [get_registers ${to_reg}] -max $max_net_delay
            }
            
            # Relax the fitter effort
            if {$set_no_synchronizer == 1} {
                set_max_delay -no_synchronizer -from [get_registers ${from_reg}] -to [get_registers ${to_reg}] 200ns
            } else {
                set_max_delay -from [get_registers ${from_reg}] -to [get_registers ${to_reg}] 200ns
            }
            set_min_delay -from [get_registers ${from_reg}] -to [get_registers ${to_reg}] -200ns
        }
    }
  } else {   
        #set skew and min/max delay for EFIFO
        # control skew for bits
        set_max_skew -from [get_registers ${from_reg}] -to [get_registers ${to_reg}] -get_skew_value_from_clock_period src_clock_period -skew_value_multiplier 0.8
        # path delay (exception for net delay)
        if { ![string equal "quartus_sta" $::TimeQuestInfo(nameofexecutable)] } {
            set_net_delay -from [get_registers ${from_reg}] -to [get_registers ${to_reg}] -max -get_value_from_clock_period dst_clock_period -value_multiplier 0.8
        }
        #relax setup and hold calculation
        if {$set_no_synchronizer == 1} {
            set_max_delay -no_synchronizer -from [get_registers ${from_reg}] -to [get_registers ${to_reg}] 100
        } else {
            set_max_delay -from [get_registers ${from_reg}] -to [get_registers ${to_reg}] 100
        }
        set_min_delay -from [get_registers ${from_reg}] -to [get_registers ${to_reg}] -100		
  }
	
    #set Meta stability for EFIFO 
    if {($set_mstable == 1)} {
		if { ![string equal "quartus_sta" $::TimeQuestInfo(nameofexecutable)] } {
			set_net_delay -from [get_registers ${from_reg}] -to [get_registers ${to_reg}] -max -get_value_from_clock_period dst_clock_period -value_multiplier 0.8
		}
    }
}
#########################################################################################################################
#########################################################################################################################
# Common contraints per SS

   #taken from dr_f
   set_false_path -to [get_registers *|resync_chains[*].synchronizer_nocut|din_s1]
   set_false_path -from [get_keepers -no_duplicates {*|*_lane_current_state_r[*]}] -to [get_keepers -no_duplicates {*|sip_inst|*_port_current_state_1[*][*]}]				 

	 eth_f_constraint_net_delay   "$ip_inst_name|U_eth_f_inst_p*|eth_f_top_p*|sip_inst|o_fec_not_locked_aib[*][*]" \
                                "$ip_inst_name|U_sts_sync_p*|resync_chains[*].synchronizer_nocut|din_s1" \
                                 2.2ns 1 0 0 0 0

   eth_f_constraint_net_delay   "$ip_inst_name|U_eth_f_inst_p*|eth_f_top_p*|sip_inst|o_fec_not_align_aib[*]" \
                                "$ip_inst_name|U_sts_sync_p*|resync_chains[*].synchronizer_nocut|din_s1" \
                                 2.2ns 1 0 0 0 0


   eth_f_constraint_net_delay "$ip_inst_name|U_hssi_ss_ip_wrapper_p*|U_st_bridge_instance|axist_to_avst_bridge_inst|U_axist_to_avst_tx_mac_seg_if_inst*" \
                              "$ip_inst_name|U_hssi_ss_ip_wrapper_p*|U_PARITY_ERR_SYNC|resync_chains[*].synchronizer_nocut|din_s1" \
                               2.2ns 1 0 0 0 0
   
   eth_f_constraint_net_delay "$ip_inst_name|led_pulse_reg*" \
                              "$ip_inst_name|U_hssi_ss_led_p*|*x_pulse_sync|din_s1" \
                               2.2ns 1 0 0 0 0
   
   eth_f_constraint_net_delay "$ip_inst_name|U_SRC_RST_CONTROLLER|out_sync_nios_rstn|dreg[1]" \
                              "$ip_inst_name|U_hssi_ss_led_p*|pulse_10msec_*x_d1" \
                               2.2ns 1 0 0 0 0
   
   eth_f_constraint_net_delay "$ip_inst_name|U_SRC_RST_CONTROLLER|out_sync_nios_rstn|dreg[1]" \
                              "$ip_inst_name|U_hssi_ss_led_p*|*x_sig_det" \
                               2.2ns 1 0 0 0 0
   
   eth_f_constraint_net_delay "$ip_inst_name|U_hssi_ss_led_p*|*x_sig_det" \
                              "$ip_inst_name|U_hssi_ss_led_p*|led_status[2]" \
                               2.2ns 1 0 0 0 0


   eth_f_constraint_net_delay "$ip_inst_name|U_SRC_RST_CONTROLLER|SS_RST_SEQ|gen_resp_rst_sync\[*\].resp_rst_sync|dreg[1]" \
                               * \
                               2.2ns 1 0 0 0 0

   eth_f_constraint_net_delay "$ip_inst_name|U_SRC_RST_CONTROLLER|p*_out_sync_*x_arstn|dreg[1]*" \
                              * \
                              2.2ns 1 0 0 0 0															 


	   eth_f_constraint_net_delay "$ip_inst_name|U_SRC_RST_CONTROLLER|out_sync_nios_rstn|dreg[1]" \
	   													 "$ip_inst_name|ptp_adpt_f|ptp_adpt|sip_inst|ptp_tx_dsk_inst|dsk_cnt\[*\]" \
	   													  2.2ns 1 0 0 0 0
     
     eth_f_constraint_net_delay "$ip_inst_name|U_SRC_RST_CONTROLLER|out_sync_nios_rstn|dreg[1]" \
                                "$ip_inst_name|ptp_adpt_f|ptp_adpt|sip_inst|ptp_tx_dsk_inst|o_dsk[0]" \
	   													  2.2ns 1 0 0 0 0 


	 	
	      eth_f_constraint_net_delay "$ip_inst_name|U_SRC_RST_CONTROLLER|p0_out_sync_csr_rstn|dreg[1]" \
	                                 "$ip_inst_name|U_eth_f_inst_p0|eth_f_top_p0|sip_inst|rx_status_sync0|resync_chains[*].synchronizer_nocut|din_s1" \
                                    2.2ns 1 0 0 0 0
        
        eth_f_constraint_net_delay "$ip_inst_name|U_SRC_RST_CONTROLLER|p0_out_sync_csr_rstn|dreg[1]" \
                                   "$ip_inst_name|U_eth_f_inst_p0|eth_f_top_p0|sip_inst|tx_status_sync0|resync_chains[*].synchronizer_nocut|din_s1" \
                                    2.2ns 1 0 0 0 0

 
        eth_f_constraint_net_delay "$ip_inst_name|U_SRC_RST_CONTROLLER|p0_out_sync_rx_rstn|dreg[1]" \
                                  "$ip_inst_name|U_eth_f_inst_p0|eth_f_top_p0|sip_inst|rx_lane_desired_state_reg\[*\]" \
                                   2.2ns 1 0 0 0 0 

        eth_f_constraint_net_delay "$ip_inst_name|U_eth_f_inst_p0|eth_f_top_p0|sip_inst|tx_pll_locked_sync_int_clk_inst|sync[0].synchronizer_nocut_inst|dreg[1]" \
                                    * \
                                    2.2ns 1 0 0 0 0

        eth_f_constraint_net_delay "$ip_inst_name|U_eth_f_inst_p0|eth_f_top_p0|sip_inst|o_rx_pcs_ready\[*\]" \
                                   "$ip_inst_name|U_link_sts_sync_p0|resync_chains[*].synchronizer_nocut|din_s1" \
                                    2.2ns 1 0 0 0 0    
        
        eth_f_constraint_net_delay "$ip_inst_name|U_eth_f_inst_p0|eth_f_top_p0|sip_inst|o_tx_lanes_stable\[*\]" \
                                   "$ip_inst_name|U_link_sts_sync_p0|resync_chains[*].synchronizer_nocut|din_s1" \
                                    2.2ns 1 0 0 0 0
         
        eth_f_constraint_net_delay "$ip_inst_name|U_eth_f_inst_p0|eth_f_top_p0|sip_inst|rx_status_sync0|resync_chains[*].synchronizer_nocut|dreg[1]" \
                                   "$ip_inst_name|U_sts_sync_p0|resync_chains[*].synchronizer_nocut|din_s1" \
                                    2.2ns 1 0 0 0 0    
        
        eth_f_constraint_net_delay "$ip_inst_name|U_SRC_RST_CONTROLLER|p0_out_sync_tx_rstn|dreg[1]" \
                                  "$ip_inst_name|U_eth_f_inst_p0|eth_f_top_p0|sip_inst|tx_lane_desired_state_reg\[*\]" \
                                   2.2ns 1 0 0 0 0

        eth_f_constraint_net_delay "$ip_inst_name|U_SRC_RST_CONTROLLER|p*_out_sync_rx_rstn|dreg[1]" \
                                   "$ip_inst_name|U_eth_f_inst_p0|eth_f_top_p0|sip_inst|rx_dp_rst_*" \
                                    2.2ns 1 0 0 0 0

        eth_f_constraint_net_delay "$ip_inst_name|U_SRC_RST_CONTROLLER|p*_out_sync_tx_rstn|dreg[1]" \
                                 "$ip_inst_name|U_eth_f_inst_p0|eth_f_top_p0|sip_inst|tx_dp_rst_*" \
                                  2.2ns 1 0 0 0 0




set_false_path -from [get_keepers -no_duplicates {*|profile_sel_profile_sel_p*}] 


#set_false_path -from [get_keepers -no_duplicates *|profile_sel_profile_sel_p*] -to [get_keepers -no_duplicates *|U_hssi_ss_ip_wrapper_p8|U_st_bridge_instance|*]




