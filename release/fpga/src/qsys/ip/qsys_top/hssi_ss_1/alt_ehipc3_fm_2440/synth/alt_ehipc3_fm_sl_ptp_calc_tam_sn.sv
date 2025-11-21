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


`timescale 1ns / 1ns
module alt_ehipc3_fm_sl_ptp_calc_tam_sn #(
    
)(
    
    input  logic        i_clk,
    input  logic        i_rst_n,
    input  logic [95:0] i_tx_tam,
    input  logic [95:0] i_rx_tam,
    input  logic [31:0] i_tx_tam_adj,
    input  logic [31:0] i_rx_tam_adj,
    input  logic        i_req_tx_tam_load,
    input  logic        i_req_rx_tam_load,
    
    output logic        o_tx_tam_valid,
    output logic        o_rx_tam_valid,
    output logic [95:0] o_tx_tam,
    output logic [95:0] o_rx_tam
);

// ---------------------------------------------------------------------------------------------------------------------------------
// 10/Dec/2018 : slim35 : https://hsdes.intel.com/appstore/article/#/2205692107 : Crete 3 hard logic costs too much soft logic.
// Reduce alt_ehipc3_fm_sl_ptp_compute_ts_sn pipeline from 12 to 4 and hence the param needs to be revised.
// ---------------------------------------------------------------------------------------------------------------------------------
//localparam PIPE_STAGE = 12;
localparam PIPE_STAGE = 4;
// ---------------------------------------------------------------------------------------------------------------------------------

logic [PIPE_STAGE-1:0] tx_tam_valid_p;
logic [PIPE_STAGE-1:0] rx_tam_valid_p;

logic [95:0] calculated_tx_tam_stage1;
logic [95:0] calculated_rx_tam_stage1;

alt_ehipc3_fm_sl_ptp_compute_ts_sn ptp_compute_ts_tx (
    .i_clk (i_clk),
    .i_rst_n (i_rst_n),
    .i_valid (1'b1),
    .i_correction_value (i_tx_tam_adj),
    .i_input_ts (i_tx_tam),
    .o_corrected_ts (calculated_tx_tam_stage1)
);

alt_ehipc3_fm_sl_ptp_compute_ts_sn ptp_compute_ts_rx (
    .i_clk (i_clk),
    .i_rst_n (i_rst_n),
    .i_valid (1'b1),
    .i_correction_value (i_rx_tam_adj),
    .i_input_ts (i_rx_tam),
    .o_corrected_ts (calculated_rx_tam_stage1)
);

always @(posedge i_clk) begin
    if(!i_rst_n) begin
        tx_tam_valid_p <= '0;
        rx_tam_valid_p <= '0;
    end
    else begin
        tx_tam_valid_p <= {tx_tam_valid_p[PIPE_STAGE-2:0], i_req_tx_tam_load};
        rx_tam_valid_p <= {rx_tam_valid_p[PIPE_STAGE-2:0], i_req_rx_tam_load};
    end
end

assign o_tx_tam_valid = tx_tam_valid_p[PIPE_STAGE-1];
assign o_rx_tam_valid = rx_tam_valid_p[PIPE_STAGE-1];

assign o_tx_tam = calculated_tx_tam_stage1;
assign o_rx_tam = calculated_rx_tam_stage1;

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "saGjb1xDblePCNY2eWcU/WvrOpZ5y9L4HgH/STvXeTRjyVb5Hg3phAWHKa+Ja3uOaKCFTl5kfGSVJrSHGZIU2CdcxmhdytRqbQ0UcBPifegPrKd6dYg79K0bkZ61/NICQ+UJ9yoeMywH7wFow65pcDvjNEkGcPKTqnQsCsy/RLnS+cZK1GzMa0/iQAhI9wypwGpArU02scNBymXHbs0QD3gEL/csPen+0fxLO07kEh0fdbWVqnT8jvhmocRGkB5ox7PO3q//zt8moEwyng7suqP4w6o2uVD1NM6OVtTITwiSp4wTbUNH6xcMxczbt4wR/0XrADTZTbI7Z2CBzuTENgF3NTGR5+ArrR3a8EjcbddZyb7hmBOO4PvwQigOeh55Qaex2VndT4RA+dN2/zRZ67SOMGIuK0pZBVkIFgonb33ioxWDX3Z1jR4OknAdBe3IbrF1gX8Z+hWKDC23MSR11kyK76aUIPh/p/efWsBoOVtD2aGaqvWX3Fj1BEdRo4c1cOk5gVMCKiIg7TnLYtVZWG5APyVLyqcpVimEXo/EijD8GBD2XelIJp5eUz7sg4WzZvFW+ctwPklID0+qgYGof+Qp0LQYiexC/vnblP35SpMRMs17D+jZGA8DhuHqwHlmDijIvVTBnX3aSPybqT20fkrqMh2I5cIvY3Phf4k1O6zTc8jWy5a6FE6Eo7WRUoXAzV82pvegAk8kz0BUI+ROmv/w6HIjztO+XY6yQ1pu2mjtMpgkJ9kQBLfeg+lraHBHKBP09ESzmffFBSYkX9dCOGTMJQlhi5DJHfhr+lM/9KYXWh4BCFNkVQ5jyDZY/VX7/yzJXoXSj0ITjCxaozpnx36X0Xcv+OYYTpXyQhIGPrBTlnna3Pr5wbo61cLMexmmnVSe9GEWxbGZ+CjLjwwF7x7SR5jsI+QICjpjZ07OcCwxotYOwEtXJiHxODLdJm7pmRiJUymKrgCeMGaKnwReAP98eQNpZRBGTeO/6dpbyobChb7ewvfx9HyhaFOq8lMm"
`endif