
package require -exact qsys 23.3

set ip_name "sysid"
set param_name "id"
load_component $ip_name
set sysid_value [get_component_parameter_value id ]
set incremented_sysid_value [expr {$sysid_value + 1}]
send_message Info "current sysid value is $incremented_sysid_value"
set_component_parameter_value $param_name $incremented_sysid_value
save_component





