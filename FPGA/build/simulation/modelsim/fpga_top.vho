-- Copyright (C) 2017  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Intel and sold by Intel or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 17.0.2 Build 602 07/19/2017 SJ Standard Edition"

-- DATE "08/09/2022 11:41:39"

-- 
-- Device: Altera EP4CE6F17I8L Package FBGA256
-- 

-- 
-- This VHDL file should be used for ModelSim (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	fpga_top IS
    PORT (
	clk_osc_20_meg : IN std_logic;
	fpga_async_in_1_n : IN std_logic;
	fpga_async_in_2 : IN std_logic;
	led_1_red_n : BUFFER std_logic;
	led_1_grn_n : BUFFER std_logic;
	led_2_red_n : BUFFER std_logic;
	led_2_grn_n : BUFFER std_logic
	);
END fpga_top;

-- Design Ports Information
-- led_1_red_n	=>  Location: PIN_K6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led_1_grn_n	=>  Location: PIN_L6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led_2_red_n	=>  Location: PIN_D1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led_2_grn_n	=>  Location: PIN_C2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk_osc_20_meg	=>  Location: PIN_E1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fpga_async_in_1_n	=>  Location: PIN_L2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fpga_async_in_2	=>  Location: PIN_D6,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF fpga_top IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk_osc_20_meg : std_logic;
SIGNAL ww_fpga_async_in_1_n : std_logic;
SIGNAL ww_fpga_async_in_2 : std_logic;
SIGNAL ww_led_1_red_n : std_logic;
SIGNAL ww_led_1_grn_n : std_logic;
SIGNAL ww_led_2_red_n : std_logic;
SIGNAL ww_led_2_grn_n : std_logic;
SIGNAL \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|pll1_INCLK_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|pll1_CLK_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk_osc_20_meg~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~padout\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~padout\ : std_logic;
SIGNAL \~ALTERA_DCLK~~padout\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_DATA0~~padout\ : std_logic;
SIGNAL \~ALTERA_nCEO~~padout\ : std_logic;
SIGNAL \~ALTERA_DCLK~~obuf_o\ : std_logic;
SIGNAL \~ALTERA_nCEO~~obuf_o\ : std_logic;
SIGNAL \clk_osc_20_meg~input_o\ : std_logic;
SIGNAL \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_fbout\ : std_logic;
SIGNAL \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\ : std_logic;
SIGNAL \clk_domain_1_inst|timer_inst|timer[0]~13_combout\ : std_logic;
SIGNAL \clk_rst_module_inst|rst_80m_n_ms~feeder_combout\ : std_logic;
SIGNAL \clk_osc_20_meg~inputclkctrl_outclk\ : std_logic;
SIGNAL \clk_rst_module_inst|pll_locked_ms~feeder_combout\ : std_logic;
SIGNAL \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_locked\ : std_logic;
SIGNAL \clk_rst_module_inst|pll_locked_ms~q\ : std_logic;
SIGNAL \clk_rst_module_inst|pll_locked_msh~feeder_combout\ : std_logic;
SIGNAL \clk_rst_module_inst|pll_locked_msh~q\ : std_logic;
SIGNAL \clk_rst_module_inst|pll_locked_r1~feeder_combout\ : std_logic;
SIGNAL \clk_rst_module_inst|pll_locked_r1~q\ : std_logic;
SIGNAL \clk_rst_module_inst|lock_cnt[0]~12_combout\ : std_logic;
SIGNAL \clk_rst_module_inst|Equal0~0_combout\ : std_logic;
SIGNAL \clk_rst_module_inst|Equal0~1_combout\ : std_logic;
SIGNAL \clk_rst_module_inst|lock_cnt[9]~14_combout\ : std_logic;
SIGNAL \clk_rst_module_inst|lock_cnt[0]~13\ : std_logic;
SIGNAL \clk_rst_module_inst|lock_cnt[1]~15_combout\ : std_logic;
SIGNAL \clk_rst_module_inst|lock_cnt[1]~16\ : std_logic;
SIGNAL \clk_rst_module_inst|lock_cnt[2]~17_combout\ : std_logic;
SIGNAL \clk_rst_module_inst|lock_cnt[2]~18\ : std_logic;
SIGNAL \clk_rst_module_inst|lock_cnt[3]~19_combout\ : std_logic;
SIGNAL \clk_rst_module_inst|lock_cnt[3]~20\ : std_logic;
SIGNAL \clk_rst_module_inst|lock_cnt[4]~21_combout\ : std_logic;
SIGNAL \clk_rst_module_inst|lock_cnt[4]~22\ : std_logic;
SIGNAL \clk_rst_module_inst|lock_cnt[5]~23_combout\ : std_logic;
SIGNAL \clk_rst_module_inst|lock_cnt[5]~24\ : std_logic;
SIGNAL \clk_rst_module_inst|lock_cnt[6]~25_combout\ : std_logic;
SIGNAL \clk_rst_module_inst|lock_cnt[6]~26\ : std_logic;
SIGNAL \clk_rst_module_inst|lock_cnt[7]~27_combout\ : std_logic;
SIGNAL \clk_rst_module_inst|lock_cnt[7]~28\ : std_logic;
SIGNAL \clk_rst_module_inst|lock_cnt[8]~29_combout\ : std_logic;
SIGNAL \clk_rst_module_inst|lock_cnt[8]~30\ : std_logic;
SIGNAL \clk_rst_module_inst|lock_cnt[9]~31_combout\ : std_logic;
SIGNAL \clk_rst_module_inst|lock_cnt[9]~32\ : std_logic;
SIGNAL \clk_rst_module_inst|lock_cnt[10]~33_combout\ : std_logic;
SIGNAL \clk_rst_module_inst|lock_cnt[10]~34\ : std_logic;
SIGNAL \clk_rst_module_inst|lock_cnt[11]~35_combout\ : std_logic;
SIGNAL \clk_rst_module_inst|Equal0~2_combout\ : std_logic;
SIGNAL \clk_rst_module_inst|pll_locked_debounced~0_combout\ : std_logic;
SIGNAL \clk_rst_module_inst|pll_locked_debounced~1_combout\ : std_logic;
SIGNAL \clk_rst_module_inst|pll_locked_debounced~q\ : std_logic;
SIGNAL \clk_rst_module_inst|rst_80m_n_ms~q\ : std_logic;
SIGNAL \clk_rst_module_inst|rst_80m_n~feeder_combout\ : std_logic;
SIGNAL \clk_rst_module_inst|rst_80m_n~q\ : std_logic;
SIGNAL \clk_domain_1_inst|timer_inst|timer[3]~20\ : std_logic;
SIGNAL \clk_domain_1_inst|timer_inst|timer[4]~21_combout\ : std_logic;
SIGNAL \clk_domain_1_inst|timer_inst|timer[4]~22\ : std_logic;
SIGNAL \clk_domain_1_inst|timer_inst|timer[5]~23_combout\ : std_logic;
SIGNAL \clk_domain_1_inst|timer_inst|timer[5]~24\ : std_logic;
SIGNAL \clk_domain_1_inst|timer_inst|timer[6]~25_combout\ : std_logic;
SIGNAL \clk_domain_1_inst|timer_inst|timer[6]~26\ : std_logic;
SIGNAL \clk_domain_1_inst|timer_inst|timer[7]~27_combout\ : std_logic;
SIGNAL \clk_domain_1_inst|timer_inst|timer[7]~28\ : std_logic;
SIGNAL \clk_domain_1_inst|timer_inst|timer[8]~29_combout\ : std_logic;
SIGNAL \clk_domain_1_inst|timer_inst|Equal1~1_combout\ : std_logic;
SIGNAL \clk_domain_1_inst|timer_inst|timer[8]~30\ : std_logic;
SIGNAL \clk_domain_1_inst|timer_inst|timer[9]~31_combout\ : std_logic;
SIGNAL \clk_domain_1_inst|timer_inst|timer[9]~32\ : std_logic;
SIGNAL \clk_domain_1_inst|timer_inst|timer[10]~33_combout\ : std_logic;
SIGNAL \clk_domain_1_inst|timer_inst|timer[10]~34\ : std_logic;
SIGNAL \clk_domain_1_inst|timer_inst|timer[11]~35_combout\ : std_logic;
SIGNAL \clk_domain_1_inst|timer_inst|timer[11]~36\ : std_logic;
SIGNAL \clk_domain_1_inst|timer_inst|timer[12]~37_combout\ : std_logic;
SIGNAL \clk_domain_1_inst|timer_inst|Equal1~2_combout\ : std_logic;
SIGNAL \clk_domain_1_inst|timer_inst|Equal1~3_combout\ : std_logic;
SIGNAL \fpga_async_in_1_n~input_o\ : std_logic;
SIGNAL \clk_domain_1_inst|timer_enable_ms~0_combout\ : std_logic;
SIGNAL \clk_domain_1_inst|timer_enable_ms~q\ : std_logic;
SIGNAL \clk_domain_1_inst|timer_enable_msh~feeder_combout\ : std_logic;
SIGNAL \clk_domain_1_inst|timer_enable_msh~q\ : std_logic;
SIGNAL \clk_domain_1_inst|timer_control_int.timer_enable~feeder_combout\ : std_logic;
SIGNAL \clk_domain_1_inst|timer_control_int.timer_enable~q\ : std_logic;
SIGNAL \clk_domain_1_inst|timer_inst|timer[11]~39_combout\ : std_logic;
SIGNAL \clk_domain_1_inst|timer_inst|timer[0]~14\ : std_logic;
SIGNAL \clk_domain_1_inst|timer_inst|timer[1]~15_combout\ : std_logic;
SIGNAL \clk_domain_1_inst|timer_inst|timer[1]~16\ : std_logic;
SIGNAL \clk_domain_1_inst|timer_inst|timer[2]~17_combout\ : std_logic;
SIGNAL \clk_domain_1_inst|timer_inst|timer[2]~18\ : std_logic;
SIGNAL \clk_domain_1_inst|timer_inst|timer[3]~19_combout\ : std_logic;
SIGNAL \clk_domain_1_inst|timer_inst|Equal1~0_combout\ : std_logic;
SIGNAL \clk_domain_1_inst|timer_inst|led_red~2_combout\ : std_logic;
SIGNAL \clk_domain_1_inst|timer_inst|led_red~0_combout\ : std_logic;
SIGNAL \clk_domain_1_inst|timer_inst|led_red~1_combout\ : std_logic;
SIGNAL \clk_domain_1_inst|timer_inst|led_red~3_combout\ : std_logic;
SIGNAL \clk_domain_1_inst|timer_inst|led_red~q\ : std_logic;
SIGNAL \clk_domain_1_inst|timer_inst|led_grn~q\ : std_logic;
SIGNAL \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\ : std_logic;
SIGNAL \fpga_async_in_2~input_o\ : std_logic;
SIGNAL \clk_rst_module_inst|rst_100m_n_ms~feeder_combout\ : std_logic;
SIGNAL \clk_rst_module_inst|rst_100m_n_ms~q\ : std_logic;
SIGNAL \clk_rst_module_inst|rst_100m_n~feeder_combout\ : std_logic;
SIGNAL \clk_rst_module_inst|rst_100m_n~q\ : std_logic;
SIGNAL \clk_domain_2_inst|enable_ms~q\ : std_logic;
SIGNAL \clk_domain_2_inst|enable_msh~q\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_control_int.enable~q\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_inst|enable_r1~feeder_combout\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_inst|enable_r1~q\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_inst|enable_edge_detect_proc~1_combout\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_inst|en_falling~q\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_inst|enable_edge_detect_proc~0_combout\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_inst|en_rising~q\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_inst|enable_int~0_combout\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_inst|enable_int~q\ : std_logic;
SIGNAL \clk_domain_1_inst|timer_inst|state_machine_counter~0_combout\ : std_logic;
SIGNAL \clk_domain_1_inst|timer_inst|state_machine_counter~1_combout\ : std_logic;
SIGNAL \clk_domain_1_inst|timer_inst|timer_state_machine_start~0_combout\ : std_logic;
SIGNAL \clk_domain_1_inst|timer_inst|timer_state_machine_start~feeder_combout\ : std_logic;
SIGNAL \clk_domain_1_inst|timer_inst|timer_state_machine_start~q\ : std_logic;
SIGNAL \clk_domain_2_inst|start_ms~q\ : std_logic;
SIGNAL \clk_domain_2_inst|start_msh~feeder_combout\ : std_logic;
SIGNAL \clk_domain_2_inst|start_msh~q\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_control_int.start~q\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_inst|counter[0]~10_combout\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_inst|counter[0]~18_combout\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_inst|counter[0]~11\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_inst|counter[1]~12_combout\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_inst|counter[1]~13\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_inst|counter[2]~14_combout\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_inst|counter[2]~15\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_inst|counter[3]~16_combout\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_inst|Equal0~0_combout\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_inst|counter[3]~17\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_inst|counter[4]~19_combout\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_inst|counter[4]~20\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_inst|counter[5]~21_combout\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_inst|counter[5]~22\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_inst|counter[6]~23_combout\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_inst|counter[6]~24\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_inst|counter[7]~25_combout\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_inst|counter[7]~26\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_inst|counter[8]~27_combout\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_inst|counter[8]~28\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_inst|counter[9]~29_combout\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_inst|Equal0~1_combout\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_inst|Equal0~2_combout\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_inst|clk_en~0_combout\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_inst|clk_en~q\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_inst|Selector22~1_combout\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_inst|Selector1~0_combout\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_inst|fibonacci_state.end_st~2_combout\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_inst|fibonacci_state.calculate_st~4_combout\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_inst|fibonacci_state.calculate_st~2_combout\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_inst|fibonacci_state.calculate_st~3_combout\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_inst|fibonacci_state.calculate_st~5_combout\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_inst|fibonacci_state.end_st~q\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_inst|fibonacci_num~0_combout\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_inst|state_machine_proc~0_combout\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_inst|Selector3~0_combout\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_inst|Selector2~0_combout\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_inst|Selector2~1_combout\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_inst|Selector1~1_combout\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_inst|Selector1~2_combout\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_inst|Add2~0_combout\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_inst|Selector0~3_combout\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_inst|Selector0~2_combout\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_inst|LessThan0~0_combout\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_inst|fibonacci_state.calculate_st~7_combout\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_inst|fibonacci_state.calculate_st~q\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_inst|fibonacci_state.calculate_st~6_combout\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_inst|Selector22~2_combout\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_inst|fibonacci_state.loop_st~q\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_inst|Selector20~0_combout\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_inst|Selector20~1_combout\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_inst|Selector20~2_combout\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_inst|Selector20~3_combout\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_inst|fibonacci_state.idle_st~q\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_inst|Selector22~0_combout\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_inst|led_red~q\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_inst|led_grn~q\ : std_logic;
SIGNAL \clk_domain_1_inst|timer_inst|timer\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \clk_domain_1_inst|timer_inst|state_machine_counter\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \clk_rst_module_inst|lock_cnt\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \clk_domain_2_inst|state_machine_inst|counter\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \clk_domain_2_inst|state_machine_inst|fib_it\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk_rst_module_inst|ALT_INV_pll_locked_r1~q\ : std_logic;
SIGNAL \clk_rst_module_inst|ALT_INV_rst_100m_n~q\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_inst|ALT_INV_Selector22~0_combout\ : std_logic;
SIGNAL \clk_domain_2_inst|state_machine_inst|ALT_INV_enable_int~q\ : std_logic;
SIGNAL \clk_domain_1_inst|timer_inst|ALT_INV_led_grn~q\ : std_logic;
SIGNAL \clk_domain_1_inst|timer_inst|ALT_INV_led_red~q\ : std_logic;

BEGIN

ww_clk_osc_20_meg <= clk_osc_20_meg;
ww_fpga_async_in_1_n <= fpga_async_in_1_n;
ww_fpga_async_in_2 <= fpga_async_in_2;
led_1_red_n <= ww_led_1_red_n;
led_1_grn_n <= ww_led_1_grn_n;
led_2_red_n <= ww_led_2_red_n;
led_2_grn_n <= ww_led_2_grn_n;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|pll1_INCLK_bus\ <= (gnd & \clk_osc_20_meg~input_o\);

\clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk\(0) <= \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|pll1_CLK_bus\(0);
\clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk\(1) <= \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|pll1_CLK_bus\(1);
\clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk\(2) <= \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|pll1_CLK_bus\(2);
\clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk\(3) <= \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|pll1_CLK_bus\(3);
\clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk\(4) <= \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|pll1_CLK_bus\(4);

\clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk\(0));

\clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk\(1));

\clk_osc_20_meg~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk_osc_20_meg~input_o\);
\clk_rst_module_inst|ALT_INV_pll_locked_r1~q\ <= NOT \clk_rst_module_inst|pll_locked_r1~q\;
\clk_rst_module_inst|ALT_INV_rst_100m_n~q\ <= NOT \clk_rst_module_inst|rst_100m_n~q\;
\clk_domain_2_inst|state_machine_inst|ALT_INV_Selector22~0_combout\ <= NOT \clk_domain_2_inst|state_machine_inst|Selector22~0_combout\;
\clk_domain_2_inst|state_machine_inst|ALT_INV_enable_int~q\ <= NOT \clk_domain_2_inst|state_machine_inst|enable_int~q\;
\clk_domain_1_inst|timer_inst|ALT_INV_led_grn~q\ <= NOT \clk_domain_1_inst|timer_inst|led_grn~q\;
\clk_domain_1_inst|timer_inst|ALT_INV_led_red~q\ <= NOT \clk_domain_1_inst|timer_inst|led_red~q\;

-- Location: IOOBUF_X0_Y9_N2
\led_1_red_n~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \clk_domain_1_inst|timer_inst|ALT_INV_led_red~q\,
	devoe => ww_devoe,
	o => ww_led_1_red_n);

-- Location: IOOBUF_X0_Y9_N9
\led_1_grn_n~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \clk_domain_1_inst|timer_inst|ALT_INV_led_grn~q\,
	devoe => ww_devoe,
	o => ww_led_1_grn_n);

-- Location: IOOBUF_X0_Y21_N23
\led_2_red_n~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \clk_domain_2_inst|state_machine_inst|led_red~q\,
	devoe => ww_devoe,
	o => ww_led_2_red_n);

-- Location: IOOBUF_X0_Y22_N16
\led_2_grn_n~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \clk_domain_2_inst|state_machine_inst|led_grn~q\,
	devoe => ww_devoe,
	o => ww_led_2_grn_n);

-- Location: IOIBUF_X0_Y11_N8
\clk_osc_20_meg~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk_osc_20_meg,
	o => \clk_osc_20_meg~input_o\);

-- Location: PLL_1
\clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|pll1\ : cycloneive_pll
-- pragma translate_off
GENERIC MAP (
	auto_settings => "false",
	bandwidth_type => "medium",
	c0_high => 3,
	c0_initial => 1,
	c0_low => 2,
	c0_mode => "odd",
	c0_ph => 0,
	c1_high => 2,
	c1_initial => 1,
	c1_low => 2,
	c1_mode => "even",
	c1_ph => 0,
	c1_use_casc_in => "off",
	c2_high => 0,
	c2_initial => 0,
	c2_low => 0,
	c2_mode => "bypass",
	c2_ph => 0,
	c2_use_casc_in => "off",
	c3_high => 0,
	c3_initial => 0,
	c3_low => 0,
	c3_mode => "bypass",
	c3_ph => 0,
	c3_use_casc_in => "off",
	c4_high => 0,
	c4_initial => 0,
	c4_low => 0,
	c4_mode => "bypass",
	c4_ph => 0,
	c4_use_casc_in => "off",
	charge_pump_current_bits => 1,
	clk0_counter => "c0",
	clk0_divide_by => 1,
	clk0_duty_cycle => 50,
	clk0_multiply_by => 4,
	clk0_phase_shift => "0",
	clk1_counter => "c1",
	clk1_divide_by => 1,
	clk1_duty_cycle => 50,
	clk1_multiply_by => 5,
	clk1_phase_shift => "0",
	clk2_counter => "unused",
	clk2_divide_by => 0,
	clk2_duty_cycle => 50,
	clk2_multiply_by => 0,
	clk2_phase_shift => "0",
	clk3_counter => "unused",
	clk3_divide_by => 0,
	clk3_duty_cycle => 50,
	clk3_multiply_by => 0,
	clk3_phase_shift => "0",
	clk4_counter => "unused",
	clk4_divide_by => 0,
	clk4_duty_cycle => 50,
	clk4_multiply_by => 0,
	clk4_phase_shift => "0",
	compensate_clock => "clock0",
	inclk0_input_frequency => 50000,
	inclk1_input_frequency => 0,
	loop_filter_c_bits => 0,
	loop_filter_r_bits => 24,
	m => 20,
	m_initial => 1,
	m_ph => 0,
	n => 1,
	operation_mode => "normal",
	pfd_max => 200000,
	pfd_min => 3076,
	self_reset_on_loss_lock => "off",
	simulation_type => "timing",
	switch_over_type => "auto",
	vco_center => 1538,
	vco_divide_by => 0,
	vco_frequency_control => "auto",
	vco_max => 3333,
	vco_min => 1538,
	vco_multiply_by => 0,
	vco_phase_shift_step => 312,
	vco_post_scale => 2)
-- pragma translate_on
PORT MAP (
	fbin => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_fbout\,
	inclk => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|pll1_INCLK_bus\,
	locked => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_locked\,
	fbout => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_fbout\,
	clk => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|pll1_CLK_bus\);

-- Location: CLKCTRL_G3
\clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\);

-- Location: LCCOMB_X2_Y9_N4
\clk_domain_1_inst|timer_inst|timer[0]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_1_inst|timer_inst|timer[0]~13_combout\ = \clk_domain_1_inst|timer_inst|timer\(0) $ (VCC)
-- \clk_domain_1_inst|timer_inst|timer[0]~14\ = CARRY(\clk_domain_1_inst|timer_inst|timer\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \clk_domain_1_inst|timer_inst|timer\(0),
	datad => VCC,
	combout => \clk_domain_1_inst|timer_inst|timer[0]~13_combout\,
	cout => \clk_domain_1_inst|timer_inst|timer[0]~14\);

-- Location: LCCOMB_X1_Y9_N24
\clk_rst_module_inst|rst_80m_n_ms~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_rst_module_inst|rst_80m_n_ms~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \clk_rst_module_inst|rst_80m_n_ms~feeder_combout\);

-- Location: CLKCTRL_G2
\clk_osc_20_meg~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk_osc_20_meg~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk_osc_20_meg~inputclkctrl_outclk\);

-- Location: LCCOMB_X4_Y17_N16
\clk_rst_module_inst|pll_locked_ms~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_rst_module_inst|pll_locked_ms~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \clk_rst_module_inst|pll_locked_ms~feeder_combout\);

-- Location: FF_X4_Y17_N17
\clk_rst_module_inst|pll_locked_ms\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_osc_20_meg~inputclkctrl_outclk\,
	d => \clk_rst_module_inst|pll_locked_ms~feeder_combout\,
	clrn => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_locked\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_rst_module_inst|pll_locked_ms~q\);

-- Location: LCCOMB_X4_Y17_N18
\clk_rst_module_inst|pll_locked_msh~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_rst_module_inst|pll_locked_msh~feeder_combout\ = \clk_rst_module_inst|pll_locked_ms~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \clk_rst_module_inst|pll_locked_ms~q\,
	combout => \clk_rst_module_inst|pll_locked_msh~feeder_combout\);

-- Location: FF_X4_Y17_N19
\clk_rst_module_inst|pll_locked_msh\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_osc_20_meg~inputclkctrl_outclk\,
	d => \clk_rst_module_inst|pll_locked_msh~feeder_combout\,
	clrn => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_locked\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_rst_module_inst|pll_locked_msh~q\);

-- Location: LCCOMB_X4_Y17_N26
\clk_rst_module_inst|pll_locked_r1~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_rst_module_inst|pll_locked_r1~feeder_combout\ = \clk_rst_module_inst|pll_locked_msh~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \clk_rst_module_inst|pll_locked_msh~q\,
	combout => \clk_rst_module_inst|pll_locked_r1~feeder_combout\);

-- Location: FF_X4_Y17_N27
\clk_rst_module_inst|pll_locked_r1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_osc_20_meg~inputclkctrl_outclk\,
	d => \clk_rst_module_inst|pll_locked_r1~feeder_combout\,
	clrn => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_locked\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_rst_module_inst|pll_locked_r1~q\);

-- Location: LCCOMB_X3_Y17_N0
\clk_rst_module_inst|lock_cnt[0]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_rst_module_inst|lock_cnt[0]~12_combout\ = \clk_rst_module_inst|lock_cnt\(0) $ (VCC)
-- \clk_rst_module_inst|lock_cnt[0]~13\ = CARRY(\clk_rst_module_inst|lock_cnt\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \clk_rst_module_inst|lock_cnt\(0),
	datad => VCC,
	combout => \clk_rst_module_inst|lock_cnt[0]~12_combout\,
	cout => \clk_rst_module_inst|lock_cnt[0]~13\);

-- Location: LCCOMB_X3_Y17_N24
\clk_rst_module_inst|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_rst_module_inst|Equal0~0_combout\ = (!\clk_rst_module_inst|lock_cnt\(3) & (!\clk_rst_module_inst|lock_cnt\(1) & (!\clk_rst_module_inst|lock_cnt\(2) & !\clk_rst_module_inst|lock_cnt\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_rst_module_inst|lock_cnt\(3),
	datab => \clk_rst_module_inst|lock_cnt\(1),
	datac => \clk_rst_module_inst|lock_cnt\(2),
	datad => \clk_rst_module_inst|lock_cnt\(0),
	combout => \clk_rst_module_inst|Equal0~0_combout\);

-- Location: LCCOMB_X3_Y17_N30
\clk_rst_module_inst|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_rst_module_inst|Equal0~1_combout\ = (!\clk_rst_module_inst|lock_cnt\(6) & (!\clk_rst_module_inst|lock_cnt\(4) & (\clk_rst_module_inst|lock_cnt\(7) & \clk_rst_module_inst|lock_cnt\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_rst_module_inst|lock_cnt\(6),
	datab => \clk_rst_module_inst|lock_cnt\(4),
	datac => \clk_rst_module_inst|lock_cnt\(7),
	datad => \clk_rst_module_inst|lock_cnt\(5),
	combout => \clk_rst_module_inst|Equal0~1_combout\);

-- Location: LCCOMB_X3_Y17_N26
\clk_rst_module_inst|lock_cnt[9]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_rst_module_inst|lock_cnt[9]~14_combout\ = (((!\clk_rst_module_inst|pll_locked_r1~q\) # (!\clk_rst_module_inst|Equal0~1_combout\)) # (!\clk_rst_module_inst|Equal0~0_combout\)) # (!\clk_rst_module_inst|Equal0~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_rst_module_inst|Equal0~2_combout\,
	datab => \clk_rst_module_inst|Equal0~0_combout\,
	datac => \clk_rst_module_inst|Equal0~1_combout\,
	datad => \clk_rst_module_inst|pll_locked_r1~q\,
	combout => \clk_rst_module_inst|lock_cnt[9]~14_combout\);

-- Location: FF_X3_Y17_N1
\clk_rst_module_inst|lock_cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_osc_20_meg~inputclkctrl_outclk\,
	d => \clk_rst_module_inst|lock_cnt[0]~12_combout\,
	clrn => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_locked\,
	sclr => \clk_rst_module_inst|ALT_INV_pll_locked_r1~q\,
	ena => \clk_rst_module_inst|lock_cnt[9]~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_rst_module_inst|lock_cnt\(0));

-- Location: LCCOMB_X3_Y17_N2
\clk_rst_module_inst|lock_cnt[1]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_rst_module_inst|lock_cnt[1]~15_combout\ = (\clk_rst_module_inst|lock_cnt\(1) & (!\clk_rst_module_inst|lock_cnt[0]~13\)) # (!\clk_rst_module_inst|lock_cnt\(1) & ((\clk_rst_module_inst|lock_cnt[0]~13\) # (GND)))
-- \clk_rst_module_inst|lock_cnt[1]~16\ = CARRY((!\clk_rst_module_inst|lock_cnt[0]~13\) # (!\clk_rst_module_inst|lock_cnt\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clk_rst_module_inst|lock_cnt\(1),
	datad => VCC,
	cin => \clk_rst_module_inst|lock_cnt[0]~13\,
	combout => \clk_rst_module_inst|lock_cnt[1]~15_combout\,
	cout => \clk_rst_module_inst|lock_cnt[1]~16\);

-- Location: FF_X3_Y17_N3
\clk_rst_module_inst|lock_cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_osc_20_meg~inputclkctrl_outclk\,
	d => \clk_rst_module_inst|lock_cnt[1]~15_combout\,
	clrn => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_locked\,
	sclr => \clk_rst_module_inst|ALT_INV_pll_locked_r1~q\,
	ena => \clk_rst_module_inst|lock_cnt[9]~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_rst_module_inst|lock_cnt\(1));

-- Location: LCCOMB_X3_Y17_N4
\clk_rst_module_inst|lock_cnt[2]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_rst_module_inst|lock_cnt[2]~17_combout\ = (\clk_rst_module_inst|lock_cnt\(2) & (\clk_rst_module_inst|lock_cnt[1]~16\ $ (GND))) # (!\clk_rst_module_inst|lock_cnt\(2) & (!\clk_rst_module_inst|lock_cnt[1]~16\ & VCC))
-- \clk_rst_module_inst|lock_cnt[2]~18\ = CARRY((\clk_rst_module_inst|lock_cnt\(2) & !\clk_rst_module_inst|lock_cnt[1]~16\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clk_rst_module_inst|lock_cnt\(2),
	datad => VCC,
	cin => \clk_rst_module_inst|lock_cnt[1]~16\,
	combout => \clk_rst_module_inst|lock_cnt[2]~17_combout\,
	cout => \clk_rst_module_inst|lock_cnt[2]~18\);

-- Location: FF_X3_Y17_N5
\clk_rst_module_inst|lock_cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_osc_20_meg~inputclkctrl_outclk\,
	d => \clk_rst_module_inst|lock_cnt[2]~17_combout\,
	clrn => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_locked\,
	sclr => \clk_rst_module_inst|ALT_INV_pll_locked_r1~q\,
	ena => \clk_rst_module_inst|lock_cnt[9]~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_rst_module_inst|lock_cnt\(2));

-- Location: LCCOMB_X3_Y17_N6
\clk_rst_module_inst|lock_cnt[3]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_rst_module_inst|lock_cnt[3]~19_combout\ = (\clk_rst_module_inst|lock_cnt\(3) & (!\clk_rst_module_inst|lock_cnt[2]~18\)) # (!\clk_rst_module_inst|lock_cnt\(3) & ((\clk_rst_module_inst|lock_cnt[2]~18\) # (GND)))
-- \clk_rst_module_inst|lock_cnt[3]~20\ = CARRY((!\clk_rst_module_inst|lock_cnt[2]~18\) # (!\clk_rst_module_inst|lock_cnt\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clk_rst_module_inst|lock_cnt\(3),
	datad => VCC,
	cin => \clk_rst_module_inst|lock_cnt[2]~18\,
	combout => \clk_rst_module_inst|lock_cnt[3]~19_combout\,
	cout => \clk_rst_module_inst|lock_cnt[3]~20\);

-- Location: FF_X3_Y17_N7
\clk_rst_module_inst|lock_cnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_osc_20_meg~inputclkctrl_outclk\,
	d => \clk_rst_module_inst|lock_cnt[3]~19_combout\,
	clrn => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_locked\,
	sclr => \clk_rst_module_inst|ALT_INV_pll_locked_r1~q\,
	ena => \clk_rst_module_inst|lock_cnt[9]~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_rst_module_inst|lock_cnt\(3));

-- Location: LCCOMB_X3_Y17_N8
\clk_rst_module_inst|lock_cnt[4]~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_rst_module_inst|lock_cnt[4]~21_combout\ = (\clk_rst_module_inst|lock_cnt\(4) & (\clk_rst_module_inst|lock_cnt[3]~20\ $ (GND))) # (!\clk_rst_module_inst|lock_cnt\(4) & (!\clk_rst_module_inst|lock_cnt[3]~20\ & VCC))
-- \clk_rst_module_inst|lock_cnt[4]~22\ = CARRY((\clk_rst_module_inst|lock_cnt\(4) & !\clk_rst_module_inst|lock_cnt[3]~20\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clk_rst_module_inst|lock_cnt\(4),
	datad => VCC,
	cin => \clk_rst_module_inst|lock_cnt[3]~20\,
	combout => \clk_rst_module_inst|lock_cnt[4]~21_combout\,
	cout => \clk_rst_module_inst|lock_cnt[4]~22\);

-- Location: FF_X3_Y17_N9
\clk_rst_module_inst|lock_cnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_osc_20_meg~inputclkctrl_outclk\,
	d => \clk_rst_module_inst|lock_cnt[4]~21_combout\,
	clrn => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_locked\,
	sclr => \clk_rst_module_inst|ALT_INV_pll_locked_r1~q\,
	ena => \clk_rst_module_inst|lock_cnt[9]~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_rst_module_inst|lock_cnt\(4));

-- Location: LCCOMB_X3_Y17_N10
\clk_rst_module_inst|lock_cnt[5]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_rst_module_inst|lock_cnt[5]~23_combout\ = (\clk_rst_module_inst|lock_cnt\(5) & (!\clk_rst_module_inst|lock_cnt[4]~22\)) # (!\clk_rst_module_inst|lock_cnt\(5) & ((\clk_rst_module_inst|lock_cnt[4]~22\) # (GND)))
-- \clk_rst_module_inst|lock_cnt[5]~24\ = CARRY((!\clk_rst_module_inst|lock_cnt[4]~22\) # (!\clk_rst_module_inst|lock_cnt\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clk_rst_module_inst|lock_cnt\(5),
	datad => VCC,
	cin => \clk_rst_module_inst|lock_cnt[4]~22\,
	combout => \clk_rst_module_inst|lock_cnt[5]~23_combout\,
	cout => \clk_rst_module_inst|lock_cnt[5]~24\);

-- Location: FF_X3_Y17_N11
\clk_rst_module_inst|lock_cnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_osc_20_meg~inputclkctrl_outclk\,
	d => \clk_rst_module_inst|lock_cnt[5]~23_combout\,
	clrn => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_locked\,
	sclr => \clk_rst_module_inst|ALT_INV_pll_locked_r1~q\,
	ena => \clk_rst_module_inst|lock_cnt[9]~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_rst_module_inst|lock_cnt\(5));

-- Location: LCCOMB_X3_Y17_N12
\clk_rst_module_inst|lock_cnt[6]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_rst_module_inst|lock_cnt[6]~25_combout\ = (\clk_rst_module_inst|lock_cnt\(6) & (\clk_rst_module_inst|lock_cnt[5]~24\ $ (GND))) # (!\clk_rst_module_inst|lock_cnt\(6) & (!\clk_rst_module_inst|lock_cnt[5]~24\ & VCC))
-- \clk_rst_module_inst|lock_cnt[6]~26\ = CARRY((\clk_rst_module_inst|lock_cnt\(6) & !\clk_rst_module_inst|lock_cnt[5]~24\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clk_rst_module_inst|lock_cnt\(6),
	datad => VCC,
	cin => \clk_rst_module_inst|lock_cnt[5]~24\,
	combout => \clk_rst_module_inst|lock_cnt[6]~25_combout\,
	cout => \clk_rst_module_inst|lock_cnt[6]~26\);

-- Location: FF_X3_Y17_N13
\clk_rst_module_inst|lock_cnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_osc_20_meg~inputclkctrl_outclk\,
	d => \clk_rst_module_inst|lock_cnt[6]~25_combout\,
	clrn => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_locked\,
	sclr => \clk_rst_module_inst|ALT_INV_pll_locked_r1~q\,
	ena => \clk_rst_module_inst|lock_cnt[9]~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_rst_module_inst|lock_cnt\(6));

-- Location: LCCOMB_X3_Y17_N14
\clk_rst_module_inst|lock_cnt[7]~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_rst_module_inst|lock_cnt[7]~27_combout\ = (\clk_rst_module_inst|lock_cnt\(7) & (!\clk_rst_module_inst|lock_cnt[6]~26\)) # (!\clk_rst_module_inst|lock_cnt\(7) & ((\clk_rst_module_inst|lock_cnt[6]~26\) # (GND)))
-- \clk_rst_module_inst|lock_cnt[7]~28\ = CARRY((!\clk_rst_module_inst|lock_cnt[6]~26\) # (!\clk_rst_module_inst|lock_cnt\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clk_rst_module_inst|lock_cnt\(7),
	datad => VCC,
	cin => \clk_rst_module_inst|lock_cnt[6]~26\,
	combout => \clk_rst_module_inst|lock_cnt[7]~27_combout\,
	cout => \clk_rst_module_inst|lock_cnt[7]~28\);

-- Location: FF_X3_Y17_N15
\clk_rst_module_inst|lock_cnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_osc_20_meg~inputclkctrl_outclk\,
	d => \clk_rst_module_inst|lock_cnt[7]~27_combout\,
	clrn => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_locked\,
	sclr => \clk_rst_module_inst|ALT_INV_pll_locked_r1~q\,
	ena => \clk_rst_module_inst|lock_cnt[9]~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_rst_module_inst|lock_cnt\(7));

-- Location: LCCOMB_X3_Y17_N16
\clk_rst_module_inst|lock_cnt[8]~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_rst_module_inst|lock_cnt[8]~29_combout\ = (\clk_rst_module_inst|lock_cnt\(8) & (\clk_rst_module_inst|lock_cnt[7]~28\ $ (GND))) # (!\clk_rst_module_inst|lock_cnt\(8) & (!\clk_rst_module_inst|lock_cnt[7]~28\ & VCC))
-- \clk_rst_module_inst|lock_cnt[8]~30\ = CARRY((\clk_rst_module_inst|lock_cnt\(8) & !\clk_rst_module_inst|lock_cnt[7]~28\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clk_rst_module_inst|lock_cnt\(8),
	datad => VCC,
	cin => \clk_rst_module_inst|lock_cnt[7]~28\,
	combout => \clk_rst_module_inst|lock_cnt[8]~29_combout\,
	cout => \clk_rst_module_inst|lock_cnt[8]~30\);

-- Location: FF_X3_Y17_N17
\clk_rst_module_inst|lock_cnt[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_osc_20_meg~inputclkctrl_outclk\,
	d => \clk_rst_module_inst|lock_cnt[8]~29_combout\,
	clrn => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_locked\,
	sclr => \clk_rst_module_inst|ALT_INV_pll_locked_r1~q\,
	ena => \clk_rst_module_inst|lock_cnt[9]~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_rst_module_inst|lock_cnt\(8));

-- Location: LCCOMB_X3_Y17_N18
\clk_rst_module_inst|lock_cnt[9]~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_rst_module_inst|lock_cnt[9]~31_combout\ = (\clk_rst_module_inst|lock_cnt\(9) & (!\clk_rst_module_inst|lock_cnt[8]~30\)) # (!\clk_rst_module_inst|lock_cnt\(9) & ((\clk_rst_module_inst|lock_cnt[8]~30\) # (GND)))
-- \clk_rst_module_inst|lock_cnt[9]~32\ = CARRY((!\clk_rst_module_inst|lock_cnt[8]~30\) # (!\clk_rst_module_inst|lock_cnt\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clk_rst_module_inst|lock_cnt\(9),
	datad => VCC,
	cin => \clk_rst_module_inst|lock_cnt[8]~30\,
	combout => \clk_rst_module_inst|lock_cnt[9]~31_combout\,
	cout => \clk_rst_module_inst|lock_cnt[9]~32\);

-- Location: FF_X3_Y17_N19
\clk_rst_module_inst|lock_cnt[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_osc_20_meg~inputclkctrl_outclk\,
	d => \clk_rst_module_inst|lock_cnt[9]~31_combout\,
	clrn => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_locked\,
	sclr => \clk_rst_module_inst|ALT_INV_pll_locked_r1~q\,
	ena => \clk_rst_module_inst|lock_cnt[9]~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_rst_module_inst|lock_cnt\(9));

-- Location: LCCOMB_X3_Y17_N20
\clk_rst_module_inst|lock_cnt[10]~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_rst_module_inst|lock_cnt[10]~33_combout\ = (\clk_rst_module_inst|lock_cnt\(10) & (\clk_rst_module_inst|lock_cnt[9]~32\ $ (GND))) # (!\clk_rst_module_inst|lock_cnt\(10) & (!\clk_rst_module_inst|lock_cnt[9]~32\ & VCC))
-- \clk_rst_module_inst|lock_cnt[10]~34\ = CARRY((\clk_rst_module_inst|lock_cnt\(10) & !\clk_rst_module_inst|lock_cnt[9]~32\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clk_rst_module_inst|lock_cnt\(10),
	datad => VCC,
	cin => \clk_rst_module_inst|lock_cnt[9]~32\,
	combout => \clk_rst_module_inst|lock_cnt[10]~33_combout\,
	cout => \clk_rst_module_inst|lock_cnt[10]~34\);

-- Location: FF_X3_Y17_N21
\clk_rst_module_inst|lock_cnt[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_osc_20_meg~inputclkctrl_outclk\,
	d => \clk_rst_module_inst|lock_cnt[10]~33_combout\,
	clrn => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_locked\,
	sclr => \clk_rst_module_inst|ALT_INV_pll_locked_r1~q\,
	ena => \clk_rst_module_inst|lock_cnt[9]~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_rst_module_inst|lock_cnt\(10));

-- Location: LCCOMB_X3_Y17_N22
\clk_rst_module_inst|lock_cnt[11]~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_rst_module_inst|lock_cnt[11]~35_combout\ = \clk_rst_module_inst|lock_cnt\(11) $ (\clk_rst_module_inst|lock_cnt[10]~34\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clk_rst_module_inst|lock_cnt\(11),
	cin => \clk_rst_module_inst|lock_cnt[10]~34\,
	combout => \clk_rst_module_inst|lock_cnt[11]~35_combout\);

-- Location: FF_X3_Y17_N23
\clk_rst_module_inst|lock_cnt[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_osc_20_meg~inputclkctrl_outclk\,
	d => \clk_rst_module_inst|lock_cnt[11]~35_combout\,
	clrn => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_locked\,
	sclr => \clk_rst_module_inst|ALT_INV_pll_locked_r1~q\,
	ena => \clk_rst_module_inst|lock_cnt[9]~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_rst_module_inst|lock_cnt\(11));

-- Location: LCCOMB_X3_Y17_N28
\clk_rst_module_inst|Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_rst_module_inst|Equal0~2_combout\ = (\clk_rst_module_inst|lock_cnt\(8) & (\clk_rst_module_inst|lock_cnt\(10) & (\clk_rst_module_inst|lock_cnt\(11) & \clk_rst_module_inst|lock_cnt\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_rst_module_inst|lock_cnt\(8),
	datab => \clk_rst_module_inst|lock_cnt\(10),
	datac => \clk_rst_module_inst|lock_cnt\(11),
	datad => \clk_rst_module_inst|lock_cnt\(9),
	combout => \clk_rst_module_inst|Equal0~2_combout\);

-- Location: LCCOMB_X4_Y17_N8
\clk_rst_module_inst|pll_locked_debounced~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_rst_module_inst|pll_locked_debounced~0_combout\ = (\clk_rst_module_inst|pll_locked_debounced~q\) # ((\clk_rst_module_inst|Equal0~2_combout\ & (\clk_rst_module_inst|Equal0~1_combout\ & \clk_rst_module_inst|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_rst_module_inst|pll_locked_debounced~q\,
	datab => \clk_rst_module_inst|Equal0~2_combout\,
	datac => \clk_rst_module_inst|Equal0~1_combout\,
	datad => \clk_rst_module_inst|Equal0~0_combout\,
	combout => \clk_rst_module_inst|pll_locked_debounced~0_combout\);

-- Location: LCCOMB_X4_Y17_N12
\clk_rst_module_inst|pll_locked_debounced~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_rst_module_inst|pll_locked_debounced~1_combout\ = (\clk_rst_module_inst|pll_locked_r1~q\ & \clk_rst_module_inst|pll_locked_debounced~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_rst_module_inst|pll_locked_r1~q\,
	datac => \clk_rst_module_inst|pll_locked_debounced~0_combout\,
	combout => \clk_rst_module_inst|pll_locked_debounced~1_combout\);

-- Location: FF_X4_Y17_N13
\clk_rst_module_inst|pll_locked_debounced\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_osc_20_meg~inputclkctrl_outclk\,
	d => \clk_rst_module_inst|pll_locked_debounced~1_combout\,
	clrn => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_locked\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_rst_module_inst|pll_locked_debounced~q\);

-- Location: FF_X1_Y9_N25
\clk_rst_module_inst|rst_80m_n_ms\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \clk_rst_module_inst|rst_80m_n_ms~feeder_combout\,
	clrn => \clk_rst_module_inst|pll_locked_debounced~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_rst_module_inst|rst_80m_n_ms~q\);

-- Location: LCCOMB_X1_Y9_N8
\clk_rst_module_inst|rst_80m_n~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_rst_module_inst|rst_80m_n~feeder_combout\ = \clk_rst_module_inst|rst_80m_n_ms~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \clk_rst_module_inst|rst_80m_n_ms~q\,
	combout => \clk_rst_module_inst|rst_80m_n~feeder_combout\);

-- Location: FF_X1_Y9_N9
\clk_rst_module_inst|rst_80m_n\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \clk_rst_module_inst|rst_80m_n~feeder_combout\,
	clrn => \clk_rst_module_inst|pll_locked_debounced~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_rst_module_inst|rst_80m_n~q\);

-- Location: LCCOMB_X2_Y9_N10
\clk_domain_1_inst|timer_inst|timer[3]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_1_inst|timer_inst|timer[3]~19_combout\ = (\clk_domain_1_inst|timer_inst|timer\(3) & (!\clk_domain_1_inst|timer_inst|timer[2]~18\)) # (!\clk_domain_1_inst|timer_inst|timer\(3) & ((\clk_domain_1_inst|timer_inst|timer[2]~18\) # (GND)))
-- \clk_domain_1_inst|timer_inst|timer[3]~20\ = CARRY((!\clk_domain_1_inst|timer_inst|timer[2]~18\) # (!\clk_domain_1_inst|timer_inst|timer\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clk_domain_1_inst|timer_inst|timer\(3),
	datad => VCC,
	cin => \clk_domain_1_inst|timer_inst|timer[2]~18\,
	combout => \clk_domain_1_inst|timer_inst|timer[3]~19_combout\,
	cout => \clk_domain_1_inst|timer_inst|timer[3]~20\);

-- Location: LCCOMB_X2_Y9_N12
\clk_domain_1_inst|timer_inst|timer[4]~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_1_inst|timer_inst|timer[4]~21_combout\ = (\clk_domain_1_inst|timer_inst|timer\(4) & (\clk_domain_1_inst|timer_inst|timer[3]~20\ $ (GND))) # (!\clk_domain_1_inst|timer_inst|timer\(4) & (!\clk_domain_1_inst|timer_inst|timer[3]~20\ & VCC))
-- \clk_domain_1_inst|timer_inst|timer[4]~22\ = CARRY((\clk_domain_1_inst|timer_inst|timer\(4) & !\clk_domain_1_inst|timer_inst|timer[3]~20\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clk_domain_1_inst|timer_inst|timer\(4),
	datad => VCC,
	cin => \clk_domain_1_inst|timer_inst|timer[3]~20\,
	combout => \clk_domain_1_inst|timer_inst|timer[4]~21_combout\,
	cout => \clk_domain_1_inst|timer_inst|timer[4]~22\);

-- Location: FF_X2_Y9_N13
\clk_domain_1_inst|timer_inst|timer[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \clk_domain_1_inst|timer_inst|timer[4]~21_combout\,
	clrn => \clk_rst_module_inst|rst_80m_n~q\,
	sclr => \clk_domain_1_inst|timer_inst|timer[11]~39_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_domain_1_inst|timer_inst|timer\(4));

-- Location: LCCOMB_X2_Y9_N14
\clk_domain_1_inst|timer_inst|timer[5]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_1_inst|timer_inst|timer[5]~23_combout\ = (\clk_domain_1_inst|timer_inst|timer\(5) & (!\clk_domain_1_inst|timer_inst|timer[4]~22\)) # (!\clk_domain_1_inst|timer_inst|timer\(5) & ((\clk_domain_1_inst|timer_inst|timer[4]~22\) # (GND)))
-- \clk_domain_1_inst|timer_inst|timer[5]~24\ = CARRY((!\clk_domain_1_inst|timer_inst|timer[4]~22\) # (!\clk_domain_1_inst|timer_inst|timer\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clk_domain_1_inst|timer_inst|timer\(5),
	datad => VCC,
	cin => \clk_domain_1_inst|timer_inst|timer[4]~22\,
	combout => \clk_domain_1_inst|timer_inst|timer[5]~23_combout\,
	cout => \clk_domain_1_inst|timer_inst|timer[5]~24\);

-- Location: FF_X2_Y9_N15
\clk_domain_1_inst|timer_inst|timer[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \clk_domain_1_inst|timer_inst|timer[5]~23_combout\,
	clrn => \clk_rst_module_inst|rst_80m_n~q\,
	sclr => \clk_domain_1_inst|timer_inst|timer[11]~39_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_domain_1_inst|timer_inst|timer\(5));

-- Location: LCCOMB_X2_Y9_N16
\clk_domain_1_inst|timer_inst|timer[6]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_1_inst|timer_inst|timer[6]~25_combout\ = (\clk_domain_1_inst|timer_inst|timer\(6) & (\clk_domain_1_inst|timer_inst|timer[5]~24\ $ (GND))) # (!\clk_domain_1_inst|timer_inst|timer\(6) & (!\clk_domain_1_inst|timer_inst|timer[5]~24\ & VCC))
-- \clk_domain_1_inst|timer_inst|timer[6]~26\ = CARRY((\clk_domain_1_inst|timer_inst|timer\(6) & !\clk_domain_1_inst|timer_inst|timer[5]~24\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clk_domain_1_inst|timer_inst|timer\(6),
	datad => VCC,
	cin => \clk_domain_1_inst|timer_inst|timer[5]~24\,
	combout => \clk_domain_1_inst|timer_inst|timer[6]~25_combout\,
	cout => \clk_domain_1_inst|timer_inst|timer[6]~26\);

-- Location: FF_X2_Y9_N17
\clk_domain_1_inst|timer_inst|timer[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \clk_domain_1_inst|timer_inst|timer[6]~25_combout\,
	clrn => \clk_rst_module_inst|rst_80m_n~q\,
	sclr => \clk_domain_1_inst|timer_inst|timer[11]~39_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_domain_1_inst|timer_inst|timer\(6));

-- Location: LCCOMB_X2_Y9_N18
\clk_domain_1_inst|timer_inst|timer[7]~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_1_inst|timer_inst|timer[7]~27_combout\ = (\clk_domain_1_inst|timer_inst|timer\(7) & (!\clk_domain_1_inst|timer_inst|timer[6]~26\)) # (!\clk_domain_1_inst|timer_inst|timer\(7) & ((\clk_domain_1_inst|timer_inst|timer[6]~26\) # (GND)))
-- \clk_domain_1_inst|timer_inst|timer[7]~28\ = CARRY((!\clk_domain_1_inst|timer_inst|timer[6]~26\) # (!\clk_domain_1_inst|timer_inst|timer\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clk_domain_1_inst|timer_inst|timer\(7),
	datad => VCC,
	cin => \clk_domain_1_inst|timer_inst|timer[6]~26\,
	combout => \clk_domain_1_inst|timer_inst|timer[7]~27_combout\,
	cout => \clk_domain_1_inst|timer_inst|timer[7]~28\);

-- Location: FF_X2_Y9_N19
\clk_domain_1_inst|timer_inst|timer[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \clk_domain_1_inst|timer_inst|timer[7]~27_combout\,
	clrn => \clk_rst_module_inst|rst_80m_n~q\,
	sclr => \clk_domain_1_inst|timer_inst|timer[11]~39_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_domain_1_inst|timer_inst|timer\(7));

-- Location: LCCOMB_X2_Y9_N20
\clk_domain_1_inst|timer_inst|timer[8]~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_1_inst|timer_inst|timer[8]~29_combout\ = (\clk_domain_1_inst|timer_inst|timer\(8) & (\clk_domain_1_inst|timer_inst|timer[7]~28\ $ (GND))) # (!\clk_domain_1_inst|timer_inst|timer\(8) & (!\clk_domain_1_inst|timer_inst|timer[7]~28\ & VCC))
-- \clk_domain_1_inst|timer_inst|timer[8]~30\ = CARRY((\clk_domain_1_inst|timer_inst|timer\(8) & !\clk_domain_1_inst|timer_inst|timer[7]~28\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clk_domain_1_inst|timer_inst|timer\(8),
	datad => VCC,
	cin => \clk_domain_1_inst|timer_inst|timer[7]~28\,
	combout => \clk_domain_1_inst|timer_inst|timer[8]~29_combout\,
	cout => \clk_domain_1_inst|timer_inst|timer[8]~30\);

-- Location: FF_X2_Y9_N21
\clk_domain_1_inst|timer_inst|timer[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \clk_domain_1_inst|timer_inst|timer[8]~29_combout\,
	clrn => \clk_rst_module_inst|rst_80m_n~q\,
	sclr => \clk_domain_1_inst|timer_inst|timer[11]~39_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_domain_1_inst|timer_inst|timer\(8));

-- Location: LCCOMB_X1_Y9_N4
\clk_domain_1_inst|timer_inst|Equal1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_1_inst|timer_inst|Equal1~1_combout\ = ((\clk_domain_1_inst|timer_inst|timer\(7)) # ((\clk_domain_1_inst|timer_inst|timer\(6)) # (!\clk_domain_1_inst|timer_inst|timer\(5)))) # (!\clk_domain_1_inst|timer_inst|timer\(8))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_domain_1_inst|timer_inst|timer\(8),
	datab => \clk_domain_1_inst|timer_inst|timer\(7),
	datac => \clk_domain_1_inst|timer_inst|timer\(5),
	datad => \clk_domain_1_inst|timer_inst|timer\(6),
	combout => \clk_domain_1_inst|timer_inst|Equal1~1_combout\);

-- Location: LCCOMB_X2_Y9_N22
\clk_domain_1_inst|timer_inst|timer[9]~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_1_inst|timer_inst|timer[9]~31_combout\ = (\clk_domain_1_inst|timer_inst|timer\(9) & (!\clk_domain_1_inst|timer_inst|timer[8]~30\)) # (!\clk_domain_1_inst|timer_inst|timer\(9) & ((\clk_domain_1_inst|timer_inst|timer[8]~30\) # (GND)))
-- \clk_domain_1_inst|timer_inst|timer[9]~32\ = CARRY((!\clk_domain_1_inst|timer_inst|timer[8]~30\) # (!\clk_domain_1_inst|timer_inst|timer\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clk_domain_1_inst|timer_inst|timer\(9),
	datad => VCC,
	cin => \clk_domain_1_inst|timer_inst|timer[8]~30\,
	combout => \clk_domain_1_inst|timer_inst|timer[9]~31_combout\,
	cout => \clk_domain_1_inst|timer_inst|timer[9]~32\);

-- Location: FF_X2_Y9_N23
\clk_domain_1_inst|timer_inst|timer[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \clk_domain_1_inst|timer_inst|timer[9]~31_combout\,
	clrn => \clk_rst_module_inst|rst_80m_n~q\,
	sclr => \clk_domain_1_inst|timer_inst|timer[11]~39_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_domain_1_inst|timer_inst|timer\(9));

-- Location: LCCOMB_X2_Y9_N24
\clk_domain_1_inst|timer_inst|timer[10]~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_1_inst|timer_inst|timer[10]~33_combout\ = (\clk_domain_1_inst|timer_inst|timer\(10) & (\clk_domain_1_inst|timer_inst|timer[9]~32\ $ (GND))) # (!\clk_domain_1_inst|timer_inst|timer\(10) & (!\clk_domain_1_inst|timer_inst|timer[9]~32\ & VCC))
-- \clk_domain_1_inst|timer_inst|timer[10]~34\ = CARRY((\clk_domain_1_inst|timer_inst|timer\(10) & !\clk_domain_1_inst|timer_inst|timer[9]~32\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clk_domain_1_inst|timer_inst|timer\(10),
	datad => VCC,
	cin => \clk_domain_1_inst|timer_inst|timer[9]~32\,
	combout => \clk_domain_1_inst|timer_inst|timer[10]~33_combout\,
	cout => \clk_domain_1_inst|timer_inst|timer[10]~34\);

-- Location: FF_X2_Y9_N25
\clk_domain_1_inst|timer_inst|timer[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \clk_domain_1_inst|timer_inst|timer[10]~33_combout\,
	clrn => \clk_rst_module_inst|rst_80m_n~q\,
	sclr => \clk_domain_1_inst|timer_inst|timer[11]~39_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_domain_1_inst|timer_inst|timer\(10));

-- Location: LCCOMB_X2_Y9_N26
\clk_domain_1_inst|timer_inst|timer[11]~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_1_inst|timer_inst|timer[11]~35_combout\ = (\clk_domain_1_inst|timer_inst|timer\(11) & (!\clk_domain_1_inst|timer_inst|timer[10]~34\)) # (!\clk_domain_1_inst|timer_inst|timer\(11) & ((\clk_domain_1_inst|timer_inst|timer[10]~34\) # (GND)))
-- \clk_domain_1_inst|timer_inst|timer[11]~36\ = CARRY((!\clk_domain_1_inst|timer_inst|timer[10]~34\) # (!\clk_domain_1_inst|timer_inst|timer\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clk_domain_1_inst|timer_inst|timer\(11),
	datad => VCC,
	cin => \clk_domain_1_inst|timer_inst|timer[10]~34\,
	combout => \clk_domain_1_inst|timer_inst|timer[11]~35_combout\,
	cout => \clk_domain_1_inst|timer_inst|timer[11]~36\);

-- Location: FF_X2_Y9_N27
\clk_domain_1_inst|timer_inst|timer[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \clk_domain_1_inst|timer_inst|timer[11]~35_combout\,
	clrn => \clk_rst_module_inst|rst_80m_n~q\,
	sclr => \clk_domain_1_inst|timer_inst|timer[11]~39_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_domain_1_inst|timer_inst|timer\(11));

-- Location: LCCOMB_X2_Y9_N28
\clk_domain_1_inst|timer_inst|timer[12]~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_1_inst|timer_inst|timer[12]~37_combout\ = \clk_domain_1_inst|timer_inst|timer[11]~36\ $ (!\clk_domain_1_inst|timer_inst|timer\(12))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \clk_domain_1_inst|timer_inst|timer\(12),
	cin => \clk_domain_1_inst|timer_inst|timer[11]~36\,
	combout => \clk_domain_1_inst|timer_inst|timer[12]~37_combout\);

-- Location: FF_X2_Y9_N29
\clk_domain_1_inst|timer_inst|timer[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \clk_domain_1_inst|timer_inst|timer[12]~37_combout\,
	clrn => \clk_rst_module_inst|rst_80m_n~q\,
	sclr => \clk_domain_1_inst|timer_inst|timer[11]~39_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_domain_1_inst|timer_inst|timer\(12));

-- Location: LCCOMB_X1_Y9_N28
\clk_domain_1_inst|timer_inst|Equal1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_1_inst|timer_inst|Equal1~2_combout\ = (((!\clk_domain_1_inst|timer_inst|timer\(9)) # (!\clk_domain_1_inst|timer_inst|timer\(11))) # (!\clk_domain_1_inst|timer_inst|timer\(10))) # (!\clk_domain_1_inst|timer_inst|timer\(12))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_domain_1_inst|timer_inst|timer\(12),
	datab => \clk_domain_1_inst|timer_inst|timer\(10),
	datac => \clk_domain_1_inst|timer_inst|timer\(11),
	datad => \clk_domain_1_inst|timer_inst|timer\(9),
	combout => \clk_domain_1_inst|timer_inst|Equal1~2_combout\);

-- Location: LCCOMB_X1_Y9_N26
\clk_domain_1_inst|timer_inst|Equal1~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_1_inst|timer_inst|Equal1~3_combout\ = ((\clk_domain_1_inst|timer_inst|Equal1~1_combout\) # ((\clk_domain_1_inst|timer_inst|Equal1~2_combout\) # (!\clk_domain_1_inst|timer_inst|timer\(4)))) # (!\clk_domain_1_inst|timer_inst|Equal1~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_domain_1_inst|timer_inst|Equal1~0_combout\,
	datab => \clk_domain_1_inst|timer_inst|Equal1~1_combout\,
	datac => \clk_domain_1_inst|timer_inst|timer\(4),
	datad => \clk_domain_1_inst|timer_inst|Equal1~2_combout\,
	combout => \clk_domain_1_inst|timer_inst|Equal1~3_combout\);

-- Location: IOIBUF_X0_Y8_N15
\fpga_async_in_1_n~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_fpga_async_in_1_n,
	o => \fpga_async_in_1_n~input_o\);

-- Location: LCCOMB_X1_Y9_N6
\clk_domain_1_inst|timer_enable_ms~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_1_inst|timer_enable_ms~0_combout\ = !\fpga_async_in_1_n~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \fpga_async_in_1_n~input_o\,
	combout => \clk_domain_1_inst|timer_enable_ms~0_combout\);

-- Location: FF_X1_Y9_N7
\clk_domain_1_inst|timer_enable_ms\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \clk_domain_1_inst|timer_enable_ms~0_combout\,
	clrn => \clk_rst_module_inst|rst_80m_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_domain_1_inst|timer_enable_ms~q\);

-- Location: LCCOMB_X1_Y9_N18
\clk_domain_1_inst|timer_enable_msh~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_1_inst|timer_enable_msh~feeder_combout\ = \clk_domain_1_inst|timer_enable_ms~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \clk_domain_1_inst|timer_enable_ms~q\,
	combout => \clk_domain_1_inst|timer_enable_msh~feeder_combout\);

-- Location: FF_X1_Y9_N19
\clk_domain_1_inst|timer_enable_msh\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \clk_domain_1_inst|timer_enable_msh~feeder_combout\,
	clrn => \clk_rst_module_inst|rst_80m_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_domain_1_inst|timer_enable_msh~q\);

-- Location: LCCOMB_X1_Y9_N12
\clk_domain_1_inst|timer_control_int.timer_enable~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_1_inst|timer_control_int.timer_enable~feeder_combout\ = \clk_domain_1_inst|timer_enable_msh~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \clk_domain_1_inst|timer_enable_msh~q\,
	combout => \clk_domain_1_inst|timer_control_int.timer_enable~feeder_combout\);

-- Location: FF_X1_Y9_N13
\clk_domain_1_inst|timer_control_int.timer_enable\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \clk_domain_1_inst|timer_control_int.timer_enable~feeder_combout\,
	clrn => \clk_rst_module_inst|rst_80m_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_domain_1_inst|timer_control_int.timer_enable~q\);

-- Location: LCCOMB_X1_Y9_N14
\clk_domain_1_inst|timer_inst|timer[11]~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_1_inst|timer_inst|timer[11]~39_combout\ = (!\clk_domain_1_inst|timer_control_int.timer_enable~q\) # (!\clk_domain_1_inst|timer_inst|Equal1~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \clk_domain_1_inst|timer_inst|Equal1~3_combout\,
	datad => \clk_domain_1_inst|timer_control_int.timer_enable~q\,
	combout => \clk_domain_1_inst|timer_inst|timer[11]~39_combout\);

-- Location: FF_X2_Y9_N5
\clk_domain_1_inst|timer_inst|timer[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \clk_domain_1_inst|timer_inst|timer[0]~13_combout\,
	clrn => \clk_rst_module_inst|rst_80m_n~q\,
	sclr => \clk_domain_1_inst|timer_inst|timer[11]~39_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_domain_1_inst|timer_inst|timer\(0));

-- Location: LCCOMB_X2_Y9_N6
\clk_domain_1_inst|timer_inst|timer[1]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_1_inst|timer_inst|timer[1]~15_combout\ = (\clk_domain_1_inst|timer_inst|timer\(1) & (!\clk_domain_1_inst|timer_inst|timer[0]~14\)) # (!\clk_domain_1_inst|timer_inst|timer\(1) & ((\clk_domain_1_inst|timer_inst|timer[0]~14\) # (GND)))
-- \clk_domain_1_inst|timer_inst|timer[1]~16\ = CARRY((!\clk_domain_1_inst|timer_inst|timer[0]~14\) # (!\clk_domain_1_inst|timer_inst|timer\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clk_domain_1_inst|timer_inst|timer\(1),
	datad => VCC,
	cin => \clk_domain_1_inst|timer_inst|timer[0]~14\,
	combout => \clk_domain_1_inst|timer_inst|timer[1]~15_combout\,
	cout => \clk_domain_1_inst|timer_inst|timer[1]~16\);

-- Location: FF_X2_Y9_N7
\clk_domain_1_inst|timer_inst|timer[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \clk_domain_1_inst|timer_inst|timer[1]~15_combout\,
	clrn => \clk_rst_module_inst|rst_80m_n~q\,
	sclr => \clk_domain_1_inst|timer_inst|timer[11]~39_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_domain_1_inst|timer_inst|timer\(1));

-- Location: LCCOMB_X2_Y9_N8
\clk_domain_1_inst|timer_inst|timer[2]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_1_inst|timer_inst|timer[2]~17_combout\ = (\clk_domain_1_inst|timer_inst|timer\(2) & (\clk_domain_1_inst|timer_inst|timer[1]~16\ $ (GND))) # (!\clk_domain_1_inst|timer_inst|timer\(2) & (!\clk_domain_1_inst|timer_inst|timer[1]~16\ & VCC))
-- \clk_domain_1_inst|timer_inst|timer[2]~18\ = CARRY((\clk_domain_1_inst|timer_inst|timer\(2) & !\clk_domain_1_inst|timer_inst|timer[1]~16\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clk_domain_1_inst|timer_inst|timer\(2),
	datad => VCC,
	cin => \clk_domain_1_inst|timer_inst|timer[1]~16\,
	combout => \clk_domain_1_inst|timer_inst|timer[2]~17_combout\,
	cout => \clk_domain_1_inst|timer_inst|timer[2]~18\);

-- Location: FF_X2_Y9_N9
\clk_domain_1_inst|timer_inst|timer[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \clk_domain_1_inst|timer_inst|timer[2]~17_combout\,
	clrn => \clk_rst_module_inst|rst_80m_n~q\,
	sclr => \clk_domain_1_inst|timer_inst|timer[11]~39_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_domain_1_inst|timer_inst|timer\(2));

-- Location: FF_X2_Y9_N11
\clk_domain_1_inst|timer_inst|timer[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \clk_domain_1_inst|timer_inst|timer[3]~19_combout\,
	clrn => \clk_rst_module_inst|rst_80m_n~q\,
	sclr => \clk_domain_1_inst|timer_inst|timer[11]~39_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_domain_1_inst|timer_inst|timer\(3));

-- Location: LCCOMB_X2_Y9_N0
\clk_domain_1_inst|timer_inst|Equal1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_1_inst|timer_inst|Equal1~0_combout\ = (\clk_domain_1_inst|timer_inst|timer\(3) & (\clk_domain_1_inst|timer_inst|timer\(2) & (\clk_domain_1_inst|timer_inst|timer\(0) & \clk_domain_1_inst|timer_inst|timer\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_domain_1_inst|timer_inst|timer\(3),
	datab => \clk_domain_1_inst|timer_inst|timer\(2),
	datac => \clk_domain_1_inst|timer_inst|timer\(0),
	datad => \clk_domain_1_inst|timer_inst|timer\(1),
	combout => \clk_domain_1_inst|timer_inst|Equal1~0_combout\);

-- Location: LCCOMB_X1_Y9_N10
\clk_domain_1_inst|timer_inst|led_red~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_1_inst|timer_inst|led_red~2_combout\ = (\clk_domain_1_inst|timer_inst|timer\(5)) # ((\clk_domain_1_inst|timer_inst|timer\(6)) # ((\clk_domain_1_inst|timer_inst|Equal1~0_combout\ & \clk_domain_1_inst|timer_inst|timer\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_domain_1_inst|timer_inst|Equal1~0_combout\,
	datab => \clk_domain_1_inst|timer_inst|timer\(4),
	datac => \clk_domain_1_inst|timer_inst|timer\(5),
	datad => \clk_domain_1_inst|timer_inst|timer\(6),
	combout => \clk_domain_1_inst|timer_inst|led_red~2_combout\);

-- Location: LCCOMB_X1_Y9_N20
\clk_domain_1_inst|timer_inst|led_red~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_1_inst|timer_inst|led_red~0_combout\ = ((!\clk_domain_1_inst|timer_inst|timer\(12) & ((!\clk_domain_1_inst|timer_inst|timer\(10)) # (!\clk_domain_1_inst|timer_inst|timer\(11))))) # (!\clk_domain_1_inst|timer_control_int.timer_enable~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111100111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_domain_1_inst|timer_inst|timer\(11),
	datab => \clk_domain_1_inst|timer_inst|timer\(12),
	datac => \clk_domain_1_inst|timer_control_int.timer_enable~q\,
	datad => \clk_domain_1_inst|timer_inst|timer\(10),
	combout => \clk_domain_1_inst|timer_inst|led_red~0_combout\);

-- Location: LCCOMB_X1_Y9_N22
\clk_domain_1_inst|timer_inst|led_red~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_1_inst|timer_inst|led_red~1_combout\ = (!\clk_domain_1_inst|timer_inst|timer\(12) & (((!\clk_domain_1_inst|timer_inst|timer\(7)) # (!\clk_domain_1_inst|timer_inst|timer\(8))) # (!\clk_domain_1_inst|timer_inst|timer\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_domain_1_inst|timer_inst|timer\(12),
	datab => \clk_domain_1_inst|timer_inst|timer\(9),
	datac => \clk_domain_1_inst|timer_inst|timer\(8),
	datad => \clk_domain_1_inst|timer_inst|timer\(7),
	combout => \clk_domain_1_inst|timer_inst|led_red~1_combout\);

-- Location: LCCOMB_X1_Y9_N30
\clk_domain_1_inst|timer_inst|led_red~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_1_inst|timer_inst|led_red~3_combout\ = (\clk_domain_1_inst|timer_inst|led_red~0_combout\) # ((\clk_domain_1_inst|timer_inst|led_red~1_combout\) # ((!\clk_domain_1_inst|timer_inst|led_red~2_combout\ & 
-- !\clk_domain_1_inst|timer_inst|timer\(12))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_domain_1_inst|timer_inst|led_red~2_combout\,
	datab => \clk_domain_1_inst|timer_inst|led_red~0_combout\,
	datac => \clk_domain_1_inst|timer_inst|led_red~1_combout\,
	datad => \clk_domain_1_inst|timer_inst|timer\(12),
	combout => \clk_domain_1_inst|timer_inst|led_red~3_combout\);

-- Location: FF_X1_Y9_N31
\clk_domain_1_inst|timer_inst|led_red\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \clk_domain_1_inst|timer_inst|led_red~3_combout\,
	clrn => \clk_rst_module_inst|rst_80m_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_domain_1_inst|timer_inst|led_red~q\);

-- Location: FF_X1_Y9_N3
\clk_domain_1_inst|timer_inst|led_grn\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \clk_domain_1_inst|timer_control_int.timer_enable~q\,
	clrn => \clk_rst_module_inst|rst_80m_n~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_domain_1_inst|timer_inst|led_grn~q\);

-- Location: CLKCTRL_G4
\clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\);

-- Location: IOIBUF_X3_Y24_N8
\fpga_async_in_2~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_fpga_async_in_2,
	o => \fpga_async_in_2~input_o\);

-- Location: LCCOMB_X3_Y21_N18
\clk_rst_module_inst|rst_100m_n_ms~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_rst_module_inst|rst_100m_n_ms~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \clk_rst_module_inst|rst_100m_n_ms~feeder_combout\);

-- Location: FF_X3_Y21_N19
\clk_rst_module_inst|rst_100m_n_ms\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \clk_rst_module_inst|rst_100m_n_ms~feeder_combout\,
	clrn => \clk_rst_module_inst|pll_locked_debounced~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_rst_module_inst|rst_100m_n_ms~q\);

-- Location: LCCOMB_X3_Y21_N0
\clk_rst_module_inst|rst_100m_n~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_rst_module_inst|rst_100m_n~feeder_combout\ = \clk_rst_module_inst|rst_100m_n_ms~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \clk_rst_module_inst|rst_100m_n_ms~q\,
	combout => \clk_rst_module_inst|rst_100m_n~feeder_combout\);

-- Location: FF_X3_Y21_N1
\clk_rst_module_inst|rst_100m_n\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \clk_rst_module_inst|rst_100m_n~feeder_combout\,
	clrn => \clk_rst_module_inst|pll_locked_debounced~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_rst_module_inst|rst_100m_n~q\);

-- Location: FF_X2_Y21_N9
\clk_domain_2_inst|enable_ms\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \fpga_async_in_2~input_o\,
	clrn => \clk_rst_module_inst|rst_100m_n~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_domain_2_inst|enable_ms~q\);

-- Location: FF_X2_Y21_N31
\clk_domain_2_inst|enable_msh\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \clk_domain_2_inst|enable_ms~q\,
	clrn => \clk_rst_module_inst|rst_100m_n~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_domain_2_inst|enable_msh~q\);

-- Location: FF_X2_Y21_N19
\clk_domain_2_inst|state_machine_control_int.enable\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \clk_domain_2_inst|enable_msh~q\,
	clrn => \clk_rst_module_inst|rst_100m_n~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_domain_2_inst|state_machine_control_int.enable~q\);

-- Location: LCCOMB_X1_Y21_N6
\clk_domain_2_inst|state_machine_inst|enable_r1~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_2_inst|state_machine_inst|enable_r1~feeder_combout\ = \clk_domain_2_inst|state_machine_control_int.enable~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \clk_domain_2_inst|state_machine_control_int.enable~q\,
	combout => \clk_domain_2_inst|state_machine_inst|enable_r1~feeder_combout\);

-- Location: FF_X1_Y21_N7
\clk_domain_2_inst|state_machine_inst|enable_r1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \clk_domain_2_inst|state_machine_inst|enable_r1~feeder_combout\,
	clrn => \clk_rst_module_inst|rst_100m_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_domain_2_inst|state_machine_inst|enable_r1~q\);

-- Location: LCCOMB_X2_Y21_N24
\clk_domain_2_inst|state_machine_inst|enable_edge_detect_proc~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_2_inst|state_machine_inst|enable_edge_detect_proc~1_combout\ = (!\clk_domain_2_inst|state_machine_control_int.enable~q\ & \clk_domain_2_inst|state_machine_inst|enable_r1~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_domain_2_inst|state_machine_control_int.enable~q\,
	datac => \clk_domain_2_inst|state_machine_inst|enable_r1~q\,
	combout => \clk_domain_2_inst|state_machine_inst|enable_edge_detect_proc~1_combout\);

-- Location: FF_X2_Y21_N25
\clk_domain_2_inst|state_machine_inst|en_falling\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \clk_domain_2_inst|state_machine_inst|enable_edge_detect_proc~1_combout\,
	clrn => \clk_rst_module_inst|rst_100m_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_domain_2_inst|state_machine_inst|en_falling~q\);

-- Location: LCCOMB_X2_Y21_N12
\clk_domain_2_inst|state_machine_inst|enable_edge_detect_proc~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_2_inst|state_machine_inst|enable_edge_detect_proc~0_combout\ = (\clk_domain_2_inst|state_machine_control_int.enable~q\ & !\clk_domain_2_inst|state_machine_inst|enable_r1~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_domain_2_inst|state_machine_control_int.enable~q\,
	datac => \clk_domain_2_inst|state_machine_inst|enable_r1~q\,
	combout => \clk_domain_2_inst|state_machine_inst|enable_edge_detect_proc~0_combout\);

-- Location: FF_X2_Y21_N13
\clk_domain_2_inst|state_machine_inst|en_rising\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \clk_domain_2_inst|state_machine_inst|enable_edge_detect_proc~0_combout\,
	clrn => \clk_rst_module_inst|rst_100m_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_domain_2_inst|state_machine_inst|en_rising~q\);

-- Location: LCCOMB_X2_Y21_N0
\clk_domain_2_inst|state_machine_inst|enable_int~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_2_inst|state_machine_inst|enable_int~0_combout\ = (\clk_domain_2_inst|state_machine_inst|en_rising~q\) # ((!\clk_domain_2_inst|state_machine_inst|en_falling~q\ & \clk_domain_2_inst|state_machine_inst|enable_int~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \clk_domain_2_inst|state_machine_inst|en_falling~q\,
	datac => \clk_domain_2_inst|state_machine_inst|enable_int~q\,
	datad => \clk_domain_2_inst|state_machine_inst|en_rising~q\,
	combout => \clk_domain_2_inst|state_machine_inst|enable_int~0_combout\);

-- Location: FF_X2_Y21_N1
\clk_domain_2_inst|state_machine_inst|enable_int\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \clk_domain_2_inst|state_machine_inst|enable_int~0_combout\,
	clrn => \clk_rst_module_inst|rst_100m_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_domain_2_inst|state_machine_inst|enable_int~q\);

-- Location: LCCOMB_X1_Y9_N16
\clk_domain_1_inst|timer_inst|state_machine_counter~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_1_inst|timer_inst|state_machine_counter~0_combout\ = (!\clk_domain_1_inst|timer_inst|Equal1~3_combout\ & (!\clk_domain_1_inst|timer_inst|state_machine_counter\(0) & !\clk_domain_1_inst|timer_inst|state_machine_counter\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_domain_1_inst|timer_inst|Equal1~3_combout\,
	datac => \clk_domain_1_inst|timer_inst|state_machine_counter\(0),
	datad => \clk_domain_1_inst|timer_inst|state_machine_counter\(1),
	combout => \clk_domain_1_inst|timer_inst|state_machine_counter~0_combout\);

-- Location: FF_X1_Y9_N17
\clk_domain_1_inst|timer_inst|state_machine_counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \clk_domain_1_inst|timer_inst|state_machine_counter~0_combout\,
	clrn => \clk_rst_module_inst|rst_80m_n~q\,
	ena => \clk_domain_1_inst|timer_inst|timer[11]~39_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_domain_1_inst|timer_inst|state_machine_counter\(0));

-- Location: LCCOMB_X1_Y9_N0
\clk_domain_1_inst|timer_inst|state_machine_counter~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_1_inst|timer_inst|state_machine_counter~1_combout\ = (!\clk_domain_1_inst|timer_inst|Equal1~3_combout\ & (!\clk_domain_1_inst|timer_inst|state_machine_counter\(1) & \clk_domain_1_inst|timer_inst|state_machine_counter\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_domain_1_inst|timer_inst|Equal1~3_combout\,
	datac => \clk_domain_1_inst|timer_inst|state_machine_counter\(1),
	datad => \clk_domain_1_inst|timer_inst|state_machine_counter\(0),
	combout => \clk_domain_1_inst|timer_inst|state_machine_counter~1_combout\);

-- Location: FF_X1_Y9_N1
\clk_domain_1_inst|timer_inst|state_machine_counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \clk_domain_1_inst|timer_inst|state_machine_counter~1_combout\,
	clrn => \clk_rst_module_inst|rst_80m_n~q\,
	ena => \clk_domain_1_inst|timer_inst|timer[11]~39_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_domain_1_inst|timer_inst|state_machine_counter\(1));

-- Location: LCCOMB_X1_Y9_N2
\clk_domain_1_inst|timer_inst|timer_state_machine_start~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_1_inst|timer_inst|timer_state_machine_start~0_combout\ = (!\clk_domain_1_inst|timer_inst|Equal1~3_combout\ & (\clk_domain_1_inst|timer_inst|state_machine_counter\(1) & !\clk_domain_1_inst|timer_inst|state_machine_counter\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_domain_1_inst|timer_inst|Equal1~3_combout\,
	datab => \clk_domain_1_inst|timer_inst|state_machine_counter\(1),
	datad => \clk_domain_1_inst|timer_inst|state_machine_counter\(0),
	combout => \clk_domain_1_inst|timer_inst|timer_state_machine_start~0_combout\);

-- Location: LCCOMB_X2_Y21_N4
\clk_domain_1_inst|timer_inst|timer_state_machine_start~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_1_inst|timer_inst|timer_state_machine_start~feeder_combout\ = \clk_domain_1_inst|timer_inst|timer_state_machine_start~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \clk_domain_1_inst|timer_inst|timer_state_machine_start~0_combout\,
	combout => \clk_domain_1_inst|timer_inst|timer_state_machine_start~feeder_combout\);

-- Location: FF_X2_Y21_N5
\clk_domain_1_inst|timer_inst|timer_state_machine_start\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \clk_domain_1_inst|timer_inst|timer_state_machine_start~feeder_combout\,
	clrn => \clk_rst_module_inst|rst_80m_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_domain_1_inst|timer_inst|timer_state_machine_start~q\);

-- Location: FF_X2_Y21_N29
\clk_domain_2_inst|start_ms\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \clk_domain_1_inst|timer_inst|timer_state_machine_start~q\,
	clrn => \clk_rst_module_inst|rst_100m_n~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_domain_2_inst|start_ms~q\);

-- Location: LCCOMB_X1_Y21_N26
\clk_domain_2_inst|start_msh~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_2_inst|start_msh~feeder_combout\ = \clk_domain_2_inst|start_ms~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \clk_domain_2_inst|start_ms~q\,
	combout => \clk_domain_2_inst|start_msh~feeder_combout\);

-- Location: FF_X1_Y21_N27
\clk_domain_2_inst|start_msh\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \clk_domain_2_inst|start_msh~feeder_combout\,
	clrn => \clk_rst_module_inst|rst_100m_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_domain_2_inst|start_msh~q\);

-- Location: FF_X1_Y21_N21
\clk_domain_2_inst|state_machine_control_int.start\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \clk_domain_2_inst|start_msh~q\,
	clrn => \clk_rst_module_inst|rst_100m_n~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_domain_2_inst|state_machine_control_int.start~q\);

-- Location: LCCOMB_X2_Y22_N2
\clk_domain_2_inst|state_machine_inst|counter[0]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_2_inst|state_machine_inst|counter[0]~10_combout\ = \clk_domain_2_inst|state_machine_inst|counter\(0) $ (VCC)
-- \clk_domain_2_inst|state_machine_inst|counter[0]~11\ = CARRY(\clk_domain_2_inst|state_machine_inst|counter\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \clk_domain_2_inst|state_machine_inst|counter\(0),
	datad => VCC,
	combout => \clk_domain_2_inst|state_machine_inst|counter[0]~10_combout\,
	cout => \clk_domain_2_inst|state_machine_inst|counter[0]~11\);

-- Location: LCCOMB_X2_Y22_N30
\clk_domain_2_inst|state_machine_inst|counter[0]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_2_inst|state_machine_inst|counter[0]~18_combout\ = (!\clk_domain_2_inst|state_machine_inst|Equal0~2_combout\) # (!\clk_domain_2_inst|state_machine_inst|enable_int~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \clk_domain_2_inst|state_machine_inst|enable_int~q\,
	datad => \clk_domain_2_inst|state_machine_inst|Equal0~2_combout\,
	combout => \clk_domain_2_inst|state_machine_inst|counter[0]~18_combout\);

-- Location: FF_X2_Y22_N3
\clk_domain_2_inst|state_machine_inst|counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \clk_domain_2_inst|state_machine_inst|counter[0]~10_combout\,
	clrn => \clk_rst_module_inst|rst_100m_n~q\,
	sclr => \clk_domain_2_inst|state_machine_inst|counter[0]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_domain_2_inst|state_machine_inst|counter\(0));

-- Location: LCCOMB_X2_Y22_N4
\clk_domain_2_inst|state_machine_inst|counter[1]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_2_inst|state_machine_inst|counter[1]~12_combout\ = (\clk_domain_2_inst|state_machine_inst|counter\(1) & (!\clk_domain_2_inst|state_machine_inst|counter[0]~11\)) # (!\clk_domain_2_inst|state_machine_inst|counter\(1) & 
-- ((\clk_domain_2_inst|state_machine_inst|counter[0]~11\) # (GND)))
-- \clk_domain_2_inst|state_machine_inst|counter[1]~13\ = CARRY((!\clk_domain_2_inst|state_machine_inst|counter[0]~11\) # (!\clk_domain_2_inst|state_machine_inst|counter\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clk_domain_2_inst|state_machine_inst|counter\(1),
	datad => VCC,
	cin => \clk_domain_2_inst|state_machine_inst|counter[0]~11\,
	combout => \clk_domain_2_inst|state_machine_inst|counter[1]~12_combout\,
	cout => \clk_domain_2_inst|state_machine_inst|counter[1]~13\);

-- Location: FF_X2_Y22_N5
\clk_domain_2_inst|state_machine_inst|counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \clk_domain_2_inst|state_machine_inst|counter[1]~12_combout\,
	clrn => \clk_rst_module_inst|rst_100m_n~q\,
	sclr => \clk_domain_2_inst|state_machine_inst|counter[0]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_domain_2_inst|state_machine_inst|counter\(1));

-- Location: LCCOMB_X2_Y22_N6
\clk_domain_2_inst|state_machine_inst|counter[2]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_2_inst|state_machine_inst|counter[2]~14_combout\ = (\clk_domain_2_inst|state_machine_inst|counter\(2) & (\clk_domain_2_inst|state_machine_inst|counter[1]~13\ $ (GND))) # (!\clk_domain_2_inst|state_machine_inst|counter\(2) & 
-- (!\clk_domain_2_inst|state_machine_inst|counter[1]~13\ & VCC))
-- \clk_domain_2_inst|state_machine_inst|counter[2]~15\ = CARRY((\clk_domain_2_inst|state_machine_inst|counter\(2) & !\clk_domain_2_inst|state_machine_inst|counter[1]~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clk_domain_2_inst|state_machine_inst|counter\(2),
	datad => VCC,
	cin => \clk_domain_2_inst|state_machine_inst|counter[1]~13\,
	combout => \clk_domain_2_inst|state_machine_inst|counter[2]~14_combout\,
	cout => \clk_domain_2_inst|state_machine_inst|counter[2]~15\);

-- Location: FF_X2_Y22_N7
\clk_domain_2_inst|state_machine_inst|counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \clk_domain_2_inst|state_machine_inst|counter[2]~14_combout\,
	clrn => \clk_rst_module_inst|rst_100m_n~q\,
	sclr => \clk_domain_2_inst|state_machine_inst|counter[0]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_domain_2_inst|state_machine_inst|counter\(2));

-- Location: LCCOMB_X2_Y22_N8
\clk_domain_2_inst|state_machine_inst|counter[3]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_2_inst|state_machine_inst|counter[3]~16_combout\ = (\clk_domain_2_inst|state_machine_inst|counter\(3) & (!\clk_domain_2_inst|state_machine_inst|counter[2]~15\)) # (!\clk_domain_2_inst|state_machine_inst|counter\(3) & 
-- ((\clk_domain_2_inst|state_machine_inst|counter[2]~15\) # (GND)))
-- \clk_domain_2_inst|state_machine_inst|counter[3]~17\ = CARRY((!\clk_domain_2_inst|state_machine_inst|counter[2]~15\) # (!\clk_domain_2_inst|state_machine_inst|counter\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clk_domain_2_inst|state_machine_inst|counter\(3),
	datad => VCC,
	cin => \clk_domain_2_inst|state_machine_inst|counter[2]~15\,
	combout => \clk_domain_2_inst|state_machine_inst|counter[3]~16_combout\,
	cout => \clk_domain_2_inst|state_machine_inst|counter[3]~17\);

-- Location: FF_X2_Y22_N9
\clk_domain_2_inst|state_machine_inst|counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \clk_domain_2_inst|state_machine_inst|counter[3]~16_combout\,
	clrn => \clk_rst_module_inst|rst_100m_n~q\,
	sclr => \clk_domain_2_inst|state_machine_inst|counter[0]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_domain_2_inst|state_machine_inst|counter\(3));

-- Location: LCCOMB_X2_Y22_N24
\clk_domain_2_inst|state_machine_inst|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_2_inst|state_machine_inst|Equal0~0_combout\ = (((\clk_domain_2_inst|state_machine_inst|counter\(3)) # (!\clk_domain_2_inst|state_machine_inst|counter\(0))) # (!\clk_domain_2_inst|state_machine_inst|counter\(1))) # 
-- (!\clk_domain_2_inst|state_machine_inst|counter\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_domain_2_inst|state_machine_inst|counter\(2),
	datab => \clk_domain_2_inst|state_machine_inst|counter\(1),
	datac => \clk_domain_2_inst|state_machine_inst|counter\(3),
	datad => \clk_domain_2_inst|state_machine_inst|counter\(0),
	combout => \clk_domain_2_inst|state_machine_inst|Equal0~0_combout\);

-- Location: LCCOMB_X2_Y22_N10
\clk_domain_2_inst|state_machine_inst|counter[4]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_2_inst|state_machine_inst|counter[4]~19_combout\ = (\clk_domain_2_inst|state_machine_inst|counter\(4) & (\clk_domain_2_inst|state_machine_inst|counter[3]~17\ $ (GND))) # (!\clk_domain_2_inst|state_machine_inst|counter\(4) & 
-- (!\clk_domain_2_inst|state_machine_inst|counter[3]~17\ & VCC))
-- \clk_domain_2_inst|state_machine_inst|counter[4]~20\ = CARRY((\clk_domain_2_inst|state_machine_inst|counter\(4) & !\clk_domain_2_inst|state_machine_inst|counter[3]~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clk_domain_2_inst|state_machine_inst|counter\(4),
	datad => VCC,
	cin => \clk_domain_2_inst|state_machine_inst|counter[3]~17\,
	combout => \clk_domain_2_inst|state_machine_inst|counter[4]~19_combout\,
	cout => \clk_domain_2_inst|state_machine_inst|counter[4]~20\);

-- Location: FF_X2_Y22_N11
\clk_domain_2_inst|state_machine_inst|counter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \clk_domain_2_inst|state_machine_inst|counter[4]~19_combout\,
	clrn => \clk_rst_module_inst|rst_100m_n~q\,
	sclr => \clk_domain_2_inst|state_machine_inst|counter[0]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_domain_2_inst|state_machine_inst|counter\(4));

-- Location: LCCOMB_X2_Y22_N12
\clk_domain_2_inst|state_machine_inst|counter[5]~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_2_inst|state_machine_inst|counter[5]~21_combout\ = (\clk_domain_2_inst|state_machine_inst|counter\(5) & (!\clk_domain_2_inst|state_machine_inst|counter[4]~20\)) # (!\clk_domain_2_inst|state_machine_inst|counter\(5) & 
-- ((\clk_domain_2_inst|state_machine_inst|counter[4]~20\) # (GND)))
-- \clk_domain_2_inst|state_machine_inst|counter[5]~22\ = CARRY((!\clk_domain_2_inst|state_machine_inst|counter[4]~20\) # (!\clk_domain_2_inst|state_machine_inst|counter\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clk_domain_2_inst|state_machine_inst|counter\(5),
	datad => VCC,
	cin => \clk_domain_2_inst|state_machine_inst|counter[4]~20\,
	combout => \clk_domain_2_inst|state_machine_inst|counter[5]~21_combout\,
	cout => \clk_domain_2_inst|state_machine_inst|counter[5]~22\);

-- Location: FF_X2_Y22_N13
\clk_domain_2_inst|state_machine_inst|counter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \clk_domain_2_inst|state_machine_inst|counter[5]~21_combout\,
	clrn => \clk_rst_module_inst|rst_100m_n~q\,
	sclr => \clk_domain_2_inst|state_machine_inst|counter[0]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_domain_2_inst|state_machine_inst|counter\(5));

-- Location: LCCOMB_X2_Y22_N14
\clk_domain_2_inst|state_machine_inst|counter[6]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_2_inst|state_machine_inst|counter[6]~23_combout\ = (\clk_domain_2_inst|state_machine_inst|counter\(6) & (\clk_domain_2_inst|state_machine_inst|counter[5]~22\ $ (GND))) # (!\clk_domain_2_inst|state_machine_inst|counter\(6) & 
-- (!\clk_domain_2_inst|state_machine_inst|counter[5]~22\ & VCC))
-- \clk_domain_2_inst|state_machine_inst|counter[6]~24\ = CARRY((\clk_domain_2_inst|state_machine_inst|counter\(6) & !\clk_domain_2_inst|state_machine_inst|counter[5]~22\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clk_domain_2_inst|state_machine_inst|counter\(6),
	datad => VCC,
	cin => \clk_domain_2_inst|state_machine_inst|counter[5]~22\,
	combout => \clk_domain_2_inst|state_machine_inst|counter[6]~23_combout\,
	cout => \clk_domain_2_inst|state_machine_inst|counter[6]~24\);

-- Location: FF_X2_Y22_N15
\clk_domain_2_inst|state_machine_inst|counter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \clk_domain_2_inst|state_machine_inst|counter[6]~23_combout\,
	clrn => \clk_rst_module_inst|rst_100m_n~q\,
	sclr => \clk_domain_2_inst|state_machine_inst|counter[0]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_domain_2_inst|state_machine_inst|counter\(6));

-- Location: LCCOMB_X2_Y22_N16
\clk_domain_2_inst|state_machine_inst|counter[7]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_2_inst|state_machine_inst|counter[7]~25_combout\ = (\clk_domain_2_inst|state_machine_inst|counter\(7) & (!\clk_domain_2_inst|state_machine_inst|counter[6]~24\)) # (!\clk_domain_2_inst|state_machine_inst|counter\(7) & 
-- ((\clk_domain_2_inst|state_machine_inst|counter[6]~24\) # (GND)))
-- \clk_domain_2_inst|state_machine_inst|counter[7]~26\ = CARRY((!\clk_domain_2_inst|state_machine_inst|counter[6]~24\) # (!\clk_domain_2_inst|state_machine_inst|counter\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clk_domain_2_inst|state_machine_inst|counter\(7),
	datad => VCC,
	cin => \clk_domain_2_inst|state_machine_inst|counter[6]~24\,
	combout => \clk_domain_2_inst|state_machine_inst|counter[7]~25_combout\,
	cout => \clk_domain_2_inst|state_machine_inst|counter[7]~26\);

-- Location: FF_X2_Y22_N17
\clk_domain_2_inst|state_machine_inst|counter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \clk_domain_2_inst|state_machine_inst|counter[7]~25_combout\,
	clrn => \clk_rst_module_inst|rst_100m_n~q\,
	sclr => \clk_domain_2_inst|state_machine_inst|counter[0]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_domain_2_inst|state_machine_inst|counter\(7));

-- Location: LCCOMB_X2_Y22_N18
\clk_domain_2_inst|state_machine_inst|counter[8]~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_2_inst|state_machine_inst|counter[8]~27_combout\ = (\clk_domain_2_inst|state_machine_inst|counter\(8) & (\clk_domain_2_inst|state_machine_inst|counter[7]~26\ $ (GND))) # (!\clk_domain_2_inst|state_machine_inst|counter\(8) & 
-- (!\clk_domain_2_inst|state_machine_inst|counter[7]~26\ & VCC))
-- \clk_domain_2_inst|state_machine_inst|counter[8]~28\ = CARRY((\clk_domain_2_inst|state_machine_inst|counter\(8) & !\clk_domain_2_inst|state_machine_inst|counter[7]~26\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clk_domain_2_inst|state_machine_inst|counter\(8),
	datad => VCC,
	cin => \clk_domain_2_inst|state_machine_inst|counter[7]~26\,
	combout => \clk_domain_2_inst|state_machine_inst|counter[8]~27_combout\,
	cout => \clk_domain_2_inst|state_machine_inst|counter[8]~28\);

-- Location: FF_X2_Y22_N19
\clk_domain_2_inst|state_machine_inst|counter[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \clk_domain_2_inst|state_machine_inst|counter[8]~27_combout\,
	clrn => \clk_rst_module_inst|rst_100m_n~q\,
	sclr => \clk_domain_2_inst|state_machine_inst|counter[0]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_domain_2_inst|state_machine_inst|counter\(8));

-- Location: LCCOMB_X2_Y22_N20
\clk_domain_2_inst|state_machine_inst|counter[9]~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_2_inst|state_machine_inst|counter[9]~29_combout\ = \clk_domain_2_inst|state_machine_inst|counter[8]~28\ $ (\clk_domain_2_inst|state_machine_inst|counter\(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \clk_domain_2_inst|state_machine_inst|counter\(9),
	cin => \clk_domain_2_inst|state_machine_inst|counter[8]~28\,
	combout => \clk_domain_2_inst|state_machine_inst|counter[9]~29_combout\);

-- Location: FF_X2_Y22_N21
\clk_domain_2_inst|state_machine_inst|counter[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \clk_domain_2_inst|state_machine_inst|counter[9]~29_combout\,
	clrn => \clk_rst_module_inst|rst_100m_n~q\,
	sclr => \clk_domain_2_inst|state_machine_inst|counter[0]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_domain_2_inst|state_machine_inst|counter\(9));

-- Location: LCCOMB_X2_Y22_N26
\clk_domain_2_inst|state_machine_inst|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_2_inst|state_machine_inst|Equal0~1_combout\ = (((\clk_domain_2_inst|state_machine_inst|counter\(4)) # (!\clk_domain_2_inst|state_machine_inst|counter\(6))) # (!\clk_domain_2_inst|state_machine_inst|counter\(7))) # 
-- (!\clk_domain_2_inst|state_machine_inst|counter\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_domain_2_inst|state_machine_inst|counter\(5),
	datab => \clk_domain_2_inst|state_machine_inst|counter\(7),
	datac => \clk_domain_2_inst|state_machine_inst|counter\(6),
	datad => \clk_domain_2_inst|state_machine_inst|counter\(4),
	combout => \clk_domain_2_inst|state_machine_inst|Equal0~1_combout\);

-- Location: LCCOMB_X2_Y22_N28
\clk_domain_2_inst|state_machine_inst|Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_2_inst|state_machine_inst|Equal0~2_combout\ = (\clk_domain_2_inst|state_machine_inst|Equal0~0_combout\) # (((\clk_domain_2_inst|state_machine_inst|Equal0~1_combout\) # (!\clk_domain_2_inst|state_machine_inst|counter\(8))) # 
-- (!\clk_domain_2_inst|state_machine_inst|counter\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_domain_2_inst|state_machine_inst|Equal0~0_combout\,
	datab => \clk_domain_2_inst|state_machine_inst|counter\(9),
	datac => \clk_domain_2_inst|state_machine_inst|Equal0~1_combout\,
	datad => \clk_domain_2_inst|state_machine_inst|counter\(8),
	combout => \clk_domain_2_inst|state_machine_inst|Equal0~2_combout\);

-- Location: LCCOMB_X2_Y21_N26
\clk_domain_2_inst|state_machine_inst|clk_en~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_2_inst|state_machine_inst|clk_en~0_combout\ = (\clk_domain_2_inst|state_machine_inst|enable_int~q\ & !\clk_domain_2_inst|state_machine_inst|Equal0~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \clk_domain_2_inst|state_machine_inst|enable_int~q\,
	datad => \clk_domain_2_inst|state_machine_inst|Equal0~2_combout\,
	combout => \clk_domain_2_inst|state_machine_inst|clk_en~0_combout\);

-- Location: FF_X2_Y21_N27
\clk_domain_2_inst|state_machine_inst|clk_en\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \clk_domain_2_inst|state_machine_inst|clk_en~0_combout\,
	clrn => \clk_rst_module_inst|rst_100m_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_domain_2_inst|state_machine_inst|clk_en~q\);

-- Location: LCCOMB_X1_Y21_N22
\clk_domain_2_inst|state_machine_inst|Selector22~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_2_inst|state_machine_inst|Selector22~1_combout\ = (\clk_domain_2_inst|state_machine_inst|enable_int~q\ & (\clk_domain_2_inst|state_machine_inst|fibonacci_state.loop_st~q\ & !\clk_domain_2_inst|state_machine_inst|clk_en~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \clk_domain_2_inst|state_machine_inst|enable_int~q\,
	datac => \clk_domain_2_inst|state_machine_inst|fibonacci_state.loop_st~q\,
	datad => \clk_domain_2_inst|state_machine_inst|clk_en~q\,
	combout => \clk_domain_2_inst|state_machine_inst|Selector22~1_combout\);

-- Location: LCCOMB_X2_Y21_N8
\clk_domain_2_inst|state_machine_inst|Selector1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_2_inst|state_machine_inst|Selector1~0_combout\ = (\clk_domain_2_inst|state_machine_inst|fibonacci_state.calculate_st~q\ & ((!\clk_domain_2_inst|state_machine_inst|enable_int~q\) # (!\clk_domain_2_inst|state_machine_inst|clk_en~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_domain_2_inst|state_machine_inst|fibonacci_state.calculate_st~q\,
	datab => \clk_domain_2_inst|state_machine_inst|clk_en~q\,
	datad => \clk_domain_2_inst|state_machine_inst|enable_int~q\,
	combout => \clk_domain_2_inst|state_machine_inst|Selector1~0_combout\);

-- Location: LCCOMB_X3_Y21_N24
\clk_domain_2_inst|state_machine_inst|fibonacci_state.end_st~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_2_inst|state_machine_inst|fibonacci_state.end_st~2_combout\ = (\clk_domain_2_inst|state_machine_inst|clk_en~q\ & (\clk_domain_2_inst|state_machine_inst|enable_int~q\ & (\clk_domain_2_inst|state_machine_inst|LessThan0~0_combout\ & 
-- \clk_domain_2_inst|state_machine_inst|fibonacci_state.loop_st~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_domain_2_inst|state_machine_inst|clk_en~q\,
	datab => \clk_domain_2_inst|state_machine_inst|enable_int~q\,
	datac => \clk_domain_2_inst|state_machine_inst|LessThan0~0_combout\,
	datad => \clk_domain_2_inst|state_machine_inst|fibonacci_state.loop_st~q\,
	combout => \clk_domain_2_inst|state_machine_inst|fibonacci_state.end_st~2_combout\);

-- Location: LCCOMB_X1_Y21_N16
\clk_domain_2_inst|state_machine_inst|fibonacci_state.calculate_st~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_2_inst|state_machine_inst|fibonacci_state.calculate_st~4_combout\ = (\clk_domain_2_inst|state_machine_inst|enable_int~q\ & (!\clk_domain_2_inst|state_machine_inst|clk_en~q\ & ((\clk_domain_2_inst|state_machine_inst|fibonacci_state.idle_st~q\) 
-- # (!\clk_domain_2_inst|state_machine_control_int.start~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_domain_2_inst|state_machine_inst|fibonacci_state.idle_st~q\,
	datab => \clk_domain_2_inst|state_machine_control_int.start~q\,
	datac => \clk_domain_2_inst|state_machine_inst|enable_int~q\,
	datad => \clk_domain_2_inst|state_machine_inst|clk_en~q\,
	combout => \clk_domain_2_inst|state_machine_inst|fibonacci_state.calculate_st~4_combout\);

-- Location: LCCOMB_X1_Y21_N28
\clk_domain_2_inst|state_machine_inst|fibonacci_state.calculate_st~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_2_inst|state_machine_inst|fibonacci_state.calculate_st~2_combout\ = (\clk_domain_2_inst|state_machine_inst|fibonacci_state.idle_st~q\ & (\clk_domain_2_inst|state_machine_inst|enable_int~q\ & 
-- ((\clk_domain_2_inst|state_machine_control_int.start~q\) # (!\clk_domain_2_inst|state_machine_inst|fibonacci_state.end_st~q\)))) # (!\clk_domain_2_inst|state_machine_inst|fibonacci_state.idle_st~q\ & 
-- (((!\clk_domain_2_inst|state_machine_inst|enable_int~q\)) # (!\clk_domain_2_inst|state_machine_control_int.start~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001010110110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_domain_2_inst|state_machine_inst|fibonacci_state.idle_st~q\,
	datab => \clk_domain_2_inst|state_machine_control_int.start~q\,
	datac => \clk_domain_2_inst|state_machine_inst|enable_int~q\,
	datad => \clk_domain_2_inst|state_machine_inst|fibonacci_state.end_st~q\,
	combout => \clk_domain_2_inst|state_machine_inst|fibonacci_state.calculate_st~2_combout\);

-- Location: LCCOMB_X1_Y21_N14
\clk_domain_2_inst|state_machine_inst|fibonacci_state.calculate_st~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_2_inst|state_machine_inst|fibonacci_state.calculate_st~3_combout\ = (\clk_domain_2_inst|state_machine_inst|fibonacci_state.calculate_st~2_combout\ & (((!\clk_domain_2_inst|state_machine_inst|fibonacci_state.loop_st~q\ & 
-- !\clk_domain_2_inst|state_machine_inst|fibonacci_state.calculate_st~q\)) # (!\clk_domain_2_inst|state_machine_inst|enable_int~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_domain_2_inst|state_machine_inst|fibonacci_state.calculate_st~2_combout\,
	datab => \clk_domain_2_inst|state_machine_inst|fibonacci_state.loop_st~q\,
	datac => \clk_domain_2_inst|state_machine_inst|enable_int~q\,
	datad => \clk_domain_2_inst|state_machine_inst|fibonacci_state.calculate_st~q\,
	combout => \clk_domain_2_inst|state_machine_inst|fibonacci_state.calculate_st~3_combout\);

-- Location: LCCOMB_X2_Y21_N30
\clk_domain_2_inst|state_machine_inst|fibonacci_state.calculate_st~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_2_inst|state_machine_inst|fibonacci_state.calculate_st~5_combout\ = (!\clk_domain_2_inst|state_machine_inst|fibonacci_state.calculate_st~4_combout\ & (\clk_rst_module_inst|rst_100m_n~q\ & 
-- !\clk_domain_2_inst|state_machine_inst|fibonacci_state.calculate_st~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_domain_2_inst|state_machine_inst|fibonacci_state.calculate_st~4_combout\,
	datab => \clk_rst_module_inst|rst_100m_n~q\,
	datad => \clk_domain_2_inst|state_machine_inst|fibonacci_state.calculate_st~3_combout\,
	combout => \clk_domain_2_inst|state_machine_inst|fibonacci_state.calculate_st~5_combout\);

-- Location: FF_X3_Y21_N25
\clk_domain_2_inst|state_machine_inst|fibonacci_state.end_st\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \clk_domain_2_inst|state_machine_inst|fibonacci_state.end_st~2_combout\,
	ena => \clk_domain_2_inst|state_machine_inst|fibonacci_state.calculate_st~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_domain_2_inst|state_machine_inst|fibonacci_state.end_st~q\);

-- Location: LCCOMB_X2_Y21_N18
\clk_domain_2_inst|state_machine_inst|fibonacci_num~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_2_inst|state_machine_inst|fibonacci_num~0_combout\ = (\clk_domain_2_inst|state_machine_inst|fibonacci_state.end_st~q\) # (\clk_domain_2_inst|state_machine_inst|fibonacci_state.loop_st~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_domain_2_inst|state_machine_inst|fibonacci_state.end_st~q\,
	datad => \clk_domain_2_inst|state_machine_inst|fibonacci_state.loop_st~q\,
	combout => \clk_domain_2_inst|state_machine_inst|fibonacci_num~0_combout\);

-- Location: LCCOMB_X3_Y21_N4
\clk_domain_2_inst|state_machine_inst|state_machine_proc~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_2_inst|state_machine_inst|state_machine_proc~0_combout\ = (\clk_domain_2_inst|state_machine_inst|clk_en~q\ & \clk_domain_2_inst|state_machine_inst|enable_int~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_domain_2_inst|state_machine_inst|clk_en~q\,
	datac => \clk_domain_2_inst|state_machine_inst|enable_int~q\,
	combout => \clk_domain_2_inst|state_machine_inst|state_machine_proc~0_combout\);

-- Location: LCCOMB_X2_Y21_N20
\clk_domain_2_inst|state_machine_inst|Selector3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_2_inst|state_machine_inst|Selector3~0_combout\ = (\clk_domain_2_inst|state_machine_inst|fib_it\(0) & ((\clk_domain_2_inst|state_machine_inst|fibonacci_num~0_combout\) # ((\clk_domain_2_inst|state_machine_inst|fibonacci_state.calculate_st~q\ & 
-- !\clk_domain_2_inst|state_machine_inst|state_machine_proc~0_combout\)))) # (!\clk_domain_2_inst|state_machine_inst|fib_it\(0) & (\clk_domain_2_inst|state_machine_inst|fibonacci_state.calculate_st~q\ & 
-- ((\clk_domain_2_inst|state_machine_inst|state_machine_proc~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_domain_2_inst|state_machine_inst|fibonacci_state.calculate_st~q\,
	datab => \clk_domain_2_inst|state_machine_inst|fibonacci_num~0_combout\,
	datac => \clk_domain_2_inst|state_machine_inst|fib_it\(0),
	datad => \clk_domain_2_inst|state_machine_inst|state_machine_proc~0_combout\,
	combout => \clk_domain_2_inst|state_machine_inst|Selector3~0_combout\);

-- Location: FF_X2_Y21_N21
\clk_domain_2_inst|state_machine_inst|fib_it[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \clk_domain_2_inst|state_machine_inst|Selector3~0_combout\,
	clrn => \clk_rst_module_inst|rst_100m_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_domain_2_inst|state_machine_inst|fib_it\(0));

-- Location: LCCOMB_X2_Y21_N28
\clk_domain_2_inst|state_machine_inst|Selector2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_2_inst|state_machine_inst|Selector2~0_combout\ = (\clk_domain_2_inst|state_machine_inst|fibonacci_state.calculate_st~6_combout\ & (\clk_domain_2_inst|state_machine_inst|fib_it\(1) $ (\clk_domain_2_inst|state_machine_inst|fib_it\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_domain_2_inst|state_machine_inst|fib_it\(1),
	datab => \clk_domain_2_inst|state_machine_inst|fib_it\(0),
	datad => \clk_domain_2_inst|state_machine_inst|fibonacci_state.calculate_st~6_combout\,
	combout => \clk_domain_2_inst|state_machine_inst|Selector2~0_combout\);

-- Location: LCCOMB_X2_Y21_N22
\clk_domain_2_inst|state_machine_inst|Selector2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_2_inst|state_machine_inst|Selector2~1_combout\ = (\clk_domain_2_inst|state_machine_inst|Selector2~0_combout\) # ((\clk_domain_2_inst|state_machine_inst|fib_it\(1) & ((\clk_domain_2_inst|state_machine_inst|Selector1~0_combout\) # 
-- (\clk_domain_2_inst|state_machine_inst|fibonacci_num~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_domain_2_inst|state_machine_inst|Selector1~0_combout\,
	datab => \clk_domain_2_inst|state_machine_inst|fibonacci_num~0_combout\,
	datac => \clk_domain_2_inst|state_machine_inst|fib_it\(1),
	datad => \clk_domain_2_inst|state_machine_inst|Selector2~0_combout\,
	combout => \clk_domain_2_inst|state_machine_inst|Selector2~1_combout\);

-- Location: FF_X2_Y21_N23
\clk_domain_2_inst|state_machine_inst|fib_it[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \clk_domain_2_inst|state_machine_inst|Selector2~1_combout\,
	clrn => \clk_rst_module_inst|rst_100m_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_domain_2_inst|state_machine_inst|fib_it\(1));

-- Location: LCCOMB_X2_Y21_N10
\clk_domain_2_inst|state_machine_inst|Selector1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_2_inst|state_machine_inst|Selector1~1_combout\ = (\clk_domain_2_inst|state_machine_inst|fibonacci_state.calculate_st~6_combout\ & (\clk_domain_2_inst|state_machine_inst|fib_it\(2) $ (((\clk_domain_2_inst|state_machine_inst|fib_it\(1) & 
-- \clk_domain_2_inst|state_machine_inst|fib_it\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_domain_2_inst|state_machine_inst|fib_it\(1),
	datab => \clk_domain_2_inst|state_machine_inst|fib_it\(0),
	datac => \clk_domain_2_inst|state_machine_inst|fibonacci_state.calculate_st~6_combout\,
	datad => \clk_domain_2_inst|state_machine_inst|fib_it\(2),
	combout => \clk_domain_2_inst|state_machine_inst|Selector1~1_combout\);

-- Location: LCCOMB_X2_Y21_N2
\clk_domain_2_inst|state_machine_inst|Selector1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_2_inst|state_machine_inst|Selector1~2_combout\ = (\clk_domain_2_inst|state_machine_inst|Selector1~1_combout\) # ((\clk_domain_2_inst|state_machine_inst|fib_it\(2) & ((\clk_domain_2_inst|state_machine_inst|Selector1~0_combout\) # 
-- (\clk_domain_2_inst|state_machine_inst|fibonacci_num~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_domain_2_inst|state_machine_inst|Selector1~0_combout\,
	datab => \clk_domain_2_inst|state_machine_inst|fibonacci_num~0_combout\,
	datac => \clk_domain_2_inst|state_machine_inst|fib_it\(2),
	datad => \clk_domain_2_inst|state_machine_inst|Selector1~1_combout\,
	combout => \clk_domain_2_inst|state_machine_inst|Selector1~2_combout\);

-- Location: FF_X2_Y21_N3
\clk_domain_2_inst|state_machine_inst|fib_it[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \clk_domain_2_inst|state_machine_inst|Selector1~2_combout\,
	clrn => \clk_rst_module_inst|rst_100m_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_domain_2_inst|state_machine_inst|fib_it\(2));

-- Location: LCCOMB_X2_Y21_N14
\clk_domain_2_inst|state_machine_inst|Add2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_2_inst|state_machine_inst|Add2~0_combout\ = \clk_domain_2_inst|state_machine_inst|fib_it\(3) $ (((\clk_domain_2_inst|state_machine_inst|fib_it\(2) & (\clk_domain_2_inst|state_machine_inst|fib_it\(1) & 
-- \clk_domain_2_inst|state_machine_inst|fib_it\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_domain_2_inst|state_machine_inst|fib_it\(3),
	datab => \clk_domain_2_inst|state_machine_inst|fib_it\(2),
	datac => \clk_domain_2_inst|state_machine_inst|fib_it\(1),
	datad => \clk_domain_2_inst|state_machine_inst|fib_it\(0),
	combout => \clk_domain_2_inst|state_machine_inst|Add2~0_combout\);

-- Location: LCCOMB_X3_Y21_N26
\clk_domain_2_inst|state_machine_inst|Selector0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_2_inst|state_machine_inst|Selector0~3_combout\ = (\clk_domain_2_inst|state_machine_inst|enable_int~q\ & (\clk_domain_2_inst|state_machine_inst|fibonacci_state.calculate_st~q\ & (\clk_domain_2_inst|state_machine_inst|clk_en~q\ & 
-- \clk_domain_2_inst|state_machine_inst|Add2~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_domain_2_inst|state_machine_inst|enable_int~q\,
	datab => \clk_domain_2_inst|state_machine_inst|fibonacci_state.calculate_st~q\,
	datac => \clk_domain_2_inst|state_machine_inst|clk_en~q\,
	datad => \clk_domain_2_inst|state_machine_inst|Add2~0_combout\,
	combout => \clk_domain_2_inst|state_machine_inst|Selector0~3_combout\);

-- Location: LCCOMB_X2_Y21_N6
\clk_domain_2_inst|state_machine_inst|Selector0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_2_inst|state_machine_inst|Selector0~2_combout\ = (\clk_domain_2_inst|state_machine_inst|Selector0~3_combout\) # ((\clk_domain_2_inst|state_machine_inst|fib_it\(3) & ((\clk_domain_2_inst|state_machine_inst|Selector1~0_combout\) # 
-- (\clk_domain_2_inst|state_machine_inst|fibonacci_num~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_domain_2_inst|state_machine_inst|Selector1~0_combout\,
	datab => \clk_domain_2_inst|state_machine_inst|fibonacci_num~0_combout\,
	datac => \clk_domain_2_inst|state_machine_inst|fib_it\(3),
	datad => \clk_domain_2_inst|state_machine_inst|Selector0~3_combout\,
	combout => \clk_domain_2_inst|state_machine_inst|Selector0~2_combout\);

-- Location: FF_X2_Y21_N7
\clk_domain_2_inst|state_machine_inst|fib_it[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \clk_domain_2_inst|state_machine_inst|Selector0~2_combout\,
	clrn => \clk_rst_module_inst|rst_100m_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_domain_2_inst|state_machine_inst|fib_it\(3));

-- Location: LCCOMB_X2_Y21_N16
\clk_domain_2_inst|state_machine_inst|LessThan0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_2_inst|state_machine_inst|LessThan0~0_combout\ = (\clk_domain_2_inst|state_machine_inst|fib_it\(3) & ((\clk_domain_2_inst|state_machine_inst|fib_it\(2)) # ((\clk_domain_2_inst|state_machine_inst|fib_it\(1)) # 
-- (\clk_domain_2_inst|state_machine_inst|fib_it\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_domain_2_inst|state_machine_inst|fib_it\(3),
	datab => \clk_domain_2_inst|state_machine_inst|fib_it\(2),
	datac => \clk_domain_2_inst|state_machine_inst|fib_it\(1),
	datad => \clk_domain_2_inst|state_machine_inst|fib_it\(0),
	combout => \clk_domain_2_inst|state_machine_inst|LessThan0~0_combout\);

-- Location: LCCOMB_X3_Y21_N30
\clk_domain_2_inst|state_machine_inst|fibonacci_state.calculate_st~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_2_inst|state_machine_inst|fibonacci_state.calculate_st~7_combout\ = (\clk_domain_2_inst|state_machine_inst|clk_en~q\ & (\clk_domain_2_inst|state_machine_inst|enable_int~q\ & (!\clk_domain_2_inst|state_machine_inst|LessThan0~0_combout\ & 
-- \clk_domain_2_inst|state_machine_inst|fibonacci_state.loop_st~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_domain_2_inst|state_machine_inst|clk_en~q\,
	datab => \clk_domain_2_inst|state_machine_inst|enable_int~q\,
	datac => \clk_domain_2_inst|state_machine_inst|LessThan0~0_combout\,
	datad => \clk_domain_2_inst|state_machine_inst|fibonacci_state.loop_st~q\,
	combout => \clk_domain_2_inst|state_machine_inst|fibonacci_state.calculate_st~7_combout\);

-- Location: FF_X3_Y21_N31
\clk_domain_2_inst|state_machine_inst|fibonacci_state.calculate_st\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \clk_domain_2_inst|state_machine_inst|fibonacci_state.calculate_st~7_combout\,
	ena => \clk_domain_2_inst|state_machine_inst|fibonacci_state.calculate_st~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_domain_2_inst|state_machine_inst|fibonacci_state.calculate_st~q\);

-- Location: LCCOMB_X1_Y21_N24
\clk_domain_2_inst|state_machine_inst|fibonacci_state.calculate_st~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_2_inst|state_machine_inst|fibonacci_state.calculate_st~6_combout\ = (\clk_domain_2_inst|state_machine_inst|fibonacci_state.calculate_st~q\ & (\clk_domain_2_inst|state_machine_inst|enable_int~q\ & 
-- \clk_domain_2_inst|state_machine_inst|clk_en~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \clk_domain_2_inst|state_machine_inst|fibonacci_state.calculate_st~q\,
	datac => \clk_domain_2_inst|state_machine_inst|enable_int~q\,
	datad => \clk_domain_2_inst|state_machine_inst|clk_en~q\,
	combout => \clk_domain_2_inst|state_machine_inst|fibonacci_state.calculate_st~6_combout\);

-- Location: LCCOMB_X1_Y21_N8
\clk_domain_2_inst|state_machine_inst|Selector22~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_2_inst|state_machine_inst|Selector22~2_combout\ = (\clk_domain_2_inst|state_machine_inst|Selector22~1_combout\) # ((\clk_domain_2_inst|state_machine_inst|fibonacci_state.calculate_st~6_combout\) # 
-- ((!\clk_domain_2_inst|state_machine_inst|Selector22~0_combout\ & \clk_domain_2_inst|state_machine_control_int.start~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_domain_2_inst|state_machine_inst|Selector22~0_combout\,
	datab => \clk_domain_2_inst|state_machine_control_int.start~q\,
	datac => \clk_domain_2_inst|state_machine_inst|Selector22~1_combout\,
	datad => \clk_domain_2_inst|state_machine_inst|fibonacci_state.calculate_st~6_combout\,
	combout => \clk_domain_2_inst|state_machine_inst|Selector22~2_combout\);

-- Location: FF_X1_Y21_N9
\clk_domain_2_inst|state_machine_inst|fibonacci_state.loop_st\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \clk_domain_2_inst|state_machine_inst|Selector22~2_combout\,
	ena => \clk_rst_module_inst|rst_100m_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_domain_2_inst|state_machine_inst|fibonacci_state.loop_st~q\);

-- Location: LCCOMB_X1_Y21_N10
\clk_domain_2_inst|state_machine_inst|Selector20~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_2_inst|state_machine_inst|Selector20~0_combout\ = (\clk_domain_2_inst|state_machine_inst|fibonacci_state.loop_st~q\) # (\clk_domain_2_inst|state_machine_inst|fibonacci_state.calculate_st~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \clk_domain_2_inst|state_machine_inst|fibonacci_state.loop_st~q\,
	datad => \clk_domain_2_inst|state_machine_inst|fibonacci_state.calculate_st~q\,
	combout => \clk_domain_2_inst|state_machine_inst|Selector20~0_combout\);

-- Location: LCCOMB_X1_Y21_N30
\clk_domain_2_inst|state_machine_inst|Selector20~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_2_inst|state_machine_inst|Selector20~1_combout\ = (\clk_domain_2_inst|state_machine_inst|clk_en~q\ & ((\clk_domain_2_inst|state_machine_control_int.start~q\) # ((\clk_domain_2_inst|state_machine_inst|fibonacci_state.idle_st~q\ & 
-- !\clk_domain_2_inst|state_machine_inst|fibonacci_state.end_st~q\)))) # (!\clk_domain_2_inst|state_machine_inst|clk_en~q\ & (((\clk_domain_2_inst|state_machine_inst|fibonacci_state.idle_st~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_domain_2_inst|state_machine_control_int.start~q\,
	datab => \clk_domain_2_inst|state_machine_inst|clk_en~q\,
	datac => \clk_domain_2_inst|state_machine_inst|fibonacci_state.idle_st~q\,
	datad => \clk_domain_2_inst|state_machine_inst|fibonacci_state.end_st~q\,
	combout => \clk_domain_2_inst|state_machine_inst|Selector20~1_combout\);

-- Location: LCCOMB_X1_Y21_N12
\clk_domain_2_inst|state_machine_inst|Selector20~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_2_inst|state_machine_inst|Selector20~2_combout\ = (\clk_domain_2_inst|state_machine_inst|fibonacci_state.idle_st~q\ & (\clk_domain_2_inst|state_machine_inst|fibonacci_state.end_st~q\ & ((\clk_domain_2_inst|state_machine_control_int.start~q\) # 
-- (!\clk_domain_2_inst|state_machine_inst|clk_en~q\)))) # (!\clk_domain_2_inst|state_machine_inst|fibonacci_state.idle_st~q\ & (\clk_domain_2_inst|state_machine_control_int.start~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_domain_2_inst|state_machine_control_int.start~q\,
	datab => \clk_domain_2_inst|state_machine_inst|clk_en~q\,
	datac => \clk_domain_2_inst|state_machine_inst|fibonacci_state.idle_st~q\,
	datad => \clk_domain_2_inst|state_machine_inst|fibonacci_state.end_st~q\,
	combout => \clk_domain_2_inst|state_machine_inst|Selector20~2_combout\);

-- Location: LCCOMB_X1_Y21_N4
\clk_domain_2_inst|state_machine_inst|Selector20~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_2_inst|state_machine_inst|Selector20~3_combout\ = (\clk_domain_2_inst|state_machine_inst|Selector20~0_combout\ & (\clk_domain_2_inst|state_machine_inst|enable_int~q\ & (\clk_domain_2_inst|state_machine_inst|Selector20~1_combout\))) # 
-- (!\clk_domain_2_inst|state_machine_inst|Selector20~0_combout\ & ((\clk_domain_2_inst|state_machine_inst|Selector20~2_combout\ & (\clk_domain_2_inst|state_machine_inst|enable_int~q\)) # (!\clk_domain_2_inst|state_machine_inst|Selector20~2_combout\ & 
-- ((\clk_domain_2_inst|state_machine_inst|Selector20~1_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_domain_2_inst|state_machine_inst|Selector20~0_combout\,
	datab => \clk_domain_2_inst|state_machine_inst|enable_int~q\,
	datac => \clk_domain_2_inst|state_machine_inst|Selector20~1_combout\,
	datad => \clk_domain_2_inst|state_machine_inst|Selector20~2_combout\,
	combout => \clk_domain_2_inst|state_machine_inst|Selector20~3_combout\);

-- Location: FF_X1_Y21_N5
\clk_domain_2_inst|state_machine_inst|fibonacci_state.idle_st\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \clk_domain_2_inst|state_machine_inst|Selector20~3_combout\,
	ena => \clk_rst_module_inst|rst_100m_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_domain_2_inst|state_machine_inst|fibonacci_state.idle_st~q\);

-- Location: LCCOMB_X1_Y21_N18
\clk_domain_2_inst|state_machine_inst|Selector22~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_domain_2_inst|state_machine_inst|Selector22~0_combout\ = (\clk_domain_2_inst|state_machine_inst|fibonacci_state.idle_st~q\) # (!\clk_domain_2_inst|state_machine_inst|enable_int~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \clk_domain_2_inst|state_machine_inst|enable_int~q\,
	datac => \clk_domain_2_inst|state_machine_inst|fibonacci_state.idle_st~q\,
	combout => \clk_domain_2_inst|state_machine_inst|Selector22~0_combout\);

-- Location: DDIOOUTCELL_X0_Y21_N25
\clk_domain_2_inst|state_machine_inst|led_red\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "high")
-- pragma translate_on
PORT MAP (
	clk => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \clk_domain_2_inst|state_machine_inst|ALT_INV_Selector22~0_combout\,
	asdata => VCC,
	aload => \clk_rst_module_inst|ALT_INV_rst_100m_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_domain_2_inst|state_machine_inst|led_red~q\);

-- Location: DDIOOUTCELL_X0_Y22_N18
\clk_domain_2_inst|state_machine_inst|led_grn\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "high")
-- pragma translate_on
PORT MAP (
	clk => \clk_rst_module_inst|pll_main_inst|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \clk_domain_2_inst|state_machine_inst|ALT_INV_enable_int~q\,
	asdata => VCC,
	aload => \clk_rst_module_inst|ALT_INV_rst_100m_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_domain_2_inst|state_machine_inst|led_grn~q\);
END structure;


