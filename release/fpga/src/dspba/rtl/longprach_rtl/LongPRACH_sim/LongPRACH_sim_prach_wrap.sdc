create_clock -period 2.035 -name {clk} [get_ports {clk}]
create_clock -period 10.000 -name {bus_clk} [get_ports {bus_clk}]
set_clock_groups -asynchronous -group {clk} -group {bus_clk}
