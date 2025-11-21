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

module eth_f_sl_adapter_rx #(
    parameter WORD_WIDTH    = 64,
    parameter EMPTY_BITS    = 3,
    parameter PTP_WIDTH     = 1,
    parameter NUM_CHANNELS  = 1
) (
    input   [NUM_CHANNELS-1:0]                    i_clk,
    input   [NUM_CHANNELS-1:0]                    i_reset,

    // Client interface
    output  [NUM_CHANNELS-1:0][WORD_WIDTH-1:0]    o_data,
    output  [NUM_CHANNELS-1:0]                    o_valid,
    output  [NUM_CHANNELS-1:0]                    o_sop,
    output  [NUM_CHANNELS-1:0]                    o_eop,
    output  [NUM_CHANNELS-1:0][EMPTY_BITS-1:0]    o_empty,
    output  [NUM_CHANNELS-1:0][5:0]               o_error,
    output  [NUM_CHANNELS-1:0][39:0]              o_status,
    output  [NUM_CHANNELS-1:0][PTP_WIDTH-1:0]     o_ptp,

    input   [NUM_CHANNELS-1:0]                    i_valid,
    input   [NUM_CHANNELS-1:0][WORD_WIDTH-1:0]    i_data,
    input   [NUM_CHANNELS-1:0]                    i_inframe,
    input   [NUM_CHANNELS-1:0][EMPTY_BITS-1:0]    i_empty,
    input   [NUM_CHANNELS-1:0][1:0]               i_error,
    input   [NUM_CHANNELS-1:0]                    i_fcs_error,
    input   [NUM_CHANNELS-1:0][2:0]               i_status,
    input   [NUM_CHANNELS-1:0][PTP_WIDTH-1:0]     i_ptp
);

    genvar i;
    generate
      for (i=0; i<NUM_CHANNELS; i++) begin: gen_fav
        // Convert to soft IP interface (EOP, SOP, valid)
        eth_f_sl_if_to_avalon #(
          .WORD_WIDTH (WORD_WIDTH),
          .EMPTY_BITS (EMPTY_BITS),
          .PTP_WIDTH  (PTP_WIDTH)
        ) i_ehip_if_to_avalon (
          .i_clk        (i_clk),
          .i_reset      (i_reset),
          .i_data       (i_data[i]),
          .i_empty      (i_empty[i]),
          .i_error      (i_error[i]),
          .i_fcs_error  (i_fcs_error[i]),
          .i_status     (i_status[i]),
          .i_valid      (i_valid[i]),
          .i_inframe    (i_inframe[i]),
          .i_ptp        (i_ptp[i]),

          .o_data       (o_data[i]),
          .o_valid      (o_valid[i]),
          .o_sop        (o_sop[i]),
          .o_eop        (o_eop[i]),
          .o_empty      (o_empty[i]),
          .o_status     (o_status[i]),
          .o_error      (o_error[i]),
          .o_ptp        (o_ptp[i])
        );
      end: gen_fav
    endgenerate

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "Jbn39HeDxGqNcYGZOx4Z9ucCs2oEh/b8uMkRaNvB5DRjzJrJYrpJKWFCISE85ii6tH9zuuCEo6X0af6OauTQ+Ozwk1tsZmSo/aK9UOYVqiI4L0mMLnnDyFPJBEUN+znp6d+oie84TxrwJugN/66eG6ek4cTulks0EXWtTfhwKcotsw0Xz4/SS3GVym/4tne0z9smydSL74/eJ6ocrXzqMjpfEjy1qL7mzZl6AEz+onr4L3awYPUD+kKuUVxx/UGw7cib0v/0W2uyvRNS1vBa4nFJEYqvhEJw9tTfU3vmrT4by7sd7k+Liib519ZSfJKxHrjMj2LbJD5Upp2ZbY0a+qvbm6cFizsAXJKYVhTA8Wvints0fFPKfjeC9j0SI9UxTscTZZDuCS647UAaCGHmRFWT9CuXmSII7lCjxQm2/Wf7o4XXJFgJccbgAwlped0BzWerKeEzbylAWosWlr+4+U5sXretKurj5KutyXV3ocAsSDoRAdFej2X5bGKFOP+QQcEZ1D/4q5L4mrLfgv9czfP5aTLuYg/63k4FekGj9CvvByFAMgQ/BhLdqbcpSU4uR/QFd7WKX3GjIQr8WCCXLmQrhZYwScMjJnMjxsQ8e4QhZV36rVDupqL7ESIh4+Bj1+t3N68K0uAT2GquSZR3tmQ8T/rZnfiY5H2f562EATvCiGm0M8zMBmdr63nSpuFWmZik2L+N5ZZ1V5PBFoQMVFQ9fePMZc4pazE9Sdcsu7Ogw8fvQ13lI99/8L9ktDMr4RqC+GVnfkMyMpjG5Ig5ilo8qss/7ykCnsFh7SxmqQQIZ97JFNpy10iyxD+hhue2jkc40Ce/3kXaoStLvQvEOssAUnudof8xlYcPSV7b34tLXy5RzoZCqrxqe0NufXiJokGlUAL/9FDvZ9LBqfLzPEn1AJRomS7/YIsVOfB8XwD3wLDOW3J9tZO7Ze7Xhb83QYzNihUQYN8CXxyQCV7cL6wjgMqWVZOnmiF7hcEeiuioVwm8Z3JAch7IpfaYUwE4"
`endif