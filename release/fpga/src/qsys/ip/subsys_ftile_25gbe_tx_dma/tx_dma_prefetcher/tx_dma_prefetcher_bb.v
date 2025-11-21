module tx_dma_prefetcher #(
		parameter ADDRESS_WIDTH            = 37,
		parameter RESPONSE_FIFO_DEPTH      = 256,
		parameter RESPONSE_FIFO_DEPTH_LOG2 = 8
	) (
		input  wire         clk,                         //                              Clock.clk
		input  wire         reset,                       //                        Clock_reset.reset
		output wire [36:0]  mm_read_address,             //             Descriptor_Read_Master.address
		output wire         mm_read_read,                //                                   .read
		input  wire [127:0] mm_read_readdata,            //                                   .readdata
		input  wire         mm_read_waitrequest,         //                                   .waitrequest
		input  wire         mm_read_readdatavalid,       //                                   .readdatavalid
		output wire [2:0]   mm_read_burstcount,          //                                   .burstcount
		output wire [36:0]  mm_write_address,            //            Descriptor_Write_Master.address
		output wire         mm_write_write,              //                                   .write
		output wire [15:0]  mm_write_byteenable,         //                                   .byteenable
		output wire [127:0] mm_write_writedata,          //                                   .writedata
		input  wire         mm_write_waitrequest,        //                                   .waitrequest
		input  wire [1:0]   mm_write_response,           //                                   .response
		input  wire         mm_write_writeresponsevalid, //                                   .writeresponsevalid
		output wire [255:0] st_src_descr_data,           // Descriptor_Write_Dispatcher_Source.data
		output wire         st_src_descr_valid,          //                                   .valid
		input  wire         st_src_descr_ready,          //                                   .ready
		input  wire [255:0] st_snk_data,                 //                      Response_Sink.data
		input  wire         st_snk_valid,                //                                   .valid
		output wire         st_snk_ready,                //                                   .ready
		input  wire [2:0]   mm_csr_address,              //                                Csr.address
		input  wire         mm_csr_read,                 //                                   .read
		input  wire         mm_csr_write,                //                                   .write
		input  wire [31:0]  mm_csr_writedata,            //                                   .writedata
		output wire [31:0]  mm_csr_readdata,             //                                   .readdata
		output wire         csr_irq                      //                            Csr_Irq.irq
	);
endmodule

