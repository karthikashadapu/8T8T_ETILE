// safe_path_ver for standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate given rtl dir is ../../rtl/low_phy_ul_rtl (modelsim)

package streamtoblock_fft_DUT_safe_path_ver;

    typedef logic[8*512-1:0] mystring;
    function mystring safe_path_ver(mystring path);
                safe_path_ver = path;

    endfunction

endpackage
