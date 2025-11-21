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


//------------------------------------------------------------------------------
//
// Filename         : alt_ehipc3_fm_sl_ptp_sn_clb_pulse.sv
// Author           : Shoaib Sial <shoaib.sial@intel.com>
// Created On       : Wed Sep 11/09/2019 
//
//------------------------------------------------------------------------------

module alt_ehipc3_fm_sl_ptp_sn_clb_pulse 
(
	input wire 											i_reset_n,
	input wire 											i_clk,
	input wire 											i_all_ready,
	input wire 											i_calibrate,
   input wire [31:0]                         i_apulse_period,

	output wire											o_sclk
 
);


  reg [19:0] roll_over_count;
  reg        o_roll_over_trig;


  reg   rollover_pulse_minus1 /* synthesis dont_merge */;  
  reg   rollover_pulse_minus2 /* synthesis dont_merge */;  
  wire  rollover_pulse_minus3;  
  wire [19:0] apulse_period_minus_3; 
  wire carry;
  
  assign {carry,apulse_period_minus_3}  = i_apulse_period[19:0] - 2'b11;	 
  
  assign rollover_pulse_minus3 = (roll_over_count == apulse_period_minus_3[19:0]) ? 1'b1 :1'b0;
  
 always@(posedge i_clk) 
  begin	
      rollover_pulse_minus2 <= rollover_pulse_minus3;     
  end
  
 always@(posedge i_clk) 
  begin	
      rollover_pulse_minus1 <= rollover_pulse_minus2;
  end


  assign o_sclk = o_roll_over_trig;

  always@(posedge i_clk) 
  begin	
    if(!i_reset_n)
      o_roll_over_trig <= 1'b0;
    else if (rollover_pulse_minus1)
      o_roll_over_trig <= ~o_roll_over_trig;
  end

  always@(posedge i_clk) 
  begin	
    if(!i_reset_n) 
      roll_over_count <= 20'd0;
    else if (~i_all_ready || ~i_calibrate)
      roll_over_count <= 20'd0;
    else if (rollover_pulse_minus1)
      roll_over_count <= 20'd0;   
    else
      roll_over_count <= roll_over_count + 1'b1;
  end


endmodule //


`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "zxbEFFp84WYRbJsb0HIMeuWjbOOv1K7QQFpH53Gb3V5p0ZRDdhsMAxwP11nnT9uCTG31WcRFMGv1Y3sp3Jccq/UYKIiEbrkv+dnQkRqN6m6gKWqiXtHiiORyaZNWlpsJ1uOJVOw5+WI+1xrepR1EmwGCsDi2F6K1UWIUsyOHvXTbPREtmL97zvP7WTaw1mXrLe+4BbR/6Dd7pfQ4tTt2P5iQPOMdgtxNDjbWzf8Mv5PUX1EITHPL8ebEMNvkCPpl0s2h5LrhPdmUr617IiSTRVflsWb8pQNByhDpejFVHb3ADsK86S4Et16fAv4Xcu20i26G0UPYxRaCqxrii3Al7sDxkjCiwnejKr/VPgiMgkIAHoqd8CbUwLQAQF+QKJZaCRTWFzmbOA3sKXq2XY/8CCRycpQ3UwIMuTi96hUOIPyoFp/n2xX/MDJnMEcckU0DlIg/gHAomRG6WKmgdYXBxxT83ZwTsa4SnCj11n//z9csnABNz08iQCdVdjap2xugt11VypaU/r+6z8oUJc825fR26EHeeAaISX6XMEHtk1NMZOa62XHlhJufipYnxxiLJTkcdAt14JZzCTPzN4VS43sXZEVhIKDMGA3NcpFPXIfj39h4K+VIvspmt/JoJGYv4MAEmaS6NdluUU2ZuSRqdItqHsvitYzx27eaeXuxNVeEAIUuiYLrluat58DpfIV6nrZ31Wv/dXK3VLsd4jgbU5c9hAZBQt90jGhMnWajWIQeA53v6BxWF0R84r5Vls6oiqnahph3hlhdBRXdMkaWebctDdirh3zjFd+7jgsY7+WMgu9oPw1cJGJHCJrIWW1gybqvCp64e+6y6ZE8FEdDBJFuHMo1iyHlRPZCMnNufUAs4NWVaKrF0xVtJ7VO7co0JQG29owygItUjJqHmuJxzYzvp9spJVxx1RmRPg1T54qQvuMwYnyLNNhHpUK3gKbf7xhdYWYtOLeD9yiaiGYGN51dybWusRi9PqWJ18Fv0eCPhFUKjieKtqsnM4IQL0Qy"
`endif