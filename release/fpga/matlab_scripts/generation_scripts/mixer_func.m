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
function[Mixer_out_data]=mixer_func(mixer_in,nco_freq_val)

data_quantizer = quantizer('fixed','round','saturate',[16 14]);
%nco_freq_val =[ 50 -50 -50 50 50 -50 -50 50]*1e6;
Ts=2.034505208333333e-9;
dphi = 0;
Nacc=32;
phOffset = 2^Nacc *dphi/(2*pi);
minSFDR = 96;
Nqacc = ceil((minSFDR)/6);
delay=0;
phIncr = round(nco_freq_val*Ts*2^Nacc);
nco = dsp.NCO('PhaseIncrementSource', 'Property', ...
    'PhaseIncrement',phIncr,...
    'PhaseOffsetSource','Property',...
    'PhaseOffset', phOffset,...
    'NumDitherBits', 4, ...
    'Waveform', 'Complex exponential',...
    'SamplesPerFrame', length(mixer_in),...
    'CustomAccumulatorDataType', numerictype([],Nacc),...
    'OutputDataType','Custom',...
    'CustomOutputDataType',numerictype([],16,15),...
    'NumQuantizerAccumulatorBits',Nqacc);

NCO_out = step(nco);
NCO_out = double([NCO_out(2:end);NCO_out(1)]);
NCO_out_quant = quantize(data_quantizer,NCO_out);

Mixer_out =  mixer_in.* NCO_out_quant ;
mixer_out_quant = quantize(data_quantizer,Mixer_out);

Mixer_out_data= mixer_out_quant;


end