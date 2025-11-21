%% For input of summer+interp model: Takes output of mixer 'Mixer_dOut' from workspace and saves it in correct format into mdl/summer_interp/ folder with name 'mixer_out' 
% 4 column output of DUC_CC1 will go to 1,3,5,7
% 4 column output of DUC_CC2 will go to 2,4,6,8

%Reading relative path of expected vector folder
readme_fileID = fopen('locate_testvector.txt');
readme_text = textscan(readme_fileID,'%s');
fclose(readme_fileID);
DIR_EXP_VECT = readme_text{1, 1}{1, 1} ;

load("dspba_vectors/duc/cc1/duc_out.mat")
temp(:,1)=Mixer_dOut(:,1);
temp(:,3)=Mixer_dOut(:,2);
temp(:,5)=Mixer_dOut(:,3);
temp(:,7)=Mixer_dOut(:,4);
load("dspba_vectors/duc/cc2/duc_out.mat")
temp(:,2)=Mixer_dOut(:,1);
temp(:,4)=Mixer_dOut(:,2);
temp(:,6)=Mixer_dOut(:,3);
temp(:,8)=Mixer_dOut(:,4);

mixer_out=temp;                              
save("../mdl/ca_interp/mixer_out.mat","mixer_out");

%% For settings of summer+interp model: Save settings file from MATLAB to mdl/summer_interp/
load(sprintf("%s/settings.mat",DIR_EXP_VECT));
ca_interp_tb_in = ca_interp_tb_in_l1;
save("../mdl/ca_interp/settings.mat","ca_interp_tb_in");

%% For output expected of summer+interp model: Save output expected 'interp_out' from MATLAB to the folder mdl/summer_interp/
% This output is only 4 columns wide as it is addition of columns of both the CCs 
% CC1+CC2 : [(1+2) (3+4) (5+6) (7+8)]

exp_vect_rows_needed=2*size(mixer_out,1); %Finding the number of rows from expected vector needed
load(sprintf("%s/interpolator_out.mat",DIR_EXP_VECT));
interp_out = interp_out(1:exp_vect_rows_needed,:);
save("../mdl/ca_interp/interpolator_out.mat","interp_out");
%copyfile(sprintf("%s/interpolator_out.mat",DIR_EXP_VECT),"../mdl/ca_interp/");

disp("[ca_interp_input_formatter] : Executed")