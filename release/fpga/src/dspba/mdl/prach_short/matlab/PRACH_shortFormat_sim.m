
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
% File:        PRACH_shortFormat_sim.m
% Description: TDD FR1 Short-Preamble PRACH Simulation

clear all;
close all;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%%%%%%%% PRACH WAVEFORM GENERATION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%            FrequencyRange: 'FR1'
%                DuplexMode: 'FDD'
%        ConfigurationIndex: 106
%         SubcarrierSpacing: 30
%             SequenceIndex: 0
%             PreambleIndex: 0
%             RestrictedSet: 'UnrestrictedSet'
%       ZeroCorrelationZone: 0
%                  RBOffset: 0
%            FrequencyStart: 0
%            FrequencyIndex: 0
%                 TimeIndex: 0
%           ActivePRACHSlot: 0
%                NPRACHSlot: 0
% 
%    Read-only properties:
%                    Format: 'A1'
%                       LRA: 139
%          NumTimeOccasions: 6
%             PRACHDuration: 2
%            SymbolLocation: 0
%     SubframesPerPRACHSlot: 0.5000
%       PRACHSlotsPerPeriod: 20

%% PRACH Configuration Guidlines and Ranges:
% FrequencyRange        : fixed to 'FR1'
% DuplexMode            : fixed to 'TDD'
% ConfigurationIndex    : 67 .. 255 
% SubcarrierSpacing     : 30
% SequenceIndex         : 0 .. 137, default = 53
% PreambleIndex         : 0 .. 63, default = 23
% RBOffset              : BW dependent, default = 11
% ZeroCorrelationZone   : Not related to FGPA implementation: 0 .. 15
% ActivePRACHSlot       : 0 , 1
% FrequencyIndex        : default = 0
% TimeIndex             : 0 .. NtRA,slot - 1
% NPRACHSlot            : 0 , 1
 
prach = nrPRACHConfig('FrequencyRange','FR1','DuplexMode','TDD','ConfigurationIndex',167,'SubcarrierSpacing',30,'SequenceIndex',53, ...
    'PreambleIndex', 23,'RBOffset',0,'ZeroCorrelationZone', 1, 'ActivePRACHSlot',0,'FrequencyIndex', 0, 'TimeIndex',0,'NPRACHSlot',0);
waveconfig.PRACH.Config = prach;
waveconfig.NumSubframes = 160;

waveconfig.Carriers = nrCarrierConfig;
% waveconfig.Carriers
%               NCellID: 1
%     SubcarrierSpacing: 30
%          CyclicPrefix: 'normal'
%             NSizeGrid: 52
%            NStartGrid: 0
%                 NSlot: 0
%                NFrame: 0
% 
%    Read-only properties:
%        SymbolsPerSlot: 14
%      SlotsPerSubframe: 2
%         SlotsPerFrame: 20


BW = 100; %MHz 10, 20, 30, 40, 50, 60, 70, 80, 90, 100

switch BW
    case 10
        SamplePerSubF = 15360;
        waveconfig.Carriers.NSizeGrid = 24; % (3GPP TS 138104 Table 5.3.2-1).  Assuming 30kHz SCS
    case 20
        SamplePerSubF = 30720;
        waveconfig.Carriers.NSizeGrid = 51; % (3GPP TS 138104 Table 5.3.2-1).  Assuming 30kHz SCS
    case 30
        SamplePerSubF = 61440;
        waveconfig.Carriers.NSizeGrid = 78; % (3GPP TS 138104 Table 5.3.2-1).  Assuming 30kHz SCS
    case 40
        SamplePerSubF = 61440;
        waveconfig.Carriers.NSizeGrid = 106; % (3GPP TS 138104 Table 5.3.2-1).  Assuming 30kHz SCS
    case 50
        SamplePerSubF = 61440;  
        waveconfig.Carriers.NSizeGrid = 133; % (3GPP TS 138104 Table 5.3.2-1).  Assuming 30kHz SCS
    case 60
        SamplePerSubF = 122880;
        waveconfig.Carriers.NSizeGrid = 162; % (3GPP TS 138104 Table 5.3.2-1).  Assuming 30kHz SCS
    case 70
        SamplePerSubF = 122880;
        waveconfig.Carriers.NSizeGrid = 189; % (3GPP TS 138104 Table 5.3.2-1).  Assuming 30kHz SCS
    case 80
        SamplePerSubF = 122880;
        waveconfig.Carriers.NSizeGrid = 217; % (3GPP TS 138104 Table 5.3.2-1).  Assuming 30kHz SCS
    case 90
        SamplePerSubF = 122880;
        waveconfig.Carriers.NSizeGrid = 245; % (3GPP TS 138104 Table 5.3.2-1).  Assuming 30kHz SCS
    case 100
        SamplePerSubF = 122880;
        waveconfig.Carriers.NSizeGrid = 273; % (3GPP TS 138104 Table 5.3.2-1).  Assuming 30kHz SCS
end

if prach.RBOffset > (waveconfig.Carriers.NSizeGrid - 12)
    error('RBoffset should NOT be bigger than NumPRB - 12')
end
% waveconfig.Carriers.NSizeGrid = 273; % need to change according to BW (3GPP TS 138104 Table 5.3.2-1)

waveconfig.Carriers.SubcarrierSpacing = prach.SubcarrierSpacing;
[waveform,gridset] = hNRPRACHWaveformGenerator(waveconfig);





% Subframe to Send for PRACH testing:
SFN = 1; %waveconfig.NumSubframes 0 .. 15; Needs to be changed accoriding to selected Config Index Table 6.3.3.2-3, TS 138 211 
SubF = 9; % 0 .. 9; Needs to be changed accoriding to selected Config Index Table 6.3.3.2-3, TS 138 211 
waveform = waveform(10*SFN*SamplePerSubF + SubF*SamplePerSubF+1 : 10*SFN*SamplePerSubF + (SubF+1)*SamplePerSubF);
figure(9);plot(real(waveform));hold on;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%% PRACH DETECTION (MATLAB TOOLBOX) %%%%%%%%%%%%%%%%%%%%

[detected, offsets] = hPRACHDetect(waveconfig.Carriers, prach, waveform, (0:63).')


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%% PRACH DETECTION MODEL %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%prach.ZeroCorrelationZone = 1; % Upto 64 Preamble Index
if prach.RestrictedSet == 'UnrestrictedSet'
    RestrictedSet = 0; 
else 
    RestrictedSet = 1; 
end
info.NCS = ZeroCorrIndex(prach.ZeroCorrelationZone,RestrictedSet, prach.SubcarrierSpacing);
info.NZC = prach.LRA;

%%%%%%%%%%%%%% Configuration Parameter Extraction %%%%%%%%%%%%%%%%%%%%
[ActiveSFN, ActiveSubF, StartOfSym, NrPRACHSlot, PrachOccPerSlot, PrachSymDuration, Format] = ConfigIndexDetection (prach.ConfigurationIndex, SFN, SubF)

if prach.TimeIndex > PrachOccPerSlot
    error('PRACH time index should be < NtRA,slot ')
end

rxPrach = waveform * ActiveSFN * ActiveSubF;

Nfft = FFTpointExtraction(BW, waveconfig.Carriers.SubcarrierSpacing)
% IndexB = 12 * (prach.RBOffset - waveconfig.Carriers.NSizeGrid/2) + 3 + prach.LRA;
% IndexA = (Nfft - waveconfig.Carriers.NSizeGrid*12)/2 + 12*prach.RBOffset + 3; % 
startSymFD = (Nfft - waveconfig.Carriers.NSizeGrid*12)/2 + 12*prach.RBOffset + 2; % 

%%%%%% CP Removal/ FFT %%%%%%%%%%%%%%%
rxPrach_CP_RMV = CPlengthExtraction(rxPrach, StartOfSym, Format, prach.SubcarrierSpacing, Nfft, prach.ActivePRACHSlot, prach.TimeIndex, PrachSymDuration, prach.NPRACHSlot, PrachOccPerSlot);

switch Format 
    case 'C0'
        No_FFTS = 1;
    case 'C2'
        No_FFTS = 4;
    otherwise
        No_FFTS = PrachSymDuration;
end
    
for kk = 1:No_FFTS
    PRACH_sym(:,kk) = rxPrach_CP_RMV(Nfft*(kk-1)+1:Nfft*kk);
    figure(99);plot(real(PRACH_sym(:,kk))); hold on;
    %X(:,kk) = fftshift(fft(PRACH_sym(:,kk)));
    X(:,kk) = fft(PRACH_sym(:,kk),Nfft);
    X_reorder(:,kk) = [ X(Nfft/2+1:Nfft,kk) ; X(1:Nfft/2,kk)];
    figure(97);plot(abs(X_reorder(:,kk))); hold on;
    prach_output(:,kk) = X_reorder(startSymFD+1:startSymFD+prach.LRA,kk);
    figure(100);plot(real(prach_output(:,kk)));hold on;
end 


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%% PRACH CORRELATION (DONE IN O_DU)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ZC_seq, PreambleIdx and Offset Detection
if ActiveSFN * ActiveSubF == 0
    disp('No PRACH signal exists in the selected SFN, SubF, and configuration index')
    ZCseq_set = []; PreambleIdx = []; offset = [];
else
    [ZCseq_set, PreambleIdx, offset] = PRACH_corr_detection((prach_output(:,1)), info,prach.SequenceIndex);
end

disp('Detected Zadoff-Chu Sequence is:');
ZCseq_set
disp('Detected Preamble index is:');
PreambleIdx
disp('Detected Offset is:');
offset
