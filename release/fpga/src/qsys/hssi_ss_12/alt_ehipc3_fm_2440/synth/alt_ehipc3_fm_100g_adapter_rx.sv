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

module alt_ehipc3_fm_100g_adapter_rx #(
    parameter MASK_VALID    = 1,
    parameter SIM_EMULATE   = 0
) (
    input   logic             i_reset,
    input   logic             i_clear_counters,
    input   logic             i_clk,
    output  logic   [63:0]    o_dropped_frames,

    output  logic [511:0]     o_data,
    output  logic             o_valid,
    output  logic             o_sop,
    output  logic             o_eop,
    output  logic [5:0]       o_empty,
    output  logic [39:0]      o_status,
    output  logic             o_status_valid,
    output  logic [5:0]       o_error,

    input   logic [0:3]       i_inframe,
    input   logic [0:3][63:0] i_data,
    input   logic [0:3]       i_valid,
    input   logic [0:3][2:0]  i_empty,
    input   logic [0:3][1:0]  i_error,
    input   logic [0:3]       i_fcs_error,
    input   logic [0:3][2:0]  i_status
);

    localparam SIDEBAND_WIDTH = 3+2+1+3;    // empty + error + fcs_error + status
    genvar i;

    logic   [0:3]       if_filtered;
    logic               filtered_valid;

    logic   [0:1][4:0]  write_lane_pointers;
    logic   [0:1][4:0]  write_lane_pointers_r1;
    logic   [0:1][4:0]  write_lane_pointers_r2;
    logic   [0:1][4:0]  write_lane_pointers_r3;

    logic   [0:3][7:0]  write_mem_pointers;
    logic   [0:3][7:0]  write_mem_pointers_r1;
    logic   [0:3][7:0]  write_mem_pointers_r2;
    logic   [0:3][7:0]  write_mem_pointers_r3;

    logic   [0:3][2:0]  empty_r1;
    logic   [0:3][1:0]  error_r1;
    logic   [0:3]       fcs_error_r1;
    logic   [0:3][2:0]  status_r1;

    logic   [0:3][SIDEBAND_WIDTH-1:0]   sideband_r2;
    logic   [0:3][SIDEBAND_WIDTH-1:0]   sideband_r3;

    logic   [7:0]       aligned_ptr;
    logic               aligned_valid;

    logic   [0:7][4:0]  sb_rd_ptrs;
    logic   [0:7][4:0]  data_rd_ptrs;
    logic        [2:0]  sb_rotation_index;
    logic        [2:0]  sb_rotation_index_r1;
    logic        [2:0]  data_rotation_index;
    logic               sb_ptr_set_valid;

    logic   [0:7][SIDEBAND_WIDTH:0] sb_rd_data;
    logic   [0:7][SIDEBAND_WIDTH:0] sb_rd_data_reg;
    logic   [0:7][SIDEBAND_WIDTH:0] sb_rd_data_aligned;
    logic               sb_data_valid;
    logic               sb_data_valid_r1;
    logic               sb_data_aligned_valid;

    logic   [0:7][63:0] rd_data;
    logic   [0:7][63:0] rd_data_reg;

    logic   [0:7]       rd_inframe;
    logic   [0:7][2:0]  rd_empty;
    logic   [0:7][1:0]  rd_error;
    logic   [0:7]       rd_fcs_error;
    logic   [0:7][2:0]  rd_status;

    logic   [0:3]       if_unfiltered;

    always_ff @(posedge i_clk) begin
        if (i_valid[0]) begin
            empty_r1                <= i_empty;
            error_r1                <= i_error;
            fcs_error_r1            <= i_fcs_error;
            status_r1               <= i_status;
            sideband_r2[0]          <= {empty_r1[0], error_r1[0], fcs_error_r1[0], status_r1[0]};
            sideband_r2[1]          <= {empty_r1[1], error_r1[1], fcs_error_r1[1], status_r1[1]};
            sideband_r2[2]          <= {empty_r1[2], error_r1[2], fcs_error_r1[2], status_r1[2]};
            sideband_r2[3]          <= {empty_r1[3], error_r1[3], fcs_error_r1[3], status_r1[3]};
            write_lane_pointers_r1  <= write_lane_pointers;
            write_lane_pointers_r2  <= write_lane_pointers_r1;
            write_mem_pointers_r1   <= write_mem_pointers;
            write_mem_pointers_r2   <= write_mem_pointers_r1;
        end else begin
            empty_r1        <= empty_r1;
            error_r1        <= error_r1;
            fcs_error_r1    <= fcs_error_r1;
            status_r1       <= status_r1;
            sideband_r2     <= sideband_r2;
            write_lane_pointers_r1  <= write_lane_pointers_r1;
            write_lane_pointers_r2  <= write_lane_pointers_r2;
            write_mem_pointers_r1   <= write_mem_pointers_r1;
            write_mem_pointers_r2   <= write_mem_pointers_r2;
        end

        write_lane_pointers_r3  <= write_lane_pointers_r2;
        write_mem_pointers_r3   <= write_mem_pointers_r2;
        sideband_r3             <= sideband_r2;
    end

    generate
        for (i = 0; i < 8; i++) begin : loop8
            alt_ehipc3_fm_mlab #(
                .WIDTH          (64),
                .ADDR_WIDTH     (5),
                .SIM_EMULATE    (SIM_EMULATE)
            ) data_mem (
                .wclk        (i_clk),
                .wena        (1'b1),
                .waddr_reg   (write_lane_pointers[i[2]]),
                .wdata_reg   (i_data[i%4]),
                .raddr       (data_rd_ptrs[i]),
                .rdata       (rd_data[i])
            );

            alt_ehipc3_fm_mlab #(
                .WIDTH          (SIDEBAND_WIDTH+1),
                .ADDR_WIDTH     (5),
                .SIM_EMULATE    (SIM_EMULATE)
            ) sb_mem (
                .wclk        (i_clk),
                .wena        (1'b1),
                .waddr_reg   (write_lane_pointers_r3[i[2]]),
                .wdata_reg   ({if_filtered[i%4], sideband_r3[i%4]}),
                .raddr       (sb_rd_ptrs[i]),
                .rdata       (sb_rd_data[i])
            );

            assign {rd_inframe[i], rd_empty[i], rd_error[i], rd_fcs_error[i], rd_status[i]} = sb_rd_data_aligned[i];
        end

    endgenerate

    alt_ehipc3_fm_100g_if_to_avst #(
        .MASK_VALID (MASK_VALID)
    ) if_2_avst (
        .i_clk          (i_clk),
        .i_reset        (i_reset),
        .i_inframe      (rd_inframe),
        .i_valid        (sb_data_aligned_valid),
        .i_status       (rd_status),
        .i_fcs_error    (rd_fcs_error),
        .i_empty        (rd_empty),
        .i_error        (rd_error),

        .o_empty        (o_empty),
        .o_sop          (o_sop),
        .o_eop          (o_eop),
        .o_valid        (o_valid),
        .o_error        (o_error),
        .o_status_data  (o_status),
        .o_status_valid (o_status_valid)
    );

    always_ff @(posedge i_clk) begin
        sb_ptr_set_valid        <= aligned_valid;
        sb_data_valid           <= sb_ptr_set_valid;
        sb_data_valid_r1        <= sb_data_valid;
        sb_data_aligned_valid   <= sb_data_valid_r1;

        sb_rotation_index       <= aligned_ptr[2:0];
        sb_rotation_index_r1    <= sb_rotation_index;
        sb_rd_data_reg          <= sb_rd_data;
        rd_data_reg             <= rd_data;

        data_rotation_index     <= sb_rotation_index_r1;
        data_rd_ptrs            <= sb_rd_ptrs;  // Data reads lag sideband reads by 1 cycle
    end

    alt_ehipc3_fm_100g_adapter_data_aligner #(
        .WIDTH  (SIDEBAND_WIDTH+1)
    ) sb_aligner (
        .clk    (i_clk),
        .din    (sb_rd_data_reg),
        .index  (sb_rotation_index_r1),
        .dout   (sb_rd_data_aligned)
    );

    alt_ehipc3_fm_100g_adapter_data_aligner #(
        .WIDTH  (64)
    ) data_aligner (
        .clk    (i_clk),
        .din    (rd_data_reg),
        .index  (data_rotation_index),
        .dout   (o_data)
    );

    alt_ehipc3_fm_100g_adapter_rptr_addgen rptr_gen0 (
        .clk    (i_clk),
        .i_ptr  (aligned_ptr),
        .o_ptr  (sb_rd_ptrs)
    );

    alt_ehipc3_fm_100g_rx_aligner sop_aligner (
        .i_clk      (i_clk),
        .i_reset    (i_reset),
        .i_valid    (filtered_valid),
        .i_inframe  (if_filtered),
        .i_ptr      (write_mem_pointers_r3[0][7:2]),
        .o_ptr      (aligned_ptr),
        .o_valid    (aligned_valid)
    );

    alt_ehipc3_fm_100g_adapter_wptr_addgen wptr_addgen (
        .i_reset    (i_reset),
        .i_clk      (i_clk),
        .i_valid    (i_valid[0]),
        .lane_ptrs  (write_lane_pointers),
        .mem_ptrs   (write_mem_pointers)
    );

    alt_ehipc3_fm_if_filter5 #(
        .SB_WIDTH(4)
    ) filter5 (
        .reset      (i_reset),
        .clk        (i_clk),
        .din        (i_inframe),
        .sb_din     (i_inframe),
        .valid_in   (i_valid[0]),
        .dout       (if_filtered),
        .sb_dout    (if_unfiltered),
        .valid_out  (filtered_valid)
    );

    alt_ehipc3_fm_dropped_frame_count drop_frm_counter_inst (
        .clk                    (i_clk),
        .reset                  (i_reset),
        .clear_count            (i_clear_counters),
        .valid                  (filtered_valid),
        .inframe_unfiltered     (if_unfiltered),
        .inframe_filtered       (if_filtered),
        .dropped_frames         (o_dropped_frames)
    );
endmodule



`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "sj2EnSVIknGz65j61L+DMMO3HDcSN2jhvr55koJ1ECJkPtG0Fw9q9R2fIYYgv2BPR8BrsR+RYKuIJjlYQNmgnXVjvtJtJool3uQURgCFpQL23pok+Wr2TXSNbySMdXxV2gz6CwxUk+0+/rDLrsroCzkAiFw2amgz6Do5tJQltYjCIPqHFj/3UZep9T4dBvB83T//SpBFZzgCz+Lzrx+1A17RXSmjyar6SF3JSJg+7B3Ynvq3BKJ2lKNKesvJl3Pmn90EIk9xv1pckKZ4LM9SeYdVjOdSmMi7yq6O4/LGXRz4yW9ba/Czk+oq3mYOYAxexFLqp2mHYJ5kRvlK5WyyJhrngg4OkSwsBfqL51PHYD5Ui+uWlvlLZcuRVsoK1YWYomec0/4ZC052sVSbg0Ql1NxAAgIRiwkF/uccMsE7bq4xIh2XswDTpzTRMG+iTLkVg8kP0INP18WT5aSXrWmWeLO4lwQxcjmfPT3blEzMVpDqOEYyupzBxjE1Eab3lXp20mEhaJN/Z6DDpC3LD9k5QzWpKuqA+Xp7wMFDbHhooJjpqXX4sCZjNS++6it7U8aCf5gqNdjm8Gu/fjdhj826LnccW46EwvGpD74rFphh8pbgjcG1zWj4lFQuF9413182Pvzu6ppX05TY0b+uIbQ0IHQz95CHYa1j7Mo4GaKVbLfPtO5+tp4I9a4CDIFN7Sq/hWEeigRD56Y+HMY/rlBVzHHmbG+uOMtHSutCfS7j6fzF87YtEqe/GK6XCDUnp6YrR5UaBQDLKXM0q/DLogJFYmTZzDUdtMTas6HG2df9x/wOpjGHTTgLPoqZg8pJ/YilPpsU7C5G6spSfqPeh8ezTyu9UiRQkMYfjBJb5USAg2jYPBtvnCo31bSFwD861vWqTb5bsfe6PpejVVrxvFRpqlXdPU8r7wwD/Qqpz1mqEj69gem0Z3R3ZEiYbc9SHHwwy/cOmwtb3ThGehJKYb1cMWEDIMydtCz3yTO4M0Imp8usARoSPvLwzY0pfeMJ74XC"
`endif