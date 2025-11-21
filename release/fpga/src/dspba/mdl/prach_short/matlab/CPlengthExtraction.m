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
% File:        CPlengthExtraction.m
% Description: Cyclic Prefix Length Extraction

function rxPrach_CP_RMV = CPlengthExtraction(rxPrach, StartOfSym, Format, SCspacing, Nfft, ActivePrachSlot, TimeIndex, PrachSymDuration, NPRACHSlot, MaxPrachOcc)

switch SCspacing
    case 15
        Mu = 0;
        SymPerSF = 15;
    case 30
        Mu = 1;
        SymPerSF = 30;
    case 60
        Mu = 2;
        SymPerSF = 60;
    case 120
        Mu = 3;
        SymPerSF = 120;
end

switch Nfft
    case 512
        k = 1/2;
        ofdm_cp = 288/8;
    case 1024
        k = 1;
        ofdm_cp = 288/4;
    case 2048
        k = 2;
        ofdm_cp = 288/2;
    case 4096
        k = 4;
        ofdm_cp = 288;
    otherwise
        error('FFT size is not supported');
end
        
switch Format
    case 'A1'
        CPlen = k*288/2^Mu;
    case 'A2'
        CPlen = k*576/2^Mu;
    case 'A3'
        CPlen = k*864/2^Mu;        
    case 'B1'
        CPlen = k*216/2^Mu;        
    case 'B2'
        CPlen = k*360/2^Mu;
    case 'B3'
        CPlen = k*504/2^Mu;       
    case 'B4'
        CPlen = k*936/2^Mu;        
    case 'C0'
        CPlen = k*1240/2^Mu;        
    case 'C1'
        error('Please check the Configuration index, Only Short Preamble TDD is supported.')
    case 'C2'
        CPlen = k*2048/2^Mu;        
    case 'A1/B1'        
        CPlen = k*288/2^Mu;   
        if TimeIndex  == MaxPrachOcc -1
            CPlen = k*216/2^Mu;
        end
    case 'A2/B2'
        CPlen = k*576/2^Mu;
        if TimeIndex  == MaxPrachOcc -1
            CPlen = k*360/2^Mu;
        end
    case 'A3/B3'
        CPlen = k*864/2^Mu;
        if TimeIndex  == MaxPrachOcc -1
            CPlen = k*504/2^Mu;
        end
    otherwise
        error('Please check the Configuration index, Only Short Preamble is supported.')
end


CPlen = CPlen + k*16; % 3GPP TS 38.211 Section 5.3.2r


if xor(ActivePrachSlot,NPRACHSlot) == 0
    StartOfPrach = (StartOfSym + TimeIndex*PrachSymDuration)*(Nfft + ofdm_cp);
else 
    StartOfPrach = SymPerSF/2 * Nfft + (StartOfSym + TimeIndex*PrachSymDuration)*(Nfft + ofdm_cp); 
end

rxPrach_CP_RMV = rxPrach(StartOfPrach+ CPlen+1:end);

