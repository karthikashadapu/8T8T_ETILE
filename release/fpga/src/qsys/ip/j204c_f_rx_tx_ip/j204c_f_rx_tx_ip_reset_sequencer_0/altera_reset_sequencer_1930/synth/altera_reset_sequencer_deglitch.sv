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


// ------------------------------------------
// Deglitch logic
// - takes in input, and qualifies by a N number of cycles before
//   allowing change to be propagated to output
// ------------------------------------------
`timescale 1 ns / 1 ns

module altera_reset_sequencer_deglitch #(
    parameter RESET_VALUE     = 0,
    parameter DEGLITCH_CYCLES = 10
) (

    // ----------------------------------
    // Basic clock and reset inputs
    // ----------------------------------
    input       clk,
    input       reset,
    input       cnt_clr, // synchrounous clear

    // ------------------------
    // Signals for deglitch
    // ------------------------
    input       sig_in,
    output reg  sig_out

);


    // --------------------------------------------------
    // Ceil(log2()) function
    // --------------------------------------------------
    function unsigned[63:0] log2ceil;
        input reg[63:0] val;
        reg [63:0] i;

        begin
            i = 1;
            log2ceil = 0;

            while (i < val) begin
                log2ceil = log2ceil + 1;
                i = i << 1;
            end
        end
    endfunction

    // -----------------------------
    // Local derived parameters
    // -----------------------------
    localparam DCNT_W = log2ceil(DEGLITCH_CYCLES+1);

    // -------------------------
    // Internal Logics/Wires
    // -------------------------
    logic   allow_input_propagation;
    logic   [DCNT_W-1:0] deglitch_cnt;
    logic   [DCNT_W-1:0] deglitch_cnt_nxt;

    // -------------------------------
    // Deglitch counter
    // -------------------------------

`ifndef ETOOLS_RESERVED_DC 
    initial begin
        deglitch_cnt <= '0;
        sig_out     <= (RESET_VALUE==1)? 1'b1: 1'b0;
    end
`endif

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            deglitch_cnt    <= '0;
            sig_out         <= (RESET_VALUE == 1)? 1'b1 : 1'b0;
        end else if (cnt_clr) begin
            deglitch_cnt    <= '0;
            sig_out         <= (RESET_VALUE == 1)? 1'b1 : 1'b0;        
        end
        else begin
            if (allow_input_propagation) begin
                deglitch_cnt <= '0;
                sig_out      <= sig_in;
            end else begin
                deglitch_cnt <= deglitch_cnt_nxt;
                sig_out      <= sig_out;
            end
        end
    end

    // Increment deglitch count if input signal is not equal to output signal
    // else, treat it as a glitch and retain previous value
    assign deglitch_cnt_nxt         = (sig_in == sig_out) ? '0 : deglitch_cnt + 1'b1;

    // Allow sig_out to be sig_in only when DEGLITCH_CYCLES is met
    assign allow_input_propagation  = (deglitch_cnt_nxt == DEGLITCH_CYCLES);

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "4XeedYC2d5cuadvCJho763aSSkl1DRkxkQvoksMJv2VSpzATyoN8DqHo//teYnH8r162T4uH+BCa200GxyJP31cBno1sEsJk77E+qkjc8lZYjykrG0EIfQmjezkrpycnghQBNehMvorEdlwQS1QrIwscD7jaPxEU/CLR7ot04MotVla9fxGEAryOoaYgp4YUIXkzbQ53M3Az+ttWfnaiDklcQ3ejpqjMrKcwpwFZLnbWJ/DVhzWndpxd+vnRBLAYzQQ5idUYp2DMbFHo245AsVhFckQofPsaZZICvaT1wm9wgE7hTGp8EEGO/GWjX6R07BqmPGgRBS+3Mq96rXPKbhSKZT6RNRJkcV7GRm1lyUS5clOZ/YJThQaQoOFQ2rQdqdDZNdicP+hDFYyHHA0jEirnJWRH8bQum21Vl6Uc/vLHB80x5ai8Zwo9UWpAdl6QwUw00vWstbBPDTb8PrFmpsqWduuRe6euS5fimdi8+ZOVhneWWLURp5xJitEO04WQ5FPw+pA7HW+8XOH7+5s94DAGqpEr5Day1mcBuYKdO1CkR/6yoRscA7rJZxFJVdcbEHl+vVAl2UUz3iBXpu30v6PR+dIE1vJY3h5IMO6EkeiBBJfYzohBtFnwv4i7PMGJLbCjhTdyyrdSAsm5esQafx+qI77YPUovTnyAiFRpF5CEsW06zaDiBCAQw4ocqTV/7qhdVQ1o+8A8zVqFGPXoRbOkQ6XudI15UM2CdjqlZbooFIJpDPm35dG2y0qZb0zaTbUbzC/uAedw0/NxVj4xKOPgol4cLUI3COQlvPC2kl8FFNIHbVpcM0qhvvLQthgDr4OqwCkUR+BHIGwJvW4foDzJmHy9yiwI/PVdmpeawbICUplDlCL5xz3V3pQnCaTdTZnZ23dY9tk7RmXT33Hu8gBOWzz4SHrUoMS1bd6qGfxn7dxYvRhy/ZzHZ3Yynwmo5fhjtNW/PanJt1r27xvGscWLBWQC2TlGf5zrkHiZjHdMtpKu5OO/aQu/fUGV6i31"
`endif