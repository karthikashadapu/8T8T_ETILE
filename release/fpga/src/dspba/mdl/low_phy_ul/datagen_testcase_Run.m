clc;

% diary UL_TestCaseLogFile_100623_autotestcase_3sym.txt
% diary on
addpath('../lib')
ManualRun = 1;
TestCaseId =0;
NMSE_ERR = zeros (1,25);
CH_ERR = zeros (1,25);
NPSE_ERR= zeros (1,25);






% while true
 clearvars -except TestCaseId ManualRun NMSE_ERR CH_ERR NPSE_ERR;
close all;
 %TLUT = [ 2.87272135416667e-06 3.85498046875000e-05 7.42268880208333e-05 0.000109903971354167 0.000145581054687500 0.000181258138020833 0.000216935221354167 0.000252612304687500 0.000288289388020833 0.000323966471354167 0.000359643554687500 0.000395320638020833 0.000430997721354167 0.000466674804687500 ];
lut = [ 2864.58333333333	38541.6666666667	74218.7500000000	109895.833333333	145572.916666667	181250.000000000	216927.083333333	252604.166666667	288281.250000000	323958.333333333	359635.416666667	395312.500000000	430989.583333333	466666.666666667] ;

  %TLUT= double(fi(lut,0,24,0));
  TLUT= double(fi(lut,0,64,32));
  Tsym_reinterpret_LUT = TLUT;
Num_Slots =1;
NumSym =3;
   Fs=122.88e6; 
   Tech_CP=1;
   F1=2.55;
   Tsym=0;
    %% Testcase Gen
if (ManualRun)
TestCaseId = input("Enter Test Case ID ?")

else 
    TestCaseId = TestCaseId + 1
end
hcshift=0;
switch TestCaseId


   case 3
        FixedDataFlag = 0;
        DC_SC_EN =1;
        NFFT = 4096;
        NPRB = 12*273;
        CPlen = [352];
        ifftshift=0;
        constgain = 1+0j;
        Muxsel=0;
        MuxConstData = 0;
         Num_Slots =1;
          NumSym = 2;
         ripple_comp_en=1;

       Tech_CP=1;
        F1 = 35.3; % GHz
        Tsym = 11010.0;


   case 4
        FixedDataFlag = 0;
        DC_SC_EN =1;
        NFFT = 4096;
        NPRB = 12*162;
        CPlen = [352];
        ifftshift=0;
        constgain = 1+0j;
        Muxsel=0;
        MuxConstData = 0;
         Num_Slots =1;
          NumSym = 6;
ripple_comp_en=1;

       Tech_CP=1;
        F1 = 35.3; % GHz
        Tsym = 11010.0;

    otherwise 
        disp('Invalid Case ID / Test completed')
        pause(5)
        return
end

%%  Data gen parameters

F1=double(fi(F1,0,32,24));

datapts = NPRB;
InterSymGap = (NFFT-NPRB)+288;
AxC=4;
initZeros = 0;


Simruntime = Num_Slots *NumSym * NFFT;





%%  Input DataGen 
k=1;
d_in=zeros(1,initZeros);
valid_in =zeros(1,initZeros);
CPLen_in =zeros(1,initZeros);
fftsize_in = zeros(1,initZeros);
dummyones_in = ones(1,initZeros);
ChNo_in=ones(1,initZeros);
initZeros = 100;
dout_brsc_v =[];
ifftout_v=[];
ifft_cp_v=[];
dout_v=zeros(1,initZeros);
chout_v=zeros(1,initZeros);
valid_out= zeros(1,initZeros);
ipvector_cap=[];
nprb_v=[];
const_gain_v=[];
hcshift_v=[];
ifftshift_v=[];
time_v=[];
ip_ch_cap=[];
pc_comp_v=[];
metadata_sym_valid=[];
phasor_v=[];
% % ripple compensation
% % rc_100MHz = 1:1e-4:1+(4095)*1e-4;
% % rc_60MHz = 1:1e-4:1+(4095)*1e-4;
% 
% rc_100MHz = ones(1,4096);
% rc_60MHz =  ones(1,4096);

   
        datapts1=3276;
        load("cust_mat_100_ul.mat");
        Coeff1_freq = fftshift(fft(transpose(ul_100M_311),4096));
        Coeff2_freq = fftshift(fft(transpose(ul_100M_311),4096));%ul_100M_193
        stpt = (4096-datapts1)/2+1 ;
        endpt = datapts1 + (4096-datapts1)/2 ;
        compensation = double(fi(abs(ones(1,datapts1+1)./Coeff2_freq(stpt:endpt+1)),0,16,15));
       filtvector_100 = [compensation((datapts1/2)+1:end) zeros(1,(4096-datapts1-1)) compensation(1:(datapts1/2))];
       filtvector_100_add0 = [compensation((datapts1/2)+1:end) zeros(1,(4096-datapts1)-1) compensation(1:(datapts1/2))];
        if (DC_SC_EN==1)
           filtvector_100_exp=filtvector_100;
        else
            filtvector_100_exp=filtvector_100_add0;
       end
       
        rc_100MHz = fftshift(bitrevorder(filtvector_100));


        datapts1=1944;
        load("cust_mat_60_ul.mat");
        Coeff1_freq = fftshift(fft(transpose(ul_60M_311),4096));
        Coeff2_freq = fftshift(fft(transpose(ul_60M_311),4096));%ul_60M_193
        stpt = (4096-datapts1)/2+1 ;
        endpt = datapts1 + (4096-datapts1)/2 ;
        compensation = double(abs(ones(1,datapts1+1)./Coeff2_freq(stpt:endpt+1)));
        filtvector_60 = [compensation((datapts1/2)+1:end) zeros(1,(4096-datapts1-1)) compensation(1:(datapts1/2))];
        filtvector_60_add0 = [compensation((datapts1/2)+1:end) zeros(1,(4096-datapts1)-1) compensation(1:(datapts1/2))];
      if (DC_SC_EN==1)
           filtvector_60_exp=filtvector_60;
        else
            filtvector_60_exp=filtvector_60_add0;
       end
        rc_60MHz= fftshift(bitrevorder(filtvector_60));

    
  

    if(NPRB==3276)
        rc_bw_sel = 0; %0 for 100MHz
       

    elseif(NPRB==1944)
        rc_bw_sel = 1; %1 for 60MHz
        

    end
  
 
   
  

blkmem(1:16,1:5000)= zeros(16,5000);
for i=1:Num_Slots
    for j=1:NumSym
        for p=1:AxC

            if (FixedDataFlag==0)
                ipvector =double(fi(-1+2*rand(1,datapts)+1j*(-1+2*rand(1,datapts)),1,16,14));
            else
               % ipvector =double(fi((1e-4*(1:datapts))+ 1j*0.5,1,16,14));
                ipvector =double(fi(([zeros(1,3273) 0.1 0.1 0.1])+ 1j*([zeros(1,3273) 0.1 0.1 0.1]),1,16,14));

            end

     

            ipvector=ipvector/ constgain;

            %ipvector = (0.1*(i-1)+0.01*(j-1)+1e-5*(1:datapts))+ 1j*0.5;
            %ipvector = double(fi((0.1*(i-1)+0.01*(j-1)+1e-4*(1:datapts))+ 1j*0.5,1,16,15));
            %ipvector = double(fi((1e-4*(1:datapts))+ 1j*0.5,1,16,15));
            ipvector_cap=[ipvector_cap ipvector*constgain];
            ip_ch_cap =[ ip_ch_cap  (j-1)*ones(1,datapts)];
            d_in = [d_in ipvector];
            valid_in = [valid_in ones(1,datapts)];
            CPLen_in = [CPLen_in CPlen*ones(1,datapts)];
            fftsize_in = [fftsize_in log2(NFFT)*ones(1,datapts)];
            dummyones_in=[dummyones_in ones(1,datapts)];
            ChNo_in =[ChNo_in (j-1)*ones(1,datapts)];
           metadata_sym_valid = [ metadata_sym_valid 1 zeros(1,datapts-1)];

            if (j==1)
                CPL=CPlen;
            elseif (NFFT==4096)
                     CPL = 288;
            else
                     CPL = ceil(CPlen*0.9);
            end


            InterSymGap = (NFFT-NPRB)+CPL;
            d_in = [d_in zeros(1,InterSymGap)];
            valid_in = [valid_in zeros(1,InterSymGap)];
            CPLen_in = [CPLen_in CPlen*ones(1,InterSymGap)];
            fftsize_in = [fftsize_in log2(NFFT)*ones(1,InterSymGap)];
            dummyones_in=[dummyones_in ones(1,InterSymGap)];
            ChNo_in =[ChNo_in (j-1)*ones(1,InterSymGap)];
            metadata_sym_valid = [ metadata_sym_valid  zeros(1,InterSymGap)];



            % Ph Compensation
%             phval = exp(-1j*2*pi*F1*1e9*((Tsym*1e-9)+CPL/Fs));
               % phval = exp (-1j*(2*pi*F1*TLUT(j))); 

            if (Tech_CP==1)
               % phval = exp(-1j*2*pi*F1*1e9*((Tsym*1e-9)+CPL/Fs));
                phval = exp (-1j*(2*pi*F1*TLUT(j))); 

            else
                phval=1;
            end% ripple compensation
% rc_100MHz = 1:1e-4:1+(4095)*1e-4;
% rc_60MHz = 1:1e-4:1+(4095)*1e-4;

% rc_100MHz = ones(1,4096);
% rc_60MHz =  ones(1,4096);

            PhCompout = ipvector* phval;
            pc_comp_v = [pc_comp_v PhCompout];
            phasor_v=[phasor_v phval*ones(1,datapts)];

            % BR&SC
            if(DC_SC_EN==1)
                zeropad_data = [zeros(1,(NFFT-datapts)/2) PhCompout zeros(1,(NFFT-datapts)/2) ];
            else
                zeropad_data = [zeros(1,(NFFT-datapts)/2) PhCompout(1:datapts/2) 0  PhCompout((datapts/2)+1:end) zeros(1,((NFFT-datapts)/2)-1) ];
 
            end

            zeropad_data = zeropad_data;
            if (ripple_comp_en==1)
                 if (rc_bw_sel==0)
                       % dout_brsc = fftshift((zeropad_data))./((filtvector_100));
                       t1 = fftshift(zeropad_data);
                       t2= filtvector_100_exp;
                        for k=1:length(t2)
                            if(t2(k)==0)
                                dout_brsc(k)=t1(k);
                            else
                                 dout_brsc(k)=t1(k)/t2(k);
                            end
                        end
                 else
                         t1 = fftshift(zeropad_data);
                       t2= filtvector_60_exp;
                        for k=1:length(t2)
                            if(t2(k)==0)
                                dout_brsc(k)=t1(k);
                            else
                                 dout_brsc(k)=t1(k)/t2(k);
                            end
                        end
                 end                   
             else
                        dout_brsc = fftshift((zeropad_data));

             end
            
dout_brsc=double(fi(dout_brsc,1,16,14));

            dout_brsc_cap = bitrevorder(fftshift((zeropad_data)));
            dout_brsc_v=[dout_brsc_v dout_brsc_cap*constgain]; 
            % iFFT 
             ifftout = ifft(dout_brsc)  ;
             ifftout_v =[ifftout_v ifftout];
            % CPinsertion




             ifft_cp = [ifftout(end-CPL+1:end) ifftout];
             ifft_cp_v=[ifft_cp_v ifft_cp ];
 % B2S storel
            blkmem(p,1:length(ifft_cp))= ifft_cp;
        

        end
     % B2S read    
        for l=1:length(ifft_cp)
                    for m=1:AxC
                        dout_v=[dout_v blkmem(m,l)];
                        chout_v =[chout_v m-1];
                        valid_out =[valid_out 1];
                    end
                end

    end
end
nprb_v=dummyones_in*NPRB;
const_gain_v=dummyones_in*constgain;
hcshift_v= dummyones_in*hcshift;
ifftshift_v=dummyones_in*ifftshift;
time_v=dummyones_in.*[1:length(dummyones_in)];

%% Test vector objects 
fft_tb_in_local.valid_out = valid_out;
fft_tb_in_local.chout_v = chout_v;
fft_tb_in_local.dout_v = dout_v;
fft_tb_in_local.fftsize_in = fftsize_in;
fft_tb_in_local.CPLen_in = CPLen_in;
fft_tb_in_local.nprb_v = nprb_v;

fft_tb_in_local.hcshift_v = hcshift_v;
fft_tb_in_local.const_gain_v = const_gain_v;
fft_tb_in_local.ifftshift_v = ifftshift_v;
fft_tb_in_local.Tsym = 1:length(valid_out);
fft_tb_in_local.DC_SC_EN = DC_SC_EN;
fft_tb_in_local.Tech_CP = Tech_CP;
fft_tb_in_local.F1 = F1;
fft_tb_in_local.ripple_comp_en = ripple_comp_en;
fft_tb_in_local.rc_bw_sel = rc_bw_sel;
fft_tb_in_local.rc_100MHz =((rc_100MHz));
fft_tb_in_local.rc_60MHz = ((rc_60MHz));
fft_tb_in_local.metadata_sym = 1:length(valid_out);
fft_tb_in_local.metadata_sym_valid = metadata_sym_valid;


fft_tb_exp_out_local.ipvector_cap=ipvector_cap;
fft_tb_exp_out_local.ip_ch_cap=ip_ch_cap;

save ('local_test_input_output.mat','fft_tb_in_local','fft_tb_exp_out_local')
disp('Local Test input output object generated and object saved ')





% save('test_case_file.mat','ipvector_cap','dout_v','d_in','valid_in','CPLen_in','fftsize_in','dummyones_in','dout_brsc_v','ifftout_v','ifft_cp_v','NPRB','ChNo_in','constgain','Muxsel','MuxConstData','ifftshift','DC_SC_EN','chout_v','hcshift','nprb_v','const_gain_v','hcshift_v','ifftshift_v','time_v','valid_out','ip_ch_cap','F1','pc_comp_v','phasor_v','Tech_CP','Tsym','Tsym_reinterpret_LUT');
% 
% eval(sprintf('save(''dspba_tv_ip_tc_%d.mat'');',TestCaseId));
% 
% disp('Test input generated')

%% 
% setup_streamtoblock_fft;
% disp('Setup done')
%% Open and run the IFFT+Block_to_Stream DSPBA model
% 
% open ('streamtoblock_fft.mdl');
% sim ('streamtoblock_fft.mdl');
% disp('model simulated')
% out=logsout
% eval(sprintf('save(''dspba_tv_op_tc_%d.mat'');',TestCaseId));
% %%
% Testanalysis
% disp('Analysis Done')
% end 
% diary off