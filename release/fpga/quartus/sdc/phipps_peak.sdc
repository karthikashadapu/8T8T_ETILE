# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3

##**************************************************************
# Clock Group
##**************************************************************

set_clock_groups -asynchronous -group [get_clocks {u_iopll_491p52|iopll_0_outclk0}] -group [get_clocks {soc_inst|ftile_subsys|ftile_hip|ftile_hip|tx_clkout|ch13}]

#set_clock_groups -asynchronous -group [get_clocks {MAIN_CLOCK}] -group [get_clocks {soc_inst|dma_subsys|iopll_clk_avst_div2|altera_iopll_inst_outclk0}]

set_clock_groups -asynchronous -group [get_clocks {soc_inst|hssi_ss_1|hssi_ss_1|U_eth_f_inst_p0|eth_f_top_p0|rx_clkout2|ch12}] -group [get_clocks {MAIN_CLOCK}]

set_clock_groups -asynchronous -group [get_clocks {u_iopll_491p52|iopll_0_outclk0}] -group [get_clocks {soc_inst|hssi_ss_1|hssi_ss_1|U_eth_f_inst_p0|eth_f_top_p0|rx_clkout2|ch12}]

set_clock_groups -asynchronous -group [get_clocks {MAIN_CLOCK}] -group [get_clocks {u_iopll_491p52|iopll_0_outclk0}]

set_clock_groups -asynchronous -group [get_clocks {MAIN_CLOCK}] -group [get_clocks {u_iopll_dspby2|iopll_0_outclk0}]

set_clock_groups -asynchronous -group [get_clocks {MAIN_CLOCK}] -group [get_clocks {soc_inst|hssi_ss_1|hssi_ss_1|U_eth_f_inst_p0|eth_f_top_p0|rx_clkout2|ch12}]

set_clock_groups -asynchronous -group [get_clocks {u_iopll_491p52|iopll_0_outclk0}] -group [get_clocks {u_iopll_dspby2|iopll_0_outclk0}]

set_clock_groups -asynchronous -group [get_clocks {MAIN_CLOCK}] -group [get_clocks {TOD_CLOCK}]

set_clock_groups -asynchronous -group [get_clocks {soc_inst|hssi_ss_1|hssi_ss_1|U_eth_f_inst_p0|eth_f_top_p0|rx_clkout|ch12}] -group [get_clocks {soc_inst|hssi_ss_1|hssi_ss_1|U_eth_f_inst_p0|eth_f_top_p0|rx_clkout2|ch12}]

set_clock_groups -asynchronous -group [get_clocks {soc_inst|hssi_ss_1|hssi_ss_1|U_eth_f_inst_p0|eth_f_top_p0|tx_clkout2|ch12 }] -group [get_clocks {soc_inst|hssi_ss_1|hssi_ss_1|U_eth_f_inst_p0|eth_f_top_p0|rx_clkout2|ch12}]

set_clock_groups -asynchronous -group [get_clocks {ag_esom_top_auto_tiles|z1577b_x5_y166_n0||tx_clkout|ch7 }] -group [get_clocks {soc_inst|hssi_ss_1|hssi_ss_1|U_eth_f_inst_p0|eth_f_top_p0|rx_clkout2|ch12}]
       
set_clock_groups -asynchronous -group [get_clocks {ag_esom_top_auto_tiles|z1577b_x5_y166_n0||tx_clkout|ch7 }] -group [get_clocks {MAIN_CLOCK}]

set_clock_groups -asynchronous -group [get_clocks {TOD_CLOCK }] -group [get_clocks {ag_esom_top_auto_tiles|z1577b_x5_y166_n0||tx_clkout|ch7}]

#set_clock_groups -asynchronous -group [get_clocks {MAIN_CLOCK }] -group [get_clocks {soc_inst|dma_subsys|iopll_clk_avst_div2|altera_iopll_inst_outclk0}]

set_clock_groups -asynchronous -group [get_clocks {TOD_CLOCK }] -group [get_clocks {u_iopll_491p52|iopll_0_outclk0}]

set_clock_groups -asynchronous -group [get_clocks {soc_inst|hssi_ss_1|hssi_ss_1|U_eth_f_inst_p0|eth_f_top_p0|rx_clkout2|ch12 }] -group [get_clocks {u_iopll_491p52|iopll_0_outclk0}]

set_clock_groups -asynchronous -group [get_clocks {u_iopll_dspby2|iopll_0_outclk0 }] -group [get_clocks {u_iopll_491p52|iopll_0_outclk0}]

#set_clock_groups -asynchronous -group [get_clocks {soc_inst|hssi_ss_1|hssi_ss_1|U_eth_f_inst_p0|eth_f_top_p0|rx_clkout2|ch12 }] -group [get_clocks {u_iopll_390p625|iopll_0_outclk0}]

set_clock_groups -asynchronous -group [get_clocks {u_iopll_491p52|iopll_0_outclk0}] -group [get_clocks {ag_esom_top_auto_tiles|z1577b_x5_y166_n0||tx_clkout|ch7}]

set_clock_groups -asynchronous -group [get_clocks {MAIN_CLOCK}] -group [get_clocks {u_iopll_491p52|iopll_0_outclk1}]
set_clock_groups -asynchronous -group [get_clocks {MAIN_CLOCK}] -group [get_clocks {soc_inst|j204c_f_rx_tx_ip|intel_jesd204c_f|intel_jesd204c_f|tx_clkout|ch20}]


#############################################################################################
############# constrain for 2 stage flip flop synchronizer ##################################
#############################################################################################

set_net_delay -from [get_registers {*|tod_subsys_tod_timestamp_96b_0|nanoseconds[*]}] -to [get_registers {*|tod_subsys_tod_timestamp_96b_0|nanoseconds_1d*}] -max -get_value_from_clock_period dst_clock_period -value_multiplier 0.8
set_max_skew  -from [get_keepers   {*|tod_subsys_tod_timestamp_96b_0|nanoseconds[*]}] -to [get_keepers   {*|tod_subsys_tod_timestamp_96b_0|nanoseconds_1d*}] -get_skew_value_from_clock_period min_clock_period -skew_value_multiplier 0.8
set_max_delay -from [get_registers {*|tod_subsys_tod_timestamp_96b_0|nanoseconds[*]}] -to [get_registers {*|tod_subsys_tod_timestamp_96b_0|nanoseconds_1d*}] 8
set_min_delay -from [get_registers {*|tod_subsys_tod_timestamp_96b_0|nanoseconds[*]}] -to [get_registers {*|tod_subsys_tod_timestamp_96b_0|nanoseconds_1d*}] 8


set_net_delay -from [get_registers {*|tod_subsys_tod_timestamp_96b_0|fr_nanoseconds[*]}] -to [get_registers {*|tod_subsys_tod_timestamp_96b_0|fr_nanoseconds_1d*}] -max -get_value_from_clock_period dst_clock_period -value_multiplier 0.8
set_max_skew  -from [get_keepers   {*|tod_subsys_tod_timestamp_96b_0|fr_nanoseconds[*]}] -to [get_keepers   {*|tod_subsys_tod_timestamp_96b_0|fr_nanoseconds_1d*}] -get_skew_value_from_clock_period min_clock_period -skew_value_multiplier 0.8
set_max_delay -from [get_registers {*|tod_subsys_tod_timestamp_96b_0|fr_nanoseconds[*]}] -to [get_registers {*|tod_subsys_tod_timestamp_96b_0|fr_nanoseconds_1d*}] 8
set_min_delay -from [get_registers {*|tod_subsys_tod_timestamp_96b_0|fr_nanoseconds[*]}] -to [get_registers {*|tod_subsys_tod_timestamp_96b_0|fr_nanoseconds_1d*}] 8

set_net_delay -from [get_registers {*|tod_subsys_tod_timestamp_96b_0|seconds_msb[*]}] -to [get_registers {*|tod_subsys_tod_timestamp_96b_0|seconds_msb_1d*}] -max -get_value_from_clock_period dst_clock_period -value_multiplier 0.8
set_max_skew  -from [get_keepers   {*|tod_subsys_tod_timestamp_96b_0|seconds_msb[*]}] -to [get_keepers   {*|tod_subsys_tod_timestamp_96b_0|seconds_msb_1d*}] -get_skew_value_from_clock_period min_clock_period -skew_value_multiplier 0.8
set_max_delay -from [get_registers {*|tod_subsys_tod_timestamp_96b_0|seconds_msb[*]}] -to [get_registers {*|tod_subsys_tod_timestamp_96b_0|seconds_msb_1d*}] 8
set_min_delay -from [get_registers {*|tod_subsys_tod_timestamp_96b_0|seconds_msb[*]}] -to [get_registers {*|tod_subsys_tod_timestamp_96b_0|seconds_msb_1d*}] 8

set_net_delay -from [get_registers {*|tod_subsys_tod_timestamp_96b_0|seconds_lsb[*]}] -to [get_registers {*|tod_subsys_tod_timestamp_96b_0|seconds_lsb_1d*}] -max -get_value_from_clock_period dst_clock_period -value_multiplier 0.8
set_max_skew  -from [get_keepers   {*|tod_subsys_tod_timestamp_96b_0|seconds_lsb[*]}] -to [get_keepers   {*|tod_subsys_tod_timestamp_96b_0|seconds_lsb_1d*}] -get_skew_value_from_clock_period min_clock_period -skew_value_multiplier 0.8
set_max_delay -from [get_registers {*|tod_subsys_tod_timestamp_96b_0|seconds_lsb[*]}] -to [get_registers {*|tod_subsys_tod_timestamp_96b_0|seconds_lsb_1d*}] 8
set_min_delay -from [get_registers {*|tod_subsys_tod_timestamp_96b_0|seconds_lsb[*]}] -to [get_registers {*|tod_subsys_tod_timestamp_96b_0|seconds_lsb_1d*}] 8

set_net_delay -from [get_registers {*|tod_subsys_tod_timestamp_96b_0|rfp_sync_pulse_ext*}] -to [get_registers {*|tod_subsys_tod_timestamp_96b_0|rfp_sync_pul_1d}] -max -get_value_from_clock_period dst_clock_period -value_multiplier 0.8
set_max_skew  -from [get_keepers   {*|tod_subsys_tod_timestamp_96b_0|rfp_sync_pulse_ext*}] -to [get_keepers   {*|tod_subsys_tod_timestamp_96b_0|rfp_sync_pul_1d}] -get_skew_value_from_clock_period min_clock_period -skew_value_multiplier 0.8
	
set_net_delay -from [get_registers {*|lphy_ss_lphy_ss_top|u_lphy_ss_config|sfn_cnt_2d[*]}] -to [get_registers {*|u_xran_timestamp|frame_status_1d[*]}] -max -get_value_from_clock_period dst_clock_period -value_multiplier 0.8
set_max_skew  -from [get_keepers   {*|lphy_ss_lphy_ss_top|u_lphy_ss_config|sfn_cnt_2d[*]}] -to [get_keepers   {*|u_xran_timestamp|frame_status_1d[*]}] -get_skew_value_from_clock_period min_clock_period -skew_value_multiplier 0.8

set_net_delay -from [get_registers {*|lphy_ss_lphy_ss_top|u_lphy_ss_config|sample_cnt_14_2d[*]}] -to [get_registers {*|u_xran_timestamp|frame_status_1d[*]}] -max -get_value_from_clock_period dst_clock_period -value_multiplier 0.8
set_max_skew  -from [get_keepers   {*|lphy_ss_lphy_ss_top|u_lphy_ss_config|sample_cnt_14_2d[*]}] -to [get_keepers   {*|u_xran_timestamp|frame_status_1d[*]}] -get_skew_value_from_clock_period min_clock_period -skew_value_multiplier 0.8

set_net_delay -from [get_registers {*|lphy_ss_lphy_ss_top|u_lphy_ss_config|lte_sf_cnt_2d[*]}] -to [get_registers {*|u_xran_timestamp|frame_status_1d[*]}] -max -get_value_from_clock_period dst_clock_period -value_multiplier 0.8
set_max_skew  -from [get_keepers   {*|lphy_ss_lphy_ss_top|u_lphy_ss_config|lte_sf_cnt_2d[*]}] -to [get_keepers   {*|u_xran_timestamp|frame_status_1d[*]}] -get_skew_value_from_clock_period min_clock_period -skew_value_multiplier 0.8

set_net_delay -from [get_registers {*|lphy_ss_lphy_ss_top|u_lphy_ss_config|sym_cnt_15_2d[*]}] -to [get_registers {*|u_xran_timestamp|frame_status_1d[*]}] -max -get_value_from_clock_period dst_clock_period -value_multiplier 0.8
set_max_skew  -from [get_keepers   {*|lphy_ss_lphy_ss_top|u_lphy_ss_config|sym_cnt_15_2d[*]}] -to [get_keepers   {*|u_xran_timestamp|frame_status_1d[*]}] -get_skew_value_from_clock_period min_clock_period -skew_value_multiplier 0.8

set_net_delay -from [get_registers {*|lphy_ss_lphy_ss_top|u_lphy_ss_config|rfn_cnt_2d[*]}] -to [get_registers {*|u_xran_timestamp|frame_status_1d[*]}] -max -get_value_from_clock_period dst_clock_period -value_multiplier 0.8
set_max_skew  -from [get_keepers   {*|lphy_ss_lphy_ss_top|u_lphy_ss_config|rfn_cnt_2d[*]}] -to [get_keepers   {*|u_xran_timestamp|frame_status_1d[*]}] -get_skew_value_from_clock_period min_clock_period -skew_value_multiplier 0.8

set_net_delay -from [get_registers {*|lphy_ss_lphy_ss_top|u_lphy_ss_config|sample_cnt_15_2d[*]}] -to [get_registers {*|u_xran_timestamp|frame_status_1d[*]}] -max -get_value_from_clock_period dst_clock_period -value_multiplier 0.8
set_max_skew  -from [get_keepers   {*|lphy_ss_lphy_ss_top|u_lphy_ss_config|sample_cnt_15_2d[*]}] -to [get_keepers   {*|u_xran_timestamp|frame_status_1d[*]}] -get_skew_value_from_clock_period min_clock_period -skew_value_multiplier 0.8

set_net_delay -from [get_registers {*|tod_subsys_tod_timestamp_96b_0|rfp_sync_pul*}] -to [get_registers {*|u_lphy_ss_config|auxN_tx_rfp_1d*}] -max -get_value_from_clock_period dst_clock_period -value_multiplier 0.8
set_max_skew  -from [get_registers {*|tod_subsys_tod_timestamp_96b_0|rfp_sync_pul*}] -to [get_registers {*|u_lphy_ss_config|auxN_tx_rfp_1d*}] -get_skew_value_from_clock_period min_clock_period -skew_value_multiplier 0.8

set_net_delay -from [get_registers {soc_inst|wrapper_0|wrapper_wrapper_top|wrapper_wrapper_top|u_dl_top|u_dl_fdv_buffer|sym_reset_pul[*][*]}] -to [get_registers {*|u_dl_fdv_buffer|sym_reset_1d[*][*]}] -max -get_value_from_clock_period dst_clock_period -value_multiplier 0.8
set_max_skew -from [get_registers {soc_inst|wrapper_0|wrapper_wrapper_top|wrapper_wrapper_top|u_dl_top|u_dl_fdv_buffer|sym_reset_pul[*][*]}] -to [get_registers {*|u_dl_fdv_buffer|sym_reset_1d[*][*]}] -get_skew_value_from_clock_period min_clock_period -skew_value_multiplier 0.8


#####################################################################################

########################################################################
set_net_delay -from [get_registers {*|u_dsp_block_capture|capture_ctrl[*]        }] -to [get_registers {*|u_dsp_block_capture|capture_ctrl_st_d1[*]        }] -max -get_value_from_clock_period dst_clock_period -value_multiplier 0.8      
set_net_delay -from [get_registers {*|u_dsp_block_capture|interface_sel[*]       }] -to [get_registers {*|u_dsp_block_capture|interface_sel_st_d1[*]       }] -max -get_value_from_clock_period dst_clock_period -value_multiplier 0.8
set_net_delay -from [get_registers {*|u_dsp_block_capture|channel_sel[*]         }] -to [get_registers {*|u_dsp_block_capture|channel_sel_st_d1[*]         }] -max -get_value_from_clock_period dst_clock_period -value_multiplier 0.8
set_net_delay -from [get_registers {*|u_dsp_block_capture|byte_slice_idx_sel[*]  }] -to [get_registers {*|u_dsp_block_capture|byte_slice_idx_sel_st_d1[*]  }] -max -get_value_from_clock_period dst_clock_period -value_multiplier 0.8
set_net_delay -from [get_registers {*|u_dsp_block_capture|subframe_config[*]     }] -to [get_registers {*|u_dsp_block_capture|subframe_config_st_d1[*]     }] -max -get_value_from_clock_period dst_clock_period -value_multiplier 0.8
set_net_delay -from [get_registers {*|u_dsp_block_capture|frame_config[*]        }] -to [get_registers {*|u_dsp_block_capture|frame_config_st_d1[*]        }] -max -get_value_from_clock_period dst_clock_period -value_multiplier 0.8
                                                                                                                                                                 
set_max_skew  -from [get_keepers   {*|u_dsp_block_capture|capture_ctrl[*]        }] -to [get_keepers   {*|u_dsp_block_capture|capture_ctrl_st_d1[*]        }] -get_skew_value_from_clock_period min_clock_period -skew_value_multiplier 0.8               
set_max_skew  -from [get_keepers   {*|u_dsp_block_capture|interface_sel[*]       }] -to [get_keepers   {*|u_dsp_block_capture|interface_sel_st_d1[*]       }] -get_skew_value_from_clock_period min_clock_period -skew_value_multiplier 0.8
set_max_skew  -from [get_keepers   {*|u_dsp_block_capture|channel_sel[*]         }] -to [get_keepers   {*|u_dsp_block_capture|channel_sel_st_d1[*]         }] -get_skew_value_from_clock_period min_clock_period -skew_value_multiplier 0.8
set_max_skew  -from [get_keepers   {*|u_dsp_block_capture|byte_slice_idx_sel[*]  }] -to [get_keepers   {*|u_dsp_block_capture|byte_slice_idx_sel_st_d1[*]  }] -get_skew_value_from_clock_period min_clock_period -skew_value_multiplier 0.8
set_max_skew  -from [get_keepers   {*|u_dsp_block_capture|subframe_config[*]     }] -to [get_keepers   {*|u_dsp_block_capture|subframe_config_st_d1[*]     }] -get_skew_value_from_clock_period min_clock_period -skew_value_multiplier 0.8
set_max_skew  -from [get_keepers   {*|u_dsp_block_capture|frame_config[*]        }] -to [get_keepers   {*|u_dsp_block_capture|frame_config_st_d1[*]        }] -get_skew_value_from_clock_period min_clock_period -skew_value_multiplier 0.8


########################################################################
 










                                                                                                                                                                                                              
