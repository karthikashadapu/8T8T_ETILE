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


#
# hssi_ss_ptp_report_dl_path_delay.tcl
#
# Description: This script calls Quartus Timing Analyzer to report routing adjustment that 
# impact PTP timestamp accuracy and then generate routing adjustment report.
# Please refer to User Guide for complete instructions.
#
package require ::quartus::project
package require ::quartus::report
package require ::quartus::sta
package require csv

set project_name [lindex $::quartus(args) 0]
set output_fname "ptp_hw_adv_adj"
set data_file    "Data.csv"
set delay_file   "Delay.csv"

# Open project on Quartus
project_open $project_name

# Always create the netlist first + set operating conditions
create_timing_netlist
read_sdc
update_timing_netlist

set_operating_conditions [get_available_operating_conditions]

if { 0 } { ;#USE FOR MRIP
# Report PTP DL signal path delay in two seperate reports
# Report path TX
report_path -split_by_corner -npaths 20 -panel_name {TX_X} -from *|sip_inst|PTP_SOFT_GEN.soft_ptp|ptp_ref_ts_capture_wrapper_inst|async_pulse_gen_wrpr_inst|async_gen_per_lane[*].async_pulse_gen|sclk -to *|hdpldadapt_tx_chnl_*~rx_clock_pld_sclk.reg
report_path -split_by_corner -npaths 20 -panel_name {TX_Y} -from *|sip_inst|PTP_SOFT_GEN.soft_ptp|ptp_ref_ts_capture_wrapper_inst|async_pulse_gen_wrpr_inst|async_gen_per_lane[*].async_pulse_gen|sclk -to *|sip_inst|PTP_SOFT_GEN.soft_ptp|ptp_ref_ts_capture_wrapper_inst|ref_ts_per_pl_gen[*].ptp_ref_ts_capture_u|gen_async_dly_meas_lane[*].tx_async_dly_meas_u|sclk_samp_sync_inst|din_s1
report_path -split_by_corner -npaths 20 -panel_name {TX_A} -from *|hdpldadapt_rx_chnl_*|pld_pma_internal_clk1_hioint -to *|sip_inst|PTP_SOFT_GEN.soft_ptp|ptp_ref_ts_capture_wrapper_inst|ref_ts_per_pl_gen[*].ptp_ref_ts_capture_u|gen_rollover_lane[*].tx_rollover_cnt|sclk_return_sync_inst|din_s1
report_path -split_by_corner -npaths 20 -panel_name {TX_B} -from *|hdpldadapt_rx_chnl_*|pld_pma_internal_clk1_hioint -to *|sip_inst|PTP_SOFT_GEN.soft_ptp|ptp_ref_ts_capture_wrapper_inst|ref_ts_per_pl_gen[*].ptp_ref_ts_capture_u|gen_async_dly_meas_lane[*].tx_async_dly_meas_u|sclk_return_samp_sync_inst|din_s1
report_path -split_by_corner -npaths 20 -panel_name {TX_C} -from *|sip_inst|PTP_SOFT_GEN.soft_ptp|ptp_ref_ts_capture_wrapper_inst|ref_ts_per_pl_gen[*].ptp_ref_ts_capture_u|gen_rollover_lane[*].tx_rollover_cnt|gen_sclk_return_roll_tod.sclk_return_roll_reg -to *|sip_inst|PTP_SOFT_GEN.soft_ptp|ptp_ref_ts_capture_wrapper_inst|ref_ts_per_pl_gen[*].ptp_ref_ts_capture_u|gen_async_dly_meas_lane[*].tx_async_dly_meas_u|sclk_return_tod_samp_sync_inst|din_s1
# Report path RX
report_path -split_by_corner -npaths 20 -panel_name {RX_X} -from *|sip_inst|PTP_SOFT_GEN.soft_ptp|ptp_ref_ts_capture_wrapper_inst|async_pulse_gen_wrpr_inst|async_gen_per_lane[*].async_pulse_gen|sclk -to *|hdpldadapt_rx_chnl_*~pld_sclk1_rowclk.reg
report_path -split_by_corner -npaths 20 -panel_name {RX_Y} -from *|sip_inst|PTP_SOFT_GEN.soft_ptp|ptp_ref_ts_capture_wrapper_inst|async_pulse_gen_wrpr_inst|async_gen_per_lane[*].async_pulse_gen|sclk -to *|sip_inst|PTP_SOFT_GEN.soft_ptp|ptp_ref_ts_capture_wrapper_inst|ref_ts_per_pl_gen[*].ptp_ref_ts_capture_u|gen_async_dly_meas_lane[*].rx_async_dly_meas_u|sclk_samp_sync_inst|din_s1
report_path -split_by_corner -npaths 20 -panel_name {RX_A} -from *|hdpldadapt_rx_chnl_*|pld_pma_internal_clk2_hioint -to *|sip_inst|PTP_SOFT_GEN.soft_ptp|ptp_ref_ts_capture_wrapper_inst|ref_ts_per_pl_gen[*].ptp_ref_ts_capture_u|gen_rollover_lane[*].rx_rollover_cnt|sclk_return_sync_inst|din_s1
report_path -split_by_corner -npaths 20 -panel_name {RX_B} -from *|hdpldadapt_rx_chnl_*|pld_pma_internal_clk2_hioint -to *|sip_inst|PTP_SOFT_GEN.soft_ptp|ptp_ref_ts_capture_wrapper_inst|ref_ts_per_pl_gen[*].ptp_ref_ts_capture_u|gen_async_dly_meas_lane[*].rx_async_dly_meas_u|sclk_return_samp_sync_inst|din_s1
report_path -split_by_corner -npaths 20 -panel_name {RX_C} -from *|sip_inst|PTP_SOFT_GEN.soft_ptp|ptp_ref_ts_capture_wrapper_inst|ref_ts_per_pl_gen[*].ptp_ref_ts_capture_u|gen_rollover_lane[*].rx_rollover_cnt|gen_sclk_return_roll_tod.sclk_return_roll_reg -to *|sip_inst|PTP_SOFT_GEN.soft_ptp|ptp_ref_ts_capture_wrapper_inst|ref_ts_per_pl_gen[*].ptp_ref_ts_capture_u|gen_async_dly_meas_lane[*].rx_async_dly_meas_u|sclk_return_tod_samp_sync_inst|din_s1

}

        # Report path TX
            report_path -split_by_corner -npaths 20 -panel_name {TX_X} -from *|sip_inst|PTP_SOFT_GEN.soft_ptp|ptp_ref_ts_capture_u|async_pulse_gen|sclk -to *|hdpldadapt_tx_chnl_*~rx_clock_pld_sclk.reg
            report_path -split_by_corner -npaths 20 -panel_name {TX_Y} -from *|sip_inst|PTP_SOFT_GEN.soft_ptp|ptp_ref_ts_capture_u|async_pulse_gen|sclk -to *|sip_inst|PTP_SOFT_GEN.soft_ptp|ptp_ref_ts_capture_u|gen_async_dly_meas_lane[*].tx_async_dly_meas_u|sclk_samp_sync_inst|din_s1
            report_path -split_by_corner -npaths 20 -panel_name {TX_A} -from *|hdpldadapt_rx_chnl_*|pld_pma_internal_clk1_hioint -to *|sip_inst|PTP_SOFT_GEN.soft_ptp|ptp_ref_ts_capture_u|gen_rollover_lane[*].tx_rollover_cnt|sclk_return_sync_inst|din_s1
            report_path -split_by_corner -npaths 20 -panel_name {TX_B} -from *|hdpldadapt_rx_chnl_*|pld_pma_internal_clk1_hioint -to *|sip_inst|PTP_SOFT_GEN.soft_ptp|ptp_ref_ts_capture_u|gen_async_dly_meas_lane[*].tx_async_dly_meas_u|sclk_return_samp_sync_inst|din_s1
        #if {$ts eq "Advanced"} {
            report_path -split_by_corner -npaths 20 -panel_name {TX_C} -from *|sip_inst|PTP_SOFT_GEN.soft_ptp|ptp_ref_ts_capture_u|gen_rollover_lane[*].tx_rollover_cnt|gen_sclk_return_roll_tod.sclk_return_roll_reg -to *|sip_inst|PTP_SOFT_GEN.soft_ptp|ptp_ref_ts_capture_u|gen_async_dly_meas_lane[*].tx_async_dly_meas_u|sclk_return_tod_samp_sync_inst|din_s1
        #}
        # Report path RX
            report_path -split_by_corner -npaths 20 -panel_name {RX_X} -from *|sip_inst|PTP_SOFT_GEN.soft_ptp|ptp_ref_ts_capture_u|async_pulse_gen|sclk -to *|hdpldadapt_rx_chnl_*~pld_sclk1_rowclk.reg
            report_path -split_by_corner -npaths 20 -panel_name {RX_Y} -from *|sip_inst|PTP_SOFT_GEN.soft_ptp|ptp_ref_ts_capture_u|async_pulse_gen|sclk -to *|sip_inst|PTP_SOFT_GEN.soft_ptp|ptp_ref_ts_capture_u|gen_async_dly_meas_lane[*].rx_async_dly_meas_u|sclk_samp_sync_inst|din_s1
            report_path -split_by_corner -npaths 20 -panel_name {RX_A} -from *|hdpldadapt_rx_chnl_*|pld_pma_internal_clk2_hioint -to *|sip_inst|PTP_SOFT_GEN.soft_ptp|ptp_ref_ts_capture_u|gen_rollover_lane[*].rx_rollover_cnt|sclk_return_sync_inst|din_s1
            report_path -split_by_corner -npaths 20 -panel_name {RX_B} -from *|hdpldadapt_rx_chnl_*|pld_pma_internal_clk2_hioint -to *|sip_inst|PTP_SOFT_GEN.soft_ptp|ptp_ref_ts_capture_u|gen_async_dly_meas_lane[*].rx_async_dly_meas_u|sclk_return_samp_sync_inst|din_s1
        #if {$ts eq "Advanced"} {
            report_path -split_by_corner -npaths 20 -panel_name {RX_C} -from *|sip_inst|PTP_SOFT_GEN.soft_ptp|ptp_ref_ts_capture_u|gen_rollover_lane[*].rx_rollover_cnt|gen_sclk_return_roll_tod.sclk_return_roll_reg -to *|sip_inst|PTP_SOFT_GEN.soft_ptp|ptp_ref_ts_capture_u|gen_async_dly_meas_lane[*].rx_async_dly_meas_u|sclk_return_tod_samp_sync_inst|din_s1
        #}
load_package report
load_report

# Error checking, number of rows should be equal
set n3 [get_number_of_rows -name "Timing Analyzer GUI||TX_X||TX_X Aggregated Report||Summary of Paths"]
set n4 [get_number_of_rows -name "Timing Analyzer GUI||RX_C||RX_C Aggregated Report||Summary of Paths"]
if {$n3 != $n4} {
    post_message -type warning "TX_X:$n3, RX_C:$n4 Number of rows for reported TX/RX paths not equal"
}

# Empty files
close [open $data_file  "w"]
close [open $delay_file "w"]
close [open "$output_fname.csv" "w"]
close [open "$output_fname.tcl" "w"]

#----------------------------------------------------------------------------------------------------------
# Extracting targeted data and store in Data.csv
#----------------------------------------------------------------------------------------------------------
# proc search_chnl use for catching chnl[]
# proc search_lane use for catching lane[]

proc search_chnl {path output_file} {
    set raw [open $output_file a+]
    set tr  [split $path "_"]
    
    # Read data from report in GUI
    foreach_in_collection oc [get_operating_conditions] {
        set oc_name [get_operating_conditions_info $oc -display_name]
        set report  "Timing Analyzer GUI||$path||$path $oc_name||Summary of Paths"
        set num_report_rows [get_number_of_rows -name $report]
        for {set i 1} {$i < $num_report_rows} {incr i} {
            set delay   [get_report_panel_data -name $report -row $i -col 0]
            set to_node [get_report_panel_data -name $report -row $i -col 2]
            regexp {chnl_\d{1,2}} $to_node chnl
            lappend chnls $chnl

            dict set data "${path}_${oc}_${i}__${chnl}" oc     ${oc}
            dict set data "${path}_${oc}_${i}__${chnl}" chnl   ${chnl}
            dict set data "${path}_${oc}_${i}__${chnl}" delay  ${delay}
        }
    }

    set unique_chnls [lsort -unique -dictionary -decreasing $chnls]

    dict for {id info} $data {
        dict with info {
            foreach ch $unique_chnls {
                if {[string first "$ch" $chnl] != -1} {
                    append delays_per_ch($ch) $delay ","
                }
            }
        }
    }

    # Write to Data.csv
        ## Example: [lindex $tr 0],[lindex $tr 1],,chnl_<number>,<delay_oc1>,<delay_oc2>,<delay_oc3>,<delay_oc4>,<delay_oc5>,<delay_oc6>
        ##          TX,X,,chnl_15,1.911,1.920,1.861,1.256,1.397,1.464
    foreach ch $unique_chnls {
        set each_path [string trim [list [lindex $tr 0],[lindex $tr 1],,$ch,$delays_per_ch($ch)] "{ }"]
        puts $raw [string trimright $each_path ","]
    }
    close $raw
}

proc search_lane {path output_file} {
    global chnl_inst
    global ip_number
    global ipnum_inst
    global num_ip_insts
    global unique_ports
    global lanenum_inst
    global num_lanes
    global unique_chnls
    set raw [open $output_file a+]
    set tr  [split $path "_"]
    #Every call of search lane should satrt with empty list & then calculate
    set unique_ports [list ] 
    
    # Read data from report in GUI
    foreach_in_collection oc [get_operating_conditions] {
        set oc_name [get_operating_conditions_info $oc -display_name]
        set report  "Timing Analyzer GUI||$path||$path $oc_name||Summary of Paths"
        set num_report_rows [get_number_of_rows -name $report]
        for {set i 1} {$i < $num_report_rows} {incr i} {
            set delay   [get_report_panel_data -name $report -row $i -col 0]
            set to_node [get_report_panel_data -name $report -row $i -col 2]
            regexp {(.*)\|sip_inst} $to_node   full ip_inst
            #MRIP regexp {gen\[(\d)\]}    $to_node   gen  lane_num
            regexp {lane\[(\d)\]}   $to_node   lane lane_num
            set lane "lane[$lane_num]"
            if {[lindex $tr 1] == "A"} {
                set from_node [get_report_panel_data -name $report -row $i -col 1]
                regexp {chnl_\d{1,2}} $from_node chnl
                lappend chnls $chnl
            }
            lappend insts $ip_inst
            lappend lanes $lane
            ##regexp -all -- {p[0-9]+} $insts pnumber
            ##regexp -all -- {[0-9]+} $pnumber port_number
            set pnumber [regexp -inline -- {U_eth_f_inst_p[0-9]+} $ip_inst]
            set port_number [regexp -inline -- {[0-9]+} $pnumber]
            lappend unique_ports $port_number
            #puts "lappend unique_ports $port_number in LIST $unique_ports"
            

            dict set data "${path}_${oc}_${i}__${ip_inst}_${lane}" oc       ${oc}
            dict set data "${path}_${oc}_${i}__${ip_inst}_${lane}" ip_inst  ${ip_inst}
            dict set data "${path}_${oc}_${i}__${ip_inst}_${lane}" lane     ${lane}
            dict set data "${path}_${oc}_${i}__${ip_inst}_${lane}" delay    ${delay}
            #puts "dict set data ${path}_${oc}_${i}__${ip_inst}_${lane} delay    ${delay}"
            if {[lindex $tr 1] == "A"} {
                dict set data "${path}_${oc}_${i}__${ip_inst}_${lane}" chnl ${chnl}
            }
        }
    }

    set unique_ports [lsort -unique -dictionary $unique_ports]
    set unique_ip_insts [lsort -unique -dictionary $insts]
    set num_ip_insts    [llength $unique_ip_insts]
    set unique_lanes    [lsort -unique -dictionary $lanes]
    set num_lanes       [llength $unique_lanes]
    puts "set unique_ports [lsort -unique -dictionary $unique_ports]"
    puts "set unique_ip_insts [lsort -unique -dictionary $insts]"
    puts "set num_ip_insts    [llength $unique_ip_insts]"
    puts "set unique_lanes    [lsort -unique -dictionary $lanes]"
    puts "set num_lanes       [llength $unique_lanes]"
    if {[lindex $tr 1] == "A"} {
        set unique_chnls [lsort -unique -dictionary -decreasing $chnls]
    }
    
    #set j 0
    foreach ip $unique_ip_insts {
        set k 0
        foreach ln $unique_lanes {
            dict for {id info} $data {
                dict with info {
                    if {[string first $ip $ip_inst] != -1} {
                        if {[string first $ln $lane] != -1} {
                            set inst_temp [regexp -inline -- {U_eth_f_inst_p[0-9]+} $ip]
                            set j [regexp -inline -- {[0-9]+} $inst_temp]
                            append delays_per_ch([expr $j*$num_lanes + $k]) $delay ","
                            puts "J=$j,NUM_LANES=$num_lanes,K=$k,delay=$delay"
                            #puts "append delays_per_ch([expr $j*$num_lanes + $k]) $delay "
                            set ip_path([expr $j*$num_lanes + $k]) $ip
                            puts "set ip_path([expr $j*$num_lanes + $k]) $ip"
                            set inst_lane([expr $j*$num_lanes + $k]) $ln
                            #puts "set inst_lane([expr $j*$num_lanes + $k]) $ln"
                            if {[lindex $tr 1] == "A"} {
                                set chnl_inst($chnl) "${ip}\*${ln}"
                                set ip_number($chnl) "$j"
                                set ipnum_inst($j)   "$ip"
                                #puts "set ipnum_inst($j)   $ip"
                                set lanenum_inst($k) "$ln"
                            }
                            set each_path [string trim [list [lindex $tr 0],[lindex $tr 1],$ip_path([expr $j*$num_lanes + $k]),$inst_lane([expr $j*$num_lanes + $k]),$delays_per_ch([expr $j*$num_lanes + $k])] "{ }"]
                            puts "set each_path [string trim [list [lindex $tr 0],[lindex $tr 1],$ip_path([expr $j*$num_lanes + $k]),$inst_lane([expr $j*$num_lanes + $k]),$delays_per_ch([expr $j*$num_lanes + $k])] { }]"
                            puts $raw [string trimright $each_path ","]
                            puts "[string trimright $each_path ","]"
                        }
                    }
                }
            }
            incr k
        }
        #incr j
    }
    
    # Write to Data.csv
        ## Example: [lindex $tr 0],[lindex $tr 1],loop_dut[i].u0|eth_f_dr_0|U_base_profile|eth_f_0,lane[i],<delay_oc1>,<delay_oc2>,<delay_oc3>,<delay_oc4>,<delay_oc5>,<delay_oc6>
        ##          TX,Y,loop_dut[0].u0|eth_f_dr_0|U_base_profile|eth_f_0,lane[0],0.438,0.438,0.437,0.299,0.317,0.346
    #for {set index 0}  {$index < [array size delays_per_ch]} {incr index} {
    # }
    foreach index $unique_ports {
       ### #puts "Index is $index"
       ### set each_path [string trim [list [lindex $tr 0],[lindex $tr 1],$ip_path($index),$inst_lane($index),$delays_per_ch($index)] "{ }"]
       ### puts "set each_path [string trim [list [lindex $tr 0],[lindex $tr 1],$ip_path($index),$inst_lane($index),$delays_per_ch($index)] { }]"
       ### puts $raw [string trimright $each_path ","]
       ### puts "[string trimright $each_path ","]"
    }
    close $raw
}


#----------------------------------------------------------------------------------------------------------
# Building Max Path Delay Table in Delay.csv
#----------------------------------------------------------------------------------------------------------
# Catching/selecting targeted data from data.csv then built delay.csv
# Catch expression of TX/RX lane[*]

proc sum {args} {
    set result 0
    foreach n $args {
        set result [expr $result + $n]
    }
    return $result
}

proc write_delay_csv {input_file output_file} {
    global avg_tx_adj
    global avg_rx_adj
    global chnl_inst
    global ipnum_inst
    global num_ip_insts
    global unique_ports
    global lanenum_inst
    global num_lanes
    global unique_chnls
    set fwrite [open $output_file w]
    set fread  [open $input_file  r]
    set lines  [split [read $fread] "\n"]
    close $fread

    # Read Data.csv and regroup data according to TX / RX and lanes
        ## Example: lane[0] is grouped to chnl_15
    foreach line $lines {
        if {[string first "TX," $line] != -1} {
            foreach ch $unique_chnls {
                if {[string first "$ch," $line] != -1} {
                    append tx($ch) $line "\n"
                }
                set ip [lindex [split $chnl_inst($ch) "*"] 0]
                set ln [lindex [split $chnl_inst($ch) "*"] 1]
                if {([string first "$ip," $line] != -1) && ([string first "$ln," $line] != -1)} {
                    append tx($ch) $line "\n"
                }
            }
        } elseif {[string first "RX," $line ] != -1} {
            foreach ch $unique_chnls {
                if {[string first "$ch," $line] != -1} {
                    append rx($ch) $line "\n"
                }
                set ip [lindex [split $chnl_inst($ch) "*"] 0]
                set ln [lindex [split $chnl_inst($ch) "*"] 1]
                if {([string first "$ip," $line] != -1) && ([string first "$ln," $line] != -1)} {
                    append rx($ch) $line "\n"
                }
            }
        }
    }

    # Separate paths into X, Y, A ,B ,C arrays
        # Example: $tx($ch)                                                                                 line_num
        # TX,X,                                                ,chnl_15,2.367,2.376,2.291,1.535,1.712,1.804     0
        # TX,Y,loop_dut[0].u0|eth_f_dr_0|U_base_profile|eth_f_0,lane[0],0.438,0.438,0.437,0.299,0.317,0.346     1
        # TX,A,loop_dut[0].u0|eth_f_dr_0|U_base_profile|eth_f_0,lane[0],0.987,0.988,0.979,0.755,0.833,0.853     2
        # TX,B,loop_dut[0].u0|eth_f_dr_0|U_base_profile|eth_f_0,lane[0],0.899,0.900,0.891,0.656,0.718,0.764     3
        # TX,C,loop_dut[0].u0|eth_f_dr_0|U_base_profile|eth_f_0,lane[0],0.411,0.411,0.409,0.279,0.308,0.338     4
    foreach ch $unique_chnls {
        set tex($ch) [split [lindex $tx($ch) 0] ","]
        set tey($ch) [split [lindex $tx($ch) 1] ","]
        set tea($ch) [split [lindex $tx($ch) 2] ","]
        set teb($ch) [split [lindex $tx($ch) 3] ","]
        set tec($ch) [split [lindex $tx($ch) 4] ","]
        
        set rex($ch) [split [lindex $rx($ch) 0] ","]
        set rey($ch) [split [lindex $rx($ch) 1] ","]
        set rea($ch) [split [lindex $rx($ch) 2] ","]
        set reb($ch) [split [lindex $rx($ch) 3] ","]
        set rec($ch) [split [lindex $rx($ch) 4] ","]

        # Calculate TX Routing delay adjustment
        # Simplified formula >> Routing delay adjustment = C - (B+Y-X)/2
        for {set oc_i 4} {$oc_i < [llength $tex($ch)]} {incr oc_i} {
            append tx_adj($ch) [expr [lindex $tec($ch) $oc_i] - ([lindex $teb($ch) $oc_i]+[lindex $tey($ch) $oc_i]-[lindex $tex($ch) $oc_i])/2] " "
        }
        for {set oc_i 4} {$oc_i < [llength $rex($ch)]} {incr oc_i} {
            append rx_adj($ch) [expr [lindex $rec($ch) $oc_i] - ([lindex $reb($ch) $oc_i]+[lindex $rey($ch) $oc_i]-[lindex $rex($ch) $oc_i])/2] " "
        }
    }

    # Write Delay.csv
    # Example:
        ## Max Path Delay Table [0]
        ## TX/RX,Path,Instance,Lane/Chnl,Slow vid2 100C Model,Slow vid2a 100C Model,Slow vid2b 100C Model,Fast vid2a 0C Model,Fast vid2a 100C Model,Fast vid2 100C Model,,Average
        ## TX,X,,chnl_15,2.367,2.376,2.291,1.535,1.712,1.804
        ## TX,Y,loop_dut[0].u0|eth_f_dr_0|U_base_profile|eth_f_0,lane[0],0.438,0.438,0.437,0.299,0.317,0.346
        ## TX,A,loop_dut[0].u0|eth_f_dr_0|U_base_profile|eth_f_0,lane[0],0.987,0.988,0.979,0.755,0.833,0.853
        ## TX,B,loop_dut[0].u0|eth_f_dr_0|U_base_profile|eth_f_0,lane[0],0.899,0.900,0.891,0.656,0.718,0.764
        ## TX,C,loop_dut[0].u0|eth_f_dr_0|U_base_profile|eth_f_0,lane[0],0.411,0.411,0.409,0.279,0.308,0.338
        ##
        ## RX,X,,chnl_15,2.287,2.287,2.201,1.481,1.655,1.748
        ## RX,Y,loop_dut[0].u0|eth_f_dr_0|U_base_profile|eth_f_0,lane[0],0.386,0.386,0.384,0.278,0.292,0.293
        ## RX,A,loop_dut[0].u0|eth_f_dr_0|U_base_profile|eth_f_0,lane[0],0.811,0.811,0.803,0.603,0.665,0.705
        ## RX,B,loop_dut[0].u0|eth_f_dr_0|U_base_profile|eth_f_0,lane[0],1.152,1.152,1.144,0.882,0.985,1.027
        ## RX,C,loop_dut[0].u0|eth_f_dr_0|U_base_profile|eth_f_0,lane[0],0.461,0.461,0.460,0.347,0.373,0.374
        ##
        ## TX,Routing delay adjustment,loop_dut[0].u0|eth_f_dr_0|U_base_profile|eth_f_0,lane[0],0.926,0.93,0.8905,0.569,0.6465,0.685,,0.7745
        ## RX,Routing delay adjustment,loop_dut[0].u0|eth_f_dr_0|U_base_profile|eth_f_0,lane[0],0.8355,0.8355,0.7965,0.5075,0.562,0.588,,0.6875
    
    foreach_in_collection oc [get_operating_conditions] {
        append oc_names [get_operating_conditions_info $oc -display_name] ","
    }
    set header [string trim [list TX/RX,Path,Instance,Lane/Chnl,$oc_names,Average] "{ }"]

    # Example: <TX/RX>,Routing delay adjustment,loop_dut[0].u0|eth_f_dr_0|U_base_profile|eth_f_0,lane[0],<list of TX/RX Routing delay adjustment values>,<average TX/RX Routing delay adjustment value>
    set i 0
    foreach ch $unique_chnls {
        # Average TX/RX Routing delay adjustment
        set avg_tx_adj($ch) [expr [eval sum $tx_adj($ch)] / [llength $tx_adj($ch)]]
        set avg_rx_adj($ch) [expr [eval sum $rx_adj($ch)] / [llength $rx_adj($ch)]]
        
        set tx_line($ch) [string trim [list TX,adjustment,[lindex $tey($ch) 2],[lindex $tey($ch) 3],[regsub -all " " $tx_adj($ch) ","],$avg_tx_adj($ch)] "{ }"]
        set rx_line($ch) [string trim [list RX,adjustment,[lindex $tey($ch) 2],[lindex $tey($ch) 3],[regsub -all " " $rx_adj($ch) ","],$avg_rx_adj($ch)] "{ }"]
        
        puts $fwrite "Max Path Delay Table \[$i\]"
        puts $fwrite $header
        puts $fwrite $tx($ch)
        puts $fwrite $rx($ch)
        puts $fwrite $tx_line($ch)
        puts $fwrite $rx_line($ch)
        puts $fwrite "\n"
        incr i
    }

    # Display calculated Routing delay adjustment value in Quartus
        ## Example:
        ## PTP DL Path Routing Routing delay adjustment Summary:
        ## Average TX Routing delay adjustment for loop_dut[0].u0|eth_f_dr_0|U_base_profile|eth_f_0 lane[0] = 0.7745 ns
        ## Average RX Routing delay adjustment for loop_dut[0].u0|eth_f_dr_0|U_base_profile|eth_f_0 lane[0] = 0.6875 ns
    post_message -type info "PTP DL Path Routing delay adjustment Summary:"
    foreach i $unique_ports {
        for {set j 0} {$j < $num_lanes} {incr j} {
            foreach ch $unique_chnls {
                if {[string first "$ipnum_inst($i)\*$lanenum_inst($j)" $chnl_inst($ch)] != -1} {
                    post_message -type info "Average TX Routing delay adjustment for $ipnum_inst($i) $lanenum_inst($j) = $avg_tx_adj($ch) ns"
                }
            }
        }
        for {set k 0} {$k < $num_lanes} {incr k} {
            foreach ch $unique_chnls {
                if {[string first "$ipnum_inst($i)\*$lanenum_inst($k)" $chnl_inst($ch)] != -1} {
                    post_message -type info "Average RX Routing delay adjustment for $ipnum_inst($i) $lanenum_inst($k) = $avg_rx_adj($ch) ns"                }
            }
        }
    }
    close $fwrite
}

#----------------------------------------------------------------------------------------------------------
# Building Average Routing Delay Adjustment Table in Adjustment.csv
#----------------------------------------------------------------------------------------------------------
# Printing average routing delay adjustment for each lane in CSV format

proc write_adj_csv {filename} {
    global avg_tx_adj
    global avg_rx_adj
    global chnl_inst
    global ip_number
    global ipnum_inst
    global num_ip_insts
    global unique_ports
    global lanenum_inst
    global num_lanes
    global unique_chnls
    set fwrite [open $filename.csv w]

    puts $fwrite "Average Routing Delay Adjustment Table"
    puts $fwrite "Instance Name,Instance,Lane,Average Routing Delay Adjustment (ns)"

    # Example: loop_dut[0].u0|eth_f_dr_0|U_base_profile|eth_f_0,IP0,TX0,0.7745
    #          loop_dut[0].u0|eth_f_dr_0|U_base_profile|eth_f_0,IP0,RX0,0.6875
    foreach i $unique_ports {
        for {set j 0} {$j < $num_lanes} {incr j} {
            foreach ch $unique_chnls {
                if {[string first "$ipnum_inst($i)\*$lanenum_inst($j)" $chnl_inst($ch)] != -1} {
                    regexp {\d{1,2}} $lanenum_inst($j) lane_num
                    set tx_line($ch) "$ipnum_inst($i),IP$ip_number($ch),TX${lane_num},$avg_tx_adj($ch)"
                    puts $fwrite $tx_line($ch)
                }
            }
        }
        for {set k 0} {$k < $num_lanes} {incr k} {
            foreach ch $unique_chnls {
                if {[string first "$ipnum_inst($i)\*$lanenum_inst($k)" $chnl_inst($ch)] != -1} {
                    regexp {\d{1,2}} $lanenum_inst($k) lane_num
                    set rx_line($ch) "$ipnum_inst($i),IP$ip_number($ch),RX${lane_num},$avg_rx_adj($ch)"
                    puts $fwrite $rx_line($ch)
                }
            }
        }
    }
    close $fwrite
}

#----------------------------------------------------------------------------------------------------------
# Building Average Routing Delay Adjustment TCL script for Hardware in hw_adjustment.tcl
#----------------------------------------------------------------------------------------------------------
# Printing average routing delay adjustment for each lane in TCL format

proc write_adj_tcl {filename} {
    global avg_tx_adj
    global avg_rx_adj
    global chnl_inst
    global ip_number
    global ipnum_inst
    global num_ip_insts
    global unique_ports
    global lanenum_inst
    global num_lanes
    global unique_chnls
    set fwrite [open $filename.tcl w]

    puts $fwrite "# Average Routing Delay Adjustment (ns)"

    # Example:  # IP0: loop_dut[0].u0|eth_f_dr_0|U_base_profile|eth_f_0
    #           set IP0_TX0_ROUTING_ADJ 0.7745
    #           set IP0_RX0_ROUTING_ADJ 0.6875
    foreach i $unique_ports {
        puts $fwrite "# IP$i: $ipnum_inst($i)"
        for {set j 0} {$j < $num_lanes} {incr j} {
            foreach ch $unique_chnls {
                if {[string first "$ipnum_inst($i)\*$lanenum_inst($j)" $chnl_inst($ch)] != -1} {
                    regexp {\d{1,2}} $lanenum_inst($j) lane_num
                    set tx_var "IP$ip_number($ch)_TX${lane_num}_ROUTING_ADJ"
                    set tx_line($ch) "set $tx_var $avg_tx_adj($ch)"
                    puts $fwrite $tx_line($ch)
                    
                }
            }
        }
        for {set k 0} {$k < $num_lanes} {incr k} {
            foreach ch $unique_chnls {
                if {[string first "$ipnum_inst($i)\*$lanenum_inst($k)" $chnl_inst($ch)] != -1} {
                    regexp {\d{1,2}} $lanenum_inst($k) lane_num
                    set rx_var "IP$ip_number($ch)_RX${lane_num}_ROUTING_ADJ"
                    set rx_line($ch) "set $rx_var $avg_rx_adj($ch)"
                    puts $fwrite $rx_line($ch)

                }
            }
        }
    }
    close $fwrite
}

# Execute procs
search_chnl TX_X $data_file
search_lane TX_Y $data_file
search_lane TX_A $data_file
search_lane TX_B $data_file
search_lane TX_C $data_file

search_chnl RX_X $data_file
search_lane RX_Y $data_file
search_lane RX_A $data_file
search_lane RX_B $data_file
search_lane RX_C $data_file

write_delay_csv  $data_file $delay_file
write_adj_csv    $output_fname
write_adj_tcl    $output_fname

# Finish - unload report and close project


unload_report
project_close
