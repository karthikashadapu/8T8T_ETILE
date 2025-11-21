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

//Description:  Capture Interface
//              This module interfaces the streaming endpoints with the DMA
//              subsystem for capturing the streaming data into a DDR memory.
//              The main functions of this module are the following:-
//              1. Interface selection
//              2. Channel selection
//              3. Byte slice index selection
//              3. Time boundary selection for aligned capture
//
//Interface description:
//              1. AVST sink interface (data to be captured)
//                      + Configurable number of interfaces can be supported
//                      by concatenating
//                      + Variable number of channels can be supported
//                      + No backpressure support
//              2. AVST source interface (towards capture DMA)
//              	+ Supports minimal backpressure (for rate matching
//              	alone). Cannot handle large backpressure.
//              	+ ready latency = 0
//              3. AVMM CSR interface
//                      + write/read latency = 1
//                      + doesn't support pending write/read tansactions


//Assumptions:
//              1. This block will not be responsible for determining how much
//              data is to be written into capture buffer. The DMA descriptor
//              size will determine the length of capture.
//
//              2. We have a small fifo to perform CDC. There is not enough
//              size in this fifo to handle significant backpressure. SW needs
//              to ensure descriptor is already loaded into DMA before giving
//              capture enable command 

`timescale 1 ns / 1 ps


module capture_if
#(
   parameter NUM_INTERFACES = 8,
   parameter DATAWIDTH = 512,       //Streaming Input datawidth parameter.
   parameter MAX_CHANNELS = 64,
   parameter DMA_DATAWIDTH = 512,
   parameter CSR_DATAWIDTH = 32,
   parameter CSR_ADDRWIDTH = 5,
   parameter IQ_DATAWIDTH = 32,
   parameter FRAME_STATUS_WIDTH = 70,
   parameter TRIGGER_BASED_CAPTURE = 0,  //To align capture on an external trigger
   parameter FRAME_BASED_CAPTURE = 1     //To align capture based on frame status
)
(
   //Clocks and reset
   input  wire                                           clk_st,         //expected 491.52 MHz based on typical usecase
   input  wire                                           rst_st_n,

   input  wire                                           clk_dma,        //expected 250-300 MHz based on FPGA speed grade/DDR part
   input  wire                                           rst_dma_n,

   input  wire                                           clk_csr,        //expected 100 MHz based on typical usecase
   input  wire                                           rst_csr_n,

   input  wire [1:0]             avst_sink_valid  ,
   input  wire [63:0]            avst_sink_data	  ,
   input  wire [5:0]             avst_sink_channel,

   input  wire [NUM_INTERFACES-1:0]                      trigger_event,

   output wire                                           avst_src_valid,
   output wire [DMA_DATAWIDTH-1:0]                       avst_src_data,
   input  wire                                           avst_src_ready,

   input  wire [CSR_ADDRWIDTH-1:0]                       csr_address,
   input  wire                                           csr_write,
   input  wire                                           csr_read,
   input  wire [CSR_DATAWIDTH-1:0]                       csr_writedata,
   output wire [CSR_DATAWIDTH-1:0]                       csr_readdata,
   output 												 csr_readdatavalid,

   input  wire [FRAME_STATUS_WIDTH-1:0]                  frame_status,
   output wire [CSR_DATAWIDTH-1:0]                       interface_select 
);

// ---------  Variable Declaration  --------- //
   localparam                  CHANNEL_WIDTH = $clog2(MAX_CHANNELS);
 localparam                  NUM_INTERFACES_LOG2 = (NUM_INTERFACES > 1) ? $clog2(NUM_INTERFACES): 1;
 //  localparam                  NUM_INTERFACES_LOG2 = $clog2(NUM_INTERFACES);
   localparam                  NUM_IQ_IN_INPUT = DATAWIDTH/IQ_DATAWIDTH;
   localparam                  NUM_IQ_IN_INPUT_LOG2 = (NUM_IQ_IN_INPUT > 1) ? $clog2(NUM_IQ_IN_INPUT) : 1;
   localparam                  CDC_DATA_FIFO_DEPTH = 128; //this depth is wrt to write datawidth //corresponds to 8 locations of DMA datawidth of 512
   localparam                  CDC_DATA_FIFO_RUSEDW = $clog2(CDC_DATA_FIFO_DEPTH*IQ_DATAWIDTH/DMA_DATAWIDTH);
   localparam                  CDC_DATA_FIFO_WUSEDW = $clog2(CDC_DATA_FIFO_DEPTH*IQ_DATAWIDTH/IQ_DATAWIDTH);
   localparam                  NO_OF_BYTES       = DMA_DATAWIDTH/8 ;

   reg  [1:0]                  	avst_sink_valid_1d, avst_sink_valid_2d;
   reg  [63:0]        			avst_sink_data_1d, avst_sink_data_2d;
   reg  [5:0]    				avst_sink_channel_1d, avst_sink_channel_2d;
   reg  [FRAME_STATUS_WIDTH-1:0]              frame_status_d1, frame_status_d2;
   // reg  [CSR_DATAWIDTH-1:0]                   csr_readdata_reg;
   wire  [CSR_DATAWIDTH-1:0]                   capture_ctrl, interface_sel, channel_sel,subsystem_sel,
                                              byte_slice_idx_sel, subframe_config, frame_config; 
   reg  [CSR_DATAWIDTH-1:0]                   capture_ctrl_st_d1, capture_ctrl_st_d2;
   reg  [CSR_DATAWIDTH-1:0]                   interface_sel_st_d1, interface_sel_st_d2; 
   reg  [CSR_DATAWIDTH-1:0]                   channel_sel_st_d1, channel_sel_st_d2;
   reg  [CSR_DATAWIDTH-1:0]                   byte_slice_idx_sel_st_d1, byte_slice_idx_sel_st_d2;
   reg  [CSR_DATAWIDTH-1:0]                   subframe_config_st_d1, subframe_config_st_d2;
   reg  [CSR_DATAWIDTH-1:0]                   frame_config_st_d1, frame_config_st_d2;
   reg  [CSR_DATAWIDTH-1:0]                   subsystem_sel_st_d1 , subsystem_sel_st_d2;
   reg                                        radioframe_sel, subframe_sel, symbol_sel, sample_sel;
   reg                                        capture_boundary_sel_latch;
   reg  [NUM_INTERFACES-1:0]                  avst_selctd_intf_shift_valid; 
   reg  [NUM_INTERFACES*DATAWIDTH-1:0]        avst_selctd_intf_shift_data;
   reg  [NUM_INTERFACES*CHANNEL_WIDTH-1:0]    avst_selctd_intf_shift_chan;
   reg                                        avst_selctd_intf_valid;
   reg  [DATAWIDTH-1:0]                       avst_selctd_intf_data;
   reg  [CHANNEL_WIDTH-1:0]                   avst_selctd_intf_chan; 
   reg                                        avst_selctd_chan_valid;
   reg  [DATAWIDTH-1:0]                       avst_selctd_chan_data;
   wire [DATAWIDTH-1:0]                       avst_selctd_chan_shift_data;
   reg                                        avst_selctd_slice_valid;
   reg  [IQ_DATAWIDTH-1:0]                    avst_selctd_slice_data;
   reg                                        avst_capture_valid;
   reg  [IQ_DATAWIDTH-1:0]                    avst_capture_data;
   wire                                       cdc_ff_aclr, cdc_ff_wrreq, cdc_ff_rdreq;
   wire                                       cdc_ff_rdfull, cdc_ff_rdempty, cdc_ff_wrfull, cdc_ff_wrempty;
   wire [IQ_DATAWIDTH-1:0]                    cdc_ff_data;
   wire [DMA_DATAWIDTH-1:0]                   cdc_ff_q;
   reg  [DMA_DATAWIDTH-1:0]                   cdc_ff_q_d;
   reg                                        cdc_ff_rdreq_d1, cdc_ff_rdreq_d2;
   wire [NUM_INTERFACES-1:0]                  trigger_event_d;
   reg  [NUM_INTERFACES-1:0]                  trigger_event_selctd;
   wire                                       frame_trigger_wire, capture_trigger_wire;
   reg                                        capture_trigger; 
   reg                                        capture_ctrl_dma_d1, capture_ctrl_dma_d2;
   
   wire   									  capture_start;			 
   wire										  trigger_based_capture_w;	 
   wire										  frame_based_capture_w;		  
   wire [14:0]								  config_sample_select;		 
   wire [4:0]								  config_symbol_select;		 
   wire [3:0]								  config_subframe_select;	 
   wire [9:0]								  config_radio_frame_select; 
   
   
   
   
   

assign interface_select = interface_sel_st_d2  ;

// ---------   Code Starts Here --------- //
//
//
   always @ (posedge clk_st) begin
      if (~rst_st_n) begin
         avst_sink_valid_1d   <= 'b0 ;
         avst_sink_valid_2d   <= 'b0 ;
         avst_sink_data_1d    <= 'b0 ;
         avst_sink_data_2d    <= 'b0 ;
         avst_sink_channel_1d <= 'b0 ;
         avst_sink_channel_2d <= 'b0 ;
      end else begin
         avst_sink_valid_1d   <= avst_sink_valid; 
         avst_sink_valid_2d   <= avst_sink_valid_1d;
         avst_sink_data_1d    <= avst_sink_data;
         avst_sink_data_2d    <= avst_sink_data_1d;
         avst_sink_channel_1d <= avst_sink_channel;
         avst_sink_channel_2d <= avst_sink_channel_1d;
      end
   end

   always @ (posedge clk_st) begin
      if (~rst_st_n) begin
         frame_status_d1 <= {FRAME_STATUS_WIDTH{1'b0}};
         frame_status_d2 <= {FRAME_STATUS_WIDTH{1'b0}};
      end else begin
         frame_status_d1 <= frame_status;
         frame_status_d2 <= frame_status_d1;
      end
   end

   pipeline #(
      .DW        (NUM_INTERFACES),
      .DELAYS    (4)
   ) u_trigger_event_pipe  (
      .clk       (clk_st),
      .reset_n   (rst_st_n),
      .datain    (trigger_event),
      .dataout   (trigger_event_d)
   );
 
 // Instantiate the DFD_SS_Registers module
    DFD_SS_Registers u_DFD_SS_Registers (
        // Outputs
        .dsp_start_capture_dsp_capture_start			(capture_start									),//output reg
        .dsp_start_capture_dsp_trigger_based_capture	(trigger_based_capture_w							),//output reg
        .dsp_start_capture_dsp_frame_based_capture		(frame_based_capture_w							),//output reg
        .dsp_ss_sel_subsystem_select					(subsystem_sel									),//output reg [31:0]//subsystem_select
        .dsp_channel_sel_channel_number_select			(channel_sel									),//output reg [31:0]//channel_number_select
        .dsp_subframe_config_sample_select				(config_sample_select							),//output reg [14:0]
        .dsp_subframe_config_symbol_select				(config_symbol_select							),//output reg [4:0]
        .dsp_subframe_config_subframe_select			(config_subframe_select							),//output reg [3:0]
        .dsp_frame_config_radio_frame_select			(config_radio_frame_select						),//output reg [9:0]
        .dsp_interface_sel_interface_select				(interface_sel									),//output reg [31:0]
        // Inputs
        .clk											(clk_csr										),//input wire
        .reset											(~rst_csr_n										),//input wire
        .writedata										(csr_writedata									),//input wire [31:0]
        .read											(csr_read										),//input wire
        .write											(csr_write										),//input wire
        .byteenable										(4'b1111										),//input wire[3:0]	
        .readdata										(csr_readdata									),//output reg [31:0]
        .readdatavalid									(csr_readdatavalid								),//output reg
        .address										({csr_address[3:0],2'b00}						)//input   [4:0]
    );
	
	/* assign capture_ctrl = {29'b0,capture_start,trigger_based_capture_w,frame_based_capture_w};
	assign frame_config = {22'b0,config_radio_frame_select};
	assign subframe_config = { 8'b0, config_subframe_select, config_symbol_select, config_sample_select};
	assign byte_slice_idx_sel = 32'b0;
	 */
	assign capture_ctrl = {29'b0,frame_based_capture_w,trigger_based_capture_w,capture_start};
	assign frame_config = {22'b0,config_radio_frame_select};
	//assign subframe_config = {8'b0,config_sample_select,config_symbol_select,config_subframe_select};
	assign subframe_config = { 8'b0, config_subframe_select, config_symbol_select, config_sample_select};
	 
// //Register interface decoding
   // always @ (posedge clk_csr) begin
      // if (~rst_csr_n) begin
         // csr_readdata_reg   <= {CSR_DATAWIDTH{1'b0}};
         // capture_ctrl       <= {CSR_DATAWIDTH{1'b0}};
         // interface_sel      <= {CSR_DATAWIDTH{1'b0}};
         // channel_sel        <= {CSR_DATAWIDTH{1'b0}};
         // byte_slice_idx_sel <= {CSR_DATAWIDTH{1'b0}};
         // frame_config       <= {CSR_DATAWIDTH{1'b0}};
         // subframe_config    <= {CSR_DATAWIDTH{1'b0}};
		 // subsystem_sel      <= {CSR_DATAWIDTH{1'b0}};
      // end else begin
         // case (csr_address)
            // 3'd0: begin
                     // if (csr_write)
                        // capture_ctrl <= csr_writedata;
                     // else if (csr_read)
                        // csr_readdata_reg <= capture_ctrl;
                  // end 
		    // 3'd1: begin
                     // if (csr_write)
                        // subsystem_sel  <= csr_writedata;
                     // else if (csr_read)
                        // csr_readdata_reg <= subsystem_sel;
                  // end
            // 3'd2: begin
                     // if (csr_write)
                        // channel_sel  <= csr_writedata;
                     // else if (csr_read)
                        // csr_readdata_reg <= channel_sel;
                  // end 
             
            // 3'd3: begin
                     // if (csr_write)
                        // subframe_config <= csr_writedata;
                     // else if (csr_read)
                        // csr_readdata_reg <= subframe_config;
                  // end 
            // 3'd4: begin
                     // if (csr_write)
                        // frame_config <= csr_writedata;
                     // else if (csr_read)
                        // csr_readdata_reg <= frame_config;
                  // end
             
            // 3'd5: begin
                     // if (csr_write)
                        // interface_sel  <= csr_writedata;
                     // else if (csr_read)
                        // csr_readdata_reg <= interface_sel;
                  // end				  
            // default: csr_readdata_reg <= {CSR_DATAWIDTH{1'b0}}; 
         // endcase
      // end
   // end

//CDC from clk_csr to clk_st (low to high cdc)
   always @ (posedge clk_st) begin
      if (~rst_st_n) begin
         capture_ctrl_st_d1       <= {CSR_DATAWIDTH{1'b0}};
         capture_ctrl_st_d2       <= {CSR_DATAWIDTH{1'b0}};     
         interface_sel_st_d1      <= {CSR_DATAWIDTH{1'b0}};
         interface_sel_st_d2      <= {CSR_DATAWIDTH{1'b0}};
         channel_sel_st_d1        <= {CSR_DATAWIDTH{1'b0}};
         channel_sel_st_d2        <= {CSR_DATAWIDTH{1'b0}};
         byte_slice_idx_sel_st_d1 <= {CSR_DATAWIDTH{1'b0}};
         byte_slice_idx_sel_st_d2 <= {CSR_DATAWIDTH{1'b0}};
         subframe_config_st_d1    <= {CSR_DATAWIDTH{1'b0}};
         subframe_config_st_d2    <= {CSR_DATAWIDTH{1'b0}};
         frame_config_st_d1       <= {CSR_DATAWIDTH{1'b0}};
         frame_config_st_d2       <= {CSR_DATAWIDTH{1'b0}};
		 subsystem_sel_st_d2      <= {CSR_DATAWIDTH{1'b0}};
		 subsystem_sel_st_d2      <= {CSR_DATAWIDTH{1'b0}};
      end else begin
         capture_ctrl_st_d1       <= capture_ctrl; 
         capture_ctrl_st_d2       <= capture_ctrl_st_d1;
         interface_sel_st_d1      <= interface_sel;
         interface_sel_st_d2      <= interface_sel_st_d1;
         channel_sel_st_d1        <= channel_sel;
         channel_sel_st_d2        <= channel_sel_st_d1;
         byte_slice_idx_sel_st_d1 <= byte_slice_idx_sel;
         byte_slice_idx_sel_st_d2 <= byte_slice_idx_sel_st_d1;
         subframe_config_st_d1    <= subframe_config;
         subframe_config_st_d2    <= subframe_config_st_d1;
         frame_config_st_d1       <= frame_config;
         frame_config_st_d2       <= frame_config_st_d1	;
		 subsystem_sel_st_d1      <= subsystem_sel     	;
		 subsystem_sel_st_d2      <= subsystem_sel_st_d1;
      end
   end

//Frame boundary selection
   always @ (posedge clk_st) begin
      if (~rst_st_n) begin
         radioframe_sel <= 1'b0;
         subframe_sel   <= 1'b0;
         symbol_sel     <= 1'b0;
         sample_sel     <= 1'b0;
      end else begin
         radioframe_sel <= (capture_ctrl_st_d2[3] || (frame_config_st_d2[9:0] == frame_status_d2[54:45])); //10 bits // Masked with capture_ctrl[3]
         subframe_sel   <= (subframe_config_st_d2[23:20] == frame_status_d2[44:41]);  //4 bits
         symbol_sel     <= (subframe_config_st_d2[19:15] == frame_status_d2[40:36]);  //5 bits
         sample_sel     <= (subframe_config_st_d2[14:0] == frame_status_d2[30:16]);   //15 bits
      end
   end

   always @ (posedge clk_st) begin
      if (~rst_st_n) begin
         capture_boundary_sel_latch <= 1'b0;
      end else begin
         if (radioframe_sel && subframe_sel && symbol_sel && sample_sel)
            capture_boundary_sel_latch <= capture_ctrl_st_d2[0];
         else if (~capture_ctrl_st_d2[0])
            capture_boundary_sel_latch <= 1'b0;
      end
   end
/*
//Interface selection 
   always @ (posedge clk_st) begin
      if (~rst_st_n) begin
         avst_selctd_intf_shift_valid <= {NUM_INTERFACES{1'b0}};
         avst_selctd_intf_shift_data  <= {NUM_INTERFACES*DATAWIDTH{1'b0}};
         avst_selctd_intf_shift_chan  <= {NUM_INTERFACES*CHANNEL_WIDTH{1'b0}};
         trigger_event_selctd         <= {NUM_INTERFACES{1'b0}};
      end else begin
         avst_selctd_intf_shift_valid <= avst_sink_valid_2d >> interface_sel_st_d2[NUM_INTERFACES_LOG2-1:0];
         avst_selctd_intf_shift_data  <= avst_sink_data_2d >> (interface_sel_st_d2[NUM_INTERFACES_LOG2-1:0]*DATAWIDTH);
         avst_selctd_intf_shift_chan  <= avst_sink_channel_2d >> (interface_sel_st_d2[NUM_INTERFACES_LOG2-1:0]*CHANNEL_WIDTH);
         trigger_event_selctd         <= trigger_event_d >> interface_sel_st_d2[NUM_INTERFACES_LOG2-1:0];
      end
   end
*/



   always @ (posedge clk_st) begin
      if (~rst_st_n) begin
         avst_selctd_intf_valid <= 1'b0;
         avst_selctd_intf_data  <= {DATAWIDTH{1'b0}};
         avst_selctd_intf_chan  <= {CHANNEL_WIDTH{1'b0}};
      end else if (subsystem_sel_st_d2[0] == 1'b1) begin
         avst_selctd_intf_valid <= avst_sink_valid_2d[0]       ;
         avst_selctd_intf_data  <= avst_sink_data_2d[31:0]     ;
         avst_selctd_intf_chan  <= avst_sink_channel_2d[2:0]   ;
      end
	  else  begin
         avst_selctd_intf_valid <= avst_sink_valid_2d[1]    	;
         avst_selctd_intf_data  <= avst_sink_data_2d[63:32]     ;
         avst_selctd_intf_chan  <= avst_sink_channel_2d[5:3]  	;
      end
   end

//Channel selection
   always @ (posedge clk_st) begin
      if (~rst_st_n) begin
         avst_selctd_chan_data  <= {DATAWIDTH{1'b0}};
         avst_selctd_chan_valid <= 1'b0;
      end else begin
         if (avst_selctd_intf_valid && (avst_selctd_intf_chan == channel_sel_st_d2[CHANNEL_WIDTH-1:0])) begin
            avst_selctd_chan_data  <= avst_selctd_intf_data;
            avst_selctd_chan_valid <= 1'b1;
         end else begin
            avst_selctd_chan_data  <= {DATAWIDTH{1'b0}};
            avst_selctd_chan_valid <= 1'b0;
         end
      end
   end

//Byte slice selection
   assign avst_selctd_chan_shift_data = avst_selctd_chan_data >> (byte_slice_idx_sel_st_d2[NUM_IQ_IN_INPUT_LOG2-1:0]*IQ_DATAWIDTH);

   always @ (posedge clk_st) begin
      if (~rst_st_n) begin
         avst_selctd_slice_data  <= {IQ_DATAWIDTH{1'b0}};
         avst_selctd_slice_valid <= 1'b0;
      end else begin
         avst_selctd_slice_data  <= avst_selctd_chan_shift_data[IQ_DATAWIDTH-1:0];
         avst_selctd_slice_valid <= avst_selctd_chan_valid;
      end
   end

   always @ (posedge clk_st) begin
      if (~rst_st_n) begin
         capture_trigger <= 1'b0;
      end else begin
         if (trigger_event_selctd[0])
            capture_trigger <= 1'b1;
         else if (~capture_ctrl_st_d2[0])
            capture_trigger <= 1'b0;
      end
   end

   assign capture_trigger_wire = (TRIGGER_BASED_CAPTURE=='b1 && capture_ctrl_st_d2[1]) ? capture_trigger : 1'b1;    //Trigger based capture
   assign frame_trigger_wire = (FRAME_BASED_CAPTURE=='b1 && capture_ctrl_st_d2[2]) ? capture_boundary_sel_latch : 1'b1;  //Frame boundary based capture

//Capture start gate
   always @ (posedge clk_st) begin
      if (~rst_st_n) begin
         avst_capture_data  <= {IQ_DATAWIDTH{1'b0}};
         avst_capture_valid <= 1'b0;
      end else begin
         if (capture_ctrl_st_d2[0] && frame_trigger_wire && capture_trigger_wire) begin
            avst_capture_data  <= avst_selctd_slice_data;
            avst_capture_valid <= avst_selctd_slice_valid;
         end else begin
            avst_capture_data  <= {IQ_DATAWIDTH{1'b0}};
            avst_capture_valid <= 1'b0;
         end
      end
   end

   assign cdc_ff_aclr = ~capture_ctrl_st_d2[0];  //ensuring cdc fifo is always cleared between various captures
   assign cdc_ff_wrreq = avst_capture_valid && ~cdc_ff_wrfull; 
   assign cdc_ff_data = avst_capture_data;
   assign cdc_ff_rdreq = ~cdc_ff_rdempty && avst_src_ready;

//CDC to DMA clock domain
   dcfifo_mixed_widths u_cdc_fifo (               
      .aclr       (cdc_ff_aclr), 
      .wrclk      (clk_st),           
      .wrreq      (cdc_ff_wrreq),          
      .data       (cdc_ff_data),          
      .rdclk      (clk_dma),  
      .rdreq      (cdc_ff_rdreq),          
      .q          (cdc_ff_q),          
      .rdfull     (cdc_ff_rdfull),
      .rdempty    (cdc_ff_rdempty),          
      .rdusedw    (),        
      .wrfull     (cdc_ff_wrfull),          
      .wrempty    (cdc_ff_wrempty),
      .wrusedw    (),
      .eccstatus  ()             
   );
   defparam
       u_cdc_fifo.enable_ecc  = "FALSE",
       u_cdc_fifo.intended_device_family  = "Agilex",
       u_cdc_fifo.lpm_hint  = "DISABLE_DCFIFO_EMBEDDED_TIMING_CONSTRAINT=TRUE",
       u_cdc_fifo.lpm_numwords  = CDC_DATA_FIFO_DEPTH,
       u_cdc_fifo.lpm_showahead  = "OFF",
       u_cdc_fifo.lpm_type  = "dcfifo_mixed_widths",
       u_cdc_fifo.lpm_width  = IQ_DATAWIDTH,
       u_cdc_fifo.lpm_widthu  = CDC_DATA_FIFO_WUSEDW,
       u_cdc_fifo.lpm_widthu_r  = CDC_DATA_FIFO_RUSEDW,
       u_cdc_fifo.lpm_width_r  = DMA_DATAWIDTH,
       u_cdc_fifo.overflow_checking  = "ON",
       u_cdc_fifo.rdsync_delaypipe  = 5,
       u_cdc_fifo.read_aclr_synch  = "OFF",
       u_cdc_fifo.underflow_checking  = "ON",
       u_cdc_fifo.use_eab  = "ON",
       u_cdc_fifo.write_aclr_synch  = "ON",
       u_cdc_fifo.wrsync_delaypipe  = 5;

   always @ (posedge clk_dma) begin
      if (~rst_dma_n) begin
         capture_ctrl_dma_d1 <= 1'b0;
         capture_ctrl_dma_d2 <= 1'b0;
      end else begin
         capture_ctrl_dma_d1 <= capture_ctrl[0];
         capture_ctrl_dma_d2 <= capture_ctrl_dma_d1;
      end
   end


genvar j;
generate
  for (j=0; j<NO_OF_BYTES; j=j+1)
   always @ (posedge clk_dma) begin
      if (~rst_dma_n) begin
         cdc_ff_q_d[(j*8)+7:(j*8)]         <= {DMA_DATAWIDTH{1'b0}};
         cdc_ff_rdreq_d1 <= 1'b0;
         cdc_ff_rdreq_d2 <= 1'b0;
      end else begin
         if (avst_src_ready) begin
            cdc_ff_q_d[(j*8)+7:(j*8)]      <= cdc_ff_q[DMA_DATAWIDTH-1-(j*8):DMA_DATAWIDTH-8-(j*8)];  // byte swapping
            cdc_ff_rdreq_d1 <= cdc_ff_rdreq;
            cdc_ff_rdreq_d2 <= cdc_ff_rdreq_d1;
         end else if (~capture_ctrl_dma_d2) begin
            cdc_ff_q_d[(j*8)+7:(j*8)]      <= {DMA_DATAWIDTH{1'b0}};
            cdc_ff_rdreq_d1 <= 1'b0;
            cdc_ff_rdreq_d2 <= 1'b0;
         end
      end
   end
 endgenerate  
 


//Output signals
//
assign avst_src_valid = cdc_ff_rdreq_d2; 
assign avst_src_data  = cdc_ff_q_d; 
// assign csr_readdata = csr_readdata_reg; 

// ---------   Code Ends Here --------- //
endmodule
