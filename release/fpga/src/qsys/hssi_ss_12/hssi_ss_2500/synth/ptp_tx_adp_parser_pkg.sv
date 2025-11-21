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


// Copyright 2022-2022 Intel Corporation.
//
// This software and the related documents are Intel copyrighted materials, and
// your use of them is governed by the express license under which they were
// provided to you ("License"). Unless the License provides otherwise, you may
// not use, modify, copy, publish, distribute, disclose or transmit this
// software or the related documents without Intel's prior written permission.
// This software and the related documents are provided as is, with no express
// or implied warranties, other than those that are expressly stated in the
// License.

package ptp_tx_adp_parser_pkg;
   localparam int OFFSET_WIDTH = 16;

   typedef struct packed {
      logic [1:0]  clock_type;  //Clock Mode of incoming PTP Tx packet (i_clock_type).
                                   //2'b00: Ordinary Clock
                                   //2'b01: Boundary Clock
                                   //2'b10: End-to-end Transparent Clock
                                   //2'b11: Peer-to-peer Transparent Clock
      logic [31:0] fp;          //Fingerprint for current TX Packet (i_ptp_fp[31:0], MSB tie to 0 if fingerprint width is less than 32)
      logic        p2p;         //Add peer-to-peer mean path delay to correction field for current TX packet (i_ptp_p2p[0], Exist on F-tile only)
      logic        asym;        //Add asymmetry to correction field for current TX packet (i_ptp_asym[0], Exist on F-tile only)
      logic        asym_sign;   //Sign of asymmetry delay add to correction field for current TX packet (i_ptp_asym_sign[0], Exist on F-tile only)
      logic [6:0]  asym_p2p_idx;//Index of asymmetry delay and peer-to-peer mean path delay in the configurable lookup table (i_ptp_asym_p2p_idx[6:0], Exist on F-tile only)
      logic        ins_ets;     //Insert an Egress Timestamp into the current TX Packet (i_ptp_ins_ets[0]), internally generated when packet classifier instantiated within HSSI SS.
      logic        ts_req;      //Request a 2-step timestamp for the current TX packet (i_ptp_ts_req[0])
   } tuser_ptp_t;

   typedef struct packed {
      logic [OFFSET_WIDTH - 1:0] ts_offset;  //Timestamp offset, internally generated when packet classifier instantiated within HSSI SS.
      logic [OFFSET_WIDTH - 1:0] cf_offset;  //Correction Field offset, internally generated when packet classifier instantiated within HSSI SS.
      logic [OFFSET_WIDTH - 1:0] csum_offset;//Checksum offset, internally generated when packet classifier instantiated within HSSI SS.
      logic [OFFSET_WIDTH - 1:0] eb_offset;  //Extended Byte offset, internally generated when packet classifier instantiated within HSSI SS.
      logic                      zero_csum;  //Zero Checksum, internally generated when packet classifier instantiated within HSSI SS.
      logic                      update_eb;  //Update Extended Byte, internally generated when packet classifier instantiated within HSSI SS.
      logic                      ts_format;  //Timestamp Format, internally generated when packet classifier instantiated within HSSI SS.
      logic [95:0]               tx_its;     //Ingress Timestamp for TX Packet Residence Time Calculation (i_ptp_tx_its[95:0])
      logic                      ins_cf;     //Update correction field with residence time in the current TX packet (i_ptp_ins_cf[0]), internally generated when packet classifier instantiated within HSSI SS.
   } tuser_ptp_extended_t;
endpackage
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "12eGHzhuzwzE3Jk0jEeOiewN6nwHALu32POyTf1JRNCV1OO/za2V4D/fHTxv4w7+HdY5I0a3bv3Hpe5d23LTkzUBWr/DOPSEcj3Y+bJ17gyFGyQY/gCPSyoX2LFpcR+gNWbGsGAYxdn8Ifv81Gif4S4dqthNm6DrNrNks867RzF0KuP2oTdv1KiuGKLRWAqy545AlItbNT/UEmyH9cDTkvw7JpmnyySAW+TVRIaxiRhIJ1BtD0Q0UXlk4fbq6G/qH8ayq4nnc7VBIdtLCq13k65goRFWZ9EKRYew8jKdXnou7+c0KT5oMptKZR4CqDvaCZbsjqRl76nVLHj7yEFfamJ8fYaW8MO7yXYoGN6l3y8YAvm2i3itwaVIpo5cnQDP1EQPczDay3PhhBrWSOb5vi/dHBYy6TsWmj8gOLBIEMXLSjmIWV0HiIyxHx798F9+gvYNRPEwUP8jhkF1WB/NULMWXEg1GshWxKOCOkiv4Jowvj/SgZJr8KGf185peIYEQprfktiSaXnFWygHl11moMjyfiw1W36U1NJQH3YCCo45X9q9hx/GhPCkxW16yluhrUypLI1PDxVtUoNaloz72IwWnWZr4mrtfaj3lDGnigsKiT+TWPYEbJAadLu6hVlT8ACTBBYByoIwJ+1POBNv4dNjrND3gZwuyvcUtrUVExNd8IPDQlqMl1/Fotqn0GLgAyhS3YUqkqr2RLStOr9mEf0FA2O/IuuKne/nseIETGsGIGBLGMjQcshhZsoyeHqtDvlSC39HpXrWigZkkn12sTZUoemjvJb8G+1qr+EY9TFDqXOOFuHQdtjDbxOxT9ePcFb/V1BifJ3Ule7vFjzOZnvofHunshPyszE6G4E3xGEFbHCZ/IoQHHUvwfhkmwfyPr6ZF08iBt02AALViaMk1hS7eTSdNpfUNvtK5ZWZzPdLyGf3lcZfss5D7I+63o28WCYavpQVLVeKlMKeXHTwWLi5lWCGnRNp4gR9THVnL2ouecMxlNdXJMZpk3TDHWRn"
`endif