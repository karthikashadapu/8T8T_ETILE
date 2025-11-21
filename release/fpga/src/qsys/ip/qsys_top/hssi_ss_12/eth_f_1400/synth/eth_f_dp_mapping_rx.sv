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


//=============================================================================
//Description
//Generates RX MAC interface data from 80 bit parallel data from MAIB
//=============================================================================
//Declaration

//synthesis translate_off
`timescale 1ns / 1ps
//synthesis translate_on

module eth_f_dp_mapping_rx
import eth_f_package::*;
#(
    parameter   LANES                   =   4,
    parameter   DATA_RATE               =   "100G"
)
(
    // MAC Interface
    output  logic                          o_tx_ready,
    output  logic   [LANES-1:0][63:0]      o_rx_data,
    output  logic   [LANES-1:0][2:0]       o_rx_empty,
    output  logic   [LANES-1:0]            o_rx_fcs_error,
    output  logic   [LANES-1:0][1:0]       o_rx_error,
    output  logic   [LANES-1:0][2:0]       o_rx_status,
    output  logic   [LANES-1:0]            o_rx_inframe,
    output  logic                          o_rx_valid,
    output  logic                          o_rx_pause,
    output  logic   [7:0]                  o_rx_pfc,

    //PCS Interface
    output logic    [LANES-1:0][63:0]      o_rx_mii_d,
    output logic    [LANES-1:0][7:0]       o_rx_mii_c,
    output logic                           o_rx_mii_valid,
    output logic                           o_rx_mii_am_valid,
    output logic                           o_tx_mii_ready,

    //PCS66 Interface
    output logic    [LANES-1:0][65:0]      o_rx_pcs66_d,
    output logic                           o_rx_pcs66_valid,
    output logic                           o_rx_pcs66_am_valid,
    output logic                           o_tx_pcs66_ready,

    //Word align good
    output logic                           o_rx_word_align_good,
    // Deskew Interface
    output  logic   [LANES-1:0][77:0]      o_rx_data_to_dsk,
    output  logic   [LANES-1:0]            o_rx_aib_dsk,
    input   logic   [LANES-1:0][77:0]      i_rx_data_dsk_done,

    //80bit data from aib
    input   logic   [LANES*80-1:0]         i_rx_parallel_data
);


    logic   [LANES-1:0]                    o_rx_word_align_good_vec;
//=========================================================================
//Remap the RX output pins

//AIB decode 
genvar i;
generate
for (i=0; i<LANES; i=i+1) begin:aib_decoding
    assign o_rx_data_to_dsk[i] = {i_rx_parallel_data[((i*80)+40) +:39],i_rx_parallel_data[i*80+:39]};
    assign o_rx_aib_dsk[i]     = o_rx_data_to_dsk[i][EPRT_DESKEW]; 
end:aib_decoding
endgenerate


//Map the RX data interfaces
generate
for (i=0; i<LANES; i=i+1) begin:rx_mappings

  always_comb begin:rx_mac_client        
    o_rx_data[i]             =   {i_rx_data_dsk_done[i][EPRT_RX_DATA_1+:32],i_rx_data_dsk_done[i][EPRT_RX_DATA_0+:32]};
    o_rx_empty[i]            =   i_rx_data_dsk_done[i][EPRT_RX_EOP_EMPTY+:3];
    o_rx_inframe[i]          =   i_rx_data_dsk_done[i][EPRT_RX_INFRAME];
    if ((i % 2) == 0) 
    begin:i_zero 
      o_rx_fcs_error[i]      =   i_rx_data_dsk_done[i][EPRT_RX_FCS_ERROR];
      o_rx_error[i]          =   i_rx_data_dsk_done[i][EPRT_RX_ERROR+:2];
      o_rx_status[i]         =   i_rx_data_dsk_done[i][EPRT_RX_STATUS+:3];
    end:i_zero 
    else 
    begin 
	o_rx_fcs_error[i]      =   i_rx_data_dsk_done[i-1][EPRT_RX_FCS_ERROR];
	o_rx_error[i]          =   i_rx_data_dsk_done[i-1][EPRT_RX_ERROR+:2];
      	o_rx_status[i]         =   i_rx_data_dsk_done[i-1][EPRT_RX_STATUS+:3];



    //  o_rx_fcs_error[i]      =   1'b0;
    //  o_rx_error[i]          =   1'b0;
    //  o_rx_status[i]         =   1'b0;
    end 
  end:rx_mac_client

  always_comb begin:rx_mii
    for (int mii_bytes=0; mii_bytes<8; mii_bytes++) begin
      if (mii_bytes<4) begin
        o_rx_mii_d[i][8*mii_bytes+:8]           =   i_rx_data_dsk_done[i][9*mii_bytes+:8];
        o_rx_mii_c[i][mii_bytes]                =   i_rx_data_dsk_done[i][9*mii_bytes+8];
      end else begin
        o_rx_mii_d[i][8*mii_bytes+:8]           =   i_rx_data_dsk_done[i][3+9*mii_bytes+:8];
        o_rx_mii_c[i][mii_bytes]                =   i_rx_data_dsk_done[i][3+9*mii_bytes+8];
      end
    end
  end

  always_comb begin:rx_pcs66
    o_rx_pcs66_d[i][0+:33]                       =   i_rx_data_dsk_done[i][EPRT_TX_PCS66_DATA_0+:33];
    o_rx_pcs66_d[i][33+:33]                      =   i_rx_data_dsk_done[i][EPRT_TX_PCS66_DATA_1+:33];
  end

  always_comb begin:word_align
    o_rx_word_align_good_vec[i]                  =   i_rx_data_dsk_done[i][EPRT_RX_WORD_ALIGN_GOOD]; // There are align good signals for each lane which will be asserted/deasserted at the same time
  end
end:rx_mappings
endgenerate


always_comb begin:skip_deskew_logic
  o_tx_ready             =   o_rx_data_to_dsk[0][EPRT_TX_READY];
end:skip_deskew_logic


always_comb begin:lane_independent_mapping
  //MAC PCS
  o_rx_valid             =   i_rx_data_dsk_done[0][EPRT_RX_VALID];
  //PCS
  o_rx_mii_valid         =   i_rx_data_dsk_done[0][EPRT_RX_VALID];
  o_rx_mii_am_valid      =   i_rx_data_dsk_done[0][EPRT_RX_AM_VALID];
  o_tx_mii_ready         =   i_rx_data_dsk_done[0][EPRT_TX_READY];
  //PCS66
  o_rx_pcs66_valid       =   i_rx_data_dsk_done[0][EPRT_RX_VALID];
  o_rx_pcs66_am_valid    =   i_rx_data_dsk_done[0][EPRT_RX_AM_VALID];
  o_tx_pcs66_ready       =   i_rx_data_dsk_done[0][EPRT_TX_READY];
  // word_align_good
  o_rx_word_align_good   =   &o_rx_word_align_good_vec;
end:lane_independent_mapping

generate
  if ( LANES != 1) begin:pause_pfc_mapping
      assign o_rx_pause   =   i_rx_data_dsk_done[1][EPRT_RX_PAUSE];
      assign o_rx_pfc[0]  =   i_rx_data_dsk_done[1][EPRT_RX_PFC0];
      assign o_rx_pfc[1]  =   i_rx_data_dsk_done[1][EPRT_RX_PFC1];
      assign o_rx_pfc[2]  =   i_rx_data_dsk_done[1][EPRT_RX_PFC2];
      assign o_rx_pfc[3]  =   i_rx_data_dsk_done[1][EPRT_RX_PFC3];
      assign o_rx_pfc[4]  =   i_rx_data_dsk_done[1][EPRT_RX_PFC4];
      assign o_rx_pfc[5]  =   i_rx_data_dsk_done[1][EPRT_RX_PFC5];
      assign o_rx_pfc[6]  =   i_rx_data_dsk_done[1][EPRT_RX_PFC6];
      assign o_rx_pfc[7]  =   i_rx_data_dsk_done[1][EPRT_RX_PFC7];
  end //pause_pfc_mapping
  else
  ;
endgenerate

endmodule

`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "Jbn39HeDxGqNcYGZOx4Z9ucCs2oEh/b8uMkRaNvB5DRjzJrJYrpJKWFCISE85ii6tH9zuuCEo6X0af6OauTQ+Ozwk1tsZmSo/aK9UOYVqiI4L0mMLnnDyFPJBEUN+znp6d+oie84TxrwJugN/66eG6ek4cTulks0EXWtTfhwKcotsw0Xz4/SS3GVym/4tne0z9smydSL74/eJ6ocrXzqMjpfEjy1qL7mzZl6AEz+onobWWeHCxel7qcweeXR3jO30KEJaFVTm03UTT4coAedxTQMBHOy2J0W5r2T0geinWJU5+B37MZjfg2WoYCvCWKgAXCWTX1ocRHyGxqGrWlZRERwYwYnuDpMtnz+J+0Ggup7Qizp1pIwD3KGFKyU2/2lEXwdDMdrentTGGmrSYYauyJnY9KjgzwH85Opz17rnyCUkZ1KtjWrdQTvDJDQp77LZ+1OUn8e4/340BzTQ+o5FI9zVB7OFPhY7jJnuDuJT4/zonHjQLraTNU2mAnAufcXsWTmBrIWvM51PhSPBRQBTzSqPivyXDDlvodLMtcmS24aZpMMprZF5fLd/JiE0g4DHBIDNdsrqweZHVWExI5YcPkPa3rpgc4dcZukkHLtSFtGDWZXn2FhnbB0DPOaDh3VyCGxHkvo8/CCU3o+QFlHriKudWdDrGuhY0q+Tg7VsX+l9fZN8qWtR5LqFwcdIItF8o+5NP1VtpTPv2DKuQVXF77pU0aDVOQmjHgC/0ui9tjsyTilUlxU4szaugmFCbMaEVmVAqzAdtwTuBrMKSnk1CqQ/+9remeZxs/99wAFZ2cQEIBbJmgfyv9y5CvIJJPSoHaMqaYSZVe8mM505cimoGzxCPGBBDdTu23xPEROL9k4MKUXHAgiwkl5k6JbIsJ+o7+HcDmhUro4Og2uRt1nx9uybwAn0FcH35piP12cX3TiAhRl/IrdHgcFNJ+movqZ6nZ4YDy8haH5FHSDf8P1PFDjpygdfk2WFX9uGYnXnjyGtoOWY6DWG+wIFq+ZKxCO"
`endif