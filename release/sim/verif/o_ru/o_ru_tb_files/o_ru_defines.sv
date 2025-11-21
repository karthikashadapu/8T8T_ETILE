/* ******************************************************************************************************************
 INTEL CONFIDENTIAL
 Copyright 2023 Intel Corporation All Rights Reserved.
 The source code contained or described herein and all documents related to the
 source code ("Material") are owned by Intel Corporation or its suppliers or
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

`ifndef O_RU_DEFINES_SV 
`define O_RU_DEFINES_SV 

//------------------------------------------------------------------------------ 
// Name        : o_ru_defines 
// Description : Defines used in Testbench
//------------------------------------------------------------------------------ 

`define MAC_CLK_PERIOD 2.4824         /// 402.83 MHz MAC Clock Period
`define DSP_CLK_PERIOD 2.0345         /// 491.52 MHz DSP Clock Period
`define ETH_CLK_PERIOD 2.56           /// 390.625 MHz ETH Clock Period
`define CSR_CLK_PERIOD 10             /// 100 MHz CSR Clock Period
`define ORAN_LPBK_EN 0                /// ORAN LOOPBACK will be used in case of oRAN Loopback Design 
`define PCAP_LPBK_EN 0                /// IF Enabled Reference Model will read the input PCAP at UL and compare against RTL

`define ECPRI_DMPR_EN 1               /// eCPRI Demapper Checker 1 - Enable 0 -Disable
`define ORAN_DMPR_EN 1                /// oRAN Demapper Checker 1 - Enable 0 -Disable
`define FDV_DMPR_EN 1                 /// FDV Demapper Checker 1 - Enable 0 -Disable
`define IFFT_EN 1                     /// IFFT Checker 1 - Enable 0 -Disable
`define INTRLVR_EN 1                  /// Interleaver Checker 1 - Enable 0 -Disable
`define DUC_EN 1                      /// DUC Checker 1 - Enable 0 -Disable
`define MIXER_DL_EN 1                 /// Mixer DL Checker 1 - Enable 0 -Disable
`define SUMMER_EN 1                   /// Summer Checker 1 - Enable 0 -Disable
`define INTERPOLATOR_EN 1             /// Interpolator Checker 1 - Enable 0 -Disable
`define DECIMATOR_EN 1                /// Decimator Checker 1 - Enable 0 -Disable
`define MIXER_UL_EN 1                 /// Mixer UL Checker 1 - Enable 0 -Disable
`define DDC_EN 1                      /// DDC Checker 1 - Enable 0 -Disable
`define DEINTRLVR_EN 1                /// Deinterleaver Checker 1 - Enable 0 -Disable
`define FFT_EN 1                      /// FFT Checker 1 - Enable 0 -Disable
`define PRACH_EN 1                    /// PRACH Checker 1 - Enable 0 -Disable
`define C_U_COUPLING_EN 1             /// CU_Coupling Checker 1 - Enable 0 -Disable
`define ORAN_MPR_EN 1                 /// oRAN Mapper Checker 1 - Enable 0 -Disable
`define ECPRI_MPR_EN 1                /// eCPRI Mapper Checker 1 - Enable 0 -Disable
`define FILE_BASED 1                  /// Enable File based Checkers for Low PHY blocks
`define FILE_WRITE_EN 0               /// Eanble file write for all output blocks

//////// Below Defines are for Making Debugging Easier in case of Errors ////////
`define DEBUG_EN 0
`define SCB_NUM 1
`define MIN_BYTES 5548
`define MAX_BYTES 5588
`define CHECK_SIZE 0
`define AXC_NUM 8                     /// Total AXC's    /// 8 AXC's Do not Change //////
/////////////////////////////////////////////////////////////////////////////////

`define VECTOR_PATH "../../../../testvector/output/rtl_sim"
`define PCAP_PATH "../../../../testvector/input/sim"

//IFFT Vectors
`define IFFT_OUT_LINEUP1_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress/ifft_vectors/ifft_output_1_file.csv"}
`define IFFT_OUT_LINEUP2_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress/ifft_vectors/ifft_output_2_file.csv"}
`define IFFT_OUT_LINEUP1_PHASECOMP_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_phasecomp/ifft_vectors/ifft_output_1_file.csv"}
`define IFFT_OUT_LINEUP2_PHASECOMP_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_phasecomp/ifft_vectors/ifft_output_2_file.csv"}
`define IFFT_OUT_LINEUP1_PHASECOMP_60_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_60_phasecomp/ifft_vectors/ifft_output_1_file.csv"}
`define IFFT_OUT_LINEUP2_PHASECOMP_60_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_60_phasecomp/ifft_vectors/ifft_output_2_file.csv"}
`define IFFT_OUT_LINEUP1_PRB_BLANK_EXP {`VECTOR_PATH, "/tc_prb_blanking_case_1_compression/ifft_vectors/ifft_output_1_file.csv"}
`define IFFT_OUT_LINEUP2_PRB_BLANK_EXP {`VECTOR_PATH, "/tc_prb_blanking_case_1_compression/ifft_vectors/ifft_output_2_file.csv"}
`define IFFT_OUT_LINEUP1_1_AXC_BLANK_EXP {`VECTOR_PATH, "/tc_eaxc_blanking_case_1_compression/ifft_vectors/ifft_output_1_file.csv"}
`define IFFT_OUT_LINEUP2_1_AXC_BLANK_EXP {`VECTOR_PATH, "/tc_eaxc_blanking_case_1_compression/ifft_vectors/ifft_output_2_file.csv"}
`define IFFT_OUT_LINEUP1_SYM_BLANK_EXP {`VECTOR_PATH, "/tc_compression_symbol_blanking/ifft_vectors/ifft_output_1_file.csv"}
`define IFFT_OUT_LINEUP1_MULTI_SEC_EXP {`VECTOR_PATH, "/tc_multi_sec/ifft_vectors/ifft_output_1_file.csv"}
`define IFFT_OUT_LINEUP1_SYM_AXC_BLANK_EXP {`VECTOR_PATH, "/tc_compression_symbol_blanking_axc_blanking/ifft_vectors/ifft_output_1_file.csv"}
`define IFFT_OUT_LINEUP1_SYM_AXC_PRB_BLANK_EXP {`VECTOR_PATH, "/tc_multi_sec_sym_axc_prb_blanking/ifft_vectors/ifft_output_1_file.csv"}
`define IFFT_OUT_LINEUP1_PRB_BLANK_60_EXP {`VECTOR_PATH, "/tc_prb_blanking_case_2_compression/ifft_vectors/ifft_output_1_file.csv"}
`define IFFT_OUT_LINEUP2_PRB_BLANK_60_EXP {`VECTOR_PATH, "/tc_prb_blanking_case_2_compression/ifft_vectors/ifft_output_2_file.csv"}
`define IFFT_OUT_LINEUP1_60_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_60/ifft_vectors/ifft_output_1_file.csv"}
`define IFFT_OUT_LINEUP2_60_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_60/ifft_vectors/ifft_output_2_file.csv"}
`define IFFT_OUT_LINEUP1_DELAY_EXP {`VECTOR_PATH, "/tc_delay_compensation/ifft_vectors/ifft_output_1_file.csv"}
`define IFFT_OUT_LINEUP2_DELAY_EXP {`VECTOR_PATH, "/tc_delay_compensation/ifft_vectors/ifft_output_2_file.csv"}
`define IFFT_OUT_LINEUP1_MIXED_100_60_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_mixed/ifft_vectors/ifft_output_1_file.csv"}
`define IFFT_OUT_LINEUP2_MIXED_100_60_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_mixed/ifft_vectors/ifft_output_2_file.csv"}
`define IFFT_OUT_LINEUP1_MIXED_60_100_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_mixed_60_100/ifft_vectors/ifft_output_1_file.csv"}
`define IFFT_OUT_LINEUP2_MIXED_60_100_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_mixed_60_100/ifft_vectors/ifft_output_2_file.csv"}
`define IFFT_OUT_LINEUP1_CC2_DIS_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_cc2_dis/ifft_vectors/ifft_output_1_file.csv"}

//Interleaver Vectors
`define INTLVR_OUT_LINEUP1_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress/interleaver_vectors/tmwave_out_1_file.csv"}
`define INTLVR_OUT_LINEUP2_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress/interleaver_vectors/tmwave_out_2_file.csv"}
`define INTLVR_OUT_LINEUP1_PHASECOMP_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_phasecomp/interleaver_vectors/tmwave_out_1_file.csv"}
`define INTLVR_OUT_LINEUP2_PHASECOMP_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_phasecomp/interleaver_vectors/tmwave_out_2_file.csv"}
`define INTLVR_OUT_LINEUP1_PHASECOMP_60_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_60_phasecomp/interleaver_vectors/tmwave_out_1_file.csv"}
`define INTLVR_OUT_LINEUP2_PHASECOMP_60_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_60_phasecomp/interleaver_vectors/tmwave_out_2_file.csv"}
`define INTLVR_OUT_LINEUP1_PRB_BLANK_EXP {`VECTOR_PATH, "/tc_prb_blanking_case_1_compression/interleaver_vectors/tmwave_out_1_file.csv"}
`define INTLVR_OUT_LINEUP2_PRB_BLANK_EXP {`VECTOR_PATH, "/tc_prb_blanking_case_1_compression/interleaver_vectors/tmwave_out_2_file.csv"}
`define INTLVR_OUT_LINEUP1_SYM_BLANK_EXP {`VECTOR_PATH, "/tc_compression_symbol_blanking/interleaver_vectors/tmwave_out_1_file.csv"}
`define INTLVR_OUT_LINEUP1_SYM_AXC_BLANK_EXP {`VECTOR_PATH, "/tc_compression_symbol_blanking_axc_blanking/interleaver_vectors/tmwave_out_1_file.csv"}
`define INTLVR_OUT_LINEUP1_SYM_AXC_PRB_BLANK_EXP {`VECTOR_PATH, "/tc_multi_sec_sym_axc_prb_blanking/interleaver_vectors/tmwave_out_1_file.csv"}
`define INTLVR_OUT_LINEUP1_MULTI_SEC_EXP {`VECTOR_PATH, "/tc_multi_sec/interleaver_vectors/tmwave_out_1_file.csv"}
`define INTLVR_OUT_LINEUP1_1_AXC_BLANK_EXP {`VECTOR_PATH, "/tc_eaxc_blanking_case_1_compression/interleaver_vectors/tmwave_out_1_file.csv"}
`define INTLVR_OUT_LINEUP2_1_AXC_BLANK_EXP {`VECTOR_PATH, "/tc_eaxc_blanking_case_1_compression/interleaver_vectors/tmwave_out_2_file.csv"}
`define INTLVR_OUT_LINEUP1_PRB_BLANK_60_EXP {`VECTOR_PATH, "/tc_prb_blanking_case_2_compression/interleaver_vectors/tmwave_out_1_file.csv"}
`define INTLVR_OUT_LINEUP2_PRB_BLANK_60_EXP {`VECTOR_PATH, "/tc_prb_blanking_case_2_compression/interleaver_vectors/tmwave_out_2_file.csv"}
`define INTLVR_OUT_LINEUP1_60_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_60/interleaver_vectors/tmwave_out_1_file.csv"}
`define INTLVR_OUT_LINEUP2_60_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_60/interleaver_vectors/tmwave_out_2_file.csv"}
`define INTLVR_OUT_LINEUP1_DELAY_EXP {`VECTOR_PATH, "/tc_delay_compensation/interleaver_vectors/tmwave_out_1_file.csv"}
`define INTLVR_OUT_LINEUP2_DELAY_EXP {`VECTOR_PATH, "/tc_delay_compensation/interleaver_vectors/tmwave_out_2_file.csv"}
`define INTLVR_OUT_LINEUP1_MIXED_100_60_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_mixed/interleaver_vectors/tmwave_out_1_file.csv"}
`define INTLVR_OUT_LINEUP2_MIXED_100_60_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_mixed/interleaver_vectors/tmwave_out_2_file.csv"}
`define INTLVR_OUT_LINEUP1_MIXED_60_100_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_mixed_60_100/interleaver_vectors/tmwave_out_1_file.csv"}
`define INTLVR_OUT_LINEUP2_MIXED_60_100_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_mixed_60_100/interleaver_vectors/tmwave_out_2_file.csv"}
`define INTLVR_OUT_LINEUP1_CC2_DIS_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_cc2_dis/interleaver_vectors/tmwave_out_1_file.csv"}

//DUC Vectors
`define DUC_OUT_LINEUP1_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress/duc_vectors/duc_out_1_file.csv"}
`define DUC_OUT_LINEUP2_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress/duc_vectors/duc_out_2_file.csv"}
`define DUC_OUT_LINEUP1_60_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_60/duc_vectors/duc_out_1_file.csv"}
`define DUC_OUT_LINEUP2_60_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_60/duc_vectors/duc_out_2_file.csv"}
`define DUC_OUT_LINEUP1_DELAY_EXP {`VECTOR_PATH, "/tc_delay_compensation/duc_vectors/duc_out_1_file.csv"}
`define DUC_OUT_LINEUP2_DELAY_EXP {`VECTOR_PATH, "/tc_delay_compensation/duc_vectors/duc_out_2_file.csv"}
`define DUC_OUT_LINEUP1_MIXED_100_60_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_mixed/duc_vectors/duc_out_1_file.csv"}
`define DUC_OUT_LINEUP2_MIXED_100_60_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_mixed/duc_vectors/duc_out_2_file.csv"}
`define DUC_OUT_LINEUP1_CC2_DIS_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_cc2_dis/duc_vectors/duc_out_1_file.csv"}

//Mixer DL Vectors
`define MIXER_DL_OUT_LINEUP1_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress/dl_mixer_vectors/Mixer_out_1_file.csv"}
`define MIXER_DL_OUT_LINEUP2_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress/dl_mixer_vectors/Mixer_out_2_file.csv"}
`define MIXER_DL_OUT_LINEUP1_60_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_60/dl_mixer_vectors/Mixer_out_1_file.csv"}
`define MIXER_DL_OUT_LINEUP2_60_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_60/dl_mixer_vectors/Mixer_out_2_file.csv"}
`define MIXER_DL_OUT_LINEUP1_DELAY_EXP {`VECTOR_PATH, "/tc_delay_compensation/dl_mixer_vectors/Mixer_out_1_file.csv"}
`define MIXER_DL_OUT_LINEUP2_DELAY_EXP {`VECTOR_PATH, "/tc_delay_compensation/dl_mixer_vectors/Mixer_out_2_file.csv"}
`define MIXER_DL_OUT_LINEUP1_MIXED_100_60_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_mixed/dl_mixer_vectors/Mixer_out_1_file.csv"}
`define MIXER_DL_OUT_LINEUP2_MIXED_100_60_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_mixed/dl_mixer_vectors/Mixer_out_2_file.csv"}
`define MIXER_DL_OUT_LINEUP1_CC2_DIS_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_cc2_dis/dl_mixer_vectors/Mixer_out_1_file.csv"}

//Summer Vectors
`define SUMMER_OUT_LINEUP1_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress/summer_vectors/summer_out_file.csv"}
`define SUMMER_OUT_LINEUP1_CC2_DIS_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_cc2_dis/summer_vectors/summer_out_file.csv"}
`define SUMMER_OUT_LINEUP1_CC2_DIS_60_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_60_cc2_dis/summer_vectors/summer_out_file.csv"}
`define SUMMER_OUT_LINEUP1_60_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_60/summer_vectors/summer_out_file.csv"}
`define SUMMER_OUT_LINEUP1_MIXED_100_60_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_mixed/summer_vectors/summer_out_file.csv"}
`define SUMMER_OUT_LINEUP1_DELAY_EXP {`VECTOR_PATH, "/tc_delay_compensation/summer_vectors/summer_out_file.csv"}

//Interpolator Vectors
`define INTERPOLATOR_OUT_LINEUP1_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress/interpolator_vectors/interp_out_file.csv"}
`define INTERPOLATOR_OUT_LINEUP1_CC2_DIS_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_cc2_dis/interpolator_vectors/interp_out_file.csv"}
`define INTERPOLATOR_OUT_LINEUP1_CC2_DIS_60_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_60_cc2_dis/interpolator_vectors/interp_out_file.csv"}
`define INTERPOLATOR_OUT_LINEUP1_60_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_60/interpolator_vectors/interp_out_file.csv"} 
`define INTERPOLATOR_OUT_LINEUP1_MIXED_100_60_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_mixed/interpolator_vectors/interp_out_file.csv"}
`define INTERPOLATOR_OUT_LINEUP1_DELAY_EXP {`VECTOR_PATH, "/tc_delay_compensation/interpolator_vectors/interp_out_file.csv"}

//Decimator Vectors
`define DECIMATOR_OUT_LINEUP1_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress/decimator_vectors/dec_out_file.csv"}
`define DECIMATOR_OUT_LINEUP1_CC2_DIS_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_cc2_dis/decimator_vectors/dec_out_file.csv"}
`define DECIMATOR_OUT_LINEUP1_CC2_DIS_60_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_60_cc2_dis/decimator_vectors/dec_out_file.csv"}
`define DECIMATOR_OUT_LINEUP1_60_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_60/decimator_vectors/dec_out_file.csv"}
`define DECIMATOR_OUT_LINEUP1_MIXED_100_60_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_mixed/decimator_vectors/dec_out_file.csv"}
`define DECIMATOR_OUT_LINEUP1_DELAY_EXP {`VECTOR_PATH, "/tc_delay_compensation/decimator_vectors/dec_out_file.csv"}

//Mixer UL Vectors
`define MIXER_UL_OUT_LINEUP1_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress/ul_mixer_vectors/Mixer_out_ddc_1_file.csv"}
`define MIXER_UL_OUT_LINEUP2_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress/ul_mixer_vectors/Mixer_out_ddc_2_file.csv"}
`define MIXER_UL_OUT_LINEUP1_CC2_DIS_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_cc2_dis/ul_mixer_vectors/Mixer_out_ddc_1_file.csv"}
`define MIXER_UL_OUT_LINEUP1_CC2_DIS_60_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_60_cc2_dis/ul_mixer_vectors/Mixer_out_ddc_1_file.csv"}
`define MIXER_UL_OUT_LINEUP1_60_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_60/ul_mixer_vectors/Mixer_out_ddc_1_file.csv"}
`define MIXER_UL_OUT_LINEUP2_60_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_60/ul_mixer_vectors/Mixer_out_ddc_2_file.csv"}
`define MIXER_UL_OUT_LINEUP1_MIXED_100_60_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_mixed/ul_mixer_vectors/Mixer_out_ddc_1_file.csv"}
`define MIXER_UL_OUT_LINEUP2_MIXED_100_60_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_mixed/ul_mixer_vectors/Mixer_out_ddc_2_file.csv"}
`define MIXER_UL_OUT_LINEUP1_DELAY_EXP {`VECTOR_PATH, "/tc_delay_compensation/ul_mixer_vectors/Mixer_out_ddc_1_file.csv"}
`define MIXER_UL_OUT_LINEUP2_DELAY_EXP {`VECTOR_PATH, "/tc_delay_compensation/ul_mixer_vectors/Mixer_out_ddc_2_file.csv"}

//DDC
`define DDC_OUT_LINEUP1_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress/ddc_vectors/ddc_out_1_file.csv"}
`define DDC_OUT_LINEUP2_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress/ddc_vectors/ddc_out_2_file.csv"}
`define DDC_OUT_LINEUP1_CC2_DIS_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_cc2_dis/ddc_vectors/ddc_out_1_file.csv"}
`define DDC_OUT_LINEUP1_CC2_DIS_60_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_60_cc2_dis/ddc_vectors/ddc_out_1_file.csv"}
`define DDC_OUT_LINEUP1_60_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_60/ddc_vectors/ddc_out_1_file.csv"}
`define DDC_OUT_LINEUP2_60_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_60/ddc_vectors/ddc_out_2_file.csv"}
`define DDC_OUT_LINEUP1_MIXED_100_60_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_mixed/ddc_vectors/ddc_out_1_file.csv"}
`define DDC_OUT_LINEUP2_MIXED_100_60_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_mixed/ddc_vectors/ddc_out_2_file.csv"}
`define DDC_OUT_LINEUP1_DELAY_EXP {`VECTOR_PATH, "/tc_delay_compensation/ddc_vectors/ddc_out_1_file.csv"}
`define DDC_OUT_LINEUP2_DELAY_EXP {`VECTOR_PATH, "/tc_delay_compensation/ddc_vectors/ddc_out_2_file.csv"}

//Deinterleaver
`define DEINTERLEAVER_OUT_LINEUP1_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress/deinterleaver_vectors/deint_out_1_file.csv"}
`define DEINTERLEAVER_OUT_LINEUP2_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress/deinterleaver_vectors/deint_out_2_file.csv"}
`define DEINTERLEAVER_OUT_LINEUP1_CC2_DIS_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_cc2_dis/deinterleaver_vectors/deint_out_1_file.csv"}
`define DEINTERLEAVER_OUT_LINEUP1_CC2_DIS_60_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_60_cc2_dis/deinterleaver_vectors/deint_out_1_file.csv"}
`define DEINTERLEAVER_OUT_LINEUP1_60_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_60/deinterleaver_vectors/deint_out_1_file.csv"}
`define DEINTERLEAVER_OUT_LINEUP2_60_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_60/deinterleaver_vectors/deint_out_2_file.csv"}
`define DEINTERLEAVER_OUT_LINEUP1_MIXED_100_60_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_mixed/deinterleaver_vectors/deint_out_1_file.csv"}
`define DEINTERLEAVER_OUT_LINEUP2_MIXED_100_60_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_mixed/deinterleaver_vectors/deint_out_2_file.csv"}
`define DEINTERLEAVER_OUT_LINEUP1_MIXED_60_100_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_mixed_60_100/deinterleaver_vectors/deint_out_1_file.csv"}
`define DEINTERLEAVER_OUT_LINEUP2_MIXED_60_100_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_mixed_60_100/deinterleaver_vectors/deint_out_2_file.csv"}
`define DEINTERLEAVER_OUT_LINEUP1_DELAY_EXP {`VECTOR_PATH, "/tc_delay_compensation/deinterleaver_vectors/deint_out_1_file.csv"}
`define DEINTERLEAVER_OUT_LINEUP2_DELAY_EXP {`VECTOR_PATH, "/tc_delay_compensation/deinterleaver_vectors/deint_out_2_file.csv"}
`define DEINTERLEAVER_OUT_LINEUP1_PHASECOMP_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_phasecomp/deinterleaver_vectors/deint_out_1_file.csv"}
`define DEINTERLEAVER_OUT_LINEUP2_PHASECOMP_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_phasecomp/deinterleaver_vectors/deint_out_2_file.csv"}
`define DEINTERLEAVER_OUT_LINEUP1_PHASECOMP_60_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_60_phasecomp/deinterleaver_vectors/deint_out_1_file.csv"}
`define DEINTERLEAVER_OUT_LINEUP2_PHASECOMP_60_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_60_phasecomp/deinterleaver_vectors/deint_out_2_file.csv"}
`define DEINTERLEAVER_OUT_LINEUP1_PRB_BLANK_EXP {`VECTOR_PATH, "/tc_prb_blanking_case_1_compression/deinterleaver_vectors/deint_out_1_file.csv"}
`define DEINTERLEAVER_OUT_LINEUP2_PRB_BLANK_EXP {`VECTOR_PATH, "/tc_prb_blanking_case_1_compression/deinterleaver_vectors/deint_out_2_file.csv"}
`define DEINTERLEAVER_OUT_LINEUP1_SYM_BLANK_EXP {`VECTOR_PATH, "/tc_compression_symbol_blanking/deinterleaver_vectors/deint_out_1_file.csv"}
`define DEINTERLEAVER_OUT_LINEUP1_SYM_AXC_BLANK_EXP {`VECTOR_PATH, "/tc_compression_symbol_blanking_axc_blanking/deinterleaver_vectors/deint_out_1_file.csv"}
`define DEINTERLEAVER_OUT_LINEUP1_SYM_AXC_PRB_BLANK_EXP {`VECTOR_PATH, "/tc_multi_sec_sym_axc_prb_blanking/deinterleaver_vectors/deint_out_1_file.csv"}
`define DEINTERLEAVER_OUT_LINEUP1_MULTI_SEC_EXP {`VECTOR_PATH, "/tc_multi_sec/deinterleaver_vectors/deint_out_1_file.csv"}
`define DEINTERLEAVER_OUT_LINEUP1_1_AXC_BLANK_EXP {`VECTOR_PATH, "/tc_eaxc_blanking_case_1_compression/deinterleaver_vectors/deint_out_1_file.csv"}
`define DEINTERLEAVER_OUT_LINEUP2_1_AXC_BLANK_EXP {`VECTOR_PATH, "/tc_eaxc_blanking_case_1_compression/deinterleaver_vectors/deint_out_2_file.csv"}
`define DEINTERLEAVER_OUT_LINEUP1_PRB_BLANK_60_EXP {`VECTOR_PATH, "/tc_prb_blanking_case_2_compression/deinterleaver_vectors/deint_out_1_file.csv"}
`define DEINTERLEAVER_OUT_LINEUP2_PRB_BLANK_60_EXP {`VECTOR_PATH, "/tc_prb_blanking_case_2_compression/deinterleaver_vectors/deint_out_2_file.csv"}

//FFT
`define FFT_OUT_LINEUP1_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress/fft_vectors/fft_out_1_file.csv"}
`define FFT_OUT_LINEUP2_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress/fft_vectors/fft_out_2_file.csv"}
`define FFT_OUT_LINEUP1_CC2_DIS_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_cc2_dis/fft_vectors/fft_out_1_file.csv"}
`define FFT_OUT_LINEUP1_CC2_DIS_60_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_60_cc2_dis/fft_vectors/fft_out_1_file.csv"}
`define FFT_OUT_LINEUP1_60_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_60/fft_vectors/fft_out_1_file.csv"}
`define FFT_OUT_LINEUP2_60_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_60/fft_vectors/fft_out_2_file.csv"}
`define FFT_OUT_LINEUP1_MIXED_100_60_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_mixed/fft_vectors/fft_out_1_file.csv"}
`define FFT_OUT_LINEUP2_MIXED_100_60_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_mixed/fft_vectors/fft_out_2_file.csv"}
`define FFT_OUT_LINEUP1_MIXED_60_100_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_mixed_60_100/fft_vectors/fft_out_1_file.csv"}
`define FFT_OUT_LINEUP2_MIXED_60_100_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_mixed_60_100/fft_vectors/fft_out_2_file.csv"}
`define FFT_OUT_LINEUP1_DELAY_EXP {`VECTOR_PATH, "/tc_delay_compensation/fft_vectors/fft_out_1_file.csv"}
`define FFT_OUT_LINEUP2_DELAY_EXP {`VECTOR_PATH, "/tc_delay_compensation/fft_vectors/fft_out_2_file.csv"}
`define FFT_OUT_LINEUP1_PRB_BLANK_EXP {`VECTOR_PATH, "/tc_prb_blanking_case_1_compression/fft_vectors/fft_out_1_file.csv"}
`define FFT_OUT_LINEUP2_PRB_BLANK_EXP {`VECTOR_PATH, "/tc_prb_blanking_case_1_compression/fft_vectors/fft_out_2_file.csv"}
`define FFT_OUT_LINEUP1_SYM_BLANK_EXP {`VECTOR_PATH, "/tc_compression_symbol_blanking/fft_vectors/fft_out_1_file.csv"}
`define FFT_OUT_LINEUP1_SYM_AXC_BLANK_EXP {`VECTOR_PATH, "/tc_compression_symbol_blanking_axc_blanking/fft_vectors/fft_out_1_file.csv"}
`define FFT_OUT_LINEUP1_SYM_AXC_PRB_BLANK_EXP {`VECTOR_PATH, "/tc_multi_sec_sym_axc_prb_blanking/fft_vectors/fft_out_1_file.csv"}
`define FFT_OUT_LINEUP1_MULTI_SEC_EXP {`VECTOR_PATH, "/tc_multi_sec/fft_vectors/fft_out_1_file.csv"}
`define FFT_OUT_LINEUP1_1_AXC_BLANK_EXP {`VECTOR_PATH, "/tc_eaxc_blanking_case_1_compression/fft_vectors/fft_out_1_file.csv"}
`define FFT_OUT_LINEUP2_1_AXC_BLANK_EXP {`VECTOR_PATH, "/tc_eaxc_blanking_case_1_compression/fft_vectors/fft_out_2_file.csv"}
`define FFT_OUT_LINEUP1_PRB_BLANK_60_EXP {`VECTOR_PATH, "/tc_prb_blanking_case_2_compression/fft_vectors/fft_out_1_file.csv"}
`define FFT_OUT_LINEUP2_PRB_BLANK_60_EXP {`VECTOR_PATH, "/tc_prb_blanking_case_2_compression/fft_vectors/fft_out_2_file.csv"}

//IFFT-FFT Loopback Vectors
`define IFFT_FFT_LPBK_DEINTERLEAVER_OUT_LINEUP1_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_ifft_fft_lpbk/deinterleaver_vectors/deint_out_1_file.csv"}
`define IFFT_FFT_LPBK_DEINTERLEAVER_OUT_LINEUP2_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_ifft_fft_lpbk/deinterleaver_vectors/deint_out_2_file.csv"}
`define IFFT_FFT_LPBK_DEINTERLEAVER_OUT_LINEUP1_60_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_60_ifft_fft_lpbk/deinterleaver_vectors/deint_out_1_file.csv"}
`define IFFT_FFT_LPBK_DEINTERLEAVER_OUT_LINEUP2_60_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_60_ifft_fft_lpbk/deinterleaver_vectors/deint_out_2_file.csv"}

`define IFFT_FFT_LPBK_FFT_OUT_LINEUP1_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_ifft_fft_lpbk/fft_vectors/fft_out_1_file.csv"}
`define IFFT_FFT_LPBK_FFT_OUT_LINEUP2_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_ifft_fft_lpbk/fft_vectors/fft_out_2_file.csv"}
`define IFFT_FFT_LPBK_FFT_OUT_LINEUP1_60_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_60_ifft_fft_lpbk/fft_vectors/fft_out_1_file.csv"}
`define IFFT_FFT_LPBK_FFT_OUT_LINEUP2_60_EXP {`VECTOR_PATH, "/tc_c_u_coupling_case_1_compress_60_ifft_fft_lpbk/fft_vectors/fft_out_2_file.csv"}


//PRACH Vectors
`define PRACH_OUT_LINEUP1_EXP {`VECTOR_PATH, "/tc_prach_long_format_c_plane/long_prach_vectors/long_prach_lineup1_expected.csv"}
`define PRACH_OUT_LINEUP2_EXP {`VECTOR_PATH, "/tc_prach_long_format_c_plane/long_prach_vectors/long_prach_lineup2_expected.csv"}
`define PRACH_OUT_SHORT_LINEUP1_EXP {`VECTOR_PATH, "/tc_prach_short_format_m_plane/short_prach_vectors/cv_prach_lineup1_expected.csv"}
`define PRACH_OUT_SHORT_LINEUP2_EXP {`VECTOR_PATH, "/tc_prach_short_format_m_plane/short_prach_vectors/cv_prach_lineup2_expected.csv"}
`endif
