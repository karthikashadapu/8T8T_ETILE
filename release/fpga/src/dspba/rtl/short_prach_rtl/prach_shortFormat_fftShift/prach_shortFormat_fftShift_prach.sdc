create_clock -period 2.035 -name {clk} [get_ports {clk}]
create_clock -period 10.000 -name {bus_clk} [get_ports {bus_clk}]
set_clock_groups -asynchronous -group {clk} -group {bus_clk}
# constraints from instance thebusFabric
set_data_delay -from [get_registers thebusFabric|mm_reg_8_x|*iclk_data*] -to [get_registers thebusFabric|mm_reg_8_x|*oclk_data*] 3.255; # ensure all data has arrived at oclk_data before control signal captures it.
set_data_delay -from [get_registers thebusFabric|mm_reg_9_x|*iclk_data*] -to [get_registers thebusFabric|mm_reg_9_x|*oclk_data*] 3.255; # ensure all data has arrived at oclk_data before control signal captures it.
set_data_delay -from [get_registers thebusFabric|mm_reg_10_x|*iclk_data*] -to [get_registers thebusFabric|mm_reg_10_x|*oclk_data*] 3.255; # ensure all data has arrived at oclk_data before control signal captures it.
set_data_delay -from [get_registers thebusFabric|mm_reg_11_x|*iclk_data*] -to [get_registers thebusFabric|mm_reg_11_x|*oclk_data*] 3.255; # ensure all data has arrived at oclk_data before control signal captures it.
set_data_delay -from [get_registers thebusFabric|mm_reg_12_x|*iclk_data*] -to [get_registers thebusFabric|mm_reg_12_x|*oclk_data*] 3.255; # ensure all data has arrived at oclk_data before control signal captures it.
set_data_delay -from [get_registers thebusFabric|mm_reg_13_x|*iclk_data*] -to [get_registers thebusFabric|mm_reg_13_x|*oclk_data*] 3.255; # ensure all data has arrived at oclk_data before control signal captures it.
set_data_delay -from [get_registers thebusFabric|mm_reg_14_x|*iclk_data*] -to [get_registers thebusFabric|mm_reg_14_x|*oclk_data*] 3.255; # ensure all data has arrived at oclk_data before control signal captures it.
