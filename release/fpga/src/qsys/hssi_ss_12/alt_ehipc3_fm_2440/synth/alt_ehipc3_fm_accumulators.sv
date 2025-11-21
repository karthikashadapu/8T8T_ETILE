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

module alt_ehipc3_fm_accumulator_16b_1c (
    input   logic           clear,
    input   logic           clk,
    input   logic   [15:0]  din,
    input   logic           cin,
    output  logic   [15:0]  dout,
    output  logic           cout
);

    always_ff @(posedge clk) begin
        if (clear) begin
            {cout, dout} <= 17'(din + cin);
        end else begin
            {cout, dout} <= 17'(dout + din + cin);
        end
    end
endmodule

module alt_ehipc3_fm_accumulator_32b_2c (
    input   logic           clear,
    input   logic           clk,
    input   logic   [31:0]  din,
    input   logic           cin,
    output  logic   [31:0]  dout,
    output  logic           cout
);

    logic           clear_reg;
    logic   [15:0]  din_reg;
    logic           cin_int;
    logic   [31:0]  dout_int;
    logic   [15:0]  dout_reg;

    always_ff @(posedge clk) begin
        clear_reg   <= clear;
        din_reg     <= din[31:16];
        dout_reg    <= dout_int[15:0];
    end

    alt_ehipc3_fm_accumulator_16b_1c acc0 (
        .clear  (clear),
        .clk    (clk),
        .din    (din[15:0]),
        .cin    (cin),
        .dout   (dout_int[15:0]),
        .cout   (cin_int)
    );

    alt_ehipc3_fm_accumulator_16b_1c acc1 (
        .clear  (clear_reg),
        .clk    (clk),
        .din    (din_reg),
        .cin    (cin_int),
        .dout   (dout_int[31:16]),
        .cout   (cout)
    );

    assign dout = {dout_int[31:16], dout_reg};
endmodule

module alt_ehipc3_fm_accumulator_64b_4c (
    input   logic           clear,
    input   logic           clk,
    input   logic   [63:0]  din,
    input   logic           cin,
    output  logic   [63:0]  dout,
    output  logic           cout
);

    logic   [0:1]           clear_reg;
    logic   [0:1]   [31:0]  din_reg;
    logic                   cin_int;

    logic   [63:0]          dout_int;
    logic   [0:1]   [31:0]  dout_reg;

    always_ff @(posedge clk) begin
        clear_reg[0]    <= clear;
        din_reg[0]      <= din[63:32];

        clear_reg[1]    <= clear_reg[0];
        din_reg[1]      <= din_reg[0];
    end

    alt_ehipc3_fm_accumulator_32b_2c acc0 (
        .clear  (clear),
        .clk    (clk),
        .din    (din[31:0]),
        .cin    (cin),
        .dout   (dout_int[31:0]),
        .cout   (cin_int)
    );

    alt_ehipc3_fm_accumulator_32b_2c acc1 (
        .clear  (clear_reg[1]),
        .clk    (clk),
        .din    (din_reg[1]),
        .cin    (cin_int),
        .dout   (dout_int[63:32]),
        .cout   (cout)
    );

    always_ff @(posedge clk) begin
        dout_reg[0]     <= dout_int[31:0];
        dout_reg[1]     <= dout_reg[0];
    end

    assign dout = {dout_int[63:32], dout_reg[1]};
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "saGjb1xDblePCNY2eWcU/WvrOpZ5y9L4HgH/STvXeTRjyVb5Hg3phAWHKa+Ja3uOaKCFTl5kfGSVJrSHGZIU2CdcxmhdytRqbQ0UcBPifegPrKd6dYg79K0bkZ61/NICQ+UJ9yoeMywH7wFow65pcDvjNEkGcPKTqnQsCsy/RLnS+cZK1GzMa0/iQAhI9wypwGpArU02scNBymXHbs0QD3gEL/csPen+0fxLO07kEh2RdhTo0i9amWGIMHd2ynYVX+xFoN6ynfDSa0De9X42RyoH5xQGvKOLGmYlyVm4/OuANt0obfa2AZ5ipHXZx3kkKR2u5A5hM60QXlYMPGIOpAuNqS4rDZgzqRb4YliXJ+MwyiVs5dHOi2rKe6BZF63/ec5JU6jn+u6ue/Q8Oq9karuft2iZvzpXwJEsXpStBmPP4vKTxvjVrQ1tpO3TnUK3/B3FBv+4wIM1ymB0zGx8SeJ1ichBTS60/Ssim9Vz4RRsNXFzZTjpNThDj0AzT9ugKGYt/4fj1ufj3f+CUoqJDKGbVB4tkcoD0tdWtjB3g63bMYXM003hjA8O9axOrkDZr3cjqE1tQo3eMeZx6JC3Mh4E0Vbl8UPeGLJ4+aFCE4Q+z38FqbJB/66tlAvFiToXzpwAcyurQhDMUiiCrMDkpiel6IOok+/cgiI3Y/gE1+poSX7nNJ06q8UFF0ofGM7yUXKBzuDZt66Zohg+QdSOiNrvQWJnuK6Bk9omr12isapXSwvMs+jUZKDqgppkqjV9l9OmRUkO1ZfDowINY8c4mwgowxe4s0GOkpK/uOjD71vjXDhV5wDWssXKdK2HfRfphlRYoHYd+AF3S/WCaHw0LcNd9mH6sQI/hO5SRugMI/t+IHfEBh7jk64h9enpYbPJwaounDNFxJpOSvEU7val9jDG+gDHNwSQw+kiixPuIVTOnAK51+WIbsSJxQ5FQm9qKxxxX3cJJZpIEnONMPGyKFTDxvkqEZTMMbITjchofjUGY2CstyO6g2qXuUIygjLM"
`endif