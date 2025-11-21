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


// (C) 2001-2019 Intel Corporation. All rights reserved.
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


// $Id: //acds/main/ip/sopc/components/primitives/altera_std_synchronizer/altera_std_synchronizer.v#8 $
// $Revision: #8 $
// $Date: 2009/02/18 $
// $Author: pscheidt $
//-----------------------------------------------------------------------------
//
// File: altera_std_synchronizer_nocut_etile.v
//
// Abstract: Single bit clock domain crossing synchronizer. Exactly the same
//           as altera_std_synchronizer.v, except that the embedded false
//           path constraint is removed in this module. If you use this
//           module, you will have to apply the appropriate timing
//           constraints.
//
//           We expect to make this a standard Quartus atom eventually.
//
//           Composed of two or more flip flops connected in series.
//           Random metastable condition is simulated when the 
//           __ALTERA_STD__METASTABLE_SIM macro is defined.
//           Use +define+__ALTERA_STD__METASTABLE_SIM argument 
//           on the Verilog simulator compiler command line to 
//           enable this mode. In addition, define the macro
//           __ALTERA_STD__METASTABLE_SIM_VERBOSE to get console output 
//           with every metastable event generated in the synchronizer.
//
// Copyright (C) Altera Corporation 2009, All Rights Reserved
//-----------------------------------------------------------------------------

`timescale 1ns / 1ns

module altera_std_synchronizer_nocut_etile (
                                clk, 
                                reset_n, 
                                din, 
                                dout
                                );

   parameter depth = 3; // This value must be >= 2 !
   parameter rst_value = 0;     
     
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

   (* altera_attribute = {"-name ADV_NETLIST_OPT_ALLOWED NEVER_ALLOW; -name DONT_MERGE_REGISTER ON; -name PRESERVE_REGISTER ON " } *) reg din_s1;

   (* altera_attribute = {"-name ADV_NETLIST_OPT_ALLOWED NEVER_ALLOW; -name DONT_MERGE_REGISTER ON; -name PRESERVE_REGISTER ON " } *) reg [depth-2:0] dreg;    
   
   //synthesis translate_off
   initial begin
      if (depth <2) begin
         $display("%m: Error: synchronizer length: %0d less than 2.", depth);
      end
   end

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

   assign next_din_s1 = (din_last ^ din) ? random : din;   

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
`pragma questa_oem_00 "gWvZQJuy3cgLOv0tRs1qUJ7l9DPIFHBslIjmReh83yW+6Fr8uwnXoVTcuGQwv0Q0whNK+r6SK6uHHBmHQVn/rw+C3atJKVAzL6ri4jktmdTUjwEnQWJyOkTnH6oYBLwlgnfl+Mr7p1SkVzsmd8ZhAdDlh+tBo8K6dynI2S9bBcxtVvMq9ES8ZVhRmmpTX4goGWMQ/UipnjBwEMXjHTUXk+HGvg38VjGHImYbxYmiX4HUO4pOuZzrDDEv9rAT4/Bx0MR5yyZtFhzhx0GjgAGvmYHONfZ3dY81hTz5p4P1Q0fGp3igcOJrAk+dDyB6j7UaM81mG3WKI/cpIcyb5paYPqrhlUVzB66+l62jyaLCeMw+CrPgq4x1/45DjA2Ra/jbZL+fJiegncEezIOpgLepN7va14yNIuHoXgGSj+qU95t+r+4djy6Z52heY2Mr+PdL6fPK5NpvwaY6OOJUNJAnicMEu2k5189B+KoSqpxyLtcqYI9sFjs1aRymfck2Ge8rZv2PHgzbfDx8Y27utjmatwWDs7QtZRwocRp5Od3mCFx0jN64GOgJHdPbSyhrfJWTZYYocR98wWC7N8UFDqcossHcBCQBVT0MP4xV8Y/qncAhfA7jFM/ofDqJUXPYKZh12689d+/1/ZFsflfaII4yBUYiXdcR7J/mEdDlwuYxO0xg//F1BtbAnnrr2BOMPjVS45Jdh5XQ+4lxUryyFGYIgZzi5n2EfTZVFu9OyCgcyFCPkkM9IszCu+JCtMOlKGmz7uE/7f6GgY8s8UTO8hQ40/ngAZPnQIzksuV6S4pwOVciFNSk5kn8JhQN608N5XHS94VJ1vylKT2+UfEOe8rEhPTS7FWOyJkw0jqdWIPJ/ivuzP6h9e5txWhmZCPS3JIKJkbM/kVOm9TXkvF4ajabIWxz4jNlj+jfbe5jAFYLyvCxupXigzUbcLGrOso/sK5J9bBYuEIBZXZWbO9CG7+qrTUsEvCfse/khdQf3vkhIxln8bhohiDpneUl/RsLc0sh"
`endif