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


// INTEL CONFIDENTIAL
//
// Copyright 2020-2020 Intel Corporation.
//
// This software and the related documents are Intel copyrighted materials, and
// your use of them is governed by the express license under which they were
// provided to you ("License"). Unless the License provides otherwise, you may
// not use, modify, copy, publish, distribute, disclose or transmit this
// software or the related documents without Intel's prior written permission.
// This software and the related documents are provided as is, with no express
// or implied warranties, other than those that are expressly stated in the
// License.

module mem4ports_param #(
    parameter ADDR_WIDTH = 10
   ,parameter DATA_WIDTH = 8
) (
    input  logic                    clock
   //port A
   ,input  logic                    wren_a
   ,input  logic [ADDR_WIDTH - 1:0] write_address_a
   ,input  logic [ADDR_WIDTH - 1:0] read_address_a
   ,input  logic [DATA_WIDTH - 1:0] data_a
   ,output logic [DATA_WIDTH - 1:0] q_a
   //port B
   ,input  logic                    wren_b
   ,input  logic [ADDR_WIDTH - 1:0] write_address_b
   ,input  logic [ADDR_WIDTH - 1:0] read_address_b
   ,input  logic [DATA_WIDTH - 1:0] data_b
   ,output logic [DATA_WIDTH - 1:0] q_b
);

   altera_syncram  altera_syncram_component (
       .address2_a      (read_address_a)
      ,.address2_b      (read_address_b)
      ,.address_a       (write_address_a)
      ,.address_b       (write_address_b)
      ,.clock0          (clock)
      ,.data_a          (data_a)
      ,.data_b          (data_b)
      ,.wren_a          (wren_a)
      ,.wren_b          (wren_b)
      ,.q_a             (q_a)
      ,.q_b             (q_b)
      ,.aclr0           (1'b0)
      ,.aclr1           (1'b0)
      ,.addressstall_a  (1'b0)
      ,.addressstall_b  (1'b0)
      ,.byteena_a       (1'b1)
      ,.byteena_b       (1'b1)
      ,.clock1          (1'b1)
      ,.clocken0        (1'b1)
      ,.clocken1        (1'b1)
      ,.clocken2        (1'b1)
      ,.clocken3        (1'b1)
      ,.eccencbypass    (1'b0)
      ,.eccencparity    (8'b0)
      ,.eccstatus       ()
      ,.rden_a          (1'b1)
      ,.rden_b          (1'b1)
      ,.sclr            (1'b0)
   );
   defparam
      altera_syncram_component.address_aclr_a  = "NONE",
      altera_syncram_component.address_aclr_b  = "NONE",
      altera_syncram_component.address_reg_b  = "CLOCK0",
      altera_syncram_component.clock_enable_input_a  = "BYPASS",
      altera_syncram_component.clock_enable_input_b  = "BYPASS",
      altera_syncram_component.clock_enable_output_a  = "BYPASS",
      altera_syncram_component.clock_enable_output_b  = "BYPASS",
      altera_syncram_component.indata_reg_b  = "CLOCK0",
      altera_syncram_component.intended_device_family  = "Stratix 10",
      altera_syncram_component.lpm_type  = "altera_syncram",
      altera_syncram_component.numwords_a  = 2**ADDR_WIDTH,
      altera_syncram_component.numwords_b  = 2**ADDR_WIDTH,
      altera_syncram_component.operation_mode  = "QUAD_PORT",
      altera_syncram_component.outdata_aclr_a  = "NONE",
      altera_syncram_component.outdata_sclr_a  = "NONE",
      altera_syncram_component.outdata_aclr_b  = "NONE",
      altera_syncram_component.outdata_sclr_b  = "NONE",
      altera_syncram_component.outdata_reg_a  = "CLOCK0",
      altera_syncram_component.outdata_reg_b  = "CLOCK0",
      altera_syncram_component.power_up_uninitialized  = "FALSE",
      altera_syncram_component.enable_force_to_zero  = "FALSE",
      altera_syncram_component.read_during_write_mode_port_a  = "DONT_CARE",
      altera_syncram_component.read_during_write_mode_port_b  = "DONT_CARE",
      altera_syncram_component.read_during_write_mode_mixed_ports  = "NEW_A_OLD_B",
      altera_syncram_component.widthad_a  = ADDR_WIDTH,
      altera_syncram_component.widthad_b  = ADDR_WIDTH,
      altera_syncram_component.widthad2_a  = ADDR_WIDTH,
      altera_syncram_component.widthad2_b  = ADDR_WIDTH,
      altera_syncram_component.width_a  = DATA_WIDTH,
      altera_syncram_component.width_b  = DATA_WIDTH,
      altera_syncram_component.width_byteena_a  = 1,
      altera_syncram_component.width_byteena_b  = 1;
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "12eGHzhuzwzE3Jk0jEeOiewN6nwHALu32POyTf1JRNCV1OO/za2V4D/fHTxv4w7+HdY5I0a3bv3Hpe5d23LTkzUBWr/DOPSEcj3Y+bJ17gyFGyQY/gCPSyoX2LFpcR+gNWbGsGAYxdn8Ifv81Gif4S4dqthNm6DrNrNks867RzF0KuP2oTdv1KiuGKLRWAqy545AlItbNT/UEmyH9cDTkvw7JpmnyySAW+TVRIaxiRiE3ybXIBBJE9U/Tetk1vYuJD8sIXB1THP0uz8cxy+tOlegp6huSGv6ySX2KtN1v+zlvStAs5cgBXseUDH+CQskn8OzicJil4ogBEtwasWLxq+9qi1js/T07ia0FSfFAtYBVWXjgEo01KgQv2sqwF4LXUEoc4O2LF8frKGud1u/hSXVgdMSKe0lbp49I1bdcl6KRjnBckvm2CJ3Xya4GPtgifZT915y/3F1q6HNBQAhc1WBfqwuLAw+oRSUWPiLMRQrZEUgBWPrNeVJKwVeNcINNjFPPnwVh4Vu9v+PmAGuRwwgb8oZXQAAsIWdklDFRavZQpM7Ezk2zX7FMo1GXWuY4oiIwMnmU+9wclL18mgXvHch854f8R+ZZc11tWkiqwYUFegfM/o1t+3aLN1NP2RqGg9E4TVMuHE++7yKGB+7kPdcAp6dfCvqq1oniyu2VapBg4vcovn4mDd4I/AixL0nKOJ4fLhLBJfn3hJ44AOE6q2RhtCy1rtodcMomucQGzGMT3wjqNhp2NrfiJecW7sESG2N237VRRVYRZ0zbunelBq8aUX2Atdb+rKiIRDqTUNVaDqpj0Zz5z5neFf2AMR0JOs3Pdu7QYa243yWX7BVYuW6DwxUa2Q2i5tJtz7BxNiwH3D44tw1tykTgAssxzD4bhgdiEv+NqrGz63Aof+9xbBu3XzwWpG0sBK3wxXAiPiluXnhQ2S7OFyVkbZ+ImxXlcnpRMfOL0tqNkDtNiT0ElnMFgpGE8etRahTsj/XDh5iD6kc1yupQXx6b4MC1KZZ"
`endif