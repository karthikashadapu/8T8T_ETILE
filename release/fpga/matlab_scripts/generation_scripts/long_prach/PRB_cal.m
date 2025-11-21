% INTEL CONFIDENTIAL
% Copyright 2015 Intel Corporation All Rights Reserved.
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
%
% Author:      Nima Safari
% File:        PRN_cal.m
% Description: Assign number of PRBs based on(3GPP TS 138104 Table 5.3.2-1)

%%% BW     = [5  10 15 20  25  30  35  40  45  50  60  70  80  90  100]
%%% PRB_15 = [25 52 79 106 133 160 188 216 242 270 0   0   0   0   0]    
%%% PRB_30 = [11 24 38 51  65  78  92  106 119 133 162 189 217 245 273]
%%% PRB_60 = [0  11 18 24  31  38  44  51  58  65  79  93  107 121 135]

function [Y, Z] = PRB_cal(BW, SCS)

BWoption       = [5  10 15 20  25  30  35  40  45  50  60  70  80  90  100];
PRBmatrix(1,:) = [25 52 79 106 133 160 188 216 242 270 0   0   0   0   0];
PRBmatrix(2,:) = [11 24 38 51  65  78  92  106 119 133 162 189 217 245 273];
PRBmatrix(3,:) = [0  11 18 24  31  38  44  51  58  65  79  93  107 121 135];
SampleRate = 1e3*[7.68, 15.36 30.72 30.72 30.72 61.44 61.44 61.44 61.44 61.44 122.88 122.88 122.88 122.88 122.88];

index = find(BWoption == BW);
if isempty(index)
    error('The chosen BW is not supported in 3GPP')
end

 switch SCS
        case 15
            Y = PRBmatrix(1,index);
        case 30
            Y = PRBmatrix(2,index);
        case 60
            Y = PRBmatrix(3,index);
     otherwise
         error('The chosen Subcarrier Sapcing is not supported.')
 end
 
 if Y == 0
     error('3GPP does not support the chosen BW for the specified SCS.');
 end

 Z = SampleRate(index);
 
%    switch BW
%         case 5
%             SamplePerSubF = 7680;
%             
%         case 10
%             SamplePerSubF = 15360;
%             waveconfig.Carriers.NSizeGrid = 52; % (3GPP TS 138104 Table 5.3.2-1).  
%         case 15
%             SamplePerSubF = 30720;
%             waveconfig.Carriers.NSizeGrid = 79; % (3GPP TS 138104 Table 5.3.2-1).  
%         case 20
%             SamplePerSubF = 30720;
%             waveconfig.Carriers.NSizeGrid = 106; % (3GPP TS 138104 Table 5.3.2-1).  
%         case 25
%             SamplePerSubF = 30720;
%             waveconfig.Carriers.NSizeGrid = 133; % (3GPP TS 138104 Table 5.3.2-1).  
%         case 30
%             SamplePerSubF = 61440;
%             waveconfig.Carriers.NSizeGrid = 160; % (3GPP TS 138104 Table 5.3.2-1).  
%         case 35
%             SamplePerSubF = 30720;
%             waveconfig.Carriers.NSizeGrid = 188; % (3GPP TS 138104 Table 5.3.2-1). 
%         case 40
%             SamplePerSubF = 61440;
%             waveconfig.Carriers.NSizeGrid = 216; % (3GPP TS 138104 Table 5.3.2-1).  
%         case 50
%             SamplePerSubF = 61440;  
%             waveconfig.Carriers.NSizeGrid = 270; % (3GPP TS 138104 Table 5.3.2-1). 
%         case 60
%             SamplePerSubF = 122880;
%             waveconfig.Carriers.NSizeGrid = 162; % (3GPP TS 138104 Table 5.3.2-1).  
%         case 70
%             SamplePerSubF = 122880;
%             waveconfig.Carriers.NSizeGrid = 189; % (3GPP TS 138104 Table 5.3.2-1).  
%         case 80
%             SamplePerSubF = 122880;
%             waveconfig.Carriers.NSizeGrid = 217; % (3GPP TS 138104 Table 5.3.2-1).  
%         case 90
%             SamplePerSubF = 122880;
%             waveconfig.Carriers.NSizeGrid = 245; % (3GPP TS 138104 Table 5.3.2-1).  
%         case 100
%             SamplePerSubF = 122880;
%             waveconfig.Carriers.NSizeGrid = 273; % (3GPP TS 138104 Table 5.3.2-1). 
%     end
%  