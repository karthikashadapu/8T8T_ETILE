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


module pcs_scfifo_mlab #(
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

    reg [6:0]   w_ptr;
    reg [6:0]   r_ptr;
    reg [126:0]  used;

    reg     [WIDTH-1:0] readdata_reg;
    wire    [WIDTH-1:0] readdata_int;

    wire    write   = wreq && !full;
    wire    read    = rreq && !empty;

    assign full = used[126];
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
            used <= 127'd0;
        end else begin
            if (write) begin
                if (read) begin
                    used <= used;
                end else begin
                    used <= {used[125:0], 1'b1};
                end
            end else begin
                if (read) begin
                    used <= {1'b0, used[126:1]};
                end else begin
                    used <= used;
                end
            end
        end
    end

    always @(posedge clk) begin
        if (sclr) begin
            w_ptr <= 7'd0;
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
            r_ptr <= 7'd0;
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
        .ADDR_WIDTH  (7),
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
`pragma questa_oem_00 "iNcmQeM5R+2wXyQcrIvK9Aed2O3DNv4QGFTpmcaGURS3nf96+gCegtWg50e6rleWE64VT4+790Ghs95mog/VHoEYybDIGn5EoWfqpEPzBOW06ogVsMbRm79acU6L09a0INNw7swJhWgHQdzl07TrCbOuFN5j/YV4soVomm30RbpyPicKqaC/jMGdl00awWTRKYI/LlUWB2031x5qz4fwVbhj6DvZKYVLlQLmylj6M7soBBroapKV6jMPRHOl73Mqokk+6+xKfl61gkzYEbMsOBHQyTpI1d6EwTAHshR8cuS2Z0EOVATG4nhA38hzPyiETZr7iceU2F/nfThzKN1owRMlq77oi8+x5y2pllResBHflCQaJMtJX4EkUqW84QNV1dNIy3cRmcRTzZUmwPgyotNleVmqEVt2ymU4z97vqD0iodgwtXYyzIxlWgQScC28AB269QEw3EEWtCja7wrJ0vocuebg8LrPURo7/lnoVcPNRElCN5g2A1XiGe9mD8fhlpZBolE7Ag813/6jeQd+I3eD6cAiPo+QZcB5kaQErrn8VyB0KIUvhUB4xly/bI5s9v/DfSj6tKlqDiAe9m5u8OuVAUekoX6axBIpJZTC/4wDxV+vdDUFkQE/z3g7M5cK2ZaC5NZaNuuMHrnSdo8JAZbJiHcrGXi3F1pWjpoozygHM5gewOq6z2rhrE4t2Bojyb9bMzZw47ci5orJPJZ5pNZnHyTNlbSgIg8V9a2gyWQ9kGZHGqjDktwJFWbtzTIuVBTGBhUzDkwZzP0NpNcwceGmSGQc+Tl14hkZaZBjrZV1FuQb2djdnWPiVEPaOsLXCKLfIGdYSUo2sHyKy1aGMmwqLYT1jL9mqQSQ78d+W5+de7M/E/NmrEEc1wPO4MqpRyXQdimgtGxT3Th3RDvVeudZp/b3vZFDKAb40Ja3hwNVPQxhdxr56jFNZkT66GyYW+rhSrD86SbLrdd4pX0CiZKkMMhiEjTU+erG8H73THfxV6NzABJV4VI9BWDO5lBT"
`endif