%% Take data from decimator_out_dspba1 of dec_dly_comp despba module (4 columns) 
% and convert to input of ddc module, i.e. decimator_out. Store the result to ddc module's folder 
% from where it will be consumed in model. decimator_out_dspba1 is 4 columns
% wide. Same data is given to CC1 and CC2 both where its is differently processed
% further.

%Reading relative path of expected vector folder
readme_fileID = fopen('locate_testvector.txt');
readme_text = textscan(readme_fileID,'%s');
fclose(readme_fileID);
DIR_EXP_VECT = readme_text{1, 1}{1, 1} ;

load("dspba_vectors/dec_dly_comp/dec_dly_comp_out.mat");
decimator_out = decimator_out_dspba1;
save("../mdl/ddc/decimator_out.mat","decimator_out");

%% Copying settings file
% ddc_nco value taken by model is from 1,3,5,7 columns, 
% so converting to that format

load(sprintf("%s/settings.mat",DIR_EXP_VECT));
if(cc==1)
   ddc_tb_in = ddc_tb_in_l1; 
   ddc_tb_in.nco_freq_val = [ddc_tb_in.ddc_nco(1) 0 ddc_tb_in.ddc_nco(2) 0 ddc_tb_in.ddc_nco(3) 0 ddc_tb_in.ddc_nco(4) 0]*1e6;
end
if(cc==2)
   ddc_tb_in = ddc_tb_in_l2;
   ddc_tb_in.nco_freq_val = [ddc_tb_in.ddc_nco(1) 0 ddc_tb_in.ddc_nco(2) 0 ddc_tb_in.ddc_nco(3) 0 ddc_tb_in.ddc_nco(4) 0]*1e6;
end
save("../mdl/ddc/settings.mat","ddc_tb_in");

%% Copying expected vector from MATLAB to the DDC folder
% Expected vector are taken from column 1,3,5,7 in model. It's fine for CC1.
% For CC2, we need to swap column 2,4,6,8 with 1,3,5,7 so the expected
% vectors taken by model belong to CC2 data

exp_vect_rows_needed=1*size(decimator_out,1); %Finding the number of rows from expected vector needed

if(cc==1)
    load(sprintf("%s/ddc_out.mat",DIR_EXP_VECT));
    ddc_out = ddc_out(1:exp_vect_rows_needed,:);
    save("../mdl/ddc/ddc_out.mat","ddc_out");
    %copyfile(sprintf("%s/ddc_out.mat",DIR_EXP_VECT),"../mdl/ddc/");
end
if(cc==2)
    load(sprintf("%s/ddc_out.mat",DIR_EXP_VECT));
    ddc_out(:,[1 2]) = ddc_out(:,[2 1]);
    ddc_out(:,[3 4]) = ddc_out(:,[4 3]);
    ddc_out(:,[5 6]) = ddc_out(:,[6 5]);
    ddc_out(:,[7 8]) = ddc_out(:,[8 7]);
    ddc_out = ddc_out(1:exp_vect_rows_needed,:);
    save("../mdl/ddc/ddc_out.mat","ddc_out");
end

disp('[ddc_input_formatter]: Executed')
