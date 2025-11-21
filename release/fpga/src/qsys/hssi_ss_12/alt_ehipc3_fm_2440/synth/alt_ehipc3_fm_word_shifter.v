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

module alt_ehipc3_fm_word_shifter #(
    parameter WIDTH = 8
) (
    input                   clk,
    input                   din_valid,
    input   [2*WIDTH-1:0]   din,
    input                   shift,
    output                  dout_valid,
    output  [2*WIDTH-1:0]   dout
);

    reg [WIDTH-1:0]     data_mem;
    reg [2*WIDTH-1:0]   dout_reg;
    reg                 dout_valid_reg;

    always @(posedge clk) data_mem <= din_valid ? din[WIDTH-1:0] : data_mem;
    always @(posedge clk) dout_valid_reg <= din_valid;

    always @(posedge clk) begin
        if (din_valid) begin
            if (shift) begin
                dout_reg[2*WIDTH-1:WIDTH]   <= data_mem;
                dout_reg[WIDTH-1:0]         <= din[2*WIDTH-1:WIDTH];
            end else begin
                dout_reg <= din;
            end
        end else begin
            dout_reg <= dout_reg;
        end
    end

    assign dout = dout_reg;
    assign dout_valid = dout_valid_reg;
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "saGjb1xDblePCNY2eWcU/WvrOpZ5y9L4HgH/STvXeTRjyVb5Hg3phAWHKa+Ja3uOaKCFTl5kfGSVJrSHGZIU2CdcxmhdytRqbQ0UcBPifegPrKd6dYg79K0bkZ61/NICQ+UJ9yoeMywH7wFow65pcDvjNEkGcPKTqnQsCsy/RLnS+cZK1GzMa0/iQAhI9wypwGpArU02scNBymXHbs0QD3gEL/csPen+0fxLO07kEh3lV4riZYZNtpCFPSoU4QTiJQhrvPFBDaebVqQL/aq5LTw9087V7YuWTldH3BlPZD1gHXwNKfA8ci6iPyCR1cuh1gV3KPnKMXXfRZIhcA4oXkEFtnK9+iTVoA7o/7uZjzhzDkafqTDm6iRcoxXOUmE56bsFaISqrlL5ZoKp7Ka5H80Cy0fqWSG2Cja9os/GIkMV9pB21nEeTnQ/na65NX/2Gr9Vl+4MrrTEYR2ohfdIx6CN6gReQnI8u+IfnenwRiAJTqaVqftmLyDO+4ZZ737Oh/CRAthUZyIgPZ3V9REfXi9aeWFc6Ib0jT1RfMPcHlH0xAPOWZ2Awv9lwtFPBrD0JsWqrueVpmEqkiRd08C4ipqIPFMCdgGJSsa1YPKPEg4sWgPcWk6E4KTIRCPR4pjABODKIs3yBMmRPOISWMsbdnIX3TOa8cvfaYwbrGqsTx3XvyRxxk1SNezuHwWWiiqt1MAY8wOYSzuZMKDsxEIKEvEP5bREddwlydkHFD4YabRbMYDgkZ9wynSVdG7hXZxetPk/JSk9V6SyiH1tGQtJp6jsOrj+0A1F/Dy249/DFCPUPXXbgjCveuTdGtgW3HfEhSjT8weaqwq31p5PwxQjsX53HdoANuGLMBi8wJrXLtQGPwif+WUtdWzjaSh3erGV5tKQ22hMzc2d/dStEZ01OBNcUFQEgMNOiCv3l0ZVC1Kes2MirvWUTNYb653GBMi8J0B7E+Wzt4OQaHEcvs3tkEY9bL9QW8EGv/OnMzrzZNTx8j9Hr5/6FADvi99GIRsh"
`endif