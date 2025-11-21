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
module eth_f_data_mux_2to1_tx100a  #(
    parameter WIDTH                 = 8,
	parameter EHIP_RATE             = "100G",
	parameter I_DATA_SIZE 			= (EHIP_RATE == "100G") ? 2 : 4,
	parameter O_DATA_SIZE 			= (EHIP_RATE == "100G") ? 1 : 2
) (
    input   logic                       i_clk,
    input   logic                       i_sel,
    input   logic   [0:I_DATA_SIZE-1][WIDTH-1:0]    i_data,
    output  logic   [0:O_DATA_SIZE-1][WIDTH-1:0]    o_data
);
	
    always_ff @(posedge i_clk) begin
        case (i_sel)
            1'd0 : o_data  <= i_data[0: (I_DATA_SIZE/2)-1];
            1'd1 : o_data  <= i_data[(I_DATA_SIZE/2):(I_DATA_SIZE-1)];
        endcase
    end
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "Jbn39HeDxGqNcYGZOx4Z9ucCs2oEh/b8uMkRaNvB5DRjzJrJYrpJKWFCISE85ii6tH9zuuCEo6X0af6OauTQ+Ozwk1tsZmSo/aK9UOYVqiI4L0mMLnnDyFPJBEUN+znp6d+oie84TxrwJugN/66eG6ek4cTulks0EXWtTfhwKcotsw0Xz4/SS3GVym/4tne0z9smydSL74/eJ6ocrXzqMjpfEjy1qL7mzZl6AEz+onrKvczuNWd8P7WxDhmviVX2bvx1EEoyYUbadtc+a+QBSVTg1ukzG4FxZi4H+e8nIFbFFEO3N3VaulVQhQBiGye8Hw363G7KR1DSBW0vJ8oE4ol1He4CZePpnvJAfHQM9y9NOQFRURhbmViVcVwPsWslKMhsqx0igtMRm2k6uA2SCf0wVqgT7aF+IasUoHcN0B+1YWtXBhwEW2YYOx/Dk6CuktMdEXDOizHHePuSupN+p4QC0Mx4ll4xzhIfZEGIeTLADotpw/U3zlSDyPn+iv/rOUHuLJKvKdh//FgjMpyGoXTbxhk2mHOpK/IPBgii4ACPbS2yctrMkwKi/DEUphTnz+Lg3ae7pa+l58JUvHICm/ST9jOYe6HZaWdfbBtq4GAAtwRPxstcXxM7LYclp7IruSYPp7bRW6nQRwxrqa2+ly7OkHLfTJiEfmpeUXjhop1qQrG9cwGTVpiFxrVE2DuSmp3oGGfQv3jssGU7S6z7Ss1yK1eI+Tw9Mu/xY1F/xDF6laxohi79tlG+PckUqk8jjbppejxI8r235kEcTAsT4haFwLUOKYzRmG6eVPJQcai39JqA2HCNVxnwDGFp36NP3+6glXTZg/BG0yVq6B4KnZIJ4MpgLLCo3BFd71uBUzZunBIRyknH6ODcCbe7yURPPzdq89+rntaq990dGOFQ0Q/mAzoWhPfL8Dm8IfLo8eOQDfbXY6pUl/uyNlQLcEvwFrhB8hRgRlu8XqI/GIn6XLpM+4qO5P0AGV35fAr1c2qUdlvaNpuqPi51bD5kXZSv"
`endif