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

module alt_ehipc3_fm_100g_adapter_data_aligner_async #(
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
`pragma questa_oem_00 "sj2EnSVIknGz65j61L+DMMO3HDcSN2jhvr55koJ1ECJkPtG0Fw9q9R2fIYYgv2BPR8BrsR+RYKuIJjlYQNmgnXVjvtJtJool3uQURgCFpQL23pok+Wr2TXSNbySMdXxV2gz6CwxUk+0+/rDLrsroCzkAiFw2amgz6Do5tJQltYjCIPqHFj/3UZep9T4dBvB83T//SpBFZzgCz+Lzrx+1A17RXSmjyar6SF3JSJg+7B2413+KybMN8yWKhLJclDE0GKo1FpMZiXYpqcX/osGwYspWVsDSTFs5cEvLcMeX4Ucz87uNd9cYokhalpfTVkHiIkri+nQumswssbOax5t14Y/Q7iHIinRe3o4U7PsYyu2dq/1c5fbrKKPRql3oGvSA49E+Nm9QJ8KLKSsyAS3hcQH4k4V9i4OuoDema+ziAT23CHpXjoqJTS31382Ft+eQmd9pa8KOTEsYOjd5IY4TBoKQa+geCAm+BwDXEmWceGGWgzZxJ4bA/63Yt2afIWex6qFbfZ6ldIOocg65Gfi140jRnQGcWdrtMen+S+/9M3DoZFXf+Vf0wE3D8VCTATkE1Jwifw0EFYW5OKqFOIcOvX5z5b/W1X4Bheeul8XIsAgyQEjDs66gvYxjbYRqd2sVlsMfTC+3TZtV/ummXhUV7cxWtQMLVkcCIpdr1C/zQpNYpI3Lfo+95YlG0a7fz8+NVhDk25RvR9cG38Hg2VjxKnv9svADH9bt7kxqA/+uQ1oWkKb8FZmuVOIYJI0gNol7Gte3NpZUQuhtn+BIqakXSgxIpzaQ72CxJQ9jva0CZ08+/1NRMsUvOfaUasmPmdosq2l7rGdwrbW/bxfsauIYn6reh/FAfMzsvMoViBoo3w6tbL43fLY3ocfCzPkeyf5kBQrPQzfr7iKQGCpyxlonj8+NhFAIk6KKz1hYIVic5rBtEp/+Nyr1mgIExF6LxpVxWtJBKJ7uNli+10HRJ5KpbYYR1Fs+1oKS7e4CjQ6vbuZ16CjlVx0RIGvvUaAN/poQ"
`endif