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

function [qammod_data,modulated_signal,ifft_wocp,power_meter_ifft_fd] = O_RU_lte_ofdm_modulation (data_bits,modulation_scheme,bandwidth,dc_sc_enable,rc_enable,chan_filt_coeff,varargin)


if(nargin >= 7)
    symbol_ind = varargin{1};
    qammod_data = data_bits;
else
    symbol_ind=1;
    qammod_data = qammod(data_bits,modulation_scheme,'InputType','bit','UnitAveragePower',false);
    if(modulation_scheme == 2) % 1-QPSK, 2-16QAM, 3-64QAM
        normalisation_factor = sqrt(2);
        qammod_data = complex(qammod_data,qammod_data);
    elseif(modulation_scheme == 4) % 1-QPSK, 2-16QAM, 3-64QAM
        normalisation_factor = sqrt(2);
    elseif(modulation_scheme == 16)
        normalisation_factor = sqrt(10);
    elseif(modulation_scheme == 64)
        %normalisation_factor = sqrt(42);
        normalisation_factor = sqrt(50);
    elseif(modulation_scheme == 256)
        %normalisation_factor = sqrt(170);
        normalisation_factor = sqrt(230);
    end

    qammod_data = qammod_data./normalisation_factor;
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
if(rc_enable)
    Coeff_fft_shift = fftshift(fft(transpose(chan_filt_coeff),4096));
    stpt = (4096-number_of_subcarriers)/2+1 ;
    endpt = number_of_subcarriers + (4096-number_of_subcarriers)/2 ;
    compensation = double(abs(ones(1,number_of_subcarriers+1)./Coeff_fft_shift(stpt:endpt+1)));
    filtvector1 = [compensation((number_of_subcarriers/2)+1:end) zeros(1,fft_size-number_of_subcarriers-1) compensation(1:number_of_subcarriers/2)];
end


number_of_symbols = ceil(length(qammod_data)/number_of_subcarriers);

qammod_data_pad = zeros(number_of_symbols*number_of_subcarriers,1);
qammod_data_pad(1:length(qammod_data)) = qammod_data;
qammod_data_2d = reshape(qammod_data_pad,number_of_subcarriers,number_of_symbols);

modulated_signal = [];
ifft_wocp = [];
power_meter_ifft_fd=[];
for symbol_index = symbol_ind:number_of_symbols
    subcarrier_map = qammod_data_2d(:,symbol_index);
    if(dc_sc_enable==0)
        zero_pad = [0 ; subcarrier_map((number_of_subcarriers/2)+1:end); zeros(fft_size-number_of_subcarriers-1,1); subcarrier_map(1:number_of_subcarriers/2)];
    else
        zero_pad = [subcarrier_map((number_of_subcarriers/2)+1:end); zeros(fft_size-number_of_subcarriers,1); subcarrier_map(1:number_of_subcarriers/2)];
    end
    
    if(rc_enable)
        zero_pad = zero_pad.*transpose(filtvector1);
    end

    ifft_out = ifft(zero_pad,fft_size);
    if(mod(symbol_index,symbols_per_slot)==1)
        cp_count = first_cp_length;
    else
        cp_count = next_cp_length;
    end
    cp = ifft_out(end-cp_count+1:end);
    power_meter_ifft_fd = [power_meter_ifft_fd;zero_pad];
    ifft_wocp = [ifft_wocp;ifft_out];
    modulated_signal = [modulated_signal; cp ;ifft_out];
end

end

