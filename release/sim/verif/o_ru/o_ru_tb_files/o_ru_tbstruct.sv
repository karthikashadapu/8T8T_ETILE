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

`ifndef O_RU_TBSTRUCT_SV 
`define O_RU_TBSTRUCT_SV 

//------------------------------------------------------------------------------ 
// Name        : o_ru_tbstruct 
// Description : Structures Used in TB
//------------------------------------------------------------------------------ 

package o_ru_tbstruct;

    typedef struct {
     int n_prb ;
     int c_width ;
     int fs_off  ;
    } trans_struct ;

    typedef struct {
     int sym_no ;
     int fft_size ;
     int num_prb ;
     int mu ;
    } trans_struct_ifft_fft ;

endpackage
`endif 
