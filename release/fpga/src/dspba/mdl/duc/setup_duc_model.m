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

%% DUC_LINEUP_param - DSPBA Design Parameters Start
%clear;
clearvars  -except cc NumSym

DSPBA_Features.additionalQuartusTclSettings = 'source ./additional_settings.qsf';
DSPBA_Features.UseDSPInputRoutingRegisters =0;
DSPBA_Features.enableFanoutBlocks=false;
DSPBA_Features.resetFanoutMitigation=true;
DSPBA_Features.schedulerLongDelayPolicy='fanout';


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Pipe Line Constraints
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
DSPBA_Features.schedulerAttempts = 1000;
DSPBA_Features.pipelineAdderUsingWidth = 20;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LOAD mat files
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LOAD SETTINGS
load('settings.mat');
%% LOAD INPUT
load('ifft_out.mat');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Register Offset
%%%%%%%%%%%%%%%%%%%%%%%%%%
DUC_LINEUP_param.Base_addr =  0;
DUC_LINEUP_param.NR_chan_filter_100.chan_filt_base_addr_l1_re= DUC_LINEUP_param.Base_addr;
DUC_LINEUP_param.NR_chan_filter_100.chan_filt_base_addr_l1_im= DUC_LINEUP_param.NR_chan_filter_100.chan_filt_base_addr_l1_re+400;
% DUC_LINEUP_param.NR_chan_filter_100.chan_filt_base_addr_l2_re= DUC_LINEUP_param.NR_chan_filter_100.chan_filt_base_addr_l1_im+400;
% DUC_LINEUP_param.NR_chan_filter_100.chan_filt_base_addr_l2_im= DUC_LINEUP_param.NR_chan_filter_100.chan_filt_base_addr_l2_re+400;
DUC_LINEUP_param.NCO1.base_addr = DUC_LINEUP_param.NR_chan_filter_100.chan_filt_base_addr_l1_im  + 400;
% DUC_LINEUP_param.HB_Bypass = DUC_LINEUP_param.NCO1.base_addr + 1;

DUC_LINEUP_param.reg_version.mem_offset = DUC_LINEUP_param.NCO1.base_addr+ 8;

% BW_Config_CC1_Offset = DUC_LINEUP_param.HB_Bypass + 1;
% BW_Config_CC2_Offset = BW_Config_CC1_Offset + 1;

DUC_LINEUP_param.bw_select        = duc_tb_in.bw_sel;%100e6;
AXC_SEL                           = [1, 3, 5, 7];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Specify DUC NCO Tunning  Values in the oder of [ A1C1 A1C2 A1C3 A1C4 A2C1 A2C2 A2C3 A2C4 A3C1 A3C2 A3C3 A3C4 A4C1 A4C2 A4C3 A4C4] in MHz
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

nco_freq_tmp                = duc_tb_in.nco_freq_val / 1e6; %[  50 -50   50  -50];
DUC_LINEUP_param.NCO1.Freq  = [nco_freq_tmp(AXC_SEL(1)) nco_freq_tmp(AXC_SEL(2)) nco_freq_tmp(AXC_SEL(3)) nco_freq_tmp(AXC_SEL(4))];


%% Adjust the pipelining effort
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

DUC_LINEUP_param.ClockMargin      = 50;   %% in MHz         
DUC_LINEUP_param.ClockRate        = 491.5200000;  	% The system clock rate in MHz

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% System Parameters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

DUC_LINEUP_param.ChanCount        =  4;           	% How many data channels (AxCs) per data pipe

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Data Type Specification
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
DUC_LINEUP_param.input_word_length      = 16;         % Input data: bit width
DUC_LINEUP_param.input_fraction_length  = 14;         % Input data: fraction width

DUC_LINEUP_param.output_word_length     = 16;         % Output data: bit width
DUC_LINEUP_param.output_fraction_length = 14;         % Output data: fraction width


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ModelIP FILTER CONFIGURATION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %% 5G NR Channel filter 60 & 100Mhz

DUC_LINEUP_param.NR_chan_filter_100.Samplerate = 122.88;
DUC_LINEUP_param.NR_chan_filter_100.ChanCount = DUC_LINEUP_param.ChanCount;
DUC_LINEUP_param.NR_chan_filter_100.coeff_word_length     = 16;                          % filter4 coefficient: bit width
DUC_LINEUP_param.NR_chan_filter_100.coeff_fraction_length = 15; 

%% HB1 Filter 122 -> 245

DUC_LINEUP_param.HB_filt1.SampleRate            = DUC_LINEUP_param.NR_chan_filter_100.Samplerate;        
DUC_LINEUP_param.HB_filt1.Interpolation         = 2;                           % Interpolation rate  
DUC_LINEUP_param.HB_filt1.coeff_word_length     = 16;                          % filter5 coefficient: bit width
DUC_LINEUP_param.HB_filt1.coeff_fraction_length = 15;                          % filter5 coefficient: fraction width 
DUC_LINEUP_param.HB_filt1.ChanCount             = DUC_LINEUP_param.ChanCount;

%% HB1 Filter 245 -> 491

DUC_LINEUP_param.HB_filt2.SampleRate            = DUC_LINEUP_param.NR_chan_filter_100.Samplerate*2;        
DUC_LINEUP_param.HB_filt2.Interpolation         = 2;                           % Interpolation rate  
DUC_LINEUP_param.HB_filt2.coeff_word_length     = 16;                          % filter5 coefficient: bit width
DUC_LINEUP_param.HB_filt2.coeff_fraction_length = 15;                          % filter5 coefficient: fraction width 
DUC_LINEUP_param.HB_filt2.ChanCount             = DUC_LINEUP_param.ChanCount;

%% NCO 
%%NCO1
DUC_LINEUP_param.NCO1.sample_rate           = DUC_LINEUP_param.NR_chan_filter_100.Samplerate*4;                        % output rate at NCO1  - 491.52
DUC_LINEUP_param.NCO1.data_type             = DUC_LINEUP_param.output_word_length;
DUC_LINEUP_param.NCO1.scaling_value         = 15;%DUC_LINEUP_param.output_fraction_length;
DUC_LINEUP_param.NCO1.accum_bit_width       = 32;                          
DUC_LINEUP_param.NCO1.freq_word             = ((DUC_LINEUP_param.NCO1.Freq*2^DUC_LINEUP_param.NCO1.accum_bit_width) / DUC_LINEUP_param.NCO1.sample_rate);  % Interpolation rate  
DUC_LINEUP_param.NCO1.latency               = 18;

%DUC_LINEUP_param.HB_Bypass                  =  DUC_LINEUP_param.NCO1.base_addr + 400;

for i=1:DUC_LINEUP_param.ChanCount
    if(sign(DUC_LINEUP_param.NCO1.Freq(i))==+1)
        %bit_inv =(1 * 1) + (1 * 2) ;
        bit_inv = 0 ;
    elseif(sign(DUC_LINEUP_param.NCO1.Freq(i))==-1)
        %bit_inv =(1 * 1) + (0 * 2) ;
        bit_inv = 2 ;
    elseif(DUC_LINEUP_param.NCO1.Freq(i)==0)
        bit_inv = 0;
    end   
DUC_LINEUP_param.NCO1.Inv(1,i)          =  bit_inv;   % 2 bits to invert sin and cos respectively
end
DUC_LINEUP_param.NCO1.freq_word     =  abs(DUC_LINEUP_param.NCO1.freq_word) + (DUC_LINEUP_param.NCO1.Inv * (2^DUC_LINEUP_param.NCO1.accum_bit_width));



%% complex mixer
DUC_LINEUP_param.CM.SampleRate            = DUC_LINEUP_param.NR_chan_filter_100.Samplerate*4;                              % output rate at CM  - 122.88 -- 4*30.72
DUC_LINEUP_param.CM.num_complex_chans     = DUC_LINEUP_param.ChanCount;
DUC_LINEUP_param.CM.num_complex_freqs     = DUC_LINEUP_param.ChanCount;

DUC_CM_multiplication_factor = 1;
DUC_CM_number_of_bits_to_shift_left = 0;

DUC_filter_multiplication_factor = 1;
DUC_filter_number_of_bits_to_shift_left = 0;

DUC_CM_NCO_sync  = [0 0 0 0];
DUC_CM_NCO_phase = [0 0 0 0];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
% LOAD CO-EFF FILE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
DUC_LINEUP_param.HB_filt1.coeffs     = fi(duc_tb_in.HB1_coeffs,1,DUC_LINEUP_param.HB_filt1.coeff_word_length,DUC_LINEUP_param.HB_filt1.coeff_fraction_length);

DUC_LINEUP_param.HB_filt2.coeffs     =fi(duc_tb_in.HB2_coeffs,1,DUC_LINEUP_param.HB_filt2.coeff_word_length,DUC_LINEUP_param.HB_filt2.coeff_fraction_length);

DUC_LINEUP_param.chan_filter.coeffs(1,:)  =fi( duc_tb_in.Coef60,1,DUC_LINEUP_param.NR_chan_filter_100.coeff_word_length,DUC_LINEUP_param.NR_chan_filter_100.coeff_fraction_length);
DUC_LINEUP_param.chan_filter.coeffs(2,:)  =fi( duc_tb_in.Coef100,1,DUC_LINEUP_param.NR_chan_filter_100.coeff_word_length,DUC_LINEUP_param.NR_chan_filter_100.coeff_fraction_length);    


if (DUC_LINEUP_param.bw_select == 100e6)
    BW_Config_CC1 = 14; % CC1 is configured for 100 MHz
else
    BW_Config_CC1 = 10; % CC1 is configured for 60 MHz
end

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
% % Gain & Delay Compesation Values
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% load INPUT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% load('tmwave_60MHz_BFP9.mat');
tmwave = ifft_out;
run('tmwave_to_NRinput.m');

Scale = 2^0; % up to 3 bits leftshift after iFFT

DUC_LINEUP_param.inputdata_l1= Scale*NRInput.';

DUC_LINEUP_param.duc_valid = (1);
DUC_LINEUP_param.duc_channel =[0,1,2,3];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Simulation Parameters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if ~exist('Test_Bench_Run_Time','var')
    % Set default run time   
    Test_Bench_Run_Time = length(DUC_LINEUP_param.inputdata_l1);%200000;
end

DUC_LINEUP_param.SampleTime  = 1;                    % One unit in Simulink simulation is one clock cycle 
DUC_LINEUP_param.endTime     = Test_Bench_Run_Time;                 % How many simulation clock cycles
DUC_LINEUP_param.ContiguousValidFrames   = 1;        % Create a sequence of valid and invali frames of stimulus data in the Channelizer block
DUC_LINEUP_param.ContiguousInvalidFrames = 1; 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Version Register
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DUC_LINEUP_param.reg_version.mem_offset = DUC_LINEUP_param.HB_Bypass+ 1000;
DUC_LINEUP_param.reg_version.Class_Version      =   0;
DUC_LINEUP_param.reg_version.Major_vesion       =   0;
DUC_LINEUP_param.reg_version.Minor_version      =   0;
DUC_LINEUP_param.reg_version.Patch_version      =   2;

DUC_LINEUP_param.reg_version.Version_reg_val    =   (DUC_LINEUP_param.reg_version.Class_Version*2^24) + ...
                                                    (DUC_LINEUP_param.reg_version.Major_vesion*2^16) + ... 
                                                    (DUC_LINEUP_param.reg_version.Minor_version*2^8) + ...
                                                    (DUC_LINEUP_param.reg_version.Patch_version);


disp('[setup.m]: Executed');
