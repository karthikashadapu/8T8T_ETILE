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

module alt_ehipc3_fm_100g_block_buffer #(
    parameter BLOCK_WIDTH  = 64,
    parameter SIM_EMULATE   = 0
) (
    input                           i_reset,
    input                           i_clk,

    input   [0:7][BLOCK_WIDTH-1:0]  i_data,
    input   [3:0]                   i_numwrite,

    output  [0:3][BLOCK_WIDTH-1:0]  o_data,
    input                           i_read4,
    output                          o_readvalid
);

    reg     [0:7][7:0]              write_ptr;
    reg     [0:7][4:0]              write_ptr_r1;

    reg     [0:7][7:0]              read_ptr;

    wire   [0:7][BLOCK_WIDTH-1:0]   write_mem_data;
    wire   [0:7][BLOCK_WIDTH-1:0]   read_mem_data;

    reg     [0:7][BLOCK_WIDTH-1:0]  read_data_reg;
    reg                             valid_reg;

    reg     [0:7][BLOCK_WIDTH-1:0]  write_data_rotate;
    reg     [2:0]                   write_data_rotate_index;

    reg     [0:3][BLOCK_WIDTH-1:0]  read_data_rotate;
    reg     [0:3]                   read_data_rotate_index; /* synthesis dont_merge */


    always_ff @(posedge i_clk) begin
        if (i_reset) begin
            valid_reg   <= 1'b0;
        end else begin
            valid_reg   <= i_read4;
        end
    end
    assign o_readvalid = valid_reg;

    always_ff @(posedge i_clk) begin
        if (i_reset) begin
            write_data_rotate_index <= 3'd0;
            read_data_rotate_index  <= 4'b0000;
        end else begin
            write_data_rotate_index <= write_data_rotate_index + i_numwrite;
            read_data_rotate_index  <= read_data_rotate_index ^ {4{i_read4}};
        end
    end

    always_ff @(posedge i_clk) begin
        read_data_reg   <= read_mem_data;
    end

    always_ff @(posedge i_clk) begin
        case (write_data_rotate_index)
            3'd0    :   write_data_rotate   <= {i_data[0:7]};
            3'd1    :   write_data_rotate   <= {i_data[7:7], i_data[0:6]};
            3'd2    :   write_data_rotate   <= {i_data[6:7], i_data[0:5]};
            3'd3    :   write_data_rotate   <= {i_data[5:7], i_data[0:4]};
            3'd4    :   write_data_rotate   <= {i_data[4:7], i_data[0:3]};
            3'd5    :   write_data_rotate   <= {i_data[3:7], i_data[0:2]};
            3'd6    :   write_data_rotate   <= {i_data[2:7], i_data[0:1]};
            3'd7    :   write_data_rotate   <= {i_data[1:7], i_data[0:0]};
        endcase

        read_data_rotate[0]    <= read_data_rotate_index[0] ? read_data_reg[4] : read_data_reg[0];
        read_data_rotate[1]    <= read_data_rotate_index[1] ? read_data_reg[5] : read_data_reg[1];
        read_data_rotate[2]    <= read_data_rotate_index[2] ? read_data_reg[6] : read_data_reg[2];
        read_data_rotate[3]    <= read_data_rotate_index[3] ? read_data_reg[7] : read_data_reg[3];
    end
    assign o_data = read_data_rotate;
    assign write_mem_data = write_data_rotate;

    genvar i;
    generate
        for (i = 0; i < 8; i=i+1) begin : mem_loop

            always_ff @(posedge i_clk) begin
                if (i_reset) begin
                    write_ptr[i]    <= (7-i[7:0]);
                    read_ptr[i]     <= (7-i[7:0]);
                    write_ptr_r1[i] <= 5'd0;
                end else begin
                    write_ptr[i]    <= write_ptr[i] + i_numwrite;
                    read_ptr[i]     <= i_read4 ? read_ptr[i] + 5'd4 : read_ptr[i];
                    write_ptr_r1[i] <= write_ptr[i][7:3];
                end
            end

            alt_ehipc3_fm_mlab #(
                .WIDTH          (BLOCK_WIDTH),
                .ADDR_WIDTH     (5),
                .SIM_EMULATE    (SIM_EMULATE)
            ) mlab_mem (
                .wclk           (i_clk),
                .wena           (1'b1),
                .waddr_reg      (write_ptr_r1[i]),
                .wdata_reg      (write_mem_data[i]),
                .raddr          (read_ptr[i][7:3]),
                .rdata          (read_mem_data[i])
            );
        end
    endgenerate
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "sj2EnSVIknGz65j61L+DMMO3HDcSN2jhvr55koJ1ECJkPtG0Fw9q9R2fIYYgv2BPR8BrsR+RYKuIJjlYQNmgnXVjvtJtJool3uQURgCFpQL23pok+Wr2TXSNbySMdXxV2gz6CwxUk+0+/rDLrsroCzkAiFw2amgz6Do5tJQltYjCIPqHFj/3UZep9T4dBvB83T//SpBFZzgCz+Lzrx+1A17RXSmjyar6SF3JSJg+7B3im3IbG0/9xr6uT/hFWkxyzOY8Ul2dQ4A6R5Pl7se4pRBE61hf/9Qz3FBdq6/uAiwffMeo+3E48mJ2V7xFoLZVJ0Wja90IqCRZsO9YcITyjzHic98gxv8DlsiNRHHFoJt1gdLB2111uvpeqHFz5Te/HT9Lga6y4Lc+qO7+jzj/BF/qV//AFufv9DcBpw3MakD2uI6YchA4aZMAX9LvBeEq6FRZPY9Y89pQTrPUWqytl60RnOYpE22KcIlU3tCqOiAsPfZ+FjgUFz8VIhhbJQMR7MUlukCEVq1//dcezF/gIvp1Ba1Wh6FYYnVdMxLcbQcSnPHQFf+kFOZftsKPBGhkPZCTaKi9GC9bQ/5UDWWb0tZZk0MVCOuVzL0bw8lh/TgxxMLJkP8RoauoSzOGacwI2IY7KaBS0oF09F7WCSFRjywk9PuiZ/8MHKJIaWns+Sq8vCBmxi2JNlAp6OS7/vuG374eDF6xYZnsRUzI8w24s4ZjYWHfCmjFOkaErr+WSKolgDu3wKpIr+S/Nbn6P+grPC7oea2Qo2Ars71fN7/YpuldydzXxS/pqwNpuIFatl5bPh2MFl2vNrja48QUmnuHjf9+GK/mQyPQ3Por2he8GIro+k+I6aqxx7HkReMSiXvZpC4Rfwnrgcu3n2PB2KY3DVFEevi6uUtbQ0eVbY6nCfc4gFdixOSYR4WsxYtFNuIBq5jAv/V5vCNFBBTo2K5PqfIbEzIDuI4WeV7esW7kwMt0IqtNDR/TlaejXbWFDf7MB+p5x66XGY5A6f7OLoP9"
`endif