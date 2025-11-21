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


// -------------------------------------------------------
// Reset Sequencer Block
// - Stage the reset assertion or de-assertion of reset
// - This block contains a sequenced counter that walks through each bit 
//   and set a pulse according to sequence
// -------------------------------------------------------

`timescale 1 ns / 1 ns

module altera_reset_sequencer_seq
#(
    parameter NUM_OUTPUTS = 'd3,
    parameter MAX_OUTPUTS = 10,
    parameter USE_QUAL  = 10'h0,
    parameter SEQUENCER_EN = 'd1,
    parameter DELAY0  = 'd1,
    parameter DELAY1  = 'd2,
    parameter DELAY2  = 'd3,
    parameter DELAY3  = 'd4,
    parameter DELAY4  = 'd5,
    parameter DELAY5  = 'd6,
    parameter DELAY6  = 'd7,
    parameter DELAY7  = 'd8,
    parameter DELAY8  = 'd9,
    parameter DELAY9  = 'd10
)
(
    // --------------------------------
    // Clock and reset
    // --------------------------------
    input clk,
    input reset,

    // --------------------------------
    // Interface with main sequencer
    // --------------------------------
    input                       enable,
    output reg                  done,

    // --------------------------------
    // CSR inputs
    // --------------------------------
    input [MAX_OUTPUTS-1:0]     csr_seq_ovr,
    input                       csr_seq_next,
    output reg                  csr_wait_sw,

    // --------------------------------
    // Input control from external 
    // - (this is used to control sequencing instead of timer)
    // - based on USE_QUAL qualification
    // --------------------------------
    input [MAX_OUTPUTS-1:0]     in_qual,

    // --------------------------------
    // Output (Level track signal used to drive the set term of output resets)
    // --------------------------------
    output reg [MAX_OUTPUTS-1:0]     track_out
);

  localparam COUNTER_W  = 10;
  localparam TRACK_W    = 10;

  logic bypass_sequencer;
  logic [MAX_OUTPUTS-1:0] track, track_q;
  logic csr_wait_sw_q1,csr_wait_sw_q2,csr_wait_sw_nxt;

  assign bypass_sequencer = (SEQUENCER_EN == 0) ;

  altera_reset_sequencer_dlycntr #( .DELAY(USE_QUAL[0]? 1 : DELAY0), .USE_QUAL(USE_QUAL[0]) ) dlycntr0 (
    .clk (clk), .reset(reset), .qual(in_qual[0]), .sw_ovr(csr_seq_ovr[0]), .sw_qual(csr_seq_next),
    .cntr_en(bypass_sequencer? 1'b0: enable)   , .count_done(track[0]) );
  altera_reset_sequencer_dlycntr #( .DELAY(USE_QUAL[1]? 1 : DELAY1), .USE_QUAL(USE_QUAL[1]) ) dlycntr1 (
    .clk (clk), .reset(reset), .qual(in_qual[1]), .sw_ovr(csr_seq_ovr[1]), .sw_qual(csr_seq_next),
    .cntr_en( (NUM_OUTPUTS>1)? track[0]:1'b0) , .count_done(track[1]) );
  altera_reset_sequencer_dlycntr #( .DELAY(USE_QUAL[2]? 1 : DELAY2), .USE_QUAL(USE_QUAL[2]) ) dlycntr2 (
    .clk (clk), .reset(reset), .qual(in_qual[2]), .sw_ovr(csr_seq_ovr[2]), .sw_qual(csr_seq_next),
    .cntr_en((NUM_OUTPUTS>2)? track[1]:1'b0) , .count_done(track[2]) );
  altera_reset_sequencer_dlycntr #( .DELAY(USE_QUAL[3]? 1 : DELAY3), .USE_QUAL(USE_QUAL[3]) ) dlycntr3 (
    .clk (clk), .reset(reset), .qual(in_qual[3]), .sw_ovr(csr_seq_ovr[3]), .sw_qual(csr_seq_next),
    .cntr_en((NUM_OUTPUTS>3)? track[2]:1'b0) , .count_done(track[3]) );
  altera_reset_sequencer_dlycntr #( .DELAY(USE_QUAL[4]? 1 : DELAY4), .USE_QUAL(USE_QUAL[4]) ) dlycntr4 (
    .clk (clk), .reset(reset), .qual(in_qual[4]), .sw_ovr(csr_seq_ovr[4]), .sw_qual(csr_seq_next),
    .cntr_en((NUM_OUTPUTS>4)? track[3]:1'b0) , .count_done(track[4]) );
  altera_reset_sequencer_dlycntr #( .DELAY(USE_QUAL[5]? 1 : DELAY5), .USE_QUAL(USE_QUAL[5]) ) dlycntr5 (
    .clk (clk), .reset(reset), .qual(in_qual[5]), .sw_ovr(csr_seq_ovr[5]), .sw_qual(csr_seq_next),
    .cntr_en((NUM_OUTPUTS>5)? track[4]:1'b0) , .count_done(track[5]) );
  altera_reset_sequencer_dlycntr #( .DELAY(USE_QUAL[6]? 1 : DELAY6), .USE_QUAL(USE_QUAL[6]) ) dlycntr6 (
    .clk (clk), .reset(reset), .qual(in_qual[6]), .sw_ovr(csr_seq_ovr[6]), .sw_qual(csr_seq_next),
    .cntr_en((NUM_OUTPUTS>6)? track[5]:1'b0) , .count_done(track[6]) );
  altera_reset_sequencer_dlycntr #( .DELAY(USE_QUAL[7]? 1 : DELAY7), .USE_QUAL(USE_QUAL[7]) ) dlycntr7 (
    .clk (clk), .reset(reset), .qual(in_qual[7]), .sw_ovr(csr_seq_ovr[7]), .sw_qual(csr_seq_next),
    .cntr_en((NUM_OUTPUTS>7)? track[6]:1'b0) , .count_done(track[7]) );
  altera_reset_sequencer_dlycntr #( .DELAY(USE_QUAL[8]? 1 : DELAY8), .USE_QUAL(USE_QUAL[8])) dlycntr8 (
    .clk (clk), .reset(reset), .qual(in_qual[8]), .sw_ovr(csr_seq_ovr[8]), .sw_qual(csr_seq_next),
    .cntr_en((NUM_OUTPUTS>8)? track[7]:1'b0) , .count_done(track[8]) );
  altera_reset_sequencer_dlycntr #( .DELAY(USE_QUAL[9]? 1 : DELAY9), .USE_QUAL(USE_QUAL[9]) ) dlycntr9 (
    .clk (clk), .reset(reset), .qual(in_qual[9]), .sw_ovr(csr_seq_ovr[9]), .sw_qual(csr_seq_next),
    .cntr_en((NUM_OUTPUTS>9)? track[8]:1'b0) , .count_done(track[9]) );


  // ----------------------------------------------------
  // Output control signals
  // ----------------------------------------------------

  assign done = bypass_sequencer? enable : track[NUM_OUTPUTS-1];

  always_ff @(posedge clk or posedge reset) begin
    if (reset)  begin
        track_q         <= '0;
        csr_wait_sw_q1  <= '0;
        csr_wait_sw_q2  <= '0;
    end
    else if (!enable) begin
        track_q         <= '0;
        csr_wait_sw_q1  <= '0;
        csr_wait_sw_q2  <= '0;
    end
    else begin
        track_q         <= track;
        csr_wait_sw_q1  <= csr_wait_sw_nxt;
        csr_wait_sw_q2  <= csr_wait_sw_q1;
    end
  end

 logic [MAX_OUTPUTS-1:0] track_pulse;
 assign track_pulse = ~track_q & track;

  assign csr_wait_sw_nxt =  ~done & ~|track_pulse &
                            (   enable   & ~track[0] & csr_seq_ovr[0] |
                                track[0] & ~track[1] & csr_seq_ovr[1] |
                                track[1] & ~track[2] & csr_seq_ovr[2] |
                                track[2] & ~track[3] & csr_seq_ovr[3] |
                                track[3] & ~track[4] & csr_seq_ovr[4] |
                                track[4] & ~track[5] & csr_seq_ovr[5] |
                                track[5] & ~track[6] & csr_seq_ovr[6] |
                                track[6] & ~track[7] & csr_seq_ovr[7] |
                                track[7] & ~track[8] & csr_seq_ovr[8] |
                                track[8] & ~track[9] & csr_seq_ovr[9] );

  assign track_out = track |  (bypass_sequencer? {MAX_OUTPUTS{enable}} : '0);

  assign csr_wait_sw    = csr_wait_sw_q1 & ~csr_wait_sw_q2; // set pulse

endmodule


`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "4XeedYC2d5cuadvCJho763aSSkl1DRkxkQvoksMJv2VSpzATyoN8DqHo//teYnH8r162T4uH+BCa200GxyJP31cBno1sEsJk77E+qkjc8lZYjykrG0EIfQmjezkrpycnghQBNehMvorEdlwQS1QrIwscD7jaPxEU/CLR7ot04MotVla9fxGEAryOoaYgp4YUIXkzbQ53M3Az+ttWfnaiDklcQ3ejpqjMrKcwpwFZLna2MQc1QUN3XhluRG41sRZA9SKOghe8uxSYXd84uIqhRC8r8u75oHdDqBd/jvepWFdbeVuhqPwvyiAyjFR99T+XPmJw/e32Czjv5lyqfgh/1ZsDd/cQ2eFdcMm2b6iij6aYFlvNsKkZn/c2V+BQpO3jZZ1ZuhV7JkylQ9wjnn24o7ged5RYIrD97WFqISq6OsifqppRFyPo3vo/Asmu5kT2qZ1B0J3yeG3GlsgbDsh7xPsU+yOs5K6s1D7lYKYOWThQ7hDkJiQmzMdG7o2y9PtJVxRl8O4neIaQG8s5nPwxYK9lpHjT97NHAjzYv24BAaB3KfQHGEg3eqnpEjv8Z2ob7nDWgUYZURu+J9XE2dmYCas16rZSNQo9ZX4M3x9omSFeW7HTKCMG384tuLbvha+IEw9Ajxlz8Uth/ldwOJQVQObK7R4lWSWPVcvKF3WhEi1JU02U8zyPcurGHXMNybZLFMRkv7zTENkfPB47ciHJDEVNWFOQqQljyuN8HT5puQmI2XQMYnKfA8TohvOrSvkgagEdRwLNsymJwHzdjUlc2JA6gHTT/xNZmAB4DpA683vV8OG4BODpIrkRh7jUob723uPkX//nv35yW85VakpdqQIBFqM7TJZkYx7RzqB7oLvrtkYC5W6DCbz3AylnNniU5LesyObndanZ6IOTi3ngumTBQCej0rrJBrczIgzEyps2NNoMNEQVOTdT3fXNHtx27lrLfj1788K4rb99CGGGbKlS5uT4VI/aYQRWBjuTllTDhoiVkj6r3cI1j4Tm+c3J"
`endif