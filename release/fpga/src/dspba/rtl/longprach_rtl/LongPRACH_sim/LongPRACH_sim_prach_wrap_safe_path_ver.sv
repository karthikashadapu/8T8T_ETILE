// safe_path_ver for LongPRACH_sim_prach_wrap given rtl dir is ../../rtl/longprach_rtl (quartus)

package LongPRACH_sim_prach_wrap_safe_path_ver;

    typedef logic[8*512-1:0] mystring;
    function mystring safe_path_ver(mystring path);
        `ifndef SYNTHESIS
            safe_path_ver = path;
            for(int i=0; i < 4096-$bits("../../rtl/longprach_rtl/"); i = i+8) begin
               if(path[i+:8] == 0) begin
                  safe_path_ver[i+:$bits("../../rtl/longprach_rtl/")] = "../../rtl/longprach_rtl/";
                  break;
               end
            end
        `else
            safe_path_ver = path;
        `endif

    endfunction

endpackage
