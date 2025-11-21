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


#create_clock -period 1.0 -name HIOINT_clock *|alt_ehipc3_fm_inst|alt_ehipc3_fm_hard_inst|SL_NPHY.altera_xcvr_native_inst|alt_ehipc3_fm_nphy_elane|g_xcvr_native_insts[0].ct3_xcvr_native_inst|inst_ct3_xcvr_channel|inst_ct1_hssi_pldadapt_rx|pld_pma_internal_clk1_hioint
#set_clock_groups -asynchronous -group {HIOINT_clock}

# o_sclk is not the real clock, so the clock constraint should be removed
#create_generated_clock -name   *|alt_ehipc3_fm_inst|alt_ehipc3_fm_hard_inst|SL_PTP_NPHY_CHPLL.nphy_ptp*|alt_ehipc3_fm_nphy_elane_pt*|tx_clkout|ch0_sclk \
                       -source *|alt_ehipc3_fm_inst|alt_ehipc3_fm_hard_inst|SL_PTP_NPHY_CHPLL.nphy_ptp*|alt_ehipc3_fm_nphy_elane_pt*|g_xcvr_native_insts[0].ct3_xcvr_native_inst|inst_ct3_xcvr_channel|inst_ct1_hssi_pldadapt_tx|pld_pcs_tx_clk_out1_dcm \
                       -master *|alt_ehipc3_fm_inst|alt_ehipc3_fm_hard_inst|SL_PTP_NPHY_CHPLL.nphy_ptp*|alt_ehipc3_fm_nphy_elane_pt*|tx_clkout|ch0 \
                               *|alt_ehipc3_fm_inst|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_PTP.soft_ptp|ptp_ref_ts_capture_u|ptp_ckt_cal_u|o_sclk
#set_clock_groups -asynchronous -group {*|alt_ehipc3_fm_inst|alt_ehipc3_fm_hard_inst|SL_PTP_NPHY_CHPLL.nphy_ptp*|alt_ehipc3_fm_nphy_elane_pt*|tx_clkout|ch0_sclk}

##proc alt_ehipc3_fm_sl_constraint_net_delay {from_reg to_reg max_net_delay {check_exist 0} {get_pins 1}} {
##    
##    # Check for instances
##    set inst [get_registers -nowarn ${to_reg}]
##    
##    # Check number of instances
##    set inst_num [llength [query_collection -report -all $inst]]
##    if {$inst_num > 0} {
##        # Uncomment line below for debug purpose
##        #puts "${inst_num} ${to_reg} instance(s) found"
##    } else {
##        # Uncomment line below for debug purpose
##        #puts "No ${to_reg} instance found"
##    }
##    
##    if {($check_exist == 0) || ($inst_num > 0)} {
##        if { [string equal "quartus_sta" $::TimeQuestInfo(nameofexecutable)] } {
##            set_max_delay -from [get_registers ${from_reg}] -to [get_registers ${to_reg}] 200ns
##            set_min_delay -from [get_registers ${from_reg}] -to [get_registers ${to_reg}] -200ns
##        } else {
##            if {$get_pins == 0} {
##                set_net_delay -from [get_registers ${from_reg}] -to [get_registers ${to_reg}] -max $max_net_delay
##            } else {
##                set_net_delay -from [get_pins -compatibility_mode ${from_reg}|q] -to [get_registers ${to_reg}] -max $max_net_delay
##            }
##            
##            # Relax the fitter effort
##            set_max_delay -from [get_registers ${from_reg}] -to [get_registers ${to_reg}] 200ns
##            set_min_delay -from [get_registers ${from_reg}] -to [get_registers ${to_reg}] -200ns
##        }
##    }
##}
##
##
##alt_ehipc3_fm_sl_constraint_net_delay * *|alt_ehipc3_fm_inst|*|resync_chains[*].synchronizer_nocut|* \
##                                   2ns 1
##
##
##alt_ehipc3_fm_sl_constraint_net_delay *|alt_ehipc3_fm_inst|sl_rsfec_mode[*] * \
##                                   2ns 1
##
##alt_ehipc3_fm_sl_constraint_net_delay *|alt_ehipc3_fm_inst|sl_*x_preamble_pass[*] * \
##                                   2ns 1
##
###alt_ehipc3_fm_sl_constraint_net_delay *|alt_ehipc3_fm_inst|sl_tx_am_pulse[*] * \
##                                   2ns 1
##
##alt_ehipc3_fm_sl_constraint_net_delay * *|alt_ehipc3_fm_0|rx_adapt_dropped_frame_count_sync_inst|rst_sync_0|synchronizer_nocut_inst|dreg* \
##                                   2ns 1
##
##alt_ehipc3_fm_sl_constraint_net_delay {*|alt_ehipc3_fm_inst|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_PTP.*x_tam_capture_cc|in_data_toggle} \
##                                      {*|alt_ehipc3_fm_inst|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_PTP.*x_tam_capture_cc|in_to_out_synchronizer|din_s1} \
##                                      2ns 1
##
##alt_ehipc3_fm_sl_constraint_net_delay {*|alt_ehipc3_fm_inst|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_RST_CTRL.ehip_*x_reset_sync_sync_reconfig_clk_*|resync_chains[0].synchronizer_nocut|dreg*} \
##                                      {*|alt_ehipc3_fm_inst|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_PTP.*x_tam_capture_cc|*} \
##                                      2ns 1
##
##alt_ehipc3_fm_sl_constraint_net_delay {*|alt_ehipc3_fm_inst|SL_SOFT.SL_SOFT_I[*].sl_soft|ehip_*x_reset_sync} \
##                                      {*|alt_ehipc3_fm_inst|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_PTP.*x_tam_capture_cc|*} \
##                                      2ns 1
##
##alt_ehipc3_fm_sl_constraint_net_delay {*|alt_ehipc3_fm_inst|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_PTP.*x_tam_capture_cc|in_data_buffer[*]} \
##                                      {*|alt_ehipc3_fm_inst|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_PTP.*x_tam_capture_cc|out_data_buffer[*]} \
##                                      2ns 1
##
##alt_ehipc3_fm_sl_constraint_net_delay {*|alt_ehipc3_fm_inst|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_PTP.*x_tam_capture_cc|out_data_toggle_flopped} \
##                                      {*|alt_ehipc3_fm_inst|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_PTP.*x_tam_capture_cc|out_to_in_synchronizer|din_s1} \
##                                      2ns 1
##
##alt_ehipc3_fm_sl_constraint_net_delay * *|alt_ehipc3_fm_inst|alt_ehipc3_fm_hard_inst|sl_rsfec_pld_ready \
##                                   2ns 1
##
##alt_ehipc3_fm_sl_constraint_net_delay {*|alt_ehipc3_fm_inst|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_RST_CTRL.i_sl_reset_controller|tx_ch_rst_inst|tx_aib_reset_out_stage[0]} \
##                                   {*|alt_ehipc3_fm_inst|alt_ehipc3_fm_hard_inst|*|alt_ehipc3_fm_nphy_elane|*} \
##                                   2ns 1
##
##alt_ehipc3_fm_sl_constraint_net_delay {*|alt_ehipc3_fm_inst|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_RST_CTRL.i_sl_reset_controller|rx_ch_rst_inst|rx_aib_reset_out_stage[0]} \
##                                   {*|alt_ehipc3_fm_inst|alt_ehipc3_fm_hard_inst|*|alt_ehipc3_fm_nphy_elane|*} \
##                                   2ns 1
##
##alt_ehipc3_fm_sl_constraint_net_delay {*|alt_ehipc3_fm_inst|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_RST_CTRL.i_sl_reset_controller|tx_ch_rst_inst|tx_aib_reset_out_stage[0]} \
##                                   {*|alt_ehipc3_fm_inst|alt_ehipc3_fm_hard_inst|*|alt_ehipc3_fm_nphy_elane_pt*|*} \
##                                   2ns 1
##
##alt_ehipc3_fm_sl_constraint_net_delay {*|alt_ehipc3_fm_inst|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_RST_CTRL.i_sl_reset_controller|rx_ch_rst_inst|rx_aib_reset_out_stage[0]} \
##                                   {*|alt_ehipc3_fm_inst|alt_ehipc3_fm_hard_inst|*|alt_ehipc3_fm_nphy_elane_pt*|*} \
##                                   2ns 1
##
##alt_ehipc3_fm_sl_constraint_net_delay {*|alt_ehipc3_fm_inst|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_RST_CTRL.i_sl_reset_controller|ehip_rst_seqinst|ehip_tx_reset_out_stage} \
##                                   {*|alt_ehipc3_fm_inst|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_RST_CTRL.tx_reset_sync_tx_clk|*} \
##                                   2ns 1
##
##alt_ehipc3_fm_sl_constraint_net_delay {*|alt_ehipc3_fm_inst|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_RST_CTRL.i_sl_reset_controller|ehip_rst_seqinst|ehip_rx_reset_out_stage} \
##                                   {*|alt_ehipc3_fm_inst|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_RST_CTRL.rx_reset_sync_rx_clk|*} \
##                                   2ns 1
##
##alt_ehipc3_fm_sl_constraint_net_delay {*|alt_ehipc3_fm_inst|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_PTP.load_*x_ui_cc|in_data_toggle} \
##                                   {*|alt_ehipc3_fm_inst|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_PTP.load_*x_ui_cc|in_to_out_synchronizer|din_s1} \
##                                   2ns 1
##
##alt_ehipc3_fm_sl_constraint_net_delay {*|alt_ehipc3_fm_inst|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_PTP.load_*x_ui_cc|out_data_toggle_flopped} \
##                                   {*|alt_ehipc3_fm_inst|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_PTP.load_*x_ui_cc|out_to_in_synchronizer|din_s1} \
##                                   2ns 1
##
##alt_ehipc3_fm_sl_constraint_net_delay {*|alt_ehipc3_fm_inst|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_PTP.load_*x_ui_cc|in_data_buffer*} \
##                                   {*|alt_ehipc3_fm_inst|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_PTP.load_*x_ui_cc|out_data_buffer*} \
##                                   2ns 1
##
##alt_ehipc3_fm_sl_constraint_net_delay {*|alt_ehipc3_fm_inst|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_PTP.soft_ptp|ptp_ref_ts_capture_u|ptp_ckt_cal_u|*} \
##                                   {*|alt_ehipc3_fm_inst|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_PTP.ptp_csr_bank|*} \
##                                   2ns 1
##
##alt_ehipc3_fm_sl_constraint_net_delay {*|alt_ehipc3_fm_inst|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_PTP.soft_ptp|ptp_ref_ts_capture_u|ptp_ckt_cal_u|o_sclk} \
##                                   {*|alt_ehipc3_fm_inst|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_PTP.soft_ptp|ptp_ref_ts_capture_u|ptp_ckt_cal_u|*x_sclk_return_r} \
##                                   2ns 1
##
##alt_ehipc3_fm_sl_constraint_net_delay {*|alt_ehipc3_fm_inst|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_PTP.soft_ptp|ptp_ref_ts_capture_u|ptp_ckt_cal_u|o_sclk} \
##                                   {*|alt_ehipc3_fm_inst|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_PTP.soft_ptp|ptp_ref_ts_capture_u|ptp_ckt_cal_u|*x_sclk_return_rise_r} \
##                                   2ns 1
##
##alt_ehipc3_fm_sl_constraint_net_delay {*|alt_ehipc3_fm_inst|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_PTP.soft_ptp|ptp_ref_ts_capture_u|ptp_ckt_cal_u|o_sclk} \
##                                   {*|alt_ehipc3_fm_inst|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_PTP.soft_ptp|ptp_ref_ts_capture_u|ptp_ckt_cal_u|*x_error_cnt_in_progress} \
##                                   2ns 1
##
##alt_ehipc3_fm_sl_constraint_net_delay {*|alt_ehipc3_fm_inst|alt_ehipc3_fm_hard_inst|*|alt_ehipc3_fm_nphy_elane|g_xcvr_native_insts[*].ct3_xcvr_native_inst|inst_ct3_xcvr_channel|*inst_ct1_hssi_pldadapt_rx*} \
##                                   {*|alt_ehipc3_fm_inst|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_PTP.soft_ptp|ptp_ref_ts_capture_u|ptp_ckt_cal_u|*tx*} \
##                                   2ns 1 0
##
##alt_ehipc3_fm_sl_constraint_net_delay {*|alt_ehipc3_fm_inst|alt_ehipc3_fm_hard_inst|*|alt_ehipc3_fm_nphy_elane|g_xcvr_native_insts[*].ct3_xcvr_native_inst|inst_ct3_xcvr_channel|inst_ct1_hssi_pldadapt_tx*} \
##                                   {*|alt_ehipc3_fm_inst|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_PTP.soft_ptp|ptp_ref_ts_capture_u|ptp_ckt_cal_u|*x_sclk_return_r \
##                                    *|alt_ehipc3_fm_inst|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_PTP.soft_ptp|ptp_ref_ts_capture_u|ptp_ckt_cal_u|*x_sclk_return_rise_r \
##                                    *|alt_ehipc3_fm_inst|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_PTP.soft_ptp|ptp_ref_ts_capture_u|ptp_ckt_cal_u|*x_error_cnt_in_progress} \
##                                   2ns 1 0
##
##if {![string equal "quartus_sta" $::TimeQuestInfo(nameofexecutable)] } {
##set_net_delay -from [get_pins -compatibility_mode {*|alt_ehipc3_fm_inst|alt_ehipc3_fm_hard_inst|*|alt_ehipc3_fm_nphy_elane_pt*|g_xcvr_native_insts[*].ct3_xcvr_native_inst|inst_ct3_xcvr_channel|inst_ct1_hssi_pldadapt_tx|pld_pcs_tx_clk_out1_dcm \
##                                    *|alt_ehipc3_fm_inst|alt_ehipc3_fm_hard_inst|*|alt_ehipc3_fm_nphy_elane_pt*|g_xcvr_native_insts[*].ct3_xcvr_native_inst|inst_ct3_xcvr_channel|inst_ct1_hssi_pldadapt_tx|pld_pcs_tx_clk_out2_dcm}] \
##              -to   [get_registers {*|alt_ehipc3_fm_inst|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_PTP.soft_ptp|ptp_ref_ts_capture_u|ptp_ckt_cal_u|*x_sclk_return_r \
##                                    *|alt_ehipc3_fm_inst|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_PTP.soft_ptp|ptp_ref_ts_capture_u|ptp_ckt_cal_u|*x_sclk_return_rise_r \
##                                    *|alt_ehipc3_fm_inst|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_PTP.soft_ptp|ptp_ref_ts_capture_u|ptp_ckt_cal_u|*x_error_cnt_in_progress \
##                                    *|alt_ehipc3_fm_inst|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_PTP.soft_ptp|ptp_ref_ts_capture_u|*|resync_chains[0].synchronizer_nocut|din_s1 \
##                                    *|alt_ehipc3_fm_inst|alt_ehipc3_fm_hard_inst|*|alt_ehipc3_fm_nphy_elane_pt*|g_xcvr_native_insts[*].ct3_xcvr_native_inst|inst_ct3_xcvr_channel|inst_ct1_hssi_aibnd_tx*aib_fabric_tx_transfer_clk.reg \
##                                    *|alt_ehipc3_fm_inst|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_RST_CTRL.tx_sclk_return_std_sync|resync_chains[0].synchronizer_nocut|din_s1}] \
##              -max  2ns
##}
##set_max_delay -from [get_pins -compatibility_mode {*|alt_ehipc3_fm_inst|alt_ehipc3_fm_hard_inst|*|alt_ehipc3_fm_nphy_elane_pt*|g_xcvr_native_insts[*].ct3_xcvr_native_inst|inst_ct3_xcvr_channel|inst_ct1_hssi_pldadapt_tx|pld_pcs_tx_clk_out1_dcm \
##                                    *|alt_ehipc3_fm_inst|alt_ehipc3_fm_hard_inst|*|alt_ehipc3_fm_nphy_elane_pt*|g_xcvr_native_insts[*].ct3_xcvr_native_inst|inst_ct3_xcvr_channel|inst_ct1_hssi_pldadapt_tx|pld_pcs_tx_clk_out2_dcm}] \
##              -to   [get_registers {*|alt_ehipc3_fm_inst|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_PTP.soft_ptp|ptp_ref_ts_capture_u|ptp_ckt_cal_u|*x_sclk_return_r \
##                                    *|alt_ehipc3_fm_inst|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_PTP.soft_ptp|ptp_ref_ts_capture_u|ptp_ckt_cal_u|*x_sclk_return_rise_r \
##                                    *|alt_ehipc3_fm_inst|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_PTP.soft_ptp|ptp_ref_ts_capture_u|ptp_ckt_cal_u|*x_error_cnt_in_progress \
##                                    *|alt_ehipc3_fm_inst|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_PTP.soft_ptp|ptp_ref_ts_capture_u|*|resync_chains[0].synchronizer_nocut|din_s1 \
##                                    *|alt_ehipc3_fm_inst|alt_ehipc3_fm_hard_inst|*|alt_ehipc3_fm_nphy_elane_pt*|g_xcvr_native_insts[*].ct3_xcvr_native_inst|inst_ct3_xcvr_channel|inst_ct1_hssi_aibnd_tx*aib_fabric_tx_transfer_clk.reg \
##                                    *|alt_ehipc3_fm_inst|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_RST_CTRL.tx_sclk_return_std_sync|resync_chains[0].synchronizer_nocut|din_s1}] \
##              200ns
##set_min_delay -from [get_pins -compatibility_mode {*|alt_ehipc3_fm_inst|alt_ehipc3_fm_hard_inst|*|alt_ehipc3_fm_nphy_elane_pt*|g_xcvr_native_insts[*].ct3_xcvr_native_inst|inst_ct3_xcvr_channel|inst_ct1_hssi_pldadapt_tx|pld_pcs_tx_clk_out1_dcm \
##                                    *|alt_ehipc3_fm_inst|alt_ehipc3_fm_hard_inst|*|alt_ehipc3_fm_nphy_elane_pt*|g_xcvr_native_insts[*].ct3_xcvr_native_inst|inst_ct3_xcvr_channel|inst_ct1_hssi_pldadapt_tx|pld_pcs_tx_clk_out2_dcm}] \
##              -to   [get_registers {*|alt_ehipc3_fm_inst|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_PTP.soft_ptp|ptp_ref_ts_capture_u|ptp_ckt_cal_u|*x_sclk_return_r \
##                                    *|alt_ehipc3_fm_inst|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_PTP.soft_ptp|ptp_ref_ts_capture_u|ptp_ckt_cal_u|*x_sclk_return_rise_r \
##                                    *|alt_ehipc3_fm_inst|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_PTP.soft_ptp|ptp_ref_ts_capture_u|ptp_ckt_cal_u|*x_error_cnt_in_progress \
##                                    *|alt_ehipc3_fm_inst|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_PTP.soft_ptp|ptp_ref_ts_capture_u|*|resync_chains[0].synchronizer_nocut|din_s1 \
##                                    *|alt_ehipc3_fm_inst|alt_ehipc3_fm_hard_inst|*|alt_ehipc3_fm_nphy_elane_pt*|g_xcvr_native_insts[*].ct3_xcvr_native_inst|inst_ct3_xcvr_channel|inst_ct1_hssi_aibnd_tx*aib_fabric_tx_transfer_clk.reg \
##                                    *|alt_ehipc3_fm_inst|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_RST_CTRL.tx_sclk_return_std_sync|resync_chains[0].synchronizer_nocut|din_s1}] \
##              -200ns
##
##set_false_path -from *|alt_ehipc3_fm_inst|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_PTP.soft_ptp|ptp_ref_ts_capture_u|ptp_ckt_cal_u|o_sclk \
##               -to   *|alt_ehipc3_fm_inst|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_PTP.soft_ptp|ptp_ref_ts_capture_u|tx_tam_capture|sclk_return_r
##set_false_path -from *|alt_ehipc3_fm_inst|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_PTP.soft_ptp|ptp_ref_ts_capture_u|ptp_ckt_cal_u|o_sclk \
##               -to   *|alt_ehipc3_fm_inst|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_PTP.soft_ptp|ptp_ref_ts_capture_u|rx_tam_capture|sclk_return_r
##
##set_max_delay -to *|alt_ehipc3_fm_inst|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_PTP.soft_ptp|ptp_ref_ts_capture_u|tx_tam_capture|sclk_return_r 200ns
##set_max_delay -to *|alt_ehipc3_fm_inst|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_PTP.soft_ptp|ptp_ref_ts_capture_u|rx_tam_capture|sclk_return_r 200ns
##set_false_path -hold -to *|alt_ehipc3_fm_inst|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_PTP.soft_ptp|ptp_ref_ts_capture_u|tx_tam_capture|sclk_return_r 
##set_false_path -hold -to *|alt_ehipc3_fm_inst|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_PTP.soft_ptp|ptp_ref_ts_capture_u|rx_tam_capture|sclk_return_r 
##if {![string equal "quartus_sta" $::TimeQuestInfo(nameofexecutable)] } {
##set_data_delay -to *|alt_ehipc3_fm_inst|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_PTP.soft_ptp|ptp_ref_ts_capture_u|tx_tam_capture|sclk_return_r -from * 3.500ns
##set_data_delay -to *|alt_ehipc3_fm_inst|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_PTP.soft_ptp|ptp_ref_ts_capture_u|rx_tam_capture|sclk_return_r -from * 3.500ns
##} else {
##set_data_delay -to *|alt_ehipc3_fm_inst|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_PTP.soft_ptp|ptp_ref_ts_capture_u|tx_tam_capture|sclk_return_r -from * 4.500ns
##set_data_delay -to *|alt_ehipc3_fm_inst|SL_SOFT.SL_SOFT_I[*].sl_soft|SL_PTP.soft_ptp|ptp_ref_ts_capture_u|rx_tam_capture|sclk_return_r -from * 4.500ns
##}
##
##set aib_pld_tx_clk_pin_col	[get_pins -compat -nowarn *|alt_ehipc3_fm_inst|alt_ehipc3_fm_hard_inst|*|alt_ehipc3_fm_nphy_elane_pt*|g_xcvr_native_insts[*].ct3_xcvr_native_inst|inst_ct3_xcvr_channel|inst_ct1_hssi_pldadapt_tx|pld_tx_clk?_dcm]
##set aib_pld_tx_clk_pin_col	[add_to_collection $aib_pld_tx_clk_pin_col [get_pins -compat -nowarn *|alt_ehipc3_fm_inst|alt_ehipc3_fm_hard_inst|*|alt_ehipc3_fm_nphy_elane_pt*|g_xcvr_native_insts[*].ct3_xcvr_native_inst|inst_ct3_xcvr_channel|inst_ct1_hssi_pldadapt_tx|pld_tx_clk?_rowclk] ]
##set aib_tx_internal_div_reg_col	[get_registers -nowarn *|alt_ehipc3_fm_inst|alt_ehipc3_fm_hard_inst|*|alt_ehipc3_fm_nphy_elane_pt*|g_xcvr_native_insts[*].ct3_xcvr_native_inst|inst_ct3_xcvr_channel|inst_ct1_hssi_pldadapt_tx~aib_tx_internal_div.reg]
##set aib_fabric_transfer_clk_col	[get_registers -nowarn *|alt_ehipc3_fm_inst|alt_ehipc3_fm_hard_inst|*|alt_ehipc3_fm_nphy_elane_pt*|g_xcvr_native_insts[*].ct3_xcvr_native_inst|inst_ct3_xcvr_channel|inst_ct1_hssi_pldadapt_tx~*aib_fabric_tx_transfer_clk.reg]
##
##
#### ---------------------------------------------------------------------------------------------------------------------------------
#### 29/Aug/2019 : slim35 : HSD#1409425013 : HSD#1507377856 :
#### ---------------------------------------------------------------------------------------------------------------------------------
#### Add in false_path recommended by Native PHY to PTP SDC to resolve the unexpected timed hold path warning introduced from Native PHY SDC.
#### ---------------------------------------------------------------------------------------------------------------------------------
##set aib_pld_tx_clk_pin_col	[get_pins -compat -nowarn *|alt_ehipc3_fm_inst|alt_ehipc3_fm_hard_inst|*|alt_ehipc3_fm_nphy_elane_pt*|g_xcvr_native_insts[*].ct3_xcvr_native_inst|inst_ct3_xcvr_channel|inst_ct1_hssi_pldadapt_tx|pld_tx_clk?_dcm]
##set aib_pld_tx_clk_pin_col	[add_to_collection $aib_pld_tx_clk_pin_col [get_pins -compat -nowarn *|alt_ehipc3_fm_inst|alt_ehipc3_fm_hard_inst|*|alt_ehipc3_fm_nphy_elane_pt*|g_xcvr_native_insts[*].ct3_xcvr_native_inst|inst_ct3_xcvr_channel|inst_ct1_hssi_pldadapt_tx|pld_tx_clk?_rowclk] ]
##set aib_tx_internal_div_reg_col	[get_registers -nowarn *|alt_ehipc3_fm_inst|alt_ehipc3_fm_hard_inst|*|alt_ehipc3_fm_nphy_elane_pt*|g_xcvr_native_insts[*].ct3_xcvr_native_inst|inst_ct3_xcvr_channel|inst_ct1_hssi_pldadapt_tx~aib_tx_internal_div.reg]
##set aib_fabric_transfer_clk_col	[get_registers -nowarn *|alt_ehipc3_fm_inst|alt_ehipc3_fm_hard_inst|*|alt_ehipc3_fm_nphy_elane_pt*|g_xcvr_native_insts[*].ct3_xcvr_native_inst|inst_ct3_xcvr_channel|inst_ct1_hssi_pldadapt_tx~*aib_fabric_tx_transfer_clk.reg]
##
##if { [get_collection_size $aib_fabric_transfer_clk_col] > 0 } {
##	if { [get_collection_size $aib_tx_internal_div_reg_col] > 0 } {
##		set_false_path -from $aib_tx_internal_div_reg_col -to $aib_fabric_transfer_clk_col 
##	}
##
##	if { [get_collection_size $aib_pld_tx_clk_pin_col] > 0 } {
##		set_false_path -through $aib_pld_tx_clk_pin_col -to $aib_fabric_transfer_clk_col
##	}
##}
#### ---------------------------------------------------------------------------------------------------------------------------------

set_false_path -from {soc_inst|*axi_bridge_for_acp_0|csr_*} -to {*agilex_hps|hps|*}
set_false_path -from * -to {*|ftile_debug_status_pio_0|altera_avalon_pio_inst|readdata[*]}

#set_false_path -from {*|ftile_25gbe_1588|rst_controller_*|alt_rst_sync_uq1|altera_reset_synchronizer_int_chain_out} -to {*|ftile_25gbe_1588|ftile_25gbe_*x_dma_ch*|rst_controller*|alt_rst_sync_uq1|altera_reset_synchronizer_int_chain[1]}

#set_false_path -from * -to {soc_inst*debug_status_reg[*]}
