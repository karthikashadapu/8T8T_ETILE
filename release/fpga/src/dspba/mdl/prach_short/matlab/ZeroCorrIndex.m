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
% File:        ZeroCorrIndex.m
% Description: Generate Zero Correlation Index for Long and Short Preamble PRACH.

function Ncs = ZeroCorrIndex(cs_idx,HighSpeed, SC_spacing)

if SC_spacing == 1.25
    cs_table = [0 13 15 18 22 26 32 38 46 59 76 93 119 167 279 419; ...
            15 18 22 26 32 38 46 55 68 82 100 128 158 202 237 0];
else
   cs_table = [0 2 4 6 8 10 12 13 15 17 19 23 27 34 46 69];
end

if HighSpeed > 0
    HighSpeed = 1;
else 
    HighSpeed = 0;
end
Ncs = cs_table(HighSpeed+1, cs_idx+1);