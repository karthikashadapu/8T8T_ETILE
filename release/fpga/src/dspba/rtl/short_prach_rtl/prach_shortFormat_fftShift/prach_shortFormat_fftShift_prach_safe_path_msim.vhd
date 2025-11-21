-- safe_path for standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect given rtl dir is ../../rtl/short_prach_rtl (modelsim)
LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE prach_shortFormat_fftShift_prach_safe_path is
	FUNCTION safe_path( path: string ) RETURN string;
END prach_shortFormat_fftShift_prach_safe_path;

PACKAGE body prach_shortFormat_fftShift_prach_safe_path IS
	FUNCTION safe_path( path: string )
		RETURN string IS
	BEGIN
		RETURN path;
	END FUNCTION safe_path;
END prach_shortFormat_fftShift_prach_safe_path;
