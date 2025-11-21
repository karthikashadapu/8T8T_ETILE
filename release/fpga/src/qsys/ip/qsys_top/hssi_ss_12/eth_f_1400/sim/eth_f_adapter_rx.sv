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
module  eth_f_adapter_rx #(
	parameter EHIP_RATE             = "100G",
    parameter MASK_VALID            =   1,
    parameter ENABLE_ASYNC_ADAPTERS = 1,
	parameter PREAMBLE_PASSTHROUGH  = 0,
	parameter O_DATA               = (EHIP_RATE=="100G")? 512 :(EHIP_RATE=="50G" || EHIP_RATE=="40G")? 128 : 64,
	parameter IN_LANE              = (EHIP_RATE=="100G")? 4 :(EHIP_RATE=="50G" || EHIP_RATE=="40G")? 2 : 1,
	parameter IN_LANE_ERR          = (EHIP_RATE=="100G")? 4 :  1,
	parameter EMPTY_BITS           = (EHIP_RATE=="50G" || EHIP_RATE=="40G") ? 4 :(EHIP_RATE=="100G") ?  6 : 3
)(

    input   logic               i_arst,
    input   logic               i_clear_counters,
    input   logic               i_clk_r,
    output  logic  [63:0]       o_dropped_frames,
    output  logic  [O_DATA-1:0] o_data,
    output  logic               o_valid,
    output  logic               o_sop,
    output  logic               o_eop,
    output  logic  [EMPTY_BITS-1:0]        o_empty,
    output  logic  [39:0]       o_status,
    output  logic               o_status_valid,
    output  logic  [5:0]        o_error,
    output  logic  [63:0] 	o_preamble,

    input   logic               i_clk_w,
    input   logic  [0:IN_LANE-1]        i_inframe,
    input   logic  [0:IN_LANE-1][63:0]  i_data,
    input   logic                       i_valid,
    input   logic  [0:IN_LANE-1][2:0]   i_empty,
    input   logic  [0:IN_LANE_ERR-1][1:0]   i_error,
    input   logic  [0:IN_LANE_ERR-1]        i_fcs_error,
    input   logic  [0:IN_LANE_ERR-1][2:0]   i_status,
    input   logic  [15:0]       i_min_frame_octets,
    
    // wire to ptp_adapter_rx
    output  logic  [0:IN_LANE-1]    o_dbg_filtered_if,
    output  logic                   o_dbg_filtered_if_valid

);

generate
if ((EHIP_RATE == "100G") || (EHIP_RATE == "50G") || (EHIP_RATE == "40G")) begin
         eth_f_100g_50g_adapter_rx #(
            .MASK_VALID           (MASK_VALID),
            .EHIP_RATE            (EHIP_RATE),
            .ENABLE_ASYNC_ADAPTERS(ENABLE_ASYNC_ADAPTERS),
            .PREAMBLE_PASSTHROUGH (PREAMBLE_PASSTHROUGH)
	 )i_eth_f_100g_50g_adapter_rx(
           .i_arst           (i_arst)
           ,.i_clear_counters(i_clear_counters)
           ,.i_clk_r         (i_clk_r)
           ,.o_dropped_frames(o_dropped_frames)
           ,.o_data          (o_data)
           ,.o_valid         (o_valid)
           ,.o_sop           (o_sop)
           ,.o_eop           (o_eop)
           ,.o_empty         (o_empty)
           ,.o_status        (o_status)
           ,.o_status_valid  (o_status_valid)
           ,.o_error         (o_error)
           ,.o_preamble      (o_preamble)
           ,.o_dbg_filtered_if       (o_dbg_filtered_if)
           ,.o_dbg_filtered_if_valid (o_dbg_filtered_if_valid)
                 
           ,.i_clk_w         (i_clk_w)
           ,.i_inframe       (i_inframe)
           ,.i_data          (i_data)
           ,.i_valid         (i_valid)
           ,.i_empty         (i_empty)
           ,.i_error         (i_error)
           ,.i_fcs_error     (i_fcs_error)
           ,.i_status        (i_status)
           ,.i_min_frame_octets (i_min_frame_octets)

 );
end
else if ((EHIP_RATE == "25G") || (EHIP_RATE == "10G"))  begin
	 eth_f_10g_25g_adapter_rx #(
		 .ENABLE_ASYNC_ADAPTERS(ENABLE_ASYNC_ADAPTERS)
	 
	 ) i_eth_f_sl_rx_adapter (
             .i_clk              (i_clk_w)
             ,.i_sl_async_clk_rx (i_clk_r)
             ,.i_reset           (i_arst)

             // Client interface
             ,.o_data            (o_data)
             ,.o_valid           (o_valid)
             ,.o_sop             (o_sop)
             ,.o_eop             (o_eop)
             ,.o_empty           (o_empty)
             ,.o_error           (o_error)
             ,.o_status          (o_status)

             ,.i_valid           (i_valid)
             ,.i_data            (i_data)
             ,.i_inframe         (i_inframe)
             ,.i_empty           (i_empty)
             ,.i_error           (i_error)
             ,.i_fcs_error       (i_fcs_error)
             ,.i_status          (i_status)
     ); 
     assign o_dropped_frames = 64'h0;
     assign o_status_valid   = o_valid & o_eop;
     assign o_preamble       = 64'h0;
     assign o_dbg_filtered_if       = 'd0;
     assign o_dbg_filtered_if_valid = 'd0;
end 
endgenerate

endmodule 
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "Jbn39HeDxGqNcYGZOx4Z9ucCs2oEh/b8uMkRaNvB5DRjzJrJYrpJKWFCISE85ii6tH9zuuCEo6X0af6OauTQ+Ozwk1tsZmSo/aK9UOYVqiI4L0mMLnnDyFPJBEUN+znp6d+oie84TxrwJugN/66eG6ek4cTulks0EXWtTfhwKcotsw0Xz4/SS3GVym/4tne0z9smydSL74/eJ6ocrXzqMjpfEjy1qL7mzZl6AEz+onq0K2JWHn/m8+EGEuuZ/ybfuIpcT3ciP6cmaZCd4vWcG15I99ivBpttszgTJESZ/vhoWi5A4cH1BxIkAUdiQRDNovPd7vVOOh3u71HqzqGzp4HhSsQkrihgkXlqwUhXq7tBw+DE+oMLGuv29CirxFSLvmqWNfo39454nVlXSmvTX1SdK3yy5RhWOP1Nq8rI3ixNZuZLzfBUWTnwRdqtiBnuLLT/mQfhr2rYhEPS8jf84NgGCfph8ssTmnl4WBVtz/qnMIelF4Ty2Ll0xmTdfj3z5IHwyu48WbOz3AwmPgz2V1V9OayKQ/mnfXIOA+AmJae+I/xrGyYPEXQQ8T6hPfiE79c+EdahU32Ute8f37YebaZ55pnss83CY9hsObvjCdIpobdKiscFslqXoj5O0T02sOwisHqOHRX/pa8jvY6kFbh2ur1TYtdh3xS1pb1dJtkHSb1pi8gpEIZM/dmEtyh15t7vVayhYFeHFoTsDYumnKD3t3MZJDCIhGcLLbXgfFI3GmuSLHBPHQyHzNIj+lHVlVjI3ReoYeQ5Qx16MDMLuMo6j6oAhKqHAtC8px4vqsk5SUjXzllpPbu9InWdQt24D6dJGxmr6VVLdmfGLaZ76csp7P2+w6csb4uIQ6NF4UEtLh62JAywsIMsZojAAprNNmkTyAlv9RaD4FOya9BmHnJxKPIoHAyf9kydqdN59TKh6zUYPnllza1ieBBEk1nFC14HwGRN8QaG8aeAFpYoZoGM/0LWo8FHYaO+bLSt95SihuP04KdGGE4FHFDcYbuo"
`endif