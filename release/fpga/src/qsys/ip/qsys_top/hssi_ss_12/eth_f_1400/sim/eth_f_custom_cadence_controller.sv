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
//custom cadence controller implemented using efifo_f
//=============================================================================
//Declaration
 
//synthesis translate_off
`timescale 1ns / 1ps
//synthesis translate_on
 
module eth_f_custom_cadence_controller #(
    parameter EHIP_RATE 			= "40G",
    parameter SIM_EMULATE = 1'b0 
)(

    //input clocks and resets
    input   logic            i_tx_rd_clk,   //o_clk_pll
	 input   logic            i_tx_wr_clk,   //clk_tx_div
	 input   logic            i_reset,       //tx_pll_locked
    // output
    output  logic      o_custom_cadence
	 
);

wire tx_wr_en;
wire xcvr_if_data_valid_w;

generate
if(EHIP_RATE == "40G")begin
wire reset_sync;

  eth_f_xcvr_resync_std #(
    .SYNC_CHAIN_LENGTH(3),
    .WIDTH(1),
    .INIT_VALUE(0)
) tx_pll_locked_synchro (

    .clk        (i_tx_wr_clk),
    .reset  (1'b0),
    .d        (i_reset), 
    .q       (reset_sync)
  );
  
logic tx_wr_clk_2;
always_ff @(posedge i_tx_wr_clk) begin
	if (reset_sync) begin
		tx_wr_clk_2 <= 1'b0;
	end else begin
		tx_wr_clk_2 <= ~tx_wr_clk_2;
	end
end
			
assign tx_wr_en = tx_wr_clk_2;

end else begin
assign tx_wr_en= 1'b1;
end
endgenerate
		  		
localparam CCC_DWIDTH = 65; //64 +dv on MSB

//custom cadence controller with it's ram disabled
        eth_f_ccc_w_fifo # (
            .WIDTH       (((CCC_DWIDTH/20) + 1) * 20),
            .DISABLE_RAM (1),
	    .SIM_EMULATE(SIM_EMULATE) 
        ) ccc (
            .aclr   (i_reset),    
            .wclk   (i_tx_wr_clk),
            .wreq   (tx_wr_en),  
            .rclk   (i_tx_rd_clk),
            .rreq   (1'b1),
            .rempty (),
            .data_valid (xcvr_if_data_valid_w)
        );

always_ff @(posedge i_tx_rd_clk) begin
o_custom_cadence <= xcvr_if_data_valid_w;
end

endmodule 
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "Jbn39HeDxGqNcYGZOx4Z9ucCs2oEh/b8uMkRaNvB5DRjzJrJYrpJKWFCISE85ii6tH9zuuCEo6X0af6OauTQ+Ozwk1tsZmSo/aK9UOYVqiI4L0mMLnnDyFPJBEUN+znp6d+oie84TxrwJugN/66eG6ek4cTulks0EXWtTfhwKcotsw0Xz4/SS3GVym/4tne0z9smydSL74/eJ6ocrXzqMjpfEjy1qL7mzZl6AEz+ono0KEIgirxI9q7hbEnbSTOnj7aupnVzEAjGxVkRGRUZPhBVeWeA5Ka1cbnyGFG6H2kJibh6QCHYofcco2tFVGhFgjJ6z6YNqeW0yfDmV+/yEC4kSnR5LZ3oQnkPF/lGD1XgBM/FOvihKtN+UVp6JO9ZppP+DlnPpRD6BvDqq7oaO4wxtTfN1jU26LvBo9+JnxlLeXiyrLhYUmUY4z4A47O9ekKmdZwsJxBrzydn6FJ+WiiQkdKTWx85JVFX4jenly4wixxQDnG+4uMdOExWT/YSp8LNkM4ZSLVFRtyQpxFoyRnMq2I535G9K79d+IVeHz86H8OY/ju3WckV7dGhQq1lxjwukUG6Zy8GIbbRkuNapKPnxFk5L3TBE/CXrCPe8xNHPndUodvP7+eDCAPGfd9ENAik0ha9JwMBu6xH+EUzhNTnmYHCejX1gXt7ffWUnH+nQLq2Y8oInT1mojeszaZvTEFIyD49ODpOCOl2qHtHS6SoXZ/1mWIeYQEhHXfBo8VGL45EKrjPtCBphnoCfwVHtDOC0HdV/C+Uk7a8p0WGgEiabWnHkoflWkYmZwp8ohs0t5hTTmmNzR0j/4HazNEN1EKhfhnBSKfKgg/PfSiJ7aSi5e7POvmVhGnm1xKwtC5/zkGuBjw8NKYZuuHkCYhSKgI1PRVldksHSnCKqWBHvu7v92hB7lzUB1/8D9HexY3ULzgUe7LekPMA1zri9EiReGguYcLMKj8Wn8HrKqmaHia6/3n5N/wQVuHmb1P1SjnvcKUpjYzszynGDB3gRU+p"
`endif