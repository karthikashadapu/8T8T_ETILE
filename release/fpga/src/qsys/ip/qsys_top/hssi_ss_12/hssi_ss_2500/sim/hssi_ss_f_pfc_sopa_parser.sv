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
// Module            : hssi_ss_f_pfc_sopa_parser.sv
// Description       : 
// Author            : 
// Created           : 
// Changes           : 
// Keywors           : TODO TBD FIXME
// ==========================================================================

// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

module hssi_ss_f_pfc_sopa_parser #(
  parameter AXI_DATA_WIDTH                                        = 64,
  parameter AXI_NUM_BYTES                                         = 8,
  parameter AXI_TUSER_WIDTH                                       = 7
) (
  input                                                           i_clk, 
  input                                                           i_rst_n, 
  input                                                           i_preamble_pass_thr_en,  
  input                                                           i_axi_tvalid,
  input      [AXI_DATA_WIDTH-1:0]                                 i_axi_tdata,
  input      [AXI_NUM_BYTES-1:0]                                  i_axi_tkeep,
  input                                                           i_axi_tlast,  
  input      [AXI_TUSER_WIDTH-1:0]                                i_axi_tuser, 
  input                                                           i_axi_tready,  

  output reg                                                      o_axi_tvalid,
  output reg [AXI_DATA_WIDTH-1:0]                                 o_axi_tdata,
  output reg [AXI_NUM_BYTES-1:0]                                  o_axi_tkeep,
  output reg [AXI_TUSER_WIDTH-1:0]                                o_axi_tuser, 
  output reg                                                      o_axi_tlast,
  output reg                                                      o_axi_tready,
  output reg [2:0]                                                o_packet_pcp   
  //output    parser_package::vlan_t                              tag    
);
reg  [1:0]                                                        word_cntr;
reg                                                               axi_tvalid_latch1;
reg  [AXI_DATA_WIDTH-1:0]                                         axi_tdata_latch1;
reg  [AXI_NUM_BYTES-1:0]                                          axi_tkeep_latch1;
reg                                                               axi_tlast_latch1;  
reg  [AXI_TUSER_WIDTH-1:0]                                        axi_tuser_latch1; 
reg                                                               axi_tvalid_latch2;
reg  [AXI_DATA_WIDTH-1:0]                                         axi_tdata_latch2;
reg  [AXI_NUM_BYTES-1:0]                                          axi_tkeep_latch2;
reg                                                               axi_tlast_latch2;  
reg  [AXI_TUSER_WIDTH-1:0]                                        axi_tuser_latch2; 
reg                                                               axi_tstart, axi_tstart_latch1;  

//**************************************************************************************************
//                              VLAN Priority Detection Parser Logic
//**************************************************************************************************

//Latency b/w AXI i/p & AXI o/p:
//64 - cnt=2, delay = 2 

//128 w/o pre - cnt=1
//128 w pre - cnt=2,  delay =2
//~128 w/o pre - cnt=1
//~128 w pre - cnt=1

always @(posedge i_clk or negedge i_rst_n)
begin
  if(~i_rst_n)
    axi_tstart <= 1'b1;
  else if(i_axi_tvalid && i_axi_tlast && i_axi_tready)
    axi_tstart <= 1'b1;
  else if(i_axi_tvalid && i_axi_tready)
    axi_tstart <= 1'b0;
end    

always @(posedge i_clk or negedge i_rst_n)
begin
  if(~i_rst_n) 
  begin   
    axi_tdata_latch1   <=  'd0;
    axi_tkeep_latch1   <=  'd0;
    axi_tuser_latch1   <=  'd0;
    axi_tvalid_latch1  <=  'd0;
    axi_tstart_latch1  <=  'd0;
  end
  else
  begin
  	if(i_axi_tready && i_axi_tvalid) 
		begin
    	axi_tdata_latch1   <= i_axi_tdata;
    	axi_tkeep_latch1   <= i_axi_tkeep;
    	axi_tuser_latch1   <= i_axi_tuser;
    	axi_tvalid_latch1  <= i_axi_tvalid;
      axi_tstart_latch1  <= axi_tstart;
  	end
  end
end

always @(posedge i_clk or negedge i_rst_n)
begin
  if(~i_rst_n) 
  begin   
    axi_tdata_latch2   <=  'd0;
    axi_tkeep_latch2   <=  'd0;
    axi_tuser_latch2   <=  'd0;
    axi_tvalid_latch2  <=  'd0;
  end
  else
  begin
  	if(i_axi_tready && (i_axi_tvalid || axi_tlast_latch1)) 
		begin
    	axi_tdata_latch2   <= axi_tdata_latch1;
    	axi_tkeep_latch2   <= axi_tkeep_latch1;
    	axi_tuser_latch2   <= axi_tuser_latch1;
    	axi_tvalid_latch2  <= axi_tvalid_latch1;
  	end
  end
end

always @(posedge i_clk or negedge i_rst_n)
begin
  if(~i_rst_n) 
  begin   
    axi_tlast_latch1  <=  'd0;
    axi_tlast_latch2  <=  'd0;
  end
  else if(i_axi_tready)
  begin
    axi_tlast_latch1  <=  i_axi_tvalid && i_axi_tlast;
    axi_tlast_latch2  <=  axi_tlast_latch1;
  end
end

generate 
if(AXI_DATA_WIDTH == 64)
begin
  always @(posedge i_clk or negedge i_rst_n)
  begin
    if(~i_rst_n)
      word_cntr <= 2'd0;
    else if(i_axi_tvalid && i_axi_tready && i_axi_tlast && i_axi_tkeep) 
      word_cntr <= 2'd0;  //Assigned at SOP
    else if(i_axi_tvalid && i_axi_tready && i_axi_tkeep) //Middle of packet
    begin
      if(word_cntr >= 2'd3)
        word_cntr <= 2'd3; //Assigned after 2nd 64-bit data
      else
        word_cntr <= word_cntr + 2'd1; //cntr is 1 at 2nd 64-bit data 
    end
  end

  always @(posedge i_clk) //Remains same irrespective of static/dynamic configuartion of preamble passthrough
  begin
    if(((~i_preamble_pass_thr_en && (word_cntr == 2'd1)) || (i_preamble_pass_thr_en && (word_cntr == 2'd2))) && i_axi_tvalid && i_axi_tready && i_axi_tkeep) //Extracted to 2nd 64-bit data 
    begin
      if((i_axi_tdata[47:32] == 16'h0081) || (i_axi_tdata[47:32] == 16'hA888)) 
        //tag <= {i_axi_tdata[47:32],i_axi_tdata[55:53]};
        o_packet_pcp <= i_axi_tdata[55:53];
      else
        //tag <= {i_axi_tdata[47:32],3'd0};
        o_packet_pcp <= 3'd0;
    end
  end

  always @(posedge i_clk)
  begin
    if(i_preamble_pass_thr_en)
    begin
      if(axi_tlast_latch1 || axi_tlast_latch2)
        o_axi_tvalid        <= i_axi_tready;
      else if(axi_tstart || axi_tstart_latch1)
        o_axi_tvalid        <= 1'b0;
      else 
        o_axi_tvalid        <= i_axi_tvalid;
    end
    else
    begin
      if(axi_tlast_latch1) 
        o_axi_tvalid        <= i_axi_tready;
      else if(axi_tstart)
        o_axi_tvalid        <= 1'b0;
      else 
        o_axi_tvalid        <= i_axi_tvalid;
    end
  end
    
  always @(posedge i_clk)
  begin
    if(i_preamble_pass_thr_en)
    begin
      o_axi_tdata         <= axi_tdata_latch2;
      o_axi_tkeep         <= axi_tkeep_latch2;
      o_axi_tuser         <= axi_tuser_latch2;
      o_axi_tlast         <= axi_tlast_latch2;
      o_axi_tready        <= i_axi_tready;
      //o_axi_tvalid        <= axi_tvalid_latch2;
    end
    else
    begin
      o_axi_tdata         <= axi_tdata_latch1;
      o_axi_tkeep         <= axi_tkeep_latch1;
      o_axi_tuser         <= axi_tuser_latch1;
      o_axi_tlast         <= axi_tlast_latch1;
      o_axi_tready        <= i_axi_tready;
      //o_axi_tvalid        <= axi_tvalid_latch1;
    end
  end
  
end  else if (AXI_DATA_WIDTH == 128) //40G/50G. Preamble passthrough isn't enabled through GUI.Dynamically configurable through CSR. DW=128 ==> Always rate is 40G/50G
begin
  always @(posedge i_clk or negedge i_rst_n)
  begin
    if(~i_rst_n)
      word_cntr <= 2'd0;
    else if(i_axi_tvalid && i_axi_tready && i_axi_tlast && i_axi_tkeep) 
      word_cntr <= 2'd0;  //Assigned at SOP
    else if(i_axi_tvalid && i_axi_tready && i_axi_tkeep)
    begin
      if(word_cntr >= 2'd2)
        word_cntr <= 2'd2;
      else
        word_cntr <= word_cntr + 2'd1; 
    end
  end

  always @(posedge i_clk)
  begin
    if (~i_preamble_pass_thr_en) 
    begin
      if((word_cntr == 2'd0) && i_axi_tvalid && i_axi_tready && i_axi_tkeep)
      begin 
        begin
          if ((i_axi_tdata[111:96] == 16'h0081) || (i_axi_tdata[111:96] == 16'hA888))
            o_packet_pcp <= i_axi_tdata[119:117];
          else
            o_packet_pcp <= 3'd0;
        end
      end
    end else 
    begin
      if((word_cntr == 2'd1) && i_axi_tvalid && i_axi_tready && i_axi_tkeep)
      begin 
        begin
          if ((i_axi_tdata[111-64:96-64] == 16'h0081) || (i_axi_tdata[111-64:96-64] == 16'hA888)) //+64 is for preamble adjustment. This remains same irrespective of static/dynamic i/p
            o_packet_pcp <= i_axi_tdata[119-64:117-64];
          else
            o_packet_pcp <= 3'd0;
        end
      end
    end
  end

  always @(posedge i_clk)
  begin
    if(i_preamble_pass_thr_en)
    begin
      if(axi_tlast_latch1)
        o_axi_tvalid        <= i_axi_tready;
      else if(axi_tstart)
        o_axi_tvalid        <= 1'b0;
      else 
        o_axi_tvalid        <= i_axi_tvalid;
    end
    else
    begin
        o_axi_tvalid        <= i_axi_tvalid;
    end
  end
  
  always @(posedge i_clk)
  begin
    if(i_preamble_pass_thr_en)
    begin
      o_axi_tdata         <= axi_tdata_latch1;
      o_axi_tkeep         <= axi_tkeep_latch1;
      o_axi_tuser         <= axi_tuser_latch1;
      o_axi_tlast         <= axi_tlast_latch1;
      o_axi_tready        <= i_axi_tready;
      //o_axi_tvalid        <= axi_tvalid_latch1;
    end
    else
    begin
      o_axi_tdata         <= i_axi_tdata;
      o_axi_tkeep         <= i_axi_tkeep;
      o_axi_tuser         <= i_axi_tuser;
      o_axi_tlast         <= i_axi_tlast;
      o_axi_tready        <= i_axi_tready;
      //o_axi_tvalid        <= i_axi_tvalid; 
    end
  end

end else //if(AXI_DATA_WIDTH > '= 'd256 
begin

  always @(posedge i_clk or negedge i_rst_n)
  begin
    if(~i_rst_n)
      word_cntr <= 2'd0;
    else if(i_axi_tvalid && i_axi_tready && i_axi_tlast && i_axi_tkeep) 
      word_cntr <= 2'd0;  //Assigned at SOP
    else if(i_axi_tvalid && i_axi_tready && i_axi_tkeep)
    begin
      if(word_cntr >= 2'd2)
        word_cntr <= 2'd2;
      else
        word_cntr <= word_cntr + 2'd1; 
    end
  end

  always @(posedge i_clk)
  begin
    if (~i_preamble_pass_thr_en) 
    begin
      if((word_cntr == 2'd0) && i_axi_tvalid && i_axi_tready && i_axi_tkeep)
      begin 
        begin
          if ((i_axi_tdata[111:96] == 16'h0081) || (i_axi_tdata[111:96] == 16'hA888))
            o_packet_pcp <= i_axi_tdata[119:117];
          else
            o_packet_pcp <= 3'd0;
        end
      end
    end else 
    begin
      if((word_cntr == 2'd0) && i_axi_tvalid && i_axi_tready && i_axi_tkeep)
      begin 
        begin
          if ((i_axi_tdata[111+64:96+64] == 16'h0081) || (i_axi_tdata[111+64:96+64] == 16'hA888)) //+64 is for preamble adjustment. This remains same irrespective of static/dynamic i/p
            o_packet_pcp <= i_axi_tdata[119+64:117+64];
          else
            o_packet_pcp <= 3'd0;
        end
      end
    end
  end

  always @(posedge i_clk)
  begin
     o_axi_tdata         <= i_axi_tdata;
     o_axi_tkeep         <= i_axi_tkeep;
     o_axi_tuser         <= i_axi_tuser;
     o_axi_tlast         <= i_axi_tlast;
     o_axi_tready        <= i_axi_tready;
     o_axi_tvalid        <= i_axi_tvalid; // & i_axi_tready;
  end
 
end 
endgenerate

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "SsA75YSYGF80sMxcVcIJz7qC/bu5/GFmyOQtDL/x79k9awhwrs1/rpWwdMSdZM2X+KK5OPl7NlHx7SPY5wRckyl2RR/pULB4Gr4ljG7XN4DaAxjnUEsFPGaSXMbeLmHIwmOgVpfePQEWBImt9G4xgjV0kVX3ONW9Qk4+e/sQSunDVn3fkI+oox1qImh/vDaEBsdPebXpztP0C0MXDID9QjOct1HHbd4YOYjU6rRW6ythSN87/JtswRXB6PWNTSRoNgpi78zVIKTh6m8NNOK2kYPipwQVm/B//XTt+HKWY9RlVEgC/zzC2C4XtTJavpfIplYc7VOeTpiT6KpWJluX2/VCWt/GmwuZlqsfKRAG/Dygk5DM9rsNQ/SGaBuPzzioaIDZ4TfyljV41e2iEyAjNFSCBHpJoBLPdKOJVj1/EtAXlj2HbtRTYcUDHrbnjt+tXFx2GTH0MyLbzSdiryihpYz1ZWcVin1AtpK+o03SQRBYz/6+00TWwQ6mwqfVtcHtlBkGU4xqGFUmwWSXSiVQQHFH6I5RKWNIMLRJ5Z2cY+kHUG9DrcikQhw2T0CWchZbAV9iodBE7KlbG5DL+u5RlDSTeuMfn3jEZjfCb1CJAF89hdVy5bbr9oRtfIV2EL26aw6CPGkBHwN0fK+Z4kYRenIt1pW7dVKDP3OQWUBj7DlEtzvNe6UXHZtuWGSB3Wjdp4uUaiEAW1clkuNp5wY/pf1B6Fgty9pN9UnxFZricplFduyK/0+VyS8SiIDjfII8+Kw1P4W8jg8m8VCl8i+W4u0u3joClTpS+WzDdZNvJwv8MweoEvj7O2FKpBwkyotNu42FlUFCDMqL7t2vfNlFQKpywYwPdAqNVxQqb4y5vxO2sp49k+q74YTn+0V+Dmu7RNz6MpUA68e4e4hzcYz2mP7cMSwg4aoDQQvBJ2z0lGcj6ZO/DNNNgtqlP+no3T64Djdth99ZobVhSL4B6F/c/d/Exk+xTJ9YpmCrRUuGNEgELoeyhaMpyONZMeGOTu+G"
`endif