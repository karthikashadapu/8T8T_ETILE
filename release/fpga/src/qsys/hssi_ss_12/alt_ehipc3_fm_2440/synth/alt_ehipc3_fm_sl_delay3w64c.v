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
// Delay 64 bit words by 3 cycles.

module alt_ehipc3_fm_sl_delay3w64c #(
    parameter SIM_EMULATE = 1'b0
) (
    input clk,
    input sclr,
    input [63:0] din,
    output [63:0] dout
);

wire [1:0] wptr;
alt_ehipc3_fm_sl_cnt2c ct0 (
    .clk(clk),
    .sclr(sclr),
    .dout(wptr)
);
defparam ct0 .SIM_EMULATE = SIM_EMULATE;

wire [1:0] rptr;
alt_ehipc3_fm_sl_subc2h0t1 sc0 (
    .clk(clk),
    .din(wptr),
    .dout(rptr)
);
defparam sc0 .SIM_EMULATE = SIM_EMULATE;

wire [63:0] dout_w;
alt_ehipc3_fm_sl_mlab64a2r1w1 m0 (
    .rclk(clk),
    .wclk(clk),
    .waddr(wptr),
    .din(din),
    .raddr(rptr),
    .dout(dout_w)
);
defparam m0 .SIM_EMULATE = SIM_EMULATE;


reg [63:0] dout_r = 64'b0;
always @(posedge clk) dout_r <= dout_w;
assign dout = dout_r;
endmodule

`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "iNcmQeM5R+2wXyQcrIvK9Aed2O3DNv4QGFTpmcaGURS3nf96+gCegtWg50e6rleWE64VT4+790Ghs95mog/VHoEYybDIGn5EoWfqpEPzBOW06ogVsMbRm79acU6L09a0INNw7swJhWgHQdzl07TrCbOuFN5j/YV4soVomm30RbpyPicKqaC/jMGdl00awWTRKYI/LlUWB2031x5qz4fwVbhj6DvZKYVLlQLmylj6M7vUEwIa6BUA7T19aeGiWpPFCIIXAg5vWKksYD9/9g8OoBTcC93MVEfGaMpqe2gtWySyq+jSbyMzQx6zxGfb/VYKekOn9+/LXSwyD/Z9q85q8CI4YQE450f3JwQnU054DZQtZy4gaZvT5j3JCazOvBrJgr3s6dysODa2Zd1UwOuAmU+uCg0An4i01epdQmTVoy+u+ruUvb094NByip4y3T109y8LQnr94CjEGJp2hEj9BS8WMQv9IfJI0ORtYT04HMFBE3pqAYAyyCVW5mOsYjP/+uUuTZKLCptySKWezRws69wxhqsJABiuFqJp/lZA8IQDgLfj8Kcv+H3OZmHeumgAsRlFTlyoYenHG1InX8YlsWJJdAum62psRyuCBb13PvGrDZqV+9FjWSDUtCn5/aDCdi0htzhdjyIv8JC6duojvWtE/qiOjSjkTv/hESUW1i0j6W2nV5+ZcKcsUvtTA1ojnX8G5HGwhNcPWzYLisun653ZXSddDfD4qz5DCHB91Lk7CVeMCv4UV+XapTqsbh/OKwzifvMiN7FSEZiBr7XzYBlO+cPqwYC6FJi0Zpdu6XCjQBtCyuRv15G0RsG7Bq0SZTVUdGqRfn0e8lQY7oXmg8GY3p0Rqf8zvGqR6ElZhNa4lTR5Z/ZEX80697yg/0fGwWBa1WMcfmyQwbO9wPCt1ROS/4+lWV0y9WaV5pWJM1EEQFDrPJ+xpEx5xeQbLUHZKH/3z7eq/wFMhsJq3ZE2yr7orTq9sQ1dckuTbteIeuktNWOlA30Q7Akg1e+ragEm"
`endif