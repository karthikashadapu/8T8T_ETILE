-- safe_path for standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate given rtl dir is ../../rtl/low_phy_ul_rtl (modelsim)
LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE streamtoblock_fft_DUT_safe_path is
	FUNCTION safe_path( path: string ) RETURN string;
END streamtoblock_fft_DUT_safe_path;

PACKAGE body streamtoblock_fft_DUT_safe_path IS
	FUNCTION safe_path( path: string )
		RETURN string IS
	BEGIN
		RETURN path;
	END FUNCTION safe_path;
END streamtoblock_fft_DUT_safe_path;
