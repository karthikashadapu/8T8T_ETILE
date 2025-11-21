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


% load('interpolator_out.mat');

DDC_LINEUP_param.DUC_A1                     = interp_out(:,1);
DDC_LINEUP_param.DDC_Ant_Data_in_1          = DDC_LINEUP_param.DUC_A1(1:2:end);

DDC_LINEUP_param.DUC_A2                     = interp_out(:,1);
DDC_LINEUP_param.DDC_Ant_Data_in_2          = DDC_LINEUP_param.DUC_A2(2:2:end);

DDC_LINEUP_param.DUC_A3                     = interp_out(:,2);
DDC_LINEUP_param.DDC_Ant_Data_in_3          = DDC_LINEUP_param.DUC_A3(1:2:end);

DDC_LINEUP_param.DUC_A4                     = interp_out(:,2);
DDC_LINEUP_param.DDC_Ant_Data_in_4          = DDC_LINEUP_param.DUC_A4(2:2:end);

DDC_LINEUP_param.DUC_A5                     = interp_out(:,3);
DDC_LINEUP_param.DDC_Ant_Data_in_5          = DDC_LINEUP_param.DUC_A5(1:2:end);

DDC_LINEUP_param.DUC_A6                     = interp_out(:,3);
DDC_LINEUP_param.DDC_Ant_Data_in_6          = DDC_LINEUP_param.DUC_A6(2:2:end);

DDC_LINEUP_param.DUC_A7                     = interp_out(:,4);
DDC_LINEUP_param.DDC_Ant_Data_in_7          = DDC_LINEUP_param.DUC_A7(1:2:end);

DDC_LINEUP_param.DUC_A8                     = interp_out(:,4);
DDC_LINEUP_param.DDC_Ant_Data_in_8          = DDC_LINEUP_param.DUC_A8(2:2:end);

DDC_LINEUP_param.valid     = 1;
DDC_LINEUP_param.channel   = [0].';

disp('[loaad_input.m]: Executed');