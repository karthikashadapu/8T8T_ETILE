module dxc_ss_top_ddc_model_DUT_0 (
		input  wire        clk,                   //           clock.clk
		input  wire        areset,                //     clock_reset.reset
		input  wire        bus_clk,               //       bus_clock.clk
		input  wire        bus_areset,            // bus_clock_reset.reset
		input  wire [13:0] busIn_address,         //             bus.address
		input  wire [0:0]  busIn_read,            //                .read
		input  wire [0:0]  busIn_write,           //                .write
		input  wire [31:0] busIn_writedata,       //                .writedata
		output wire [31:0] busOut_readdata,       //                .readdata
		output wire [0:0]  busOut_readdatavalid,  //                .readdatavalid
		output wire [0:0]  busOut_waitrequest,    //                .waitrequest
		input  wire [0:0]  DDC_Valid_In_s,        //             exp.valid_DDC_Valid_In_s
		input  wire [7:0]  DDC_Chan_In_s,         //                .channel_DDC_Chan_In_s
		input  wire [31:0] DDC_Ant_Data_In_0im,   //                .data_DDC_Ant_Data_In_0im
		input  wire [31:0] DDC_Ant_Data_In_0re,   //                .data_DDC_Ant_Data_In_0re
		input  wire [31:0] DDC_Ant_Data_In_1im,   //                .data_DDC_Ant_Data_In_1im
		input  wire [31:0] DDC_Ant_Data_In_1re,   //                .data_DDC_Ant_Data_In_1re
		input  wire [31:0] DDC_Ant_Data_In_2im,   //                .data_DDC_Ant_Data_In_2im
		input  wire [31:0] DDC_Ant_Data_In_2re,   //                .data_DDC_Ant_Data_In_2re
		input  wire [31:0] DDC_Ant_Data_In_3im,   //                .data_DDC_Ant_Data_In_3im
		input  wire [31:0] DDC_Ant_Data_In_3re,   //                .data_DDC_Ant_Data_In_3re
		input  wire [0:0]  DDC_NCO_sync_0,        //                .data_DDC_NCO_sync_0
		input  wire [0:0]  DDC_NCO_sync_1,        //                .data_DDC_NCO_sync_1
		input  wire [0:0]  DDC_NCO_sync_2,        //                .data_DDC_NCO_sync_2
		input  wire [0:0]  DDC_NCO_sync_3,        //                .data_DDC_NCO_sync_3
		input  wire [7:0]  BW_Config_CC1_s,       //                .data_BW_Config_CC1_s
		input  wire [31:0] DDC_Const_Data_In_0im, //                .data_DDC_Const_Data_In_0im
		input  wire [31:0] DDC_Const_Data_In_0re, //                .data_DDC_Const_Data_In_0re
		input  wire [31:0] DDC_Const_Data_In_1im, //                .data_DDC_Const_Data_In_1im
		input  wire [31:0] DDC_Const_Data_In_1re, //                .data_DDC_Const_Data_In_1re
		input  wire [31:0] DDC_Const_Data_In_2im, //                .data_DDC_Const_Data_In_2im
		input  wire [31:0] DDC_Const_Data_In_2re, //                .data_DDC_Const_Data_In_2re
		input  wire [31:0] DDC_Const_Data_In_3im, //                .data_DDC_Const_Data_In_3im
		input  wire [31:0] DDC_Const_Data_In_3re, //                .data_DDC_Const_Data_In_3re
		input  wire [0:0]  DDC_Const_Data_sel_s,  //                .data_DDC_Const_Data_sel_s
		output wire [15:0] ddc_l1_dout_im,        //                .data_ddc_l1_dout_im
		output wire [15:0] ddc_l1_dout_re,        //                .data_ddc_l1_dout_re
		output wire [0:0]  ddc_l1_vout_s,         //                .valid_ddc_l1_vout_s
		output wire [7:0]  ddc_l1_cout_s,         //                .channel_ddc_l1_cout_s
		output wire [15:0] mixer_l1_dout_0im,     //                .data_mixer_l1_dout_0im
		output wire [15:0] mixer_l1_dout_0re,     //                .data_mixer_l1_dout_0re
		output wire [15:0] mixer_l1_dout_1im,     //                .data_mixer_l1_dout_1im
		output wire [15:0] mixer_l1_dout_1re,     //                .data_mixer_l1_dout_1re
		output wire [15:0] mixer_l1_dout_2im,     //                .data_mixer_l1_dout_2im
		output wire [15:0] mixer_l1_dout_2re,     //                .data_mixer_l1_dout_2re
		output wire [15:0] mixer_l1_dout_3im,     //                .data_mixer_l1_dout_3im
		output wire [15:0] mixer_l1_dout_3re,     //                .data_mixer_l1_dout_3re
		output wire [0:0]  mixer_l1_vout_s,       //                .valid_mixer_l1_vout_s
		output wire [7:0]  mixer_l1_cout_s        //                .channel_mixer_l1_cout_s
	);
endmodule

