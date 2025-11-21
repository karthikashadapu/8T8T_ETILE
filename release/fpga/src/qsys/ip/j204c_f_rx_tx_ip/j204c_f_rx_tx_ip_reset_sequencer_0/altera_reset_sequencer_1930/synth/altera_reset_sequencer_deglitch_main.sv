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


// ---------------------------
// Main module that instantiates per-signal deglitcher
// ---------------------------
`timescale 1 ns / 1 ns

module altera_reset_sequencer_deglitch_main #(
    parameter MAX_OUTPUTS = 10,
    parameter ENABLE     = 10'h1,
    parameter DEGLITCH_CNT0 = 2,
    parameter DEGLITCH_CNT1 = 3,
    parameter DEGLITCH_CNT2 = 4,
    parameter DEGLITCH_CNT3 = 5,
    parameter DEGLITCH_CNT4 = 6,
    parameter DEGLITCH_CNT5 = 7,
    parameter DEGLITCH_CNT6 = 8,
    parameter DEGLITCH_CNT7 = 9,
    parameter DEGLITCH_CNT8 = 10,
    parameter DEGLITCH_CNT9 = 11
) (
    // Clock and resets
    input   clk,
    input   reset,
    input   deg_clr,

    // Deglitch signals
    input       [MAX_OUTPUTS-1:0]    sig_in,
    output reg  [MAX_OUTPUTS-1:0]    sig_out
);

    // -------------------------------------
    // Internal logic/wire declaration
    // -------------------------------------
    logic [MAX_OUTPUTS-1:0] int_sig_out;
   
    // ------------------------------------
    // Output logic qualification with ENABLE
    // -----------------------------------
    genvar k;
    generate 
        for (k = 0; k < MAX_OUTPUTS; k = k+1) begin : sig_map
            assign sig_out[k] = (ENABLE[0] == 1)? int_sig_out[k] : sig_in[k];
        end
    endgenerate

    // ---------------------------------------
    // Deglitch logic instantiations
    // --------------------------------------
    generate if (DEGLITCH_CNT0 > 0) begin : gen_deg0
    altera_reset_sequencer_deglitch #(
        .RESET_VALUE        (1'b0),
        .DEGLITCH_CYCLES    (DEGLITCH_CNT0)
    ) deg0 (
        .clk     (clk),
        .reset   (reset),
        .cnt_clr(deg_clr),
        .sig_in  (sig_in[0]),
        .sig_out (int_sig_out[0])
    );
    end else begin
        assign int_sig_out[0] = sig_in[0];
    end endgenerate

    generate if (DEGLITCH_CNT1 > 0) begin : gen_deg1
    altera_reset_sequencer_deglitch #(
        .RESET_VALUE        (1'b0),
        .DEGLITCH_CYCLES    (DEGLITCH_CNT1)
    ) deg1 (
        .clk     (clk),
        .reset   (reset),
        .cnt_clr(deg_clr),
        .sig_in  (sig_in[1]),
        .sig_out (int_sig_out[1])
    );
    end else begin
        assign int_sig_out[1] = sig_in[1];
    end endgenerate

    generate if (DEGLITCH_CNT2 > 0) begin : gen_deg2
    altera_reset_sequencer_deglitch #(
        .RESET_VALUE        (1'b0),
        .DEGLITCH_CYCLES    (DEGLITCH_CNT2)
    ) deg2 (
        .clk     (clk),
        .reset   (reset),
        .cnt_clr(deg_clr),
        .sig_in  (sig_in[2]),
        .sig_out (int_sig_out[2])
    );
    end else begin
        assign int_sig_out[2] = sig_in[2];
    end endgenerate

    generate if (DEGLITCH_CNT3 > 0) begin : gen_deg3
    altera_reset_sequencer_deglitch #(
        .RESET_VALUE        (1'b0),
        .DEGLITCH_CYCLES    (DEGLITCH_CNT3)
    ) deg3 (
        .clk     (clk),
        .reset   (reset),
        .cnt_clr(deg_clr),
        .sig_in  (sig_in[3]),
        .sig_out (int_sig_out[3])
    );
    end else begin
        assign int_sig_out[3] = sig_in[3];
    end endgenerate

    generate if (DEGLITCH_CNT4 > 0) begin : gen_deg4
    altera_reset_sequencer_deglitch #(
        .RESET_VALUE        (1'b0),
        .DEGLITCH_CYCLES    (DEGLITCH_CNT4)
    ) deg4 (
        .clk     (clk),
        .reset   (reset),
        .cnt_clr(deg_clr),
        .sig_in  (sig_in[4]),
        .sig_out (int_sig_out[4])
    );
    end else begin
        assign int_sig_out[4] = sig_in[4];
    end endgenerate

    generate if (DEGLITCH_CNT5 > 0) begin : gen_deg5
    altera_reset_sequencer_deglitch #(
        .RESET_VALUE        (1'b0),
        .DEGLITCH_CYCLES    (DEGLITCH_CNT5)
    ) deg5 (
        .clk     (clk),
        .reset   (reset),
        .cnt_clr(deg_clr),
        .sig_in  (sig_in[5]),
        .sig_out (int_sig_out[5])
    );
    end else begin
        assign int_sig_out[5] = sig_in[5];
    end endgenerate

    generate if (DEGLITCH_CNT6 > 0) begin : gen_deg6
    altera_reset_sequencer_deglitch #(
        .RESET_VALUE        (1'b0),
        .DEGLITCH_CYCLES    (DEGLITCH_CNT6)
    ) deg6 (
        .clk     (clk),
        .reset   (reset),
        .cnt_clr(deg_clr),
        .sig_in  (sig_in[6]),
        .sig_out (int_sig_out[6])
    );
    end else begin
        assign int_sig_out[6] = sig_in[6];
    end endgenerate

    generate if (DEGLITCH_CNT7 > 0) begin : gen_deg7
    altera_reset_sequencer_deglitch #(
        .RESET_VALUE        (1'b0),
        .DEGLITCH_CYCLES    (DEGLITCH_CNT7)
    ) deg7 (
        .clk     (clk),
        .reset   (reset),
        .cnt_clr(deg_clr),
        .sig_in  (sig_in[7]),
        .sig_out (int_sig_out[7])
    );
    end else begin
        assign int_sig_out[7] = sig_in[7];
    end endgenerate

    generate if (DEGLITCH_CNT8 > 0) begin : gen_deg8
    altera_reset_sequencer_deglitch #(
        .RESET_VALUE        (1'b0),
        .DEGLITCH_CYCLES    (DEGLITCH_CNT8)
    ) deg8 (
        .clk     (clk),
        .reset   (reset),
        .cnt_clr(deg_clr),
        .sig_in  (sig_in[8]),
        .sig_out (int_sig_out[8])
    );
    end else begin
        assign int_sig_out[8] = sig_in[8];
    end endgenerate

    generate if (DEGLITCH_CNT9 > 0) begin : gen_deg9
    altera_reset_sequencer_deglitch #(
        .RESET_VALUE        (1'b0),
        .DEGLITCH_CYCLES    (DEGLITCH_CNT9)
    ) deg9 (
        .clk     (clk),
        .reset   (reset),
        .cnt_clr(deg_clr),
        .sig_in  (sig_in[9]),
        .sig_out (int_sig_out[9])
    );
    end else begin
        assign int_sig_out[9] = sig_in[9];
    end endgenerate

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "4XeedYC2d5cuadvCJho763aSSkl1DRkxkQvoksMJv2VSpzATyoN8DqHo//teYnH8r162T4uH+BCa200GxyJP31cBno1sEsJk77E+qkjc8lZYjykrG0EIfQmjezkrpycnghQBNehMvorEdlwQS1QrIwscD7jaPxEU/CLR7ot04MotVla9fxGEAryOoaYgp4YUIXkzbQ53M3Az+ttWfnaiDklcQ3ejpqjMrKcwpwFZLnaZ7IBBmta10vX8lHgH8p3+N/jlMD5WAKeIAK7YmO4GjM/y54W6hBQ3Kgh3GcV6AUo0ZeBIw172FDKoc2CkoWHQmgxbL2afdlbB3qseajh1zKgAKyH0Rta5VGjOE+G3GjoQtjoDgJyHKJ/f7SE0ZohNCVNX1gg6t1U90qawwOM75IykyOBNXZ/MaO41xOX7SmYjMFUlonv+d7M2DpPbsV8/g0i06EAuXRTZhhGJX2ULLPoOtSvqTdf9QAkpJM/1vVg+SOR1fXVJHwCRTgTHv1aaz31KgYEUCPIzixop2dWmtGwIQ9hQUSA73AjPst5clYHVcvVzBqg1PXRchlQuNzjLz1Lxtkko2g1fv27WojbfRzsEBfnqewjRVyipngmAimguYRlkvfVBoZ80IAY9jyfXnK5h7jut3Vklq6ASJMQ3jISMcZdY0C65ZvWzil8FqFbnJ5QHaVwAWB+mR/cJ9DrQs66mbZq76N2wdlLok7W4rpogHqJUWiM6qQvhNvCrj3H9vd+Ggxg+T1TfGPHBlITJ86d9TMA8GQMoJuIc+TkO1br12TH2OiE126Jr/IvaxgPLQla2LhMAxRU4cc2MgJfbHwYAFG6tLIM6Eh0SFfrrfGROqvsSmkDU8iZfbD/41JZ/xeyv0GKgBe9tsJszm2S5Jez7yc6e/esjrfZJIycqATy2p0LAYdcuoZUsJQ8rQyo6zh2ym09t6jlqDen9VI9EyKq2f0M6+FLRGcSaN7H7UgPbD7nEQSh0t4CD0gsgarxah1f9OMLp+TL3vFEDlGtE"
`endif