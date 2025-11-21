-- safe_path for ddc_model_DUT given rtl dir is ../../rtl/ddc_model_rtl (flat)
LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE ddc_model_DUT_safe_path is
	FUNCTION safe_path( path: string ) RETURN string;
END ddc_model_DUT_safe_path;

PACKAGE body ddc_model_DUT_safe_path IS
	FUNCTION safe_path( path: string )
		RETURN string IS
	BEGIN
		FOR i IN path'reverse_range loop
			IF (path(i) = '/') THEN
				RETURN path(i+1 to path'right);
			END IF;
		END LOOP;
		RETURN path;
	END FUNCTION safe_path;
END ddc_model_DUT_safe_path;
