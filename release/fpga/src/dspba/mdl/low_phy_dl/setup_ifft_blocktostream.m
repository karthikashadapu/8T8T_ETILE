 % INTEL CONFIDENTIAL
% Copyright 2021 Intel Corporation All Rights Reserved.
%
% Thle source code contained or described herein and all documents related to the
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
% File: setup_ifft_eaxc_to_cc.m
% Description: Script to set variables in Matlab workspace to configure
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all;
clc
clearvars -except TestCaseId ManualRun NMSE_ERR Simruntime Ch_out_ERR NPSE_ERR Tsym_reinterpret_LUT cc NumSym; 
addpath('../lib')
%Simruntime = 200000;

%%
%% data load
local_file_sel = 1;

if (local_file_sel==1)
load('local_test_input_output.mat');
ifft_tb_in =ifft_tb_in_local;
ifft_tb_exp_out=ifft_tb_exp_out_local;
disp('local dataset loaded')
else
 load('ext_test_input_output.mat');
ifft_tb_in =ifft_tb_in_ext;
ifft_tb_exp_out=ifft_tb_exp_out_ext;

disp('ext data set loaded')
end

dspb_ifft_multichannel.SimulationTime=length(ifft_tb_in.valid_in);





DSPBA_Features.UseDSPInputRoutingRegisters =0;
DSPBA_Features.enableFanoutBlocks=true;
%%fLAGS
% TC=1;




%% Test Case: 2*100MHz
% if(TC==1)
%     load('tmgrid_100MHz_NR_30KHz.mat');
%     bandwidth = 100e6;
%     number_of_subcarriers = 3276;
%     number_of_symbols = length(tmgrid_100MHz)/number_of_subcarriers;
%     inputdata_l1 = [];
%     inputdata_l2 = [];
%     valid_l1 = [];
%     valid_l2 = [];
%     sequence_l1 = [];
%     sequence_l2 = [];
%     end_ind = 0;
%     chn = -1;
% 
% for sym=1:number_of_symbols;      
%          len = number_of_subcarriers;
%          start_ind = end_ind + 1;
%          end_ind = end_ind + len;
% 
%             if(chn == 13)
%                 chn = 0;
%             else
%                 chn = chn +1;
%             end
% 
%             if chn == 0
%                  idle_cycles= 1172;
%             else
%                  idle_cycles= 1108;
%             end
% 
% 
%         for axc=1:4;          
%             a = eval(sprintf('tmgrid_100MHz(%d:%d,%d)',start_ind,end_ind,axc));
%             inputdata_l1 = [inputdata_l1 ; a];
%             valid_l1 = [valid_l1 , ones(1,len) , zeros(1,idle_cycles)];
%             sequence_l1 = [sequence_l1 ; ones(len,1)*chn ];
%         end
% 
% 
%         for axc=5:8;          
%             a = eval(sprintf('tmgrid_100MHz(%d:%d,%d)',start_ind,end_ind,axc));
%             inputdata_l2 = [inputdata_l2 ; a];
%             valid_l2 = [valid_l2 , ones(1,len) , zeros(1,idle_cycles)];
%             sequence_l2 = [sequence_l2 ; ones(len,1)*chn ];
%         end 
% 
% end     
% 
%    ifft_valid_l1.time=[];
%    ifft_valid_l1.signals.values = valid_l1' ;
%    ifft_valid_l1.signals.dimensions = 1;
% 
%    size_in_l1=ones(1,length(inputdata_l1))*12;
%    cp_in_l1=ones(1,length(inputdata_l1))*352;
%    nsc_l1 = ones(1,length(inputdata_l1))*3276;
% 
%    ifft_valid_l2.time=[];
%    ifft_valid_l2.signals.values = valid_l2' ;
%    ifft_valid_l2.signals.dimensions = 1;
% 
%    size_in_l2=ones(1,length(inputdata_l2))*12;
% end 
% 
% %% load and select use cases
% load_usecases;
% usecase = usecase_100MHz;
% 
%% Configuration Parameters
% dspb_ifft_multichannel.SimulationTime=4096*14*3;
dspb_ifft_multichannel.ClockRate	= 491.52;
dspb_ifft_multichannel.ClockMargin = 50;
dspb_ifft_multichannel.SampleTime = 1;

% NSubcarriers = usecase.NSubcarriers;
% BlockRepetitionCount = 14;
% FirstPrefixLength = usecase.FirstPrefixLength;
% RemainingPrefixLength = usecase.RemainingPrefixLength;
% fft_scale_val= 10;
% ifft_scale_val= 5;

%% IFFT configuration
dspb_ifft_multichannel.IFFT = true;
dspb_ifft_multichannel.minsize = 9;
dspb_ifft_multichannel.maxsize = 12;
dspb_ifft_multichannel.N = 12;
dspb_ifft_multichannel.subchannels = 1; % must be a power of 2
dspb_ifft_multichannel.FFTsize = 2^dspb_ifft_multichannel.N;
dspb_ifft_multichannel.blockSize = dspb_ifft_multichannel.subchannels * dspb_ifft_multichannel.FFTsize;



% dspb_ifft_multichannel.ifft_gain_value_re  = 1;
% dspb_ifft_multichannel.ifft_gain_value_im  = 0;
% dspb_ifft_multichannel.ifft_shift_value = 12;
% dspb_ifft_multichannel.ifft_const_mux_value = 0;
% dspb_ifft_multichannel.ifft_const_mux_sel_value = 0;


% %% Digital Power Scaling
% dspb_ifft_multichannel.Digital_power_real = 1-(2^-14);
% dspb_ifft_multichannel.Digital_power_imag = 0;

%% Reduce pipelining to save resources
DSPBA_Features.UseDSPInputRoutingRegisters = 0;
DSPBA_Features.enableFanoutBlocks=false;
DSPBA_Features.resetFanoutMitigation=true;
DSPBA_Features.schedulerLongDelayPolicy='fanout';

%%
% load('test_case_file.mat','ipvector_cap','dout_v','d_in','valid_in','CPLen_in','fftsize_in','dummyones_in','dout_brsc_v','ifftout_v','ifft_cp_v','NPRB','ChNo_in','constgain','Muxsel','MuxConstData','ifftshift','DC_SC_EN','AxC_out_v','Tech_CP','Tsym','TCP','F1','pc_comp_v','phasor_v','Tsym_reinterpret_LUT');
%load('dspba_tv_ip_tc_17.mat','ipvector_cap','dout_v','d_in','valid_in','CPLen_in','fftsize_in','dummyones_in','dout_brsc_v','ifftout_v','ifft_cp_v','NPRB','ChNo_in','constgain','Muxsel','MuxConstData','ifftshift','DC_SC_EN');
% dspb_ifft_multichannel.SimulationTime=length(valid_in);


% load('output_data_512_2sym.mat');
% load('input_data_512_2sym.mat');
% 
%  ifft_valid_l1.time=[];
%  ifft_valid_l1.signals.values = Vg' ;
%  ifft_valid_l1.signals.dimensions = 1;

 
% inputdata_l1 = Xg;
% sequence_l1 = chg';
% cp_in_l1 = cpleng';
% size_in_l1 = Ng';


%% Phase compensation setting
lut = [ 2864.58333333333	38541.6666666667	74218.7500000000	109895.833333333	145572.916666667	181250.000000000	216927.083333333	252604.166666667	288281.250000000	323958.333333333	359635.416666667	395312.500000000	430989.583333333	466666.666666667] ;
F1= ifft_tb_in.F1;
%F1_fix = fi(F1,0,32,24);
F1_fix = fi(F1,0,64,32);
F1_full = double(F1_fix);% bin2dec(F1_fix.bin(1:32));
F1_MSB = bin2dec(F1_fix.bin(1:32));
F1_LSB = bin2dec(F1_fix.bin(33:end));
%  TLUT= double(fi(lut,0,48,24));
TLUT= double(fi(lut,0,64,32));
  Tsym_reinterpret_LUT = TLUT;
% a = 3.7497; % carrier center frequency in GHz - LSB
% freq_val = fi(a,0,32,24);
% int32_form = freq_val * 2^24

%% 
reg_mem_offset_version = 3;
Class_Version=0;
Major_vesion=0;
Minor_version=1;
Patch_version=0;

Version_reg_val = Class_Version*2^24 +Major_vesion*2^16 +Minor_version*2^8 +Patch_version;

