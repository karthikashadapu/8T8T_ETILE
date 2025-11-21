-- safe_path for standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x given rtl dir is ../../rtl/dec_dly_comp_rtl (quartus)
LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE dec_dly_comp_DUT_safe_path is
	FUNCTION safe_path( path: string ) RETURN string;
END dec_dly_comp_DUT_safe_path;

PACKAGE body dec_dly_comp_DUT_safe_path IS
	FUNCTION safe_path( path: string )
		RETURN string IS
	BEGIN
		return string'("../../rtl/dec_dly_comp_rtl/") & path;
	END FUNCTION safe_path;
END dec_dly_comp_DUT_safe_path;
