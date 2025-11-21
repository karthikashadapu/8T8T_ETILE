% *******************************************************************************
% INTEL CONFIDENTIAL
% Copyright 2023 Intel Corporation All Rights Reserved.
%
% The source code contained or described herein and all documents related to the
% source code ("Material") are owned by Intel Corporation or its suppliers or
% licensors. Title to the Material remains with Intel Corporation or its
% suppliers and licensors. The Material may contain trade secrets and proprietary
% and confidential information of Intel Corporation and its suppliers and
% licensors, and is protected by worldwide copyright and trade secret laws and
% treaty provisions. No part of the Material may be used, copied, reproduced,
% modified, published, uploaded, posted, transmitted, distributed, or disclosed
% in any way without Intel's prior express written permission.
% No license under any patent, copyright, trade secret or other intellectual
% property right is granted to or conferred upon you by disclosure or delivery
% of the Materials, either expressly, by implication, inducement, estoppel or
% otherwise. Any license under such intellectual property rights must be
% express and approved by Intel in writing.
%
% Unless otherwise agreed by Intel in writing, you may not remove or alter this
% notice or any other notice embedded in Materials by Intel or Intel's suppliers
% or licensors in any way.
% *******************************************************************************
function [phase_comp_out] = O_RU_Phase_compensation(data,obj,ifft,sfn_level)
F1 = double(fi(obj.F1,0,64,32));
TLUT = double(fi(obj.lut,0,64,32));
if(ifft)
    phval = exp(-1j*(2*pi*F1*TLUT));
else
    phval = exp(1j*(2*pi*F1*TLUT));
end
if(sfn_level)
    num_slot=2; 
else
    num_slot=20;
end
phval_sym = repelem(phval, obj.NPRB);
phval_slot = repmat(phval_sym,1,num_slot);
phase_comp_out = (phval_slot.') .* data;
end