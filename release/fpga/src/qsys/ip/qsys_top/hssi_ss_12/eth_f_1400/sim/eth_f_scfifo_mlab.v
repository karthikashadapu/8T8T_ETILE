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

module eth_f_scfifo_mlab #(
    parameter SIM_EMULATE       = 1'b0,
    parameter WIDTH             = 64
)(
    input                   clk,
    input                   sclr,
    input  [WIDTH-1:0]      wdata,
    input                   wreq,
    output                  full,
    output [WIDTH-1:0]      rdata,
    input                   rreq,
    output                  empty,
    output reg [4:0]	    cnt
);

    reg [4:0]   w_ptr;
    reg [4:0]   r_ptr;
    reg [30:0]  used;
    reg [4:0] cntnxt; 

    reg     [WIDTH-1:0] readdata_reg;
    wire    [WIDTH-1:0] readdata_int;

    wire    write   = wreq && !full;
    wire    read    = rreq && !empty;


    always @(*) begin
	cntnxt = (write & !read)  ? cnt + 1'b1 :
		     (!write & read)  ? cnt - 1'b1 :
                                      cnt  ;	
    end
    always @ (posedge clk) begin
        cnt <= cntnxt;
        if(sclr)
        cnt <= 5'd0;
    end // always_ff @ (posedge clk)


    assign full = used[30];
    assign empty = !used[0];
    assign rdata = readdata_reg;

    always @(posedge clk) begin
        if (sclr) begin
            readdata_reg <= {WIDTH{1'b0}};
        end else begin
            if (read) begin
                readdata_reg <= readdata_int;
            end else begin
                readdata_reg <= readdata_reg;
            end
        end
    end

    always @(posedge clk) begin
        if (sclr) begin
            used <= 31'd0;
        end else begin
            if (write) begin
                if (read) begin
                    used <= used;
                end else begin
                    used <= {used[29:0], 1'b1};
                end
            end else begin
                if (read) begin
                    used <= {1'b0, used[30:1]};
                end else begin
                    used <= used;
                end
            end
        end
    end

    always @(posedge clk) begin
        if (sclr) begin
            w_ptr <= 5'd0;
        end else begin
            if (write) begin
                w_ptr <= w_ptr + 1'b1;
            end else begin
                w_ptr <= w_ptr;
            end
        end

    end

    always @(posedge clk) begin
        if (sclr) begin
            r_ptr <= 5'd0;
        end else begin
            if (read) begin
                r_ptr <= r_ptr + 1'b1;
            end else begin
                r_ptr <= r_ptr;
            end
        end
    end

    eth_f_mlab #(
        .WIDTH       (WIDTH),
        .ADDR_WIDTH  (5),
        .SIM_EMULATE (SIM_EMULATE)
    ) sm0 (
        .wclk       (clk),
        .wena       (write),
        .waddr_reg  (w_ptr),
        .wdata_reg  (wdata),
        .raddr      (r_ptr),
        .rdata      (readdata_int)
    );
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "HEQcwkIk4AJUnyybgwol/5f4LNrpC62dnM4HE75Mb8kxROzHwkOVqUjjNakwyQUVn3rWDca7QqKGruQoj2QI6diWrHBuVPm2ePzJYe0opoRKRsrSLsozd6ihfZo7Y4AobDGlA0sx1RWdC2xxmhs6EhsIEYbW0OeABq8z3YlmhZOCNJP7S54htV6uHLAYjjaGmL7pkx5+dyKYUHnNRVlphInbKBlJ9OHWSVdDlWH+1Xa5d8oyoI4vuiyAcXWkDXJrDHnaQD9ZNfSPsTR9A3cxqUxLZMQc/jfVxNmzIXr63ZigphCDzQaJL+tUHI3v5hvfzKWSCzh+E8TxZjDVI6Msn59GNOHIGJlQ8repiQWbNx0sx5nmfEJN9FKT9cI7d2e/8g0G4WJGPUfyaVM5yYV/+mLRRIGWScSVMKMAHqqkaxZqwH+anMHAEvpjqkqVOED0GWrMLiWCgQAf1hQFOSJsx/gVzgYg1VT6dLrIzsyXXVYGQnKuGobac/7IjvN4xbw+q3nC+S7Jel4HvcNxA+AABpZZFkeGDecErdSMB6YmLV+d8QqOp182WL/TW10PtfmTJWvdzK0mWmT6BYkBM4LlR7CZpEJY9MAiq78bGhuBp8NKTtXjygZnC45O6uF+dVHM+PLr8Y0uhHydUFBMPUpJDtRC91zaJOaEXcyS3IYHeNNDCUD+nPGuROJ5crX1jgV7olmlPoWffVQ2FDhcBVMykERMIv9FKxNqN68vZFULarMfnoiLWk/7SdfZFZIPgnEWhI6rsg8p6j+/+8ldjZEZuYnZb+eIFb/vu/y9q7c9IIxW44UQfcAEN18B5QRths6wZIp7Uws7nnfn9q2YBdTtNRmM4DC/9h0wrgC/Zui/+OUoLHXZa3+LYF7T1E96Uqynf+QhlmHVrYHUYFZ9u88jJRZ6YeasSYztg12VuMau8zowy0ACmLxa/2u5HP8uKsS8Uc5HwqNetYf42Gdhm0OZGKM/2V8ybQ6/IUtn7efZ7dn+dHi1HwnjWV8bQPIVvd36"
`endif