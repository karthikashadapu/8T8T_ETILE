// safe_path_ver for standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_x given rtl dir is ../../rtl/ca_interp_rtl (modelsim)

package ca_interp_DUT_safe_path_ver;

    typedef logic[8*512-1:0] mystring;
    function mystring safe_path_ver(mystring path);
                safe_path_ver = path;

    endfunction

endpackage
