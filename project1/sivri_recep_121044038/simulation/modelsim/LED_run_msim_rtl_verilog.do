transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Recep\ Sivri/Desktop/DEMO {C:/Users/Recep Sivri/Desktop/DEMO/mux_base.v}
vlog -vlog01compat -work work +incdir+C:/Users/Recep\ Sivri/Desktop/DEMO {C:/Users/Recep Sivri/Desktop/DEMO/mux_full.v}
vlog -vlog01compat -work work +incdir+C:/Users/Recep\ Sivri/Desktop/DEMO {C:/Users/Recep Sivri/Desktop/DEMO/andFourBits.v}
vlog -vlog01compat -work work +incdir+C:/Users/Recep\ Sivri/Desktop/DEMO {C:/Users/Recep Sivri/Desktop/DEMO/xorFourBits.v}
vlog -vlog01compat -work work +incdir+C:/Users/Recep\ Sivri/Desktop/DEMO {C:/Users/Recep Sivri/Desktop/DEMO/fullAdder.v}
vlog -vlog01compat -work work +incdir+C:/Users/Recep\ Sivri/Desktop/DEMO {C:/Users/Recep Sivri/Desktop/DEMO/fullAdder_4bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/Recep\ Sivri/Desktop/DEMO {C:/Users/Recep Sivri/Desktop/DEMO/substruct_4bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/Recep\ Sivri/Desktop/DEMO {C:/Users/Recep Sivri/Desktop/DEMO/main.v}

