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

module alt_ehipc3_fm_alias_csr (
    input   logic           reset,
    input   logic           clk,
    input   logic           write,
    input   logic   [3:0]   byte_en,
    input   logic   [15:0]  address,
    input   logic   [31:0]  write_data,
    output  logic           phy_clear_dsk_chng,
    output  logic           stats_snapshot_freeze_reg
);

    always_ff @(posedge clk) begin
        phy_clear_dsk_chng  <= 1'b0;
        if (reset) begin
            phy_clear_dsk_chng  <= 1'b0;
        end else begin
            if (write) begin
                if (address == 16'h324) begin
                    if (byte_en[0]) begin
                        phy_clear_dsk_chng  <= write_data[0];
                    end
                end
            end
        end
    end



    // hsd:2205696595 Adding stats_snapshot_freeze reg  
    always_ff @(posedge clk) begin
        stats_snapshot_freeze_reg  <= 1'b0;
        if (reset) begin
            stats_snapshot_freeze_reg  <= 1'b0;
        end else begin
            if (write) begin
                if (address == 16'h945) begin // address 0x945 for RX stats counter
                    if (byte_en[0]) begin
                        stats_snapshot_freeze_reg <= write_data[2]; //bit 2:rx_shadow_req
                    end
                end
            end
        end
    end
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "sj2EnSVIknGz65j61L+DMMO3HDcSN2jhvr55koJ1ECJkPtG0Fw9q9R2fIYYgv2BPR8BrsR+RYKuIJjlYQNmgnXVjvtJtJool3uQURgCFpQL23pok+Wr2TXSNbySMdXxV2gz6CwxUk+0+/rDLrsroCzkAiFw2amgz6Do5tJQltYjCIPqHFj/3UZep9T4dBvB83T//SpBFZzgCz+Lzrx+1A17RXSmjyar6SF3JSJg+7B15NjUbfnemo2r6PY42livurrSG37zMC1ZUoiSQ0Wa058bhKRDKPVf6xeVNa1qZjNFSJruMe2Q5PtZHDCbEaFgNyQCPNuGqroFiLvStZ+94iLCE/2OnD3Tbhl7SJ3QSA8u/eFp2doIfNRQAkNuumk1r3CxwTKokWxxJR5is/RxwG7Sbv2qUkF9T78dsRlyjOgmVZs69EY9H7XmhAQISBWNAHc7Z0LvswBFvbu6YJQPLPKfnuCenumwp/+57aMMGs6HIsPLfjR4ZDamXIN2NX/hcAgfQh+XultZ4uyNY1YPQOwKn8xtLSNf9qbFSLPteACj+Ab1yJNiCBL6Ivj8+4PqJ9FtD4iaCWB1DUaaKKfkE8Ms5q+1b/6xt1agmj8u+gfEJEB4bX6PHJNoIh3fyAYlabmGdHNwrdL4I7amosyB9ZhgcbQW0Y7hMfaX8bOTFj1bMSvXgEoFyuTsXXMVjWq6k6xJxUXExaDZ5crLzxvg4vai1dvZeOGfgLIM16ohyiKevu9QOz7iEA979cZEX/aXhumuQtwXqFaSPUvWa1vLpeHsjhTN5uQUcodqU4moqPK5dhsWZLl2tuhtULie9c7NRPAmoidmKP7OvzANzm+9zN66/6Tu3/DTdZtVAUNa5VyfM8y1LHqsltaKX574mhPQnnZXXd+zz4xXE5Mg7Ir38Zz2PoICfG7d6MXQhYv3GZQVnOCXvbxIWFA6P/nbRTewUK/Aa2L2QxLmaQvUPGhKMwMNw2YKeTkDUYcvYOwUiA41RbuBywK4C+u2WibWQo2Ay"
`endif