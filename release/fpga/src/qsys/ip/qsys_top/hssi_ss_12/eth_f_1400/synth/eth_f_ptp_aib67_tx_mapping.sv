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


module eth_f_ptp_aib67_tx_mapping #(
    parameter WORDS     = 16,
    parameter TX_WIDTH  = 3+1+5+1
)
(
    input logic                             i_snapshot_ptp_vl_data,
    
    input logic [WORDS-1:0][4:0]            i_tx_ptp_ts,
    input logic [WORDS-1:0]                 i_tx_ptp_fp,
    input logic [WORDS-1:0][2:0]            i_tx_ptp_ins_type,

    output logic [WORDS-1:0][TX_WIDTH-1:0]   o_tx_data
);

    genvar i;

    generate
        for (i = 0; i < WORDS; i = i + 1) begin: tx_ptp_remap
            assign o_tx_data[i] = { i_snapshot_ptp_vl_data,
                                    i_tx_ptp_ts        [i],
                                    i_tx_ptp_fp        [i],
                                    i_tx_ptp_ins_type  [i]};
        end
    endgenerate

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "iuBeK6jR69XRNHgPOXANQcgjB4WcZGkPF3FM4twIZ3EvsrAtxQsYS6Hpi5XGvIMMcH9N6DPm/kmHi0wPOQiuTHVVVxmr9OiPO/RVoCdNzGMPvFnw/zRMf5njlvSl/Ap+x6pvul8+7XHuyLyqwObdmDkbCQayz2DnxYXZjjt2proJ3XfkjECmKOX4nN4VQ1AR4UGhbU0fMVSMpGQjFTDlax90AVVn6m/PSOsKahRUPX9X+LR8TVZfzdpt516pQUhJDIl6bBVhU6B4kKF9zZoFgu+VgyUpk3I4dtwU9UClo9kT/jX5MJJ1stBPhtp1hSpL3JCOGXdbZWDgjINt6r9HE2Zq00HeomWuC1XiFyV493k6e3ZwJG1C9S5dNb/uoTGo410Kd0nGCg5N1/b9fbDAdBsHhHg5zL+4ez9pUEU/AFVk1/f7+hc5idr8gALuRSlmH4kcGriF70sNPIO46h1I97j08l+fCOJuor6vZBDEzHyg2BwWUSyrQdBzNT7H0TxO8+ClFDB2ZlO+xPuEGC3QH+eQfuq0jCW22nrHugahfIfAmij0VrCRLRCw3EuX2TewYRY2Imn6OMhGENh2bqEKfc49+emJio5TBb+0oibcfACRHcFkHHKHkxVlV6m93N3y6KLvVZg8VeDsMftvaVaBdPHy3jvqfa15OWPDJiPaZfkYl6Xuue9gh9aTUogChibJv20zsJXV5qdn+xT2dae0kUa9AMSq6V3Qc95wmEAMTxNzHcse/IgclYUxh3teUhDao6EZlETeaabhg8CVA0WrDJSUYywqJPaYyyQSXBPMfLIGOFhxIG+R71kOaGTtQuCbfpdUJpLP/oLbtKTJD5CDRKhJVC/FaxhYFVizhadNcormVBistoB4vM2nq11Tru8st2r3G07mdlB+rjzV7s8wtpOr9244MG+9A98jqfwXVSLP4ScrcawbSydKY4HPJKyewbPC9bBiumRP9hNCJWcFUjuE1ygB1t4RdAZO8XKOoeKk8HILK+VNO9vsOsD0VdU+"
`endif