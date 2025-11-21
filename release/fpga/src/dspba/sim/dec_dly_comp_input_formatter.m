% Take data from PolyPhase0_dOut and convert to input of
% decimator-delay-compensation module. Store the result to module's folder 
% from where it will be consumed in model. PolyPhase0_dOut is 8 columns
% wide, interp_out is 4 columns wide.

%Reading relative path of expected vector folder
readme_fileID = fopen('locate_testvector.txt');
readme_text = textscan(readme_fileID,'%s');
fclose(readme_fileID);
DIR_EXP_VECT = readme_text{1, 1}{1, 1} ;

load("dspba_vectors/ca_interp/ca_interp_out.mat");

temp1=zeros(1,2*length(PolyPhase0_dOut));
temp2=zeros(1,2*length(PolyPhase0_dOut));
temp3=zeros(1,2*length(PolyPhase0_dOut));
temp4=zeros(1,2*length(PolyPhase0_dOut));

temp1(1:2:end)=PolyPhase0_dOut(:,1);
temp1(2:2:end)=PolyPhase0_dOut(:,2);
temp2(1:2:end)=PolyPhase0_dOut(:,3);
temp2(2:2:end)=PolyPhase0_dOut(:,4);
temp3(1:2:end)=PolyPhase0_dOut(:,5);
temp3(2:2:end)=PolyPhase0_dOut(:,6);
temp4(1:2:end)=PolyPhase0_dOut(:,7);
temp4(2:2:end)=PolyPhase0_dOut(:,8);

interp_out = [temp1.' temp2.' temp3.' temp4.'];
save("../mdl/dec_dly_comp/interpolator_out.mat","interp_out");

% Copying settings file
load(sprintf("%s/settings.mat",DIR_EXP_VECT));
dec_dly_comp_tb_in = dec_dly_comp_tb_in_l1;
save("../mdl/dec_dly_comp/settings.mat","dec_dly_comp_tb_in");

% Also add the expected vector from MATLAB to that folder of DUC

exp_vect_rows_needed=0.5*size(interp_out,1); %Finding the number of rows needed from expected vector 
load(sprintf("%s/decimator_out.mat",DIR_EXP_VECT));
decimator_out = decimator_out(1:exp_vect_rows_needed,:);
save("../mdl/dec_dly_comp/decimator_out.mat","");
%copyfile(sprintf("%s/decimator_out.mat",DIR_EXP_VECT),"../mdl/dec_dly_comp/");

disp("[dec_dly_comp_input_formatter] : Executed")
