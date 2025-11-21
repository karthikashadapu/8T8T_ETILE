// ================================================================================
// Copyright (c) <2017>, Intel Corporation
// 
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
// 
//     * Redistributions of source code must retain the above copyright notice,
//       this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of Intel Corporation nor the names of its contributors
//       may be used to endorse or promote products derived from this software
//       without specific prior written permission.
// 
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
// FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
// DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
// SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
// CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
// OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
// ================================================================================ 
 

`timescale 1 ns / 1 ps

module avst_cdc_fifo
(
	dst_clk,         	//expected 491.52 MHz 
	dst_rst_n,

	src_clk,        	//expected 250-300 MHz based on FPGA speed grade/DDR part	
	src_rst_n,

	avst_sink_valid,
	avst_sink_data,		//Data from DDR
	avst_sink_ready,

	avst_src_valid,
	avst_src_data,		//Data to be injected
	avst_src_ready

);

   // ---------  Parameter defination  ---------------------------------

   parameter 			INPUT_DATAWIDTH     	= 256;
//   parameter 			SRC_CLK_mHZ       	    = 491.52;
   parameter 			OUTPUT_DATAWIDTH     	= 128;
//   parameter 			DST_CLK_mHZ       	= 245.76;
//   parameter 			DMA_BURST_LENGTH  	= 64;   // burst length = Number of clock cycle for which data will come uninterrupted (without valid getting low)


  //--------------------  Clocks and reset ----------------------------------------
   input  wire                                          dst_clk;         
   input  wire                                          dst_rst_n;

   input  wire                                          src_clk;        	
   input  wire                                          src_rst_n;



  //-------------------AVST Sink - Data from DDR--------------------------------------
   input  wire                       			avst_sink_valid;
   input  wire [INPUT_DATAWIDTH-1:0]            		avst_sink_data;		
   output wire  					avst_sink_ready;

  //------------------AVST Source - Data to be injected------------------------------
   output wire                                           avst_src_valid;
   output wire [OUTPUT_DATAWIDTH-1:0]                       avst_src_data;		
   input  wire                                           avst_src_ready;


  //----------- Calculation for FIFO DEPTH -----------------
//   localparam                  SRC_CLK_PERIOD      = (1000)/(SRC_CLK_mHZ) ;                  // DMA CLOCK period in ns
//   localparam                  DST_CLK_PERIOD      = (1000)/(DST_CLK_mHZ) ;                 //  INJ CLOCK period in ns
//   localparam                  INJ_BURST_LENGTH    = (DMA_BURST_LENGTH*INPUT_DATAWIDTH*SRC_CLK_PERIOD)/(OUTPUT_DATAWIDTH*DST_CLK_PERIOD);
//   localparam                  Time_of_data_write  = DMA_BURST_LENGTH * SRC_CLK_PERIOD; // Time (ns) required to write all data in a burst  
//   localparam                  Time_of_data_read   = INJ_BURST_LENGTH * DST_CLK_PERIOD; // Time (ns) required to read all data in a burst

  //-------------- $ceil(x) = rounds x to the nearest integer greater than or equal to that element------------------------
 //  localparam                  CDC_DATA_FIFO_DEPTH = 2**($clog2($rtoi($ceil((Time_of_data_read - Time_of_data_write)/SRC_CLK_PERIOD)+16))); // Minimum depth of the FIFO - w.r.t write datawidth
   localparam CDC_DATA_FIFO_DEPTH = 1024;
   
  // ---------  Variable Declaration  ------------------------

   localparam                  CDC_DATA_FIFO_RUSEDW = $clog2(CDC_DATA_FIFO_DEPTH*INPUT_DATAWIDTH/OUTPUT_DATAWIDTH);
   localparam                  CDC_DATA_FIFO_WUSEDW = $clog2(CDC_DATA_FIFO_DEPTH*INPUT_DATAWIDTH/INPUT_DATAWIDTH);

  //------------ Local signals -----------------------------
   reg                          	avst_sink_valid_1d, avst_sink_valid_2d;
   reg   [INPUT_DATAWIDTH-1:0]    	avst_sink_data_1d, avst_sink_data_2d;
   wire                         	cdc_aclr, cdc_wrreq, cdc_rdreq;
   wire                         	cdc_rdfull, cdc_rdempty, cdc_wrfull, cdc_wrempty;
   wire  [INPUT_DATAWIDTH-1:0]    	cdc_data;
   wire  [OUTPUT_DATAWIDTH-1:0]    	cdc_q;
   reg   [OUTPUT_DATAWIDTH-1:0]    	cdc_q_d;
   reg                          	cdc_rdreq_d1, cdc_rdreq_d2;

//   reg   [CSR_DATAWIDTH-1:0]    	cnt_fifo_full, cnt_fifo_empty, cnt_word_read;
//   reg   [CSR_DATAWIDTH-1:0]    	cnt_fifo_full1d, cnt_fifo_full2d, cnt_fifo_empty1d, cnt_fifo_empty2d, cnt_word_read1d, cnt_word_read2d;
   reg 			        	fifo_full, fifo_empty;
   wire  [CDC_DATA_FIFO_RUSEDW-1:0]	rdusedw;

   wire  [CDC_DATA_FIFO_WUSEDW-1:0]	wrusedw; 

   reg 	 [CDC_DATA_FIFO_WUSEDW-1:0] 	wrusedw1d, wrusedw2d;
   reg 	 [CDC_DATA_FIFO_RUSEDW-1:0] 	rdusedw1d, rdusedw2d;
  
   wire					fifo_almost_full;
   reg					fifo_almost_full1d, fifo_almost_full2d;
   reg                                  pattern_active_ctrl;
   wire                                 pattern_active_ctrl_d;


   assign fifo_almost_full   =  (wrusedw >= ((2**CDC_DATA_FIFO_WUSEDW)-4)) ? 1'b1 : 1'b0;
   assign avst_sink_ready    =  ~fifo_almost_full;
   assign cdc_aclr	         =	~src_rst_n || ~dst_rst_n;     // Soft reset
   assign cdc_wrreq 	     = 	avst_sink_valid_2d && ~fifo_almost_full2d; 
   assign cdc_data 	         = 	avst_sink_data_2d;
   assign cdc_rdreq 	     = 	~cdc_rdempty && avst_src_ready; // && pattern_active_ctrl_d;

 // Rising Edge detector - FIFO FUll
   always@(posedge dst_clk)
   begin
      if(~dst_rst_n) 
	fifo_empty  <= 1'b1;
      else 
	fifo_empty <= cdc_rdempty;  
   end

 // Rising Edge detector - FIFO Empty
  always@(posedge src_clk)
   begin
      if(~src_rst_n) 
	fifo_full  <= 1'b0;
      else 
	fifo_full <= fifo_almost_full;  
   end

 
always @ (posedge src_clk) begin
      if (~src_rst_n) begin
         avst_sink_valid_1d   <= 1'b0;
         avst_sink_valid_2d   <= 1'b0;
         avst_sink_data_1d    <= {INPUT_DATAWIDTH{1'b0}};
         avst_sink_data_2d    <= {INPUT_DATAWIDTH{1'b0}};
	     fifo_almost_full1d   <= 1'b0;
	     fifo_almost_full2d   <= 1'b0;
      end else begin
         avst_sink_valid_1d   <= avst_sink_valid; 
         avst_sink_valid_2d   <= avst_sink_valid_1d;
         avst_sink_data_1d    <= avst_sink_data;
         avst_sink_data_2d    <= avst_sink_data_1d;
	     fifo_almost_full1d   <= fifo_almost_full;
	     fifo_almost_full2d   <= fifo_almost_full1d;
      end
   end

//DMA to OUT clock domain
   dcfifo_mixed_widths cdc_fifo (               
      .aclr       (cdc_aclr), 
      .wrclk      (src_clk),           
      .wrreq      (cdc_wrreq),          
      .data       (cdc_data),          
      .rdclk      (dst_clk),  
      .rdreq      (cdc_rdreq),          
      .q          (cdc_q),          
      .rdfull     (cdc_rdfull),
      .rdempty    (cdc_rdempty),          
      .rdusedw    (rdusedw),        
      .wrfull     (cdc_wrfull),          
      .wrempty    (cdc_wrempty),
      .wrusedw    (wrusedw),
      .eccstatus  ()             
   );
   defparam
       cdc_fifo.enable_ecc  = "FALSE",
       cdc_fifo.intended_device_family  = "Agilex",
       cdc_fifo.lpm_hint  = "DISABLE_DCFIFO_EMBEDDED_TIMING_CONSTRAINT=TRUE",
       cdc_fifo.lpm_numwords  = CDC_DATA_FIFO_DEPTH,
       cdc_fifo.lpm_showahead  = "OFF",
       cdc_fifo.lpm_type  = "dcfifo_mixed_widths",
       cdc_fifo.lpm_width  = INPUT_DATAWIDTH,
       cdc_fifo.lpm_widthu  = CDC_DATA_FIFO_WUSEDW,
       cdc_fifo.lpm_widthu_r  = CDC_DATA_FIFO_RUSEDW,
       cdc_fifo.lpm_width_r  = OUTPUT_DATAWIDTH,
       cdc_fifo.overflow_checking  = "ON",
       cdc_fifo.rdsync_delaypipe  = 5,
       cdc_fifo.read_aclr_synch  = "ON",
       cdc_fifo.underflow_checking  = "ON",
       cdc_fifo.use_eab  = "ON",
       cdc_fifo.write_aclr_synch  = "ON",
       cdc_fifo.wrsync_delaypipe  = 5;

   always @ (posedge dst_clk) begin
      if (~dst_rst_n) begin
         cdc_q_d      <= {OUTPUT_DATAWIDTH{1'b0}};
         cdc_rdreq_d1 <= 1'b0;
         cdc_rdreq_d2 <= 1'b0;
      end else begin
         if (avst_src_ready) begin
            cdc_q_d      <= cdc_q;
            cdc_rdreq_d1 <= cdc_rdreq;
            cdc_rdreq_d2 <= cdc_rdreq_d1;
         end
      end
   end
//Output signals
//
assign avst_src_valid = cdc_rdreq_d2; 
assign avst_src_data  = cdc_q_d; 


// ---------   Code Ends Here --------- //
endmodule
