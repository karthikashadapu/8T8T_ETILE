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

% Unless otherwise agreed by Intel in writing, you may not remove or alter this
% notice or any other notice embedded in Materials by Intel or Intel's suppliers
% or licensors in any way.
function fft_top_sim(fft_out,cp_removal,testcase_name,no_of_fft,fft_tb_in_l1,fft_tb_in_l2)

mkdir(fullfile(testcase_name,'fft_vectors'));
mkdir(fullfile(testcase_name,'deinterleaver_vectors'));
path_name_id1=[testcase_name,filesep,'fft_vectors',filesep,'fft_out_1_file.csv'];
id1=fopen (path_name_id1,'w');

path_name_id3=[testcase_name,filesep,'deinterleaver_vectors',filesep,'deint_out_1_file.csv'];
id3=fopen (path_name_id3,'w');
if(no_of_fft==8)
    path_name_id2=[testcase_name,filesep,'fft_vectors',filesep,'fft_out_2_file.csv'];
    id2=fopen (path_name_id2,'w');
    path_name_id4=[testcase_name,filesep,'deinterleaver_vectors',filesep,'deint_out_2_file.csv'];
    id4=fopen (path_name_id4,'w');
end

data=[];
for i=0:280-1
    for j=1:4  
        data(4096*(j-1)+1:4096*j,1) = cp_removal(4096*i+1:4096*(i+1),(j*2)-1);
    end
    file_data(1:length(data),1)=string(dec2hex(bitshift(double(typecast(int16(2^14*imag(data(:,1))),'uint16')),16)+double(typecast(int16(2^14*real(data(:,1))),'uint16'))));
    fprintf(id3,'%s\n',file_data);
end
fclose(id3);
clear file_data;
data=[];
num_carriers=fft_tb_in_l1.NPRB;
for i=0:280-1
    for j=1:4
        data(num_carriers*(j-1)+1:num_carriers*j,1) = fft_out(num_carriers*i+1:num_carriers*(i+1),(j*2)-1);
    end
    file_data(1:length(data),1)=string(dec2hex(bitshift(double(typecast(int16(2^11*imag(data(:,1))),'uint16')),16)+double(typecast(int16(2^11*real(data(:,1))),'uint16'))));
    fprintf(id1,'%s\n',file_data);
end
fclose(id1);
clear file_data;
if(no_of_fft==8)
    data=[];
    for i=0:280-1
        for j=1:4
            data(4096*(j-1)+1:4096*j,1) = cp_removal(4096*i+1:4096*(i+1),(j*2));
        end
        file_data(1:length(data),1)=string(dec2hex(bitshift(double(typecast(int16(2^14*imag(data(:,1))),'uint16')),16)+double(typecast(int16(2^14*real(data(:,1))),'uint16'))));
        fprintf(id4,'%s\n',file_data);
    end
    fclose(id4);
    clear file_data;
    data=[];
    num_carriers=fft_tb_in_l2.NPRB;
    for i=0:280-1
        for j=1:4
            data(num_carriers*(j-1)+1:num_carriers*j,1) = fft_out(num_carriers*i+1:num_carriers*(i+1),(j*2));
        end
        file_data(1:length(data),1)=string(dec2hex(bitshift(double(typecast(int16(2^11*imag(data(:,1))),'uint16')),16)+double(typecast(int16(2^11*real(data(:,1))),'uint16'))));
        fprintf(id2,'%s\n',file_data);
    end
    fclose(id2);
    clear file_data;
end

end

