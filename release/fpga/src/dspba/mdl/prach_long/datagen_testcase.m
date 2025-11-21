clc;
% diary Prach_log.txt
% diary on

addpath('lib')
ManualRun = 1;
TestCaseId =1;
NMSE_ERR = zeros (1,25);
CH_ERR = zeros (1,25);

resultv = zeros (20,35);





% while true
 clearvars -except TestCaseId ManualRun NMSE_ERR CH_ERR resultv;
close all;
    %% Testcase Gen
        %%%%%%%%%%%%% default parameters%%%%%%%%%%%%%%%%%%%
prach.SampleRateMSPS=122.88;
prach.Format = 0;          % PRACH format: TS36.104, Table 8.4.2.1-1
prach.ConfigIndex = 27;    % For Format0, the config index is between 0 ... 27 
prach.SeqIdx = 53;          % Logical sequence index: TS36.141, Table A.6-1
prach.CyclicShiftIdx = 1;  % ZCZ  % Cyclic shift index: TS36.141, Table A.6-1
prach.HighSpeed = 0;       % Normal mode: TS36.104, Table 8.4.2.1-1

prach.FreqOffset = 0;     % Default frequency location
prach.PreambleIdx = 23;     % Preamble index: TS36.141, Table A.6-1
prach.rxSNR = 100;         % Applying AWGN on receive PRACH
prach.SampleRate = prach.SampleRateMSPS;
prach.MaxSampleRate = 122.88 ;%30.72; %TBD
bitscale = 1;

offset = 0;
prach.StartSym=1;


ue.NULRB = 273;                % 6 RBs are allocated for PRACH output of ue.NULRB
ue.DuplexMode = 'TDD';         % Frequency Division Duplexing (FDD)
ue.CyclicPrefixUL = 'Normal';  % Normal cyclic prefix length
NTxAnts = 4;                   % Number of transmission antennas 4 
ZeroPadFront =1;
ZeroPadRear=24;
c_m_plane_sel=1;
    %%%%%%%%%%%%% default parameters%%%%%%%%%%%%%%%%%%%

% 
if (ManualRun)
TestCaseId = input("Enter Test Case ID ?")
else 
    TestCaseId = TestCaseId + 1
end

switch TestCaseId

    case 1
prach.SeqIdx =53;
prach.FreqOffset=0;
prach.PreambleIdx=23;
prach.CyclicShiftIdx = 1;
snr = -25;
timedelay0 = 0;
timedelay1 = 0;
timedelay2 = 0;
timedelay3 = 0;
prach.ConfigIndex = 27;    % For Format0, the config index is between 0 ... 27 
prach.StartSym=1;
c_m_plane_sel=0;
Timeoffset_input=3168;
    case 2
prach.SeqIdx =53;
prach.FreqOffset=270;
prach.PreambleIdx=23;
prach.CyclicShiftIdx = 1;
snr = 100;
timedelay0 = 0;
timedelay1 = 0;
timedelay2 = 0;
timedelay3 = 0;
prach.ConfigIndex = 16;    % For Format0, the config index is between 0 ... 27 
prach.StartSym=8;
c_m_plane_sel=0;
Timeoffset_input=18528;
       
    otherwise 
        disp('Invalid Case ID / Test completed')
        pause(5)
        return
end

%%  Data gen parameters  
% 
[prach_data, ZC_DFT_839] = prach_gen_5g_toolbox(prach.SeqIdx,prach.FreqOffset,offset,bitscale,prach.PreambleIdx,prach.CyclicShiftIdx, ue,prach.ConfigIndex);
%%% Recieve Noisy PRACH signal
%rxPrachSeq = Apply_AWGN(transpose(prach_data), prach.rxSNR);
S = RandStream('mt19937ar',Seed=5489);
reset(S);
rxPrachSeq =awgn((prach_data),snr,'measured',S);
rxPrachSeq = rxPrachSeq / max(max(real(rxPrachSeq)),max(imag(rxPrachSeq))); % Normalization
x_in_ch0 = transpose(rxPrachSeq);
x_in_ch0 = circshift(x_in_ch0,timedelay0);
%% Input vector generation.







%% Model configuration
figure;
plot(real(x_in_ch0))

%% New tb inputs
Prach_tb_data =transpose( repelem(x_in_ch0,NTxAnts));
Prach_tb_ch=transpose(mod((0:length(Prach_tb_data)-1),NTxAnts));
Prach_tb_valid = transpose(ones (1,length(Prach_tb_data)));

                 % Number of transmission antennas 4 




%% Symbol mapping



%%


%prach.x_in = x_in;   % If TDM multiplexed signal is used at the input

% prach.x_in = x_in_ch0;
% prach.TDfolding = prach.ClockRate / prach.SampleRateMSPS;
% 
% prach.SampleTime = 1;
% prach.no_of_chan = NTxAnts * 2; % 4 (Antennas) x 2 (I/Q)




%% Decimator Configuration
%prach.decimat = 12;
%regInWave_SEL.res = 8;
% prach_mux_sel_0=1; % 1st HB
% prach_mux_sel_1=0; % 2nd HB
% prach_mux_sel_2=0; % 3rd HB
% prach_mux_sel_3=0; % 1st dec_by_3 
% prach_mux_sel_4=1; % 2nd dec_by_3

%load('hbcoefficient.mat'); 




% % round(prach.Nfft/2-prach.Nprachseq/2)=1;
% % round(prach.Nfft/2+prach.Nprachseq/2)=2049;
% % 


%% Data widths
% prach.InputWidth = 16;
% a= fixdt(1,16,15);
% prach.InputType   = a;% fixdt(1,16,15);

%% Simulation
prach.symPeriod = 122880;%length(rxPrachSeq);


%% Test input output objects

%%
lprach_tb_in_local.Prach_tb_data = Prach_tb_data;
lprach_tb_in_local.Prach_tb_ch = Prach_tb_ch;
lprach_tb_in_local.Prach_tb_valid = Prach_tb_valid;
lprach_tb_in_local.SFN = 1346;
lprach_tb_in_local.subframe = 1;
lprach_tb_in_local.prach.ConfigIndex = prach.ConfigIndex;
lprach_tb_in_local.cp_len = 0;
lprach_tb_in_local.Timeoffset_input= Timeoffset_input;
lprach_tb_in_local.c_m_plane_sel = c_m_plane_sel;
lprach_tb_in_local.prach_tech = 1;
lprach_tb_in_local.gain = 1;
%lprach_tb_in_local.filt_flush_enable= filt_flush_enable;
lprach_tb_in_local.prach.StartSym = prach.StartSym;
lprach_tb_in_local.prach.FreqOffset=prach.FreqOffset;
lprach_tb_exp_out_local.Prach_tb_data=Prach_tb_data;
lprach_tb_exp_out_local.Prach_tb_valid=Prach_tb_valid;
lprach_tb_exp_out_local.prach.ConfigIndex=prach.ConfigIndex;
% lprach_tb_exp_out_local.prach.symStart=prach.symStart;
% lprach_tb_exp_out_local.prach.symEnd=prach.symEnd;
% lprach_tb_exp_out_local.prach.SampleRateMSPS=prach.SampleRateMSPS;
% lprach_tb_exp_out_local.prach.NCO=prach.NCO;
% lprach_tb_exp_out_local.Prach_tb_data=Prach_tb_data;
lprach_tb_exp_out_local.prach.SeqIdx=prach.SeqIdx;



save ('local_test_input_output.mat','lprach_tb_in_local','lprach_tb_exp_out_local')
disp('Local Test input output object generated and object saved ')

% save('test_case_file.mat','ipvector_cap','dout_v','d_in','valid_in','CPLen_in','fftsize_in','dummyones_in','dout_brsc_v','ifftout_v','ifft_cp_v','NPRB','ChNo_in','constgain','Muxsel','MuxConstData','ifftshift','DC_SC_EN','chout_v','hcshift','nprb_v','const_gain_v','hcshift_v','ifftshift_v','time_v','valid_out','ip_ch_cap','F1','pc_comp_v','phasor_v','Tech_CP','Tsym');

% eval(sprintf('save(''dspba_tv_ipop_tc_%d.mat'');',TestCaseId));
% save('dspba_tv_simip.mat');
% 
% disp('Test input generated')

%% 
% setup_LongPRACH;
% disp('Setup done')
%% Open and run the IFFT+Block_to_Stream DSPBA model

% open ('LongPRACH_sim.mdl');
% sim ('LongPRACH_sim.mdl');
% disp('model simulated')
% out=logsout
% eval(sprintf('save(''dspba_tv_simop_tc_%d.mat'');',TestCaseId));
% save('dspba_tv_simop.mat');
% %%
% prach_analysis
% disp('Analysis Done')
% % end 
% diary off