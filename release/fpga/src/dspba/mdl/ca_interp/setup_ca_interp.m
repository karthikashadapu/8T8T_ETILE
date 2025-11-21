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
clearvars          -except cc NumSym
%%
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
load('mixer_out.mat');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Register Offset
%%%%%%%%%%%%%%%%%%%%%%%%%%
DUC_LINEUP_param.Base_addr =  0;

DUC_Gain_Ant1_offset = DUC_LINEUP_param.Base_addr + 0;
DUC_Gain_Ant2_offset = DUC_Gain_Ant1_offset + 1;
DUC_Gain_Ant3_offset = DUC_Gain_Ant2_offset + 1;
DUC_Gain_Ant4_offset = DUC_Gain_Ant3_offset + 1;

DUC_LINEUP_param.HB_Bypass = DUC_Gain_Ant4_offset + 1;

DUC_Delay_Comp_offset_ant1_1 = DUC_LINEUP_param.HB_Bypass + 1;
DUC_Delay_Comp_offset_ant2_1 = DUC_Delay_Comp_offset_ant1_1 + 1;
DUC_Delay_Comp_offset_ant3_1 = DUC_Delay_Comp_offset_ant2_1 + 1;
DUC_Delay_Comp_offset_ant4_1 = DUC_Delay_Comp_offset_ant3_1 + 1;
DUC_Delay_Comp_offset_ant1_2 = DUC_Delay_Comp_offset_ant4_1 + 1;
DUC_Delay_Comp_offset_ant2_2 = DUC_Delay_Comp_offset_ant1_2 + 1;
DUC_Delay_Comp_offset_ant3_2 = DUC_Delay_Comp_offset_ant2_2 + 1;
DUC_Delay_Comp_offset_ant4_2 = DUC_Delay_Comp_offset_ant3_2 + 1;
DUC_LINEUP_param.reg_version.mem_offset = DUC_Delay_Comp_offset_ant4_2+ 1;


AXC_SEL                           = [1, 3, 5, 7, 2, 4, 6, 8];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Specify DUC NCO Tunning  Values in the oder of [ A1C1 A1C2 A1C3 A1C4 A2C1 A2C2 A2C3 A2C4 A3C1 A3C2 A3C3 A3C4 A4C1 A4C2 A4C3 A4C4] in MHz
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


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

%% HB1 Filter 491 -> 983 POLY-PHASE
DUC_LINEUP_param.NR_chan_filter_100.Samplerate = 122.88;

DUC_LINEUP_param.HB_filt3.SampleRate            = DUC_LINEUP_param.NR_chan_filter_100.Samplerate*4; % Poly-Phase        
DUC_LINEUP_param.HB_filt3.Interpolation         = 2;                           % Interpolation rate  
DUC_LINEUP_param.HB_filt3.coeff_word_length     = 16;                          % filter5 coefficient: bit width
DUC_LINEUP_param.HB_filt3.coeff_fraction_length = 15;                          % filter5 coefficient: fraction width 
DUC_LINEUP_param.HB_filt3.ChanCount             = DUC_LINEUP_param.ChanCount;

%% NCO 

%% complex mixer

%% Summer

DUC_SUMMER_multiplication_factor = 1;
DUC_SUMMER_Number_of_bits_to_shift_left = 0;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
% LOAD CO-EFF FILE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
%HB3_coeffs = HB_Filt_designer;
% HB3_coeffs.Numerator = [0; load('HB_491_983.txt') / 2^15; 0];
% DUC_LINEUP_param.HB_filt3.coeffs    =fi(HB3_coeffs.Numerator,1,DUC_LINEUP_param.HB_filt3.coeff_word_length,DUC_LINEUP_param.HB_filt3.coeff_fraction_length);
DUC_LINEUP_param.HB_filt3.coeffs     = fi(ca_interp_tb_in.HB3_coeffs,1,DUC_LINEUP_param.HB_filt3.coeff_word_length,DUC_LINEUP_param.HB_filt3.coeff_fraction_length);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
% Gain & Delay Compesation Values
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
DUC_Gain_Ant1 = 1;
DUC_Gain_Ant2 = 1;
DUC_Gain_Ant3 = 1;
DUC_Gain_Ant4 = 1;

DUC_Delay_Comp_Ant1_CC1 = 0;
DUC_Delay_Comp_Ant2_CC1 = 0;
DUC_Delay_Comp_Ant3_CC1 = 0;
DUC_Delay_Comp_Ant4_CC1 = 0;
DUC_Delay_Comp_Ant1_CC2 = 0;
DUC_Delay_Comp_Ant2_CC2 = 0;
DUC_Delay_Comp_Ant3_CC2 = 0;
DUC_Delay_Comp_Ant4_CC2 = 0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

DUC_LINEUP_param.inputdata_l1(:,1)= mixer_out(:,(AXC_SEL(1))).';
DUC_LINEUP_param.inputdata_l1(:,2)= mixer_out(:,(AXC_SEL(2))).';
DUC_LINEUP_param.inputdata_l1(:,3)= mixer_out(:,(AXC_SEL(3))).';
DUC_LINEUP_param.inputdata_l1(:,4)= mixer_out(:,(AXC_SEL(4))).';

DUC_LINEUP_param.inputdata_l2(:,1)= mixer_out(:,(AXC_SEL(5))).';
DUC_LINEUP_param.inputdata_l2(:,2)= mixer_out(:,(AXC_SEL(6))).';
DUC_LINEUP_param.inputdata_l2(:,3)= mixer_out(:,(AXC_SEL(7))).';
DUC_LINEUP_param.inputdata_l2(:,4)= mixer_out(:,(AXC_SEL(8))).';

DUC_LINEUP_param.duc_valid =[1];
DUC_LINEUP_param.duc_channel =[0];

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
DUC_LINEUP_param.reg_version.Patch_version      =   1;

DUC_LINEUP_param.reg_version.Version_reg_val    =   (DUC_LINEUP_param.reg_version.Class_Version*2^24) + ...
                                                    (DUC_LINEUP_param.reg_version.Major_vesion*2^16) + ... 
                                                    (DUC_LINEUP_param.reg_version.Minor_version*2^8) + ...
                                                    (DUC_LINEUP_param.reg_version.Patch_version);


disp('[setup.m]: Executed');

