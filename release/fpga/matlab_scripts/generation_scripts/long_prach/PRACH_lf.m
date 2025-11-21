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
function [long_prach_input,long_prach_output,info,NCO] = PRACH_lf(prach_lf_in)

%%%%%%%%%%%%% default parameters%%%%%%%%%%%%%%%%%%%
prach.SampleRateMSPS = 122.88;
prach.Format         = 0;           % PRACH format: TS36.104, Table 8.4.2.1-1
prach.CyclicShiftIdx = 1;   % ZCZ  % Cyclic shift index: TS36.141, Table A.6-1
prach.HighSpeed      = 0;        % Normal mode: TS36.104, Table 8.4.2.1-1
prach.rxSNR          = 100;          % Applying AWGN on receive PRACH % Not used
prach.SampleRate     = prach.SampleRateMSPS;
prach.MaxSampleRate  = 122.88 ;%30.72; %TBD

% prach.ConfigIndex = 27;     % For Format0, the config index is between 0 ... 27
% prach.SeqIdx = 53;          % Logical sequence index: TS36.141, Table A.6-1
% prach.PreambleIdx = 23;     % Preamble index: TS36.141, Table A.6-1
% frequency_offset = 0;       % Default frequency location

info.NCS = ZeroCorrIndex(prach.CyclicShiftIdx,prach.HighSpeed,1.25); %% SCS parameter added to make it complaint with new zero corr index function
info.NZC = 839;

ue.NULRB          = 273;       % 6 RBs are allocated for PRACH output of ue.NULRB
ue.DuplexMode     = 'TDD';     % Frequency Division Duplexing (FDD)
ue.CyclicPrefixUL = 'Normal';  % Normal cyclic prefix length
NTxAnts           = 4;         % Number of transmission antennas 4
ZeroPadFront      = 1;
ZeroPadRear       = 24;

offset     = 0;
bitscale   = 1;
timedelay0 = 0;
timedelay1 = 0;
timedelay2 = 0;
timedelay3 = 0;

%% PRACH parameters

Tcp    = 103.125e-6;
Tgt    = 96.875e-6;
Tu     = 800e-6;
Tprach = Tcp+Tgt+Tu;
prach_symb_start_ch1 = (Tcp*(prach.SampleRate*1e6));% * NTxAnts;
prach_symb_end_ch1   = prach_symb_start_ch1 + (Tu*(prach.SampleRate*1e6));% * NTxAnts; %prach.Nfft * NTxAnts;
prach.seqlength      = Tu*(prach.SampleRate*1e6); % for 1 antenna
prach.symPeriod_dec  = (Tprach*(prach.SampleRate*1e6));% * NTxAnts;% number of samples after decimation 122880/48 OR 15360/6

%%  Data gen parameters

[prach_data, ZC_DFT_839] = prach_gen_5g_toolbox(prach_lf_in.sequence_number,prach_lf_in.frequency_offset,offset,bitscale,prach_lf_in.preamble_index,prach.CyclicShiftIdx, ue,prach_lf_in.config_index);

if prach_lf_in.config_index == 16
    t = prach_data(122880/2+1 :122880 +(122880/2));
    prach_data = circshift(t,122880/2);
end

%%% Recieve Noisy PRACH signal
%rxPrachSeq = Apply_AWGN(transpose(prach_data), prach.rxSNR);
% rxPrachSeq = 1e2*awgn((prach_data),snr,'measured');
S = RandStream('mt19937ar',Seed=5489);
reset(S);
rxPrachSeq =awgn((prach_data),prach_lf_in.snr,'measured',S);

rxPrachSeq = rxPrachSeq / max(max(real(rxPrachSeq)),max(imag(rxPrachSeq))); % Normalization

x_in_ch0 = transpose(rxPrachSeq);
x_in_ch0 = circshift(x_in_ch0,timedelay0);

scalein = 1;
waveform_scale_1sf = x_in_ch0*scalein; % 1 sub frame
num_subframe       = 1;
waveform_scale     = repmat(waveform_scale_1sf,1,num_subframe);

%Convert the data into 32bit unsigned interger format
real_data = int16(real(waveform_scale)*2^14);
imag_data = int16(imag(waveform_scale)*2^14);

real_data_u16 = typecast(real_data,'uint16');
imag_data_u16 = typecast(imag_data,'uint16');

real_data_u32 = uint32(real_data_u16);
imag_data_u32 = uint32(imag_data_u16);
imag_data_u32 = bitshift(imag_data_u32,16);

long_prach_input = uint32(bitor(imag_data_u32,real_data_u32));

%% PRACH model
for num_sf = 1:num_subframe
    if (prach_lf_in.config_index == 16)
        waveform_scale = circshift(waveform_scale,122880/2);
    end
    % CP removal
    long_prach_cprem_data_out = waveform_scale((122880*(num_sf-1))+prach_symb_start_ch1+1:(122880*(num_sf-1))+prach_symb_end_ch1+1);

    % Mixer
    NRFreq_EN = prach_lf_in.technology;

    if (ue.NULRB == 273)
        NprachRB  = 3;
        f_OFDM_SP = 30000; % Hz, OFDM subcarrier spacing
        phi       = 7; %13 TBD mismatch between all format sim
        info.NZC  = 839;
        f_RACH_SP = 1250; % Hz, PRACH subcarrier Spacing
        K         =  f_OFDM_SP / f_RACH_SP;
        nRB_sc    = 12;
        k0        = prach_lf_in.frequency_offset*nRB_sc - ue.NULRB*nRB_sc/2;

        if(NRFreq_EN == 0)
            realfreq = ( phi + K*(k0)+floor(info.NZC/2) ) * f_RACH_SP;
            NCO      = -2^30 / (prach.SampleRateMSPS*1e6) * ( phi + K*(k0)+floor(info.NZC/2) ) * f_RACH_SP;
            prach.SCstart = 88;
            prach.SCend   = 926;
        else
            realfreq = NRFreq_calc(prach_lf_in.frequency_offset);
            NCO      = -2^30 / (prach.SampleRateMSPS*1e6)*realfreq;
            prach.SCstart = 88+6;
            prach.SCend   = 926+6;
        end
    else
        NprachRB  = 6;
        f_OFDM_SP = 15000; % Hz, OFDM subcarrier spacing
        phi       = 7;
        info.NZC  = 839;
        f_RACH_SP = 1250; % Hz, PRACH subcarrier Spacing
        K         =  f_OFDM_SP / f_RACH_SP;
        nRB_sc    = 12;
        k0        = prach_lf_in.frequency_offset*nRB_sc - ue.NULRB*nRB_sc/2;
        NCO       = -2^30 / (prach.SampleRateMSPS*1e6) * ( phi + K*(k0+0.5)+floor(info.NZC/2) ) * f_RACH_SP;
    end
end
f_nco_febug = prach.SampleRateMSPS*1e6* NCO/2^30;
f           = f_nco_febug;
fs          = 122.88e6;
Len         = length(long_prach_cprem_data_out);
n           = 1:Len;

sinsoidop = exp(1j*2*pi*(f/fs)*n);

long_prach_mixer_out = long_prach_cprem_data_out(1:Len).*sinsoidop; %% change it to x.*sinusoid
filter_input(num_sf,:) = long_prach_mixer_out;

lprach_s2b_input = [];
for nsf = 1:num_subframe
    lprach_s2b_input = [lprach_s2b_input filter_input(nsf,:)];
end

fc=0.84;
fs_s=1;
[ ~ ,b_decimator1]= filtdesign(8,(fc/61.44),((fs_s*20.48)/61.44)); %sig BW = 1MHz, fs=122.88Mhz , Decimation by 3=> +ve spec fstop=0.33(w.r.t fs/2 , i.e fs/2 is mapped to 1) , fpass=1MHz => +ve spec for fpass=(1/61.44 w.r.t fs/2 i.e fs/2 is mapped to 1)
[ ~ ,b_decimator2]= filtdesign(6,(fc/20.48),((fs_s*10.24)/20.48));  %%sig BW = 1MHz, fs=40.96Mhz , Decimation by 2=> +ve spec fstop=0.5(w.r.t fs/2 , i.e fs/2 is mapped to 1) , fpass=1MHz => +ve spec for fpass=(1/20.48 w.r.t fs/2 i.e fs/2 is mapped to 1)
[ ~ ,b_decimator3]= filtdesign(8,(fc/10.24),((fs_s*5.12)/10.24)); %%sig BW = 1MHz, fs=20.48Mhz , Decimation by 2=> +ve spec fstop=0.5(w.r.t fs/2 , i.e fs/2 is mapped to 1) , fpass=1MHz => +ve spec for fpass=(1/10.24 w.r.t fs/2 i.e fs/2 is mapped to 1)
[ ~ ,b_decimator4]= filtdesign(10,(fc/5.12),((fs_s*2.56)/5.12));%Fs=10.24M
[ ~ ,b_decimator5]= filtdesign(8,(fc/2.56),((fs_s*1.28)/2.56));%fs=5.12M
[ ~ ,b_decimator6]= filtdesign(42,(0.54/1.28),(0.64/1.28));%fs=2.56M


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

TotalGrpdelay = grpdelay1+grpdelay2+grpdelay3+grpdelay4+grpdelay5+grpdelay6;

prach_out_clkrate = prach.SampleRate/(decimator_factor1*decimator_factor2*decimator_factor3*decimator_factor4*decimator_factor5*decimator_factor6) ;
Grpdelay_wrt_clkcycle = TotalGrpdelay/((1/prach_out_clkrate));

deimator_shift=1;

Groupdelay_offset_ant0 = round(Grpdelay_wrt_clkcycle);

% Decimator output
AxC = 1;
decimation_factor = 3;
ip_length=(prach_symb_end_ch1-prach_symb_start_ch1);
ip_length = ip_length * num_subframe;
[t1,~,~] = filter_ch_interleaved(lprach_s2b_input,decimation_factor,AxC,double(b_decimator1), ip_length,decimator_gain1);

AxC=1;
decimation_factor=2;
ip_length=(prach_symb_end_ch1-prach_symb_start_ch1)/(3);
ip_length = ip_length * num_subframe;
[t2,~,~] = filter_ch_interleaved(t1,decimation_factor,AxC,double(b_decimator2), ip_length,decimator_gain2);

AxC=1;
decimation_factor=2;
ip_length=(prach_symb_end_ch1-prach_symb_start_ch1)/(3*2);
ip_length = ip_length * num_subframe;
[t3,~,~] = filter_ch_interleaved(t2,decimation_factor,AxC,double(b_decimator3), ip_length,decimator_gain3);

AxC=1;
decimation_factor=2;
ip_length=(prach_symb_end_ch1-prach_symb_start_ch1)/(3*2*2);
ip_length = ip_length * num_subframe;
[t4,~,~] = filter_ch_interleaved(t3,decimation_factor,AxC,double(b_decimator4), ip_length,decimator_gain4);

AxC=1;
decimation_factor=2;
ip_length=(prach_symb_end_ch1-prach_symb_start_ch1)/(3*2*2*2);
ip_length = ip_length * num_subframe;
[t5,~,~] = filter_ch_interleaved(t4,decimation_factor,AxC,double(b_decimator5), ip_length,decimator_gain5);

AxC=1;
decimation_factor=2;
ip_length=(prach_symb_end_ch1-prach_symb_start_ch1)/(3*2*2*2*2);
ip_length = ip_length * num_subframe;
[t6,~,~] = filter_ch_interleaved(t5,decimation_factor,AxC,double(b_decimator6), ip_length,decimator_gain6);
long_prach_decim_out=t6.';

lprach_decim_out = long_prach_decim_out;


% S2B conversion.
t_ch0 = double (circshift(lprach_decim_out,-Groupdelay_offset_ant0));
fft_input = reshape(t_ch0,length(t_ch0)/num_subframe,num_subframe);
% t_ch0 = double (circshift(long_prach_decim_out(1:AxC:end),-Groupdelay_offset_ant0));
% x_ch0 = bitrevorder (circshift(long_prach_decim_out(1:AxC:end),-Groupdelay_offset_ant0));  % this is done as output of s2b is bit reversed

for nsf = 1:num_subframe
    % FFT operation
    x_ch0 = (fft( fft_input(:,nsf)));

    % FFTshift
    x_ch0 = fftshift(x_ch0);

    % Front RB zeropad & selection
    x_ch0 = [zeros(1,ZeroPadFront) x_ch0(prach.SCstart:prach.SCend).'].';

    % Rear Zeopad
    x_ch0 = [x_ch0.' zeros(1,ZeroPadRear) ].';

    % PRACH Correlation detection
    [ZCseq_set, PreambleIdx, offset] = PRACH_corr_detection(x_ch0(ZeroPadFront+1:end-ZeroPadRear), info,prach_lf_in.sequence_number)

    % PRACH output
    long_prach_output = x_ch0;

    fprintf('%d subframe completed\n',num_sf);

end
% clear;
end