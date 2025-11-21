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


//-----------------------------------------------------------------------------------------------//
//   Generated with Magillem S.A. MRV generator.                                  
//   MRV generator version : 0.2
//   Protocol :  AVALON
//   Wait State : WS1_OUTPUT                                         
//   Date : Mon Oct 09 06:37:07 PDT 2023           
//-----------------------------------------------------------------------------------------------//


//-----------------------------------------------------------------------------------------------//
//   Verilog Register Bank
//   Component Name: hssi_ss_f_pfc_csr
//   Magillem Version :   5.11.2.1                                                                         
//-----------------------------------------------------------------------------------------------//
// 
module hssi_ss_f_pfc_csr (
// register offset : 0x00, field offset : 0, access : RW, pfccsrif_control.cfg_tx_pri_arb
output  reg pfccsrif_control_cfg_tx_pri_arb,
// register offset : 0x00, field offset : 1, access : RW, pfccsrif_control.cfg_rx_pri_arb
output  reg pfccsrif_control_cfg_rx_pri_arb,
// register offset : 0x00, field offset : 2, access : RW, pfccsrif_control.cfg_pfc_sel
output  reg pfccsrif_control_cfg_pfc_sel,
// register offset : 0x00, field offset : 3, access : RW, pfccsrif_control.cfg_flow_control_en
input   pfccsrif_control_cfg_flow_control_en_gui_value,
output  reg pfccsrif_control_cfg_flow_control_en,
// register offset : 0x00, field offset : 4, access : RW, pfccsrif_control.cfg_tx_stat_clear
output  reg pfccsrif_control_cfg_tx_stat_clear,
// register offset : 0x00, field offset : 5, access : RW, pfccsrif_control.cfg_rx_stat_clear
output  reg pfccsrif_control_cfg_rx_stat_clear,
// register offset : 0x00, field offset : 6, access : RO, pfccsrif_control.rsvd
// register offset : 0x20, field offset : 0, access : RO, pfccsrif_tx_stat_queue0.drop_pkt_cntr
input  [15:0] pfccsrif_tx_stat_queue0_drop_pkt_cntr_i,
// register offset : 0x20, field offset : 16, access : RO, pfccsrif_tx_stat_queue0.rsvd
// register offset : 0x24, field offset : 0, access : RO, pfccsrif_tx_stat_queue1.drop_pkt_cntr
input  [15:0] pfccsrif_tx_stat_queue1_drop_pkt_cntr_i,
// register offset : 0x24, field offset : 16, access : RO, pfccsrif_tx_stat_queue1.rsvd
// register offset : 0x28, field offset : 0, access : RO, pfccsrif_tx_stat_queue2.drop_pkt_cntr
input  [15:0] pfccsrif_tx_stat_queue2_drop_pkt_cntr_i,
// register offset : 0x28, field offset : 16, access : RO, pfccsrif_tx_stat_queue2.rsvd
// register offset : 0x2c, field offset : 0, access : RO, pfccsrif_tx_stat_queue3.drop_pkt_cntr
input  [15:0] pfccsrif_tx_stat_queue3_drop_pkt_cntr_i,
// register offset : 0x2c, field offset : 16, access : RO, pfccsrif_tx_stat_queue3.rsvd
// register offset : 0x30, field offset : 0, access : RO, pfccsrif_tx_stat_queue4.drop_pkt_cntr
input  [15:0] pfccsrif_tx_stat_queue4_drop_pkt_cntr_i,
// register offset : 0x30, field offset : 16, access : RO, pfccsrif_tx_stat_queue4.rsvd
// register offset : 0x34, field offset : 0, access : RO, pfccsrif_tx_stat_queue5.drop_pkt_cntr
input  [15:0] pfccsrif_tx_stat_queue5_drop_pkt_cntr_i,
// register offset : 0x34, field offset : 16, access : RO, pfccsrif_tx_stat_queue5.rsvd
// register offset : 0x38, field offset : 0, access : RO, pfccsrif_tx_stat_queue6.drop_pkt_cntr
input  [15:0] pfccsrif_tx_stat_queue6_drop_pkt_cntr_i,
// register offset : 0x38, field offset : 16, access : RO, pfccsrif_tx_stat_queue6.rsvd
// register offset : 0x3c, field offset : 0, access : RO, pfccsrif_tx_stat_queue7.drop_pkt_cntr
input  [15:0] pfccsrif_tx_stat_queue7_drop_pkt_cntr_i,
// register offset : 0x3c, field offset : 16, access : RO, pfccsrif_tx_stat_queue7.rsvd
// register offset : 0x40, field offset : 0, access : RO, pfccsrif_rx_stat_queue0.drop_pkt_cntr
input  [15:0] pfccsrif_rx_stat_queue0_drop_pkt_cntr_i,
// register offset : 0x40, field offset : 16, access : RO, pfccsrif_rx_stat_queue0.rsvd
// register offset : 0x44, field offset : 0, access : RO, pfccsrif_rx_stat_queue1.drop_pkt_cntr
input  [15:0] pfccsrif_rx_stat_queue1_drop_pkt_cntr_i,
// register offset : 0x44, field offset : 16, access : RO, pfccsrif_rx_stat_queue1.rsvd
// register offset : 0x48, field offset : 0, access : RO, pfccsrif_rx_stat_queue2.drop_pkt_cntr
input  [15:0] pfccsrif_rx_stat_queue2_drop_pkt_cntr_i,
// register offset : 0x48, field offset : 16, access : RO, pfccsrif_rx_stat_queue2.rsvd
// register offset : 0x4c, field offset : 0, access : RO, pfccsrif_rx_stat_queue3.drop_pkt_cntr
input  [15:0] pfccsrif_rx_stat_queue3_drop_pkt_cntr_i,
// register offset : 0x4c, field offset : 16, access : RO, pfccsrif_rx_stat_queue3.rsvd
// register offset : 0x50, field offset : 0, access : RO, pfccsrif_rx_stat_queue4.drop_pkt_cntr
input  [15:0] pfccsrif_rx_stat_queue4_drop_pkt_cntr_i,
// register offset : 0x50, field offset : 16, access : RO, pfccsrif_rx_stat_queue4.rsvd
// register offset : 0x54, field offset : 0, access : RO, pfccsrif_rx_stat_queue5.drop_pkt_cntr
input  [15:0] pfccsrif_rx_stat_queue5_drop_pkt_cntr_i,
// register offset : 0x54, field offset : 16, access : RO, pfccsrif_rx_stat_queue5.rsvd
// register offset : 0x58, field offset : 0, access : RO, pfccsrif_rx_stat_queue6.drop_pkt_cntr
input  [15:0] pfccsrif_rx_stat_queue6_drop_pkt_cntr_i,
// register offset : 0x58, field offset : 16, access : RO, pfccsrif_rx_stat_queue6.rsvd
// register offset : 0x5c, field offset : 0, access : RO, pfccsrif_rx_stat_queue7.drop_pkt_cntr
input  [15:0] pfccsrif_rx_stat_queue7_drop_pkt_cntr_i,
// register offset : 0x5c, field offset : 16, access : RO, pfccsrif_rx_stat_queue7.rsvd
// register offset : 0x60, field offset : 0, access : RW, pfccsrif_tx_threshold_queue0.cfg_tx_th
output  reg[2:0] pfccsrif_tx_threshold_queue0_cfg_tx_th,
// register offset : 0x60, field offset : 3, access : RO, pfccsrif_tx_threshold_queue0.rsvd
// register offset : 0x64, field offset : 0, access : RW, pfccsrif_tx_threshold_queue1.cfg_tx_th
output  reg[2:0] pfccsrif_tx_threshold_queue1_cfg_tx_th,
// register offset : 0x64, field offset : 3, access : RO, pfccsrif_tx_threshold_queue1.rsvd
// register offset : 0x68, field offset : 0, access : RW, pfccsrif_tx_threshold_queue2.cfg_tx_th
output  reg[2:0] pfccsrif_tx_threshold_queue2_cfg_tx_th,
// register offset : 0x68, field offset : 3, access : RO, pfccsrif_tx_threshold_queue2.rsvd
// register offset : 0x6c, field offset : 0, access : RW, pfccsrif_tx_threshold_queue3.cfg_tx_th
output  reg[2:0] pfccsrif_tx_threshold_queue3_cfg_tx_th,
// register offset : 0x6c, field offset : 3, access : RO, pfccsrif_tx_threshold_queue3.rsvd
// register offset : 0x70, field offset : 0, access : RW, pfccsrif_tx_threshold_queue4.cfg_tx_th
output  reg[2:0] pfccsrif_tx_threshold_queue4_cfg_tx_th,
// register offset : 0x70, field offset : 3, access : RO, pfccsrif_tx_threshold_queue4.rsvd
// register offset : 0x74, field offset : 0, access : RW, pfccsrif_tx_threshold_queue5.cfg_tx_th
output  reg[2:0] pfccsrif_tx_threshold_queue5_cfg_tx_th,
// register offset : 0x74, field offset : 3, access : RO, pfccsrif_tx_threshold_queue5.rsvd
// register offset : 0x78, field offset : 0, access : RW, pfccsrif_tx_threshold_queue6.cfg_tx_th
output  reg[2:0] pfccsrif_tx_threshold_queue6_cfg_tx_th,
// register offset : 0x78, field offset : 3, access : RO, pfccsrif_tx_threshold_queue6.rsvd
// register offset : 0x7c, field offset : 0, access : RW, pfccsrif_tx_threshold_queue7.cfg_tx_th
output  reg[2:0] pfccsrif_tx_threshold_queue7_cfg_tx_th,
// register offset : 0x7c, field offset : 3, access : RO, pfccsrif_tx_threshold_queue7.rsvd
// register offset : 0x80, field offset : 0, access : RW, pfccsrif_rx_threshold_queue0.cfg_rx_low_th
output  reg[5:0] pfccsrif_rx_threshold_queue0_cfg_rx_low_th,
// register offset : 0x80, field offset : 6, access : RO, pfccsrif_rx_threshold_queue0.rsvd1
// register offset : 0x80, field offset : 8, access : RW, pfccsrif_rx_threshold_queue0.cfg_rx_high_th
output  reg[5:0] pfccsrif_rx_threshold_queue0_cfg_rx_high_th,
// register offset : 0x80, field offset : 14, access : RO, pfccsrif_rx_threshold_queue0.rsvd0
// register offset : 0x84, field offset : 0, access : RW, pfccsrif_rx_threshold_queue1.cfg_rx_low_th
output  reg[5:0] pfccsrif_rx_threshold_queue1_cfg_rx_low_th,
// register offset : 0x84, field offset : 6, access : RO, pfccsrif_rx_threshold_queue1.rsvd1
// register offset : 0x84, field offset : 8, access : RW, pfccsrif_rx_threshold_queue1.cfg_rx_high_th
output  reg[5:0] pfccsrif_rx_threshold_queue1_cfg_rx_high_th,
// register offset : 0x84, field offset : 14, access : RO, pfccsrif_rx_threshold_queue1.rsvd0
// register offset : 0x88, field offset : 0, access : RW, pfccsrif_rx_threshold_queue2.cfg_rx_low_th
output  reg[5:0] pfccsrif_rx_threshold_queue2_cfg_rx_low_th,
// register offset : 0x88, field offset : 6, access : RO, pfccsrif_rx_threshold_queue2.rsvd1
// register offset : 0x88, field offset : 8, access : RW, pfccsrif_rx_threshold_queue2.cfg_rx_high_th
output  reg[5:0] pfccsrif_rx_threshold_queue2_cfg_rx_high_th,
// register offset : 0x88, field offset : 14, access : RO, pfccsrif_rx_threshold_queue2.rsvd0
// register offset : 0x8c, field offset : 0, access : RW, pfccsrif_rx_threshold_queue3.cfg_rx_low_th
output  reg[5:0] pfccsrif_rx_threshold_queue3_cfg_rx_low_th,
// register offset : 0x8c, field offset : 6, access : RO, pfccsrif_rx_threshold_queue3.rsvd1
// register offset : 0x8c, field offset : 8, access : RW, pfccsrif_rx_threshold_queue3.cfg_rx_high_th
output  reg[5:0] pfccsrif_rx_threshold_queue3_cfg_rx_high_th,
// register offset : 0x8c, field offset : 14, access : RO, pfccsrif_rx_threshold_queue3.rsvd0
// register offset : 0x90, field offset : 0, access : RW, pfccsrif_rx_threshold_queue4.cfg_rx_low_th
output  reg[5:0] pfccsrif_rx_threshold_queue4_cfg_rx_low_th,
// register offset : 0x90, field offset : 6, access : RO, pfccsrif_rx_threshold_queue4.rsvd1
// register offset : 0x90, field offset : 8, access : RW, pfccsrif_rx_threshold_queue4.cfg_rx_high_th
output  reg[5:0] pfccsrif_rx_threshold_queue4_cfg_rx_high_th,
// register offset : 0x90, field offset : 14, access : RO, pfccsrif_rx_threshold_queue4.rsvd0
// register offset : 0x94, field offset : 0, access : RW, pfccsrif_rx_threshold_queue5.cfg_rx_low_th
output  reg[5:0] pfccsrif_rx_threshold_queue5_cfg_rx_low_th,
// register offset : 0x94, field offset : 6, access : RO, pfccsrif_rx_threshold_queue5.rsvd1
// register offset : 0x94, field offset : 8, access : RW, pfccsrif_rx_threshold_queue5.cfg_rx_high_th
output  reg[5:0] pfccsrif_rx_threshold_queue5_cfg_rx_high_th,
// register offset : 0x94, field offset : 14, access : RO, pfccsrif_rx_threshold_queue5.rsvd0
// register offset : 0x98, field offset : 0, access : RW, pfccsrif_rx_threshold_queue6.cfg_rx_low_th
output  reg[5:0] pfccsrif_rx_threshold_queue6_cfg_rx_low_th,
// register offset : 0x98, field offset : 6, access : RO, pfccsrif_rx_threshold_queue6.rsvd1
// register offset : 0x98, field offset : 8, access : RW, pfccsrif_rx_threshold_queue6.cfg_rx_high_th
output  reg[5:0] pfccsrif_rx_threshold_queue6_cfg_rx_high_th,
// register offset : 0x98, field offset : 14, access : RO, pfccsrif_rx_threshold_queue6.rsvd0
// register offset : 0x9c, field offset : 0, access : RW, pfccsrif_rx_threshold_queue7.cfg_rx_low_th
output  reg[5:0] pfccsrif_rx_threshold_queue7_cfg_rx_low_th,
// register offset : 0x9c, field offset : 6, access : RO, pfccsrif_rx_threshold_queue7.rsvd1
// register offset : 0x9c, field offset : 8, access : RW, pfccsrif_rx_threshold_queue7.cfg_rx_high_th
output  reg[5:0] pfccsrif_rx_threshold_queue7_cfg_rx_high_th,
// register offset : 0x9c, field offset : 14, access : RO, pfccsrif_rx_threshold_queue7.rsvd0
//Bus Interface
input clk,
input reset,
input [31:0] writedata,
input read,
input write,
input [3:0] byteenable,
output reg [31:0] readdata,
output reg readdatavalid,
input [7:0] address

);


wire reset_n = !reset;	
// Protocol management
// combinatorial read data signal declaration
reg [31:0] rdata_comb;

// synchronous process for the read
always @(negedge reset_n ,posedge clk)  
   if (!reset_n) readdata[31:0] <= 32'h0; else readdata[31:0] <= rdata_comb[31:0];

// read data is always returned on the next cycle
always @(negedge reset_n , posedge clk)
   if (!reset_n) readdatavalid <= 1'b0; else readdatavalid <= read;
//
//  Protocol specific assignment to inside signals
//
wire  we = write;
wire  re = read;
wire [7:0] addr = address[7:0];
wire [31:0] din  = writedata [31:0];
// A write byte enable for each register
// register pfccsrif_control with  writeType: write
wire	  we_pfccsrif_control		=	we  & (addr[7:0]  == 8'h00)	?	byteenable[0]	:	1'b0;
// register pfccsrif_tx_threshold_queue0 with  writeType: write
wire	  we_pfccsrif_tx_threshold_queue0		=	we  & (addr[7:0]  == 8'h60)	?	byteenable[0]	:	1'b0;
// register pfccsrif_tx_threshold_queue1 with  writeType: write
wire	  we_pfccsrif_tx_threshold_queue1		=	we  & (addr[7:0]  == 8'h64)	?	byteenable[0]	:	1'b0;
// register pfccsrif_tx_threshold_queue2 with  writeType: write
wire	  we_pfccsrif_tx_threshold_queue2		=	we  & (addr[7:0]  == 8'h68)	?	byteenable[0]	:	1'b0;
// register pfccsrif_tx_threshold_queue3 with  writeType: write
wire	  we_pfccsrif_tx_threshold_queue3		=	we  & (addr[7:0]  == 8'h6c)	?	byteenable[0]	:	1'b0;
// register pfccsrif_tx_threshold_queue4 with  writeType: write
wire	  we_pfccsrif_tx_threshold_queue4		=	we  & (addr[7:0]  == 8'h70)	?	byteenable[0]	:	1'b0;
// register pfccsrif_tx_threshold_queue5 with  writeType: write
wire	  we_pfccsrif_tx_threshold_queue5		=	we  & (addr[7:0]  == 8'h74)	?	byteenable[0]	:	1'b0;
// register pfccsrif_tx_threshold_queue6 with  writeType: write
wire	  we_pfccsrif_tx_threshold_queue6		=	we  & (addr[7:0]  == 8'h78)	?	byteenable[0]	:	1'b0;
// register pfccsrif_tx_threshold_queue7 with  writeType: write
wire	  we_pfccsrif_tx_threshold_queue7		=	we  & (addr[7:0]  == 8'h7c)	?	byteenable[0]	:	1'b0;
// register pfccsrif_rx_threshold_queue0 with  writeType: write
wire	[1:0]  we_pfccsrif_rx_threshold_queue0		=	we  & (addr[7:0]  == 8'h80)	?	byteenable[1:0]	:	{2{1'b0}};
// register pfccsrif_rx_threshold_queue1 with  writeType: write
wire	[1:0]  we_pfccsrif_rx_threshold_queue1		=	we  & (addr[7:0]  == 8'h84)	?	byteenable[1:0]	:	{2{1'b0}};
// register pfccsrif_rx_threshold_queue2 with  writeType: write
wire	[1:0]  we_pfccsrif_rx_threshold_queue2		=	we  & (addr[7:0]  == 8'h88)	?	byteenable[1:0]	:	{2{1'b0}};
// register pfccsrif_rx_threshold_queue3 with  writeType: write
wire	[1:0]  we_pfccsrif_rx_threshold_queue3		=	we  & (addr[7:0]  == 8'h8c)	?	byteenable[1:0]	:	{2{1'b0}};
// register pfccsrif_rx_threshold_queue4 with  writeType: write
wire	[1:0]  we_pfccsrif_rx_threshold_queue4		=	we  & (addr[7:0]  == 8'h90)	?	byteenable[1:0]	:	{2{1'b0}};
// register pfccsrif_rx_threshold_queue5 with  writeType: write
wire	[1:0]  we_pfccsrif_rx_threshold_queue5		=	we  & (addr[7:0]  == 8'h94)	?	byteenable[1:0]	:	{2{1'b0}};
// register pfccsrif_rx_threshold_queue6 with  writeType: write
wire	[1:0]  we_pfccsrif_rx_threshold_queue6		=	we  & (addr[7:0]  == 8'h98)	?	byteenable[1:0]	:	{2{1'b0}};
// register pfccsrif_rx_threshold_queue7 with  writeType: write
wire	[1:0]  we_pfccsrif_rx_threshold_queue7		=	we  & (addr[7:0]  == 8'h9c)	?	byteenable[1:0]	:	{2{1'b0}};

// A read byte enable for each register

/* Definitions of REGISTER "pfccsrif_control" */

// pfccsrif_control_cfg_tx_pri_arb
// bitfield description: Indicate PFC Tx queue arbitration scheme
// customType:  RW
// hwAccess: RO 
// reset value : 0x0 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      pfccsrif_control_cfg_tx_pri_arb <= 1'h0;
   end
   else begin
   if (we_pfccsrif_control) begin 
      pfccsrif_control_cfg_tx_pri_arb   <=  din[0];  //
   end
end

// pfccsrif_control_cfg_rx_pri_arb
// bitfield description: Indicate PFC Rx queue arbitration scheme
// customType:  RW
// hwAccess: RO 
// reset value : 0x0 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      pfccsrif_control_cfg_rx_pri_arb <= 1'h0;
   end
   else begin
   if (we_pfccsrif_control) begin 
      pfccsrif_control_cfg_rx_pri_arb   <=  din[1];  //
   end
end

// pfccsrif_control_cfg_pfc_sel
// bitfield description: Select between Priority Flow control vs Standard Flow Control
// customType:  RW
// hwAccess: RO 
// reset value : 0x0 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      pfccsrif_control_cfg_pfc_sel <= 1'h0;
   end
   else begin
   if (we_pfccsrif_control) begin 
      pfccsrif_control_cfg_pfc_sel   <=  din[2];  //
   end
end

// pfccsrif_control_cfg_flow_control_en
// bitfield description: Enable Flow control
// customType:  RW
// hwAccess: RO 
// reset value : 1'bx 
// reset Value signal:  "pfccsrif_control_cfg_flow_control_en_gui_value" 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      pfccsrif_control_cfg_flow_control_en <= pfccsrif_control_cfg_flow_control_en_gui_value;
   end
   else begin
   if (we_pfccsrif_control) begin 
      pfccsrif_control_cfg_flow_control_en   <=  din[3];  //
   end
end

// pfccsrif_control_cfg_tx_stat_clear
// bitfield description: Clear TX Statistics Counter
// customType:  RW
// hwAccess: RO 
// reset value : 0x0 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      pfccsrif_control_cfg_tx_stat_clear <= 1'h0;
   end
   else begin
   if (we_pfccsrif_control) begin 
      pfccsrif_control_cfg_tx_stat_clear   <=  din[4];  //
   end
end

// pfccsrif_control_cfg_rx_stat_clear
// bitfield description: Clear RX Statistics Counter
// customType:  RW
// hwAccess: RO 
// reset value : 0x0 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      pfccsrif_control_cfg_rx_stat_clear <= 1'h0;
   end
   else begin
   if (we_pfccsrif_control) begin 
      pfccsrif_control_cfg_rx_stat_clear   <=  din[5];  //
   end
end

// pfccsrif_control_rsvd
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x0000000 
// NO register generated


/* Definitions of REGISTER "pfccsrif_tx_stat_queue0" */

// pfccsrif_tx_stat_queue0_drop_pkt_cntr
// bitfield description: Indicate the packet drop count due to PFC TX queue 0 full
// customType:  RO
// hwAccess: WO 
// reset value : 0x0000 
// inputPort: pfccsrif_tx_stat_queue0_drop_pkt_cntr_i 
// outputPort:  "" 
// NO register generated




// pfccsrif_tx_stat_queue0_rsvd
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x0000 
// NO register generated


/* Definitions of REGISTER "pfccsrif_tx_stat_queue1" */

// pfccsrif_tx_stat_queue1_drop_pkt_cntr
// bitfield description: Indicate the packet drop count due to PFC TX queue 1 full
// customType:  RO
// hwAccess: WO 
// reset value : 0x0000 
// inputPort: pfccsrif_tx_stat_queue1_drop_pkt_cntr_i 
// outputPort:  "" 
// NO register generated




// pfccsrif_tx_stat_queue1_rsvd
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x0000 
// NO register generated


/* Definitions of REGISTER "pfccsrif_tx_stat_queue2" */

// pfccsrif_tx_stat_queue2_drop_pkt_cntr
// bitfield description: Indicate the packet drop count due to PFC TX queue 2 full
// customType:  RO
// hwAccess: WO 
// reset value : 0x0000 
// inputPort: pfccsrif_tx_stat_queue2_drop_pkt_cntr_i 
// outputPort:  "" 
// NO register generated




// pfccsrif_tx_stat_queue2_rsvd
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x0000 
// NO register generated


/* Definitions of REGISTER "pfccsrif_tx_stat_queue3" */

// pfccsrif_tx_stat_queue3_drop_pkt_cntr
// bitfield description: Indicate the packet drop count due to PFC TX queue 3 full
// customType:  RO
// hwAccess: WO 
// reset value : 0x0000 
// inputPort: pfccsrif_tx_stat_queue3_drop_pkt_cntr_i 
// outputPort:  "" 
// NO register generated




// pfccsrif_tx_stat_queue3_rsvd
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x0000 
// NO register generated


/* Definitions of REGISTER "pfccsrif_tx_stat_queue4" */

// pfccsrif_tx_stat_queue4_drop_pkt_cntr
// bitfield description: Indicate the packet drop count due to PFC TX queue 4 full
// customType:  RO
// hwAccess: WO 
// reset value : 0x0000 
// inputPort: pfccsrif_tx_stat_queue4_drop_pkt_cntr_i 
// outputPort:  "" 
// NO register generated




// pfccsrif_tx_stat_queue4_rsvd
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x0000 
// NO register generated


/* Definitions of REGISTER "pfccsrif_tx_stat_queue5" */

// pfccsrif_tx_stat_queue5_drop_pkt_cntr
// bitfield description: Indicate the packet drop count due to PFC TX queue 5 full
// customType:  RO
// hwAccess: WO 
// reset value : 0x0000 
// inputPort: pfccsrif_tx_stat_queue5_drop_pkt_cntr_i 
// outputPort:  "" 
// NO register generated




// pfccsrif_tx_stat_queue5_rsvd
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x0000 
// NO register generated


/* Definitions of REGISTER "pfccsrif_tx_stat_queue6" */

// pfccsrif_tx_stat_queue6_drop_pkt_cntr
// bitfield description: Indicate the packet drop count due to PFC TX queue 6 full
// customType:  RO
// hwAccess: WO 
// reset value : 0x0000 
// inputPort: pfccsrif_tx_stat_queue6_drop_pkt_cntr_i 
// outputPort:  "" 
// NO register generated




// pfccsrif_tx_stat_queue6_rsvd
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x0000 
// NO register generated


/* Definitions of REGISTER "pfccsrif_tx_stat_queue7" */

// pfccsrif_tx_stat_queue7_drop_pkt_cntr
// bitfield description: Indicate the packet drop count due to PFC TX queue 7 full
// customType:  RO
// hwAccess: WO 
// reset value : 0x0000 
// inputPort: pfccsrif_tx_stat_queue7_drop_pkt_cntr_i 
// outputPort:  "" 
// NO register generated




// pfccsrif_tx_stat_queue7_rsvd
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x0000 
// NO register generated


/* Definitions of REGISTER "pfccsrif_rx_stat_queue0" */

// pfccsrif_rx_stat_queue0_drop_pkt_cntr
// bitfield description: Indicate the packet drop count due to PFC RX queue 0 full
// customType:  RO
// hwAccess: WO 
// reset value : 0x0000 
// inputPort: pfccsrif_rx_stat_queue0_drop_pkt_cntr_i 
// outputPort:  "" 
// NO register generated




// pfccsrif_rx_stat_queue0_rsvd
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x0000 
// NO register generated


/* Definitions of REGISTER "pfccsrif_rx_stat_queue1" */

// pfccsrif_rx_stat_queue1_drop_pkt_cntr
// bitfield description: Indicate the packet drop count due to PFC RX queue 1 full
// customType:  RO
// hwAccess: WO 
// reset value : 0x0000 
// inputPort: pfccsrif_rx_stat_queue1_drop_pkt_cntr_i 
// outputPort:  "" 
// NO register generated




// pfccsrif_rx_stat_queue1_rsvd
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x0000 
// NO register generated


/* Definitions of REGISTER "pfccsrif_rx_stat_queue2" */

// pfccsrif_rx_stat_queue2_drop_pkt_cntr
// bitfield description: Indicate the packet drop count due to PFC RX queue 2 full
// customType:  RO
// hwAccess: WO 
// reset value : 0x0000 
// inputPort: pfccsrif_rx_stat_queue2_drop_pkt_cntr_i 
// outputPort:  "" 
// NO register generated




// pfccsrif_rx_stat_queue2_rsvd
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x0000 
// NO register generated


/* Definitions of REGISTER "pfccsrif_rx_stat_queue3" */

// pfccsrif_rx_stat_queue3_drop_pkt_cntr
// bitfield description: Indicate the packet drop count due to PFC RX queue 3 full
// customType:  RO
// hwAccess: WO 
// reset value : 0x0000 
// inputPort: pfccsrif_rx_stat_queue3_drop_pkt_cntr_i 
// outputPort:  "" 
// NO register generated




// pfccsrif_rx_stat_queue3_rsvd
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x0000 
// NO register generated


/* Definitions of REGISTER "pfccsrif_rx_stat_queue4" */

// pfccsrif_rx_stat_queue4_drop_pkt_cntr
// bitfield description: Indicate the packet drop count due to PFC RX queue 4 full
// customType:  RO
// hwAccess: WO 
// reset value : 0x0000 
// inputPort: pfccsrif_rx_stat_queue4_drop_pkt_cntr_i 
// outputPort:  "" 
// NO register generated




// pfccsrif_rx_stat_queue4_rsvd
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x0000 
// NO register generated


/* Definitions of REGISTER "pfccsrif_rx_stat_queue5" */

// pfccsrif_rx_stat_queue5_drop_pkt_cntr
// bitfield description: Indicate the packet drop count due to PFC RX queue 5 full
// customType:  RO
// hwAccess: WO 
// reset value : 0x0000 
// inputPort: pfccsrif_rx_stat_queue5_drop_pkt_cntr_i 
// outputPort:  "" 
// NO register generated




// pfccsrif_rx_stat_queue5_rsvd
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x0000 
// NO register generated


/* Definitions of REGISTER "pfccsrif_rx_stat_queue6" */

// pfccsrif_rx_stat_queue6_drop_pkt_cntr
// bitfield description: Indicate the packet drop count due to PFC RX queue 6 full
// customType:  RO
// hwAccess: WO 
// reset value : 0x0000 
// inputPort: pfccsrif_rx_stat_queue6_drop_pkt_cntr_i 
// outputPort:  "" 
// NO register generated




// pfccsrif_rx_stat_queue6_rsvd
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x0000 
// NO register generated


/* Definitions of REGISTER "pfccsrif_rx_stat_queue7" */

// pfccsrif_rx_stat_queue7_drop_pkt_cntr
// bitfield description: Indicate the packet drop count due to PFC RX queue 7 full
// customType:  RO
// hwAccess: WO 
// reset value : 0x0000 
// inputPort: pfccsrif_rx_stat_queue7_drop_pkt_cntr_i 
// outputPort:  "" 
// NO register generated




// pfccsrif_rx_stat_queue7_rsvd
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x0000 
// NO register generated


/* Definitions of REGISTER "pfccsrif_tx_threshold_queue0" */

// pfccsrif_tx_threshold_queue0_cfg_tx_th
// bitfield description: TX threshold expressed as a percentage of TX-Queue size
// customType:  RW
// hwAccess: RO 
// reset value : 0x4 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      pfccsrif_tx_threshold_queue0_cfg_tx_th <= 3'h4;
   end
   else begin
   if (we_pfccsrif_tx_threshold_queue0) begin 
      pfccsrif_tx_threshold_queue0_cfg_tx_th[2:0]   <=  din[2:0];  //
   end
end

// pfccsrif_tx_threshold_queue0_rsvd
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x00000000 
// NO register generated


/* Definitions of REGISTER "pfccsrif_tx_threshold_queue1" */

// pfccsrif_tx_threshold_queue1_cfg_tx_th
// bitfield description: TX threshold expressed as a percentage of TX-Queue size
// customType:  RW
// hwAccess: RO 
// reset value : 0x4 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      pfccsrif_tx_threshold_queue1_cfg_tx_th <= 3'h4;
   end
   else begin
   if (we_pfccsrif_tx_threshold_queue1) begin 
      pfccsrif_tx_threshold_queue1_cfg_tx_th[2:0]   <=  din[2:0];  //
   end
end

// pfccsrif_tx_threshold_queue1_rsvd
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x00000000 
// NO register generated


/* Definitions of REGISTER "pfccsrif_tx_threshold_queue2" */

// pfccsrif_tx_threshold_queue2_cfg_tx_th
// bitfield description: TX threshold expressed as a percentage of TX-Queue size
// customType:  RW
// hwAccess: RO 
// reset value : 0x4 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      pfccsrif_tx_threshold_queue2_cfg_tx_th <= 3'h4;
   end
   else begin
   if (we_pfccsrif_tx_threshold_queue2) begin 
      pfccsrif_tx_threshold_queue2_cfg_tx_th[2:0]   <=  din[2:0];  //
   end
end

// pfccsrif_tx_threshold_queue2_rsvd
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x00000000 
// NO register generated


/* Definitions of REGISTER "pfccsrif_tx_threshold_queue3" */

// pfccsrif_tx_threshold_queue3_cfg_tx_th
// bitfield description: TX threshold expressed as a percentage of TX-Queue size
// customType:  RW
// hwAccess: RO 
// reset value : 0x4 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      pfccsrif_tx_threshold_queue3_cfg_tx_th <= 3'h4;
   end
   else begin
   if (we_pfccsrif_tx_threshold_queue3) begin 
      pfccsrif_tx_threshold_queue3_cfg_tx_th[2:0]   <=  din[2:0];  //
   end
end

// pfccsrif_tx_threshold_queue3_rsvd
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x00000000 
// NO register generated


/* Definitions of REGISTER "pfccsrif_tx_threshold_queue4" */

// pfccsrif_tx_threshold_queue4_cfg_tx_th
// bitfield description: TX threshold expressed as a percentage of TX-Queue size
// customType:  RW
// hwAccess: RO 
// reset value : 0x4 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      pfccsrif_tx_threshold_queue4_cfg_tx_th <= 3'h4;
   end
   else begin
   if (we_pfccsrif_tx_threshold_queue4) begin 
      pfccsrif_tx_threshold_queue4_cfg_tx_th[2:0]   <=  din[2:0];  //
   end
end

// pfccsrif_tx_threshold_queue4_rsvd
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x00000000 
// NO register generated


/* Definitions of REGISTER "pfccsrif_tx_threshold_queue5" */

// pfccsrif_tx_threshold_queue5_cfg_tx_th
// bitfield description: TX threshold expressed as a percentage of TX-Queue size
// customType:  RW
// hwAccess: RO 
// reset value : 0x4 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      pfccsrif_tx_threshold_queue5_cfg_tx_th <= 3'h4;
   end
   else begin
   if (we_pfccsrif_tx_threshold_queue5) begin 
      pfccsrif_tx_threshold_queue5_cfg_tx_th[2:0]   <=  din[2:0];  //
   end
end

// pfccsrif_tx_threshold_queue5_rsvd
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x00000000 
// NO register generated


/* Definitions of REGISTER "pfccsrif_tx_threshold_queue6" */

// pfccsrif_tx_threshold_queue6_cfg_tx_th
// bitfield description: TX threshold expressed as a percentage of TX-Queue size
// customType:  RW
// hwAccess: RO 
// reset value : 0x4 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      pfccsrif_tx_threshold_queue6_cfg_tx_th <= 3'h4;
   end
   else begin
   if (we_pfccsrif_tx_threshold_queue6) begin 
      pfccsrif_tx_threshold_queue6_cfg_tx_th[2:0]   <=  din[2:0];  //
   end
end

// pfccsrif_tx_threshold_queue6_rsvd
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x00000000 
// NO register generated


/* Definitions of REGISTER "pfccsrif_tx_threshold_queue7" */

// pfccsrif_tx_threshold_queue7_cfg_tx_th
// bitfield description: TX threshold expressed as a percentage of TX-Queue size
// customType:  RW
// hwAccess: RO 
// reset value : 0x4 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      pfccsrif_tx_threshold_queue7_cfg_tx_th <= 3'h4;
   end
   else begin
   if (we_pfccsrif_tx_threshold_queue7) begin 
      pfccsrif_tx_threshold_queue7_cfg_tx_th[2:0]   <=  din[2:0];  //
   end
end

// pfccsrif_tx_threshold_queue7_rsvd
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x00000000 
// NO register generated


/* Definitions of REGISTER "pfccsrif_rx_threshold_queue0" */

// pfccsrif_rx_threshold_queue0_cfg_rx_low_th
// bitfield description: cfg_rx_low_th[Q] => Sets the low threshold for RX-Queue. Value is calculated as cfg_rx_low_th[Q] * 128. Tx_pfc/pause is de-asserted if fill level is < this value
// customType:  RW
// hwAccess: RO 
// reset value : 0x02 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      pfccsrif_rx_threshold_queue0_cfg_rx_low_th <= 6'h02;
   end
   else begin
   if (we_pfccsrif_rx_threshold_queue0[0]) begin 
      pfccsrif_rx_threshold_queue0_cfg_rx_low_th[5:0]   <=  din[5:0];  //
   end
end

// pfccsrif_rx_threshold_queue0_rsvd1
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x0 
// NO register generated



// pfccsrif_rx_threshold_queue0_cfg_rx_high_th
// bitfield description: cfg_rx_high_th[Q] => Sets the high threshold for RX-Queue. Value is calculated as cfg_rx_high_th[Q] * 128. Tx_pfc/pause is asserted if fill level is >= this value
// customType:  RW
// hwAccess: RO 
// reset value : 0x03 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      pfccsrif_rx_threshold_queue0_cfg_rx_high_th <= 6'h03;
   end
   else begin
   if (we_pfccsrif_rx_threshold_queue0[1]) begin 
      pfccsrif_rx_threshold_queue0_cfg_rx_high_th[5:0]   <=  din[13:8];  //
   end
end

// pfccsrif_rx_threshold_queue0_rsvd0
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x00000 
// NO register generated


/* Definitions of REGISTER "pfccsrif_rx_threshold_queue1" */

// pfccsrif_rx_threshold_queue1_cfg_rx_low_th
// bitfield description: cfg_rx_low_th[Q] => Sets the low threshold for RX-Queue. Value is calculated as cfg_rx_low_th[Q] * 128. Tx_pfc/pause is de-asserted if fill level is < this value
// customType:  RW
// hwAccess: RO 
// reset value : 0x02 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      pfccsrif_rx_threshold_queue1_cfg_rx_low_th <= 6'h02;
   end
   else begin
   if (we_pfccsrif_rx_threshold_queue1[0]) begin 
      pfccsrif_rx_threshold_queue1_cfg_rx_low_th[5:0]   <=  din[5:0];  //
   end
end

// pfccsrif_rx_threshold_queue1_rsvd1
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x0 
// NO register generated



// pfccsrif_rx_threshold_queue1_cfg_rx_high_th
// bitfield description: cfg_rx_high_th[Q] => Sets the high threshold for RX-Queue. Value is calculated as cfg_rx_high_th[Q] * 128. Tx_pfc/pause is asserted if fill level is >= this value
// customType:  RW
// hwAccess: RO 
// reset value : 0x03 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      pfccsrif_rx_threshold_queue1_cfg_rx_high_th <= 6'h03;
   end
   else begin
   if (we_pfccsrif_rx_threshold_queue1[1]) begin 
      pfccsrif_rx_threshold_queue1_cfg_rx_high_th[5:0]   <=  din[13:8];  //
   end
end

// pfccsrif_rx_threshold_queue1_rsvd0
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x00000 
// NO register generated


/* Definitions of REGISTER "pfccsrif_rx_threshold_queue2" */

// pfccsrif_rx_threshold_queue2_cfg_rx_low_th
// bitfield description: cfg_rx_low_th[Q] => Sets the low threshold for RX-Queue. Value is calculated as cfg_rx_low_th[Q] * 128. Tx_pfc/pause is de-asserted if fill level is < this value
// customType:  RW
// hwAccess: RO 
// reset value : 0x02 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      pfccsrif_rx_threshold_queue2_cfg_rx_low_th <= 6'h02;
   end
   else begin
   if (we_pfccsrif_rx_threshold_queue2[0]) begin 
      pfccsrif_rx_threshold_queue2_cfg_rx_low_th[5:0]   <=  din[5:0];  //
   end
end

// pfccsrif_rx_threshold_queue2_rsvd1
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x0 
// NO register generated



// pfccsrif_rx_threshold_queue2_cfg_rx_high_th
// bitfield description: cfg_rx_high_th[Q] => Sets the high threshold for RX-Queue. Value is calculated as cfg_rx_high_th[Q] * 128. Tx_pfc/pause is asserted if fill level is >= this value
// customType:  RW
// hwAccess: RO 
// reset value : 0x03 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      pfccsrif_rx_threshold_queue2_cfg_rx_high_th <= 6'h03;
   end
   else begin
   if (we_pfccsrif_rx_threshold_queue2[1]) begin 
      pfccsrif_rx_threshold_queue2_cfg_rx_high_th[5:0]   <=  din[13:8];  //
   end
end

// pfccsrif_rx_threshold_queue2_rsvd0
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x00000 
// NO register generated


/* Definitions of REGISTER "pfccsrif_rx_threshold_queue3" */

// pfccsrif_rx_threshold_queue3_cfg_rx_low_th
// bitfield description: cfg_rx_low_th[Q] => Sets the low threshold for RX-Queue. Value is calculated as cfg_rx_low_th[Q] * 128. Tx_pfc/pause is de-asserted if fill level is < this value
// customType:  RW
// hwAccess: RO 
// reset value : 0x02 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      pfccsrif_rx_threshold_queue3_cfg_rx_low_th <= 6'h02;
   end
   else begin
   if (we_pfccsrif_rx_threshold_queue3[0]) begin 
      pfccsrif_rx_threshold_queue3_cfg_rx_low_th[5:0]   <=  din[5:0];  //
   end
end

// pfccsrif_rx_threshold_queue3_rsvd1
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x0 
// NO register generated



// pfccsrif_rx_threshold_queue3_cfg_rx_high_th
// bitfield description: cfg_rx_high_th[Q] => Sets the high threshold for RX-Queue. Value is calculated as cfg_rx_high_th[Q] * 128. Tx_pfc/pause is asserted if fill level is >= this value
// customType:  RW
// hwAccess: RO 
// reset value : 0x03 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      pfccsrif_rx_threshold_queue3_cfg_rx_high_th <= 6'h03;
   end
   else begin
   if (we_pfccsrif_rx_threshold_queue3[1]) begin 
      pfccsrif_rx_threshold_queue3_cfg_rx_high_th[5:0]   <=  din[13:8];  //
   end
end

// pfccsrif_rx_threshold_queue3_rsvd0
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x00000 
// NO register generated


/* Definitions of REGISTER "pfccsrif_rx_threshold_queue4" */

// pfccsrif_rx_threshold_queue4_cfg_rx_low_th
// bitfield description: cfg_rx_low_th[Q] => Sets the low threshold for RX-Queue. Value is calculated as cfg_rx_low_th[Q] * 128. Tx_pfc/pause is de-asserted if fill level is < this value
// customType:  RW
// hwAccess: RO 
// reset value : 0x02 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      pfccsrif_rx_threshold_queue4_cfg_rx_low_th <= 6'h02;
   end
   else begin
   if (we_pfccsrif_rx_threshold_queue4[0]) begin 
      pfccsrif_rx_threshold_queue4_cfg_rx_low_th[5:0]   <=  din[5:0];  //
   end
end

// pfccsrif_rx_threshold_queue4_rsvd1
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x0 
// NO register generated



// pfccsrif_rx_threshold_queue4_cfg_rx_high_th
// bitfield description: cfg_rx_high_th[Q] => Sets the high threshold for RX-Queue. Value is calculated as cfg_rx_high_th[Q] * 128. Tx_pfc/pause is asserted if fill level is >= this value
// customType:  RW
// hwAccess: RO 
// reset value : 0x03 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      pfccsrif_rx_threshold_queue4_cfg_rx_high_th <= 6'h03;
   end
   else begin
   if (we_pfccsrif_rx_threshold_queue4[1]) begin 
      pfccsrif_rx_threshold_queue4_cfg_rx_high_th[5:0]   <=  din[13:8];  //
   end
end

// pfccsrif_rx_threshold_queue4_rsvd0
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x00000 
// NO register generated


/* Definitions of REGISTER "pfccsrif_rx_threshold_queue5" */

// pfccsrif_rx_threshold_queue5_cfg_rx_low_th
// bitfield description: cfg_rx_low_th[Q] => Sets the low threshold for RX-Queue. Value is calculated as cfg_rx_low_th[Q] * 128. Tx_pfc/pause is de-asserted if fill level is < this value
// customType:  RW
// hwAccess: RO 
// reset value : 0x02 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      pfccsrif_rx_threshold_queue5_cfg_rx_low_th <= 6'h02;
   end
   else begin
   if (we_pfccsrif_rx_threshold_queue5[0]) begin 
      pfccsrif_rx_threshold_queue5_cfg_rx_low_th[5:0]   <=  din[5:0];  //
   end
end

// pfccsrif_rx_threshold_queue5_rsvd1
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x0 
// NO register generated



// pfccsrif_rx_threshold_queue5_cfg_rx_high_th
// bitfield description: cfg_rx_high_th[Q] => Sets the high threshold for RX-Queue. Value is calculated as cfg_rx_high_th[Q] * 128. Tx_pfc/pause is asserted if fill level is >= this value
// customType:  RW
// hwAccess: RO 
// reset value : 0x03 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      pfccsrif_rx_threshold_queue5_cfg_rx_high_th <= 6'h03;
   end
   else begin
   if (we_pfccsrif_rx_threshold_queue5[1]) begin 
      pfccsrif_rx_threshold_queue5_cfg_rx_high_th[5:0]   <=  din[13:8];  //
   end
end

// pfccsrif_rx_threshold_queue5_rsvd0
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x00000 
// NO register generated


/* Definitions of REGISTER "pfccsrif_rx_threshold_queue6" */

// pfccsrif_rx_threshold_queue6_cfg_rx_low_th
// bitfield description: cfg_rx_low_th[Q] => Sets the low threshold for RX-Queue. Value is calculated as cfg_rx_low_th[Q] * 128. Tx_pfc/pause is de-asserted if fill level is < this value
// customType:  RW
// hwAccess: RO 
// reset value : 0x02 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      pfccsrif_rx_threshold_queue6_cfg_rx_low_th <= 6'h02;
   end
   else begin
   if (we_pfccsrif_rx_threshold_queue6[0]) begin 
      pfccsrif_rx_threshold_queue6_cfg_rx_low_th[5:0]   <=  din[5:0];  //
   end
end

// pfccsrif_rx_threshold_queue6_rsvd1
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x0 
// NO register generated



// pfccsrif_rx_threshold_queue6_cfg_rx_high_th
// bitfield description: cfg_rx_high_th[Q] => Sets the high threshold for RX-Queue. Value is calculated as cfg_rx_high_th[Q] * 128. Tx_pfc/pause is asserted if fill level is >= this value
// customType:  RW
// hwAccess: RO 
// reset value : 0x03 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      pfccsrif_rx_threshold_queue6_cfg_rx_high_th <= 6'h03;
   end
   else begin
   if (we_pfccsrif_rx_threshold_queue6[1]) begin 
      pfccsrif_rx_threshold_queue6_cfg_rx_high_th[5:0]   <=  din[13:8];  //
   end
end

// pfccsrif_rx_threshold_queue6_rsvd0
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x00000 
// NO register generated


/* Definitions of REGISTER "pfccsrif_rx_threshold_queue7" */

// pfccsrif_rx_threshold_queue7_cfg_rx_low_th
// bitfield description: cfg_rx_low_th[Q] => Sets the low threshold for RX-Queue. Value is calculated as cfg_rx_low_th[Q] * 128. Tx_pfc/pause is de-asserted if fill level is < this value
// customType:  RW
// hwAccess: RO 
// reset value : 0x02 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      pfccsrif_rx_threshold_queue7_cfg_rx_low_th <= 6'h02;
   end
   else begin
   if (we_pfccsrif_rx_threshold_queue7[0]) begin 
      pfccsrif_rx_threshold_queue7_cfg_rx_low_th[5:0]   <=  din[5:0];  //
   end
end

// pfccsrif_rx_threshold_queue7_rsvd1
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x0 
// NO register generated



// pfccsrif_rx_threshold_queue7_cfg_rx_high_th
// bitfield description: cfg_rx_high_th[Q] => Sets the high threshold for RX-Queue. Value is calculated as cfg_rx_high_th[Q] * 128. Tx_pfc/pause is asserted if fill level is >= this value
// customType:  RW
// hwAccess: RO 
// reset value : 0x03 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      pfccsrif_rx_threshold_queue7_cfg_rx_high_th <= 6'h03;
   end
   else begin
   if (we_pfccsrif_rx_threshold_queue7[1]) begin 
      pfccsrif_rx_threshold_queue7_cfg_rx_high_th[5:0]   <=  din[13:8];  //
   end
end

// pfccsrif_rx_threshold_queue7_rsvd0
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x00000 
// NO register generated




// read process
always @ (*)
begin
rdata_comb = 32'h00000000;
   if(re) begin
      case (addr)  
	8'h00 : begin
		rdata_comb [0]	= pfccsrif_control_cfg_tx_pri_arb  ;		// readType = read   writeType =write
		rdata_comb [1]	= pfccsrif_control_cfg_rx_pri_arb  ;		// readType = read   writeType =write
		rdata_comb [2]	= pfccsrif_control_cfg_pfc_sel  ;		// readType = read   writeType =write
		rdata_comb [3]	= pfccsrif_control_cfg_flow_control_en  ;		// readType = read   writeType =write
		rdata_comb [4]	= pfccsrif_control_cfg_tx_stat_clear  ;		// readType = read   writeType =write
		rdata_comb [5]	= pfccsrif_control_cfg_rx_stat_clear  ;		// readType = read   writeType =write
		rdata_comb [31:6]	= 26'h0000000 ;  // pfccsrif_control_rsvd 	is reserved or a constant value, a read access gives the reset value
	end
	8'h20 : begin
		rdata_comb [15:0]	= pfccsrif_tx_stat_queue0_drop_pkt_cntr_i [15:0] ;		// readType = read   writeType =illegal
		rdata_comb [31:16]	= 16'h0000 ;  // pfccsrif_tx_stat_queue0_rsvd 	is reserved or a constant value, a read access gives the reset value
	end
	8'h24 : begin
		rdata_comb [15:0]	= pfccsrif_tx_stat_queue1_drop_pkt_cntr_i [15:0] ;		// readType = read   writeType =illegal
		rdata_comb [31:16]	= 16'h0000 ;  // pfccsrif_tx_stat_queue1_rsvd 	is reserved or a constant value, a read access gives the reset value
	end
	8'h28 : begin
		rdata_comb [15:0]	= pfccsrif_tx_stat_queue2_drop_pkt_cntr_i [15:0] ;		// readType = read   writeType =illegal
		rdata_comb [31:16]	= 16'h0000 ;  // pfccsrif_tx_stat_queue2_rsvd 	is reserved or a constant value, a read access gives the reset value
	end
	8'h2c : begin
		rdata_comb [15:0]	= pfccsrif_tx_stat_queue3_drop_pkt_cntr_i [15:0] ;		// readType = read   writeType =illegal
		rdata_comb [31:16]	= 16'h0000 ;  // pfccsrif_tx_stat_queue3_rsvd 	is reserved or a constant value, a read access gives the reset value
	end
	8'h30 : begin
		rdata_comb [15:0]	= pfccsrif_tx_stat_queue4_drop_pkt_cntr_i [15:0] ;		// readType = read   writeType =illegal
		rdata_comb [31:16]	= 16'h0000 ;  // pfccsrif_tx_stat_queue4_rsvd 	is reserved or a constant value, a read access gives the reset value
	end
	8'h34 : begin
		rdata_comb [15:0]	= pfccsrif_tx_stat_queue5_drop_pkt_cntr_i [15:0] ;		// readType = read   writeType =illegal
		rdata_comb [31:16]	= 16'h0000 ;  // pfccsrif_tx_stat_queue5_rsvd 	is reserved or a constant value, a read access gives the reset value
	end
	8'h38 : begin
		rdata_comb [15:0]	= pfccsrif_tx_stat_queue6_drop_pkt_cntr_i [15:0] ;		// readType = read   writeType =illegal
		rdata_comb [31:16]	= 16'h0000 ;  // pfccsrif_tx_stat_queue6_rsvd 	is reserved or a constant value, a read access gives the reset value
	end
	8'h3c : begin
		rdata_comb [15:0]	= pfccsrif_tx_stat_queue7_drop_pkt_cntr_i [15:0] ;		// readType = read   writeType =illegal
		rdata_comb [31:16]	= 16'h0000 ;  // pfccsrif_tx_stat_queue7_rsvd 	is reserved or a constant value, a read access gives the reset value
	end
	8'h40 : begin
		rdata_comb [15:0]	= pfccsrif_rx_stat_queue0_drop_pkt_cntr_i [15:0] ;		// readType = read   writeType =illegal
		rdata_comb [31:16]	= 16'h0000 ;  // pfccsrif_rx_stat_queue0_rsvd 	is reserved or a constant value, a read access gives the reset value
	end
	8'h44 : begin
		rdata_comb [15:0]	= pfccsrif_rx_stat_queue1_drop_pkt_cntr_i [15:0] ;		// readType = read   writeType =illegal
		rdata_comb [31:16]	= 16'h0000 ;  // pfccsrif_rx_stat_queue1_rsvd 	is reserved or a constant value, a read access gives the reset value
	end
	8'h48 : begin
		rdata_comb [15:0]	= pfccsrif_rx_stat_queue2_drop_pkt_cntr_i [15:0] ;		// readType = read   writeType =illegal
		rdata_comb [31:16]	= 16'h0000 ;  // pfccsrif_rx_stat_queue2_rsvd 	is reserved or a constant value, a read access gives the reset value
	end
	8'h4c : begin
		rdata_comb [15:0]	= pfccsrif_rx_stat_queue3_drop_pkt_cntr_i [15:0] ;		// readType = read   writeType =illegal
		rdata_comb [31:16]	= 16'h0000 ;  // pfccsrif_rx_stat_queue3_rsvd 	is reserved or a constant value, a read access gives the reset value
	end
	8'h50 : begin
		rdata_comb [15:0]	= pfccsrif_rx_stat_queue4_drop_pkt_cntr_i [15:0] ;		// readType = read   writeType =illegal
		rdata_comb [31:16]	= 16'h0000 ;  // pfccsrif_rx_stat_queue4_rsvd 	is reserved or a constant value, a read access gives the reset value
	end
	8'h54 : begin
		rdata_comb [15:0]	= pfccsrif_rx_stat_queue5_drop_pkt_cntr_i [15:0] ;		// readType = read   writeType =illegal
		rdata_comb [31:16]	= 16'h0000 ;  // pfccsrif_rx_stat_queue5_rsvd 	is reserved or a constant value, a read access gives the reset value
	end
	8'h58 : begin
		rdata_comb [15:0]	= pfccsrif_rx_stat_queue6_drop_pkt_cntr_i [15:0] ;		// readType = read   writeType =illegal
		rdata_comb [31:16]	= 16'h0000 ;  // pfccsrif_rx_stat_queue6_rsvd 	is reserved or a constant value, a read access gives the reset value
	end
	8'h5c : begin
		rdata_comb [15:0]	= pfccsrif_rx_stat_queue7_drop_pkt_cntr_i [15:0] ;		// readType = read   writeType =illegal
		rdata_comb [31:16]	= 16'h0000 ;  // pfccsrif_rx_stat_queue7_rsvd 	is reserved or a constant value, a read access gives the reset value
	end
	8'h60 : begin
		rdata_comb [2:0]	= pfccsrif_tx_threshold_queue0_cfg_tx_th [2:0] ;		// readType = read   writeType =write
		rdata_comb [31:3]	= 29'h00000000 ;  // pfccsrif_tx_threshold_queue0_rsvd 	is reserved or a constant value, a read access gives the reset value
	end
	8'h64 : begin
		rdata_comb [2:0]	= pfccsrif_tx_threshold_queue1_cfg_tx_th [2:0] ;		// readType = read   writeType =write
		rdata_comb [31:3]	= 29'h00000000 ;  // pfccsrif_tx_threshold_queue1_rsvd 	is reserved or a constant value, a read access gives the reset value
	end
	8'h68 : begin
		rdata_comb [2:0]	= pfccsrif_tx_threshold_queue2_cfg_tx_th [2:0] ;		// readType = read   writeType =write
		rdata_comb [31:3]	= 29'h00000000 ;  // pfccsrif_tx_threshold_queue2_rsvd 	is reserved or a constant value, a read access gives the reset value
	end
	8'h6c : begin
		rdata_comb [2:0]	= pfccsrif_tx_threshold_queue3_cfg_tx_th [2:0] ;		// readType = read   writeType =write
		rdata_comb [31:3]	= 29'h00000000 ;  // pfccsrif_tx_threshold_queue3_rsvd 	is reserved or a constant value, a read access gives the reset value
	end
	8'h70 : begin
		rdata_comb [2:0]	= pfccsrif_tx_threshold_queue4_cfg_tx_th [2:0] ;		// readType = read   writeType =write
		rdata_comb [31:3]	= 29'h00000000 ;  // pfccsrif_tx_threshold_queue4_rsvd 	is reserved or a constant value, a read access gives the reset value
	end
	8'h74 : begin
		rdata_comb [2:0]	= pfccsrif_tx_threshold_queue5_cfg_tx_th [2:0] ;		// readType = read   writeType =write
		rdata_comb [31:3]	= 29'h00000000 ;  // pfccsrif_tx_threshold_queue5_rsvd 	is reserved or a constant value, a read access gives the reset value
	end
	8'h78 : begin
		rdata_comb [2:0]	= pfccsrif_tx_threshold_queue6_cfg_tx_th [2:0] ;		// readType = read   writeType =write
		rdata_comb [31:3]	= 29'h00000000 ;  // pfccsrif_tx_threshold_queue6_rsvd 	is reserved or a constant value, a read access gives the reset value
	end
	8'h7c : begin
		rdata_comb [2:0]	= pfccsrif_tx_threshold_queue7_cfg_tx_th [2:0] ;		// readType = read   writeType =write
		rdata_comb [31:3]	= 29'h00000000 ;  // pfccsrif_tx_threshold_queue7_rsvd 	is reserved or a constant value, a read access gives the reset value
	end
	8'h80 : begin
		rdata_comb [5:0]	= pfccsrif_rx_threshold_queue0_cfg_rx_low_th [5:0] ;		// readType = read   writeType =write
		rdata_comb [7:6]	= 2'h0 ;  // pfccsrif_rx_threshold_queue0_rsvd1 	is reserved or a constant value, a read access gives the reset value
		rdata_comb [13:8]	= pfccsrif_rx_threshold_queue0_cfg_rx_high_th [5:0] ;		// readType = read   writeType =write
		rdata_comb [31:14]	= 18'h00000 ;  // pfccsrif_rx_threshold_queue0_rsvd0 	is reserved or a constant value, a read access gives the reset value
	end
	8'h84 : begin
		rdata_comb [5:0]	= pfccsrif_rx_threshold_queue1_cfg_rx_low_th [5:0] ;		// readType = read   writeType =write
		rdata_comb [7:6]	= 2'h0 ;  // pfccsrif_rx_threshold_queue1_rsvd1 	is reserved or a constant value, a read access gives the reset value
		rdata_comb [13:8]	= pfccsrif_rx_threshold_queue1_cfg_rx_high_th [5:0] ;		// readType = read   writeType =write
		rdata_comb [31:14]	= 18'h00000 ;  // pfccsrif_rx_threshold_queue1_rsvd0 	is reserved or a constant value, a read access gives the reset value
	end
	8'h88 : begin
		rdata_comb [5:0]	= pfccsrif_rx_threshold_queue2_cfg_rx_low_th [5:0] ;		// readType = read   writeType =write
		rdata_comb [7:6]	= 2'h0 ;  // pfccsrif_rx_threshold_queue2_rsvd1 	is reserved or a constant value, a read access gives the reset value
		rdata_comb [13:8]	= pfccsrif_rx_threshold_queue2_cfg_rx_high_th [5:0] ;		// readType = read   writeType =write
		rdata_comb [31:14]	= 18'h00000 ;  // pfccsrif_rx_threshold_queue2_rsvd0 	is reserved or a constant value, a read access gives the reset value
	end
	8'h8c : begin
		rdata_comb [5:0]	= pfccsrif_rx_threshold_queue3_cfg_rx_low_th [5:0] ;		// readType = read   writeType =write
		rdata_comb [7:6]	= 2'h0 ;  // pfccsrif_rx_threshold_queue3_rsvd1 	is reserved or a constant value, a read access gives the reset value
		rdata_comb [13:8]	= pfccsrif_rx_threshold_queue3_cfg_rx_high_th [5:0] ;		// readType = read   writeType =write
		rdata_comb [31:14]	= 18'h00000 ;  // pfccsrif_rx_threshold_queue3_rsvd0 	is reserved or a constant value, a read access gives the reset value
	end
	8'h90 : begin
		rdata_comb [5:0]	= pfccsrif_rx_threshold_queue4_cfg_rx_low_th [5:0] ;		// readType = read   writeType =write
		rdata_comb [7:6]	= 2'h0 ;  // pfccsrif_rx_threshold_queue4_rsvd1 	is reserved or a constant value, a read access gives the reset value
		rdata_comb [13:8]	= pfccsrif_rx_threshold_queue4_cfg_rx_high_th [5:0] ;		// readType = read   writeType =write
		rdata_comb [31:14]	= 18'h00000 ;  // pfccsrif_rx_threshold_queue4_rsvd0 	is reserved or a constant value, a read access gives the reset value
	end
	8'h94 : begin
		rdata_comb [5:0]	= pfccsrif_rx_threshold_queue5_cfg_rx_low_th [5:0] ;		// readType = read   writeType =write
		rdata_comb [7:6]	= 2'h0 ;  // pfccsrif_rx_threshold_queue5_rsvd1 	is reserved or a constant value, a read access gives the reset value
		rdata_comb [13:8]	= pfccsrif_rx_threshold_queue5_cfg_rx_high_th [5:0] ;		// readType = read   writeType =write
		rdata_comb [31:14]	= 18'h00000 ;  // pfccsrif_rx_threshold_queue5_rsvd0 	is reserved or a constant value, a read access gives the reset value
	end
	8'h98 : begin
		rdata_comb [5:0]	= pfccsrif_rx_threshold_queue6_cfg_rx_low_th [5:0] ;		// readType = read   writeType =write
		rdata_comb [7:6]	= 2'h0 ;  // pfccsrif_rx_threshold_queue6_rsvd1 	is reserved or a constant value, a read access gives the reset value
		rdata_comb [13:8]	= pfccsrif_rx_threshold_queue6_cfg_rx_high_th [5:0] ;		// readType = read   writeType =write
		rdata_comb [31:14]	= 18'h00000 ;  // pfccsrif_rx_threshold_queue6_rsvd0 	is reserved or a constant value, a read access gives the reset value
	end
	8'h9c : begin
		rdata_comb [5:0]	= pfccsrif_rx_threshold_queue7_cfg_rx_low_th [5:0] ;		// readType = read   writeType =write
		rdata_comb [7:6]	= 2'h0 ;  // pfccsrif_rx_threshold_queue7_rsvd1 	is reserved or a constant value, a read access gives the reset value
		rdata_comb [13:8]	= pfccsrif_rx_threshold_queue7_cfg_rx_high_th [5:0] ;		// readType = read   writeType =write
		rdata_comb [31:14]	= 18'h00000 ;  // pfccsrif_rx_threshold_queue7_rsvd0 	is reserved or a constant value, a read access gives the reset value
	end
	default : begin
		rdata_comb = 32'h00000000;
	end
      endcase
   end
end

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "SsA75YSYGF80sMxcVcIJz7qC/bu5/GFmyOQtDL/x79k9awhwrs1/rpWwdMSdZM2X+KK5OPl7NlHx7SPY5wRckyl2RR/pULB4Gr4ljG7XN4DaAxjnUEsFPGaSXMbeLmHIwmOgVpfePQEWBImt9G4xgjV0kVX3ONW9Qk4+e/sQSunDVn3fkI+oox1qImh/vDaEBsdPebXpztP0C0MXDID9QjOct1HHbd4YOYjU6rRW6yvkTQa7PdHxIFwbwsmF63lN/+SuHUtWeuYv7XEgGL5o3l92+oNP0sQvEsgHYZFpgGlBjazsI0DRRvjf3fgrUwifZ7EeXdses0J+E0XjCyP5Loa3y6iyW9NCrffSkqtixn42OTsTFRsFPJ5fcN+HTUiW/gmlvvAeDx7SXugMRFS96Am+AVRRFKDBskiWLYwG6T4nDv48bIzBNvURxwn0NHTGnOuYmZQ6zbEUap4kblLpB4mkqT0Rg241Wn7Yn0n2CaoqQS+t+69dC/ZleSS0wtXWb60KIZq+WVzaz23Zur/ZtrQ3YmFtWKGk4xG/mx+DcSKZma9Sx/Zhp0ObuUgYyZbE8IYPW2KA9NIYof15wVZr9IVJ4knO3cXaCyDFXbL3C9u3ytX+hWCS7KQ2jg5lUO17RzHOAaOqtSMsSXc6q/i5nkNIlyss0QVajTzvYO3wGRFDcQvhJf1l7bRX59AvmFKfT+aNM4k5V76M8TL3VNNxX9eiXeQdcVmfQ1xFfMXgae5CuKcPPra1gx1CMttKw8ASyJT/n++kEZ1SLqC85GTxPZH/dyPxFpZbySQspLM2tSCGkgYwdmrGh4jX7sLaDJPbfSH/Ubhg5vv7QVNzoeY7A0lPElaC9XoBVWg9Rj7Shzl6LZtgfyKSdSAIBj6GsPuTYv1TMnVcxTxSrXT//H7IIVh2qP6euddvT5lWEGeWQETNC6zkEHJllZ9A60jW9PhvP2YB9JYyi76E6VMSJny4z8RWieL6M7lJuPNk6Pa4ipczXpL6tUAwpYSp8zLbp1tS"
`endif