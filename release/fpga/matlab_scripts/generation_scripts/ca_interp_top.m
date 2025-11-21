% INTEL CONFIDENTIAL
% Copyright 2021 Intel Corporation All Rights Reserved.
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

% Unless otherwise agreed by Intel in writing, you may not remove or alter this
% notice or any other notice embedded in Materials by Intel or Intel's suppliers
% or licensors in any way.
%
% Author:
% File:        ca_interp_top.m
% Description:duc processing(summer and polyphase interpolator)
function [summer_out,interp_out]=ca_interp_top(mixer_out_1,mixer_out_2,ca_interp_obj,trx)
delay1=ca_interp_obj.duc_cc1_delay(1,trx);
delay2=ca_interp_obj.duc_cc2_delay(1,trx);
dfe_lpbk_en = ca_interp_obj.dfe_lpbk_ctrl;
mixer_out_delay=zeros(delay1+delay2+length(mixer_out_1),2);
mixer_out_delay(1:delay1+length(mixer_out_1),1)=[zeros(delay1,1);mixer_out_1];
mixer_out_delay(1:delay2+length(mixer_out_2),2)=[zeros(delay2,1);mixer_out_2];
data_quantizer = quantizer('fixed','round','saturate',[16 14]);
summer_out_data =mixer_out_delay(:,1)+mixer_out_delay(:,2);
summer_out_quant = quantize(data_quantizer,summer_out_data);
summer_out = summer_out_quant;
data_quantizer = quantizer('fixed','round','saturate',[16 13]);
constgain=quantize(data_quantizer,ca_interp_obj.duc_gain(1,trx)/2^13);
summer_gain_out=(summer_out)*constgain;


Ant1_up2 = upsample(summer_gain_out, 2);
[Ant1_up2_filt1,Ant1_up2_filt2] = filter(ca_interp_obj.HB3_coeffs*2, 1, Ant1_up2);


%%%%%%%%%%%% For RF Loopback, Polyphase interpolator is bypassed. 
if(dfe_lpbk_en==1)
     interp_out=[Ant1_up2_filt1;Ant1_up2_filt2];
else
    interp_out = summer_gain_out;
end


end