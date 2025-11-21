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


`timescale 1ps / 1ps

module eth_f_ptp_packing_tx #(
    parameter SIM           = 0,
    parameter WORDS         = 1,
    parameter PKT_CYL       = 1,
    parameter PTP_FP_WIDTH  = 8,
    parameter DWIDTH        = 64
) (
    input   logic                               i_clk,
    input   logic                               i_reset,
    input   logic                               i_seg_tx_valid,
    input   logic   [WORDS-1:0]                 i_seg_tx_inframe,
    input   logic   [PKT_CYL-1:0][DWIDTH-1:0]   i_data,
    input   logic                               i_pack_tx_valid,
    input   logic   [WORDS-1:0]                 i_pack_tx_inframe,
    output  logic   [PKT_CYL-1:0][DWIDTH-1:0]   o_data
);
    
    localparam AWIDTH = 6; // 64 entry of memory
    localparam HWORDS = (PKT_CYL == 2)? WORDS/2 : 1;
    localparam DEPTH  = 64;

    genvar i;

    logic                               r_seg_tx_inframe;
    logic [WORDS-1+1:0]                 seg_tx;
    logic [WORDS-1:0]                   seg_tx_sop;
    logic                               upper_seg_sop;
    logic                               lower_seg_sop;
    logic                               double_seg_sop;
    logic [PKT_CYL-1:0]                 wena;
    logic [PKT_CYL-1:0][AWIDTH-1:0]     waddr;
    logic                               fifo_wr_switch;
    logic [PKT_CYL-1:0][DWIDTH-1:0]     mem_in;

    logic                               r_pack_tx_inframe;
    logic [WORDS-1+1:0]                 pack_tx;
    logic [WORDS-1:0]                   pack_tx_sop;
    logic                               upper_pack_sop;
    logic                               lower_pack_sop;
    logic                               double_pack_sop;
    logic                               r_double_pack_sop;
    logic [PKT_CYL-1:0]                 rena;
    logic [PKT_CYL-1:0][AWIDTH-1:0]     raddr;
    logic                               fifo_rd_switch;
    logic                               r_fifo_rd_switch;
    logic [PKT_CYL-1:0][DWIDTH-1:0]     mem_out;
    
    
// write mechanism
    generate
        for (i = 0; i < PKT_CYL; i++) begin: gen_waddr
            always @ (posedge i_clk) begin
                if (i_reset) begin
                    waddr[i]   <= {AWIDTH{1'b0}};
                end else if (wena[i]) begin // wena already qualified with seg_tx_valid
                    waddr[i]   <= waddr[i] + 1'd1;
                end
            end
        end
    endgenerate

    always @ (posedge i_clk) begin
        if (i_reset) begin
            r_seg_tx_inframe <= 1'b0;
        end
        else if (i_seg_tx_valid) begin
            r_seg_tx_inframe <= i_seg_tx_inframe[WORDS-1];
        end
    end

    // determine TX SOP
    assign seg_tx       = {i_seg_tx_inframe, r_seg_tx_inframe};
    assign seg_tx_sop   = (seg_tx[WORDS:1] & ~seg_tx[WORDS-1:0]);

// read mechanism
    generate
        for (i = 0; i < PKT_CYL; i++) begin: gen_raddr
            always @ (posedge i_clk) begin
                if (i_reset) begin
                    raddr[i]   <= {AWIDTH{1'b0}};
                end else if (rena[i]) begin // rena already qualified with pack_tx_valid
                    raddr[i]   <= raddr[i] + 1'd1;
                end
            end
        end
    endgenerate

    always @ (posedge i_clk) begin
        if (i_reset) begin
            r_pack_tx_inframe <= 1'b0;
        end
        else if (i_pack_tx_valid) begin
            r_pack_tx_inframe <= i_pack_tx_inframe[WORDS-1];
        end
    end
    
    // determine packed TX SOP
    assign pack_tx      = {i_pack_tx_inframe, r_pack_tx_inframe};
    assign pack_tx_sop  = (pack_tx[WORDS:1] & ~pack_tx[WORDS-1:0]);

    generate
    if (PKT_CYL == 2) begin: gen_pkt_cyl2
        assign upper_seg_sop  = |seg_tx_sop[WORDS-1:HWORDS] & i_seg_tx_valid;
        assign lower_seg_sop  = |seg_tx_sop[HWORDS-1:0] & i_seg_tx_valid;
        assign double_seg_sop = upper_seg_sop & lower_seg_sop;
        assign wena[0] =  (~fifo_wr_switch & (upper_seg_sop | lower_seg_sop)) | double_seg_sop ? 1'b1 : 1'b0;
        assign wena[1] =  ( fifo_wr_switch & (upper_seg_sop | lower_seg_sop)) | double_seg_sop ? 1'b1 : 1'b0;
        assign mem_in[0] = (double_seg_sop & ~fifo_wr_switch) ? i_data[0]:
                           (double_seg_sop &  fifo_wr_switch) ? i_data[1]:
                           lower_seg_sop  ? i_data[0]:
                           upper_seg_sop  ? i_data[1]:
                                            i_data[0];
        assign mem_in[1] = (double_seg_sop & ~fifo_wr_switch) ? i_data[1]:
                           (double_seg_sop &  fifo_wr_switch) ? i_data[0]:
                           lower_seg_sop  ? i_data[0]:
                           upper_seg_sop  ? i_data[1]:
                                            i_data[1];

        assign upper_pack_sop  = |pack_tx_sop[WORDS-1:HWORDS] & i_pack_tx_valid;
        assign lower_pack_sop  = |pack_tx_sop[HWORDS-1:0] & i_pack_tx_valid;
        assign double_pack_sop = upper_pack_sop & lower_pack_sop;
        assign rena[0] = (~fifo_rd_switch & (upper_pack_sop | lower_pack_sop)) | double_pack_sop ? 1'b1 : 1'b0;
        assign rena[1] = ( fifo_rd_switch & (upper_pack_sop | lower_pack_sop)) | double_pack_sop ? 1'b1 : 1'b0;
        assign o_data[0] = (r_double_pack_sop & ~r_fifo_rd_switch) ? mem_out[0]:
                           (r_double_pack_sop &  r_fifo_rd_switch) ? mem_out[1]:
                           ~r_fifo_rd_switch ? mem_out[0]:
                            r_fifo_rd_switch ? mem_out[1]:
                                               mem_out[0];
        assign o_data[1] = (r_double_pack_sop & ~r_fifo_rd_switch) ? mem_out[1]:
                           (r_double_pack_sop &  r_fifo_rd_switch) ? mem_out[0]:
                           ~r_fifo_rd_switch ? mem_out[0]:
                            r_fifo_rd_switch ? mem_out[1]:
                                               mem_out[1];

        always @ (posedge i_clk) begin
            if (i_reset) begin
                fifo_wr_switch <= 1'b0;
                fifo_rd_switch <= 1'b0;
                r_double_pack_sop <= 1'b0;
                r_fifo_rd_switch  <= 1'b0;
            end else begin
                if ((upper_seg_sop | lower_seg_sop) & (!double_seg_sop)) begin
                    fifo_wr_switch <= ~fifo_wr_switch;
                end else begin
                    fifo_wr_switch <= fifo_wr_switch;
                end
                if ((upper_pack_sop | lower_pack_sop) & (!double_pack_sop)) begin
                    fifo_rd_switch <= ~fifo_rd_switch;
                end else begin
                    fifo_rd_switch <= fifo_rd_switch;
                end
                r_double_pack_sop <= double_pack_sop; //delay double_pack_sop for mux sel as mem out is 1 cycle late
                r_fifo_rd_switch  <= fifo_rd_switch;  //delay fifo_rd_switch  for mux sel as mem out is 1 cycle late
            end
        end
    end else begin: gen_pkt_cyl1
        assign wena  [0] = |seg_tx_sop  & i_seg_tx_valid;
        assign rena  [0] = |pack_tx_sop & i_pack_tx_valid;
        assign mem_in[0] = i_data [0];
        assign o_data[0] = mem_out[0];
    end
    endgenerate

    // memory
    generate
        for (i = 0; i < PKT_CYL; i++) begin: gen_mem
            //eth_f_mlab #(
            //    .WIDTH      (DWIDTH),
            //    .ADDR_WIDTH (AWIDTH),
            //    .SIM_EMULATE(SIM)
            //) mem (
            //    .wclk       (i_clk),
            //    .wena       (wena[i]),
            //    .waddr_reg  (waddr[i]),
            //    .wdata_reg  (mem_in[i]),
            //    .raddr      (raddr[i]),
            //    .rdata      (mem_out[i])
            //);
          
            eth_f_dual_port_sram #(
                .WIDTH      (DWIDTH),
                .DEPTH      (DEPTH)
            ) ram (
                .read_clk    (i_clk),
                .read_addr   (raddr[i]),
                .read        (rena[i]),
                .read_data   (mem_out[i]),
                .write_clk   (i_clk),
                .write_addr  (waddr[i]),
                .write       (wena[i]),
                .write_data  (mem_in[i])
            );
        end
    endgenerate

endmodule // eth_f_ptp_packing_tx

`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "iuBeK6jR69XRNHgPOXANQcgjB4WcZGkPF3FM4twIZ3EvsrAtxQsYS6Hpi5XGvIMMcH9N6DPm/kmHi0wPOQiuTHVVVxmr9OiPO/RVoCdNzGMPvFnw/zRMf5njlvSl/Ap+x6pvul8+7XHuyLyqwObdmDkbCQayz2DnxYXZjjt2proJ3XfkjECmKOX4nN4VQ1AR4UGhbU0fMVSMpGQjFTDlax90AVVn6m/PSOsKahRUPX/XxPtXj/e3nmaOUbepZUgDmYL21N1bLaLLNbW5y/0m5WAVuRyWgAHICz9iU8ktBrVb/W9an4ahNUaM6+JfiVFmg46TlohgEWdDqZSLBdfkqTsnVRo80ru89hTFwiw0u2pCA1IXAARYEvmwKAtnKCHyn0RujkcXJlFVAg7OrgVMADMUxuBLzwGRM1ttDVjzFe2ilR78uKfPeZK/RsjfhhN/ZHyiPQt/SRXoma60mA0g2CSf1hZ+TfG7wtZeS5cdpUu2veuFIFbbXJdZrm3a4aWaiav31sV1sxjVIZ/i89WgRahZfXPqJB8Mdx4arvn6daG3ZCc/MtlrWpC5u4VoJw+msqjbgxYcxs8trxcz97QtzKef1pYR7JlfDsv3Y45KEQZl/vCuRtcD1XOeJfE8DHBxWz38VvkoaCPtpXICjgxrcbrZLrkhmuQyuxM6zT/NY72/XBZHMm/CbSeKOLj6kty9lYh9IaR+iWUNYmmHK1M9ylE3W0ZvgXR0KQnf/1PfDrBmyI3RHkuJkr69pvU+nnfrQPQdxaroKGiNNpfQvDwTDbqBAt7PNwiMDTj2wrDdy0oR8hkpZfHoYzu/KG4A9zPsqNqpzpSyUUVBlqaYs2yNPfIgCh2VtJwHPxImAwTJ/6dX3gV/QCaWjdMu/zEXbg+HFvJNzIzGNcEJS2bC9suAl64uxi2PHyb4X49hBYR9kv45SiI0U2NsuTz9BIDGIKodql0fa4tcURyo7wBgwS+cOAj9RLw0cNBe6h2StZJ9ENTZgTCZ7UDmR4CO1ByaF8a6"
`endif