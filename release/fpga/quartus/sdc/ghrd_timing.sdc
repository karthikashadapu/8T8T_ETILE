#****************************************************************************
#
# SPDX-License-Identifier: MIT-0
# Copyright(c) 2019-2021 Intel Corporation.
#
#****************************************************************************
#
# Sample SDC for Agilex GHRD.
#
#****************************************************************************

set_time_format -unit ns -decimal_places 3

# 100MHz board input clock, 133.3333MHz for EMIF refclk
create_clock -name {MAIN_CLOCK} -period 10.000 -waveform { 0.000 5.000 } [get_ports {fpga_clk_100[0]}]
create_clock -name {TOD_CLOCK} -period 6.400 -waveform { 0.000 3.200 } [get_ports {ftile_master_todclk_ref}]
create_clock -name {FTILE_CLOCK} -period 6.400 -waveform { 0.000 3.200 } [get_ports {ftile_clk_ref[0]}]
create_clock -name {EMIF_REF_CLOCK} -period 6.666 -waveform { 0.000 3.333 } [get_ports {emif_hps_pll_ref_clk}]
#create_clock -name dsp_clk -period 4.069 [get_ports dsp_clk_491m]
create_clock -name dsp_clk -period 2.034 [get_ports dsp_clk_491m]
create_clock -name JESD_XCVR_CLK -period 8.138 [get_ports jesd_xcvr_clk]


#create_generated_clock -name {soc_inst|sys_manager|eth_f_tod_clk_156|eth_f_tod_clk_156_n_cnt_clk} -source [get_pins {soc_inst|sys_manager|eth_f_tod_clk_156|eth_f_tod_clk_156|tennm_pll|core_refclk}] -duty_cycle 50/1 -multiply_by 1 -divide_by 2 -master_clock {TOD_CLOCK} [get_registers {soc_inst|sys_manager|eth_f_tod_clk_156|eth_f_tod_clk_156|tennm_pll~ncntr_reg}] 
#create_generated_clock -name {soc_inst|sys_manager|eth_f_tod_clk_156|eth_f_tod_clk_156_m_cnt_clk} -source [get_registers {soc_inst|sys_manager|eth_f_tod_clk_156|eth_f_tod_clk_156|tennm_pll~ncntr_reg}] -duty_cycle 50/1 -multiply_by 1 -divide_by 50 -master_clock {soc_inst|sys_manager|eth_f_tod_clk_156|eth_f_tod_clk_156_n_cnt_clk} [get_registers {soc_inst|sys_manager|eth_f_tod_clk_156|eth_f_tod_clk_156|tennm_pll~mcntr_reg}] 
#create_generated_clock -name {soc_inst|sys_manager|eth_f_tod_clk_156|eth_f_tod_clk_156_outclk0} -source [get_registers {soc_inst|sys_manager|eth_f_tod_clk_156|eth_f_tod_clk_156|tennm_pll~ncntr_reg}] -duty_cycle 50/1 -multiply_by 25 -divide_by 8 -master_clock {soc_inst|sys_manager|eth_f_tod_clk_156|eth_f_tod_clk_156_n_cnt_clk} [get_pins {soc_inst|sys_manager|eth_f_tod_clk_156|eth_f_tod_clk_156|tennm_pll|outclk[1]}] 


create_generated_clock -name clk_156_mux -source [get_pins {soc_inst|sys_manager|eth_f_tod_clk_156|eth_f_tod_clk_156|tennm_pll|outclk[1]}] [get_nets {soc_inst|sys_manager|glitch_free_clk_mux_0|glitch_free_clk_mux_0|gated_clks[1]}]
create_generated_clock -name clk_tod_mux -source [get_ports {ftile_master_todclk_ref}] [get_nets {soc_inst|sys_manager|glitch_free_clk_mux_0|glitch_free_clk_mux_0|gated_clks[0]}]

set_clock_groups -logically_exclusive -group clk_156_mux -group clk_tod_mux

#set_false_path -from [get_ports {fpga_reset_n[0]}]

# sourcing JTAG related SDC
source ./sdc/jtag.sdc

# FPGA IO port constraints
set_false_path -from [get_ports {fpga_button_pio[0]}] -to *
set_false_path -from [get_ports {fpga_button_pio[1]}] -to *
set_false_path -from [get_ports {fpga_button_pio[2]}] -to *
set_false_path -from [get_ports {fpga_button_pio[3]}] -to *
set_false_path -from [get_ports {fpga_dipsw_pio[0]}] -to *
set_false_path -from [get_ports {fpga_dipsw_pio[1]}] -to *
set_false_path -from [get_ports {fpga_dipsw_pio[2]}] -to *
set_false_path -from [get_ports {fpga_dipsw_pio[3]}] -to *
set_false_path -from [get_ports {fpga_led_pio[0]}] -to *
set_false_path -from [get_ports {fpga_led_pio[1]}] -to *
set_false_path -from [get_ports {fpga_led_pio[2]}] -to *
set_false_path -from [get_ports {fpga_led_pio[3]}] -to *
set_false_path -from * -to [get_ports {fpga_led_pio[0]}]
set_false_path -from * -to [get_ports {fpga_led_pio[1]}]
set_false_path -from * -to [get_ports {fpga_led_pio[2]}]
set_false_path -from * -to [get_ports {fpga_led_pio[3]}]

 
# False Path between debounced and reset synchronizer
#set_false_path -from fpga_reset_n_debounced -to {soc_inst|rst_controller_*|altera_reset_synchronizer_int_chain[1]}

# ----------------------------------------------------------------------------- #
# ---  Clock Crosser constraint and skew constraint                       --- #
# ----------------------------------------------------------------------------- #
 
proc eth_f_constraint_net_delay {from_reg to_reg max_net_delay {check_exist 0} {get_pins 1} {set_skew_constraint 1} {set_mstable 1}} {
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
            set_max_delay -no_synchronizer -from [get_registers ${from_reg}] -to [get_registers ${to_reg}] 200ns
            set_min_delay -from [get_registers ${from_reg}] -to [get_registers ${to_reg}] -200ns
        } else {
            if {$get_pins == 0} {
                set_net_delay -from [get_registers ${from_reg}] -to [get_registers ${to_reg}] -max $max_net_delay
            } else {
                set_net_delay -from [get_pins -compatibility_mode ${from_reg}|q] -to [get_registers ${to_reg}] -max $max_net_delay
            }
            
            # Relax the fitter effort
            set_max_delay -no_synchronizer -from [get_registers ${from_reg}] -to [get_registers ${to_reg}] 200ns
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
		set_max_delay -no_synchronizer -from [get_registers ${from_reg}] -to [get_registers ${to_reg}] 100
		set_min_delay -from [get_registers ${from_reg}] -to [get_registers ${to_reg}] -100		
  }
	
    #set Meta stability for EFIFO 
    if {($set_mstable == 1)} {
		if { ![string equal "quartus_sta" $::TimeQuestInfo(nameofexecutable)] } {
			set_net_delay -from [get_registers ${from_reg}] -to [get_registers ${to_reg}] -max -get_value_from_clock_period dst_clock_period -value_multiplier 0.8
		}
    }
 }
 
 
 
#general: synchronizer
eth_f_constraint_net_delay  * *|alt_rst_sync_uq1|altera_reset_synchronizer_int_chain[*] 2.2ns 1 0 0 0 
eth_f_constraint_net_delay  * *|*.synchronizer_nocut_inst|din_s1                        2.2ns 1 0 0 0
eth_f_constraint_net_delay  * *|*.synchronizer_nocut|din_s1                             2.2ns 1 0 0 0
eth_f_constraint_net_delay  * *|port*_tod_stack*|*_sync_inst|din_s1                      2.2ns 1 0 0 0
eth_f_constraint_net_delay  * *|master_tod_top_0|*_sync_inst|din_s1                     2.2ns 1 0 0 0
eth_f_constraint_net_delay  * *|port*_tod_stack|*_todsync_sampling_locked_sync_inst_10g|din_s1                  2.2ns 1 0 0 0
eth_f_constraint_net_delay  * ptp_ed_issp_inst|in_system_sources_probes_*|stp_status_bits_in_reg_acq*          2.2ns 1 0 0 0
eth_f_constraint_net_delay  * soc_inst|ftile_debug_status_pio_*|altera_avalon_pio_inst|d1_data_in*            2.2ns 1 0 0 0
eth_f_constraint_net_delay soc_inst|rst_controller_*|alt_rst_sync_uq1|altera_reset_synchronizer_int_chain_out *hssi_ss_*|U_SRC_RST_CONTROLLER|SS_RST_SEQ|gen_resp_rst_sync* 2.2ns 1 0 0 0

eth_f_constraint_net_delay  * soc_inst|*cdc_packet_fifo*|*sync*|in_data_meta*           2.2ns 1 0 0 0
eth_f_constraint_net_delay  * soc_inst|dma_subsys|dma_subsys_port*|*|*|tx_dma_fifo*|*sync*|in_data_meta*           3ns 1 0 0 0


#pps control sync
eth_f_constraint_net_delay *|mtod_load_ctrl|mtod_load_ctrl|data_out[0] *|mtod_subsys_pps_load_tod_0|mtod_subsys_pps_load_tod_0|pps_control_1d  2.2ns 1 0 0 0

#glitch free clock mux sync
eth_f_constraint_net_delay  *|sys_ctrl_pio_0|qsfpdd_ctrl_pio_0|data_out*            *|glitch_free_clk_mux_0|glitch_free_clk_mux_0|ena_r0*           2.2ns 1 0 0 0 
eth_f_constraint_net_delay  *|glitch_free_clk_mux_0|glitch_free_clk_mux_0|ena_r2[1] *|glitch_free_clk_mux_0|glitch_free_clk_mux_0|ena_r0[0]         2.2ns 1 0 0 0
eth_f_constraint_net_delay  *|glitch_free_clk_mux_0|glitch_free_clk_mux_0|ena_r2[0] *|glitch_free_clk_mux_0|glitch_free_clk_mux_0|ena_r0[1]         2.2ns 1 0 0 0

set_clock_groups -asynchronous -group [get_clocks {clk_156_mux}] -group [get_clocks {MAIN_CLOCK}]
set_clock_groups -asynchronous -group [get_clocks {clk_tod_mux}] -group [get_clocks {MAIN_CLOCK}]
set_clock_groups -asynchronous -group [get_clocks {TOD_CLOCK}] -group [get_clocks {MAIN_CLOCK}]

set_net_delay -from [get_registers "*mtod_subsys_pps_load_tod_0\|tod_nsec*"] -to [get_registers "*mtod_subsys_pps_load_tod_0\|csr_readdata*"] -max -get_value_from_clock_period dst_clock_period -value_multiplier 0.8
set_net_delay -from [get_registers "*mtod_subsys_pps_load_tod_0\|tod_sec*"] -to [get_registers "*mtod_subsys_pps_load_tod_0\|csr_readdata*"] -max -get_value_from_clock_period dst_clock_period -value_multiplier 0.8

set_net_delay -from [get_registers "*mtod_subsys_pps_load_tod_0\|tod_nsec*"] -to [get_registers "*mtod_subsys_pps_load_tod_0\|csr_readdata*"] -max -get_value_from_clock_period dst_clock_period -value_multiplier 0.8
set_net_delay -from [get_registers "*mtod_subsys_pps_load_tod_0\|tod_sec*"] -to [get_registers "*mtod_subsys_pps_load_tod_0\|csr_readdata*"] -max -get_value_from_clock_period dst_clock_period -value_multiplier 0.8
set_max_skew -from [get_keepers "*mtod_subsys_pps_load_tod_0\|tod_nsec*"] -to [get_keepers "*mtod_subsys_pps_load_tod_0\|csr_readdata*"] -get_skew_value_from_clock_period min_clock_period -skew_value_multiplier 0.8
set_max_skew -from [get_keepers "*mtod_subsys_pps_load_tod_0\|tod_sec*"] -to [get_keepers "*mtod_subsys_pps_load_tod_0\|csr_readdata*"] -get_skew_value_from_clock_period min_clock_period -skew_value_multiplier 0.8


