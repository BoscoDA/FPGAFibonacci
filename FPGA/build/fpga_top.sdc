# ====================================================================================
# Time Information
# ====================================================================================
    set_time_format -unit ns -decimal_places 3

# ====================================================================================
# clock generation
# ====================================================================================

    # create 20MHz clock
    create_clock -period "50.00 ns" -name clk_20m [get_ports {clk_osc_20_meg}]

    # create generated clocks based on PLLs
    derive_pll_clocks
    derive_clock_uncertainty

set_input_delay -clock {clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|pll1|clk[0] } 1 [get_ports {fpga_async_in_1_n}]
set_input_delay -clock {clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|pll1|clk[1] } 1 [get_ports {fpga_async_in_2}]
set_output_delay -clock {clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|pll1|clk[0] } 1 [get_ports {led_1_red_n led_1_grn_n}]
set_output_delay -clock {clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|pll1|clk[1] } 1 [get_ports {led_2_red_n led_2_grn_n}]
