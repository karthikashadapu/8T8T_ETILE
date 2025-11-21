module dxc_ss_top_ca_interp_DUT_0 (
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
		input  wire [15:0] DUC_Data_l1_0im,      //                .data_DUC_Data_l1_0im
		input  wire [15:0] DUC_Data_l1_0re,      //                .data_DUC_Data_l1_0re
		input  wire [15:0] DUC_Data_l1_1im,      //                .data_DUC_Data_l1_1im
		input  wire [15:0] DUC_Data_l1_1re,      //                .data_DUC_Data_l1_1re
		input  wire [15:0] DUC_Data_l1_2im,      //                .data_DUC_Data_l1_2im
		input  wire [15:0] DUC_Data_l1_2re,      //                .data_DUC_Data_l1_2re
		input  wire [15:0] DUC_Data_l1_3im,      //                .data_DUC_Data_l1_3im
		input  wire [15:0] DUC_Data_l1_3re,      //                .data_DUC_Data_l1_3re
		input  wire [0:0]  DUC_Valid_l2_s,       //                .valid_DUC_Valid_l2_s
		input  wire [7:0]  DUC_Chan_l2_s,        //                .channel_DUC_Chan_l2_s
		input  wire [15:0] DUC_Data_l2_0im,      //                .data_DUC_Data_l2_0im
		input  wire [15:0] DUC_Data_l2_0re,      //                .data_DUC_Data_l2_0re
		input  wire [15:0] DUC_Data_l2_1im,      //                .data_DUC_Data_l2_1im
		input  wire [15:0] DUC_Data_l2_1re,      //                .data_DUC_Data_l2_1re
		input  wire [15:0] DUC_Data_l2_2im,      //                .data_DUC_Data_l2_2im
		input  wire [15:0] DUC_Data_l2_2re,      //                .data_DUC_Data_l2_2re
		input  wire [15:0] DUC_Data_l2_3im,      //                .data_DUC_Data_l2_3im
		input  wire [15:0] DUC_Data_l2_3re,      //                .data_DUC_Data_l2_3re
		output wire [0:0]  DUC_Valid_Out_s,      //                .valid_DUC_Valid_Out_s
		output wire [7:0]  DUC_Chan_Out_s,       //                .channel_DUC_Chan_Out_s
		output wire [15:0] DUC_Ant_Data_Out_0im, //                .data_DUC_Ant_Data_Out_0im
		output wire [15:0] DUC_Ant_Data_Out_0re, //                .data_DUC_Ant_Data_Out_0re
		output wire [15:0] DUC_Ant_Data_Out_1im, //                .data_DUC_Ant_Data_Out_1im
		output wire [15:0] DUC_Ant_Data_Out_1re, //                .data_DUC_Ant_Data_Out_1re
		output wire [15:0] DUC_Ant_Data_Out_2im, //                .data_DUC_Ant_Data_Out_2im
		output wire [15:0] DUC_Ant_Data_Out_2re, //                .data_DUC_Ant_Data_Out_2re
		output wire [15:0] DUC_Ant_Data_Out_3im, //                .data_DUC_Ant_Data_Out_3im
		output wire [15:0] DUC_Ant_Data_Out_3re, //                .data_DUC_Ant_Data_Out_3re
		output wire [15:0] DUC_Ant_Data_Out_4im, //                .data_DUC_Ant_Data_Out_4im
		output wire [15:0] DUC_Ant_Data_Out_4re, //                .data_DUC_Ant_Data_Out_4re
		output wire [15:0] DUC_Ant_Data_Out_5im, //                .data_DUC_Ant_Data_Out_5im
		output wire [15:0] DUC_Ant_Data_Out_5re, //                .data_DUC_Ant_Data_Out_5re
		output wire [15:0] DUC_Ant_Data_Out_6im, //                .data_DUC_Ant_Data_Out_6im
		output wire [15:0] DUC_Ant_Data_Out_6re, //                .data_DUC_Ant_Data_Out_6re
		output wire [15:0] DUC_Ant_Data_Out_7im, //                .data_DUC_Ant_Data_Out_7im
		output wire [15:0] DUC_Ant_Data_Out_7re, //                .data_DUC_Ant_Data_Out_7re
		output wire [0:0]  summer_vout_s,        //                .valid_summer_vout_s
		output wire [7:0]  summer_cout_s,        //                .channel_summer_cout_s
		output wire [15:0] summer_dout_0im,      //                .data_summer_dout_0im
		output wire [15:0] summer_dout_0re,      //                .data_summer_dout_0re
		output wire [15:0] summer_dout_1im,      //                .data_summer_dout_1im
		output wire [15:0] summer_dout_1re,      //                .data_summer_dout_1re
		output wire [15:0] summer_dout_2im,      //                .data_summer_dout_2im
		output wire [15:0] summer_dout_2re,      //                .data_summer_dout_2re
		output wire [15:0] summer_dout_3im,      //                .data_summer_dout_3im
		output wire [15:0] summer_dout_3re       //                .data_summer_dout_3re
	);
endmodule

