transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/Desktop/FPGA_ECG {D:/Desktop/FPGA_ECG/ziti.v}
vlog -vlog01compat -work work +incdir+D:/Desktop/FPGA_ECG {D:/Desktop/FPGA_ECG/wave.v}
vlog -vlog01compat -work work +incdir+D:/Desktop/FPGA_ECG {D:/Desktop/FPGA_ECG/TFT_test_pll.v}
vlog -vlog01compat -work work +incdir+D:/Desktop/FPGA_ECG {D:/Desktop/FPGA_ECG/sd_write.v}
vlog -vlog01compat -work work +incdir+D:/Desktop/FPGA_ECG {D:/Desktop/FPGA_ECG/sd_test.v}
vlog -vlog01compat -work work +incdir+D:/Desktop/FPGA_ECG {D:/Desktop/FPGA_ECG/sd_read.v}
vlog -vlog01compat -work work +incdir+D:/Desktop/FPGA_ECG {D:/Desktop/FPGA_ECG/sd_initial.v}
vlog -vlog01compat -work work +incdir+D:/Desktop/FPGA_ECG {D:/Desktop/FPGA_ECG/h_m_s.v}
vlog -vlog01compat -work work +incdir+D:/Desktop/FPGA_ECG {D:/Desktop/FPGA_ECG/fenpin.v}
vlog -vlog01compat -work work +incdir+D:/Desktop/FPGA_ECG {D:/Desktop/FPGA_ECG/display_ctrl.v}
vlog -vlog01compat -work work +incdir+D:/Desktop/FPGA_ECG {D:/Desktop/FPGA_ECG/ctrl_ADC_SD.v}
vlog -vlog01compat -work work +incdir+D:/Desktop/FPGA_ECG {D:/Desktop/FPGA_ECG/belldrive.v}
vlog -vlog01compat -work work +incdir+D:/Desktop/FPGA_ECG {D:/Desktop/FPGA_ECG/adc128s022.v}
vlog -vlog01compat -work work +incdir+D:/Desktop/FPGA_ECG {D:/Desktop/FPGA_ECG/FPGA_ECG.v}
vlog -vlog01compat -work work +incdir+D:/Desktop/FPGA_ECG {D:/Desktop/FPGA_ECG/TFT_CTRL.v}
vlog -vlog01compat -work work +incdir+D:/Desktop/FPGA_ECG {D:/Desktop/FPGA_ECG/uart_byte_tx.v}
vlog -vlog01compat -work work +incdir+D:/Desktop/FPGA_ECG/db {D:/Desktop/FPGA_ECG/db/tft_test_pll_altpll.v}

