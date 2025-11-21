function [ms_per_sym, max_per_sym] = pwr_meter(pwr_mtr_in,numOFDMsymbols,numAxC)
%% Parameters
fft_size = 4096;
symbol_ind = 1;
%%
ms_per_sym = zeros(numOFDMsymbols, numAxC);

max_per_sym = zeros(numOFDMsymbols, numAxC);
% Generate random data for each channel
qammod_data = pwr_mtr_in;

for symbol_index = symbol_ind:numOFDMsymbols
   % Calculate l1 and l2 
    l1 = (symbol_index - 1) * fft_size + 1;
    l2 = l1 + fft_size - 1;

    for i = 1:numAxC
        subcarrier_map = qammod_data(:,i);
        zero_pad = subcarrier_map(l1:l2);

        ms_per_sym(symbol_index, i) = mean(abs(zero_pad) .^ 2);

        max_per_sym(symbol_index, i) = max(abs(zero_pad).^ 2);
    end
end