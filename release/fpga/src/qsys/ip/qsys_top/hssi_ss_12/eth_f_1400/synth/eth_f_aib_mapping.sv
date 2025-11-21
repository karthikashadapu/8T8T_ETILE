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


//=============================================================================
//Description
// MAIB mapping   
//=============================================================================
//Declaration

//synthesis translate_off
`timescale 1ns / 1ps
//synthesis translate_on

module eth_f_aib_mapping
import eth_f_package::*;
#(
    parameter   LANES             =   4,
    parameter   EHIP_BLOCK        =   0
)
(
  
    //hdpldadapt  Interface
    input   logic   [31:0]              i_link_out_from_aib,
    output  logic   [LANES-1:0][39:0]   o_link_in_to_aib,

    // Input signals    
    input   logic                       i_pld_ready,
    // input   logic                       i_signal_ok,       
    input   logic                       i_clear_internal,       
    input   logic                       i_tx_pause,       
    input   logic   [7:0]               i_tx_pfc,       

    // Output signals
    output  logic 			o_pcs_rx_sf,
    output  logic   [LANES-1:0]		o_fec_not_locked,
    output  logic 			o_fec_not_align,
    output  logic                       o_rx_rst_n,       
    output  logic                       o_hip_ready,       
    output  logic                       o_tx_rst_n,       
    output  logic                       o_rx_block_lock,       
    output  logic                       o_rx_dsk_done,
    output  logic                       o_rx_am_lock,
    output  logic                       o_rx_pcs_fully_aligned,
    output  logic                       o_hi_ber,
    output  logic                       o_rx_pcs_internal_err,
    output  logic                       o_local_fault,
    output  logic                       o_remote_fault,
    output  logic                       o_rx_pause,
    output  logic [7:0]                 o_rx_pfc,
    output  logic                       o_clk_pll,       
    output  logic                       o_clk_tx_div,          
    output  logic                       o_clk_rec_div64,      
    output  logic                       o_clk_rec_div      
    //    output  logic                       o_txfifo_pfull

);


//=========================================================================
// Generate status signals 
//=========================================================================

assign o_pcs_rx_sf			= i_link_out_from_aib[AIB_PCS_RX_SF];
assign o_fec_not_align			= i_link_out_from_aib[AIB_FEC_NOT_ALIGN];

genvar j;

generate 
for (j=0; j<LANES; j=j+1) begin:FEC_NOT_LOCKED_ALL_CHANNELS
	assign o_fec_not_locked[j] = i_link_out_from_aib[AIB_FEC_NOT_LOCKED];
end
endgenerate


assign o_rx_rst_n                        =   i_link_out_from_aib[AIB_RX_RESET_ACK];      
assign o_hip_ready                       =   i_link_out_from_aib[AIB_HIP_READY];        
assign o_tx_rst_n                        =   i_link_out_from_aib[AIB_TX_RESET_ACK];           
assign o_rx_block_lock                   =   i_link_out_from_aib[AIB_RX_BLOCK_LOCK];      
assign o_rx_dsk_done                     =   i_link_out_from_aib[AIB_RX_DESKEW_DONE];      
assign o_rx_am_lock                      =   i_link_out_from_aib[AIB_RX_AM_LOCK];        
assign o_rx_pcs_fully_aligned            =   i_link_out_from_aib[AIB_RX_PCS_FULLY_ALIGNED];        
assign o_hi_ber                          =   i_link_out_from_aib[AIB_HI_BER];      
assign o_rx_pcs_internal_err             =   i_link_out_from_aib[AIB_RX_PCS_INTERNAL_ERROR];       
assign o_local_fault                     =   i_link_out_from_aib[AIB_LOCAL_FAULT];            
assign o_remote_fault                    =   i_link_out_from_aib[AIB_REMOTE_FAULT];       
assign o_rx_pause                        =   i_link_out_from_aib[AIB_RX_PAUSE];
assign o_rx_pfc                          =   {i_link_out_from_aib[AIB_RX_PFC_7],i_link_out_from_aib[AIB_RX_PFC_6],i_link_out_from_aib[AIB_RX_PFC_5],i_link_out_from_aib[AIB_RX_PFC_4],i_link_out_from_aib[AIB_RX_PFC_3],i_link_out_from_aib[AIB_RX_PFC_2],i_link_out_from_aib[AIB_RX_PFC_1],i_link_out_from_aib[AIB_RX_PFC_0]};      
// assign o_txfifo_pfull                    =   i_link_out_from_aib[AIB_TXFIFO_PFULL];     



//=============================================================================
// Generate SSR input to AIB
// ============================================================================
genvar i;

generate
for (i=0; i<LANES; i=i+1) begin:AIB_SSR
    assign o_link_in_to_aib[i][15:0]= {16{1'b0}}; 
    assign o_link_in_to_aib[i][39:28]= {12{1'b0}}; 
    assign o_link_in_to_aib[i][AIB_PLD_READY]       =       i_pld_ready;     
    assign o_link_in_to_aib[i][AIB_SIGNAL_OK]       =       1'b0;          
    assign o_link_in_to_aib[i][AIB_CLEAR_INTERNAL]  =       i_clear_internal; 
    assign o_link_in_to_aib[i][AIB_TX_PAUSE]        =       i_tx_pause;      
    assign {o_link_in_to_aib[i][AIB_TX_PFC_7],o_link_in_to_aib[i][AIB_TX_PFC_6],o_link_in_to_aib[i][AIB_TX_PFC_5],o_link_in_to_aib[i][AIB_TX_PFC_4],o_link_in_to_aib[i][AIB_TX_PFC_3],o_link_in_to_aib[i][AIB_TX_PFC_2],o_link_in_to_aib[i][AIB_TX_PFC_1],o_link_in_to_aib[i][AIB_TX_PFC_0]}          =       i_tx_pfc;        
end // AIB_SSR
endgenerate

//=============================================================================
// Generate clocks
// ============================================================================

assign o_clk_pll          =   i_link_out_from_aib[PLL_CLK]; 
assign o_clk_tx_div       =   i_link_out_from_aib[DIV66_CLK];  
assign o_clk_rec_div64    =   i_link_out_from_aib[REC_CLK_DIV64];      
assign o_clk_rec_div      =   i_link_out_from_aib[REC_CLK_DIV66];    

endmodule

`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "Jbn39HeDxGqNcYGZOx4Z9ucCs2oEh/b8uMkRaNvB5DRjzJrJYrpJKWFCISE85ii6tH9zuuCEo6X0af6OauTQ+Ozwk1tsZmSo/aK9UOYVqiI4L0mMLnnDyFPJBEUN+znp6d+oie84TxrwJugN/66eG6ek4cTulks0EXWtTfhwKcotsw0Xz4/SS3GVym/4tne0z9smydSL74/eJ6ocrXzqMjpfEjy1qL7mzZl6AEz+onrhea6HWgCPTsdQF/Bh/D5YGRund+I09fViBo5mb9FrbmhA4tBFRvSFI152ESD+vFm4Ca9UBJvo1vLZ7T3frMG6SMHhpZhl7HkdhBmzhYxniz8mSIMIcd3PGP5FWPbXt+UWK9lN9UMZwoiPoE+Ga5ZqB6MbdZmRQOQbHV/B20GuXP/iKoRa5Kqy4I4PU7nogH0g1qoBIL6lu6i/oXl5mBnoHNz2Xn9R3oQiduGNfwzWsNNXY2U5nRMBBfbcS7LXcifakfeNmwdQx+TglAOF7oNcczEx1OGk+3FslAW0hXI8+GHWpEmgCElR7KMcChjqBgnPTRihpOp1XR1DUJ/3KGcaeJ+6GtHYBqlxtLlsroMbnjCIjl++lb9d8nRI2pfeNwR2cYANd+LqQdd1+BXZQHGNpntHl4JFL1mkDbgy6QsclyNJpMpsh5uQrg6lvv4X5wQju+ZFmV2jJnqlBXi8CLN9+2c3pWggZ/jBTAynmI/7skN9TKYbOg8fKH3DyxeXbrixhm07F+jbn/sW6zxG5CPawfpJNOpPcjvsb66yYuvUSKf2XEqzr/f2XF1zxjIlA5+E6KaLYYhEbY3uhqxZ7Q2RfAoUyb3/q+HTmD+VSSHD7lAU4Mn5T7eH3+/9qezUdNj8GrDzCcr+bTuKHZtnoJgJ8eLn9/vQzuUl1n2otBUMrGMHuMhlOcgGp+mQHySrwX6iXhSzc5J/Uosk7jjKgoucJ3Pzl4+876/Sk1xHJNKTJmUkh78yWTBAAaJrHvc/tS6xBzr3nIJop4S64nrseYV5"
`endif