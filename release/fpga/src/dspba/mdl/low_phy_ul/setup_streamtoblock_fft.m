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
close all;
clearvars -except TestCaseId ManualRun NMSE_ERR CH_ERR NPSE_ERR cc NumSym;
addpath('../lib')
%% data load
 local_file_sel = 1;
% 
if (local_file_sel==1)
load('local_test_input_output.mat');
fft_tb_in =fft_tb_in_local;
fft_tb_exp_out =fft_tb_exp_out_local;
disp('local dataset loaded')
else
 load('ext_test_input_output.mat');
 fft_tb_in =fft_tb_in_ext;
 fft_tb_exp_out =fft_tb_exp_out_ext;
 disp('ext data set loaded')
 end

DSPBA_Features.UseDSPInputRoutingRegisters =0;
DSPBA_Features.enableFanoutBlocks=false;

%  TC=1;
% 
% load_LTE_input;
% load_usecases;
% usecase = usecase_100MHz;
% if ~exist('Test_Bench_Run_Time','var')
%     % Set default run time
%     Test_Bench_Run_Time = 200000;
% end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% System Parameters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dspba_streamtosym.ClockRate	= 491.52;
dspba_streamtosym.ClockMargin = 100;
dspba_streamtosym.SampleTime = 1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% IFFT configuration
min_FFTStages = 9;
max_FFTStages = 12;
max_FFTSize = 2^max_FFTStages;
max_PrefixLength = 352;
max_BlockRepCnt = 16;
max_NSubcarriers = 3276;
% %% 2*100 MHz
% if(TC==1)
% dspba_streamtosym.inputdata_l1   = inputdata.';
% 
% dspba_streamtosym.valid   = [ones(35328,1) ; zeros(35328,1)];
% dspba_streamtosym.bw_l1   = 12;
% dspba_streamtosym.cp_l1   = 352;
% dspba_streamtosym.nprb_l1 = 3276;
% 
% end


%% FFT

dspb_fft_multichannel.SampleTime = 1;

% NSubcarriers = usecase.NSubcarriers;
BlockRepetitionCount = 7;
% FirstPrefixLength = usecase.FirstPrefixLength;
% RemainingPrefixLength = usecase.RemainingPrefixLength;
fft_scale_val= 10;


% load('test_case_file.mat','ipvector_cap','dout_v','d_in','valid_in','CPLen_in','fftsize_in','dummyones_in','dout_brsc_v','ifftout_v','ifft_cp_v','NPRB','ChNo_in','constgain','Muxsel','MuxConstData','ifftshift','DC_SC_EN','chout_v','hcshift','nprb_v','const_gain_v','hcshift_v','ifftshift_v','time_v','valid_out','ip_ch_cap','F1','pc_comp_v','phasor_v','Tech_CP','Tsym','Tsym_reinterpret_LUT');
dspba_streamtosym.SimulationTime=length(fft_tb_in.valid_out);
%load('dspba_tv_ip_tc_9.mat','ipvector_cap','dout_v','d_in','valid_in','CPLen_in','fftsize_in','dummyones_in','dout_brsc_v','ifftout_v','ifft_cp_v','NPRB','ChNo_in','constgain','Muxsel','MuxConstData','ifftshift','DC_SC_EN','chout_v','hcshift','nprb_v','const_gain_v','hcshift_v','ifftshift_v','time_v','valid_out');
initZeros = 100;





%% Phase compensation setting

%% MM Register Setting


lut = [ 2864.58333333333	38541.6666666667	74218.7500000000	109895.833333333	145572.916666667	181250.000000000	216927.083333333	252604.166666667	288281.250000000	323958.333333333	359635.416666667	395312.500000000	430989.583333333	466666.666666667] ;

%F1_fix = fi(fft_tb_in.F1,0,64,56);
F1_fix = fi(fft_tb_in.F1,0,64,32);
F1_full = double(F1_fix);% bin2dec(F1_fix.bin(1:32));
F1_MSB = bin2dec(F1_fix.bin(1:32));
F1_LSB = bin2dec(F1_fix.bin(33:end));

  %TLUT= double(fi(lut,0,48,24));
  TLUT= double(fi(lut,0,64,32));
  Tsym_reinterpret_LUT = TLUT;


reg_mem_offset_version = 7;
Class_Version=0;
Major_vesion=0;
Minor_version=1;
Patch_version=0;

Version_reg_val = Class_Version*2^24 +Major_vesion*2^16 +Minor_version*2^8 +Patch_version;

