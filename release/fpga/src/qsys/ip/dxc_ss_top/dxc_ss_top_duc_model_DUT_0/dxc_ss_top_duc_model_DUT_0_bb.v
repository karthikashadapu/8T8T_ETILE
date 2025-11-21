module dxc_ss_top_duc_model_DUT_0 (
		input  wire        clk,                  //           clock.clk
		input  wire        areset,               //     clock_reset.reset
		input  wire        bus_clk,              //       bus_clock.clk
		input  wire        bus_areset,           // bus_clock_reset.reset
		input  wire [13:0] busIn_address,        //             bus.address
		input  wire [0:0]  busIn_read,           //                .read
		input  wire [0:0]  busIn_write,          //                .write
		input  wire [31:0] busIn_writedata,      //                .writedata
		output wire [31:0] busOut_readdata,      //                .readdata
		output wire [0:0]  busOut_readdatavalid, //                .readdatavalid
		output wire [0:0]  busOut_waitrequest,   //                .waitrequest
		input  wire [0:0]  DUC_Valid_l1_s,       //             exp.valid_DUC_Valid_l1_s
		input  wire [7:0]  DUC_Chan_l1_s,        //                .channel_DUC_Chan_l1_s
		input  wire [15:0] DUC_Data_l1_im,       //                .data_DUC_Data_l1_im
		input  wire [15:0] DUC_Data_l1_re,       //                .data_DUC_Data_l1_re
		input  wire [0:0]  DUC_NCO_sync_0,       //                .data_DUC_NCO_sync_0
		input  wire [0:0]  DUC_NCO_sync_1,       //                .data_DUC_NCO_sync_1
		input  wire [0:0]  DUC_NCO_sync_2,       //                .data_DUC_NCO_sync_2
		input  wire [0:0]  DUC_NCO_sync_3,       //                .data_DUC_NCO_sync_3
		input  wire [7:0]  BW_Config_CC1_s,      //                .data_BW_Config_CC1_s
		output wire [0:0]  DUC_Valid_Out_s,      //                .valid_DUC_Valid_Out_s
		output wire [7:0]  DUC_Chan_Out_s,       //                .channel_DUC_Chan_Out_s
		output wire [15:0] DUC_Data_Out_0im,     //                .data_DUC_Data_Out_0im
		output wire [15:0] DUC_Data_Out_0re,     //                .data_DUC_Data_Out_0re
		output wire [15:0] DUC_Data_Out_1im,     //                .data_DUC_Data_Out_1im
		output wire [15:0] DUC_Data_Out_1re,     //                .data_DUC_Data_Out_1re
		output wire [15:0] DUC_Data_Out_2im,     //                .data_DUC_Data_Out_2im
		output wire [15:0] DUC_Data_Out_2re,     //                .data_DUC_Data_Out_2re
		output wire [15:0] DUC_Data_Out_3im,     //                .data_DUC_Data_Out_3im
		output wire [15:0] DUC_Data_Out_3re,     //                .data_DUC_Data_Out_3re
		output wire [0:0]  duc_l1_vout_s,        //                .valid_duc_l1_vout_s
		output wire [7:0]  duc_l1_cout_s,        //                .channel_duc_l1_cout_s
		output wire [15:0] duc_l1_dout_0im,      //                .data_duc_l1_dout_0im
		output wire [15:0] duc_l1_dout_0re,      //                .data_duc_l1_dout_0re
		output wire [15:0] duc_l1_dout_1im,      //                .data_duc_l1_dout_1im
		output wire [15:0] duc_l1_dout_1re,      //                .data_duc_l1_dout_1re
		output wire [15:0] duc_l1_dout_2im,      //                .data_duc_l1_dout_2im
		output wire [15:0] duc_l1_dout_2re,      //                .data_duc_l1_dout_2re
		output wire [15:0] duc_l1_dout_3im,      //                .data_duc_l1_dout_3im
		output wire [15:0] duc_l1_dout_3re       //                .data_duc_l1_dout_3re
	);
endmodule

