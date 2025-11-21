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

module eth_f_pointer_synchronizer #(
    parameter WIDTH = 16,
parameter SIM_EMULATE = 1'b0
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

    eth_f_bin_to_gray #(
        .WIDTH      (WIDTH)
    ) b2g (
        .bin_value  (ptr_in),
        .gray_value (ptr_gray)
    );




//`ifdef ALTERA_RESERVED_QIS
//localparam SIM_EMULATE = 1'b0;
//`else
//localparam SIM_EMULATE = 1'b1;
//`endif
 
  

intc_sync6_m #(
	.SIM_EMULATE(SIM_EMULATE) 
 ) mlab_sync (
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

    eth_f_gray_to_bin #(
        .WIDTH      (WIDTH)
    ) g2b_read (
        .gray_value (ptr_gray_sync),
        .bin_value  (ptr_out_wire)
    );

    always_ff @(posedge clk_out) begin
        ptr_out <= ptr_out_wire;
    end
endmodule

module eth_f_gray_to_bin #(
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

module eth_f_bin_to_gray #(
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
`pragma questa_oem_00 "HEQcwkIk4AJUnyybgwol/5f4LNrpC62dnM4HE75Mb8kxROzHwkOVqUjjNakwyQUVn3rWDca7QqKGruQoj2QI6diWrHBuVPm2ePzJYe0opoRKRsrSLsozd6ihfZo7Y4AobDGlA0sx1RWdC2xxmhs6EhsIEYbW0OeABq8z3YlmhZOCNJP7S54htV6uHLAYjjaGmL7pkx5+dyKYUHnNRVlphInbKBlJ9OHWSVdDlWH+1XaukIm05+vy3T9dCjLsuQZdB1a1rUd/wrKcLIXe54U7xedtWRGi/cA8utW8hbOwZ4gBeqNxxQcs02aML02IJWzh9h68Ufn7IU1Acpj/03nT2DDxR9L3FBf62dzt/wG7i2vOQVPwtBsQ34s/CeqZm9mCp2CfRB8p9oLIS6L63RTWR2e4Sf2FfGNiqmNVh+VYZrh92dL2W51Hl/LJ2ZjE2nRi4amr0yyk2fVMrUJJPiWOLqUoopDwujiroWZczNAatXOHGiUiKooCMaYDuqY+gXt1gKfjhSe4qGs4jdygnTOJeOngIhG/9YR4Zta6ZKTXK7omAhYBjA3Y9da4KIEvjimKg2W/iDe5YHaptlGq3vMJRGxYvri9J1g3UMU0NHKHLAIm6mv7Hpq4do9OKTmnOqJkWa/D1QILVr3C6nGdrPkUu2O6g/klzgCPrEy2mFDfGHDPAHXc0oVL1RwWcwfbDT+6BwiCIHXv1a2EpJo27OuvB0Sjf3gS7yp4iPD3rC1Xotw9jwTmcFQXF5Nht2rtZrzQrBuUq7jsEQl6IiSxZjJtJRYNIl+TjA4/nrahB7q0tB0d8m/yDzK/Tk4OBeMszGXeaxjHXJpW//RpgjrImvLUmZfgRTEvH/w6wj3400hqn80XrPmYjRKr/RnJGYdUOTwgrUHAKcAHUPchFw2mTDkGGCqVmKUruzByPfE94yGi0KcL/LmodKj9b949LifAvHgHf57GxjrIbg/k4EzhsClk3RGY0ptrsYu8y2WnTPVCeuw2uYmqEwGHySKNIgu1S4dS"
`endif