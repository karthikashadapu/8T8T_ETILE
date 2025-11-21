% This script runs before running the iFFT model. It produces an input object which is taken automatically as input by the iFFT
% This object is saved in a mat file. Side signals are taken from settings1.mat and IQ signal from tmgrid.
% The script also creates output expected signals using tmwave.mat and settings and stores in another object under same mat file as for inputs
% Needs: NumSym from workspace

%Reading relative path of expected vector folder
readme_fileID = fopen('locate_testvector.txt');
readme_text = textscan(readme_fileID,'%s');
fclose(readme_fileID);
DIR_EXP_VECT = readme_text{1, 1}{1, 1} ;

% Load the settings, input and expected output for iFFT CC1.
if(cc==1)
load(sprintf("%s/settings.mat",DIR_EXP_VECT),"ifft_tb_in_l1");
ifft_tb_in = ifft_tb_in_l1;
load(sprintf("%s/ifft_in.mat",DIR_EXP_VECT));
load(sprintf("%s/ifft_out.mat",DIR_EXP_VECT));
end
% Load the settings, input and expected output for iFFT CC2. 
if(cc==2)
load(sprintf("%s/settings.mat",DIR_EXP_VECT),"ifft_tb_in_l2");
ifft_tb_in = ifft_tb_in_l2;
load(sprintf("%s/ifft_in.mat",DIR_EXP_VECT));
load(sprintf("%s/ifft_out.mat",DIR_EXP_VECT));
end

%Assigning settings to variables for easy acces with variable name
rc_en                = ifft_tb_in.rc_en;
CPlen     			   = ifft_tb_in.CPLen_in;
fftsize_in 			   = ifft_tb_in.fftsize_in;
NPRB 				      = ifft_tb_in.NPRB;
constgain 			   = ifft_tb_in.constgain/(2*8192);
Muxsel 				   = ifft_tb_in.Muxsel;
MuxConstData	 	   = ifft_tb_in.MuxConstData;
ifftshift_			   = ifft_tb_in.ifftshift;
DC_SC_EN 		   	= ifft_tb_in.DC_SC_EN;
Tech_CP 			      = ifft_tb_in.Tech_CP;
Tsym 				      = ifft_tb_in.Tsym;
TCP 				      = ifft_tb_in.TCP;
Digital_power_real 	= ifft_tb_in.Digital_power_real;
Digital_power_imag 	= ifft_tb_in.Digital_power_imag;
F1 					   = ifft_tb_in.F1;

NumSym = NumSym;
NFFT   = fftsize_in;
%Adding ripple compensation signals, provide compensation coefficients to iFFT

if(ifft_tb_in.rc_en==0) %For ripple compensation disable case
    ifft_tb_in_local.ripple_comp_en = 0;
end

if(ifft_tb_in.rc_en==1) %For ripple compensation enable case, 
    ifft_tb_in_local.ripple_comp_en = 1;
end

    if(ifft_tb_in.bw_sel==100e6)
        ifft_tb_in_local.rc_bw_sel = 0; %0 for 100MHz
    elseif(ifft_tb_in.bw_sel==60e6)
        ifft_tb_in_local.rc_bw_sel = 1; %1 for 60MHz
    end

    if(cc==1)
        load(sprintf("%s/settings.mat",DIR_EXP_VECT),"duc_tb_in_l1");
        duc_tb_in = duc_tb_in_l1; %Setting used for getting filter coefficient for cc1
    end 
    if(cc==2)
        load(sprintf("%s/settings.mat",DIR_EXP_VECT),"duc_tb_in_l2");
        duc_tb_in = duc_tb_in_l2; %Setting used for getting filter coefficient for cc2
    end

    datapts=3276; %Filling LUT with compensation vector corresponding to 100MHz case
    Coeff2_freq = fftshift(fft(transpose(duc_tb_in.Coef100),4096));
    stpt = (4096-datapts)/2+1 ;
    endpt = datapts + (4096-datapts)/2 ;
    compensation = double(abs(ones(1,datapts+1)./Coeff2_freq(stpt:endpt+1)));
    filtvector = [zeros(1,(4096-datapts)/2) compensation zeros(1,((4096-datapts)/2)-1)];
    ifft_tb_in_local.rc_100MHz = ifftshift(filtvector);


    datapts=1944; %Filling LUT with compensation vector corresponding to 60MHz case
    Coeff2_freq = fftshift(fft(transpose(duc_tb_in.Coef60),4096));
    stpt = (4096-datapts)/2+1 ;
    endpt = datapts + (4096-datapts)/2 ;
    compensation = double(abs(ones(1,datapts+1)./Coeff2_freq(stpt:endpt+1)));
    filtvector = [zeros(1,(4096-datapts)/2) compensation zeros(1,((4096-datapts)/2)-1)];
    ifft_tb_in_local.rc_60MHz = ifftshift(filtvector); 


%% FDV functionality + Input IQ data for CC1 - AxCs index 1,3,5,7 (In ORAN, indexing- 0,2,4,6) 
    AxC         = 4;
    initZeros   = 100;
    d_in        = zeros(1,initZeros);
    sym_cnt     = 1;                                                           %represents sym number for all AxCs
    column      = cc; %would be equal to 1 for CC1 or 2 for CC2
    
    for i = 1:NumSym 
        for j = 1:AxC                   %each symbol will be repeated for 4 axcs
            total_axc_sym_count = (i-1)*4 + j;
            total_sym_num_in_slot = (mod(total_axc_sym_count-1,56)+1); 
            sym_num_in_slot = double(idivide(int32(total_sym_num_in_slot-1),int32(4))) + 1;
            
            if (sym_num_in_slot==1)
                        CPL = 352; 
            else
                        CPL = 288;
            end
        
            InterSymGap = (NFFT-NPRB) + CPL;
            
            tempdata = ifft_in(NPRB*(sym_cnt-1)+1 : NPRB*(sym_cnt), column);    
            
           % x=sprintf("column taken= %d",column);
           % disp(x);

            d_in = [d_in tempdata.'];
            d_in = [d_in zeros(1,InterSymGap)];
            
            column=column+2;
            
            if((column==9 && cc==1) || (column==10 && cc==2))
                  column = cc; %becomes 1 for cc1, 2 for cc2
                  sym_cnt = sym_cnt+1;
            end
        end
    end

    ifft_tb_in_local.d_in = d_in;

%% Side signals 
    %Initial 100 samples are not under valid
    ifft_tb_in_local.valid_in           =  zeros(1,initZeros);      
    ifft_tb_in_local.ChNo_in            =  ones(1,initZeros);
    ifft_tb_in_local.CPLen_in           =  zeros(1,initZeros);
    ifft_tb_in_local.fftsize_in         =  zeros(1,initZeros);
    ifft_tb_in_local.NPRB               =  NPRB*ones(1,initZeros);
    ifft_tb_in_local.constgain          =  constgain*ones(1,initZeros);
    ifft_tb_in_local.Muxsel             =  Muxsel*ones(1,initZeros);
    ifft_tb_in_local.MuxConstData       =  MuxConstData*ones(1,initZeros);
    ifft_tb_in_local.ifftshift          =  ifftshift_*ones(1,initZeros);
    ifft_tb_in_local.DC_SC_EN           =  DC_SC_EN*ones(1,initZeros);
    ifft_tb_in_local.Tech_CP            =  Tech_CP*ones(1,initZeros);
    ifft_tb_in_local.Tsym               =  Tsym*ones(1,initZeros);
    ifft_tb_in_local.TCP                =  TCP*ones(1,initZeros);
    ifft_tb_in_local.Digital_power_real =  Digital_power_real*ones(1,initZeros);
    ifft_tb_in_local.Digital_power_imag =  Digital_power_imag*ones(1,initZeros);
    ifft_tb_in_local.dummyones_in       =  ones(1,initZeros);

    %Following 100 samples the valid signal starts
    for i=1:NumSym
        for j=1:AxC
            total_axc_sym_count = (i-1)*4 + j;                                   % goes as: 1:Sym1A1, 2:Sym1A2, 3:Sym1A3, 4:Sym1A4, 5:Sym2A1, 6:Sym2A1, 7:Sym2A2, S8:ym2A3, 9:Sym2A4, ...
            total_sym_num_in_slot = (mod(total_axc_sym_count-1,56)+1);           % 14*4=56 symbols in a slot for 4 AxCs
            slot_number = (idivide(int32(total_axc_sym_count-1),int32(56))) + 1; 
            sym_num_in_slot = double(idivide(int32(total_sym_num_in_slot-1),int32(4))) + 1;

            if (sym_num_in_slot==1)
                        CPL = 352; 
            else
                        CPL = 288;
            end

            InterSymGap = (NFFT-NPRB) + CPL;
            dummyzeros= zeros(1,InterSymGap);
            dummyones = ones(1,NPRB);                                              %This is the data length and depends on number of data points (e.g. 3276)
            
            ifft_tb_in_local.valid_in = [ifft_tb_in_local.valid_in dummyones];
            ifft_tb_in_local.ChNo_in  = [ifft_tb_in_local.ChNo_in (sym_num_in_slot-1)*dummyones]; %Input needs to go from 0,1,2,3,0,1,2,3...
            ifft_tb_in_local.CPLen_in = [ifft_tb_in_local.CPLen_in CPlen*dummyones];
            ifft_tb_in_local.fftsize_in = [ifft_tb_in_local.fftsize_in log2(NFFT)*dummyones];
            ifft_tb_in_local.NPRB = [ifft_tb_in_local.NPRB NPRB*dummyones];
            ifft_tb_in_local.constgain = [ifft_tb_in_local.constgain constgain*dummyones];
            ifft_tb_in_local.Muxsel = [ifft_tb_in_local.Muxsel Muxsel*dummyones];%
            ifft_tb_in_local.MuxConstData = [ifft_tb_in_local.MuxConstData MuxConstData*dummyones];
            ifft_tb_in_local.ifftshift = [ifft_tb_in_local.ifftshift ifftshift_*dummyones];
            ifft_tb_in_local.DC_SC_EN = [ifft_tb_in_local.DC_SC_EN DC_SC_EN*dummyones];
            ifft_tb_in_local.Tech_CP = [ifft_tb_in_local.Tech_CP Tech_CP*dummyones];
            ifft_tb_in_local.Tsym = [ifft_tb_in_local.Tsym Tsym*dummyones];
            ifft_tb_in_local.TCP = [ifft_tb_in_local.TCP TCP*dummyones];
            ifft_tb_in_local.Digital_power_real = [ifft_tb_in_local.Digital_power_real Digital_power_real*dummyones];
            ifft_tb_in_local.Digital_power_imag = [ifft_tb_in_local.Digital_power_imag Digital_power_imag*dummyones];
            ifft_tb_in_local.dummyones_in = [ifft_tb_in_local.dummyones_in dummyones];
            ifft_tb_in_local.F1 = F1;

            ifft_tb_in_local.valid_in = [ifft_tb_in_local.valid_in dummyzeros];
            ifft_tb_in_local.ChNo_in  = [ifft_tb_in_local.ChNo_in (sym_num_in_slot-1)*ones(1,InterSymGap)];
            ifft_tb_in_local.CPLen_in = [ifft_tb_in_local.CPLen_in CPlen*ones(1,InterSymGap)];
            ifft_tb_in_local.fftsize_in = [ifft_tb_in_local.fftsize_in log2(NFFT)*ones(1,InterSymGap)];
            ifft_tb_in_local.NPRB = [ifft_tb_in_local.NPRB NPRB*ones(1,InterSymGap)];
            ifft_tb_in_local.constgain = [ifft_tb_in_local.constgain constgain*ones(1,InterSymGap)];
            ifft_tb_in_local.Muxsel = [ifft_tb_in_local.Muxsel Muxsel*ones(1,InterSymGap)];
            ifft_tb_in_local.MuxConstData = [ifft_tb_in_local.MuxConstData MuxConstData*ones(1,InterSymGap)];
            ifft_tb_in_local.ifftshift = [ifft_tb_in_local.ifftshift ifftshift_*ones(1,InterSymGap)];
            ifft_tb_in_local.DC_SC_EN = [ifft_tb_in_local.DC_SC_EN DC_SC_EN*ones(1,InterSymGap)];
            ifft_tb_in_local.Tech_CP = [ifft_tb_in_local.Tech_CP Tech_CP*ones(1,InterSymGap)];
	        ifft_tb_in_local.Tsym = [ifft_tb_in_local.Tsym Tsym*ones(1,InterSymGap)];
	        ifft_tb_in_local.TCP = [ifft_tb_in_local.TCP TCP*ones(1,InterSymGap)];
	        ifft_tb_in_local.Digital_power_real = [ifft_tb_in_local.Digital_power_real Digital_power_real*ones(1,InterSymGap)];
	        ifft_tb_in_local.Digital_power_imag = [ifft_tb_in_local.Digital_power_imag Digital_power_imag*ones(1,InterSymGap)];
	        ifft_tb_in_local.dummyones_in = [ifft_tb_in_local.dummyones_in ones(1,InterSymGap)];
	        ifft_tb_in_local.F1 = F1;

        end
    end


%% Expected IQ data output
% For CC1 data from columns 1,3,5,7 and for CC2 from columns 2,4,6,8

    AxC     = 4;
    NumSym  = NumSym; 
    dout_v  = [];
    r       = 1;
    c       = cc;
    samp = length(d_in)-100;
    for i = 1:samp
        dout_v=[dout_v ; ifft_out(r,c)];
        c=c+2;
        if((c==9 && cc==1) || (c==10 && cc==2))
            c=cc;
            r=r+1;
        end
    end
     
    dout_v = dout_v.';
    ifft_tb_exp_out_local.dout_v = dout_v;              

%% Side output signals
    m=0;
    AxC_out_v=[];
    for l=1:length(d_in) 
          AxC_out_v =[AxC_out_v m];
          m=m+1;
          if(m==4)
              m=0;
          end
     end
    ifft_tb_exp_out_local.AxC_out_v = AxC_out_v;    %This is output channel signals 
    ifft_tb_exp_out_local.vout = ones(1,length(d_in)) ;        

%% Save the object
save('../mdl/low_phy_dl/local_test_input_output.mat','ifft_tb_in_local','ifft_tb_exp_out_local');  

disp('[ifft_input formatter]: Executed')