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


#create_clock -name perst_clk -period 100MHz [get_ports perst_clk]
#create_clock -name mgmt_clk -period 100.0MHz [get_ports mgmt_clk]
#create_clock -name altera_reserved_tck [get_ports {altera_reserved_tck}] -period 25MHz

# Create a 20MHz SPI clock - Please refer to converter device data sheet for the supported frequency
#create_generated_clock -name SCLK -divide_by 5 -source [get_ports {mgmt_clk}] [get_registers {*spi_0|SCLK_reg}]
#create_generated_clock -name spi_SCLK -source [get_registers {*spi_0|SCLK_reg}] [get_ports {spi_SCLK}]

derive_clock_uncertainty

#set_clock_groups -asynchronous -group perst_clk -group mgmt_clk -group refclk_xcvr 
#-group refclk_core  
set_clock_groups -asynchronous -group {MAIN_CLOCK} \
-group [get_clocks {*u_iopll_491p52|iopll_0_outclk1}] \
-group [get_clocks {*|j204c_f_rx_tx_ip_0|intel_jesd204c_f|intel_jesd204c_f|rx_clkout|ch*}] \
-group [get_clocks {*|j204c_f_rx_tx_ip_0|intel_jesd204c_f|intel_jesd204c_f|tx_clkout|ch*}] \
-group [get_clocks {*|j204c_f_rx_tx_ip_0|intel_jesd204c_f|intel_jesd204c_f|tx_clkout2|ch*}] \
-group {altera_reserved_tck}
#-group {*|iopll_0|iopll_0_link_clk u_j204c_f_rx_tx_ss|core_pll|core_pll_refclk } \
soc_inst|iopll_0|iopll_0_link_clk

set_false_path -to [get_keepers {core_pll_locked_sync|u|din_s1}]

set_input_delay 0.4ns sysref -clock [get_clocks {*u_iopll_491p52|iopll_0_outclk1}] -max 
set_input_delay 0.2ns sysref -clock [get_clocks {*u_iopll_491p52|iopll_0_outclk1}] -min 

#set_input_delay 1ns spi_MISO -clock SCLK -max
#set_output_delay 1ns spi_MOSI -clock SCLK -max
#set_output_delay 1ns spi_SS_n* -clock SCLK -max
#set_input_delay 0.2ns spi_MISO -clock SCLK -min
#set_output_delay 0.2ns spi_MOSI -clock SCLK -min
#set_output_delay 0.2ns spi_SS_n* -clock SCLK -min


#set_false_path -from altera_reserved_tdi
#set_false_path -from altera_reserved_tms
#set_false_path -from global_rst_n
#set_false_path -to altera_reserved_tdo
#set_false_path -from [get_ports {user_dip[*]}]
#set_false_path -to [get_ports {user_led[*]}]

# TODO: multicycle_path is only needed for FCLK_MULP=2, remove for FCLK_MULP=1


