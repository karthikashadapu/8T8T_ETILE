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




`timescale 1ps/1ps

// DESCRIPTION
// 2 input OR gate.  Latency 1.

module alt_ehipc3_fm_sl_or2t1 #(
    parameter SIM_EMULATE = 1'b0
) (
    input clk,
    input [1:0] din,
    output dout
);

wire dout_w;
alt_ehipc3_fm_sl_or2t0 c0 (
    .din(din),
    .dout(dout_w)
);
defparam c0 .SIM_EMULATE = SIM_EMULATE;

reg dout_r = 1'b0;
always @(posedge clk) dout_r <= dout_w;
assign dout = dout_r;

endmodule

`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "sj2EnSVIknGz65j61L+DMMO3HDcSN2jhvr55koJ1ECJkPtG0Fw9q9R2fIYYgv2BPR8BrsR+RYKuIJjlYQNmgnXVjvtJtJool3uQURgCFpQL23pok+Wr2TXSNbySMdXxV2gz6CwxUk+0+/rDLrsroCzkAiFw2amgz6Do5tJQltYjCIPqHFj/3UZep9T4dBvB83T//SpBFZzgCz+Lzrx+1A17RXSmjyar6SF3JSJg+7B187hcRZtv+HEu2/eHlJn8bSlb5i18SpyrdVjtV0oUKSzI2gdEVQpxhGf6JhSg0EVKc0YCAghHnWNG5O+zC/t9w6e7wsnSXmQzDZw5I2V4zYFUTaS4lB/3AJO3n+QzIsZvfG/+66SNyf73EzOIA8OEDw5pJ6nsaLfR5iKtXIK+giTiMFGXtSmMQ6eJupbU+rUnCpiUw+ysIrO135nBfXmcYk4s3oAeq6/9tsdpi+flfV3Iqm9IMXduqhhDje1jtILisLe+SqUdQs4IA8BeB19SNDDhwlP4A+V+S8jcUkj7KB7Lmo4aOuDHEbxn57reprw2d6meKc38MF7Ynk4yhTc0TuAPawvZ/Ztx67ozpe/2B3xsyb8q/XKE00DiWXlMJh+fZvJCkxelNKvUWMkB2ZEF9gJGk+KbRbTOD/xZG0zZy3rPhthIX0dUc1ZmUZ7XNbIVlD6hklufu2TGw48FO+XQPNKXnu2xa2CUTKZCiW76nS7CfPhSI1uExqjdi9SofvwlTTxAXayjSo6yyOaCg2BRyUGIljvR+ztamxzVjTitn/eHdqHNDPO5/C+/vqxNCuVUdL8PpNRLmVlSbOqjKgjJRAxoJCXd82tFvKfFXXs1F5qrspJN6zCejrC/2gb4KBVdElFd4MB/w6PE5ujD2tPQAiH0DCrOKumLbNuJGay3r9a0/m2sW2RMwmpEtqC/wvUFBMVdsnuzjCY2q7AtI6aDPzSR/UsF6xGqMtO6u/1/lVjQKYCLzR8nB9Ojm369SjGayZ4ShDfu23VcRKDIjcd6z"
`endif