PRACH_regs_MMstart = 0;
PRACH_regs_MMOffset = 8;
NumberOfCCs= 4;

if (waveconfig.PRACH.Config.ConfigurationIndex > 66)
    PRACH_regs(1).PRACH_config_index = waveconfig.PRACH.Config.ConfigurationIndex;
    PRACH_regs(1).PRACH_time_index = waveconfig.PRACH.Config.TimeIndex;
    PRACH_regs(1).PRACH_NRPRACHSlot = waveconfig.PRACH.Config.NPRACHSlot;
    PRACH_regs(1).PRACH_ActivePRACHSlot = waveconfig.PRACH.Config.ActivePRACHSlot;
    PRACH_regs(1).PRACH_fft_scale = log2(Nfft);
    %PRACH_regs(1).PRACH_fft_scale = 0;
    PRACH_regs(1).PRACH_RB_offset = waveconfig.PRACH.Config.RBOffset;
    PRACH_regs(1).PRACH_freq_index = waveconfig.PRACH.Config.FrequencyIndex;
    PRACH_regs(2).PRACH_config_index = waveconfig.PRACH.Config.ConfigurationIndex;
    PRACH_regs(2).PRACH_time_index = waveconfig.PRACH.Config.TimeIndex;
    PRACH_regs(2).PRACH_NRPRACHSlot = waveconfig.PRACH.Config.NPRACHSlot;
    PRACH_regs(2).PRACH_ActivePRACHSlot = waveconfig.PRACH.Config.ActivePRACHSlot;
    PRACH_regs(2).PRACH_fft_scale = log2(Nfft);
    %PRACH_regs(2).PRACH_fft_scale = 0;
    PRACH_regs(2).PRACH_RB_offset = waveconfig.PRACH.Config.RBOffset;
    PRACH_regs(2).PRACH_freq_index = waveconfig.PRACH.Config.FrequencyIndex;
    PRACH_regs(3).PRACH_config_index = waveconfig.PRACH.Config.ConfigurationIndex;
    PRACH_regs(3).PRACH_time_index = waveconfig.PRACH.Config.TimeIndex;
    PRACH_regs(3).PRACH_NRPRACHSlot = waveconfig.PRACH.Config.NPRACHSlot;
    PRACH_regs(3).PRACH_ActivePRACHSlot = waveconfig.PRACH.Config.ActivePRACHSlot;
    PRACH_regs(3).PRACH_fft_scale = log2(Nfft);
    %PRACH_regs(3).PRACH_fft_scale = 0;
    PRACH_regs(3).PRACH_RB_offset = waveconfig.PRACH.Config.RBOffset;
    PRACH_regs(3).PRACH_freq_index = waveconfig.PRACH.Config.FrequencyIndex;
else
    PRACH_regs(1).PRACH_config_index = 167;
    PRACH_regs(1).PRACH_time_index = 0;
    PRACH_regs(1).PRACH_NRPRACHSlot = 0;
    PRACH_regs(1).PRACH_ActivePRACHSlot = 0;
    PRACH_regs(1).PRACH_fft_scale = 1;
    PRACH_regs(1).PRACH_RB_offset = 0;
    PRACH_regs(1).PRACH_freq_index = 0;

PRACH_regs(2).PRACH_config_index = 167;
PRACH_regs(2).PRACH_time_index = 0;
PRACH_regs(2).PRACH_NRPRACHSlot = 0;
PRACH_regs(2).PRACH_ActivePRACHSlot = 0;
PRACH_regs(2).PRACH_fft_scale = 1;
PRACH_regs(2).PRACH_RB_offset = 0;
PRACH_regs(2).PRACH_freq_index = 0;


PRACH_regs(3).PRACH_config_index = 12;
PRACH_regs(3).PRACH_time_index = 12;
PRACH_regs(3).PRACH_NRPRACHSlot = 12;
PRACH_regs(3).PRACH_ActivePRACHSlot = 0;
PRACH_regs(3).PRACH_fft_scale = 12;
PRACH_regs(3).PRACH_RB_offset = 12;
PRACH_regs(3).PRACH_freq_index = 12;

end



PRACH_regs(4).PRACH_config_index = 12;
PRACH_regs(4).PRACH_time_index = 12;
PRACH_regs(4).PRACH_NRPRACHSlot = 12;
PRACH_regs(4).PRACH_ActivePRACHSlot = 0;
PRACH_regs(4).PRACH_fft_scale = 12;
PRACH_regs(4).PRACH_RB_offset = 12;
PRACH_regs(4).PRACH_freq_index = 12;


for i=1:NumberOfCCs
    PRACH_regs(i).PRACH_config_index_addr = PRACH_regs_MMstart+(i)*PRACH_regs_MMOffset;
    PRACH_regs(i).PRACH_config_index_string = ['PRACH ' num2str(i-1) 'configuration index'];
    PRACH_regs(i).PRACH_time_index_addr = PRACH_regs_MMstart+(i)*PRACH_regs_MMOffset+1;
    PRACH_regs(i).PRACH_time_index_string = 'PRACH 0 time index';
    PRACH_regs(i).PRACH_NRPRACHSlot_addr = PRACH_regs_MMstart+(i)*PRACH_regs_MMOffset+2;
    PRACH_regs(i).PRACH_NRPRACHSlot_string = 'PRACH 0 NR PRACH Slot';
    PRACH_regs(i).PRACH_ActivePRACHSlot_addr = PRACH_regs_MMstart+(i)*PRACH_regs_MMOffset+3;
    PRACH_regs(i).PRACH_ActivePRACHSlot_string = 'PRACH 0 Active PRACH Slot';
    PRACH_regs(i).PRACH_fft_scale_addr = PRACH_regs_MMstart+(i)*PRACH_regs_MMOffset+4;
    PRACH_regs(i).PRACH_fft_scale_string = 'PRACH 0 FFT scale factor';
    PRACH_regs(i).PRACH_RB_offset_addr = PRACH_regs_MMstart+(i)*PRACH_regs_MMOffset+5;
    PRACH_regs(i).PRACH_RB_offset_string = 'PRACH 0 RB offset';
    PRACH_regs(i).PRACH_freq_index_addr = PRACH_regs_MMstart+(i)*PRACH_regs_MMOffset+6;
    PRACH_regs(i).PRACH_freq_index_string = 'PRACH 0 frequency index';
end;

display ('active PRACH slot ', int2str(PRACH_regs(4).PRACH_ActivePRACHSlot))
