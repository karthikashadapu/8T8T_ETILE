% *******************************************************************************
% INTEL CONFIDENTIAL
% Copyright 2023 Intel Corporation All Rights Reserved.
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
% *******************************************************************************
% Author:
% File:        pcap2mex.m
% Description: top file to convert pcap to mex
% to perform subsystem processing
OUTPUT_BASEPATH = ['..', filesep, '..', filesep, 'testvector', filesep];
 
INPUT_SIM_PATH=[OUTPUT_BASEPATH, filesep,'input',filesep ,'sim',filesep];
 
pcap_file=[INPUT_SIM_PATH,'tcs_01',filesep,'tcs_01_100_9000_tc1_bfp9_fs_12.pcap'];
addpath(['generation_scripts',filesep,'coupling_pcap_parser']);
[ifft_in]=parser(pcap_file);
save([INPUT_SIM_PATH,'tcs_01',filesep,'ifft_in.mat'],"ifft_in");

