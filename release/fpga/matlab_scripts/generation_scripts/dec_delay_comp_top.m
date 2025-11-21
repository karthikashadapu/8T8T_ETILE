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
% Author:      
% File:        dec_delay_comp_top.m
% Description: ddc processing(decimator)
%% Should run after duc_out.m %%
%% Input Parameters
function [Decimator_out,dec_dly_out1,dec_dly_out2]=dec_delay_comp_top(decimator_in,dec_obj,trx)

[Ant1_down2_filt1,Ant1_down2_filt2] = filter(dec_obj.HB3_coeffs,1,decimator_in);
Ant1_down2_filt=[Ant1_down2_filt1;Ant1_down2_filt2];
decimator_out = downsample(Ant1_down2_filt,2);


data_quantizer = quantizer('fixed','round','saturate',[16 13]);
constgain=quantize(data_quantizer,dec_obj.ddc_gain(1,trx)/2^13);

dfe_lpbk_en = dec_obj.dfe_lpbk_ctrl;

if(dfe_lpbk_en==1)
    Decimator_out=(decimator_out)*constgain;
else
    Decimator_out=(decimator_in)*constgain;
end

delay1=dec_obj.ddc_cc1_delay(1,trx);
delay2=dec_obj.ddc_cc2_delay(1,trx);
dec_dly_out1=zeros(delay1+delay2+length(Decimator_out),1); 
dec_dly_out2=zeros(delay1+delay2+length(Decimator_out),1); 
dec_dly_out1(1:delay1+length(Decimator_out),1)=[zeros(delay1,1);Decimator_out];
dec_dly_out2(1:delay2+length(Decimator_out),1)=[zeros(delay2,1);Decimator_out];
end
