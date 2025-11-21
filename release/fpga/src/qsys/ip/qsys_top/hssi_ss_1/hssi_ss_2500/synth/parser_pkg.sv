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

package parser_pkg;
   function automatic int get_width(int value);
      if(value == 2) return 2;
      return (value >= 2) ? $clog2(value) : 1;
   endfunction
endpackage
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "12eGHzhuzwzE3Jk0jEeOiewN6nwHALu32POyTf1JRNCV1OO/za2V4D/fHTxv4w7+HdY5I0a3bv3Hpe5d23LTkzUBWr/DOPSEcj3Y+bJ17gyFGyQY/gCPSyoX2LFpcR+gNWbGsGAYxdn8Ifv81Gif4S4dqthNm6DrNrNks867RzF0KuP2oTdv1KiuGKLRWAqy545AlItbNT/UEmyH9cDTkvw7JpmnyySAW+TVRIaxiRhwxNLx/ig2O4P7fu1k+WQs05fAPdoD+URiOLZLVYeDjGfDURzdlXKSKnmhpEIFnR14Fzjjf4oDNxKl/WnTO1mj/Uz6+XOW7ZCLxXUvyHVuqCvevXkdSBK/AhC8QPdvhI0rgOy5QfyFQbTwwjAFm+doBPOlGNnbyuWaiy+Gion2q3dkdaIVy+gL6c5Mdf3SHQ8rqCFzUcBguO9maa/1J4QSRqHaO8caoKQ9IitnUio7PeWdv/0h6Ih4CRTBEW0Y2ObBuaWulablKPLq+nI1SKLwC6YNJS0WrUk9lo0qQrwHNXSxaeKrQA6rnjC1HpqP/RbplqM/oy/keAuGFCgc16t5vugRYztoS3PSzzW2Q7mTi0GBzuhecFTAtnSYss4AKxVJmpUxCaj1cKUv50axdXhtH8NCOi2usaly1WgZB5kgpAD3JejoElCDUUiTwJtKQGSt7kvXhVO4GILg9BkgHvtdPAlVgVT0Nm1vSGK8MpuaBJlj0AWSW73nfjRd9ct5UzXi6iMVyCZQRTZvjVNVx7Ml0i19Ipg+xGUSZvKig9GuEuvhL70oEYqx4NexjnlUsFL2brc9nGPsZcB6qO1KvbDG55VoWnmeqsTAFHl+bhPkE3KIsNfCqf+5HBdSrMD9b9qm4mwvTOG56ZaVbjz49er1ABtsiLnHyoKkyQxF5DONnGZwtBx7jpAzQjjJv2ZLm2O2+TRXTWQAZa+2rND6No14cZBGkheGeUTmw23nLU1jCCObAo/qvwuRNpS74bv9dXTxfMnnqrwZVNbMCSU35Imm"
`endif