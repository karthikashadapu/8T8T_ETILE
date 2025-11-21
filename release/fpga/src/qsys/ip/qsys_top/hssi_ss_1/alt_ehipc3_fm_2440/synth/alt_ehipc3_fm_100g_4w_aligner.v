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

module alt_ehipc3_fm_100g_4w_aligner #(
    parameter WIDTH = 8
) (
    input                   i_clk,
    input                   i_reset,
    input   [0:4*WIDTH-1]   i_data,
    input   [0:3]           i_inframe,
    input   [0:3]           i_valid,
    output  [0:4*WIDTH-1]   o_data_1,
    output  [0:4*WIDTH-1]   o_data_0,   // extra
    output  [0:3]           o_inframe_1,
    output  [0:3]           o_inframe_0,
    output                  o_valid_1,
    output                  o_valid_0
);

    reg [0:4*WIDTH-1]   temp_data;
    reg [0:3]           temp_inframe;
    reg [0:4*WIDTH-1]   o_data_1_reg;
    reg [0:4*WIDTH-1]   o_data_0_reg;
    reg [0:3]           o_inframe_1_reg;
    reg [0:3]           o_inframe_0_reg;
    reg                 o_valid_1_reg;
    reg                 o_valid_0_reg;

    reg [1:0]           shift, shift_last;

    always @(posedge i_clk) begin
        temp_inframe    <= i_valid[0] ? i_inframe  : temp_inframe;
        shift_last      <= i_valid[0] ? shift      : shift_last;
        o_valid_1_reg   <= i_valid[0];
    end

    always @(posedge i_clk) begin
        if (i_reset) begin
            shift   <= 2'd0;
        end else begin
            if (i_valid[0]) begin
                casez ({temp_inframe[3], i_inframe})
                    5'b01???    : shift <= 2'd0;
                    5'b?01??    : shift <= 2'd1;
                    5'b??01?    : shift <= 2'd2;
                    5'b???01    : shift <= 2'd3;
                    default     : shift <= shift;
                endcase
            end else begin
                shift <= shift;
            end
        end
    end

    always @(posedge i_clk) begin
        if (shift > shift_last) begin
            if (i_valid[0]) begin
                o_valid_0_reg <= 1'b1;
            end else begin
                o_valid_0_reg <= 1'b0;
            end
        end else begin
            o_valid_0_reg <= 1'b0;
        end
    end

    genvar i;
    generate
        for (i = 0; i < 4; i=i+1) begin : fanout_loop
            always @(posedge i_clk) begin
                if (i_valid[i]) begin
                    temp_data[i*WIDTH +: WIDTH] <= i_data[i*WIDTH +: WIDTH];
                end else begin
                    temp_data[i*WIDTH +: WIDTH] <= temp_data[i*WIDTH +: WIDTH];
                end
            end
        end
    endgenerate

    always @(posedge i_clk) begin
        case (shift_last)
            2'd0 : begin
                o_data_0_reg      <= temp_data;
                o_inframe_0_reg   <= temp_inframe;
            end
            2'd1 : begin
                o_data_0_reg      <= {temp_data[1*WIDTH:4*WIDTH-1], i_data[0:1*WIDTH-1]};
                o_inframe_0_reg   <= {temp_inframe[1:3], i_inframe[0:0]};
            end
            2'd2 : begin
                o_data_0_reg      <= {temp_data[2*WIDTH:4*WIDTH-1], i_data[0:2*WIDTH-1]};
                o_inframe_0_reg   <= {temp_inframe[2:3], i_inframe[0:1]};
            end
            2'd3 : begin
                o_data_0_reg      <= {temp_data[3*WIDTH:4*WIDTH-1], i_data[0:3*WIDTH-1]};
                o_inframe_0_reg   <= {temp_inframe[3:3], i_inframe[0:2]};
            end
        endcase
    end

    always @(posedge i_clk) begin
        case (shift)
            2'd0 : begin
                o_data_1_reg      <= temp_data;
                o_inframe_1_reg   <= temp_inframe;
            end
            2'd1 : begin
                o_data_1_reg      <= {temp_data[1*WIDTH:4*WIDTH-1], i_data[0:1*WIDTH-1]};
                o_inframe_1_reg   <= {temp_inframe[1:3], i_inframe[0:0]};
            end
            2'd2 : begin
                o_data_1_reg      <= {temp_data[2*WIDTH:4*WIDTH-1], i_data[0:2*WIDTH-1]};
                o_inframe_1_reg   <= {temp_inframe[2:3], i_inframe[0:1]};
            end
            2'd3 : begin
                o_data_1_reg      <= {temp_data[3*WIDTH:4*WIDTH-1], i_data[0:3*WIDTH-1]};
                o_inframe_1_reg   <= {temp_inframe[3:3], i_inframe[0:2]};
            end
        endcase
    end

    assign o_data_1         = o_data_1_reg;
    assign o_data_0         = o_data_0_reg;
    assign o_valid_0        = o_valid_0_reg;
    assign o_valid_1        = o_valid_1_reg;
    assign o_inframe_1      = o_inframe_1_reg;
    assign o_inframe_0      = o_inframe_0_reg;
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "sj2EnSVIknGz65j61L+DMMO3HDcSN2jhvr55koJ1ECJkPtG0Fw9q9R2fIYYgv2BPR8BrsR+RYKuIJjlYQNmgnXVjvtJtJool3uQURgCFpQL23pok+Wr2TXSNbySMdXxV2gz6CwxUk+0+/rDLrsroCzkAiFw2amgz6Do5tJQltYjCIPqHFj/3UZep9T4dBvB83T//SpBFZzgCz+Lzrx+1A17RXSmjyar6SF3JSJg+7B1nxxnpXieL8FbbK/rlgJJOUVtWXaTfE0yNoX9IlL5/ADg/VXogSua6Us7A8Z4TGm1wPSZ15LxZi1CKluHeAFvkAmInGFaHYNBbWmDtrE/F6iyPGZ4kk88P+eqgECSQKI41obdTAfhrfqkZljUPOs0yJzF9HBosaQNQnMUi5Bvp1Fad+K192yK37H9E5T6IAdGJHNKB+45MK2Lcl5amRdGePC3j2m4336NKvh13JNxPKPfRTlkfPk8LSXynb4eEvuDXsY0A9fXhgaNkhnodM9wD1+aULCqn87sSCjmy+TXE61SCn7G5qybcheGmUHOje9JrUDVo4O8D8KL8nYh4rKi/x7lEJ3w3khSlPtH4AAOxPbu4gdOub8y8Sl7RCBm6SH6t+ZSfv/h6F3qk3qUsJaAobJdvYj4NbYeOd/tn8dBsi6owpJrmSDap8E6njCHD16I4OMikIu/QZBHDZIIzUYeF2YLriVl94uhaylWRT/cp/YymyN6YZ335WNF85muDhN+Upbb+mt/IlHN5cEUYpfztYMKEQbXnQBUjvjawrhTcahucazlkhzzKRo7FOCx85C/joHyJf1EQ6p1upBNXhqnSXjTIZP4ObHQ676wERTcx7dcAh+1b42Jmzhzkcq6zvN0Pa5uWOXzIWh4a+NEy7d3agLgBlYytzCU/EvFLTWjqCTZaTEmFJuAgCAyIo5g6y9QjcuBLyuWnHvaUJqvWvekHVY7Zwy/wdTQ0VNsiMri69Uidhc6DQlnzfAyvcWh57WK82mCMcmbn29i+uhIL7J1E"
`endif