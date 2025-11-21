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


// Copyright 2021-2022 Intel Corporation.                                        
//                                                                               
// This software and the related documents are Intel copyrighted materials, and  
// your use of them is governed by the express license under which they were     
// provided to you ("License"). Unless the License provides otherwise, you may 
// not use, modify, copy, publish, distribute, disclose or transmit this         
// software or the related documents without Intel's prior written permission.   
// This software and the related documents are provided as is, with no express   
// or implied warranties, other than those that are expressly stated in the      
// License.                                                                      
    
// Auto generated file. Time: 2023-08-10 05:14:55 AM

`ifndef QUARTUS_CDC 
always_comb begin : header_attributes_init
//  -> eth -> type -> ptp  -> 
   header_attributes[0].offset = 12;
   header_attributes[0].size = 2;
   header_attributes[0].data = 16'h88F7;
//  -> eth ->  -> PTPv2 -> versionPTP -> v2 -> 
   header_attributes[1].offset = 15;
   header_attributes[1].size = 0;
   header_attributes[1].data = 8'h02;
//  -> eth ->  -> PTPv2 -> versionPTP -> v2 -> 
   header_attributes[2].offset = 15;
   header_attributes[2].size = 0;
   header_attributes[2].data = 8'h02;
//  -> eth -> type -> ipv4 -> 
   header_attributes[3].offset = 12;
   header_attributes[3].size = 2;
   header_attributes[3].data = 16'h0800;
//  -> eth ->  -> ipv4 -> proto -> udp -> 
   header_attributes[4].offset = 23;
   header_attributes[4].size = 1;
   header_attributes[4].data = 8'h11;
//  -> eth ->  -> ipv4 ->  -> udp -> dport -> ptp_ev  -> 
   header_attributes[5].offset = 36;
   header_attributes[5].size = 2;
   header_attributes[5].data = 16'h013F;
//  -> eth ->  -> ipv4 ->  -> udp -> dport -> ptp_msc -> 
   header_attributes[6].offset = 36;
   header_attributes[6].size = 2;
   header_attributes[6].data = 16'h0140;
//  -> eth ->  -> ipv4 ->  -> udp ->  -> PTPv2 -> versionPTP -> v2 -> 
   header_attributes[7].offset = 43;
   header_attributes[7].size = 0;
   header_attributes[7].data = 8'h02;
//  -> eth ->  -> ipv4 ->  -> udp ->  -> PTPv2 -> versionPTP -> v2 -> 
   header_attributes[8].offset = 43;
   header_attributes[8].size = 0;
   header_attributes[8].data = 8'h02;
//  -> eth -> type -> ipv6 -> 
   header_attributes[9].offset = 12;
   header_attributes[9].size = 2;
   header_attributes[9].data = 16'h86DD;
//  -> eth ->  -> ipv6 -> nh -> udp -> 
   header_attributes[10].offset = 20;
   header_attributes[10].size = 1;
   header_attributes[10].data = 8'h11;
//  -> eth ->  -> ipv6 ->  -> udp -> dport -> ptp_ev  -> 
   header_attributes[11].offset = 56;
   header_attributes[11].size = 2;
   header_attributes[11].data = 16'h013F;
//  -> eth ->  -> ipv6 ->  -> udp -> dport -> ptp_msc -> 
   header_attributes[12].offset = 56;
   header_attributes[12].size = 2;
   header_attributes[12].data = 16'h0140;
//  -> eth ->  -> ipv6 ->  -> udp ->  -> PTPv2 -> versionPTP -> v2 -> 
   header_attributes[13].offset = 63;
   header_attributes[13].size = 0;
   header_attributes[13].data = 8'h02;
//  -> eth ->  -> ipv6 ->  -> udp ->  -> PTPv2 -> versionPTP -> v2 -> 
   header_attributes[14].offset = 63;
   header_attributes[14].size = 0;
   header_attributes[14].data = 8'h02;
//  -> eth -> type -> vlan -> 
   header_attributes[15].offset = 12;
   header_attributes[15].size = 2;
   header_attributes[15].data = 16'h8100;
//  -> eth ->  -> vlan -> type -> vlan -> 
   header_attributes[16].offset = 16;
   header_attributes[16].size = 2;
   header_attributes[16].data = 16'h8100;
//  -> eth ->  -> vlan ->  -> vlan2 -> type -> ptp  -> 
   header_attributes[17].offset = 20;
   header_attributes[17].size = 2;
   header_attributes[17].data = 16'h88F7;
//  -> eth ->  -> vlan ->  -> vlan2 ->  -> PTPv2 -> versionPTP -> v2 -> 
   header_attributes[18].offset = 23;
   header_attributes[18].size = 0;
   header_attributes[18].data = 8'h02;
//  -> eth ->  -> vlan ->  -> vlan2 ->  -> PTPv2 -> versionPTP -> v2 -> 
   header_attributes[19].offset = 23;
   header_attributes[19].size = 0;
   header_attributes[19].data = 8'h02;
//  -> eth ->  -> vlan ->  -> vlan2 -> type -> ipv4 -> 
   header_attributes[20].offset = 20;
   header_attributes[20].size = 2;
   header_attributes[20].data = 16'h0800;
//  -> eth ->  -> vlan ->  -> vlan2 ->  -> ipv4 -> proto -> udp -> 
   header_attributes[21].offset = 31;
   header_attributes[21].size = 1;
   header_attributes[21].data = 8'h11;
//  -> eth ->  -> vlan ->  -> vlan2 ->  -> ipv4 ->  -> udp -> dport -> ptp_ev  -> 
   header_attributes[22].offset = 44;
   header_attributes[22].size = 2;
   header_attributes[22].data = 16'h013F;
//  -> eth ->  -> vlan ->  -> vlan2 ->  -> ipv4 ->  -> udp -> dport -> ptp_msc -> 
   header_attributes[23].offset = 44;
   header_attributes[23].size = 2;
   header_attributes[23].data = 16'h0140;
//  -> eth ->  -> vlan ->  -> vlan2 ->  -> ipv4 ->  -> udp ->  -> PTPv2 -> versionPTP -> v2 -> 
   header_attributes[24].offset = 51;
   header_attributes[24].size = 0;
   header_attributes[24].data = 8'h02;
//  -> eth ->  -> vlan ->  -> vlan2 ->  -> ipv4 ->  -> udp ->  -> PTPv2 -> versionPTP -> v2 -> 
   header_attributes[25].offset = 51;
   header_attributes[25].size = 0;
   header_attributes[25].data = 8'h02;
//  -> eth ->  -> vlan ->  -> vlan2 -> type -> ipv6 -> 
   header_attributes[26].offset = 20;
   header_attributes[26].size = 2;
   header_attributes[26].data = 16'h86DD;
//  -> eth ->  -> vlan ->  -> vlan2 ->  -> ipv6 -> nh -> udp -> 
   header_attributes[27].offset = 28;
   header_attributes[27].size = 1;
   header_attributes[27].data = 8'h11;
//  -> eth ->  -> vlan ->  -> vlan2 ->  -> ipv6 ->  -> udp -> dport -> ptp_ev  -> 
   header_attributes[28].offset = 64;
   header_attributes[28].size = 2;
   header_attributes[28].data = 16'h013F;
//  -> eth ->  -> vlan ->  -> vlan2 ->  -> ipv6 ->  -> udp -> dport -> ptp_msc -> 
   header_attributes[29].offset = 64;
   header_attributes[29].size = 2;
   header_attributes[29].data = 16'h0140;
//  -> eth ->  -> vlan ->  -> vlan2 ->  -> ipv6 ->  -> udp ->  -> PTPv2 -> versionPTP -> v2 -> 
   header_attributes[30].offset = 71;
   header_attributes[30].size = 0;
   header_attributes[30].data = 8'h02;
//  -> eth ->  -> vlan ->  -> vlan2 ->  -> ipv6 ->  -> udp ->  -> PTPv2 -> versionPTP -> v2 -> 
   header_attributes[31].offset = 71;
   header_attributes[31].size = 0;
   header_attributes[31].data = 8'h02;
//  -> eth ->  -> vlan -> type -> ptp  -> 
   header_attributes[32].offset = 16;
   header_attributes[32].size = 2;
   header_attributes[32].data = 16'h88F7;
//  -> eth ->  -> vlan ->  -> PTPv2 -> versionPTP -> v2 -> 
   header_attributes[33].offset = 19;
   header_attributes[33].size = 0;
   header_attributes[33].data = 8'h02;
//  -> eth ->  -> vlan ->  -> PTPv2 -> versionPTP -> v2 -> 
   header_attributes[34].offset = 19;
   header_attributes[34].size = 0;
   header_attributes[34].data = 8'h02;
//  -> eth ->  -> vlan -> type -> ipv4 -> 
   header_attributes[35].offset = 16;
   header_attributes[35].size = 2;
   header_attributes[35].data = 16'h0800;
//  -> eth ->  -> vlan ->  -> ipv4 -> proto -> udp -> 
   header_attributes[36].offset = 27;
   header_attributes[36].size = 1;
   header_attributes[36].data = 8'h11;
//  -> eth ->  -> vlan ->  -> ipv4 ->  -> udp -> dport -> ptp_ev  -> 
   header_attributes[37].offset = 40;
   header_attributes[37].size = 2;
   header_attributes[37].data = 16'h013F;
//  -> eth ->  -> vlan ->  -> ipv4 ->  -> udp -> dport -> ptp_msc -> 
   header_attributes[38].offset = 40;
   header_attributes[38].size = 2;
   header_attributes[38].data = 16'h0140;
//  -> eth ->  -> vlan ->  -> ipv4 ->  -> udp ->  -> PTPv2 -> versionPTP -> v2 -> 
   header_attributes[39].offset = 47;
   header_attributes[39].size = 0;
   header_attributes[39].data = 8'h02;
//  -> eth ->  -> vlan ->  -> ipv4 ->  -> udp ->  -> PTPv2 -> versionPTP -> v2 -> 
   header_attributes[40].offset = 47;
   header_attributes[40].size = 0;
   header_attributes[40].data = 8'h02;
//  -> eth ->  -> vlan -> type -> ipv6 -> 
   header_attributes[41].offset = 16;
   header_attributes[41].size = 2;
   header_attributes[41].data = 16'h86DD;
//  -> eth ->  -> vlan ->  -> ipv6 -> nh -> udp -> 
   header_attributes[42].offset = 24;
   header_attributes[42].size = 1;
   header_attributes[42].data = 8'h11;
//  -> eth ->  -> vlan ->  -> ipv6 ->  -> udp -> dport -> ptp_ev  -> 
   header_attributes[43].offset = 60;
   header_attributes[43].size = 2;
   header_attributes[43].data = 16'h013F;
//  -> eth ->  -> vlan ->  -> ipv6 ->  -> udp -> dport -> ptp_msc -> 
   header_attributes[44].offset = 60;
   header_attributes[44].size = 2;
   header_attributes[44].data = 16'h0140;
//  -> eth ->  -> vlan ->  -> ipv6 ->  -> udp ->  -> PTPv2 -> versionPTP -> v2 -> 
   header_attributes[45].offset = 67;
   header_attributes[45].size = 0;
   header_attributes[45].data = 8'h02;
//  -> eth ->  -> vlan ->  -> ipv6 ->  -> udp ->  -> PTPv2 -> versionPTP -> v2 -> 
   header_attributes[46].offset = 67;
   header_attributes[46].size = 0;
   header_attributes[46].data = 8'h02;
end : header_attributes_init

always_comb begin : pkt_type_classifier_init
   pkt_type_classifiers[000] = 47'b00000000000000000000000000000000000000000000111; // [eth] (type) ptp  [PTPv2]
   pkt_type_classifiers[001] = 47'b00000000000000000000000000000000000000110111000; // [eth] (type) ipv4 [ipv4] [udp] (dport) ptp_ev  [PTPv2]
   pkt_type_classifiers[002] = 47'b00000000000000000000000000000000000000111011000; // [eth] (type) ipv4 [ipv4] [udp] (dport) ptp_msc [PTPv2]
   pkt_type_classifiers[003] = 47'b00000000000000000000000000000000110111000000000; // [eth] (type) ipv6 [ipv6] [udp] (dport) ptp_ev  [PTPv2]
   pkt_type_classifiers[004] = 47'b00000000000000000000000000000000111011000000000; // [eth] (type) ipv6 [ipv6] [udp] (dport) ptp_msc [PTPv2]
   pkt_type_classifiers[005] = 47'b00000000000000000000000000011111000000000000000; // [eth] (type) vlan [vlan] (type) vlan [vlan2] (type) ptp  [PTPv2]
   pkt_type_classifiers[006] = 47'b00000000000000000000011011100011000000000000000; // [eth] (type) vlan [vlan] (type) vlan [vlan2] (type) ipv4 [ipv4] [udp] (dport) ptp_ev  [PTPv2]
   pkt_type_classifiers[007] = 47'b00000000000000000000011101100011000000000000000; // [eth] (type) vlan [vlan] (type) vlan [vlan2] (type) ipv4 [ipv4] [udp] (dport) ptp_msc [PTPv2]
   pkt_type_classifiers[008] = 47'b00000000000000011011100000000011000000000000000; // [eth] (type) vlan [vlan] (type) vlan [vlan2] (type) ipv6 [ipv6] [udp] (dport) ptp_ev  [PTPv2]
   pkt_type_classifiers[009] = 47'b00000000000000011101100000000011000000000000000; // [eth] (type) vlan [vlan] (type) vlan [vlan2] (type) ipv6 [ipv6] [udp] (dport) ptp_msc [PTPv2]
   pkt_type_classifiers[010] = 47'b00000000000011100000000000000001000000000000000; // [eth] (type) vlan [vlan] (type) ptp  [PTPv2]
   pkt_type_classifiers[011] = 47'b00000011011100000000000000000001000000000000000; // [eth] (type) vlan [vlan] (type) ipv4 [ipv4] [udp] (dport) ptp_ev  [PTPv2]
   pkt_type_classifiers[012] = 47'b00000011101100000000000000000001000000000000000; // [eth] (type) vlan [vlan] (type) ipv4 [ipv4] [udp] (dport) ptp_msc [PTPv2]
   pkt_type_classifiers[013] = 47'b11011100000000000000000000000001000000000000000; // [eth] (type) vlan [vlan] (type) ipv6 [ipv6] [udp] (dport) ptp_ev  [PTPv2]
   pkt_type_classifiers[014] = 47'b11101100000000000000000000000001000000000000000; // [eth] (type) vlan [vlan] (type) ipv6 [ipv6] [udp] (dport) ptp_msc [PTPv2]
end : pkt_type_classifier_init

always_comb begin : result_pkts_num_init
   result_pkts_num[000] = 000;
   result_pkts_num[001] = 001;
   result_pkts_num[002] = 002;
   result_pkts_num[003] = 003;
   result_pkts_num[004] = 004;
   result_pkts_num[005] = 005;
   result_pkts_num[006] = 006;
   result_pkts_num[007] = 007;
   result_pkts_num[008] = 008;
   result_pkts_num[009] = 009;
   result_pkts_num[010] = 010;
   result_pkts_num[011] = 011;
   result_pkts_num[012] = 012;
   result_pkts_num[013] = 013;
   result_pkts_num[014] = 014;
end : result_pkts_num_init

always_comb begin : ptp_header_offset_init
   parser_result[00][000] = 14;
   parser_result[00][001] = 42;
   parser_result[00][002] = 42;
   parser_result[00][003] = 62;
   parser_result[00][004] = 62;
   parser_result[00][005] = 22;
   parser_result[00][006] = 50;
   parser_result[00][007] = 50;
   parser_result[00][008] = 70;
   parser_result[00][009] = 70;
   parser_result[00][010] = 18;
   parser_result[00][011] = 46;
   parser_result[00][012] = 46;
   parser_result[00][013] = 66;
   parser_result[00][014] = 66;
end : ptp_header_offset_init

always_comb begin : ip_type_udp_checksum_correct_init
   parser_result[01][000] = 0;
   parser_result[01][001] = 1;
   parser_result[01][002] = 1;
   parser_result[01][003] = 2;
   parser_result[01][004] = 2;
   parser_result[01][005] = 0;
   parser_result[01][006] = 1;
   parser_result[01][007] = 1;
   parser_result[01][008] = 2;
   parser_result[01][009] = 2;
   parser_result[01][010] = 0;
   parser_result[01][011] = 1;
   parser_result[01][012] = 1;
   parser_result[01][013] = 2;
   parser_result[01][014] = 2;
end : ip_type_udp_checksum_correct_init

always_comb begin : ptp_data_init
   extract_cmd[00][000] = 14;
   extract_cmd[00][001] = 42;
   extract_cmd[00][002] = 42;
   extract_cmd[00][003] = 62;
   extract_cmd[00][004] = 62;
   extract_cmd[00][005] = 22;
   extract_cmd[00][006] = 50;
   extract_cmd[00][007] = 50;
   extract_cmd[00][008] = 70;
   extract_cmd[00][009] = 70;
   extract_cmd[00][010] = 18;
   extract_cmd[00][011] = 46;
   extract_cmd[00][012] = 46;
   extract_cmd[00][013] = 66;
   extract_cmd[00][014] = 66;
end : ptp_data_init

always_comb begin : ptp_flag_init
   extract_cmd[01][000] = 18;
   extract_cmd[01][001] = 46;
   extract_cmd[01][002] = 46;
   extract_cmd[01][003] = 66;
   extract_cmd[01][004] = 66;
   extract_cmd[01][005] = 26;
   extract_cmd[01][006] = 54;
   extract_cmd[01][007] = 54;
   extract_cmd[01][008] = 74;
   extract_cmd[01][009] = 74;
   extract_cmd[01][010] = 22;
   extract_cmd[01][011] = 50;
   extract_cmd[01][012] = 50;
   extract_cmd[01][013] = 70;
   extract_cmd[01][014] = 70;
end : ptp_flag_init

`endif
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "12eGHzhuzwzE3Jk0jEeOiewN6nwHALu32POyTf1JRNCV1OO/za2V4D/fHTxv4w7+HdY5I0a3bv3Hpe5d23LTkzUBWr/DOPSEcj3Y+bJ17gyFGyQY/gCPSyoX2LFpcR+gNWbGsGAYxdn8Ifv81Gif4S4dqthNm6DrNrNks867RzF0KuP2oTdv1KiuGKLRWAqy545AlItbNT/UEmyH9cDTkvw7JpmnyySAW+TVRIaxiRgLrctJSLQm9Z0xTA8v8eYxN+DiqoPdrSG2juxnDk/9Jq/QBQwdw2ZyAl8duUNZhqDWJJ1ZecFLJznRpShanxjBAv5e8JLZPtnoyi9LKbWMAxO7aVohGgB3gnPdH2Mqnv4dM0jOtd9chc+BqRxbcfdglwZI/xnPUhdZT4kpW1epU1mDHrmGyHJMO7gJUkWi5IOlN55o7HoVs/gD5rRyQF/1ZyR3lnZLULauQwmZvm1tGJRy6/41GP/5wdht+umCl+3UCIWHhRpjD8wwweoXWe4BPlcyY3NbAUASvoC+jWjvYORlaal6/OBF4gvheb3l7cbNqgrziXxw3YVAJ9whqHJ9xClQWnI3Z4HWeSl1b9sJzVAvRWMTG6F1YPpUf+tl3fi9u8+300VrvEeMwhCxA5ytQ85OZGYs/EfsrgQw9jovOgFVGRblIsaE+8r4NMDLr842GHF5H1ZlM50WBTro7cWr6JDck+F3cal9tkk4XcTAPYU2LlIIcyNjtYFqRtn4UQta88oyzFTKJ0ECflzbfhQRvcuVK5cZ0+JxQOmwWJZG35UrR/YJ62eZgho3U4AcNw81MVu5PVgoze9vPNPb2mt0xzdPH752cYj4sUZNpMWXh1JfxwhhcTWChsL87zxQnChf1mxCDLzJNAXFDLjKU0bgOlRv1rjbvdwgrTWhl666gOUyLrS5VRGAHc5oTY82VoGnENCGP7QvKzSmSDiDxhGwPWGs9/ozEVaH6h5kkeytWwD9T0FN+3miIPWXYjBkyf0jvZADTpqPi6ptK6c5Uzl4"
`endif