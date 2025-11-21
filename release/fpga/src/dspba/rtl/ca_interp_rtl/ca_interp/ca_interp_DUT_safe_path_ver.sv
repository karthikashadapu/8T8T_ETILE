// safe_path_ver for standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_x given rtl dir is ../../rtl/ca_interp_rtl (quartus)

package ca_interp_DUT_safe_path_ver;

    typedef logic[8*512-1:0] mystring;
    function mystring safe_path_ver(mystring path);
        `ifndef SYNTHESIS
            safe_path_ver = path;
            for(int i=0; i < 4096-$bits("../../rtl/ca_interp_rtl/"); i = i+8) begin
               if(path[i+:8] == 0) begin
                  safe_path_ver[i+:$bits("../../rtl/ca_interp_rtl/")] = "../../rtl/ca_interp_rtl/";
                  break;
               end
            end
        `else
            safe_path_ver = path;
        `endif

    endfunction

endpackage
