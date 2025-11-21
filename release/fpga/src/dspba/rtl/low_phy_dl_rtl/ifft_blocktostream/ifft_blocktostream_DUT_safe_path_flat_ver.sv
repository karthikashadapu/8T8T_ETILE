// safe_path_ver for standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap given rtl dir is ../../rtl/low_phy_dl_rtl (flat)

package ifft_blocktostream_DUT_safe_path_ver;

    typedef logic[8*512-1:0] mystring;
    function mystring safe_path_ver(mystring path);
        safe_path_ver = path;
        for (int i =0; i < 4096; i = i+8 ) begin
            if( path[i+:8] == "/") begin
                for (int j = i; j < 4096; j = j+8 ) begin
                    safe_path_ver[j+:8] = 0;
                end
                return safe_path_ver;
           end
        end
        return safe_path_ver;
    endfunction

endpackage
