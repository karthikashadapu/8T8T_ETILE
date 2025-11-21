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
% Author:
% File:        fft_top.m
% Description: top file to load settings for dspb and expected vector
% to perform subsystem processing

function [fft_out_sim,cp_removal,power_meter_fft_td_out]=fft_top(fft_in,fft_tb_in,group_delay,ant_delay,sfn_level)
data_quantizer = quantizer('fixed','round','saturate',[16 14]);
real_data=quantize(data_quantizer,bitand(fft_tb_in.constgain,hex2dec('ffff'))/2^14);
imag_data=quantize(data_quantizer,bitand(bitshift(fft_tb_in.constgain,-16),hex2dec('ffff'))/2^14);
constgain=complex(real_data,imag_data);

delay=group_delay+ant_delay;

if(sfn_level)
    num_symbol=28;
    fft_in_size=122880;
    size=91728;
else
    num_symbol=280;
    fft_in_size=1228800;
    size=917280;
end

fft_out_sim = zeros(size,1);
fft_in = fft_in * constgain;                            
[fft_output,cp_remove,power_meter_fft_td] = O_RU_lte_ofdm_demodulation(fft_in(delay+1:fft_in_size+delay),fft_tb_in.bw_sel,fft_tb_in.DC_SC_EN,fft_tb_in.rc_en,fft_tb_in.Chan_filter_coeffs,1);
if (fft_tb_in.Tech_CP)
    phase_comp_out= O_RU_Phase_compensation(fft_output,fft_tb_in,0,sfn_level);
    fft_out_sim(1:length(fft_output),1)=phase_comp_out;
else
    fft_out_sim(1:length(fft_output),1)=fft_output;
end
[fft_out_sim]=fft_out_sim/(2^(fft_tb_in.fftshift));
cp_removal(1:length(cp_remove),1)=cp_remove;
power_meter_fft_td_out(1:length(power_meter_fft_td),1)=power_meter_fft_td;
end