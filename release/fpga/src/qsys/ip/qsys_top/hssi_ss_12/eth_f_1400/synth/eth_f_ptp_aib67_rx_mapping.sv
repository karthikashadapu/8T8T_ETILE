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



module eth_f_ptp_aib67_rx_mapping #(
    parameter WORDS     = 1,
    parameter EHIP_RATE = "10G", // Ethernet rate - "10G" "25G" "40G" 50G" "100G" "200G" "400G"
    parameter RX_WIDTH  = 3+1*9
)
(
    input logic                             i_clk,
    input logic [WORDS-1:0][RX_WIDTH-1:0]   i_rx_data,
    output logic [1:0][51:0]                o_rx_ptp
);

// Golden Rules:
// 400G case
    // o_rx_ptp[1] -- AIB6
    // o_rx_ptp[0] -- AIB7
// 10G-200G case
    // o_rx_ptp[1] -- tie 0
    // o_rx_ptp[0] -- AIB6 or AIB7 (based on SW placement)..for now always AIB7

    logic [WORDS-1:0][RX_WIDTH-1:0] rx_data_r;
    logic [1:0]                     rx_aib_dsk;
    logic [15:0]                    ptp_rx_ts;
    logic [15:0]                    ptp_tx_fp;
    logic [15:0][2:0]               ptp_tx_ts;
    logic [1:0][3:0]                ptp_rx_debug;
    logic [1:0][3:0]                ptp_tx_debug;
    logic [1:0]                     ptp_tx_ts_valid;
    logic                           rx_am;
    logic                           tx_am;

    // Timing closure purpose
    always @ (posedge i_clk) begin
        rx_data_r <= i_rx_data;
    end

    genvar i;

    generate
        if (EHIP_RATE == "400G") begin: ptp_rx_data_400G
            assign rx_aib_dsk[0]        =   rx_data_r[0][10];
            assign rx_aib_dsk[1]        =   rx_data_r[8][10];

            assign ptp_tx_ts_valid[0]   =   rx_data_r[0][4];
            assign ptp_tx_ts_valid[1]   =   rx_data_r[8][4];
        end
        else begin: ptp_rx_data_others
            assign rx_aib_dsk[0]        =   rx_data_r[0][10]; // 25G active AIB
            assign rx_aib_dsk[1]        =   rx_data_r[0][10]; // 25G unused AIB - MUST PROVIDE DESKEW PULSE, OTHERWISE DESKEW WILL FAIL. steal from active AIB
            
            assign ptp_tx_ts_valid[0]   =   rx_data_r[0][4];  // 25G active AIB
            assign ptp_tx_ts_valid[1]   =   1'b0;             // 25G unused AIB
        end
    endgenerate

    assign rx_am    =   rx_data_r[0][6]; // 25G active AIB - same code for 400G
    assign tx_am    =   rx_data_r[0][3]; // 25G active AIB - same code for 400G

    generate
        for(i = 0 ; i < 16 ; i++ ) begin: rx_data_remap
            if (i < WORDS) begin
                assign ptp_rx_ts[i]     =   rx_data_r[i][7];   // active AIB
                assign ptp_tx_fp[i]     =   rx_data_r[i][5];   // active AIB
                assign ptp_tx_ts[i]     =   rx_data_r[i][2:0]; // active AIB
            end
            else begin: rx_data_remap_zero
                assign ptp_rx_ts[i]     =   1'b0;              // unused AIB
                assign ptp_tx_fp[i]     =   1'b0;              // unused AIB
                assign ptp_tx_ts[i]     =   3'h0;              // unused AIB
            end
        end
    endgenerate

    generate
        if (EHIP_RATE == "400G") begin: ptp_debug_400G
            assign ptp_tx_debug[0]      =    {rx_data_r[ 4][8],rx_data_r[ 3][8],rx_data_r[ 2][8],rx_data_r[0][8]};
            assign ptp_tx_debug[1]      =    {rx_data_r[12][8],rx_data_r[11][8],rx_data_r[10][8],rx_data_r[8][8]};
            
            assign ptp_rx_debug[0]      =    {rx_data_r[ 4][9],rx_data_r[ 3][9],rx_data_r[ 2][9],rx_data_r[0][9]};
            assign ptp_rx_debug[1]      =    {rx_data_r[12][9],rx_data_r[11][9],rx_data_r[10][9],rx_data_r[8][9]};
        end
        else if (EHIP_RATE == "200G" || EHIP_RATE == "100G") begin: ptp_debug_200G_100G
            assign ptp_tx_debug[0]      =    {1'b0,rx_data_r[ 3][8],rx_data_r[ 2][8],rx_data_r[0][8]};
            assign ptp_tx_debug[1]      =    4'h0;
            // assign ptp_tx_debug[1]      =    {1'b0,rx_data_r[11][8],rx_data_r[10][8],rx_data_r[8][8]};
            
            assign ptp_rx_debug[0]      =    {1'b0,rx_data_r[ 3][9],rx_data_r[ 2][9],rx_data_r[0][9]};
            assign ptp_rx_debug[1]      =    4'h0;
            // assign ptp_rx_debug[1]      =    {1'b0,rx_data_r[11][9],rx_data_r[10][9],rx_data_r[8][9]};
        end
        else if (EHIP_RATE == "50G") begin: ptp_debug_50G
            assign ptp_tx_debug[0]      =    {3'h0,rx_data_r[0][8]};
            assign ptp_tx_debug[1]      =    4'h0;
            // assign ptp_tx_debug[1]      =    {3'h0,rx_data_r[8][8]};
            
            assign ptp_rx_debug[0]      =    {3'h0,rx_data_r[0][9]};
            assign ptp_rx_debug[1]      =    4'h0;
            // assign ptp_rx_debug[1]      =    {3'h0,rx_data_r[8][9]};
        end
        else begin: no_ptp_debug
            assign ptp_tx_debug[0]      =    4'h0;
            assign ptp_tx_debug[1]      =    4'h0;
            
            assign ptp_rx_debug[0]      =    4'h0;
            assign ptp_rx_debug[1]      =    4'h0;
        end
    endgenerate

    generate
        for(i = 0 ; i < 16 ; i++ ) begin: fp_ets_its
            if( i < 8) begin
                assign o_rx_ptp[0][4+i*5]       = ptp_rx_ts[i];
                assign o_rx_ptp[0][3+i*5]       = ptp_tx_fp[i];
                assign o_rx_ptp[0][i*5+:3]      = ptp_tx_ts[i];
            end
            else begin
                assign o_rx_ptp[1][4+(i-8)*5]   = ptp_rx_ts[i];
                assign o_rx_ptp[1][3+(i-8)*5]   = ptp_tx_fp[i];
                assign o_rx_ptp[1][(i-8)*5+:3]  = ptp_tx_ts[i];
            end
        end
    endgenerate
    
    assign o_rx_ptp[0][51]      = rx_aib_dsk[0];
    assign o_rx_ptp[1][51]      = rx_aib_dsk[1];
    
    assign o_rx_ptp[0][50:47]   = ptp_rx_debug[0];
    assign o_rx_ptp[0][46:43]   = ptp_tx_debug[0];
    
    assign o_rx_ptp[1][50:47]   = ptp_rx_debug[1];
    assign o_rx_ptp[1][46:43]   = ptp_tx_debug[1];
    
    assign o_rx_ptp[0][42]      = rx_am;
    assign o_rx_ptp[0][41]      = tx_am;
    assign o_rx_ptp[1][42]      = 1'b0;
    assign o_rx_ptp[1][41]      = 1'b0;
    
    assign o_rx_ptp[1][40]      = ptp_tx_ts_valid[1];
    assign o_rx_ptp[0][40]      = ptp_tx_ts_valid[0];

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "iuBeK6jR69XRNHgPOXANQcgjB4WcZGkPF3FM4twIZ3EvsrAtxQsYS6Hpi5XGvIMMcH9N6DPm/kmHi0wPOQiuTHVVVxmr9OiPO/RVoCdNzGMPvFnw/zRMf5njlvSl/Ap+x6pvul8+7XHuyLyqwObdmDkbCQayz2DnxYXZjjt2proJ3XfkjECmKOX4nN4VQ1AR4UGhbU0fMVSMpGQjFTDlax90AVVn6m/PSOsKahRUPX/HSWnb1K/PukEeTPIaAAbMyRFE/ztUcMAWcewoFNVVcUstk42EF+nl/jAfOUnRjB+GiqZrM/ki8HQsCsL331lZr43Sm2MzlPuL8FmuRpcXjPP6UT+F9ZMfj7aiI/v25LRPP6vVmm94IGhrG6mzS/JqZF6ztpiiJKri0NWJlbPuEPYCMm65N7S3HeHtfJi6obJZPzUuqswljVOWfmaicQIf45eo1Cr7l0QByCQNe6JN+mPHiOattOtRhxjRHzNgnSaRwy2Li/V52xhiAfv8ofwBCUY8U9F5wT3ekipNJ7Bgq6OXqXLPfZ680BMg6bD6hPNgfMOZAQluCCxXPvncqfF+hm0+daQ/dggWKI5X7D7J/o2xafACKF8ikSp8oTGSIx+pa4Nwikm0ZDogV+UZ0z5/CUMBJNXbU4i83/6uVNAPrYgmxsIEyztARMkU+7PRESZ4VXZuXXr5m+H7v2yCqM5q/PQzAkqIBEKHLqQvo4KrXiJwPPBPwLzFtvRF1t7NAwVMtYAWRYKEkiRj0Bbfn8N5zKQRmpp44VfcytuyfrwePbUU7kd4D3tbKxbPQvhQGAcFvDmQy6KbPXLhPe9x9OAttaCRdaJTbECQm53jVe2dmKL9bQJLtOM7rxOliGC85W8WQ1ON59pTI0udJzpUqfPnD09xBfVgD8HitflOWMnJjExRphtyzfGqn6XtVVE+m3douSilSyKSNklVFoIzNTtYZNPTZOEAdCPKu2sr0B68GoVR0g+oWQpccwe9g1U+NfNgTGRqR180r+tqdwimhlg/"
`endif