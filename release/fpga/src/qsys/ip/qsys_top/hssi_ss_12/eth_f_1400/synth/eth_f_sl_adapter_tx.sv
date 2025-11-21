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

module eth_f_sl_adapter_tx #(
    parameter WORD_WIDTH    = 64,
    parameter EMPTY_BITS    = 3,
    parameter PTP_WIDTH     = 1,
    parameter READY_LATENCY = 1,
    parameter SIM_EMULATE   = 1,
    parameter NUM_CHANNELS  = 1
) (
    input   [NUM_CHANNELS-1:0]                        i_clk,
    input   [NUM_CHANNELS-1:0]                        i_reset,

    // Client interface
    input   [NUM_CHANNELS-1:0]                        i_valid,
    input   [NUM_CHANNELS-1:0][WORD_WIDTH-1:0]        i_data,
    input   [NUM_CHANNELS-1:0]                        i_sop,
    input   [NUM_CHANNELS-1:0]                        i_eop,
    input   [NUM_CHANNELS-1:0][EMPTY_BITS-1:0]        i_empty,
    input   [NUM_CHANNELS-1:0]                        i_error,
    input   [NUM_CHANNELS-1:0]                        i_skip_crc,
    input   [NUM_CHANNELS-1:0][PTP_WIDTH-1:0]         i_ptp,
    output reg [NUM_CHANNELS-1:0]                     o_ready,

    output  [NUM_CHANNELS-1:0][WORD_WIDTH-1:0]        o_data,
    output  wire [NUM_CHANNELS-1:0]                   o_valid,
    input   [NUM_CHANNELS-1:0]                        i_ready,
    output  [NUM_CHANNELS-1:0]                        o_inframe,
    output  reg [NUM_CHANNELS-1:0][EMPTY_BITS-1:0]    o_empty,
    output  [NUM_CHANNELS-1:0]                        o_error,
    output  [NUM_CHANNELS-1:0]                        o_skip_crc,
    output  reg [NUM_CHANNELS-1:0][PTP_WIDTH-1:0]     o_ptp
);

    wire [NUM_CHANNELS-1:0]                         fifo_read;
    wire [NUM_CHANNELS-1:0]                         o_ready_delay;

    wire [NUM_CHANNELS-1:0][WORD_WIDTH-1:0]         av_data;
    wire [NUM_CHANNELS-1:0]                         av_to_ff_valid;
    wire [NUM_CHANNELS-1:0]                         av_inframe;
    wire [NUM_CHANNELS-1:0][EMPTY_BITS-1:0]         av_empty;
    wire [NUM_CHANNELS-1:0]                         av_error;
    wire [NUM_CHANNELS-1:0]                         av_skip_crc;
    wire [NUM_CHANNELS-1:0][PTP_WIDTH-1:0]          av_ptp;
    wire [NUM_CHANNELS-1:0]                         av_ready;
    wire [NUM_CHANNELS-1:0][1+1+1+EMPTY_BITS+WORD_WIDTH+PTP_WIDTH-1:0] ff_din;
    wire [NUM_CHANNELS-1:0][1+1+1+EMPTY_BITS+WORD_WIDTH+PTP_WIDTH-1:0] ff_dout;
    reg  [NUM_CHANNELS-1:0][1+1+1+EMPTY_BITS+WORD_WIDTH+PTP_WIDTH-1:0] ff_dout_reg;

    always @(posedge i_clk) 
        o_ready <= i_ready;

    eth_f_delay_reg #(
        .CYCLES (READY_LATENCY+1),
        .WIDTH  (NUM_CHANNELS)
    ) i_ehip_delay_reg (
        .clk    (i_clk),
        .din    (i_ready),
        .dout   (o_ready_delay)
    );

    assign o_valid = o_ready;

    genvar i;
    generate
      for (i=0; i<NUM_CHANNELS; i++) begin: gen_avf
        eth_f_sl_avalon_to_if #(
          .WORD_WIDTH (WORD_WIDTH),
          .EMPTY_BITS (EMPTY_BITS),
          .PTP_WIDTH  (PTP_WIDTH)
        ) i_ehip_avalon_to_if (
          .i_reset    (i_reset),
          .i_clk      (i_clk),

          .i_data     (i_data[i]),
          .i_valid    (i_valid[i]),
          .i_sop      (i_sop[i]),
          .i_eop      (i_eop[i]),
          .i_empty    (i_empty[i]),
          .i_error    (i_error[i]),
          .i_skip_crc (i_skip_crc[i]),
          .i_ptp      (i_ptp[i]),
          .i_ready    (o_ready_delay[i]),

          .o_data     (av_data[i]),
          .o_valid    (av_to_ff_valid[i]),
          .o_inframe  (av_inframe[i]),
          .o_empty    (av_empty[i]),
          .o_error    (av_error[i]),
          .o_skip_crc (av_skip_crc[i]),
          .o_ptp      (av_ptp[i]),
          .o_ready    (av_ready[i])
        );

        assign ff_din[i]      = {av_ptp[i], av_inframe[i], av_skip_crc[i], av_error[i], av_empty[i], av_data[i]};

      end: gen_avf
    endgenerate

    generate 
      for (i=0; i<NUM_CHANNELS; i++) begin : GEN_SCFIFO
        eth_f_scfifo_mlab #(
            .SIM_EMULATE (SIM_EMULATE),
            .WIDTH       (1+1+1+EMPTY_BITS+WORD_WIDTH+PTP_WIDTH)
        ) i_ehip_scfifo_mlab (
            .clk     (i_clk),
            .sclr    (i_reset),
            .wdata   (ff_din[i]),
            .wreq    (av_ready[i]),
            .full    (/* Unused */),
            .rdata   (ff_dout[i]),
            .rreq    (i_ready[i]),
            .empty   ()
        );

        // for better timing
        always @(posedge i_clk)
          ff_dout_reg[i] <= ff_dout[i];

        assign {o_ptp[i], o_inframe[i], o_skip_crc[i], o_error[i], o_empty[i], o_data[i]} = ff_dout_reg[i];
      end: GEN_SCFIFO
    endgenerate

    function integer clogb2;
      input integer input_num;
      begin
         for (clogb2=0; input_num>0; clogb2=clogb2+1)
           input_num = input_num >> 1;
         if(clogb2 == 0)
           clogb2 = 1;
      end
    endfunction

endmodule //eth_f_adapter_tx
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "Jbn39HeDxGqNcYGZOx4Z9ucCs2oEh/b8uMkRaNvB5DRjzJrJYrpJKWFCISE85ii6tH9zuuCEo6X0af6OauTQ+Ozwk1tsZmSo/aK9UOYVqiI4L0mMLnnDyFPJBEUN+znp6d+oie84TxrwJugN/66eG6ek4cTulks0EXWtTfhwKcotsw0Xz4/SS3GVym/4tne0z9smydSL74/eJ6ocrXzqMjpfEjy1qL7mzZl6AEz+onpvPwquIXeuwykXyLPN0vH8s0G/xZ7+wsvRe2buMjauEvERbu9uL32ujimHdh7AurzW3Kry1vfRXZTeePy5SDWGZwC663Z+sgNK7Y0arvmz66GpJ7vWDNa4PxpkkvV/uRnQeSjep95/9ngohIm9C08qxKbbEleBt3a4bxgmGIMVMrRmT/i/BSTL6EV1navlXQAHV1dJW365/CEd0Bn1S4pF+txQegAtAPZ8sd4gD9nUmz+vrF11pLfa9YkL9i023Q2CMx4x1q5h9Y0H+a8VViOWp9ARzKiynXsIzhwbMs+M/Y7n7JTYf1jY/r30UsPeN6vpHcmMqyqAjK7mNtBCIlqFo7XLgePs16uaWfWGOv+HpE9BUeqDA3Dp5shV2v70N6H32NvYOV/xRnDXH8urSttw1r7pZUfPWucZ51dP2qbzoTY3aKUg1S6aSha6ss0dxaikaSW3kXB1XfeeZf8TVZzytVK2KwmDEbS5ZdfyBEreHdEXpQpnru+28+DAYTyT+sSg0Qubsu8E/zS99p9MKK2g0WLSFOJlh9yclSc32YUCLcsoz3yN39FMqdff7Lez5XfIgmOBi4lo0svdAck8/ATuuMC8wUW344OBBbbsfk/eJUAFU2d39Mwq4FsoI1FKXFTmQVAkb0/311zV+S8Jk1LlwINOd93L6JWkomm8i7T4DlQZSLtqJaZERWb94kdEeUHwJhTLSPtdpty7OZX1DQ7rB0WzLDsemMbhj+v1dmsrf+3pIA1MVnrdkDM5yMiOCX7xf+QE6cKPVZ9QYAAmCpvr"
`endif