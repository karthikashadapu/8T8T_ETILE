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

module eth_f_100g_adapter_data_aligner_async #(
    parameter WIDTH = 32
) (
    input   logic                       clk,
    input   logic   [0:7][WIDTH-1:0]    din,
    input   logic   [2:0]               index,
    output  logic   [0:7][WIDTH-1:0]    dout
);

    logic   [0:7][WIDTH-1:0]            temp;
    (* dont_merge *) reg [0:7][1:0]     index_2;

    always_ff @(posedge clk) begin
        index_2 <= {8{index[2:1]}};
        case (index[0])
            1'd0 : temp <= din;
            1'd1 : temp <= {din[1:7], din[0]};
        endcase
    end

    // always_ff @(posedge clk) begin
    //     case (index_2)
    //         2'd0 : dout <= temp;
    //         2'd1 : dout <= {temp[2:7], temp[0:1]};
    //         2'd2 : dout <= {temp[4:7], temp[0:3]};
    //         2'd3 : dout <= {temp[6:7], temp[0:5]};
    //     endcase
    // end

    always_ff @(posedge clk) begin
        case (index_2[0])
            2'd0 : dout[0] <= temp[0];
            2'd1 : dout[0] <= temp[2];
            2'd2 : dout[0] <= temp[4];
            2'd3 : dout[0] <= temp[6];
        endcase

        case (index_2[1])
            2'd0 : dout[1] <= temp[1];
            2'd1 : dout[1] <= temp[3];
            2'd2 : dout[1] <= temp[5];
            2'd3 : dout[1] <= temp[7];
        endcase

        case (index_2[2])
            2'd0 : dout[2] <= temp[2];
            2'd1 : dout[2] <= temp[4];
            2'd2 : dout[2] <= temp[6];
            2'd3 : dout[2] <= temp[0];
        endcase

        case (index_2[3])
            2'd0 : dout[3] <= temp[3];
            2'd1 : dout[3] <= temp[5];
            2'd2 : dout[3] <= temp[7];
            2'd3 : dout[3] <= temp[1];
        endcase

        case (index_2[4])
            2'd0 : dout[4] <= temp[4];
            2'd1 : dout[4] <= temp[6];
            2'd2 : dout[4] <= temp[0];
            2'd3 : dout[4] <= temp[2];
        endcase

        case (index_2[5])
            2'd0 : dout[5] <= temp[5];
            2'd1 : dout[5] <= temp[7];
            2'd2 : dout[5] <= temp[1];
            2'd3 : dout[5] <= temp[3];
        endcase

        case (index_2[6])
            2'd0 : dout[6] <= temp[6];
            2'd1 : dout[6] <= temp[0];
            2'd2 : dout[6] <= temp[2];
            2'd3 : dout[6] <= temp[4];
        endcase

        case (index_2[7])
            2'd0 : dout[7] <= temp[7];
            2'd1 : dout[7] <= temp[1];
            2'd2 : dout[7] <= temp[3];
            2'd3 : dout[7] <= temp[5];
        endcase
    end
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "HEQcwkIk4AJUnyybgwol/5f4LNrpC62dnM4HE75Mb8kxROzHwkOVqUjjNakwyQUVn3rWDca7QqKGruQoj2QI6diWrHBuVPm2ePzJYe0opoRKRsrSLsozd6ihfZo7Y4AobDGlA0sx1RWdC2xxmhs6EhsIEYbW0OeABq8z3YlmhZOCNJP7S54htV6uHLAYjjaGmL7pkx5+dyKYUHnNRVlphInbKBlJ9OHWSVdDlWH+1Xah3foN7TsOgS26ECoc1ZGdeMYT3J6BSKVBqn70e1tKFyYg/xDG/vG0/4/GqrSzrE1wsfztLv3LJyABA+9Jb8k5QNeVdZBwABEmlah1Y71IKdD6xTAjl0qDTqV1Q9L+gs4ljFnnpmVz6Oc6kQ/x3bEtpo81OM1qyKt2zpUhx/BwwL3OJ7C+/riwwdQ0lhk3N9r4XsZQe+UPAv3xxY1nvUZWLo7NzHj4V18zWDJ20JORSHMSiz5SVGt1EN0XA0DAvnuEy85dALqtbW8K/H/4BBn1802K3kcyf1hck+WnvhWzldQ0BIA/cEGr0r7BxOtFxgPoGXrWflsPYgLqbHlY3/THQFC1iLUPak0YvsN6ATSRkv9g5zd8qcFctjPTYggPG93g1WJMv/ikfjOHbMiHs/ADBpRuX11QqKvVb8y2NcCZqO8jeks7Q4Ilkd1evbjhWplaUsrKOvhNMmHCAGQ2/aXCe6U61jEFGd5YTj1bR+6D9s129d3JAKkeqCm1Cka6m2NHZrTCRuq5BDYotYGr2hCZb9p1yWOKEeuHW4PWThtbuscvR2RVNNlao1j6X3DworYgmIV9HOlNLTa65p0io3/pvW4941SiK7mn/Ldn6+lRVEN5W3BUc0Qp8Sv0r15/QjXD4/uDBY+zwVawrS1N/zd3iSbXe7guZ98ZcfXmzOT8YaWvWjWqKofW4ZBiBwMKbFK/ucfV3PmRos1rpSssoh60Z9rzpWZZ3sH7ehmVLPt+DFRWmdEqcMevMoKRSn58imgB3Mk3ejkHJNQjVXcGrP7X"
`endif