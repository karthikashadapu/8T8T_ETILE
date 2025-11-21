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
% Author:      Ajayan Nair & Will Robbins
% File:        prach_generate.m
% Description: Generate sub-frame with PRACH.
%              Inputs set which ZC sequence, which resource block the PRACH
%              starts in, and the timing offset of the PRACH sequence

function [m, ZC_DFT_839] = prach_gen (ZCseq, nRB, offset, bitscale, cs_idx, N_cs, ue)

  % ZCseq = Zanoff-Chu root sequence number
  % nRB = first resource block number which holds the PRACH sequence
  % offset = time offset of the sequence in terms of ZC bits (~30 samples)

  N_zc = 839;          % length of ZC sequence
  %N_cs = 1;            % number of cyclic shifts
  CPRI_bit_width = 16; % Block input is 16b. This is extended from the standard CPRI width of 15b

  % ------------------------------------------------------------------------------ 
  % ZC_Seq Gen, Experimental spectrum synthesis in Freq Domain.
  % Generate ZC sequence.
  % ------------------------------------------------------------------------------ 

  circularShift = -N_cs*cs_idx;

  
  ZC_Seq_x = prach_ZCseq_generate(ZCseq,circularShift);

  % Prepare the ZC sequence for mapping should be in natural order for mapping.
  ZC_DFT_839 = (fft(ZC_Seq_x,N_zc));
  
  % Experimental data for easy tracing.
  % should be natural order as this is mapped to a larger ifft.
  %ZC_DFT_839 =  [1,zeros(1,10),1,zeros(1,10),zeros(1,397),1,zeros(1,418),0];
  %ZC_DFT_839 = 1/2^4*[ones(1,400),zeros(1,39),ones(1,400)];
  %comb = [1 0 0 0 0 0 0 0 ]; 
  %ZC_DFT_839 = [ repmat(comb, 1, 52)...
  %               [0 0 0 1 0 0 0  ]...
  %               repmat(fliplr(comb), 1, 52)];
  %ZC_DFT_839 = awgn(zeros(1,839),0);
    
  % 24576 = 12 x 2048
  % RB = 12 SC * 12 (SC of 1.25 kHz)  = 144
  % 6*144 = 864, ZC = 839.
  % guard band = 25 = 12.5x2.
  % Starting RB for positioning prach 
    
  % Position prach within 864 SC as 13 +839 +12, 
  % it will be shifter by Half SC to produce 12.5+839+12.5
  % 5088, corresponds to 848/2 = 424, ie unused SC in 20Mhz LTE
  prach_position = nRB*144+13;

  % synthesis from -N/2 N/2, natural order.
  % zeros(5088) Active SC(14400) Zeros(5088). (Use random data instead of zeros) 
  switch ue.NULRB
      case 273
          Initial_unused   = 9840; %   (24576*4 - 273*288) / 2 = 9840 or 1/2 * (4096-273*12)/4096 * 98304
          Total_PRACH_samp = 24576*4;
          CP_len = 3168 * 4;
          GT_len = 2976 * 4;
          prach_position = nRB*288+13;
      case 100
          Initial_unused   = 5088; % 5088  
          Total_PRACH_samp = 24576;
          CP_len = 3168 * 4/4;
          GT_len = 2976 * 4/4;
      case 75
          Initial_unused   = 3816; % 5088 *3/4
          Total_PRACH_samp = 18432;
          CP_len = 3168 * 3/4;
          GT_len = 2976 * 3/4;
      case 50
          Initial_unused   = 2544;  % 5088 *2/4
          Total_PRACH_samp = 12288;
          CP_len = 3168 * 2/4;
          GT_len = 2976 * 2/4;
      case 25
          Initial_unused   = 1272;  % 5088 *1/4
          Total_PRACH_samp = 6144;
          CP_len = 3168 * 1/4;
          GT_len = 2976 * 1/4;
  end;
  
  
  synth_ofdm = [prach_PRBS7(Initial_unused),...
                prach_PRBS7(prach_position),...
                ZC_DFT_839,...
                prach_PRBS7(Total_PRACH_samp-prach_position-N_zc-Initial_unused)];
  % Matlab order
  synth_ofdm = ifftshift(synth_ofdm);
  % Convert back to time domain and scale
  t_ofdm_1ms =  128* (ifft((synth_ofdm), Total_PRACH_samp));
  
  % Time offset the whole subframe to see if this can be detected in the PRACH search
  % "offset" is in terms of ZC bits. In practice it can be done in individual samples
  % but this causes a blurred correlation with the simple PRACH search.
  % In a real system this Time Offset would be caused by the propagation time from a distant UE
  % detection of it can be used to "timing advance" the UE.
  samples_per_ZC_bit = Total_PRACH_samp/839;
  sample_offset = round(offset * samples_per_ZC_bit);
   
%   sample_offset
%   Total_PRACH_samp
%   CP_len
%   GT_len
%   size(t_ofdm_1ms)
  
  % Add cyclic prefix & offset (delay in time). Fill each end with random data
  t_ofdm_1ms_cp = ([prach_PRBS7(sample_offset),t_ofdm_1ms(Total_PRACH_samp-CP_len+1:Total_PRACH_samp),t_ofdm_1ms, prach_PRBS7(GT_len-sample_offset)]);

  % Scale the sequence so that its mean is at 'bitscale' bits. e.g.bitscale = 4, sequence mean = 16
  % this is aimed at testing the scaling and saturation in the PRACH RTL
  t_ofdm_1ms_cp_scaled = (2^bitscale/mean(abs(t_ofdm_1ms_cp)))*t_ofdm_1ms_cp;
  
  % Saturate to CPRI bit width as 2's comp value - max/min look the wrong way around, but read the Matlab help on max/min.
  % complex value, so has be saturated in its elements and recombined
  re_t_ofdm_1ms_cp_scaled = real(t_ofdm_1ms_cp_scaled);
  re_t_ofdm_1ms_cp_scaled = min (re_t_ofdm_1ms_cp_scaled,  2^(CPRI_bit_width  )-1);
  re_t_ofdm_1ms_cp_scaled = max (re_t_ofdm_1ms_cp_scaled, -2^(CPRI_bit_width-1)-1);

  im_t_ofdm_1ms_cp_scaled = imag(t_ofdm_1ms_cp_scaled);
  im_t_ofdm_1ms_cp_scaled = min (im_t_ofdm_1ms_cp_scaled,  2^(CPRI_bit_width  )-1);
  im_t_ofdm_1ms_cp_scaled = max (im_t_ofdm_1ms_cp_scaled, -2^(CPRI_bit_width-1)-1);
  
  t_ofdm_1ms_cp_scaled = re_t_ofdm_1ms_cp_scaled + i * im_t_ofdm_1ms_cp_scaled;

  % assign whole subframe to output
  m = t_ofdm_1ms_cp/10; %t_ofdm_1ms_cp_scaled;
end
