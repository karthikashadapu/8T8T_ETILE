% *******************************************************************************
% INTEL CONFIDENTIAL
% Copyright 2024 Intel Corporation All Rights Reserved.
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
function [short_prach_input,short_prach_output,info] = PRACH_sf(prach_sf_in,prach_sfn)
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


prach = nrPRACHConfig('FrequencyRange','FR1','DuplexMode','TDD','ConfigurationIndex',prach_sf_in.config_index,'SubcarrierSpacing',30,'SequenceIndex',prach_sf_in.sequence_number, ...
    'PreambleIndex', prach_sf_in.preamble_index ,'RBOffset',prach_sf_in.frequency_offset,'ZeroCorrelationZone', 1, 'ActivePRACHSlot', prach_sf_in.Active_Prach_slot ,'FrequencyIndex', prach_sf_in.frequency_index, 'TimeIndex',prach_sf_in.time_index ,'NPRACHSlot', prach_sf_in.N_Prach_slot );
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

 subfn=prach_sfn(1,1);
 
% Subframe to Send for PRACH testing:
SFN = 1; %waveconfig.NumSubframes 0 .. 15; Needs to be changed accoriding to selected Config Index Table 6.3.3.2-3, TS 138 211
SubF = subfn; % 0 .. 9; Needs to be changed accoriding to selected Config Index Table 6.3.3.2-3, TS 138 211
waveform = waveform(10*SFN*SamplePerSubF + SubF*SamplePerSubF+1 : 10*SFN*SamplePerSubF + (SubF+1)*SamplePerSubF);
if(prach_sf_in.config_index==167)
    waveform(47329:47329+4096)=waveform(43233:43233+4096);
end
if(prach_sf_in.config_index==156)
    waveform(61440+47329:61440+47329+4096)=waveform(61440+43233:61440+43233+4096);
end
scalein=16;
waveform_scale=waveform*scalein;

%Convert the data into 32bit unsigned interger format
real_data = int16(real(waveform_scale)*2^15);
imag_data = int16(imag(waveform_scale)*2^15);

real_data_u16 = typecast(real_data,'uint16');
imag_data_u16 = typecast(imag_data,'uint16');

real_data_u32 = uint32(real_data_u16);
imag_data_u32 = uint32(imag_data_u16);
imag_data_u32 = bitshift(imag_data_u32,16);

short_prach_input = uint32(bitor(imag_data_u32,real_data_u32));
% if(~SIM_Vectors)
% %Save the Prach in in text file
% input_filename= 'HW_expected/prach_input.txt';
% fileID = fopen(input_filename,'w');
% fprintf(fileID,'%lu\n',short_prach_input);
% end
% if(SIM_Vectors)
% %Save the Prach in in text file
% input_filename= '../../SIM_expected/100MHz_BFP9/prach_input_for_mif.txt';
% fileID = fopen(input_filename,'w');
% fprintf(fileID,'%lu\n',short_prach_input);
% end
% if(SIM_Vectors)
%     bw=100;
%     file_name_prach_in ="../../SIM_expected/100MHz_BFP9/prach_sim_input.txt";
%     id1=fopen(file_name_prach_in,'w');
%     data_rep=repmat(waveform_scale,1,4);
%     data_re=reshape(real(data_rep)',[],1);
%     data_im=reshape(imag(data_rep)',[],1);
%     data(1:2:length(data_im)*2)=int16(2^15*data_im(:,1));
%     data(2:2:length(data_re)*2)=int16(2^15*data_re(:,1));
%     fprintf(id1,'%d,%d\n',data);
%     fclose(id1);
% end
% figure(9);plot(real(waveform));hold on;
% fclose(fileID);

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%% PRACH DETECTION (MATLAB TOOLBOX) %%%%%%%%%%%%%%%%%%%%

[detected, offsets] = hPRACHDetect(waveconfig.Carriers, prach, waveform, (0:63).');


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
% if(~SIM_Vectors)
% save("HW_expected/prach_info.mat","info");
% end
%%%%%%%%%%%%%% Configuration Parameter Extraction %%%%%%%%%%%%%%%%%%%%
[ActiveSFN, ActiveSubF, StartOfSym, NrPRACHSlot, PrachOccPerSlot, PrachSymDuration, Format] = ConfigIndexDetection (prach.ConfigurationIndex, SFN, SubF)

if prach.TimeIndex > PrachOccPerSlot
    error('PRACH time index should be < NtRA,slot ')
end

rxPrach = waveform * ActiveSFN * ActiveSubF * scalein;

Nfft = FFTpointExtraction(BW, waveconfig.Carriers.SubcarrierSpacing);
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
    %figure(99);plot(real(PRACH_sym(:,kk))); hold on;
    %X(:,kk) = fftshift(fft(PRACH_sym(:,kk)));
    X(:,kk) = fft(PRACH_sym(:,kk),Nfft);
    X_reorder(:,kk) = [ X(Nfft/2+1:Nfft,kk) ; X(1:Nfft/2,kk)];
    % figure(97);plot(abs(X_reorder(:,kk))); hold on;
    prach_output(:,kk) = X_reorder(startSymFD+1:startSymFD+prach.LRA,kk);
    %  figure(100);plot(real(prach_output(:,kk)));hold on;
end


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%% PRACH CORRELATION (DONE IN O_DU)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ZC_seq, PreambleIdx and Offset Detection
% if ActiveSFN * ActiveSubF == 0
%     disp('No PRACH signal exists in the selected SFN, SubF, and configuration index')
%     ZCseq_set = []; PreambleIdx = []; offset = [];
% else
%     [ZCseq_set, PreambleIdx, offset] = PRACH_corr_detection((prach_output(:,1)), info,prach.SequenceIndex);
% end

% disp('Detected Zadoff-Chu Sequence is:');
% ZCseq_set
% disp('Detected Preamble index is:');
% PreambleIdx
% disp('Detected Offset is:');
% offset

prach_output(1:length(prach_output)+5,:)=[ zeros(2,No_FFTS); prach_output; zeros(3,No_FFTS)];
prach_data_rep=reshape(prach_output,[],1);
short_prach_output=prach_data_rep./2^12;
% prach_expected=[prach_data prach_data prach_data prach_data prach_data prach_data prach_data prach_data];
% if(~SIM_Vectors)
% output_filename='HW_expected/prach_output.mat';
% save(output_filename,'prach_expected');
% end
% data=[];
% if(SIM_Vectors)
%     file_name_prach_l1_out ="../../SIM_expected/100MHz_BFP9/prach_lineup1_expected.txt";
%     id2=fopen(file_name_prach_l1_out,'w');
%     file_name_prach_l2_out ="../../SIM_expected/100MHz_BFP9/prach_lineup2_expected.txt";
%     id3=fopen(file_name_prach_l2_out,'w');
%     for j=1:4
%         prach_out1(:,j)=prach_expected(:,(j*2)-1);
%         prach_out2(:,j)=prach_expected(:,j*2);
%     end
%     prach_out1_re=reshape(real(prach_out1)',[],1);
%     prach_out1_im=reshape(imag(prach_out1)',[],1);
%     data(1:2:length(prach_out1_im)*2)=int16(2^15*prach_out1_im(:,1));
%     data(2:2:length(prach_out1_re)*2)=int16(2^15*prach_out1_re(:,1));
%     fprintf(id2,'%d,%d,%d,%d,%d,%d,%d,%d\n',data);
%     fclose(id2);
%     prach_out2_re=reshape(real(prach_out2)',[],1);
%     prach_out2_im=reshape(imag(prach_out2)',[],1);
%     data(1:2:length(prach_out2_im)*2)=int16(2^15*prach_out2_im(:,1));
%     data(2:2:length(prach_out2_re)*2)=int16(2^15*prach_out2_re(:,1));
%     fprintf(id3,'%d,%d,%d,%d,%d,%d,%d,%d\n',data);
%     fclose(id3);
%     clear all;
% end
