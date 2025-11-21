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

module eth_f_ptp_adapter_tx #(
    parameter SIM       = 0,
    parameter READY_LATENCY = 1,
    parameter WORDS     = 1,
    parameter DWIDTH    = 64,
    parameter AWIDTH    = 5
) (
    input   logic                   i_clk,
    input   logic                   i_reset,
    input   logic                   i_avst_tx_valid,
    input   logic                   i_avst_tx_ready,
    input   logic                   i_avst_tx_sop,
    input   logic   [DWIDTH-1:0]    i_data,
    input   logic                   i_seg_tx_valid,
    input   logic   [WORDS-1:0]     i_seg_tx_inframe,
    output  logic   [DWIDTH-1:0]    o_data
);

    logic delayed_avst_tx_ready;
    logic wena;
    logic rena;
    logic [AWIDTH-1:0] waddr;
    logic [AWIDTH-1:0] raddr;
    logic              r_seg_tx_inframe;
    logic [WORDS-1+1:0] seg_tx;
    logic seg_tx_sop;
    
    // handle ready_delay
    eth_f_delay_reg #(
        .CYCLES (READY_LATENCY),
        .WIDTH  (1)
    ) i_ehip_delay_reg (
        .clk    (i_clk),
        .din    (i_avst_tx_ready),
        .dout   (delayed_avst_tx_ready)
    );
    // write mechanism
    assign wena     = (i_avst_tx_valid & delayed_avst_tx_ready & i_avst_tx_sop);
    
    always @ (posedge i_clk) begin
        if (i_reset) begin
            waddr   <= {AWIDTH{1'b0}};
        end
        //else if (i_avst_tx_valid) begin
        else if (wena) begin // wena already qualified with tx_valid
                waddr   <= waddr + 5'd1;
        end
        //end
    end
    // read mechanism
    assign seg_tx       = {i_seg_tx_inframe, r_seg_tx_inframe};
    assign seg_tx_sop   = |(seg_tx[WORDS:1] & ~seg_tx[WORDS-1:0]);
    assign rena         = i_seg_tx_valid && seg_tx_sop;
    
    always @ (posedge i_clk) begin
        if (i_reset) begin
            r_seg_tx_inframe <= 1'b0;
            raddr            <= {AWIDTH{1'b0}};
        end
        else if (i_seg_tx_valid) begin
            r_seg_tx_inframe <= i_seg_tx_inframe[WORDS-1];
            if (rena) begin // read
                raddr   <= raddr + 5'd1;
            end
        end
    end
    
    // memory
    eth_f_mlab #(
        .WIDTH      (DWIDTH),
        .ADDR_WIDTH (5),
        .SIM_EMULATE(SIM)
    ) mem (
        .wclk       (i_clk),
        .wena       (wena),
        .waddr_reg  (waddr),
        .wdata_reg  (i_data),
        .raddr      (raddr),
        .rdata      (o_data)
    );

endmodule // eth_f_ptp_adapter_tx

`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "iuBeK6jR69XRNHgPOXANQcgjB4WcZGkPF3FM4twIZ3EvsrAtxQsYS6Hpi5XGvIMMcH9N6DPm/kmHi0wPOQiuTHVVVxmr9OiPO/RVoCdNzGMPvFnw/zRMf5njlvSl/Ap+x6pvul8+7XHuyLyqwObdmDkbCQayz2DnxYXZjjt2proJ3XfkjECmKOX4nN4VQ1AR4UGhbU0fMVSMpGQjFTDlax90AVVn6m/PSOsKahRUPX8ZnvPz/OsJihZJuyM/l/iWQaLvhwSVCqOvy7oLMOj1fydkdYtvdAbUvm5DUR+A6ZKXOynsPI/zu5hI08A9ZcOv7IU6aZhRhWgABy6o5K/Szgcc/3KPUuiDlWpwePKTT5Ly5ZSFpLJFvYJ6Kn0EZG6vUb/JxWNMYSbby/ZO+bDa2pxy2L2ilB+R/9PnHY4aFZ1fAHyov4euFjZYYm1H1b30C9Fj1HOA361ml/1HgORxTujK5pQMYRocpeKU7sfa6U/jViJJlvL6U5/OgNuuriWkMKpYcJcqe88VSePCYH1IUlIci4GKaM2x5Uy47ugqEg/PNkgeByxr017Cuj+lFBHJFAmVxdD/j92kbg4XDMtKKuTRdEo4LQ0/5CDvsoRyVU4xj/X5DpHWMzoT7NwM4MZxvaJPNtKrDhcbdfQR9t0CU/SaQyZlHnWSI5fUSduGXGDcC+I0/XxI5r3OXOBpscJcQPMfcBDF8CjLFg/QRLijKQ7Lzb13yekrb2ATShWOr4qbavpB8n281oei45AtXnHiDt75LzI3f/VkcLGVpFlMJqpAnjl4orrNutAAUbYPSrZJURoeXBgv8kR6TmNss4q66ifp5XI2lniC+MbNPKyKE2vgHquHfplBqx+xYj8jqfvewYFjOqTCXTC0AYtn0g2Ux60Lm2LvCr4AleAduE1hUZN/jup/TOdH4HFJC/NWcJF2ENoDWbaGH0gFqvaQlQ0u7ohb/1Js/yCocugBPZGULdulAC8BwcDLtBFl34oJfdx4OQk9Z+5IssFTNbZHwj3h"
`endif