// safe_path_ver for LongPRACH_sim_prach_wrap given rtl dir is ../../rtl/longprach_rtl (modelsim)

package LongPRACH_sim_prach_wrap_safe_path_ver;

    typedef logic[8*512-1:0] mystring;
    function mystring safe_path_ver(mystring path);
                safe_path_ver = path;

    endfunction

endpackage
