onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {fpga top}
add wave -noupdate /test_bench_top/fpga_top_inst/clk_osc_20_meg
add wave -noupdate /test_bench_top/fpga_top_inst/fpga_async_in_1_n
add wave -noupdate /test_bench_top/fpga_top_inst/led_1_red_n
add wave -noupdate /test_bench_top/fpga_top_inst/led_1_grn_n
add wave -noupdate /test_bench_top/fpga_top_inst/fpga_async_in_2
add wave -noupdate -divider {clk rst mod}
add wave -noupdate /test_bench_top/fpga_top_inst/clk_rst_module_inst/clk_20m
add wave -noupdate /test_bench_top/fpga_top_inst/clk_rst_module_inst/clk_80m
add wave -noupdate /test_bench_top/fpga_top_inst/clk_rst_module_inst/rst_80m
add wave -noupdate /test_bench_top/fpga_top_inst/clk_rst_module_inst/rst_80m_n
add wave -noupdate /test_bench_top/fpga_top_inst/clk_rst_module_inst/clk_100m
add wave -noupdate /test_bench_top/fpga_top_inst/clk_rst_module_inst/rst_100m
add wave -noupdate /test_bench_top/fpga_top_inst/clk_rst_module_inst/rst_100m_n
add wave -noupdate /test_bench_top/fpga_top_inst/clk_rst_module_inst/pll_locked_debounced
add wave -noupdate -divider {clk domain 1}
add wave -noupdate /test_bench_top/fpga_top_inst/clk_domain_1_inst/clk
add wave -noupdate /test_bench_top/fpga_top_inst/clk_domain_1_inst/rst
add wave -noupdate -divider msh
add wave -noupdate /test_bench_top/fpga_top_inst/clk_domain_1_inst/timer_control.timer_enable
add wave -noupdate /test_bench_top/fpga_top_inst/clk_domain_1_inst/timer_enable_ms
add wave -noupdate /test_bench_top/fpga_top_inst/clk_domain_1_inst/timer_enable_msh
add wave -noupdate /test_bench_top/fpga_top_inst/clk_domain_1_inst/timer_control_int.timer_enable
add wave -noupdate -divider timer
add wave -noupdate /test_bench_top/fpga_top_inst/clk_domain_1_inst/timer_inst/clk
add wave -noupdate /test_bench_top/fpga_top_inst/clk_domain_1_inst/timer_inst/rst
add wave -noupdate /test_bench_top/fpga_top_inst/clk_domain_1_inst/timer_inst/timer_50us_pulse
add wave -noupdate /test_bench_top/fpga_top_inst/clk_domain_1_inst/timer_inst/timer_100us_pulse
add wave -noupdate /test_bench_top/fpga_top_inst/clk_domain_1_inst/timer_inst/timer_state_machine_start
add wave -noupdate /test_bench_top/fpga_top_inst/clk_domain_1_inst/timer_inst/counter
add wave -noupdate /test_bench_top/fpga_top_inst/clk_domain_1_inst/timer_inst/led_red
add wave -noupdate /test_bench_top/fpga_top_inst/clk_domain_1_inst/timer_inst/led_grn
add wave -noupdate /test_bench_top/fpga_top_inst/clk_domain_1_inst/timer_inst/timer_enable
add wave -noupdate /test_bench_top/fpga_top_inst/clk_domain_1_inst/timer_inst/timer
add wave -noupdate -divider {clk domain 2}
add wave -noupdate /test_bench_top/fpga_top_inst/clk_domain_2_inst/clk
add wave -noupdate /test_bench_top/fpga_top_inst/clk_domain_2_inst/rst
add wave -noupdate -divider {state machine}
add wave -noupdate /test_bench_top/fpga_top_inst/clk_domain_2_inst/state_machine_inst/clk
add wave -noupdate /test_bench_top/fpga_top_inst/clk_domain_2_inst/state_machine_inst/rst
add wave -noupdate /test_bench_top/fpga_top_inst/clk_domain_2_inst/state_machine_inst/enable
add wave -noupdate /test_bench_top/fpga_top_inst/clk_domain_2_inst/state_machine_inst/start
add wave -noupdate /test_bench_top/fpga_top_inst/clk_domain_2_inst/state_machine_inst/clk_en
add wave -noupdate /test_bench_top/fpga_top_inst/clk_domain_2_inst/state_machine_inst/fibonacci_num
add wave -noupdate /test_bench_top/fpga_top_inst/clk_domain_2_inst/state_machine_inst/data_valid
add wave -noupdate /test_bench_top/fpga_top_inst/clk_domain_2_inst/state_machine_inst/fib_it
add wave -noupdate /test_bench_top/fpga_top_inst/clk_domain_2_inst/state_machine_inst/fibonacci_state
add wave -noupdate /test_bench_top/fpga_top_inst/clk_domain_2_inst/state_machine_inst/led_grn
add wave -noupdate /test_bench_top/fpga_top_inst/clk_domain_2_inst/state_machine_inst/led_red
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 4} {618241311 ps} 0} {{Cursor 2} {296153846 ps} 0}
quietly wave cursor active 2
configure wave -namecolwidth 497
configure wave -valuecolwidth 47
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {1050 us}
