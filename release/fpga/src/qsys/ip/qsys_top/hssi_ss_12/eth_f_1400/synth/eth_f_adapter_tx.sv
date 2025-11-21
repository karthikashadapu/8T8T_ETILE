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


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on 

module eth_f_adapter_tx #(
	parameter READY_LATENCY         = 0,
	parameter EHIP_RATE             = "100G",
	parameter ENABLE_ASYNC_ADAPTERS = 1 ,
	//parameter PREAMBLE_PASSTHROUGH  = 0,
	parameter PREAM                 = 64'hFB55_5555_5555_55D5,
	parameter I_NBLOCKS            = (EHIP_RATE == "100G") ? 8 : (EHIP_RATE == "50G" || EHIP_RATE == "40G") ? 2 : 1,
	parameter O_NBLOCKS            = (EHIP_RATE == "100G") ? 4 : (EHIP_RATE == "50G" || EHIP_RATE == "40G") ? 2 : 1,
	parameter EMPTY_BITS           = (EHIP_RATE == "100G") ? 6 : (EHIP_RATE == "50G" || EHIP_RATE == "40G") ? 4 : 3,  
	parameter PTP_WIDTH            = 1,
	parameter SIM_EMULATE          = 0
)(
    input                           i_clk_r,
    input                           i_clk_w,
    input                           i_reset,

	//Client Interface
    input                           i_preamble_passthrough_reg,
    input                  [63:0]   i_preamble,  
    input                           i_valid,
    input   [0:I_NBLOCKS-1][63:0]   i_data,
    input                           i_sop,
    input                           i_eop,
    input   [EMPTY_BITS-1:0]        i_empty,
    input                           i_error,
    input                           i_skip_crc,
    output reg                      o_ready,

    output  [0:O_NBLOCKS-1][63:0]    o_data,
    output  wire                     o_valid,
    input                            i_ready,
    output  reg [0:O_NBLOCKS-1]      o_inframe,
    output  reg [0:O_NBLOCKS-1][2:0] o_empty,
    output  reg [0:O_NBLOCKS-1]      o_error,
    output  reg [0:O_NBLOCKS-1]      o_skip_crc,
    output  reg [PTP_WIDTH-1:0]      o_ptp,
    //
    output  logic   [31:0]           o_starts_in,
    output  logic   [31:0]           o_starts_out,
    output  logic   [31:0]           o_ends_in,
    output  logic   [31:0]           o_ends_out,
    output  logic   [0:7]            o_mem_underflow
);
logic [64-1:0]                 preamble_int;

always_comb begin
  if (i_preamble_passthrough_reg == 1'b1)
    preamble_int = i_preamble;
  else
    preamble_int = PREAM;  
end

generate 
if ( EHIP_RATE == "100G" || EHIP_RATE == "50G" || EHIP_RATE == "40G") begin
     eth_f_100g_50g_adapter_tx #(
	  .EHIP_RATE  (EHIP_RATE),
	  .READY_LATENCY         (READY_LATENCY)
	  ,.ENABLE_ASYNC_ADAPTERS (ENABLE_ASYNC_ADAPTERS),
	  .SIM_EMULATE(SIM_EMULATE)
     ) i_eth_f_100g_adapter_tx (

        .i_arst            (i_reset)
//                    
        ,.i_clk_w          (i_clk_w)
	,.i_preamble       (preamble_int) 
        ,.i_data           (i_data)
        ,.i_empty          (i_empty)
        ,.i_error          (i_error)
        ,.i_sop	           (i_sop)
        ,.i_eop            (i_eop)
        ,.i_valid          (i_valid)
        ,.i_skip_crc       (i_skip_crc)
        ,.o_ready          (o_ready)
//                    
        ,.i_clk_r          (i_clk_r)
        ,.o_data           (o_data)
        ,.o_inframe        (o_inframe)
        ,.o_error          (o_error)       
        ,.o_empty          (o_empty)
        ,.o_valid          (o_valid)
        ,.o_skip_crc       (o_skip_crc)    
        ,.i_ready          (i_ready)
//
        ,.o_starts_in      (o_starts_in)
        ,.o_starts_out     (o_starts_out)   	
        ,.o_ends_in        (o_ends_in)
        ,.o_ends_out       (o_ends_out)
        ,.o_mem_underflow  (o_mem_underflow)
);
end 
else if ((EHIP_RATE == "25G") || (EHIP_RATE == "10G") )begin
	 eth_f_10g_25g_adapter_tx  #(
            .EHIP_RATE             (EHIP_RATE),
	    .READY_LATENCY         (READY_LATENCY),
            .ENABLE_ASYNC_ADAPTERS (ENABLE_ASYNC_ADAPTERS),
	    .SIM_EMULATE	   (SIM_EMULATE)
	 )i_eth_10g_25g_adapter_tx (

            .i_clk            (i_clk_r)
            ,.i_sl_async_clk_tx(i_clk_w)
            ,.i_reset          (i_reset)
//
            ,.i_valid          (i_valid)
            ,.i_data           (i_data)
            ,.i_sop            (i_sop)
            ,.i_eop            (i_eop)
            ,.i_empty          (i_empty)
            ,.i_error          (i_error)
            ,.i_skip_crc       (i_skip_crc)
            ,.o_ready          (o_ready)
                        
            ,.o_data           (o_data)
            ,.o_valid          (o_valid)
            ,.i_ready          (i_ready)
            ,.o_inframe        (o_inframe)
            ,.o_empty          (o_empty)
            ,.o_error          (o_error)
            ,.o_skip_crc       (o_skip_crc)
         );
		
         assign o_starts_in       = 'd0;
         assign o_starts_out      = 'd0;
         assign o_ends_in         = 'd0;
         assign o_ends_out        = 'd0;
         assign o_mem_underflow   = 'd0;
		
end 
endgenerate 

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "Jbn39HeDxGqNcYGZOx4Z9ucCs2oEh/b8uMkRaNvB5DRjzJrJYrpJKWFCISE85ii6tH9zuuCEo6X0af6OauTQ+Ozwk1tsZmSo/aK9UOYVqiI4L0mMLnnDyFPJBEUN+znp6d+oie84TxrwJugN/66eG6ek4cTulks0EXWtTfhwKcotsw0Xz4/SS3GVym/4tne0z9smydSL74/eJ6ocrXzqMjpfEjy1qL7mzZl6AEz+onryugoNKJAa5PuiontWULNsmQObSAkMiJlrX791TXtQrKI9om7WNtk4V9pWGqP4DN3SW7Kt90LgO8PO/Q/1Q33kBQ4tVWQVEhxDc+lrzvB7wP81bB+IvobcOwfeGxbDIaPKRy9CRri5sCpuxWzLSb9CMt20M9l1nvYPWXWQCfyWSf/1GXnMq0PJUbFO2smm71ca0Xg+O7QChDE0W3C9AsrmuoOgX1F7iyVuvzb0DDrkkq+5ch+1PVYtElGv4V1uGWWHSml0KJq9O4e8bae38iOY6UyQicAb2yV2+quiDX8sB2mfD6/cUUJ9GOpSRyz1IvWNiiFlbD8iuDWfJVHdJhxUglV7otAtpth1nylZreuo9a2OWLwKnBoHR02paVNQ2WwzRYqFoYtvKvH9mQVppZLBjYeqLyQu4ZZ/hQmSZ3STkiEohuWrUU39j8+ZO+WmNB+pV6aG0dwE80bAxA8wz342ufc1UIGna5Aomck0VTWqpPlX6lpy9Cj2ESKbthxY3rTmmkmN37cG8HOIE4XAjxXMhvZf4yeIz4k4sp2thUD/Ttguf6/aIaAPpXhYtmAOuVycsXmqicbj6aKRLzEIz4SJtnKnHC0aFSpy4+hvGmWU98yA7DSHSJQTYWey6xnq+y5KDqhWL0nrnxkBfQVjFcJJ6BwzqtCA1T1krquGNtcEU3z/d9jCdanPq/kKHdpgXfMrescBwsiSXI6zH7HN4EE+VKlrUvUj5fcbXMN6xBxXv5EyZYrBZfdVyWQS4xzu6gtB5ajbmMbl/bpTOgFwgr/p"
`endif