function [realfreq] = NRFreq_calc(freq_offset)


 
    f_OFDM_SP = 30000; % Hz, OFDM subcarrier spacing
info.SCZ=839;
    f_RACH_SP = 1250; % Hz, PRACH subcarrier Spacing
    K =  f_OFDM_SP / f_RACH_SP;
    Kbar=1;


   %%%
   N_start_u_grid = 0;
   N_size_u_grid = 273;
   N_RB_SC=12;

   N_start_u0_grid = 0;
   N_size_u0_grid = 273;
 
  u=1;
  u0=1;

  k_u_0 = (N_start_u_grid+N_size_u_grid/2)*N_RB_SC-(N_start_u0_grid+N_size_u0_grid/2)*N_RB_SC*2^(u0-u);


N_start_BWP=0;
n_start_RA=freq_offset;
N_RA_RB=3;
n_RA=0;

k1=k_u_0+N_start_BWP*N_RB_SC+n_start_RA*N_RB_SC+n_RA*N_RA_RB*N_RB_SC-N_size_u_grid*N_RB_SC/2;

realfreq= ( K*k1+Kbar+ floor(info.SCZ/2)) * f_RACH_SP 
end