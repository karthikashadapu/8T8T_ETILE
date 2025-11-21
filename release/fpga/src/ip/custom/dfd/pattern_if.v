// ================================================================================

//Description:  Injection buffer
//              This module is called inject buffer as it can inject the data to any desired interface.
//		The DDR data is read through read MSGDMA (DDR controller) and passed as input to this block. 
//		After receiving the straming data from  rdDMA this block will process it in following way - 
//              1. Pass the DDR data through DCFIFO 
//              2. Output data should be continuous if ready from source is high
//              3. Valid always high 
//              3. 

`timescale 1 ns / 1 ps

module pattern_if
(
	clk_inj,         	//expected 491.52 MHz 
	rst_inj_n,

	clk_dma,        	//expected 250-300 MHz based on FPGA speed grade/DDR part	
	rst_dma_n,

	clk_csr,	        //expected 100 MHz based on typical usecase
	rst_csr_n,

	avst_sink_valid,
	avst_sink_data,		//Data from DDR
	avst_sink_ready,

	avst_src_valid,
	avst_src_data,		//Data to be injected
	avst_src_ready,

	csr_address,           //AVMM signals for register read/write
	csr_write,
	csr_read,
	csr_writedata,
	csr_readdata

);

   // ---------  Parameter defination  ---------------------------------

   parameter 			DMA_DATAWIDTH     	= 512;
   parameter 			DMA_CLK_mHZ       	= 300;
   parameter 			INJ_DATAWIDTH     	= 64;
   parameter 			INJ_CLK_mHZ       	= 491.52;
   parameter 			DMA_BURST_LENGTH  	= 64;   // burst length = Number of clock cycle for which data will come uninterrupted (without valid getting low)
   parameter 			CSR_DATAWIDTH 	  	= 32;
   parameter 			CSR_ADDRWIDTH     	= 3;

  //--------------------  Clocks and reset ----------------------------------------
   input  wire                                          clk_inj;         
   input  wire                                          rst_inj_n;

   input  wire                                          clk_dma;        	
   input  wire                                          rst_dma_n;

   input  wire                                          clk_csr;        
   input  wire                                          rst_csr_n;


  //-------------------AVST Sink - Data from DDR--------------------------------------
   input  wire                       			avst_sink_valid;
   input  wire [DMA_DATAWIDTH-1:0]            		avst_sink_data;		
   output wire  					avst_sink_ready;

  //------------------AVST Source - Data to be injected------------------------------
   output wire                                           avst_src_valid;
   output wire [INJ_DATAWIDTH-1:0]                       avst_src_data;		
   input  wire                                           avst_src_ready;

//-------------------- AVMM signals ------------------------------------------------
   input  wire [CSR_ADDRWIDTH-1:0]                       csr_address;
   input  wire                                           csr_write;
   input  wire                                           csr_read;
   input  wire [CSR_DATAWIDTH-1:0]                       csr_writedata;
   output reg  [CSR_DATAWIDTH-1:0]                       csr_readdata;


  //----------- Calculation for FIFO DEPTH -----------------
   localparam                  DMA_CLK_PERIOD      = (1000)/(DMA_CLK_mHZ) ;                  // DMA CLOCK period in ns
   localparam                  INJ_CLK_PERIOD      = (1000)/(INJ_CLK_mHZ) ;                 //  INJ CLOCK period in ns
   localparam                  INJ_BURST_LENGTH    = (DMA_BURST_LENGTH*DMA_DATAWIDTH*DMA_CLK_PERIOD)/(INJ_DATAWIDTH*INJ_CLK_PERIOD);
   localparam                  Time_of_data_write  = DMA_BURST_LENGTH * DMA_CLK_PERIOD; // Time (ns) required to write all data in a burst  
   localparam                  Time_of_data_read   = INJ_BURST_LENGTH * INJ_CLK_PERIOD; // Time (ns) required to read all data in a burst

  //-------------- $ceil(x) = rounds x to the nearest integer greater than or equal to that element------------------------
   localparam                  CDC_DATA_FIFO_DEPTH = $rtoi($ceil((Time_of_data_read - Time_of_data_write)/DMA_CLK_PERIOD)+16); // Minimum depth of the FIFO - w.r.t write datawidth

  // ---------  Variable Declaration  ------------------------

   localparam                  CDC_DATA_FIFO_RUSEDW = $clog2(CDC_DATA_FIFO_DEPTH*DMA_DATAWIDTH/INJ_DATAWIDTH);
   localparam                  CDC_DATA_FIFO_WUSEDW = $clog2(CDC_DATA_FIFO_DEPTH*DMA_DATAWIDTH/DMA_DATAWIDTH);

  //------------ Local signals -----------------------------
   reg                          	avst_sink_valid_1d, avst_sink_valid_2d;
   reg   [DMA_DATAWIDTH-1:0]    	avst_sink_data_1d, avst_sink_data_2d;
   wire                         	cdc_aclr, cdc_wrreq, cdc_rdreq;
   wire                         	cdc_rdfull, cdc_rdempty, cdc_wrfull, cdc_wrempty;
   wire  [DMA_DATAWIDTH-1:0]    	cdc_data;
   wire  [INJ_DATAWIDTH-1:0]    	cdc_q;
   reg   [INJ_DATAWIDTH-1:0]    	cdc_q_d;
   reg                          	cdc_rdreq_d1, cdc_rdreq_d2;

   reg   [CSR_DATAWIDTH-1:0]    	cnt_fifo_full, cnt_fifo_empty, cnt_word_read;
   reg   [CSR_DATAWIDTH-1:0]    	cnt_fifo_full1d, cnt_fifo_full2d, cnt_fifo_empty1d, cnt_fifo_empty2d, cnt_word_read1d, cnt_word_read2d;
   reg 			        	fifo_full, fifo_empty;
   wire  [CDC_DATA_FIFO_RUSEDW-1:0]	rdusedw;

   wire  [CDC_DATA_FIFO_WUSEDW-1:0]	wrusedw; 

   reg 	 [CDC_DATA_FIFO_WUSEDW-1:0] 	wrusedw1d, wrusedw2d;
   reg 	 [CDC_DATA_FIFO_RUSEDW-1:0] 	rdusedw1d, rdusedw2d;
  
   wire					fifo_almost_full;
   reg					fifo_almost_full1d, fifo_almost_full2d;


   assign fifo_almost_full   =  (wrusedw >= ((2**CDC_DATA_FIFO_WUSEDW)-4)) ? 1'b1 : 1'b0;
   assign avst_sink_ready    =  ~fifo_almost_full;
   assign cdc_aclr	     =	~rst_dma_n || ~rst_inj_n;     // Soft reset
   assign cdc_wrreq 	     = 	avst_sink_valid_2d && ~fifo_almost_full2d; 
   assign cdc_data 	     = 	avst_sink_data_2d;
   assign cdc_rdreq 	     = 	~cdc_rdempty && avst_src_ready;

 // Rising Edge detector - FIFO FUll
   always@(posedge clk_inj)
   begin
      if(~rst_inj_n) 
	fifo_empty  <= 1'b1;
      else 
	fifo_empty <= cdc_rdempty;  
   end

 // Rising Edge detector - FIFO Empty
  always@(posedge clk_dma)
   begin
      if(~rst_dma_n) 
	fifo_full  <= 1'b0;
      else 
	fifo_full <= fifo_almost_full;  
   end

/// Counter - Read clk domain
always @ (posedge clk_inj) begin
         if (~rst_inj_n) begin
         	cnt_fifo_empty    <= {CSR_DATAWIDTH{1'b0}};
         	cnt_word_read     <= {CSR_DATAWIDTH{1'b0}};
	  end else if (cdc_rdempty & ~fifo_empty) 
	   	cnt_fifo_empty <= cnt_fifo_empty + 1'd1;
	  else if (cdc_rdreq) begin
	   	cnt_word_read  <= cnt_word_read + 1'd1;
      end
   end

/// Counter - Write clk domain
always @ (posedge clk_dma) begin
         if (~rst_dma_n) 
         	cnt_fifo_full     <= {CSR_DATAWIDTH{1'b0}};
         else if (fifo_almost_full & ~fifo_full) 
	   	cnt_fifo_full  <= cnt_fifo_full + 1'd1;
   end

//CDC from clk_inj and  clk_dma to clk_csr (low to high cdc)
   always @ (posedge clk_csr) begin
      if (~rst_csr_n) begin
         cnt_fifo_full1d       <= {CSR_DATAWIDTH{1'b0}};
         cnt_fifo_full2d       <= {CSR_DATAWIDTH{1'b0}};     
         cnt_fifo_empty1d      <= {CSR_DATAWIDTH{1'b0}};
         cnt_fifo_empty2d      <= {CSR_DATAWIDTH{1'b0}};
         cnt_word_read1d       <= {CSR_DATAWIDTH{1'b0}};
         cnt_word_read2d       <= {CSR_DATAWIDTH{1'b0}};
         rdusedw1d 	       <= {CDC_DATA_FIFO_RUSEDW{1'b0}};
         rdusedw2d 	       <= {CDC_DATA_FIFO_RUSEDW{1'b0}};
         wrusedw1d             <= {CDC_DATA_FIFO_WUSEDW{1'b0}};
         wrusedw2d             <= {CDC_DATA_FIFO_WUSEDW{1'b0}};
      end else begin
         cnt_fifo_full1d       <= cnt_fifo_full; 
         cnt_fifo_full2d       <= cnt_fifo_full1d;
         cnt_fifo_empty1d      <= cnt_fifo_empty;
         cnt_fifo_empty2d      <= cnt_fifo_empty1d;
         cnt_word_read1d       <= cnt_word_read;
         cnt_word_read2d       <= cnt_word_read1d;
         rdusedw1d 	       <= rdusedw;
         rdusedw2d             <= rdusedw1d;
         wrusedw1d             <= wrusedw;
         wrusedw2d             <= wrusedw1d;
      end
   end

//AVMM read  
   always @ (posedge clk_csr) begin
      if (~rst_csr_n) begin
         csr_readdata      <= {CSR_DATAWIDTH{1'b0}};
      end else if (csr_read) begin
         case (csr_address)
            3'd0: csr_readdata 	  <= cnt_fifo_full2d;
            3'd1: csr_readdata 	  <= cnt_fifo_empty2d;
	    3'd2: csr_readdata 	  <= cnt_word_read2d;
     	    3'd3: csr_readdata 	  <= {{(CSR_DATAWIDTH-CDC_DATA_FIFO_RUSEDW){1'b0}},rdusedw2d};
	    3'd4: csr_readdata 	  <= {{(CSR_DATAWIDTH-CDC_DATA_FIFO_WUSEDW){1'b0}},wrusedw2d};
            default: csr_readdata <= {CSR_DATAWIDTH{1'b0}}; 
         endcase
	end
     end

 
always @ (posedge clk_dma) begin
      if (~rst_dma_n) begin
         avst_sink_valid_1d   <= 1'b0;
         avst_sink_valid_2d   <= 1'b0;
         avst_sink_data_1d    <= {DMA_DATAWIDTH{1'b0}};
         avst_sink_data_2d    <= {DMA_DATAWIDTH{1'b0}};
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
      .wrclk      (clk_dma),           
      .wrreq      (cdc_wrreq),          
      .data       (cdc_data),          
      .rdclk      (clk_inj),  
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
       cdc_fifo.lpm_width  = DMA_DATAWIDTH,
       cdc_fifo.lpm_widthu  = CDC_DATA_FIFO_WUSEDW,
       cdc_fifo.lpm_widthu_r  = CDC_DATA_FIFO_RUSEDW,
       cdc_fifo.lpm_width_r  = INJ_DATAWIDTH,
       cdc_fifo.overflow_checking  = "ON",
       cdc_fifo.rdsync_delaypipe  = 5,
       cdc_fifo.read_aclr_synch  = "OFF",
       cdc_fifo.underflow_checking  = "ON",
       cdc_fifo.use_eab  = "ON",
       cdc_fifo.write_aclr_synch  = "OFF",
       cdc_fifo.wrsync_delaypipe  = 5;

   always @ (posedge clk_inj) begin
      if (~rst_inj_n) begin
         cdc_q_d      <= {INJ_DATAWIDTH{1'b0}};
         cdc_rdreq_d1 <= 1'b0;
         cdc_rdreq_d2 <= 1'b0;
      end else if (avst_src_ready) begin
            cdc_q_d      <= cdc_q;
            cdc_rdreq_d1 <= cdc_rdreq;
            cdc_rdreq_d2 <= cdc_rdreq_d1;
       end else begin
			cdc_q_d      <= {INJ_DATAWIDTH{1'b0}};
            cdc_rdreq_d1 <= 1'b0;
            cdc_rdreq_d2 <= 1'b0;
      end
   end
//Output signals
//
assign avst_src_valid = cdc_rdreq_d2; 
assign avst_src_data  = cdc_q_d; 


// ---------   Code Ends Here --------- //
endmodule
