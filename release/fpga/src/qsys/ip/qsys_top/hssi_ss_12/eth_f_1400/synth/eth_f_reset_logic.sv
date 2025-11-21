// (C) 2001-2024 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files from any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel FPGA IP License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


/*************************************************************************************************************
eth_f_reset_controller.sv
 
Function :  
combines hard resets and soft resets
 
// All resets in this module are active high
**************************************************************************************************************/
// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

module eth_f_reset_logic
#(	
	parameter NUM_CHANNELS = 1,
	parameter SIM_EMULATE = 1
)
(
    // User hard Reset signals
    input wire 			   i_rst, // User reset (~i_rst_n) Resets Transcivers, EHIP
    input wire 			   i_tx_rst, // User reset (~i_tx_rst_n) Resets EHIP TX
    input wire 			   i_rx_rst, // User reset (~i_rx_rst_n) Resets EHIP RX
    
    // Soft CSR reset signals
    input wire 			   i_soft_tx_rst, 
    input wire 			   i_soft_rx_rst,
    input wire 			   i_soft_sys_rst, 

    // Output
    output wire        o_tx_dp_rst, // Reset TX datapath 
    output wire        o_rx_dp_rst // Reset RX datapath    
     
);
   
assign o_tx_dp_rst    = i_rst | i_tx_rst | i_soft_sys_rst | i_soft_tx_rst;
assign o_rx_dp_rst    = i_rst | i_rx_rst | i_soft_sys_rst | i_soft_rx_rst;

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "Jbn39HeDxGqNcYGZOx4Z9ucCs2oEh/b8uMkRaNvB5DRjzJrJYrpJKWFCISE85ii6tH9zuuCEo6X0af6OauTQ+Ozwk1tsZmSo/aK9UOYVqiI4L0mMLnnDyFPJBEUN+znp6d+oie84TxrwJugN/66eG6ek4cTulks0EXWtTfhwKcotsw0Xz4/SS3GVym/4tne0z9smydSL74/eJ6ocrXzqMjpfEjy1qL7mzZl6AEz+onppvGv1cyF3UhET0ECOrTTiX/JcTW0e1aIBBbcHiWSA+93toGzBFJ8IE3FZQeRjpLDTKEVy+uI5I6JJrb55vewsj9pxHAQKs35HFFKvQFsLCaf2H0CXm2PHRG14bFAgEjmy21ioYZR/fPuQSii+iI3Nqih8F6IV3xlSWhVVhTPJZEhjXz89zWFIRJqyylx0PNi4woT7mNz+mt8F/KWMYYaGfFIMkX/DrbNEKOrDhODnef1Ky9Z5oUijDdlPwPaxwkJWQ+QKPSvM8IxdLicNmTlGteBXe9NAu2pBwTqjj0W60IrzG2tAA34kAN2RWold4XDfz+0s5EtSiMDrRThXr8owzEARbjSAjHlDZG6VHARnXQPtjj3oB3Afi5pPF92EfR4rACzhWsys01xL+ySSWZOmc7JyX90gEajfQZ5FYkpSRmJSpy2e/bMbB61QknJEhVALI5x9q5iuFcbz74wVShPQeTEmAKOdl07kKTEXr5kyXF7QPXLXngXQvfPKvCUjKquBwG0vSauS6FeB8duxwoGxTogMaTTAGu+QO6YogNZ+L6WEqgkNjLKgyfdoLk/oOw5FGVmMQ4wif9z8ZAlQFaoFoOejVfHZuAR7bTKUv1wLCmYHrMVmPa9hqKxYv2JgKbci5p0cuSoQ2rXU8VxsXz46SDLUC54N7MFx/ix3NW7aSPL7Is8fkjlEUDh+TZrRD4MMc2Z6wflYPIQeS6u5pmam3/SPYhuphhEZs1KMXiFQGPD3PSVTpp1xz8ahCAIxu2XJub6ijIuqmy5i62AydXvw"
`endif