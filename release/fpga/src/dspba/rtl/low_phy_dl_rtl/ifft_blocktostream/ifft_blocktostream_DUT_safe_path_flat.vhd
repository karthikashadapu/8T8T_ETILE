-- safe_path for standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap given rtl dir is ../../rtl/low_phy_dl_rtl (flat)
LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE ifft_blocktostream_DUT_safe_path is
	FUNCTION safe_path( path: string ) RETURN string;
END ifft_blocktostream_DUT_safe_path;

PACKAGE body ifft_blocktostream_DUT_safe_path IS
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
END ifft_blocktostream_DUT_safe_path;
