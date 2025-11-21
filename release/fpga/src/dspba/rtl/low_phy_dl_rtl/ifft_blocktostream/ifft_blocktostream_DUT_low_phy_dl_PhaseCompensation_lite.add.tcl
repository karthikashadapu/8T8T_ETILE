# This is the Quartus file list for 'ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite'

set_global_assignment -name SYSTEMVERILOG_FILE ../../rtl/low_phy_dl_rtl/ifft_blocktostream/ifft_blocktostream_DUT_safe_path_ver.sv
set_global_assignment -name VHDL_FILE ../../rtl/low_phy_dl_rtl/ifft_blocktostream/ifft_blocktostream_DUT_safe_path.vhd 
set_global_assignment -name SYSTEMVERILOG_FILE ../../rtl/low_phy_dl_rtl/ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite.sv
source ../../rtl/low_phy_dl_rtl/ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_ComplexMixer.add.tcl
source ../../rtl/low_phy_dl_rtl/ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate.add.tcl
source ../../rtl/low_phy_dl_rtl/ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_SOP_EOP_gen.add.tcl
