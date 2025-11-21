# This is the Run ModelSim file list for 'busFabric_ifft_blocktostream_DUT_2ouiy5b06j6e6s6h6u0qu5xajz'

if {![info exist use_own_safe_path] || ![string equal -nocase $use_own_safe_path true]} {
    vlog -sv -quiet $base_dir/ifft_blocktostream/ifft_blocktostream_DUT_safe_path_msim_ver.sv
}
if {![info exist use_own_safe_path] || ![string equal -nocase $use_own_safe_path true]} {
    vcom -93 -quiet $base_dir/ifft_blocktostream/ifft_blocktostream_DUT_safe_path_msim.vhd
}
vlog -sv -quiet $base_dir/ifft_blocktostream/busFabric_ifft_blocktostream_DUT_2ouiy5b06j6e6s6h6u0qu5xajz.sv
