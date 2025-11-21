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

module alt_ehipc3_fm_scfifo_mlab #(
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
    output                  empty
);

    reg [4:0]   w_ptr;
    reg [4:0]   r_ptr;
    reg [30:0]  used;

    reg     [WIDTH-1:0] readdata_reg;
    wire    [WIDTH-1:0] readdata_int;

    wire    write   = wreq && !full;
    wire    read    = rreq && !empty;

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

    alt_ehipc3_fm_mlab #(
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
`pragma questa_oem_00 "saGjb1xDblePCNY2eWcU/WvrOpZ5y9L4HgH/STvXeTRjyVb5Hg3phAWHKa+Ja3uOaKCFTl5kfGSVJrSHGZIU2CdcxmhdytRqbQ0UcBPifegPrKd6dYg79K0bkZ61/NICQ+UJ9yoeMywH7wFow65pcDvjNEkGcPKTqnQsCsy/RLnS+cZK1GzMa0/iQAhI9wypwGpArU02scNBymXHbs0QD3gEL/csPen+0fxLO07kEh1vDvlTIz3ZPWEQC+6tyrulsWpTUmS+8se90Uh2CNs3ax3uqPH//RlqclfSrUyn7XZep/wTXMgAOcnLeZ/XBq2k0qSYsQ107iPD3fbE/MfBrw51rZKTxc56vXe3AutyAJwxBc9TjyiGlETs12OjLRHmVnxcUqA8epB1p2NaVFC81q3x6FlLrx1rM5dRAhRi8IsGp6mrQfz/tn/JeeLlry9hqjctbp3n1xY0k4IDbidji6V7YpE6j3sOVzAvJb2cnK75S1Xda1tBeutOsUFhA/1dUIi3SKkdCl/owMMIa6DZO+wJTwahnxy1IJrSx5Ev2u/JfjVFcpxiGpPxY18JDwPNupEbQLpONoZvoXK6rbC9znWT4iQYJYhIk7NxCSQ0VEhO98HcAKmrokT+ClCbgvB0ZgbPBAHK5RMv/JuAowTuifHcFXZf/bbBXHpzqMjpsksCVWPlpwlNfy5g/bA2K0L+8S3C3fLuDbTv9kKGkdZpZV7uu3h300yAslX2WUw7nZbTjac3vpl9T7hP/UZlahIKF510gJ1Eof/f9nveuOG/BfsG81lTZY83KV3/VbzPfQNmonLh9pBld3WA7PVJf5aI0uTiuKskGImwYzX8V3CxSqmRtqDOY3dEO6/XBD8jESRJz5uogm9x2mVEjX2mGxjCFhJzAbeW9UpHyiiat3b4CGtkWa6FmNN2hAATfwcCo0BUYf9TPAgz7+k0pEEmS6k+o5NkZ35ioeZYrMWZm2DQ38oaMU2d3j1KFtm1gZ/aP8DmRq5wsSVxQmv8ycUdd/Fh"
`endif