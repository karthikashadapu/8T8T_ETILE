// ================================================================================
// Copyright (c) <2017>, Intel Corporation
// 
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
// 
//     * Redistributions of source code must retain the above copyright notice,
//       this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of Intel Corporation nor the names of its contributors
//       may be used to endorse or promote products derived from this software
//       without specific prior written permission.
// 
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
// FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
// DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
// SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
// CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
// OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
// ================================================================================ 


`timescale 1ns/1ns

module signal_replicator
(
input [7:0]  bw_config_cc1 ,
input [7:0]  bw_config_cc2 ,
input [55:0] radio_config_status ,
input        short_long_prach_sel,
input        rst_soft_n, 
input [31:0]  interface_sel ,


output [7:0]  bw_config_cc1_dup1 ,
output [7:0]  bw_config_cc2_dup1 ,
output [55:0] radio_config_status_dup1 ,
output        short_long_prach_sel_dup1,
output        rst_soft_n_dup1 , 


output [7:0]  bw_config_cc1_dup2 ,
output [7:0]  bw_config_cc2_dup2 ,
output [55:0] radio_config_status_dup2 ,
output        short_long_prach_sel_dup2,
output        rst_soft_n_dup2 , 


output [7:0]  bw_config_cc1_dup3 ,
output [7:0]  bw_config_cc2_dup3 ,
output [55:0] radio_config_status_dup3 ,
output        short_long_prach_sel_dup3,
output        rst_soft_n_dup3          ,
output        rst_soft_n_dup4 ,

output [31:0]  interface_sel_dup1 ,
output [31:0]  interface_sel_dup2 


);



assign   bw_config_cc1_dup1           = bw_config_cc1 ;
assign   bw_config_cc2_dup1           = bw_config_cc2 ;
assign   radio_config_status_dup1     = radio_config_status ;
assign   short_long_prach_sel_dup1    = short_long_prach_sel;
assign   rst_soft_n_dup1              = rst_soft_n          ;


assign   bw_config_cc1_dup2           = bw_config_cc1 ;
assign   bw_config_cc2_dup2           = bw_config_cc2 ;
assign   radio_config_status_dup2     = radio_config_status ;
assign   short_long_prach_sel_dup2    = short_long_prach_sel;
assign   rst_soft_n_dup2              = rst_soft_n          ;


assign   bw_config_cc1_dup3           = bw_config_cc1 ;
assign   bw_config_cc2_dup3           = bw_config_cc2 ;
assign   radio_config_status_dup3     = radio_config_status ;
assign   short_long_prach_sel_dup3    = short_long_prach_sel;
assign   rst_soft_n_dup3              = rst_soft_n          ;

assign   rst_soft_n_dup4              = rst_soft_n          ;



assign interface_sel_dup1 = interface_sel       ;
assign interface_sel_dup2 = interface_sel       ;


endmodule
