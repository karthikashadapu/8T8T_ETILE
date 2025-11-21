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
close all;
%% LOAD EXPECTED OUTPUT
load('decimator_out.mat');
%% dspba decimator output
% decimator_dspba1_out1 = double(decimator_out_dspba1(:,1));
% decimator_dspba1_out2 = double(decimator_out_dspba1(:,2));
% decimator_dspba1_out3 = double(decimator_out_dspba1(:,3));
% decimator_dspba1_out4 = double(decimator_out_dspba1(:,4));
decimatoroutdspba1 = double(decimator_out_dspba1);

%% matlab decimator output
% decimator_mat_out1 = double(decimator_out(:,1));
% decimator_mat_out2 = double(decimator_out(:,2));
% decimator_mat_out3 = double(decimator_out(:,3));
% decimator_mat_out4 = double(decimator_out(:,4));
decimatoroutmat = double(decimator_out);
%%

% disp('interpolator Output AXC1'); [NMSE(1),NPSE(1)] = NMSE_NPSE_calc(decimator_mat_out1,decimator_dspba1_out1);
% disp('interpolator Output AXC2'); [NMSE(2),NPSE(2)] = NMSE_NPSE_calc(decimator_mat_out2,decimator_dspba1_out2);
% disp('interpolator Output AXC3'); [NMSE(3),NPSE(3)] = NMSE_NPSE_calc(decimator_mat_out3,decimator_dspba1_out3);
% disp('interpolator Output AXC4'); [NMSE(4),NPSE(4)] = NMSE_NPSE_calc(decimator_mat_out4,decimator_dspba1_out4);

disp('NMSE NPSE ANalysis'); [NMSE ,NPSE] = NMSE_NPSE_calc(decimatoroutmat,decimatoroutdspba1);

disp(['NMSE dec_dly_comp in dB:']);
NMSE
disp(['NPSE dec_dly_comp in dB:']);
NPSE

disp('dec_dly_comp output analysis done');