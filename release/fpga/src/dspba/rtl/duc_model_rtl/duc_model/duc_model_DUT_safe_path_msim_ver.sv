// safe_path_ver for duc_model_DUT given rtl dir is ../../rtl/duc_model_rtl (modelsim)

package duc_model_DUT_safe_path_ver;

    typedef logic[8*512-1:0] mystring;
    function mystring safe_path_ver(mystring path);
                safe_path_ver = path;

    endfunction

endpackage
