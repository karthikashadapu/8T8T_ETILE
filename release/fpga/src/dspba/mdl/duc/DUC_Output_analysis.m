%% LOAD EXPECTED OUTPUT
% load('duc_out.mat');
load('mixer_out.mat');   
%% dspba mixer output
% MixerOutdspba1 = double(Mixer_dOut(:,1));
% MixerOutdspba2 = double(Mixer_dOut(:,2));
% MixerOutdspba3 = double(Mixer_dOut(:,3));
% MixerOutdspba4 = double(Mixer_dOut(:,4));
MixerOutdspba = double(Mixer_dOut);
%% matlab mixer output
%     mixerout_ref1 = double(mixer_out(:,AXC_SEL(1)));
%     mixerout_ref2 = double(mixer_out(:,AXC_SEL(2)));
%     mixerout_ref3 = double(mixer_out(:,AXC_SEL(3)));
%     mixerout_ref4 = double(mixer_out(:,AXC_SEL(4)));

    mixerout_ref(:,1) = double(mixer_out(:,AXC_SEL(1)));
    mixerout_ref(:,2) = double(mixer_out(:,AXC_SEL(2)));
    mixerout_ref(:,3) = double(mixer_out(:,AXC_SEL(3)));
    mixerout_ref(:,4) = double(mixer_out(:,AXC_SEL(4)));

    disp('mixerout');

%% nmse calculation

% disp('mixer Output AXC'); [NMSE(1),NPSE(1)] = NMSE_NPSE_calc(mixerout_ref1,MixerOutdspba1);
% disp('mixer Output AXC'); [NMSE(2),NPSE(2)] = NMSE_NPSE_calc(mixerout_ref2,MixerOutdspba2);
% disp('mixer Output AXC'); [NMSE(3),NPSE(3)] = NMSE_NPSE_calc(mixerout_ref3,MixerOutdspba3);
% disp('mixer Output AXC'); [NMSE(4),NPSE(4)] = NMSE_NPSE_calc(mixerout_ref4,MixerOutdspba4);
disp('mixer Output AXC'); [NMSE,NPSE] = NMSE_NPSE_calc(mixerout_ref,MixerOutdspba);
disp(['NMSE duc module in dB:']);
NMSE
disp(['NPSE duc module in dB:']);
NPSE

disp('duc Analysis done');

% save DUC_Data_Out;


