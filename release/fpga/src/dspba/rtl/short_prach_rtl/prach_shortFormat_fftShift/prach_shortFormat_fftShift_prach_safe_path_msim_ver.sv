// safe_path_ver for standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect given rtl dir is ../../rtl/short_prach_rtl (modelsim)

package prach_shortFormat_fftShift_prach_safe_path_ver;

    typedef logic[8*512-1:0] mystring;
    function mystring safe_path_ver(mystring path);
                safe_path_ver = path;

    endfunction

endpackage
