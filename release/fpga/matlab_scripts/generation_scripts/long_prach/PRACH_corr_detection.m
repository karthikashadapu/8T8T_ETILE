% INTEL CONFIDENTIAL
% Copyright 2015 Intel Corporation All Rights Reserved.
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
%
% Author:      Nima Safari
% File:        PRACH_corr_detection.m
% Description: PRACH Correlation

function [Extracted_ZCseq_set, PreambleIdx, offset, corr_cs] = PRACH_corr_detection(prach_data, info, ZC_root)

N_zc = info.NZC;
N_cs = info.NCS;
MaxNoPreambleID = 64;

for ZCseq=0:1:(N_zc-2)
    freqDomain_prod = prach_data .* (fft(prach_ZCseq_generate(ZCseq,0,N_zc)))';  
    correlation = ifft((freqDomain_prod));
    maxCorrelation(ZCseq+1) = max( abs( correlation ));
end

% Significant Peak Detection
Mag_ave = mean(abs(prach_data));
Detection_TH = sqrt(30) * Mag_ave; % around 15 dB above average (Maybe abit conservative!!)

% Extracted_ZCseq_set = find(maxCorrelation >= Detection_TH) - 1;
Extracted_ZCseq_set = find(maxCorrelation == max(maxCorrelation)) - 1;
% % figure;plot(0:N_zc-2,maxCorrelation);
% % title('Correlation Across All Possible Zadof-Chu roots');

%% LTE toolbox Compliant Preamble Index Correlation Function (No LTE Toolbox required)
if N_cs ==0
    CorrRange = 1;
else
    CorrRange = floor(N_zc/N_cs);
    if CorrRange > 63
        CorrRange = 63;
    end
end
% ll_CS = ceil(MaxNoPreambleID/CorrRange)-1;
for v = 1:MaxNoPreambleID    
    if N_cs == 0
        corr_cs(v) = abs(conj(fft(prach_ZCseq_generate(Extracted_ZCseq_set,-(v-1),N_zc))) * prach_data);
    else
        corr_cs(v) = abs(conj(fft(prach_ZCseq_generate(Extracted_ZCseq_set,-N_cs*(v-1),N_zc))) * prach_data);
    end
end

for kk = 1:Extracted_ZCseq_set - ZC_root
    corr_cs = circshift(corr_cs,CorrRange);
end

%figure;plot([0:63],corr_cs);
%title('Correlation Across All Possible Preamble Indexes for Detected Base Sequence');

PreambleID_TH = 1/2*max(corr_cs);
%PreambleIdx = find(corr_cs == max(corr_cs)) - 1;
PreambleIdx = find(corr_cs >= PreambleID_TH) - 1;

%% LTE toolbox Compliant Offset Detection (No LTE Toolbox required)
for kk = 1:length(PreambleIdx)
    freqD_prod = prach_data .* (fft(prach_ZCseq_generate(Extracted_ZCseq_set,-PreambleIdx(kk)*N_cs,N_zc)))';  
    TimeCorrelation = ifft((freqD_prod));
    Offset_TH = 1/2*max(abs(TimeCorrelation));
    %[max_corr, max_locn] = max(abs(TimeCorrelation));
    offsetIdx = find(abs(TimeCorrelation) >= Offset_TH);
    offset(kk) = offsetIdx(1) - 1;
end
