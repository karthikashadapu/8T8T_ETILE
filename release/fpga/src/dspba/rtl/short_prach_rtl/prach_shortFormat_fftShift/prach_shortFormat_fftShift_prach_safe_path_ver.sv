// safe_path_ver for standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect given rtl dir is ../../rtl/short_prach_rtl (quartus)

package prach_shortFormat_fftShift_prach_safe_path_ver;

    typedef logic[8*512-1:0] mystring;
    function mystring safe_path_ver(mystring path);
        `ifndef SYNTHESIS
            safe_path_ver = path;
            for(int i=0; i < 4096-$bits("../../rtl/short_prach_rtl/"); i = i+8) begin
               if(path[i+:8] == 0) begin
                  safe_path_ver[i+:$bits("../../rtl/short_prach_rtl/")] = "../../rtl/short_prach_rtl/";
                  break;
               end
            end
        `else
            safe_path_ver = path;
        `endif

    endfunction

endpackage
