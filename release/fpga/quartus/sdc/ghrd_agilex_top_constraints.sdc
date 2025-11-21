## Generated SDC file "ghrd_agib027r31b1e2v.out.sdc"

## Copyright (C) 2021  Intel Corporation. All rights reserved.
## Your use of Intel Corporation's design tools, logic functions 
## and other software and tools, and any partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Intel Program License 
## Subscription Agreement, the Intel Quartus Prime License Agreement,
## the Intel FPGA IP License Agreement, or other applicable license
## agreement, including, without limitation, that your use is for
## the sole purpose of programming logic devices manufactured by
## Intel and sold by Intel or its authorized distributors.  Please
## refer to the applicable agreement for further details, at
## https://fpgasoftware.intel.com/eula.


## VENDOR  "Intel Corporation"
## PROGRAM "Quartus Prime"
## VERSION "Version 21.3.0 Build 170 09/23/2021 SC Pro Edition"

## DATE    "Tue Nov 23 14:31:14 2021"

##
## DEVICE  "AGIB027R31B1E2V"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {MAIN_CLOCK} -period 10.000 -waveform { 0.000 5.000 } [get_ports {fpga_clk_100[0]}]
create_clock -name {TOD_CLOCK} -period 8.000 -waveform { 0.000 4.000 } [get_ports {ftile_master_todclk_ref}]
create_clock -name {FTILE_CLOCK} -period 6.400 -waveform { 0.000 3.200 } [get_ports {ftile_clk_ref}]
create_clock -name {EMIF_REF_CLOCK} -period 10.000 -waveform { 0.000 5.000 } [get_ports {emif_hps_pll_ref_clk}]
create_clock -name {hps_i2c_internal} -period 2500.000 -waveform { 0.000 1250.000 } [get_registers {soc_inst|agilex_hps|intel_agilex_hps_inst|fpga_interfaces|*~l4_sp_clk.reg}]
#create_clock -name {emif_hps_mem_mem_dqs[0]_IN} -period 0.833 -waveform { 0.000 0.417 } [get_ports {emif_hps_mem_mem_dqs[0]}]
#create_clock -name {emif_hps_mem_mem_dqs[1]_IN} -period 0.833 -waveform { 0.000 0.417 } [get_ports {emif_hps_mem_mem_dqs[1]}]
#create_clock -name {emif_hps_mem_mem_dqs[2]_IN} -period 0.833 -waveform { 0.000 0.417 } [get_ports {emif_hps_mem_mem_dqs[2]}]
#create_clock -name {emif_hps_mem_mem_dqs[3]_IN} -period 0.833 -waveform { 0.000 0.417 } [get_ports {emif_hps_mem_mem_dqs[3]}]
#create_clock -name {emif_hps_mem_mem_dqs[4]_IN} -period 0.833 -waveform { 0.000 0.417 } [get_ports {emif_hps_mem_mem_dqs[4]}]
#create_clock -name {emif_hps_mem_mem_dqs[5]_IN} -period 0.833 -waveform { 0.000 0.417 } [get_ports {emif_hps_mem_mem_dqs[5]}]
#create_clock -name {emif_hps_mem_mem_dqs[6]_IN} -period 0.833 -waveform { 0.000 0.417 } [get_ports {emif_hps_mem_mem_dqs[6]}]
#create_clock -name {emif_hps_mem_mem_dqs[7]_IN} -period 0.833 -waveform { 0.000 0.417 } [get_ports {emif_hps_mem_mem_dqs[7]}]


#**************************************************************
# Create Generated Clock
#**************************************************************


#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************



#**************************************************************
# Set Input Delay
#**************************************************************



#**************************************************************
# Set Output Delay
#**************************************************************


#**************************************************************
# Set Clock Groups
#**************************************************************


#**************************************************************
# Set False Path
#**************************************************************

set_false_path -to [get_keepers {*altera_std_synchronizer:*|din_s1}]
#set_false_path -to [get_registers {*alt_xcvr_resync*sync_r[0]}]
set_false_path -from [get_ports {fpga_reset_n[0]}] 
set_false_path -from [get_ports {altera_reserved_tdi}] -to [get_ports {altera_reserved_tdo}]
set_false_path -from [get_ports {fpga_button_pio[0]}] 
set_false_path -from [get_ports {fpga_button_pio[1]}] 
set_false_path -from [get_ports {fpga_button_pio[2]}] 
set_false_path -from [get_ports {fpga_button_pio[3]}] 
set_false_path -from [get_ports {fpga_dipsw_pio[0]}] 
set_false_path -from [get_ports {fpga_dipsw_pio[1]}] 
set_false_path -from [get_ports {fpga_dipsw_pio[2]}] 
set_false_path -from [get_ports {fpga_dipsw_pio[3]}] 
set_false_path -from [get_ports {fpga_led_pio[0]}] 
set_false_path -from [get_ports {fpga_led_pio[1]}] 
set_false_path -from [get_ports {fpga_led_pio[2]}] 
set_false_path -from [get_ports {fpga_led_pio[3]}] 
set_false_path -to [get_ports {fpga_led_pio[0]}]
set_false_path -to [get_ports {fpga_led_pio[1]}]
set_false_path -to [get_ports {fpga_led_pio[2]}]
set_false_path -to [get_ports {fpga_led_pio[3]}]
set_false_path -from [get_keepers {soc_inst|*axi_bridge_for_acp_inst|csr_*}] -to [get_keepers {soc_inst|agilex_hps|intel_agilex_hps_inst|*}]
set_false_path -to [get_keepers {*|ftile_debug_status_pio_0|altera_avalon_pio_inst|readdata[*]}]
#set_false_path -to [get_keepers {*|ftile_25gbe_1588|*|debug_status_reg[*]}]
set_false_path -through [get_pins {soc_inst|ftile_25gbe_1588|iopll_clk_avst_div2|altera_iopll_inst|tennm_pll|dprio_rst_n}]  
set_false_path -to [get_keepers {{emif_hps_mem_mem_a[0]} {emif_hps_mem_mem_a[1]} {emif_hps_mem_mem_a[2]} {emif_hps_mem_mem_a[3]} {emif_hps_mem_mem_a[4]} {emif_hps_mem_mem_a[5]} {emif_hps_mem_mem_a[6]} {emif_hps_mem_mem_a[7]} {emif_hps_mem_mem_a[8]} {emif_hps_mem_mem_a[9]} {emif_hps_mem_mem_a[10]} {emif_hps_mem_mem_a[11]} {emif_hps_mem_mem_a[12]} {emif_hps_mem_mem_a[13]} {emif_hps_mem_mem_a[14]} {emif_hps_mem_mem_a[15]} {emif_hps_mem_mem_a[16]} {emif_hps_mem_mem_act_n[0]} {emif_hps_mem_mem_ba[0]} {emif_hps_mem_mem_ba[1]} {emif_hps_mem_mem_bg[0]} {emif_hps_mem_mem_cke[0]} {emif_hps_mem_mem_cs_n[0]} {emif_hps_mem_mem_odt[0]} {emif_hps_mem_mem_par[0]}}]
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_ck.inst[0].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_a.inst[0].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_a.inst[1].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_a.inst[2].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_a.inst[3].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_a.inst[4].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_a.inst[5].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_a.inst[6].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_a.inst[7].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_a.inst[8].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_a.inst[9].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_a.inst[10].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_a.inst[11].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_a.inst[12].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_a.inst[13].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_a.inst[14].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_a.inst[15].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_a.inst[16].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_act_n.inst[0].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_ba.inst[0].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_ba.inst[1].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_bg.inst[0].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_cke.inst[0].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_cs_n.inst[0].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_odt.inst[0].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_par.inst[0].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_reset_n.inst[0].b|no_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_ck.inst[0].b|cal_oct.obuf_bar|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dqs.inst[0].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dqs.inst[1].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dqs.inst[2].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dqs.inst[3].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dqs.inst[4].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dqs.inst[5].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dqs.inst[6].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dqs.inst[7].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[0].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[1].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[2].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[3].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[4].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[5].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[6].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[7].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[8].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[9].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[10].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[11].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[12].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[13].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[14].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[15].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[16].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[17].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[18].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[19].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[20].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[21].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[22].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[23].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[24].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[25].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[26].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[27].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[28].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[29].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[30].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[31].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[32].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[33].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[34].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[35].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[36].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[37].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[38].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[39].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[40].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[41].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[42].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[43].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[44].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[45].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[46].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[47].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[48].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[49].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[50].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[51].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[52].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[53].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[54].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[55].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[56].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[57].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[58].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[59].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[60].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[61].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[62].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[63].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dbi_n.inst[0].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dbi_n.inst[1].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dbi_n.inst[2].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dbi_n.inst[3].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dbi_n.inst[4].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dbi_n.inst[5].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dbi_n.inst[6].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dbi_n.inst[7].b|cal_oct.obuf|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dqs.inst[0].b|cal_oct.obuf_bar|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dqs.inst[1].b|cal_oct.obuf_bar|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dqs.inst[2].b|cal_oct.obuf_bar|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dqs.inst[3].b|cal_oct.obuf_bar|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dqs.inst[4].b|cal_oct.obuf_bar|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dqs.inst[5].b|cal_oct.obuf_bar|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dqs.inst[6].b|cal_oct.obuf_bar|oe}]  
set_false_path -through [get_pins {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dqs.inst[7].b|cal_oct.obuf_bar|oe}]  
set_false_path -to [get_keepers {{emif_hps_mem_mem_dq[0]} {emif_hps_mem_mem_dq[1]} {emif_hps_mem_mem_dq[2]} {emif_hps_mem_mem_dq[3]} {emif_hps_mem_mem_dq[4]} {emif_hps_mem_mem_dq[5]} {emif_hps_mem_mem_dq[6]} {emif_hps_mem_mem_dq[7]} {emif_hps_mem_mem_dq[8]} {emif_hps_mem_mem_dq[9]} {emif_hps_mem_mem_dq[10]} {emif_hps_mem_mem_dq[11]} {emif_hps_mem_mem_dq[12]} {emif_hps_mem_mem_dq[13]} {emif_hps_mem_mem_dq[14]} {emif_hps_mem_mem_dq[15]} {emif_hps_mem_mem_dq[16]} {emif_hps_mem_mem_dq[17]} {emif_hps_mem_mem_dq[18]} {emif_hps_mem_mem_dq[19]} {emif_hps_mem_mem_dq[20]} {emif_hps_mem_mem_dq[21]} {emif_hps_mem_mem_dq[22]} {emif_hps_mem_mem_dq[23]} {emif_hps_mem_mem_dq[24]} {emif_hps_mem_mem_dq[25]} {emif_hps_mem_mem_dq[26]} {emif_hps_mem_mem_dq[27]} {emif_hps_mem_mem_dq[28]} {emif_hps_mem_mem_dq[29]} {emif_hps_mem_mem_dq[30]} {emif_hps_mem_mem_dq[31]} {emif_hps_mem_mem_dq[32]} {emif_hps_mem_mem_dq[33]} {emif_hps_mem_mem_dq[34]} {emif_hps_mem_mem_dq[35]} {emif_hps_mem_mem_dq[36]} {emif_hps_mem_mem_dq[37]} {emif_hps_mem_mem_dq[38]} {emif_hps_mem_mem_dq[39]} {emif_hps_mem_mem_dq[40]} {emif_hps_mem_mem_dq[41]} {emif_hps_mem_mem_dq[42]} {emif_hps_mem_mem_dq[43]} {emif_hps_mem_mem_dq[44]} {emif_hps_mem_mem_dq[45]} {emif_hps_mem_mem_dq[46]} {emif_hps_mem_mem_dq[47]} {emif_hps_mem_mem_dq[48]} {emif_hps_mem_mem_dq[49]} {emif_hps_mem_mem_dq[50]} {emif_hps_mem_mem_dq[51]} {emif_hps_mem_mem_dq[52]} {emif_hps_mem_mem_dq[53]} {emif_hps_mem_mem_dq[54]} {emif_hps_mem_mem_dq[55]} {emif_hps_mem_mem_dq[56]} {emif_hps_mem_mem_dq[57]} {emif_hps_mem_mem_dq[58]} {emif_hps_mem_mem_dq[59]} {emif_hps_mem_mem_dq[60]} {emif_hps_mem_mem_dq[61]} {emif_hps_mem_mem_dq[62]} {emif_hps_mem_mem_dq[63]}}]
set_false_path -from [get_keepers {{emif_hps_mem_mem_dq[0]} {emif_hps_mem_mem_dq[1]} {emif_hps_mem_mem_dq[2]} {emif_hps_mem_mem_dq[3]} {emif_hps_mem_mem_dq[4]} {emif_hps_mem_mem_dq[5]} {emif_hps_mem_mem_dq[6]} {emif_hps_mem_mem_dq[7]} {emif_hps_mem_mem_dq[8]} {emif_hps_mem_mem_dq[9]} {emif_hps_mem_mem_dq[10]} {emif_hps_mem_mem_dq[11]} {emif_hps_mem_mem_dq[12]} {emif_hps_mem_mem_dq[13]} {emif_hps_mem_mem_dq[14]} {emif_hps_mem_mem_dq[15]} {emif_hps_mem_mem_dq[16]} {emif_hps_mem_mem_dq[17]} {emif_hps_mem_mem_dq[18]} {emif_hps_mem_mem_dq[19]} {emif_hps_mem_mem_dq[20]} {emif_hps_mem_mem_dq[21]} {emif_hps_mem_mem_dq[22]} {emif_hps_mem_mem_dq[23]} {emif_hps_mem_mem_dq[24]} {emif_hps_mem_mem_dq[25]} {emif_hps_mem_mem_dq[26]} {emif_hps_mem_mem_dq[27]} {emif_hps_mem_mem_dq[28]} {emif_hps_mem_mem_dq[29]} {emif_hps_mem_mem_dq[30]} {emif_hps_mem_mem_dq[31]} {emif_hps_mem_mem_dq[32]} {emif_hps_mem_mem_dq[33]} {emif_hps_mem_mem_dq[34]} {emif_hps_mem_mem_dq[35]} {emif_hps_mem_mem_dq[36]} {emif_hps_mem_mem_dq[37]} {emif_hps_mem_mem_dq[38]} {emif_hps_mem_mem_dq[39]} {emif_hps_mem_mem_dq[40]} {emif_hps_mem_mem_dq[41]} {emif_hps_mem_mem_dq[42]} {emif_hps_mem_mem_dq[43]} {emif_hps_mem_mem_dq[44]} {emif_hps_mem_mem_dq[45]} {emif_hps_mem_mem_dq[46]} {emif_hps_mem_mem_dq[47]} {emif_hps_mem_mem_dq[48]} {emif_hps_mem_mem_dq[49]} {emif_hps_mem_mem_dq[50]} {emif_hps_mem_mem_dq[51]} {emif_hps_mem_mem_dq[52]} {emif_hps_mem_mem_dq[53]} {emif_hps_mem_mem_dq[54]} {emif_hps_mem_mem_dq[55]} {emif_hps_mem_mem_dq[56]} {emif_hps_mem_mem_dq[57]} {emif_hps_mem_mem_dq[58]} {emif_hps_mem_mem_dq[59]} {emif_hps_mem_mem_dq[60]} {emif_hps_mem_mem_dq[61]} {emif_hps_mem_mem_dq[62]} {emif_hps_mem_mem_dq[63]}}] 
set_false_path -to [get_keepers {{emif_hps_mem_mem_dbi_n[0]} {emif_hps_mem_mem_dbi_n[1]} {emif_hps_mem_mem_dbi_n[2]} {emif_hps_mem_mem_dbi_n[3]} {emif_hps_mem_mem_dbi_n[4]} {emif_hps_mem_mem_dbi_n[5]} {emif_hps_mem_mem_dbi_n[6]} {emif_hps_mem_mem_dbi_n[7]}}]
set_false_path -from [get_keepers {{emif_hps_mem_mem_dbi_n[0]} {emif_hps_mem_mem_dbi_n[1]} {emif_hps_mem_mem_dbi_n[2]} {emif_hps_mem_mem_dbi_n[3]} {emif_hps_mem_mem_dbi_n[4]} {emif_hps_mem_mem_dbi_n[5]} {emif_hps_mem_mem_dbi_n[6]} {emif_hps_mem_mem_dbi_n[7]}}] 
set_false_path -to [get_keepers {{emif_hps_mem_mem_dqs[0]} {emif_hps_mem_mem_dqs[1]} {emif_hps_mem_mem_dqs[2]} {emif_hps_mem_mem_dqs[3]} {emif_hps_mem_mem_dqs[4]} {emif_hps_mem_mem_dqs[5]} {emif_hps_mem_mem_dqs[6]} {emif_hps_mem_mem_dqs[7]}}]
set_false_path -to [get_keepers {{emif_hps_mem_mem_dqs_n[0]} {emif_hps_mem_mem_dqs_n[1]} {emif_hps_mem_mem_dqs_n[2]} {emif_hps_mem_mem_dqs_n[3]} {emif_hps_mem_mem_dqs_n[4]} {emif_hps_mem_mem_dqs_n[5]} {emif_hps_mem_mem_dqs_n[6]} {emif_hps_mem_mem_dqs_n[7]}}]
set_false_path -from [get_keepers {{emif_hps_mem_mem_dqs[0]} {emif_hps_mem_mem_dqs[1]} {emif_hps_mem_mem_dqs[2]} {emif_hps_mem_mem_dqs[3]} {emif_hps_mem_mem_dqs[4]} {emif_hps_mem_mem_dqs[5]} {emif_hps_mem_mem_dqs[6]} {emif_hps_mem_mem_dqs[7]}}] 
set_false_path -from [get_keepers {{emif_hps_mem_mem_dqs_n[0]} {emif_hps_mem_mem_dqs_n[1]} {emif_hps_mem_mem_dqs_n[2]} {emif_hps_mem_mem_dqs_n[3]} {emif_hps_mem_mem_dqs_n[4]} {emif_hps_mem_mem_dqs_n[5]} {emif_hps_mem_mem_dqs_n[6]} {emif_hps_mem_mem_dqs_n[7]}}] 
set_false_path -to [get_keepers {{emif_hps_mem_mem_ck[0]}}]
set_false_path -to [get_keepers {{emif_hps_mem_mem_ck_n[0]}}]
set_false_path -to [get_keepers {{emif_hps_mem_mem_reset_n[0]} {emif_hps_mem_mem_alert_n[0]}}]
set_false_path -from [get_keepers {{emif_hps_mem_mem_reset_n[0]} {emif_hps_mem_mem_alert_n[0]}}] 
set_false_path -from [get_registers {*altera_jtag_src_crosser:*|sink_data_buffer*}] -to [get_registers {*altera_jtag_src_crosser:*|src_data*}]


#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************

#**************************************************************
# Set Minimum Delay
#**************************************************************

set_min_delay -from [get_keepers {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|fm_ufis|*amm_c2p_ufi_i|*ufi_read_reg}] -to [get_keepers {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|io_tiles_wrap_inst|io_tiles_inst|*phy_reg*}] -0.200
set_min_delay -from [get_keepers {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|io_tiles_wrap_inst|io_tiles_inst|*phy_reg*}] -to [get_keepers {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|fm_ufis|*amm_p2c_ufi_i|*ufi_write_reg}] -0.200
set_min_delay -from [get_keepers {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|fm_ufis|*mmr_c2p_ufi_i|*ufi_read_reg}] -to [get_keepers {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|io_tiles_wrap_inst|io_tiles_inst|*phy_reg*}] -0.200
set_min_delay -from [get_keepers {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|io_tiles_wrap_inst|io_tiles_inst|*phy_reg*}] -to [get_keepers {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|fm_ufis|*mmr_p2c_ufi_i|*ufi_write_reg}] -0.200
set_min_delay -from [get_keepers {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|fm_ufis|*seq_c2p_ufi_i|*ufi_read_reg}] -to [get_keepers {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|io_tiles_wrap_inst|io_tiles_inst|*hmc_reg*}] -0.200
set_min_delay -from [get_keepers {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|io_tiles_wrap_inst|io_tiles_inst|*hmc_reg*}] -to [get_keepers {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|fm_ufis|*seq_p2c_ufi_i|*ufi_write_reg}] -0.200
set_min_delay -from [get_keepers {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|fm_ufis|*ecc_c2p_ufi_i|*ufi_read_reg}] -to [get_keepers {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|io_tiles_wrap_inst|io_tiles_inst|*phy_reg*}] -0.200
set_min_delay -from [get_keepers {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|io_tiles_wrap_inst|io_tiles_inst|*phy_reg*}] -to [get_keepers {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|fm_ufis|*ecc_p2c_ufi_i|*ufi_write_reg}] -0.200
set_min_delay -from [get_keepers {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|fm_ufis|*lane_c2p_ufi_i|*ufi_read_reg}] -to [get_keepers {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|io_tiles_wrap_inst|io_tiles_inst|*phy_reg*}] -0.200
set_min_delay -from [get_keepers {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|io_tiles_wrap_inst|io_tiles_inst|*phy_reg*}] -to [get_keepers {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|fm_ufis|*lane_p2c_ufi_i|*ufi_write_reg}] -0.200
set_min_delay -from [get_keepers {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|fm_ufis|*sideband_c2p_ufi_i|*ufi_read_reg}] -to [get_keepers {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|io_tiles_wrap_inst|io_tiles_inst|*phy_reg*}] -0.200
set_min_delay -from [get_keepers {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|io_tiles_wrap_inst|io_tiles_inst|*phy_reg*}] -to [get_keepers {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|fm_ufis|*sideband_p2c_ufi_i|*ufi_write_reg}] -0.200


#**************************************************************
# Set Input Transition
#**************************************************************



#**************************************************************
# Set Net Delay
#**************************************************************



#**************************************************************
# Set Max Skew
#**************************************************************


#**************************************************************
# Set Disable Timing
#**************************************************************

set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_ck.inst[0].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_a.inst[0].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_a.inst[1].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_a.inst[2].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_a.inst[3].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_a.inst[4].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_a.inst[5].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_a.inst[6].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_a.inst[7].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_a.inst[8].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_a.inst[9].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_a.inst[10].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_a.inst[11].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_a.inst[12].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_a.inst[13].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_a.inst[14].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_a.inst[15].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_a.inst[16].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_act_n.inst[0].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_ba.inst[0].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_ba.inst[1].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_bg.inst[0].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_cke.inst[0].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_cs_n.inst[0].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_odt.inst[0].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_par.inst[0].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_reset_n.inst[0].b|no_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_ck.inst[0].b|cal_oct.obuf_bar}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dqs.inst[0].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dqs.inst[1].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dqs.inst[2].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dqs.inst[3].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dqs.inst[4].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dqs.inst[5].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dqs.inst[6].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dqs.inst[7].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[0].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[1].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[2].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[3].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[4].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[5].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[6].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[7].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[8].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[9].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[10].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[11].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[12].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[13].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[14].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[15].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[16].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[17].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[18].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[19].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[20].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[21].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[22].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[23].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[24].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[25].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[26].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[27].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[28].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[29].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[30].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[31].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[32].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[33].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[34].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[35].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[36].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[37].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[38].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[39].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[40].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[41].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[42].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[43].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[44].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[45].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[46].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[47].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[48].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[49].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[50].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[51].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[52].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[53].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[54].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[55].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[56].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[57].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[58].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[59].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[60].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[61].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[62].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dq.inst[63].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dbi_n.inst[0].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dbi_n.inst[1].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dbi_n.inst[2].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dbi_n.inst[3].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dbi_n.inst[4].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dbi_n.inst[5].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dbi_n.inst[6].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dbi_n.inst[7].b|cal_oct.obuf}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dqs.inst[0].b|cal_oct.obuf_bar}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dqs.inst[1].b|cal_oct.obuf_bar}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dqs.inst[2].b|cal_oct.obuf_bar}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dqs.inst[3].b|cal_oct.obuf_bar}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dqs.inst[4].b|cal_oct.obuf_bar}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dqs.inst[5].b|cal_oct.obuf_bar}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dqs.inst[6].b|cal_oct.obuf_bar}]
set_disable_timing -from oe -to o [get_cells {soc_inst|emif_hps|altera_emif_fm_hps_inst|arch|arch_inst|bufs_inst|gen_mem_dqs.inst[7].b|cal_oct.obuf_bar}]


#**************************************************************
# Disable Min Pulse Width
#**************************************************************
