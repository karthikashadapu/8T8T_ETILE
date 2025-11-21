// safe_path_ver for standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate given rtl dir is ../../rtl/low_phy_ul_rtl (quartus)

package streamtoblock_fft_DUT_safe_path_ver;

    typedef logic[8*512-1:0] mystring;
    function mystring safe_path_ver(mystring path);
        `ifndef SYNTHESIS
            safe_path_ver = path;
            for(int i=0; i < 4096-$bits("../../rtl/low_phy_ul_rtl/"); i = i+8) begin
               if(path[i+:8] == 0) begin
                  safe_path_ver[i+:$bits("../../rtl/low_phy_ul_rtl/")] = "../../rtl/low_phy_ul_rtl/";
                  break;
               end
            end
        `else
            safe_path_ver = path;
        `endif

    endfunction

endpackage
