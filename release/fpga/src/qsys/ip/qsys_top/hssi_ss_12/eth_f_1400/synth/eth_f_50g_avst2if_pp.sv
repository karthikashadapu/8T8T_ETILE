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


module eth_f_50g_avst2if_pp (
    input   logic               i_clk,
    input   logic               i_reset,

    // Client interface
    input   logic               i_valid,
    input   logic   [127:0]     i_data,
    input   logic               i_sop,
    input   logic               i_eop,
    input   logic   [3:0]       i_empty,
    input   logic               i_error,
    input   logic   [63:0]      i_preamble,
    input   logic               i_skip_crc,

    output  logic   [0:2][63:0] o_data,
    output  logic   [1:0]       o_num_valid,
    output  logic   [0:2]       o_inframe,
    output  logic   [0:2][2:0]  o_empty,
    output  logic   [0:2]       o_error,
    output  logic   [0:2]       o_skip_crc
);

    enum logic {INFRAME, IDLE} mode;

    logic   [1:0]   num_valid_next;
    logic   [0:2]   inframe_next;

    always_ff @(posedge i_clk) begin
        o_data      <= i_sop ? {i_preamble, i_data} : {i_data, 64'd0};
        o_empty     <= {3{i_empty[2:0]}};
        o_error     <= {3{i_error}};
        o_skip_crc  <= {3{i_skip_crc}};
        o_num_valid <= num_valid_next;
        o_inframe   <= inframe_next;
    end

    always_comb begin
        if (i_reset) begin
            num_valid_next = 2'd0;
            inframe_next   = 3'b000;
        end else begin
            if (i_valid) begin
                if (mode == INFRAME) begin
                    if (i_eop) begin
                        if (i_empty[3]) begin
                            num_valid_next = 2'd1;
                            inframe_next   = 3'b000;
                        end else begin
                            num_valid_next = 2'd2;
                            inframe_next   = 3'b100;
                        end
                    end else begin
                        num_valid_next = 2'd2;
                        inframe_next   = 3'b110;
                    end
                end else begin
                    if (i_sop) begin
                        if (i_eop) begin
                            if (i_empty[3]) begin
                                num_valid_next = 2'd2;
                                inframe_next   = 3'b100;
                            end else begin
                                num_valid_next = 2'd3;
                                inframe_next   = 3'b110;
                            end
                        end else begin
                            num_valid_next = 2'd3;
                            inframe_next   = 3'b111;
                        end
                    end else begin
                        num_valid_next = 2'd2;
                        inframe_next   = 3'b000;
                    end
                end
            end else begin
                num_valid_next = 2'd0;
                inframe_next   = 3'b000;
            end
        end
    end

    always_ff @(posedge i_clk) begin
        if (i_reset) begin
            mode    <= IDLE;
        end else begin
            if (i_valid) begin
                if (i_eop) begin
                    mode    <= IDLE;
                end else begin
                    if (i_sop) begin
                        mode    <= INFRAME;
                    end else begin
                        mode    <= mode;
                    end
                end
            end else begin
                mode    <= mode;
            end
        end
    end
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "HEQcwkIk4AJUnyybgwol/5f4LNrpC62dnM4HE75Mb8kxROzHwkOVqUjjNakwyQUVn3rWDca7QqKGruQoj2QI6diWrHBuVPm2ePzJYe0opoRKRsrSLsozd6ihfZo7Y4AobDGlA0sx1RWdC2xxmhs6EhsIEYbW0OeABq8z3YlmhZOCNJP7S54htV6uHLAYjjaGmL7pkx5+dyKYUHnNRVlphInbKBlJ9OHWSVdDlWH+1XZ5w+vxU17CbukJv+1XtK0ZV1v2Bl4OSY7+N+NUp18iVIXSirp8WUvNtLS9khL93LGT5KnylPRGN6F8AvxxHLkpbf/JMI9n5TYdZeTtmf6+1ultFi2weAvIu64KOJzbuiuTkfGOjH6zl2pLEr5DCyX3HC+9+e/XNhn3roh/160RKB1vKZVwKWXTo206WNTyF7CjI4n1/US2/Pz+YvI8cAe/F6InIi7UB3FeVuHjNM/wmi3DzOLFTtkuVonzXYxK+XemJoSBXC8+ZuKZagc3P33DxJV7wk65MopdcV9yrtxi7/S6Xv0uost2eVjUHXflWS+qjLFhnEACIt4PCc0AQZRBOfxoBUqy7gcljgEGyLcEbk2HKe92d7FjraPShqJy6mXaEv6yBjT6OexeeC7b3CbBlvUYK3iRtg1ARLUrIqZq0GXNl00H0QPWQO1nCd9EIanBmq5gEXLnaxjuS9B09yNRZtikRxI9lN/QqSE0bKhNB4PMUCuBz2+KjmeQjL10Q3z3jTgBJ6vCmZtTu0sroIKkU8S2lCt6fLtPm8TAsztiWfwZtcDkg1igBLYNefIBULq+60rkhmlntQJQYHDOaLFAMMBQqYAVGgtQtN1PAPqZhzG0mpxwOr9lO4dDnlmbERWwy3fGLjS2r+2yQ6ZCpfGm4ZnySttrEUuDguAWSBNnuG/pN4HXEBmXhDKR6xml4w0rXunKAZjniXQzvZXpWlpfPtjaeb6/zi0sQBJgnfo52MbVbmR+VPhyC6fZmaWe2b1n/Rqfyq3ZzbvHXWvi7BVi"
`endif