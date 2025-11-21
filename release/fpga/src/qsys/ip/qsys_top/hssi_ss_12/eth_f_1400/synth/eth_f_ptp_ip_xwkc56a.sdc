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


## SDC when ENABLE_PTP=1 ##

#set dir_name [file dirname [info script]] 
#set module_name hssi_ss_1_eth_f_1400_xwkc56a

## get current IP instance 
set ip_inst_name [get_current_instance]

## set global variables
global ::ip_sdc_debug

# ----------------------------------------------------------------------------- #
# per F-tile: AIB7 clock BEGIN (same as ip.sdc but lines reduced and clock name is modified to base on tile_instance_name)
# A) Set parameters based on IP configuration
set syspll_outclk_freq_mhz 830.078125
set tx_clk1_dcm_mhz 415.0390625
## to limit number of decimal points
set tx_clk1_dcm_mhz [expr double (round(10000*$tx_clk1_dcm_mhz))/10000.0]
## No clocking mode, parallel frequency always syspll frequency; no pma_outclk frequency for ethernet
set tx_parallel_freq [expr double (round(10000*$syspll_outclk_freq_mhz))/10000.0]
set tx_pma_aib_freq $tx_parallel_freq
set tx_pld_pcs_freq $tx_clk1_dcm_mhz

## create new dictionary 
set active_chnl_clks [dict create]
set active_chnl_clks_names [dict create]
set active_chnl_clks_freq [dict create]
set active_chnl_multiply_by_factors [dict create]
set active_chnl_divide_by_factors [dict create]

## set frequency for base clocks
dict set active_chnl_clks_freq tx_pld_pcs_clk_ref $tx_pld_pcs_freq
dict set active_chnl_clks_freq tx_pma_aib_clk_ref $tx_pma_aib_freq
dict set active_chnl_clks_freq pld_pma_hclk_ref 100 

## set multiple_by and divide_by for generated clocks
dict set active_chnl_multiply_by_factors     tx_pld_pcs_clk_reg    1
dict set active_chnl_divide_by_factors       tx_pld_pcs_clk_reg    1
dict set active_chnl_multiply_by_factors     tx_pma_aib_clk_reg    1
dict set active_chnl_divide_by_factors       tx_pma_aib_clk_reg    1
dict set active_chnl_multiply_by_factors     tx_clkout    1
dict set active_chnl_divide_by_factors       tx_clkout    1
# ----------------------------------------------------------------------------- #
# B) use eth_f timing dummy reg to find top_tile_inst_name and top_fab_inst_name
set dummy_ff_in_sip [get_nodes $ip_inst_name|sip_inst|dummy_out_for_timing*|clk]

if {[get_collection_size $dummy_ff_in_sip] > 0} {
    foreach_in_collection dummy_ff_in_sip_node $dummy_ff_in_sip {
        set dummy_ff_in_sip_node_name [get_node_info -name $dummy_ff_in_sip_node]
        set dummy_ff_in_sip_fanin [get_fanins $dummy_ff_in_sip_node_name]
        ## get dummy ff fanin node name 
        set dummy_ff_in_sip_fanin_node_name [get_node_info -name $dummy_ff_in_sip_fanin]
        
        # get instance name of top__tiles in tile part 
        set top_tile_index [string last ~aib_hssi $dummy_ff_in_sip_fanin_node_name] 
        set top_tile_inst_name [string range $dummy_ff_in_sip_fanin_node_name 0 $top_tile_index]
        # get instance name of top__tiles in fabric part
        set top_fab_index [string last | $dummy_ff_in_sip_fanin_node_name]
        set top_fab_inst_name [string range $dummy_ff_in_sip_fanin_node_name 0 $top_fab_index]
        
        if {$ip_sdc_debug == 1} {
            post_message -type info "IP SDC (PTP): instance name of top_tiles in tile part is $top_tile_inst_name"
            post_message -type info "IP SDC (PTP): instance name of top_tiles in fab part is $top_fab_inst_name"
        }
    }
}
set chnl 7
# Info: IP SDC: instance name of top_tiles in tile part is eth_f_hw_auto_tiles|z1577a_x0_y0_n0|z1577a~ 
# Info: IP SDC: instance name of top_tiles in fab part is eth_f_hw_auto_tiles|z1577a_x0_y0_n0| 
# ----------------------------------------------------------------------------- #

# IF AIB7 clock has been created (by ptp_ip.sdc of other instance), skip the following
# C) prepare active_chnl_clks

set tx_clkout_nodes_col tx_clkout|ch${chnl}

if {[get_collection_size [get_clocks -nowarn $top_fab_inst_name|$tx_clkout_nodes_col]] == 0} {
    if {$ip_sdc_debug == 1} {
        post_message -type info "IP SDC (PTP): Clock $top_fab_inst_name|$tx_clkout_nodes_col does not exist. Proceed to create generated clock."
    }
    set tx_pld_pcs_ref_nodes_col aib_hssi_pld_pcs_tx_clk_out_ch${chnl}_ref
    if {[get_collection_size [get_nodes -nowarn $top_tile_inst_name$tx_pld_pcs_ref_nodes_col]] > 0} {
        dict lappend active_chnl_clks tx_pld_pcs_clk_ref [get_node_info -name $top_tile_inst_name$tx_pld_pcs_ref_nodes_col]
        ## sorting 
        dict set active_chnl_clks tx_pld_pcs_clk_ref [lsort -dictionary [dict get $active_chnl_clks tx_pld_pcs_clk_ref]]
        if {$ip_sdc_debug == 1} {
          post_message -type info "IP SDC (PTP): TX pld pcs clk ref node info: [dict get $active_chnl_clks tx_pld_pcs_clk_ref]"
        }
    }
     
    set tx_pld_pcs_reg_nodes_col aib_hssi_pld_pcs_tx_clk_out_ch${chnl}.reg 
    if {[get_collection_size [get_nodes -nowarn $top_tile_inst_name$tx_pld_pcs_reg_nodes_col]] > 0} {
        dict lappend active_chnl_clks tx_pld_pcs_clk_reg [get_node_info -name $top_tile_inst_name$tx_pld_pcs_reg_nodes_col]
        ## sorting
        dict set active_chnl_clks tx_pld_pcs_clk_reg [lsort -dictionary [dict get $active_chnl_clks tx_pld_pcs_clk_reg]]
        if {$ip_sdc_debug == 1} {
          post_message -type info "IP SDC (PTP): TX pld pcs clk reg node info: [dict get $active_chnl_clks tx_pld_pcs_clk_reg]"
        }
    }

    set tx_pma_aib_ref_nodes_col aib_hssi_pma_aib_tx_clk_ch${chnl}_ref 
    if {[get_collection_size [get_nodes -nowarn $top_tile_inst_name$tx_pma_aib_ref_nodes_col]] > 0} {
       dict lappend active_chnl_clks tx_pma_aib_clk_ref [get_node_info -name $top_tile_inst_name$tx_pma_aib_ref_nodes_col]
       ## sorting 
       dict set active_chnl_clks tx_pma_aib_clk_ref [lsort -dictionary [dict get $active_chnl_clks tx_pma_aib_clk_ref]]
       if {$ip_sdc_debug == 1} {
          post_message -type info "IP SDC (PTP): TX pma aib clk ref node info: [dict get $active_chnl_clks tx_pma_aib_clk_ref]"
       }
    }

    set tx_pma_aib_reg_nodes_col aib_hssi_pma_aib_tx_clk_ch${chnl}.reg
    if {[get_collection_size [get_nodes -nowarn $top_tile_inst_name$tx_pma_aib_reg_nodes_col]] > 0} {
       dict lappend active_chnl_clks tx_pma_aib_clk_reg [get_node_info -name $top_tile_inst_name$tx_pma_aib_reg_nodes_col]
      ## sorting
       dict set active_chnl_clks tx_pma_aib_clk_reg [lsort -dictionary [dict get $active_chnl_clks tx_pma_aib_clk_reg]]
       if {$ip_sdc_debug == 1} {
           post_message -type info "IP SDC (PTP): TX pma aib clk reg node info: [dict get $active_chnl_clks tx_pma_aib_clk_reg]"
       }
    }

    set tx_pld_pcs_out1_dcm_nodes_col hdpldadapt_tx_chnl_${chnl}|pld_pcs_tx_clk_out1_dcm  
    if {[get_collection_size [get_nodes -nowarn $top_fab_inst_name$tx_pld_pcs_out1_dcm_nodes_col]] > 0} {
      dict lappend active_chnl_clks tx_clkout [get_node_info -name $top_fab_inst_name$tx_pld_pcs_out1_dcm_nodes_col]
      ## sorting
      dict set active_chnl_clks tx_clkout [lsort -dictionary [dict get $active_chnl_clks tx_clkout]]
      if {$ip_sdc_debug == 1} {
          post_message -type info "IP SDC (PTP): PLD PCS TX OUT1 DCM CLK node info: [dict get $active_chnl_clks tx_clkout]"
      }
    }
} else {
    if {$ip_sdc_debug == 1} {
        post_message -type info "IP SDC (PTP): Clock $top_fab_inst_name|$tx_clkout_nodes_col already exists. Skipping create generated clock."
    }
}

proc native_prepare_to_create_clocks_all_ch {clks_grp clks active_chnl_clks_freq active_chnl_multiply_by_factors active_chnl_divide_by_factors top_fab_inst_name top_tile_inst_name master_clocks source_nodes} {
    ## call global variable 
    global ::ip_sdc_debug

    foreach clk $clks {
        if {$clks_grp == "tx_pld_pcs_clk_ref" || $clks_grp == "rx_pld_pcs_clk_ref" || $clks_grp == "tx_pma_aib_clk_ref" || $clks_grp == "rx_transfer_clk_ref" || $clks_grp == "tx_user_clk_ref" || $clks_grp == "rx_user_clk_ref" || $clks_grp == "pld_pma_hclk_ref"} {
            # fix to ch7
            set chnl 7
            set grp_freq [dict get $active_chnl_clks_freq $clks_grp]
            
            ## create clock name based on clock group and channel 
            set clk_name $top_fab_inst_name|$clks_grp|ch$chnl
            dict lappend active_chnl_clks_names tx_pld_pcs_clks_ref_name $clk_name
            
            ## create_clock  
            create_clock \
                        -name $clk_name \
                        -period "$grp_freq MHz" \
                        -add    $clk
            if {$ip_sdc_debug == 1} {
                post_message -type info "IP SDC (PTP): Creating base clock: $clk_name, period $grp_freq MHz, at node $clk"
                post_message -type info "IP SDC (PTP): Creating base clock: period is $grp_freq MHz"
                post_message -type info "IP SDC (PTP): Creating base clock: at node $clk"
            }               
        } elseif {$clks_grp == "tx_pld_pcs_clk_reg" || $clks_grp == "rx_pld_pcs_clk_reg" || $clks_grp == "tx_pma_aib_clk_reg" || $clks_grp == "rx_transfer_clk_reg" || $clks_grp == "tx_user_clk_reg" || $clks_grp == "rx_user_clk_reg" || $clks_grp == "pld_pma_hclk_reg" || $clks_grp == "tx_clkout" || $clks_grp == "rx_clkout" || $clks_grp == "tx_clkout2" || $clks_grp == "rx_clkout2"} {
            # fix to ch7
            set chnl 7
            set multiply_by [dict get $active_chnl_multiply_by_factors $clks_grp]
            set divide_by [dict get $active_chnl_divide_by_factors $clks_grp]
            set clk_name $top_fab_inst_name|$clks_grp|ch$chnl
        
            set master_clock [lsearch -inline $master_clocks $top_fab_inst_name*$chnl*]
            set source_node  [lsearch -inline $source_nodes $top_tile_inst_name*$chnl*]
        
            ## create_generated_clock  
            create_generated_clock \
                        -name $clk_name \
                        -source $source_node \
                        -master_clock $master_clock \
                        -multiply_by $multiply_by \
                        -divide_by $divide_by \
                        -duty_cycle 50 \
                        -add    $clk
            if {$ip_sdc_debug == 1} {
                    post_message -type info "IP SDC (PTP): Creating generated clock: $clk_name"
                    post_message -type info "IP SDC (PTP): Creating generated clock: at node $clk"
                    post_message -type info "IP SDC (PTP): Creating generated clock: source node is $source_node"
                    post_message -type info "IP SDC (PTP): Creating generated clock: master clock is $master_clock"
                    post_message -type info "IP SDC (PTP): Creating generated clock: multiply_by factor is $multiply_by"
                    post_message -type info "IP SDC (PTP): Creating generated clock: divide_by factor is $divide_by"
            }         
        }; ## end of if-elseif condition
    }; ## end of foreach clk
}; ## end of proc {native_prepare_to_create_clocks_all_ch}


# D) iterate through each clock group, set master clock and source node. Then call create_clock proc
foreach {clks_grp clks} $active_chnl_clks {
  ## call global variable 
  global ::ip_sdc_debug

    foreach clk $clks {
        ## fix to ch7
        set chnl 7
        # use top_fab as clk_name
        set clk_name $top_fab_inst_name|$clks_grp|ch$chnl
        dict lappend active_chnl_clks_names $clks_grp $clk_name
        set master_clocks ""
        set source_nodes ""
    }; ## end of foreach clk 
     
       
    if {$clks_grp == "tx_pld_pcs_clk_reg"} {
            set master_clocks [dict get $active_chnl_clks_names tx_pld_pcs_clk_ref]
            set source_nodes  [dict get $active_chnl_clks tx_pld_pcs_clk_ref]
           } elseif {$clks_grp == "rx_pld_pcs_clk_reg"} {
            set master_clocks [dict get $active_chnl_clks_names rx_pld_pcs_clk_ref]
            set source_nodes  [dict get $active_chnl_clks rx_pld_pcs_clk_ref]
           } elseif {$clks_grp == "tx_pma_aib_clk_reg"} {
            set master_clocks [dict get $active_chnl_clks_names tx_pma_aib_clk_ref]
            set source_nodes  [dict get $active_chnl_clks tx_pma_aib_clk_ref]
           } elseif {$clks_grp == "rx_transfer_clk_reg"} {
            set master_clocks [dict get $active_chnl_clks_names rx_transfer_clk_ref]
            set source_nodes  [dict get $active_chnl_clks rx_transfer_clk_ref]
           }  elseif {$clks_grp == "tx_user_clk_reg"} {
            set master_clocks [dict get $active_chnl_clks_names tx_user_clk_ref]
            set source_nodes  [dict get $active_chnl_clks tx_user_clk_ref]
           } elseif {$clks_grp == "rx_user_clk_reg"} {
            set master_clocks [dict get $active_chnl_clks_names rx_user_clk_ref]
            set source_nodes  [dict get $active_chnl_clks rx_user_clk_ref]
           } elseif {$clks_grp == "pld_pma_hclk_reg"} {
            set master_clocks [dict get $active_chnl_clks_names pld_pma_hclk_ref]
            set source_nodes  [dict get $active_chnl_clks pld_pma_hclk_ref]
           } elseif {$clks_grp == "tx_clkout"} {
            set master_clocks [dict get $active_chnl_clks_names tx_pld_pcs_clk_reg]
            set source_nodes  [dict get $active_chnl_clks tx_pld_pcs_clk_reg]
           } elseif {$clks_grp == "rx_clkout"} {
            set master_clocks [dict get $active_chnl_clks_names rx_pld_pcs_clk_reg]
            set source_nodes  [dict get $active_chnl_clks rx_pld_pcs_clk_reg]
           } elseif {$clks_grp == "tx_clkout2"} {
            set master_clocks [dict get $active_chnl_clks_names tx_user_clk_reg]
            set source_nodes  [dict get $active_chnl_clks tx_user_clk_reg]
           } elseif {$clks_grp == "rx_clkout2"} {
            set master_clocks [dict get $active_chnl_clks_names rx_user_clk_reg]
            set source_nodes  [dict get $active_chnl_clks rx_user_clk_reg]
           }


      ## call proc to create clocks 
      native_prepare_to_create_clocks_all_ch $clks_grp $clks $active_chnl_clks_freq $active_chnl_multiply_by_factors $active_chnl_divide_by_factors $top_fab_inst_name $top_tile_inst_name $master_clocks $source_nodes
}; ## end of dict for
  
#-------------------------------------------------- #
#---                                            --- #
#--- DISABLE MIN_PULSE_WIDTH CHECK              --- #
#---                                            --- #
#-------------------------------------------------- #
## Disable min_pulse_width for TX source clocks
set tx_source_clks_list [list]
if {[dict exists $active_chnl_clks_names tx_pld_pcs_clk_ref]} {
  set tx_source_clks_list [dict get $active_chnl_clks_names tx_pld_pcs_clk_ref]
}
if {[dict exists $active_chnl_clks_names tx_pma_aib_clk_ref]} {
  set tx_source_clks_list [concat $tx_source_clks_list  [dict get $active_chnl_clks_names tx_pma_aib_clk_ref]]
}
foreach tx_src_clk $tx_source_clks_list {
  disable_min_pulse_width $tx_src_clk
}

############################################################################################################
###########################  Hard IP Timing Violations temporary fix ################################################
############################################################################################################
set aib_fabric_pld_pma_hclk_reg_col [get_registers -nowarn *hdpldadapt_rx_chnl_*~aib_fabric_pld_pma_hclk.reg]
set aib_fabric_pma_aib_tx_clk_reg_col [get_registers -nowarn *hdpldadapt_tx_chnl_*~aib_fabric_pma_aib_tx_clk.reg]

if {[get_collection_size $aib_fabric_pld_pma_hclk_reg_col] > 0 && [get_collection_size $aib_fabric_pma_aib_tx_clk_reg_col] > 0} {
    set_false_path -from $aib_fabric_pld_pma_hclk_reg_col -to $aib_fabric_pma_aib_tx_clk_reg_col
  }

set tx_pma_aib_clk_reg_col_minpulse [add_to_collection $tx_pma_aib_clk_reg_col_minpulse [get_registers -nowarn *hdpldadapt_tx_chnl*~aib_fabric_pma_aib_tx_clk.reg]]
 if {[get_collection_size $tx_pma_aib_clk_reg_col_minpulse] > 0} {
         disable_min_pulse_width $tx_pma_aib_clk_reg_col_minpulse
 }

# per F-tile: AIB7 clock END
# ----------------------------------------------------------------------------- #

# ----------------------------------------------------------------------------- #
# --- PTP Synchronizer / Clock Crosser constraint                           --- #
# ----------------------------------------------------------------------------- #

proc eth_f_constraint_net_delay {from_reg to_reg max_net_delay {check_exist 0} {get_pins 1}} {
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

# soft_ptp_csr: synchronizer
eth_f_constraint_net_delay  * \
                            *|g_ptp.soft_ptp_csr|*|resync_chains[0].synchronizer_nocut|din_s1 \
                            2.2ns 1 0
# soft_ptp_csr: clock crosser - synchronizer, data_buffer
eth_f_constraint_net_delay  * \
                            *|g_ptp.soft_ptp_csr|*|valid_sync|din_s1 \
                            2.2ns 1 0
eth_f_constraint_net_delay  * \
                            *|g_ptp.soft_ptp_csr|*|out_data[*] \
                            2.2ns 1 0
eth_f_constraint_net_delay  * \
                            *|g_ptp.soft_ptp_csr|*|out_data_buffer[*] \
                            2.2ns 1 0
# soft_ptp_csr: direct readdata
eth_f_constraint_net_delay  *|PTP_SOFT_GEN.soft_ptp|*|wdly_m_const*	\
                            *|g_ptp.soft_ptp_csr|ptp_reg|readdata[*] \
                            2.2ns 1 0
# apulse offset logic
eth_f_constraint_net_delay  *|PTP_SOFT_GEN.soft_ptp|*|dt* \
                            *|g_ptp.soft_ptp_csr|ptp_reg|readdata[*] \
                            2.2ns 1 0
# --------------------------------------------------------------------
# soft_ptp: clock crosser - synchronizer, data_buffer
eth_f_constraint_net_delay  * \
                            *|PTP_SOFT_GEN.soft_ptp|*|in_to_out_synchronizer|din_s1 \
                            2.2ns 1 0
eth_f_constraint_net_delay  * \
                            *|PTP_SOFT_GEN.soft_ptp|*|out_to_in_synchronizer|din_s1 \
                            2.2ns 1 0
eth_f_constraint_net_delay  *|PTP_SOFT_GEN.soft_ptp|*|in_data_buffer[*] \
                            *|PTP_SOFT_GEN.soft_ptp|*|out_data_buffer[*] \
                            2.2ns 1 0
# ----------------------------------------------------------------------------- #
# --- PTP DL signal constraint                                              --- #
# ----------------------------------------------------------------------------- #
proc eth_f_constraint_dl_delay {from_reg to_reg max_net_delay {check_exist 0} {get_pins 1}} {
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
            if {$get_pins == 0} {
                set_max_delay -from [get_registers ${from_reg}] -to [get_registers ${to_reg}]  200ns
                set_min_delay -from [get_registers ${from_reg}] -to [get_registers ${to_reg}] -200ns
            } else {
                set_max_delay -from [get_pins -compatibility_mode ${from_reg}] -to [get_registers ${to_reg}]  200ns
                set_min_delay -from [get_pins -compatibility_mode ${from_reg}] -to [get_registers ${to_reg}] -200ns
            }
        } else {
            if {$get_pins == 0} {
                # require fitter best effort
                set_net_delay -from [get_registers ${from_reg}] -to [get_registers ${to_reg}] -max $max_net_delay
                set_max_delay -from [get_registers ${from_reg}] -to [get_registers ${to_reg}]  200ns
                set_min_delay -from [get_registers ${from_reg}] -to [get_registers ${to_reg}] -200ns
            } else {
                # require fitter best effort
                set_net_delay -from [get_pins -compatibility_mode ${from_reg}] -to [get_registers ${to_reg}] -max $max_net_delay
                set_max_delay -from [get_pins -compatibility_mode ${from_reg}] -to [get_registers ${to_reg}]  200ns
                set_min_delay -from [get_pins -compatibility_mode ${from_reg}] -to [get_registers ${to_reg}] -200ns
            }
        }
    }
}

if { ![string equal "quartus_sta" $::TimeQuestInfo(nameofexecutable)] } {
# X: sclk to tx_sclk
eth_f_constraint_dl_delay   *|sip_inst|PTP_SOFT_GEN.soft_ptp|ptp_ref_ts_capture_u|async_pulse_gen|sclk \
                            *|hdpldadapt_tx_chnl_*~rx_clock_pld_sclk.reg \
                            0.5ns 1	0
# Y: sclk to tx_sclk_samp
eth_f_constraint_dl_delay   *|sip_inst|PTP_SOFT_GEN.soft_ptp|ptp_ref_ts_capture_u|async_pulse_gen|sclk \
                            *|sip_inst|PTP_SOFT_GEN.soft_ptp|ptp_ref_ts_capture_u|gen_async_dly_meas_lane[*].tx_async_dly_meas_u|sclk_samp_sync_inst|din_s1 \
                            0.5ns 1 0
}
# Z: equal B
# A: tx_sclk_return (async) to tx_sclk_return (tod_clk)
eth_f_constraint_dl_delay   *|hdpldadapt_rx_chnl_*|pld_pma_internal_clk1_hioint \
                            *|sip_inst|PTP_SOFT_GEN.soft_ptp|ptp_ref_ts_capture_u|gen_rollover_lane[*].tx_rollover_cnt|sclk_return_sync_inst|din_s1 \
                            0.5ns 1 1
# B: tx_sclk_return (async) to tx_sclk_return (samp_clk)
eth_f_constraint_dl_delay   *|hdpldadapt_rx_chnl_*|pld_pma_internal_clk1_hioint \
                            *|sip_inst|PTP_SOFT_GEN.soft_ptp|ptp_ref_ts_capture_u|gen_async_dly_meas_lane[*].tx_async_dly_meas_u|sclk_return_samp_sync_inst|din_s1 \
                            0.5ns 1 1
# C: tx_sclk_return (tod_clk) to tx_sclk_return (samp_clk)
eth_f_constraint_dl_delay   *|sip_inst|PTP_SOFT_GEN.soft_ptp|ptp_ref_ts_capture_u|gen_rollover_lane[*].tx_rollover_cnt|gen_sclk_return_roll_tod.sclk_return_roll_reg \
                            *|sip_inst|PTP_SOFT_GEN.soft_ptp|ptp_ref_ts_capture_u|gen_async_dly_meas_lane[*].tx_async_dly_meas_u|sclk_return_tod_samp_sync_inst|din_s1 \
                            0.5ns 1 0
if { ![string equal "quartus_sta" $::TimeQuestInfo(nameofexecutable)] } {
# X: sclk to rx_sclk
eth_f_constraint_dl_delay   *|sip_inst|PTP_SOFT_GEN.soft_ptp|ptp_ref_ts_capture_u|async_pulse_gen|sclk \
                            *|hdpldadapt_rx_chnl_*~pld_sclk1_rowclk.reg \
                            0.5ns 1 0
# Y: sclk to rx_sclk_samp
eth_f_constraint_dl_delay   *|sip_inst|PTP_SOFT_GEN.soft_ptp|ptp_ref_ts_capture_u|async_pulse_gen|sclk \
                            *|sip_inst|PTP_SOFT_GEN.soft_ptp|ptp_ref_ts_capture_u|gen_async_dly_meas_lane[*].rx_async_dly_meas_u|sclk_samp_sync_inst|din_s1 \
                            0.5ns 1 0
}
# Z: equal B
# A: rx_sclk_return (async) to rx_sclk_return (tod_clk)
eth_f_constraint_dl_delay   *|hdpldadapt_rx_chnl_*|pld_pma_internal_clk2_hioint \
                            *|sip_inst|PTP_SOFT_GEN.soft_ptp|ptp_ref_ts_capture_u|gen_rollover_lane[*].rx_rollover_cnt|sclk_return_sync_inst|din_s1 \
                            0.5ns 1 1
# B: rx_sclk_return (async) to rx_sclk_return (samp_clk)
eth_f_constraint_dl_delay   *|hdpldadapt_rx_chnl_*|pld_pma_internal_clk2_hioint \
                            *|sip_inst|PTP_SOFT_GEN.soft_ptp|ptp_ref_ts_capture_u|gen_async_dly_meas_lane[*].rx_async_dly_meas_u|sclk_return_samp_sync_inst|din_s1 \
                            0.5ns 1 1
# C: rx_sclk_return (tod_clk) to rx_sclk_return (samp_clk)
eth_f_constraint_dl_delay   *|sip_inst|PTP_SOFT_GEN.soft_ptp|ptp_ref_ts_capture_u|gen_rollover_lane[*].rx_rollover_cnt|gen_sclk_return_roll_tod.sclk_return_roll_reg \
                            *|sip_inst|PTP_SOFT_GEN.soft_ptp|ptp_ref_ts_capture_u|gen_async_dly_meas_lane[*].rx_async_dly_meas_u|sclk_return_tod_samp_sync_inst|din_s1 \
                            0.5ns 1 0

# ----------------------------------------------------------------------------- #
# --- False Path                                                            --- #
# ----------------------------------------------------------------------------- #
set_false_path -from [get_pins -nowarn -compatibility_mode {*|hdpldadapt_tx_chnl_*|pld_pcs_tx_clk_out1_dcm *|hdpldadapt_tx_chnl_*|pld_fpll_shared_direct_async_out_hioint[*]}] -to [get_keepers -no_duplicates {*|sip_inst|PTP_SOFT_GEN.soft_ptp|ptp_ref_ts_capture_u|gen_rollover_lane[*].tx_rollover_cnt|sclk_return_sync_inst|din_s1}]
set_false_path -from [get_pins -nowarn -compatibility_mode {*|hdpldadapt_tx_chnl_*|pld_pcs_tx_clk_out1_dcm *|hdpldadapt_tx_chnl_*|pld_fpll_shared_direct_async_out_hioint[*]}] -to [get_keepers -no_duplicates {*|sip_inst|PTP_SOFT_GEN.soft_ptp|ptp_ref_ts_capture_u|gen_rollover_lane[*].rx_rollover_cnt|sclk_return_sync_inst|din_s1}]
set_false_path -from [get_pins -nowarn -compatibility_mode {*|hdpldadapt_tx_chnl_*|pld_pcs_tx_clk_out1_dcm *|hdpldadapt_tx_chnl_*|pld_fpll_shared_direct_async_out_hioint[*]}] -to [get_keepers -no_duplicates {*|sip_inst|PTP_SOFT_GEN.soft_ptp|ptp_ref_ts_capture_u|gen_async_dly_meas_lane[*].tx_async_dly_meas_u|sclk_return_samp_sync_inst|din_s1}]
set_false_path -from [get_pins -nowarn -compatibility_mode {*|hdpldadapt_tx_chnl_*|pld_pcs_tx_clk_out1_dcm *|hdpldadapt_tx_chnl_*|pld_fpll_shared_direct_async_out_hioint[*]}] -to [get_keepers -no_duplicates {*|sip_inst|PTP_SOFT_GEN.soft_ptp|ptp_ref_ts_capture_u|gen_async_dly_meas_lane[*].rx_async_dly_meas_u|sclk_return_samp_sync_inst|din_s1}]
set_false_path -from [get_pins -nowarn -compatibility_mode {*|hdpldadapt_tx_chnl_*|pld_pcs_tx_clk_out1_dcm *|hdpldadapt_tx_chnl_*|pld_fpll_shared_direct_async_out_hioint[*]}] -to [get_keepers -no_duplicates {*|sip_inst|PTP_SOFT_GEN.soft_ptp|ptp_ref_ts_capture_u|async_pulse_gen|rx_sclk_ret_sclk_inst|resync_chains[*].synchronizer_nocut|din_s1}]
set_false_path -from [get_keepers -no_duplicates {*|sip_inst|PTP_SOFT_GEN.soft_ptp|ptp_ref_ts_capture_u|async_pulse_gen|sclk}] -to [get_keepers -no_duplicates {*|sip_inst|PTP_SOFT_GEN.soft_ptp|ptp_ref_ts_capture_u|gen_rollover_lane[*].tx_rollover_cnt|sclk_return_sync_inst|din_s1}]
set_false_path -from [get_keepers -no_duplicates {*|sip_inst|PTP_SOFT_GEN.soft_ptp|ptp_ref_ts_capture_u|async_pulse_gen|sclk}] -to [get_keepers -no_duplicates {*|sip_inst|PTP_SOFT_GEN.soft_ptp|ptp_ref_ts_capture_u|gen_rollover_lane[*].rx_rollover_cnt|sclk_return_sync_inst|din_s1}]
set_false_path -from [get_keepers -no_duplicates {*|sip_inst|PTP_SOFT_GEN.soft_ptp|ptp_ref_ts_capture_u|async_pulse_gen|sclk}] -to [get_keepers -no_duplicates {*|sip_inst|PTP_SOFT_GEN.soft_ptp|ptp_ref_ts_capture_u|gen_async_dly_meas_lane[*].tx_async_dly_meas_u|sclk_return_samp_sync_inst|din_s1}]
set_false_path -from [get_keepers -no_duplicates {*|sip_inst|PTP_SOFT_GEN.soft_ptp|ptp_ref_ts_capture_u|async_pulse_gen|sclk}] -to [get_keepers -no_duplicates {*|sip_inst|PTP_SOFT_GEN.soft_ptp|ptp_ref_ts_capture_u|gen_async_dly_meas_lane[*].rx_async_dly_meas_u|sclk_return_samp_sync_inst|din_s1}]

set_false_path -from [get_keepers -no_duplicates {*~aib_hssi_rx_transfer_clk_ch*.reg}] -to [get_keepers -no_duplicates {*|sip_inst|PTP_SOFT_GEN.soft_ptp|ptp_ref_ts_capture_u|gen_rollover_lane[*].rx_rollover_cnt|sclk_return_sync_inst|din_s1}]
set_false_path -from [get_keepers -no_duplicates {*~aib_hssi_rx_transfer_clk_ch*.reg}] -to [get_keepers -no_duplicates {*|sip_inst|PTP_SOFT_GEN.soft_ptp|ptp_ref_ts_capture_u|gen_async_dly_meas_lane[*].rx_async_dly_meas_u|sclk_return_samp_sync_inst|din_s1}]
set_false_path -from [get_keepers -no_duplicates {*~aib_hssi_pma_aib_tx_clk_ch*.reg}] -to [get_keepers -no_duplicates {*|sip_inst|PTP_SOFT_GEN.soft_ptp|ptp_ref_ts_capture_u|gen_rollover_lane[*].tx_rollover_cnt|sclk_return_sync_inst|din_s1}]
set_false_path -from [get_keepers -no_duplicates {*~aib_hssi_pma_aib_tx_clk_ch*.reg}] -to [get_keepers -no_duplicates {*|sip_inst|PTP_SOFT_GEN.soft_ptp|ptp_ref_ts_capture_u|gen_async_dly_meas_lane[*].tx_async_dly_meas_u|sclk_return_samp_sync_inst|din_s1}]

if { [string equal "quartus_sta" $::TimeQuestInfo(nameofexecutable)] } {
    # create clock then set clock groups to clear quartus warning during qsta
    set clk_name $ip_inst_name|ptp_sclk
    create_clock -name $clk_name -period 10.000 [get_keepers -no_duplicates $ip_inst_name|sip_inst|PTP_SOFT_GEN.soft_ptp|ptp_ref_ts_capture_u|async_pulse_gen|sclk]
    set_clock_groups -exclusive -group $clk_name
        
    set_false_path -from [get_keepers -no_duplicates {*|sip_inst|PTP_SOFT_GEN.soft_ptp|ptp_ref_ts_capture_u|async_pulse_gen|sclk}] -to [get_keepers -no_duplicates {*|sip_inst|PTP_SOFT_GEN.soft_ptp|ptp_ref_ts_capture_u|gen_async_dly_meas_lane[*].rx_async_dly_meas_u|sclk_samp_sync_inst|din_s1}]
    set_false_path -from [get_keepers -no_duplicates {*|sip_inst|PTP_SOFT_GEN.soft_ptp|ptp_ref_ts_capture_u|async_pulse_gen|sclk}] -to [get_keepers -no_duplicates {*|sip_inst|PTP_SOFT_GEN.soft_ptp|ptp_ref_ts_capture_u|gen_async_dly_meas_lane[*].tx_async_dly_meas_u|sclk_samp_sync_inst|din_s1}]
}
