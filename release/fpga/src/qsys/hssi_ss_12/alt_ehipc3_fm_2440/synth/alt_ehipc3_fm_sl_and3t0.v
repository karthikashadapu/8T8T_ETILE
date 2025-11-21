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
// 3 input AND gate.  Latency 0.

module alt_ehipc3_fm_sl_and3t0 #(
    parameter SIM_EMULATE = 1'b0
) (
    input [2:0] din,
    output dout
);

alt_ehipc3_fm_sl_lut6 t0 (.din({1'b1,1'b1,1'b1,din}),.dout(dout));
defparam t0 .SIM_EMULATE = SIM_EMULATE;
defparam t0 .MASK = 64'h8000000000000000;

endmodule

`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "iNcmQeM5R+2wXyQcrIvK9Aed2O3DNv4QGFTpmcaGURS3nf96+gCegtWg50e6rleWE64VT4+790Ghs95mog/VHoEYybDIGn5EoWfqpEPzBOW06ogVsMbRm79acU6L09a0INNw7swJhWgHQdzl07TrCbOuFN5j/YV4soVomm30RbpyPicKqaC/jMGdl00awWTRKYI/LlUWB2031x5qz4fwVbhj6DvZKYVLlQLmylj6M7tO5zgRwzUxHJUdbYqolkfXa3eHheoIqET0aOCw5G+0gjNTtqAU1tW7Bd939Y9fRVbSwlfoEYaRPx/PRVlfVo2jipDlyJry5lmlVuYAArkRquNWzLYee2ADFGKDbPn/HrAo3QnbblqxuVHZ50AYIvTJT+KiwI2ChLMaVUB9DlBJRIFN+cbDqjMvKBnQzeHu+pOypIyM294jeZu5/xYb2Thc5Q9x1qy4UoHF1n4mZ74cVfzGNeGVcz+Bz4PDkUa0hZTQVBOuHUtKs7j5YvJ3hTTnRBhvHb1u6JIOFcBMsWfZxpp0PuRzKsdwpt7Du+T4YpUJxw2PxgHwjfGMcZi19Ou6NX4GVzY2sNVhwbKCUYfHtgx6nzI1gBey+H5S1XcWWKBWQjysx/G/cZ0/7WRXQX2jqkKzPK0hgQcuvS0nFMmGGuw7sGv9AXwGag09uNmpnzcTPIx3PmckFaTNdsh83TLq4kQvusxsE3ldvZ/E13bDRcrLlSGnm83+s42M+ey4UBshRRgw2CwVA559rwnGtRBS0hl8QJJmUyqxaMjqsL0mqsrCp3fnW1WpQA5docOiZ+MfsFwFmGe5Bglf+k/tDEnrlvXmTp0y27XS5wMYvd2N+szxhz4yiMkbzVF4sca5N2HCWzFmKifdT0rVjvVsGX1k0ftHzZWLqLufqc83xSGyIc4GgZE78lSfk500W9V6QKKP1fUKkXiK/N9OK9PROBwsW2N+Q8zrrXsDt6EqoEiV9M6B1t+X507J9WtAvm3ss+u+27bKccKl14KbkU78eRBK"
`endif