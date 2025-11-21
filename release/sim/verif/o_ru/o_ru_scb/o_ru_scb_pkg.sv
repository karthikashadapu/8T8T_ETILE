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

`ifndef O_RU_SCB_PKG_SV
`define O_RU_SCB_PKG_SV

package  o_ru_scb_pkg;
  
  import uvm_pkg::*;
  import o_ru_clk_pkg::*;
  import  o_ru_config_pkg::*;
  import  avsts_pkg::*;
  import  avmm_pkg::*;
  import o_ru_tbstruct::*;
  `include "uvm_macros.svh"
  `include "../o_ru_scb/o_ru_coverage.sv"
  `include "../o_ru_scb/o_ru_ref_avsts_item.sv"
  `include "../o_ru_scb/o_ru_base_ref.sv"
  `include "../o_ru_scb/o_ru_base_cmp.sv"
  `include "../o_ru_scb/o_ru_ref_windowing.sv"
  `include "../o_ru_scb/o_ru_ref_windowing_ul.sv"
  `include "../o_ru_scb/o_ru_ref_ecpri_demapper.sv"
  `include "../o_ru_scb/o_ru_ref_ecpri_header_extract.sv"
  `include "../o_ru_scb/o_ru_ref_oran_demapper.sv"
  `include "../o_ru_scb/o_ru_ref_fdv_demapper.sv"
  `include "../o_ru_scb/o_ru_ref_ifft.sv"
  `include "../o_ru_scb/o_ru_ref_ifft_power_meter.sv"
  `include "../o_ru_scb/o_ru_ref_interleaver.sv"
  `include "../o_ru_scb/o_ru_ref_duc.sv"
  `include "../o_ru_scb/o_ru_ref_mixer_dl.sv"
  `include "../o_ru_scb/o_ru_ref_summer.sv"
  `include "../o_ru_scb/o_ru_ref_interpolator.sv"
  `include "../o_ru_scb/o_ru_ref_decimator.sv"
  `include "../o_ru_scb/o_ru_ref_mixer_ul.sv"
  `include "../o_ru_scb/o_ru_ref_ddc.sv" 
  `include "../o_ru_scb/o_ru_ref_deinterleaver.sv"
  `include "../o_ru_scb/o_ru_ref_fft.sv"
  `include "../o_ru_scb/o_ru_ref_fft_power_meter.sv"
  `include "../o_ru_scb/o_ru_ref_prach.sv"
  `include "../o_ru_scb/o_ru_ref_c_u_coupling.sv"
  `include "../o_ru_scb/o_ru_ref_oran_mapper.sv"
  `include "../o_ru_scb/o_ru_ref_ecpri_mapper.sv"
  `include "../o_ru_scb/o_ru_ref_oran_prach_mapper.sv"
  `include "../o_ru_scb/o_ru_ref_ecpri_prach_mapper.sv"
  `include "../o_ru_scb/o_ru_ref.sv"
  `include "../o_ru_scb/o_ru_cmp.sv"
  `include "../o_ru_scb/o_ru_scb.sv"

endpackage :  o_ru_scb_pkg

`endif
