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

module alt_ehipc3_fm_100g_adapter_data_aligner #(
    parameter WIDTH = 32
) (
    input   logic                       clk,
    input   logic   [0:7][WIDTH-1:0]    din,
    input   logic   [2:0]               index,
    output  logic   [0:7][WIDTH-1:0]    dout
);

    logic   [0:7][WIDTH-1:0]    temp;
    logic   [1:0]               index_2;

    always_ff @(posedge clk) begin
        index_2 <= index[2:1];
        case (index[0])
            1'd0 : temp <= din;
            1'd1 : temp <= {din[1:7], din[0]};
        endcase
    end

    always_ff @(posedge clk) begin
        case (index_2)
            2'd0 : dout <= temp;
            2'd1 : dout <= {temp[2:7], temp[0:1]};
            2'd2 : dout <= {temp[4:7], temp[0:3]};
            2'd3 : dout <= {temp[6:7], temp[0:5]};
        endcase
    end
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "sj2EnSVIknGz65j61L+DMMO3HDcSN2jhvr55koJ1ECJkPtG0Fw9q9R2fIYYgv2BPR8BrsR+RYKuIJjlYQNmgnXVjvtJtJool3uQURgCFpQL23pok+Wr2TXSNbySMdXxV2gz6CwxUk+0+/rDLrsroCzkAiFw2amgz6Do5tJQltYjCIPqHFj/3UZep9T4dBvB83T//SpBFZzgCz+Lzrx+1A17RXSmjyar6SF3JSJg+7B3S/5BpgyQO91mzvNcfPOpw4znwpfnJwWCyhkzZBExLbPPuN1fDj8J5bJTLCzKk+lJJ6Fli4wa4dDEpUyt8tSSKZY8IA2oMOtoddrSDEZnieyanyFz3PGToALCbwPKB5/PN6dXeg7UN7oeivDqESjH4lfQOBKLfU5zqB+lRqjZ2vSbEcBJH6VM/RuO1VOA0wAWLeE5f4+lBU36vrMGAO2XSEM3FdAZYTegBd9zrRTe4L660WxroSvBbKtEQmIwkKAaVkLmHvhZlVIA0olG7RlzSzLEyBHK9+Gg/mBpj/wJ5k04o+LSaJQq2C80ZhTsSnMHhmNwjgexdhvVw+C1+QMfz9FjaKaUMajPDH/VpexUWWNG2NyJbuAjZQg4lBQC5hv0UpKTMrRYUYVDhpVVA8YNM4uGn9aS5NhsRTi1xiWkGie97zP7FbDkceN+jpnyGfnxD7xEzDzrZ9TAgaOgsBKHReMRFqhZUzuXt4d60/0x+NHAtGqwY1RnX6vEnb+TSKgwmOWBLrX23TBfPoCRt1B7lMuTcX+YJw92YFJk1T7Qes3NiAZwW8NwBbBTv/ArTqSWpedXJK35PGZD4m+wrR1CoEQ9ygvH/ONaj4gKQXrpExER2tPbjn7LMFZu3qTWWvOh/1j8/eu76mOyZv5Kc3xnmZX6BIBUIQbYWyKeG+5bsSrwfPL/7XqIZW/nxZXX7eikmJPBFblMi0C0DH4eEed3ovCdp8YMUSCkBzJJPPt/3G/M+kbVNXWB1bWdueUmgzrT0eX0NeeMIbdfUL0K5X2WM"
`endif