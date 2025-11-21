%% Take data from DLPath_Tap_dataout and convert to input for DUC in columns 1,3,5,7. 
% For both cc1 and cc2 we save data in 1,3,5,7 columns because
% the standalone model is for a single CC and will take input from these columns only

%Reading relative path of expected vector folder
readme_fileID = fopen('locate_testvector.txt');
readme_text = textscan(readme_fileID,'%s');
fclose(readme_fileID);
DIR_EXP_VECT = readme_text{1, 1}{1, 1} ;

if(cc==1)
    load("dspba_vectors/ifft/cc1/ifft_out.mat");
end
if(cc==2)
    load("dspba_vectors/ifft/cc2/ifft_out.mat");
end

tmwave=[];
column = 1;
row = 1;

for i = 1:length(DLpath_Tap_data_out)
    temp1 = DLpath_Tap_data_out(i);
    tmwave(row, column)=temp1;
    column=column+2;
    if(column==9)
        column=1;
        row=row+1;
    end
end

tmwave(:,8)=0; %To add total 8 columns for consistency with standalone model
ifft_out=tmwave;
save("../mdl/duc/ifft_out.mat","ifft_out")

%% Copying settings file depending on the cc number
% duc_nco value taken by model is from 1,3,5,7 columns, 
% so converting to that format

load(sprintf("%s/settings.mat",DIR_EXP_VECT));
if(cc==1)
   duc_tb_in = duc_tb_in_l1; 
   duc_tb_in.nco_freq_val = [duc_tb_in.duc_nco(1) 0 duc_tb_in.duc_nco(2) 0 duc_tb_in.duc_nco(3) 0 duc_tb_in.duc_nco(4) 0]*1e6;
end
if(cc==2)
   duc_tb_in = duc_tb_in_l2;
   duc_tb_in.nco_freq_val = [duc_tb_in.duc_nco(1) 0 duc_tb_in.duc_nco(2) 0 duc_tb_in.duc_nco(3) 0 duc_tb_in.duc_nco(4) 0]*1e6;
end
save("../mdl/duc/settings.mat","duc_tb_in");

%% Add the expected vector from MATLAB to DUC folder
% Expected vector are taken from column 1,3,5,7 in model. It's fine for CC1.
% For CC2, we need to swap column 2,4,6,8 with 1,3,5,7 so the expected
% vectors taken by model belong to CC2 data

exp_vect_rows_needed=4*size(ifft_out,1); %Finding the number of rows from expected vector needed

if(cc==1)
    load(sprintf("%s/mixer_out.mat",DIR_EXP_VECT));
    mixer_out = complex(mixer_out(1:exp_vect_rows_needed,:));
    save("../mdl/duc/mixer_out.mat","mixer_out");
    %copyfile(sprintf("%s/mixer_out.mat",DIR_EXP_VECT),"../mdl/duc/");
end
if(cc==2)
    load(sprintf("%s/mixer_out.mat",DIR_EXP_VECT));
    mixer_out(:,[1 2]) = mixer_out(:,[2 1]);
    mixer_out(:,[3 4]) = mixer_out(:,[4 3]);
    mixer_out(:,[5 6]) = mixer_out(:,[6 5]);
    mixer_out(:,[7 8]) = mixer_out(:,[8 7]);
    mixer_out = mixer_out(1:exp_vect_rows_needed,:);
    save("../mdl/duc/mixer_out.mat","mixer_out");
end

disp('[duc_input formatter]: Executed')