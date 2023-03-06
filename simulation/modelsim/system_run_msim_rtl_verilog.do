transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/elec374/system-design/System-Design {C:/altera/13.0sp1/elec374/system-design/System-Design/Register.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/elec374/system-design/System-Design {C:/altera/13.0sp1/elec374/system-design/System-Design/busMUX.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/elec374/system-design/System-Design {C:/altera/13.0sp1/elec374/system-design/System-Design/busEncoder.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/elec374/system-design/System-Design {C:/altera/13.0sp1/elec374/system-design/System-Design/adder.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/elec374/system-design/System-Design {C:/altera/13.0sp1/elec374/system-design/System-Design/log_and_32bit.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/elec374/system-design/System-Design {C:/altera/13.0sp1/elec374/system-design/System-Design/log_or_32bit.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/elec374/system-design/System-Design {C:/altera/13.0sp1/elec374/system-design/System-Design/shift_left.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/elec374/system-design/System-Design {C:/altera/13.0sp1/elec374/system-design/System-Design/shift_right.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/elec374/system-design/System-Design {C:/altera/13.0sp1/elec374/system-design/System-Design/rotate_right.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/elec374/system-design/System-Design {C:/altera/13.0sp1/elec374/system-design/System-Design/rotate_left.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/elec374/system-design/System-Design {C:/altera/13.0sp1/elec374/system-design/System-Design/negate.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/elec374/system-design/System-Design {C:/altera/13.0sp1/elec374/system-design/System-Design/not_32.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/elec374/system-design/System-Design {C:/altera/13.0sp1/elec374/system-design/System-Design/multiplier.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/elec374/system-design/System-Design {C:/altera/13.0sp1/elec374/system-design/System-Design/division.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/elec374/system-design/System-Design {C:/altera/13.0sp1/elec374/system-design/System-Design/datapath.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/elec374/system-design/System-Design {C:/altera/13.0sp1/elec374/system-design/System-Design/ALU.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/elec374/system-design/System-Design {C:/altera/13.0sp1/elec374/system-design/System-Design/sub.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/elec374/system-design/System-Design {C:/altera/13.0sp1/elec374/system-design/System-Design/MDR.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/elec374/system-design/System-Design {C:/altera/13.0sp1/elec374/system-design/System-Design/shift_right_arithmetic.v}

vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/elec374/system-design/System-Design {C:/altera/13.0sp1/elec374/system-design/System-Design/datapath_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneiii_ver -L rtl_work -L work -voptargs="+acc"  datapath_tb

add wave *
view structure
view signals
run 1000 ns
