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

module alt_ehipc3_fm_pointer_synchronizer #(
    parameter WIDTH = 16
) (
    input   logic             clk_in,
    input   logic [WIDTH-1:0] ptr_in,

    input   logic             clk_out,
    output  logic [WIDTH-1:0] ptr_out
);

    logic [WIDTH-1:0] ptr_gray;
    logic [WIDTH-1:0] ptr_gray_reg;

    logic [WIDTH-1:0] ptr_gray_s1;
    logic [WIDTH-1:0] ptr_gray_s2;
    logic [WIDTH-1:0] ptr_gray_sync;

    logic [WIDTH-1:0] ptr_out_wire;

    alt_ehipc3_fm_bin_to_gray #(
        .WIDTH      (WIDTH)
    ) b2g (
        .bin_value  (ptr_in),
        .gray_value (ptr_gray)
    );




 
  

intc_sync6_m_fm mlab_sync (
			   .din_clk(clk_in),
			   .din(ptr_gray),
			   .dout_clk(clk_out),
			   .dout(ptr_gray_sync)
		   );
			   

/* -----\/----- EXCLUDED -----\/-----
    always_ff @(posedge clk_in) begin
        ptr_gray_reg    <= ptr_gray;
    end

    always_ff @(posedge clk_out) begin
        ptr_gray_s1     <= ptr_gray_reg;
        ptr_gray_s2     <= ptr_gray_s1;
        ptr_gray_sync   <= ptr_gray_s2;
    end
 -----/\----- EXCLUDED -----/\----- */

    alt_ehipc3_fm_gray_to_bin #(
        .WIDTH      (WIDTH)
    ) g2b_read (
        .gray_value (ptr_gray_sync),
        .bin_value  (ptr_out_wire)
    );

    always_ff @(posedge clk_out) begin
        ptr_out <= ptr_out_wire;
    end
endmodule

module alt_ehipc3_fm_gray_to_bin #(
    parameter WIDTH = 8
) (
    input   logic   [WIDTH-1:0] gray_value,
    output  logic   [WIDTH-1:0] bin_value
);

    genvar i;
    generate
        for (i = 0; i < WIDTH; i=i+1) begin : bit_loop
            assign bin_value[i] = ^gray_value[(WIDTH-1):i];
        end
    endgenerate
endmodule

module alt_ehipc3_fm_bin_to_gray #(
    parameter WIDTH = 8
) (
    input   logic   [WIDTH-1:0] bin_value,
    output  logic   [WIDTH-1:0] gray_value
);

    genvar i;
    generate
        for (i = 0; i < (WIDTH-1); i=i+1) begin : bit_loop
            assign gray_value[i] = bin_value[i] ^ bin_value[i+1];
        end
        assign gray_value[WIDTH-1] = bin_value[WIDTH-1];
    endgenerate
endmodule

`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "saGjb1xDblePCNY2eWcU/WvrOpZ5y9L4HgH/STvXeTRjyVb5Hg3phAWHKa+Ja3uOaKCFTl5kfGSVJrSHGZIU2CdcxmhdytRqbQ0UcBPifegPrKd6dYg79K0bkZ61/NICQ+UJ9yoeMywH7wFow65pcDvjNEkGcPKTqnQsCsy/RLnS+cZK1GzMa0/iQAhI9wypwGpArU02scNBymXHbs0QD3gEL/csPen+0fxLO07kEh0yAtM6zjb4pRTvFtSCKnvBBl0Yg+eTuCUWT9Pd5M0AhNVGxXaiJovdEh+PMvG5TjFjkQUHdRq/gms1KYVDstjsrNLWLAy6JcMMln5RR2ESolhZpCZzc80Bih+BdU3SavqRVNdPI4bBngw6RMUzcvC1HfH1p2DDin8tXuWSZVDbqid9F+htW//5WX+jIZH6JTRzchEQNyMcbTSjgbGh3pN0TjfGwbr4irNUCx5wRU9O8nb+y46gt+as+hIukKWUVpg/imRdB7z/NEUind6JnDoQQZWz6Iy6+tryM/9oHE2utpz1OfGnieAT9c28bxJ6iJPJuNtq2DjriaelnpLsZddu7r6MO14PK9xyuhE7WUWP4mf4FJTKsD3qt6IQXUV+z4ZbJpaSjbuurJf8EvH6stoc7aW+R3DmSOItuPXrR6Kp85Wvo7ZB//y1HeCVV13rfFn6Il0MlJmi95U4ffXGgXMcXzpbeG1+JxPPevfrFil+01sZ4Rkvz01vmmCFxvgyUqtQ6FnWx6TdNR44OgAd6CKOvYsm1H2VYy+DIL0jslLSF9B/1oE0UmX6tBEHnVwdIaoltiNlD1rHwV865WGGtKIGEJq6zR0gtexQjVF4H6iyH221aU+ZIaYOOQw4+42iWJ2UfQRN0kV7JI9jkelE9qdBAoDWCgsVXudIUwB6A8cae4yaHy92NN5iv0HU5HRZgT2xv0WJ/KqyMEJVpN2GlPvHtg0ttJmxxNHtd6uNCBLKoHEZPjEUX/XUWqywzckAUb/IOPCTJjvz6iGqwYXDC/sW"
`endif