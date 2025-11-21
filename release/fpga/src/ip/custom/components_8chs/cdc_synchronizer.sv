// INTEL CONFIDENTIAL
//
// Copyright 2018-2021 Intel Corporation.
//
// This software and the related documents are Intel copyrighted materials, and
// your use of them is governed by the express license under which they were
// provided to you ("License"). Unless the License provides otherwise, you may
// not use, modify, copy, publish, distribute, disclose or transmit this
// software or the related documents without Intel's prior written permission.
// This software and the related documents are provided as is, with no express
// or implied warranties, other than those that are expressly stated in the
// License.

module cdc_synchronizer #(
    WIDTH = 8
) (
    input out_clk,
    input out_reset,
    input [WIDTH-1:0] in_data,
    output [WIDTH-1:0] out_data
);
    logic [WIDTH-1:0] in_data_meta /* synthesis preserve dont_replicate */;
    logic [WIDTH-1:0] q /* synthesis preserve dont_replicate */;

    always_ff @(posedge out_clk) begin
        if (out_reset) begin
            in_data_meta <= '0;
            q <= '0;
        end
        else begin
            in_data_meta <= in_data;
            q <= in_data_meta;
        end
    end

    assign out_data = q;
endmodule
