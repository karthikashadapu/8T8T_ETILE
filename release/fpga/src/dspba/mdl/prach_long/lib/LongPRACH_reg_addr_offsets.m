disp('reg settings loaded')

MMoffset.NCO = 0;
MMoffset.versionreg=MMoffset.NCO+4;
%MMoffset.prach_bw_sel = MMoffset.NCO+4; %% x x x prach_mux_sel_2 prach_mux_sel_1 prach_mux_sel_0 x x
                                        % 5 MHz:     xxx011xx  
                                        % 10 MHz:    xxx001xx 
                                        % 15/20 MHz: xxx000xx 
% MMoffset.HBcoef1 = MMoffset.prach_bw_sel + 128;
% MMoffset.HBcoef2 = MMoffset.HBcoef1 + 128; %% not used
% MMoffset.HBcoef3 = MMoffset.HBcoef2 + 128;
% MMoffset.HBcoef4 = MMoffset.HBcoef3 + 128;
% MMoffset.decby3_st1  = MMoffset.HBcoef4 + 128; %% not used
% MMoffset.decby3_st2  = MMoffset.decby3_st1 + 128;
% MMoffset.prach_out_start  = MMoffset.decby3_st2 + 128; % prach.SCstart = 1629;
% MMoffset.prach_out_end  = MMoffset.prach_out_start + 1; % prach.SCend = 420;
% MMoffset.prach_addr_offset = MMoffset.prach_out_end + 1; 
%                                         % 5 MHz:      prach.grpDelay_comp = 4 
%                                         % 10 MHz:     prach.grpDelay_comp = 6 
%                                         % 15/20 MHz:  prach.grpDelay_comp = 6 
% MMoffset.prach_symb_start_ch1 = MMoffset.prach_addr_offset + 2;
%                                         % default = FIXED = 264*4
% MMoffset.prach_symb_end_ch1 = MMoffset.prach_symb_start_ch1 + 2;
%                                         % default = FIXED = 264*4 + 2048*4
% MMoffset.prach_ConfigIndex = 1;%MMoffset.prach_symb_end_ch1duple + 1;
% MMoffset.prach_technology = 30;%MMoffset.prach_ConfigIndex + 1;

%MMoffset.NCO_SYNC_counter = 8;
% MMoffset.ZeropadFront = 9;
% MMoffset.ZeropadRear = 10;
% ZeropadFront = 10;
% ZeropadRear=15;


                                        % default = 27
% MMoffset.per_lat_val = MMoffset.NCO+100;
% MMoffset.per_comp_time_val = MMoffset.per_lat_val+1;
% MMoffset.prach_fft_scale = MMoffset.per_comp_time_val+1;
% MMoffset.prach_cap_sel=MMoffset.prach_fft_scale +1;

% MMoffset.prach_addr_limit  = MMoffset.prach_addr_offset + 1;
MMoffset.PRACH_NRPRACHSlot_addr =11;



MMoffset.PRACH_ActivePRACHSlot_addr=12;

