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
%
% Unless otherwise agreed by Intel in writing, you may not remove or alter this
% notice or any other notice embedded in Materials by Intel or Intel's suppliers
% or licensors in any way.
%
% Author:      Nima Safari
% File:        FFTpointExtraction.m
% Description: PRACH FFT-point Extraction

function Nfft = FFTpointExtraction(BW, SCspacing)  
switch BW
   case 10
      Nfft = 15.36 * 1e3 / SCspacing;
   case 20
      Nfft = 30.72 * 1e3 / SCspacing;
   case 30
      Nfft = 61.44 * 1e3 / SCspacing;
   case 40
      Nfft = 61.44 * 1e3 / SCspacing;
   case 50
      Nfft = 61.44 * 1e3 / SCspacing;
   case 60
      Nfft = 122.88 * 1e3 / SCspacing;
   case 70
      Nfft = 122.88 * 1e3 / SCspacing;
   case 80
      Nfft = 122.88 * 1e3 / SCspacing;
   case 90
      Nfft = 122.88 * 1e3 / SCspacing;
   case 100
      Nfft = 122.88 * 1e3 / SCspacing;
   otherwise
      Nfft = 4096;
end