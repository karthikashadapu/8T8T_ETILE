/* ******************************************************************************************************************
 INTEL CONFIDENTIAL
 Copyright 2023 Intel Corporation All Rights Reserved.
 The source code contained or described herein and all documents related to the
 surce code ("Material") are owned by Intel Corporation or its suppliers or
 licensors. Title to the Material remains with Intel Corporation or its
 suppliers and licensors. The Material may contain trade secrets and proprietary
 and confidential information of Intel Corporation and its suppliers and
 licensors, and is protected by worldwide copyright and trade secret laws and
 treaty provisions. No part of the Material may be used, copied, reproduced,
 modified, published, uploaded, posted, transmitted, distributed, or disclosed
 in any way without Intels prior express written permission.
 No license under any patent, copyright, trade secret or other intellectual
 property right is granted to or conferred upon you by disclosure or delivery
 of the Materials, either expressly, by implication, inducement, estoppel or
 otherwise. Any license under such intellectual property rights must be
 express and approved by Intel in writing.
 Unless otherwise agreed by Intel in writing, you may not remove or alter this
 notice or any other notice embedded in Materials by Intel or Intels suppliers
 or licensors in any way.
****************************************************************************************************************** */

`default_nettype none
`timescale 1ns/100ps

module top();

   wire clk_csr ;
   wire clk_dsp ;
   wire clk_mac ;
   wire clk_eth ;
   wire ready   ;
   wire valid_in;
   wire [63:0] data_in   ;
   wire sop_in  ;
   wire eop_in  ;
   wire [2:0] empty_in   ;
   wire [2:0] channel_in ;
   wire wrapper_inst_avst_source_ul_valid        ;
   wire [63:0] wrapper_inst_avst_source_ul_data  ;
   wire wrapper_inst_avst_source_ul_endofpacket  ;
   wire wrapper_inst_avst_source_ul_startofpacket;
   wire [2:0] wrapper_inst_avst_source_ul_empty  ;
   wire frame_status_counter_reset               ;
   wire dl_avst_source_valid_data   ;
   wire [31:0] dl_avst_source_data_l0_data ;
   wire [31:0] dl_avst_source_data_l1_data ;
   wire [31:0] dl_avst_source_data_l2_data ;
   wire [31:0] dl_avst_source_data_l3_data ;
   wire [31:0] dl_avst_source_data_l4_data ;
   wire [31:0] dl_avst_source_data_l5_data ;
   wire [31:0] dl_avst_source_data_l6_data ;
   wire [31:0] dl_avst_source_data_l7_data ;
   wire h2flw_bridge_waitrequest     ;
   wire h2flw_bridge_readdatavalid   ;
   wire [31:0] h2flw_bridge_readdata ;
   wire pb_h2flw_bridge_waitrequest  ;
   wire pb_h2flw_bridge_readdatavalid;
   wire [31:0] write_data            ;
   wire [31:0] write_address         ;
   wire write         ;
   wire read          ;
   
   wire [31:0] top_mem_write_data;
   wire [16:0] top_mem_address;
   wire        top_mem_write;
   wire        top_mem_read;
   wire [31:0] pwr_mtr_h2f_bridge_s0_readdata;
   wire        pwr_mtr_h2f_bridge_s0_readdatavalid;

   wire rst_eth_n     ; 
   wire [95:0] tod_cnt;
   wire source_ready  ; 
   wire        coupling_sink_startofpacket_l1 ;   
   wire [31:0] coupling_sink_data_l1          ;     
   wire        coupling_sink_valid_l1         ;      
   wire [15:0] coupling_sink_channel_l1       ;    
   wire        coupling_sink_endofpacket_l1   ;
   wire        coupling_sink_startofpacket_l2 ; 
   wire [31:0] coupling_sink_data_l2          ;     
   wire        coupling_sink_valid_l2         ;      
   wire [15:0] coupling_sink_channel_l2       ;      
   wire        coupling_sink_endofpacket_l2   ;
   wire        coupling_prach_sink_startofpacket_l1 ;   
   wire [31:0] coupling_prach_sink_data_l1          ;     
   wire        coupling_prach_sink_valid_l1         ;      
   wire [15:0] coupling_prach_sink_channel_l1       ;    
   wire        coupling_prach_sink_endofpacket_l1   ;
   wire        coupling_prach_sink_startofpacket_l2 ; 
   wire [31:0] coupling_prach_sink_data_l2          ;     
   wire        coupling_prach_sink_valid_l2         ;      
   wire [15:0] coupling_prach_sink_channel_l2       ;      
   wire        coupling_prach_sink_endofpacket_l2   ;
   wire        decimator_sink_sop    ;
   wire [255:0]decimator_sink_data   ;
   wire        decimator_sink_valid  ;
   wire [15:0] decimator_sink_channel;
   wire        decimator_sink_eop    ;
   wire [31:0] sf_cnt_coupling ;
   wire [31:0] sf_cnt_coupling_pu ;
   wire [7:0]  bw_cfg_cc1 ;
   wire [7:0]  bw_cfg_cc2 ;

   wire        decimator_vld_in;
   wire [31:0] decimator_data_in_0; 
   wire [31:0] decimator_data_in_1;
   wire [31:0] decimator_data_in_2; 
   wire [31:0] decimator_data_in_3;
   wire [31:0] decimator_data_in_4;
   wire [31:0] decimator_data_in_5; 
   wire [31:0] decimator_data_in_6; 
   wire [31:0] decimator_data_in_7; 
   wire [7:0]  keep ;
   wire [7:0]  keep_out ;

   assign keep = (eop_in && valid_in) ? (255 - ((2 ** empty_in) - 1)) : 255 ;
   assign wrapper_inst_avst_source_ul_empty = (wrapper_inst_avst_source_ul_valid && wrapper_inst_avst_source_ul_endofpacket && source_ready) ? (8 - ($clog2(keep_out + 1))) : 0 ;
 
   assign decimator_vld_in    = (`UL_INJ == 0) ? dl_avst_source_valid_data   : decimator_sink_valid        ;
   assign decimator_data_in_0 = (`UL_INJ == 0) ? dl_avst_source_data_l0_data : decimator_sink_data[255:224];
   assign decimator_data_in_1 = (`UL_INJ == 0) ? dl_avst_source_data_l1_data : decimator_sink_data[223:192];
   assign decimator_data_in_2 = (`UL_INJ == 0) ? dl_avst_source_data_l2_data : decimator_sink_data[191:160];
   assign decimator_data_in_3 = (`UL_INJ == 0) ? dl_avst_source_data_l3_data : decimator_sink_data[159:128];
   assign decimator_data_in_4 = (`UL_INJ == 0) ? dl_avst_source_data_l4_data : decimator_sink_data[127:96] ;
   assign decimator_data_in_5 = (`UL_INJ == 0) ? dl_avst_source_data_l5_data : decimator_sink_data[95:64]  ;
   assign decimator_data_in_6 = (`UL_INJ == 0) ? dl_avst_source_data_l6_data : decimator_sink_data[63:32]  ;
   assign decimator_data_in_7 = (`UL_INJ == 0) ? dl_avst_source_data_l7_data : decimator_sink_data[31:0]   ;

/// Wrapper Instance ///
`ifndef ECPRI_ORAN_SS
  phipps_peak phipps_peak_inst (
        .clock_bridge_csr_in_clk_clk                           (clk_csr),                                                  //   input,    width = 1,                              
        .clock_bridge_dsp_in_clk_clk                           (clk_dsp),                                                  //   input,    width = 1,                              
        .clock_bridge_ecpri_rx_in_clk_clk                      (clk_mac),
        .clock_bridge_ecpri_tx_in_clk_clk                      (clk_mac),
        .clock_bridge_eth_in_clk_clk                           (clk_eth),                                                  //   input,    width = 1,                        
        .avst_axist_bridge_0_axist_rx_if_tvalid                (valid_in),                                                 //   input,    width = 1,      
        .avst_axist_bridge_0_axist_rx_if_tdata                 ({data_in[7:0],data_in[15:8],data_in[23:16],data_in[31:24],data_in[39:32],data_in[47:40],data_in[55:48],data_in[63:56]}),  //   input,   width = 64,      
        .avst_axist_bridge_0_axist_rx_if_tlast                 (eop_in),                                                   //   input,    width = 1,              
        .avst_axist_bridge_0_axist_rx_if_tuser                 (2'b0),                                                     //   input,    width = 1,              
        .avst_axist_bridge_0_axist_rx_if_tkeep                 (keep),                                                     //   input,    width = 1,              
        .avst_axist_bridge_0_axit_tx_if_tready                 (source_ready),                                             //   input,    width = 1,                               
        .avst_axist_bridge_0_axit_tx_if_tvalid                 (wrapper_inst_avst_source_ul_valid),                        //   input,    width = 1,      
        .avst_axist_bridge_0_axit_tx_if_tdata                  ({wrapper_inst_avst_source_ul_data[7:0],wrapper_inst_avst_source_ul_data[15:8],wrapper_inst_avst_source_ul_data[23:16],wrapper_inst_avst_source_ul_data[31:24],wrapper_inst_avst_source_ul_data[39:32],wrapper_inst_avst_source_ul_data[47:40],wrapper_inst_avst_source_ul_data[55:48],wrapper_inst_avst_source_ul_data[63:56]}),            //   input,   width = 64,      
        .avst_axist_bridge_0_axit_tx_if_tlast                  (wrapper_inst_avst_source_ul_endofpacket),                  //   input,    width = 1,              
        .avst_axist_bridge_0_axit_tx_if_tuser                  (),                                                         //   input,    width = 1,              
        .avst_axist_bridge_0_axit_tx_if_tkeep                  (keep_out),                                                 //   input,    width = 1,              

        .tx_lanes_stable_tx_lanes_stable                       (1'b1),                                                     //   input,    width = 1,            
        .rx_pcs_ready_rx_pcs_ready                             (1'b1),                                                     //   input,    width = 1,      
        .xran_timestamp_tod_in_data                            (tod_cnt),                                                  //   input,   width = 96,              
        .ecpri_oran_top_0_oran_rx_tod_96b_data_tdata            (tod_cnt),
        .ecpri_oran_top_0_oran_tx_tod_96b_data_tdata            (tod_cnt),
        .dxc_ss_top_0_rfp_pulse_data                           (1'b0), 
        .duc_avst_source_duc_avst_source_valid                 (dl_avst_source_valid_data  ),                              //  output,    width = 1, 
        .duc_avst_source_duc_avst_source_data0                 (dl_avst_source_data_l0_data),                              //  output,   width = 32, 
        .duc_avst_source_duc_avst_source_data1                 (dl_avst_source_data_l1_data),                              //  output,   width = 32, 
        .duc_avst_source_duc_avst_source_data2                 (dl_avst_source_data_l2_data),                              //  output,   width = 32, 
        .duc_avst_source_duc_avst_source_data3                 (dl_avst_source_data_l3_data),                              //  output,   width = 32, 
        .duc_avst_source_duc_avst_source_data4                 (dl_avst_source_data_l4_data),
        .duc_avst_source_duc_avst_source_data5                 (dl_avst_source_data_l5_data),
        .duc_avst_source_duc_avst_source_data6                 (dl_avst_source_data_l6_data),
        .duc_avst_source_duc_avst_source_data7                 (dl_avst_source_data_l7_data),

        .ddc_avst_sink_avst_sink_valid                         (decimator_vld_in),                                         //  input,width = 1,   
        .ddc_avst_sink_avst_sink_data_l1                       (decimator_data_in_0),                                      //  input,   width = 32, 
        .ddc_avst_sink_avst_sink_data_l2                       (decimator_data_in_1),                                      //  input,   width = 32, 
        .ddc_avst_sink_avst_sink_data_l3                       (decimator_data_in_2),                                      //  input,   width = 32, 
        .ddc_avst_sink_avst_sink_data_l4                       (decimator_data_in_3),
        .ddc_avst_sink_avst_sink_data_l5                       (decimator_data_in_4),
        .ddc_avst_sink_avst_sink_data_l6                       (decimator_data_in_5),
        .ddc_avst_sink_avst_sink_data_l7                       (decimator_data_in_6),
        .ddc_avst_sink_avst_sink_data_l8                       (decimator_data_in_7),

        .h2f_lw_bridge_s0_waitrequest                          (h2flw_bridge_waitrequest),                                  //  output,    width = 1,     
        .h2f_lw_bridge_s0_readdata                             (h2flw_bridge_readdata),                                     //  output,   width = 32,                                     
        .h2f_lw_bridge_s0_readdatavalid                        (h2flw_bridge_readdatavalid),                                //  output,    width = 1,               
        .h2f_lw_bridge_s0_burstcount                           (1'b1),                                                      //  input,    width = 1,                                  
        .h2f_lw_bridge_s0_writedata                            (write_data),                                                //  input,   width = 32,                    
        .h2f_lw_bridge_s0_address                              (write_address),                                             //  input,   width = 21,               
        .h2f_lw_bridge_s0_write                                (write),                                                     //  input,    width = 1,                     
        .h2f_lw_bridge_s0_read                                 (read),                                                      //  input,    width = 1,                     
        .h2f_lw_bridge_s0_byteenable                           (4'b1111),                                                   //  input,    width = 4,                               
        .h2f_lw_bridge_s0_debugaccess                          (1'b0),                                                      //  input,    width = 1,                                   

        .pwr_mtr_h2f_bridge_s0_waitrequest                     (),                                
        .pwr_mtr_h2f_bridge_s0_readdata                        (pwr_mtr_h2f_bridge_s0_readdata),                                   
        .pwr_mtr_h2f_bridge_s0_readdatavalid                   (pwr_mtr_h2f_bridge_s0_readdatavalid),                              
        .pwr_mtr_h2f_bridge_s0_burstcount                      (1'b1),                                 
        .pwr_mtr_h2f_bridge_s0_writedata                       (top_mem_write_data),                                  
        .pwr_mtr_h2f_bridge_s0_address                         (top_mem_address),                                    
        .pwr_mtr_h2f_bridge_s0_write                           (top_mem_write),                                      
        .pwr_mtr_h2f_bridge_s0_read                            (top_mem_read),                                       
        .pwr_mtr_h2f_bridge_s0_byteenable                      (4'hf),                                 
        .pwr_mtr_h2f_bridge_s0_debugaccess                     (1'd0),     

        .csr_in_reset_reset_n                                  (rst_eth_n),                                                 //  input,    width = 1,                            
        .dsp_in_reset_reset_n                                  (rst_eth_n),                                                 //  input,    width = 1,                             
        .eth_in_reset_reset_n                                  (rst_eth_n),                                                  //  input,    width = 1
        .rst_ecpri_n_reset_n                                   (rst_eth_n) 
  );     
 
`else

  ecpri_oran_top ecpri_oran_top_inst (
        .csr_in_clk_clk                                           (clk_csr),                                                //   input,    width = 1,                              
        .dsp_in_clk_clk                                           (clk_dsp),                                                //   input,    width = 1,                              
        .ecpri_rx_in_clk_clk                                      (clk_mac),
        .ecpri_tx_in_clk_clk                                      (clk_mac),
        .eth_xran_dl_in_clk_clk                                   (clk_eth),                                                //   input,    width = 1,                        
        .eth_xran_ul_in_clk_clk                                   (clk_eth),                                                //   input,    width = 1,                        
        .avst_axist_bridge_0_axist_rx_if_tvalid                   (valid_in),                                               //   input,    width = 1,      
        .avst_axist_bridge_0_axist_rx_if_tdata                    ({data_in[7:0],data_in[15:8],data_in[23:16],data_in[31:24],data_in[39:32],data_in[47:40],data_in[55:48],data_in[63:56]}), // input,   width = 64,      
        .avst_axist_bridge_0_axist_rx_if_tlast                    (eop_in),                                                 //   input,    width = 1,              
        .avst_axist_bridge_0_axist_rx_if_tuser                    (7'd0),                                                   //   input,    width = 1,              
        .avst_axist_bridge_0_axist_rx_if_tkeep                    (keep),                                                   //   input,    width = 1,              
        .avst_axist_bridge_0_axit_tx_if_tready                    (source_ready),                                           //   input,    width = 1,                               
        .avst_axist_bridge_0_axit_tx_if_tvalid                    (wrapper_inst_avst_source_ul_valid),                      //   input,    width = 1,      
        .avst_axist_bridge_0_axit_tx_if_tdata                     ({wrapper_inst_avst_source_ul_data[7:0],wrapper_inst_avst_source_ul_data[15:8],wrapper_inst_avst_source_ul_data[23:16],wrapper_inst_avst_source_ul_data[31:24],wrapper_inst_avst_source_ul_data[39:32],wrapper_inst_avst_source_ul_data[47:40],wrapper_inst_avst_source_ul_data[55:48],wrapper_inst_avst_source_ul_data[63:56]}),          //   input,   width = 64,      
        .avst_axist_bridge_0_axit_tx_if_tlast                     (wrapper_inst_avst_source_ul_endofpacket),                //   input,    width = 1,              
        .avst_axist_bridge_0_axit_tx_if_tuser                     (),                                                       //   input,    width = 1,              
        .avst_axist_bridge_0_axit_tx_if_tkeep                     (keep_out),                                               //   input,    width = 1,              
        .tx_lanes_stable_tx_lanes_stable                          (1'b1),                                                   //   input,    width = 1,            
        .rx_pcs_ready_rx_pcs_ready                                (1'b1),                                                   //   input,    width = 1,      
        .tod_data                                                 (tod_cnt),                                                //   input,   width = 96,              
        .oran_rx_tod_96b_data_tdata                                (tod_cnt),
        .oran_tx_tod_96b_data_tdata                                (tod_cnt),
  
        .h2f_lw_bridge_s0_waitrequest                             (h2flw_bridge_waitrequest),                               //  output,    width = 1,     
        .h2f_lw_bridge_s0_readdata                                (h2flw_bridge_readdata),                                  //  output,   width = 32,                                     
        .h2f_lw_bridge_s0_readdatavalid                           (h2flw_bridge_readdatavalid),                             //  output,    width = 1,               
        .h2f_lw_bridge_s0_burstcount                              (1'b1),                                                   //  input,    width = 1,                                  
        .h2f_lw_bridge_s0_writedata                               (write_data),                                             //  input,   width = 32,                    
        .h2f_lw_bridge_s0_address                                 (write_address),                                          //  input,   width = 21,               
        .h2f_lw_bridge_s0_write                                   (write),                                                  //  input,    width = 1,                     
        .h2f_lw_bridge_s0_read                                    (read),                                                   //  input,    width = 1,                     
        .h2f_lw_bridge_s0_byteenable                              (4'b1111),                                                //  input,    width = 4,                               
        .h2f_lw_bridge_s0_debugaccess                             (1'b0),                                                   //  input,    width = 1,                                    
        .coupling_pusch_sink_l2_valid                             (coupling_sink_valid_l2),             
        .coupling_pusch_sink_l2_data                              (coupling_sink_data_l2),         
        .coupling_pusch_sink_l2_channel                           (coupling_sink_channel_l2),      
        .coupling_pusch_sink_l2_startofpacket                     (coupling_sink_startofpacket_l2),
        .coupling_pusch_sink_l2_endofpacket                       (coupling_sink_endofpacket_l2),  
        .coupling_pusch_sink_l1_valid                             (coupling_sink_valid_l1),        
        .coupling_pusch_sink_l1_data                              (coupling_sink_data_l1),         
        .coupling_pusch_sink_l1_channel                           (coupling_sink_channel_l1),      
        .coupling_pusch_sink_l1_startofpacket                     (coupling_sink_startofpacket_l1),
        .coupling_pusch_sink_l1_endofpacket                       (coupling_sink_endofpacket_l1),
        .coupling_prach_sink_l2_valid                             (coupling_prach_sink_valid_l2),             
        .coupling_prach_sink_l2_data                              (coupling_prach_sink_data_l2),         
        .coupling_prach_sink_l2_channel                           (coupling_prach_sink_channel_l2),      
        .coupling_prach_sink_l2_startofpacket                     (coupling_prach_sink_startofpacket_l2),
        .coupling_prach_sink_l2_endofpacket                       (coupling_prach_sink_endofpacket_l2),  
        .coupling_prach_sink_l1_valid                             (coupling_prach_sink_valid_l1),        
        .coupling_prach_sink_l1_data                              (coupling_prach_sink_data_l1),         
        .coupling_prach_sink_l1_channel                           (coupling_prach_sink_channel_l1),      
        .coupling_prach_sink_l1_startofpacket                     (coupling_prach_sink_startofpacket_l1),
        .coupling_prach_sink_l1_endofpacket                       (coupling_prach_sink_endofpacket_l1),
        .csr_in_reset_reset                                       (~rst_eth_n),                                              //  input,    width = 1,                            
        .dsp_in_reset_reset_n                                     (rst_eth_n),                                               //  input,    width = 1,                             
        .eth_xran_dl_in_reset_reset_n                             (rst_eth_n),                                               //  input,    width = 1,                             
        .eth_xran_ul_in_reset_reset_n                             (rst_eth_n),                                               //  input,    width = 1,                             
        .rst_soft_n_rst_soft_n                                    (rst_eth_n),                                               //  input,    width = 1,                             
        .rst_ecpri_n_reset_n                                      (rst_eth_n), 
        .coupling_prach_timing_ref_data                           (sf_cnt_coupling),
        .coupling_pusch_timing_ref_data                           (sf_cnt_coupling_pu),
        .bw_config_cc1_bw_config_cc1                              (bw_cfg_cc1),
        .bw_config_cc2_bw_config_cc2                              (bw_cfg_cc2),
        .short_long_prach_select_data                             (`LONG_SHORT_PRACH),
        .xran_demapper_source_ready                               (1'b1)
  );      

`endif 


//Interface wrapper 
assign ready = 1; 

o_ru_vif o_ru_vif( 
//PINLIST port connection DUT->VIF 
    .clk_csr                               (clk_csr),
    .clk_dsp                               (clk_dsp),
    .clk_mac                               (clk_mac),
    .clk_eth                               (clk_eth),
    .ecpri_valid_in                        (valid_in),
    .ecpri_sink_ready                      (ready),
    .ecpri_data_in                         (data_in),
    .ecpri_sop_in                          (sop_in),
    .ecpri_eop_in                          (eop_in),
    .ecpri_empty_in                        (empty_in),
    .ul_ecpri_valid                        (wrapper_inst_avst_source_ul_valid),
    .ul_ecpri_data                         (wrapper_inst_avst_source_ul_data),
    .ul_ecpri_endofpacket                  (wrapper_inst_avst_source_ul_endofpacket),
    .ul_ecpri_startofpacket                (wrapper_inst_avst_source_ul_startofpacket),
    .ul_ecpri_empty                        (wrapper_inst_avst_source_ul_empty),
    .ul_ecpri_ready                        (source_ready),
    .frame_status_counter_reset            (frame_status_counter_reset),
    .h2flw_bridge_waitrequest              (h2flw_bridge_waitrequest),
    .h2flw_bridge_readdatavalid            (h2flw_bridge_readdatavalid),
    .h2flw_bridge_readdata                 (h2flw_bridge_readdata),
    .pb_h2flw_bridge_waitrequest           (pb_h2flw_bridge_waitrequest),
    .pb_h2flw_bridge_readdatavalid         (pb_h2flw_bridge_readdatavalid),
    .write_data                            (write_data),
    .write_address                         (write_address),
    .write                                 (write),
    .read                                  (read),

    .top_mem_write_data                    (top_mem_write_data), 
    .top_mem_address                       (top_mem_address   ), 
    .top_mem_write                         (top_mem_write     ), 
    .top_mem_read                          (top_mem_read      ),
    .pwr_mtr_h2f_bridge_s0_readdata        (pwr_mtr_h2f_bridge_s0_readdata),
    .pwr_mtr_h2f_bridge_s0_readdatavalid   (pwr_mtr_h2f_bridge_s0_readdatavalid), 

    .rst_eth_n                             (rst_eth_n),
    .coupling_sink_startofpacket_l1        (coupling_sink_startofpacket_l1),  
    .coupling_sink_data_l1                 (coupling_sink_data_l1         ),
    .coupling_sink_valid_l1                (coupling_sink_valid_l1        ),
    .coupling_sink_channel_l1              (coupling_sink_channel_l1      ),
    .coupling_sink_endofpacket_l1          (coupling_sink_endofpacket_l1  ),
    .coupling_sink_startofpacket_l2        (coupling_sink_startofpacket_l2),
    .coupling_sink_data_l2                 (coupling_sink_data_l2         ),
    .coupling_sink_valid_l2                (coupling_sink_valid_l2        ),
    .coupling_sink_channel_l2              (coupling_sink_channel_l2      ),
    .coupling_sink_endofpacket_l2          (coupling_sink_endofpacket_l2  ),
    .coupling_prach_sink_startofpacket_l1  (coupling_prach_sink_startofpacket_l1),  
    .coupling_prach_sink_data_l1           (coupling_prach_sink_data_l1         ),
    .coupling_prach_sink_valid_l1          (coupling_prach_sink_valid_l1        ),
    .coupling_prach_sink_channel_l1        (coupling_prach_sink_channel_l1      ),
    .coupling_prach_sink_endofpacket_l1    (coupling_prach_sink_endofpacket_l1  ),
    .coupling_prach_sink_startofpacket_l2  (coupling_prach_sink_startofpacket_l2),
    .coupling_prach_sink_data_l2           (coupling_prach_sink_data_l2         ),
    .coupling_prach_sink_valid_l2          (coupling_prach_sink_valid_l2        ),
    .coupling_prach_sink_channel_l2        (coupling_prach_sink_channel_l2      ),
    .coupling_prach_sink_endofpacket_l2    (coupling_prach_sink_endofpacket_l2  ),
    .decimator_sink_sop                    (decimator_sink_sop),
    .decimator_sink_data                   (decimator_sink_data) ,
    .decimator_sink_valid                  (decimator_sink_valid),
    .decimator_sink_channel                (decimator_sink_channel),
    .decimator_sink_eop                    (decimator_sink_eop),
    .tod_cnt                               (tod_cnt),
    .sf_cnt_coupling                       (sf_cnt_coupling),
    .sf_cnt_coupling_pu                    (sf_cnt_coupling_pu),
    .bw_cfg_cc1                            (bw_cfg_cc1),
    .bw_cfg_cc2                            (bw_cfg_cc2)
   
  );
 
endmodule     
