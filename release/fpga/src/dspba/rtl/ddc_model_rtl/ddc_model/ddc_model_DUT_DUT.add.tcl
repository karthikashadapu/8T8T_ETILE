# This is the Quartus file list for 'ddc_model_DUT_DUT'

set_global_assignment -name SYSTEMVERILOG_FILE ../../rtl/ddc_model_rtl/ddc_model/ddc_model_DUT_safe_path_ver.sv
set_global_assignment -name VHDL_FILE ../../rtl/ddc_model_rtl/ddc_model/ddc_model_DUT_safe_path.vhd 
set_global_assignment -name SYSTEMVERILOG_FILE ../../rtl/ddc_model_rtl/ddc_model/ddc_model_DUT_DUT.sv
source ../../rtl/ddc_model_rtl/ddc_model/ddc_model_DUT_DUT_Chan_Filter_l1.add.tcl
source ../../rtl/ddc_model_rtl/ddc_model/ddc_model_DUT_DUT_routing_reg_hb72chan_l1.add.tcl
source ../../rtl/ddc_model_rtl/ddc_model/ddc_model_DUT_DUT_COMPLEX_MIXER1.add.tcl
source ../../rtl/ddc_model_rtl/ddc_model/ddc_model_DUT_DUT_Const_sel.add.tcl
source ../../rtl/ddc_model_rtl/ddc_model/ddc_model_DUT_DUT_DDC_l1_x.add.tcl
