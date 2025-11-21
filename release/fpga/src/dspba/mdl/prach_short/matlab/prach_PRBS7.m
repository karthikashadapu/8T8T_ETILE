% INTEL CONFIDENTIAL
% Copyright 2016 Intel Corporation All Rights Reserved.
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
% Author:      Will Robbins
% File:        prach_PRBS7.m
% Description: Produce Pseudo Random Bit Sequence (PRBS) of specified length
%              from a seven bit LSFR with the generator polynomial x7 + x6 + 1 
% from https://en.wikipedia.org/wiki/Pseudorandom_binary_sequence

function prbs = prach_PRBS7 (length)

  % Initialise seven bit LSFR
  rng(1); % set seed to make PRBS reproducable
  seed = randi(2^7);
  lsfr (1:7) = bitget(seed, 1:1:7);
  prbs (1:length)= 0;
  out_val = [-1, +1];
  
  % Generate PRBS using x7 + x6 + 1
  for i=1:1:length
    newbit = xor(xor(lsfr(7), lsfr(6)), 1); 
    lsfr(1:7) = [newbit, lsfr(1:6)];
    % convert (0,1) to (-1,+1)
    prbs(i) = out_val(newbit+1);
  end
end
  
  