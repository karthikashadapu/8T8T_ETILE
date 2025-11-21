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
% File:        ifft_top.m
% Description: ifft processing
function [ifft_out,ifft_output,phase_comp_data_out,power_meter_ifft_fd]= ifft_top(ifft_in,ifft_tb_in,sfn_level)
data_quantizer = quantizer('fixed','round','saturate',[16 14]);
real_data=quantize(data_quantizer,bitand(ifft_tb_in.constgain,hex2dec('ffff'))/2^14);
imag_data=quantize(data_quantizer,bitand(bitshift(ifft_tb_in.constgain,-16),hex2dec('ffff'))/2^14);
constgain=complex(real_data,imag_data);
if(sfn_level)
    num_symbol=28; 
else
    num_symbol=280;
end
if (ifft_tb_in.Tech_CP)
    [phase_comp_data_out] =O_RU_Phase_compensation(ifft_in(1:ifft_tb_in.NPRB * num_symbol),ifft_tb_in,1,sfn_level);
else
    phase_comp_data_out=ifft_in;
end
[~,ifft_out,ifft_output,power_meter_ifft_fd] = O_RU_lte_ofdm_modulation(phase_comp_data_out(1:ifft_tb_in.NPRB *num_symbol),0,ifft_tb_in.bw_sel,ifft_tb_in.DC_SC_EN,ifft_tb_in.rc_en,ifft_tb_in.Chan_filter_coeffs,1);
if(ifft_tb_in.Muxsel==0)
    [ifft_out]=(ifft_out/(2^(ifft_tb_in.ifftshift-log2(4096))))*constgain;
else
    data_quantizer = quantizer('fixed','round','saturate',[16 15]);
    real_mux_data = quantize(data_quantizer,bitand(ifft_tb_in.MuxConstData,hex2dec('ffff'))/2^15);
    imag_mux_data = quantize(data_quantizer,bitand(bitshift(ifft_tb_in.MuxConstData,-16),hex2dec('ffff'))/2^15);
    mux_const(1:length(ifft_out),1)=complex(real_mux_data, imag_mux_data);
    [ifft_out]=(mux_const/(2^(ifft_tb_in.ifftshift-log2(4096))))*constgain;
end

end
