transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Recep\ Sivri/Desktop/Project03_121044038_Recep_Sivri_TestBench {C:/Users/Recep Sivri/Desktop/Project03_121044038_Recep_Sivri_TestBench/AluModule.v}
vlog -vlog01compat -work work +incdir+C:/Users/Recep\ Sivri/Desktop/Project03_121044038_Recep_Sivri_TestBench {C:/Users/Recep Sivri/Desktop/Project03_121044038_Recep_Sivri_TestBench/FetchInstructionModule.v}
vlog -vlog01compat -work work +incdir+C:/Users/Recep\ Sivri/Desktop/Project03_121044038_Recep_Sivri_TestBench {C:/Users/Recep Sivri/Desktop/Project03_121044038_Recep_Sivri_TestBench/combineMemoryBlocks.v}
vlog -vlog01compat -work work +incdir+C:/Users/Recep\ Sivri/Desktop/Project03_121044038_Recep_Sivri_TestBench {C:/Users/Recep Sivri/Desktop/Project03_121044038_Recep_Sivri_TestBench/mips_core_tester.v}

