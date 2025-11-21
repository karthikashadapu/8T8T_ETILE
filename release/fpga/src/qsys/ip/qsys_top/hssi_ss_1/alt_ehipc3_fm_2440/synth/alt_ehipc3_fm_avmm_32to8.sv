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

module alt_ehipc3_fm_avmm_32to8 #(
    parameter TIMEOUT = 1000
) (
    input               clk,
    input               reset,

    input               master_read,
    input               master_write,
    input       [31:0]  master_address,
    input       [31:0]  master_write_data,
    input       [3:0]   master_byte_enable,
    output reg          master_read_valid,
    output reg          master_wait,
    output reg  [31:0]  master_read_data,

    output reg          slave_read,
    output reg          slave_write,
    output reg  [31:0]  slave_address,
    output reg  [ 7:0]  slave_write_data,
    input               slave_read_valid,
    input               slave_wait,
    input       [ 7:0]  slave_read_data
);

    enum {  IDLE,
            WR_WAIT_0 , WR_WAIT_1 , WR_WAIT_2 , WR_WAIT_3 , WR_DONE,
            RD_WAIT_ACCEPT_0 , RD_WAIT_ACCEPT_1 , RD_WAIT_ACCEPT_2 , RD_WAIT_ACCEPT_3,
            RD_WAIT_VALID_0 , RD_WAIT_VALID_1 , RD_WAIT_VALID_2 , RD_WAIT_VALID_3,
            RD_ACCEPT , RD_VALID } state;

    localparam TIMER_BITS = $clog2(TIMEOUT + 1);

    reg [TIMER_BITS-1:0]    timer;

    always_ff @(posedge clk) begin
        if (reset) begin
            state               <= IDLE;
            master_read_valid   <= 1'b0;
            master_wait         <= 1'b1;
            master_read_data    <= 32'd0;
            slave_read          <= 1'b0;
            slave_write         <= 1'b0;
            slave_address       <= 8'd0;
            slave_write_data    <= 8'd0;
            timer               <= {TIMER_BITS{1'b0}};
        end else begin
            state               <= state;
            master_read_valid   <= master_read_valid;
            master_wait         <= master_wait;
            master_read_data    <= master_read_data;
            slave_read          <= slave_read;
            slave_write         <= slave_write;
            slave_address       <= slave_address;
            slave_write_data    <= slave_write_data;

            // Timeout handler
            if (master_wait && (master_read || master_write)) begin
                timer   <= timer + 1'b1;
                if (timer == TIMEOUT[TIMER_BITS-1:0]) begin
                    master_wait         <= 1'b0;
                    slave_write         <= 1'b0;
                    slave_read          <= 1'b0;
                    if (master_write) begin
                        state               <= WR_DONE;
                    end else if (master_read) begin
                        state               <= RD_ACCEPT;
                    end
                end
            end else begin
                timer   <= {TIMER_BITS{1'b0}};
            end

            case (state)
                IDLE                : begin
                    if (master_write) begin
                        master_read_valid   <= 1'b0;
                        master_wait         <= 1'b1;
                        master_read_data    <= 32'd0;
                        slave_read          <= 1'b0;
                        casez (master_byte_enable)
                            4'b???1 : begin
                                state               <= WR_WAIT_0;
                                slave_address       <= {master_address[13:0], 2'd0};
                                slave_write_data    <= master_write_data[7:0];
                                slave_write         <= 1'b1;
                            end
                            4'b??10 : begin
                                state               <= WR_WAIT_1;
                                slave_address       <= {master_address[13:0], 2'd1};
                                slave_write_data    <= master_write_data[15:8];
                                slave_write         <= 1'b1;
                            end
                            4'b?100 : begin
                                state               <= WR_WAIT_2;
                                slave_address       <= {master_address[13:0], 2'd2};
                                slave_write_data    <= master_write_data[23:16];
                                slave_write         <= 1'b1;
                            end
                            4'b1000 : begin
                                state               <= WR_WAIT_3;
                                slave_address       <= {master_address[13:0], 2'd3};
                                slave_write_data    <= master_write_data[31:24];
                                slave_write         <= 1'b1;
                            end
                            4'b0000 : begin
                                state               <= WR_DONE;
                                master_wait         <= 1'b0;
                                slave_write         <= 1'b0;
                            end
                        endcase
                    end
                    if (master_read) begin
                        state               <= RD_WAIT_ACCEPT_0;
                        master_read_valid   <= 1'b0;
                        master_wait         <= 1'b1;
                        master_read_data    <= 32'd0;
                        slave_read          <= 1'b1;
                        slave_write         <= 1'b0;
                        slave_address       <= {master_address[13:0], 2'd0};
                        slave_write_data    <= 8'd0;
                    end
                end
                WR_WAIT_0           : begin
                    if (!slave_wait) begin
                        casez (master_byte_enable)
                            4'b??1? : begin
                                state               <= WR_WAIT_1;
                                slave_address       <= {master_address[13:0], 2'd1};
                                slave_write_data    <= master_write_data[15:8];
                            end
                            4'b?10? : begin
                                state               <= WR_WAIT_2;
                                slave_address       <= {master_address[13:0], 2'd2};
                                slave_write_data    <= master_write_data[23:16];
                            end
                            4'b100? : begin
                                state               <= WR_WAIT_3;
                                slave_address       <= {master_address[13:0], 2'd3};
                                slave_write_data    <= master_write_data[31:24];
                            end
                            4'b000? : begin
                                state               <= WR_DONE;
                                master_wait         <= 1'b0;
                                slave_write         <= 1'b0;
                            end
                        endcase
                    end
                end
                WR_WAIT_1           : begin
                    if (!slave_wait) begin
                        casez (master_byte_enable)
                            4'b?1?? : begin
                                state               <= WR_WAIT_2;
                                slave_address       <= {master_address[13:0], 2'd2};
                                slave_write_data    <= master_write_data[23:16];
                            end
                            4'b10?? : begin
                                state               <= WR_WAIT_3;
                                slave_address       <= {master_address[13:0], 2'd3};
                                slave_write_data    <= master_write_data[31:24];
                            end
                            4'b00?? : begin
                                state               <= WR_DONE;
                                master_wait         <= 1'b0;
                                slave_write         <= 1'b0;
                            end
                        endcase
                    end
                end
                WR_WAIT_2           : begin
                    if (!slave_wait) begin
                        casez (master_byte_enable)
                            4'b1??? : begin
                                state               <= WR_WAIT_3;
                                slave_address       <= {master_address[13:0], 2'd3};
                                slave_write_data    <= master_write_data[31:24];
                            end
                            4'b0??? : begin
                                state               <= WR_DONE;
                                master_wait         <= 1'b0;
                                slave_write         <= 1'b0;
                            end
                        endcase
                    end
                end
                WR_WAIT_3           : begin
                    if (!slave_wait) begin
                        state               <= WR_DONE;
                        master_wait         <= 1'b0;
                        slave_write         <= 1'b0;
                    end
                end
                WR_DONE             : begin
                    state               <= IDLE;
                    master_wait         <= 1'b1;
                end
                RD_WAIT_ACCEPT_0    : begin
                    if (!slave_wait) begin
                        if (slave_read_valid) begin
                            state                   <= RD_WAIT_ACCEPT_1;
                            master_read_data[7:0]   <= slave_read_data;
                            slave_address           <= {master_address[13:0], 2'd1};
                        end else begin
                            state                   <= RD_WAIT_VALID_0;
                            slave_read              <= 1'b0;
                        end
                    end
                end
                RD_WAIT_ACCEPT_1    : begin
                    if (!slave_wait) begin
                        if (slave_read_valid) begin
                            state                   <= RD_WAIT_ACCEPT_2;
                            master_read_data[15:8]  <= slave_read_data;
                            slave_address           <= {master_address[13:0], 2'd2};
                        end else begin
                            state                   <= RD_WAIT_VALID_1;
                            slave_read              <= 1'b0;
                        end
                    end
                end
                RD_WAIT_ACCEPT_2    : begin
                    if (!slave_wait) begin
                        if (slave_read_valid) begin
                            state                   <= RD_WAIT_ACCEPT_3;
                            master_read_data[23:16] <= slave_read_data;
                            slave_address           <= {master_address[13:0], 2'd3};
                        end else begin
                            state                   <= RD_WAIT_VALID_2;
                            slave_read              <= 1'b0;
                        end
                    end
                end
                RD_WAIT_ACCEPT_3    : begin
                    if (!slave_wait) begin
                        if (slave_read_valid) begin
                            state                   <= RD_ACCEPT;
                            master_wait             <= 1'b0;
                            master_read_data[31:24] <= slave_read_data;
                            slave_read              <= 1'b0;
                        end else begin
                            state                   <= RD_WAIT_VALID_3;
                            slave_read              <= 1'b0;
                        end
                    end
                end
                RD_WAIT_VALID_0     : begin
                    if (slave_read_valid) begin
                        state                   <= RD_WAIT_ACCEPT_1;
                        master_read_data[7:0]   <= slave_read_data;
                        slave_address           <= {master_address[13:0], 2'd1};
                        slave_read              <= 1'b1;
                    end
                end
                RD_WAIT_VALID_1     : begin
                    if (slave_read_valid) begin
                        state                   <= RD_WAIT_ACCEPT_2;
                        master_read_data[15:8]  <= slave_read_data;
                        slave_address           <= {master_address[13:0], 2'd2};
                        slave_read              <= 1'b1;
                    end
                end
                RD_WAIT_VALID_2     : begin
                    if (slave_read_valid) begin
                        state                   <= RD_WAIT_ACCEPT_3;
                        master_read_data[23:16] <= slave_read_data;
                        slave_address           <= {master_address[13:0], 2'd3};
                        slave_read              <= 1'b1;
                    end
                end
                RD_WAIT_VALID_3     : begin
                    if (slave_read_valid) begin
                        state                   <= RD_ACCEPT;
                        master_wait             <= 1'b0;
                        master_read_data[31:24] <= slave_read_data;
                        slave_read              <= 1'b0;
                    end
                end
                RD_ACCEPT           : begin
                    state                       <= RD_VALID;
                    master_read_valid           <= 1'b1;
                    master_wait                 <= 1'b1;
                end
                RD_VALID            : begin
                    state                       <= IDLE;
                    master_read_valid           <= 1'b0;
                end
                default             : begin
                    state               <= IDLE;
                    master_read_valid   <= 1'b0;
                    master_wait         <= 1'b1;
                    master_read_data    <= 32'd0;
                    slave_read          <= 1'b0;
                    slave_write         <= 1'b0;
                    slave_address       <= 8'd0;
                    slave_write_data    <= 8'd0;
                end
            endcase
        end
    end

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "sj2EnSVIknGz65j61L+DMMO3HDcSN2jhvr55koJ1ECJkPtG0Fw9q9R2fIYYgv2BPR8BrsR+RYKuIJjlYQNmgnXVjvtJtJool3uQURgCFpQL23pok+Wr2TXSNbySMdXxV2gz6CwxUk+0+/rDLrsroCzkAiFw2amgz6Do5tJQltYjCIPqHFj/3UZep9T4dBvB83T//SpBFZzgCz+Lzrx+1A17RXSmjyar6SF3JSJg+7B2T2ZxkXHgdoVlzIl3c7t2M0CIelwR1w+ZAkwXKsnJy2JJFPdeXbSlEOaNlWdZRr+87S4oeHBIKpTu9MWGpAtWWndpG3NC8z5b4e628srK0kTdrGErnS9En9REpUH8HYrkBhZHm6z2CFKoG4CacRC8Rj7lkU/oHUJle7iqla8OT1u0LSr0LOeotysI+YM/Cf05HInYo7NwEORJDQ34tHayG8hMnEO86I32Z9t6b0Jgvn6KxzlcyHSi7+rWL9ZWKkU7SC80qm4G3uDhDWr3ORiN4PUjey87YAOl0+e1I7ZzJPvVeTL9z+OtgCAh6FgB41V5Ouau/p8f8yx1KWX968R4jM+8oBgIobNniBEwyFhHLBX2iM/XuXJiw48nscc5FYHAy7wK7DCyzW5+/mFRDQOxXch999ifkmDFOv1Hbern7MXSqBWN3WedjSQnfZ3zekeGwMAMP0GG2RLh0bv4qMFxwlW2cG68NCp84UaiqMpIV8ewepu048PwVlyGUyV9JSlKJWo6TOpM3cjaXDCxS0TYajV/JjnDyka7kLGTOYnWspz66VIXA01CSbhkOADgRqcDTVU36h75SfqPAmMfhIyUYuZIUGMTqq6UKWFyEb3gXDHUpNUr4Vh3nwPQ0RKmn/+Mnm5ZgAIWNOiXjHKPBoHA3YoN6E6jqLfHmpIDlEslvRMSbQ+q6V9tLgfSEoSCTqH41sFrvwBfszWfQpz7n7CwCMq+WyWlnMcZ30TpyQFThA39RXp8C+9B/J7A9bZslUL77b/UqssUSWYWpluX4zB5R"
`endif