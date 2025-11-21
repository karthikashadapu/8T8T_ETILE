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


# The timing constraints file
# quartus_pro - preserve same hierarchy name as quartus standard
set old_mode [set_project_mode -get_mode_value always_show_entity_name] 
set_project_mode -always_show_entity_name on

#**************************************************************
# Set Multicycle Path
#**************************************************************

#set_multicycle_path -setup -end -from [get_keepers -no_duplicates {*tod_ns_val_for_pshift*}] -to [get_keepers -no_duplicates {*fifo_wr_data[0]*}] 3
#set_multicycle_path -hold -end -from [get_keepers -no_duplicates {*tod_ns_val_for_pshift*}] -to [get_keepers -no_duplicates {*fifo_wr_data[0]*}] 2

set_multicycle_path -setup -end -from [get_keepers -no_duplicates {*tod_ns_val_for_pshift*}] -to [get_keepers -no_duplicates {*pshift_ps_val*}] 3
set_multicycle_path -hold -end -from [get_keepers -no_duplicates {*tod_ns_val_for_pshift*}] -to [get_keepers -no_duplicates {*pshift_ps_val*}] 2

set_multicycle_path -setup -end -from [get_keepers -no_duplicates {*tod_fns_val_for_pshift*}] -to [get_keepers -no_duplicates {*pshift_ps_val*}] 3
set_multicycle_path -hold -end -from [get_keepers -no_duplicates {*tod_fns_val_for_pshift*}] -to [get_keepers -no_duplicates {*pshift_ps_val*}] 2

set_multicycle_path -setup -end -from [get_keepers -no_duplicates {*pshift_ps_val*}] -to [get_keepers -no_duplicates {*pll_phase_shift_ps_val*}] 3
set_multicycle_path -hold -end -from [get_keepers -no_duplicates {*pshift_ps_val*}] -to [get_keepers -no_duplicates {*pll_phase_shift_ps_val*}] 2
#**************************************************************
# constraint tod_fifo pointers delay and max_skew
#**************************************************************
# Function to constraint pointers's net delay and max skew
proc tod_pps_constraint_ptr {from_path from_reg to_path to_reg max_skew max_net_delay} {
   
   set_net_delay -from [get_registers *${from_path}*${from_reg}*] -to [get_registers *${to_path}*${to_reg}*] -max $max_net_delay
   
   if { [string equal "quartus_sta" $::TimeQuestInfo(nameofexecutable)] } {
      # Check for instances
      set inst [get_registers -nowarn *${from_path}*${from_reg}*]

      # Constraint one instance at a time to avoid set_max_skew apply to all instances
      foreach_in_collection each_inst_tmp $inst {
         set each_inst [get_node_info -name $each_inst_tmp] 
         # Get the path to instance
         regexp "(.*${from_path})(.*)(${from_reg})" $each_inst reg_path inst_path inst_name reg_name
         set_max_skew -from [get_registers ${inst_path}${inst_name}${from_reg}[*]] -to [get_registers *${to_path}*${to_reg}*] $max_skew
         
         set_max_delay -from [get_registers ${inst_path}${inst_name}${from_reg}[*]] -to [get_registers *${to_path}*${to_reg}*] 200ns
         set_min_delay -from [get_registers ${inst_path}${inst_name}${from_reg}[*]] -to [get_registers *${to_path}*${to_reg}*] -200ns
      }
      
   } else {
      # Relax the fitter effort
      set_max_delay -from [get_registers *${from_path}*${from_reg}*] -to [get_registers *${to_path}*${to_reg}*] 200ns
      set_min_delay -from [get_registers *${from_path}*${from_reg}*] -to [get_registers *${to_path}*${to_reg}*] -200ns
   }
}
tod_pps_constraint_ptr  altera_eth_1588_tod_gray_cnt:U_RD  g_out  g_ptr_rd_to_wr_synchronizer  din_s1  4ns  4ns
tod_pps_constraint_ptr  altera_eth_1588_tod_gray_cnt:U_WRT  g_out  g_ptr_wr_to_rd_synchronizer  din_s1  4ns  4ns

tod_pps_constraint_ptr  altera_eth_1588_tod_gray_cnt:U_RD  g_out  rdgptr_synchronizer  din_s1  4ns  4ns
tod_pps_constraint_ptr  altera_eth_1588_tod_gray_cnt:U_WRT  g_out  wrgptr_synchronizer  din_s1  4ns  4ns

#}

#**************************************************************
# constraint CDC path
#**************************************************************
# Function to constraint synchronizer's max net delay
proc tod_pps_constraint_net_delay {from_reg to_reg max_net_delay {from_type 0}} {
    # Check for instances
    set inst [get_registers -nowarn ${to_reg}]
    
    # Check number of instances
    set inst_num [llength [query_collection -report -all $inst]]

    if {($inst_num > 0)} {    
        if { [string equal "quartus_sta" $::TimeQuestInfo(nameofexecutable)] } {
            if {$from_type == 0} {
            set_max_delay -from [get_registers ${from_reg}] -to [get_registers ${to_reg}] 200ns
            set_min_delay -from [get_registers ${from_reg}] -to [get_registers ${to_reg}] -200ns
            } elseif {$from_type == 1} {
            set_max_delay -from [get_keepers ${from_reg}] -to [get_registers ${to_reg}] 200ns
            set_min_delay -from [get_keepers ${from_reg}] -to [get_registers ${to_reg}] -200ns
            }
        } else {
            if {$from_type == 0} {
                # constraint max. net delay
                set_net_delay -from [get_registers ${from_reg}] -to [get_registers ${to_reg}] -max $max_net_delay
                # Relax the fitter effort
                set_max_delay -from [get_registers ${from_reg}] -to [get_registers ${to_reg}] 200ns
                set_min_delay -from [get_registers ${from_reg}] -to [get_registers ${to_reg}] -200ns
            } elseif {$from_type == 1} {
                # constraint max. net delay
                set_net_delay -from [get_keepers ${from_reg}] -to [get_registers ${to_reg}] -max $max_net_delay
                # Relax the fitter effort
                set_max_delay -from [get_keepers ${from_reg}] -to [get_registers ${to_reg}] 200ns
                set_min_delay -from [get_keepers ${from_reg}] -to [get_registers ${to_reg}] -200ns
            }
        }
    }
}

# GENERAL applies to *|nocut_sync[*].all tod_std_sync_nocut, any special case?
tod_pps_constraint_net_delay *pulse_per_second_adv* \
                             *pulse_per_second_adv*|nocut_sync[*].std_sync_no_cut|din_s1 \
                             2ns
# routing_adj_val from tod to pps_adv
tod_pps_constraint_net_delay *tod*routing_adj_val[*] \
                             *pulse_per_second_adv*routing_adj_val_synchronizer|nocut_sync[*].std_sync_no_cut|din_s1 \
                             2ns
# from node pll_lock is a cell from PLL. {get_keepers = non-combinational nodes and its duplicate}
tod_pps_constraint_net_delay * \
                             *pulse_per_second_adv*pll_lock_scan_synchronizer|nocut_sync[0].std_sync_no_cut|din_s1 \
                             2ns 1
tod_pps_constraint_net_delay * \
                             *pulse_per_second_adv*pll_lock_r_synchronizer|nocut_sync[0].std_sync_no_cut|din_s1 \
                             2ns 1
# from node phase_done is a cell from PLL. {get_keepers = non-combinational nodes and its duplicate}
# got two from
# master_tod|mtod_pps_pll|eth_f_mtod_pps_pll|tennm_pll~pll_ctrl_reg (pll_refclk) --- intended to constraint
# master_tod|mtod_pps_pll|eth_f_mtod_pps_pll|tennm_pll~pll_dprio_reg (pll_scanclk) -- same clock domain
tod_pps_constraint_net_delay *   \
                             *pulse_per_second_adv*pll_phase_done_scan_synchronizer|nocut_sync[0].std_sync_no_cut|din_s1 \
                             2ns 1
# from node is reset interface. to nodes are din_s1, dreg[0], dreg[1]
tod_pps_constraint_net_delay *   \
                             *pulse_per_second_adv*u_rst_sync_*|nocut_sync[*].std_sync_no_cut|* \
                             2ns 1

set_project_mode -always_show_entity_name $old_mode
