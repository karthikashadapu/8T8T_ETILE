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
%% DDC_LINEUP_param - DSPBA Design Parameters Start
%clear ;
clearvars          -except cc NumSym
close all;

DSPBA_Features.additionalQuartusTclSettings = 'source ./additional_settings.qsf';
DSPBA_Features.UseDSPInputRoutingRegisters =0;
DSPBA_Features.enableFanoutBlocks=false;
DSPBA_Features.resetFanoutMitigation=true;
DSPBA_Features.schedulerLongDelayPolicy='fanout';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Load data, if not loaded already
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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
load('interpolator_out.mat');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Register Offset
%%%%%%%%%%%%%%%%%%%%%%%%%%

DDC_LINEUP_param.Base_addr =  0;
DDC_Gain_Ant1_offset = DDC_LINEUP_param.Base_addr + 0;
DDC_Gain_Ant2_offset = DDC_Gain_Ant1_offset + 1;
DDC_Gain_Ant3_offset = DDC_Gain_Ant2_offset + 1;
DDC_Gain_Ant4_offset = DDC_Gain_Ant3_offset + 1;

DDC_LINEUP_param.HB_Bypass = DDC_Gain_Ant4_offset + 1;

DDC_Delay_Comp_offset_ant1_1 = DDC_LINEUP_param.HB_Bypass + 1;
DDC_Delay_Comp_offset_ant2_1 = DDC_Delay_Comp_offset_ant1_1 + 1;
DDC_Delay_Comp_offset_ant3_1 = DDC_Delay_Comp_offset_ant2_1 + 1;
DDC_Delay_Comp_offset_ant4_1 = DDC_Delay_Comp_offset_ant3_1 + 1;
DDC_Delay_Comp_offset_ant1_2 = DDC_Delay_Comp_offset_ant4_1 + 1;
DDC_Delay_Comp_offset_ant2_2 = DDC_Delay_Comp_offset_ant1_2 + 1;
DDC_Delay_Comp_offset_ant3_2 = DDC_Delay_Comp_offset_ant2_2 + 1;
DDC_Delay_Comp_offset_ant4_2 = DDC_Delay_Comp_offset_ant3_2 + 1;

DDC_LINEUP_param.reg_version.mem_offset = DDC_Delay_Comp_offset_ant4_2+ 1;

% BW_Config_CC1_Offset = DDC_LINEUP_param.HB_Bypass + 1;
% BW_Config_CC2_Offset = BW_Config_CC1_Offset + 1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% DDC CONFIGURATION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% System Parameters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
DDC_LINEUP_param.ChanCount   = 4;                 % How many data channels
DDC_LINEUP_param.ClockRate   = 491.52;            % The system clock rate in MHz

DDC_LINEUP_param.SampleRate  = 491.52;            % The data rate per channel in MSps (mega-samples per second)
DDC_LINEUP_param.ClockMargin = 50;
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Data Type Specification
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
DDC_LINEUP_param.input_word_length      = 16;         % Input data: bit width
DDC_LINEUP_param.input_fraction_length  = 14;         % Input data: fraction width

DDC_LINEUP_param.output_word_length     = 16;         % Output data: bit width
DDC_LINEUP_param.output_fraction_length = 14;         % Output data: fraction width

DDC_LINEUP_param.ant_comp_word_length     = 32;         % Output data: bit width
DDC_LINEUP_param.ant_comp_fraction_length = 27;         % Output data: fraction width
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ModelIP FILTER CONFIGURATION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% NCO1

%% NCO2

%% complex mixer

%% Filter 3 - HB1


%% Filter 2 - HB2


%% Filter 1 - HB3

DDC_LINEUP_param.HB_filter3.SampleRate            = DDC_LINEUP_param.SampleRate*2;	% Input rate at HB6 ~245.76e6
DDC_LINEUP_param.HB_filter3.Decimation            = 2;                      	    % Decmation rate  
DDC_LINEUP_param.HB_filter3.ChanCount             = DDC_LINEUP_param.ChanCount;
DDC_LINEUP_param.HB_filter3.coeff_word_length     = 16;                      	    % HB6 coefficient: bit width
DDC_LINEUP_param.HB_filter3.coeff_fraction_length = 15; 
%% Channel Filter 60 & 100 MHz

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
% LOAD CO-EFF FILE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
%HB1_coeffs

%HB1_coeffs = HB_Filt_designer;

%HB3_coeffs = HB_Filt_designer;
% HB3_coeffs.Numerator = [0; load('HB_491_983.txt') / 2^15; 0];
DDC_LINEUP_param.HB_filt3.coeffs    =fi(dec_dly_comp_tb_in.HB3_coeffs,1,DDC_LINEUP_param.HB_filter3.coeff_word_length ,DDC_LINEUP_param.HB_filter3.coeff_fraction_length);
  
%load('Co_efficients/100_MHz/Chan_Filter_100.mat');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
% Gain & Delay Compesation Values
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
DDC_Gain_Ant1 = 1;
DDC_Gain_Ant2 = 1;
DDC_Gain_Ant3 = 1;
DDC_Gain_Ant4 = 1;

DDC_Delay_Comp_Ant1_CC1 = 0;
DDC_Delay_Comp_Ant2_CC1 = 0;
DDC_Delay_Comp_Ant3_CC1 = 0;
DDC_Delay_Comp_Ant4_CC1 = 0;
DDC_Delay_Comp_Ant1_CC2 = 0;
DDC_Delay_Comp_Ant2_CC2 = 0;
DDC_Delay_Comp_Ant3_CC2 = 0;
DDC_Delay_Comp_Ant4_CC2 = 0;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% load INPUT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% run('load_dec_dly_comp_input.m');

DDC_LINEUP_param.DUC_A1                     = interp_out(:,1);
DDC_LINEUP_param.DDC_Ant_Data_in_1          = DDC_LINEUP_param.DUC_A1(1:2:end);
DDC_LINEUP_param.DDC_Ant_Data_in_2          = DDC_LINEUP_param.DUC_A1(2:2:end);

DDC_LINEUP_param.DUC_A3                     = interp_out(:,2);
DDC_LINEUP_param.DDC_Ant_Data_in_3          = DDC_LINEUP_param.DUC_A3(1:2:end);
DDC_LINEUP_param.DDC_Ant_Data_in_4          = DDC_LINEUP_param.DUC_A3(2:2:end);

DDC_LINEUP_param.DUC_A5                     = interp_out(:,3);
DDC_LINEUP_param.DDC_Ant_Data_in_5          = DDC_LINEUP_param.DUC_A5(1:2:end);
DDC_LINEUP_param.DDC_Ant_Data_in_6          = DDC_LINEUP_param.DUC_A5(2:2:end);

DDC_LINEUP_param.DUC_A7                     = interp_out(:,4);
DDC_LINEUP_param.DDC_Ant_Data_in_7          = DDC_LINEUP_param.DUC_A7(1:2:end);
DDC_LINEUP_param.DDC_Ant_Data_in_8          = DDC_LINEUP_param.DUC_A7(2:2:end);

DDC_LINEUP_param.valid     = 1;
DDC_LINEUP_param.channel   = [0].';

% Ant1_samp1 = DDC_LINEUP_param.DDC_Ant_Data_in_1;  
% Ant1_samp2 = DDC_LINEUP_param.DDC_Ant_Data_in_2;
% Ant1 = reshape(transpose([Ant1_samp1 Ant1_samp2]), 2*length(Ant1_samp1),1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Simulation Parameters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if ~exist('Test_Bench_Run_Time','var')
    % Set default run time
    Test_Bench_Run_Time = length(DDC_LINEUP_param.DDC_Ant_Data_in_1);
end


DDC_LINEUP_param.SampleTime  = 1;                    % One unit in Simulink simulation is one clock cycle 
DDC_LINEUP_param.endTime     = Test_Bench_Run_Time;  % How many simulation clock cycles
DDC_LINEUP_param.ContiguousValidFrames   = 1;        % Create a sequence of valid and invali frames of stimulus data in the Channelizer block
DDC_LINEUP_param.ContiguousInvalidFrames = 1; 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Version Register
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DDC_LINEUP_param.reg_version.mem_offset = DDC_LINEUP_param.HB_Bypass+ 1000;
DDC_LINEUP_param.reg_version.Class_Version      =   0;
DDC_LINEUP_param.reg_version.Major_vesion       =   0;
DDC_LINEUP_param.reg_version.Minor_version      =   0;
DDC_LINEUP_param.reg_version.Patch_version      =   1;

DDC_LINEUP_param.reg_version.Version_reg_val    =   (DDC_LINEUP_param.reg_version.Class_Version*2^24) + ...
                                                    (DDC_LINEUP_param.reg_version.Major_vesion*2^16) + ... 
                                                    (DDC_LINEUP_param.reg_version.Minor_version*2^8) + ...
                                                    (DDC_LINEUP_param.reg_version.Patch_version);

disp('[setup.m]: Executed');