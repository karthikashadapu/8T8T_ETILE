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
% pcap_file='/mnt/media/Drive_I/Projects/sruthi/IN-Phipspeak/IN-PhippsPeak_Matlab/coupling_pcap_parser/01_test_100_9000_tc1_bfp9_fs_12_m1.pcap';
function [ifft_in]=parser(pcap_file)

no_axc=8;
compression_type=9;
fs_offset=12;
eaxc_id_sel=0;

% pcap parser intregration
mex -R2018a generation_scripts/coupling_pcap_parser/parser_test.cpp generation_scripts/coupling_pcap_parser/liblibrary.so -lpcap
parser_res=parser_test(pcap_file,no_axc,compression_type,fs_offset,eaxc_id_sel);

% rearranging iq data extracted from pcap
for i=1:8
    sl_c=1;
    for j=1:280
        for k=1:2:6552
            iq_complex_data(sl_c,i)=complex(parser_res(k,(8*(j-1))+i),parser_res(k+1,(8*(j-1))+i))/2^15;
            sl_c=sl_c+1;
        end
    end
end
for i=1:8
    ifft_in(:,9-i)=iq_complex_data(:,i);
end

end