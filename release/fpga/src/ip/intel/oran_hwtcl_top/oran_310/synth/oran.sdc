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


# clk_tx and clk_rx for: 
# A10 devices = 156.25MHz
# Others      = 390.625MHz
#
# clk_csr = 100MHz

# No SDC constraint is generated for ORAN IP in Example Design, please refer to SDC constraint file of Example Design.


##set auto_tx_u_size "*mapper_tx_u_size_in_2d*"


#else {
#    puts "Signal ${auto_tx_u_size} does not exist."
# }



