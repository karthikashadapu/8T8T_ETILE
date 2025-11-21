// safe_path_ver for standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate given rtl dir is ../../rtl/low_phy_ul_rtl (flat)

package streamtoblock_fft_DUT_safe_path_ver;

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
