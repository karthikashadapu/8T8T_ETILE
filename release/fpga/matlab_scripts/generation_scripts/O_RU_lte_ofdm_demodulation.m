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

function [demodulated_signal,fft_after_cp_rmv,power_meter_fft_td] = O_RU_lte_ofdm_demodulation (signal,bandwidth,dc_sc_enable,rc_enable,chan_filt_coeff,varargin)

if(nargin == 4)
    symbol_index_start = varargin{1};
else
    symbol_index_start = 1;
end

switch bandwidth
    case 60e6
        number_of_subcarriers = 162*12;%1944
        first_cp_length = 352;
        next_cp_length = 288;
        fft_size = 4096;
        symbols_per_slot=14;
    case 100e6
        number_of_subcarriers = 273*12;%3276
        first_cp_length = 352;
        next_cp_length = 288;
        fft_size = 4096;
        symbols_per_slot=14;
end

number_of_symbols = 280;
demodulated_signal = [];
fft_after_cp_rmv=[];
power_meter_fft_td=[];
sample_index = 0;
if(rc_enable)
    Coeff_fft_shift = fftshift(fft(chan_filt_coeff,4096));
    stpt = (4096-number_of_subcarriers)/2+1 ;
    endpt = number_of_subcarriers + (4096-number_of_subcarriers)/2 ;
    compensation = double(abs(ones(1,number_of_subcarriers+1)./Coeff_fft_shift(stpt:endpt+1)));
    filtvector1 = [compensation((number_of_subcarriers/2)+1:end) zeros(1,fft_size-number_of_subcarriers-1) compensation(1:number_of_subcarriers/2)];
end

for symbol_index = symbol_index_start:number_of_symbols
    if(mod(symbol_index,symbols_per_slot)==1)
        cp_count = first_cp_length;
    else
        cp_count = next_cp_length;
    end
    if(length(signal)>= sample_index + cp_count + fft_size)
        cp_removed = signal(sample_index + cp_count +1 : sample_index + cp_count + fft_size);
        fft_out = fft(cp_removed,fft_size);
        if(rc_enable)
            fft_out = fft_out.*transpose(filtvector1);
        end
        demod_symbol = zeros(number_of_subcarriers,1);
        if(dc_sc_enable==0)
            demod_symbol((number_of_subcarriers/2)+1 :number_of_subcarriers) = fft_out(2:(number_of_subcarriers/2)+1) ;
            demod_symbol(1:(number_of_subcarriers/2)) = fft_out(end-(number_of_subcarriers/2)+1:end) ;
        else
            demod_symbol((number_of_subcarriers/2)+1 :number_of_subcarriers) = fft_out(1:(number_of_subcarriers/2)) ;
            demod_symbol(1:(number_of_subcarriers/2)) = fft_out(end-(number_of_subcarriers/2)+1:end) ;
        end
        sample_index = sample_index + fft_size + cp_count;
        power_meter_fft_td = [power_meter_fft_td;cp_removed];
        fft_after_cp_rmv=[fft_after_cp_rmv;cp_removed];
        demodulated_signal = [demodulated_signal;demod_symbol];
    end
end

normalisation_factor = 1;
demodulated_signal = demodulated_signal*normalisation_factor;

end