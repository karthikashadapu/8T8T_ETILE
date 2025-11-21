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


# (C) 2001-2020 Intel Corporation. All rights reserved.
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

set ip_inst_name [get_current_instance]




proc alt_ehipc3_fm_sl_constraint_net_delay {from_reg to_reg max_net_delay {check_exist 0}} {
    
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
            set_net_delay -from [get_pins -compatibility_mode ${from_reg}|q] -to [get_registers ${to_reg}] -max $max_net_delay
            
            # Relax the fitter effort
            set_max_delay -from [get_registers ${from_reg}] -to [get_registers ${to_reg}] 200ns
            set_min_delay -from [get_registers ${from_reg}] -to [get_registers ${to_reg}] -200ns
        }
    }
}


alt_ehipc3_fm_sl_constraint_net_delay * $ip_inst_name|U_hssi_ss_ip_wrapper|U_hssi_ss_ip_top_p0|alt_ehipc3_fm_0|alt_ehipc3_fm_top_p*|*|resync_chains[*].synchronizer_nocut|* \
                                   2ns 1

alt_ehipc3_fm_sl_constraint_net_delay * $ip_inst_name|U_hssi_ss_ip_wrapper|U_hssi_ss_ip_top_p0|alt_ehipc3_fm_0|alt_ehipc3_fm_top_p*|alt_ehipc3_fm_hard_inst|sl_rsfec_pld_ready \
                                   2ns 1

alt_ehipc3_fm_sl_constraint_net_delay {$ip_inst_name|U_hssi_ss_ip_wrapper|U_hssi_ss_ip_top_p0|alt_ehipc3_fm_0|alt_ehipc3_fm_top_p*|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_RST_CTRL.i_sl_reset_controller|tx_ch_rst_inst|tx_aib_reset_out_stage[0]} \
                                   {$ip_inst_name|U_hssi_ss_ip_wrapper|U_hssi_ss_ip_top_p0|alt_ehipc3_fm_0|alt_ehipc3_fm_top_p*|alt_ehipc3_fm_hard_inst|*|alt_ehipc3_fm_nphy_elane*|*} \
                                   2ns 1

#alt_ehipc3_fm_sl_constraint_net_delay {$ip_inst_name|U_hssi_ss_ip_wrapper|U_hssi_ss_ip_top_p0|alt_ehipc3_fm_0|alt_ehipc3_fm_top_p*|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_RST_CTRL.i_sl_reset_controller|rx_ch_rst_inst|rx_aib_reset_out_stage[0]} \
                                   {$ip_inst_name|U_hssi_ss_ip_wrapper|U_hssi_ss_ip_top_p0|alt_ehipc3_fm_0|alt_ehipc3_fm_top_p*|alt_ehipc3_fm_hard_inst|*|alt_ehipc3_fm_nphy_elane*|*} \
                                   2ns 1

alt_ehipc3_fm_sl_constraint_net_delay {$ip_inst_name|U_hssi_ss_ip_wrapper|U_hssi_ss_ip_top_p0|alt_ehipc3_fm_0|alt_ehipc3_fm_top_p*|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_RST_CTRL.i_sl_reset_controller|ehip_rst_seqinst|ehip_tx_reset_out_stage} \
                                   {$ip_inst_name|U_hssi_ss_ip_wrapper|U_hssi_ss_ip_top_p0|alt_ehipc3_fm_0|alt_ehipc3_fm_top_p*|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_RST_CTRL.tx_reset_sync_tx_clk|*} \
                                   2ns 1

alt_ehipc3_fm_sl_constraint_net_delay {$ip_inst_name|U_hssi_ss_ip_wrapper|U_hssi_ss_ip_top_p0|alt_ehipc3_fm_0|alt_ehipc3_fm_top_p*|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_RST_CTRL.i_sl_reset_controller|ehip_rst_seqinst|ehip_rx_reset_out_stage} \
                                   {$ip_inst_name|U_hssi_ss_ip_wrapper|U_hssi_ss_ip_top_p0|alt_ehipc3_fm_0|alt_ehipc3_fm_top_p*|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_RST_CTRL.rx_reset_sync_rx_clk|*} \
                                   2ns 1

alt_ehipc3_fm_sl_constraint_net_delay {$ip_inst_name|U_SRC_RST_CONTROLLER|SS_RST_SEQ|resp_ack_n[*]} {$ip_inst_name|U_SRC_RST_CONTROLLER|p*_out_sync_rx_ackn|din_s1} 2ns 1
alt_ehipc3_fm_sl_constraint_net_delay {$ip_inst_name|U_SRC_RST_CONTROLLER|SS_RST_SEQ|resp_ack_n[*]} {$ip_inst_name|U_SRC_RST_CONTROLLER|p*_out_sync_tx_ackn|din_s1} 2ns 1

alt_ehipc3_fm_sl_constraint_net_delay {$ip_inst_name|U_SRC_RST_CONTROLLER|SS_RST_SEQ|gen_resp_rst_sync[*].resp_rst_sync|dreg[1]} {$ip_inst_name|U_SRC_RST_CONTROLLER|p*_out_sync_tx_arstn|dreg[*]} 2ns 1
alt_ehipc3_fm_sl_constraint_net_delay {$ip_inst_name|U_SRC_RST_CONTROLLER|SS_RST_SEQ|gen_resp_rst_sync[*].resp_rst_sync|dreg[1]} {$ip_inst_name|U_SRC_RST_CONTROLLER|p*_out_sync_rx_arstn|dreg[*]} 2ns 1
alt_ehipc3_fm_sl_constraint_net_delay {$ip_inst_name|U_SRC_RST_CONTROLLER|SS_RST_SEQ|gen_resp_rst_sync[*].resp_rst_sync|dreg[1]} {$ip_inst_name|U_SRC_RST_CONTROLLER|p*_out_sync_tx_arstn|din_s1} 2ns 1
alt_ehipc3_fm_sl_constraint_net_delay {$ip_inst_name|U_SRC_RST_CONTROLLER|SS_RST_SEQ|gen_resp_rst_sync[*].resp_rst_sync|dreg[1]} {$ip_inst_name|U_SRC_RST_CONTROLLER|p*_out_sync_rx_arstn|din_s1} 2ns 1
alt_ehipc3_fm_sl_constraint_net_delay {$ip_inst_name|U_SRC_RST_CONTROLLER|SS_RST_SEQ|gen_resp_rst_sync[*].resp_rst_sync|dreg[1]} {$ip_inst_name|U_SRC_RST_CONTROLLER|p*_out_sync_tx_rstn|dreg[*]} 2ns 1
alt_ehipc3_fm_sl_constraint_net_delay {$ip_inst_name|U_SRC_RST_CONTROLLER|SS_RST_SEQ|gen_resp_rst_sync[*].resp_rst_sync|dreg[1]} {$ip_inst_name|U_SRC_RST_CONTROLLER|p*_out_sync_rx_rstn|dreg[*]} 2ns 1
alt_ehipc3_fm_sl_constraint_net_delay {$ip_inst_name|U_SRC_RST_CONTROLLER|SS_RST_SEQ|gen_resp_rst_sync[*].resp_rst_sync|dreg[1]} {$ip_inst_name|U_SRC_RST_CONTROLLER|p*_out_sync_tx_rstn|din_s1} 2ns 1
alt_ehipc3_fm_sl_constraint_net_delay {$ip_inst_name|U_SRC_RST_CONTROLLER|SS_RST_SEQ|gen_resp_rst_sync[*].resp_rst_sync|dreg[1]} {$ip_inst_name|U_SRC_RST_CONTROLLER|p*_out_sync_rx_rstn|din_s1} 2ns 1

alt_ehipc3_fm_sl_constraint_net_delay {$ip_inst_name|U_SRC_RST_CONTROLLER|p*_out_sync_rx_rstn|dreg[1]} {$ip_inst_name|U_hssi_ss_ip_wrapper|U_hssi_ss_ip_top_p*|alt_ehipc3_fm_0|alt_ehipc3_fm_top_p*|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_RST_CTRL.i_sl_reset_controller|status_rx_reset_synchronizers|resync_chains[*].synchronizer_nocut|din_s1} 2ns 1
alt_ehipc3_fm_sl_constraint_net_delay {$ip_inst_name|U_SRC_RST_CONTROLLER|p*_out_sync_tx_rstn|dreg[1]} {$ip_inst_name|U_hssi_ss_ip_wrapper|U_hssi_ss_ip_top_p*|alt_ehipc3_fm_0|alt_ehipc3_fm_top_p*|SL_SOFT.SL_SOFT_I[*].sl_soft|ehip_tx_rst_n_sync|resync_chains[*].synchronizer_nocut|din_s1} 2ns 1
alt_ehipc3_fm_sl_constraint_net_delay {$ip_inst_name|U_SRC_RST_CONTROLLER|p*_out_sync_csr_rstn|dreg[1]} {$ip_inst_name|U_hssi_ss_ip_wrapper|U_hssi_ss_ip_top_p*|alt_ehipc3_fm_0|alt_ehipc3_fm_top_p*|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_RST_CTRL.csr_reset_sync_tx_clk|resync_chains[*].synchronizer_nocut|dreg[*]} 2ns 1


#####
#PTP 10/25G mode 

alt_ehipc3_fm_sl_constraint_net_delay * *|alt_ehipc3_fm_0|alt_ehipc3_fm_top_p*|rx_adapt_dropped_frame_count_sync_inst|rst_sync_0|synchronizer_nocut_inst|dreg* \
                                   2ns 1




