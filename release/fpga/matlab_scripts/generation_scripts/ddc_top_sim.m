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
function ddc_top_sim(decimator_out,mixer_out_ddc,ddc_out,testcase_name,no_of_fft)

mkdir(fullfile(testcase_name,'ddc_vectors'));
mkdir(fullfile(testcase_name,'ul_mixer_vectors'));
mkdir(fullfile(testcase_name,'decimator_vectors'));

path_name_id1=[testcase_name,filesep,'decimator_vectors',filesep,'dec_out_file.csv'];
id1=fopen (path_name_id1,'w');

path_name_id2=[testcase_name,filesep,'ul_mixer_vectors',filesep,'Mixer_out_ddc_1_file.csv'];
id2=fopen (path_name_id2,'w');

path_name_id4=[testcase_name,filesep,'ddc_vectors',filesep,'ddc_out_1_file.csv'];
id4=fopen (path_name_id4,'w');
if(no_of_fft==8)
    path_name_id3=[testcase_name,filesep,'ul_mixer_vectors',filesep,'Mixer_out_ddc_2_file.csv'];
    id3=fopen (path_name_id3,'w');

    path_name_id5=[testcase_name,filesep,'ddc_vectors',filesep,'ddc_out_2_file.csv'];
    id5=fopen (path_name_id5,'w');
end

data=[];
data1=[];
for i=1:4
    data1(i,:)=decimator_out(:,i);
end
data=reshape(data1,[],1);
file_data(1:length(data),1)=string(dec2hex(bitshift(double(typecast(int16(2^14*imag(data(:,1))),'uint16')),16)+double(typecast(int16(2^14*real(data(:,1))),'uint16'))));
fprintf(id1,'%s\n',file_data);
fclose(id1);
clear file_data;
data=[];
data1=[];
for i=1:4
    data1(i,:)=mixer_out_ddc(:,(i*2)-1);
end
data=reshape(data1,[],1);
file_data(1:length(data),1)=string(dec2hex(bitshift(double(typecast(int16(2^14*imag(data(:,1))),'uint16')),16)+double(typecast(int16(2^14*real(data(:,1))),'uint16'))));
fprintf(id2,'%s\n',file_data);
fclose(id2);
clear file_data;
data=[];
data1=[];
for i=1:4
    data1(i,:)=ddc_out(:,(i*2)-1);
end
data=reshape(data1,[],1);
file_data(1:length(data),1)=string(dec2hex(bitshift(double(typecast(int16(2^14*imag(data(:,1))),'uint16')),16)+double(typecast(int16(2^14*real(data(:,1))),'uint16'))));
fprintf(id4,'%s\n',file_data);
fclose(id4);
clear file_data;
if(no_of_fft==8)
    data=[];
    data1=[];
    for i=1:4
        data1(i,:)=mixer_out_ddc(:,i*2);
    end
    data=reshape(data1,[],1);
    file_data(1:length(data),1)=string(dec2hex(bitshift(double(typecast(int16(2^14*imag(data(:,1))),'uint16')),16)+double(typecast(int16(2^14*real(data(:,1))),'uint16'))));
    fprintf(id3,'%s\n',file_data);
    fclose(id3);
    clear file_data;
    data=[];
    data1=[];
    for i=1:4
        data1(i,:)=ddc_out(:,i*2);
    end
    data=reshape(data1,[],1);
    file_data(1:length(data),1)=string(dec2hex(bitshift(double(typecast(int16(2^14*imag(data(:,1))),'uint16')),16)+double(typecast(int16(2^14*real(data(:,1))),'uint16'))));
    fprintf(id5,'%s\n',file_data);
    fclose(id5);
    clear file_data;
end
end