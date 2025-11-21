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


//------------------------------------------------------------------------------
// TX AVST to SEGMENT interface bit re-ordering
//------------------------------------------------------------------------------

`timescale 1ps/1ps

module eth_f_tx_avst_reverse #(
       parameter AIB_LANES         = 1
)(
input  [AIB_LANES*64-1:0]  i_tx_data_avst,
input  [AIB_LANES-1:0]     i_tx_inframe_avst,
input  [AIB_LANES*3-1:0]   i_tx_empty_avst,
input  [AIB_LANES-1:0]     i_tx_error_avst,
input  [AIB_LANES-1:0]     i_tx_skip_crc_avst,
output [AIB_LANES*64-1:0]  o_tx_data,
output [AIB_LANES-1:0]     o_tx_inframe,
output [AIB_LANES*3-1:0]   o_tx_empty,
output [AIB_LANES-1:0]     o_tx_skip_crc,
output [AIB_LANES-1:0]     o_tx_error
);

       eth_f_reverse_bytes #(
            .NUM_BYTES      (AIB_LANES*8)
       ) reverse_data_tx (
            .din(i_tx_data_avst),
            .dout(o_tx_data)
       );
       eth_f_reverse_3bits #(
            .NUM_SYMBOL     (AIB_LANES)
       ) reverse_empty_tx (
            .din(i_tx_empty_avst),
            .dout(o_tx_empty)
       );
       eth_f_reverse_bits #(
            .WIDTH      (AIB_LANES)
       ) reverse_inframe_tx (
            .din(i_tx_inframe_avst),
            .dout(o_tx_inframe)
       );
       eth_f_reverse_bits #(
            .WIDTH      (AIB_LANES)
       ) reverse_error_tx (
            .din(i_tx_error_avst),
            .dout(o_tx_error)
       );
       eth_f_reverse_bits #(
            .WIDTH      (AIB_LANES)
       ) reverse_skip_crc_tx (
            .din(i_tx_skip_crc_avst),
            .dout(o_tx_skip_crc)
       );

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "Jbn39HeDxGqNcYGZOx4Z9ucCs2oEh/b8uMkRaNvB5DRjzJrJYrpJKWFCISE85ii6tH9zuuCEo6X0af6OauTQ+Ozwk1tsZmSo/aK9UOYVqiI4L0mMLnnDyFPJBEUN+znp6d+oie84TxrwJugN/66eG6ek4cTulks0EXWtTfhwKcotsw0Xz4/SS3GVym/4tne0z9smydSL74/eJ6ocrXzqMjpfEjy1qL7mzZl6AEz+onqjyWF1zycOpizy6PNuIAe3xZxwBm0E0ZK9nLJcaqbrM1pZaMHqffYKTct0XktTYe1BMETdD6X7Y2lknr8aPOa3/Q5l4ZwYUrsF9ETgvLoXiXcd04WfYttMmE7UpgQoP/opfuXPK18RIGZ/1B9r9Q76BQeqghkepYCxtPc9hndpvGtoxwO6M3OMsfDUJcWcKg0zTUoNSNpsCJwTCBzBnag+al5tX//Q38xzOwKaav+sDIDvUG2xd4Tgn+a2G7XDwsO9/cKkJYySmAVw+Zf2BCGAtC9f3ICmUZhfV/K2WIA45bIfLEm+oVX8Qytu/ndlpp9r0kkaVQef10agvHXibeqOM3KxGtUqfjEPM4Fc4eALfmAtU9oL1a+bVYSvEeO+N1xFtC/5tauSMPOfyfVr/GTDqwhZPy/E9MXMYQvT++jDiMugjPyxqw/dWa+jZ8dm1M2cOX2jooRd2RhdC+s8q7jOYbBJl4LXEO59UaaY+AxNIuoF5bUgUUZo1E01w7CqWkFdmGeXHonlvOMEFT0A3shVdfjyUDnu1f1PApwzFOg+ofZmtbkHxym9fEIgMOm4DocTiTuJjcoKYYFGbS85oPMvUb70t7wwAKVpSTWDhDqEIgX9tel06hG4Q6vot0lCDYJZ6HdXYInvtjtal7v17iiEJ5Lz3xYhH/kDtj5B3CO+YE7DzaJo91BBrg3h0kf4XT+6yGyySCVlupo1/WGGdbUp/HRK65tHvULMH/lqbkYbkijg/JM8AJFpVTfJ2vdZ3vn2V892qNJJrm2z/+IRWg7V"
`endif