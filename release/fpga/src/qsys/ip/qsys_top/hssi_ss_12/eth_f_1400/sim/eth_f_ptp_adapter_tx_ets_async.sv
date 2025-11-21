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

module  eth_f_ptp_adapter_tx_ets_async
#(
   parameter WORDS      = 1,
   parameter DWIDTH     = 168,              // FIFO Input data width 
   parameter AWIDTH     = 3,                // FIFO Depth (address width) 
   parameter SYNCSTAGE  = 3                 // Metastable hardening stages
)  (
    input   logic                   i_wrrst,
    input   logic                   i_wrclk,
    input   logic                   i_valid,
    input   logic   [DWIDTH-1:0]    i_data,
    input   logic                   i_rdclk,
    output  logic   [DWIDTH-1:0]    o_data
);

    logic               wena;
    logic               rena;
    logic               full;
    logic               empty;
    logic [DWIDTH-1:0]  int_q;

    // write mechanism
    assign wena         = i_valid && ~full;

    // read mechanism
    assign rena         = ~empty;

    assign o_data = rena ? int_q : {{DWIDTH}{1'b0}};

    dcfifo  dcfifo_component (
                .aclr       (i_wrrst),
                .data       (i_data),
                .rdclk      (i_rdclk),
                .rdreq      (rena),
                .wrclk      (i_wrclk),
                .wrreq      (wena),
                .q          (int_q),
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


endmodule //eth_f_ptp_adapter_tx_ets_async


`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "iuBeK6jR69XRNHgPOXANQcgjB4WcZGkPF3FM4twIZ3EvsrAtxQsYS6Hpi5XGvIMMcH9N6DPm/kmHi0wPOQiuTHVVVxmr9OiPO/RVoCdNzGMPvFnw/zRMf5njlvSl/Ap+x6pvul8+7XHuyLyqwObdmDkbCQayz2DnxYXZjjt2proJ3XfkjECmKOX4nN4VQ1AR4UGhbU0fMVSMpGQjFTDlax90AVVn6m/PSOsKahRUPX+eusFxcAebKZjM34ebfvyJ7nd6iMXy7die7KXRqMu3gZvz8VIavD38F7A6N385NpFweMgcORD7t9ZWcW/xC6ZftW7OHN51QKc6xsa+NDWdVwxhv1JOqpCDpvKxWZUfYZFhn+cgFc3wogF5u6CaG+1TqH7M2IjeuUvvchW39bMEyQukeYxmObX4tKYnWiCtKz8zCJ+EVL6z+ezyx2qF1dtwQwSvQrIlzNBLNTN4RHfyZLDQEEVgU6gxc7TK/0wle/ghJkP5OpckbBOioLM2OoEvMW+YTp3GxVJlu25Ks7otWLK+NfcupQkT9yfCITbj+B4Q5bD5dCFLkLqJ0KqpPI5albw7PiXvz51CVczcqRErKu4O0DfqA7LjPiEX5tdQWxJdyTY8DCy/AAJQvVlTdgHkX/HYAlyVKEzCqyi+hS1NtECAQwlZgRMSupeKI3eT6szMMD1r65LfFbrWPKqLVbsM+MdGauiHQIuynb2W0u/Usqc+5yCucWZT//XetWvSD/0k0dMU9Rfl0Azo/Ff3lXu26frzTLc5Kht4EQ28UNcphTxV8cjuqWqBfh83cge42PfFLtCcoZ853+xSDJOksMv8gQvCqJzde3I5ZDjyggJKLtNrGY9YY5MLY7Zp7/BzWykVx6sgLQLB7szpWXTV8cN99DytOzbspTyo4iD3AWZsw3cvclWZJvnNwr2MAGHXQQni/nqArrOzJYEl2lxd2eib54GDV+ZxMTYiguw4eUgi6HzoMtclyct7RwBgpc0w28chzXRyczoUYUh/HCFDdgjw"
`endif