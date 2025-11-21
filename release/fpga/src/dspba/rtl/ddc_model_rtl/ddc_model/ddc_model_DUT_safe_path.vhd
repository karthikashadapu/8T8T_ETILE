-- safe_path for ddc_model_DUT given rtl dir is ../../rtl/ddc_model_rtl (quartus)
LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE ddc_model_DUT_safe_path is
	FUNCTION safe_path( path: string ) RETURN string;
END ddc_model_DUT_safe_path;

PACKAGE body ddc_model_DUT_safe_path IS
	FUNCTION safe_path( path: string )
		RETURN string IS
	BEGIN
		return string'("../../rtl/ddc_model_rtl/") & path;
	END FUNCTION safe_path;
END ddc_model_DUT_safe_path;
