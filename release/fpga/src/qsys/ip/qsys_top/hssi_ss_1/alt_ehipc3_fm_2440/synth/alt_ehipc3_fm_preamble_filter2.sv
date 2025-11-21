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

module alt_ehipc3_fm_preamble_filter2 (
    input   logic           i_clk,
    input   logic           i_reset,
    input   logic           i_valid,
    input   logic   [0:1]   i_inframe,
    output  logic           o_valid,
    output  logic   [0:1]   o_inframe
);

    logic if_last;

    always_ff @(posedge i_clk) begin
        if (i_reset) begin
            if_last <= 1'b0;
        end else begin
            if_last <= i_valid ? i_inframe[1] : if_last;
        end
    end

    always_ff @(posedge i_clk) begin
        o_valid         <= i_valid;
        o_inframe[0]    <= if_last      & i_inframe[0];
        o_inframe[1]    <= i_inframe[0] & i_inframe[1];
    end
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "saGjb1xDblePCNY2eWcU/WvrOpZ5y9L4HgH/STvXeTRjyVb5Hg3phAWHKa+Ja3uOaKCFTl5kfGSVJrSHGZIU2CdcxmhdytRqbQ0UcBPifegPrKd6dYg79K0bkZ61/NICQ+UJ9yoeMywH7wFow65pcDvjNEkGcPKTqnQsCsy/RLnS+cZK1GzMa0/iQAhI9wypwGpArU02scNBymXHbs0QD3gEL/csPen+0fxLO07kEh2RXHhcEYWnDvslmDpIGvVrEYuC2RNJ4FvKwi3yTFzf+1j3MdoBk6KkJi03911ZK4DUplDZBiQJV4xlsR7GGnm841w9+fZh/wM7UY3EEXP6JjOJxPTC4g+Dzfv3azoNKaKAnymaEZFGBe6SHWJKE8+UaiDEM07vjbK4G42KwYDyem3n9xLnoJcNLf2sQ5deTTsYcSszXao4S6VFCGOMKTTKTl+PGFDOhCRR5AaLIOYGX3Y9iSeUAzsXs9pbt+OdDejy+ZdNTbIhNMpxhr11sG/A8Eb2ir619va+p6KqR3hAszagC2gy6cmtsKTXinxBAEbHb+e0IyHmpVQUeP0p+d6rDrTP/0N9ToogihLnRs4VEkUwCnii08WYLF1mJwuSrycGJsZL93Jec4pzCqXO4XprQQUb5TwoqPpT91+T4tq7z/NH5jF4TcPmVJzZec3er/e0dTa7xo3evWgANLnuXIb8N8FDkBYb5TvvSFEmdANqyar9Y1wXWaGY7Tnj32fxK0MKQdIAWgy3PkxOZJYu23K7+tiQQ8nowqDBR+euI1xn37Xs6wuApqnEQMEsqwAolteMLPtTdGIKkQwdQ8YgXUr7M3c80yEzcudzep8I31QlGyGO3Zf+lhLIwt6R4RkjNkAAHp50FfUHPl08eYYU0thu5pBCa4wRgcctVhpnxR7tIu3Dhcwn5Ox+zsAIcruCzRPXTsCfNKj+2LhIQ0eMIKKHQPDhN5yeQ3qkUVFtyUeaDZdJ1O6Gt0sHljhHgHy7y3AW06rabtCTNS2qldwudhpY"
`endif