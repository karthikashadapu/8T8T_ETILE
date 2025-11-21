// safe_path_ver for ddc_model_DUT given rtl dir is ../../rtl/ddc_model_rtl (modelsim)

package ddc_model_DUT_safe_path_ver;

    typedef logic[8*512-1:0] mystring;
    function mystring safe_path_ver(mystring path);
                safe_path_ver = path;

    endfunction

endpackage
