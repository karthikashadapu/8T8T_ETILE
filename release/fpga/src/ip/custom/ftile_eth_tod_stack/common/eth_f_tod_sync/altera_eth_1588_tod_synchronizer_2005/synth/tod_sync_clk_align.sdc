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


set old_mode [set_project_mode -get_mode_value always_show_entity_name] 
set_project_mode -always_show_entity_name on

# tod toggle and bus
set toggle_transfer_collection [get_registers -nowarn *tod_sync_clk_align*toggle_transfer*]
set toggle_transfer_counter 0
foreach_in_collection toggle_transfer_reg $toggle_transfer_collection {
    set toggle_transfer_counter [expr $toggle_transfer_counter + 1]
}
if {$toggle_transfer_counter > 0} {
    if { [string equal "quartus_sta" $::TimeQuestInfo(nameofexecutable)] } {
  set_max_delay -from [get_registers *tod_sync_clk_align*toggle_transfer*] -to [get_registers *tod_sync_clk_align*toggle_receive0*] 100ns
  set_min_delay -from [get_registers *tod_sync_clk_align*toggle_transfer*] -to [get_registers *tod_sync_clk_align*toggle_receive0*] -100ns
  
  set_max_delay -from [get_registers *tod_sync_clk_align*transfer_bus*] -to [get_registers *tod_sync_clk_align*reception_bus0*] 100ns
  set_min_delay -from [get_registers *tod_sync_clk_align*transfer_bus*] -to [get_registers *tod_sync_clk_align*reception_bus0*] -100ns
    } else {
  set_max_delay -from [get_registers *tod_sync_clk_align*toggle_transfer*] -to [get_registers *tod_sync_clk_align*toggle_receive0*] 100ns
  set_min_delay -from [get_registers *tod_sync_clk_align*toggle_transfer*] -to [get_registers *tod_sync_clk_align*toggle_receive0*] -100ns
  set_net_delay -from [get_registers *tod_sync_clk_align*toggle_transfer*] -to [get_registers *tod_sync_clk_align*toggle_receive0*] -max 0.6ns
  
  set_max_delay -from [get_registers *tod_sync_clk_align*transfer_bus*] -to [get_registers *tod_sync_clk_align*reception_bus0*] 100ns
  set_min_delay -from [get_registers *tod_sync_clk_align*transfer_bus*] -to [get_registers *tod_sync_clk_align*reception_bus0*] -100ns
  set_net_delay -from [get_registers *tod_sync_clk_align*transfer_bus*] -to [get_registers *tod_sync_clk_align*reception_bus0*] -max 2.6ns
    }
}

# start_tod_synch
set tod_master_valid_0_d_collection [get_registers -nowarn *tod_sync_clk_align*tod_master_valid_synchronizer*din_s1*]
set tod_master_valid_0_d_counter 0
foreach_in_collection tod_master_valid_0_d_pin $tod_master_valid_0_d_collection {
    set tod_master_valid_0_d_counter [expr $tod_master_valid_0_d_counter + 1]
}
if {$tod_master_valid_0_d_counter > 0} {set_false_path -to [get_registers -nowarn *tod_sync_clk_align*tod_master_valid_synchronizer*din_s1*]}


# ppm counter
set reset_master_collection [get_pins -compatibility_mode -nowarn *tod_sync_clk_align*reset_master_synchronizer*din_s1*|d]
set init_done_collection    [get_pins -compatibility_mode -nowarn *tod_sync_clk_align*init_done_master_synchronizer*din_s1*|d]
set start_count_collection  [get_pins -compatibility_mode -nowarn *tod_sync_clk_align*start_count_synchronizer*din_s1*|d]
set stop_count_collection   [get_pins -compatibility_mode -nowarn *tod_sync_clk_align*stop_count_synchronizer*din_s1*|d]
set init_count_collection   [get_pins -compatibility_mode -nowarn *tod_sync_clk_align*init_count_synchronizer*din_s1*|d]

set reset_master_counter 0
set init_done_counter 0
set start_count_counter 0
set stop_count_counter 0
set init_count_counter 0

foreach_in_collection reset_master_pin $reset_master_collection {
    set reset_master_counter [expr $reset_master_counter + 1]
}
foreach_in_collection init_done_pin $init_done_collection {
    set init_done_counter [expr $init_done_counter + 1]
}
foreach_in_collection start_count_pin $start_count_collection {
    set start_count_counter [expr $start_count_counter + 1]
}
foreach_in_collection stop_count_pin $stop_count_collection {
    set stop_count_counter [expr $stop_count_counter + 1]
}
foreach_in_collection init_count_pin $init_count_collection {
    set init_count_counter [expr $init_count_counter + 1]
}
if {$reset_master_counter > 0}  {set_false_path -to [get_pins -compatibility_mode -nowarn *tod_sync_clk_align*reset_master_synchronizer*din_s1*|d]}
if {$init_done_counter > 0}     {set_false_path -to [get_pins -compatibility_mode -nowarn *tod_sync_clk_align*init_done_master_synchronizer*din_s1*|d]}
if {$start_count_counter > 0}   {set_false_path -to [get_pins -compatibility_mode -nowarn *tod_sync_clk_align*start_count_synchronizer*din_s1*|d]}
if {$stop_count_counter > 0}    {set_false_path -to [get_pins -compatibility_mode -nowarn *tod_sync_clk_align*stop_count_synchronizer*din_s1*|d]}
if {$init_count_counter > 0}    {set_false_path -to [get_pins -compatibility_mode -nowarn *tod_sync_clk_align*init_count_synchronizer*din_s1*|d]}


# ppm_counter_clock_crosser
set cc_in_toggle_collection  [get_pins -compatibility_mode -nowarn *tod_sync_clk_align*ppm_counter_clock_crosser*in_to_out_synchronizer*din_s1*|d]
set cc_out_toggle_collection [get_pins -compatibility_mode -nowarn *tod_sync_clk_align*ppm_counter_clock_crosser*out_to_in_synchronizer*din_s1*|d]

set cc_in_toggle_counter 0
set cc_out_toggle_counter 0

foreach_in_collection cc_in_toggle_pin $cc_in_toggle_collection {
    set cc_in_toggle_counter [expr $cc_in_toggle_counter + 1]
}
foreach_in_collection cc_out_toggle_pin $cc_out_toggle_collection {
    set cc_out_toggle_counter [expr $cc_out_toggle_counter + 1]
}

if {$cc_in_toggle_counter > 0}  {set_false_path -to [get_pins -compatibility_mode -nowarn *tod_sync_clk_align*ppm_counter_clock_crosser*in_to_out_synchronizer*din_s1*|d]}
if {$cc_out_toggle_counter > 0} {set_false_path -to [get_pins -compatibility_mode -nowarn *tod_sync_clk_align*ppm_counter_clock_crosser*out_to_in_synchronizer*din_s1*|d]}

set ppm_counter_collection [get_registers -nowarn *tod_sync_clk_align*ppm_counter_clock_crosser*|in_data_buffer*]
set ppm_counter_counter 0
foreach_in_collection ppm_counter_reg $ppm_counter_collection {
    set ppm_counter_counter [expr $ppm_counter_counter + 1]
}
if {$ppm_counter_counter > 0} {
set_max_delay -from [get_registers *tod_sync_clk_align*ppm_counter_clock_crosser*|in_data_buffer*] -to [get_registers *tod_sync_clk_align*ppm_counter_clock_crosser*|out_data_buffer*] 200ns
set_min_delay -from [get_registers *tod_sync_clk_align*ppm_counter_clock_crosser*|in_data_buffer*] -to [get_registers *tod_sync_clk_align*ppm_counter_clock_crosser*|out_data_buffer*] -200ns
set_net_delay -from [get_registers *tod_sync_clk_align*ppm_counter_clock_crosser*|in_data_buffer*] -to [get_registers *tod_sync_clk_align*ppm_counter_clock_crosser*|out_data_buffer*] -max 5ns

set_false_path -from [get_registers *tod_sync*ppm_cnt*init_done_master*] -to [get_registers *altera_eth_1588_tod_synchronizer*ppm_cnt*init_done_master_synchronizer*din_s1*]
set_false_path -from [get_registers *tod_sync*ppm_cnt*in_data_toggle*] -to [get_registers *altera_eth_1588_tod_synchronizer*ppm_cnt*ppm_counter_clock_crosser*in_to_out_synchronizer*din_s1*]
set_false_path -from [get_registers *tod_sync*ppm_cnt*start_count*] -to [get_registers *altera_eth_1588_tod_synchronizer*ppm_cnt*start_count_synchronizer*din_s1*]
set_false_path -from [get_registers *tod_sync*ppm_cnt*stop_count*] -to [get_registers *altera_eth_1588_tod_synchronizer*ppm_cnt*stop_count_synchronizer*din_s1*]
set_false_path -from [get_registers *tod_sync*ppm_cnt*ppm_counter_clock_crosser*out_data_toggle_flopped*] -to [get_registers *altera_eth_1588_tod_synchronizer*ppm_cnt*ppm_counter_clock_crosser*out_to_in_synchronizer*din_s1*]
}

set_project_mode -always_show_entity_name $old_mode
