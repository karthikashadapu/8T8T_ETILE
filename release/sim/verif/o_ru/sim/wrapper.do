onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider ECPRI
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/ecpri_ip_inst/mac_clk_tx
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/ecpri_ip_inst/mac_clk_rx
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/ecpri_ip_inst/clk_tx
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/ecpri_ip_inst/clk_rx
add wave -noupdate -divider {ECPRI Demapper}
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/ecpri_ip_inst/mac_sink_valid
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/ecpri_ip_inst/mac_sink_data
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/ecpri_ip_inst/mac_sink_sop
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/ecpri_ip_inst/mac_sink_eop
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/ecpri_ip_inst/mac_sink_empty
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/ecpri_ip_inst/mac_sink_error
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/ecpri_ip_inst/mac_sink_ready
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/ecpri_ip_inst/avst_source_valid
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/ecpri_ip_inst/avst_source_data
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/ecpri_ip_inst/avst_source_sop
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/ecpri_ip_inst/avst_source_eop
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/ecpri_ip_inst/avst_source_empty
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/ecpri_ip_inst/avst_source_error
add wave -noupdate -divider {ECPRI Mapper}
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/ecpri_ip_inst/avst_sink_valid
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/ecpri_ip_inst/avst_sink_data
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/ecpri_ip_inst/avst_sink_sop
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/ecpri_ip_inst/avst_sink_eop
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/ecpri_ip_inst/avst_sink_empty
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/ecpri_ip_inst/avst_sink_error
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/ecpri_ip_inst/avst_sink_ready
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/ecpri_ip_inst/mac_source_valid
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/ecpri_ip_inst/mac_source_data
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/ecpri_ip_inst/mac_source_sop
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/ecpri_ip_inst/mac_source_eop
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/ecpri_ip_inst/mac_source_empty
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/ecpri_ip_inst/mac_source_error
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/ecpri_ip_inst/mac_source_ready
add wave -noupdate -divider ORAN
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/oran_ip_inst/clk_tx
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/oran_ip_inst/clk_rx
add wave -noupdate -divider {ORAN Demapper}
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/oran_ip_inst/avst_sink_valid
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/oran_ip_inst/avst_sink_data
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/oran_ip_inst/avst_sink_startofpacket
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/oran_ip_inst/avst_sink_endofpacket
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/oran_ip_inst/avst_sink_empty
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/oran_ip_inst/avst_sink_error
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/oran_ip_inst/avst_source_u_valid
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/oran_ip_inst/avst_source_u_data
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/oran_ip_inst/avst_source_u_startofpacket
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/oran_ip_inst/avst_source_u_endofpacket
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/oran_ip_inst/avst_source_u_error
add wave -noupdate -divider {ORAN Mapper}
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/oran_ip_inst/avst_sink_u_valid
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/oran_ip_inst/avst_sink_u_data
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/oran_ip_inst/avst_sink_u_startofpacket
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/oran_ip_inst/avst_sink_u_endofpacket
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/oran_ip_inst/avst_sink_u_ready
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/oran_ip_inst/avst_source_valid
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/oran_ip_inst/avst_source_data
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/oran_ip_inst/avst_source_startofpacket
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/oran_ip_inst/avst_source_endofpacket
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/oran_ip_inst/avst_source_empty
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/oran_ip_inst/avst_source_ready
add wave -noupdate -divider {FDV Buffer}
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/u_dl_top/u_dl_fdv_buffer/clk_eth
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/u_dl_top/u_dl_fdv_buffer/clk_dsp
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/u_dl_top/u_dl_fdv_buffer/avst_sink_valid
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/u_dl_top/u_dl_fdv_buffer/avst_sink_data
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/u_dl_top/u_dl_fdv_buffer/avst_sink_channel
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/u_dl_top/u_dl_fdv_buffer/avst_sink_endofpacket
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/u_dl_top/u_dl_fdv_buffer/avst_sink_startofpacket
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/u_dl_top/u_dl_fdv_buffer/avst_sink_ready
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/u_dl_top/u_dl_fdv_buffer/avst_source_valid_1
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/u_dl_top/u_dl_fdv_buffer/avst_source_data_1
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/u_dl_top/u_dl_fdv_buffer/avst_source_ready_1
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/u_dl_top/u_dl_fdv_buffer/avst_source_valid_2
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/u_dl_top/u_dl_fdv_buffer/avst_source_data_2
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/u_dl_top/u_dl_fdv_buffer/avst_source_ready_2
add wave -noupdate -divider {CU_Coupling}
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/u_cu_plane_coupling/clk_eth  
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/u_cu_plane_coupling/clk_dsp 
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/u_cu_plane_coupling/avst_sink_valid_l1 
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/u_cu_plane_coupling/avst_sink_data_l1
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/u_cu_plane_coupling/avst_sink_channel_l1 
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/u_cu_plane_coupling/avst_sink_endofpacket_l1 
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/u_cu_plane_coupling/avst_sink_startofpacket_l1
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/u_cu_plane_coupling/avst_sink_valid_l2 
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/u_cu_plane_coupling/avst_sink_data_l2 
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/u_cu_plane_coupling/avst_sink_channel_l2 
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/u_cu_plane_coupling/avst_sink_endofpacket_l2 
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/u_cu_plane_coupling/avst_sink_startofpacket_l2 
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/u_cu_plane_coupling/avst_source_valid 
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/u_cu_plane_coupling/avst_source_data 
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/u_cu_plane_coupling/avst_source_channel 
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/u_cu_plane_coupling/avst_source_ready 
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/u_cu_plane_coupling/avst_source_endofpacket 
add wave -noupdate /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/u_cu_plane_coupling/avst_source_startofpacket 

TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {23247083 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 270
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {106149629 ps}
