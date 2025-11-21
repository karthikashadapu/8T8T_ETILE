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


//------------------------------------------------------------------------------
//
// Filename         : eth_f_ptp_adapter_rx.sv
//
//==============================================================================
//------------------------------------------------------------------------------
//
// Description :- This module aligns PTP RX ITS (from Soft PTP) to AVST SOP.
//                ASYNC_ADAPTERS = 0: Soft PTP interface and AVST interface are running at same clock.
//                ASYNC_ADAPTERS = 1: Soft PTP interface and AVST interface are running at different clock.
//                The operation of this module must align to eth_f_adapter_rx. 
//------------------------------------------------------------------------------
`timescale 1ps / 1ps

module eth_f_ptp_adapter_rx #(
    parameter ENABLE_ASYNC_ADAPTERS = 1,
    parameter WORDS     = 1,
    parameter DWIDTH    = 64,
    parameter AWIDTH    = 5   // sync && async mem same depth
) (
    // Clock & Reset
    input   logic                   i_seg_clk,
    input   logic                   i_seg_rst,
    input   logic                   i_avst_clk,
    input   logic                   i_avst_rst,
    // EHIP interface
    input   logic                   i_seg_rx_valid,
    input   logic   [WORDS-1:0]     i_seg_rx_inframe,
    input   logic   [DWIDTH-1:0]    i_data,
    input  logic    [WORDS-1:0]     i_seg_filtered_if,       // from eth_f_adapter_rx (100g frame filter)
    input  logic                    i_seg_filtered_if_valid, // from eth_f_adapter_rx (100g frame filter)
    // AVST interface
    input   logic                   i_avst_rx_valid,
    input   logic                   i_avst_rx_sop,
    output  logic   [DWIDTH-1:0]    o_data
);
    // ---------------------------------------------------
    // Internal logics
    // select
    logic               wr_clk, rd_clk;
    logic               wr_rst, rd_rst;
    logic               sel_valid;
    logic [WORDS-1:0]   sel_if;
    logic [DWIDTH-1:0]  sel_data;
    logic [DWIDTH-1:0]  data_r0, data_r1, data_r2;
    logic [WORDS-1:0]   seg_filtered_if;
    logic               sel_if_msb_r;
    logic [WORDS-1+1:0] seg_rx_if;
    logic               seg_rx_sop;
    // fifo
    logic               wena;
    logic               rena;
    logic               full; // async mem (dcfifo) only
    logic               empty;// async mem (dcfifo) only
    logic [AWIDTH-1:0]  waddr;// sync mem (mlab) only
    logic [AWIDTH-1:0]  raddr;// sync mem (mlab) only
    logic [DWIDTH-1:0]  wdata;
    logic [DWIDTH-1:0]  rdata;
    
    // ---------------------------------------------------
    // Select Clock and Reset according to Sync & Async
    assign wr_clk = (ENABLE_ASYNC_ADAPTERS==0) ? i_avst_clk : i_seg_clk;
    assign rd_clk = (ENABLE_ASYNC_ADAPTERS==0) ? i_avst_clk : i_avst_clk;
    assign wr_rst = (ENABLE_ASYNC_ADAPTERS==0) ? i_avst_rst : i_seg_rst;
    assign rd_rst = (ENABLE_ASYNC_ADAPTERS==0) ? i_avst_rst : i_avst_rst;
    
// ---------------------------------------------------
// Select Inputs (100G RX Adapter will drop frames)
generate if (WORDS==4) begin: gen_100g
   // reverse back inframe bits
    eth_f_reverse_bits #(
        .WIDTH      (WORDS)
    ) rev_seg_fil_if (
        .din(i_seg_filtered_if),
        .dout(seg_filtered_if)
    );

    // align data with filtered_if
    always @ (posedge wr_clk) begin
        if (wr_rst) begin
            data_r0 <= {DWIDTH{1'b0}};
            data_r1 <= {DWIDTH{1'b0}};
            data_r2 <= {DWIDTH{1'b0}};
        end
        else begin
            // similar pipeline mechanism as filtered_if (eth_f_100g_50g_adapter_rx/filter5) begin
            if (i_seg_rx_valid) begin
                {data_r1,  data_r0 } <= {data_r0,  i_data};
            end
            data_r2 <= data_r1; // no qualified by valid
            // similar as filtered_if end
        end
    end
    assign sel_valid   = i_seg_filtered_if_valid;
    assign sel_if      = seg_filtered_if;
    assign sel_data    = data_r2;
end
else begin: gen_others
    assign data_r0  = {DWIDTH{1'b0}};
    assign data_r1  = {DWIDTH{1'b0}};
    assign data_r2  = {DWIDTH{1'b0}};
    assign sel_valid   = i_seg_rx_valid;
    assign sel_if      = i_seg_rx_inframe;
    assign sel_data    = i_data;
end
endgenerate
    
// ---------------------------------------------------
// write mechanism
    always @ (posedge wr_clk) begin
        if (wr_rst)         sel_if_msb_r <= 1'b0;
        else if (sel_valid) sel_if_msb_r <= sel_if[WORDS-1];
    end
    
    assign seg_rx_if    = {sel_if, sel_if_msb_r};
    assign seg_rx_sop   = |(seg_rx_if[WORDS:1] & ~seg_rx_if[WORDS-1:0]);
    assign wena         = (ENABLE_ASYNC_ADAPTERS==0) ? (sel_valid && seg_rx_sop) :
                                                       (sel_valid && seg_rx_sop && ~full);
    assign wdata        = sel_data;
    
// ---------------------------------------------------
// read mechanism
    assign rena     = (ENABLE_ASYNC_ADAPTERS==0) ?  (i_avst_rx_valid & i_avst_rx_sop) :
                                                    (i_avst_rx_valid && i_avst_rx_sop && ~empty);
    assign o_data   = rena ? rdata : {{DWIDTH}{1'b0}};
    
// ---------------------------------------------------
// Memory
generate if (ENABLE_ASYNC_ADAPTERS==0) begin: gen_mem_sync
    always @ (posedge wr_clk) begin
        if (wr_rst)                waddr <= {AWIDTH{1'b0}};
        else if (sel_valid & wena) waddr <= waddr + 5'd1; // increment waddr for next wdata
    end
    
    always @ (posedge rd_clk) begin
        if (rd_rst)                      raddr <= {AWIDTH{1'b0}};
        else if (i_avst_rx_valid & rena) raddr <= raddr + 5'd1; // increment raddr for next rdata
    end
    assign full  = 1'b0;
    assign empty = 1'b0;
    
    // memory
    eth_f_mlab #(
        .WIDTH      (DWIDTH),
        .ADDR_WIDTH (5),
        .SIM_EMULATE(0)
    ) mem (
        .wclk       (wr_clk),
        .wena       (wena),
        .waddr_reg  (waddr),
        .wdata_reg  (wdata),
        .raddr      (raddr),
        .rdata      (rdata)
    );
end
else begin: gen_mem_async
    assign waddr = {AWIDTH{1'b0}};
    assign raddr = {AWIDTH{1'b0}};

    dcfifo  dcfifo_component (
                .wrclk      (wr_clk),
                .aclr       (wr_rst),
                .wrreq      (wena),
                .data       (wdata),
                .wrfull     (full),
                .rdclk      (rd_clk),
                .rdreq      (rena),
                .q          (rdata),
                .rdempty    (empty),
                .eccstatus  (),
                .rdfull     (),
                .rdusedw    (),
                .wrempty    (),
                .wrusedw    ());
    defparam
        dcfifo_component.enable_ecc             = "FALSE",
        dcfifo_component.intended_device_family = "Agilex",
        dcfifo_component.lpm_hint               = "RAM_BLOCK_TYPE=MLAB,DISABLE_DCFIFO_EMBEDDED_TIMING_CONSTRAINT=TRUE",
        dcfifo_component.lpm_numwords           = 2 ** AWIDTH,
        dcfifo_component.lpm_showahead          = "ON",
        dcfifo_component.lpm_type               = "dcfifo",
        dcfifo_component.lpm_width              = DWIDTH,
        dcfifo_component.lpm_widthu             = AWIDTH,
        dcfifo_component.overflow_checking      = "ON",
        dcfifo_component.rdsync_delaypipe       = 3,
        dcfifo_component.read_aclr_synch        = "ON",
        dcfifo_component.underflow_checking     = "ON",
        dcfifo_component.use_eab                = "ON",
        dcfifo_component.write_aclr_synch       = "ON",
        dcfifo_component.wrsync_delaypipe       = 3;
end
endgenerate

endmodule // eth_f_ptp_adapter_rx

`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "iuBeK6jR69XRNHgPOXANQcgjB4WcZGkPF3FM4twIZ3EvsrAtxQsYS6Hpi5XGvIMMcH9N6DPm/kmHi0wPOQiuTHVVVxmr9OiPO/RVoCdNzGMPvFnw/zRMf5njlvSl/Ap+x6pvul8+7XHuyLyqwObdmDkbCQayz2DnxYXZjjt2proJ3XfkjECmKOX4nN4VQ1AR4UGhbU0fMVSMpGQjFTDlax90AVVn6m/PSOsKahRUPX8kyOg6uEFFBB3U0YxrrVpuk6Ov4ktGpwpi5BjwLwX3OTNbtuLCAXUrDnleB4iuHEAXmc78oQLP3fcElWlCRKCFoz4GEQRH4BIb8DTKvVBBcB642A3PKYmG/xX78W6ScWrRuFbVZE1+LCRHsy0fVz/eO5q49l/EmxEn3iVEIdBAKGKXvujEr1m17e24iLbyBoN/bsCxa0TohyKXuLCLU/lCWZBbybhU2K0p+RG+ubg5ZdSoOMjRhdiGdRUyBJO+BNoThkadSd7iGjjfy0Q/PEHp+F/XFD7uld5rvAa6S/MLUdymw8MPotk/YP7YLVn7IVl7mpY8YyZPWsYzAX82m4nYSSxOtZpHeJeYAMnjoj9CkPx179DTDDzsp3RMyYSHOCnipx3bvisqwLx98ExN5ZzODB4K44VXj7XnspG7J5Fn6YhhnuEXgGF8vLBrbZD9j47yijwLYf6Aqeb+AUe53n8Jsb7OTXTbpeQlhnq4Tmvvtqv8rpA5OJex2WghzEp0XYEflxwO4FXk78o2TdcshNsMUkVL3Q6iXk3dXhFcKi3BDbrWkuR0oKi/67oWe8DhtMFi2X6Q0g8oVpoLr9pcPfnpW5dqO+kcaZ+zUdDmZwt3vXOOVNTQW9gBbXzb2L0xG8JMEhYC78E4Dpiqc1jv7x8AqXYHSgo13B5vbe0OvfexpfF2a3H9jLVSmcc+3BRJzvWvNlJSzUTQQuNiOcPMDOp9b0T+BCgCys0t/K3u2dFWGXC53NZs0LU4Wyt1gQkhNqJ1ij7VBXqnTHIbmQUOkArc"
`endif