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
// 2 bit val + const(0) adder.  Latency 1.

module alt_ehipc3_fm_sl_addc2h0t1 #(
    parameter SIM_EMULATE = 1'b0
) (
    input clk,
    input [1:0] din,
    output [1:0] dout
);

//////////////////////////////////////////
// 2 zeros fall through on the bottom
wire [1:0] doutz;
reg [1:0] doutz_r0 = 2'b0;
always @(posedge clk) doutz_r0 <= din[1:0];

assign dout[1:0] = doutz_r0;

//////////////////////////////////////////
// 0 bits remain
endmodule

`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "iNcmQeM5R+2wXyQcrIvK9Aed2O3DNv4QGFTpmcaGURS3nf96+gCegtWg50e6rleWE64VT4+790Ghs95mog/VHoEYybDIGn5EoWfqpEPzBOW06ogVsMbRm79acU6L09a0INNw7swJhWgHQdzl07TrCbOuFN5j/YV4soVomm30RbpyPicKqaC/jMGdl00awWTRKYI/LlUWB2031x5qz4fwVbhj6DvZKYVLlQLmylj6M7tMBfqNiEWVznH0NREPWX75dezRWa7BHlP5NU/glAiSrSRGyJQz+V6UNho5DXcVvprsWBkv5ORDfaRn6ce3bgJgZrqpc4lXOP3xnkpPuv2ptjRtb4+mldgHfvBQWcPpQpdDdfwCwMHySN3XLMGbltWL9D+MZHsZkNuEEcAQLtwu5x7OsAYID/fwf1YlWRFIkj60ob1MY7DHzJSk6KhzLYd4IxrcNxwEAT23k76VeMmaVB/rFGqQvGvOJ0VeVTUSVwlX1GpqN712xZeAy/YN2PtIMlERVZBrkBNQQx8oAtHTIogpWBbf0XbOHhO6mEeSmFOuNtk9iPMTtAyC+4Gx26ytUSFZJzzcJTK+eNSGpQON1MbrSNAFnDNT4TYZbKpqSwpaIStO1NcvVV4JdALifWHAZ149nhF7ARHZxJ1B4m+WuWn8RalzIbFYgRHoJnm6iZO7a5t+L4mjbbsp/+j+lzaGJei8gCTVdKW+8ndZXBYMMJyFgi/Buba81BvgO/dMK9SffIpoqeWdtv7zaOrzLK0htY8RXr1KruXux3X4+euPpdQLAuN4N2GYkR/wG/gWKzsp9Hrz/aYQyBoMZPyEDvIeuvmWQibDHEe1pk2tkfK/J+H9cOnGtIIT8eCSwej7YAULDZ602fd+K26vECYkDIIhktFQb93fIK7qyEkPeGRFjQnpYpkSOnbQjYjBfUe+HuifkFZ27LMVpuDHxYVHaO3qUEN/ngwdcgMLjrgTI5kUcMmR8+gXk9AORLso0ILwr/OjoTIZj3CjdakmCW62Ng4z"
`endif