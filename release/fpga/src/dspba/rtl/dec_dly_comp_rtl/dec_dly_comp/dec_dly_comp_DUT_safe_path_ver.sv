// safe_path_ver for standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x given rtl dir is ../../rtl/dec_dly_comp_rtl (quartus)

package dec_dly_comp_DUT_safe_path_ver;

    typedef logic[8*512-1:0] mystring;
    function mystring safe_path_ver(mystring path);
        `ifndef SYNTHESIS
            safe_path_ver = path;
            for(int i=0; i < 4096-$bits("../../rtl/dec_dly_comp_rtl/"); i = i+8) begin
               if(path[i+:8] == 0) begin
                  safe_path_ver[i+:$bits("../../rtl/dec_dly_comp_rtl/")] = "../../rtl/dec_dly_comp_rtl/";
                  break;
               end
            end
        `else
            safe_path_ver = path;
        `endif

    endfunction

endpackage
