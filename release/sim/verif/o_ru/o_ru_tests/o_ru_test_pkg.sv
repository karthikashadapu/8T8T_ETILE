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

`ifndef O_RU_TEST_PKG_SV
`define O_RU_TEST_PKG_SV

  package o_ru_test_pkg;
    // Import the UVM class library  and UVM automation macros
    import uvm_pkg::*;
    import o_ru_clk_pkg::*;
    import avsts_pkg::*;
    import avmm_pkg::*;
    import o_ru_config_pkg::*;
    import o_ru_top_env_pkg::*;
    `include "uvm_macros.svh"

    `include "o_ru_base_test.sv"
    `include "../o_ru_sequences/o_ru_pcap_dl_sequence.sv"
    `include "../o_ru_sequences/o_ru_dec_ul_sequence.sv"
    `include "../o_ru_sequences/o_ru_coupling_sequence.sv"
    `include "../o_ru_sequences/o_ru_short_prach_inj_sequence.sv"
    `include "../o_ru_sequences/o_ru_prach_ul_inj_sequence.sv"

    `include "tc_c_u_coupling_case_1_compress.sv"
    `include "tc_c_u_coupling_case_1_compress_mixed.sv"
    `include "tc_c_u_coupling_case_1_compress_mixed_60_100.sv"
    `include "tc_delay_compensation.sv"

    `include "tc_c_u_coupling_case_1_compress_cc2_dis.sv"
    `include "tc_c_u_coupling_case_1_compress_frag_1500.sv"
    `include "tc_c_u_coupling_case_1_no_compress_frag_9000.sv"
    `include "tc_c_u_coupling_case_1_compress_60.sv"
    `include "tc_c_u_coupling_case_1_compress_60_cc2_dis.sv"
    `include "tc_c_u_coupling_case_1_compress_phasecomp.sv"
    `include "tc_c_u_coupling_case_1_compress_60_phasecomp.sv"
    `include "tc_prach_long_format_c_plane.sv"
    `include "tc_prach_long_format_c_plane_cc2dis.sv"
    `include "tc_prb_blanking_case_1_compression.sv"
    `include "tc_prb_blanking_case_2_compression.sv"
    `include "tc_eaxc_blanking_case_1_compression.sv"
    `include "tc_fft_injection_ul_long_cont_100mhz.sv"
    `include "tc_fft_injection_ul_long_cont_60mhz.sv"
    `include "tc_fft_injection_ul_long_cont_cfg_idx24.sv"
    `include "tc_window_on_time.sv"
    `include "tc_fft_injection_prach_window_ontime.sv"
    `include "tc_write_read_dfe_registers.sv"
    `include "tc_reg_hw_reset_base.sv"
    `include "tc_reg_hw_reset.sv"
    `include "tc_eaxc_blanking_case_1_compression_cc2_dis.sv"
    `include "tc_compression_symbol_blanking.sv"
    `include "tc_compression_symbol_axc_blanking.sv"
    `include "tc_multi_sec.sv"
    `include "tc_multi_sec_prb_blanking.sv"
    `include "tc_multi_sec_axc_sym_blank.sv"
    `include "tc_multi_sec_axc_blank.sv"
    `include "tc_multi_sec_sym_blank.sv"
    `include "tc_multi_sec_sym_axc_prb_blanking.sv"

  endpackage : o_ru_test_pkg

`endif
