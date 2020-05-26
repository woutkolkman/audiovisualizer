set_global_assignment -entity "new_ip" -library "lib_new_ip" -name IP_TOOL_NAME "Qsys"
set_global_assignment -entity "new_ip" -library "lib_new_ip" -name IP_TOOL_VERSION "16.1"
set_global_assignment -entity "new_ip" -library "lib_new_ip" -name IP_TOOL_ENV "Qsys"
set_global_assignment -library "lib_new_ip" -name SPD_FILE [file join $::quartus(sip_path) "../new_ip.spd"]
set_global_assignment -library "lib_new_ip" -name MISC_FILE [file join $::quartus(sip_path) "../new_ip.qsys"]

set_global_assignment -library "lib_new_ip" -name MISC_FILE [file join $::quartus(sip_path) "new_ip.vhd"]
