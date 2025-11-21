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


// (C) 2001-2021 Intel Corporation. All rights reserved.
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



// (C) 2001-2020 Intel Corporation. All rights reserved.
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

// ==========================================================================
// ==========================================================================

// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on
module hssi_ss_phydirect_bridge #(
    parameter DATA_WIDTH    = 64,
    parameter PHY_DIRECT_DW = 80,
    parameter INST_100G_MODE = 0,
    parameter BYTE_WIDTH    = 8,
    parameter NUM_CHANNELS  = 1,
		parameter PHY_DIRECT_MODE = 1,
    parameter SIM_EMULATE   = 1
) (
   // ----------------------------------
   //PHY Direct Interface
   // ----------------------------------
   //input                 								app_ss_st_txphydirect_clk,
   //input                 								app_ss_st_txphydirect_areset_n,
   input  [PHY_DIRECT_DW-1:0]             app_ss_st_txphydirect_data,
   input                 									app_ss_st_txphydirect_valid,
   output                									ss_app_st_txphydirect_tready,
   //input  							                app_ss_st_rxphydirect_clk,
   //input  								              app_ss_st_rxphydirect_areset_n,
   output [PHY_DIRECT_DW-1:0]    					ss_app_st_rxphydirect_data,
   output                 								ss_app_st_rxphydirect_valid,
   // ----------------------------------
   // MII Interface
   // ----------------------------------
   output [DATA_WIDTH-1:0] 	               o_tx_mii_d, 
   output [BYTE_WIDTH-1:0] 	         		   o_tx_mii_c, 
   output  								                 o_tx_mii_valid,
   output  								                 o_tx_mii_am, 
   input  								                 i_tx_mii_ready,  
   input  [DATA_WIDTH-1:0] 			     			 i_rx_mii_d, 
   input  [BYTE_WIDTH-1:0] 				         i_rx_mii_c, 
	 input							                     i_rx_mii_valid, 
	 input							                     i_rx_mii_am_valid,      

   output  [DATA_WIDTH-1:0] 			         o_sl_tx_mii_d, 
   output  [BYTE_WIDTH-1:0] 					     o_sl_tx_mii_c, 
   output  								                 o_sl_tx_mii_valid, 
   output  								                 o_sl_tx_mii_am,  
   input  								                 i_sl_tx_mii_ready, 
   output  								                 o_sl_rx_mii_ready, 
   input  [DATA_WIDTH-1:0] 			      	   i_sl_rx_mii_d, 
   input  [BYTE_WIDTH-1:0] 					       i_sl_rx_mii_c, 
	 input							                     i_sl_rx_mii_valid, 
	 input							                     i_sl_rx_mii_am_valid, 
   // ----------------------------------
   // PCS66 Interface
   // ----------------------------------
   output  [DATA_WIDTH-1:0]                o_tx_pcs66_d,
   output                                  o_tx_pcs66_valid,
   output                                  o_tx_pcs66_am,
   input                                   i_tx_pcs66_ready,
   input  [DATA_WIDTH-1:0]                 i_rx_pcs66_d,
   input                                   i_rx_pcs66_valid,
   input                                   i_rx_pcs66_am_valid,     

   output [DATA_WIDTH-1:0]                 o_sl_tx_pcs66_d,
   output                                  o_sl_tx_pcs66_valid,
   output                                  o_sl_tx_pcs66_am,
   input                                   i_sl_tx_pcs66_ready,
   input  [DATA_WIDTH-1:0]                 i_sl_rx_pcs66_d,
   input                                   i_sl_rx_pcs66_valid,
   input                                   i_sl_rx_pcs66_am_valid,     
   // ----------------------------------
   // PMA Direct Interface
   // ----------------------------------
   input 									                 i_sl_tx_pma_ready,
   output[PHY_DIRECT_DW-1:0]               o_sl_tx_pma, 
   input 									                 i_sl_rx_pma_ready,
	 input [PHY_DIRECT_DW-1:0]               i_sl_rx_pma 
//   input 									                 i_sl_rx_pma_ready,
//   input 									                 i_sl_aib_txfifo_empty,
//   input 									                 i_sl_aib_txfifo_full,
//   input 									                 i_sl_aib_txfifo_pempty,
//   input 									                 i_sl_aib_txfifo_pfull,
//   input 									                 i_sl_aib_rxfifo_empty,
//   input 									                 i_sl_aib_rxfifo_full,
//   input 									                 i_sl_aib_rxfifo_pempty,
//   input 									                 i_sl_aib_rxfifo_pfull,
//   output 									               o_sl_aib_rxfifo_rd_en
);

//************************************************************************************************
//PCS
//************************************************************************************************
//TBD:ss_app_st_p*_rxphydirect_data:reserved bits:67-79
generate
if ( (PHY_DIRECT_MODE == 2) && (INST_100G_MODE == 0) ) begin : PHY_DIRECT_MODE1_MII
	  assign o_sl_tx_mii_d = app_ss_st_txphydirect_data[DATA_WIDTH-1:0]; 
	  assign o_sl_tx_mii_c = app_ss_st_txphydirect_data[DATA_WIDTH+BYTE_WIDTH-1:DATA_WIDTH]; 
	  assign o_sl_tx_mii_am = app_ss_st_txphydirect_data[DATA_WIDTH+BYTE_WIDTH]; 
	  assign ss_app_st_txphydirect_tready = i_sl_tx_mii_ready;
	  assign o_sl_rx_mii_ready = 1'b1;	
	  assign o_sl_tx_mii_valid = app_ss_st_txphydirect_valid;
	
	  assign ss_app_st_rxphydirect_data[PHY_DIRECT_DW-1:DATA_WIDTH+BYTE_WIDTH+1] = 'd0;
	  assign ss_app_st_rxphydirect_data[DATA_WIDTH-1:0] = i_sl_rx_mii_d;
	  assign ss_app_st_rxphydirect_data[DATA_WIDTH+BYTE_WIDTH-1:DATA_WIDTH] = i_sl_rx_mii_c;
	  assign ss_app_st_rxphydirect_data[DATA_WIDTH+BYTE_WIDTH] = i_sl_rx_mii_am_valid;
	  assign ss_app_st_rxphydirect_valid = i_sl_rx_mii_valid;
end
endgenerate

generate
if ( (PHY_DIRECT_MODE == 2) && (INST_100G_MODE == 1) ) begin : PHY_DIRECT_MODE1_MII_100G
	  assign o_tx_mii_d = app_ss_st_txphydirect_data[DATA_WIDTH-1:0]; 
	  assign o_tx_mii_c = app_ss_st_txphydirect_data[DATA_WIDTH+BYTE_WIDTH-1:DATA_WIDTH]; 
	  assign o_tx_mii_am = app_ss_st_txphydirect_data[DATA_WIDTH+BYTE_WIDTH]; 
	  assign ss_app_st_txphydirect_tready = i_tx_mii_ready; 
	  assign o_tx_mii_valid = app_ss_st_txphydirect_valid;
	
	  assign ss_app_st_rxphydirect_data[PHY_DIRECT_DW-1:DATA_WIDTH+BYTE_WIDTH+1] = 'd0;
	  assign ss_app_st_rxphydirect_data[DATA_WIDTH-1:0] = i_rx_mii_d;
	  assign ss_app_st_rxphydirect_data[DATA_WIDTH+BYTE_WIDTH-1:DATA_WIDTH] = i_rx_mii_c;
	  assign ss_app_st_rxphydirect_data[DATA_WIDTH+BYTE_WIDTH] = i_rx_mii_am_valid;
	  assign ss_app_st_rxphydirect_valid = i_rx_mii_valid;
end
endgenerate

 
//************************************************************************************************
//PCS66
//txphydirect_tdata[263:0] connecting to data and 264th bit is connected to am
//************************************************************************************************
generate
//genvar i;
if ( (PHY_DIRECT_MODE == 3) && (INST_100G_MODE == 0) ) begin : PHY_DIRECT_MODE2_PCS66
      assign o_sl_tx_pcs66_d = app_ss_st_txphydirect_data[DATA_WIDTH-1:0]; 
      assign o_sl_tx_pcs66_am = app_ss_st_txphydirect_data[DATA_WIDTH]; 
      assign ss_app_st_txphydirect_tready = i_sl_tx_pcs66_ready; 
      assign o_sl_tx_pcs66_valid = app_ss_st_txphydirect_valid;

	    assign ss_app_st_rxphydirect_data[PHY_DIRECT_DW-1:DATA_WIDTH+1] = 'd0;
      assign ss_app_st_rxphydirect_data[DATA_WIDTH-1:0]= i_sl_rx_pcs66_d;
 			assign ss_app_st_rxphydirect_data[DATA_WIDTH] = i_sl_rx_pcs66_am_valid;
      assign ss_app_st_rxphydirect_valid = i_sl_rx_pcs66_valid;
end
endgenerate
generate
//genvar i;
if ( (PHY_DIRECT_MODE == 3) && (INST_100G_MODE == 1) ) begin : PHY_DIRECT_MODE2_PCS66_100
      assign o_tx_pcs66_d = app_ss_st_txphydirect_data[DATA_WIDTH-1:0]; 
      assign o_tx_pcs66_am = app_ss_st_txphydirect_data[DATA_WIDTH]; 
      assign ss_app_st_txphydirect_tready = i_tx_pcs66_ready; 
      assign o_tx_pcs66_valid = app_ss_st_txphydirect_valid;

	    assign ss_app_st_rxphydirect_data[PHY_DIRECT_DW-1:DATA_WIDTH+1] = 'd0;
      assign ss_app_st_rxphydirect_data[DATA_WIDTH-1:0]= i_rx_pcs66_d;
 			assign ss_app_st_rxphydirect_data[DATA_WIDTH] = i_rx_pcs66_am_valid;
      assign ss_app_st_rxphydirect_valid = i_rx_pcs66_valid;
end
endgenerate


//************************************************************************************************
//PMA_DIRECT
//************************************************************************************************
generate
//genvar i;

// ------------------------------------------------------------------
// Bit position  
// --------------------------------------------------------------------------------------------------------------------------------------------
//                   [   79          |   78:75  |    74    |    73:60    |   59:40     |    39:35    |    34    |    33:20    |    19:0     ]
// PMA_DATA[79:0] =  [  wr_en/valid  |  4'd0    | sync_bit |    14'd0    | 20-bit data |    5'd0     | sync_bit |    14'd0    | 20-bit data ]
// --------------------------------------------------------------------------------------------------------------------------------------------

if ( (PHY_DIRECT_MODE == 1) && (INST_100G_MODE == 0) ) begin : PHY_DIRECT_MODE3_PMA_DIRECT
      assign o_sl_tx_pma                  = app_ss_st_txphydirect_data;
      assign ss_app_st_rxphydirect_data   = i_sl_rx_pma;
      assign ss_app_st_txphydirect_tready = 1'b1;//i_sl_tx_pma_ready; 
      assign ss_app_st_rxphydirect_valid  = 1'b1;//i_sl_rx_pma_ready; 
end

endgenerate

//    function integer clog2;
//    input integer value;
//    begin
//      value = value-1;
//      for (clog2=0; value>0; clog2=clog2+1)
//        value = value>>1;
//    end
//    endfunction

endmodule //hssi_ss_phydirect_bridge
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "12eGHzhuzwzE3Jk0jEeOiewN6nwHALu32POyTf1JRNCV1OO/za2V4D/fHTxv4w7+HdY5I0a3bv3Hpe5d23LTkzUBWr/DOPSEcj3Y+bJ17gyFGyQY/gCPSyoX2LFpcR+gNWbGsGAYxdn8Ifv81Gif4S4dqthNm6DrNrNks867RzF0KuP2oTdv1KiuGKLRWAqy545AlItbNT/UEmyH9cDTkvw7JpmnyySAW+TVRIaxiRgVZYRWqomwa0hqSA+nRXMtT28OxwAw2984sUS/3iTaFH7nVLit1ZbT9vCzcGAyYIKyWbKbyREsYAWAjXF2yIIJRyQITUKNCFRg4k8tHP+Ctz6IDhSbzIsZ3/4zD3bvl7JRilEhQgNVJeYJw+nouySKhCMJEAQpQ9kpgrK1+AKgOzZvnEF1JNkxbZ6y77IDvtR4kIGchFvxcOL9zs+Px+5IvV5umUE8YRuKfDIOpfEEH8DL5eBclyR5u1jE2lvUKhohQ2eCNMyGuCGMi3ydcNf5EAwupKE3Fh5hyn0B9j7OkHQtA8+p6Mcsn3KQDFdB9wXzdJcVKKvgu3rxx5u8asyyOGvB7+5XmAbcqiSs4mqw0eqCsf35tOvellreP1cfTIi0if6e6RN96Q8IVq2qjLtsHu8+2Cf4yye9Xu4mqeMYW9rLfbyLHimHP3K2wq4gFBPpi7DNkxi42S7EJDzrm2qjkzDMGQZCk+iQWVTrcLzactIKIhpUKMw5TvnUMAwU5rUXpQGT4CTt3G/77BpVw+sizL0BNPtjr6wtuUiPZnW4mSvcSkY1piVNDC+UvTptAtP4Ql7a4PKbP+adzFp/I7W6q/FAL+gS++9LiJsEcGHdMDYfo43TG3T9JAkPDvCwzE8PdMwjm7n01hGX2cW7QTeIlL6KeoXVKyaDucoQ8eONYXw5nvRuPo9JJUxcz98Zss6Zyt2YRtAYOD7aiID6+xASyzUb26Y8qWeSYAb0Aku1rPaClBVKDIda4/H4mu4sPjWaIwVIET3za8tZOjmExKMU"
`endif