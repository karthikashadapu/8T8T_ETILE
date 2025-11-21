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

module alt_ehipc3_fm_delay_reg #(
    parameter CYCLES = 3,
    parameter WIDTH = 1
) (
    input              clk,
    input  [WIDTH-1:0] din,
    output [WIDTH-1:0] dout
);

    genvar i;
    generate
        for (i = 0; i < WIDTH; i=i+1) begin : bit_loop
            alt_ehipc3_fm_delay_reg_1b #(
                .CYCLES (CYCLES)
            ) delay_1b (
                .clk    (clk),
                .din    (din[i]),
                .dout   (dout[i])
            );
        end
    endgenerate
endmodule

module alt_ehipc3_fm_delay_reg_1b #(
    parameter CYCLES = 1
) (
    input   clk,
    input   din,
    output  dout
);

    generate
        if (CYCLES == 0) begin
            assign dout = din;
        end else if (CYCLES == 1) begin
            reg state;
            always @(posedge clk) state <= din;
            assign dout = state;
        end else begin
            reg [CYCLES-1:0] state;
            always @(posedge clk) state <= {din, state[CYCLES-1:1]};
            assign dout = state[0];
        end
    endgenerate
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "saGjb1xDblePCNY2eWcU/WvrOpZ5y9L4HgH/STvXeTRjyVb5Hg3phAWHKa+Ja3uOaKCFTl5kfGSVJrSHGZIU2CdcxmhdytRqbQ0UcBPifegPrKd6dYg79K0bkZ61/NICQ+UJ9yoeMywH7wFow65pcDvjNEkGcPKTqnQsCsy/RLnS+cZK1GzMa0/iQAhI9wypwGpArU02scNBymXHbs0QD3gEL/csPen+0fxLO07kEh3QQqcW7QWey/RUx+VF8Yw9wfhsPg86pUFmq13eR48dRneHbe1mawf1qfv1LTDI5bd9A9xMyDi3lj7IIXFaRQhHponvhmbuTuqJEN3Yuoint5Dt+4YrGtjHkeCnNTXhdK0PWs0omYNGQAfLIqrUG0JA2ZxIQJGflsDK9bfJX4zEuv38x1r5BK8igx0xPhYlNrkTWIXAWGrbLRaqcUTtwZeuzz9aM6WeoNxX1tfO39rFZs9O7h2zErodvRK3Qvf2pqHdHGAKhwlI9+IO74bl+wyg+P+4PetcDvFPoK0Mrs9NemX0gsJs0SQEyy1la8Jcar9HM/yWHFoF7H10TIO8GgR91I3aHDufYlfkUF0bH7OPcqM8E59X/sXGyJL0FTF4EBCHyLX0Lg6+9AYsXy4FaC2ZabsDL9wz+B3dSQK9+mGM9alhuLlHVcFAcH4ppDBHY/z9VcooiFh/vAojZzsVsCIZpay5uQYH+Z6GgMrIx+0tS+89AaezygGS6Bo1GjhbE5YN3dV827+ENbaFUteaOrvmWyZoBJ8cqZdcvxcqxXx5qUXobwgEG4NS7nsVdR4xR1ubeRgcZy9NyDkbauv+rBFnqp7/yNgx3EEAEA8t6VbZJaR/7RDPmWK+7i5KqGxgElILoKtqJbkUueEQRxg7L6KwjhllewUJy8PFmzkUsylCGPZptPZVXNl0lL/BbDsUa5G/Fz0TEjz9DsqGQPmJY7f5Td809EarD+VEfYp1vHYPxfywaHgnAQBJOJSluvmFOHgrEmUO0CMiywe7TLYN+Q8Y"
`endif