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
load('decimator_out.mat');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Register Offset
%%%%%%%%%%%%%%%%%%%%%%%%%%

DDC_LINEUP_param.Base_addr =  0;
DDC_LINEUP_param.chan_filter.chan_filt_base_addr_l1_re= DDC_LINEUP_param.Base_addr;
DDC_LINEUP_param.chan_filter.chan_filt_base_addr_l1_im= DDC_LINEUP_param.chan_filter.chan_filt_base_addr_l1_re+400;
% DDC_LINEUP_param.chan_filter.chan_filt_base_addr_l2_re= DDC_LINEUP_param.chan_filter.chan_filt_base_addr_l1_im+400;
% DDC_LINEUP_param.chan_filter.chan_filt_base_addr_l2_im= DDC_LINEUP_param.chan_filter.chan_filt_base_addr_l2_re+400;

DDC_LINEUP_param.Complex_NCO1.base_addr = DDC_LINEUP_param.chan_filter.chan_filt_base_addr_l1_im + 400;
% DDC_LINEUP_param.Complex_NCO2.base_addr = DDC_LINEUP_param.Complex_NCO1.base_addr + 128;

% DDC_Gain_Ant1_offset = DDC_LINEUP_param.Complex_NCO2.base_addr + 128;
% DDC_Gain_Ant2_offset = DDC_Gain_Ant1_offset + 1;
% DDC_Gain_Ant3_offset = DDC_Gain_Ant2_offset + 1;
% DDC_Gain_Ant4_offset = DDC_Gain_Ant3_offset + 1;

% DDC_LINEUP_param.HB_Bypass = DDC_LINEUP_param.Complex_NCO1.base_addr + 1;%%DDC_Gain_Ant4_offset + 1;

% DDC_Delay_Comp_offset_ant1_1 = DDC_LINEUP_param.HB_Bypass + 1;
% DDC_Delay_Comp_offset_ant2_1 = DDC_Delay_Comp_offset_ant1_1 + 1;
% DDC_Delay_Comp_offset_ant3_1 = DDC_Delay_Comp_offset_ant2_1 + 1;
% DDC_Delay_Comp_offset_ant4_1 = DDC_Delay_Comp_offset_ant3_1 + 1;
% DDC_Delay_Comp_offset_ant1_2 = DDC_Delay_Comp_offset_ant4_1 + 1;
% DDC_Delay_Comp_offset_ant2_2 = DDC_Delay_Comp_offset_ant1_2 + 1;
% DDC_Delay_Comp_offset_ant3_2 = DDC_Delay_Comp_offset_ant2_2 + 1;
% DDC_Delay_Comp_offset_ant4_2 = DDC_Delay_Comp_offset_ant3_2 + 1;

% 
% % BW_Config_CC1_Offset = DDC_LINEUP_param.HB_Bypass + 1;
% % BW_Config_CC2_Offset = BW_Config_CC1_Offset + 1;

DDC_LINEUP_param.reg_version.mem_offset = DDC_LINEUP_param.Complex_NCO1.base_addr+ 8;


DDC_LINEUP_param.bw_select        = ddc_tb_in.bw_sel;%100e6;
AXC_SEL                           = [1,3,5,7];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
DDC_LINEUP_param.input_word_length      = 32;         % Input data: bit width
DDC_LINEUP_param.input_fraction_length  = 27;         % Input data: fraction width

DDC_LINEUP_param.output_word_length     = 16;         % Output data: bit width
DDC_LINEUP_param.output_fraction_length = 14;         % Output data: fraction width


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ModelIP FILTER CONFIGURATION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
nco_freq_tmp          = ddc_tb_in.nco_freq_val / 1e6; %[  50 -50   50  -50];

DDC_LINEUP_param.Complex_NCO1.Freq = [nco_freq_tmp(AXC_SEL(1)) nco_freq_tmp(AXC_SEL(2)) nco_freq_tmp(AXC_SEL(3)) nco_freq_tmp(AXC_SEL(4))];
% DDC_LINEUP_param.Complex_NCO1.Freq = [-50 50 -50 50];
% DDC_LINEUP_param.Complex_NCO2.Freq = [50 -50 50 -50];

%% NCO1

DDC_LINEUP_param.Complex_NCO1.sample_rate      	= DDC_LINEUP_param.SampleRate;                       
DDC_LINEUP_param.Complex_NCO1.data_type       	= DDC_LINEUP_param.output_word_length;
DDC_LINEUP_param.Complex_NCO1.scaling_value   	= 15;%DDC_LINEUP_param.output_fraction_length;
DDC_LINEUP_param.Complex_NCO1.accum_bit_width   = 32;  
DDC_LINEUP_param.Complex_NCO1.ph_incr       	=(DDC_LINEUP_param.Complex_NCO1.Freq) * (2^DDC_LINEUP_param.Complex_NCO1.accum_bit_width) / (DDC_LINEUP_param.Complex_NCO1.sample_rate) ;                                         

for i=1:DDC_LINEUP_param.ChanCount
    if(sign(DDC_LINEUP_param.Complex_NCO1.Freq(i))==+1)
        %bit_inv =(1 * 1) + (1 * 2) ;
        bit_inv = 0 ;
    elseif(sign(DDC_LINEUP_param.Complex_NCO1.Freq(i))==-1)
        %bit_inv =(1 * 1) + (0 * 2) ;
        bit_inv = 2 ;
    elseif(DDC_LINEUP_param.Complex_NCO1.Freq(i)==0)
        bit_inv = 0;
    end   
DDC_LINEUP_param.Complex_NCO1.Inv(1,i)          =  bit_inv;   % 2 bits to invert sin and cos respectively
end
DDC_LINEUP_param.Complex_NCO1.ph_incrandInv     =  abs(DDC_LINEUP_param.Complex_NCO1.ph_incr) + (DDC_LINEUP_param.Complex_NCO1.Inv * (2^DDC_LINEUP_param.Complex_NCO1.accum_bit_width));


%% NCO2
% 
% DDC_LINEUP_param.Complex_NCO2.sample_rate      	= DDC_LINEUP_param.SampleRate;                       
% DDC_LINEUP_param.Complex_NCO2.data_type       	= DDC_LINEUP_param.output_word_length;
% DDC_LINEUP_param.Complex_NCO2.scaling_value   	= 15;%DDC_LINEUP_param.output_fraction_length;
% DDC_LINEUP_param.Complex_NCO2.accum_bit_width   = 32; 
% DDC_LINEUP_param.Complex_NCO2.ph_incr       	=  (DDC_LINEUP_param.Complex_NCO2.Freq) * (2^DDC_LINEUP_param.Complex_NCO2.accum_bit_width) / (DDC_LINEUP_param.Complex_NCO2.sample_rate) ;                                         
% 
% for i=1:DDC_LINEUP_param.ChanCount
%     if(sign(DDC_LINEUP_param.Complex_NCO2.Freq(i))==+1)
%         %bit_inv =(1 * 1) + (1 * 2) ;
%         bit_inv = 0 ;
%     elseif(sign(DDC_LINEUP_param.Complex_NCO2.Freq(i))==-1)
%         %bit_inv =(1 * 1) + (0 * 2) ;
%         bit_inv = 2 ;
%     elseif(DDC_LINEUP_param.Complex_NCO2.Freq(i)==0)
%         bit_inv = 0;
%     end   
% DDC_LINEUP_param.Complex_NCO2.Inv(1,i)          =  bit_inv;   % 2 bits to invert sin and cos respectively
% end
% DDC_LINEUP_param.Complex_NCO2.ph_incrandInv     =  abs(DDC_LINEUP_param.Complex_NCO2.ph_incr) + (DDC_LINEUP_param.Complex_NCO2.Inv * (2^DDC_LINEUP_param.Complex_NCO2.accum_bit_width));
% 
% 

%% complex mixer
DDC_LINEUP_param.CM.SampleRate        	= DDC_LINEUP_param.SampleRate;        % output rate at CM  - 122.88 -- 4*30.72
DDC_LINEUP_param.CM.num_complex_chans	= DDC_LINEUP_param.ChanCount;
DDC_LINEUP_param.CM.num_complex_freqs	= DDC_LINEUP_param.ChanCount;

DDC_CM_multiplication_factor        = 1;
DDC_CM_number_of_bits_to_shift_left = 0;

DDC_CM_NCO_sync  = [0 0 0 0];
DDC_CM_NCO1_phase = [0 0 0 0]*2^DDC_LINEUP_param.Complex_NCO1.accum_bit_width; 
% DDC_CM_NCO2_phase = [0 0 0 0]*2^DDC_LINEUP_param.Complex_NCO2.accum_bit_width;


%% Filter 3 - HB1

DDC_LINEUP_param.HB_filt1.SampleRate            = DDC_LINEUP_param.SampleRate/2;	% Input rate at HB6 ~245.76e6
DDC_LINEUP_param.HB_filt1.Decimation            = 2;                      	    % Decmation rate  
DDC_LINEUP_param.HB_filt1.ChanCount             = DDC_LINEUP_param.ChanCount;
DDC_LINEUP_param.HB_filt1.coeff_word_length     = 16;                      	    % HB6 coefficient: bit width
DDC_LINEUP_param.HB_filt1.coeff_fraction_length = 15;                             % HB6 coefficient: fraction width 

%% Filter 2 - HB2

DDC_LINEUP_param.HB_filt2.SampleRate            = DDC_LINEUP_param.SampleRate;	% Input rate at HB6 ~245.76e6
DDC_LINEUP_param.HB_filt2.Decimation            = 2;                      	    % Decmation rate  
DDC_LINEUP_param.HB_filt2.ChanCount             = DDC_LINEUP_param.ChanCount;
DDC_LINEUP_param.HB_filt2.coeff_word_length     = 16;                      	    % HB6 coefficient: bit width
DDC_LINEUP_param.HB_filt2.coeff_fraction_length = 15; 

%% Filter 1 - HB3
% 
% DDC_LINEUP_param.HB_filt3.SampleRate            = DDC_LINEUP_param.SampleRate*2;	% Input rate at HB6 ~245.76e6
% DDC_LINEUP_param.HB_filt3.Decimation            = 2;                      	    % Decmation rate  
% DDC_LINEUP_param.HB_filt3.ChanCount             = DDC_LINEUP_param.ChanCount;
% DDC_LINEUP_param.HB_filt3.coeff_word_length     = 16;                      	    % HB6 coefficient: bit width
% DDC_LINEUP_param.HB_filt3.coeff_fraction_length = 15; 

%% Channel Filter 60 & 100 MHz

% N = 310;
% 
% % NR60 
% Fpass = 29.22;% 58.32/2;            % Using Extended Cut-poff frequency. Passband Frequency 1/2 x (162 RBs x 12 RB/RE x 30 KHz = 58.32 MHz)
% Fstop = 60/2;            % Stopband Frequency 1/2 x 100000
% Wpass = 1;%0.0057563991496;  % Passband Ripple +- 0.02 dB ripple
% Wstop = 1;%0.0045622776602;  % Stopband Attenuation = 53 dB
% dens  = 20;               % Density Factor
% Fs = 122.88;
% Coef60 = chFilter_design_order(N, Fpass, Fstop, Wpass, Wstop, dens, Fs);
% % Coef.Numerator
% 
% % NR100 
% Fpass = 49.2;% 98.28/2;            % Using Extended Cut-poff frequency. Passband Frequency 1/2 x (273 RBs x 12 RB/RE x 30 KHz = 98.28 MHz)
% Fstop = 100/2;            % Stopband Frequency 1/2 x 100000
% Wpass = 10;%0.0057563991496;  % Passband Ripple +- 0.02 dB ripple
% Wstop = 1;%0.0045622776602;  % Stopband Attenuation = 53 dB
% dens  = 20;               % Density Factor
% Fs = 122.88;
% Coef100 = chFilter_design_order(N, Fpass, Fstop, Wpass, Wstop, dens, Fs);

DDC_LINEUP_param.chan_filter.SampleRate            = DDC_LINEUP_param.SampleRate/4;     
DDC_LINEUP_param.chan_filter.ChanCount             = DDC_LINEUP_param.ChanCount;
DDC_LINEUP_param.chan_filter.coeff_word_length     = 16;                          % filter6 coefficient: bit width
DDC_LINEUP_param.chan_filter.coeff_fraction_length = 15;                          % filter6 coefficient: fraction width 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
% LOAD CO-EFF FILE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
% %HB1_coeffs = HB_Filt_designer;
% HB1_coeffs.Numerator = load('HB_122_245.txt') / 2^15;
DDC_LINEUP_param.HB_filt1.coeffs     =fi(ddc_tb_in.HB1_coeffs,1,DDC_LINEUP_param.HB_filt1.coeff_word_length ,DDC_LINEUP_param.HB_filt1.coeff_fraction_length);

% %HB1_coeffs = HB_Filt_designer;
% HB2_coeffs.Numerator = [0; load('HB_245_491.txt') / 2^15; 0];
DDC_LINEUP_param.HB_filt2.coeffs     =fi(ddc_tb_in.HB2_coeffs,1,DDC_LINEUP_param.HB_filt2.coeff_word_length ,DDC_LINEUP_param.HB_filt2.coeff_fraction_length);

% %HB3_coeffs = HB_Filt_designer;
% HB3_coeffs.Numerator = [0; load('HB_491_983.txt') / 2^15; 0];
% DDC_LINEUP_param.HB_filt3.coeffs    =fi(HB3_coeffs.Numerator,1,DDC_LINEUP_param.HB_filter3.coeff_word_length ,DDC_LINEUP_param.HB_filter3.coeff_fraction_length);
% 
%load('Co_efficients/100_MHz/Chan_Filter_100.mat');
DDC_LINEUP_param.chan_filter.coeffs(1,:)  =fi(ddc_tb_in.Coef60,1,DDC_LINEUP_param.chan_filter.coeff_word_length,DDC_LINEUP_param.chan_filter.coeff_fraction_length);
DDC_LINEUP_param.chan_filter.coeffs(2,:)  =fi(ddc_tb_in.Coeff100,1,DDC_LINEUP_param.chan_filter.coeff_word_length,DDC_LINEUP_param.chan_filter.coeff_fraction_length);    

if (DDC_LINEUP_param.bw_select == 100e6)
    BW_Config_CC1 = 14; % CC2 is configured for 100 MHz
else
    BW_Config_CC1 = 10; % CC1 is configured for 60 MHz
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
% Gain & Delay Compesation Values
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DDC_Gain_Ant1 = 1;
% DDC_Gain_Ant2 = 1;
% DDC_Gain_Ant3 = 1;
% DDC_Gain_Ant4 = 1;
% 
% DDC_Delay_Comp_Ant1_CC1 = 0;
% DDC_Delay_Comp_Ant2_CC1 = 0;
% DDC_Delay_Comp_Ant3_CC1 = 0;
% DDC_Delay_Comp_Ant4_CC1 = 0;
% DDC_Delay_Comp_Ant1_CC2 = 0;
% DDC_Delay_Comp_Ant2_CC2 = 0;
% DDC_Delay_Comp_Ant3_CC2 = 0;
% DDC_Delay_Comp_Ant4_CC2 = 0;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% load INPUT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% len_test = 2^12;
% tmp1 = decimator_out(:,1);
% DDC_LINEUP_param.DDC_Ant_Data_in_1          = tmp1(1:len_test);%
DDC_LINEUP_param.DDC_Ant_Data_in_1          = decimator_out(:,1);%tmp1(1:2^12);%

% tmp1 = decimator_out(:,2);
% DDC_LINEUP_param.DDC_Ant_Data_in_2          = tmp1(1:len_test);%
DDC_LINEUP_param.DDC_Ant_Data_in_2          = decimator_out(:,2);%tmp1(1:2^12);%

% tmp1 = decimator_out(:,3);
% DDC_LINEUP_param.DDC_Ant_Data_in_3          = tmp1(1:len_test);%
DDC_LINEUP_param.DDC_Ant_Data_in_3          = decimator_out(:,3);%tmp1(1:2^12);%

% tmp1 = decimator_out(:,4);
% DDC_LINEUP_param.DDC_Ant_Data_in_4          = tmp1(1:len_test);%
DDC_LINEUP_param.DDC_Ant_Data_in_4          = decimator_out(:,4);%tmp1(1:2^12);%

Const_Data_in_1 = [0.7071+0.7071i;zeros(length(DDC_LINEUP_param.DDC_Ant_Data_in_1)-1,1)];
Const_Data_in_2 = [0.7071+0.7071i;zeros(length(DDC_LINEUP_param.DDC_Ant_Data_in_1)-1,1)];
Const_Data_in_3 = [0.7071+0.7071i;zeros(length(DDC_LINEUP_param.DDC_Ant_Data_in_1)-1,1)];
Const_Data_in_4 = [0.7071+0.7071i;zeros(length(DDC_LINEUP_param.DDC_Ant_Data_in_1)-1,1)];

Const_Data_Mux_sel = 0;

DDC_LINEUP_param.DDC_Const_Data_in_1        = Const_Data_in_1;
DDC_LINEUP_param.DDC_Const_Data_in_2        = Const_Data_in_2;
DDC_LINEUP_param.DDC_Const_Data_in_3        = Const_Data_in_3;
DDC_LINEUP_param.DDC_Const_Data_in_4        = Const_Data_in_4;

DDC_LINEUP_param.DDC_Const_Data_Mux_sel     = Const_Data_Mux_sel;

DDC_LINEUP_param.valid     = 1;
DDC_LINEUP_param.channel   = [0].';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Simulation Parameters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if ~exist('Test_Bench_Run_Time','var')
    % Set default run time
    Test_Bench_Run_Time = length(DDC_LINEUP_param.DDC_Ant_Data_in_1);%150000;
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