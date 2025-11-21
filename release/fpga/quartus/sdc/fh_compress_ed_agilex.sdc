# (C) 2001-2023 Intel Corporation. All rights reserved.
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


set_time_format -unit ns -decimal_places 3

create_clock -name {altera_reserved_tck} [get_ports { altera_reserved_tck }] -period 16MHz
create_clock -name coreclk -period 390.625MHz [get_ports core_clk]
create_clock -name clk_100 -period 100.00MHz [get_ports clk100]

set ALT_RSV_CLK     [get_clocks altera_reserved_tck]
set CLK100          [get_clocks clk_100]
set CORE_CLK        [get_clocks coreclk]


# Automatically calculate clock uncertainty to jitter and other effects.
derive_clock_uncertainty

set_input_delay -clock $CLK100 1 [get_ports {mgmt_reset_n}] -add_delay 

#declare_clock       ALTERA_INSERTED_INTOSC_FOR_TRS|divided_osc_clk
#set OSC_CLK	        [get_clocks ALTERA_INSERTED_INTOSC_FOR_TRS|divided_osc_clk]


# Clock groups
set_clock_groups -asynchronous -group $CLK100 -group $ALT_RSV_CLK
set_clock_groups -asynchronous -group $CLK100 -group $CORE_CLK 


if { [string equal quartus_fit $::TimeQuestInfo(nameofexecutable)] } { set_max_delay -to [get_ports { altera_reserved_tdo } ] 0 }
set_clock_groups -asynchronous -group {altera_reserved_tck}
  
# From Timequest cookbook
set_clock_groups -exclusive -group [get_clocks altera_reserved_tck]

set_input_delay -add_delay -clock altera_reserved_tck -clock_fall 3 [get_ports altera_reserved_tdi]
set_input_delay -add_delay -clock altera_reserved_tck -clock_fall 3 [get_ports altera_reserved_tms]
set_output_delay -add_delay -clock altera_reserved_tck 3 [get_ports altera_reserved_tdo]


