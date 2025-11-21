module tx_dma_read_master #(
		parameter DATA_WIDTH                = 128,
		parameter LENGTH_WIDTH              = 14,
		parameter FIFO_DEPTH                = 256,
		parameter STRIDE_ENABLE             = 0,
		parameter BURST_ENABLE              = 1,
		parameter PACKET_ENABLE             = 1,
		parameter ERROR_ENABLE              = 1,
		parameter ERROR_WIDTH               = 1,
		parameter CHANNEL_ENABLE            = 0,
		parameter CHANNEL_WIDTH             = 8,
		parameter BYTE_ENABLE_WIDTH         = 16,
		parameter BYTE_ENABLE_WIDTH_LOG2    = 4,
		parameter ADDRESS_WIDTH             = 37,
		parameter FIFO_DEPTH_LOG2           = 8,
		parameter SYMBOL_WIDTH              = 8,
		parameter NUMBER_OF_SYMBOLS         = 16,
		parameter NUMBER_OF_SYMBOLS_LOG2    = 4,
		parameter MAX_BURST_COUNT_WIDTH     = 5,
		parameter UNALIGNED_ACCESSES_ENABLE = 1,
		parameter ONLY_FULL_ACCESS_ENABLE   = 0,
		parameter BURST_WRAPPING_SUPPORT    = 1,
		parameter PROGRAMMABLE_BURST_ENABLE = 0,
		parameter MAX_BURST_COUNT           = 16,
		parameter FIFO_SPEED_OPTIMIZATION   = 1,
		parameter STRIDE_WIDTH              = 1
	) (
		input  wire         clk,                  //            Clock.clk
		input  wire         reset,                //      Clock_reset.reset
		output wire [36:0]  master_address,       // Data_Read_Master.address
		output wire         master_read,          //                 .read
		output wire [15:0]  master_byteenable,    //                 .byteenable
		input  wire [127:0] master_readdata,      //                 .readdata
		input  wire         master_waitrequest,   //                 .waitrequest
		input  wire         master_readdatavalid, //                 .readdatavalid
		output wire [4:0]   master_burstcount,    //                 .burstcount
		output wire [127:0] src_data,             //      Data_Source.data
		output wire         src_valid,            //                 .valid
		input  wire         src_ready,            //                 .ready
		output wire         src_sop,              //                 .startofpacket
		output wire         src_eop,              //                 .endofpacket
		output wire [3:0]   src_empty,            //                 .empty
		output wire         src_error,            //                 .error
		input  wire [255:0] snk_command_data,     //     Command_Sink.data
		input  wire         snk_command_valid,    //                 .valid
		output wire         snk_command_ready,    //                 .ready
		output wire [255:0] src_response_data,    //  Response_Source.data
		output wire         src_response_valid,   //                 .valid
		input  wire         src_response_ready    //                 .ready
	);
endmodule

