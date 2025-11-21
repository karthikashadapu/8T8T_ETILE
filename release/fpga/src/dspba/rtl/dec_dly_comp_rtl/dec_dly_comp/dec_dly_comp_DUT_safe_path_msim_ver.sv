// safe_path_ver for standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x given rtl dir is ../../rtl/dec_dly_comp_rtl (modelsim)

package dec_dly_comp_DUT_safe_path_ver;

    typedef logic[8*512-1:0] mystring;
    function mystring safe_path_ver(mystring path);
                safe_path_ver = path;

    endfunction

endpackage
