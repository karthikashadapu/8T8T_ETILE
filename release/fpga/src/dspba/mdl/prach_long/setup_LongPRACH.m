%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% File: setup_prach.m
% This PRACH design supports LTE + 5G PRACH signal demodulations. LTE5/
% LTE10/ LTE20 are suported.
% Description: Script to set variables in Matlab workspace to configure
% author: nima safari
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 clear all;
 close all;
addpath('lib');
%duplicate call
LongPRACH_reg_addr_offsets

% load('dspba_tv_simip.mat');
% load ('local_test_input_output.mat');
%% data load
local_file_sel = 1;

if (local_file_sel==1)
load('local_test_input_output.mat');
lprach_tb_in =lprach_tb_in_local;
lprach_tb_exp_out=lprach_tb_exp_out_local;
disp('local dataset loaded')
else
 load('ext_test_input_output.mat');
lprach_tb_in =lprach_tb_in_ext;
lprach_tb_exp_out=lprach_tb_exp_out_ext;

disp('ext data set loaded')
end

%% CLK Configuration Parameters
prach.ClockRate	= 122.88*4;
prach.ClockMargin = 50.0;





%% Generate PRACH sequence and add AWGN

% UE Configuration
% User Equipment (UE) settings are specified in the structure |ue|.
% LTE100 => 273 RBs
% LTE20  => 100 RBs
% LTE10  => 50  RBs
% LTE5   => 25  RBs

% PRACH Configuration
% The PRACH configuration is defined in the structure |prach|. This
% configuration is used to create a second structure |info| by calling
% <matlab:doc('ltePRACHInfo') ltePRACHInfo>. This provides information
% about the PRACH generated given a specified configuration. Some of this
% information will be used later in the example.


%%% PRACH Sanity Check
% if ue.NULRB~=273 & ue.NULRB~=100 & ue.NULRB~=50 & ue.NULRB~=25
%     error('The Uplink signal specified is not supported. Supported UE NULRB are: LTE20: 100 RBs, LTE15: 75 RBs, LTE10: 50 RBs, LTE5: 25 RBs ')
% end
% if prach.FreqOffset > ue.NULRB - 6
%     error('The PRACH frequency offset value is not supported for specified Uplink signal. FreqOffset =< ue.NULRB -6.')
% end

 

%[prach_data, ZC_DFT_839] = prach_gen(prach.SeqIdx,prach.FreqOffset,offset,bitscale,prach.PreambleIdx,info.NCS, ue);


%% Model configuration


prach.SampleRate =122.88; %TBD
prach.SampleRateMSPS=prach.SampleRate
prach.MaxSampleRate=122.88






%% PRACH parameters

%%waveform
%% PRACH waveform parameters
ue.NULRB = 273;                % 6 RBs are allocated for PRACH output of ue.NULRB
ue.DuplexMode = 'TDD';         % Frequency Division Duplexing (FDD)
ue.CyclicPrefixUL = 'Normal';  % Normal cyclic prefix length
NTxAnts = 4;  
ZeroPadFront =1;
ZeroPadRear=24;

Tcp = 103.125e-6;
Tgt = 96.875e-6;
Tu=800e-6;
Tprach=Tcp+Tgt+Tu;
prach.symStart = (Tcp*(prach.SampleRate*1e6)) * NTxAnts;
prach.symEnd = prach.symStart + (Tu*(prach.SampleRate*1e6)) * NTxAnts; %prach.Nfft * NTxAnts;
prach.seqlength = Tu*(prach.SampleRate*1e6); % for 1 antenna
prach.symPeriod_dec = (Tprach*(prach.SampleRate*1e6)) * NTxAnts;% number of samples after decimation 122880/48 OR 15360/6
prach.no_of_chan = NTxAnts ; 
prach.PRACH_NRPRACHSlot=0;
prach.PRACH_ActivePRACHSlot=0;
prach.CyclicShiftIdx = 1;  % ZCZ  % Cyclic shift index: TS36.141, Table A.6-1
prach.HighSpeed = 0;       % Normal mode: TS36.104, Table 8.4.2.1-1

prach.FreqOffset=lprach_tb_in.prach.FreqOffset;
info.NCS = ZeroCorrIndex(prach.CyclicShiftIdx,prach.HighSpeed,1.25); %% SCS parameter added to make it complaint with new zero corr index function
info.NZC = 839;
%% NCO
%% NCO Configuration
NRFreq_EN=1;

if ue.NULRB ==273
    NprachRB = 3;
    f_OFDM_SP = 30000; % Hz, OFDM subcarrier spacing
    phi = 7; %13 TBD mismatch between all format sim
    info.NZC = 839;  
    f_RACH_SP = 1250; % Hz, PRACH subcarrier Spacing
    K =  f_OFDM_SP / f_RACH_SP;
    nRB_sc = 12;
    k0 = prach.FreqOffset*nRB_sc - ue.NULRB*nRB_sc/2;
   
        if(NRFreq_EN==0)
            realfreq = ( phi + K*(k0)+floor(info.NZC/2) ) * f_RACH_SP; 
            prach.NCO = -2^30 / (prach.SampleRateMSPS*1e6) * ( phi + K*(k0)+floor(info.NZC/2) ) * f_RACH_SP;
            prach.SCstart = 88;
            prach.SCend = 926;
    
        else
            realfreq=NRFreq_calc(prach.FreqOffset);
            prach.NCO = -2^30 / (prach.SampleRateMSPS*1e6)*realfreq;
            prach.SCstart = 88+6;
            prach.SCend = 926+6;
        end
else
    NprachRB = 6;
    f_OFDM_SP = 15000; % Hz, OFDM subcarrier spacing
    phi = 7;
    info.NZC = 839;  
    f_RACH_SP = 1250; % Hz, PRACH subcarrier Spacing
    K =  f_OFDM_SP / f_RACH_SP;
    nRB_sc = 12;
    k0 = prach.FreqOffset*nRB_sc - ue.NULRB*nRB_sc/2;
    prach.NCO = -2^30 / (prach.SampleRateMSPS*1e6) * ( phi + K*(k0+0.5)+floor(info.NZC/2) ) * f_RACH_SP;
end

%append 2 zeros to 30 bit NCO value

q = quantizer('fixed',[30 0]);
y=num2bin(q,prach.NCO);
a='00';
z=strcat(a,y);
prach.NCO=bin2dec(z);
%%% PRACH configuration based on Uplink LTE waveform
switch ue.NULRB 
    case 25
        prach.SampleRateMSPS	=  7.68;
        prach.InWave_SEL = 3;
        CP_len =     3168 * 1/4;
        PRACH_len = 24576 * 1/4;
        prach_mux_sel_0=1; % 1st HB
        prach_mux_sel_1=1; % 2nd HB 
        prach_mux_sel_2=0; % 1st dec_by_3
        prach.grpDelay_comp = 4 ;  % To compensate Time domain processing group delay
    case 50
        prach.SampleRateMSPS    = 15.36;
        prach.InWave_SEL = 2;
        CP_len =     3168 * 2/4;
        PRACH_len = 24576 * 2/4;
        prach_mux_sel_0=1; % 1st HB
        prach_mux_sel_1=0; % 2nd HB 
        prach_mux_sel_2=0; % 1st dec_by_3
        prach.grpDelay_comp = 5 ;  % To compensate Time domain processing group delay
%     case 75
%         prach.SampleRateMSPS    = 23.04;
%         prach.InWave_SEL = 1;
%         CP_len =     3168 * 3/4;
%         PRACH_len = 24576 * 3/4;
%         prach_mux_sel_2=1; % 3rd HB
%         prach_mux_sel_3=0; % 1st dec_by_3 
%         prach_mux_sel_4=1; % 4th HB
%         prach_mux_sel_5=0; % 2nd dec_by_3
%         prach.grpDelay_comp = 5 ;  % To compensate Time domain processing group delay
    case 100
        prach.SampleRateMSPS    = 30.72;
        prach.InWave_SEL = 0;  
        CP_len =     3168 * 4/4;
        PRACH_len = 24576 * 4/4;
        prach_mux_sel_0=0; % 1st HB
        prach_mux_sel_1=0; % 2nd HB 
        prach_mux_sel_2=0; % 1st dec_by_3
        prach.grpDelay_comp = 6 ;  % To compensate Time domain processing group delay 
    
      case 273
        prach.SampleRateMSPS    = 122.88;
        prach.InWave_SEL = 0;  
        CP_len =     3168 * 4/4; %TBD
        PRACH_len = 24576 * 4/4; %TBD
        prach_mux_sel_0=0; % 1st HB
        prach_mux_sel_1=0; % 2nd HB 
        prach_mux_sel_2=0; % 1st dec_by_3
        prach.grpDelay_comp = 6 ;  % To compensate Time domain processing group delay 
   
    
    
    otherwise     
        error('The module only supports 25, 50, 100 UL RBs')
end;



%% 
%% %% FFT Configuration
prach.Nfft = 1024; %2048
prach.Nprachseq = prach.Nfft;
prach.fft_pkt_dly = 150;
fft_channel = 1;
%% Decimator Configurationclear  all;
 prach.SampleRate=122.88

% [ Hd ,b_decimator1]= filtdesign(92,0.05,0.1); 
% [ Hd ,b_decimator2]= filtdesign(26,0.5,0.7);
% [ Hd ,b_decimator3]= filtdesign(36,0.5,0.7);
% [ Hd ,b_decimator4]= filtdesign(40,0.5,0.7);
% [ Hd ,b_decimator5]= filtdesign(40,0.5,0.7);
% [ Hd ,b_decimator6]= filtdesign(48,0.5,0.7);

% [ Hd ,b_decimator1]= filtdesign(8,0.05,0.1); 
% [ Hd ,b_decimator2]= filtdesign(6,0.5,0.7);
% [ Hd ,b_decimator3]= filtdesign(8,0.5,0.7);
% [ Hd ,b_decimator4]= filtdesign(10,0.5,0.7);
% [ Hd ,b_decimator5]= filtdesign(8,0.5,0.7);
% [ Hd ,b_decimator6]= filtdesign(10,0.5,0.7);
%ripplecomp coeff
fc=0.84;
fs_s=1;
[ Hd ,b_decimator1]= filtdesign(8,(fc/61.44),((fs_s*20.48)/61.44)); %sig BW = 1MHz, fs=122.88Mhz , Decimation by 3=> +ve spec fstop=0.33(w.r.t fs/2 , i.e fs/2 is mapped to 1) , fpass=1MHz => +ve spec for fpass=(1/61.44 w.r.t fs/2 i.e fs/2 is mapped to 1)
[ Hd ,b_decimator2]= filtdesign(6,(fc/20.48),((fs_s*10.24)/20.48));  %%sig BW = 1MHz, fs=40.96Mhz , Decimation by 2=> +ve spec fstop=0.5(w.r.t fs/2 , i.e fs/2 is mapped to 1) , fpass=1MHz => +ve spec for fpass=(1/20.48 w.r.t fs/2 i.e fs/2 is mapped to 1)
[ Hd ,b_decimator3]= filtdesign(8,(fc/10.24),((fs_s*5.12)/10.24)); %%sig BW = 1MHz, fs=20.48Mhz , Decimation by 2=> +ve spec fstop=0.5(w.r.t fs/2 , i.e fs/2 is mapped to 1) , fpass=1MHz => +ve spec for fpass=(1/10.24 w.r.t fs/2 i.e fs/2 is mapped to 1)
[ Hd ,b_decimator4]= filtdesign(10,(fc/5.12),((fs_s*2.56)/5.12));%Fs=10.24M
[ Hd ,b_decimator5]= filtdesign(8,(fc/2.56),((fs_s*1.28)/2.56));%fs=5.12M
[ Hd ,b_decimator6]= filtdesign(42,(0.54/1.28),(0.64/1.28));%fs=2.56M



decimator_gain1=1;
decimator_factor1 = 3;
decimator1_clk_rate = prach.SampleRate;
grpdelay1 = length(b_decimator1)*0.5*(1/decimator1_clk_rate);

decimator_gain2=1;
decimator_factor2 = 2;
decimator2_clk_rate = prach.SampleRate/(decimator_factor1) ;
grpdelay2 = length(b_decimator2)*0.5*(1/decimator2_clk_rate);


decimator_gain3=1;
decimator_factor3 = 2;
decimator3_clk_rate = prach.SampleRate/(decimator_factor1*decimator_factor2) ;
grpdelay3 = length(b_decimator3)*0.5*(1/decimator3_clk_rate);


decimator_gain4=1;
decimator_factor4 = 2;
decimator4_clk_rate = prach.SampleRate/(decimator_factor1*decimator_factor2*decimator_factor3) ;
grpdelay4 = length(b_decimator4)*0.5*(1/decimator4_clk_rate);



decimator_gain5=1;
decimator_factor5 = 2;
decimator5_clk_rate = prach.SampleRate/(decimator_factor1*decimator_factor2*decimator_factor3*decimator_factor4) ;
grpdelay5 = length(b_decimator5)*0.5*(1/decimator5_clk_rate);



decimator_gain6=1;
decimator_factor6 = 2;
decimator6_clk_rate = prach.SampleRate/(decimator_factor1*decimator_factor2*decimator_factor3*decimator_factor4*decimator_factor5) ;
grpdelay6 = length(b_decimator6)*0.5*(1/decimator6_clk_rate);



TotalGrpdelay = grpdelay1+grpdelay2+grpdelay3+grpdelay4+grpdelay5+grpdelay6

prach_out_clkrate = prach.SampleRate/(decimator_factor1*decimator_factor2*decimator_factor3*decimator_factor4*decimator_factor5*decimator_factor6) ;
Grpdelay_wrt_clkcycle = TotalGrpdelay/((1/prach_out_clkrate))


deimator_shift=1;






Groupdelay_offset_ant0 = round(Grpdelay_wrt_clkcycle);

Groupdelay_offset_ant1 = round(Grpdelay_wrt_clkcycle);

Groupdelay_offset_ant2 = round(Grpdelay_wrt_clkcycle);

Groupdelay_offset_ant3 = round(Grpdelay_wrt_clkcycle);



%% MM Register Setting




%prach.symPeriod_dec = (Tprach*(prach.SampleRate*1e6)) * NTxAnts;% number of samples after decimation 122880/48 OR 15360/6
%prach.SimulationTime = 4*500000;




prach.SampleTime=1;
SampleRateMSPS=122.88;

filt_flush_start = 100;
filt_flush_end = filt_flush_start + 4 * 96* 50;
filt_flush_enable=1;
filt_flush_hold=300;


Delayed_Valid_len = 122880*4;
Delay_Valid_by = 122880*2;
if(lprach_tb_in_local.prach.ConfigIndex==16)
poweron_default_val_numstart=8;
prach.SimulationTime =2*491520;
% Timeoffset_input=18528;
else
    poweron_default_val_numstart=1;
    prach.SimulationTime =491520;
    % Timeoffset_input = 3168;
end

Class_Version=0;
Major_vesion=0;
Minor_version=2;
Patch_version=1;

Version_reg_val = Class_Version*2^24 +Major_vesion*2^16 +Minor_version*2^8 +Patch_version;