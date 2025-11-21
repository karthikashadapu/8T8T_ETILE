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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% File: setup_prach_shortFormat.m
% This PRACH design supports 5G PRACH signal demodulations for FR1 for TDD. 
% Description: Script to set variables in Matlab workspace to configure
% author: Volker Mauer
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 clear variables;
 close all;

 
 %%% run reference model to generate pattern.  The PRACH configuration is
 %   defined in this file as well.
 cd ./matlab;
 PRACH_shortFormat_sim;
 cd ./../;
 %%% HW specific settings, not part of reference model

 NTxAnts = 4;                   % Number of transmission antennas 4 
sub_fn.time=1:491520*3;
sub_fn.signals.values=uint8([ones(491520,1);2*ones(491520,1);3*ones(491520,1)]);
 % Input pattern:  waveform contains a sample stram for a single antenna.
 % Here we generate streams for 4 antennas, where each sample stream is
 % multiplied with the antenna index.
 ScaleIn = 20;
% ScaleIn = 1/max(max(real(waveform)), max(imag(waveform)))/8;
 for i=1:NTxAnts
     prach_short.din(i,:)=waveform*i*ScaleIn; 
 end
prach_short.din = [prach_short.din prach_short.din];
 %% Configuration table, as defined in Table 6.3.3.2-3 in 38.211
ConfigIndexTable;
 
%% CLK Configuration Parameters
prach_short.ClockRate	= SamplePerSubF/1000*NTxAnts;

%prach_short.ClockRate	= 491.52;
prach_short.ClockMargin = 50.0;
prach_short.SampleRateMSPS = SamplePerSubF/1000;
prach_short.SampleTime = 1;
%DSPBA_Features.additionalQuartusTclSettings = 'source ./additional_settings.qsf';

%% MM Register Setting
PRACH_reg_setting;

%% FFT Configuration
prach_short.Nfft = 4096;   % Maximum size
prach_short.SCS = 30;

%% Data widths
prach_short.InputWidth = 16;
prach_short.InputType   = fixdt(1,16,15);
prach_short.TwiddleType   = fixdt(1,16,15);
prach_short.radix2 = false;
prach_short.type_strings = ...
    dspba.fft.full_wordgrowth(true, prach_short.radix2, log2(prach_short.Nfft),...
        prach_short.InputType, prach_short.TwiddleType);

%% Simulation

prach_short.SimulationTime = (max(prach_short.ClockRate/prach_short.SampleRateMSPS, NTxAnts)*length(waveform)+Nfft*2)*2;
close all;

