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


`timescale 1 ps / 1 ps

module  eth_f_ptp_adapter_tx_async
#(
   parameter READY_LATENCY = 1,
   parameter WORDS      = 1,
   parameter DWIDTH     = 168,                  // FIFO Input data width 
   parameter AWIDTH     = 5,                    // FIFO Depth (address width) 
   parameter SYNCSTAGE  = 3                     // Metastable hardening stages
)  (
    input   logic                   i_wrclk,
    input   logic                   i_avst_tx_valid,
    input   logic                   i_avst_tx_sop,
    input   logic                   i_avst_tx_ready,
    input   logic   [DWIDTH-1:0]    i_data,
    input   logic                   i_rdrst,
    input   logic                   i_rdclk,
    input   logic                   i_seg_tx_valid,
    input   logic   [WORDS-1:0]     i_seg_tx_inframe,
    output  logic   [DWIDTH-1:0]    o_data
);

    logic               delayed_avst_tx_ready;
    logic               wena;
    logic               rena;
    logic               full;
    logic               empty;
    logic               r_seg_tx_inframe;
    logic [WORDS-1+1:0] seg_tx;
    logic               seg_tx_sop;

    // handle ready_delay
    eth_f_delay_reg #(
        .CYCLES (READY_LATENCY),
        .WIDTH  (1)
    ) i_ehip_delay_reg (
        .clk    (i_wrclk),
        .din    (i_avst_tx_ready),
        .dout   (delayed_avst_tx_ready)
    );
    // write mechanism
    assign wena         = (i_avst_tx_valid && i_avst_tx_sop && delayed_avst_tx_ready && ~full);
    
    // read mechanism
    assign seg_tx       = {i_seg_tx_inframe, r_seg_tx_inframe};
    assign seg_tx_sop   = |(seg_tx[WORDS:1] & ~seg_tx[WORDS-1:0]);
    assign rena         = i_seg_tx_valid && seg_tx_sop && ~empty;

    always @ (posedge i_rdclk) begin
        if (i_rdrst) begin
            r_seg_tx_inframe <= 1'b0;
        end
        else if (i_seg_tx_valid) begin
            r_seg_tx_inframe <= i_seg_tx_inframe[WORDS-1];
        end
    end

    dcfifo  dcfifo_component (
                .aclr       (i_rdrst),
                .data       (i_data),
                .rdclk      (i_rdclk),
                .rdreq      (rena),
                .wrclk      (i_wrclk),
                .wrreq      (wena),
                .q          (o_data),
                .rdempty    (empty),
                .wrfull     (full),
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
        dcfifo_component.rdsync_delaypipe       = SYNCSTAGE,
        dcfifo_component.read_aclr_synch        = "ON",
        dcfifo_component.underflow_checking     = "ON",
        dcfifo_component.use_eab                = "ON",
        dcfifo_component.write_aclr_synch       = "ON",
        dcfifo_component.wrsync_delaypipe       = SYNCSTAGE;


endmodule //eth_f_ptp_adapter_tx_async


`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "iuBeK6jR69XRNHgPOXANQcgjB4WcZGkPF3FM4twIZ3EvsrAtxQsYS6Hpi5XGvIMMcH9N6DPm/kmHi0wPOQiuTHVVVxmr9OiPO/RVoCdNzGMPvFnw/zRMf5njlvSl/Ap+x6pvul8+7XHuyLyqwObdmDkbCQayz2DnxYXZjjt2proJ3XfkjECmKOX4nN4VQ1AR4UGhbU0fMVSMpGQjFTDlax90AVVn6m/PSOsKahRUPX8mI9q1AXvYb4Gdiu+JjzeThEX79qvbk+mJpWTssCb12+tt9BFKkotbCwf+ZTiR/y6gTM7rqI6u3H3sT5SG6wyNY+6yPxzTVSNHqJlML9W1wErYuh5EnKgv6Ou8RyoBrlso076ivIgiq7FHXcb5Nwr+1oPeuPiD9uYrtjuAW5PutpQFd3dYq9LYYTS0wDLBpONw8A+xelI7y5BRzc6prEU4rdzzDf7Rqh5JskEk+9ER7Jih/RrGoonCut5jfamZ1MoxdOeBe2WoFlLw2gngmmg44jTZtGA2v8NYZSn4gznykPzcbr1Rdx7okOKlLjqoZjYCLMRqeq7FxpkWjuhyYW0PKr3Nrq644ArrQVOHGRRhWDGwW8gH40xhhH+vdZA2F42Nub6JwPW1rfDTjA8Q+Ab26DyFY7uQbmQg3PYDEJj8C9cgbCV/FqCOB7i4u+QFji01s06H0pEoPkjXalrAnoth7AlTAucLMIEtaiL5Pe83W3caC29aOylXPSJRTIX5VsWyikm6bPMqAHrtZ4mf5bamoZAn+PDMJnhopd6WI+im6dZOsyBnUfhz1gllndIiWnd2Apk6IpueHAJt0O+gfcceaS0MpRszCZifCn5ehMxpCVS9GnT+BL0t6VUDobmqZ+/gpjxV9fW0n9HgNzVnegEI9DGbUGFc0/s+bPc+OJPpKAx0TUZOehGWR0M4E/95cA80UszIhr5zjDoq3FNChIl4WbL33nnIN8aNTv9av+jvx9yH7t6y5K9hnH5t4/+h/80ShQitoxfIoWOmeLAY7IVv"
`endif