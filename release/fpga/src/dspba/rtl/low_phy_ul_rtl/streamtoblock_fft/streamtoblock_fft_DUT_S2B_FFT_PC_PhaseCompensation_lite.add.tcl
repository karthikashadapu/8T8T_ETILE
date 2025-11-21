# This is the Quartus file list for 'streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite'

set_global_assignment -name SYSTEMVERILOG_FILE ../../rtl/low_phy_ul_rtl/streamtoblock_fft/streamtoblock_fft_DUT_safe_path_ver.sv
set_global_assignment -name VHDL_FILE ../../rtl/low_phy_ul_rtl/streamtoblock_fft/streamtoblock_fft_DUT_safe_path.vhd 
set_global_assignment -name SYSTEMVERILOG_FILE ../../rtl/low_phy_ul_rtl/streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite.sv
source ../../rtl/low_phy_ul_rtl/streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_ComplexMixer.add.tcl
source ../../rtl/low_phy_ul_rtl/streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate.add.tcl
source ../../rtl/low_phy_ul_rtl/streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_SOP_EOP_gen.add.tcl
