-- safe_path for LongPRACH_sim_prach_wrap given rtl dir is ../../rtl/longprach_rtl (flat)
LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE LongPRACH_sim_prach_wrap_safe_path is
	FUNCTION safe_path( path: string ) RETURN string;
END LongPRACH_sim_prach_wrap_safe_path;

PACKAGE body LongPRACH_sim_prach_wrap_safe_path IS
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
END LongPRACH_sim_prach_wrap_safe_path;
