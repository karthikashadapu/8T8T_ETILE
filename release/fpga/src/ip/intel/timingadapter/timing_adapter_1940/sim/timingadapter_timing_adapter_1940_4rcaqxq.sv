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


// (C) 2001-2013 Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License Subscription 
// Agreement, Altera MegaCore Function License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the applicable 
// agreement for further details.

 
// $Id: //acds/rel/13.1/ip/.../avalon-st_timing_adapter.sv.terp#1 $
// $Revision: #1 $
// $Date: 2013/09/27 $
// $Author: dmunday, korthner $

// --------------------------------------------------------------------------------
//| Avalon Streaming Timing Adapter
// --------------------------------------------------------------------------------

`timescale 1ns / 100ps
// ------------------------------------------
// Generation parameters:
//   output_name:        timingadapter_timing_adapter_1940_4rcaqxq
//   in_use_ready:       true
//   out_use_ready:      true
//   in_use_valid:       true
//   out_use_valid:      true
//   use_packets:        true
//   use_empty:          1
//   empty_width:        1
//   data_width:         256
//   channel_width:      16
//   error_width:        0
//   in_ready_latency:   8
//   out_ready_latency:  0
//   in_payload_width:   275
//   out_payload_width:  275
//   in_payload_map:     in_data,in_startofpacket,in_endofpacket,in_empty,in_channel
//   out_payload_map:    out_data,out_startofpacket,out_endofpacket,out_empty,out_channel
//   fifo_depth:         16
//   fifo_depth_bits:    4
// ------------------------------------------



module timingadapter_timing_adapter_1940_4rcaqxq #(parameter SYNC_RESET = 0)
(  
 output reg         in_ready,
 input               in_valid,
 input     [256-1: 0]  in_data,
 input     [16-1: 0]  in_channel,
 input              in_startofpacket,
 input              in_endofpacket,
 input              in_empty,
 // Interface: out
 input               out_ready,
 output reg          out_valid,
 output reg [256-1: 0] out_data,
 output reg [16-1: 0] out_channel,
 output reg          out_startofpacket,
 output reg          out_endofpacket,
 output reg          out_empty,
  // Interface: clk
 input              clk,
 // Interface: reset
 input              reset_n

 /*AUTOARG*/);

   // ---------------------------------------------------------------------
   //| Signal Declarations
   // ---------------------------------------------------------------------
   
   reg  [275-1:0]   in_payload;
   wire [275-1:0]   out_payload;
   wire            in_ready_wire;
   wire            out_valid_wire;
   wire [4:0]      fifo_fill;
   reg [1-1:0]   ready;   

   // ---------------------------------------------------------------------
   //| Payload Mapping
   // ---------------------------------------------------------------------
   always @* begin
     in_payload = {in_data,in_startofpacket,in_endofpacket,in_empty,in_channel};
     {out_data,out_startofpacket,out_endofpacket,out_empty,out_channel} = out_payload;
   end

   // ---------------------------------------------------------------------
   //| FIFO
   // ---------------------------------------------------------------------                           
   timingadapter_timing_adapter_1940_4rcaqxq_fifo timingadapter_timing_adapter_1940_4rcaqxq_fifo 
     ( 
       .clk        (clk),
       .reset_n    (reset_n),
       .in_ready   (),
       .in_valid   (in_valid),      
       .in_data    (in_payload),
       .out_ready  (ready[0]),
       .out_valid  (out_valid_wire),      
       .out_data   (out_payload),
       .fill_level (fifo_fill)
       );

   // ---------------------------------------------------------------------
   //| Ready & valid signals.
   // ---------------------------------------------------------------------
   always @* begin
      in_ready = (16 - fifo_fill > 8);
      out_valid = out_valid_wire;
      ready[0] = out_ready;
   end
generate if(SYNC_RESET == 0) begin

end
else begin
reg internal_sclr;
always @ (posedge clk) begin
internal_sclr <= reset_n;
end

end
endgenerate

endmodule


