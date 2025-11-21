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
// 2 input AND gate.  Latency 1.

module alt_ehipc3_fm_sl_and2t1 #(
    parameter SIM_EMULATE = 1'b0
) (
    input clk,
    input [1:0] din,
    output dout
);

wire dout_w;
alt_ehipc3_fm_sl_and2t0 c0 (
    .din(din),
    .dout(dout_w)
);
defparam c0 .SIM_EMULATE = SIM_EMULATE;

reg dout_r = 1'b0;
always @(posedge clk) dout_r <= dout_w;
assign dout = dout_r;

endmodule

`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "iNcmQeM5R+2wXyQcrIvK9Aed2O3DNv4QGFTpmcaGURS3nf96+gCegtWg50e6rleWE64VT4+790Ghs95mog/VHoEYybDIGn5EoWfqpEPzBOW06ogVsMbRm79acU6L09a0INNw7swJhWgHQdzl07TrCbOuFN5j/YV4soVomm30RbpyPicKqaC/jMGdl00awWTRKYI/LlUWB2031x5qz4fwVbhj6DvZKYVLlQLmylj6M7vk1/bahE3cNs75Hi3C+sDLubqqwQl3CdqtLzBt4gjlGzuHARg0LL6xltsFk5/vVo9uzz6XsOVrDkREEPNICdfaAYll2XfGhUv65DHXwEORxaBYFNm2T5WAgphTUX4DZ31rurKgVYSxqriqsGVuXEM0RrrVgjtkYlLDnPQyPZ7Ga3WmTeeH0ndNkBnokTrJ0z5SfdtanyXgVQNMwiEzA9BeWfEJWt2jHw5xumZDwhv7b0c36fVqfiGpIJqup96S3vy6cfE8+wGc2cf0FFa5I/PNxkOSufo7sO6UXoThj/1zMQyZ2//HL4tKf6AS9wpyZCS5L8pWNzSeUdrKmrNKG9B5GmQiYFzCf/w/MoR5ZRDX+uNpp5PKUR6sMsTiAIL8fLEtijgmwCu8ynl5QngXXdK3epPAafg0YBDr6NEraIACQ7R/g7m5aNYpj0e5/tir59uKAFiEXkHiFZXi+IEWdfJln1BU0YBK5W1iSK6adMT5VFVKsoLTTrVl7ij0pUUx6lBWvKSe88qE0AaseS5LX6KXOkjGmfjDzfHaDLRntaF9yx6YVY4FPnqM1s4JVYrMAyDhEv4fU46YMSaWss4useeYOixwtMsEn2TlkoU3+zjkFLGNJusocLKB7qza13uBAx25EYDAqzHUvr8hyQUZ4ZHlY+7zPccyO5/zj58SWIXn5Dg7wzlnXaDRyA3Qt903OenrBRHT+g0SMcwxzs3NKtZQV5rLXl0ZO0Fc9mOyiEJeY4Kf3Jna34HwQfhBg9jxSA7xTn85YrhghFO2fXGOvPj0"
`endif