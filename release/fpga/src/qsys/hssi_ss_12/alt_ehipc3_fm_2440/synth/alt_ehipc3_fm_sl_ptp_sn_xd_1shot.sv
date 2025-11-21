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
// Filename         : alt_ehipc3_fm_sl_ptp_sn_xd_1shot.sv
// Author           : Shoaib Sial <shoaib.sial@intel.com>
// Created On       : Wed Sep 11/09/2019 
//
//------------------------------------------------------------------------------

module alt_ehipc3_fm_sl_ptp_sn_xd_1shot  #(
    parameter SYNC_FLOPS = 3
 ) (
	input  logic                     i_reset_n,
	input  logic                     i_clk,
	input  logic                     i_async_triger,
 	output logic                     o_sync_pulse_xd_1s,
        output logic			 o_sync_triger_2d
 
);



  logic       sync_triger_2d;
  logic       sync_triger_3d;

`ifdef __ALTERA_STD__METASTABLE_SIM
    alt_ehipc3_fm_xcvr_resync_norand_std #(
`else 
    alt_xcvr_resync_std #(
`endif
        .SYNC_CHAIN_LENGTH  (SYNC_FLOPS),
        .WIDTH              (1),
        .INIT_VALUE         (0)
    ) async_2ds (
        .clk                (i_clk),
        .reset              (1'b0),
        .d                  (i_async_triger),
        .q                  (sync_triger_2d)
    );

  assign o_sync_triger_2d = sync_triger_2d;

  always@(posedge i_clk) 
  begin	
    if(!i_reset_n)
      sync_triger_3d <= 1'b0;
    else
      sync_triger_3d <= sync_triger_2d;
  end

    assign o_sync_pulse_xd_1s = sync_triger_2d ^ sync_triger_3d;


endmodule //


`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "zxbEFFp84WYRbJsb0HIMeuWjbOOv1K7QQFpH53Gb3V5p0ZRDdhsMAxwP11nnT9uCTG31WcRFMGv1Y3sp3Jccq/UYKIiEbrkv+dnQkRqN6m6gKWqiXtHiiORyaZNWlpsJ1uOJVOw5+WI+1xrepR1EmwGCsDi2F6K1UWIUsyOHvXTbPREtmL97zvP7WTaw1mXrLe+4BbR/6Dd7pfQ4tTt2P5iQPOMdgtxNDjbWzf8Mv5P2eUMdM7X5s6dOTWAB0qy3xEOQZhFi8EBDe1mCq12KOkn8rRagR8nzFrkUZHe15rM43n1vCloNoLAELOkWrAvh9LM0cCVfJ7Uzyd+hYbINlLIvHy+2zFM+6jh8DRuQo1/01lqOrdX161SVROupEJrD7ZM6uHM8kFHrp4vYnjHJ1S8LHuF8yqh9KS/2uf7yIqB8iNkzjAuATLCnis7iGkLnLDsBgAFSLKVfpiAsvQGyrnu8DH59zu9waxRpL9Thjp0meWkssTUvXm6NMSmQjravbckQh9lgSf+loVEP7htYQMFpldpeNQRTjvwfiQJL6WYLsU907/CtaNF0uzi1n7rwmkkK+z/CF8u/HqmiSCs7b1GuLgKsY6m9mZ+vBD65n0DbiUcoy58xk2UroKxuC9xcuJCqom2aCYzAfMmhTD25zNNyYsty7KvLZy/8NUR2Ns9gqMHpE+yRRPBVV5JQ3iCvZXLBp4nRsz0CPyc2Z6gxgjkmiBTy0bLeByqJHeA/jwpcVVPx1KhmmPNCwSNRmeZIUSA+S0TcSR9c5yyUxqpFJhQCNpIGZu4BDglYrT5SqkO4jSlJbIGThuOjVF6Qif6ZF44uW3ZECe8zMOQciCbZvQJstTGlkiZa4Xwp11dJDOiyJfvG/M/jIqBIsdT4icRfO9g/qebalvflhhmIzmDlyYqgMKXl9EZTkvAUQTi6nptBo7ZgZMh4ZwC2kXxbD5Sv66hsGbSt8d9yNSJ7HLphRjvl+GOpksqg1la4ogJz2I7mbji+jUfYa9BBOELZZLzc"
`endif