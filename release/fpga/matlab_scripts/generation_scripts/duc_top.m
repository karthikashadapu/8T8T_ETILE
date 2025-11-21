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
% File:        duc_top.m
% Description:duc processing(channel filter, interpolator and mixer processing)

function [duc_out,mixer_out]=duc_top(duc_in,duc_tb_in,trx)

data_quantizer = quantizer('fixed','round','saturate',[16 14]);
data_in_quant = quantize(data_quantizer,duc_in);
[chan_filt_out1,chan_filt_out2] = filter(duc_tb_in.Chan_filter_coeffs,1,data_in_quant);
chan_filt_out=[chan_filt_out1;chan_filt_out2];
chan_filt_out_quant = quantize(data_quantizer,chan_filt_out);

hb1_filt_in=zeros(size(chan_filt_out_quant,1)*2,1);
hb1_filt_in(1:2:end) = chan_filt_out_quant;
[hb1_filt_out1,hb1_filt_out2] = filter(duc_tb_in.HB1_coeffs*2,1, hb1_filt_in);
hb1_filt_out=[hb1_filt_out1;hb1_filt_out2];
hb1_filt_out_quant = quantize(data_quantizer,hb1_filt_out);

hb2_filt_in=zeros(size(hb1_filt_out_quant,1)*2,1);
hb2_filt_in(1:2:end) = hb1_filt_out_quant;
[hb2_filt_out1,hb2_filt_out2] = filter(duc_tb_in.HB2_coeffs*2,1, hb2_filt_in);
hb2_filt_out=[hb2_filt_out1;hb2_filt_out2];
duc_out = quantize(data_quantizer,hb2_filt_out);
[mixer_out]=mixer_func(duc_out,duc_tb_in.duc_nco(1,trx)*1e6);

end