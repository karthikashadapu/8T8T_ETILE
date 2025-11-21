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
% File:        ddc_top.m
% Description: ddc processing
%% Should run after duc_out.m %%
%% Input Parameters
function [mixer_out_ddc,ddc_out]=ddc_top(ddc_in,ddc_tb_in,trx)
if(ddc_tb_in.ddc_mux_sel==1)
    data_quantizer = quantizer('fixed','round','saturate',[32 27]);
    real_mux_data = quantize(data_quantizer,ddc_tb_in.ddc_mux_const_real(1,trx)/2^27);
    imag_mux_data = quantize(data_quantizer,ddc_tb_in.ddc_mux_const_imag(1,trx)/2^27);
    ddc_in(1:length(ddc_in),1)=complex(real_mux_data,imag_mux_data);
end
[mixer_out_ddc]=mixer_func(ddc_in,ddc_tb_in.ddc_nco(1,trx)*1e6);
data_quantizer = quantizer('fixed','round','saturate',[16 14]);
[hb1_filt_out1,hb1_filt_out2]= filter(ddc_tb_in.HB2_coeffs*1,1, mixer_out_ddc);
hb1_filt_out=[hb1_filt_out1;hb1_filt_out2];
hb1_filt_out_quant = quantize(data_quantizer,hb1_filt_out(1:2:end));

[hb2_filt_out1,hb2_filt_out2] = filter(ddc_tb_in.HB1_coeffs*1,1, hb1_filt_out_quant);
hb2_filt_out=[hb2_filt_out1;hb2_filt_out2];
hb2_filt_out_quant = quantize(data_quantizer,hb2_filt_out(1:2:end));

[chan_filt_out1,chan_filt_out2] = filter(ddc_tb_in.Chan_filter_coeffs,1,hb2_filt_out_quant);
chan_filt_out=[chan_filt_out1;chan_filt_out2];
ddc_out = quantize(data_quantizer,chan_filt_out);

end