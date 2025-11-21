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


  covergroup o_ru_coverage_cg with function sample (o_ru_config_pkg::o_ru_ip_config m_config_cov);

    o_ru_ud_comp_width_cp : coverpoint m_config_cov.ud_comp_width{
       bins ud_comp_width[] = {0,145};
    }
 
    o_ru_cc1_bw_cp : coverpoint m_config_cov.cc1_bw{
       bins cc1_bw[] = {10,14};
    }
 
    o_ru_cc2_bw_cp : coverpoint m_config_cov.cc2_bw{
       bins cc2_bw[] = {10,14};
    }
 
    o_ru_cc1_dis_cp : coverpoint m_config_cov.cc1_dis{
       bins cc1_dis[] = {0,1};
    }
 
    o_ru_cc2_dis_cp : coverpoint m_config_cov.cc2_dis{
       bins cc2_dis[] = {0,1};
    }
 
    o_ru_mtu_size_cp : coverpoint m_config_cov.mtu_size{
       bins mtu_size[] = {0,1500,9000};
    }
 
 
  endgroup : o_ru_coverage_cg


