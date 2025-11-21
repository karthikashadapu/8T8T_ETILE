# The GHRD create_ghrd_qsys.tcl will call each of those subsystem construct script
# automatically based on the corresponding parameter argument defined
# example command to execute this script file
#   qsys-script --script=construct_subsys_peripheral.tcl --cmd="set subsys_name qsys_periph"

source ./arguments_solver.tcl
source ./utils.tcl
  
package require -exact qsys 19.1

#set subsys_name subsys_ftile_25gbe_1588
set subsys_name subsys_test
create_system $subsys_name.qsys
#load_system $subsys_name.qsys

#add_component_param "alt_ehipc3_fm ftile_hip_testing
#                    IP_FILE_PATH ip/$subsys_name/ftile_hip.ip 
#                    {core_variant} {3}
#                    {number_of_channel} {0}
#                    {active_channel} {0}
#                    {ENABLE_PTP} {1}
#                    {EHIP_LOCATION} {EHIP0/2}
#                    {ENABLE_RSFEC} {1}
#                    {RSFEC_FIRST_LANE_SEL} {first_lane3}
#                    {RSFEC_CLOCKING_MODE} {ehip_common_clk}
#                    {ENHANCED_PTP_ACCURACY} {1}
#                    {ENABLE_ADME} {1}
#                    {ehip_rate_gui_sl_0} {25G}
#                    {ehip_mode_gui_sl_0} {MAC+PTP+PCS+RSFEC}
#                    {PHY_REFCLK_sl_0} {156.250000}
#                    {flow_control_gui_sl_0} {Yes}
#					{rx_bytes_to_remove} {Remove CRC bytes}
#                    {source_address_insertion_gui_sl_0} {1}
#                    "

#DONE#add_component_param "altera_iopll ftile_ptp_sampling_clk_iopll
#DONE#                    IP_FILE_PATH ip/$subsys_name/ftile_ptp_sampling_clk_iopll.ip 
#DONE#	gui_location_type {I/O Bank}
#DONE#	gui_reference_clock_frequency {100.0}
#DONE#	gui_use_coreclk {0}
#DONE#	gui_use_locked {1}
#DONE#	gui_operation_mode {direct}
#DONE#	gui_number_of_clocks {1}
#DONE#	gui_clock_name_string0 {outclk0}
#DONE#	gui_output_clock_frequency0 {114.285714}
#DONE#	gui_duty_cycle0 {50.0}
#DONE#	gui_output_clock_frequency_ps0 {10000.0}
#DONE#	gui_phase_shift0 {0.0}
#DONE#	gui_ps_units0 {ps}
#DONE#	hp_qsys_scripting_mode {1}
#DONE#	"

#DONE#  add_component_param "altera_iopll ftile_tod_sync_sampling_clk_iopll
#DONE#                      IP_FILE_PATH ip/$subsys_name/ftile_tod_sync_sampling_clk_iopll.ip 
#DONE#  	gui_location_type {I/O Bank}
#DONE#  	gui_reference_clock_frequency {156.25}
#DONE#  	gui_use_coreclk {1}
#DONE#  	gui_use_locked {1}
#DONE#  	gui_en_adv_params {1}
#DONE#  	gui_operation_mode {direct}
#DONE#  	gui_number_of_clocks {1}
#DONE#  	gui_clock_name_string0 {outclk0}
#DONE#  	gui_multiply_factor {64}
#DONE#  	gui_divide_factor_n {11}
#DONE#  	gui_divide_factor_c0 {6}
#DONE#  	gui_duty_cycle0 {50.0}
#DONE#  	gui_phase_shift0 {0.0}
#DONE#  	hp_qsys_scripting_mode {1}
#DONE#  	"

#DONE #     add_component_param "altera_iopll iopll_clk_avst_div2
#DONE #                         IP_FILE_PATH ip/$subsys_name/iopll_clk_avst_div2.ip 
#DONE #     	gui_location_type {Fabric-Feeding}
#DONE #     	gui_reference_clock_frequency {402.83203125}
#DONE #     	gui_use_coreclk {1}
#DONE #     	gui_use_locked {1}
#DONE #     	gui_en_adv_params {1}
#DONE #     	gui_operation_mode {direct}
#DONE #     	gui_number_of_clocks {1}
#DONE #     	gui_clock_name_string0 {outclk0}
#DONE #     	gui_multiply_factor {4}
#DONE #     	gui_divide_factor_n {2}
#DONE #     	gui_divide_factor_c0 {4}
#DONE #     	gui_duty_cycle0 {50.0}
#DONE #     	gui_phase_shift0 {0.0}
#DONE #     	hp_qsys_scripting_mode {1}
#DONE #     	gui_pll_bandwidth_preset {Medium}
#DONE #     	"

#DONE# add_component_param "altera_eth_1588_tod ftile_ptp_tx_tod
#DONE#                     IP_FILE_PATH ip/$subsys_name/ftile_ptp_tx_tod.ip 
#DONE# 	PERIOD_CLOCK_FREQUENCY {1}
#DONE# 	DEFAULT_NSEC_PERIOD {2}
#DONE# 	DEFAULT_NSEC_ADJPERIOD {0}
#DONE# 	DEFAULT_FNSEC_PERIOD {36700}
#DONE# 	DEFAULT_FNSEC_ADJPERIOD {0}
#DONE# 	ENABLE_PPS {0}
#DONE# "
#DONE# 
#DONE# add_component_param "altera_eth_1588_tod ftile_ptp_rx_tod
#DONE#                     IP_FILE_PATH ip/$subsys_name/ftile_ptp_rx_tod.ip 
#DONE# 	PERIOD_CLOCK_FREQUENCY {1}
#DONE# 	DEFAULT_NSEC_PERIOD {2}
#DONE# 	DEFAULT_NSEC_ADJPERIOD {0}
#DONE# 	DEFAULT_FNSEC_PERIOD {36700}
#DONE# 	DEFAULT_FNSEC_ADJPERIOD {0}
#DONE# 	ENABLE_PPS {0}
#DONE# "

add_component_param "altera_eth_1588_tod_synchronizer ftile_rx_tod_sync
                    IP_FILE_PATH ip/$subsys_name/ftile_rx_tod_sync.ip 
	TOD_MODE {1}
	SYNC_MODE {9}
	SAMPLE_SIZE {64}
"
load_instantiation ftile_rx_tod_sync
remove_instantiation_interface start_tod_sync
add_instantiation_interface start_tod_sync_wirelevel wirelevel INPUT
set_instantiation_interface_parameter_value start_tod_sync_wirelevel originalType {conduit}
add_instantiation_interface_port start_tod_sync_wirelevel start_tod_sync data 1 STD_LOGIC Input
remove_instantiation_interface tod_master_data
add_instantiation_interface tod_master_data_wirelevel wirelevel INPUT
set_instantiation_interface_parameter_value tod_master_data_wirelevel originalType {conduit}
add_instantiation_interface_port tod_master_data_wirelevel tod_master_data data 96 STD_LOGIC_VECTOR Input
save_instantiation

add_component_param "altera_eth_1588_tod_synchronizer ftile_tx_tod_sync
                    IP_FILE_PATH ip/$subsys_name/ftile_tx_tod_sync.ip 
	TOD_MODE {1}
	SYNC_MODE {9}
	SAMPLE_SIZE {64}
"
load_instantiation ftile_tx_tod_sync
remove_instantiation_interface start_tod_sync
add_instantiation_interface start_tod_sync_wirelevel wirelevel INPUT
set_instantiation_interface_parameter_value start_tod_sync_wirelevel originalType {conduit}
add_instantiation_interface_port start_tod_sync_wirelevel start_tod_sync data 1 STD_LOGIC Input
remove_instantiation_interface tod_master_data
add_instantiation_interface tod_master_data_wirelevel wirelevel INPUT
set_instantiation_interface_parameter_value tod_master_data_wirelevel originalType {conduit}
add_instantiation_interface_port tod_master_data_wirelevel tod_master_data data 96 STD_LOGIC_VECTOR Input
save_instantiation

add_component_param "altera_eth_1588_tod ftile_master_tod
                    IP_FILE_PATH ip/$subsys_name/ftile_master_tod.ip
                    PERIOD_CLOCK_FREQUENCY {1}
                    DEFAULT_NSEC_PERIOD {6}
                    DEFAULT_NSEC_ADJPERIOD {0}
                    DEFAULT_FNSEC_PERIOD {26214}
                    DEFAULT_FNSEC_ADJPERIOD {0}
					ENABLE_PPS {0}
                    "

# add wirelevel expressions
set_wirelevel_expression {ftile_rx_tod_sync.start_tod_sync[0]} {1'b1}
set_wirelevel_expression {ftile_rx_tod_sync.tod_master_data[95:0]} {ftile_master_tod.time_of_day_96b[95:0]}
set_wirelevel_expression {ftile_tx_tod_sync.start_tod_sync[0]} {1'b1}
set_wirelevel_expression {ftile_tx_tod_sync.tod_master_data[95:0]} {ftile_master_tod.time_of_day_96b[95:0]}

sync_sysinfo_parameters 
    
save_system ${subsys_name}.qsys
