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


  // (C) 2001-2020 Intel Corporation. All rights reserved.
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

// ==========================================================================
// Project           : HSSI Subsystem 
// Module            : keep2empty.sv
// Description       : 
// Author            : 
// Created           : 
// Changes           : 
//                   : 
// ==========================================================================


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on


module keep2empty #(
    parameter EMPTY_BITS         = 3,
    parameter NO_OF_BYTES        = 8 
    
) (
    input                                clk, 
    // input                                rst_n, 
    // input      [NO_OF_BYTES-1:0] keep_bits_in, 
    input      [63:0] keep_bits_in, 
    output  [EMPTY_BITS-1:0]  empty_bits_out_d1

);

//***********************************************************
//***********************************************************

wire [11:0] empty_bits_out;

reg [11:0] tkeep2empty_64 = '0;

assign empty_bits_out_d1 = tkeep2empty_64[EMPTY_BITS-1:0];

always @(posedge clk)     //* remove reset
begin
   case(1)
       keep_bits_in[63] : tkeep2empty_64 <= 12'd0 ;
       keep_bits_in[62] : tkeep2empty_64 <= 12'd1 ; 
       keep_bits_in[61] : tkeep2empty_64 <= 12'd2 ; 
       keep_bits_in[60] : tkeep2empty_64 <= 12'd3 ; 
       keep_bits_in[59] : tkeep2empty_64 <= 12'd4 ;
       keep_bits_in[58] : tkeep2empty_64 <= 12'd5 ; 
       keep_bits_in[57] : tkeep2empty_64 <= 12'd6 ; 
       keep_bits_in[56] : tkeep2empty_64 <= 12'd7 ; 
       keep_bits_in[55] : tkeep2empty_64 <= 12'd8 ; 
       keep_bits_in[54] : tkeep2empty_64 <= 12'd9 ; 
   
       keep_bits_in[53] : tkeep2empty_64 <= 12'd10 ;
       keep_bits_in[52] : tkeep2empty_64 <= 12'd11 ;
       keep_bits_in[51] : tkeep2empty_64 <= 12'd12 ;
       keep_bits_in[50] : tkeep2empty_64 <= 12'd13 ;
       keep_bits_in[49] : tkeep2empty_64 <= 12'd14 ;
       keep_bits_in[48] : tkeep2empty_64 <= 12'd15 ;
       keep_bits_in[47] : tkeep2empty_64 <= 12'd16 ;
       keep_bits_in[46] : tkeep2empty_64 <= 12'd17 ;
       keep_bits_in[45] : tkeep2empty_64 <= 12'd18 ;
       keep_bits_in[44] : tkeep2empty_64 <= 12'd19 ;
   
       keep_bits_in[43] : tkeep2empty_64 <= 12'd20 ;
       keep_bits_in[42] : tkeep2empty_64 <= 12'd21 ;
       keep_bits_in[41] : tkeep2empty_64 <= 12'd22 ;
       keep_bits_in[40] : tkeep2empty_64 <= 12'd23 ;
       keep_bits_in[39] : tkeep2empty_64 <= 12'd24 ;
       keep_bits_in[38] : tkeep2empty_64 <= 12'd25 ;
       keep_bits_in[37] : tkeep2empty_64 <= 12'd26 ;
       keep_bits_in[36] : tkeep2empty_64 <= 12'd27 ;
       keep_bits_in[35] : tkeep2empty_64 <= 12'd28 ;
       keep_bits_in[34] : tkeep2empty_64 <= 12'd29 ;
   
       keep_bits_in[33] : tkeep2empty_64 <= 12'd30 ;
       keep_bits_in[32] : tkeep2empty_64 <= 12'd31 ;
       keep_bits_in[31] : tkeep2empty_64 <= 12'd32 ;
       keep_bits_in[30] : tkeep2empty_64 <= 12'd33 ;
       keep_bits_in[29] : tkeep2empty_64 <= 12'd34 ;
       keep_bits_in[28] : tkeep2empty_64 <= 12'd35 ;
       keep_bits_in[27] : tkeep2empty_64 <= 12'd36 ;
       keep_bits_in[26] : tkeep2empty_64 <= 12'd37 ;
       keep_bits_in[25] : tkeep2empty_64 <= 12'd38 ;
       keep_bits_in[24] : tkeep2empty_64 <= 12'd39 ;
   
       keep_bits_in[23] : tkeep2empty_64 <= 12'd40 ;
       keep_bits_in[22] : tkeep2empty_64 <= 12'd41 ;
       keep_bits_in[21] : tkeep2empty_64 <= 12'd42 ;
       keep_bits_in[20] : tkeep2empty_64 <= 12'd43 ;
       keep_bits_in[19] : tkeep2empty_64 <= 12'd44 ;
       keep_bits_in[18] : tkeep2empty_64 <= 12'd45 ;
       keep_bits_in[17] : tkeep2empty_64 <= 12'd46 ;
       keep_bits_in[16] : tkeep2empty_64 <= 12'd47 ;
       keep_bits_in[15] : tkeep2empty_64 <= 12'd48 ;
       keep_bits_in[14] : tkeep2empty_64 <= 12'd49 ;
   
       keep_bits_in[13] : tkeep2empty_64 <= 12'd50 ;
       keep_bits_in[12] : tkeep2empty_64 <= 12'd51 ;
       keep_bits_in[11] : tkeep2empty_64 <= 12'd52 ;
       keep_bits_in[10] : tkeep2empty_64 <= 12'd53 ;
       keep_bits_in[9]  : tkeep2empty_64 <= 12'd54 ;
       keep_bits_in[8]  : tkeep2empty_64 <= 12'd55 ;
       keep_bits_in[7]  : tkeep2empty_64 <= 12'd56 ;
       keep_bits_in[6]  : tkeep2empty_64 <= 12'd57 ;
       keep_bits_in[5]  : tkeep2empty_64 <= 12'd58 ;
       keep_bits_in[4]  : tkeep2empty_64 <= 12'd59 ;
                 
       keep_bits_in[3]  : tkeep2empty_64 <= 12'd60 ;
       keep_bits_in[2]  : tkeep2empty_64 <= 12'd61 ;
       keep_bits_in[1]  : tkeep2empty_64 <= 12'd62 ;
       keep_bits_in[0]  : tkeep2empty_64 <= 12'd63 ;
       default   : tkeep2empty_64 <= 12'd0  ;
   endcase
end
        
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "SsA75YSYGF80sMxcVcIJz7qC/bu5/GFmyOQtDL/x79k9awhwrs1/rpWwdMSdZM2X+KK5OPl7NlHx7SPY5wRckyl2RR/pULB4Gr4ljG7XN4DaAxjnUEsFPGaSXMbeLmHIwmOgVpfePQEWBImt9G4xgjV0kVX3ONW9Qk4+e/sQSunDVn3fkI+oox1qImh/vDaEBsdPebXpztP0C0MXDID9QjOct1HHbd4YOYjU6rRW6ytAsNpzyRnJeo0SUquFe+O2pNSfcDradcz0Vj/ry+Q5RPL7vrHuKOAylCSRmmJx6nUOI973HM0WXUWrUbz5ExgdwfgNgoPN77IWDhz/knMhJm2E6jYwfuEhE3w8mRwgi2z7K+wwpis8LYTMaAKA+2B1anbOTVu8mmHxl7SGfQ015BjMivVhNPjHmPMe6qFAV2I7tuX8V0ALzoKghHyph8ic1MRISVOrT+TZp8VwjkjKBPqJSjxl0mcnFzoMimwJ/upwbvTXge5Ss9mj9R02hG2c7j3z45K+IPT1cUYGi5/xtiCgayYnBKk1UWPbshWWqhyJNbev8XhLdn4hKvXxRgEVXzbkX1RCZClLiLD/uBDO+N/5QIXm2vWi0nKY7ndvFgTt/w+iLIjynxKwfFdPRw0L8kxnR03GB0LGkUPEu2FEnNiKLuIAezk2WtEGf294sfXRSOrcLJQARXpXvfgJVtTV7W7oQ4l31dqTcRTeLIVYOB2HCiQ1fqsvsZ++rnEd6A/QY0yjfMW7BO0VqPEkjFXS9qB/veBg+7y1u4m+sBmiMtLNDdIASDxQJ+5vjTtBbjzyfPzGjDru47gFUalR2HE1U8vDiAK7SOY2oWFWUaTmv5iMyeXp/hTdKjjR7aRwrApIhzU+joUbQn+unExGLf3cwQ14NHLY+WoZlSTTMARDF725e0DMofrO1L3aYWeLiTFZajRsaQGi2sMHc1jxVVabKSLHpGi44YOBB+ld7PpHIeyoBmc6nuH4umeCWRYyNgB+Pf4AdmXfrB765orY/HMm"
`endif