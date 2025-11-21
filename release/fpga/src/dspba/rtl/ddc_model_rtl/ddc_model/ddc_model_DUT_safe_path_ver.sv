// safe_path_ver for ddc_model_DUT given rtl dir is ../../rtl/ddc_model_rtl (quartus)

package ddc_model_DUT_safe_path_ver;

    typedef logic[8*512-1:0] mystring;
    function mystring safe_path_ver(mystring path);
        `ifndef SYNTHESIS
            safe_path_ver = path;
            for(int i=0; i < 4096-$bits("../../rtl/ddc_model_rtl/"); i = i+8) begin
               if(path[i+:8] == 0) begin
                  safe_path_ver[i+:$bits("../../rtl/ddc_model_rtl/")] = "../../rtl/ddc_model_rtl/";
                  break;
               end
            end
        `else
            safe_path_ver = path;
        `endif

    endfunction

endpackage
