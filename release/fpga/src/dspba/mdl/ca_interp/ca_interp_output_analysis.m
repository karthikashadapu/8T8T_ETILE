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
% close all;
%% LOAD EXPECTED OUTPUT
load('interpolator_out.mat');

%% dspba polyphase filter output
% pp_filt_out1 = double(PolyPhase0_dOut(:,1));
% pp_filt_out2 = double(PolyPhase0_dOut(:,2));
% pp_filt_out3 = double(PolyPhase0_dOut(:,3));
% pp_filt_out4 = double(PolyPhase0_dOut(:,4));
% pp_filt_out5 = double(PolyPhase0_dOut(:,5));
% pp_filt_out6 = double(PolyPhase0_dOut(:,6));
% pp_filt_out7 = double(PolyPhase0_dOut(:,7));
% pp_filt_out8 = double(PolyPhase0_dOut(:,8));
interpOutdspba = double(PolyPhase0_dOut);

%% matlab polyphase filter output
% temp_refout1 = double(interp_out(:,1));
% pp_filt_refout1 = temp_refout1(1:2:end);
% pp_filt_refout2 = temp_refout1(2:2:end);
% temp_refout2 = double(interp_out(:,2));
% pp_filt_refout3 = temp_refout2(1:2:end);
% pp_filt_refout4 = temp_refout2(2:2:end);
% temp_refout3 = double(interp_out(:,3));
% pp_filt_refout5 = temp_refout3(1:2:end);
% pp_filt_refout6 = temp_refout3(2:2:end);
% temp_refout4 = double(interp_out(:,4));
% pp_filt_refout7 = temp_refout4(1:2:end);
% pp_filt_refout8 = temp_refout4(2:2:end);

temp_refout1 = double(interp_out(:,1));
interpOutref(:,1) = temp_refout1(1:2:end);
interpOutref(:,2) = temp_refout1(2:2:end);
temp_refout2 = double(interp_out(:,2));
interpOutref(:,3) = temp_refout2(1:2:end);
interpOutref(:,4) = temp_refout2(2:2:end);
temp_refout3 = double(interp_out(:,3));
interpOutref(:,5) = temp_refout3(1:2:end);
interpOutref(:,6) = temp_refout3(2:2:end);
temp_refout4 = double(interp_out(:,4));
interpOutref(:,7) = temp_refout4(1:2:end);
interpOutref(:,8) = temp_refout4(2:2:end);


% disp('interpolator Output AXC1'); [NMSE(1),NPSE(1)] = NMSE_NPSE_calc(pp_filt_refout1,pp_filt_out1);
% disp('interpolator Output AXC2'); [NMSE(2),NPSE(2)] = NMSE_NPSE_calc(pp_filt_refout2,pp_filt_out2);
% disp('interpolator Output AXC3'); [NMSE(3),NPSE(3)] = NMSE_NPSE_calc(pp_filt_refout3,pp_filt_out3);
% disp('interpolator Output AXC4'); [NMSE(4),NPSE(4)] = NMSE_NPSE_calc(pp_filt_refout4,pp_filt_out4);
% disp('interpolator Output AXC5'); [NMSE(5),NPSE(5)] = NMSE_NPSE_calc(pp_filt_refout5,pp_filt_out5);
% disp('interpolator Output AXC6'); [NMSE(6),NPSE(6)] = NMSE_NPSE_calc(pp_filt_refout6,pp_filt_out6);
% disp('interpolator Output AXC7'); [NMSE(7),NPSE(7)] = NMSE_NPSE_calc(pp_filt_refout7,pp_filt_out7);
% disp('interpolator Output AXC8'); [NMSE(8),NPSE(8)] = NMSE_NPSE_calc(pp_filt_refout8,pp_filt_out8);

disp('NMSE NPSE CALCULATION'); [NMSE,NPSE] = NMSE_NPSE_calc(interpOutref,interpOutdspba);

% disp(['NMSE ca_interp in dB:']);
% NMSE
% disp(['NPSE ca_interp in dB:']);
% NPSE

disp('ca_interp Analysis done')