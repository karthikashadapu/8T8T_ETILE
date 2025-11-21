clc;
clear all;
%diary TestCaseLogFile_100623_14Sym_3Slots_Autotestcase.txt
%fix(clock)
%diary on


ManualRun =1;
TestCaseId =0 ;
% NMSE_ERR = zeros (1,35);
% Ch_out_ERR = zeros(1,35);
% NPSE_ERR = zeros (1,35);
%while true
clearvars -except TestCaseId ManualRun NMSE_ERR Ch_out_ERR NPSE_ERR ;
close all;
addpath('../lib')
  %lut= [ 2.87272135416667e-06 3.85498046875000e-05 7.42268880208333e-05 0.000109903971354167 0.000145581054687500 0.000181258138020833 0.000216935221354167 0.000252612304687500 0.000288289388020833 0.000323966471354167 0.000359643554687500 0.000395320638020833 0.000430997721354167 0.000466674804687500 ]*1e9;
 lut = [ 2864.58333333333	38541.6666666667	74218.7500000000	109895.833333333	145572.916666667	181250.000000000	216927.083333333	252604.166666667	288281.250000000	323958.333333333	359635.416666667	395312.500000000	430989.583333333	466666.666666667] ;

  %TLUT= double(fi(lut,0,48,24));
  TLUT= double(fi(lut,0,64,32));
  Tsym_reinterpret_LUT = TLUT;
Tech_CP=1;
Tsym=0.5;
TCP=1;
F1=1.5;
Num_Slots = 3;
NumSym = 14;
Fs = 122.88e6;

AxC=4;
initZeros = 100;


Digital_power_real = 1-2^-14;
Digital_power_imag = 0;
%% Testcase Gen


if (ManualRun)
TestCaseId = input("Enter Test Case ID ?")

else 
TestCaseId = TestCaseId + 1
end

switch TestCaseId

    
   case 3
        FixedDataFlag = 0;
        DC_SC_EN =0;
        NFFT = 4096;
        NPRB = 12*273;
        CPlen = [352];
        ifftshift=12;
        constgain = 1+0j;
        Muxsel=0;
        MuxConstData = 0;
        Num_Slots = 1;
        NumSym =2;
        ripple_comp_en=1;

        Tech_CP=1;
        F1 = 6.316; % GHz
        Tsym = 2095.0;
  
case 4
        FixedDataFlag = 0;
        DC_SC_EN =1;
        NFFT = 4096;
        NPRB = 12*162;
        CPlen = [352];
        ifftshift=12;
        constgain = 1+0j;
        Muxsel=0;
        MuxConstData = 0;
        Num_Slots = 1;
        NumSym =2;
       ripple_comp_en=1;

        Tech_CP=1;
        F1 = 6.316; % GHz
        Tsym = 2095.0;


    otherwise 
        disp('Invalid Case ID / Test completed')
        pause(5)
        return
end

%%  Data gen parameters



datapts = NPRB;




%%  Input DataGen 
k=1;
d_in=zeros(1,initZeros);
valid_in =zeros(1,initZeros);
CPLen_in =zeros(1,initZeros);
fftsize_in = zeros(1,initZeros);
dummyones_in = ones(1,initZeros);
ChNo_in=ones(1,initZeros);

dout_brsc_v =[];
ifftout_v=[];
ifft_cp_v=[];
dout_v=[];
AxC_out_v =[];
ipvector_cap=[];
pc_comp_v=[];
phasor_v=[];
blkmem(1:16,1:5000)= zeros(16,5000);
F1 = double(fi(F1,0,32,24));



% ripple compensation
% rc_100MHz = 1:1e-4:1+(4095)*1e-4;
% rc_60MHz = 1:1e-4:1+(4095)*1e-4;


% 
% rc_100MHz = ones(1,4096);
% rc_60MHz =  ones(1,4096);


 
        datapts1=3276;
        load("cust_mat_100_dl.mat");
        Coeff1_freq = fftshift(fft(transpose(dl_100M_311),4096));
        Coeff2_freq = fftshift(fft(transpose(dl_100M_129),4096));
         stpt = (4096-datapts1)/2+1 ;
        endpt = datapts1 + (4096-datapts1)/2 ;
        compensation = double(abs(ones(1,datapts1+1)./Coeff2_freq(stpt:endpt+1)));
        filtvector_100 = [zeros(1,(4096-datapts1)/2) compensation zeros(1,((4096-datapts1)/2)-1)];
        filtvector_100_add0 = [zeros(1,(4096-datapts1)/2) compensation zeros(1,((4096-datapts1)/2)-1)];
        if (DC_SC_EN==1)
           filtvector_100_exp=filtvector_100;
        else
            filtvector_100_exp=filtvector_100_add0;
        end
        save('temp.mat','ifftshift'); clear ifftshift;
       rc_100MHz = ifftshift(filtvector_100);
        load('temp.mat','ifftshift'); 
        datapts1=1944;
        load("cust_mat_60_dl.mat");
        Coeff1_freq = fftshift(fft(transpose(dl_60M_311),4096));
        Coeff2_freq = fftshift(fft(transpose(dl_60M_129),4096));
        stpt = (4096-datapts1)/2+1 ;
        endpt = datapts1 + (4096-datapts1)/2 ;
        compensation = double(abs(ones(1,datapts1+1)./Coeff2_freq(stpt:endpt+1)));
        filtvector_60 = [zeros(1,(4096-datapts1)/2) compensation zeros(1,((4096-datapts1)/2)-1)];
        filtvector_60_add0 = [zeros(1,(4096-datapts1)/2) compensation zeros(1,((4096-datapts1)/2)-1)];
        if (DC_SC_EN==1)
           filtvector_60_exp=filtvector_60;
        else
            filtvector_60_exp=filtvector_60_add0;
        end
          save('temp.mat','ifftshift'); clear ifftshift;
         rc_60MHz = ifftshift((filtvector_60));
          load('temp.mat','ifftshift'); 
 
  if(NPRB==3276)
        rc_bw_sel = 0; %0 for 100MHz
       

    elseif(NPRB==1944)
        rc_bw_sel = 1; %1 for 60MHz
        

    end



for i=1:Num_Slots
    for j=1:NumSym
        for p=1:AxC
            if (FixedDataFlag==0)
                ipvector = double(fi(-0.95+1.9*rand(1,datapts)+1j*(-0.95+1.9*rand(1,datapts)),1,16,15));
            else
                ipvector = double(fi((1e-4*(1:datapts))+ 1j*0.5,1,16,15));
            end


            %ipvector = (0.1*(i-1)+0.01*(j-1)+1e-5*(1:datapts))+ 1j*0.5;
            %ipvector = double(fi((0.1*(i-1)+0.01*(j-1)+1e-4*(1:datapts))+ 1j*0.5,1,16,15));
            %ipvector = double(fi((1e-4*(1:datapts))+ 1j*0.5,1,16,15));
            ipvector_cap=[ipvector_cap ipvector];
            d_in = [d_in ipvector];
            valid_in = [valid_in ones(1,datapts)];
            CPLen_in = [CPLen_in CPlen*ones(1,datapts)];
            fftsize_in = [fftsize_in log2(NFFT)*ones(1,datapts)];
            dummyones_in=[dummyones_in ones(1,datapts)];
            ChNo_in =[ChNo_in (j-1)*ones(1,datapts)];

            if (j==1)
                CPL=CPlen;
            elseif (NFFT==4096)
                     CPL = 288;
            else
                     CPL = ceil(CPlen*0.9);
            end
%             %del phase evoution
%             CPL = 288;
%             Tsym=Tsym+1.56
%                F1=0.001;
%             phip=-1j*2*pi*F1*1e9*((Tsym*1e-9)+CPL/Fs)
%             phval = angle(exp(-1j*2*pi*F1*1e9*((Tsym*1e-9)+CPL/Fs)))
%               pause(5)  
% 
%             %del

            InterSymGap = (NFFT-NPRB)+CPL;

            d_in = [d_in zeros(1,InterSymGap)];
            valid_in = [valid_in zeros(1,InterSymGap)];
            CPLen_in = [CPLen_in CPlen*ones(1,InterSymGap)];
            fftsize_in = [fftsize_in log2(NFFT)*ones(1,InterSymGap)];
            dummyones_in=[dummyones_in ones(1,InterSymGap)];
            ChNo_in =[ChNo_in (j-1)*ones(1,InterSymGap)];
            

            % Ph Compensation
            
            if (Tech_CP==1)
               % phval = exp(-1j*2*pi*F1*1e9*((Tsym*1e-9)+CPL/Fs));
                phval = exp (-1j*(2*pi*F1*TLUT(j))); 

            else
                phval=1;
            end
    
            PhCompout = ipvector* phval;
            pc_comp_v = [pc_comp_v PhCompout];
            phasor_v=[phasor_v phval*ones(1,datapts)];
            % BR&SC
            if(DC_SC_EN==1)
                zeropad_data = [zeros(1,(NFFT-datapts)/2) PhCompout zeros(1,(NFFT-datapts)/2) ];
            else
                zeropad_data = [zeros(1,(NFFT-datapts)/2) PhCompout(1:datapts/2) 0  PhCompout((datapts/2)+1:end) zeros(1,((NFFT-datapts)/2)-1) ];
 
            end
            %test data remove
          %  rc_100MHz = real(zeropad_data);
          if (ripple_comp_en==1)
                      if(rc_bw_sel==0)
                    dout_brsc = fftshift((zeropad_data)).*fftshift((filtvector_100_exp));
                      else
                      dout_brsc = fftshift((zeropad_data)).*fftshift((filtvector_60_exp));
                      end
          else
              dout_brsc = fftshift((zeropad_data));

          end
                      %  dout_brsc = fftshift((zeropad_data));

            dout_brsc_cap = bitrevorder(fftshift((zeropad_data)));
            dout_brsc_v=[dout_brsc_v dout_brsc_cap]; 
            % iFFT 
             ifftout =( ifft(dout_brsc) / (2^(ifftshift-log2(NFFT)))) *constgain ;
             ifftout_v =[ifftout_v ifftout];
            % CPinsertion

             ifft_cp = [ifftout(end-CPL+1:end) ifftout];
             ifft_cp_v=[ifft_cp_v ifft_cp ];
 % B2S store
            blkmem(p,1:length(ifft_cp))= ifft_cp;
        

        end
     % B2S read    
        for l=1:length(ifft_cp)
                    for m=1:AxC
                        dout_v=[dout_v blkmem(m,l)];
                        AxC_out_v =[AxC_out_v m-1];
                    end
                end

    end
end
%save('test_case_file.mat','ipvector_cap','dout_v','d_in','valid_in','CPLen_in','fftsize_in','dummyones_in','dout_brsc_v','ifftout_v','ifft_cp_v','NPRB','ChNo_in','constgain','Muxsel','MuxConstData','ifftshift','DC_SC_EN','AxC_out_v','Tech_CP','Tsym','TCP','F1','pc_comp_v','phasor_v','Tsym_reinterpret_LUT','Digital_power_real','Digital_power_imag');

%% input output data save to object , files
ifft_tb_in_local.d_in = d_in;
ifft_tb_in_local.valid_in = valid_in;
ifft_tb_in_local.ChNo_in = ChNo_in;
ifft_tb_in_local.CPLen_in = CPLen_in;
ifft_tb_in_local.fftsize_in = fftsize_in;
ifft_tb_in_local.NPRB = NPRB*dummyones_in;
ifft_tb_in_local.constgain = constgain *dummyones_in;
ifft_tb_in_local.Muxsel =   Muxsel*dummyones_in;
ifft_tb_in_local.MuxConstData =  MuxConstData *dummyones_in;
ifft_tb_in_local.ifftshift = ifftshift  *dummyones_in;
ifft_tb_in_local.DC_SC_EN =  DC_SC_EN *dummyones_in;
ifft_tb_in_local.Tech_CP =  Tech_CP *dummyones_in;
ifft_tb_in_local.Tsym = Tsym  *dummyones_in .*(1:length(dummyones_in));
ifft_tb_in_local.TCP =   TCP*dummyones_in;
ifft_tb_in_local.Digital_power_real = Digital_power_real  *dummyones_in;
ifft_tb_in_local.Digital_power_imag =  Digital_power_imag *dummyones_in;
ifft_tb_in_local.dummyones_in=dummyones_in;
ifft_tb_in_local.F1 = F1;
ifft_tb_in_local.ripple_comp_en = ripple_comp_en;
ifft_tb_in_local.rc_bw_sel = rc_bw_sel;
ifft_tb_in_local.rc_100MHz =((rc_100MHz));
ifft_tb_in_local.rc_60MHz = ((rc_60MHz));
%expected out object
ifft_tb_exp_out_local.dout_v=dout_v;
ifft_tb_exp_out_local.AxC_out_v=AxC_out_v;
save ('local_test_input_output.mat','ifft_tb_in_local','ifft_tb_exp_out_local')
disp('Local Test input output object generated and object saved ')
%eval(sprintf('save(''dspba_tv_ip_tc_%d.mat'');',TestCaseId));
%% 
%%setup_ifft_blocktostream;
%%disp('Setup done')
%% Open and run the IFFT+Block_to_Stream DSPBA model
% open ('G1.slx');
% sim ('G1.slx');
%open ('ifft_blocktostream.slx');
%sim ('ifft_blocktostream.slx');

%disp('model simulated')
%out=ans
%eval(sprintf('save(''dspba_tv_op_tc_%d.mat'');',TestCaseId));
%%
%TestAnalysis
%disp('Analysis Done')


%end % end while

%diary off