transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/elec374/system-design/System-Design {C:/altera/13.0sp1/elec374/system-design/System-Design/bidirectionalBus.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/elec374/system-design/System-Design {C:/altera/13.0sp1/elec374/system-design/System-Design/busMUX.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/elec374/system-design/System-Design {C:/altera/13.0sp1/elec374/system-design/System-Design/busEncoder.v}

vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/elec374/system-design/System-Design {C:/altera/13.0sp1/elec374/system-design/System-Design/bidirectionalBustb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneiii_ver -L rtl_work -L work -voptargs="+acc"  bidirectionalBustb

add wave *
view structure
view signals
run 1000 ns
