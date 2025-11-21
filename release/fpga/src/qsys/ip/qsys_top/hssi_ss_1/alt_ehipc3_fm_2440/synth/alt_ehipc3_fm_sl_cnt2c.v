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
// 2 bit counter.

module alt_ehipc3_fm_sl_cnt2c #(
    parameter SIM_EMULATE = 1'b0
) (
    input clk,
    input sclr,
    output [1:0] dout
);

wire [1:0] dout_w;

alt_ehipc3_fm_sl_lut6 t0 (
    .din({6'h0 | dout | ({6{sclr}} & 6'h20)}),
    .dout(dout_w[0])
);
defparam t0 .MASK = 64'h0000000055555555;
defparam t0 .SIM_EMULATE = SIM_EMULATE;

alt_ehipc3_fm_sl_lut6 t1 (
    .din({6'h0 | dout | ({6{sclr}} & 6'h20)}),
    .dout(dout_w[1])
);
defparam t1 .MASK = 64'h0000000066666666;
defparam t1 .SIM_EMULATE = SIM_EMULATE;

reg [1:0] dout_r = 2'b0 /* synthesis preserve dont_replicate */;
always @(posedge clk) dout_r <= dout_w;
assign dout = dout_r;

endmodule

`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "iNcmQeM5R+2wXyQcrIvK9Aed2O3DNv4QGFTpmcaGURS3nf96+gCegtWg50e6rleWE64VT4+790Ghs95mog/VHoEYybDIGn5EoWfqpEPzBOW06ogVsMbRm79acU6L09a0INNw7swJhWgHQdzl07TrCbOuFN5j/YV4soVomm30RbpyPicKqaC/jMGdl00awWTRKYI/LlUWB2031x5qz4fwVbhj6DvZKYVLlQLmylj6M7t40mcbRZCA9RBfqS3ei7RBUZxTKzZJa1lcZRrv5j6hQchaNAJn0lu9OS6ShG++KMWBb9ZyS3qMP782tai6QZUMJ+069/GHg3jeBCz2egItqOTmMKJJuO2uPYIaYLrCFQ+akRI/JNwZYVbdduL+Eq7IbuwLhejqNL5PLfVXAkLWOcuwYILhICSbXhIiV3qSuDaO8xbfoCsrpVwJiQvqniSSccpSVpZoUaQkG0szgKuwu/U0Sv6/7X6kucI0CTKioLagXHtY7WFarLmBcWsXfxVWB1U+BQR4ToRkmwBtehhHX4ZoLSm1L7NZS6NI6lpahPRMJL8rsCgcqpsu8DcBmMYSFgQTc+i8QvHq0h0mRCFbcEQJmEYY9RtgwJpCDOy3G3dweC6VYmMq+a2v8jIxRC7QRaWT9wE+YAAfEsMpY5EfwVDrikUBifSW0qZq7kQT3itIqRAb+2Pkn8LrVtJmLdUDQp5umXLgDGDR5J46b/1sBvxaRrAbxlw1L61DQ1KypfYJWMfm02vDQInntbn0z0FoCWfmvuPflaFGJzRH2bU0PTVPdPF3qC4hpy8GwtjfM9xNcG6uh7AxVTPXE3TjXjgBGAYV6nrjA3K0p5F7dUvO0h1M0v9OTU2oZVNUJ9J++IDxHiwCQwiWTkyFXMsYG/RBMnRjkcdZvgj3wpBYjws4ecqN+FkPTtTOyRnpbRNA//61lGNTYhEi6nhtJCWnb6goct6VTGAirZkxUHxNFTzCT5m45U6paM1vlsWtAZsjeYwBbaYnjabRoqU5eV+4wdNw"
`endif