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
%%

%% LOAD EXPECTED OUTPUT
% load('mixer_out_ddc.mat');
load('ddc_out.mat');
%% dspba mixer output
% ddc_mixer_dspba1_out1 = double(mixer_out1(:,1));
% ddc_mixer_dspba1_out2 = double(mixer_out1(:,2));
% ddc_mixer_dspba1_out3 = double(mixer_out1(:,3));
% ddc_mixer_dspba1_out4 = double(mixer_out1(:,4));
% ddc_mixeroutdspba1 = double(mixer_out1);
%% matlab mixer output
%     ddc_mixer_mat_out1 = double(mixer_out_ddc(:,AXC_SEL(1)));
%     ddc_mixer_mat_out2 = double(mixer_out_ddc(:,AXC_SEL(2)));
%     ddc_mixer_mat_out3 = double(mixer_out_ddc(:,AXC_SEL(3)));
%     ddc_mixer_mat_out4 = double(mixer_out_ddc(:,AXC_SEL(4)));

%     ddc_mixeroutmat(:,1)= double(mixer_out_ddc(:,AXC_SEL(1)));
%     ddc_mixeroutmat(:,2) = double(mixer_out_ddc(:,AXC_SEL(2)));
%     ddc_mixeroutmat(:,3) = double(mixer_out_ddc(:,AXC_SEL(3)));
%     ddc_mixeroutmat(:,4) = double(mixer_out_ddc(:,AXC_SEL(4)));


%%

% disp('_mixer Output AXC'); [NMSE(1),NPSE(1)] = NMSE_NPSE_calc(ddc_mixer_mat_out1,ddc_mixer_dspba1_out1);
% disp('_mixer Output AXC'); [NMSE(2),NPSE(2)] = NMSE_NPSE_calc(ddc_mixer_mat_out2,ddc_mixer_dspba1_out2);
% disp('_mixer Output AXC'); [NMSE(3),NPSE(3)] = NMSE_NPSE_calc(ddc_mixer_mat_out3,ddc_mixer_dspba1_out3);
% disp('_mixer Output AXC'); [NMSE(4),NPSE(4)] = NMSE_NPSE_calc(ddc_mixer_mat_out4,ddc_mixer_dspba1_out4);

% disp('NMSE NPSE Analysis'); [NMSE_DDCMIX,NPSE_DDCMIX] = NMSE_NPSE_calc(ddc_mixeroutmat,ddc_mixeroutdspba1);

%% dspba ddc output
ddc_out_dspba = chFiltOut;
disp('dspba ddc out');

%% matlab ddc output
tmwave = ddc_out;
run('tmwave_to_NRinput.m');
ddc_out_mat = NRInput;
disp('matlab ddc out');

%%
disp('ddc Output NMSE NPSE'); [NMSE,NPSE] = NMSE_NPSE_calc(ddc_out_mat,ddc_out_dspba);

disp(['NMSE DDC Model in dB:']);
NMSE
disp(['NPSE DDC Model in dB:']);
NPSE

disp('DDC Model output analysis done');