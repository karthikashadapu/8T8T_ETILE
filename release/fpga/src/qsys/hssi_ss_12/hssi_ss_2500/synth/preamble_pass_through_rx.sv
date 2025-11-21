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
// Module            : preamble_pass_through_rx.sv
// Description       : 
// Author            : 
// Created           : 
// Changes           : 
//                   : 
// ==========================================================================


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on


module preamble_pass_through_rx #(
    parameter TDATA             = 256,
    parameter TEMPTY_BITS     = 5, 
    parameter TUSER                 = 2 +90 +328,
    
    parameter DATA_WIDTH        = TDATA/2, 
    parameter EMPTY_BITS        = 4, 
    parameter USER_WIDTH      = 2 +90 +328
    
) (
input logic                     i_rx_clk, 
input logic                     i_rx_rst_n,
//input
input logic                     i_mac_avst_rx_valid,
input logic                     i_mac_avst_rx_sop,
input logic                     i_mac_avst_rx_eop,
input logic [DATA_WIDTH-1 :0]   i_mac_avst_rx_data,
input logic [EMPTY_BITS-1:0]    i_mac_avst_rx_empty,
input logic [63:0]              i_mac_avst_rx_preamble,
input logic [USER_WIDTH-1:0]    i_mac_avst_rx_user, // why user is there its in AXI protocol

// output 
output logic                    o_user_avst_rx_valid, 
output logic                    o_user_avst_rx_sop,
output logic                    o_user_avst_rx_eop,
output logic [TDATA-1:0]        o_user_avst_rx_data,
output logic [TEMPTY_BITS-1:0]  o_user_avst_rx_empty,
output logic [TUSER-1:0]        o_user_avst_rx_user
);

//***********************************************************
//***********************************************************
logic                          valid_en ;
logic                          mac_eop_pending;  
logic [TEMPTY_BITS-1:0]        mac_empty_pending;
logic [TUSER-1:0]              mac_user_pending;
logic                          mac_sop_pending;
logic [191:0]                  left_over_data;




//***********************************************************
//***********************************************************
//single word packet after a packet with even words[8+5x16+16(>8)] will merge with previous packet

always @(posedge i_rx_clk or negedge i_rx_rst_n)
begin
  if(~i_rx_rst_n)
    valid_en <= 1'b0;
  else if(mac_eop_pending)                               
    valid_en <= i_mac_avst_rx_valid;  //if eop is pending and next data comes as sop or sop&eop then valid should be 1
  else if(i_mac_avst_rx_valid)                               
  begin
    if(i_mac_avst_rx_sop)
      valid_en <= i_mac_avst_rx_eop ? 1'b0 : 1'b1;
    else if(i_mac_avst_rx_eop)
    begin
      if(valid_en)
        valid_en <= (i_mac_avst_rx_empty < 'd8) ? 1'b1 : 1'b0; // pending is 24 + incoming <= 16
      else
        valid_en <= 1'b0; //pending is 8 bytes + incoming <= 16 
    end
   else
      valid_en <= ~valid_en; // odd cycles then valid_en = 1 else valid_en =0
  end
end

always @(posedge i_rx_clk or negedge i_rx_rst_n)
begin
  if(~i_rx_rst_n)
    o_user_avst_rx_valid <= 1'b0;
  else if(mac_eop_pending)
    o_user_avst_rx_valid <= 1'b1;
  else if(i_mac_avst_rx_valid)                               
  begin
    if(i_mac_avst_rx_sop && i_mac_avst_rx_eop) //1 cycle data
      o_user_avst_rx_valid <= 1'b1;
   else if (i_mac_avst_rx_eop && ~valid_en) 
      o_user_avst_rx_valid <= 1'b1;
  else
      o_user_avst_rx_valid <= valid_en; // valid should go high twice but only going once for3 cycle data. 
 end
  else
    o_user_avst_rx_valid <= 1'b0;
end  

always @(posedge i_rx_clk or negedge i_rx_rst_n)
begin
  if(~i_rx_rst_n)
  begin
    mac_eop_pending   <= 1'b0;
    mac_empty_pending <= 5'd0;
    mac_user_pending  <= {TUSER{1'b0}};
  end
  else if(i_mac_avst_rx_valid)
  begin
    mac_empty_pending <= i_mac_avst_rx_sop ? (5'd8 + i_mac_avst_rx_empty) : (5'd24 + i_mac_avst_rx_empty);
    mac_user_pending  <= i_mac_avst_rx_user;
    if(i_mac_avst_rx_eop && valid_en)
    begin
      if(mac_eop_pending)
        mac_eop_pending <= 1'b1;
      else
      mac_eop_pending <= (i_mac_avst_rx_empty < 4'd8) ? 1'b1 : 1'b0;
    end
    else
      mac_eop_pending <= 1'b0;
  end
  else
  begin
    mac_eop_pending <= 1'b0;
  end
end    

always @(posedge i_rx_clk or negedge i_rx_rst_n)
begin
  if(~i_rx_rst_n)
    o_user_avst_rx_eop <= 1'b0;
  else if(mac_eop_pending && valid_en)
    o_user_avst_rx_eop <= 1'b1;
  else if(i_mac_avst_rx_valid)                               
  begin
    if(i_mac_avst_rx_sop && i_mac_avst_rx_eop)
      o_user_avst_rx_eop <= 1'b1;
    else if(i_mac_avst_rx_eop && ~valid_en)
      o_user_avst_rx_eop <= 1'b1;
    else if(i_mac_avst_rx_eop && valid_en)
      o_user_avst_rx_eop <= (i_mac_avst_rx_empty < 4'd8) ? 1'b0 : 1'b1;
    else
      o_user_avst_rx_eop <= 1'b0;
  end
  else
    o_user_avst_rx_eop <= 1'b0;
end  

always @(posedge i_rx_clk or negedge i_rx_rst_n)
begin
  if(~i_rx_rst_n)
    mac_sop_pending <= 1'b0;
  else if(i_mac_avst_rx_valid)
  begin
    if(i_mac_avst_rx_sop)
      mac_sop_pending <= i_mac_avst_rx_eop ? mac_eop_pending : 1'b1;
    else
      mac_sop_pending <= 1'b0;
  end
  else if(mac_eop_pending && mac_sop_pending)
    mac_sop_pending <= 1'b0;
end    

always @(posedge i_rx_clk or negedge i_rx_rst_n)
begin
  if(~i_rx_rst_n)
    o_user_avst_rx_sop <= 1'b0;
  else if(mac_eop_pending && mac_sop_pending)
    o_user_avst_rx_sop <= 1'b1;
  else if(mac_eop_pending)
    o_user_avst_rx_sop <= 1'b0;
  else if(i_mac_avst_rx_valid)                               
  begin
    if(i_mac_avst_rx_sop && i_mac_avst_rx_eop)
      o_user_avst_rx_sop <= 1'b1;
    else if(mac_sop_pending && valid_en)
      o_user_avst_rx_sop <= 1'b1;
    else
      o_user_avst_rx_sop <= 1'b0;
  end
  else
    o_user_avst_rx_sop <= 1'b0;
end  


always @(posedge i_rx_clk or negedge i_rx_rst_n)
begin
  if(~i_rx_rst_n)
  begin
    o_user_avst_rx_data <= 256'd0;
    left_over_data      <= 192'd0;
  end
  else if(mac_eop_pending && mac_sop_pending)
  begin
    o_user_avst_rx_data <= {left_over_data[191:0], 64'd0};
    left_over_data      <= {i_mac_avst_rx_preamble[63:0], i_mac_avst_rx_data[127:0]}; //if sop is there
  end
  else if(mac_eop_pending)
    begin
      o_user_avst_rx_data <= {left_over_data[191:128], 192'd0}; 
      left_over_data      <= {i_mac_avst_rx_preamble[63:0], i_mac_avst_rx_data[127:0]}; //if sop is there
    end
  else if(i_mac_avst_rx_valid)
  begin
    if(i_mac_avst_rx_sop)
    begin
      o_user_avst_rx_data <= {i_mac_avst_rx_preamble[63:0], i_mac_avst_rx_data[127:0], 64'd0}; //if eop is there otherwise no need
      left_over_data      <= {i_mac_avst_rx_preamble[63:0], i_mac_avst_rx_data[127:0]}; 
    end
    else if(valid_en)
    begin
      o_user_avst_rx_data <= {left_over_data[191:0], i_mac_avst_rx_data[127:64]};//preamble+1cc data of 16B + 2nd ccc data of only 8B
      left_over_data      <= {i_mac_avst_rx_data[63:0], 128'd0}; //2ndcc remaining 8B
    end
    else 
    begin
      //o_user_avst_rx_data <= o_avst_rx_data; // analyze the logic 
      o_user_avst_rx_data <=  {left_over_data[191:128], i_mac_avst_rx_data[127:0],64'h0}; //{i_mac_avst_rx_data[63:0]}; // analyze the logic 
      left_over_data      <=  {left_over_data[191:128], i_mac_avst_rx_data[127:0]};       //2nd cycle left over 8B data + 3rd cycle 16B
      //left_over_data      <= {left_over_data[63:0], i_mac_avst_rx_data[127:64]};        //Anil's logic
      //left_over_data      <= {left_over_data[63:0], i_mac_avst_rx_data[127:0]};
    end
  end
end


always @(posedge i_rx_clk or negedge i_rx_rst_n)
begin
  if(~i_rx_rst_n)
    o_user_avst_rx_empty <= 5'd0;
  else if(mac_eop_pending)
    o_user_avst_rx_empty <= mac_empty_pending; 
  else if(i_mac_avst_rx_valid)
  begin
    if(i_mac_avst_rx_eop && i_mac_avst_rx_sop)
      o_user_avst_rx_empty <= i_mac_avst_rx_empty + 5'd8;
    else if(i_mac_avst_rx_eop && ~valid_en)
      o_user_avst_rx_empty <= i_mac_avst_rx_empty + 5'd8;
    else if(i_mac_avst_rx_eop)
      o_user_avst_rx_empty <= (i_mac_avst_rx_empty < 4'd8) ? 5'd0 : (i_mac_avst_rx_empty - 4'd8);  
    else
      o_user_avst_rx_empty <= 5'd0;
  end
  else
    o_user_avst_rx_empty <= 5'd0;
end


//for a packet size of > 24 <= 40 bytes tuser of sop will be missed. problem for ptp case
always @(posedge i_rx_clk or negedge i_rx_rst_n)
begin
  if(~i_rx_rst_n)
    o_user_avst_rx_user <= {USER_WIDTH{1'b0}};
  else if(i_mac_avst_rx_valid)
  begin
    if(mac_eop_pending) 
      o_user_avst_rx_user   <= mac_user_pending;
    else if(i_mac_avst_rx_eop && mac_sop_pending)
      o_user_avst_rx_user <= {mac_user_pending[TUSER-1:47], i_mac_avst_rx_user[46:0]}; 
    else if(i_mac_avst_rx_eop && ~mac_sop_pending)
      o_user_avst_rx_user <= i_mac_avst_rx_user; 
    else
      o_user_avst_rx_user   <= mac_user_pending;
  end
end

//always @(posedge i_rx_clk or negedge i_rx_rst_n)
//begin
//  if(~i_rx_rst_n)
//    o_user_avst_rx_user <= {USER_WIDTH{1'b0}};
//  else if(i_mac_avst_rx_valid)
//  begin
//    if(i_mac_avst_rx_eop) 
//      o_user_avst_rx_user <= i_mac_avst_rx_user; 
//    else
//      o_user_avst_rx_user   <= mac_user_pending;
//  end
//end

endmodule

`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "SsA75YSYGF80sMxcVcIJz7qC/bu5/GFmyOQtDL/x79k9awhwrs1/rpWwdMSdZM2X+KK5OPl7NlHx7SPY5wRckyl2RR/pULB4Gr4ljG7XN4DaAxjnUEsFPGaSXMbeLmHIwmOgVpfePQEWBImt9G4xgjV0kVX3ONW9Qk4+e/sQSunDVn3fkI+oox1qImh/vDaEBsdPebXpztP0C0MXDID9QjOct1HHbd4YOYjU6rRW6yuB0CUpZSiyATNic+JOcLnP4TmQo8uZgJCVeekIgJlwCl3osQnpjnWEqLGtNVRXoTdelDaqcL2UGMY4cSNWMvwY70rAUBT0abxEdJCQqIfBzL5s+eHW14DVWB/RHfXDrjvvdFBUuM8CAZG+Q8TMkx9IHoxMsDABNt6mcgBTX643uhU3cZdRF88MeFb6ags2YVPimXtoInJ/EuSEj1wp2MqZo6HRqgKKLoWDPrfU9undHoOpWM/C2JNZvtITf1Dc3gsi9yZbrtCX0Yy8Lvgojfkn61JvuQ4Gc7rYPL/Q2U4SE9wTTMbI2fKBuIiT782pJ8HkBfYsePg6hliogce2MOl3Vx+pObX4zc5YMqvvzh1O+uDHihOSFrbOEqpzAI6KIROLQCHUyGZUKJtqkpPW23/xCWrROgOe7ju6gvTfDUuR52kIsBCqaqK8wC5LWIJykNt8EUKxl0NbElelZ2n6hQftAjk74j/YNm9AU0HLceEKKcfpVB7n4ucWptWrBF5valio++JALg0923xVO+K2yoa4ayjGC1DZeWxu/fXM02XliOtX5khUdBP0lc5NJB2868T8Af4J+f/6p7kQ6JGXpxi18FAVn8tSDxR5cJhYtmgvNF0SneL+LckfmpjitCoEpTHyu2JUGObsnwLu5KnyTVLnlOwJOCH+Nt1O/b6l8PJQHzlr8dIiJX0oTYJOjrBdMJszvI7a098Uv9U3R6a2k9LxdhC0uqiaETtijeUjSqjbxASNXJnUUizvWrlaRrCpFQpnRqRCo4mYEmzpvqXsXztj"
`endif