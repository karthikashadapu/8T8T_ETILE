-- safe_path for duc_model_DUT given rtl dir is ../../rtl/duc_model_rtl (quartus)
LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE duc_model_DUT_safe_path is
	FUNCTION safe_path( path: string ) RETURN string;
END duc_model_DUT_safe_path;

PACKAGE body duc_model_DUT_safe_path IS
	FUNCTION safe_path( path: string )
		RETURN string IS
	BEGIN
		return string'("../../rtl/duc_model_rtl/") & path;
	END FUNCTION safe_path;
END duc_model_DUT_safe_path;
