-- safe_path for standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_x given rtl dir is ../../rtl/ca_interp_rtl (quartus)
LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE ca_interp_DUT_safe_path is
	FUNCTION safe_path( path: string ) RETURN string;
END ca_interp_DUT_safe_path;

PACKAGE body ca_interp_DUT_safe_path IS
	FUNCTION safe_path( path: string )
		RETURN string IS
	BEGIN
		return string'("../../rtl/ca_interp_rtl/") & path;
	END FUNCTION safe_path;
END ca_interp_DUT_safe_path;
