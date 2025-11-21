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


// Clock Monitors

module eth_f_clock_mon
  #(
    parameter SIM_HURRY   = 1'b0,
    parameter SIM_EMULATE = 1'b0
    )
   
   (
    input wire 	      csr_clk,
    input wire 	      clk_tx,
    input wire 	      clk_rx,
    input wire 	      clk_pll,
    input wire 	      clk_tx_div,
    input wire 	      clk_rec_div64,
    input wire 	      clk_rec_div,

    output reg [31:0] clk_tx_khz,
    output reg [31:0] clk_rx_khz,
    output reg [31:0] clk_pll_khz,
    output reg [31:0] clk_tx_div_khz,
    output reg [31:0] clk_rec_div64_khz,
    output reg [31:0] clk_rec_div_khz          
    
    );
   
//// output mapping is as follows - 000		, 101			,100		,011	,010	,001	   
wire [7:0] mon_clocks = {2'b00, clk_rec_div, clk_rec_div64, clk_tx_div, clk_pll, clk_rx, clk_tx};  
reg [2:0] mon_clock_sel = 3'b000;
wire mon_clock_rate_fresh;
wire [15:0] mon_clock_rate;
eth_f_fmon8 fm0 (
    .clk        (csr_clk),
    .din        (mon_clocks),
    .din_sel    (mon_clock_sel),
    .dout       (mon_clock_rate),
    .dout_fresh (mon_clock_rate_fresh)
);
defparam fm0 .SIM_HURRY   = SIM_HURRY;
defparam fm0 .SIM_EMULATE = SIM_EMULATE;

always @(posedge csr_clk) begin
    if (mon_clock_rate_fresh) begin
        if (mon_clock_sel == 3'b101)
            mon_clock_sel   <=  3'b000;
        else
            mon_clock_sel   <=  mon_clock_sel + 1'b1;
    end
end

reg [31:0]  clk_unused_khz;

//moving the 5th input to 0th mapping of the mux as the previous value is latched for the new mux value inside eth_f_fmon8
always @(posedge csr_clk) begin
    if (mon_clock_rate_fresh) begin
        case (mon_clock_sel)
            3'b000:  clk_rec_div_khz          <=  {16'b0, mon_clock_rate};
            3'b001:  clk_tx_khz          <=  {16'b0, mon_clock_rate};
            3'b010:  clk_rx_khz         <=  {16'b0, mon_clock_rate};
            3'b011:  clk_pll_khz      <=  {16'b0, mon_clock_rate};
            3'b100:  clk_tx_div_khz     <=  {16'b0, mon_clock_rate};
            3'b101:  clk_rec_div64_khz   <=  {16'b0, mon_clock_rate};
            default: clk_unused_khz      <=  {16'b0, mon_clock_rate};
        endcase
    end
end

endmodule // eth_f_clock_mon
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "Jbn39HeDxGqNcYGZOx4Z9ucCs2oEh/b8uMkRaNvB5DRjzJrJYrpJKWFCISE85ii6tH9zuuCEo6X0af6OauTQ+Ozwk1tsZmSo/aK9UOYVqiI4L0mMLnnDyFPJBEUN+znp6d+oie84TxrwJugN/66eG6ek4cTulks0EXWtTfhwKcotsw0Xz4/SS3GVym/4tne0z9smydSL74/eJ6ocrXzqMjpfEjy1qL7mzZl6AEz+onr8/58RYKb5Xq+avW0UcTziSt1sYlkmKS2lztQ57cYP/go/enyHAe8yndM0e2o/PyuTLhCR/qu4Rw7lbwZzElY/XNICHHJ460eRP78tsHRKsEGkWDz36rqp5CGH8dyxkDCjTnH3/vArfaQZtvnom3XGyDBqY9tjAj0Ms6sc7Qc+Byd9WUF10OTYFmurHxCwynHTLxOTJLTRQWjtMxFjtMj3T9Qv1x8IIw6yqsllwZwCv+OsbcnEOCcPDGuatWTDztBTwKza4fbnSFYcTYA/vJl77k7X3mCTMar/94/7mtgFt08kFaQtZWThNanenusxlaG85yfVJ7n7eI4cByNBjSC60Z2QzqX8pt60pq41Nvbj7djsSbHVY1kM9dafkkD808t3HOdUuX+TpcRk6FRQChTfdf7uhcGx3nQAvmHJniuWP5QgA/XzrAK75c5h3QK/ZT5yiFK/nC4jELaEwMFbDlvYDKbm4Hiad2r5Xqcb8m8OMpMEbvvD6JjNocCNONuDy3g6wNtkmTweebAYh3kDkdSYOteDYReLFWBSGS5YQNPOWo/XD+HPfGTgeTnMKsXrHDeiQXhiLF3DGNHMf3hfh5jE1HlJQT73ctoJpSH7XeqEcMH6wJv/itnn2j0FBu/zMAhBD+jIAwtkjcycRAupxircgnc+xGlHJEOxD74EUbcV/uVp9Ik0w9SQcvz3LDS2PQ+lpNb+SkoYxDXep2PzvkjUaE0ePN2C8dYXsdFIJ6ZzF/MZLQ4QJFjcBnkPXs6j25M3J61es65GnuAzoMMwwpMk"
`endif