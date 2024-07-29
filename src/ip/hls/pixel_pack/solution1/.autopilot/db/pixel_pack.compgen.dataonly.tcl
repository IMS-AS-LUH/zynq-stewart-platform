# This script segment is generated automatically by AutoPilot

set axilite_register_dict [dict create]
set port_control {
mode { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 16
	offset_end 23
}
alpha { 
	dir I
	width 8
	depth 1
	mode ap_none
	offset 24
	offset_end 31
}
}
dict set axilite_register_dict control $port_control


