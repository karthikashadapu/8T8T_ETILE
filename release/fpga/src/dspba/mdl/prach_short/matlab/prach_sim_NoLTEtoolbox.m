clear all;clc;close all;


%% UE Configuration
% User Equipment (UE) settings are specified in the structure |ue|.

ue.NULRB = 100;                   % 6 Resource Blocks
ue.DuplexMode = 'FDD';          % Frequency Division Duplexing (FDD)
ue.CyclicPrefixUL = 'Normal';   % Normal cyclic prefix length
ue.NTxAnts = 1;                 % Number of transmission antennas
    
%% PRACH Configuration
% The PRACH configuration is defined in the structure |prach|. This
% configuration is used to create a second structure |info| by calling
% <matlab:doc('ltePRACHInfo') ltePRACHInfo>. This provides information
% about the PRACH generated given a specified configuration. Some of this
% information will be used later in the example.

prach.Format = 0;          % PRACH format: TS36.104, Table 8.4.2.1-1
prach.SeqIdx = 0;         % Logical sequence index: TS36.141, Table A.6-1
prach.CyclicShiftIdx = 1;%ZCZ  % Cyclic shift index: TS36.141, Table A.6-1
prach.HighSpeed = 0;       % Normal mode: TS36.104, Table 8.4.2.1-1
prach.FreqOffset = 91;%0;      % Default frequency location
prach.PreambleIdx = 8;%PID    % Preamble index: TS36.141, Table A.6-1

info.NCS = ZeroCorrIndex(prach.CyclicShiftIdx,prach.HighSpeed);
info.NZC = 839;

%% %%%%%%%%%%%%%%% Generating LTE compliant PRACH sequence Generation (No LTE toolbox required)%%%%%%%%%%         
        CS_index = prach.PreambleIdx;
        ZCseq = prach.SeqIdx;
        nRB = prach.FreqOffset;
        offset = 0; 
        bitscale = 1;
        [prach_data, ZC_DFT_839] = prach_gen (ZCseq, nRB, offset, bitscale, CS_index, info.NCS);
        prach_data = transpose(prach_data);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
rxwave = prach_data;
%IQ_tst13 = load('Data/uliq00_tst13.bin.txt');
%rxwave = complex(IQ_tst13(1:30720,1),IQ_tst13(1:30720,2))/2^15;

%x = load('Data/prach_183/uliq00_tst183.mat');
%rxwave = 20*x.subframe_data;

%% Detection by passing through HW model/setup

% HW Fixed-point Matlab model PRACH Detection
x.prach_output = prach_fixedP_model(rxwave,info,prach);

% SetUP Capture 
%x = load('Data/prach_output_HW_nRB90_ZCseq0_CSidx8');
%x = load('Data/prach_output_HW_nRB90_ZCseq0_CSidx12');
%x = load('Data/prach_output_HW_nRB90_ZCseq0_CSidx21');
%x = load('Data/tst13_HWsetup_prachout_839.mat'); x.prach_output = x.y;
%x = load('Data/prach_output_tst13');



prach_ZC = fftshift(x.prach_output); % Similar as: prach_ZC = [x.prach_output(421:end); x.prach_output(1:420)];

%% ZC_seq, PreambleIdx and Offset Detection
info.NCS = ZeroCorrIndex(prach.CyclicShiftIdx,prach.HighSpeed);
info.NZC = 839;
[ZCseq_set, PreambleIdx, offset] = PRACH_corr_detection(prach_ZC, info);

disp('Detected Zadoff-Chu Sequence is:');
ZCseq_set
disp('Detected Preamble index is:');
PreambleIdx
disp('Detected Offset is:');
offset
