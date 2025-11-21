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


//****************************************************************************************************************
// Name:        ctfb_avmm_maib_if.sv; based on nadder ct3_xcvr_avmm_soft_logic_core.sv 
// Author:      Ensheng  Huang
// Description: This module provides soft glue logic needed by the transceiver AVMM interfaces 
//                to abstract away the pipelined nature of the transceiver implementation and 
//                provide users a non-pipelined interface that is subject only to a single
//                waitrequest signal. The logic here supports both AVMM1 and AVMM2
//****************************************************************************************************************

module eth_f_ctfb_avmm_maib_if 
#(
  parameter avmm_interface_type  = "avmm1", //Virtual. Valid values: avmm1, avmm2
  parameter rcfg_enable          = 0        //Enable/disable reconfig interface in the Native PHY or PLL IP
)  
(
  // Inputs from user or AVMM atom
  input  wire         avmm_clk,
  input  wire         avmm_reset,
  input  wire  [7:0]  avmm_writedata, 
  input  wire  [20:0] avmm_address,
  input  wire         avmm_write,
  input  wire         avmm_read,
  input  wire  [7:0]  avmm_readdata_int,
  input  wire         avmm_readdatavalid,
  input  wire         avmm_cmdfifo_pfull,
  input  wire         avmm_busy,
  input  wire         avmm_writedone,
  input  wire  [2:0]  avmm_reservedout, 
  
  output reg   [7:0]  avmm_readdata, 
  output wire         soft_avmm_write,  // added to single-pulse writes
  output wire         soft_avmm_read,   // added to single-pulse reads for AVMM2 
  output wire         avmm_waitrequest,
  output wire         avmm_request
  //PORT_LIST_END
  ); 

//****************************************************
//                   LOCALPARAMS
//****************************************************
localparam STARTUP_CNTR_WIDTH       = 3;                      //Width of the start-up wait counter to hold waitrequest high 
localparam MAX_WAIT_STARTUP_CNT     = 3'b111;                 //7 avmm_clk cycles after avmm_clk starts toggling

localparam RESET_SYNC_LEN           = 3;                      //3 flip-flop stage reset synchronizer
localparam RESET_INIT_VAL           = {RESET_SYNC_LEN{1'b1}}; //Init value of the synchronization registers

//****************************************************
//                   SIGNALS
//****************************************************
(* altera_attribute  = "disable_da_rule=D103" *)

wire                          avmm_reset_sync;

reg                           avmm_read_r;
reg                           avmm_readdatavalid_r;
reg                           avmm_readdatavalid_wait;

reg                           avmm_writedone_wait;

reg                           avmm_waitrequest_cmdfifo_pfull;
wire                          avmm_waitrequest_read;
wire                          avmm_waitrequest_write;
reg  [STARTUP_CNTR_WIDTH-1:0] startup_cntr;  

reg                           avmm_write_prev         ; 
wire                          avmm_write_detect       ;
wire                          avmm_write_data_changed ;
wire                          avmm_write_addr_changed ;
reg  [7:0]                    avmm_write_data_prev    ;
reg  [20:0]                   avmm_addr_prev          ;
wire                          crete_write             ; 

assign avmm_reset_sync =avmm_reset;

//***********************************************************************************
//
// Generate avmm_waitrequest
//
//***********************************************************************************
// AVMM slave in hardware:
//  avmm_write -> variable latency 
//  avmm_read  -> variable latency 

//***********************************************************************************
//**************** Generate waitrequest for read operation *************************
// Register avmm_read
always @ (posedge avmm_clk ) begin //sync reset
  if (avmm_reset_sync) begin
    avmm_read_r   <= 1'b0; 
  end else begin
    if (avmm_readdatavalid_r)
      avmm_read_r <= 1'b0; //to indicate the completion of current read
    else 
      avmm_read_r <= avmm_read;
  end
end

// Register avmm_readdatavalid
always @ (posedge avmm_clk ) begin //sync reset
  if (avmm_reset_sync) begin
    avmm_readdatavalid_r  <= 1'b0; 
  end else begin
    avmm_readdatavalid_r  <= avmm_readdatavalid;
  end
end

// Assert:
 //   - when avmm_read is asserted (combinatorially)
 //   - when pfull is asserted (sequentially)
 // Stay asserted:
 //   - there is a pending read AND readdatavalid has not come back
 //   - 
 // Deassert:
 //   - when reset is deasserted (sequentially)
 //   - For a pending read, readdadatavalid has come back (sequentialy)
 //   - 

 // Wait for readdatavalid
 always @ (posedge avmm_clk ) begin //sync reset
   if (avmm_reset_sync) begin
     avmm_readdatavalid_wait <= 1'b0;     
   end else begin
     if (avmm_read & ~avmm_read_r & ~avmm_readdatavalid_wait) begin
       avmm_readdatavalid_wait <= 1'b1;
     end else if (avmm_readdatavalid) begin
       avmm_readdatavalid_wait <= 1'b0;
     end 
     //else
       //no change
   end
 end   

 // waitrequest for read
 assign avmm_waitrequest_read = ( avmm_read  & !avmm_read_r ) | avmm_readdatavalid_wait;

///***********************************************************************************
//**************** Generate waitrequest for write operation *************************

wire write_done_mux;
assign write_done_mux = (avmm_interface_type == "avmm2" ) ? avmm_writedone : avmm_reservedout[1];

always @ (posedge avmm_clk ) begin //sync reset
  if      (avmm_reset_sync)                     avmm_writedone_wait <= 1'b0; 
  else if (soft_avmm_write & crete_write )      avmm_writedone_wait <= 1'b1; 
  else if (write_done_mux & crete_write )  avmm_writedone_wait <= 1'b0; 
end

 //[ADW]: use soft_avmm_write instead of write_detect only  
 //       use avmm_address[8] directly instead of registering
 //       use avmm_reservedout[1] directly instead of registering
 //       avmm_address[9:8]: 2'b00: indicates Crete-side adapter/IP Byte Accesses
 //                          2'b01: indicates Crete-side adapter/IP Dwrod Accesses
 //                          2'b10: Not used with F-tile
 //                          2'b11: indicates Nadder-side adapter accesses
 assign crete_write = (avmm_interface_type == "avmm2" ) ? 1'b1 : (avmm_address[9] == 1'b0);
 //[ADW]: I am generating a waitrequest for all writes
 //       note that is introduces an extra cycle of latency for non-crete writes
 assign avmm_waitrequest_write = (soft_avmm_write | avmm_writedone_wait); 

 always @(posedge avmm_clk ) begin //sync reset
   if      (avmm_reset_sync) begin
     avmm_write_prev      <= 1'b0;
     avmm_write_data_prev <= 8'b0;
     avmm_addr_prev       <= 21'b0;
   end
   else begin
     avmm_write_prev      <= avmm_write;
     avmm_write_data_prev <= avmm_writedata;
     avmm_addr_prev       <= avmm_address;
   end
 end
 
 assign avmm_write_detect       = avmm_write & !avmm_write_prev;
 assign avmm_write_data_changed = avmm_write & (avmm_write_data_prev != avmm_writedata);
 assign avmm_write_addr_changed = avmm_write & (avmm_addr_prev != avmm_address);
 assign soft_avmm_write         = avmm_write_detect | avmm_write_data_changed | avmm_write_addr_changed;
 
//***********************************************************************************
//**************** Generate waitrequest for Command FIFO PFULL***********************
 // Assert:
 //  - when reset is asserted
 //  - when avmm_clk starts toggling first -> using this signal to wait for start-up counter instead of overloading avmm_waitrequest_busy version
 //  - when PFULL = 1 (sequentially)
 // Stay asserted:
 //  - reset
 //  - as long as startup counter != max count defined
 //  - as long as PFULL =  1
 // Deassert:
 //  - when PFULL = 0 (sequentially)
 
//Start-up counter
 always @ (posedge avmm_clk ) begin //sync reset
   if (avmm_reset_sync)
     startup_cntr <= 0; 
   else begin
     if (startup_cntr != MAX_WAIT_STARTUP_CNT) 
       startup_cntr <= startup_cntr + 1'b1; 
   end
 end
 
 always @ (posedge avmm_clk ) begin //sync reset
   if (avmm_reset_sync)
     avmm_waitrequest_cmdfifo_pfull <= 1'b1; //reset to 1 to have waitrequest asserted during reset
   else 
     if (startup_cntr != MAX_WAIT_STARTUP_CNT) 
       avmm_waitrequest_cmdfifo_pfull <= 1'b1;
     else 
       avmm_waitrequest_cmdfifo_pfull <= avmm_cmdfifo_pfull;
 end   
  

 // user waitrequest
 assign avmm_waitrequest = avmm_waitrequest_read | avmm_waitrequest_write | avmm_waitrequest_cmdfifo_pfull;

 //******************************************************************
 //*************** Register readdata to match latency ***************
 always @ (posedge avmm_clk ) begin //sync reset
   if (avmm_reset_sync)
     avmm_readdata[7:0] <= 8'b0; 
   else 
     avmm_readdata[7:0] <= avmm_readdata_int[7:0];
 end  

//***************************************************************************************************************
//
// Generate avmm_request 
//
// If reconfig interface is NOT enabled in the PHY GUI:
//     tie-off avmm_request to 1'b0 => park the avmm_request bit to always be in the "not request" mode => allow Nios to do adaptive calibration

 if(rcfg_enable == 1) begin: g_rcfg_en
     //Park the interface request favoring the user AVMM 
     assign avmm_request = 1'b1; 
 end else begin : g_rcfg_dis
   //Park the interface request favoring the Nios if reconfiguration is not enabled by the user
   assign avmm_request = 1'b0; 
 end 

//***********************************************************************************************************
//
// AVMM2 specific soft block signals to conform to hardware requirements maintaining the same AVMM usemodel
// as AVMM1 interface
//
//***********************************************************************************************************
generate 
if(avmm_interface_type == "avmm2") begin: g_avmm2_block_sig

 reg  avmm_read_prev   ; 
 wire avmm_read_detect ;
wire avmm_read_addr_changed ;
 always @(posedge avmm_clk ) begin //sync reset
   if      (avmm_reset_sync) begin
     avmm_read_prev  <= 1'b0;
   end
   else begin
     avmm_read_prev  <= avmm_read;
   end
 end
 
 assign avmm_read_detect       = avmm_read & !avmm_read_prev;
 assign avmm_read_addr_changed = avmm_read & (avmm_addr_prev != avmm_address);
 assign soft_avmm_read         = avmm_read_detect | avmm_read_addr_changed;

end else 
    assign soft_avmm_read = '0; //not used in avmm1
endgenerate

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "iuBeK6jR69XRNHgPOXANQcgjB4WcZGkPF3FM4twIZ3EvsrAtxQsYS6Hpi5XGvIMMcH9N6DPm/kmHi0wPOQiuTHVVVxmr9OiPO/RVoCdNzGMPvFnw/zRMf5njlvSl/Ap+x6pvul8+7XHuyLyqwObdmDkbCQayz2DnxYXZjjt2proJ3XfkjECmKOX4nN4VQ1AR4UGhbU0fMVSMpGQjFTDlax90AVVn6m/PSOsKahRUPX9MpDFMpFbpEQ2kByEkBsj6Ala/EXSxT8dCZW0NKw2xwKM8X8S3rpSN4eEkvGdYDpLZStkTKGhR52kTgTs2uuvmAcBENIR4rPn9fK0lKpZOJw+5yCqg3pLgINJiaftZHEDIsYtQlIdK+hmkUXarcs3uVnNjIhMBMoz4AEQVZBDKY1pMBAX+okKFGW0PmSFgWzCV8FBT4nxUctH9w5SaBM4DVPaVqf/3sQpLUuTBvS5huE8F6MSFv9nDroTLuSowfwqi8+YDwhvRXyeM8HA/efpfwPUvHu4REroSK4pRKI0onT7Vz3Dcqbt368oNOn4Bt9rTCOWy4H0thGz5ecDF/oD1BwVBmyA4ajI3pQkmKugt6zvE0qnvVybXKzZoNT05RBxyAnCbwPhSLfZM4xy24ybosFe/K2a1smmKmbxDTvLlQfBV4XQNy0o1+hjA5BZ4Dnwskr854v6VPQlw1d1pBA+gwJtStOWsSVndbaU97suhGjn9LGSIUVN2CEPSm4vBmMybWS7BwD86EHglLHLgz5FMZkNtHqC60JIZdTUYoTSszT9KInFp2H/QHhXphDA8GhVDCCsNZpoaKAC37vcmECzrk5QdIP0Mgzlr4H2arbA0i+HmjJndLIMb2YNnNe2eSBQL3FpiYnH9lrqzOVFqTHOvL1FjqAwxi89FaWfYyT0svL+tHMtuwYOtjo6iU1uAl5w2wQjrsVn5V6ebZQObJJyJle34XmMGm2AWqvRCjIgDgHEW8hup2liYuTLSf4C4MCyI3iv6RoXv7D+jy/5jLbaE"
`endif