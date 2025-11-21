%% chFiltOut is stored in ddc_out.mat files which is taken in by this script 
% and converted to DSPBA model compatible input. Also settings are taken
% depending on the cc being run. Expected vectors are created by this script 
% from fft_out.mat based on CC number running.

%Reading relative path of expected vector folder
readme_fileID = fopen('locate_testvector.txt');
readme_text = textscan(readme_fileID,'%s');
fclose(readme_fileID);
DIR_EXP_VECT = readme_text{1, 1}{1, 1} ;

% Load the settings, input and expected output for FFT CC1. 
if(cc==1)
    load("dspba_vectors/ddc/cc1/ddc_out.mat");  
    load(sprintf("%s/settings.mat",DIR_EXP_VECT),"fft_tb_in_l1");
    fft_tb_in = fft_tb_in_l1;
    load(sprintf("%s/fft_out.mat",DIR_EXP_VECT));
end

% Load the settings, input and expected output for FFT CC2. 
if(cc==2)
    load("dspba_vectors/ddc/cc2/ddc_out.mat");
    load(sprintf("%s/settings.mat",DIR_EXP_VECT),"fft_tb_in_l2");
    fft_tb_in = fft_tb_in_l2;
    load(sprintf("%s/fft_out.mat",DIR_EXP_VECT));
end

%Signals for ripple compensation, provide compensation coefficients to FFT

rc_en=fft_tb_in.rc_en;

if(rc_en==0)
    fft_tb_in_local.ripple_comp_en = 0;
end

if(rc_en==1)   
    fft_tb_in_local.ripple_comp_en = 1;
end

    if(fft_tb_in.bw_sel==100e6)
        fft_tb_in_local.rc_bw_sel = 0; %0 for 100MHz
        
    elseif(fft_tb_in.bw_sel==60e6)
        fft_tb_in_local.rc_bw_sel = 1; %1 for 60MHz
        
    end

    if(cc==1)
        load(sprintf("%s/settings.mat",DIR_EXP_VECT),"ddc_tb_in_l1");
        ddc_tb_in = ddc_tb_in_l1;
    end 
    if(cc==2)
        load(sprintf("%s/settings.mat",DIR_EXP_VECT),"ddc_tb_in_l2");
        ddc_tb_in = ddc_tb_in_l2;
    end
    
    datapts=3276;
    Coeff2_freq = fftshift(fft((ddc_tb_in.Coeff100),4096));
    stpt = (4096-datapts)/2+1 ;
    endpt = datapts + (4096-datapts)/2 ;
    compensation = double(abs(ones(1,datapts+1)./Coeff2_freq(stpt:endpt+1)));
    filtvector=[compensation((datapts/2)+1:end) zeros(1,(4096-datapts-1)) compensation(1:(datapts/2))];
    fft_tb_in_local.rc_100MHz = fftshift(bitrevorder(filtvector));

    datapts=1944;
    Coeff2_freq = fftshift(fft((ddc_tb_in.Coef60),4096));
    stpt = (4096-datapts)/2+1 ;
    endpt = datapts + (4096-datapts)/2 ;
    compensation = double(abs(ones(1,datapts+1)./Coeff2_freq(stpt:endpt+1)));
    filtvector=[compensation((datapts/2)+1:end) zeros(1,(4096-datapts-1)) compensation(1:(datapts/2))];
    fft_tb_in_local.rc_60MHz = fftshift(bitrevorder(filtvector)); 

% Scope for extra functionality 
fft_loopback = 0;
if(fft_loopback==1)
DLPath_Tap_dataout = double(out.DLpath_Tap_data_out.Data(out.DLpath_Tap_dv_out.Data==1)).';
DLPath_Tap_chout = double(out.DLpath_Tap_ch_out.Data(out.DLpath_Tap_dv_out.Data==1)).';

    temp                            = [zeros(1,100) DLPath_Tap_dataout];
    fft_tb_in_local.dout_v          = temp		    ; 
end

%% Take data chFiltOut from output of ddc and convert to input of
% fft module. Store the result to module's folder from where 
% it will be consumed in model. chFiltOut is 1 columns
% wide, fft_tb_in_local.dout_v is 1 columns wide as well.

data_dely_rem = chFiltOut(4*(fft_tb_in.group_delay)+1:end);
fft_tb_in_local.dout_v = [zeros(1,100) data_dely_rem.'];

%% Input side signals 

dummyones                       = ones(1,length(chFiltOut));
dummyzeros                      = zeros(1,100)                    ;
fft_tb_in_local.valid_out       = [dummyzeros dummyones]        ;
fft_tb_in_local.chout_v         = [dummyzeros (repmat([0 1 2 3],1,(ceil(length(chFiltOut)/4))))] ;

fft_tb_in_local.fftsize_in      = [dummyzeros dummyones*fft_tb_in.fftsize_in] ;
fft_tb_in_local.CPLen_in        = [dummyzeros dummyones*fft_tb_in.CPLen_in	] ;
fft_tb_in_local.nprb_v          = [dummyzeros dummyones*fft_tb_in.NPRB 		] ;
fft_tb_in_local.hcshift_v       = [dummyzeros dummyones*fft_tb_in.Hcsshift_v	] ;
fft_tb_in_local.const_gain_v    = [dummyzeros dummyones*(fft_tb_in.constgain/(2*8192))] ;
fft_tb_in_local.ifftshift_v     = [dummyzeros dummyones*fft_tb_in.fftshift	] ;
fft_tb_in_local.Tsym            = [dummyzeros dummyones*fft_tb_in.Tsym 		] ;
fft_tb_in_local.DC_SC_EN        = [dummyzeros dummyones*fft_tb_in.DC_SC_EN	] ;
fft_tb_in_local.Tech_CP         = [dummyzeros dummyones*fft_tb_in.Tech_CP 	] ;
fft_tb_in_local.F1              = fft_tb_in.F1			   					  ;
fft_tb_in_local.lut             = fft_tb_in.lut			   					  ;

% For side signal named 'metadata'
    AxC                  =4;                                                        
    NFFT                 =2^(fft_tb_in.fftsize_in);
    NPRB                 =fft_tb_in.NPRB;
    metadata_sym_valid   =[];
    NumSym=ceil(length(fft_tb_in_local.valid_out)/(AxC*4096)); %Approximation of number symbol to be input to FFT

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
            metadata_sym_valid=[metadata_sym_valid 1 zeros(1,(NPRB+InterSymGap-1))];  
        end
    end

  fft_tb_in_local.metadata_sym_valid  = metadata_sym_valid;
  fft_tb_in_local.metadata_sym        = 1:length(metadata_sym_valid);

%% Expected out signal extraction from fft_out for comparison in TestAnalysis  
% For CC1 data from columns 1,3,5,7 and for CC2 from columns 2,4,6,8

NPRB         = fft_tb_in.NPRB;
ipvector_cap = [];
curr_sym     = 1;
c            = cc;
AxC          = 4;
var          = ceil(length(fft_tb_in_local.dout_v)/4096); %NumSym*AxC;

for i = 1:var
    start_samp = (curr_sym-1)*NPRB+1;
    end_samp  = curr_sym*NPRB;
    ipvector_cap = [ipvector_cap fft_out(start_samp:end_samp, c).'];
    c=c+2;
    if((c==9 && cc==1) || (c==10 && cc==2))
        curr_sym = curr_sym+1;
        c=cc;
    end
end

fft_tb_exp_out_local.ipvector_cap = ipvector_cap  ;

%% Side output signals
% channel out from FFT is actually symbol number, starting from 0,1,2,...

ip_ch_cap=[];
cnt1=1;
cnt2=1;
for i=1:length(fft_tb_in_local.dout_v)
        ip_ch_cap = [ip_ch_cap (cnt2-1)];
        cnt1=cnt1+1;
        if(cnt1==(NPRB*4+1))
            cnt2=cnt2+1;
            cnt1=1;
        end
end

    fft_tb_exp_out_local.ip_ch_cap = ip_ch_cap;   

%% Save the object
save('../mdl/low_phy_ul/local_test_input_output.mat','fft_tb_in_local','fft_tb_exp_out_local'); 

disp('[fft_input_formatter]: Executed')