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


// ---------------------------------------------------------------
// Module : Reset sequencer delay counter
// - This blocks counts until saturation value DELAY when cntr_en is high.
// - When cntr_en is low, the counter is reset and back to initial state.
// - qual - this is a signal used to saturate this counter immediately.
//        - this is expected to be used only when DELAY is not used.
// - sw_ovr/sw_qual - this is a software overwrite that is used to 
//                  - control this counter directly
// ----------------------------------------------------------------
`timescale 1 ns / 1 ns

module altera_reset_sequencer_dlycntr #(
    parameter USE_QUAL = 0,
    parameter DELAY = 8
) (
    input       clk,
    input       reset,
    input       cntr_en,
    input       qual,
    input       sw_ovr,
    input       sw_qual,
    output reg  count_done
);

logic [31:0] counter;
logic       count_reached;

assign count_reached = (counter == DELAY);
assign count_done    = count_reached & cntr_en;

always @(posedge clk or posedge reset) begin

    if (reset)
        counter <= '0;
    else if (!cntr_en)
        counter <= '0;
    else if (!count_reached) begin
        counter <= sw_ovr ? ( sw_qual? DELAY : '0 ) : 
                            USE_QUAL? ( qual ? DELAY : '0) : 
                                      counter + 1'b1;
    end
end

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "4XeedYC2d5cuadvCJho763aSSkl1DRkxkQvoksMJv2VSpzATyoN8DqHo//teYnH8r162T4uH+BCa200GxyJP31cBno1sEsJk77E+qkjc8lZYjykrG0EIfQmjezkrpycnghQBNehMvorEdlwQS1QrIwscD7jaPxEU/CLR7ot04MotVla9fxGEAryOoaYgp4YUIXkzbQ53M3Az+ttWfnaiDklcQ3ejpqjMrKcwpwFZLnZa4JlNjk+/E+OKIMBHtH3spg6LReL0kQ2gcXNFlxV1gXm0shSrjNwe/APjuNrf6aD4bWrfUBmFA8KJ8DGELFT5ZjxEGAlytQwqWp0u6qqOQ163zPVJLzt5ypZhmknI9aXu7OdpiAle/UP3DKCzJjBo6noydgjkukl0DBGay1cdjbpwkINqvX/Vm7MM0cpR8z+smrbK7lNtludAQPkaMRDHdPL+bHM+OXJb3PEpxrIyA+Ne/2h5i033MsjpXx/0HTFtLr9C2LU06ofya22D2Jv1OIgpW+sDafQhitgAmI7x+2ZoVlUxdJ+Q1KR1Wuv7avy4jv43ULvby/5AREAPbKJGpp2LtuWb3vqkHHIyk9Aq4kwyJXTGPsYmriMDKyLSR0AsA3vrTHgwnRhbFj4YSL25ezfF3DMETrco9ckBIMKtdEw7Z0k2bxgxUENJ3qpCebuWMY0Jomdo350FbsOeO34N7X8EK5CMC99ihz6HBJ6Ht3RPRpiH7xLsqsI22j4vXKlB3Tmhi0B06PsMJrS1amSVYQxjO3daR0Ci88kkuX5OWR6XT7aHTSf9nAS1xngv/iYbw/a36KDB5lR0yNwInd129xmTUU0ed+mnYZNn6eK4XkgaEBm1sqgE7ZidfBZwn9IZCYzhdjhSzM/eLiHM7UK/iHlbUbfAtkq+3F41+nmNEP0vCsf6FVGqpIwkPewmrouT8wrvnK/284uAImfKS53nNiuTxsQOa4+3gf2UEQYeTfdFiOkx1pTrvP2+Z9RufB1QTLWG82Zw5dPxRxz6iFW9"
`endif