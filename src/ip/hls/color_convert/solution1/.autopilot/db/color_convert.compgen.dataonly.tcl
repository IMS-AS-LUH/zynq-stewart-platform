# This script segment is generated automatically by AutoPilot

set axilite_register_dict [dict create]
set port_control {
c1_c1 { 
	dir I
	width 10
	depth 1
	mode ap_none
	offset 16
	offset_end 23
}
c1_c2 { 
	dir I
	width 10
	depth 1
	mode ap_none
	offset 24
	offset_end 31
}
c1_c3 { 
	dir I
	width 10
	depth 1
	mode ap_none
	offset 32
	offset_end 39
}
c2_c1 { 
	dir I
	width 10
	depth 1
	mode ap_none
	offset 40
	offset_end 47
}
c2_c2 { 
	dir I
	width 10
	depth 1
	mode ap_none
	offset 48
	offset_end 55
}
c2_c3 { 
	dir I
	width 10
	depth 1
	mode ap_none
	offset 56
	offset_end 63
}
c3_c1 { 
	dir I
	width 10
	depth 1
	mode ap_none
	offset 64
	offset_end 71
}
c3_c2 { 
	dir I
	width 10
	depth 1
	mode ap_none
	offset 72
	offset_end 79
}
c3_c3 { 
	dir I
	width 10
	depth 1
	mode ap_none
	offset 80
	offset_end 87
}
bias_c1 { 
	dir I
	width 10
	depth 1
	mode ap_none
	offset 88
	offset_end 95
}
bias_c2 { 
	dir I
	width 10
	depth 1
	mode ap_none
	offset 96
	offset_end 103
}
bias_c3 { 
	dir I
	width 10
	depth 1
	mode ap_none
	offset 104
	offset_end 111
}
}
dict set axilite_register_dict control $port_control


