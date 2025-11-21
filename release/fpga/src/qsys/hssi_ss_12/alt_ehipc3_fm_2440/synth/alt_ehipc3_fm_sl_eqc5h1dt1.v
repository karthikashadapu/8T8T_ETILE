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
// 5 bit val == const(1d) equality comparator.  Latency 1.

module alt_ehipc3_fm_sl_eqc5h1dt1 #(
    parameter SIM_EMULATE = 1'b0
) (
    input clk,
    input [4:0] din,
    output dout
);

wire dout_w;

alt_ehipc3_fm_sl_lut6 t0 (.din(6'h0 | din),.dout(dout_w));
defparam t0 .MASK = 64'h0000000020000000;
defparam t0 .SIM_EMULATE = SIM_EMULATE;

reg dout_r0 = 1'b0;
always @(posedge clk) dout_r0 <= dout_w;

assign dout = dout_r0;
endmodule

`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "sj2EnSVIknGz65j61L+DMMO3HDcSN2jhvr55koJ1ECJkPtG0Fw9q9R2fIYYgv2BPR8BrsR+RYKuIJjlYQNmgnXVjvtJtJool3uQURgCFpQL23pok+Wr2TXSNbySMdXxV2gz6CwxUk+0+/rDLrsroCzkAiFw2amgz6Do5tJQltYjCIPqHFj/3UZep9T4dBvB83T//SpBFZzgCz+Lzrx+1A17RXSmjyar6SF3JSJg+7B0BQAXWulgBLu1V1j5QnCKWSV7zPCW2hTpOt+dOx069dI7EydmpC3ZzDc5DadHTVfqDiarEOMrtZkGw5d7dt5P8p/G8kUqxjfsYPJLskJINf8HoJMHPggjwefGg5iqISkqwDotAVZVN6sdL6JD9TlNVCcMSplZTRVAArs3Pxh03XinwCBHhDF+MdQ61VoKFxt9Qp4XsQcGNdv19x5rJcG7CfJBzBm9VX52cJdvNCD4CG48Wi/vB2/vhM62nuCG0G/sYv+E1fkB2P7uCXr3m+yKhlPdrXaS8KlP3e9mB6di665e3QJOV/ZV7N7WE5S5LHSe95Alpw3+d3p+axjPZRWt5baxt02YWWlK22IG1h0E6iv84WJoiAWgunHkMNSVl4Q83X/EVz4SBRvEUXtr86yvb70Jtj0gMyRhNKqiFna0FGwpWZF6RJNnbg2EaprrXmx8O2mB2zK1wW1Qw2oSEcSAvDcMYT79IPtXEB/7KbciKUkR+5R9BIgLCEBvDWqOMxptk/hpORtLEFaN81iHl3p2egWejt0MhQNAMiE+vR2/V7QOXhPMI0RolAr2KPtZboIb6edaeLHikYIocaqxRIASxpbc0VNsX8qDzHgZV+DH3NXXRHBCTJ0DgkOzncM1cMQ6HV1daX1gJrPZZj6vGQA4qkDxLfBI/XmkW8Hj3uFvF9rDl6RONaFGjSzRA4OQQQ+d6a+Wnc+hCGOAqSTSxYYC+JBEWzTMVbPf1vgtVw/CLwfMK4AQR14sv4BOfx3T2zVbEMo0+3AE2L8fMQp5POf3S"
`endif