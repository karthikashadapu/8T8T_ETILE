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


`timescale 1ns / 1ns

module altera_eth_1588_tod_std_synchr_nocut (
                                clk, 
                                reset_n, 
                                din, 
                                dout
                                );

   parameter depth = 3; // This value must be >= 2 !
   parameter rst_value = 0;     
   parameter turn_off_meta = 0;
     
   input   clk;
   input   reset_n;    
   input   din;
   output  dout;
   
   // QuartusII synthesis directives:
   //     1. Preserve all registers ie. do not touch them.
   //     2. Do not merge other flip-flops with synchronizer flip-flops.
   // QuartusII TimeQuest directives:
   //     1. Identify all flip-flops in this module as members of the synchronizer 
   //        to enable automatic metastability MTBF analysis.

   (* altera_attribute = {"-name ADV_NETLIST_OPT_ALLOWED NEVER_ALLOW; -name SYNCHRONIZER_IDENTIFICATION FORCED; -name DONT_MERGE_REGISTER ON; -name PRESERVE_REGISTER ON  "} *) reg din_s1;

   (* altera_attribute = {"-name ADV_NETLIST_OPT_ALLOWED NEVER_ALLOW; -name DONT_MERGE_REGISTER ON; -name PRESERVE_REGISTER ON"} *) reg [depth-2:0] dreg;    
   
   //synthesis translate_off
   `ifndef QUARTUS_CDC
   initial begin
      if (depth <2) begin
         $display("%m: Error: synchronizer length: %0d less than 2.", depth);
      end
   end
   `endif 

   // the first synchronizer register is either a simple D flop for synthesis
   // and non-metastable simulation or a D flop with a method to inject random
   // metastable events resulting in random delay of [0,1] cycles
   
`ifdef __ALTERA_STD__METASTABLE_SIM

   reg[31:0]  RANDOM_SEED = 123456;      
   wire  next_din_s1;
   wire  dout;
   reg   din_last;
   reg          random;
   event metastable_event; // hook for debug monitoring

   initial begin
      $display("%m: Info: Metastable event injection simulation mode enabled");
   end
   
   always @(posedge clk) begin
      if (reset_n == 0)
        random <= $random(RANDOM_SEED);
      else
        random <= $random;
   end

   generate if (turn_off_meta == 1) begin: g_meta_off
       assign next_din_s1 = din;
   end
   else begin: g_meta
       assign next_din_s1 = (din_last ^ din) ? random : din;   
   end
   endgenerate

   always @(posedge clk or negedge reset_n) begin
       if (reset_n == 0) 
         din_last <= (rst_value == 0)? 1'b0 : 1'b1;
       else
         din_last <= din;
   end

   always @(posedge clk or negedge reset_n) begin
       if (reset_n == 0) 
         din_s1 <= (rst_value == 0)? 1'b0 : 1'b1;
       else
         din_s1 <= next_din_s1;
   end
   
`else 

   //synthesis translate_on   
   generate if (rst_value == 0)
       always @(posedge clk or negedge reset_n) begin
           if (reset_n == 0) 
             din_s1 <= 1'b0;
           else
             din_s1 <= din;
       end
   endgenerate
   
   generate if (rst_value == 1)
       always @(posedge clk or negedge reset_n) begin
           if (reset_n == 0) 
             din_s1 <= 1'b1;
           else
             din_s1 <= din;
       end
   endgenerate
   //synthesis translate_off      

`endif

`ifdef __ALTERA_STD__METASTABLE_SIM_VERBOSE
   always @(*) begin
      if (reset_n && (din_last != din) && (random != din)) begin
         $display("%m: Verbose Info: metastable event @ time %t", $time);
         ->metastable_event;
      end
   end      
`endif

   //synthesis translate_on

   // the remaining synchronizer registers form a simple shift register
   // of length depth-1
   generate if (rst_value == 0)
      if (depth < 3) begin
         always @(posedge clk or negedge reset_n) begin
            if (reset_n == 0) 
              dreg <= {depth-1{1'b0}};            
            else
              dreg <= din_s1;
         end         
      end else begin
         always @(posedge clk or negedge reset_n) begin
            if (reset_n == 0) 
              dreg <= {depth-1{1'b0}};
            else
              dreg <= {dreg[depth-3:0], din_s1};
         end
      end
   endgenerate
   
   generate if (rst_value == 1)
      if (depth < 3) begin
         always @(posedge clk or negedge reset_n) begin
            if (reset_n == 0) 
              dreg <= {depth-1{1'b1}};            
            else
              dreg <= din_s1;
         end         
      end else begin
         always @(posedge clk or negedge reset_n) begin
            if (reset_n == 0) 
              dreg <= {depth-1{1'b1}};
            else
              dreg <= {dreg[depth-3:0], din_s1};
         end
      end
   endgenerate

   assign dout = dreg[depth-2];
   
endmodule 


                        
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "CiHuLcDcx2CFaipqUnG6eJShX3lvw64kGdUheRDdAxRNMJDD9dEHI/MRCtUJAcLmsBd6IH8fL3bDUmpEQheF2zaghGpGKnCpTz1wB3MMsfL946DH4BYjclmgdSEknFuZNrQ+pLVS/Lj3vQkypMrvdbariR4fH4jZBsXhTczasiEnw0YEHTL9qWUGov1EQOB7UaisG5nbHapq31xclXcb8Tf9pfiexXJ86K7hDsd/SQNpDF7+K/hdbGOeKnFI12Qh6JX/X78smJKRQX1ROhQVSJu8rhaHsyoyTSIPb2Xxd7DBBZ1cYEty5jAwFusaFRj2xxqY4UgJAnH6H3g7viZdMKthNfy553OphRpsQd63f3JaaVTpjfOM6UB55Fd9jcHhq9umg/CmAPngziU3eFxoEkRJc2A7iZWDFDM2GobPc2B/zd87zPf73DsPB8J3tZsS2WGlIp+8+6EFI/2w8E+Kdo+do5IF381C2u4sjeWImdmXDOnx3efo/hH6nREhjJCzR7whIwSFQ1CG+NN9slW1j708joQZcRq7jMbBHlVks3Fk/qZT0B7LGf+fDHdC/RU18S15okiwH28QoIcb8maX6LmYQkOvqI7ysfvcApt2AOv81R3mRdmLitMEpb7Qh9vkBn9QKSclssYP23XBejYZkVjA3+BueDSwgMWlG8ycfVpEwWY479075C1ihCVsxl6H/UwSTTM5XJ2KDhnnxoNqp2hFzxAEC4b50LGH5vlKfOkW9rE0zgpCNtdaPtyTlS49yza0TuKt1FmJjnmP4l2U6CWfJA2oNrAOuzMfuYf4Oblrp8JCuur6Q/TzH49+6h7zG9VB5LYa28iaiJnH93yKXF6Q03QKEHMYEG/WrQv/tj1WH+1s+hu7Bymk0xmZqoZEoS50kgIgkN2YLMHxLzKoeY2BDExlfuyba7mK3xl91LkO2fP/afndeVmjXw8vOFULh2AnfKGsrEtxj+eHbQem99QrPVEBf9KLiP/Fdb3kQ+Bcbk8dMiiplJWVGwMiOi6E"
`endif