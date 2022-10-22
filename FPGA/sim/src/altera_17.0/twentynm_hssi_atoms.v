// Copyright (C) 2017 Intel Corporation. All rights reserved.
// This simulation model contains highly confidential and
// proprietary information of Intel and is being provided
// in accordance with and subject to the protections of the
// applicable Intel Program License Subscription Agreement
// which governs its use and disclosure. Your use of Intel
// Corporation's design tools, logic functions and other
// software and tools, and its AMPP partner logic functions,
// and any output files any of the foregoing (including device
// programming or simulation files), and any associated
// documentation or information are expressly subject to the
// terms and conditions of the Intel Program License Subscription
// Agreement, the Intel Quartus Prime License Agreement, the Intel
// MegaCore Function License Agreement, or other applicable 
// license agreement, including, without limitation, that your
// use is for the sole purpose of simulating designs for use 
// exclusively in logic devices manufactured by Intel and sold
// by Intel or its authorized distributors. Please refer to the
// applicable agreement for further details. Intel products and
// services are protected under numerous U.S. and foreign patents,
// maskwork rights, copyrights and other intellectual property laws.
// Intel assumes no responsibility or liability arising out of the
// application or use of this simulation model.
// Quartus Prime 17.0.1 Build 598 06/07/2017
// -----------------------------------------------------------
// This is auto-generated HSSI Simulation Atom Model Encryption Wrapper
// Module Name : work/twentynm_atx_pll_wrapper.v
// -----------------------------------------------------------

`timescale 1 ps/1 ps

module twentynm_atx_pll
#(
	// Parameter declaration and default value assignment

	parameter enable_debug_info = "true",	//Valid values: false|true; this is simulation-only parameter, for debug purpose only

	parameter	analog_mode = "user_custom" ,		//Valid values: user_custom 
	parameter	bandwidth_range_high = "0 hz" ,		//Valid values:  
	parameter	bandwidth_range_low = "0 hz" ,		//Valid values:  
	parameter	bonding = "pll_bonding" ,		//Valid values: cpri_bonding pll_bonding 
	parameter	bw_sel = "low" ,		//Valid values: low medium high 
	parameter	cal_status = "cal_done" ,		//Valid values: cal_done cal_in_progress 
	parameter	calibration_mode = "cal_off" ,		//Valid values: cal_off uc_rst_pll uc_rst_lf uc_not_rst 
	parameter	cascadeclk_test = "cascadetest_off" ,		//Valid values: cascadetest_off cascadetest_on 
	parameter	cgb_div = 1 ,		//Valid values: 0..15 
	parameter	clk_high_perf_voltage = 12'b000000000000 ,		//Valid values: 12 
	parameter	clk_low_power_voltage = 12'b000000000000 ,		//Valid values: 12 
	parameter	clk_mid_power_voltage = 12'b000000000000 ,		//Valid values: 12 
	parameter	cp_compensation_enable = "true" ,		//Valid values: false true 
	parameter	cp_current_setting = "cp_current_setting0" ,		//Valid values: cp_current_setting0 cp_current_setting1 cp_current_setting2 cp_current_setting3 cp_current_setting4 cp_current_setting5 cp_current_setting6 cp_current_setting7 cp_current_setting8 cp_current_setting9 cp_current_setting10 cp_current_setting11 cp_current_setting12 cp_current_setting13 cp_current_setting14 cp_current_setting15 cp_current_setting16 cp_current_setting17 cp_current_setting18 cp_current_setting19 cp_current_setting20 cp_current_setting21 cp_current_setting22 cp_current_setting23 cp_current_setting24 cp_current_setting25 cp_current_setting26 cp_current_setting27 cp_current_setting28 cp_current_setting29 cp_current_setting30 cp_current_setting31 cp_current_setting32 cp_current_setting33 cp_current_setting34 cp_current_setting35 cp_current_setting36 cp_current_setting37 cp_current_setting38 cp_current_setting39 cp_current_setting40 cp_current_setting41 
	parameter	cp_lf_3rd_pole_freq = "lf_3rd_pole_setting0" ,		//Valid values: lf_3rd_pole_setting0 lf_3rd_pole_setting1 lf_3rd_pole_setting2 lf_3rd_pole_setting3 
	parameter	cp_lf_order = "lf_2nd_order" ,		//Valid values: lf_2nd_order lf_3rd_order 
	parameter	cp_testmode = "cp_normal" ,		//Valid values: cp_normal cp_test_up cp_test_dn cp_tristate 
	parameter	d2a_voltage = "d2a_disable" ,		//Valid values: d2a_setting_0 d2a_setting_1 d2a_setting_2 d2a_setting_3 d2a_setting_4 d2a_setting_5 d2a_setting_6 d2a_setting_7 d2a_disable 
	parameter	datarate = "0 bps" ,		//Valid values:  
	parameter	device_variant = "device1" ,		//Valid values: device1 device2 device3 device4 device5 
	parameter	dprio_clk_vreg_boost_expected_voltage = 12'b000000000000 ,		//Valid values: 12 
	parameter	dprio_clk_vreg_boost_scratch = 3'b000 ,		//Valid values: 3 
	parameter	dprio_clk_vreg_boost_step_size = 5'b00000 ,		//Valid values: 5 
	parameter	dprio_lc_vreg1_boost_expected_voltage = 12'b000000000000 ,		//Valid values: 12 
	parameter	dprio_lc_vreg1_boost_scratch = 3'b000 ,		//Valid values: 3 
	parameter	dprio_lc_vreg_boost_expected_voltage = 12'b000000000000 ,		//Valid values: 12 
	parameter	dprio_lc_vreg_boost_scratch = 3'b000 ,		//Valid values: 3 
	parameter	dprio_mcgb_vreg_boost_expected_voltage = 12'b000000000000 ,		//Valid values: 12 
	parameter	dprio_mcgb_vreg_boost_scratch = 3'b000 ,		//Valid values: 3 
	parameter	dprio_mcgb_vreg_boost_step_size = 5'b00000 ,		//Valid values: 5 
	parameter	dprio_vreg1_boost_step_size = 5'b00000 ,		//Valid values: 5 
	parameter	dprio_vreg_boost_step_size = 5'b00000 ,		//Valid values: 5 
	parameter	dsm_ecn_bypass = "false" ,		//Valid values: true false 
	parameter	dsm_ecn_test_en = "false" ,		//Valid values: true false 
	parameter	dsm_fractional_division = 32'b00000000000000000000000000000000 ,		//Valid values: 
	parameter	dsm_fractional_value_ready = "pll_k_ready" ,		//Valid values: pll_k_not_ready pll_k_ready 
	parameter	dsm_mode = "dsm_mode_integer" ,		//Valid values: dsm_mode_integer dsm_mode_phase 
	parameter	dsm_out_sel = "pll_dsm_disable" ,		//Valid values: pll_dsm_disable pll_dsm_1st_order pll_dsm_2nd_order pll_dsm_3rd_order 
	parameter	enable_hclk = "hclk_disabled" ,		//Valid values: hclk_disabled hclk_enable 
	parameter	enable_idle_atx_pll_support = "idle_none" ,		//Valid values: idle_none idle_conf1 idle_conf2 idle_conf3 idle_conf4 idle_conf5 idle_conf6 idle_conf7 idle_conf8 idle_conf9 idle_conf10 
	parameter	enable_lc_calibration = "false" ,		//Valid values: true false 
	parameter	enable_lc_vreg_calibration = "false" ,		//Valid values: true false 
	parameter	expected_lc_boost_voltage = 12'b000000000000 ,		//Valid values: 12 
	parameter	f_max_lcnt_fpll_cascading = 36'b000000000000000000000000000000000001 ,		//Valid values: 
	parameter	f_max_pfd = "0 hz" ,		//Valid values:  
	parameter	f_max_pfd_fractional = "0 hz" ,		//Valid values:  
	parameter	f_max_ref = "0 hz" ,		//Valid values:  
	parameter	f_max_tank_0 = "0 hz" ,		//Valid values:  
	parameter	f_max_tank_1 = "0 hz" ,		//Valid values:  
	parameter	f_max_tank_2 = "0 hz" ,		//Valid values:  
	parameter	f_max_vco = "0 hz" ,		//Valid values:  
	parameter	f_max_vco_fractional = "0 hz" ,		//Valid values:  
	parameter	f_max_x1 = "0 hz" ,		//Valid values:  
	parameter	f_min_pfd = "0 hz" ,		//Valid values:  
	parameter	f_min_ref = "0 hz" ,		//Valid values:  
	parameter	f_min_tank_0 = "0 hz" ,		//Valid values:  
	parameter	f_min_tank_1 = "0 hz" ,		//Valid values:  
	parameter	f_min_tank_2 = "0 hz" ,		//Valid values:  
	parameter	f_min_vco = "0 hz" ,		//Valid values:  
	parameter	fb_select = "direct_fb" ,		//Valid values: iqtxrxclk_fb direct_fb 
	parameter	fpll_refclk_selection = "select_div_by_2" ,		//Valid values: select_div_by_2 select_vco_output 
	parameter	hclk_divide = 1 ,		//Valid values: 1 40 50 
	parameter	initial_settings = "false" ,		//Valid values: false true 
	parameter	iqclk_mux_sel = "power_down" ,		//Valid values: iqtxrxclk0 iqtxrxclk1 iqtxrxclk2 iqtxrxclk3 iqtxrxclk4 iqtxrxclk5 power_down 
	parameter	is_cascaded_pll = "false" ,		//Valid values: true false 
	parameter	is_otn = "false" ,		//Valid values: true false 
	parameter	is_sdi = "false" ,		//Valid values: true false 
	parameter	l_counter = 1 ,		//Valid values: 1 2 4 8 16 
	parameter	l_counter_enable = "false" ,		//Valid values: true false 
	parameter	l_counter_scratch = 5'b00001 ,		//Valid values: 5 
	parameter	lc_atb = "atb_selectdisable" ,		//Valid values: atb_selectdisable atb_select0 atb_select1 atb_select2 atb_select3 atb_select4 atb_select5 atb_select6 atb_select7 atb_select8 atb_select9 atb_select10 atb_select11 atb_select12 atb_select13 atb_select14 atb_select15 atb_select16 atb_select17 atb_select18 atb_select19 atb_select20 atb_select21 atb_select22 atb_select23 atb_select24 atb_select25 atb_select26 atb_select27 atb_select28 atb_select29 atb_select30 
	parameter	lc_mode = "lccmu_pd" ,		//Valid values: lccmu_pd lccmu_normal lccmu_reset 
	parameter	lc_to_fpll_l_counter = "lcounter_setting0" ,		//Valid values: lcounter_setting0 lcounter_setting1 lcounter_setting2 lcounter_setting3 lcounter_setting4 lcounter_setting5 lcounter_setting6 lcounter_setting7 lcounter_setting8 lcounter_setting9 lcounter_setting10 lcounter_setting11 lcounter_setting12 lcounter_setting13 lcounter_setting14 lcounter_setting15 lcounter_setting16 lcounter_setting17 lcounter_setting18 lcounter_setting19 lcounter_setting20 lcounter_setting21 lcounter_setting22 lcounter_setting23 lcounter_setting24 lcounter_setting25 lcounter_setting26 lcounter_setting27 lcounter_setting28 lcounter_setting29 lcounter_setting30 lcounter_setting31 
	parameter	lc_to_fpll_l_counter_scratch = 5'b00001 ,		//Valid values: 5 
	parameter	lf_cbig_size = "lf_cbig_setting0" ,		//Valid values: lf_cbig_setting0 lf_cbig_setting1 lf_cbig_setting2 lf_cbig_setting3 lf_cbig_setting4 
	parameter	lf_resistance = "lf_setting0" ,		//Valid values: lf_setting0 lf_setting1 lf_setting2 lf_setting3 
	parameter	lf_ripplecap = "lf_ripple_cap_0" ,		//Valid values: lf_no_ripple lf_ripple_cap_0 lf_ripple_cap_1 
	parameter	m_counter = 8 ,		//Valid values: 0..255 
	parameter	max_fractional_percentage = 7'b0000000 ,		//Valid values: 7 
	parameter	min_fractional_percentage = 7'b0000000 ,		//Valid values: 7 
	parameter	n_counter_scratch = 4'b0001 ,		//Valid values: 4 
	parameter	output_clock_frequency = "0 hz" ,		//Valid values:  
	parameter	output_regulator_supply = "vreg1v_setting3" ,		//Valid values: vreg1v_setting0 vreg1v_setting1 vreg1v_setting2 vreg1v_setting3 vreg1v_setting4 vreg1v_setting5 vreg1v_setting6 vreg1v_setting7 
	parameter	overrange_voltage = "over_setting5" ,		//Valid values: over_setting0 over_setting1 over_setting2 over_setting3 over_setting4 over_setting5 over_setting6 over_setting7 
	parameter	pfd_delay_compensation = "normal_delay" ,		//Valid values: normal_delay ref_compensated_delay fb_compensated_delay unused_delay 
	parameter	pfd_pulse_width = "pulse_width_setting0" ,		//Valid values: pulse_width_setting0 pulse_width_setting1 pulse_width_setting2 pulse_width_setting3 
	parameter	pm_speed_grade = "e2" ,		//Valid values: e1 i1 e2 i2 e3 i3 m3 e4 i4 m4 e5 i5 
	parameter	pma_width = 8 ,		//Valid values: 0..127 
	parameter	power_mode = "low_power" ,		//Valid values: low_power mid_power high_perf 
	parameter	power_rail_et = 0 ,		//Valid values: 0..4095 
	parameter	powerdown_mode = "powerup" ,		//Valid values: powerup powerdown 
	parameter	primary_use = "hssi_x1" ,		//Valid values: hssi_x1 hssi_hf hssi_cascade 
	parameter	prot_mode = "basic_tx" ,		//Valid values: unused basic_tx pcie_gen1_tx pcie_gen2_tx pcie_gen3_tx pcie_gen4_tx qpi_tx gpon_tx sata_tx sas_tx upi_tx 
	parameter	ref_clk_div = 1 ,		//Valid values: 1 2 4 8 
	parameter	reference_clock_frequency = "0 hz" ,		//Valid values:  
	parameter	regulator_bypass = "reg_enable" ,		//Valid values: reg_enable reg_bypass 
	parameter	side = "side_unknown" ,		//Valid values: left right side_unknown 
	parameter	silicon_rev = "20nm5es" ,		//Valid values: 20nm5es 20nm5es2 20nm4es 20nm4es2 20nm5 20nm4 20nm3 20nm2 20nm1 
	parameter	sup_mode = "user_mode" ,		//Valid values: user_mode engineering_mode 
	parameter	tank_band = "lc_band0" ,		//Valid values: lc_band0 lc_band1 lc_band2 lc_band3 lc_band4 lc_band5 lc_band6 lc_band7 
	parameter	tank_sel = "lctank0" ,		//Valid values: lctank0 lctank1 lctank2 
	parameter	tank_voltage_coarse = "vreg_setting_coarse0" ,		//Valid values: vreg_setting_coarse0 vreg_setting_coarse1 vreg_setting_coarse2 vreg_setting_coarse3 vreg_setting_coarse4 vreg_setting_coarse5 vreg_setting_coarse6 vreg_setting_coarse7 
	parameter	tank_voltage_fine = "vreg_setting5" ,		//Valid values: vreg_setting0 vreg_setting1 vreg_setting2 vreg_setting3 vreg_setting4 vreg_setting5 vreg_setting6 vreg_setting7 
	parameter	top_or_bottom = "tb_unknown" ,		//Valid values: top bot tb_unknown 
	parameter	underrange_voltage = "under_setting4" ,		//Valid values: under_setting0 under_setting1 under_setting2 under_setting3 under_setting4 under_setting5 under_setting6 under_setting7 
	parameter	vccdreg_clk = "vreg_clk0" ,		//Valid values: vreg_clk0 vreg_clk1 vreg_clk2 vreg_clk3 vreg_clk4 vreg_clk5 vreg_clk6 vreg_clk7 vreg_clk8 vreg_clk9 vreg_clk10 vreg_clk11 vreg_clk12 vreg_clk13 vreg_clk14 vreg_clk15 vreg_clk16 vreg_clk17 vreg_clk18 vreg_clk19 vreg_clk20 vreg_clk21 vreg_clk22 vreg_clk23 vreg_clk24 vreg_clk25 vreg_clk26 vreg_clk27 vreg_clk28 vreg_clk29 vreg_clk30 vreg_clk31 
	parameter	vccdreg_fb = "vreg_fb0" ,		//Valid values: vreg_fb0 vreg_fb1 vreg_fb2 vreg_fb3 vreg_fb4 vreg_fb5 vreg_fb6 vreg_fb7 vreg_fb8 vreg_fb9 vreg_fb10 vreg_fb11 vreg_fb12 vreg_fb13 vreg_fb14 vreg_fb15 vreg_fb16 vreg_fb17 vreg_fb18 vreg_fb19 vreg_fb20 vreg_fb21 vreg_fb22 vreg_fb23 vreg_fb24 vreg_fb25 vreg_fb26 vreg_fb27 vreg_fb28 vreg_fb29 vreg_fb30 vreg_fb31 
	parameter	vccdreg_fw = "vreg_fw0" ,		//Valid values: vreg_fw0 vreg_fw1 vreg_fw2 vreg_fw3 vreg_fw4 vreg_fw5 vreg_fw6 vreg_fw7 vreg_fw8 vreg_fw9 vreg_fw10 vreg_fw11 vreg_fw12 vreg_fw13 vreg_fw14 vreg_fw15 vreg_fw16 vreg_fw17 vreg_fw18 vreg_fw19 vreg_fw20 vreg_fw21 vreg_fw22 vreg_fw23 vreg_fw24 vreg_fw25 vreg_fw26 vreg_fw27 vreg_fw28 vreg_fw29 vreg_fw30 vreg_fw31 
	parameter	vco_bypass_enable = "false" ,		//Valid values: true false 
	parameter	vco_freq = "0 hz" ,		//Valid values:  
	parameter	xcpvco_xchgpmplf_cp_current_boost = "normal_setting"		//Valid values: normal_setting boost_setting 
)

(
	//Port declaration

	input	[8:0]  avmmaddress ,
	input	avmmclk ,
	input	avmmread ,
	input	avmmrstn ,
	input	avmmwrite ,
	input	[7:0]  avmmwritedata ,
	input	core_clk ,
	input	[5:0]  iqtxrxclk ,
	input	lf_rst_n ,
	input	refclk ,
	input	rst_n ,

	output	[7:0]  avmmreaddata ,
	output	blockselect ,
	output	clk0_16g ,
	output	clk0_8g ,
	output	clk180_16g ,
	output	clk180_8g ,
	output	clklow_buf ,
	output	fref_buf ,
	output	hclk_out ,
	output	iqtxrxclk_out ,
	output	lc_to_fpll_refclk ,
	output	lock ,
	output	[7:0]  m_cnt_int ,
	output	overrange ,
	output	underrange 

);

// Function to convert a 64bit binary to a string.
function [128*8-1 : 0] m_bin_to_str;
	input [128 : 1]   s;
	reg   [128 : 1]   reg_s;
	reg   [7 : 0]    tmp;
	reg   [128*8 : 1] res;
	integer m, index;

	begin
		reg_s = s;
		res = 128'h00000000000000000000000000000000;

		for (m = 128; m > 0; m = m-1 )
		begin
			tmp = reg_s[128];
			res[(((m-1)*8)+1)] = tmp & 1'b1;
			reg_s = reg_s << 1;
		end

		m_bin_to_str = res;
	end
endfunction

localparam [8*128-1 : 0] dsm_fractional_division_string	= m_bin_to_str(dsm_fractional_division);
localparam [8*128-1 : 0] f_max_lcnt_fpll_cascading_string	= m_bin_to_str(f_max_lcnt_fpll_cascading);


	twentynm_atx_pll_encrypted
	#(
		.enable_debug_info(enable_debug_info) ,

		.analog_mode(analog_mode) ,
		.bandwidth_range_high(bandwidth_range_high) ,
		.bandwidth_range_low(bandwidth_range_low) ,
		.bonding(bonding) ,
		.bw_sel(bw_sel) ,
		.cal_status(cal_status) ,
		.calibration_mode(calibration_mode) ,
		.cascadeclk_test(cascadeclk_test) ,
		.cgb_div(cgb_div) ,
		.clk_high_perf_voltage(clk_high_perf_voltage) ,
		.clk_low_power_voltage(clk_low_power_voltage) ,
		.clk_mid_power_voltage(clk_mid_power_voltage) ,
		.cp_compensation_enable(cp_compensation_enable) ,
		.cp_current_setting(cp_current_setting) ,
		.cp_lf_3rd_pole_freq(cp_lf_3rd_pole_freq) ,
		.cp_lf_order(cp_lf_order) ,
		.cp_testmode(cp_testmode) ,
		.d2a_voltage(d2a_voltage) ,
		.datarate(datarate) ,
		.device_variant(device_variant) ,
		.dprio_clk_vreg_boost_expected_voltage(dprio_clk_vreg_boost_expected_voltage) ,
		.dprio_clk_vreg_boost_scratch(dprio_clk_vreg_boost_scratch) ,
		.dprio_clk_vreg_boost_step_size(dprio_clk_vreg_boost_step_size) ,
		.dprio_lc_vreg1_boost_expected_voltage(dprio_lc_vreg1_boost_expected_voltage) ,
		.dprio_lc_vreg1_boost_scratch(dprio_lc_vreg1_boost_scratch) ,
		.dprio_lc_vreg_boost_expected_voltage(dprio_lc_vreg_boost_expected_voltage) ,
		.dprio_lc_vreg_boost_scratch(dprio_lc_vreg_boost_scratch) ,
		.dprio_mcgb_vreg_boost_expected_voltage(dprio_mcgb_vreg_boost_expected_voltage) ,
		.dprio_mcgb_vreg_boost_scratch(dprio_mcgb_vreg_boost_scratch) ,
		.dprio_mcgb_vreg_boost_step_size(dprio_mcgb_vreg_boost_step_size) ,
		.dprio_vreg1_boost_step_size(dprio_vreg1_boost_step_size) ,
		.dprio_vreg_boost_step_size(dprio_vreg_boost_step_size) ,
		.dsm_ecn_bypass(dsm_ecn_bypass) ,
		.dsm_ecn_test_en(dsm_ecn_test_en) ,
		.dsm_fractional_division(dsm_fractional_division_string) ,
		.dsm_fractional_value_ready(dsm_fractional_value_ready) ,
		.dsm_mode(dsm_mode) ,
		.dsm_out_sel(dsm_out_sel) ,
		.enable_hclk(enable_hclk) ,
		.enable_idle_atx_pll_support(enable_idle_atx_pll_support) ,
		.enable_lc_calibration(enable_lc_calibration) ,
		.enable_lc_vreg_calibration(enable_lc_vreg_calibration) ,
		.expected_lc_boost_voltage(expected_lc_boost_voltage) ,
		.f_max_lcnt_fpll_cascading(f_max_lcnt_fpll_cascading_string) ,
		.f_max_pfd(f_max_pfd) ,
		.f_max_pfd_fractional(f_max_pfd_fractional) ,
		.f_max_ref(f_max_ref) ,
		.f_max_tank_0(f_max_tank_0) ,
		.f_max_tank_1(f_max_tank_1) ,
		.f_max_tank_2(f_max_tank_2) ,
		.f_max_vco(f_max_vco) ,
		.f_max_vco_fractional(f_max_vco_fractional) ,
		.f_max_x1(f_max_x1) ,
		.f_min_pfd(f_min_pfd) ,
		.f_min_ref(f_min_ref) ,
		.f_min_tank_0(f_min_tank_0) ,
		.f_min_tank_1(f_min_tank_1) ,
		.f_min_tank_2(f_min_tank_2) ,
		.f_min_vco(f_min_vco) ,
		.fb_select(fb_select) ,
		.fpll_refclk_selection(fpll_refclk_selection) ,
		.hclk_divide(hclk_divide) ,
		.initial_settings(initial_settings) ,
		.iqclk_mux_sel(iqclk_mux_sel) ,
		.is_cascaded_pll(is_cascaded_pll) ,
		.is_otn(is_otn) ,
		.is_sdi(is_sdi) ,
		.l_counter(l_counter) ,
		.l_counter_enable(l_counter_enable) ,
		.l_counter_scratch(l_counter_scratch) ,
		.lc_atb(lc_atb) ,
		.lc_mode(lc_mode) ,
		.lc_to_fpll_l_counter(lc_to_fpll_l_counter) ,
		.lc_to_fpll_l_counter_scratch(lc_to_fpll_l_counter_scratch) ,
		.lf_cbig_size(lf_cbig_size) ,
		.lf_resistance(lf_resistance) ,
		.lf_ripplecap(lf_ripplecap) ,
		.m_counter(m_counter) ,
		.max_fractional_percentage(max_fractional_percentage) ,
		.min_fractional_percentage(min_fractional_percentage) ,
		.n_counter_scratch(n_counter_scratch) ,
		.output_clock_frequency(output_clock_frequency) ,
		.output_regulator_supply(output_regulator_supply) ,
		.overrange_voltage(overrange_voltage) ,
		.pfd_delay_compensation(pfd_delay_compensation) ,
		.pfd_pulse_width(pfd_pulse_width) ,
		.pm_speed_grade(pm_speed_grade) ,
		.pma_width(pma_width) ,
		.power_mode(power_mode) ,
		.power_rail_et(power_rail_et) ,
		.powerdown_mode(powerdown_mode) ,
		.primary_use(primary_use) ,
		.prot_mode(prot_mode) ,
		.ref_clk_div(ref_clk_div) ,
		.reference_clock_frequency(reference_clock_frequency) ,
		.regulator_bypass(regulator_bypass) ,
		.side(side) ,
		.silicon_rev(silicon_rev) ,
		.sup_mode(sup_mode) ,
		.tank_band(tank_band) ,
		.tank_sel(tank_sel) ,
		.tank_voltage_coarse(tank_voltage_coarse) ,
		.tank_voltage_fine(tank_voltage_fine) ,
		.top_or_bottom(top_or_bottom) ,
		.underrange_voltage(underrange_voltage) ,
		.vccdreg_clk(vccdreg_clk) ,
		.vccdreg_fb(vccdreg_fb) ,
		.vccdreg_fw(vccdreg_fw) ,
		.vco_bypass_enable(vco_bypass_enable) ,
		.vco_freq(vco_freq) ,
		.xcpvco_xchgpmplf_cp_current_boost(xcpvco_xchgpmplf_cp_current_boost)

	)
	twentynm_atx_pll_encrypted_inst (

		.avmmaddress(avmmaddress),
		.avmmclk(avmmclk),
		.avmmread(avmmread),
		.avmmrstn(avmmrstn),
		.avmmwrite(avmmwrite),
		.avmmwritedata(avmmwritedata),
		.core_clk(core_clk),
		.iqtxrxclk(iqtxrxclk),
		.lf_rst_n(lf_rst_n),
		.refclk(refclk),
		.rst_n(rst_n),
		.avmmreaddata(avmmreaddata),
		.blockselect(blockselect),
		.clk0_16g(clk0_16g),
		.clk0_8g(clk0_8g),
		.clk180_16g(clk180_16g),
		.clk180_8g(clk180_8g),
		.clklow_buf(clklow_buf),
		.fref_buf(fref_buf),
		.hclk_out(hclk_out),
		.iqtxrxclk_out(iqtxrxclk_out),
		.lc_to_fpll_refclk(lc_to_fpll_refclk),
		.lock(lock),
		.m_cnt_int(m_cnt_int),
		.overrange(overrange),
		.underrange(underrange)

	);

endmodule
// -----------------------------------------------------------
// This is auto-generated HSSI Simulation Atom Model Encryption Wrapper
// Module Name : work/twentynm_cmu_fpll_refclk_select_wrapper.v
// -----------------------------------------------------------

`timescale 1 ps/1 ps

module twentynm_cmu_fpll_refclk_select
#(
	// Parameter declaration and default value assignment

	parameter enable_debug_info = "true",	//Valid values: false|true; this is simulation-only parameter, for debug purpose only

	parameter	mux0_inclk0_logical_to_physical_mapping = "ref_iqclk0" ,		//Valid values: ref_iqclk0 ref_iqclk1 ref_iqclk2 ref_iqclk3 ref_iqclk4 ref_iqclk5 ref_iqclk6 ref_iqclk7 ref_iqclk8 ref_iqclk9 ref_iqclk10 ref_iqclk11 iqtxrxclk0 iqtxrxclk1 iqtxrxclk2 iqtxrxclk3 iqtxrxclk4 iqtxrxclk5 coreclk fixed_clk lvpecl adj_pll_clk power_down 
	parameter	mux0_inclk1_logical_to_physical_mapping = "ref_iqclk0" ,		//Valid values: ref_iqclk0 ref_iqclk1 ref_iqclk2 ref_iqclk3 ref_iqclk4 ref_iqclk5 ref_iqclk6 ref_iqclk7 ref_iqclk8 ref_iqclk9 ref_iqclk10 ref_iqclk11 iqtxrxclk0 iqtxrxclk1 iqtxrxclk2 iqtxrxclk3 iqtxrxclk4 iqtxrxclk5 coreclk fixed_clk lvpecl adj_pll_clk power_down 
	parameter	mux0_inclk2_logical_to_physical_mapping = "ref_iqclk0" ,		//Valid values: ref_iqclk0 ref_iqclk1 ref_iqclk2 ref_iqclk3 ref_iqclk4 ref_iqclk5 ref_iqclk6 ref_iqclk7 ref_iqclk8 ref_iqclk9 ref_iqclk10 ref_iqclk11 iqtxrxclk0 iqtxrxclk1 iqtxrxclk2 iqtxrxclk3 iqtxrxclk4 iqtxrxclk5 coreclk fixed_clk lvpecl adj_pll_clk power_down 
	parameter	mux0_inclk3_logical_to_physical_mapping = "ref_iqclk0" ,		//Valid values: ref_iqclk0 ref_iqclk1 ref_iqclk2 ref_iqclk3 ref_iqclk4 ref_iqclk5 ref_iqclk6 ref_iqclk7 ref_iqclk8 ref_iqclk9 ref_iqclk10 ref_iqclk11 iqtxrxclk0 iqtxrxclk1 iqtxrxclk2 iqtxrxclk3 iqtxrxclk4 iqtxrxclk5 coreclk fixed_clk lvpecl adj_pll_clk power_down 
	parameter	mux0_inclk4_logical_to_physical_mapping = "ref_iqclk0" ,		//Valid values: ref_iqclk0 ref_iqclk1 ref_iqclk2 ref_iqclk3 ref_iqclk4 ref_iqclk5 ref_iqclk6 ref_iqclk7 ref_iqclk8 ref_iqclk9 ref_iqclk10 ref_iqclk11 iqtxrxclk0 iqtxrxclk1 iqtxrxclk2 iqtxrxclk3 iqtxrxclk4 iqtxrxclk5 coreclk fixed_clk lvpecl adj_pll_clk power_down 
	parameter	mux1_inclk0_logical_to_physical_mapping = "ref_iqclk0" ,		//Valid values: ref_iqclk0 ref_iqclk1 ref_iqclk2 ref_iqclk3 ref_iqclk4 ref_iqclk5 ref_iqclk6 ref_iqclk7 ref_iqclk8 ref_iqclk9 ref_iqclk10 ref_iqclk11 iqtxrxclk0 iqtxrxclk1 iqtxrxclk2 iqtxrxclk3 iqtxrxclk4 iqtxrxclk5 coreclk fixed_clk lvpecl adj_pll_clk power_down 
	parameter	mux1_inclk1_logical_to_physical_mapping = "ref_iqclk0" ,		//Valid values: ref_iqclk0 ref_iqclk1 ref_iqclk2 ref_iqclk3 ref_iqclk4 ref_iqclk5 ref_iqclk6 ref_iqclk7 ref_iqclk8 ref_iqclk9 ref_iqclk10 ref_iqclk11 iqtxrxclk0 iqtxrxclk1 iqtxrxclk2 iqtxrxclk3 iqtxrxclk4 iqtxrxclk5 coreclk fixed_clk lvpecl adj_pll_clk power_down 
	parameter	mux1_inclk2_logical_to_physical_mapping = "ref_iqclk0" ,		//Valid values: ref_iqclk0 ref_iqclk1 ref_iqclk2 ref_iqclk3 ref_iqclk4 ref_iqclk5 ref_iqclk6 ref_iqclk7 ref_iqclk8 ref_iqclk9 ref_iqclk10 ref_iqclk11 iqtxrxclk0 iqtxrxclk1 iqtxrxclk2 iqtxrxclk3 iqtxrxclk4 iqtxrxclk5 coreclk fixed_clk lvpecl adj_pll_clk power_down 
	parameter	mux1_inclk3_logical_to_physical_mapping = "ref_iqclk0" ,		//Valid values: ref_iqclk0 ref_iqclk1 ref_iqclk2 ref_iqclk3 ref_iqclk4 ref_iqclk5 ref_iqclk6 ref_iqclk7 ref_iqclk8 ref_iqclk9 ref_iqclk10 ref_iqclk11 iqtxrxclk0 iqtxrxclk1 iqtxrxclk2 iqtxrxclk3 iqtxrxclk4 iqtxrxclk5 coreclk fixed_clk lvpecl adj_pll_clk power_down 
	parameter	mux1_inclk4_logical_to_physical_mapping = "ref_iqclk0" ,		//Valid values: ref_iqclk0 ref_iqclk1 ref_iqclk2 ref_iqclk3 ref_iqclk4 ref_iqclk5 ref_iqclk6 ref_iqclk7 ref_iqclk8 ref_iqclk9 ref_iqclk10 ref_iqclk11 iqtxrxclk0 iqtxrxclk1 iqtxrxclk2 iqtxrxclk3 iqtxrxclk4 iqtxrxclk5 coreclk fixed_clk lvpecl adj_pll_clk power_down 
	parameter	pll_auto_clk_sw_en = "false" ,		//Valid values: false true 
	parameter	pll_clk_loss_edge = "pll_clk_loss_both_edges" ,		//Valid values: pll_clk_loss_both_edges pll_clk_loss_rising_edge 
	parameter	pll_clk_loss_sw_en = "false" ,		//Valid values: false true 
	parameter	pll_clk_sel_override = "normal" ,		//Valid values: override_clksel normal 
	parameter	pll_clk_sel_override_value = "select_clk0" ,		//Valid values: select_clk1 select_clk0 
	parameter	pll_clk_sw_dly = 0 ,		//Valid values: 0..7 
	parameter	pll_clkin_0_scratch0_src = "pll_clkin_0_scratch0_src_vss" ,		//Valid values: pll_clkin_0_scratch0_src_vss pll_clkin_0_scratch0_src_core_ref_clk pll_clkin_0_scratch0_src_tx_rx_core_ref_clk pll_clkin_0_scratch0_src_ref_clk pll_clkin_0_scratch0_src_adj_pll_clk pll_clkin_0_scratch0_src_lvpecl 
	parameter	pll_clkin_0_scratch1_src = "pll_clkin_0_scratch1_src_vss" ,		//Valid values: pll_clkin_0_scratch1_src_vss pll_clkin_0_scratch1_src_core_ref_clk pll_clkin_0_scratch1_src_tx_rx_core_ref_clk pll_clkin_0_scratch1_src_ref_clk pll_clkin_0_scratch1_src_adj_pll_clk pll_clkin_0_scratch1_src_lvpecl 
	parameter	pll_clkin_0_scratch2_src = "pll_clkin_0_scratch2_src_vss" ,		//Valid values: pll_clkin_0_scratch2_src_adj_pll_clk pll_clkin_0_scratch2_src_core_ref_clk pll_clkin_0_scratch2_src_lvpecl pll_clkin_0_scratch2_src_ref_clk pll_clkin_0_scratch2_src_tx_rx_core_ref_clk pll_clkin_0_scratch2_src_vss 
	parameter	pll_clkin_0_scratch3_src = "pll_clkin_0_scratch3_src_vss" ,		//Valid values: pll_clkin_0_scratch3_src_adj_pll_clk pll_clkin_0_scratch3_src_core_ref_clk pll_clkin_0_scratch3_src_lvpecl pll_clkin_0_scratch3_src_ref_clk pll_clkin_0_scratch3_src_tx_rx_core_ref_clk pll_clkin_0_scratch3_src_vss 
	parameter	pll_clkin_0_scratch4_src = "pll_clkin_0_scratch4_src_vss" ,		//Valid values: pll_clkin_0_scratch4_src_adj_pll_clk pll_clkin_0_scratch4_src_core_ref_clk pll_clkin_0_scratch4_src_lvpecl pll_clkin_0_scratch4_src_ref_clk pll_clkin_0_scratch4_src_tx_rx_core_ref_clk pll_clkin_0_scratch4_src_vss 
	parameter	pll_clkin_0_src = "pll_clkin_0_src_vss" ,		//Valid values: pll_clkin_0_src_vss pll_clkin_0_src_core_ref_clk pll_clkin_0_src_tx_rx_core_ref_clk pll_clkin_0_src_ref_clk pll_clkin_0_src_adj_pll_clk pll_clkin_0_src_lvpecl 
	parameter	pll_clkin_1_scratch0_src = "pll_clkin_1_scratch0_src_vss" ,		//Valid values: pll_clkin_1_scratch0_src_adj_pll_clk pll_clkin_1_scratch0_src_core_ref_clk pll_clkin_1_scratch0_src_lvpecl pll_clkin_1_scratch0_src_ref_clk pll_clkin_1_scratch0_src_tx_rx_core_ref_clk pll_clkin_1_scratch0_src_vss 
	parameter	pll_clkin_1_scratch1_src = "pll_clkin_1_scratch1_src_vss" ,		//Valid values: pll_clkin_1_scratch1_src_adj_pll_clk pll_clkin_1_scratch1_src_core_ref_clk pll_clkin_1_scratch1_src_lvpecl pll_clkin_1_scratch1_src_ref_clk pll_clkin_1_scratch1_src_tx_rx_core_ref_clk pll_clkin_1_scratch1_src_vss 
	parameter	pll_clkin_1_scratch2_src = "pll_clkin_1_scratch2_src_vss" ,		//Valid values: pll_clkin_1_scratch2_src_adj_pll_clk pll_clkin_1_scratch2_src_core_ref_clk pll_clkin_1_scratch2_src_lvpecl pll_clkin_1_scratch2_src_ref_clk pll_clkin_1_scratch2_src_tx_rx_core_ref_clk pll_clkin_1_scratch2_src_vss 
	parameter	pll_clkin_1_scratch3_src = "pll_clkin_1_scratch3_src_vss" ,		//Valid values: pll_clkin_1_scratch3_src_adj_pll_clk pll_clkin_1_scratch3_src_core_ref_clk pll_clkin_1_scratch3_src_lvpecl pll_clkin_1_scratch3_src_ref_clk pll_clkin_1_scratch3_src_tx_rx_core_ref_clk pll_clkin_1_scratch3_src_vss 
	parameter	pll_clkin_1_scratch4_src = "pll_clkin_1_scratch4_src_vss" ,		//Valid values: pll_clkin_1_scratch4_src_adj_pll_clk pll_clkin_1_scratch4_src_core_ref_clk pll_clkin_1_scratch4_src_lvpecl pll_clkin_1_scratch4_src_ref_clk pll_clkin_1_scratch4_src_tx_rx_core_ref_clk pll_clkin_1_scratch4_src_vss 
	parameter	pll_clkin_1_src = "pll_clkin_1_src_vss" ,		//Valid values: pll_clkin_1_src_vss pll_clkin_1_src_core_ref_clk pll_clkin_1_src_tx_rx_core_ref_clk pll_clkin_1_src_ref_clk pll_clkin_1_src_adj_pll_clk pll_clkin_1_src_lvpecl 
	parameter	pll_manu_clk_sw_en = "false" ,		//Valid values: false true 
	parameter	pll_powerdown_mode = "false" ,		//Valid values: false true 
	parameter	pll_sup_mode = "user_mode" ,		//Valid values: user_mode engineering_mode 
	parameter	pll_sw_refclk_src = "pll_sw_refclk_src_clk_0" ,		//Valid values: pll_sw_refclk_src_clk_0 pll_sw_refclk_src_clk_1 
	parameter	refclk_select0 = "ref_iqclk0" ,		//Valid values: ref_iqclk0 ref_iqclk1 ref_iqclk2 ref_iqclk3 ref_iqclk4 ref_iqclk5 ref_iqclk6 ref_iqclk7 ref_iqclk8 ref_iqclk9 ref_iqclk10 ref_iqclk11 iqtxrxclk0 iqtxrxclk1 iqtxrxclk2 iqtxrxclk3 iqtxrxclk4 iqtxrxclk5 coreclk fixed_clk lvpecl adj_pll_clk power_down 
	parameter	refclk_select1 = "ref_iqclk0" ,		//Valid values: ref_iqclk0 ref_iqclk1 ref_iqclk2 ref_iqclk3 ref_iqclk4 ref_iqclk5 ref_iqclk6 ref_iqclk7 ref_iqclk8 ref_iqclk9 ref_iqclk10 ref_iqclk11 iqtxrxclk0 iqtxrxclk1 iqtxrxclk2 iqtxrxclk3 iqtxrxclk4 iqtxrxclk5 coreclk fixed_clk lvpecl adj_pll_clk power_down 
	parameter	silicon_rev = "20nm5es" ,		//Valid values: 20nm5es 20nm5es2 20nm4es 20nm4es2 20nm5 20nm4 20nm3 20nm2 20nm1 
	parameter	xpm_iqref_mux0_iqclk_sel = "power_down" ,		//Valid values: ref_iqclk0 ref_iqclk1 ref_iqclk2 ref_iqclk3 ref_iqclk4 ref_iqclk5 ref_iqclk6 ref_iqclk7 ref_iqclk8 ref_iqclk9 ref_iqclk10 ref_iqclk11 iqtxrxclk0 iqtxrxclk1 iqtxrxclk2 iqtxrxclk3 iqtxrxclk4 iqtxrxclk5 power_down 
	parameter	xpm_iqref_mux0_scratch0_src = "scratch0_power_down" ,		//Valid values: scratch0_ref_iqclk0 scratch0_ref_iqclk1 scratch0_ref_iqclk2 scratch0_ref_iqclk3 scratch0_ref_iqclk4 scratch0_ref_iqclk5 scratch0_ref_iqclk6 scratch0_ref_iqclk7 scratch0_ref_iqclk8 scratch0_ref_iqclk9 scratch0_ref_iqclk10 scratch0_ref_iqclk11 scratch0_iqtxrxclk0 scratch0_iqtxrxclk1 scratch0_iqtxrxclk2 scratch0_iqtxrxclk3 scratch0_iqtxrxclk4 scratch0_iqtxrxclk5 scratch0_power_down 
	parameter	xpm_iqref_mux0_scratch1_src = "scratch1_power_down" ,		//Valid values: scratch1_ref_iqclk0 scratch1_ref_iqclk1 scratch1_ref_iqclk2 scratch1_ref_iqclk3 scratch1_ref_iqclk4 scratch1_ref_iqclk5 scratch1_ref_iqclk6 scratch1_ref_iqclk7 scratch1_ref_iqclk8 scratch1_ref_iqclk9 scratch1_ref_iqclk10 scratch1_ref_iqclk11 scratch1_iqtxrxclk0 scratch1_iqtxrxclk1 scratch1_iqtxrxclk2 scratch1_iqtxrxclk3 scratch1_iqtxrxclk4 scratch1_iqtxrxclk5 scratch1_power_down 
	parameter	xpm_iqref_mux0_scratch2_src = "scratch2_power_down" ,		//Valid values: scratch2_ref_iqclk0 scratch2_ref_iqclk1 scratch2_ref_iqclk2 scratch2_ref_iqclk3 scratch2_ref_iqclk4 scratch2_ref_iqclk5 scratch2_ref_iqclk6 scratch2_ref_iqclk7 scratch2_ref_iqclk8 scratch2_ref_iqclk9 scratch2_ref_iqclk10 scratch2_ref_iqclk11 scratch2_iqtxrxclk0 scratch2_iqtxrxclk1 scratch2_iqtxrxclk2 scratch2_iqtxrxclk3 scratch2_iqtxrxclk4 scratch2_iqtxrxclk5 scratch2_power_down 
	parameter	xpm_iqref_mux0_scratch3_src = "scratch3_power_down" ,		//Valid values: scratch3_ref_iqclk0 scratch3_ref_iqclk1 scratch3_ref_iqclk2 scratch3_ref_iqclk3 scratch3_ref_iqclk4 scratch3_ref_iqclk5 scratch3_ref_iqclk6 scratch3_ref_iqclk7 scratch3_ref_iqclk8 scratch3_ref_iqclk9 scratch3_ref_iqclk10 scratch3_ref_iqclk11 scratch3_iqtxrxclk0 scratch3_iqtxrxclk1 scratch3_iqtxrxclk2 scratch3_iqtxrxclk3 scratch3_iqtxrxclk4 scratch3_iqtxrxclk5 scratch3_power_down 
	parameter	xpm_iqref_mux0_scratch4_src = "scratch4_power_down" ,		//Valid values: scratch4_ref_iqclk0 scratch4_ref_iqclk1 scratch4_ref_iqclk2 scratch4_ref_iqclk3 scratch4_ref_iqclk4 scratch4_ref_iqclk5 scratch4_ref_iqclk6 scratch4_ref_iqclk7 scratch4_ref_iqclk8 scratch4_ref_iqclk9 scratch4_ref_iqclk10 scratch4_ref_iqclk11 scratch4_iqtxrxclk0 scratch4_iqtxrxclk1 scratch4_iqtxrxclk2 scratch4_iqtxrxclk3 scratch4_iqtxrxclk4 scratch4_iqtxrxclk5 scratch4_power_down 
	parameter	xpm_iqref_mux1_iqclk_sel = "power_down" ,		//Valid values: ref_iqclk0 ref_iqclk1 ref_iqclk2 ref_iqclk3 ref_iqclk4 ref_iqclk5 ref_iqclk6 ref_iqclk7 ref_iqclk8 ref_iqclk9 ref_iqclk10 ref_iqclk11 iqtxrxclk0 iqtxrxclk1 iqtxrxclk2 iqtxrxclk3 iqtxrxclk4 iqtxrxclk5 power_down 
	parameter	xpm_iqref_mux1_scratch0_src = "scratch0_power_down" ,		//Valid values: scratch0_ref_iqclk0 scratch0_ref_iqclk1 scratch0_ref_iqclk2 scratch0_ref_iqclk3 scratch0_ref_iqclk4 scratch0_ref_iqclk5 scratch0_ref_iqclk6 scratch0_ref_iqclk7 scratch0_ref_iqclk8 scratch0_ref_iqclk9 scratch0_ref_iqclk10 scratch0_ref_iqclk11 scratch0_iqtxrxclk0 scratch0_iqtxrxclk1 scratch0_iqtxrxclk2 scratch0_iqtxrxclk3 scratch0_iqtxrxclk4 scratch0_iqtxrxclk5 scratch0_power_down 
	parameter	xpm_iqref_mux1_scratch1_src = "scratch1_power_down" ,		//Valid values: scratch1_ref_iqclk0 scratch1_ref_iqclk1 scratch1_ref_iqclk2 scratch1_ref_iqclk3 scratch1_ref_iqclk4 scratch1_ref_iqclk5 scratch1_ref_iqclk6 scratch1_ref_iqclk7 scratch1_ref_iqclk8 scratch1_ref_iqclk9 scratch1_ref_iqclk10 scratch1_ref_iqclk11 scratch1_iqtxrxclk0 scratch1_iqtxrxclk1 scratch1_iqtxrxclk2 scratch1_iqtxrxclk3 scratch1_iqtxrxclk4 scratch1_iqtxrxclk5 scratch1_power_down 
	parameter	xpm_iqref_mux1_scratch2_src = "scratch2_power_down" ,		//Valid values: scratch2_ref_iqclk0 scratch2_ref_iqclk1 scratch2_ref_iqclk2 scratch2_ref_iqclk3 scratch2_ref_iqclk4 scratch2_ref_iqclk5 scratch2_ref_iqclk6 scratch2_ref_iqclk7 scratch2_ref_iqclk8 scratch2_ref_iqclk9 scratch2_ref_iqclk10 scratch2_ref_iqclk11 scratch2_iqtxrxclk0 scratch2_iqtxrxclk1 scratch2_iqtxrxclk2 scratch2_iqtxrxclk3 scratch2_iqtxrxclk4 scratch2_iqtxrxclk5 scratch2_power_down 
	parameter	xpm_iqref_mux1_scratch3_src = "scratch3_power_down" ,		//Valid values: scratch3_ref_iqclk0 scratch3_ref_iqclk1 scratch3_ref_iqclk2 scratch3_ref_iqclk3 scratch3_ref_iqclk4 scratch3_ref_iqclk5 scratch3_ref_iqclk6 scratch3_ref_iqclk7 scratch3_ref_iqclk8 scratch3_ref_iqclk9 scratch3_ref_iqclk10 scratch3_ref_iqclk11 scratch3_iqtxrxclk0 scratch3_iqtxrxclk1 scratch3_iqtxrxclk2 scratch3_iqtxrxclk3 scratch3_iqtxrxclk4 scratch3_iqtxrxclk5 scratch3_power_down 
	parameter	xpm_iqref_mux1_scratch4_src = "scratch4_power_down"		//Valid values: scratch4_ref_iqclk0 scratch4_ref_iqclk1 scratch4_ref_iqclk2 scratch4_ref_iqclk3 scratch4_ref_iqclk4 scratch4_ref_iqclk5 scratch4_ref_iqclk6 scratch4_ref_iqclk7 scratch4_ref_iqclk8 scratch4_ref_iqclk9 scratch4_ref_iqclk10 scratch4_ref_iqclk11 scratch4_iqtxrxclk0 scratch4_iqtxrxclk1 scratch4_iqtxrxclk2 scratch4_iqtxrxclk3 scratch4_iqtxrxclk4 scratch4_iqtxrxclk5 scratch4_power_down 
)

(
	//Port declaration

	input	[8:0]  avmmaddress ,
	input	avmmclk ,
	input	avmmread ,
	input	avmmrstn ,
	input	avmmwrite ,
	input	[7:0]  avmmwritedata ,
	input	core_refclk ,
	input	extswitch ,
	input	fpll_cr_pllen ,
	input	[5:0]  iqtxrxclk ,
	input	refclk ,
	input	pll_cascade_in ,
	input	[11:0]  ref_iqclk ,
	input	tx_rx_core_refclk ,

	output	[7:0]  avmmreaddata ,
	output	blockselect ,
	output	[1:0]  clk_src ,
	output	clk0bad ,
	output	clk1bad ,
	output	outclk ,
	output	extswitch_buf ,
	output	pllclksel 

);


	twentynm_cmu_fpll_refclk_select_encrypted
	#(
		.enable_debug_info(enable_debug_info) ,

		.mux0_inclk0_logical_to_physical_mapping(mux0_inclk0_logical_to_physical_mapping) ,
		.mux0_inclk1_logical_to_physical_mapping(mux0_inclk1_logical_to_physical_mapping) ,
		.mux0_inclk2_logical_to_physical_mapping(mux0_inclk2_logical_to_physical_mapping) ,
		.mux0_inclk3_logical_to_physical_mapping(mux0_inclk3_logical_to_physical_mapping) ,
		.mux0_inclk4_logical_to_physical_mapping(mux0_inclk4_logical_to_physical_mapping) ,
		.mux1_inclk0_logical_to_physical_mapping(mux1_inclk0_logical_to_physical_mapping) ,
		.mux1_inclk1_logical_to_physical_mapping(mux1_inclk1_logical_to_physical_mapping) ,
		.mux1_inclk2_logical_to_physical_mapping(mux1_inclk2_logical_to_physical_mapping) ,
		.mux1_inclk3_logical_to_physical_mapping(mux1_inclk3_logical_to_physical_mapping) ,
		.mux1_inclk4_logical_to_physical_mapping(mux1_inclk4_logical_to_physical_mapping) ,
		.pll_auto_clk_sw_en(pll_auto_clk_sw_en) ,
		.pll_clk_loss_edge(pll_clk_loss_edge) ,
		.pll_clk_loss_sw_en(pll_clk_loss_sw_en) ,
		.pll_clk_sel_override(pll_clk_sel_override) ,
		.pll_clk_sel_override_value(pll_clk_sel_override_value) ,
		.pll_clk_sw_dly(pll_clk_sw_dly) ,
		.pll_clkin_0_scratch0_src(pll_clkin_0_scratch0_src) ,
		.pll_clkin_0_scratch1_src(pll_clkin_0_scratch1_src) ,
		.pll_clkin_0_scratch2_src(pll_clkin_0_scratch2_src) ,
		.pll_clkin_0_scratch3_src(pll_clkin_0_scratch3_src) ,
		.pll_clkin_0_scratch4_src(pll_clkin_0_scratch4_src) ,
		.pll_clkin_0_src(pll_clkin_0_src) ,
		.pll_clkin_1_scratch0_src(pll_clkin_1_scratch0_src) ,
		.pll_clkin_1_scratch1_src(pll_clkin_1_scratch1_src) ,
		.pll_clkin_1_scratch2_src(pll_clkin_1_scratch2_src) ,
		.pll_clkin_1_scratch3_src(pll_clkin_1_scratch3_src) ,
		.pll_clkin_1_scratch4_src(pll_clkin_1_scratch4_src) ,
		.pll_clkin_1_src(pll_clkin_1_src) ,
		.pll_manu_clk_sw_en(pll_manu_clk_sw_en) ,
		.pll_powerdown_mode(pll_powerdown_mode) ,
		.pll_sup_mode(pll_sup_mode) ,
		.pll_sw_refclk_src(pll_sw_refclk_src) ,
		.refclk_select0(refclk_select0) ,
		.refclk_select1(refclk_select1) ,
		.silicon_rev(silicon_rev) ,
		.xpm_iqref_mux0_iqclk_sel(xpm_iqref_mux0_iqclk_sel) ,
		.xpm_iqref_mux0_scratch0_src(xpm_iqref_mux0_scratch0_src) ,
		.xpm_iqref_mux0_scratch1_src(xpm_iqref_mux0_scratch1_src) ,
		.xpm_iqref_mux0_scratch2_src(xpm_iqref_mux0_scratch2_src) ,
		.xpm_iqref_mux0_scratch3_src(xpm_iqref_mux0_scratch3_src) ,
		.xpm_iqref_mux0_scratch4_src(xpm_iqref_mux0_scratch4_src) ,
		.xpm_iqref_mux1_iqclk_sel(xpm_iqref_mux1_iqclk_sel) ,
		.xpm_iqref_mux1_scratch0_src(xpm_iqref_mux1_scratch0_src) ,
		.xpm_iqref_mux1_scratch1_src(xpm_iqref_mux1_scratch1_src) ,
		.xpm_iqref_mux1_scratch2_src(xpm_iqref_mux1_scratch2_src) ,
		.xpm_iqref_mux1_scratch3_src(xpm_iqref_mux1_scratch3_src) ,
		.xpm_iqref_mux1_scratch4_src(xpm_iqref_mux1_scratch4_src)

	)
	twentynm_cmu_fpll_refclk_select_encrypted_inst (

		.avmmaddress(avmmaddress),
		.avmmclk(avmmclk),
		.avmmread(avmmread),
		.avmmrstn(avmmrstn),
		.avmmwrite(avmmwrite),
		.avmmwritedata(avmmwritedata),
		.core_refclk(core_refclk),
		.extswitch(extswitch),
		.fpll_cr_pllen(fpll_cr_pllen),
		.iqtxrxclk(iqtxrxclk),
		.refclk(refclk),
		.pll_cascade_in(pll_cascade_in),
		.ref_iqclk(ref_iqclk),
		.tx_rx_core_refclk(tx_rx_core_refclk),
		.avmmreaddata(avmmreaddata),
		.blockselect(blockselect),
		.clk_src(clk_src),
		.clk0bad(clk0bad),
		.clk1bad(clk1bad),
		.outclk(outclk),
		.extswitch_buf(extswitch_buf),
		.pllclksel(pllclksel)

	);

endmodule
// -----------------------------------------------------------
// This is auto-generated HSSI Simulation Atom Model Encryption Wrapper
// Module Name : work/twentynm_cmu_fpll_wrapper.v
// -----------------------------------------------------------

`timescale 1 ps/1 ps

module twentynm_cmu_fpll
#(
	// Parameter declaration and default value assignment

	parameter enable_debug_info = "true",	//Valid values: false|true; this is simulation-only parameter, for debug purpose only

	parameter	analog_mode = "user_custom" ,		//Valid values: user_custom 
	parameter	bandwidth_range_high = 36'b000000000000000000000000000000000001 ,		//Valid values: 
	parameter	bandwidth_range_low = 36'b000000000000000000000000000000000001 ,		//Valid values: 
	parameter	bonding = "pll_bonding" ,		//Valid values: cpri_bonding pll_bonding 
	parameter	bw_sel = "auto" ,		//Valid values: auto low medium high 
	parameter	cgb_div = 1 ,		//Valid values: 0..15 
	parameter	compensation_mode = "direct" ,		//Valid values: direct normal fpll_bonding iqtxrxclk zdb 
	parameter	datarate = "0 bps" ,		//Valid values:  
	parameter	duty_cycle_0 = 50 ,		//Valid values: 1..99 
	parameter	duty_cycle_1 = 50 ,		//Valid values: 1..99 
	parameter	duty_cycle_2 = 50 ,		//Valid values: 1..99 
	parameter	duty_cycle_3 = 50 ,		//Valid values: 1..99 
	parameter	enable_idle_fpll_support = "idle_none" ,		//Valid values: idle_none idle_conf1 idle_conf2 idle_conf3 idle_conf4 idle_conf5 idle_conf6 idle_conf7 idle_conf8 idle_conf9 idle_conf10 
	parameter	f_max_band_0 = 36'b000000000000000000000000000000000001 ,		//Valid values: 
	parameter	f_max_band_1 = 36'b000000000000000000000000000000000001 ,		//Valid values: 
	parameter	f_max_band_2 = 36'b000000000000000000000000000000000001 ,		//Valid values: 
	parameter	f_max_band_3 = 36'b000000000000000000000000000000000001 ,		//Valid values: 
	parameter	f_max_band_4 = 36'b000000000000000000000000000000000001 ,		//Valid values: 
	parameter	f_max_band_5 = 36'b000000000000000000000000000000000001 ,		//Valid values: 
	parameter	f_max_band_6 = 36'b000000000000000000000000000000000001 ,		//Valid values: 
	parameter	f_max_band_7 = 36'b000000000000000000000000000000000001 ,		//Valid values: 
	parameter	f_max_band_8 = 36'b000000000000000000000000000000000001 ,		//Valid values: 
	parameter	f_max_band_9 = 36'b000000000000000000000000000000000001 ,		//Valid values: 
	parameter	f_max_div_two_bypass = 36'b000000000000000000000000000000000001 ,		//Valid values: 
	parameter	f_max_pfd = 36'b000000000000000000000000000000000001 ,		//Valid values: 
	parameter	f_max_pfd_bonded = 36'b000000000000000000000000000000000001 ,		//Valid values: 
	parameter	f_max_pfd_fractional = 36'b000000000000000000000000000001011111 ,		//Valid values: 
	parameter	f_max_pfd_integer = 36'b000000000000000000000000000000000001 ,		//Valid values: 
	parameter	f_max_vco = 36'b000000000000000000000000000000000001 ,		//Valid values: 
	parameter	f_max_vco_fractional = 36'b000000000000000000000000000000000101 ,		//Valid values: 
	parameter	f_min_band_0 = 36'b000000000000000000000000000000000001 ,		//Valid values: 
	parameter	f_min_band_1 = 36'b000000000000000000000000000000000001 ,		//Valid values: 
	parameter	f_min_band_2 = 36'b000000000000000000000000000000000001 ,		//Valid values: 
	parameter	f_min_band_3 = 36'b000000000000000000000000000000000001 ,		//Valid values: 
	parameter	f_min_band_4 = 36'b000000000000000000000000000000000001 ,		//Valid values: 
	parameter	f_min_band_5 = 36'b000000000000000000000000000000000001 ,		//Valid values: 
	parameter	f_min_band_6 = 36'b000000000000000000000000000000000001 ,		//Valid values: 
	parameter	f_min_band_7 = 36'b000000000000000000000000000000000001 ,		//Valid values: 
	parameter	f_min_band_8 = 36'b000000000000000000000000000000000001 ,		//Valid values: 
	parameter	f_min_band_9 = 36'b000000000000000000000000000000000001 ,		//Valid values: 
	parameter	f_min_pfd = 36'b000000000000000000000000000000000001 ,		//Valid values: 
	parameter	f_min_vco = 36'b000000000000000000000000000000000001 ,		//Valid values: 
	parameter	f_out_c0 = 36'b000000000000000000000000000000000001 ,		//Valid values: 
	parameter	f_out_c0_hz = "0 hz" ,		//Valid values:  
	parameter	f_out_c1 = 36'b000000000000000000000000000000000001 ,		//Valid values: 
	parameter	f_out_c1_hz = "0 hz" ,		//Valid values:  
	parameter	f_out_c2 = 36'b000000000000000000000000000000000001 ,		//Valid values: 
	parameter	f_out_c2_hz = "0 hz" ,		//Valid values:  
	parameter	f_out_c3 = 36'b000000000000000000000000000000000001 ,		//Valid values: 
	parameter	f_out_c3_hz = "0 hz" ,		//Valid values:  
	parameter	feedback = "normal" ,		//Valid values: normal iqtxrxclk core_comp 
	parameter	fpll_cal_test_sel = "sel_cal_out_7_to_0" ,		//Valid values: sel_cal_out_7_to_0 sel_cal_out_11_to_8 
	parameter	fpll_cas_out_enable = "fpll_cas_out_disable" ,		//Valid values: fpll_cas_out_enable fpll_cas_out_disable 
	parameter	fpll_hclk_out_enable = "fpll_hclk_out_disable" ,		//Valid values: fpll_hclk_out_enable fpll_hclk_out_disable 
	parameter	fpll_iqtxrxclk_out_enable = "fpll_iqtxrxclk_out_disable" ,		//Valid values: fpll_iqtxrxclk_out_enable fpll_iqtxrxclk_out_disable 
	parameter	hssi_output_clock_frequency = "0 ps" ,		//Valid values:  
	parameter	initial_settings = "true" ,		//Valid values: false true 
	parameter	input_tolerance = 8'b00000000 ,		//Valid values: 8 
	parameter	is_cascaded_pll = "false" ,		//Valid values: true false 
	parameter	is_otn = "false" ,		//Valid values: false true 
	parameter	is_pa_core = "false" ,		//Valid values: false true 
	parameter	is_sdi = "false" ,		//Valid values: false true 
	parameter	l_counter = 6'b000001 ,		//Valid values: 6 
	parameter	m_counter = 8'b00000001 ,		//Valid values: 8 
	parameter	m_counter_c0 = 9'b000000000 ,		//Valid values: 9 
	parameter	m_counter_c1 = 9'b000000000 ,		//Valid values: 9 
	parameter	m_counter_c2 = 9'b000000000 ,		//Valid values: 9 
	parameter	m_counter_c3 = 9'b000000000 ,		//Valid values: 9 
	parameter	max_fractional_percentage = 7'b0000000 ,		//Valid values: 7 
	parameter	min_fractional_percentage = 7'b0000000 ,		//Valid values: 7 
	parameter	n_counter = 6'b000001 ,		//Valid values: 6 
	parameter	out_freq = 36'b000000000000000000000000000000000001 ,		//Valid values: 
	parameter	out_freq_hz = "0 hz" ,		//Valid values:  
	parameter	output_clock_frequency_0 = "0 ps" ,		//Valid values:  
	parameter	output_clock_frequency_1 = "0 ps" ,		//Valid values:  
	parameter	output_clock_frequency_2 = "0 ps" ,		//Valid values:  
	parameter	output_clock_frequency_3 = "0 ps" ,		//Valid values:  
	parameter	output_tolerance = 8'b00000000 ,		//Valid values: 8 
	parameter	pfd_freq = 36'b000000000000000000000000000000000001 ,		//Valid values: 
	parameter	phase_shift_0 = "0 ps" ,		//Valid values:  
	parameter	phase_shift_1 = "0 ps" ,		//Valid values:  
	parameter	phase_shift_2 = "0 ps" ,		//Valid values:  
	parameter	phase_shift_3 = "0 ps" ,		//Valid values:  
	parameter	pll_atb = "atb_selectdisable" ,		//Valid values: atb_selectdisable atb_select0 atb_select1 atb_select2 atb_select3 atb_select4 atb_select5 atb_select6 atb_select7 atb_select8 atb_select9 atb_select10 atb_select11 atb_select12 atb_select13 atb_select14 atb_select15 atb_select16 atb_select17 atb_select18 atb_select19 atb_select20 atb_select21 atb_select22 atb_select23 atb_select24 atb_select25 atb_select26 atb_select27 atb_select28 atb_select29 atb_select30 
	parameter	pll_bw_mode = "low_bw" ,		//Valid values: low_bw mid_bw hi_bw 
	parameter	pll_c0_pllcout_enable = "false" ,		//Valid values: false true 
	parameter	pll_c1_pllcout_enable = "false" ,		//Valid values: false true 
	parameter	pll_c2_pllcout_enable = "false" ,		//Valid values: false true 
	parameter	pll_c3_pllcout_enable = "false" ,		//Valid values: false true 
	parameter	pll_c_counter_0 = 1 ,		//Valid values: 0..511 
	parameter	pll_c_counter_0_coarse_dly = "0 ps" ,		//Valid values: 0 ps 200 ps 400 ps 600 ps 800 ps 1000 ps 
	parameter	pll_c_counter_0_fine_dly = "0 ps" ,		//Valid values: 0 ps 50 ps 100 ps 150 ps 
	parameter	pll_c_counter_0_in_src = "m_cnt_in_src_test_clk" ,		//Valid values: m_cnt_in_src_ph_mux_clk m_cnt_in_src_cscd_clk m_cnt_in_src_test_clk 
	parameter	pll_c_counter_0_min_tco_enable = "true" ,		//Valid values: true false 
	parameter	pll_c_counter_0_ph_mux_prst = 0 ,		//Valid values: 0..3 
	parameter	pll_c_counter_0_prst = 1 ,		//Valid values: 0..255 
	parameter	pll_c_counter_1 = 1 ,		//Valid values: 0..511 
	parameter	pll_c_counter_1_coarse_dly = "0 ps" ,		//Valid values: 0 ps 200 ps 400 ps 600 ps 800 ps 1000 ps 
	parameter	pll_c_counter_1_fine_dly = "0 ps" ,		//Valid values: 0 ps 50 ps 100 ps 150 ps 
	parameter	pll_c_counter_1_in_src = "m_cnt_in_src_test_clk" ,		//Valid values: m_cnt_in_src_ph_mux_clk m_cnt_in_src_cscd_clk m_cnt_in_src_test_clk 
	parameter	pll_c_counter_1_min_tco_enable = "true" ,		//Valid values: true false 
	parameter	pll_c_counter_1_ph_mux_prst = 0 ,		//Valid values: 0..3 
	parameter	pll_c_counter_1_prst = 1 ,		//Valid values: 0..255 
	parameter	pll_c_counter_2 = 1 ,		//Valid values: 0..511 
	parameter	pll_c_counter_2_coarse_dly = "0 ps" ,		//Valid values: 0 ps 200 ps 400 ps 600 ps 800 ps 1000 ps 
	parameter	pll_c_counter_2_fine_dly = "0 ps" ,		//Valid values: 0 ps 50 ps 100 ps 150 ps 
	parameter	pll_c_counter_2_in_src = "m_cnt_in_src_test_clk" ,		//Valid values: m_cnt_in_src_ph_mux_clk m_cnt_in_src_cscd_clk m_cnt_in_src_test_clk 
	parameter	pll_c_counter_2_min_tco_enable = "true" ,		//Valid values: true false 
	parameter	pll_c_counter_2_ph_mux_prst = 0 ,		//Valid values: 0..3 
	parameter	pll_c_counter_2_prst = 1 ,		//Valid values: 0..255 
	parameter	pll_c_counter_3 = 1 ,		//Valid values: 0..511 
	parameter	pll_c_counter_3_coarse_dly = "0 ps" ,		//Valid values: 0 ps 200 ps 400 ps 600 ps 800 ps 1000 ps 
	parameter	pll_c_counter_3_fine_dly = "0 ps" ,		//Valid values: 0 ps 50 ps 100 ps 150 ps 
	parameter	pll_c_counter_3_in_src = "m_cnt_in_src_test_clk" ,		//Valid values: m_cnt_in_src_ph_mux_clk m_cnt_in_src_cscd_clk m_cnt_in_src_test_clk 
	parameter	pll_c_counter_3_min_tco_enable = "true" ,		//Valid values: true false 
	parameter	pll_c_counter_3_ph_mux_prst = 0 ,		//Valid values: 0..3 
	parameter	pll_c_counter_3_prst = 1 ,		//Valid values: 0..255 
	parameter	pll_cal_status = "true" ,		//Valid values: true false 
	parameter	pll_calibration = "false" ,		//Valid values: false true 
	parameter	pll_cmp_buf_dly = "0 ps" ,		//Valid values: 0 ps 1000 ps 2000 ps 3000 ps 4000 ps 5000 ps 
	parameter	pll_cmu_rstn_value = "true" ,		//Valid values: true false 
	parameter	pll_core_cali_ref_off = "true" ,		//Valid values: true false 
	parameter	pll_core_cali_vco_off = "true" ,		//Valid values: true false 
	parameter	pll_core_vccdreg_fb = "vreg_fb0" ,		//Valid values: vreg_fb0 vreg_fb1 vreg_fb2 vreg_f3 vreg_fb4 vreg_fb5 vreg_fb6 vreg_fb7 vreg_fb8 vreg_fb9 vreg_fb10 vreg_fb11 vreg_fb12 vreg_fb13 vreg_fb14 vreg_fb15 vreg_fb16 vreg_fb17 vreg_fb18 vreg_fb19 vreg_fb20 vreg_fb21 vreg_fb22 vreg_fb23 vreg_fb24 vreg_fb25 vreg_fb26 vreg_fb27 vreg_fb28 vreg_fb29 vreg_fb30 vreg_fb31 
	parameter	pll_core_vccdreg_fw = "vreg_fw0" ,		//Valid values: vreg_fw0 vreg_fw1 vreg_fw2 vreg_fw3 vreg_fw4 vreg_fw5 vreg_fw6 vreg_fw7 vreg_fw8 vreg_fw9 vreg_fw10 vreg_fw11 vreg_fw12 vreg_fw13 vreg_fw14 vreg_fw15 vreg_fw16 vreg_fw17 vreg_fw18 vreg_fw19 vreg_fw20 vreg_fw21 vreg_fw22 vreg_fw23 vreg_fw24 vreg_fw25 vreg_fw26 vreg_fw27 vreg_fw28 vreg_fw29 vreg_fw30 vreg_fw31 
	parameter	pll_core_vreg0_atbsel = "atb_disabled" ,		//Valid values: atb_disabled atbsel0 atbsel1 atbsel2 
	parameter	pll_core_vreg1_atbsel = "atb_disabled1" ,		//Valid values: atb_disabled1 atbsel0_1 atbsel1_1 atbsel2_1 
	parameter	pll_cp_compensation = "true" ,		//Valid values: false true 
	parameter	pll_cp_current_setting = "cp_current_setting0" ,		//Valid values: cp_current_setting0 cp_current_setting1 cp_current_setting2 cp_current_setting3 cp_current_setting4 cp_current_setting5 cp_current_setting6 cp_current_setting7 cp_current_setting8 cp_current_setting9 cp_current_setting10 cp_current_setting11 cp_current_setting12 cp_current_setting13 cp_current_setting14 cp_current_setting15 cp_current_setting16 cp_current_setting17 cp_current_setting18 cp_current_setting19 cp_current_setting20 cp_current_setting21 cp_current_setting22 cp_current_setting23 cp_current_setting24 cp_current_setting25 cp_current_setting26 cp_current_setting27 cp_current_setting28 cp_current_setting29 cp_current_setting30 cp_current_setting31 cp_current_setting32 cp_current_setting33 cp_current_setting34 cp_current_setting35 cp_current_setting36 cp_current_setting37 cp_current_setting38 cp_current_setting39 cp_current_setting40 cp_current_setting41 
	parameter	pll_cp_lf_3rd_pole_freq = "lf_3rd_pole_setting0" ,		//Valid values: lf_3rd_pole_setting0 lf_3rd_pole_setting1 lf_3rd_pole_setting2 lf_3rd_pole_setting3 
	parameter	pll_cp_lf_order = "lf_2nd_order" ,		//Valid values: lf_2nd_order lf_3rd_order 
	parameter	pll_cp_testmode = "cp_normal" ,		//Valid values: cp_normal cp_test_up cp_test_dn cp_tristate 
	parameter	pll_ctrl_override_setting = "true" ,		//Valid values: true false 
	parameter	pll_ctrl_plniotri_override = "false" ,		//Valid values: false true 
	parameter	pll_device_variant = "device1" ,		//Valid values: device1 device2 device3 device4 device5 
	parameter	pll_dprio_base_addr = 256 ,		//Valid values: 0..511 
	parameter	pll_dprio_broadcast_en = "false" ,		//Valid values: true false 
	parameter	pll_dprio_clk_vreg_boost = "clk_fpll_vreg_no_voltage_boost" ,		//Valid values: clk_fpll_vreg_no_voltage_boost clk_fpll_vreg_boost_1_step clk_fpll_vreg_boost_2_step clk_fpll_vreg_boost_3_step clk_fpll_vreg_boost_4_step clk_fpll_vreg_boost_5_step clk_fpll_vreg_boost_6_step clk_fpll_vreg_boost_7_step 
	parameter	pll_dprio_cvp_inter_sel = "true" ,		//Valid values: true false 
	parameter	pll_dprio_force_inter_sel = "false" ,		//Valid values: true false 
	parameter	pll_dprio_fpll_vreg1_boost = "fpll_vreg1_no_voltage_boost" ,		//Valid values: fpll_vreg1_no_voltage_boost fpll_vreg1_boost_1_step fpll_vreg1_boost_2_step fpll_vreg1_boost_3_step fpll_vreg1_boost_4_step fpll_vreg1_boost_5_step fpll_vreg1_boost_6_step fpll_vreg1_boost_7_step 
	parameter	pll_dprio_fpll_vreg_boost = "fpll_vreg_no_voltage_boost" ,		//Valid values: fpll_vreg_no_voltage_boost fpll_vreg_boost_1_step fpll_vreg_boost_2_step fpll_vreg_boost_3_step fpll_vreg_boost_4_step fpll_vreg_boost_5_step fpll_vreg_boost_6_step fpll_vreg_boost_7_step 
	parameter	pll_dprio_power_iso_en = "true" ,		//Valid values: true false 
	parameter	pll_dprio_status_select = "dprio_normal_status" ,		//Valid values: dprio_normal_status dsm_dft_out dsm_lsb_out dsm_msb_out fbclk_counter_out refclk_counter_out 
	parameter	pll_dsm_ecn_bypass = "false" ,		//Valid values: false true 
	parameter	pll_dsm_ecn_test_en = "false" ,		//Valid values: false true 
	parameter	pll_dsm_fractional_division = 32'b00000000000000000000000000000000 ,		//Valid values: 
	parameter	pll_dsm_fractional_value_ready = "pll_k_ready" ,		//Valid values: pll_k_not_ready pll_k_ready 
	parameter	pll_dsm_mode = "dsm_mode_integer" ,		//Valid values: dsm_mode_integer dsm_mode_phase 
	parameter	pll_dsm_out_sel = "pll_dsm_disable" ,		//Valid values: pll_dsm_disable pll_dsm_1st_order pll_dsm_2nd_order pll_dsm_3rd_order 
	parameter	pll_enable = "false" ,		//Valid values: false true 
	parameter	pll_extra_csr = 0 ,		//Valid values: 0..7 
	parameter	pll_fbclk_mux_1 = "pll_fbclk_mux_1_glb" ,		//Valid values: pll_fbclk_mux_1_glb pll_fbclk_mux_1_zbd pll_fbclk_mux_1_lvds pll_fbclk_mux_1_fbclk_pll 
	parameter	pll_fbclk_mux_2 = "pll_fbclk_mux_2_fb_1" ,		//Valid values: pll_fbclk_mux_2_fb_1 pll_fbclk_mux_2_m_cnt 
	parameter	pll_iqclk_mux_sel = "power_down" ,		//Valid values: iqtxrxclk0 iqtxrxclk1 iqtxrxclk2 iqtxrxclk3 iqtxrxclk4 iqtxrxclk5 power_down 
	parameter	pll_l_counter = 1 ,		//Valid values: 1 2 4 8 
	parameter	pll_l_counter_bypass = "false" ,		//Valid values: false true 
	parameter	pll_l_counter_enable = "true" ,		//Valid values: true false 
	parameter	pll_lf_cbig = "lf_cbig_setting0" ,		//Valid values: lf_cbig_setting0 lf_cbig_setting1 lf_cbig_setting2 lf_cbig_setting3 lf_cbig_setting4 
	parameter	pll_lf_resistance = "lf_res_setting0" ,		//Valid values: lf_res_setting0 lf_res_setting1 lf_res_setting2 lf_res_setting3 
	parameter	pll_lf_ripplecap = "lf_ripple_enabled_0" ,		//Valid values: lf_no_ripple lf_ripple_enabled_0 lf_ripple_enabled_1 
	parameter	pll_lock_fltr_cfg = 1 ,		//Valid values: 0..4095 
	parameter	pll_lock_fltr_test = "pll_lock_fltr_nrm" ,		//Valid values: pll_lock_fltr_nrm pll_lock_fltr_test 
	parameter	pll_lpf_rstn_value = "lpf_normal" ,		//Valid values: lpf_normal lpf_reset0 lpf_reset1 lpf_reset2 
	parameter	pll_m_counter = 1 ,		//Valid values: 0..511 
	parameter	pll_m_counter_coarse_dly = "0 ps" ,		//Valid values: 0 ps 200 ps 400 ps 600 ps 800 ps 1000 ps 
	parameter	pll_m_counter_fine_dly = "0 ps" ,		//Valid values: 0 ps 50 ps 100 ps 150 ps 
	parameter	pll_m_counter_in_src = "m_cnt_in_src_test_clk" ,		//Valid values: m_cnt_in_src_ph_mux_clk m_cnt_in_src_cscd_clk m_cnt_in_src_test_clk 
	parameter	pll_m_counter_min_tco_enable = "true" ,		//Valid values: true false 
	parameter	pll_m_counter_ph_mux_prst = 0 ,		//Valid values: 0..3 
	parameter	pll_m_counter_prst = 1 ,		//Valid values: 0..255 
	parameter	pll_n_counter = 1 ,		//Valid values: 0..31 
	parameter	pll_n_counter_coarse_dly = "0 ps" ,		//Valid values: 0 ps 200 ps 400 ps 600 ps 800 ps 1000 ps 
	parameter	pll_n_counter_fine_dly = "0 ps" ,		//Valid values: 0 ps 50 ps 100 ps 150 ps 
	parameter	pll_nreset_invert = "false" ,		//Valid values: false true 
	parameter	pll_op_mode = "false" ,		//Valid values: false true 
	parameter	pll_optimal = "true" ,		//Valid values: false true 
	parameter	pll_powerdown_mode = "false" ,		//Valid values: false true 
	parameter	pll_ppm_clk0_src = "ppm_clk0_vss" ,		//Valid values: ppm_clk0_vss ppm_clk0_refclk ppm_clk0_n_cnt ppm_clk0_fbclk ppm_clk0_c0_cnt ppm_clk0_c1_cnt ppm_clk0_c2_cnt ppm_clk0_c3_cnt 
	parameter	pll_ppm_clk1_src = "ppm_clk1_vss" ,		//Valid values: ppm_clk1_vss ppm_clk1_refclk ppm_clk1_n_cnt ppm_clk1_fbclk ppm_clk1_c0_cnt ppm_clk1_c1_cnt ppm_clk1_c2_cnt ppm_clk1_c3_cnt 
	parameter	pll_ref_buf_dly = "0 ps" ,		//Valid values: 0 ps 1000 ps 2000 ps 3000 ps 4000 ps 5000 ps 
	parameter	pll_rstn_override = "false" ,		//Valid values: false true 
	parameter	pll_self_reset = "false" ,		//Valid values: false true 
	parameter	pll_sup_mode = "user_mode" ,		//Valid values: user_mode engineering_mode 
	parameter	pll_tclk_mux_en = "false" ,		//Valid values: false true 
	parameter	pll_tclk_sel = "pll_tclk_m_src" ,		//Valid values: pll_tclk_n_src pll_tclk_m_src 
	parameter	pll_test_enable = "false" ,		//Valid values: false true 
	parameter	pll_unlock_fltr_cfg = 0 ,		//Valid values: 0..7 
	parameter	pll_vccr_pd_en = "false" ,		//Valid values: true false 
	parameter	pll_vco_freq_band_0 = "pll_freq_band0" ,		//Valid values: pll_freq_band0 pll_freq_band1 pll_freq_band2 pll_freq_band3 pll_freq_band4 pll_freq_band5 pll_freq_band6 pll_freq_band7 pll_freq_band8 
	parameter	pll_vco_freq_band_0_dyn_high_bits = 2'b00 ,		//Valid values: 2 
	parameter	pll_vco_freq_band_0_dyn_low_bits = 3'b000 ,		//Valid values: 3 
	parameter	pll_vco_freq_band_0_fix = 5'b00001 ,		//Valid values: 5 
	parameter	pll_vco_freq_band_0_fix_high = "pll_vco_freq_band_0_fix_high_0" ,		//Valid values: pll_vco_freq_band_0_fix_high_1 pll_vco_freq_band_0_fix_high_0 
	parameter	pll_vco_freq_band_1 = "pll_freq_band0_1" ,		//Valid values: pll_freq_band0_1 pll_freq_band1_1 pll_freq_band2_1 pll_freq_band3_1 pll_freq_band4_1 pll_freq_band5_1 pll_freq_band6_1 pll_freq_band7_1 pll_freq_band8_1 
	parameter	pll_vco_freq_band_1_dyn_high_bits = 2'b00 ,		//Valid values: 2 
	parameter	pll_vco_freq_band_1_dyn_low_bits = 3'b000 ,		//Valid values: 3 
	parameter	pll_vco_freq_band_1_fix = 5'b00001 ,		//Valid values: 5 
	parameter	pll_vco_freq_band_1_fix_high = "pll_vco_freq_band_1_fix_high_0" ,		//Valid values: pll_vco_freq_band_1_fix_high_1 pll_vco_freq_band_1_fix_high_0 
	parameter	pll_vco_ph0_en = "false" ,		//Valid values: false true 
	parameter	pll_vco_ph0_value = "pll_vco_ph0_vss" ,		//Valid values: pll_vco_ph0_vss pll_vco_ph0_vcc 
	parameter	pll_vco_ph1_en = "false" ,		//Valid values: false true 
	parameter	pll_vco_ph1_value = "pll_vco_ph1_vss" ,		//Valid values: pll_vco_ph1_vss pll_vco_ph1_vcc 
	parameter	pll_vco_ph2_en = "false" ,		//Valid values: false true 
	parameter	pll_vco_ph2_value = "pll_vco_ph2_vss" ,		//Valid values: pll_vco_ph2_vss pll_vco_ph2_vcc 
	parameter	pll_vco_ph3_en = "false" ,		//Valid values: false true 
	parameter	pll_vco_ph3_value = "pll_vco_ph3_vss" ,		//Valid values: pll_vco_ph3_vss pll_vco_ph3_vcc 
	parameter	pm_speed_grade = "e2" ,		//Valid values: e1 i1 e2 i2 e3 i3 m3 e4 i4 m4 e5 i5 
	parameter	pma_width = 8 ,		//Valid values: 0..127 
	parameter	power_mode = "low_power" ,		//Valid values: low_power mid_power high_perf 
	parameter	power_rail_et = 0 ,		//Valid values: 0..4095 
	parameter	primary_use = "tx" ,		//Valid values: tx iqtxrx core 
	parameter	prot_mode = "basic_tx" ,		//Valid values: unused basic_tx pcie_gen1_tx pcie_gen2_tx pcie_gen3_tx pcie_gen4_tx qpi_tx gpon_tx sata_tx sas_tx upi_tx 
	parameter	reference_clock_frequency = "0 ps" ,		//Valid values:  
	parameter	reference_clock_frequency_scratch = "0 hz" ,		//Valid values:  
	parameter	set_fpll_input_freq_range = 8'b00000000 ,		//Valid values: 8 
	parameter	side = "side_unknown" ,		//Valid values: left right side_unknown 
	parameter	silicon_rev = "20nm5es" ,		//Valid values: 20nm5es 20nm5es2 20nm4es 20nm4es2 20nm5 20nm4 20nm3 20nm2 20nm1 
	parameter	top_or_bottom = "tb_unknown" ,		//Valid values: top bot tb_unknown 
	parameter	vco_freq = 36'b000000000000000000000000000000000001 ,		//Valid values: 
	parameter	vco_freq_hz = "0 hz" ,		//Valid values:  
	parameter	vco_frequency = "0 ps" ,		//Valid values:  
	parameter	xpm_cmu_fpll_core_cal_vco_count_length = "sel_8b_count" ,		//Valid values: sel_8b_count sel_12b_count 
	parameter	xpm_cmu_fpll_core_fpll_refclk_source = "normal_refclk" ,		//Valid values: normal_refclk lc_dedicated_refclk 
	parameter	xpm_cmu_fpll_core_fpll_vco_div_by_2_sel = "bypass_divide_by_2" ,		//Valid values: bypass_divide_by_2 divide_by_2 
	parameter	xpm_cmu_fpll_core_pfd_delay_compensation = "normal_delay" ,		//Valid values: normal_delay ref_compensated_delay fb_compensated_delay unused_delay 
	parameter	xpm_cmu_fpll_core_pfd_pulse_width = "pulse_width_setting0" ,		//Valid values: pulse_width_setting0 pulse_width_setting1 pulse_width_setting2 pulse_width_setting3 
	parameter	xpm_cmu_fpll_core_xpm_cpvco_fpll_xpm_chgpmplf_fpll_cp_current_boost = "normal_setting"		//Valid values: normal_setting boost_setting 
)

(
	//Port declaration

	input	clk0bad_in ,
	input	clk1bad_in ,
	input	[3:0]  cnt_sel ,
	input	core_refclk ,
	input	csr_bufin ,
	input	csr_clk ,
	input	csr_en ,
	input	csr_en_dly ,
	input	csr_in ,
	input	avmmclk ,
	input	avmmrstn ,
	input	dps_rst_n ,
	input	extswitch_buf ,
	input	fbclk_in ,
	input	[1:0]  fpll_ppm_clk ,
	input	[5:0]  iqtxrxclk ,
	input	lc_to_fpll_refclk ,
	input	mdio_dis ,
	input	nfrzdrv ,
	input	nrpi_freeze ,
	input	[2:0]  num_phase_shifts ,
	input	pfden ,
	input	phase_en ,
	input	pllclksel ,
	input	pma_atpg_los_en_n ,
	input	pma_csr_test_dis ,
	input	avmmread ,
	input	refclk ,
	input	[8:0]  avmmaddress ,
	input	rst_n ,
	input	scan_mode_n ,
	input	scan_shift_n ,
	input	up_dn ,
	input	avmmwrite ,
	input	[7:0]  avmmwritedata ,

	output	block_select ,
	output	clk0 ,
	output	clk0bad ,
	output	clk180 ,
	output	clk1bad ,
	output	clklow ,
	output	csr_bufout ,
	output	csr_out ,
	output	fbclk_out ,
	output	clk_sel_override ,
	output	clk_sel_override_value ,
	output	fref ,
	output	hclk_out ,
	output	iqtxrxclk_out ,
	output	lock ,
	output	phase_done ,
	output	pll_cascade_out ,
	output	[3:0]  outclk ,
	output	[1:0]  ppm_clk ,
	output	[7:0]  avmmreaddata 

);

// Function to convert a 64bit binary to a string.
function [128*8-1 : 0] m_bin_to_str;
	input [128 : 1]   s;
	reg   [128 : 1]   reg_s;
	reg   [7 : 0]    tmp;
	reg   [128*8 : 1] res;
	integer m, index;

	begin
		reg_s = s;
		res = 128'h00000000000000000000000000000000;

		for (m = 128; m > 0; m = m-1 )
		begin
			tmp = reg_s[128];
			res[(((m-1)*8)+1)] = tmp & 1'b1;
			reg_s = reg_s << 1;
		end

		m_bin_to_str = res;
	end
endfunction

localparam [8*128-1 : 0] bandwidth_range_high_string	= m_bin_to_str(bandwidth_range_high);
localparam [8*128-1 : 0] bandwidth_range_low_string	= m_bin_to_str(bandwidth_range_low);
localparam [8*128-1 : 0] f_max_band_0_string	= m_bin_to_str(f_max_band_0);
localparam [8*128-1 : 0] f_max_band_1_string	= m_bin_to_str(f_max_band_1);
localparam [8*128-1 : 0] f_max_band_2_string	= m_bin_to_str(f_max_band_2);
localparam [8*128-1 : 0] f_max_band_3_string	= m_bin_to_str(f_max_band_3);
localparam [8*128-1 : 0] f_max_band_4_string	= m_bin_to_str(f_max_band_4);
localparam [8*128-1 : 0] f_max_band_5_string	= m_bin_to_str(f_max_band_5);
localparam [8*128-1 : 0] f_max_band_6_string	= m_bin_to_str(f_max_band_6);
localparam [8*128-1 : 0] f_max_band_7_string	= m_bin_to_str(f_max_band_7);
localparam [8*128-1 : 0] f_max_band_8_string	= m_bin_to_str(f_max_band_8);
localparam [8*128-1 : 0] f_max_band_9_string	= m_bin_to_str(f_max_band_9);
localparam [8*128-1 : 0] f_max_div_two_bypass_string	= m_bin_to_str(f_max_div_two_bypass);
localparam [8*128-1 : 0] f_max_pfd_string	= m_bin_to_str(f_max_pfd);
localparam [8*128-1 : 0] f_max_pfd_bonded_string	= m_bin_to_str(f_max_pfd_bonded);
localparam [8*128-1 : 0] f_max_pfd_fractional_string	= m_bin_to_str(f_max_pfd_fractional);
localparam [8*128-1 : 0] f_max_pfd_integer_string	= m_bin_to_str(f_max_pfd_integer);
localparam [8*128-1 : 0] f_max_vco_string	= m_bin_to_str(f_max_vco);
localparam [8*128-1 : 0] f_max_vco_fractional_string	= m_bin_to_str(f_max_vco_fractional);
localparam [8*128-1 : 0] f_min_band_0_string	= m_bin_to_str(f_min_band_0);
localparam [8*128-1 : 0] f_min_band_1_string	= m_bin_to_str(f_min_band_1);
localparam [8*128-1 : 0] f_min_band_2_string	= m_bin_to_str(f_min_band_2);
localparam [8*128-1 : 0] f_min_band_3_string	= m_bin_to_str(f_min_band_3);
localparam [8*128-1 : 0] f_min_band_4_string	= m_bin_to_str(f_min_band_4);
localparam [8*128-1 : 0] f_min_band_5_string	= m_bin_to_str(f_min_band_5);
localparam [8*128-1 : 0] f_min_band_6_string	= m_bin_to_str(f_min_band_6);
localparam [8*128-1 : 0] f_min_band_7_string	= m_bin_to_str(f_min_band_7);
localparam [8*128-1 : 0] f_min_band_8_string	= m_bin_to_str(f_min_band_8);
localparam [8*128-1 : 0] f_min_band_9_string	= m_bin_to_str(f_min_band_9);
localparam [8*128-1 : 0] f_min_pfd_string	= m_bin_to_str(f_min_pfd);
localparam [8*128-1 : 0] f_min_vco_string	= m_bin_to_str(f_min_vco);
localparam [8*128-1 : 0] f_out_c0_string	= m_bin_to_str(f_out_c0);
localparam [8*128-1 : 0] f_out_c1_string	= m_bin_to_str(f_out_c1);
localparam [8*128-1 : 0] f_out_c2_string	= m_bin_to_str(f_out_c2);
localparam [8*128-1 : 0] f_out_c3_string	= m_bin_to_str(f_out_c3);
localparam [8*128-1 : 0] out_freq_string	= m_bin_to_str(out_freq);
localparam [8*128-1 : 0] pfd_freq_string	= m_bin_to_str(pfd_freq);
localparam [8*128-1 : 0] pll_dsm_fractional_division_string	= m_bin_to_str(pll_dsm_fractional_division);
localparam [8*128-1 : 0] vco_freq_string	= m_bin_to_str(vco_freq);


	twentynm_cmu_fpll_encrypted
	#(
		.enable_debug_info(enable_debug_info) ,

		.analog_mode(analog_mode) ,
		.bandwidth_range_high(bandwidth_range_high_string) ,
		.bandwidth_range_low(bandwidth_range_low_string) ,
		.bonding(bonding) ,
		.bw_sel(bw_sel) ,
		.cgb_div(cgb_div) ,
		.compensation_mode(compensation_mode) ,
		.datarate(datarate) ,
		.duty_cycle_0(duty_cycle_0) ,
		.duty_cycle_1(duty_cycle_1) ,
		.duty_cycle_2(duty_cycle_2) ,
		.duty_cycle_3(duty_cycle_3) ,
		.enable_idle_fpll_support(enable_idle_fpll_support) ,
		.f_max_band_0(f_max_band_0_string) ,
		.f_max_band_1(f_max_band_1_string) ,
		.f_max_band_2(f_max_band_2_string) ,
		.f_max_band_3(f_max_band_3_string) ,
		.f_max_band_4(f_max_band_4_string) ,
		.f_max_band_5(f_max_band_5_string) ,
		.f_max_band_6(f_max_band_6_string) ,
		.f_max_band_7(f_max_band_7_string) ,
		.f_max_band_8(f_max_band_8_string) ,
		.f_max_band_9(f_max_band_9_string) ,
		.f_max_div_two_bypass(f_max_div_two_bypass_string) ,
		.f_max_pfd(f_max_pfd_string) ,
		.f_max_pfd_bonded(f_max_pfd_bonded_string) ,
		.f_max_pfd_fractional(f_max_pfd_fractional_string) ,
		.f_max_pfd_integer(f_max_pfd_integer_string) ,
		.f_max_vco(f_max_vco_string) ,
		.f_max_vco_fractional(f_max_vco_fractional_string) ,
		.f_min_band_0(f_min_band_0_string) ,
		.f_min_band_1(f_min_band_1_string) ,
		.f_min_band_2(f_min_band_2_string) ,
		.f_min_band_3(f_min_band_3_string) ,
		.f_min_band_4(f_min_band_4_string) ,
		.f_min_band_5(f_min_band_5_string) ,
		.f_min_band_6(f_min_band_6_string) ,
		.f_min_band_7(f_min_band_7_string) ,
		.f_min_band_8(f_min_band_8_string) ,
		.f_min_band_9(f_min_band_9_string) ,
		.f_min_pfd(f_min_pfd_string) ,
		.f_min_vco(f_min_vco_string) ,
		.f_out_c0(f_out_c0_string) ,
		.f_out_c0_hz(f_out_c0_hz) ,
		.f_out_c1(f_out_c1_string) ,
		.f_out_c1_hz(f_out_c1_hz) ,
		.f_out_c2(f_out_c2_string) ,
		.f_out_c2_hz(f_out_c2_hz) ,
		.f_out_c3(f_out_c3_string) ,
		.f_out_c3_hz(f_out_c3_hz) ,
		.feedback(feedback) ,
		.fpll_cal_test_sel(fpll_cal_test_sel) ,
		.fpll_cas_out_enable(fpll_cas_out_enable) ,
		.fpll_hclk_out_enable(fpll_hclk_out_enable) ,
		.fpll_iqtxrxclk_out_enable(fpll_iqtxrxclk_out_enable) ,
		.hssi_output_clock_frequency(hssi_output_clock_frequency) ,
		.initial_settings(initial_settings) ,
		.input_tolerance(input_tolerance) ,
		.is_cascaded_pll(is_cascaded_pll) ,
		.is_otn(is_otn) ,
		.is_pa_core(is_pa_core) ,
		.is_sdi(is_sdi) ,
		.l_counter(l_counter) ,
		.m_counter(m_counter) ,
		.m_counter_c0(m_counter_c0) ,
		.m_counter_c1(m_counter_c1) ,
		.m_counter_c2(m_counter_c2) ,
		.m_counter_c3(m_counter_c3) ,
		.max_fractional_percentage(max_fractional_percentage) ,
		.min_fractional_percentage(min_fractional_percentage) ,
		.n_counter(n_counter) ,
		.out_freq(out_freq_string) ,
		.out_freq_hz(out_freq_hz) ,
		.output_clock_frequency_0(output_clock_frequency_0) ,
		.output_clock_frequency_1(output_clock_frequency_1) ,
		.output_clock_frequency_2(output_clock_frequency_2) ,
		.output_clock_frequency_3(output_clock_frequency_3) ,
		.output_tolerance(output_tolerance) ,
		.pfd_freq(pfd_freq_string) ,
		.phase_shift_0(phase_shift_0) ,
		.phase_shift_1(phase_shift_1) ,
		.phase_shift_2(phase_shift_2) ,
		.phase_shift_3(phase_shift_3) ,
		.pll_atb(pll_atb) ,
		.pll_bw_mode(pll_bw_mode) ,
		.pll_c0_pllcout_enable(pll_c0_pllcout_enable) ,
		.pll_c1_pllcout_enable(pll_c1_pllcout_enable) ,
		.pll_c2_pllcout_enable(pll_c2_pllcout_enable) ,
		.pll_c3_pllcout_enable(pll_c3_pllcout_enable) ,
		.pll_c_counter_0(pll_c_counter_0) ,
		.pll_c_counter_0_coarse_dly(pll_c_counter_0_coarse_dly) ,
		.pll_c_counter_0_fine_dly(pll_c_counter_0_fine_dly) ,
		.pll_c_counter_0_in_src(pll_c_counter_0_in_src) ,
		.pll_c_counter_0_min_tco_enable(pll_c_counter_0_min_tco_enable) ,
		.pll_c_counter_0_ph_mux_prst(pll_c_counter_0_ph_mux_prst) ,
		.pll_c_counter_0_prst(pll_c_counter_0_prst) ,
		.pll_c_counter_1(pll_c_counter_1) ,
		.pll_c_counter_1_coarse_dly(pll_c_counter_1_coarse_dly) ,
		.pll_c_counter_1_fine_dly(pll_c_counter_1_fine_dly) ,
		.pll_c_counter_1_in_src(pll_c_counter_1_in_src) ,
		.pll_c_counter_1_min_tco_enable(pll_c_counter_1_min_tco_enable) ,
		.pll_c_counter_1_ph_mux_prst(pll_c_counter_1_ph_mux_prst) ,
		.pll_c_counter_1_prst(pll_c_counter_1_prst) ,
		.pll_c_counter_2(pll_c_counter_2) ,
		.pll_c_counter_2_coarse_dly(pll_c_counter_2_coarse_dly) ,
		.pll_c_counter_2_fine_dly(pll_c_counter_2_fine_dly) ,
		.pll_c_counter_2_in_src(pll_c_counter_2_in_src) ,
		.pll_c_counter_2_min_tco_enable(pll_c_counter_2_min_tco_enable) ,
		.pll_c_counter_2_ph_mux_prst(pll_c_counter_2_ph_mux_prst) ,
		.pll_c_counter_2_prst(pll_c_counter_2_prst) ,
		.pll_c_counter_3(pll_c_counter_3) ,
		.pll_c_counter_3_coarse_dly(pll_c_counter_3_coarse_dly) ,
		.pll_c_counter_3_fine_dly(pll_c_counter_3_fine_dly) ,
		.pll_c_counter_3_in_src(pll_c_counter_3_in_src) ,
		.pll_c_counter_3_min_tco_enable(pll_c_counter_3_min_tco_enable) ,
		.pll_c_counter_3_ph_mux_prst(pll_c_counter_3_ph_mux_prst) ,
		.pll_c_counter_3_prst(pll_c_counter_3_prst) ,
		.pll_cal_status(pll_cal_status) ,
		.pll_calibration(pll_calibration) ,
		.pll_cmp_buf_dly(pll_cmp_buf_dly) ,
		.pll_cmu_rstn_value(pll_cmu_rstn_value) ,
		.pll_core_cali_ref_off(pll_core_cali_ref_off) ,
		.pll_core_cali_vco_off(pll_core_cali_vco_off) ,
		.pll_core_vccdreg_fb(pll_core_vccdreg_fb) ,
		.pll_core_vccdreg_fw(pll_core_vccdreg_fw) ,
		.pll_core_vreg0_atbsel(pll_core_vreg0_atbsel) ,
		.pll_core_vreg1_atbsel(pll_core_vreg1_atbsel) ,
		.pll_cp_compensation(pll_cp_compensation) ,
		.pll_cp_current_setting(pll_cp_current_setting) ,
		.pll_cp_lf_3rd_pole_freq(pll_cp_lf_3rd_pole_freq) ,
		.pll_cp_lf_order(pll_cp_lf_order) ,
		.pll_cp_testmode(pll_cp_testmode) ,
		.pll_ctrl_override_setting(pll_ctrl_override_setting) ,
		.pll_ctrl_plniotri_override(pll_ctrl_plniotri_override) ,
		.pll_device_variant(pll_device_variant) ,
		.pll_dprio_base_addr(pll_dprio_base_addr) ,
		.pll_dprio_broadcast_en(pll_dprio_broadcast_en) ,
		.pll_dprio_clk_vreg_boost(pll_dprio_clk_vreg_boost) ,
		.pll_dprio_cvp_inter_sel(pll_dprio_cvp_inter_sel) ,
		.pll_dprio_force_inter_sel(pll_dprio_force_inter_sel) ,
		.pll_dprio_fpll_vreg1_boost(pll_dprio_fpll_vreg1_boost) ,
		.pll_dprio_fpll_vreg_boost(pll_dprio_fpll_vreg_boost) ,
		.pll_dprio_power_iso_en(pll_dprio_power_iso_en) ,
		.pll_dprio_status_select(pll_dprio_status_select) ,
		.pll_dsm_ecn_bypass(pll_dsm_ecn_bypass) ,
		.pll_dsm_ecn_test_en(pll_dsm_ecn_test_en) ,
		.pll_dsm_fractional_division(pll_dsm_fractional_division_string) ,
		.pll_dsm_fractional_value_ready(pll_dsm_fractional_value_ready) ,
		.pll_dsm_mode(pll_dsm_mode) ,
		.pll_dsm_out_sel(pll_dsm_out_sel) ,
		.pll_enable(pll_enable) ,
		.pll_extra_csr(pll_extra_csr) ,
		.pll_fbclk_mux_1(pll_fbclk_mux_1) ,
		.pll_fbclk_mux_2(pll_fbclk_mux_2) ,
		.pll_iqclk_mux_sel(pll_iqclk_mux_sel) ,
		.pll_l_counter(pll_l_counter) ,
		.pll_l_counter_bypass(pll_l_counter_bypass) ,
		.pll_l_counter_enable(pll_l_counter_enable) ,
		.pll_lf_cbig(pll_lf_cbig) ,
		.pll_lf_resistance(pll_lf_resistance) ,
		.pll_lf_ripplecap(pll_lf_ripplecap) ,
		.pll_lock_fltr_cfg(pll_lock_fltr_cfg) ,
		.pll_lock_fltr_test(pll_lock_fltr_test) ,
		.pll_lpf_rstn_value(pll_lpf_rstn_value) ,
		.pll_m_counter(pll_m_counter) ,
		.pll_m_counter_coarse_dly(pll_m_counter_coarse_dly) ,
		.pll_m_counter_fine_dly(pll_m_counter_fine_dly) ,
		.pll_m_counter_in_src(pll_m_counter_in_src) ,
		.pll_m_counter_min_tco_enable(pll_m_counter_min_tco_enable) ,
		.pll_m_counter_ph_mux_prst(pll_m_counter_ph_mux_prst) ,
		.pll_m_counter_prst(pll_m_counter_prst) ,
		.pll_n_counter(pll_n_counter) ,
		.pll_n_counter_coarse_dly(pll_n_counter_coarse_dly) ,
		.pll_n_counter_fine_dly(pll_n_counter_fine_dly) ,
		.pll_nreset_invert(pll_nreset_invert) ,
		.pll_op_mode(pll_op_mode) ,
		.pll_optimal(pll_optimal) ,
		.pll_powerdown_mode(pll_powerdown_mode) ,
		.pll_ppm_clk0_src(pll_ppm_clk0_src) ,
		.pll_ppm_clk1_src(pll_ppm_clk1_src) ,
		.pll_ref_buf_dly(pll_ref_buf_dly) ,
		.pll_rstn_override(pll_rstn_override) ,
		.pll_self_reset(pll_self_reset) ,
		.pll_sup_mode(pll_sup_mode) ,
		.pll_tclk_mux_en(pll_tclk_mux_en) ,
		.pll_tclk_sel(pll_tclk_sel) ,
		.pll_test_enable(pll_test_enable) ,
		.pll_unlock_fltr_cfg(pll_unlock_fltr_cfg) ,
		.pll_vccr_pd_en(pll_vccr_pd_en) ,
		.pll_vco_freq_band_0(pll_vco_freq_band_0) ,
		.pll_vco_freq_band_0_dyn_high_bits(pll_vco_freq_band_0_dyn_high_bits) ,
		.pll_vco_freq_band_0_dyn_low_bits(pll_vco_freq_band_0_dyn_low_bits) ,
		.pll_vco_freq_band_0_fix(pll_vco_freq_band_0_fix) ,
		.pll_vco_freq_band_0_fix_high(pll_vco_freq_band_0_fix_high) ,
		.pll_vco_freq_band_1(pll_vco_freq_band_1) ,
		.pll_vco_freq_band_1_dyn_high_bits(pll_vco_freq_band_1_dyn_high_bits) ,
		.pll_vco_freq_band_1_dyn_low_bits(pll_vco_freq_band_1_dyn_low_bits) ,
		.pll_vco_freq_band_1_fix(pll_vco_freq_band_1_fix) ,
		.pll_vco_freq_band_1_fix_high(pll_vco_freq_band_1_fix_high) ,
		.pll_vco_ph0_en(pll_vco_ph0_en) ,
		.pll_vco_ph0_value(pll_vco_ph0_value) ,
		.pll_vco_ph1_en(pll_vco_ph1_en) ,
		.pll_vco_ph1_value(pll_vco_ph1_value) ,
		.pll_vco_ph2_en(pll_vco_ph2_en) ,
		.pll_vco_ph2_value(pll_vco_ph2_value) ,
		.pll_vco_ph3_en(pll_vco_ph3_en) ,
		.pll_vco_ph3_value(pll_vco_ph3_value) ,
		.pm_speed_grade(pm_speed_grade) ,
		.pma_width(pma_width) ,
		.power_mode(power_mode) ,
		.power_rail_et(power_rail_et) ,
		.primary_use(primary_use) ,
		.prot_mode(prot_mode) ,
		.reference_clock_frequency(reference_clock_frequency) ,
		.reference_clock_frequency_scratch(reference_clock_frequency_scratch) ,
		.set_fpll_input_freq_range(set_fpll_input_freq_range) ,
		.side(side) ,
		.silicon_rev(silicon_rev) ,
		.top_or_bottom(top_or_bottom) ,
		.vco_freq(vco_freq_string) ,
		.vco_freq_hz(vco_freq_hz) ,
		.vco_frequency(vco_frequency) ,
		.xpm_cmu_fpll_core_cal_vco_count_length(xpm_cmu_fpll_core_cal_vco_count_length) ,
		.xpm_cmu_fpll_core_fpll_refclk_source(xpm_cmu_fpll_core_fpll_refclk_source) ,
		.xpm_cmu_fpll_core_fpll_vco_div_by_2_sel(xpm_cmu_fpll_core_fpll_vco_div_by_2_sel) ,
		.xpm_cmu_fpll_core_pfd_delay_compensation(xpm_cmu_fpll_core_pfd_delay_compensation) ,
		.xpm_cmu_fpll_core_pfd_pulse_width(xpm_cmu_fpll_core_pfd_pulse_width) ,
		.xpm_cmu_fpll_core_xpm_cpvco_fpll_xpm_chgpmplf_fpll_cp_current_boost(xpm_cmu_fpll_core_xpm_cpvco_fpll_xpm_chgpmplf_fpll_cp_current_boost)

	)
	twentynm_cmu_fpll_encrypted_inst (

		.clk0bad_in(clk0bad_in),
		.clk1bad_in(clk1bad_in),
		.cnt_sel(cnt_sel),
		.core_refclk(core_refclk),
		.csr_bufin(csr_bufin),
		.csr_clk(csr_clk),
		.csr_en(csr_en),
		.csr_en_dly(csr_en_dly),
		.csr_in(csr_in),
		.avmmclk(avmmclk),
		.avmmrstn(avmmrstn),
		.dps_rst_n(dps_rst_n),
		.extswitch_buf(extswitch_buf),
		.fbclk_in(fbclk_in),
		.fpll_ppm_clk(fpll_ppm_clk),
		.iqtxrxclk(iqtxrxclk),
		.lc_to_fpll_refclk(lc_to_fpll_refclk),
		.mdio_dis(mdio_dis),
		.nfrzdrv(nfrzdrv),
		.nrpi_freeze(nrpi_freeze),
		.num_phase_shifts(num_phase_shifts),
		.pfden(pfden),
		.phase_en(phase_en),
		.pllclksel(pllclksel),
		.pma_atpg_los_en_n(pma_atpg_los_en_n),
		.pma_csr_test_dis(pma_csr_test_dis),
		.avmmread(avmmread),
		.refclk(refclk),
		.avmmaddress(avmmaddress),
		.rst_n(rst_n),
		.scan_mode_n(scan_mode_n),
		.scan_shift_n(scan_shift_n),
		.up_dn(up_dn),
		.avmmwrite(avmmwrite),
		.avmmwritedata(avmmwritedata),
		.block_select(block_select),
		.clk0(clk0),
		.clk0bad(clk0bad),
		.clk180(clk180),
		.clk1bad(clk1bad),
		.clklow(clklow),
		.csr_bufout(csr_bufout),
		.csr_out(csr_out),
		.fbclk_out(fbclk_out),
		.clk_sel_override(clk_sel_override),
		.clk_sel_override_value(clk_sel_override_value),
		.fref(fref),
		.hclk_out(hclk_out),
		.iqtxrxclk_out(iqtxrxclk_out),
		.lock(lock),
		.phase_done(phase_done),
		.pll_cascade_out(pll_cascade_out),
		.outclk(outclk),
		.ppm_clk(ppm_clk),
		.avmmreaddata(avmmreaddata)

	);

endmodule
// -----------------------------------------------------------
// This is auto-generated HSSI Simulation Atom Model Encryption Wrapper
// Module Name : work/twentynm_hssi_10g_rx_pcs_wrapper.v
// -----------------------------------------------------------

`timescale 1 ps/1 ps

module twentynm_hssi_10g_rx_pcs
#(
	// Parameter declaration and default value assignment

	parameter enable_debug_info = "true",	//Valid values: false|true; this is simulation-only parameter, for debug purpose only

	parameter	advanced_user_mode = "disable" ,		//Valid values: disable enable 
	parameter	align_del = "align_del_en" ,		//Valid values: align_del_dis align_del_en 
	parameter	ber_bit_err_total_cnt = "bit_err_total_cnt_10g" ,		//Valid values: bit_err_total_cnt_10g 
	parameter	ber_clken = "ber_clk_dis" ,		//Valid values: ber_clk_dis ber_clk_en 
	parameter	ber_xus_timer_window = 21'b000000100110001001010 ,		//Valid values: 21 
	parameter	bitslip_mode = "bitslip_dis" ,		//Valid values: bitslip_dis bitslip_en 
	parameter	blksync_bitslip_type = "bitslip_comb" ,		//Valid values: bitslip_comb bitslip_reg 
	parameter	blksync_bitslip_wait_cnt = 3'b001 ,		//Valid values: 3 
	parameter	blksync_bitslip_wait_type = "bitslip_match" ,		//Valid values: bitslip_match bitslip_cnt 
	parameter	blksync_bypass = "blksync_bypass_dis" ,		//Valid values: blksync_bypass_dis blksync_bypass_en 
	parameter	blksync_clken = "blksync_clk_dis" ,		//Valid values: blksync_clk_dis blksync_clk_en 
	parameter	blksync_enum_invalid_sh_cnt = "enum_invalid_sh_cnt_10g" ,		//Valid values: enum_invalid_sh_cnt_10g 
	parameter	blksync_knum_sh_cnt_postlock = "knum_sh_cnt_postlock_10g" ,		//Valid values: knum_sh_cnt_postlock_10g 
	parameter	blksync_knum_sh_cnt_prelock = "knum_sh_cnt_prelock_10g" ,		//Valid values: knum_sh_cnt_prelock_10g 
	parameter	blksync_pipeln = "blksync_pipeln_dis" ,		//Valid values: blksync_pipeln_dis blksync_pipeln_en 
	parameter	clr_errblk_cnt_en = "disable" ,		//Valid values: disable enable 
	parameter	control_del = "control_del_all" ,		//Valid values: control_del_all control_del_none 
	parameter	crcchk_bypass = "crcchk_bypass_dis" ,		//Valid values: crcchk_bypass_dis crcchk_bypass_en 
	parameter	crcchk_clken = "crcchk_clk_dis" ,		//Valid values: crcchk_clk_dis crcchk_clk_en 
	parameter	crcchk_inv = "crcchk_inv_dis" ,		//Valid values: crcchk_inv_dis crcchk_inv_en 
	parameter	crcchk_pipeln = "crcchk_pipeln_dis" ,		//Valid values: crcchk_pipeln_dis crcchk_pipeln_en 
	parameter	crcflag_pipeln = "crcflag_pipeln_dis" ,		//Valid values: crcflag_pipeln_dis crcflag_pipeln_en 
	parameter	ctrl_bit_reverse = "ctrl_bit_reverse_dis" ,		//Valid values: ctrl_bit_reverse_dis ctrl_bit_reverse_en 
	parameter	data_bit_reverse = "data_bit_reverse_dis" ,		//Valid values: data_bit_reverse_dis data_bit_reverse_en 
	parameter	dec64b66b_clken = "dec64b66b_clk_dis" ,		//Valid values: dec64b66b_clk_dis dec64b66b_clk_en 
	parameter	dec_64b66b_rxsm_bypass = "dec_64b66b_rxsm_bypass_dis" ,		//Valid values: dec_64b66b_rxsm_bypass_dis dec_64b66b_rxsm_bypass_en 
	parameter	descrm_bypass = "descrm_bypass_en" ,		//Valid values: descrm_bypass_dis descrm_bypass_en 
	parameter	descrm_clken = "descrm_clk_dis" ,		//Valid values: descrm_clk_dis descrm_clk_en 
	parameter	descrm_mode = "async" ,		//Valid values: async sync 
	parameter	descrm_pipeln = "enable" ,		//Valid values: disable enable 
	parameter	dft_clk_out_sel = "rx_master_clk" ,		//Valid values: rx_master_clk rx_gbexp_clk rx_blksync_clk rx_descrm_clk rx_frmsync_clk rx_64b66bdec_clk rx_ber_clk rx_rand_clk rx_crcchk_clk rx_wrfifo_clk rx_rdfifo_clk rx_fec_clk 
	parameter	dis_signal_ok = "dis_signal_ok_dis" ,		//Valid values: dis_signal_ok_dis dis_signal_ok_en 
	parameter	dispchk_bypass = "dispchk_bypass_dis" ,		//Valid values: dispchk_bypass_dis dispchk_bypass_en 
	parameter	empty_flag_type = "empty_rd_side" ,		//Valid values: empty_rd_side empty_wr_side 
	parameter	fast_path = "fast_path_dis" ,		//Valid values: fast_path_dis fast_path_en 
	parameter	fec_clken = "fec_clk_dis" ,		//Valid values: fec_clk_dis fec_clk_en 
	parameter	fec_enable = "fec_dis" ,		//Valid values: fec_en fec_dis 
	parameter	fifo_double_read = "fifo_double_read_dis" ,		//Valid values: fifo_double_read_dis fifo_double_read_en 
	parameter	fifo_stop_rd = "n_rd_empty" ,		//Valid values: rd_empty n_rd_empty 
	parameter	fifo_stop_wr = "n_wr_full" ,		//Valid values: wr_full n_wr_full 
	parameter	force_align = "force_align_dis" ,		//Valid values: force_align_dis force_align_en 
	parameter	frmsync_bypass = "frmsync_bypass_dis" ,		//Valid values: frmsync_bypass_dis frmsync_bypass_en 
	parameter	frmsync_clken = "frmsync_clk_dis" ,		//Valid values: frmsync_clk_dis frmsync_clk_en 
	parameter	frmsync_enum_scrm = "enum_scrm_default" ,		//Valid values: enum_scrm_default 
	parameter	frmsync_enum_sync = "enum_sync_default" ,		//Valid values: enum_sync_default 
	parameter	frmsync_flag_type = "all_framing_words" ,		//Valid values: all_framing_words location_only 
	parameter	frmsync_knum_sync = "knum_sync_default" ,		//Valid values: knum_sync_default 
	parameter	frmsync_mfrm_length = 16'b0000100000000000 ,		//Valid values: 16 
	parameter	frmsync_pipeln = "frmsync_pipeln_dis" ,		//Valid values: frmsync_pipeln_dis frmsync_pipeln_en 
	parameter	full_flag_type = "full_wr_side" ,		//Valid values: full_rd_side full_wr_side 
	parameter	gb_rx_idwidth = "width_32" ,		//Valid values: width_40 width_32 width_64 
	parameter	gb_rx_odwidth = "width_66" ,		//Valid values: width_32 width_40 width_50 width_67 width_64 width_66 
	parameter	gbexp_clken = "gbexp_clk_dis" ,		//Valid values: gbexp_clk_dis gbexp_clk_en 
	parameter	low_latency_en = "enable" ,		//Valid values: disable enable 
	parameter	lpbk_mode = "lpbk_dis" ,		//Valid values: lpbk_dis lpbk_en 
	parameter	master_clk_sel = "master_rx_pma_clk" ,		//Valid values: master_rx_pma_clk master_tx_pma_clk master_refclk_dig 
	parameter	pempty_flag_type = "pempty_rd_side" ,		//Valid values: pempty_rd_side pempty_wr_side 
	parameter	pfull_flag_type = "pfull_wr_side" ,		//Valid values: pfull_rd_side pfull_wr_side 
	parameter	phcomp_rd_del = "phcomp_rd_del2" ,		//Valid values: phcomp_rd_del4 phcomp_rd_del3 phcomp_rd_del2 
	parameter	pld_if_type = "fifo" ,		//Valid values: fifo reg 
	parameter	prot_mode = "disable_mode" ,		//Valid values: disable_mode teng_baser_mode interlaken_mode sfis_mode teng_sdi_mode basic_mode test_prp_mode test_prp_krfec_mode teng_1588_mode teng_baser_krfec_mode teng_1588_krfec_mode basic_krfec_mode 
	parameter	rand_clken = "rand_clk_dis" ,		//Valid values: rand_clk_dis rand_clk_en 
	parameter	rd_clk_sel = "rd_rx_pma_clk" ,		//Valid values: rd_rx_pld_clk rd_rx_pma_clk rd_refclk_dig 
	parameter	rdfifo_clken = "rdfifo_clk_dis" ,		//Valid values: rdfifo_clk_dis rdfifo_clk_en 
	parameter	reconfig_settings = "{}" ,		//Valid values:  
	parameter	rx_fifo_write_ctrl = "blklock_stops" ,		//Valid values: blklock_stops blklock_ignore 
	parameter	rx_scrm_width = "bit64" ,		//Valid values: bit64 bit66 bit67 
	parameter	rx_sh_location = "lsb" ,		//Valid values: lsb msb 
	parameter	rx_signal_ok_sel = "synchronized_ver" ,		//Valid values: synchronized_ver nonsync_ver 
	parameter	rx_sm_bypass = "rx_sm_bypass_dis" ,		//Valid values: rx_sm_bypass_dis rx_sm_bypass_en 
	parameter	rx_sm_hiber = "rx_sm_hiber_en" ,		//Valid values: rx_sm_hiber_en rx_sm_hiber_dis 
	parameter	rx_sm_pipeln = "rx_sm_pipeln_dis" ,		//Valid values: rx_sm_pipeln_dis rx_sm_pipeln_en 
	parameter	rx_testbus_sel = "crc32_chk_testbus1" ,		//Valid values: crc32_chk_testbus1 crc32_chk_testbus2 frame_sync_testbus1 frame_sync_testbus2 dec64b66b_testbus rxsm_testbus ber_testbus blksync_testbus1 blksync_testbus2 gearbox_exp_testbus random_ver_testbus descramble_testbus blank_testbus rx_fifo_testbus1 rx_fifo_testbus2 
	parameter	rx_true_b2b = "b2b" ,		//Valid values: single b2b 
	parameter	rxfifo_empty = "empty_default" ,		//Valid values: empty_default 
	parameter	rxfifo_full = "full_default" ,		//Valid values: full_default 
	parameter	rxfifo_mode = "phase_comp" ,		//Valid values: register_mode clk_comp_10g generic_interlaken generic_basic phase_comp phase_comp_dv 
	parameter	rxfifo_pempty = 5'b00010 ,		//Valid values: 5 
	parameter	rxfifo_pfull = 5'b10111 ,		//Valid values: 5 
	parameter	silicon_rev = "20nm5es" ,		//Valid values: 20nm5es 20nm5es2 20nm4es 20nm4es2 20nm5 20nm4 20nm3 20nm2 20nm1 
	parameter	stretch_num_stages = "zero_stage" ,		//Valid values: zero_stage one_stage two_stage three_stage 
	parameter	sup_mode = "user_mode" ,		//Valid values: user_mode engineering_mode 
	parameter	test_mode = "test_off" ,		//Valid values: test_off pseudo_random 
	parameter	wrfifo_clken = "wrfifo_clk_dis"		//Valid values: wrfifo_clk_dis wrfifo_clk_en 
)

(
	//Port declaration

	input	[8:0]  avmmaddress ,
	input	avmmclk ,
	input	avmmread ,
	input	avmmrstn ,
	input	avmmwrite ,
	input	[7:0]  avmmwritedata ,
	input	krfec_refclk_dig ,
	input	[63:0]  r_rx_diag_word ,
	input	[63:0]  r_rx_scrm_word ,
	input	[63:0]  r_rx_skip_word ,
	input	[63:0]  r_rx_sync_word ,
	input	refclk_dig ,
	input	rx_align_clr ,
	input	rx_bitslip ,
	input	rx_clr_ber_count ,
	input	rx_clr_errblk_cnt ,
	input	[19:0]  rx_control_fb ,
	input	[9:0]  rx_control_in_krfec ,
	input	[127:0]  rx_data_fb ,
	input	[63:0]  rx_data_in_krfec ,
	input	rx_data_valid_fb ,
	input	rx_data_valid_in_krfec ,
	input	[73:0]  rx_fifo_rd_data ,
	input	[73:0]  rx_fifo_rd_data_dw ,
	input	rx_pld_clk ,
	input	rx_pld_rst_n ,
	input	rx_pma_clk ,
	input	[63:0]  rx_pma_data ,
	input	rx_prbs_err_clr ,
	input	rx_rd_en ,
	input	scan_mode_n ,
	input	signal_ok ,
	input	signal_ok_krfec ,
	input	tx_pma_clk ,

	output	[7:0]  avmmreaddata ,
	output	blockselect ,
	output	pld_10g_krfec_rx_blk_lock_10g_reg ,
	output	pld_10g_krfec_rx_blk_lock_10g_txclk_reg ,
	output	pld_10g_krfec_rx_clr_errblk_cnt_reg ,
	output	pld_10g_krfec_rx_clr_errblk_cnt_txclk_reg ,
	output	pld_10g_krfec_rx_diag_data_status_10g_reg ,
	output	pld_10g_krfec_rx_diag_data_status_10g_txclk_reg ,
	output	pld_10g_krfec_rx_frame_10g_reg ,
	output	pld_10g_krfec_rx_frame_10g_txclk_reg ,
	output	pld_10g_krfec_rx_pld_rst_n_fifo ,
	output	pld_10g_krfec_rx_pld_rst_n_reg ,
	output	pld_10g_krfec_rx_pld_rst_n_txclk_reg ,
	output	pld_10g_rx_align_clr_fifo ,
	output	pld_10g_rx_align_clr_reg ,
	output	pld_10g_rx_align_clr_txclk_reg ,
	output	pld_10g_rx_align_val_fifo ,
	output	pld_10g_rx_align_val_reg ,
	output	pld_10g_rx_align_val_txclk_reg ,
	output	pld_10g_rx_clr_ber_count_reg ,
	output	pld_10g_rx_clr_ber_count_txclk_reg ,
	output	pld_10g_rx_crc32_err_reg ,
	output	pld_10g_rx_crc32_err_txclk_reg ,
	output	pld_10g_rx_data_valid_10g_reg ,
	output	pld_10g_rx_data_valid_fifo ,
	output	pld_10g_rx_data_valid_pcsdirect_reg ,
	output	pld_10g_rx_data_valid_txclk_reg ,
	output	pld_10g_rx_empty_fifo ,
	output	pld_10g_rx_fifo_del_reg ,
	output	pld_10g_rx_fifo_del_txclk_reg ,
	output	pld_10g_rx_fifo_insert_fifo ,
	output	pld_10g_rx_fifo_num_reg ,
	output	pld_10g_rx_fifo_num_txclk_reg ,
	output	pld_10g_rx_frame_lock_reg ,
	output	pld_10g_rx_frame_lock_txclk_reg ,
	output	pld_10g_rx_hi_ber_reg ,
	output	pld_10g_rx_hi_ber_txclk_reg ,
	output	pld_10g_rx_oflw_err_reg ,
	output	pld_10g_rx_oflw_err_txclk_reg ,
	output	pld_10g_rx_pempty_fifo ,
	output	pld_10g_rx_pfull_reg ,
	output	pld_10g_rx_pfull_txclk_reg ,
	output	pld_10g_rx_rd_en_fifo ,
	output	pld_pcs_rx_clk_out_10g_txclk_wire ,
	output	pld_pcs_rx_clk_out_10g_wire ,
	output	pld_rx_control_10g_reg ,
	output	pld_rx_control_10g_txclk_reg ,
	output	pld_rx_data_10g_reg ,
	output	pld_rx_data_10g_txclk_reg ,
	output	pld_rx_prbs_err_10g_txclk_reg ,
	output	pld_rx_prbs_err_clr_10g_txclk_reg ,
	output	rx_align_val ,
	output	rx_blk_lock ,
	output	rx_clk_out ,
	output	rx_clk_out_pld_if ,
	output	[19:0]  rx_control ,
	output	rx_crc32_err ,
	output	[127:0]  rx_data ,
	output	rx_data_valid ,
	output	rx_dft_clk_out ,
	output	[1:0]  rx_diag_status ,
	output	rx_empty ,
	output	rx_fec_clk ,
	output	rx_fifo_del ,
	output	rx_fifo_insert ,
	output	[4:0]  rx_fifo_num ,
	output	[31:0]  rx_fifo_rd_ptr ,
	output	[31:0]  rx_fifo_rd_ptr2 ,
	output	rx_fifo_wr_clk ,
	output	[73:0]  rx_fifo_wr_data ,
	output	rx_fifo_wr_en ,
	output	[31:0]  rx_fifo_wr_ptr ,
	output	rx_fifo_wr_rst_n ,
	output	rx_frame_lock ,
	output	rx_hi_ber ,
	output	rx_master_clk ,
	output	rx_master_clk_rst_n ,
	output	rx_oflw_err ,
	output	rx_pempty ,
	output	rx_pfull ,
	output	rx_random_err ,
	output	rx_rx_frame ,
	output	[19:0]  rx_test_data 

);


	twentynm_hssi_10g_rx_pcs_encrypted
	#(
		.enable_debug_info(enable_debug_info) ,

		.advanced_user_mode(advanced_user_mode) ,
		.align_del(align_del) ,
		.ber_bit_err_total_cnt(ber_bit_err_total_cnt) ,
		.ber_clken(ber_clken) ,
		.ber_xus_timer_window(ber_xus_timer_window) ,
		.bitslip_mode(bitslip_mode) ,
		.blksync_bitslip_type(blksync_bitslip_type) ,
		.blksync_bitslip_wait_cnt(blksync_bitslip_wait_cnt) ,
		.blksync_bitslip_wait_type(blksync_bitslip_wait_type) ,
		.blksync_bypass(blksync_bypass) ,
		.blksync_clken(blksync_clken) ,
		.blksync_enum_invalid_sh_cnt(blksync_enum_invalid_sh_cnt) ,
		.blksync_knum_sh_cnt_postlock(blksync_knum_sh_cnt_postlock) ,
		.blksync_knum_sh_cnt_prelock(blksync_knum_sh_cnt_prelock) ,
		.blksync_pipeln(blksync_pipeln) ,
		.clr_errblk_cnt_en(clr_errblk_cnt_en) ,
		.control_del(control_del) ,
		.crcchk_bypass(crcchk_bypass) ,
		.crcchk_clken(crcchk_clken) ,
		.crcchk_inv(crcchk_inv) ,
		.crcchk_pipeln(crcchk_pipeln) ,
		.crcflag_pipeln(crcflag_pipeln) ,
		.ctrl_bit_reverse(ctrl_bit_reverse) ,
		.data_bit_reverse(data_bit_reverse) ,
		.dec64b66b_clken(dec64b66b_clken) ,
		.dec_64b66b_rxsm_bypass(dec_64b66b_rxsm_bypass) ,
		.descrm_bypass(descrm_bypass) ,
		.descrm_clken(descrm_clken) ,
		.descrm_mode(descrm_mode) ,
		.descrm_pipeln(descrm_pipeln) ,
		.dft_clk_out_sel(dft_clk_out_sel) ,
		.dis_signal_ok(dis_signal_ok) ,
		.dispchk_bypass(dispchk_bypass) ,
		.empty_flag_type(empty_flag_type) ,
		.fast_path(fast_path) ,
		.fec_clken(fec_clken) ,
		.fec_enable(fec_enable) ,
		.fifo_double_read(fifo_double_read) ,
		.fifo_stop_rd(fifo_stop_rd) ,
		.fifo_stop_wr(fifo_stop_wr) ,
		.force_align(force_align) ,
		.frmsync_bypass(frmsync_bypass) ,
		.frmsync_clken(frmsync_clken) ,
		.frmsync_enum_scrm(frmsync_enum_scrm) ,
		.frmsync_enum_sync(frmsync_enum_sync) ,
		.frmsync_flag_type(frmsync_flag_type) ,
		.frmsync_knum_sync(frmsync_knum_sync) ,
		.frmsync_mfrm_length(frmsync_mfrm_length) ,
		.frmsync_pipeln(frmsync_pipeln) ,
		.full_flag_type(full_flag_type) ,
		.gb_rx_idwidth(gb_rx_idwidth) ,
		.gb_rx_odwidth(gb_rx_odwidth) ,
		.gbexp_clken(gbexp_clken) ,
		.low_latency_en(low_latency_en) ,
		.lpbk_mode(lpbk_mode) ,
		.master_clk_sel(master_clk_sel) ,
		.pempty_flag_type(pempty_flag_type) ,
		.pfull_flag_type(pfull_flag_type) ,
		.phcomp_rd_del(phcomp_rd_del) ,
		.pld_if_type(pld_if_type) ,
		.prot_mode(prot_mode) ,
		.rand_clken(rand_clken) ,
		.rd_clk_sel(rd_clk_sel) ,
		.rdfifo_clken(rdfifo_clken) ,
		.reconfig_settings(reconfig_settings) ,
		.rx_fifo_write_ctrl(rx_fifo_write_ctrl) ,
		.rx_scrm_width(rx_scrm_width) ,
		.rx_sh_location(rx_sh_location) ,
		.rx_signal_ok_sel(rx_signal_ok_sel) ,
		.rx_sm_bypass(rx_sm_bypass) ,
		.rx_sm_hiber(rx_sm_hiber) ,
		.rx_sm_pipeln(rx_sm_pipeln) ,
		.rx_testbus_sel(rx_testbus_sel) ,
		.rx_true_b2b(rx_true_b2b) ,
		.rxfifo_empty(rxfifo_empty) ,
		.rxfifo_full(rxfifo_full) ,
		.rxfifo_mode(rxfifo_mode) ,
		.rxfifo_pempty(rxfifo_pempty) ,
		.rxfifo_pfull(rxfifo_pfull) ,
		.silicon_rev(silicon_rev) ,
		.stretch_num_stages(stretch_num_stages) ,
		.sup_mode(sup_mode) ,
		.test_mode(test_mode) ,
		.wrfifo_clken(wrfifo_clken)

	)
	twentynm_hssi_10g_rx_pcs_encrypted_inst (

		.avmmaddress(avmmaddress),
		.avmmclk(avmmclk),
		.avmmread(avmmread),
		.avmmrstn(avmmrstn),
		.avmmwrite(avmmwrite),
		.avmmwritedata(avmmwritedata),
		.krfec_refclk_dig(krfec_refclk_dig),
		.r_rx_diag_word(r_rx_diag_word),
		.r_rx_scrm_word(r_rx_scrm_word),
		.r_rx_skip_word(r_rx_skip_word),
		.r_rx_sync_word(r_rx_sync_word),
		.refclk_dig(refclk_dig),
		.rx_align_clr(rx_align_clr),
		.rx_bitslip(rx_bitslip),
		.rx_clr_ber_count(rx_clr_ber_count),
		.rx_clr_errblk_cnt(rx_clr_errblk_cnt),
		.rx_control_fb(rx_control_fb),
		.rx_control_in_krfec(rx_control_in_krfec),
		.rx_data_fb(rx_data_fb),
		.rx_data_in_krfec(rx_data_in_krfec),
		.rx_data_valid_fb(rx_data_valid_fb),
		.rx_data_valid_in_krfec(rx_data_valid_in_krfec),
		.rx_fifo_rd_data(rx_fifo_rd_data),
		.rx_fifo_rd_data_dw(rx_fifo_rd_data_dw),
		.rx_pld_clk(rx_pld_clk),
		.rx_pld_rst_n(rx_pld_rst_n),
		.rx_pma_clk(rx_pma_clk),
		.rx_pma_data(rx_pma_data),
		.rx_prbs_err_clr(rx_prbs_err_clr),
		.rx_rd_en(rx_rd_en),
		.scan_mode_n(scan_mode_n),
		.signal_ok(signal_ok),
		.signal_ok_krfec(signal_ok_krfec),
		.tx_pma_clk(tx_pma_clk),
		.avmmreaddata(avmmreaddata),
		.blockselect(blockselect),
		.pld_10g_krfec_rx_blk_lock_10g_reg(pld_10g_krfec_rx_blk_lock_10g_reg),
		.pld_10g_krfec_rx_blk_lock_10g_txclk_reg(pld_10g_krfec_rx_blk_lock_10g_txclk_reg),
		.pld_10g_krfec_rx_clr_errblk_cnt_reg(pld_10g_krfec_rx_clr_errblk_cnt_reg),
		.pld_10g_krfec_rx_clr_errblk_cnt_txclk_reg(pld_10g_krfec_rx_clr_errblk_cnt_txclk_reg),
		.pld_10g_krfec_rx_diag_data_status_10g_reg(pld_10g_krfec_rx_diag_data_status_10g_reg),
		.pld_10g_krfec_rx_diag_data_status_10g_txclk_reg(pld_10g_krfec_rx_diag_data_status_10g_txclk_reg),
		.pld_10g_krfec_rx_frame_10g_reg(pld_10g_krfec_rx_frame_10g_reg),
		.pld_10g_krfec_rx_frame_10g_txclk_reg(pld_10g_krfec_rx_frame_10g_txclk_reg),
		.pld_10g_krfec_rx_pld_rst_n_fifo(pld_10g_krfec_rx_pld_rst_n_fifo),
		.pld_10g_krfec_rx_pld_rst_n_reg(pld_10g_krfec_rx_pld_rst_n_reg),
		.pld_10g_krfec_rx_pld_rst_n_txclk_reg(pld_10g_krfec_rx_pld_rst_n_txclk_reg),
		.pld_10g_rx_align_clr_fifo(pld_10g_rx_align_clr_fifo),
		.pld_10g_rx_align_clr_reg(pld_10g_rx_align_clr_reg),
		.pld_10g_rx_align_clr_txclk_reg(pld_10g_rx_align_clr_txclk_reg),
		.pld_10g_rx_align_val_fifo(pld_10g_rx_align_val_fifo),
		.pld_10g_rx_align_val_reg(pld_10g_rx_align_val_reg),
		.pld_10g_rx_align_val_txclk_reg(pld_10g_rx_align_val_txclk_reg),
		.pld_10g_rx_clr_ber_count_reg(pld_10g_rx_clr_ber_count_reg),
		.pld_10g_rx_clr_ber_count_txclk_reg(pld_10g_rx_clr_ber_count_txclk_reg),
		.pld_10g_rx_crc32_err_reg(pld_10g_rx_crc32_err_reg),
		.pld_10g_rx_crc32_err_txclk_reg(pld_10g_rx_crc32_err_txclk_reg),
		.pld_10g_rx_data_valid_10g_reg(pld_10g_rx_data_valid_10g_reg),
		.pld_10g_rx_data_valid_fifo(pld_10g_rx_data_valid_fifo),
		.pld_10g_rx_data_valid_pcsdirect_reg(pld_10g_rx_data_valid_pcsdirect_reg),
		.pld_10g_rx_data_valid_txclk_reg(pld_10g_rx_data_valid_txclk_reg),
		.pld_10g_rx_empty_fifo(pld_10g_rx_empty_fifo),
		.pld_10g_rx_fifo_del_reg(pld_10g_rx_fifo_del_reg),
		.pld_10g_rx_fifo_del_txclk_reg(pld_10g_rx_fifo_del_txclk_reg),
		.pld_10g_rx_fifo_insert_fifo(pld_10g_rx_fifo_insert_fifo),
		.pld_10g_rx_fifo_num_reg(pld_10g_rx_fifo_num_reg),
		.pld_10g_rx_fifo_num_txclk_reg(pld_10g_rx_fifo_num_txclk_reg),
		.pld_10g_rx_frame_lock_reg(pld_10g_rx_frame_lock_reg),
		.pld_10g_rx_frame_lock_txclk_reg(pld_10g_rx_frame_lock_txclk_reg),
		.pld_10g_rx_hi_ber_reg(pld_10g_rx_hi_ber_reg),
		.pld_10g_rx_hi_ber_txclk_reg(pld_10g_rx_hi_ber_txclk_reg),
		.pld_10g_rx_oflw_err_reg(pld_10g_rx_oflw_err_reg),
		.pld_10g_rx_oflw_err_txclk_reg(pld_10g_rx_oflw_err_txclk_reg),
		.pld_10g_rx_pempty_fifo(pld_10g_rx_pempty_fifo),
		.pld_10g_rx_pfull_reg(pld_10g_rx_pfull_reg),
		.pld_10g_rx_pfull_txclk_reg(pld_10g_rx_pfull_txclk_reg),
		.pld_10g_rx_rd_en_fifo(pld_10g_rx_rd_en_fifo),
		.pld_pcs_rx_clk_out_10g_txclk_wire(pld_pcs_rx_clk_out_10g_txclk_wire),
		.pld_pcs_rx_clk_out_10g_wire(pld_pcs_rx_clk_out_10g_wire),
		.pld_rx_control_10g_reg(pld_rx_control_10g_reg),
		.pld_rx_control_10g_txclk_reg(pld_rx_control_10g_txclk_reg),
		.pld_rx_data_10g_reg(pld_rx_data_10g_reg),
		.pld_rx_data_10g_txclk_reg(pld_rx_data_10g_txclk_reg),
		.pld_rx_prbs_err_10g_txclk_reg(pld_rx_prbs_err_10g_txclk_reg),
		.pld_rx_prbs_err_clr_10g_txclk_reg(pld_rx_prbs_err_clr_10g_txclk_reg),
		.rx_align_val(rx_align_val),
		.rx_blk_lock(rx_blk_lock),
		.rx_clk_out(rx_clk_out),
		.rx_clk_out_pld_if(rx_clk_out_pld_if),
		.rx_control(rx_control),
		.rx_crc32_err(rx_crc32_err),
		.rx_data(rx_data),
		.rx_data_valid(rx_data_valid),
		.rx_dft_clk_out(rx_dft_clk_out),
		.rx_diag_status(rx_diag_status),
		.rx_empty(rx_empty),
		.rx_fec_clk(rx_fec_clk),
		.rx_fifo_del(rx_fifo_del),
		.rx_fifo_insert(rx_fifo_insert),
		.rx_fifo_num(rx_fifo_num),
		.rx_fifo_rd_ptr(rx_fifo_rd_ptr),
		.rx_fifo_rd_ptr2(rx_fifo_rd_ptr2),
		.rx_fifo_wr_clk(rx_fifo_wr_clk),
		.rx_fifo_wr_data(rx_fifo_wr_data),
		.rx_fifo_wr_en(rx_fifo_wr_en),
		.rx_fifo_wr_ptr(rx_fifo_wr_ptr),
		.rx_fifo_wr_rst_n(rx_fifo_wr_rst_n),
		.rx_frame_lock(rx_frame_lock),
		.rx_hi_ber(rx_hi_ber),
		.rx_master_clk(rx_master_clk),
		.rx_master_clk_rst_n(rx_master_clk_rst_n),
		.rx_oflw_err(rx_oflw_err),
		.rx_pempty(rx_pempty),
		.rx_pfull(rx_pfull),
		.rx_random_err(rx_random_err),
		.rx_rx_frame(rx_rx_frame),
		.rx_test_data(rx_test_data)

	);

endmodule
// -----------------------------------------------------------
// This is auto-generated HSSI Simulation Atom Model Encryption Wrapper
// Module Name : work/twentynm_hssi_10g_tx_pcs_wrapper.v
// -----------------------------------------------------------

`timescale 1 ps/1 ps

module twentynm_hssi_10g_tx_pcs
#(
	// Parameter declaration and default value assignment

	parameter enable_debug_info = "true",	//Valid values: false|true; this is simulation-only parameter, for debug purpose only

	parameter	advanced_user_mode = "disable" ,		//Valid values: disable enable 
	parameter	bitslip_en = "bitslip_dis" ,		//Valid values: bitslip_dis bitslip_en 
	parameter	bonding_dft_en = "dft_dis" ,		//Valid values: dft_dis dft_en 
	parameter	bonding_dft_val = "dft_0" ,		//Valid values: dft_0 dft_1 
	parameter	comp_cnt = 8'b00000000 ,		//Valid values: 8 
	parameter	compin_sel = "compin_master" ,		//Valid values: compin_master compin_slave_top compin_slave_bot compin_default 
	parameter	crcgen_bypass = "crcgen_bypass_dis" ,		//Valid values: crcgen_bypass_dis crcgen_bypass_en 
	parameter	crcgen_clken = "crcgen_clk_dis" ,		//Valid values: crcgen_clk_dis crcgen_clk_en 
	parameter	crcgen_err = "crcgen_err_dis" ,		//Valid values: crcgen_err_dis crcgen_err_en 
	parameter	crcgen_inv = "crcgen_inv_dis" ,		//Valid values: crcgen_inv_dis crcgen_inv_en 
	parameter	ctrl_bit_reverse = "ctrl_bit_reverse_dis" ,		//Valid values: ctrl_bit_reverse_dis ctrl_bit_reverse_en 
	parameter	ctrl_plane_bonding = "individual" ,		//Valid values: individual ctrl_master ctrl_slave_abv ctrl_slave_blw 
	parameter	data_bit_reverse = "data_bit_reverse_dis" ,		//Valid values: data_bit_reverse_dis data_bit_reverse_en 
	parameter	dft_clk_out_sel = "tx_master_clk" ,		//Valid values: tx_master_clk tx_rdfifo_clk tx_frmgen_clk tx_crcgen_clk tx_64b66benc_txsm_clk tx_scrm_clk tx_dispgen_clk tx_gbred_clk tx_wrfifo_clk tx_fec_clk 
	parameter	dispgen_bypass = "dispgen_bypass_dis" ,		//Valid values: dispgen_bypass_dis dispgen_bypass_en 
	parameter	dispgen_clken = "dispgen_clk_dis" ,		//Valid values: dispgen_clk_dis dispgen_clk_en 
	parameter	dispgen_err = "dispgen_err_dis" ,		//Valid values: dispgen_err_dis dispgen_err_en 
	parameter	dispgen_pipeln = "dispgen_pipeln_dis" ,		//Valid values: dispgen_pipeln_dis dispgen_pipeln_en 
	parameter	distdwn_bypass_pipeln = "distdwn_bypass_pipeln_dis" ,		//Valid values: distdwn_bypass_pipeln_dis distdwn_bypass_pipeln_en 
	parameter	distdwn_master = "distdwn_master_en" ,		//Valid values: distdwn_master_en distdwn_master_dis 
	parameter	distup_bypass_pipeln = "distup_bypass_pipeln_dis" ,		//Valid values: distup_bypass_pipeln_dis distup_bypass_pipeln_en 
	parameter	distup_master = "distup_master_en" ,		//Valid values: distup_master_en distup_master_dis 
	parameter	dv_bond = "dv_bond_dis" ,		//Valid values: dv_bond_en dv_bond_dis 
	parameter	empty_flag_type = "empty_rd_side" ,		//Valid values: empty_rd_side empty_wr_side 
	parameter	enc64b66b_txsm_clken = "enc64b66b_txsm_clk_dis" ,		//Valid values: enc64b66b_txsm_clk_dis enc64b66b_txsm_clk_en 
	parameter	enc_64b66b_txsm_bypass = "enc_64b66b_txsm_bypass_dis" ,		//Valid values: enc_64b66b_txsm_bypass_dis enc_64b66b_txsm_bypass_en 
	parameter	fastpath = "fastpath_dis" ,		//Valid values: fastpath_dis fastpath_en 
	parameter	fec_clken = "fec_clk_dis" ,		//Valid values: fec_clk_dis fec_clk_en 
	parameter	fec_enable = "fec_dis" ,		//Valid values: fec_en fec_dis 
	parameter	fifo_double_write = "fifo_double_write_dis" ,		//Valid values: fifo_double_write_dis fifo_double_write_en 
	parameter	fifo_reg_fast = "fifo_reg_fast_dis" ,		//Valid values: fifo_reg_fast_dis fifo_reg_fast_en 
	parameter	fifo_stop_rd = "n_rd_empty" ,		//Valid values: rd_empty n_rd_empty 
	parameter	fifo_stop_wr = "n_wr_full" ,		//Valid values: wr_full n_wr_full 
	parameter	frmgen_burst = "frmgen_burst_dis" ,		//Valid values: frmgen_burst_dis frmgen_burst_en 
	parameter	frmgen_bypass = "frmgen_bypass_dis" ,		//Valid values: frmgen_bypass_dis frmgen_bypass_en 
	parameter	frmgen_clken = "frmgen_clk_dis" ,		//Valid values: frmgen_clk_dis frmgen_clk_en 
	parameter	frmgen_mfrm_length = 16'b0000100000000000 ,		//Valid values: 16 
	parameter	frmgen_pipeln = "frmgen_pipeln_dis" ,		//Valid values: frmgen_pipeln_dis frmgen_pipeln_en 
	parameter	frmgen_pyld_ins = "frmgen_pyld_ins_dis" ,		//Valid values: frmgen_pyld_ins_dis frmgen_pyld_ins_en 
	parameter	frmgen_wordslip = "frmgen_wordslip_dis" ,		//Valid values: frmgen_wordslip_dis frmgen_wordslip_en 
	parameter	full_flag_type = "full_wr_side" ,		//Valid values: full_rd_side full_wr_side 
	parameter	gb_pipeln_bypass = "enable" ,		//Valid values: disable enable 
	parameter	gb_tx_idwidth = "width_50" ,		//Valid values: width_32 width_40 width_50 width_67 width_64 width_66 
	parameter	gb_tx_odwidth = "width_32" ,		//Valid values: width_32 width_40 width_64 
	parameter	gbred_clken = "gbred_clk_dis" ,		//Valid values: gbred_clk_dis gbred_clk_en 
	parameter	indv = "indv_en" ,		//Valid values: indv_en indv_dis 
	parameter	low_latency_en = "enable" ,		//Valid values: disable enable 
	parameter	master_clk_sel = "master_tx_pma_clk" ,		//Valid values: master_tx_pma_clk master_refclk_dig 
	parameter	pempty_flag_type = "pempty_rd_side" ,		//Valid values: pempty_rd_side pempty_wr_side 
	parameter	pfull_flag_type = "pfull_wr_side" ,		//Valid values: pfull_rd_side pfull_wr_side 
	parameter	phcomp_rd_del = "phcomp_rd_del2" ,		//Valid values: phcomp_rd_del6 phcomp_rd_del5 phcomp_rd_del4 phcomp_rd_del3 phcomp_rd_del2 
	parameter	pld_if_type = "fifo" ,		//Valid values: fifo reg fastreg 
	parameter	prot_mode = "disable_mode" ,		//Valid values: disable_mode teng_baser_mode interlaken_mode sfis_mode teng_sdi_mode basic_mode test_prp_mode test_prp_krfec_mode teng_1588_mode teng_baser_krfec_mode teng_1588_krfec_mode basic_krfec_mode 
	parameter	pseudo_random = "all_0" ,		//Valid values: two_lf all_0 
	parameter	pseudo_seed_a = 58'b1111111111111111111111111111111111111111111111111111111111 ,		//Valid values: 
	parameter	pseudo_seed_b = 58'b1111111111111111111111111111111111111111111111111111111111 ,		//Valid values: 
	parameter	random_disp = "disable" ,		//Valid values: disable enable 
	parameter	rdfifo_clken = "rdfifo_clk_dis" ,		//Valid values: rdfifo_clk_dis rdfifo_clk_en 
	parameter	reconfig_settings = "{}" ,		//Valid values:  
	parameter	scrm_bypass = "scrm_bypass_dis" ,		//Valid values: scrm_bypass_dis scrm_bypass_en 
	parameter	scrm_clken = "scrm_clk_dis" ,		//Valid values: scrm_clk_dis scrm_clk_en 
	parameter	scrm_mode = "async" ,		//Valid values: async sync 
	parameter	scrm_pipeln = "enable" ,		//Valid values: disable enable 
	parameter	sh_err = "sh_err_dis" ,		//Valid values: sh_err_dis sh_err_en 
	parameter	silicon_rev = "20nm5es" ,		//Valid values: 20nm5es 20nm5es2 20nm4es 20nm4es2 20nm5 20nm4 20nm3 20nm2 20nm1 
	parameter	sop_mark = "sop_mark_dis" ,		//Valid values: sop_mark_en sop_mark_dis 
	parameter	stretch_num_stages = "zero_stage" ,		//Valid values: zero_stage one_stage two_stage three_stage 
	parameter	sup_mode = "user_mode" ,		//Valid values: user_mode engineering_mode 
	parameter	test_mode = "test_off" ,		//Valid values: test_off pseudo_random 
	parameter	tx_scrm_err = "scrm_err_dis" ,		//Valid values: scrm_err_dis scrm_err_en 
	parameter	tx_scrm_width = "bit64" ,		//Valid values: bit64 bit66 bit67 
	parameter	tx_sh_location = "lsb" ,		//Valid values: lsb msb 
	parameter	tx_sm_bypass = "tx_sm_bypass_dis" ,		//Valid values: tx_sm_bypass_dis tx_sm_bypass_en 
	parameter	tx_sm_pipeln = "tx_sm_pipeln_dis" ,		//Valid values: tx_sm_pipeln_dis tx_sm_pipeln_en 
	parameter	tx_testbus_sel = "crc32_gen_testbus1" ,		//Valid values: crc32_gen_testbus1 crc32_gen_testbus2 disp_gen_testbus1 disp_gen_testbus2 frame_gen_testbus1 frame_gen_testbus2 enc64b66b_testbus txsm_testbus tx_cp_bond_testbus gearbox_red_testbus scramble_testbus blank_testbus tx_fifo_testbus1 tx_fifo_testbus2 
	parameter	txfifo_empty = "empty_default" ,		//Valid values: empty_default 
	parameter	txfifo_full = "full_default" ,		//Valid values: full_default 
	parameter	txfifo_mode = "phase_comp" ,		//Valid values: register_mode interlaken_generic basic_generic phase_comp 
	parameter	txfifo_pempty = 4'b0010 ,		//Valid values: 4 
	parameter	txfifo_pfull = 4'b1011 ,		//Valid values: 4 
	parameter	wr_clk_sel = "wr_tx_pma_clk" ,		//Valid values: wr_tx_pld_clk wr_tx_pma_clk wr_refclk_dig 
	parameter	wrfifo_clken = "wrfifo_clk_dis"		//Valid values: wrfifo_clk_dis wrfifo_clk_en 
)

(
	//Port declaration

	input	[8:0]  avmmaddress ,
	input	avmmclk ,
	input	avmmread ,
	input	avmmrstn ,
	input	avmmwrite ,
	input	[7:0]  avmmwritedata ,
	input	distdwn_in_dv ,
	input	distdwn_in_rden ,
	input	distdwn_in_wren ,
	input	distup_in_dv ,
	input	distup_in_rden ,
	input	distup_in_wren ,
	input	krfec_refclk_dig ,
	input	[63:0]  r_tx_diag_word ,
	input	[63:0]  r_tx_scrm_word ,
	input	[63:0]  r_tx_skip_word ,
	input	[63:0]  r_tx_sync_word ,
	input	refclk_dig ,
	input	scan_mode_n ,
	input	[6:0]  tx_bitslip ,
	input	tx_burst_en ,
	input	[17:0]  tx_control ,
	input	[8:0]  tx_control_reg ,
	input	[127:0]  tx_data ,
	input	[63:0]  tx_data_in_krfec ,
	input	[63:0]  tx_data_reg ,
	input	tx_data_valid ,
	input	tx_data_valid_reg ,
	input	[1:0]  tx_diag_status ,
	input	[72:0]  tx_fifo_rd_data ,
	input	tx_pld_clk ,
	input	tx_pld_rst_n ,
	input	tx_pma_clk ,
	input	tx_wordslip ,

	output	[7:0]  avmmreaddata ,
	output	blockselect ,
	output	pld_10g_krfec_tx_frame_10g_reg ,
	output	pld_10g_krfec_tx_pld_rst_n_fifo ,
	output	pld_10g_krfec_tx_pld_rst_n_reg ,
	output	pld_10g_tx_bitslip_reg ,
	output	pld_10g_tx_burst_en_exe_reg ,
	output	pld_10g_tx_data_valid_10g_reg ,
	output	pld_10g_tx_data_valid_fifo ,
	output	pld_10g_tx_data_valid_reg ,
	output	pld_10g_tx_diag_status_reg ,
	output	pld_10g_tx_empty_reg ,
	output	pld_10g_tx_fifo_num_reg ,
	output	pld_10g_tx_full_fifo ,
	output	pld_10g_tx_full_reg ,
	output	pld_10g_tx_pempty_reg ,
	output	pld_10g_tx_pfull_fifo ,
	output	pld_10g_tx_wordslip_exe_reg ,
	output	pld_10g_tx_wordslip_reg ,
	output	pld_pcs_tx_clk_out_10g_wire ,
	output	pld_tx_burst_en_reg ,
	output	pld_tx_control_lo_10g_reg ,
	output	pld_tx_data_10g_fifo ,
	output	pld_tx_data_lo_10g_reg ,
	output	distdwn_out_dv ,
	output	distdwn_out_rden ,
	output	distdwn_out_wren ,
	output	distup_out_dv ,
	output	distup_out_rden ,
	output	distup_out_wren ,
	output	tx_burst_en_exe ,
	output	tx_clk_out ,
	output	tx_clk_out_pld_if ,
	output	tx_clk_out_pma_if ,
	output	[8:0]  tx_control_out_krfec ,
	output	[63:0]  tx_data_out_krfec ,
	output	tx_data_valid_out_krfec ,
	output	tx_dft_clk_out ,
	output	tx_empty ,
	output	tx_fec_clk ,
	output	[3:0]  tx_fifo_num ,
	output	[15:0]  tx_fifo_rd_ptr ,
	output	tx_fifo_wr_clk ,
	output	[72:0]  tx_fifo_wr_data ,
	output	[72:0]  tx_fifo_wr_data_dw ,
	output	tx_fifo_wr_en ,
	output	[15:0]  tx_fifo_wr_ptr ,
	output	tx_fifo_wr_rst_n ,
	output	tx_frame ,
	output	tx_full ,
	output	tx_master_clk ,
	output	tx_master_clk_rst_n ,
	output	tx_pempty ,
	output	tx_pfull ,
	output	[63:0]  tx_pma_data ,
	output	[63:0]  tx_pma_gating_val ,
	output	[19:0]  tx_test_data ,
	output	tx_wordslip_exe 

);

// Function to convert a 64bit binary to a string.
function [128*8-1 : 0] m_bin_to_str;
	input [128 : 1]   s;
	reg   [128 : 1]   reg_s;
	reg   [7 : 0]    tmp;
	reg   [128*8 : 1] res;
	integer m, index;

	begin
		reg_s = s;
		res = 128'h00000000000000000000000000000000;

		for (m = 128; m > 0; m = m-1 )
		begin
			tmp = reg_s[128];
			res[(((m-1)*8)+1)] = tmp & 1'b1;
			reg_s = reg_s << 1;
		end

		m_bin_to_str = res;
	end
endfunction

localparam [8*128-1 : 0] pseudo_seed_a_string	= m_bin_to_str(pseudo_seed_a);
localparam [8*128-1 : 0] pseudo_seed_b_string	= m_bin_to_str(pseudo_seed_b);


	twentynm_hssi_10g_tx_pcs_encrypted
	#(
		.enable_debug_info(enable_debug_info) ,

		.advanced_user_mode(advanced_user_mode) ,
		.bitslip_en(bitslip_en) ,
		.bonding_dft_en(bonding_dft_en) ,
		.bonding_dft_val(bonding_dft_val) ,
		.comp_cnt(comp_cnt) ,
		.compin_sel(compin_sel) ,
		.crcgen_bypass(crcgen_bypass) ,
		.crcgen_clken(crcgen_clken) ,
		.crcgen_err(crcgen_err) ,
		.crcgen_inv(crcgen_inv) ,
		.ctrl_bit_reverse(ctrl_bit_reverse) ,
		.ctrl_plane_bonding(ctrl_plane_bonding) ,
		.data_bit_reverse(data_bit_reverse) ,
		.dft_clk_out_sel(dft_clk_out_sel) ,
		.dispgen_bypass(dispgen_bypass) ,
		.dispgen_clken(dispgen_clken) ,
		.dispgen_err(dispgen_err) ,
		.dispgen_pipeln(dispgen_pipeln) ,
		.distdwn_bypass_pipeln(distdwn_bypass_pipeln) ,
		.distdwn_master(distdwn_master) ,
		.distup_bypass_pipeln(distup_bypass_pipeln) ,
		.distup_master(distup_master) ,
		.dv_bond(dv_bond) ,
		.empty_flag_type(empty_flag_type) ,
		.enc64b66b_txsm_clken(enc64b66b_txsm_clken) ,
		.enc_64b66b_txsm_bypass(enc_64b66b_txsm_bypass) ,
		.fastpath(fastpath) ,
		.fec_clken(fec_clken) ,
		.fec_enable(fec_enable) ,
		.fifo_double_write(fifo_double_write) ,
		.fifo_reg_fast(fifo_reg_fast) ,
		.fifo_stop_rd(fifo_stop_rd) ,
		.fifo_stop_wr(fifo_stop_wr) ,
		.frmgen_burst(frmgen_burst) ,
		.frmgen_bypass(frmgen_bypass) ,
		.frmgen_clken(frmgen_clken) ,
		.frmgen_mfrm_length(frmgen_mfrm_length) ,
		.frmgen_pipeln(frmgen_pipeln) ,
		.frmgen_pyld_ins(frmgen_pyld_ins) ,
		.frmgen_wordslip(frmgen_wordslip) ,
		.full_flag_type(full_flag_type) ,
		.gb_pipeln_bypass(gb_pipeln_bypass) ,
		.gb_tx_idwidth(gb_tx_idwidth) ,
		.gb_tx_odwidth(gb_tx_odwidth) ,
		.gbred_clken(gbred_clken) ,
		.indv(indv) ,
		.low_latency_en(low_latency_en) ,
		.master_clk_sel(master_clk_sel) ,
		.pempty_flag_type(pempty_flag_type) ,
		.pfull_flag_type(pfull_flag_type) ,
		.phcomp_rd_del(phcomp_rd_del) ,
		.pld_if_type(pld_if_type) ,
		.prot_mode(prot_mode) ,
		.pseudo_random(pseudo_random) ,
		.pseudo_seed_a(pseudo_seed_a_string) ,
		.pseudo_seed_b(pseudo_seed_b_string) ,
		.random_disp(random_disp) ,
		.rdfifo_clken(rdfifo_clken) ,
		.reconfig_settings(reconfig_settings) ,
		.scrm_bypass(scrm_bypass) ,
		.scrm_clken(scrm_clken) ,
		.scrm_mode(scrm_mode) ,
		.scrm_pipeln(scrm_pipeln) ,
		.sh_err(sh_err) ,
		.silicon_rev(silicon_rev) ,
		.sop_mark(sop_mark) ,
		.stretch_num_stages(stretch_num_stages) ,
		.sup_mode(sup_mode) ,
		.test_mode(test_mode) ,
		.tx_scrm_err(tx_scrm_err) ,
		.tx_scrm_width(tx_scrm_width) ,
		.tx_sh_location(tx_sh_location) ,
		.tx_sm_bypass(tx_sm_bypass) ,
		.tx_sm_pipeln(tx_sm_pipeln) ,
		.tx_testbus_sel(tx_testbus_sel) ,
		.txfifo_empty(txfifo_empty) ,
		.txfifo_full(txfifo_full) ,
		.txfifo_mode(txfifo_mode) ,
		.txfifo_pempty(txfifo_pempty) ,
		.txfifo_pfull(txfifo_pfull) ,
		.wr_clk_sel(wr_clk_sel) ,
		.wrfifo_clken(wrfifo_clken)

	)
	twentynm_hssi_10g_tx_pcs_encrypted_inst (

		.avmmaddress(avmmaddress),
		.avmmclk(avmmclk),
		.avmmread(avmmread),
		.avmmrstn(avmmrstn),
		.avmmwrite(avmmwrite),
		.avmmwritedata(avmmwritedata),
		.distdwn_in_dv(distdwn_in_dv),
		.distdwn_in_rden(distdwn_in_rden),
		.distdwn_in_wren(distdwn_in_wren),
		.distup_in_dv(distup_in_dv),
		.distup_in_rden(distup_in_rden),
		.distup_in_wren(distup_in_wren),
		.krfec_refclk_dig(krfec_refclk_dig),
		.r_tx_diag_word(r_tx_diag_word),
		.r_tx_scrm_word(r_tx_scrm_word),
		.r_tx_skip_word(r_tx_skip_word),
		.r_tx_sync_word(r_tx_sync_word),
		.refclk_dig(refclk_dig),
		.scan_mode_n(scan_mode_n),
		.tx_bitslip(tx_bitslip),
		.tx_burst_en(tx_burst_en),
		.tx_control(tx_control),
		.tx_control_reg(tx_control_reg),
		.tx_data(tx_data),
		.tx_data_in_krfec(tx_data_in_krfec),
		.tx_data_reg(tx_data_reg),
		.tx_data_valid(tx_data_valid),
		.tx_data_valid_reg(tx_data_valid_reg),
		.tx_diag_status(tx_diag_status),
		.tx_fifo_rd_data(tx_fifo_rd_data),
		.tx_pld_clk(tx_pld_clk),
		.tx_pld_rst_n(tx_pld_rst_n),
		.tx_pma_clk(tx_pma_clk),
		.tx_wordslip(tx_wordslip),
		.avmmreaddata(avmmreaddata),
		.blockselect(blockselect),
		.pld_10g_krfec_tx_frame_10g_reg(pld_10g_krfec_tx_frame_10g_reg),
		.pld_10g_krfec_tx_pld_rst_n_fifo(pld_10g_krfec_tx_pld_rst_n_fifo),
		.pld_10g_krfec_tx_pld_rst_n_reg(pld_10g_krfec_tx_pld_rst_n_reg),
		.pld_10g_tx_bitslip_reg(pld_10g_tx_bitslip_reg),
		.pld_10g_tx_burst_en_exe_reg(pld_10g_tx_burst_en_exe_reg),
		.pld_10g_tx_data_valid_10g_reg(pld_10g_tx_data_valid_10g_reg),
		.pld_10g_tx_data_valid_fifo(pld_10g_tx_data_valid_fifo),
		.pld_10g_tx_data_valid_reg(pld_10g_tx_data_valid_reg),
		.pld_10g_tx_diag_status_reg(pld_10g_tx_diag_status_reg),
		.pld_10g_tx_empty_reg(pld_10g_tx_empty_reg),
		.pld_10g_tx_fifo_num_reg(pld_10g_tx_fifo_num_reg),
		.pld_10g_tx_full_fifo(pld_10g_tx_full_fifo),
		.pld_10g_tx_full_reg(pld_10g_tx_full_reg),
		.pld_10g_tx_pempty_reg(pld_10g_tx_pempty_reg),
		.pld_10g_tx_pfull_fifo(pld_10g_tx_pfull_fifo),
		.pld_10g_tx_wordslip_exe_reg(pld_10g_tx_wordslip_exe_reg),
		.pld_10g_tx_wordslip_reg(pld_10g_tx_wordslip_reg),
		.pld_pcs_tx_clk_out_10g_wire(pld_pcs_tx_clk_out_10g_wire),
		.pld_tx_burst_en_reg(pld_tx_burst_en_reg),
		.pld_tx_control_lo_10g_reg(pld_tx_control_lo_10g_reg),
		.pld_tx_data_10g_fifo(pld_tx_data_10g_fifo),
		.pld_tx_data_lo_10g_reg(pld_tx_data_lo_10g_reg),
		.distdwn_out_dv(distdwn_out_dv),
		.distdwn_out_rden(distdwn_out_rden),
		.distdwn_out_wren(distdwn_out_wren),
		.distup_out_dv(distup_out_dv),
		.distup_out_rden(distup_out_rden),
		.distup_out_wren(distup_out_wren),
		.tx_burst_en_exe(tx_burst_en_exe),
		.tx_clk_out(tx_clk_out),
		.tx_clk_out_pld_if(tx_clk_out_pld_if),
		.tx_clk_out_pma_if(tx_clk_out_pma_if),
		.tx_control_out_krfec(tx_control_out_krfec),
		.tx_data_out_krfec(tx_data_out_krfec),
		.tx_data_valid_out_krfec(tx_data_valid_out_krfec),
		.tx_dft_clk_out(tx_dft_clk_out),
		.tx_empty(tx_empty),
		.tx_fec_clk(tx_fec_clk),
		.tx_fifo_num(tx_fifo_num),
		.tx_fifo_rd_ptr(tx_fifo_rd_ptr),
		.tx_fifo_wr_clk(tx_fifo_wr_clk),
		.tx_fifo_wr_data(tx_fifo_wr_data),
		.tx_fifo_wr_data_dw(tx_fifo_wr_data_dw),
		.tx_fifo_wr_en(tx_fifo_wr_en),
		.tx_fifo_wr_ptr(tx_fifo_wr_ptr),
		.tx_fifo_wr_rst_n(tx_fifo_wr_rst_n),
		.tx_frame(tx_frame),
		.tx_full(tx_full),
		.tx_master_clk(tx_master_clk),
		.tx_master_clk_rst_n(tx_master_clk_rst_n),
		.tx_pempty(tx_pempty),
		.tx_pfull(tx_pfull),
		.tx_pma_data(tx_pma_data),
		.tx_pma_gating_val(tx_pma_gating_val),
		.tx_test_data(tx_test_data),
		.tx_wordslip_exe(tx_wordslip_exe)

	);

endmodule
// -----------------------------------------------------------
// This is auto-generated HSSI Simulation Atom Model Encryption Wrapper
// Module Name : work/twentynm_hssi_8g_rx_pcs_wrapper.v
// -----------------------------------------------------------

`timescale 1 ps/1 ps

module twentynm_hssi_8g_rx_pcs
#(
	// Parameter declaration and default value assignment

	parameter enable_debug_info = "true",	//Valid values: false|true; this is simulation-only parameter, for debug purpose only

	parameter	auto_error_replacement = "dis_err_replace" ,		//Valid values: dis_err_replace en_err_replace 
	parameter	auto_speed_nego = "dis_asn" ,		//Valid values: dis_asn en_asn_g2_freq_scal 
	parameter	bit_reversal = "dis_bit_reversal" ,		//Valid values: dis_bit_reversal en_bit_reversal 
	parameter	bonding_dft_en = "dft_dis" ,		//Valid values: dft_dis dft_en 
	parameter	bonding_dft_val = "dft_0" ,		//Valid values: dft_0 dft_1 
	parameter	bypass_pipeline_reg = "dis_bypass_pipeline" ,		//Valid values: dis_bypass_pipeline en_bypass_pipeline 
	parameter	byte_deserializer = "dis_bds" ,		//Valid values: dis_bds en_bds_by_2 en_bds_by_4 en_bds_by_2_det 
	parameter	cdr_ctrl_rxvalid_mask = "dis_rxvalid_mask" ,		//Valid values: dis_rxvalid_mask en_rxvalid_mask 
	parameter	clkcmp_pattern_n = 20'b00000000000000000000 ,		//Valid values: 20 
	parameter	clkcmp_pattern_p = 20'b00000000000000000000 ,		//Valid values: 20 
	parameter	clock_gate_bds_dec_asn = "dis_bds_dec_asn_clk_gating" ,		//Valid values: dis_bds_dec_asn_clk_gating en_bds_dec_asn_clk_gating 
	parameter	clock_gate_cdr_eidle = "dis_cdr_eidle_clk_gating" ,		//Valid values: dis_cdr_eidle_clk_gating en_cdr_eidle_clk_gating 
	parameter	clock_gate_dw_pc_wrclk = "dis_dw_pc_wrclk_gating" ,		//Valid values: dis_dw_pc_wrclk_gating en_dw_pc_wrclk_gating 
	parameter	clock_gate_dw_rm_rd = "dis_dw_rm_rdclk_gating" ,		//Valid values: dis_dw_rm_rdclk_gating en_dw_rm_rdclk_gating 
	parameter	clock_gate_dw_rm_wr = "dis_dw_rm_wrclk_gating" ,		//Valid values: dis_dw_rm_wrclk_gating en_dw_rm_wrclk_gating 
	parameter	clock_gate_dw_wa = "dis_dw_wa_clk_gating" ,		//Valid values: dis_dw_wa_clk_gating en_dw_wa_clk_gating 
	parameter	clock_gate_pc_rdclk = "dis_pc_rdclk_gating" ,		//Valid values: dis_pc_rdclk_gating en_pc_rdclk_gating 
	parameter	clock_gate_sw_pc_wrclk = "dis_sw_pc_wrclk_gating" ,		//Valid values: dis_sw_pc_wrclk_gating en_sw_pc_wrclk_gating 
	parameter	clock_gate_sw_rm_rd = "dis_sw_rm_rdclk_gating" ,		//Valid values: dis_sw_rm_rdclk_gating en_sw_rm_rdclk_gating 
	parameter	clock_gate_sw_rm_wr = "dis_sw_rm_wrclk_gating" ,		//Valid values: dis_sw_rm_wrclk_gating en_sw_rm_wrclk_gating 
	parameter	clock_gate_sw_wa = "dis_sw_wa_clk_gating" ,		//Valid values: dis_sw_wa_clk_gating en_sw_wa_clk_gating 
	parameter	clock_observation_in_pld_core = "internal_sw_wa_clk" ,		//Valid values: internal_sw_wa_clk internal_dw_wa_clk internal_cdr_eidle_clk internal_sm_rm_wr_clk internal_dw_rm_wr_clk internal_clk_2_b internal_sw_rm_rd_clk internal_dw_rm_rd_clk internal_sw_rx_wr_clk internal_dw_rx_wr_clk internal_rx_rd_clk internal_rx_pma_clk_gen3 internal_rx_rcvd_clk_gen3 
	parameter	ctrl_plane_bonding_compensation = "dis_compensation" ,		//Valid values: dis_compensation en_compensation 
	parameter	ctrl_plane_bonding_consumption = "individual" ,		//Valid values: individual bundled_master bundled_slave_below bundled_slave_above 
	parameter	ctrl_plane_bonding_distribution = "not_master_chnl_distr" ,		//Valid values: not_master_chnl_distr master_chnl_distr 
	parameter	eidle_entry_eios = "dis_eidle_eios" ,		//Valid values: dis_eidle_eios en_eidle_eios 
	parameter	eidle_entry_iei = "dis_eidle_iei" ,		//Valid values: dis_eidle_iei en_eidle_iei 
	parameter	eidle_entry_sd = "dis_eidle_sd" ,		//Valid values: dis_eidle_sd en_eidle_sd 
	parameter	eightb_tenb_decoder = "dis_8b10b" ,		//Valid values: dis_8b10b en_8b10b_ibm en_8b10b_sgx 
	parameter	err_flags_sel = "err_flags_wa" ,		//Valid values: err_flags_wa err_flags_8b10b 
	parameter	fixed_pat_det = "dis_fixed_patdet" ,		//Valid values: dis_fixed_patdet en_fixed_patdet 
	parameter	fixed_pat_num = 4'b1111 ,		//Valid values: 4 
	parameter	force_signal_detect = "en_force_signal_detect" ,		//Valid values: en_force_signal_detect dis_force_signal_detect 
	parameter	gen3_clk_en = "disable_clk" ,		//Valid values: disable_clk enable_clk 
	parameter	gen3_rx_clk_sel = "rcvd_clk" ,		//Valid values: en_dig_clk1_8g rcvd_clk 
	parameter	gen3_tx_clk_sel = "tx_pma_clk" ,		//Valid values: en_dig_clk2_8g tx_pma_clk 
	parameter	hip_mode = "dis_hip" ,		//Valid values: dis_hip en_hip 
	parameter	ibm_invalid_code = "dis_ibm_invalid_code" ,		//Valid values: dis_ibm_invalid_code en_ibm_invalid_code 
	parameter	invalid_code_flag_only = "dis_invalid_code_only" ,		//Valid values: dis_invalid_code_only en_invalid_code_only 
	parameter	pad_or_edb_error_replace = "replace_edb" ,		//Valid values: replace_edb replace_edb_dynamic replace_pad 
	parameter	pcs_bypass = "dis_pcs_bypass" ,		//Valid values: dis_pcs_bypass en_pcs_bypass 
	parameter	phase_comp_rdptr = "enable_rdptr" ,		//Valid values: disable_rdptr enable_rdptr 
	parameter	phase_compensation_fifo = "low_latency" ,		//Valid values: low_latency normal_latency register_fifo pld_ctrl_low_latency pld_ctrl_normal_latency 
	parameter	pipe_if_enable = "dis_pipe_rx" ,		//Valid values: dis_pipe_rx en_pipe_rx en_pipe3_rx 
	parameter	pma_dw = "eight_bit" ,		//Valid values: eight_bit ten_bit sixteen_bit twenty_bit 
	parameter	polinv_8b10b_dec = "dis_polinv_8b10b_dec" ,		//Valid values: dis_polinv_8b10b_dec en_polinv_8b10b_dec 
	parameter	prot_mode = "gige" ,		//Valid values: pipe_g1 pipe_g2 pipe_g3 cpri cpri_rx_tx gige gige_1588 basic_rm_enable basic_rm_disable disabled_prot_mode 
	parameter	rate_match = "dis_rm" ,		//Valid values: dis_rm gige_rm pipe_rm pipe_rm_0ppm sw_basic_rm dw_basic_rm 
	parameter	rate_match_del_thres = "dis_rm_del_thres" ,		//Valid values: dis_rm_del_thres gige_rm_del_thres pipe_rm_del_thres pipe_rm_0ppm_del_thres sw_basic_rm_del_thres dw_basic_rm_del_thres 
	parameter	rate_match_empty_thres = "dis_rm_empty_thres" ,		//Valid values: dis_rm_empty_thres gige_rm_empty_thres pipe_rm_empty_thres pipe_rm_0ppm_empty_thres sw_basic_rm_empty_thres dw_basic_rm_empty_thres 
	parameter	rate_match_full_thres = "dis_rm_full_thres" ,		//Valid values: dis_rm_full_thres gige_rm_full_thres pipe_rm_full_thres pipe_rm_0ppm_full_thres sw_basic_rm_full_thres dw_basic_rm_full_thres 
	parameter	rate_match_ins_thres = "dis_rm_ins_thres" ,		//Valid values: dis_rm_ins_thres gige_rm_ins_thres pipe_rm_ins_thres pipe_rm_0ppm_ins_thres sw_basic_rm_ins_thres dw_basic_rm_ins_thres 
	parameter	rate_match_start_thres = "dis_rm_start_thres" ,		//Valid values: dis_rm_start_thres gige_rm_start_thres pipe_rm_start_thres pipe_rm_0ppm_start_thres sw_basic_rm_start_thres dw_basic_rm_start_thres 
	parameter	reconfig_settings = "{}" ,		//Valid values:  
	parameter	rx_clk2 = "rcvd_clk_clk2" ,		//Valid values: rcvd_clk_clk2 tx_pma_clock_clk2 refclk_dig2_clk2 
	parameter	rx_clk_free_running = "en_rx_clk_free_run" ,		//Valid values: dis_rx_clk_free_run en_rx_clk_free_run 
	parameter	rx_pcs_urst = "en_rx_pcs_urst" ,		//Valid values: dis_rx_pcs_urst en_rx_pcs_urst 
	parameter	rx_rcvd_clk = "rcvd_clk_rcvd_clk" ,		//Valid values: rcvd_clk_rcvd_clk tx_pma_clock_rcvd_clk 
	parameter	rx_rd_clk = "pld_rx_clk" ,		//Valid values: pld_rx_clk rx_clk 
	parameter	rx_refclk = "dis_refclk_sel" ,		//Valid values: dis_refclk_sel en_refclk_sel 
	parameter	rx_wr_clk = "rx_clk2_div_1_2_4" ,		//Valid values: rx_clk2_div_1_2_4 txfifo_rd_clk 
	parameter	silicon_rev = "20nm5es" ,		//Valid values: 20nm5es 20nm5es2 20nm4es 20nm4es2 20nm5 20nm4 20nm3 20nm2 20nm1 
	parameter	sup_mode = "user_mode" ,		//Valid values: user_mode engineering_mode 
	parameter	symbol_swap = "dis_symbol_swap" ,		//Valid values: dis_symbol_swap en_symbol_swap 
	parameter	sync_sm_idle_eios = "dis_syncsm_idle" ,		//Valid values: dis_syncsm_idle en_syncsm_idle 
	parameter	test_bus_sel = "tx_testbus" ,		//Valid values: tx_testbus tx_ctrl_plane_testbus wa_testbus rm_testbus rx_ctrl_testbus pcie_ctrl_testbus rx_ctrl_plane_testbus 
	parameter	tx_rx_parallel_loopback = "dis_plpbk" ,		//Valid values: dis_plpbk en_plpbk 
	parameter	wa_boundary_lock_ctrl = "bit_slip" ,		//Valid values: bit_slip sync_sm deterministic_latency auto_align_pld_ctrl 
	parameter	wa_clk_slip_spacing = 10'b0000010000 ,		//Valid values: 10 
	parameter	wa_det_latency_sync_status_beh = "assert_sync_status_non_imm" ,		//Valid values: assert_sync_status_imm assert_sync_status_non_imm dont_care_assert_sync 
	parameter	wa_disp_err_flag = "dis_disp_err_flag" ,		//Valid values: dis_disp_err_flag en_disp_err_flag 
	parameter	wa_kchar = "dis_kchar" ,		//Valid values: dis_kchar en_kchar 
	parameter	wa_pd = "wa_pd_10" ,		//Valid values: wa_pd_7 wa_pd_10 wa_pd_20 wa_pd_40 wa_pd_8_sw wa_pd_8_dw wa_pd_16_sw wa_pd_16_dw wa_pd_32 
	parameter	wa_pd_data = 40'b0000000000000000000000000000000000000000 ,		//Valid values: 
	parameter	wa_pd_polarity = "dis_pd_both_pol" ,		//Valid values: dis_pd_both_pol en_pd_both_pol dont_care_both_pol 
	parameter	wa_pld_controlled = "dis_pld_ctrl" ,		//Valid values: dis_pld_ctrl pld_ctrl_sw rising_edge_sensitive_dw level_sensitive_dw 
	parameter	wa_renumber_data = 6'b000000 ,		//Valid values: 6 
	parameter	wa_rgnumber_data = 8'b00000000 ,		//Valid values: 8 
	parameter	wa_rknumber_data = 8'b00000000 ,		//Valid values: 8 
	parameter	wa_rosnumber_data = 2'b00 ,		//Valid values: 2 
	parameter	wa_rvnumber_data = 13'b0000000000000 ,		//Valid values: 13 
	parameter	wa_sync_sm_ctrl = "gige_sync_sm" ,		//Valid values: gige_sync_sm pipe_sync_sm sw_basic_sync_sm dw_basic_sync_sm fibre_channel_sync_sm 
	parameter	wait_cnt = 12'b000000000000		//Valid values: 12 
)

(
	//Port declaration

	input	[8:0]  avmmaddress ,
	input	avmmclk ,
	input	avmmread ,
	input	avmmrstn ,
	input	avmmwrite ,
	input	[7:0]  avmmwritedata ,
	input	a1a2_size ,
	input	bit_reversal_enable ,
	input	bitslip ,
	input	byte_rev_en ,
	input	disable_pc_fifo_byte_serdes ,
	input	dyn_clk_switch_n ,
	input	[2:0]  eidleinfersel ,
	input	eios_detected_cdr_ctrl ,
	input	enable_comma_detect ,
	input	gen3_clk_sel ,
	input	hrd_rst ,
	input	inferred_rxvalid_cdr_ctrl ,
	input	pcie_switch ,
	input	pcs_rst ,
	input	phystatus_int ,
	input	phystatus_pcs_gen3 ,
	input	pipe_loopbk ,
	input	pld_rx_clk ,
	input	polarity_inversion ,
	input	[19:0]  datain ,
	input	rcvd_clk_pma ,
	input	[31:0]  rd_data1_rx_rmfifo ,
	input	[31:0]  rd_data2_rx_rmfifo ,
	input	[79:0]  rd_data_rx_phfifo ,
	input	rd_enable_in_chnl_down ,
	input	rd_enable_in_chnl_up ,
	input	rm_fifo_read_enable ,
	input	pc_fifo_rd_enable ,
	input	refclk_dig ,
	input	refclk_dig2 ,
	input	reset_pc_ptrs_asn ,
	input	reset_pc_ptrs_in_chnl_down ,
	input	reset_pc_ptrs_in_chnl_up ,
	input	reset_ppm_cntrs_pcs_pma ,
	input	[3:0]  rx_blk_start_pcs_gen3 ,
	input	[63:0]  rx_data_pcs_gen3 ,
	input	[3:0]  rx_data_valid_pcs_gen3 ,
	input	[1:0]  rx_div_sync_in_chnl_down ,
	input	[1:0]  rx_div_sync_in_chnl_up ,
	input	[1:0]  rx_sync_hdr_pcs_gen3 ,
	input	[1:0]  rx_we_in_chnl_down ,
	input	[1:0]  rx_we_in_chnl_up ,
	input	[2:0]  rxstatus_int ,
	input	[2:0]  rxstatus_pcs_gen3 ,
	input	rx_pcs_rst ,
	input	rxvalid_int ,
	input	rxvalid_pcs_gen3 ,
	input	scan_mode_n ,
	input	sig_det_from_pma ,
	input	soft_reset_wclk1_n ,
	input	speed_change ,
	input	sw_fifo_wr_clk ,
	input	syncsm_en ,
	input	tx_clk_out ,
	input	[19:0]  tx_ctrlplane_testbus ,
	input	[1:0]  tx_div_sync ,
	input	tx_pma_clk ,
	input	[19:0]  tx_testbus ,
	input	wr_enable_in_chnl_down ,
	input	wr_enable_in_chnl_up ,
	input	pc_fifo_wrdisable ,
	input	rm_fifo_write_enable ,

	output	[7:0]  avmmreaddata ,
	output	blockselect ,
	output	byte_deserializer_pcs_clk_div_by_2_reg ,
	output	byte_deserializer_pcs_clk_div_by_2_txclk_reg ,
	output	byte_deserializer_pcs_clk_div_by_2_txclk_wire ,
	output	byte_deserializer_pcs_clk_div_by_2_wire ,
	output	byte_deserializer_pcs_clk_div_by_4_txclk_reg ,
	output	byte_deserializer_pld_clk_div_by_2_reg ,
	output	byte_deserializer_pld_clk_div_by_2_txclk_reg ,
	output	byte_deserializer_pld_clk_div_by_4_txclk_reg ,
	output	pld_8g_a1a2_k1k2_flag_reg ,
	output	pld_8g_a1a2_k1k2_flag_txclk_reg ,
	output	pld_8g_a1a2_size_reg ,
	output	pld_8g_a1a2_size_txclk_reg ,
	output	pld_8g_bitloc_rev_en_reg ,
	output	pld_8g_bitloc_rev_en_txclk_reg ,
	output	pld_8g_byte_rev_en_reg ,
	output	pld_8g_byte_rev_en_txclk_reg ,
	output	pld_8g_elecidle_reg ,
	output	pld_8g_empty_rmf_lowlatency_reg ,
	output	pld_8g_empty_rmf_lowlatency_txclk_reg ,
	output	pld_8g_empty_rmf_reg ,
	output	pld_8g_empty_rmf_txclk_reg ,
	output	pld_8g_empty_rx_fifo ,
	output	pld_8g_empty_rx_reg ,
	output	pld_8g_empty_rx_txclk_reg ,
	output	pld_8g_encdt_reg ,
	output	pld_8g_encdt_txclk_reg ,
	output	pld_8g_full_rmf_reg ,
	output	pld_8g_full_rmf_txclk_reg ,
	output	pld_8g_full_rx_fifo ,
	output	pld_8g_full_rx_reg ,
	output	pld_8g_full_rx_txclk_reg ,
	output	pld_8g_g3_rx_pld_rst_n_reg ,
	output	pld_8g_g3_rx_pld_rst_n_txclk_reg ,
	output	pld_8g_rxelecidle_txclk_reg ,
	output	pld_8g_rxpolarity_reg ,
	output	pld_8g_rxpolarity_txclk_reg ,
	output	pld_8g_wa_boundary_reg ,
	output	pld_8g_wrdisable_rx_reg ,
	output	pld_8g_wrdisable_rx_txclk_reg ,
	output	pld_pcs_rx_clk_out_8g_div_by_2_txclk_wire ,
	output	pld_pcs_rx_clk_out_8g_div_by_2_wire ,
	output	pld_pcs_rx_clk_out_8g_txclk_wire ,
	output	pld_pcs_rx_clk_out_8g_wire ,
	output	pld_rx_control_8g_reg ,
	output	pld_rx_control_8g_txclk_reg ,
	output	pld_rx_data_8g_reg ,
	output	pld_rx_data_8g_txclk_reg ,
	output	pld_syncsm_en_reg ,
	output	pld_syncsm_en_txclk_reg ,
	output	sta_rx_clk2_by2_1 ,
	output	sta_rx_clk2_by2_1_out ,
	output	sta_rx_clk2_by2_2 ,
	output	sta_rx_clk2_by2_2_out ,
	output	sta_rx_clk2_by4_1 ,
	output	sta_rx_clk2_by4_1_out ,
	output	[3:0]  a1a2k1k2flag ,
	output	rm_fifo_partial_full ,
	output	rm_fifo_partial_empty ,
	output	[19:0]  chnl_test_bus_out ,
	output	dis_pc_byte ,
	output	[2:0]  eios_det_cdr_ctrl ,
	output	rm_fifo_empty ,
	output	pc_fifo_empty ,
	output	rm_fifo_full ,
	output	pcfifofull ,
	output	g3_rx_pma_rstn ,
	output	g3_rx_rcvd_rstn ,
	output	gen2ngen1 ,
	output	phystatus ,
	output	[63:0]  pipe_data ,
	output	rd_enable_out_chnl_down ,
	output	rd_enable_out_chnl_up ,
	output	[19:0]  rd_ptr1_rx_rmfifo ,
	output	[19:0]  rd_ptr2_rx_rmfifo ,
	output	[7:0]  rd_ptr_rx_phfifo ,
	output	reset_pc_ptrs ,
	output	reset_pc_ptrs_in_chnl_down_pipe ,
	output	reset_pc_ptrs_in_chnl_up_pipe ,
	output	reset_pc_ptrs_out_chnl_down ,
	output	reset_pc_ptrs_out_chnl_up ,
	output	[19:0]  parallel_rev_loopback ,
	output	[3:0]  rx_blk_start ,
	output	clock_to_pld ,
	output	rx_clk_out_pld_if ,
	output	rx_clk_to_observation_ff_in_pld_if ,
	output	rx_clkslip ,
	output	[3:0]  rx_data_valid ,
	output	[1:0]  rx_div_sync_out_chnl_down ,
	output	[1:0]  rx_div_sync_out_chnl_up ,
	output	rx_pipe_clk ,
	output	rx_pipe_soft_reset ,
	output	rx_pma_clk_gen3 ,
	output	rx_rcvd_clk_gen3 ,
	output	rx_rstn_sync2wrfifo_8g ,
	output	[1:0]  rx_sync_hdr ,
	output	[1:0]  rx_we_out_chnl_down ,
	output	[1:0]  rx_we_out_chnl_up ,
	output	[63:0]  dataout ,
	output	eidle_detected ,
	output	[2:0]  rxstatus ,
	output	rxvalid ,
	output	signal_detect_out ,
	output	[4:0]  word_align_boundary ,
	output	wr_clk_rx_phfifo_dw_clk ,
	output	wr_clk_rx_phfifo_sw_clk ,
	output	wr_clk_rx_rmfifo_dw_clk ,
	output	wr_clk_rx_rmfifo_sw_clk ,
	output	[79:0]  wr_data_rx_phfifo ,
	output	[31:0]  wr_data_rx_rmfifo ,
	output	wr_en_rx_phfifo ,
	output	wr_en_rx_rmfifo ,
	output	wr_enable_out_chnl_down ,
	output	wr_enable_out_chnl_up ,
	output	[7:0]  wr_ptr_rx_phfifo ,
	output	[19:0]  wr_ptr_rx_rmfifo ,
	output	wr_rst_n_rx_phfifo ,
	output	wr_rst_rx_rmfifo 

);

// Function to convert a 64bit binary to a string.
function [128*8-1 : 0] m_bin_to_str;
	input [128 : 1]   s;
	reg   [128 : 1]   reg_s;
	reg   [7 : 0]    tmp;
	reg   [128*8 : 1] res;
	integer m, index;

	begin
		reg_s = s;
		res = 128'h00000000000000000000000000000000;

		for (m = 128; m > 0; m = m-1 )
		begin
			tmp = reg_s[128];
			res[(((m-1)*8)+1)] = tmp & 1'b1;
			reg_s = reg_s << 1;
		end

		m_bin_to_str = res;
	end
endfunction

localparam [8*128-1 : 0] wa_pd_data_string	= m_bin_to_str(wa_pd_data);


	twentynm_hssi_8g_rx_pcs_encrypted
	#(
		.enable_debug_info(enable_debug_info) ,

		.auto_error_replacement(auto_error_replacement) ,
		.auto_speed_nego(auto_speed_nego) ,
		.bit_reversal(bit_reversal) ,
		.bonding_dft_en(bonding_dft_en) ,
		.bonding_dft_val(bonding_dft_val) ,
		.bypass_pipeline_reg(bypass_pipeline_reg) ,
		.byte_deserializer(byte_deserializer) ,
		.cdr_ctrl_rxvalid_mask(cdr_ctrl_rxvalid_mask) ,
		.clkcmp_pattern_n(clkcmp_pattern_n) ,
		.clkcmp_pattern_p(clkcmp_pattern_p) ,
		.clock_gate_bds_dec_asn(clock_gate_bds_dec_asn) ,
		.clock_gate_cdr_eidle(clock_gate_cdr_eidle) ,
		.clock_gate_dw_pc_wrclk(clock_gate_dw_pc_wrclk) ,
		.clock_gate_dw_rm_rd(clock_gate_dw_rm_rd) ,
		.clock_gate_dw_rm_wr(clock_gate_dw_rm_wr) ,
		.clock_gate_dw_wa(clock_gate_dw_wa) ,
		.clock_gate_pc_rdclk(clock_gate_pc_rdclk) ,
		.clock_gate_sw_pc_wrclk(clock_gate_sw_pc_wrclk) ,
		.clock_gate_sw_rm_rd(clock_gate_sw_rm_rd) ,
		.clock_gate_sw_rm_wr(clock_gate_sw_rm_wr) ,
		.clock_gate_sw_wa(clock_gate_sw_wa) ,
		.clock_observation_in_pld_core(clock_observation_in_pld_core) ,
		.ctrl_plane_bonding_compensation(ctrl_plane_bonding_compensation) ,
		.ctrl_plane_bonding_consumption(ctrl_plane_bonding_consumption) ,
		.ctrl_plane_bonding_distribution(ctrl_plane_bonding_distribution) ,
		.eidle_entry_eios(eidle_entry_eios) ,
		.eidle_entry_iei(eidle_entry_iei) ,
		.eidle_entry_sd(eidle_entry_sd) ,
		.eightb_tenb_decoder(eightb_tenb_decoder) ,
		.err_flags_sel(err_flags_sel) ,
		.fixed_pat_det(fixed_pat_det) ,
		.fixed_pat_num(fixed_pat_num) ,
		.force_signal_detect(force_signal_detect) ,
		.gen3_clk_en(gen3_clk_en) ,
		.gen3_rx_clk_sel(gen3_rx_clk_sel) ,
		.gen3_tx_clk_sel(gen3_tx_clk_sel) ,
		.hip_mode(hip_mode) ,
		.ibm_invalid_code(ibm_invalid_code) ,
		.invalid_code_flag_only(invalid_code_flag_only) ,
		.pad_or_edb_error_replace(pad_or_edb_error_replace) ,
		.pcs_bypass(pcs_bypass) ,
		.phase_comp_rdptr(phase_comp_rdptr) ,
		.phase_compensation_fifo(phase_compensation_fifo) ,
		.pipe_if_enable(pipe_if_enable) ,
		.pma_dw(pma_dw) ,
		.polinv_8b10b_dec(polinv_8b10b_dec) ,
		.prot_mode(prot_mode) ,
		.rate_match(rate_match) ,
		.rate_match_del_thres(rate_match_del_thres) ,
		.rate_match_empty_thres(rate_match_empty_thres) ,
		.rate_match_full_thres(rate_match_full_thres) ,
		.rate_match_ins_thres(rate_match_ins_thres) ,
		.rate_match_start_thres(rate_match_start_thres) ,
		.reconfig_settings(reconfig_settings) ,
		.rx_clk2(rx_clk2) ,
		.rx_clk_free_running(rx_clk_free_running) ,
		.rx_pcs_urst(rx_pcs_urst) ,
		.rx_rcvd_clk(rx_rcvd_clk) ,
		.rx_rd_clk(rx_rd_clk) ,
		.rx_refclk(rx_refclk) ,
		.rx_wr_clk(rx_wr_clk) ,
		.silicon_rev(silicon_rev) ,
		.sup_mode(sup_mode) ,
		.symbol_swap(symbol_swap) ,
		.sync_sm_idle_eios(sync_sm_idle_eios) ,
		.test_bus_sel(test_bus_sel) ,
		.tx_rx_parallel_loopback(tx_rx_parallel_loopback) ,
		.wa_boundary_lock_ctrl(wa_boundary_lock_ctrl) ,
		.wa_clk_slip_spacing(wa_clk_slip_spacing) ,
		.wa_det_latency_sync_status_beh(wa_det_latency_sync_status_beh) ,
		.wa_disp_err_flag(wa_disp_err_flag) ,
		.wa_kchar(wa_kchar) ,
		.wa_pd(wa_pd) ,
		.wa_pd_data(wa_pd_data_string) ,
		.wa_pd_polarity(wa_pd_polarity) ,
		.wa_pld_controlled(wa_pld_controlled) ,
		.wa_renumber_data(wa_renumber_data) ,
		.wa_rgnumber_data(wa_rgnumber_data) ,
		.wa_rknumber_data(wa_rknumber_data) ,
		.wa_rosnumber_data(wa_rosnumber_data) ,
		.wa_rvnumber_data(wa_rvnumber_data) ,
		.wa_sync_sm_ctrl(wa_sync_sm_ctrl) ,
		.wait_cnt(wait_cnt)

	)
	twentynm_hssi_8g_rx_pcs_encrypted_inst (

		.avmmaddress(avmmaddress),
		.avmmclk(avmmclk),
		.avmmread(avmmread),
		.avmmrstn(avmmrstn),
		.avmmwrite(avmmwrite),
		.avmmwritedata(avmmwritedata),
		.a1a2_size(a1a2_size),
		.bit_reversal_enable(bit_reversal_enable),
		.bitslip(bitslip),
		.byte_rev_en(byte_rev_en),
		.disable_pc_fifo_byte_serdes(disable_pc_fifo_byte_serdes),
		.dyn_clk_switch_n(dyn_clk_switch_n),
		.eidleinfersel(eidleinfersel),
		.eios_detected_cdr_ctrl(eios_detected_cdr_ctrl),
		.enable_comma_detect(enable_comma_detect),
		.gen3_clk_sel(gen3_clk_sel),
		.hrd_rst(hrd_rst),
		.inferred_rxvalid_cdr_ctrl(inferred_rxvalid_cdr_ctrl),
		.pcie_switch(pcie_switch),
		.pcs_rst(pcs_rst),
		.phystatus_int(phystatus_int),
		.phystatus_pcs_gen3(phystatus_pcs_gen3),
		.pipe_loopbk(pipe_loopbk),
		.pld_rx_clk(pld_rx_clk),
		.polarity_inversion(polarity_inversion),
		.datain(datain),
		.rcvd_clk_pma(rcvd_clk_pma),
		.rd_data1_rx_rmfifo(rd_data1_rx_rmfifo),
		.rd_data2_rx_rmfifo(rd_data2_rx_rmfifo),
		.rd_data_rx_phfifo(rd_data_rx_phfifo),
		.rd_enable_in_chnl_down(rd_enable_in_chnl_down),
		.rd_enable_in_chnl_up(rd_enable_in_chnl_up),
		.rm_fifo_read_enable(rm_fifo_read_enable),
		.pc_fifo_rd_enable(pc_fifo_rd_enable),
		.refclk_dig(refclk_dig),
		.refclk_dig2(refclk_dig2),
		.reset_pc_ptrs_asn(reset_pc_ptrs_asn),
		.reset_pc_ptrs_in_chnl_down(reset_pc_ptrs_in_chnl_down),
		.reset_pc_ptrs_in_chnl_up(reset_pc_ptrs_in_chnl_up),
		.reset_ppm_cntrs_pcs_pma(reset_ppm_cntrs_pcs_pma),
		.rx_blk_start_pcs_gen3(rx_blk_start_pcs_gen3),
		.rx_data_pcs_gen3(rx_data_pcs_gen3),
		.rx_data_valid_pcs_gen3(rx_data_valid_pcs_gen3),
		.rx_div_sync_in_chnl_down(rx_div_sync_in_chnl_down),
		.rx_div_sync_in_chnl_up(rx_div_sync_in_chnl_up),
		.rx_sync_hdr_pcs_gen3(rx_sync_hdr_pcs_gen3),
		.rx_we_in_chnl_down(rx_we_in_chnl_down),
		.rx_we_in_chnl_up(rx_we_in_chnl_up),
		.rxstatus_int(rxstatus_int),
		.rxstatus_pcs_gen3(rxstatus_pcs_gen3),
		.rx_pcs_rst(rx_pcs_rst),
		.rxvalid_int(rxvalid_int),
		.rxvalid_pcs_gen3(rxvalid_pcs_gen3),
		.scan_mode_n(scan_mode_n),
		.sig_det_from_pma(sig_det_from_pma),
		.soft_reset_wclk1_n(soft_reset_wclk1_n),
		.speed_change(speed_change),
		.sw_fifo_wr_clk(sw_fifo_wr_clk),
		.syncsm_en(syncsm_en),
		.tx_clk_out(tx_clk_out),
		.tx_ctrlplane_testbus(tx_ctrlplane_testbus),
		.tx_div_sync(tx_div_sync),
		.tx_pma_clk(tx_pma_clk),
		.tx_testbus(tx_testbus),
		.wr_enable_in_chnl_down(wr_enable_in_chnl_down),
		.wr_enable_in_chnl_up(wr_enable_in_chnl_up),
		.pc_fifo_wrdisable(pc_fifo_wrdisable),
		.rm_fifo_write_enable(rm_fifo_write_enable),
		.avmmreaddata(avmmreaddata),
		.blockselect(blockselect),
		.byte_deserializer_pcs_clk_div_by_2_reg(byte_deserializer_pcs_clk_div_by_2_reg),
		.byte_deserializer_pcs_clk_div_by_2_txclk_reg(byte_deserializer_pcs_clk_div_by_2_txclk_reg),
		.byte_deserializer_pcs_clk_div_by_2_txclk_wire(byte_deserializer_pcs_clk_div_by_2_txclk_wire),
		.byte_deserializer_pcs_clk_div_by_2_wire(byte_deserializer_pcs_clk_div_by_2_wire),
		.byte_deserializer_pcs_clk_div_by_4_txclk_reg(byte_deserializer_pcs_clk_div_by_4_txclk_reg),
		.byte_deserializer_pld_clk_div_by_2_reg(byte_deserializer_pld_clk_div_by_2_reg),
		.byte_deserializer_pld_clk_div_by_2_txclk_reg(byte_deserializer_pld_clk_div_by_2_txclk_reg),
		.byte_deserializer_pld_clk_div_by_4_txclk_reg(byte_deserializer_pld_clk_div_by_4_txclk_reg),
		.pld_8g_a1a2_k1k2_flag_reg(pld_8g_a1a2_k1k2_flag_reg),
		.pld_8g_a1a2_k1k2_flag_txclk_reg(pld_8g_a1a2_k1k2_flag_txclk_reg),
		.pld_8g_a1a2_size_reg(pld_8g_a1a2_size_reg),
		.pld_8g_a1a2_size_txclk_reg(pld_8g_a1a2_size_txclk_reg),
		.pld_8g_bitloc_rev_en_reg(pld_8g_bitloc_rev_en_reg),
		.pld_8g_bitloc_rev_en_txclk_reg(pld_8g_bitloc_rev_en_txclk_reg),
		.pld_8g_byte_rev_en_reg(pld_8g_byte_rev_en_reg),
		.pld_8g_byte_rev_en_txclk_reg(pld_8g_byte_rev_en_txclk_reg),
		.pld_8g_elecidle_reg(pld_8g_elecidle_reg),
		.pld_8g_empty_rmf_lowlatency_reg(pld_8g_empty_rmf_lowlatency_reg),
		.pld_8g_empty_rmf_lowlatency_txclk_reg(pld_8g_empty_rmf_lowlatency_txclk_reg),
		.pld_8g_empty_rmf_reg(pld_8g_empty_rmf_reg),
		.pld_8g_empty_rmf_txclk_reg(pld_8g_empty_rmf_txclk_reg),
		.pld_8g_empty_rx_fifo(pld_8g_empty_rx_fifo),
		.pld_8g_empty_rx_reg(pld_8g_empty_rx_reg),
		.pld_8g_empty_rx_txclk_reg(pld_8g_empty_rx_txclk_reg),
		.pld_8g_encdt_reg(pld_8g_encdt_reg),
		.pld_8g_encdt_txclk_reg(pld_8g_encdt_txclk_reg),
		.pld_8g_full_rmf_reg(pld_8g_full_rmf_reg),
		.pld_8g_full_rmf_txclk_reg(pld_8g_full_rmf_txclk_reg),
		.pld_8g_full_rx_fifo(pld_8g_full_rx_fifo),
		.pld_8g_full_rx_reg(pld_8g_full_rx_reg),
		.pld_8g_full_rx_txclk_reg(pld_8g_full_rx_txclk_reg),
		.pld_8g_g3_rx_pld_rst_n_reg(pld_8g_g3_rx_pld_rst_n_reg),
		.pld_8g_g3_rx_pld_rst_n_txclk_reg(pld_8g_g3_rx_pld_rst_n_txclk_reg),
		.pld_8g_rxelecidle_txclk_reg(pld_8g_rxelecidle_txclk_reg),
		.pld_8g_rxpolarity_reg(pld_8g_rxpolarity_reg),
		.pld_8g_rxpolarity_txclk_reg(pld_8g_rxpolarity_txclk_reg),
		.pld_8g_wa_boundary_reg(pld_8g_wa_boundary_reg),
		.pld_8g_wrdisable_rx_reg(pld_8g_wrdisable_rx_reg),
		.pld_8g_wrdisable_rx_txclk_reg(pld_8g_wrdisable_rx_txclk_reg),
		.pld_pcs_rx_clk_out_8g_div_by_2_txclk_wire(pld_pcs_rx_clk_out_8g_div_by_2_txclk_wire),
		.pld_pcs_rx_clk_out_8g_div_by_2_wire(pld_pcs_rx_clk_out_8g_div_by_2_wire),
		.pld_pcs_rx_clk_out_8g_txclk_wire(pld_pcs_rx_clk_out_8g_txclk_wire),
		.pld_pcs_rx_clk_out_8g_wire(pld_pcs_rx_clk_out_8g_wire),
		.pld_rx_control_8g_reg(pld_rx_control_8g_reg),
		.pld_rx_control_8g_txclk_reg(pld_rx_control_8g_txclk_reg),
		.pld_rx_data_8g_reg(pld_rx_data_8g_reg),
		.pld_rx_data_8g_txclk_reg(pld_rx_data_8g_txclk_reg),
		.pld_syncsm_en_reg(pld_syncsm_en_reg),
		.pld_syncsm_en_txclk_reg(pld_syncsm_en_txclk_reg),
		.sta_rx_clk2_by2_1(sta_rx_clk2_by2_1),
		.sta_rx_clk2_by2_1_out(sta_rx_clk2_by2_1_out),
		.sta_rx_clk2_by2_2(sta_rx_clk2_by2_2),
		.sta_rx_clk2_by2_2_out(sta_rx_clk2_by2_2_out),
		.sta_rx_clk2_by4_1(sta_rx_clk2_by4_1),
		.sta_rx_clk2_by4_1_out(sta_rx_clk2_by4_1_out),
		.a1a2k1k2flag(a1a2k1k2flag),
		.rm_fifo_partial_full(rm_fifo_partial_full),
		.rm_fifo_partial_empty(rm_fifo_partial_empty),
		.chnl_test_bus_out(chnl_test_bus_out),
		.dis_pc_byte(dis_pc_byte),
		.eios_det_cdr_ctrl(eios_det_cdr_ctrl),
		.rm_fifo_empty(rm_fifo_empty),
		.pc_fifo_empty(pc_fifo_empty),
		.rm_fifo_full(rm_fifo_full),
		.pcfifofull(pcfifofull),
		.g3_rx_pma_rstn(g3_rx_pma_rstn),
		.g3_rx_rcvd_rstn(g3_rx_rcvd_rstn),
		.gen2ngen1(gen2ngen1),
		.phystatus(phystatus),
		.pipe_data(pipe_data),
		.rd_enable_out_chnl_down(rd_enable_out_chnl_down),
		.rd_enable_out_chnl_up(rd_enable_out_chnl_up),
		.rd_ptr1_rx_rmfifo(rd_ptr1_rx_rmfifo),
		.rd_ptr2_rx_rmfifo(rd_ptr2_rx_rmfifo),
		.rd_ptr_rx_phfifo(rd_ptr_rx_phfifo),
		.reset_pc_ptrs(reset_pc_ptrs),
		.reset_pc_ptrs_in_chnl_down_pipe(reset_pc_ptrs_in_chnl_down_pipe),
		.reset_pc_ptrs_in_chnl_up_pipe(reset_pc_ptrs_in_chnl_up_pipe),
		.reset_pc_ptrs_out_chnl_down(reset_pc_ptrs_out_chnl_down),
		.reset_pc_ptrs_out_chnl_up(reset_pc_ptrs_out_chnl_up),
		.parallel_rev_loopback(parallel_rev_loopback),
		.rx_blk_start(rx_blk_start),
		.clock_to_pld(clock_to_pld),
		.rx_clk_out_pld_if(rx_clk_out_pld_if),
		.rx_clk_to_observation_ff_in_pld_if(rx_clk_to_observation_ff_in_pld_if),
		.rx_clkslip(rx_clkslip),
		.rx_data_valid(rx_data_valid),
		.rx_div_sync_out_chnl_down(rx_div_sync_out_chnl_down),
		.rx_div_sync_out_chnl_up(rx_div_sync_out_chnl_up),
		.rx_pipe_clk(rx_pipe_clk),
		.rx_pipe_soft_reset(rx_pipe_soft_reset),
		.rx_pma_clk_gen3(rx_pma_clk_gen3),
		.rx_rcvd_clk_gen3(rx_rcvd_clk_gen3),
		.rx_rstn_sync2wrfifo_8g(rx_rstn_sync2wrfifo_8g),
		.rx_sync_hdr(rx_sync_hdr),
		.rx_we_out_chnl_down(rx_we_out_chnl_down),
		.rx_we_out_chnl_up(rx_we_out_chnl_up),
		.dataout(dataout),
		.eidle_detected(eidle_detected),
		.rxstatus(rxstatus),
		.rxvalid(rxvalid),
		.signal_detect_out(signal_detect_out),
		.word_align_boundary(word_align_boundary),
		.wr_clk_rx_phfifo_dw_clk(wr_clk_rx_phfifo_dw_clk),
		.wr_clk_rx_phfifo_sw_clk(wr_clk_rx_phfifo_sw_clk),
		.wr_clk_rx_rmfifo_dw_clk(wr_clk_rx_rmfifo_dw_clk),
		.wr_clk_rx_rmfifo_sw_clk(wr_clk_rx_rmfifo_sw_clk),
		.wr_data_rx_phfifo(wr_data_rx_phfifo),
		.wr_data_rx_rmfifo(wr_data_rx_rmfifo),
		.wr_en_rx_phfifo(wr_en_rx_phfifo),
		.wr_en_rx_rmfifo(wr_en_rx_rmfifo),
		.wr_enable_out_chnl_down(wr_enable_out_chnl_down),
		.wr_enable_out_chnl_up(wr_enable_out_chnl_up),
		.wr_ptr_rx_phfifo(wr_ptr_rx_phfifo),
		.wr_ptr_rx_rmfifo(wr_ptr_rx_rmfifo),
		.wr_rst_n_rx_phfifo(wr_rst_n_rx_phfifo),
		.wr_rst_rx_rmfifo(wr_rst_rx_rmfifo)

	);

endmodule
// -----------------------------------------------------------
// This is auto-generated HSSI Simulation Atom Model Encryption Wrapper
// Module Name : work/twentynm_hssi_8g_tx_pcs_wrapper.v
// -----------------------------------------------------------

`timescale 1 ps/1 ps

module twentynm_hssi_8g_tx_pcs
#(
	// Parameter declaration and default value assignment

	parameter enable_debug_info = "true",	//Valid values: false|true; this is simulation-only parameter, for debug purpose only

	parameter	auto_speed_nego_gen2 = "dis_asn_g2" ,		//Valid values: dis_asn_g2 en_asn_g2_freq_scal 
	parameter	bit_reversal = "dis_bit_reversal" ,		//Valid values: dis_bit_reversal en_bit_reversal 
	parameter	bonding_dft_en = "dft_dis" ,		//Valid values: dft_dis dft_en 
	parameter	bonding_dft_val = "dft_0" ,		//Valid values: dft_0 dft_1 
	parameter	bypass_pipeline_reg = "dis_bypass_pipeline" ,		//Valid values: dis_bypass_pipeline en_bypass_pipeline 
	parameter	byte_serializer = "dis_bs" ,		//Valid values: dis_bs en_bs_by_2 en_bs_by_4 
	parameter	clock_gate_bs_enc = "dis_bs_enc_clk_gating" ,		//Valid values: dis_bs_enc_clk_gating en_bs_enc_clk_gating 
	parameter	clock_gate_dw_fifowr = "dis_dw_fifowr_clk_gating" ,		//Valid values: dis_dw_fifowr_clk_gating en_dw_fifowr_clk_gating 
	parameter	clock_gate_fiford = "dis_fiford_clk_gating" ,		//Valid values: dis_fiford_clk_gating en_fiford_clk_gating 
	parameter	clock_gate_sw_fifowr = "dis_sw_fifowr_clk_gating" ,		//Valid values: dis_sw_fifowr_clk_gating en_sw_fifowr_clk_gating 
	parameter	clock_observation_in_pld_core = "internal_refclk_b" ,		//Valid values: internal_refclk_b internal_fifo_rd_clk internal_sw_fifo_wr_clk internal_dw_fifo_wr_clk internal_tx_clk_out_gen3 internal_pipe_tx_clk_out_gen3 
	parameter	ctrl_plane_bonding_compensation = "dis_compensation" ,		//Valid values: dis_compensation en_compensation 
	parameter	ctrl_plane_bonding_consumption = "individual" ,		//Valid values: individual bundled_master bundled_slave_below bundled_slave_above 
	parameter	ctrl_plane_bonding_distribution = "not_master_chnl_distr" ,		//Valid values: not_master_chnl_distr master_chnl_distr 
	parameter	data_selection_8b10b_encoder_input = "normal_data_path" ,		//Valid values: normal_data_path gige_idle_conversion 
	parameter	dynamic_clk_switch = "dis_dyn_clk_switch" ,		//Valid values: dis_dyn_clk_switch en_dyn_clk_switch 
	parameter	eightb_tenb_disp_ctrl = "dis_disp_ctrl" ,		//Valid values: dis_disp_ctrl en_disp_ctrl en_ib_disp_ctrl 
	parameter	eightb_tenb_encoder = "dis_8b10b" ,		//Valid values: dis_8b10b en_8b10b_ibm en_8b10b_sgx 
	parameter	force_echar = "dis_force_echar" ,		//Valid values: dis_force_echar en_force_echar 
	parameter	force_kchar = "dis_force_kchar" ,		//Valid values: dis_force_kchar en_force_kchar 
	parameter	gen3_tx_clk_sel = "tx_pma_clk" ,		//Valid values: dis_tx_clk tx_pma_clk 
	parameter	gen3_tx_pipe_clk_sel = "func_clk" ,		//Valid values: dis_tx_pipe_clk func_clk 
	parameter	hip_mode = "dis_hip" ,		//Valid values: dis_hip en_hip 
	parameter	pcs_bypass = "dis_pcs_bypass" ,		//Valid values: dis_pcs_bypass en_pcs_bypass 
	parameter	phase_comp_rdptr = "enable_rdptr" ,		//Valid values: disable_rdptr enable_rdptr 
	parameter	phase_compensation_fifo = "low_latency" ,		//Valid values: low_latency normal_latency register_fifo pld_ctrl_low_latency pld_ctrl_normal_latency 
	parameter	phfifo_write_clk_sel = "pld_tx_clk" ,		//Valid values: pld_tx_clk tx_clk 
	parameter	pma_dw = "eight_bit" ,		//Valid values: eight_bit ten_bit sixteen_bit twenty_bit 
	parameter	prot_mode = "basic" ,		//Valid values: pipe_g1 pipe_g2 pipe_g3 cpri cpri_rx_tx gige gige_1588 basic disabled_prot_mode 
	parameter	reconfig_settings = "{}" ,		//Valid values:  
	parameter	refclk_b_clk_sel = "tx_pma_clock" ,		//Valid values: tx_pma_clock refclk_dig 
	parameter	revloop_back_rm = "dis_rev_loopback_rx_rm" ,		//Valid values: dis_rev_loopback_rx_rm en_rev_loopback_rx_rm 
	parameter	silicon_rev = "20nm5es" ,		//Valid values: 20nm5es 20nm5es2 20nm4es 20nm4es2 20nm5 20nm4 20nm3 20nm2 20nm1 
	parameter	sup_mode = "user_mode" ,		//Valid values: user_mode engineering_mode 
	parameter	symbol_swap = "dis_symbol_swap" ,		//Valid values: dis_symbol_swap en_symbol_swap 
	parameter	tx_bitslip = "dis_tx_bitslip" ,		//Valid values: dis_tx_bitslip en_tx_bitslip 
	parameter	tx_compliance_controlled_disparity = "dis_txcompliance" ,		//Valid values: dis_txcompliance en_txcompliance_pipe2p0 en_txcompliance_pipe3p0 
	parameter	tx_fast_pld_reg = "dis_tx_fast_pld_reg" ,		//Valid values: dis_tx_fast_pld_reg en_tx_fast_pld_reg 
	parameter	txclk_freerun = "dis_freerun_tx" ,		//Valid values: dis_freerun_tx en_freerun_tx 
	parameter	txpcs_urst = "en_txpcs_urst"		//Valid values: dis_txpcs_urst en_txpcs_urst 
)

(
	//Port declaration

	input	[8:0]  avmmaddress ,
	input	avmmclk ,
	input	avmmread ,
	input	avmmrstn ,
	input	avmmwrite ,
	input	[7:0]  avmmwritedata ,
	input	clk_sel_gen3 ,
	input	dis_pc_byte ,
	input	[2:0]  eidleinfersel ,
	input	[1:0]  fifo_select_in_chnl_down ,
	input	[1:0]  fifo_select_in_chnl_up ,
	input	rate_switch ,
	input	hrdrst ,
	input	pcs_rst ,
	input	pipe_tx_deemph ,
	input	[2:0]  pipe_tx_margin ,
	input	coreclk ,
	input	[1:0]  powerdn ,
	input	[63:0]  rd_data_tx_phfifo ,
	input	rd_enable_in_chnl_down ,
	input	rd_enable_in_chnl_up ,
	input	ph_fifo_rd_disable ,
	input	refclk_dig ,
	input	reset_pc_ptrs ,
	input	reset_pc_ptrs_in_chnl_down ,
	input	reset_pc_ptrs_in_chnl_up ,
	input	[19:0]  rev_parallel_lpbk_data ,
	input	en_rev_parallel_lpbk ,
	input	pipe_en_rev_parallel_lpbk_in ,
	input	rxpolarity ,
	input	scan_mode_n ,
	input	[3:0]  tx_blk_start ,
	input	[4:0]  bitslip_boundary_select ,
	input	[3:0]  tx_data_valid ,
	input	[1:0]  tx_div_sync_in_chnl_down ,
	input	[1:0]  tx_div_sync_in_chnl_up ,
	input	[1:0]  tx_sync_hdr ,
	input	[43:0]  datain ,
	input	[43:0]  txd_fast_reg ,
	input	detectrxloopin ,
	input	txpma_local_clk ,
	input	txswing ,
	input	tx_pcs_reset ,
	input	wr_enable_in_chnl_down ,
	input	wr_enable_in_chnl_up ,
	input	wrenable_tx ,

	output	[7:0]  avmmreaddata ,
	output	blockselect ,
	output	byte_serializer_pcs_clk_div_by_2_reg ,
	output	byte_serializer_pcs_clk_div_by_2_wire ,
	output	byte_serializer_pcs_clk_div_by_4_reg ,
	output	byte_serializer_pld_clk_div_by_2_reg ,
	output	byte_serializer_pld_clk_div_by_4_reg ,
	output	pld_8g_empty_tx_fifo ,
	output	pld_8g_empty_tx_reg ,
	output	pld_8g_full_tx_fifo ,
	output	pld_8g_full_tx_reg ,
	output	pld_8g_g3_tx_pld_rst_n_reg ,
	output	pld_8g_rddisable_tx_reg ,
	output	pld_8g_tx_boundary_sel_reg ,
	output	pld_pcs_tx_clk_out_8g_div_by_2_wire ,
	output	pld_pcs_tx_clk_out_8g_wire ,
	output	pld_tx_data_8g_fifo ,
	output	pld_tx_data_lo_8g_reg ,
	output	sta_tx_clk2_by2_1 ,
	output	sta_tx_clk2_by2_1_out ,
	output	sta_tx_clk2_by4_1 ,
	output	sta_tx_clk2_by4_1_out ,
	output	dyn_clk_switch_n ,
	output	ph_fifo_underflow ,
	output	[1:0]  fifo_select_out_chnl_down ,
	output	[1:0]  fifo_select_out_chnl_up ,
	output	ph_fifo_overflow ,
	output	g3_pipe_tx_pma_rstn ,
	output	g3_tx_pma_rstn ,
	output	[2:0]  non_gray_eidleinfersel ,
	output	phfifo_txdeemph ,
	output	[2:0]  phfifo_txmargin ,
	output	phfifo_txswing ,
	output	pipe_tx_clk_out_gen3 ,
	output	pmaif_asn_rstn ,
	output	[1:0]  pipe_power_down_out ,
	output	[19:0]  dataout ,
	output	rd_enable_out_chnl_down ,
	output	rd_enable_out_chnl_up ,
	output	[7:0]  rd_ptr_tx_phfifo ,
	output	refclk_b ,
	output	refclk_b_reset ,
	output	pipe_en_rev_parallel_lpbk_out ,
	output	rxpolarity_int ,
	output	soft_reset_wclk1_n ,
	output	sw_fifo_wr_clk ,
	output	[3:0]  tx_blk_start_out ,
	output	clk_out ,
	output	tx_clk_out_8g_pmaif ,
	output	clk_out_gen3 ,
	output	tx_clk_out_pld_if ,
	output	tx_clk_out_pmaif ,
	output	tx_clk_to_observation_ff_in_pld_if ,
	output	[19:0]  tx_ctrlplane_testbus ,
	output	[31:0]  tx_data_out ,
	output	[3:0]  tx_data_valid_out ,
	output	[3:0]  tx_datak_out ,
	output	[1:0]  tx_div_sync ,
	output	[1:0]  tx_div_sync_out_chnl_down ,
	output	[1:0]  tx_div_sync_out_chnl_up ,
	output	tx_pipe_clk ,
	output	tx_pipe_electidle ,
	output	tx_pipe_soft_reset ,
	output	[1:0]  tx_sync_hdr_out ,
	output	[19:0]  tx_testbus ,
	output	txcompliance_out ,
	output	tx_detect_rxloopback_int ,
	output	txelecidle_out ,
	output	wr_clk_tx_phfifo_dw_clk ,
	output	wr_clk_tx_phfifo_sw_clk ,
	output	[63:0]  wr_data_tx_phfifo ,
	output	wr_en_tx_phfifo ,
	output	wr_enable_out_chnl_down ,
	output	wr_enable_out_chnl_up ,
	output	[7:0]  wr_ptr_tx_phfifo ,
	output	wr_rst_n_tx_phfifo 

);


	twentynm_hssi_8g_tx_pcs_encrypted
	#(
		.enable_debug_info(enable_debug_info) ,

		.auto_speed_nego_gen2(auto_speed_nego_gen2) ,
		.bit_reversal(bit_reversal) ,
		.bonding_dft_en(bonding_dft_en) ,
		.bonding_dft_val(bonding_dft_val) ,
		.bypass_pipeline_reg(bypass_pipeline_reg) ,
		.byte_serializer(byte_serializer) ,
		.clock_gate_bs_enc(clock_gate_bs_enc) ,
		.clock_gate_dw_fifowr(clock_gate_dw_fifowr) ,
		.clock_gate_fiford(clock_gate_fiford) ,
		.clock_gate_sw_fifowr(clock_gate_sw_fifowr) ,
		.clock_observation_in_pld_core(clock_observation_in_pld_core) ,
		.ctrl_plane_bonding_compensation(ctrl_plane_bonding_compensation) ,
		.ctrl_plane_bonding_consumption(ctrl_plane_bonding_consumption) ,
		.ctrl_plane_bonding_distribution(ctrl_plane_bonding_distribution) ,
		.data_selection_8b10b_encoder_input(data_selection_8b10b_encoder_input) ,
		.dynamic_clk_switch(dynamic_clk_switch) ,
		.eightb_tenb_disp_ctrl(eightb_tenb_disp_ctrl) ,
		.eightb_tenb_encoder(eightb_tenb_encoder) ,
		.force_echar(force_echar) ,
		.force_kchar(force_kchar) ,
		.gen3_tx_clk_sel(gen3_tx_clk_sel) ,
		.gen3_tx_pipe_clk_sel(gen3_tx_pipe_clk_sel) ,
		.hip_mode(hip_mode) ,
		.pcs_bypass(pcs_bypass) ,
		.phase_comp_rdptr(phase_comp_rdptr) ,
		.phase_compensation_fifo(phase_compensation_fifo) ,
		.phfifo_write_clk_sel(phfifo_write_clk_sel) ,
		.pma_dw(pma_dw) ,
		.prot_mode(prot_mode) ,
		.reconfig_settings(reconfig_settings) ,
		.refclk_b_clk_sel(refclk_b_clk_sel) ,
		.revloop_back_rm(revloop_back_rm) ,
		.silicon_rev(silicon_rev) ,
		.sup_mode(sup_mode) ,
		.symbol_swap(symbol_swap) ,
		.tx_bitslip(tx_bitslip) ,
		.tx_compliance_controlled_disparity(tx_compliance_controlled_disparity) ,
		.tx_fast_pld_reg(tx_fast_pld_reg) ,
		.txclk_freerun(txclk_freerun) ,
		.txpcs_urst(txpcs_urst)

	)
	twentynm_hssi_8g_tx_pcs_encrypted_inst (

		.avmmaddress(avmmaddress),
		.avmmclk(avmmclk),
		.avmmread(avmmread),
		.avmmrstn(avmmrstn),
		.avmmwrite(avmmwrite),
		.avmmwritedata(avmmwritedata),
		.clk_sel_gen3(clk_sel_gen3),
		.dis_pc_byte(dis_pc_byte),
		.eidleinfersel(eidleinfersel),
		.fifo_select_in_chnl_down(fifo_select_in_chnl_down),
		.fifo_select_in_chnl_up(fifo_select_in_chnl_up),
		.rate_switch(rate_switch),
		.hrdrst(hrdrst),
		.pcs_rst(pcs_rst),
		.pipe_tx_deemph(pipe_tx_deemph),
		.pipe_tx_margin(pipe_tx_margin),
		.coreclk(coreclk),
		.powerdn(powerdn),
		.rd_data_tx_phfifo(rd_data_tx_phfifo),
		.rd_enable_in_chnl_down(rd_enable_in_chnl_down),
		.rd_enable_in_chnl_up(rd_enable_in_chnl_up),
		.ph_fifo_rd_disable(ph_fifo_rd_disable),
		.refclk_dig(refclk_dig),
		.reset_pc_ptrs(reset_pc_ptrs),
		.reset_pc_ptrs_in_chnl_down(reset_pc_ptrs_in_chnl_down),
		.reset_pc_ptrs_in_chnl_up(reset_pc_ptrs_in_chnl_up),
		.rev_parallel_lpbk_data(rev_parallel_lpbk_data),
		.en_rev_parallel_lpbk(en_rev_parallel_lpbk),
		.pipe_en_rev_parallel_lpbk_in(pipe_en_rev_parallel_lpbk_in),
		.rxpolarity(rxpolarity),
		.scan_mode_n(scan_mode_n),
		.tx_blk_start(tx_blk_start),
		.bitslip_boundary_select(bitslip_boundary_select),
		.tx_data_valid(tx_data_valid),
		.tx_div_sync_in_chnl_down(tx_div_sync_in_chnl_down),
		.tx_div_sync_in_chnl_up(tx_div_sync_in_chnl_up),
		.tx_sync_hdr(tx_sync_hdr),
		.datain(datain),
		.txd_fast_reg(txd_fast_reg),
		.detectrxloopin(detectrxloopin),
		.txpma_local_clk(txpma_local_clk),
		.txswing(txswing),
		.tx_pcs_reset(tx_pcs_reset),
		.wr_enable_in_chnl_down(wr_enable_in_chnl_down),
		.wr_enable_in_chnl_up(wr_enable_in_chnl_up),
		.wrenable_tx(wrenable_tx),
		.avmmreaddata(avmmreaddata),
		.blockselect(blockselect),
		.byte_serializer_pcs_clk_div_by_2_reg(byte_serializer_pcs_clk_div_by_2_reg),
		.byte_serializer_pcs_clk_div_by_2_wire(byte_serializer_pcs_clk_div_by_2_wire),
		.byte_serializer_pcs_clk_div_by_4_reg(byte_serializer_pcs_clk_div_by_4_reg),
		.byte_serializer_pld_clk_div_by_2_reg(byte_serializer_pld_clk_div_by_2_reg),
		.byte_serializer_pld_clk_div_by_4_reg(byte_serializer_pld_clk_div_by_4_reg),
		.pld_8g_empty_tx_fifo(pld_8g_empty_tx_fifo),
		.pld_8g_empty_tx_reg(pld_8g_empty_tx_reg),
		.pld_8g_full_tx_fifo(pld_8g_full_tx_fifo),
		.pld_8g_full_tx_reg(pld_8g_full_tx_reg),
		.pld_8g_g3_tx_pld_rst_n_reg(pld_8g_g3_tx_pld_rst_n_reg),
		.pld_8g_rddisable_tx_reg(pld_8g_rddisable_tx_reg),
		.pld_8g_tx_boundary_sel_reg(pld_8g_tx_boundary_sel_reg),
		.pld_pcs_tx_clk_out_8g_div_by_2_wire(pld_pcs_tx_clk_out_8g_div_by_2_wire),
		.pld_pcs_tx_clk_out_8g_wire(pld_pcs_tx_clk_out_8g_wire),
		.pld_tx_data_8g_fifo(pld_tx_data_8g_fifo),
		.pld_tx_data_lo_8g_reg(pld_tx_data_lo_8g_reg),
		.sta_tx_clk2_by2_1(sta_tx_clk2_by2_1),
		.sta_tx_clk2_by2_1_out(sta_tx_clk2_by2_1_out),
		.sta_tx_clk2_by4_1(sta_tx_clk2_by4_1),
		.sta_tx_clk2_by4_1_out(sta_tx_clk2_by4_1_out),
		.dyn_clk_switch_n(dyn_clk_switch_n),
		.ph_fifo_underflow(ph_fifo_underflow),
		.fifo_select_out_chnl_down(fifo_select_out_chnl_down),
		.fifo_select_out_chnl_up(fifo_select_out_chnl_up),
		.ph_fifo_overflow(ph_fifo_overflow),
		.g3_pipe_tx_pma_rstn(g3_pipe_tx_pma_rstn),
		.g3_tx_pma_rstn(g3_tx_pma_rstn),
		.non_gray_eidleinfersel(non_gray_eidleinfersel),
		.phfifo_txdeemph(phfifo_txdeemph),
		.phfifo_txmargin(phfifo_txmargin),
		.phfifo_txswing(phfifo_txswing),
		.pipe_tx_clk_out_gen3(pipe_tx_clk_out_gen3),
		.pmaif_asn_rstn(pmaif_asn_rstn),
		.pipe_power_down_out(pipe_power_down_out),
		.dataout(dataout),
		.rd_enable_out_chnl_down(rd_enable_out_chnl_down),
		.rd_enable_out_chnl_up(rd_enable_out_chnl_up),
		.rd_ptr_tx_phfifo(rd_ptr_tx_phfifo),
		.refclk_b(refclk_b),
		.refclk_b_reset(refclk_b_reset),
		.pipe_en_rev_parallel_lpbk_out(pipe_en_rev_parallel_lpbk_out),
		.rxpolarity_int(rxpolarity_int),
		.soft_reset_wclk1_n(soft_reset_wclk1_n),
		.sw_fifo_wr_clk(sw_fifo_wr_clk),
		.tx_blk_start_out(tx_blk_start_out),
		.clk_out(clk_out),
		.tx_clk_out_8g_pmaif(tx_clk_out_8g_pmaif),
		.clk_out_gen3(clk_out_gen3),
		.tx_clk_out_pld_if(tx_clk_out_pld_if),
		.tx_clk_out_pmaif(tx_clk_out_pmaif),
		.tx_clk_to_observation_ff_in_pld_if(tx_clk_to_observation_ff_in_pld_if),
		.tx_ctrlplane_testbus(tx_ctrlplane_testbus),
		.tx_data_out(tx_data_out),
		.tx_data_valid_out(tx_data_valid_out),
		.tx_datak_out(tx_datak_out),
		.tx_div_sync(tx_div_sync),
		.tx_div_sync_out_chnl_down(tx_div_sync_out_chnl_down),
		.tx_div_sync_out_chnl_up(tx_div_sync_out_chnl_up),
		.tx_pipe_clk(tx_pipe_clk),
		.tx_pipe_electidle(tx_pipe_electidle),
		.tx_pipe_soft_reset(tx_pipe_soft_reset),
		.tx_sync_hdr_out(tx_sync_hdr_out),
		.tx_testbus(tx_testbus),
		.txcompliance_out(txcompliance_out),
		.tx_detect_rxloopback_int(tx_detect_rxloopback_int),
		.txelecidle_out(txelecidle_out),
		.wr_clk_tx_phfifo_dw_clk(wr_clk_tx_phfifo_dw_clk),
		.wr_clk_tx_phfifo_sw_clk(wr_clk_tx_phfifo_sw_clk),
		.wr_data_tx_phfifo(wr_data_tx_phfifo),
		.wr_en_tx_phfifo(wr_en_tx_phfifo),
		.wr_enable_out_chnl_down(wr_enable_out_chnl_down),
		.wr_enable_out_chnl_up(wr_enable_out_chnl_up),
		.wr_ptr_tx_phfifo(wr_ptr_tx_phfifo),
		.wr_rst_n_tx_phfifo(wr_rst_n_tx_phfifo)

	);

endmodule
// -----------------------------------------------------------
// This is auto-generated HSSI Simulation Atom Model Encryption Wrapper
// Module Name : work/twentynm_hssi_common_pcs_pma_interface_wrapper.v
// -----------------------------------------------------------

`timescale 1 ps/1 ps

module twentynm_hssi_common_pcs_pma_interface
#(
	// Parameter declaration and default value assignment

	parameter enable_debug_info = "true",	//Valid values: false|true; this is simulation-only parameter, for debug purpose only

	parameter	asn_clk_enable = "false" ,		//Valid values: false true 
	parameter	asn_enable = "dis_asn" ,		//Valid values: dis_asn en_asn 
	parameter	block_sel = "eight_g_pcs" ,		//Valid values: eight_g_pcs pcie_gen3 
	parameter	bypass_early_eios = "false" ,		//Valid values: false true 
	parameter	bypass_pcie_switch = "false" ,		//Valid values: false true 
	parameter	bypass_pma_ltr = "false" ,		//Valid values: false true 
	parameter	bypass_pma_sw_done = "false" ,		//Valid values: false true 
	parameter	bypass_ppm_lock = "false" ,		//Valid values: false true 
	parameter	bypass_send_syncp_fbkp = "false" ,		//Valid values: false true 
	parameter	bypass_txdetectrx = "false" ,		//Valid values: false true 
	parameter	cdr_control = "en_cdr_ctrl" ,		//Valid values: dis_cdr_ctrl en_cdr_ctrl 
	parameter	cid_enable = "en_cid_mode" ,		//Valid values: dis_cid_mode en_cid_mode 
	parameter	cp_cons_sel = "cp_cons_default" ,		//Valid values: cp_cons_master cp_cons_slave_abv cp_cons_slave_blw cp_cons_default 
	parameter	cp_dwn_mstr = "true" ,		//Valid values: false true 
	parameter	cp_up_mstr = "true" ,		//Valid values: false true 
	parameter	ctrl_plane_bonding = "individual" ,		//Valid values: individual ctrl_master ctrl_slave_blw ctrl_slave_abv 
	parameter	data_mask_count = 16'b0000100111000100 ,		//Valid values: 16 
	parameter	data_mask_count_multi = 3'b001 ,		//Valid values: 3 
	parameter	dft_observation_clock_selection = "dft_clk_obsrv_tx0" ,		//Valid values: dft_clk_obsrv_tx0 dft_clk_obsrv_tx1 dft_clk_obsrv_tx2 dft_clk_obsrv_tx3 dft_clk_obsrv_tx4 dft_clk_obsrv_rx dft_clk_obsrv_hclk dft_clk_obsrv_fref dft_clk_obsrv_clklow dft_clk_obsrv_asn0 dft_clk_obsrv_asn1 
	parameter	early_eios_counter = 8'b00110010 ,		//Valid values: 8 
	parameter	force_freqdet = "force_freqdet_dis" ,		//Valid values: force_freqdet_dis force1_freqdet_en force0_freqdet_en 
	parameter	free_run_clk_enable = "true" ,		//Valid values: false true 
	parameter	ignore_sigdet_g23 = "false" ,		//Valid values: false true 
	parameter	pc_en_counter = 7'b0110111 ,		//Valid values: 7 
	parameter	pc_rst_counter = 5'b10111 ,		//Valid values: 5 
	parameter	pcie_hip_mode = "hip_disable" ,		//Valid values: hip_enable hip_disable 
	parameter	ph_fifo_reg_mode = "phfifo_reg_mode_dis" ,		//Valid values: phfifo_reg_mode_dis phfifo_reg_mode_en 
	parameter	phfifo_flush_wait = 6'b100100 ,		//Valid values: 6 
	parameter	pipe_if_g3pcs = "pipe_if_8gpcs" ,		//Valid values: pipe_if_g3pcs pipe_if_8gpcs 
	parameter	pma_done_counter = 18'b101010101110011000 ,		//Valid values: 18 
	parameter	pma_if_dft_en = "dft_dis" ,		//Valid values: dft_dis dft_en 
	parameter	pma_if_dft_val = "dft_0" ,		//Valid values: dft_0 dft_1 
	parameter	ppm_cnt_rst = "ppm_cnt_rst_dis" ,		//Valid values: ppm_cnt_rst_dis ppm_cnt_rst_en 
	parameter	ppm_deassert_early = "deassert_early_dis" ,		//Valid values: deassert_early_dis deassert_early_en 
	parameter	ppm_det_buckets = "ppm_100_bucket" ,		//Valid values: disable_prot ppm_300_bucket ppm_100_bucket ppm_300_100_bucket 
	parameter	ppm_gen1_2_cnt = "cnt_32k" ,		//Valid values: cnt_32k cnt_64k 
	parameter	ppm_post_eidle_delay = "cnt_200_cycles" ,		//Valid values: cnt_200_cycles cnt_400_cycles 
	parameter	ppmsel = "ppmsel_300" ,		//Valid values: ppmsel_disable ppmsel_5000 ppmsel_2500 ppmsel_1000 ppmsel_500 ppmsel_300 ppmsel_250 ppmsel_200 ppmsel_125 ppmsel_100 ppmsel_62p5 ppm_other 
	parameter	prot_mode = "disable_prot_mode" ,		//Valid values: disable_prot_mode pipe_g12 pipe_g3 other_protocols 
	parameter	reconfig_settings = "{}" ,		//Valid values:  
	parameter	rxvalid_mask = "rxvalid_mask_en" ,		//Valid values: rxvalid_mask_dis rxvalid_mask_en 
	parameter	sigdet_wait_counter = 12'b100111000100 ,		//Valid values: 12 
	parameter	sigdet_wait_counter_multi = 3'b001 ,		//Valid values: 3 
	parameter	silicon_rev = "20nm5es" ,		//Valid values: 20nm5es 20nm5es2 20nm4es 20nm4es2 20nm5 20nm4 20nm3 20nm2 20nm1 
	parameter	sim_mode = "disable" ,		//Valid values: disable enable 
	parameter	spd_chg_rst_wait_cnt_en = "true" ,		//Valid values: false true 
	parameter	sup_mode = "user_mode" ,		//Valid values: user_mode engineering_mode 
	parameter	testout_sel = "ppm_det_test" ,		//Valid values: ppm_det_test asn_test pma_pll_test rxpmaif_test prbs_gen_test prbs_ver_test uhsif_1_test uhsif_2_test uhsif_3_test 
	parameter	wait_clk_on_off_timer = 4'b0100 ,		//Valid values: 4 
	parameter	wait_pipe_synchronizing = 5'b10111 ,		//Valid values: 5 
	parameter	wait_send_syncp_fbkp = 11'b00011111010		//Valid values: 11 
)

(
	//Port declaration

	input	[8:0]  avmmaddress ,
	input	avmmclk ,
	input	avmmread ,
	input	avmmrstn ,
	input	avmmwrite ,
	input	[7:0]  avmmwritedata ,
	input	[17:0]  int_pmaif_8g_current_coeff ,
	input	[2:0]  int_pmaif_8g_eios_det ,
	input	int_pmaif_8g_pipe_tx_pma_rstn ,
	input	int_pmaif_8g_rev_lpbk ,
	input	int_pmaif_8g_tx_clk_out_gen3 ,
	input	int_pmaif_8g_txdetectrx ,
	input	[2:0]  int_pmaif_g3_eios_det ,
	input	[17:0]  int_pmaif_g3_pma_current_coeff ,
	input	[2:0]  int_pmaif_g3_pma_current_rxpreset ,
	input	int_pmaif_g3_pma_txdetectrx ,
	input	int_pmaif_g3_rev_lpbk ,
	input	int_pmaif_pldif_8g_tx_pld_rstn ,
	input	int_pmaif_pldif_adapt_start ,
	input	int_pmaif_pldif_atpg_los_en_n ,
	input	int_pmaif_pldif_csr_test_dis ,
	input	int_pmaif_pldif_early_eios ,
	input	[1:0]  int_pmaif_pldif_interface_select ,
	input	int_pmaif_pldif_ltd_b ,
	input	int_pmaif_pldif_ltr ,
	input	int_pmaif_pldif_nfrzdrv ,
	input	int_pmaif_pldif_nrpi_freeze ,
	input	[1:0]  int_pmaif_pldif_pcie_switch ,
	input	[4:0]  int_pmaif_pldif_pma_reserved_out ,
	input	int_pmaif_pldif_pma_scan_mode_n ,
	input	int_pmaif_pldif_pma_scan_shift_n ,
	input	int_pmaif_pldif_ppm_lock ,
	input	[1:0]  int_pmaif_pldif_rate ,
	input	int_pmaif_pldif_refclk_dig ,
	input	int_pmaif_pldif_rs_lpbk_b ,
	input	int_pmaif_pldif_rx_qpi_pullup ,
	input	int_pmaif_pldif_rxpma_rstb ,
	input	int_pmaif_pldif_tx_bitslip ,
	input	int_pmaif_pldif_tx_bonding_rstb ,
	input	int_pmaif_pldif_tx_pma_syncp_hip ,
	input	int_pmaif_pldif_tx_qpi_pulldn ,
	input	int_pmaif_pldif_tx_qpi_pullup ,
	input	int_pmaif_pldif_txdetectrx ,
	input	int_pmaif_scan_mode_n ,
	input	int_rx_dft_obsrv_clk ,
	input	[4:0]  int_tx_dft_obsrv_clk ,
	input	iocsr_clk ,
	input	[5:0]  iocsr_config ,
	input	iocsr_rdy ,
	input	iocsr_rdy_dly ,
	input	pma_adapt_done ,
	input	pma_clklow ,
	input	pma_fref ,
	input	pma_hclk ,
	input	[1:0]  pma_pcie_sw_done ,
	input	pma_pfdmode_lock ,
	input	[4:0]  pma_reserved_in ,
	input	pma_signal_det ,
	input	[7:0]  pma_testbus ,
	input	[11:0]  pmaif_bundling_in_down ,
	input	[11:0]  pmaif_bundling_in_up ,
	input	[19:0]  rx_pmaif_test_out ,
	input	[19:0]  rx_prbs_ver_test ,
	input	[19:0]  tx_prbs_gen_test ,
	input	[19:0]  uhsif_test_out_1 ,
	input	[19:0]  uhsif_test_out_2 ,
	input	[19:0]  uhsif_test_out_3 ,

	output	[7:0]  avmmreaddata ,
	output	blockselect ,
	output	sta_pma_hclk_by2 ,
	output	[8:0]  int_pmaif_8g_asn_bundling_in ,
	output	int_pmaif_8g_eios_detected ,
	output	int_pmaif_8g_inferred_rxvalid ,
	output	int_pmaif_8g_power_state_transition_done ,
	output	int_pmaif_avmm_iocsr_clk ,
	output	[5:0]  int_pmaif_avmm_iocsr_config ,
	output	int_pmaif_avmm_iocsr_rdy ,
	output	int_pmaif_avmm_iocsr_rdy_dly ,
	output	int_pmaif_g3_data_sel ,
	output	int_pmaif_g3_inferred_rxvalid ,
	output	[8:0]  int_pmaif_g3_pcs_asn_bundling_in ,
	output	int_pmaif_pldif_adapt_done ,
	output	int_pmaif_pldif_dft_obsrv_clk ,
	output	int_pmaif_pldif_mask_tx_pll ,
	output	[1:0]  int_pmaif_pldif_pcie_sw_done ,
	output	int_pmaif_pldif_pfdmode_lock ,
	output	int_pmaif_pldif_pma_clklow ,
	output	int_pmaif_pldif_pma_fref ,
	output	int_pmaif_pldif_pma_hclk ,
	output	[4:0]  int_pmaif_pldif_pma_reserved_in ,
	output	[19:0]  int_pmaif_pldif_test_out ,
	output	[7:0]  int_pmaif_pldif_testbus ,
	output	pma_adapt_start ,
	output	pma_atpg_los_en_n ,
	output	pma_csr_test_dis ,
	output	[17:0]  pma_current_coeff ,
	output	[2:0]  pma_current_rxpreset ,
	output	pma_early_eios ,
	output	[1:0]  pma_interface_select ,
	output	pma_ltd_b ,
	output	pma_ltr ,
	output	pma_nfrzdrv ,
	output	pma_nrpi_freeze ,
	output	[1:0]  pma_pcie_switch ,
	output	pma_ppm_lock ,
	output	[4:0]  pma_reserved_out ,
	output	pma_rs_lpbk_b ,
	output	pma_rx_qpi_pullup ,
	output	pma_scan_mode_n ,
	output	pma_scan_shift_n ,
	output	pma_tx_bitslip ,
	output	pma_tx_bonding_rstb ,
	output	pma_tx_pma_syncp ,
	output	pma_tx_qpi_pulldn ,
	output	pma_tx_qpi_pullup ,
	output	pma_tx_txdetectrx ,
	output	[11:0]  pmaif_bundling_out_down ,
	output	[11:0]  pmaif_bundling_out_up 

);


	twentynm_hssi_common_pcs_pma_interface_encrypted
	#(
		.enable_debug_info(enable_debug_info) ,

		.asn_clk_enable(asn_clk_enable) ,
		.asn_enable(asn_enable) ,
		.block_sel(block_sel) ,
		.bypass_early_eios(bypass_early_eios) ,
		.bypass_pcie_switch(bypass_pcie_switch) ,
		.bypass_pma_ltr(bypass_pma_ltr) ,
		.bypass_pma_sw_done(bypass_pma_sw_done) ,
		.bypass_ppm_lock(bypass_ppm_lock) ,
		.bypass_send_syncp_fbkp(bypass_send_syncp_fbkp) ,
		.bypass_txdetectrx(bypass_txdetectrx) ,
		.cdr_control(cdr_control) ,
		.cid_enable(cid_enable) ,
		.cp_cons_sel(cp_cons_sel) ,
		.cp_dwn_mstr(cp_dwn_mstr) ,
		.cp_up_mstr(cp_up_mstr) ,
		.ctrl_plane_bonding(ctrl_plane_bonding) ,
		.data_mask_count(data_mask_count) ,
		.data_mask_count_multi(data_mask_count_multi) ,
		.dft_observation_clock_selection(dft_observation_clock_selection) ,
		.early_eios_counter(early_eios_counter) ,
		.force_freqdet(force_freqdet) ,
		.free_run_clk_enable(free_run_clk_enable) ,
		.ignore_sigdet_g23(ignore_sigdet_g23) ,
		.pc_en_counter(pc_en_counter) ,
		.pc_rst_counter(pc_rst_counter) ,
		.pcie_hip_mode(pcie_hip_mode) ,
		.ph_fifo_reg_mode(ph_fifo_reg_mode) ,
		.phfifo_flush_wait(phfifo_flush_wait) ,
		.pipe_if_g3pcs(pipe_if_g3pcs) ,
		.pma_done_counter(pma_done_counter) ,
		.pma_if_dft_en(pma_if_dft_en) ,
		.pma_if_dft_val(pma_if_dft_val) ,
		.ppm_cnt_rst(ppm_cnt_rst) ,
		.ppm_deassert_early(ppm_deassert_early) ,
		.ppm_det_buckets(ppm_det_buckets) ,
		.ppm_gen1_2_cnt(ppm_gen1_2_cnt) ,
		.ppm_post_eidle_delay(ppm_post_eidle_delay) ,
		.ppmsel(ppmsel) ,
		.prot_mode(prot_mode) ,
		.reconfig_settings(reconfig_settings) ,
		.rxvalid_mask(rxvalid_mask) ,
		.sigdet_wait_counter(sigdet_wait_counter) ,
		.sigdet_wait_counter_multi(sigdet_wait_counter_multi) ,
		.silicon_rev(silicon_rev) ,
		.sim_mode(sim_mode) ,
		.spd_chg_rst_wait_cnt_en(spd_chg_rst_wait_cnt_en) ,
		.sup_mode(sup_mode) ,
		.testout_sel(testout_sel) ,
		.wait_clk_on_off_timer(wait_clk_on_off_timer) ,
		.wait_pipe_synchronizing(wait_pipe_synchronizing) ,
		.wait_send_syncp_fbkp(wait_send_syncp_fbkp)

	)
	twentynm_hssi_common_pcs_pma_interface_encrypted_inst (

		.avmmaddress(avmmaddress),
		.avmmclk(avmmclk),
		.avmmread(avmmread),
		.avmmrstn(avmmrstn),
		.avmmwrite(avmmwrite),
		.avmmwritedata(avmmwritedata),
		.int_pmaif_8g_current_coeff(int_pmaif_8g_current_coeff),
		.int_pmaif_8g_eios_det(int_pmaif_8g_eios_det),
		.int_pmaif_8g_pipe_tx_pma_rstn(int_pmaif_8g_pipe_tx_pma_rstn),
		.int_pmaif_8g_rev_lpbk(int_pmaif_8g_rev_lpbk),
		.int_pmaif_8g_tx_clk_out_gen3(int_pmaif_8g_tx_clk_out_gen3),
		.int_pmaif_8g_txdetectrx(int_pmaif_8g_txdetectrx),
		.int_pmaif_g3_eios_det(int_pmaif_g3_eios_det),
		.int_pmaif_g3_pma_current_coeff(int_pmaif_g3_pma_current_coeff),
		.int_pmaif_g3_pma_current_rxpreset(int_pmaif_g3_pma_current_rxpreset),
		.int_pmaif_g3_pma_txdetectrx(int_pmaif_g3_pma_txdetectrx),
		.int_pmaif_g3_rev_lpbk(int_pmaif_g3_rev_lpbk),
		.int_pmaif_pldif_8g_tx_pld_rstn(int_pmaif_pldif_8g_tx_pld_rstn),
		.int_pmaif_pldif_adapt_start(int_pmaif_pldif_adapt_start),
		.int_pmaif_pldif_atpg_los_en_n(int_pmaif_pldif_atpg_los_en_n),
		.int_pmaif_pldif_csr_test_dis(int_pmaif_pldif_csr_test_dis),
		.int_pmaif_pldif_early_eios(int_pmaif_pldif_early_eios),
		.int_pmaif_pldif_interface_select(int_pmaif_pldif_interface_select),
		.int_pmaif_pldif_ltd_b(int_pmaif_pldif_ltd_b),
		.int_pmaif_pldif_ltr(int_pmaif_pldif_ltr),
		.int_pmaif_pldif_nfrzdrv(int_pmaif_pldif_nfrzdrv),
		.int_pmaif_pldif_nrpi_freeze(int_pmaif_pldif_nrpi_freeze),
		.int_pmaif_pldif_pcie_switch(int_pmaif_pldif_pcie_switch),
		.int_pmaif_pldif_pma_reserved_out(int_pmaif_pldif_pma_reserved_out),
		.int_pmaif_pldif_pma_scan_mode_n(int_pmaif_pldif_pma_scan_mode_n),
		.int_pmaif_pldif_pma_scan_shift_n(int_pmaif_pldif_pma_scan_shift_n),
		.int_pmaif_pldif_ppm_lock(int_pmaif_pldif_ppm_lock),
		.int_pmaif_pldif_rate(int_pmaif_pldif_rate),
		.int_pmaif_pldif_refclk_dig(int_pmaif_pldif_refclk_dig),
		.int_pmaif_pldif_rs_lpbk_b(int_pmaif_pldif_rs_lpbk_b),
		.int_pmaif_pldif_rx_qpi_pullup(int_pmaif_pldif_rx_qpi_pullup),
		.int_pmaif_pldif_rxpma_rstb(int_pmaif_pldif_rxpma_rstb),
		.int_pmaif_pldif_tx_bitslip(int_pmaif_pldif_tx_bitslip),
		.int_pmaif_pldif_tx_bonding_rstb(int_pmaif_pldif_tx_bonding_rstb),
		.int_pmaif_pldif_tx_pma_syncp_hip(int_pmaif_pldif_tx_pma_syncp_hip),
		.int_pmaif_pldif_tx_qpi_pulldn(int_pmaif_pldif_tx_qpi_pulldn),
		.int_pmaif_pldif_tx_qpi_pullup(int_pmaif_pldif_tx_qpi_pullup),
		.int_pmaif_pldif_txdetectrx(int_pmaif_pldif_txdetectrx),
		.int_pmaif_scan_mode_n(int_pmaif_scan_mode_n),
		.int_rx_dft_obsrv_clk(int_rx_dft_obsrv_clk),
		.int_tx_dft_obsrv_clk(int_tx_dft_obsrv_clk),
		.iocsr_clk(iocsr_clk),
		.iocsr_config(iocsr_config),
		.iocsr_rdy(iocsr_rdy),
		.iocsr_rdy_dly(iocsr_rdy_dly),
		.pma_adapt_done(pma_adapt_done),
		.pma_clklow(pma_clklow),
		.pma_fref(pma_fref),
		.pma_hclk(pma_hclk),
		.pma_pcie_sw_done(pma_pcie_sw_done),
		.pma_pfdmode_lock(pma_pfdmode_lock),
		.pma_reserved_in(pma_reserved_in),
		.pma_signal_det(pma_signal_det),
		.pma_testbus(pma_testbus),
		.pmaif_bundling_in_down(pmaif_bundling_in_down),
		.pmaif_bundling_in_up(pmaif_bundling_in_up),
		.rx_pmaif_test_out(rx_pmaif_test_out),
		.rx_prbs_ver_test(rx_prbs_ver_test),
		.tx_prbs_gen_test(tx_prbs_gen_test),
		.uhsif_test_out_1(uhsif_test_out_1),
		.uhsif_test_out_2(uhsif_test_out_2),
		.uhsif_test_out_3(uhsif_test_out_3),
		.avmmreaddata(avmmreaddata),
		.blockselect(blockselect),
		.sta_pma_hclk_by2(sta_pma_hclk_by2),
		.int_pmaif_8g_asn_bundling_in(int_pmaif_8g_asn_bundling_in),
		.int_pmaif_8g_eios_detected(int_pmaif_8g_eios_detected),
		.int_pmaif_8g_inferred_rxvalid(int_pmaif_8g_inferred_rxvalid),
		.int_pmaif_8g_power_state_transition_done(int_pmaif_8g_power_state_transition_done),
		.int_pmaif_avmm_iocsr_clk(int_pmaif_avmm_iocsr_clk),
		.int_pmaif_avmm_iocsr_config(int_pmaif_avmm_iocsr_config),
		.int_pmaif_avmm_iocsr_rdy(int_pmaif_avmm_iocsr_rdy),
		.int_pmaif_avmm_iocsr_rdy_dly(int_pmaif_avmm_iocsr_rdy_dly),
		.int_pmaif_g3_data_sel(int_pmaif_g3_data_sel),
		.int_pmaif_g3_inferred_rxvalid(int_pmaif_g3_inferred_rxvalid),
		.int_pmaif_g3_pcs_asn_bundling_in(int_pmaif_g3_pcs_asn_bundling_in),
		.int_pmaif_pldif_adapt_done(int_pmaif_pldif_adapt_done),
		.int_pmaif_pldif_dft_obsrv_clk(int_pmaif_pldif_dft_obsrv_clk),
		.int_pmaif_pldif_mask_tx_pll(int_pmaif_pldif_mask_tx_pll),
		.int_pmaif_pldif_pcie_sw_done(int_pmaif_pldif_pcie_sw_done),
		.int_pmaif_pldif_pfdmode_lock(int_pmaif_pldif_pfdmode_lock),
		.int_pmaif_pldif_pma_clklow(int_pmaif_pldif_pma_clklow),
		.int_pmaif_pldif_pma_fref(int_pmaif_pldif_pma_fref),
		.int_pmaif_pldif_pma_hclk(int_pmaif_pldif_pma_hclk),
		.int_pmaif_pldif_pma_reserved_in(int_pmaif_pldif_pma_reserved_in),
		.int_pmaif_pldif_test_out(int_pmaif_pldif_test_out),
		.int_pmaif_pldif_testbus(int_pmaif_pldif_testbus),
		.pma_adapt_start(pma_adapt_start),
		.pma_atpg_los_en_n(pma_atpg_los_en_n),
		.pma_csr_test_dis(pma_csr_test_dis),
		.pma_current_coeff(pma_current_coeff),
		.pma_current_rxpreset(pma_current_rxpreset),
		.pma_early_eios(pma_early_eios),
		.pma_interface_select(pma_interface_select),
		.pma_ltd_b(pma_ltd_b),
		.pma_ltr(pma_ltr),
		.pma_nfrzdrv(pma_nfrzdrv),
		.pma_nrpi_freeze(pma_nrpi_freeze),
		.pma_pcie_switch(pma_pcie_switch),
		.pma_ppm_lock(pma_ppm_lock),
		.pma_reserved_out(pma_reserved_out),
		.pma_rs_lpbk_b(pma_rs_lpbk_b),
		.pma_rx_qpi_pullup(pma_rx_qpi_pullup),
		.pma_scan_mode_n(pma_scan_mode_n),
		.pma_scan_shift_n(pma_scan_shift_n),
		.pma_tx_bitslip(pma_tx_bitslip),
		.pma_tx_bonding_rstb(pma_tx_bonding_rstb),
		.pma_tx_pma_syncp(pma_tx_pma_syncp),
		.pma_tx_qpi_pulldn(pma_tx_qpi_pulldn),
		.pma_tx_qpi_pullup(pma_tx_qpi_pullup),
		.pma_tx_txdetectrx(pma_tx_txdetectrx),
		.pmaif_bundling_out_down(pmaif_bundling_out_down),
		.pmaif_bundling_out_up(pmaif_bundling_out_up)

	);

endmodule
// -----------------------------------------------------------
// This is auto-generated HSSI Simulation Atom Model Encryption Wrapper
// Module Name : work/twentynm_hssi_common_pld_pcs_interface_wrapper.v
// -----------------------------------------------------------

`timescale 1 ps/1 ps

module twentynm_hssi_common_pld_pcs_interface
#(
	// Parameter declaration and default value assignment

	parameter enable_debug_info = "true",	//Valid values: false|true; this is simulation-only parameter, for debug purpose only

	parameter	dft_clk_out_en = "dft_clk_out_disable" ,		//Valid values: dft_clk_out_disable dft_clk_out_enable 
	parameter	dft_clk_out_sel = "teng_rx_dft_clk" ,		//Valid values: teng_rx_dft_clk teng_tx_dft_clk eightg_rx_dft_clk eightg_tx_dft_clk pmaif_dft_clk 
	parameter	hrdrstctrl_en = "hrst_dis" ,		//Valid values: hrst_dis hrst_en 
	parameter	pcs_testbus_block_sel = "eightg" ,		//Valid values: eightg g3pcs teng krfec pma_if 
	parameter	reconfig_settings = "{}" ,		//Valid values:  
	parameter	silicon_rev = "20nm5es"		//Valid values: 20nm5es 20nm5es2 20nm4es 20nm4es2 20nm5 20nm4 20nm3 20nm2 20nm1 
)

(
	//Port declaration

	input	[8:0]  avmmaddress ,
	input	avmmclk ,
	input	avmmread ,
	input	avmmrstn ,
	input	avmmwrite ,
	input	[7:0]  avmmwritedata ,
	input	int_pldif_10g_rx_dft_clk_out ,
	input	[19:0]  int_pldif_10g_test_data ,
	input	int_pldif_10g_tx_dft_clk_out ,
	input	[19:0]  int_pldif_8g_chnl_test_bus_out ,
	input	int_pldif_8g_rx_clk_to_observation_ff_in_pld_if ,
	input	int_pldif_8g_tx_clk_to_observation_ff_in_pld_if ,
	input	[4:0]  int_pldif_avmm_refclk_dig_en ,
	input	[19:0]  int_pldif_g3_test_out ,
	input	[19:0]  int_pldif_krfec_test_data ,
	input	int_pldif_pmaif_adapt_done ,
	input	int_pldif_pmaif_mask_tx_pll ,
	input	[1:0]  int_pldif_pmaif_pcie_sw_done ,
	input	int_pldif_pmaif_pfdmode_lock ,
	input	int_pldif_pmaif_pma_clklow ,
	input	int_pldif_pmaif_pma_fref ,
	input	int_pldif_pmaif_pma_hclk ,
	input	[4:0]  int_pldif_pmaif_pma_reserved_in ,
	input	int_pldif_pmaif_rx_detect_valid ,
	input	int_pldif_pmaif_rx_found ,
	input	int_pldif_pmaif_rxpll_lock ,
	input	[19:0]  int_pldif_pmaif_test_out ,
	input	[7:0]  int_pldif_pmaif_testbus ,
	input	int_pldif_pmaif_uhsif_lock ,
	input	int_pmaif_pldif_dft_obsrv_clk ,
	input	int_pmaif_pldif_uhsif_scan_chain_out ,
	input	[2:0]  pld_8g_eidleinfersel ,
	input	pld_8g_refclk_dig2 ,
	input	pld_atpg_los_en_n ,
	input	[17:0]  pld_g3_current_coeff ,
	input	[2:0]  pld_g3_current_rxpreset ,
	input	pld_ltr ,
	input	pld_mem_krfec_atpg_rst_n ,
	input	pld_partial_reconfig ,
	input	pld_pcs_refclk_dig ,
	input	pld_pma_adapt_start ,
	input	pld_pma_csr_test_dis ,
	input	pld_pma_early_eios ,
	input	[5:0]  pld_pma_eye_monitor ,
	input	pld_pma_ltd_b ,
	input	pld_pma_nrpi_freeze ,
	input	[1:0]  pld_pma_pcie_switch ,
	input	pld_pma_ppm_lock ,
	input	[4:0]  pld_pma_reserved_out ,
	input	pld_pma_rs_lpbk_b ,
	input	pld_pma_rx_qpi_pullup ,
	input	pld_pma_tx_bitslip ,
	input	pld_pma_tx_bonding_rstb ,
	input	pld_pma_tx_qpi_pulldn ,
	input	pld_pma_tx_qpi_pullup ,
	input	pld_pma_txdetectrx ,
	input	[1:0]  pld_rate ,
	input	[9:0]  pld_reserved_in ,
	input	pld_scan_mode_n ,
	input	pld_scan_shift_n ,

	output	[7:0]  avmmreaddata ,
	output	blockselect ,
	output	pld_8g_eidleinfersel_fifo ,
	output	pld_8g_eidleinfersel_reg ,
	output	pld_partial_reconfig_fifo ,
	output	pld_partial_reconfig_rx_div_by_2_rxclk_wire ,
	output	pld_partial_reconfig_rx_div_by_2_txclk_wire ,
	output	pld_partial_reconfig_rxclk_reg ,
	output	pld_partial_reconfig_tx_div_by_2_wire ,
	output	pld_partial_reconfig_txclk_reg ,
	output	pld_rate_reg ,
	output	pld_test_data_reg ,
	output	[1:0]  hip_cmn_clk ,
	output	[5:0]  hip_cmn_ctrl ,
	output	hip_iocsr_rdy ,
	output	hip_iocsr_rdy_dly ,
	output	hip_nfrzdrv ,
	output	hip_npor ,
	output	hip_usermode ,
	output	int_pldif_10g_refclk_dig ,
	output	int_pldif_10g_scan_mode_n ,
	output	[2:0]  int_pldif_8g_eidleinfersel ,
	output	int_pldif_8g_ltr ,
	output	int_pldif_8g_refclk_dig ,
	output	int_pldif_8g_refclk_dig2 ,
	output	int_pldif_8g_scan_mode_n ,
	output	int_pldif_avmm_pld_avmm1_request ,
	output	int_pldif_avmm_pld_avmm2_request ,
	output	[17:0]  int_pldif_g3_current_coeff ,
	output	[2:0]  int_pldif_g3_current_rxpreset ,
	output	int_pldif_g3_scan_mode_n ,
	output	int_pldif_krfec_refclk_dig ,
	output	int_pldif_krfec_scan_mode_n ,
	output	int_pldif_krfec_scan_rst_n ,
	output	int_pldif_mem_atpg_rst_n ,
	output	int_pldif_mem_scan_mode_n ,
	output	int_pldif_pmaif_adapt_start ,
	output	int_pldif_pmaif_atpg_los_en_n ,
	output	int_pldif_pmaif_csr_test_dis ,
	output	int_pldif_pmaif_early_eios ,
	output	[5:0]  int_pldif_pmaif_eye_monitor ,
	output	int_pldif_pmaif_ltd_b ,
	output	int_pldif_pmaif_ltr ,
	output	int_pldif_pmaif_nfrzdrv ,
	output	int_pldif_pmaif_nrpi_freeze ,
	output	[1:0]  int_pldif_pmaif_pcie_switch ,
	output	[4:0]  int_pldif_pmaif_pma_reserved_out ,
	output	int_pldif_pmaif_pma_scan_mode_n ,
	output	int_pldif_pmaif_pma_scan_shift_n ,
	output	int_pldif_pmaif_ppm_lock ,
	output	[1:0]  int_pldif_pmaif_rate ,
	output	int_pldif_pmaif_refclk_dig ,
	output	int_pldif_pmaif_rs_lpbk_b ,
	output	int_pldif_pmaif_rx_qpi_pullup ,
	output	int_pldif_pmaif_scan_mode_n ,
	output	int_pldif_pmaif_tx_bitslip ,
	output	int_pldif_pmaif_tx_bonding_rstb ,
	output	int_pldif_pmaif_tx_pma_syncp_hip ,
	output	int_pldif_pmaif_tx_qpi_pulldn ,
	output	int_pldif_pmaif_tx_qpi_pullup ,
	output	int_pldif_pmaif_txdetectrx ,
	output	int_pldif_pmaif_uhsif_refclk_dig ,
	output	int_pldif_usr_rst_sel ,
	output	int_pmaif_pldif_uhsif_scan_chain_in ,
	output	pld_pma_adapt_done ,
	output	pld_pma_clklow ,
	output	pld_pma_fref ,
	output	pld_pma_hclk ,
	output	[1:0]  pld_pma_pcie_sw_done ,
	output	pld_pma_pfdmode_lock ,
	output	[4:0]  pld_pma_reserved_in ,
	output	pld_pma_rx_detect_valid ,
	output	pld_pma_rx_found ,
	output	pld_pma_rxpll_lock ,
	output	[7:0]  pld_pma_testbus ,
	output	pld_pmaif_mask_tx_pll ,
	output	[9:0]  pld_reserved_out ,
	output	[19:0]  pld_test_data ,
	output	pld_uhsif_lock ,
	output	scan_mode_n 

);


	twentynm_hssi_common_pld_pcs_interface_encrypted
	#(
		.enable_debug_info(enable_debug_info) ,

		.dft_clk_out_en(dft_clk_out_en) ,
		.dft_clk_out_sel(dft_clk_out_sel) ,
		.hrdrstctrl_en(hrdrstctrl_en) ,
		.pcs_testbus_block_sel(pcs_testbus_block_sel) ,
		.reconfig_settings(reconfig_settings) ,
		.silicon_rev(silicon_rev)

	)
	twentynm_hssi_common_pld_pcs_interface_encrypted_inst (

		.avmmaddress(avmmaddress),
		.avmmclk(avmmclk),
		.avmmread(avmmread),
		.avmmrstn(avmmrstn),
		.avmmwrite(avmmwrite),
		.avmmwritedata(avmmwritedata),
		.int_pldif_10g_rx_dft_clk_out(int_pldif_10g_rx_dft_clk_out),
		.int_pldif_10g_test_data(int_pldif_10g_test_data),
		.int_pldif_10g_tx_dft_clk_out(int_pldif_10g_tx_dft_clk_out),
		.int_pldif_8g_chnl_test_bus_out(int_pldif_8g_chnl_test_bus_out),
		.int_pldif_8g_rx_clk_to_observation_ff_in_pld_if(int_pldif_8g_rx_clk_to_observation_ff_in_pld_if),
		.int_pldif_8g_tx_clk_to_observation_ff_in_pld_if(int_pldif_8g_tx_clk_to_observation_ff_in_pld_if),
		.int_pldif_avmm_refclk_dig_en(int_pldif_avmm_refclk_dig_en),
		.int_pldif_g3_test_out(int_pldif_g3_test_out),
		.int_pldif_krfec_test_data(int_pldif_krfec_test_data),
		.int_pldif_pmaif_adapt_done(int_pldif_pmaif_adapt_done),
		.int_pldif_pmaif_mask_tx_pll(int_pldif_pmaif_mask_tx_pll),
		.int_pldif_pmaif_pcie_sw_done(int_pldif_pmaif_pcie_sw_done),
		.int_pldif_pmaif_pfdmode_lock(int_pldif_pmaif_pfdmode_lock),
		.int_pldif_pmaif_pma_clklow(int_pldif_pmaif_pma_clklow),
		.int_pldif_pmaif_pma_fref(int_pldif_pmaif_pma_fref),
		.int_pldif_pmaif_pma_hclk(int_pldif_pmaif_pma_hclk),
		.int_pldif_pmaif_pma_reserved_in(int_pldif_pmaif_pma_reserved_in),
		.int_pldif_pmaif_rx_detect_valid(int_pldif_pmaif_rx_detect_valid),
		.int_pldif_pmaif_rx_found(int_pldif_pmaif_rx_found),
		.int_pldif_pmaif_rxpll_lock(int_pldif_pmaif_rxpll_lock),
		.int_pldif_pmaif_test_out(int_pldif_pmaif_test_out),
		.int_pldif_pmaif_testbus(int_pldif_pmaif_testbus),
		.int_pldif_pmaif_uhsif_lock(int_pldif_pmaif_uhsif_lock),
		.int_pmaif_pldif_dft_obsrv_clk(int_pmaif_pldif_dft_obsrv_clk),
		.int_pmaif_pldif_uhsif_scan_chain_out(int_pmaif_pldif_uhsif_scan_chain_out),
		.pld_8g_eidleinfersel(pld_8g_eidleinfersel),
		.pld_8g_refclk_dig2(pld_8g_refclk_dig2),
		.pld_atpg_los_en_n(pld_atpg_los_en_n),
		.pld_g3_current_coeff(pld_g3_current_coeff),
		.pld_g3_current_rxpreset(pld_g3_current_rxpreset),
		.pld_ltr(pld_ltr),
		.pld_mem_krfec_atpg_rst_n(pld_mem_krfec_atpg_rst_n),
		.pld_partial_reconfig(pld_partial_reconfig),
		.pld_pcs_refclk_dig(pld_pcs_refclk_dig),
		.pld_pma_adapt_start(pld_pma_adapt_start),
		.pld_pma_csr_test_dis(pld_pma_csr_test_dis),
		.pld_pma_early_eios(pld_pma_early_eios),
		.pld_pma_eye_monitor(pld_pma_eye_monitor),
		.pld_pma_ltd_b(pld_pma_ltd_b),
		.pld_pma_nrpi_freeze(pld_pma_nrpi_freeze),
		.pld_pma_pcie_switch(pld_pma_pcie_switch),
		.pld_pma_ppm_lock(pld_pma_ppm_lock),
		.pld_pma_reserved_out(pld_pma_reserved_out),
		.pld_pma_rs_lpbk_b(pld_pma_rs_lpbk_b),
		.pld_pma_rx_qpi_pullup(pld_pma_rx_qpi_pullup),
		.pld_pma_tx_bitslip(pld_pma_tx_bitslip),
		.pld_pma_tx_bonding_rstb(pld_pma_tx_bonding_rstb),
		.pld_pma_tx_qpi_pulldn(pld_pma_tx_qpi_pulldn),
		.pld_pma_tx_qpi_pullup(pld_pma_tx_qpi_pullup),
		.pld_pma_txdetectrx(pld_pma_txdetectrx),
		.pld_rate(pld_rate),
		.pld_reserved_in(pld_reserved_in),
		.pld_scan_mode_n(pld_scan_mode_n),
		.pld_scan_shift_n(pld_scan_shift_n),
		.avmmreaddata(avmmreaddata),
		.blockselect(blockselect),
		.pld_8g_eidleinfersel_fifo(pld_8g_eidleinfersel_fifo),
		.pld_8g_eidleinfersel_reg(pld_8g_eidleinfersel_reg),
		.pld_partial_reconfig_fifo(pld_partial_reconfig_fifo),
		.pld_partial_reconfig_rx_div_by_2_rxclk_wire(pld_partial_reconfig_rx_div_by_2_rxclk_wire),
		.pld_partial_reconfig_rx_div_by_2_txclk_wire(pld_partial_reconfig_rx_div_by_2_txclk_wire),
		.pld_partial_reconfig_rxclk_reg(pld_partial_reconfig_rxclk_reg),
		.pld_partial_reconfig_tx_div_by_2_wire(pld_partial_reconfig_tx_div_by_2_wire),
		.pld_partial_reconfig_txclk_reg(pld_partial_reconfig_txclk_reg),
		.pld_rate_reg(pld_rate_reg),
		.pld_test_data_reg(pld_test_data_reg),
		.hip_cmn_clk(hip_cmn_clk),
		.hip_cmn_ctrl(hip_cmn_ctrl),
		.hip_iocsr_rdy(hip_iocsr_rdy),
		.hip_iocsr_rdy_dly(hip_iocsr_rdy_dly),
		.hip_nfrzdrv(hip_nfrzdrv),
		.hip_npor(hip_npor),
		.hip_usermode(hip_usermode),
		.int_pldif_10g_refclk_dig(int_pldif_10g_refclk_dig),
		.int_pldif_10g_scan_mode_n(int_pldif_10g_scan_mode_n),
		.int_pldif_8g_eidleinfersel(int_pldif_8g_eidleinfersel),
		.int_pldif_8g_ltr(int_pldif_8g_ltr),
		.int_pldif_8g_refclk_dig(int_pldif_8g_refclk_dig),
		.int_pldif_8g_refclk_dig2(int_pldif_8g_refclk_dig2),
		.int_pldif_8g_scan_mode_n(int_pldif_8g_scan_mode_n),
		.int_pldif_avmm_pld_avmm1_request(int_pldif_avmm_pld_avmm1_request),
		.int_pldif_avmm_pld_avmm2_request(int_pldif_avmm_pld_avmm2_request),
		.int_pldif_g3_current_coeff(int_pldif_g3_current_coeff),
		.int_pldif_g3_current_rxpreset(int_pldif_g3_current_rxpreset),
		.int_pldif_g3_scan_mode_n(int_pldif_g3_scan_mode_n),
		.int_pldif_krfec_refclk_dig(int_pldif_krfec_refclk_dig),
		.int_pldif_krfec_scan_mode_n(int_pldif_krfec_scan_mode_n),
		.int_pldif_krfec_scan_rst_n(int_pldif_krfec_scan_rst_n),
		.int_pldif_mem_atpg_rst_n(int_pldif_mem_atpg_rst_n),
		.int_pldif_mem_scan_mode_n(int_pldif_mem_scan_mode_n),
		.int_pldif_pmaif_adapt_start(int_pldif_pmaif_adapt_start),
		.int_pldif_pmaif_atpg_los_en_n(int_pldif_pmaif_atpg_los_en_n),
		.int_pldif_pmaif_csr_test_dis(int_pldif_pmaif_csr_test_dis),
		.int_pldif_pmaif_early_eios(int_pldif_pmaif_early_eios),
		.int_pldif_pmaif_eye_monitor(int_pldif_pmaif_eye_monitor),
		.int_pldif_pmaif_ltd_b(int_pldif_pmaif_ltd_b),
		.int_pldif_pmaif_ltr(int_pldif_pmaif_ltr),
		.int_pldif_pmaif_nfrzdrv(int_pldif_pmaif_nfrzdrv),
		.int_pldif_pmaif_nrpi_freeze(int_pldif_pmaif_nrpi_freeze),
		.int_pldif_pmaif_pcie_switch(int_pldif_pmaif_pcie_switch),
		.int_pldif_pmaif_pma_reserved_out(int_pldif_pmaif_pma_reserved_out),
		.int_pldif_pmaif_pma_scan_mode_n(int_pldif_pmaif_pma_scan_mode_n),
		.int_pldif_pmaif_pma_scan_shift_n(int_pldif_pmaif_pma_scan_shift_n),
		.int_pldif_pmaif_ppm_lock(int_pldif_pmaif_ppm_lock),
		.int_pldif_pmaif_rate(int_pldif_pmaif_rate),
		.int_pldif_pmaif_refclk_dig(int_pldif_pmaif_refclk_dig),
		.int_pldif_pmaif_rs_lpbk_b(int_pldif_pmaif_rs_lpbk_b),
		.int_pldif_pmaif_rx_qpi_pullup(int_pldif_pmaif_rx_qpi_pullup),
		.int_pldif_pmaif_scan_mode_n(int_pldif_pmaif_scan_mode_n),
		.int_pldif_pmaif_tx_bitslip(int_pldif_pmaif_tx_bitslip),
		.int_pldif_pmaif_tx_bonding_rstb(int_pldif_pmaif_tx_bonding_rstb),
		.int_pldif_pmaif_tx_pma_syncp_hip(int_pldif_pmaif_tx_pma_syncp_hip),
		.int_pldif_pmaif_tx_qpi_pulldn(int_pldif_pmaif_tx_qpi_pulldn),
		.int_pldif_pmaif_tx_qpi_pullup(int_pldif_pmaif_tx_qpi_pullup),
		.int_pldif_pmaif_txdetectrx(int_pldif_pmaif_txdetectrx),
		.int_pldif_pmaif_uhsif_refclk_dig(int_pldif_pmaif_uhsif_refclk_dig),
		.int_pldif_usr_rst_sel(int_pldif_usr_rst_sel),
		.int_pmaif_pldif_uhsif_scan_chain_in(int_pmaif_pldif_uhsif_scan_chain_in),
		.pld_pma_adapt_done(pld_pma_adapt_done),
		.pld_pma_clklow(pld_pma_clklow),
		.pld_pma_fref(pld_pma_fref),
		.pld_pma_hclk(pld_pma_hclk),
		.pld_pma_pcie_sw_done(pld_pma_pcie_sw_done),
		.pld_pma_pfdmode_lock(pld_pma_pfdmode_lock),
		.pld_pma_reserved_in(pld_pma_reserved_in),
		.pld_pma_rx_detect_valid(pld_pma_rx_detect_valid),
		.pld_pma_rx_found(pld_pma_rx_found),
		.pld_pma_rxpll_lock(pld_pma_rxpll_lock),
		.pld_pma_testbus(pld_pma_testbus),
		.pld_pmaif_mask_tx_pll(pld_pmaif_mask_tx_pll),
		.pld_reserved_out(pld_reserved_out),
		.pld_test_data(pld_test_data),
		.pld_uhsif_lock(pld_uhsif_lock),
		.scan_mode_n(scan_mode_n)

	);

endmodule
// -----------------------------------------------------------
// This is auto-generated HSSI Simulation Atom Model Encryption Wrapper
// Module Name : work/twentynm_hssi_fifo_rx_pcs_wrapper.v
// -----------------------------------------------------------

`timescale 1 ps/1 ps

module twentynm_hssi_fifo_rx_pcs
#(
	// Parameter declaration and default value assignment

	parameter enable_debug_info = "true",	//Valid values: false|true; this is simulation-only parameter, for debug purpose only

	parameter	double_read_mode = "double_read_dis" ,		//Valid values: double_read_en double_read_dis 
	parameter	prot_mode = "teng_mode" ,		//Valid values: teng_mode non_teng_mode 
	parameter	silicon_rev = "20nm5es"		//Valid values: 20nm5es 20nm5es2 20nm4es 20nm4es2 20nm5 20nm4 20nm3 20nm2 20nm1 
)

(
	//Port declaration

	input	[8:0]  avmmaddress ,
	input	avmmclk ,
	input	avmmread ,
	input	avmmrstn ,
	input	avmmwrite ,
	input	[7:0]  avmmwritedata ,
	input	atpg_rst_n ,
	input	[73:0]  data_in_10g ,
	input	[31:0]  data_in_8g_clock_comp ,
	input	[79:0]  data_in_8g_phase_comp ,
	input	[39:0]  data_in_gen3 ,
	input	hard_reset_n ,
	input	[31:0]  rd_ptr2_10g ,
	input	[19:0]  rd_ptr2_8g_clock_comp ,
	input	[31:0]  rd_ptr_10g ,
	input	[19:0]  rd_ptr_8g_clock_comp ,
	input	[7:0]  rd_ptr_8g_phase_comp ,
	input	[15:0]  rd_ptr_gen3 ,
	input	scan_mode_n ,
	input	wr_clk_10g ,
	input	wr_clk_8g_clock_comp_dw ,
	input	wr_clk_8g_clock_comp_sw ,
	input	wr_clk_8g_phase_comp_dw ,
	input	wr_clk_8g_phase_comp_sw ,
	input	wr_clk_gen3 ,
	input	wr_en_10g ,
	input	wr_en_8g_clock_comp ,
	input	wr_en_8g_phase_comp ,
	input	wr_en_gen3 ,
	input	[31:0]  wr_ptr_10g ,
	input	[19:0]  wr_ptr_8g_clock_comp ,
	input	[7:0]  wr_ptr_8g_phase_comp ,
	input	[15:0]  wr_ptr_gen3 ,
	input	wr_rst_n_10g ,
	input	wr_rst_n_8g_clock_comp ,
	input	wr_rst_n_8g_phase_comp ,
	input	wr_rst_n_gen3 ,

	output	[7:0]  avmmreaddata ,
	output	blockselect ,
	output	[73:0]  data_out2_10g ,
	output	[31:0]  data_out2_8g_clock_comp ,
	output	[73:0]  data_out_10g ,
	output	[31:0]  data_out_8g_clock_comp ,
	output	[79:0]  data_out_8g_phase_comp ,
	output	[39:0]  data_out_gen3 

);


	twentynm_hssi_fifo_rx_pcs_encrypted
	#(
		.enable_debug_info(enable_debug_info) ,

		.double_read_mode(double_read_mode) ,
		.prot_mode(prot_mode) ,
		.silicon_rev(silicon_rev)

	)
	twentynm_hssi_fifo_rx_pcs_encrypted_inst (

		.avmmaddress(avmmaddress),
		.avmmclk(avmmclk),
		.avmmread(avmmread),
		.avmmrstn(avmmrstn),
		.avmmwrite(avmmwrite),
		.avmmwritedata(avmmwritedata),
		.atpg_rst_n(atpg_rst_n),
		.data_in_10g(data_in_10g),
		.data_in_8g_clock_comp(data_in_8g_clock_comp),
		.data_in_8g_phase_comp(data_in_8g_phase_comp),
		.data_in_gen3(data_in_gen3),
		.hard_reset_n(hard_reset_n),
		.rd_ptr2_10g(rd_ptr2_10g),
		.rd_ptr2_8g_clock_comp(rd_ptr2_8g_clock_comp),
		.rd_ptr_10g(rd_ptr_10g),
		.rd_ptr_8g_clock_comp(rd_ptr_8g_clock_comp),
		.rd_ptr_8g_phase_comp(rd_ptr_8g_phase_comp),
		.rd_ptr_gen3(rd_ptr_gen3),
		.scan_mode_n(scan_mode_n),
		.wr_clk_10g(wr_clk_10g),
		.wr_clk_8g_clock_comp_dw(wr_clk_8g_clock_comp_dw),
		.wr_clk_8g_clock_comp_sw(wr_clk_8g_clock_comp_sw),
		.wr_clk_8g_phase_comp_dw(wr_clk_8g_phase_comp_dw),
		.wr_clk_8g_phase_comp_sw(wr_clk_8g_phase_comp_sw),
		.wr_clk_gen3(wr_clk_gen3),
		.wr_en_10g(wr_en_10g),
		.wr_en_8g_clock_comp(wr_en_8g_clock_comp),
		.wr_en_8g_phase_comp(wr_en_8g_phase_comp),
		.wr_en_gen3(wr_en_gen3),
		.wr_ptr_10g(wr_ptr_10g),
		.wr_ptr_8g_clock_comp(wr_ptr_8g_clock_comp),
		.wr_ptr_8g_phase_comp(wr_ptr_8g_phase_comp),
		.wr_ptr_gen3(wr_ptr_gen3),
		.wr_rst_n_10g(wr_rst_n_10g),
		.wr_rst_n_8g_clock_comp(wr_rst_n_8g_clock_comp),
		.wr_rst_n_8g_phase_comp(wr_rst_n_8g_phase_comp),
		.wr_rst_n_gen3(wr_rst_n_gen3),
		.avmmreaddata(avmmreaddata),
		.blockselect(blockselect),
		.data_out2_10g(data_out2_10g),
		.data_out2_8g_clock_comp(data_out2_8g_clock_comp),
		.data_out_10g(data_out_10g),
		.data_out_8g_clock_comp(data_out_8g_clock_comp),
		.data_out_8g_phase_comp(data_out_8g_phase_comp),
		.data_out_gen3(data_out_gen3)

	);

endmodule
// -----------------------------------------------------------
// This is auto-generated HSSI Simulation Atom Model Encryption Wrapper
// Module Name : work/twentynm_hssi_fifo_tx_pcs_wrapper.v
// -----------------------------------------------------------

`timescale 1 ps/1 ps

module twentynm_hssi_fifo_tx_pcs
#(
	// Parameter declaration and default value assignment

	parameter enable_debug_info = "true",	//Valid values: false|true; this is simulation-only parameter, for debug purpose only

	parameter	double_write_mode = "double_write_dis" ,		//Valid values: double_write_en double_write_dis 
	parameter	prot_mode = "teng_mode" ,		//Valid values: teng_mode non_teng_mode 
	parameter	silicon_rev = "20nm5es"		//Valid values: 20nm5es 20nm5es2 20nm4es 20nm4es2 20nm5 20nm4 20nm3 20nm2 20nm1 
)

(
	//Port declaration

	input	[8:0]  avmmaddress ,
	input	avmmclk ,
	input	avmmread ,
	input	avmmrstn ,
	input	avmmwrite ,
	input	[7:0]  avmmwritedata ,
	input	atpg_rst_n ,
	input	[72:0]  data_in2_10g ,
	input	[72:0]  data_in_10g ,
	input	[63:0]  data_in_8g_phase_comp ,
	input	hard_reset_n ,
	input	[15:0]  rd_ptr_10g ,
	input	[7:0]  rd_ptr_8g_phase_comp ,
	input	scan_mode_n ,
	input	wr_clk_10g ,
	input	wr_clk_8g_phase_comp_dw ,
	input	wr_clk_8g_phase_comp_sw ,
	input	wr_en_10g ,
	input	wr_en_8g_phase_comp ,
	input	[15:0]  wr_ptr_10g ,
	input	[7:0]  wr_ptr_8g_phase_comp ,
	input	wr_rst_n_10g ,
	input	wr_rst_n_8g_phase_comp ,

	output	[7:0]  avmmreaddata ,
	output	blockselect ,
	output	[72:0]  data_out_10g ,
	output	[63:0]  data_out_8g_phase_comp 

);


	twentynm_hssi_fifo_tx_pcs_encrypted
	#(
		.enable_debug_info(enable_debug_info) ,

		.double_write_mode(double_write_mode) ,
		.prot_mode(prot_mode) ,
		.silicon_rev(silicon_rev)

	)
	twentynm_hssi_fifo_tx_pcs_encrypted_inst (

		.avmmaddress(avmmaddress),
		.avmmclk(avmmclk),
		.avmmread(avmmread),
		.avmmrstn(avmmrstn),
		.avmmwrite(avmmwrite),
		.avmmwritedata(avmmwritedata),
		.atpg_rst_n(atpg_rst_n),
		.data_in2_10g(data_in2_10g),
		.data_in_10g(data_in_10g),
		.data_in_8g_phase_comp(data_in_8g_phase_comp),
		.hard_reset_n(hard_reset_n),
		.rd_ptr_10g(rd_ptr_10g),
		.rd_ptr_8g_phase_comp(rd_ptr_8g_phase_comp),
		.scan_mode_n(scan_mode_n),
		.wr_clk_10g(wr_clk_10g),
		.wr_clk_8g_phase_comp_dw(wr_clk_8g_phase_comp_dw),
		.wr_clk_8g_phase_comp_sw(wr_clk_8g_phase_comp_sw),
		.wr_en_10g(wr_en_10g),
		.wr_en_8g_phase_comp(wr_en_8g_phase_comp),
		.wr_ptr_10g(wr_ptr_10g),
		.wr_ptr_8g_phase_comp(wr_ptr_8g_phase_comp),
		.wr_rst_n_10g(wr_rst_n_10g),
		.wr_rst_n_8g_phase_comp(wr_rst_n_8g_phase_comp),
		.avmmreaddata(avmmreaddata),
		.blockselect(blockselect),
		.data_out_10g(data_out_10g),
		.data_out_8g_phase_comp(data_out_8g_phase_comp)

	);

endmodule
// -----------------------------------------------------------
// This is auto-generated HSSI Simulation Atom Model Encryption Wrapper
// Module Name : work/twentynm_hssi_gen3_rx_pcs_wrapper.v
// -----------------------------------------------------------

`timescale 1 ps/1 ps

module twentynm_hssi_gen3_rx_pcs
#(
	// Parameter declaration and default value assignment

	parameter enable_debug_info = "true",	//Valid values: false|true; this is simulation-only parameter, for debug purpose only

	parameter	block_sync = "enable_block_sync" ,		//Valid values: bypass_block_sync enable_block_sync 
	parameter	block_sync_sm = "enable_blk_sync_sm" ,		//Valid values: disable_blk_sync_sm enable_blk_sync_sm 
	parameter	cdr_ctrl_force_unalgn = "enable" ,		//Valid values: disable enable 
	parameter	lpbk_force = "lpbk_frce_dis" ,		//Valid values: lpbk_frce_dis lpbk_frce_en 
	parameter	mode = "gen3_func" ,		//Valid values: gen3_func disable_pcs 
	parameter	rate_match_fifo = "enable_rm_fifo_600ppm" ,		//Valid values: bypass_rm_fifo enable_rm_fifo_600ppm enable_rm_fifo_0ppm 
	parameter	rate_match_fifo_latency = "regular_latency" ,		//Valid values: regular_latency low_latency 
	parameter	reconfig_settings = "{}" ,		//Valid values:  
	parameter	reverse_lpbk = "rev_lpbk_en" ,		//Valid values: rev_lpbk_dis rev_lpbk_en 
	parameter	rx_b4gb_par_lpbk = "b4gb_par_lpbk_dis" ,		//Valid values: b4gb_par_lpbk_dis b4gb_par_lpbk_en 
	parameter	rx_force_balign = "en_force_balign" ,		//Valid values: en_force_balign dis_force_balign 
	parameter	rx_ins_del_one_skip = "ins_del_one_skip_en" ,		//Valid values: ins_del_one_skip_dis ins_del_one_skip_en 
	parameter	rx_num_fixed_pat = 4'b1000 ,		//Valid values: 4 
	parameter	rx_test_out_sel = "rx_test_out0" ,		//Valid values: rx_test_out0 rx_test_out1 
	parameter	silicon_rev = "20nm5es" ,		//Valid values: 20nm5es 20nm5es2 20nm4es 20nm4es2 20nm5 20nm4 20nm3 20nm2 20nm1 
	parameter	sup_mode = "user_mode"		//Valid values: user_mode engineering_mode 
)

(
	//Port declaration

	input	[8:0]  avmmaddress ,
	input	avmmclk ,
	input	avmmread ,
	input	avmmrstn ,
	input	avmmwrite ,
	input	[7:0]  avmmwritedata ,
	input	[31:0]  data_in ,
	input	gen3_clk_sel ,
	input	inferred_rxvalid ,
	input	lpbk_en ,
	input	[39:0]  mem_rx_fifo_rd_data ,
	input	[35:0]  par_lpbk_b4gb_in ,
	input	[31:0]  par_lpbk_in ,
	input	pcs_rst ,
	input	rcvd_clk ,
	input	rx_pma_clk ,
	input	rx_pma_rstn ,
	input	rx_rcvd_rstn ,
	input	rxpolarity ,
	input	shutdown_clk ,
	input	sync_sm_en ,
	input	[3:0]  txdatak_in ,

	output	[7:0]  avmmreaddata ,
	output	blockselect ,
	output	blk_algnd_int ,
	output	blk_lockd_int ,
	output	blk_start ,
	output	clkcomp_delete_int ,
	output	clkcomp_insert_int ,
	output	clkcomp_overfl_int ,
	output	clkcomp_undfl_int ,
	output	[31:0]  data_out ,
	output	data_valid ,
	output	ei_det_int ,
	output	ei_partial_det_int ,
	output	err_decode_int ,
	output	i_det_int ,
	output	lpbk_blk_start ,
	output	[33:0]  lpbk_data ,
	output	lpbk_data_valid ,
	output	[15:0]  mem_rx_fifo_rd_ptr ,
	output	mem_rx_fifo_wr_clk ,
	output	[39:0]  mem_rx_fifo_wr_data ,
	output	mem_rx_fifo_wr_en ,
	output	[15:0]  mem_rx_fifo_wr_ptr ,
	output	mem_rx_fifo_wr_rst_n ,
	output	rcv_lfsr_chk_int ,
	output	[19:0]  rx_test_out ,
	output	skp_det_int ,
	output	[1:0]  sync_hdr 

);


	twentynm_hssi_gen3_rx_pcs_encrypted
	#(
		.enable_debug_info(enable_debug_info) ,

		.block_sync(block_sync) ,
		.block_sync_sm(block_sync_sm) ,
		.cdr_ctrl_force_unalgn(cdr_ctrl_force_unalgn) ,
		.lpbk_force(lpbk_force) ,
		.mode(mode) ,
		.rate_match_fifo(rate_match_fifo) ,
		.rate_match_fifo_latency(rate_match_fifo_latency) ,
		.reconfig_settings(reconfig_settings) ,
		.reverse_lpbk(reverse_lpbk) ,
		.rx_b4gb_par_lpbk(rx_b4gb_par_lpbk) ,
		.rx_force_balign(rx_force_balign) ,
		.rx_ins_del_one_skip(rx_ins_del_one_skip) ,
		.rx_num_fixed_pat(rx_num_fixed_pat) ,
		.rx_test_out_sel(rx_test_out_sel) ,
		.silicon_rev(silicon_rev) ,
		.sup_mode(sup_mode)

	)
	twentynm_hssi_gen3_rx_pcs_encrypted_inst (

		.avmmaddress(avmmaddress),
		.avmmclk(avmmclk),
		.avmmread(avmmread),
		.avmmrstn(avmmrstn),
		.avmmwrite(avmmwrite),
		.avmmwritedata(avmmwritedata),
		.data_in(data_in),
		.gen3_clk_sel(gen3_clk_sel),
		.inferred_rxvalid(inferred_rxvalid),
		.lpbk_en(lpbk_en),
		.mem_rx_fifo_rd_data(mem_rx_fifo_rd_data),
		.par_lpbk_b4gb_in(par_lpbk_b4gb_in),
		.par_lpbk_in(par_lpbk_in),
		.pcs_rst(pcs_rst),
		.rcvd_clk(rcvd_clk),
		.rx_pma_clk(rx_pma_clk),
		.rx_pma_rstn(rx_pma_rstn),
		.rx_rcvd_rstn(rx_rcvd_rstn),
		.rxpolarity(rxpolarity),
		.shutdown_clk(shutdown_clk),
		.sync_sm_en(sync_sm_en),
		.txdatak_in(txdatak_in),
		.avmmreaddata(avmmreaddata),
		.blockselect(blockselect),
		.blk_algnd_int(blk_algnd_int),
		.blk_lockd_int(blk_lockd_int),
		.blk_start(blk_start),
		.clkcomp_delete_int(clkcomp_delete_int),
		.clkcomp_insert_int(clkcomp_insert_int),
		.clkcomp_overfl_int(clkcomp_overfl_int),
		.clkcomp_undfl_int(clkcomp_undfl_int),
		.data_out(data_out),
		.data_valid(data_valid),
		.ei_det_int(ei_det_int),
		.ei_partial_det_int(ei_partial_det_int),
		.err_decode_int(err_decode_int),
		.i_det_int(i_det_int),
		.lpbk_blk_start(lpbk_blk_start),
		.lpbk_data(lpbk_data),
		.lpbk_data_valid(lpbk_data_valid),
		.mem_rx_fifo_rd_ptr(mem_rx_fifo_rd_ptr),
		.mem_rx_fifo_wr_clk(mem_rx_fifo_wr_clk),
		.mem_rx_fifo_wr_data(mem_rx_fifo_wr_data),
		.mem_rx_fifo_wr_en(mem_rx_fifo_wr_en),
		.mem_rx_fifo_wr_ptr(mem_rx_fifo_wr_ptr),
		.mem_rx_fifo_wr_rst_n(mem_rx_fifo_wr_rst_n),
		.rcv_lfsr_chk_int(rcv_lfsr_chk_int),
		.rx_test_out(rx_test_out),
		.skp_det_int(skp_det_int),
		.sync_hdr(sync_hdr)

	);

endmodule
// -----------------------------------------------------------
// This is auto-generated HSSI Simulation Atom Model Encryption Wrapper
// Module Name : work/twentynm_hssi_gen3_tx_pcs_wrapper.v
// -----------------------------------------------------------

`timescale 1 ps/1 ps

module twentynm_hssi_gen3_tx_pcs
#(
	// Parameter declaration and default value assignment

	parameter enable_debug_info = "true",	//Valid values: false|true; this is simulation-only parameter, for debug purpose only

	parameter	mode = "gen3_func" ,		//Valid values: gen3_func disable_pcs 
	parameter	reverse_lpbk = "rev_lpbk_en" ,		//Valid values: rev_lpbk_dis rev_lpbk_en 
	parameter	silicon_rev = "20nm5es" ,		//Valid values: 20nm5es 20nm5es2 20nm4es 20nm4es2 20nm5 20nm4 20nm3 20nm2 20nm1 
	parameter	sup_mode = "user_mode" ,		//Valid values: user_mode engineering_mode 
	parameter	tx_bitslip = 5'b00000 ,		//Valid values: 5 
	parameter	tx_gbox_byp = "bypass_gbox"		//Valid values: bypass_gbox enable_gbox 
)

(
	//Port declaration

	input	[8:0]  avmmaddress ,
	input	avmmclk ,
	input	avmmread ,
	input	avmmrstn ,
	input	avmmwrite ,
	input	[7:0]  avmmwritedata ,
	input	blk_start_in ,
	input	[31:0]  data_in ,
	input	data_valid ,
	input	lpbk_blk_start ,
	input	[33:0]  lpbk_data_in ,
	input	lpbk_data_valid ,
	input	lpbk_en ,
	input	[1:0]  sync_in ,
	input	tx_pma_clk ,
	input	tx_rstn ,

	output	[7:0]  avmmreaddata ,
	output	blockselect ,
	output	[31:0]  data_out ,
	output	[35:0]  par_lpbk_b4gb_out ,
	output	[31:0]  par_lpbk_out ,
	output	[19:0]  tx_test_out 

);


	twentynm_hssi_gen3_tx_pcs_encrypted
	#(
		.enable_debug_info(enable_debug_info) ,

		.mode(mode) ,
		.reverse_lpbk(reverse_lpbk) ,
		.silicon_rev(silicon_rev) ,
		.sup_mode(sup_mode) ,
		.tx_bitslip(tx_bitslip) ,
		.tx_gbox_byp(tx_gbox_byp)

	)
	twentynm_hssi_gen3_tx_pcs_encrypted_inst (

		.avmmaddress(avmmaddress),
		.avmmclk(avmmclk),
		.avmmread(avmmread),
		.avmmrstn(avmmrstn),
		.avmmwrite(avmmwrite),
		.avmmwritedata(avmmwritedata),
		.blk_start_in(blk_start_in),
		.data_in(data_in),
		.data_valid(data_valid),
		.lpbk_blk_start(lpbk_blk_start),
		.lpbk_data_in(lpbk_data_in),
		.lpbk_data_valid(lpbk_data_valid),
		.lpbk_en(lpbk_en),
		.sync_in(sync_in),
		.tx_pma_clk(tx_pma_clk),
		.tx_rstn(tx_rstn),
		.avmmreaddata(avmmreaddata),
		.blockselect(blockselect),
		.data_out(data_out),
		.par_lpbk_b4gb_out(par_lpbk_b4gb_out),
		.par_lpbk_out(par_lpbk_out),
		.tx_test_out(tx_test_out)

	);

endmodule
// -----------------------------------------------------------
// This is auto-generated HSSI Simulation Atom Model Encryption Wrapper
// Module Name : work/twentynm_hssi_krfec_rx_pcs_wrapper.v
// -----------------------------------------------------------

`timescale 1 ps/1 ps

module twentynm_hssi_krfec_rx_pcs
#(
	// Parameter declaration and default value assignment

	parameter enable_debug_info = "true",	//Valid values: false|true; this is simulation-only parameter, for debug purpose only

	parameter	blksync_cor_en = "detect" ,		//Valid values: detect correct 
	parameter	bypass_gb = "bypass_dis" ,		//Valid values: bypass_dis bypass_en 
	parameter	clr_ctrl = "both_enabled" ,		//Valid values: both_enabled corr_cnt_only uncorr_cnt_only 
	parameter	ctrl_bit_reverse = "ctrl_bit_reverse_dis" ,		//Valid values: ctrl_bit_reverse_dis ctrl_bit_reverse_en 
	parameter	data_bit_reverse = "data_bit_reverse_dis" ,		//Valid values: data_bit_reverse_dis data_bit_reverse_en 
	parameter	dv_start = "with_blklock" ,		//Valid values: with_blksync with_blklock 
	parameter	err_mark_type = "err_mark_10g" ,		//Valid values: err_mark_10g err_mark_40g 
	parameter	error_marking_en = "err_mark_dis" ,		//Valid values: err_mark_dis err_mark_en 
	parameter	low_latency_en = "disable" ,		//Valid values: disable enable 
	parameter	lpbk_mode = "lpbk_dis" ,		//Valid values: lpbk_dis lpbk_en 
	parameter	parity_invalid_enum = 8'b00001000 ,		//Valid values: 8 
	parameter	parity_valid_num = 4'b0100 ,		//Valid values: 4 
	parameter	pipeln_blksync = "enable" ,		//Valid values: disable enable 
	parameter	pipeln_descrm = "enable" ,		//Valid values: disable enable 
	parameter	pipeln_errcorrect = "enable" ,		//Valid values: disable enable 
	parameter	pipeln_errtrap_ind = "enable" ,		//Valid values: disable enable 
	parameter	pipeln_errtrap_lfsr = "enable" ,		//Valid values: disable enable 
	parameter	pipeln_errtrap_loc = "enable" ,		//Valid values: disable enable 
	parameter	pipeln_errtrap_pat = "enable" ,		//Valid values: disable enable 
	parameter	pipeln_gearbox = "enable" ,		//Valid values: disable enable 
	parameter	pipeln_syndrm = "enable" ,		//Valid values: disable enable 
	parameter	pipeln_trans_dec = "enable" ,		//Valid values: disable enable 
	parameter	prot_mode = "disable_mode" ,		//Valid values: disable_mode teng_basekr_mode fortyg_basekr_mode teng_1588_basekr_mode basic_mode 
	parameter	receive_order = "receive_lsb" ,		//Valid values: receive_lsb receive_msb 
	parameter	reconfig_settings = "{}" ,		//Valid values:  
	parameter	rx_testbus_sel = "overall" ,		//Valid values: overall fast_search fast_search_cntrs blksync blksync_cntrs decoder_master_sm decoder_master_sm_cntrs syndrm_sm syndrm1 syndrm2 errtrap_sm errtrap_ind1 errtrap_ind2 errtrap_ind3 errtrap_ind4 errtrap_ind5 errtrap_loc errtrap_pat1 errtrap_pat2 errtrap_pat3 errtrap_pat4 decoder_rd_sm gb_and_trans 
	parameter	signal_ok_en = "sig_ok_dis" ,		//Valid values: sig_ok_dis sig_ok_en 
	parameter	silicon_rev = "20nm5es" ,		//Valid values: 20nm5es 20nm5es2 20nm4es 20nm4es2 20nm5 20nm4 20nm3 20nm2 20nm1 
	parameter	sup_mode = "user_mode"		//Valid values: user_mode engineering_mode 
)

(
	//Port declaration

	input	[8:0]  avmmaddress ,
	input	avmmclk ,
	input	avmmread ,
	input	avmmrstn ,
	input	avmmwrite ,
	input	[7:0]  avmmwritedata ,
	input	rx_clr_counters ,
	input	[63:0]  rx_data_in ,
	input	rx_krfec_clk ,
	input	rx_master_clk ,
	input	rx_master_clk_rst_n ,
	input	rx_signal_ok_in ,
	input	scan_mode_n ,
	input	scan_rst_n ,

	output	[7:0]  avmmreaddata ,
	output	blockselect ,
	output	pld_10g_krfec_rx_blk_lock_krfec_reg ,
	output	pld_10g_krfec_rx_blk_lock_krfec_txclk_reg ,
	output	pld_10g_krfec_rx_diag_data_status_krfec_reg ,
	output	pld_10g_krfec_rx_diag_data_status_krfec_txclk_reg ,
	output	pld_10g_krfec_rx_frame_krfec_reg ,
	output	pld_10g_krfec_rx_frame_krfec_txclk_reg ,
	output	rx_block_lock ,
	output	[9:0]  rx_control_out ,
	output	[63:0]  rx_data_out ,
	output	[1:0]  rx_data_status ,
	output	rx_data_valid_out ,
	output	rx_frame ,
	output	rx_signal_ok_out ,
	output	[19:0]  rx_test_data 

);


	twentynm_hssi_krfec_rx_pcs_encrypted
	#(
		.enable_debug_info(enable_debug_info) ,

		.blksync_cor_en(blksync_cor_en) ,
		.bypass_gb(bypass_gb) ,
		.clr_ctrl(clr_ctrl) ,
		.ctrl_bit_reverse(ctrl_bit_reverse) ,
		.data_bit_reverse(data_bit_reverse) ,
		.dv_start(dv_start) ,
		.err_mark_type(err_mark_type) ,
		.error_marking_en(error_marking_en) ,
		.low_latency_en(low_latency_en) ,
		.lpbk_mode(lpbk_mode) ,
		.parity_invalid_enum(parity_invalid_enum) ,
		.parity_valid_num(parity_valid_num) ,
		.pipeln_blksync(pipeln_blksync) ,
		.pipeln_descrm(pipeln_descrm) ,
		.pipeln_errcorrect(pipeln_errcorrect) ,
		.pipeln_errtrap_ind(pipeln_errtrap_ind) ,
		.pipeln_errtrap_lfsr(pipeln_errtrap_lfsr) ,
		.pipeln_errtrap_loc(pipeln_errtrap_loc) ,
		.pipeln_errtrap_pat(pipeln_errtrap_pat) ,
		.pipeln_gearbox(pipeln_gearbox) ,
		.pipeln_syndrm(pipeln_syndrm) ,
		.pipeln_trans_dec(pipeln_trans_dec) ,
		.prot_mode(prot_mode) ,
		.receive_order(receive_order) ,
		.reconfig_settings(reconfig_settings) ,
		.rx_testbus_sel(rx_testbus_sel) ,
		.signal_ok_en(signal_ok_en) ,
		.silicon_rev(silicon_rev) ,
		.sup_mode(sup_mode)

	)
	twentynm_hssi_krfec_rx_pcs_encrypted_inst (

		.avmmaddress(avmmaddress),
		.avmmclk(avmmclk),
		.avmmread(avmmread),
		.avmmrstn(avmmrstn),
		.avmmwrite(avmmwrite),
		.avmmwritedata(avmmwritedata),
		.rx_clr_counters(rx_clr_counters),
		.rx_data_in(rx_data_in),
		.rx_krfec_clk(rx_krfec_clk),
		.rx_master_clk(rx_master_clk),
		.rx_master_clk_rst_n(rx_master_clk_rst_n),
		.rx_signal_ok_in(rx_signal_ok_in),
		.scan_mode_n(scan_mode_n),
		.scan_rst_n(scan_rst_n),
		.avmmreaddata(avmmreaddata),
		.blockselect(blockselect),
		.pld_10g_krfec_rx_blk_lock_krfec_reg(pld_10g_krfec_rx_blk_lock_krfec_reg),
		.pld_10g_krfec_rx_blk_lock_krfec_txclk_reg(pld_10g_krfec_rx_blk_lock_krfec_txclk_reg),
		.pld_10g_krfec_rx_diag_data_status_krfec_reg(pld_10g_krfec_rx_diag_data_status_krfec_reg),
		.pld_10g_krfec_rx_diag_data_status_krfec_txclk_reg(pld_10g_krfec_rx_diag_data_status_krfec_txclk_reg),
		.pld_10g_krfec_rx_frame_krfec_reg(pld_10g_krfec_rx_frame_krfec_reg),
		.pld_10g_krfec_rx_frame_krfec_txclk_reg(pld_10g_krfec_rx_frame_krfec_txclk_reg),
		.rx_block_lock(rx_block_lock),
		.rx_control_out(rx_control_out),
		.rx_data_out(rx_data_out),
		.rx_data_status(rx_data_status),
		.rx_data_valid_out(rx_data_valid_out),
		.rx_frame(rx_frame),
		.rx_signal_ok_out(rx_signal_ok_out),
		.rx_test_data(rx_test_data)

	);

endmodule
// -----------------------------------------------------------
// This is auto-generated HSSI Simulation Atom Model Encryption Wrapper
// Module Name : work/twentynm_hssi_krfec_tx_pcs_wrapper.v
// -----------------------------------------------------------

`timescale 1 ps/1 ps

module twentynm_hssi_krfec_tx_pcs
#(
	// Parameter declaration and default value assignment

	parameter enable_debug_info = "true",	//Valid values: false|true; this is simulation-only parameter, for debug purpose only

	parameter	burst_err = "burst_err_dis" ,		//Valid values: burst_err_dis burst_err_en 
	parameter	burst_err_len = "burst_err_len1" ,		//Valid values: burst_err_len1 burst_err_len2 burst_err_len3 burst_err_len4 burst_err_len5 burst_err_len6 burst_err_len7 burst_err_len8 burst_err_len9 burst_err_len10 burst_err_len11 burst_err_len12 burst_err_len13 burst_err_len14 burst_err_len15 burst_err_len16 
	parameter	ctrl_bit_reverse = "ctrl_bit_reverse_dis" ,		//Valid values: ctrl_bit_reverse_dis ctrl_bit_reverse_en 
	parameter	data_bit_reverse = "data_bit_reverse_dis" ,		//Valid values: data_bit_reverse_dis data_bit_reverse_en 
	parameter	enc_frame_query = "enc_query_dis" ,		//Valid values: enc_query_dis enc_query_en 
	parameter	low_latency_en = "disable" ,		//Valid values: disable enable 
	parameter	pipeln_encoder = "enable" ,		//Valid values: disable enable 
	parameter	pipeln_scrambler = "enable" ,		//Valid values: disable enable 
	parameter	prot_mode = "disable_mode" ,		//Valid values: disable_mode teng_basekr_mode fortyg_basekr_mode teng_1588_basekr_mode basic_mode 
	parameter	silicon_rev = "20nm5es" ,		//Valid values: 20nm5es 20nm5es2 20nm4es 20nm4es2 20nm5 20nm4 20nm3 20nm2 20nm1 
	parameter	sup_mode = "user_mode" ,		//Valid values: user_mode engineering_mode 
	parameter	transcode_err = "trans_err_dis" ,		//Valid values: trans_err_dis trans_err_en 
	parameter	transmit_order = "transmit_lsb" ,		//Valid values: transmit_lsb transmit_msb 
	parameter	tx_testbus_sel = "overall"		//Valid values: overall encoder1 encoder2 scramble1 scramble2 scramble3 gearbox 
)

(
	//Port declaration

	input	[8:0]  avmmaddress ,
	input	avmmclk ,
	input	avmmread ,
	input	avmmrstn ,
	input	avmmwrite ,
	input	[7:0]  avmmwritedata ,
	input	[8:0]  tx_control_in ,
	input	[63:0]  tx_data_in ,
	input	tx_data_valid_in ,
	input	tx_krfec_clk ,
	input	tx_master_clk ,
	input	tx_master_clk_rst_n ,

	output	[7:0]  avmmreaddata ,
	output	blockselect ,
	output	pld_10g_krfec_tx_frame_krfec_reg ,
	output	pld_krfec_tx_alignment_plddirect_reg ,
	output	pld_krfec_tx_alignment_reg ,
	output	tx_alignment ,
	output	[63:0]  tx_data_out ,
	output	tx_frame ,
	output	[19:0]  tx_test_data 

);


	twentynm_hssi_krfec_tx_pcs_encrypted
	#(
		.enable_debug_info(enable_debug_info) ,

		.burst_err(burst_err) ,
		.burst_err_len(burst_err_len) ,
		.ctrl_bit_reverse(ctrl_bit_reverse) ,
		.data_bit_reverse(data_bit_reverse) ,
		.enc_frame_query(enc_frame_query) ,
		.low_latency_en(low_latency_en) ,
		.pipeln_encoder(pipeln_encoder) ,
		.pipeln_scrambler(pipeln_scrambler) ,
		.prot_mode(prot_mode) ,
		.silicon_rev(silicon_rev) ,
		.sup_mode(sup_mode) ,
		.transcode_err(transcode_err) ,
		.transmit_order(transmit_order) ,
		.tx_testbus_sel(tx_testbus_sel)

	)
	twentynm_hssi_krfec_tx_pcs_encrypted_inst (

		.avmmaddress(avmmaddress),
		.avmmclk(avmmclk),
		.avmmread(avmmread),
		.avmmrstn(avmmrstn),
		.avmmwrite(avmmwrite),
		.avmmwritedata(avmmwritedata),
		.tx_control_in(tx_control_in),
		.tx_data_in(tx_data_in),
		.tx_data_valid_in(tx_data_valid_in),
		.tx_krfec_clk(tx_krfec_clk),
		.tx_master_clk(tx_master_clk),
		.tx_master_clk_rst_n(tx_master_clk_rst_n),
		.avmmreaddata(avmmreaddata),
		.blockselect(blockselect),
		.pld_10g_krfec_tx_frame_krfec_reg(pld_10g_krfec_tx_frame_krfec_reg),
		.pld_krfec_tx_alignment_plddirect_reg(pld_krfec_tx_alignment_plddirect_reg),
		.pld_krfec_tx_alignment_reg(pld_krfec_tx_alignment_reg),
		.tx_alignment(tx_alignment),
		.tx_data_out(tx_data_out),
		.tx_frame(tx_frame),
		.tx_test_data(tx_test_data)

	);

endmodule
// -----------------------------------------------------------
// This is auto-generated HSSI Simulation Atom Model Encryption Wrapper
// Module Name : work/twentynm_hssi_pipe_gen1_2_wrapper.v
// -----------------------------------------------------------

`timescale 1 ps/1 ps

module twentynm_hssi_pipe_gen1_2
#(
	// Parameter declaration and default value assignment

	parameter enable_debug_info = "true",	//Valid values: false|true; this is simulation-only parameter, for debug purpose only

	parameter	elec_idle_delay_val = 3'b000 ,		//Valid values: 3 
	parameter	error_replace_pad = "replace_edb" ,		//Valid values: replace_edb replace_pad 
	parameter	hip_mode = "dis_hip" ,		//Valid values: dis_hip en_hip 
	parameter	ind_error_reporting = "dis_ind_error_reporting" ,		//Valid values: dis_ind_error_reporting en_ind_error_reporting 
	parameter	phystatus_delay_val = 3'b000 ,		//Valid values: 3 
	parameter	phystatus_rst_toggle = "dis_phystatus_rst_toggle" ,		//Valid values: dis_phystatus_rst_toggle en_phystatus_rst_toggle 
	parameter	pipe_byte_de_serializer_en = "dont_care_bds" ,		//Valid values: dis_bds en_bds_by_2 dont_care_bds 
	parameter	prot_mode = "pipe_g1" ,		//Valid values: pipe_g1 pipe_g2 pipe_g3 basic disabled_prot_mode 
	parameter	reconfig_settings = "{}" ,		//Valid values:  
	parameter	rpre_emph_a_val = 6'b000000 ,		//Valid values: 6 
	parameter	rpre_emph_b_val = 6'b000000 ,		//Valid values: 6 
	parameter	rpre_emph_c_val = 6'b000000 ,		//Valid values: 6 
	parameter	rpre_emph_d_val = 6'b000000 ,		//Valid values: 6 
	parameter	rpre_emph_e_val = 6'b000000 ,		//Valid values: 6 
	parameter	rvod_sel_a_val = 6'b000000 ,		//Valid values: 6 
	parameter	rvod_sel_b_val = 6'b000000 ,		//Valid values: 6 
	parameter	rvod_sel_c_val = 6'b000000 ,		//Valid values: 6 
	parameter	rvod_sel_d_val = 6'b000000 ,		//Valid values: 6 
	parameter	rvod_sel_e_val = 6'b000000 ,		//Valid values: 6 
	parameter	rx_pipe_enable = "dis_pipe_rx" ,		//Valid values: dis_pipe_rx en_pipe_rx en_pipe3_rx 
	parameter	rxdetect_bypass = "dis_rxdetect_bypass" ,		//Valid values: dis_rxdetect_bypass en_rxdetect_bypass 
	parameter	silicon_rev = "20nm5es" ,		//Valid values: 20nm5es 20nm5es2 20nm4es 20nm4es2 20nm5 20nm4 20nm3 20nm2 20nm1 
	parameter	sup_mode = "user_mode" ,		//Valid values: user_mode engineering_mode 
	parameter	tx_pipe_enable = "dis_pipe_tx" ,		//Valid values: dis_pipe_tx en_pipe_tx en_pipe3_tx 
	parameter	txswing = "dis_txswing"		//Valid values: dis_txswing en_txswing 
)

(
	//Port declaration

	input	[8:0]  avmmaddress ,
	input	avmmclk ,
	input	avmmread ,
	input	avmmrstn ,
	input	avmmwrite ,
	input	[7:0]  avmmwritedata ,
	input	pcie_switch ,
	input	pipe_rx_clk ,
	input	pipe_tx_clk ,
	input	power_state_transition_done ,
	input	power_state_transition_done_ena ,
	input	[1:0]  powerdown ,
	input	refclk_b ,
	input	refclk_b_reset ,
	input	rev_loopbk_pcs_gen3 ,
	input	revloopback ,
	input	rx_detect_valid ,
	input	rx_found ,
	input	rx_pipe_reset ,
	input	[63:0]  rxd ,
	input	rxelectricalidle ,
	input	rxelectricalidle_pcs_gen3 ,
	input	rxpolarity ,
	input	rxpolarity_pcs_gen3 ,
	input	sigdetni ,
	input	speed_change ,
	input	tx_elec_idle_comp ,
	input	tx_pipe_reset ,
	input	[43:0]  txd_ch ,
	input	txdeemph ,
	input	txdetectrxloopback ,
	input	txelecidle ,
	input	[2:0]  txmargin ,
	input	txswingport ,

	output	[7:0]  avmmreaddata ,
	output	blockselect ,
	output	pld_8g_rxpolarity_pipe3_reg ,
	output	[17:0]  current_coeff ,
	output	phystatus ,
	output	polarity_inversion_rx ,
	output	rev_loopbk ,
	output	[63:0]  rxd_ch ,
	output	rxelecidle ,
	output	rxelectricalidle_out ,
	output	[2:0]  rxstatus ,
	output	rxvalid ,
	output	tx_elec_idle_out ,
	output	[43:0]  txd ,
	output	txdetectrx 

);


	twentynm_hssi_pipe_gen1_2_encrypted
	#(
		.enable_debug_info(enable_debug_info) ,

		.elec_idle_delay_val(elec_idle_delay_val) ,
		.error_replace_pad(error_replace_pad) ,
		.hip_mode(hip_mode) ,
		.ind_error_reporting(ind_error_reporting) ,
		.phystatus_delay_val(phystatus_delay_val) ,
		.phystatus_rst_toggle(phystatus_rst_toggle) ,
		.pipe_byte_de_serializer_en(pipe_byte_de_serializer_en) ,
		.prot_mode(prot_mode) ,
		.reconfig_settings(reconfig_settings) ,
		.rpre_emph_a_val(rpre_emph_a_val) ,
		.rpre_emph_b_val(rpre_emph_b_val) ,
		.rpre_emph_c_val(rpre_emph_c_val) ,
		.rpre_emph_d_val(rpre_emph_d_val) ,
		.rpre_emph_e_val(rpre_emph_e_val) ,
		.rvod_sel_a_val(rvod_sel_a_val) ,
		.rvod_sel_b_val(rvod_sel_b_val) ,
		.rvod_sel_c_val(rvod_sel_c_val) ,
		.rvod_sel_d_val(rvod_sel_d_val) ,
		.rvod_sel_e_val(rvod_sel_e_val) ,
		.rx_pipe_enable(rx_pipe_enable) ,
		.rxdetect_bypass(rxdetect_bypass) ,
		.silicon_rev(silicon_rev) ,
		.sup_mode(sup_mode) ,
		.tx_pipe_enable(tx_pipe_enable) ,
		.txswing(txswing)

	)
	twentynm_hssi_pipe_gen1_2_encrypted_inst (

		.avmmaddress(avmmaddress),
		.avmmclk(avmmclk),
		.avmmread(avmmread),
		.avmmrstn(avmmrstn),
		.avmmwrite(avmmwrite),
		.avmmwritedata(avmmwritedata),
		.pcie_switch(pcie_switch),
		.pipe_rx_clk(pipe_rx_clk),
		.pipe_tx_clk(pipe_tx_clk),
		.power_state_transition_done(power_state_transition_done),
		.power_state_transition_done_ena(power_state_transition_done_ena),
		.powerdown(powerdown),
		.refclk_b(refclk_b),
		.refclk_b_reset(refclk_b_reset),
		.rev_loopbk_pcs_gen3(rev_loopbk_pcs_gen3),
		.revloopback(revloopback),
		.rx_detect_valid(rx_detect_valid),
		.rx_found(rx_found),
		.rx_pipe_reset(rx_pipe_reset),
		.rxd(rxd),
		.rxelectricalidle(rxelectricalidle),
		.rxelectricalidle_pcs_gen3(rxelectricalidle_pcs_gen3),
		.rxpolarity(rxpolarity),
		.rxpolarity_pcs_gen3(rxpolarity_pcs_gen3),
		.sigdetni(sigdetni),
		.speed_change(speed_change),
		.tx_elec_idle_comp(tx_elec_idle_comp),
		.tx_pipe_reset(tx_pipe_reset),
		.txd_ch(txd_ch),
		.txdeemph(txdeemph),
		.txdetectrxloopback(txdetectrxloopback),
		.txelecidle(txelecidle),
		.txmargin(txmargin),
		.txswingport(txswingport),
		.avmmreaddata(avmmreaddata),
		.blockselect(blockselect),
		.pld_8g_rxpolarity_pipe3_reg(pld_8g_rxpolarity_pipe3_reg),
		.current_coeff(current_coeff),
		.phystatus(phystatus),
		.polarity_inversion_rx(polarity_inversion_rx),
		.rev_loopbk(rev_loopbk),
		.rxd_ch(rxd_ch),
		.rxelecidle(rxelecidle),
		.rxelectricalidle_out(rxelectricalidle_out),
		.rxstatus(rxstatus),
		.rxvalid(rxvalid),
		.tx_elec_idle_out(tx_elec_idle_out),
		.txd(txd),
		.txdetectrx(txdetectrx)

	);

endmodule
// -----------------------------------------------------------
// This is auto-generated HSSI Simulation Atom Model Encryption Wrapper
// Module Name : work/twentynm_hssi_pipe_gen3_wrapper.v
// -----------------------------------------------------------

`timescale 1 ps/1 ps

module twentynm_hssi_pipe_gen3
#(
	// Parameter declaration and default value assignment

	parameter enable_debug_info = "true",	//Valid values: false|true; this is simulation-only parameter, for debug purpose only

	parameter	bypass_rx_detection_enable = "false" ,		//Valid values: false true 
	parameter	bypass_rx_preset = 3'b000 ,		//Valid values: 3 
	parameter	bypass_rx_preset_enable = "false" ,		//Valid values: false true 
	parameter	bypass_tx_coefficent = 18'b000000000000000000 ,		//Valid values: 18 
	parameter	bypass_tx_coefficent_enable = "false" ,		//Valid values: false true 
	parameter	elecidle_delay_g3 = 3'b110 ,		//Valid values: 3 
	parameter	ind_error_reporting = "dis_ind_error_reporting" ,		//Valid values: dis_ind_error_reporting en_ind_error_reporting 
	parameter	mode = "pipe_g1" ,		//Valid values: pipe_g1 pipe_g2 pipe_g3 disable_pcs 
	parameter	phy_status_delay_g12 = 3'b101 ,		//Valid values: 3 
	parameter	phy_status_delay_g3 = 3'b101 ,		//Valid values: 3 
	parameter	phystatus_rst_toggle_g12 = "dis_phystatus_rst_toggle" ,		//Valid values: dis_phystatus_rst_toggle en_phystatus_rst_toggle 
	parameter	phystatus_rst_toggle_g3 = "dis_phystatus_rst_toggle_g3" ,		//Valid values: dis_phystatus_rst_toggle_g3 en_phystatus_rst_toggle_g3 
	parameter	rate_match_pad_insertion = "dis_rm_fifo_pad_ins" ,		//Valid values: dis_rm_fifo_pad_ins en_rm_fifo_pad_ins 
	parameter	silicon_rev = "20nm5es" ,		//Valid values: 20nm5es 20nm5es2 20nm4es 20nm4es2 20nm5 20nm4 20nm3 20nm2 20nm1 
	parameter	sup_mode = "user_mode" ,		//Valid values: user_mode engineering_mode 
	parameter	test_out_sel = "disable_test_out"		//Valid values: tx_test_out rx_test_out pipe_test_out1 pipe_test_out2 pipe_test_out3 pipe_ctrl_test_out disable_test_out 
)

(
	//Port declaration

	input	[8:0]  avmmaddress ,
	input	avmmclk ,
	input	avmmread ,
	input	avmmrstn ,
	input	avmmwrite ,
	input	[7:0]  avmmwritedata ,
	input	blk_algnd_int ,
	input	clkcomp_delete_int ,
	input	clkcomp_insert_int ,
	input	clkcomp_overfl_int ,
	input	clkcomp_undfl_int ,
	input	[17:0]  current_coeff ,
	input	[2:0]  current_rxpreset ,
	input	err_decode_int ,
	input	[8:0]  pcs_asn_bundling_in ,
	input	pipe_tx_clk ,
	input	pipe_tx_rstn ,
	input	pma_rx_detect_valid ,
	input	pma_rx_found ,
	input	pma_signal_det ,
	input	[1:0]  powerdown ,
	input	rcv_lfsr_chk_int ,
	input	rx_blk_start_int ,
	input	[1:0]  rx_sync_hdr_int ,
	input	[19:0]  rx_test_out ,
	input	[63:0]  rxd_8gpcs_in ,
	input	[31:0]  rxdata_int ,
	input	[3:0]  rxdatak_int ,
	input	rxdataskip_int ,
	input	rxelecidle_8gpcs_in ,
	input	rxpolarity ,
	input	tx_blk_start ,
	input	[1:0]  tx_sync_hdr ,
	input	[19:0]  tx_test_out ,
	input	txcompliance ,
	input	[31:0]  txdata ,
	input	[3:0]  txdatak ,
	input	txdataskip ,
	input	txdeemph ,
	input	txdetectrxloopback ,
	input	txelecidle ,
	input	[2:0]  txmargin ,
	input	txswing ,

	output	[7:0]  avmmreaddata ,
	output	blockselect ,
	output	dis_pc_byte ,
	output	gen3_clk_sel ,
	output	pcs_rst ,
	output	phystatus ,
	output	[17:0]  pma_current_coeff ,
	output	[2:0]  pma_current_rxpreset ,
	output	pma_rx_det_pd ,
	output	pma_tx_elec_idle ,
	output	pma_txdeemph ,
	output	pma_txdetectrx ,
	output	[2:0]  pma_txmargin ,
	output	pma_txswing ,
	output	reset_pc_prts ,
	output	rev_lpbk_8gpcs_out ,
	output	rev_lpbk_int ,
	output	[3:0]  rx_blk_start ,
	output	[1:0]  rx_sync_hdr ,
	output	[63:0]  rxd_8gpcs_out ,
	output	[3:0]  rxdataskip ,
	output	rxelecidle ,
	output	rxpolarity_8gpcs_out ,
	output	rxpolarity_int ,
	output	[2:0]  rxstatus ,
	output	rxvalid ,
	output	shutdown_clk ,
	output	[19:0]  test_out ,
	output	tx_blk_start_int ,
	output	[1:0]  tx_sync_hdr_int ,
	output	[31:0]  txdata_int ,
	output	[3:0]  txdatak_int ,
	output	txdataskip_int 

);


	twentynm_hssi_pipe_gen3_encrypted
	#(
		.enable_debug_info(enable_debug_info) ,

		.bypass_rx_detection_enable(bypass_rx_detection_enable) ,
		.bypass_rx_preset(bypass_rx_preset) ,
		.bypass_rx_preset_enable(bypass_rx_preset_enable) ,
		.bypass_tx_coefficent(bypass_tx_coefficent) ,
		.bypass_tx_coefficent_enable(bypass_tx_coefficent_enable) ,
		.elecidle_delay_g3(elecidle_delay_g3) ,
		.ind_error_reporting(ind_error_reporting) ,
		.mode(mode) ,
		.phy_status_delay_g12(phy_status_delay_g12) ,
		.phy_status_delay_g3(phy_status_delay_g3) ,
		.phystatus_rst_toggle_g12(phystatus_rst_toggle_g12) ,
		.phystatus_rst_toggle_g3(phystatus_rst_toggle_g3) ,
		.rate_match_pad_insertion(rate_match_pad_insertion) ,
		.silicon_rev(silicon_rev) ,
		.sup_mode(sup_mode) ,
		.test_out_sel(test_out_sel)

	)
	twentynm_hssi_pipe_gen3_encrypted_inst (

		.avmmaddress(avmmaddress),
		.avmmclk(avmmclk),
		.avmmread(avmmread),
		.avmmrstn(avmmrstn),
		.avmmwrite(avmmwrite),
		.avmmwritedata(avmmwritedata),
		.blk_algnd_int(blk_algnd_int),
		.clkcomp_delete_int(clkcomp_delete_int),
		.clkcomp_insert_int(clkcomp_insert_int),
		.clkcomp_overfl_int(clkcomp_overfl_int),
		.clkcomp_undfl_int(clkcomp_undfl_int),
		.current_coeff(current_coeff),
		.current_rxpreset(current_rxpreset),
		.err_decode_int(err_decode_int),
		.pcs_asn_bundling_in(pcs_asn_bundling_in),
		.pipe_tx_clk(pipe_tx_clk),
		.pipe_tx_rstn(pipe_tx_rstn),
		.pma_rx_detect_valid(pma_rx_detect_valid),
		.pma_rx_found(pma_rx_found),
		.pma_signal_det(pma_signal_det),
		.powerdown(powerdown),
		.rcv_lfsr_chk_int(rcv_lfsr_chk_int),
		.rx_blk_start_int(rx_blk_start_int),
		.rx_sync_hdr_int(rx_sync_hdr_int),
		.rx_test_out(rx_test_out),
		.rxd_8gpcs_in(rxd_8gpcs_in),
		.rxdata_int(rxdata_int),
		.rxdatak_int(rxdatak_int),
		.rxdataskip_int(rxdataskip_int),
		.rxelecidle_8gpcs_in(rxelecidle_8gpcs_in),
		.rxpolarity(rxpolarity),
		.tx_blk_start(tx_blk_start),
		.tx_sync_hdr(tx_sync_hdr),
		.tx_test_out(tx_test_out),
		.txcompliance(txcompliance),
		.txdata(txdata),
		.txdatak(txdatak),
		.txdataskip(txdataskip),
		.txdeemph(txdeemph),
		.txdetectrxloopback(txdetectrxloopback),
		.txelecidle(txelecidle),
		.txmargin(txmargin),
		.txswing(txswing),
		.avmmreaddata(avmmreaddata),
		.blockselect(blockselect),
		.dis_pc_byte(dis_pc_byte),
		.gen3_clk_sel(gen3_clk_sel),
		.pcs_rst(pcs_rst),
		.phystatus(phystatus),
		.pma_current_coeff(pma_current_coeff),
		.pma_current_rxpreset(pma_current_rxpreset),
		.pma_rx_det_pd(pma_rx_det_pd),
		.pma_tx_elec_idle(pma_tx_elec_idle),
		.pma_txdeemph(pma_txdeemph),
		.pma_txdetectrx(pma_txdetectrx),
		.pma_txmargin(pma_txmargin),
		.pma_txswing(pma_txswing),
		.reset_pc_prts(reset_pc_prts),
		.rev_lpbk_8gpcs_out(rev_lpbk_8gpcs_out),
		.rev_lpbk_int(rev_lpbk_int),
		.rx_blk_start(rx_blk_start),
		.rx_sync_hdr(rx_sync_hdr),
		.rxd_8gpcs_out(rxd_8gpcs_out),
		.rxdataskip(rxdataskip),
		.rxelecidle(rxelecidle),
		.rxpolarity_8gpcs_out(rxpolarity_8gpcs_out),
		.rxpolarity_int(rxpolarity_int),
		.rxstatus(rxstatus),
		.rxvalid(rxvalid),
		.shutdown_clk(shutdown_clk),
		.test_out(test_out),
		.tx_blk_start_int(tx_blk_start_int),
		.tx_sync_hdr_int(tx_sync_hdr_int),
		.txdata_int(txdata_int),
		.txdatak_int(txdatak_int),
		.txdataskip_int(txdataskip_int)

	);

endmodule
// -----------------------------------------------------------
// This is auto-generated HSSI Simulation Atom Model Encryption Wrapper
// Module Name : work/twentynm_hssi_pma_adaptation_wrapper.v
// -----------------------------------------------------------

`timescale 1 ps/1 ps

module twentynm_hssi_pma_adaptation
#(
	// Parameter declaration and default value assignment

	parameter enable_debug_info = "true",	//Valid values: false|true; this is simulation-only parameter, for debug purpose only

	parameter	adapt_dfe_control_sel = "r_adapt_dfe_control_sel_0" ,		//Valid values: r_adapt_dfe_control_sel_0 r_adapt_dfe_control_sel_1 r_adapt_dfe_control_sel_2 r_adapt_dfe_control_sel_3 
	parameter	adapt_dfe_sel = "r_adapt_dfe_sel_0" ,		//Valid values: r_adapt_dfe_sel_0 r_adapt_dfe_sel_1 
	parameter	adapt_mode = "dfe_vga" ,		//Valid values: ctle dfe_vga ctle_vga ctle_vga_dfe manual 
	parameter	adapt_vga_sel = "r_adapt_vga_sel_0" ,		//Valid values: r_adapt_vga_sel_0 r_adapt_vga_sel_1 
	parameter	adapt_vref_sel = "r_adapt_vref_sel_0" ,		//Valid values: r_adapt_vref_sel_0 r_adapt_vref_sel_1 r_adapt_vref_sel_2 r_adapt_vref_sel_3 
	parameter	adp_1s_ctle_bypass = "radp_1s_ctle_bypass_0" ,		//Valid values: radp_1s_ctle_bypass_0 radp_1s_ctle_bypass_1 
	parameter	adp_4s_ctle_bypass = "radp_4s_ctle_bypass_0" ,		//Valid values: radp_4s_ctle_bypass_0 radp_4s_ctle_bypass_1 
	parameter	adp_adapt_control_sel = "radp_adapt_control_sel_0" ,		//Valid values: radp_adapt_control_sel_0 radp_adapt_control_sel_1 
	parameter	adp_adapt_rstn = "radp_adapt_rstn_1" ,		//Valid values: radp_adapt_rstn_0 radp_adapt_rstn_1 
	parameter	adp_adapt_start = "radp_adapt_start_0" ,		//Valid values: radp_adapt_start_0 radp_adapt_start_1 
	parameter	adp_bist_auxpath_en = "radp_bist_auxpath_disable" ,		//Valid values: radp_bist_auxpath_enable radp_bist_auxpath_disable 
	parameter	adp_bist_count_rstn = "radp_bist_count_rstn_0" ,		//Valid values: radp_bist_count_rstn_0 radp_bist_count_rstn_1 
	parameter	adp_bist_datapath_en = "radp_bist_datapath_disable" ,		//Valid values: radp_bist_datapath_disable radp_bist_datapath_enalbe 
	parameter	adp_bist_mode = "radp_bist_mode_0" ,		//Valid values: radp_bist_mode_0 radp_bist_mode_1 radp_bist_mode_2 radp_bist_mode_3 
	parameter	adp_bist_odi_dfe_sel = "radp_bist_odi_dfe_sel_0" ,		//Valid values: radp_bist_odi_dfe_sel_0 radp_bist_odi_dfe_sel_1 
	parameter	adp_bist_spec_en = "radp_bist_spec_en_0" ,		//Valid values: radp_bist_spec_en_0 radp_bist_spec_en_1 
	parameter	adp_control_mux_bypass = "radp_control_mux_bypass_0" ,		//Valid values: radp_control_mux_bypass_0 radp_control_mux_bypass_1 
	parameter	adp_ctle_acgain_4s = "radp_ctle_acgain_4s_0" ,		//Valid values: radp_ctle_acgain_4s_0 radp_ctle_acgain_4s_1 radp_ctle_acgain_4s_2 radp_ctle_acgain_4s_3 radp_ctle_acgain_4s_4 radp_ctle_acgain_4s_5 radp_ctle_acgain_4s_6 radp_ctle_acgain_4s_7 radp_ctle_acgain_4s_8 radp_ctle_acgain_4s_9 radp_ctle_acgain_4s_10 radp_ctle_acgain_4s_11 radp_ctle_acgain_4s_12 radp_ctle_acgain_4s_13 radp_ctle_acgain_4s_14 radp_ctle_acgain_4s_15 radp_ctle_acgain_4s_16 radp_ctle_acgain_4s_17 radp_ctle_acgain_4s_18 radp_ctle_acgain_4s_19 radp_ctle_acgain_4s_20 radp_ctle_acgain_4s_21 radp_ctle_acgain_4s_22 radp_ctle_acgain_4s_23 radp_ctle_acgain_4s_24 radp_ctle_acgain_4s_25 radp_ctle_acgain_4s_26 radp_ctle_acgain_4s_27 radp_ctle_acgain_4s_28 radp_ctle_acgain_4s_29 radp_ctle_acgain_4s_30 radp_ctle_acgain_4s_31 
	parameter	adp_ctle_adapt_bw = "radp_ctle_adapt_bw_3" ,		//Valid values: radp_ctle_adapt_bw_0 radp_ctle_adapt_bw_1 radp_ctle_adapt_bw_2 radp_ctle_adapt_bw_3 radp_ctle_adapt_bw_4 radp_ctle_adapt_bw_5 radp_ctle_adapt_bw_6 radp_ctle_adapt_bw_7 
	parameter	adp_ctle_adapt_cycle_window = "radp_ctle_adapt_cycle_window_6" ,		//Valid values: radp_ctle_adapt_cycle_window_0 radp_ctle_adapt_cycle_window_1 radp_ctle_adapt_cycle_window_2 radp_ctle_adapt_cycle_window_3 radp_ctle_adapt_cycle_window_4 radp_ctle_adapt_cycle_window_5 radp_ctle_adapt_cycle_window_6 radp_ctle_adapt_cycle_window_7 
	parameter	adp_ctle_adapt_oneshot = "radp_ctle_adapt_oneshot_1" ,		//Valid values: radp_ctle_adapt_oneshot_0 radp_ctle_adapt_oneshot_1 
	parameter	adp_ctle_en = "radp_ctle_disable" ,		//Valid values: radp_ctle_disable radp_ctle_enable 
	parameter	adp_ctle_eqz_1s_sel = "radp_ctle_eqz_1s_sel_0" ,		//Valid values: radp_ctle_eqz_1s_sel_0 radp_ctle_eqz_1s_sel_1 radp_ctle_eqz_1s_sel_2 radp_ctle_eqz_1s_sel_3 radp_ctle_eqz_1s_sel_4 radp_ctle_eqz_1s_sel_5 radp_ctle_eqz_1s_sel_6 radp_ctle_eqz_1s_sel_7 radp_ctle_eqz_1s_sel_8 radp_ctle_eqz_1s_sel_9 radp_ctle_eqz_1s_sel_10 radp_ctle_eqz_1s_sel_11 radp_ctle_eqz_1s_sel_12 radp_ctle_eqz_1s_sel_13 radp_ctle_eqz_1s_sel_14 radp_ctle_eqz_1s_sel_15 
	parameter	adp_ctle_force_spec_sign = "radp_ctle_force_spec_sign_0" ,		//Valid values: radp_ctle_force_spec_sign_0 radp_ctle_force_spec_sign_1 
	parameter	adp_ctle_hold_en = "radp_ctle_not_held" ,		//Valid values: radp_ctle_not_held radp_ctle_hold 
	parameter	adp_ctle_load = "radp_ctle_load_0" ,		//Valid values: radp_ctle_load_0 radp_ctle_load_1 
	parameter	adp_ctle_load_value = "radp_ctle_load_value_0" ,		//Valid values: radp_ctle_load_value_0 radp_ctle_load_value_1 radp_ctle_load_value_2 radp_ctle_load_value_3 radp_ctle_load_value_4 radp_ctle_load_value_5 radp_ctle_load_value_6 radp_ctle_load_value_7 radp_ctle_load_value_8 radp_ctle_load_value_9 radp_ctle_load_value_10 radp_ctle_load_value_11 radp_ctle_load_value_12 radp_ctle_load_value_13 radp_ctle_load_value_14 radp_ctle_load_value_15 
	parameter	adp_ctle_scale = "radp_ctle_scale_0" ,		//Valid values: radp_ctle_scale_0 radp_ctle_scale_1 radp_ctle_scale_2 radp_ctle_scale_3 radp_ctle_scale_4 radp_ctle_scale_5 radp_ctle_scale_6 radp_ctle_scale_7 radp_ctle_scale_8 radp_ctle_scale_9 radp_ctle_scale_10 radp_ctle_scale_11 radp_ctle_scale_12 radp_ctle_scale_13 radp_ctle_scale_14 radp_ctle_scale_15 
	parameter	adp_ctle_scale_en = "radp_ctle_scale_en_0" ,		//Valid values: radp_ctle_scale_en_0 radp_ctle_scale_en_1 
	parameter	adp_ctle_spec_sign = "radp_ctle_spec_sign_0" ,		//Valid values: radp_ctle_spec_sign_0 radp_ctle_spec_sign_1 
	parameter	adp_ctle_sweep_direction = "radp_ctle_sweep_direction_1" ,		//Valid values: radp_ctle_sweep_direction_0 radp_ctle_sweep_direction_1 
	parameter	adp_ctle_threshold = "radp_ctle_threshold_0" ,		//Valid values: radp_ctle_threshold_0 radp_ctle_threshold_1 radp_ctle_threshold_2 radp_ctle_threshold_3 radp_ctle_threshold_4 radp_ctle_threshold_5 radp_ctle_threshold_6 radp_ctle_threshold_7 radp_ctle_threshold_8 radp_ctle_threshold_9 radp_ctle_threshold_10 radp_ctle_threshold_11 radp_ctle_threshold_12 radp_ctle_threshold_13 radp_ctle_threshold_14 radp_ctle_threshold_15 
	parameter	adp_ctle_threshold_en = "radp_ctle_threshold_en_0" ,		//Valid values: radp_ctle_threshold_en_0 radp_ctle_threshold_en_1 
	parameter	adp_ctle_vref_polarity = "radp_ctle_vref_polarity_0" ,		//Valid values: radp_ctle_vref_polarity_0 radp_ctle_vref_polarity_1 
	parameter	adp_ctle_window = "radp_ctle_window_0" ,		//Valid values: radp_ctle_window_0 radp_ctle_window_1 radp_ctle_window_2 radp_ctle_window_3 radp_ctle_window_4 radp_ctle_window_5 radp_ctle_window_6 radp_ctle_window_7 radp_ctle_window_8 radp_ctle_window_9 radp_ctle_window_10 radp_ctle_window_11 radp_ctle_window_12 radp_ctle_window_13 radp_ctle_window_14 radp_ctle_window_15 radp_ctle_window_16 radp_ctle_window_17 radp_ctle_window_18 radp_ctle_window_19 radp_ctle_window_20 radp_ctle_window_21 radp_ctle_window_22 radp_ctle_window_23 radp_ctle_window_24 radp_ctle_window_25 radp_ctle_window_26 radp_ctle_window_27 radp_ctle_window_28 radp_ctle_window_29 radp_ctle_window_30 radp_ctle_window_31 
	parameter	adp_dfe_bw = "radp_dfe_bw_3" ,		//Valid values: radp_dfe_bw_0 radp_dfe_bw_1 radp_dfe_bw_2 radp_dfe_bw_3 radp_dfe_bw_4 radp_dfe_bw_5 radp_dfe_bw_6 radp_dfe_bw_7 
	parameter	adp_dfe_clkout_div_sel = "radp_dfe_clkout_div_sel_0" ,		//Valid values: radp_dfe_clkout_div_sel_0 radp_dfe_clkout_div_sel_1 
	parameter	adp_dfe_cycle = "radp_dfe_cycle_6" ,		//Valid values: radp_dfe_cycle_0 radp_dfe_cycle_1 radp_dfe_cycle_2 radp_dfe_cycle_3 radp_dfe_cycle_4 radp_dfe_cycle_5 radp_dfe_cycle_6 radp_dfe_cycle_7 
	parameter	adp_dfe_fltap_bypass = "radp_dfe_fltap_bypass_0" ,		//Valid values: radp_dfe_fltap_bypass_0 radp_dfe_fltap_bypass_1 
	parameter	adp_dfe_fltap_en = "radp_dfe_fltap_disable" ,		//Valid values: radp_dfe_fltap_disable radp_dfe_fltap_enable 
	parameter	adp_dfe_fltap_hold_en = "radp_dfe_fltap_not_held" ,		//Valid values: radp_dfe_fltap_not_held radp_dfe_fltap_hold 
	parameter	adp_dfe_fltap_load = "radp_dfe_fltap_load_0" ,		//Valid values: radp_dfe_fltap_load_0 radp_dfe_fltap_load_1 
	parameter	adp_dfe_fltap_position = "radp_dfe_fltap_position_0" ,		//Valid values: radp_dfe_fltap_position_0 radp_dfe_fltap_position_1 radp_dfe_fltap_position_2 radp_dfe_fltap_position_3 radp_dfe_fltap_position_4 radp_dfe_fltap_position_5 radp_dfe_fltap_position_6 radp_dfe_fltap_position_7 radp_dfe_fltap_position_8 radp_dfe_fltap_position_9 radp_dfe_fltap_position_10 radp_dfe_fltap_position_11 radp_dfe_fltap_position_12 radp_dfe_fltap_position_13 radp_dfe_fltap_position_14 radp_dfe_fltap_position_15 radp_dfe_fltap_position_16 radp_dfe_fltap_position_17 radp_dfe_fltap_position_18 radp_dfe_fltap_position_19 radp_dfe_fltap_position_20 radp_dfe_fltap_position_21 radp_dfe_fltap_position_22 radp_dfe_fltap_position_23 radp_dfe_fltap_position_24 radp_dfe_fltap_position_25 radp_dfe_fltap_position_26 radp_dfe_fltap_position_27 radp_dfe_fltap_position_28 radp_dfe_fltap_position_29 radp_dfe_fltap_position_30 radp_dfe_fltap_position_31 radp_dfe_fltap_position_32 radp_dfe_fltap_position_33 radp_dfe_fltap_position_34 radp_dfe_fltap_position_35 radp_dfe_fltap_position_36 radp_dfe_fltap_position_37 radp_dfe_fltap_position_38 radp_dfe_fltap_position_39 radp_dfe_fltap_position_40 radp_dfe_fltap_position_41 radp_dfe_fltap_position_42 radp_dfe_fltap_position_43 radp_dfe_fltap_position_44 radp_dfe_fltap_position_45 radp_dfe_fltap_position_46 radp_dfe_fltap_position_47 radp_dfe_fltap_position_48 radp_dfe_fltap_position_49 radp_dfe_fltap_position_50 radp_dfe_fltap_position_51 radp_dfe_fltap_position_52 radp_dfe_fltap_position_53 radp_dfe_fltap_position_54 radp_dfe_fltap_position_55 radp_dfe_fltap_position_56 radp_dfe_fltap_position_57 radp_dfe_fltap_position_58 radp_dfe_fltap_position_59 radp_dfe_fltap_position_60 radp_dfe_fltap_position_61 radp_dfe_fltap_position_62 radp_dfe_fltap_position_63 
	parameter	adp_dfe_force_spec_sign = "radp_dfe_force_spec_sign_0" ,		//Valid values: radp_dfe_force_spec_sign_0 radp_dfe_force_spec_sign_1 
	parameter	adp_dfe_fxtap1 = "radp_dfe_fxtap1_0" ,		//Valid values: radp_dfe_fxtap1_0 radp_dfe_fxtap1_1 radp_dfe_fxtap1_2 radp_dfe_fxtap1_3 radp_dfe_fxtap1_4 radp_dfe_fxtap1_5 radp_dfe_fxtap1_6 radp_dfe_fxtap1_7 radp_dfe_fxtap1_8 radp_dfe_fxtap1_9 radp_dfe_fxtap1_10 radp_dfe_fxtap1_11 radp_dfe_fxtap1_12 radp_dfe_fxtap1_13 radp_dfe_fxtap1_14 radp_dfe_fxtap1_15 radp_dfe_fxtap1_16 radp_dfe_fxtap1_17 radp_dfe_fxtap1_18 radp_dfe_fxtap1_19 radp_dfe_fxtap1_20 radp_dfe_fxtap1_21 radp_dfe_fxtap1_22 radp_dfe_fxtap1_23 radp_dfe_fxtap1_24 radp_dfe_fxtap1_25 radp_dfe_fxtap1_26 radp_dfe_fxtap1_27 radp_dfe_fxtap1_28 radp_dfe_fxtap1_29 radp_dfe_fxtap1_30 radp_dfe_fxtap1_31 radp_dfe_fxtap1_32 radp_dfe_fxtap1_33 radp_dfe_fxtap1_34 radp_dfe_fxtap1_35 radp_dfe_fxtap1_36 radp_dfe_fxtap1_37 radp_dfe_fxtap1_38 radp_dfe_fxtap1_39 radp_dfe_fxtap1_40 radp_dfe_fxtap1_41 radp_dfe_fxtap1_42 radp_dfe_fxtap1_43 radp_dfe_fxtap1_44 radp_dfe_fxtap1_45 radp_dfe_fxtap1_46 radp_dfe_fxtap1_47 radp_dfe_fxtap1_48 radp_dfe_fxtap1_49 radp_dfe_fxtap1_50 radp_dfe_fxtap1_51 radp_dfe_fxtap1_52 radp_dfe_fxtap1_53 radp_dfe_fxtap1_54 radp_dfe_fxtap1_55 radp_dfe_fxtap1_56 radp_dfe_fxtap1_57 radp_dfe_fxtap1_58 radp_dfe_fxtap1_59 radp_dfe_fxtap1_60 radp_dfe_fxtap1_61 radp_dfe_fxtap1_62 radp_dfe_fxtap1_63 radp_dfe_fxtap1_64 radp_dfe_fxtap1_65 radp_dfe_fxtap1_66 radp_dfe_fxtap1_67 radp_dfe_fxtap1_68 radp_dfe_fxtap1_69 radp_dfe_fxtap1_70 radp_dfe_fxtap1_71 radp_dfe_fxtap1_72 radp_dfe_fxtap1_73 radp_dfe_fxtap1_74 radp_dfe_fxtap1_75 radp_dfe_fxtap1_76 radp_dfe_fxtap1_77 radp_dfe_fxtap1_78 radp_dfe_fxtap1_79 radp_dfe_fxtap1_80 radp_dfe_fxtap1_81 radp_dfe_fxtap1_82 radp_dfe_fxtap1_83 radp_dfe_fxtap1_84 radp_dfe_fxtap1_85 radp_dfe_fxtap1_86 radp_dfe_fxtap1_87 radp_dfe_fxtap1_88 radp_dfe_fxtap1_89 radp_dfe_fxtap1_90 radp_dfe_fxtap1_91 radp_dfe_fxtap1_92 radp_dfe_fxtap1_93 radp_dfe_fxtap1_94 radp_dfe_fxtap1_95 radp_dfe_fxtap1_96 radp_dfe_fxtap1_97 radp_dfe_fxtap1_98 radp_dfe_fxtap1_99 radp_dfe_fxtap1_100 radp_dfe_fxtap1_101 radp_dfe_fxtap1_102 radp_dfe_fxtap1_103 radp_dfe_fxtap1_104 radp_dfe_fxtap1_105 radp_dfe_fxtap1_106 radp_dfe_fxtap1_107 radp_dfe_fxtap1_108 radp_dfe_fxtap1_109 radp_dfe_fxtap1_110 radp_dfe_fxtap1_111 radp_dfe_fxtap1_112 radp_dfe_fxtap1_113 radp_dfe_fxtap1_114 radp_dfe_fxtap1_115 radp_dfe_fxtap1_116 radp_dfe_fxtap1_117 radp_dfe_fxtap1_118 radp_dfe_fxtap1_119 radp_dfe_fxtap1_120 radp_dfe_fxtap1_121 radp_dfe_fxtap1_122 radp_dfe_fxtap1_123 radp_dfe_fxtap1_124 radp_dfe_fxtap1_125 radp_dfe_fxtap1_126 radp_dfe_fxtap1_127 
	parameter	adp_dfe_fxtap10 = "radp_dfe_fxtap10_0" ,		//Valid values: radp_dfe_fxtap10_0 radp_dfe_fxtap10_1 radp_dfe_fxtap10_2 radp_dfe_fxtap10_3 radp_dfe_fxtap10_4 radp_dfe_fxtap10_5 radp_dfe_fxtap10_6 radp_dfe_fxtap10_7 radp_dfe_fxtap10_8 radp_dfe_fxtap10_9 radp_dfe_fxtap10_10 radp_dfe_fxtap10_11 radp_dfe_fxtap10_12 radp_dfe_fxtap10_13 radp_dfe_fxtap10_14 radp_dfe_fxtap10_15 radp_dfe_fxtap10_16 radp_dfe_fxtap10_17 radp_dfe_fxtap10_18 radp_dfe_fxtap10_19 radp_dfe_fxtap10_20 radp_dfe_fxtap10_21 radp_dfe_fxtap10_22 radp_dfe_fxtap10_23 radp_dfe_fxtap10_24 radp_dfe_fxtap10_25 radp_dfe_fxtap10_26 radp_dfe_fxtap10_27 radp_dfe_fxtap10_28 radp_dfe_fxtap10_29 radp_dfe_fxtap10_30 radp_dfe_fxtap10_31 radp_dfe_fxtap10_32 radp_dfe_fxtap10_33 radp_dfe_fxtap10_34 radp_dfe_fxtap10_35 radp_dfe_fxtap10_36 radp_dfe_fxtap10_37 radp_dfe_fxtap10_38 radp_dfe_fxtap10_39 radp_dfe_fxtap10_40 radp_dfe_fxtap10_41 radp_dfe_fxtap10_42 radp_dfe_fxtap10_43 radp_dfe_fxtap10_44 radp_dfe_fxtap10_45 radp_dfe_fxtap10_46 radp_dfe_fxtap10_47 radp_dfe_fxtap10_48 radp_dfe_fxtap10_49 radp_dfe_fxtap10_50 radp_dfe_fxtap10_51 radp_dfe_fxtap10_52 radp_dfe_fxtap10_53 radp_dfe_fxtap10_54 radp_dfe_fxtap10_55 radp_dfe_fxtap10_56 radp_dfe_fxtap10_57 radp_dfe_fxtap10_58 radp_dfe_fxtap10_59 radp_dfe_fxtap10_60 radp_dfe_fxtap10_61 radp_dfe_fxtap10_62 radp_dfe_fxtap10_63 
	parameter	adp_dfe_fxtap10_sgn = "radp_dfe_fxtap10_sgn_0" ,		//Valid values: radp_dfe_fxtap10_sgn_0 radp_dfe_fxtap10_sgn_1 
	parameter	adp_dfe_fxtap11 = "radp_dfe_fxtap11_0" ,		//Valid values: radp_dfe_fxtap11_0 radp_dfe_fxtap11_1 radp_dfe_fxtap11_2 radp_dfe_fxtap11_3 radp_dfe_fxtap11_4 radp_dfe_fxtap11_5 radp_dfe_fxtap11_6 radp_dfe_fxtap11_7 radp_dfe_fxtap11_8 radp_dfe_fxtap11_9 radp_dfe_fxtap11_10 radp_dfe_fxtap11_11 radp_dfe_fxtap11_12 radp_dfe_fxtap11_13 radp_dfe_fxtap11_14 radp_dfe_fxtap11_15 radp_dfe_fxtap11_16 radp_dfe_fxtap11_17 radp_dfe_fxtap11_18 radp_dfe_fxtap11_19 radp_dfe_fxtap11_20 radp_dfe_fxtap11_21 radp_dfe_fxtap11_22 radp_dfe_fxtap11_23 radp_dfe_fxtap11_24 radp_dfe_fxtap11_25 radp_dfe_fxtap11_26 radp_dfe_fxtap11_27 radp_dfe_fxtap11_28 radp_dfe_fxtap11_29 radp_dfe_fxtap11_30 radp_dfe_fxtap11_31 radp_dfe_fxtap11_32 radp_dfe_fxtap11_33 radp_dfe_fxtap11_34 radp_dfe_fxtap11_35 radp_dfe_fxtap11_36 radp_dfe_fxtap11_37 radp_dfe_fxtap11_38 radp_dfe_fxtap11_39 radp_dfe_fxtap11_40 radp_dfe_fxtap11_41 radp_dfe_fxtap11_42 radp_dfe_fxtap11_43 radp_dfe_fxtap11_44 radp_dfe_fxtap11_45 radp_dfe_fxtap11_46 radp_dfe_fxtap11_47 radp_dfe_fxtap11_48 radp_dfe_fxtap11_49 radp_dfe_fxtap11_50 radp_dfe_fxtap11_51 radp_dfe_fxtap11_52 radp_dfe_fxtap11_53 radp_dfe_fxtap11_54 radp_dfe_fxtap11_55 radp_dfe_fxtap11_56 radp_dfe_fxtap11_57 radp_dfe_fxtap11_58 radp_dfe_fxtap11_59 radp_dfe_fxtap11_60 radp_dfe_fxtap11_61 radp_dfe_fxtap11_62 radp_dfe_fxtap11_63 
	parameter	adp_dfe_fxtap11_sgn = "radp_dfe_fxtap11_sgn_0" ,		//Valid values: radp_dfe_fxtap11_sgn_0 radp_dfe_fxtap11_sgn_1 
	parameter	adp_dfe_fxtap2 = "radp_dfe_fxtap2_0" ,		//Valid values: radp_dfe_fxtap2_0 radp_dfe_fxtap2_1 radp_dfe_fxtap2_2 radp_dfe_fxtap2_3 radp_dfe_fxtap2_4 radp_dfe_fxtap2_5 radp_dfe_fxtap2_6 radp_dfe_fxtap2_7 radp_dfe_fxtap2_8 radp_dfe_fxtap2_9 radp_dfe_fxtap2_10 radp_dfe_fxtap2_11 radp_dfe_fxtap2_12 radp_dfe_fxtap2_13 radp_dfe_fxtap2_14 radp_dfe_fxtap2_15 radp_dfe_fxtap2_16 radp_dfe_fxtap2_17 radp_dfe_fxtap2_18 radp_dfe_fxtap2_19 radp_dfe_fxtap2_20 radp_dfe_fxtap2_21 radp_dfe_fxtap2_22 radp_dfe_fxtap2_23 radp_dfe_fxtap2_24 radp_dfe_fxtap2_25 radp_dfe_fxtap2_26 radp_dfe_fxtap2_27 radp_dfe_fxtap2_28 radp_dfe_fxtap2_29 radp_dfe_fxtap2_30 radp_dfe_fxtap2_31 radp_dfe_fxtap2_32 radp_dfe_fxtap2_33 radp_dfe_fxtap2_34 radp_dfe_fxtap2_35 radp_dfe_fxtap2_36 radp_dfe_fxtap2_37 radp_dfe_fxtap2_38 radp_dfe_fxtap2_39 radp_dfe_fxtap2_40 radp_dfe_fxtap2_41 radp_dfe_fxtap2_42 radp_dfe_fxtap2_43 radp_dfe_fxtap2_44 radp_dfe_fxtap2_45 radp_dfe_fxtap2_46 radp_dfe_fxtap2_47 radp_dfe_fxtap2_48 radp_dfe_fxtap2_49 radp_dfe_fxtap2_50 radp_dfe_fxtap2_51 radp_dfe_fxtap2_52 radp_dfe_fxtap2_53 radp_dfe_fxtap2_54 radp_dfe_fxtap2_55 radp_dfe_fxtap2_56 radp_dfe_fxtap2_57 radp_dfe_fxtap2_58 radp_dfe_fxtap2_59 radp_dfe_fxtap2_60 radp_dfe_fxtap2_61 radp_dfe_fxtap2_62 radp_dfe_fxtap2_63 radp_dfe_fxtap2_64 radp_dfe_fxtap2_65 radp_dfe_fxtap2_66 radp_dfe_fxtap2_67 radp_dfe_fxtap2_68 radp_dfe_fxtap2_69 radp_dfe_fxtap2_70 radp_dfe_fxtap2_71 radp_dfe_fxtap2_72 radp_dfe_fxtap2_73 radp_dfe_fxtap2_74 radp_dfe_fxtap2_75 radp_dfe_fxtap2_76 radp_dfe_fxtap2_77 radp_dfe_fxtap2_78 radp_dfe_fxtap2_79 radp_dfe_fxtap2_80 radp_dfe_fxtap2_81 radp_dfe_fxtap2_82 radp_dfe_fxtap2_83 radp_dfe_fxtap2_84 radp_dfe_fxtap2_85 radp_dfe_fxtap2_86 radp_dfe_fxtap2_87 radp_dfe_fxtap2_88 radp_dfe_fxtap2_89 radp_dfe_fxtap2_90 radp_dfe_fxtap2_91 radp_dfe_fxtap2_92 radp_dfe_fxtap2_93 radp_dfe_fxtap2_94 radp_dfe_fxtap2_95 radp_dfe_fxtap2_96 radp_dfe_fxtap2_97 radp_dfe_fxtap2_98 radp_dfe_fxtap2_99 radp_dfe_fxtap2_100 radp_dfe_fxtap2_101 radp_dfe_fxtap2_102 radp_dfe_fxtap2_103 radp_dfe_fxtap2_104 radp_dfe_fxtap2_105 radp_dfe_fxtap2_106 radp_dfe_fxtap2_107 radp_dfe_fxtap2_108 radp_dfe_fxtap2_109 radp_dfe_fxtap2_110 radp_dfe_fxtap2_111 radp_dfe_fxtap2_112 radp_dfe_fxtap2_113 radp_dfe_fxtap2_114 radp_dfe_fxtap2_115 radp_dfe_fxtap2_116 radp_dfe_fxtap2_117 radp_dfe_fxtap2_118 radp_dfe_fxtap2_119 radp_dfe_fxtap2_120 radp_dfe_fxtap2_121 radp_dfe_fxtap2_122 radp_dfe_fxtap2_123 radp_dfe_fxtap2_124 radp_dfe_fxtap2_125 radp_dfe_fxtap2_126 radp_dfe_fxtap2_127 
	parameter	adp_dfe_fxtap2_sgn = "radp_dfe_fxtap2_sgn_0" ,		//Valid values: radp_dfe_fxtap2_sgn_0 radp_dfe_fxtap2_sgn_1 
	parameter	adp_dfe_fxtap3 = "radp_dfe_fxtap3_0" ,		//Valid values: radp_dfe_fxtap3_0 radp_dfe_fxtap3_1 radp_dfe_fxtap3_2 radp_dfe_fxtap3_3 radp_dfe_fxtap3_4 radp_dfe_fxtap3_5 radp_dfe_fxtap3_6 radp_dfe_fxtap3_7 radp_dfe_fxtap3_8 radp_dfe_fxtap3_9 radp_dfe_fxtap3_10 radp_dfe_fxtap3_11 radp_dfe_fxtap3_12 radp_dfe_fxtap3_13 radp_dfe_fxtap3_14 radp_dfe_fxtap3_15 radp_dfe_fxtap3_16 radp_dfe_fxtap3_17 radp_dfe_fxtap3_18 radp_dfe_fxtap3_19 radp_dfe_fxtap3_20 radp_dfe_fxtap3_21 radp_dfe_fxtap3_22 radp_dfe_fxtap3_23 radp_dfe_fxtap3_24 radp_dfe_fxtap3_25 radp_dfe_fxtap3_26 radp_dfe_fxtap3_27 radp_dfe_fxtap3_28 radp_dfe_fxtap3_29 radp_dfe_fxtap3_30 radp_dfe_fxtap3_31 radp_dfe_fxtap3_32 radp_dfe_fxtap3_33 radp_dfe_fxtap3_34 radp_dfe_fxtap3_35 radp_dfe_fxtap3_36 radp_dfe_fxtap3_37 radp_dfe_fxtap3_38 radp_dfe_fxtap3_39 radp_dfe_fxtap3_40 radp_dfe_fxtap3_41 radp_dfe_fxtap3_42 radp_dfe_fxtap3_43 radp_dfe_fxtap3_44 radp_dfe_fxtap3_45 radp_dfe_fxtap3_46 radp_dfe_fxtap3_47 radp_dfe_fxtap3_48 radp_dfe_fxtap3_49 radp_dfe_fxtap3_50 radp_dfe_fxtap3_51 radp_dfe_fxtap3_52 radp_dfe_fxtap3_53 radp_dfe_fxtap3_54 radp_dfe_fxtap3_55 radp_dfe_fxtap3_56 radp_dfe_fxtap3_57 radp_dfe_fxtap3_58 radp_dfe_fxtap3_59 radp_dfe_fxtap3_60 radp_dfe_fxtap3_61 radp_dfe_fxtap3_62 radp_dfe_fxtap3_63 radp_dfe_fxtap3_64 radp_dfe_fxtap3_65 radp_dfe_fxtap3_66 radp_dfe_fxtap3_67 radp_dfe_fxtap3_68 radp_dfe_fxtap3_69 radp_dfe_fxtap3_70 radp_dfe_fxtap3_71 radp_dfe_fxtap3_72 radp_dfe_fxtap3_73 radp_dfe_fxtap3_74 radp_dfe_fxtap3_75 radp_dfe_fxtap3_76 radp_dfe_fxtap3_77 radp_dfe_fxtap3_78 radp_dfe_fxtap3_79 radp_dfe_fxtap3_80 radp_dfe_fxtap3_81 radp_dfe_fxtap3_82 radp_dfe_fxtap3_83 radp_dfe_fxtap3_84 radp_dfe_fxtap3_85 radp_dfe_fxtap3_86 radp_dfe_fxtap3_87 radp_dfe_fxtap3_88 radp_dfe_fxtap3_89 radp_dfe_fxtap3_90 radp_dfe_fxtap3_91 radp_dfe_fxtap3_92 radp_dfe_fxtap3_93 radp_dfe_fxtap3_94 radp_dfe_fxtap3_95 radp_dfe_fxtap3_96 radp_dfe_fxtap3_97 radp_dfe_fxtap3_98 radp_dfe_fxtap3_99 radp_dfe_fxtap3_100 radp_dfe_fxtap3_101 radp_dfe_fxtap3_102 radp_dfe_fxtap3_103 radp_dfe_fxtap3_104 radp_dfe_fxtap3_105 radp_dfe_fxtap3_106 radp_dfe_fxtap3_107 radp_dfe_fxtap3_108 radp_dfe_fxtap3_109 radp_dfe_fxtap3_110 radp_dfe_fxtap3_111 radp_dfe_fxtap3_112 radp_dfe_fxtap3_113 radp_dfe_fxtap3_114 radp_dfe_fxtap3_115 radp_dfe_fxtap3_116 radp_dfe_fxtap3_117 radp_dfe_fxtap3_118 radp_dfe_fxtap3_119 radp_dfe_fxtap3_120 radp_dfe_fxtap3_121 radp_dfe_fxtap3_122 radp_dfe_fxtap3_123 radp_dfe_fxtap3_124 radp_dfe_fxtap3_125 radp_dfe_fxtap3_126 radp_dfe_fxtap3_127 
	parameter	adp_dfe_fxtap3_sgn = "radp_dfe_fxtap3_sgn_0" ,		//Valid values: radp_dfe_fxtap3_sgn_0 radp_dfe_fxtap3_sgn_1 
	parameter	adp_dfe_fxtap4 = "radp_dfe_fxtap4_0" ,		//Valid values: radp_dfe_fxtap4_0 radp_dfe_fxtap4_1 radp_dfe_fxtap4_2 radp_dfe_fxtap4_3 radp_dfe_fxtap4_4 radp_dfe_fxtap4_5 radp_dfe_fxtap4_6 radp_dfe_fxtap4_7 radp_dfe_fxtap4_8 radp_dfe_fxtap4_9 radp_dfe_fxtap4_10 radp_dfe_fxtap4_11 radp_dfe_fxtap4_12 radp_dfe_fxtap4_13 radp_dfe_fxtap4_14 radp_dfe_fxtap4_15 radp_dfe_fxtap4_16 radp_dfe_fxtap4_17 radp_dfe_fxtap4_18 radp_dfe_fxtap4_19 radp_dfe_fxtap4_20 radp_dfe_fxtap4_21 radp_dfe_fxtap4_22 radp_dfe_fxtap4_23 radp_dfe_fxtap4_24 radp_dfe_fxtap4_25 radp_dfe_fxtap4_26 radp_dfe_fxtap4_27 radp_dfe_fxtap4_28 radp_dfe_fxtap4_29 radp_dfe_fxtap4_30 radp_dfe_fxtap4_31 radp_dfe_fxtap4_32 radp_dfe_fxtap4_33 radp_dfe_fxtap4_34 radp_dfe_fxtap4_35 radp_dfe_fxtap4_36 radp_dfe_fxtap4_37 radp_dfe_fxtap4_38 radp_dfe_fxtap4_39 radp_dfe_fxtap4_40 radp_dfe_fxtap4_41 radp_dfe_fxtap4_42 radp_dfe_fxtap4_43 radp_dfe_fxtap4_44 radp_dfe_fxtap4_45 radp_dfe_fxtap4_46 radp_dfe_fxtap4_47 radp_dfe_fxtap4_48 radp_dfe_fxtap4_49 radp_dfe_fxtap4_50 radp_dfe_fxtap4_51 radp_dfe_fxtap4_52 radp_dfe_fxtap4_53 radp_dfe_fxtap4_54 radp_dfe_fxtap4_55 radp_dfe_fxtap4_56 radp_dfe_fxtap4_57 radp_dfe_fxtap4_58 radp_dfe_fxtap4_59 radp_dfe_fxtap4_60 radp_dfe_fxtap4_61 radp_dfe_fxtap4_62 radp_dfe_fxtap4_63 
	parameter	adp_dfe_fxtap4_sgn = "radp_dfe_fxtap4_sgn_0" ,		//Valid values: radp_dfe_fxtap4_sgn_0 radp_dfe_fxtap4_sgn_1 
	parameter	adp_dfe_fxtap5 = "radp_dfe_fxtap5_0" ,		//Valid values: radp_dfe_fxtap5_0 radp_dfe_fxtap5_1 radp_dfe_fxtap5_2 radp_dfe_fxtap5_3 radp_dfe_fxtap5_4 radp_dfe_fxtap5_5 radp_dfe_fxtap5_6 radp_dfe_fxtap5_7 radp_dfe_fxtap5_8 radp_dfe_fxtap5_9 radp_dfe_fxtap5_10 radp_dfe_fxtap5_11 radp_dfe_fxtap5_12 radp_dfe_fxtap5_13 radp_dfe_fxtap5_14 radp_dfe_fxtap5_15 radp_dfe_fxtap5_16 radp_dfe_fxtap5_17 radp_dfe_fxtap5_18 radp_dfe_fxtap5_19 radp_dfe_fxtap5_20 radp_dfe_fxtap5_21 radp_dfe_fxtap5_22 radp_dfe_fxtap5_23 radp_dfe_fxtap5_24 radp_dfe_fxtap5_25 radp_dfe_fxtap5_26 radp_dfe_fxtap5_27 radp_dfe_fxtap5_28 radp_dfe_fxtap5_29 radp_dfe_fxtap5_30 radp_dfe_fxtap5_31 radp_dfe_fxtap5_32 radp_dfe_fxtap5_33 radp_dfe_fxtap5_34 radp_dfe_fxtap5_35 radp_dfe_fxtap5_36 radp_dfe_fxtap5_37 radp_dfe_fxtap5_38 radp_dfe_fxtap5_39 radp_dfe_fxtap5_40 radp_dfe_fxtap5_41 radp_dfe_fxtap5_42 radp_dfe_fxtap5_43 radp_dfe_fxtap5_44 radp_dfe_fxtap5_45 radp_dfe_fxtap5_46 radp_dfe_fxtap5_47 radp_dfe_fxtap5_48 radp_dfe_fxtap5_49 radp_dfe_fxtap5_50 radp_dfe_fxtap5_51 radp_dfe_fxtap5_52 radp_dfe_fxtap5_53 radp_dfe_fxtap5_54 radp_dfe_fxtap5_55 radp_dfe_fxtap5_56 radp_dfe_fxtap5_57 radp_dfe_fxtap5_58 radp_dfe_fxtap5_59 radp_dfe_fxtap5_60 radp_dfe_fxtap5_61 radp_dfe_fxtap5_62 radp_dfe_fxtap5_63 
	parameter	adp_dfe_fxtap5_sgn = "radp_dfe_fxtap5_sgn_0" ,		//Valid values: radp_dfe_fxtap5_sgn_0 radp_dfe_fxtap5_sgn_1 
	parameter	adp_dfe_fxtap6 = "radp_dfe_fxtap6_0" ,		//Valid values: radp_dfe_fxtap6_0 radp_dfe_fxtap6_1 radp_dfe_fxtap6_2 radp_dfe_fxtap6_3 radp_dfe_fxtap6_4 radp_dfe_fxtap6_5 radp_dfe_fxtap6_6 radp_dfe_fxtap6_7 radp_dfe_fxtap6_8 radp_dfe_fxtap6_9 radp_dfe_fxtap6_10 radp_dfe_fxtap6_11 radp_dfe_fxtap6_12 radp_dfe_fxtap6_13 radp_dfe_fxtap6_14 radp_dfe_fxtap6_15 radp_dfe_fxtap6_16 radp_dfe_fxtap6_17 radp_dfe_fxtap6_18 radp_dfe_fxtap6_19 radp_dfe_fxtap6_20 radp_dfe_fxtap6_21 radp_dfe_fxtap6_22 radp_dfe_fxtap6_23 radp_dfe_fxtap6_24 radp_dfe_fxtap6_25 radp_dfe_fxtap6_26 radp_dfe_fxtap6_27 radp_dfe_fxtap6_28 radp_dfe_fxtap6_29 radp_dfe_fxtap6_30 radp_dfe_fxtap6_31 
	parameter	adp_dfe_fxtap6_sgn = "radp_dfe_fxtap6_sgn_0" ,		//Valid values: radp_dfe_fxtap6_sgn_0 radp_dfe_fxtap6_sgn_1 
	parameter	adp_dfe_fxtap7 = "radp_dfe_fxtap7_0" ,		//Valid values: radp_dfe_fxtap7_0 radp_dfe_fxtap7_1 radp_dfe_fxtap7_2 radp_dfe_fxtap7_3 radp_dfe_fxtap7_4 radp_dfe_fxtap7_5 radp_dfe_fxtap7_6 radp_dfe_fxtap7_7 radp_dfe_fxtap7_8 radp_dfe_fxtap7_9 radp_dfe_fxtap7_10 radp_dfe_fxtap7_11 radp_dfe_fxtap7_12 radp_dfe_fxtap7_13 radp_dfe_fxtap7_14 radp_dfe_fxtap7_15 radp_dfe_fxtap7_16 radp_dfe_fxtap7_17 radp_dfe_fxtap7_18 radp_dfe_fxtap7_19 radp_dfe_fxtap7_20 radp_dfe_fxtap7_21 radp_dfe_fxtap7_22 radp_dfe_fxtap7_23 radp_dfe_fxtap7_24 radp_dfe_fxtap7_25 radp_dfe_fxtap7_26 radp_dfe_fxtap7_27 radp_dfe_fxtap7_28 radp_dfe_fxtap7_29 radp_dfe_fxtap7_30 radp_dfe_fxtap7_31 
	parameter	adp_dfe_fxtap7_sgn = "radp_dfe_fxtap7_sgn_0" ,		//Valid values: radp_dfe_fxtap7_sgn_0 radp_dfe_fxtap7_sgn_1 
	parameter	adp_dfe_fxtap8 = "radp_dfe_fxtap8_0" ,		//Valid values: radp_dfe_fxtap8_0 radp_dfe_fxtap8_1 radp_dfe_fxtap8_2 radp_dfe_fxtap8_3 radp_dfe_fxtap8_4 radp_dfe_fxtap8_5 radp_dfe_fxtap8_6 radp_dfe_fxtap8_7 radp_dfe_fxtap8_8 radp_dfe_fxtap8_9 radp_dfe_fxtap8_10 radp_dfe_fxtap8_11 radp_dfe_fxtap8_12 radp_dfe_fxtap8_13 radp_dfe_fxtap8_14 radp_dfe_fxtap8_15 radp_dfe_fxtap8_16 radp_dfe_fxtap8_17 radp_dfe_fxtap8_18 radp_dfe_fxtap8_19 radp_dfe_fxtap8_20 radp_dfe_fxtap8_21 radp_dfe_fxtap8_22 radp_dfe_fxtap8_23 radp_dfe_fxtap8_24 radp_dfe_fxtap8_25 radp_dfe_fxtap8_26 radp_dfe_fxtap8_27 radp_dfe_fxtap8_28 radp_dfe_fxtap8_29 radp_dfe_fxtap8_30 radp_dfe_fxtap8_31 radp_dfe_fxtap8_32 radp_dfe_fxtap8_33 radp_dfe_fxtap8_34 radp_dfe_fxtap8_35 radp_dfe_fxtap8_36 radp_dfe_fxtap8_37 radp_dfe_fxtap8_38 radp_dfe_fxtap8_39 radp_dfe_fxtap8_40 radp_dfe_fxtap8_41 radp_dfe_fxtap8_42 radp_dfe_fxtap8_43 radp_dfe_fxtap8_44 radp_dfe_fxtap8_45 radp_dfe_fxtap8_46 radp_dfe_fxtap8_47 radp_dfe_fxtap8_48 radp_dfe_fxtap8_49 radp_dfe_fxtap8_50 radp_dfe_fxtap8_51 radp_dfe_fxtap8_52 radp_dfe_fxtap8_53 radp_dfe_fxtap8_54 radp_dfe_fxtap8_55 radp_dfe_fxtap8_56 radp_dfe_fxtap8_57 radp_dfe_fxtap8_58 radp_dfe_fxtap8_59 radp_dfe_fxtap8_60 radp_dfe_fxtap8_61 radp_dfe_fxtap8_62 radp_dfe_fxtap8_63 
	parameter	adp_dfe_fxtap8_sgn = "radp_dfe_fxtap8_sgn_0" ,		//Valid values: radp_dfe_fxtap8_sgn_0 radp_dfe_fxtap8_sgn_1 
	parameter	adp_dfe_fxtap9 = "radp_dfe_fxtap9_0" ,		//Valid values: radp_dfe_fxtap9_0 radp_dfe_fxtap9_1 radp_dfe_fxtap9_2 radp_dfe_fxtap9_3 radp_dfe_fxtap9_4 radp_dfe_fxtap9_5 radp_dfe_fxtap9_6 radp_dfe_fxtap9_7 radp_dfe_fxtap9_8 radp_dfe_fxtap9_9 radp_dfe_fxtap9_10 radp_dfe_fxtap9_11 radp_dfe_fxtap9_12 radp_dfe_fxtap9_13 radp_dfe_fxtap9_14 radp_dfe_fxtap9_15 radp_dfe_fxtap9_16 radp_dfe_fxtap9_17 radp_dfe_fxtap9_18 radp_dfe_fxtap9_19 radp_dfe_fxtap9_20 radp_dfe_fxtap9_21 radp_dfe_fxtap9_22 radp_dfe_fxtap9_23 radp_dfe_fxtap9_24 radp_dfe_fxtap9_25 radp_dfe_fxtap9_26 radp_dfe_fxtap9_27 radp_dfe_fxtap9_28 radp_dfe_fxtap9_29 radp_dfe_fxtap9_30 radp_dfe_fxtap9_31 radp_dfe_fxtap9_32 radp_dfe_fxtap9_33 radp_dfe_fxtap9_34 radp_dfe_fxtap9_35 radp_dfe_fxtap9_36 radp_dfe_fxtap9_37 radp_dfe_fxtap9_38 radp_dfe_fxtap9_39 radp_dfe_fxtap9_40 radp_dfe_fxtap9_41 radp_dfe_fxtap9_42 radp_dfe_fxtap9_43 radp_dfe_fxtap9_44 radp_dfe_fxtap9_45 radp_dfe_fxtap9_46 radp_dfe_fxtap9_47 radp_dfe_fxtap9_48 radp_dfe_fxtap9_49 radp_dfe_fxtap9_50 radp_dfe_fxtap9_51 radp_dfe_fxtap9_52 radp_dfe_fxtap9_53 radp_dfe_fxtap9_54 radp_dfe_fxtap9_55 radp_dfe_fxtap9_56 radp_dfe_fxtap9_57 radp_dfe_fxtap9_58 radp_dfe_fxtap9_59 radp_dfe_fxtap9_60 radp_dfe_fxtap9_61 radp_dfe_fxtap9_62 radp_dfe_fxtap9_63 
	parameter	adp_dfe_fxtap9_sgn = "radp_dfe_fxtap9_sgn_0" ,		//Valid values: radp_dfe_fxtap9_sgn_0 radp_dfe_fxtap9_sgn_1 
	parameter	adp_dfe_fxtap_bypass = "radp_dfe_fxtap_bypass_0" ,		//Valid values: radp_dfe_fxtap_bypass_0 radp_dfe_fxtap_bypass_1 
	parameter	adp_dfe_fxtap_en = "radp_dfe_fxtap_disable" ,		//Valid values: radp_dfe_fxtap_disable radp_dfe_fxtap_enable 
	parameter	adp_dfe_fxtap_hold_en = "radp_dfe_fxtap_not_held" ,		//Valid values: radp_dfe_fxtap_not_held radp_dfe_fxtap_hold 
	parameter	adp_dfe_fxtap_load = "radp_dfe_fxtap_load_0" ,		//Valid values: radp_dfe_fxtap_load_0 radp_dfe_fxtap_load_1 
	parameter	adp_dfe_mode = "radp_dfe_mode_0" ,		//Valid values: radp_dfe_mode_0 radp_dfe_mode_1 radp_dfe_mode_2 radp_dfe_mode_3 radp_dfe_mode_4 radp_dfe_mode_5 radp_dfe_mode_6 radp_dfe_mode_7 
	parameter	adp_dfe_spec_sign = "radp_dfe_spec_sign_0" ,		//Valid values: radp_dfe_spec_sign_0 radp_dfe_spec_sign_1 
	parameter	adp_dfe_vref_polarity = "radp_dfe_vref_polarity_0" ,		//Valid values: radp_dfe_vref_polarity_0 radp_dfe_vref_polarity_1 
	parameter	adp_force_freqlock = "radp_force_freqlock_off" ,		//Valid values: radp_force_freqlock_off radp_force_freqlock_on 
	parameter	adp_frame_capture = "radp_frame_capture_0" ,		//Valid values: radp_frame_capture_0 radp_frame_capture_1 
	parameter	adp_frame_en = "radp_frame_en_0" ,		//Valid values: radp_frame_en_0 radp_frame_en_1 
	parameter	adp_frame_odi_sel = "radp_frame_odi_sel_0" ,		//Valid values: radp_frame_odi_sel_0 radp_frame_odi_sel_1 
	parameter	adp_frame_out_sel = "radp_frame_out_sel_0" ,		//Valid values: radp_frame_out_sel_0 radp_frame_out_sel_1 
	parameter	adp_lfeq_fb_sel = "radp_lfeq_fb_sel_0" ,		//Valid values: radp_lfeq_fb_sel_0 radp_lfeq_fb_sel_1 radp_lfeq_fb_sel_2 radp_lfeq_fb_sel_3 radp_lfeq_fb_sel_4 radp_lfeq_fb_sel_5 radp_lfeq_fb_sel_6 radp_lfeq_fb_sel_7 
	parameter	adp_mode = "radp_mode_0" ,		//Valid values: radp_mode_0 radp_mode_1 radp_mode_2 radp_mode_3 radp_mode_4 radp_mode_5 radp_mode_6 radp_mode_7 radp_mode_8 radp_mode_9 radp_mode_10 radp_mode_11 radp_mode_12 radp_mode_13 radp_mode_14 radp_mode_15 
	parameter	adp_odi_control_sel = "radp_odi_control_sel_0" ,		//Valid values: radp_odi_control_sel_0 radp_odi_control_sel_1 
	parameter	adp_onetime_dfe = "radp_onetime_dfe_0" ,		//Valid values: radp_onetime_dfe_0 radp_onetime_dfe_1 
	parameter	adp_spec_avg_window = "radp_spec_avg_window_4" ,		//Valid values: radp_spec_avg_window_0 radp_spec_avg_window_1 radp_spec_avg_window_2 radp_spec_avg_window_3 radp_spec_avg_window_4 radp_spec_avg_window_5 radp_spec_avg_window_6 radp_spec_avg_window_7 
	parameter	adp_spec_trans_filter = "radp_spec_trans_filter_2" ,		//Valid values: radp_spec_trans_filter_0 radp_spec_trans_filter_1 radp_spec_trans_filter_2 radp_spec_trans_filter_3 
	parameter	adp_status_sel = "radp_status_sel_0" ,		//Valid values: radp_status_sel_0 radp_status_sel_1 radp_status_sel_2 radp_status_sel_3 radp_status_sel_4 radp_status_sel_5 radp_status_sel_6 radp_status_sel_7 radp_status_sel_8 radp_status_sel_9 radp_status_sel_10 radp_status_sel_11 radp_status_sel_12 radp_status_sel_13 radp_status_sel_14 radp_status_sel_15 radp_status_sel_16 radp_status_sel_17 radp_status_sel_18 radp_status_sel_19 radp_status_sel_20 radp_status_sel_21 radp_status_sel_22 radp_status_sel_23 radp_status_sel_24 radp_status_sel_25 radp_status_sel_26 radp_status_sel_27 radp_status_sel_28 radp_status_sel_29 radp_status_sel_30 radp_status_sel_31 radp_status_sel_32 radp_status_sel_33 radp_status_sel_34 radp_status_sel_35 radp_status_sel_36 radp_status_sel_37 radp_status_sel_38 radp_status_sel_39 radp_status_sel_40 radp_status_sel_41 radp_status_sel_42 radp_status_sel_43 radp_status_sel_44 radp_status_sel_45 radp_status_sel_46 radp_status_sel_47 radp_status_sel_48 radp_status_sel_49 radp_status_sel_50 radp_status_sel_51 radp_status_sel_52 radp_status_sel_53 radp_status_sel_54 radp_status_sel_55 radp_status_sel_56 radp_status_sel_57 radp_status_sel_58 radp_status_sel_59 radp_status_sel_60 radp_status_sel_61 radp_status_sel_62 radp_status_sel_63 
	parameter	adp_vga_bypass = "radp_vga_bypass_0" ,		//Valid values: radp_vga_bypass_0 radp_vga_bypass_1 
	parameter	adp_vga_en = "radp_vga_disable" ,		//Valid values: radp_vga_disable radp_vga_enable 
	parameter	adp_vga_load = "radp_vga_load_0" ,		//Valid values: radp_vga_load_0 radp_vga_load_1 
	parameter	adp_vga_polarity = "radp_vga_polarity_0" ,		//Valid values: radp_vga_polarity_0 radp_vga_polarity_1 
	parameter	adp_vga_sel = "radp_vga_sel_0" ,		//Valid values: radp_vga_sel_0 radp_vga_sel_1 radp_vga_sel_2 radp_vga_sel_3 radp_vga_sel_4 radp_vga_sel_5 radp_vga_sel_6 radp_vga_sel_7 
	parameter	adp_vga_sweep_direction = "radp_vga_sweep_direction_1" ,		//Valid values: radp_vga_sweep_direction_0 radp_vga_sweep_direction_1 
	parameter	adp_vga_threshold = "radp_vga_threshold_4" ,		//Valid values: radp_vga_threshold_0 radp_vga_threshold_1 radp_vga_threshold_2 radp_vga_threshold_3 radp_vga_threshold_4 radp_vga_threshold_5 radp_vga_threshold_6 radp_vga_threshold_7 
	parameter	adp_vref_bw = "radp_vref_bw_1" ,		//Valid values: radp_vref_bw_0 radp_vref_bw_1 radp_vref_bw_2 radp_vref_bw_3 radp_vref_bw_4 radp_vref_bw_5 radp_vref_bw_6 radp_vref_bw_7 
	parameter	adp_vref_bypass = "radp_vref_bypass_0" ,		//Valid values: radp_vref_bypass_0 radp_vref_bypass_1 
	parameter	adp_vref_cycle = "radp_vref_cycle_6" ,		//Valid values: radp_vref_cycle_0 radp_vref_cycle_1 radp_vref_cycle_2 radp_vref_cycle_3 radp_vref_cycle_4 radp_vref_cycle_5 radp_vref_cycle_6 radp_vref_cycle_7 
	parameter	adp_vref_dfe_spec_en = "radp_vref_dfe_spec_en_0" ,		//Valid values: radp_vref_dfe_spec_en_0 radp_vref_dfe_spec_en_1 
	parameter	adp_vref_en = "radp_vref_disable" ,		//Valid values: radp_vref_disable radp_vref_enable 
	parameter	adp_vref_hold_en = "radp_vref_not_held" ,		//Valid values: radp_vref_not_held radp_vref_hold 
	parameter	adp_vref_load = "radp_vref_load_0" ,		//Valid values: radp_vref_load_0 radp_vref_load_1 
	parameter	adp_vref_polarity = "radp_vref_polarity_0" ,		//Valid values: radp_vref_polarity_0 radp_vref_polarity_1 
	parameter	adp_vref_sel = "radp_vref_sel_21" ,		//Valid values: radp_vref_sel_0 radp_vref_sel_1 radp_vref_sel_2 radp_vref_sel_3 radp_vref_sel_4 radp_vref_sel_5 radp_vref_sel_6 radp_vref_sel_7 radp_vref_sel_8 radp_vref_sel_9 radp_vref_sel_10 radp_vref_sel_11 radp_vref_sel_12 radp_vref_sel_13 radp_vref_sel_14 radp_vref_sel_15 radp_vref_sel_16 radp_vref_sel_17 radp_vref_sel_18 radp_vref_sel_19 radp_vref_sel_20 radp_vref_sel_21 radp_vref_sel_22 radp_vref_sel_23 radp_vref_sel_24 radp_vref_sel_25 radp_vref_sel_26 radp_vref_sel_27 radp_vref_sel_28 radp_vref_sel_29 radp_vref_sel_30 radp_vref_sel_31 
	parameter	adp_vref_vga_level = "radp_vref_vga_level_13" ,		//Valid values: radp_vref_vga_level_0 radp_vref_vga_level_1 radp_vref_vga_level_2 radp_vref_vga_level_3 radp_vref_vga_level_4 radp_vref_vga_level_5 radp_vref_vga_level_6 radp_vref_vga_level_7 radp_vref_vga_level_8 radp_vref_vga_level_9 radp_vref_vga_level_10 radp_vref_vga_level_11 radp_vref_vga_level_12 radp_vref_vga_level_13 radp_vref_vga_level_14 radp_vref_vga_level_15 radp_vref_vga_level_16 radp_vref_vga_level_17 radp_vref_vga_level_18 radp_vref_vga_level_19 radp_vref_vga_level_20 radp_vref_vga_level_21 radp_vref_vga_level_22 radp_vref_vga_level_23 radp_vref_vga_level_24 radp_vref_vga_level_25 radp_vref_vga_level_26 radp_vref_vga_level_27 radp_vref_vga_level_28 radp_vref_vga_level_29 radp_vref_vga_level_30 radp_vref_vga_level_31 
	parameter	datarate = "0 bps" ,		//Valid values:  
	parameter	initial_settings = "true" ,		//Valid values: false true 
	parameter	odi_count_threshold = "rodi_count_threshold_0" ,		//Valid values: rodi_count_threshold_0 rodi_count_threshold_1 rodi_count_threshold_2 rodi_count_threshold_3 rodi_count_threshold_4 rodi_count_threshold_5 rodi_count_threshold_6 rodi_count_threshold_7 
	parameter	odi_dfe_spec_en = "rodi_dfe_spec_en_0" ,		//Valid values: rodi_dfe_spec_en_0 rodi_dfe_spec_en_1 
	parameter	odi_en = "rodi_en_0" ,		//Valid values: rodi_en_0 rodi_en_1 
	parameter	odi_mode = "rodi_mode_0" ,		//Valid values: rodi_mode_0 rodi_mode_1 
	parameter	odi_rstn = "rodi_rstn_0" ,		//Valid values: rodi_rstn_0 rodi_rstn_1 
	parameter	odi_spec_sel = "rodi_spec_sel_0" ,		//Valid values: rodi_spec_sel_0 rodi_spec_sel_1 
	parameter	odi_start = "rodi_start_0" ,		//Valid values: rodi_start_0 rodi_start_1 
	parameter	odi_vref_sel = "rodi_vref_sel_0" ,		//Valid values: rodi_vref_sel_0 rodi_vref_sel_1 
	parameter	optimal = "false" ,		//Valid values: false true 
	parameter	prot_mode = "basic_rx" ,		//Valid values: basic_rx pcie_gen1_rx pcie_gen2_rx pcie_gen3_rx pcie_gen4_rx qpi_rx unused gpon_rx sata_rx 
	parameter	rrx_pcie_eqz = "rrx_pcie_eqz_0" ,		//Valid values: rrx_pcie_eqz_0 rrx_pcie_eqz_1 
	parameter	silicon_rev = "20nm5es" ,		//Valid values: 20nm5es 20nm5es2 20nm4es 20nm4es2 20nm5 20nm4 20nm3 20nm2 20nm1 
	parameter	sup_mode = "user_mode"		//Valid values: user_mode engineering_mode 
)

(
	//Port declaration

	input	[8:0]  avmmaddress ,
	input	avmmclk ,
	input	avmmread ,
	input	avmmrstn ,
	input	avmmwrite ,
	input	[7:0]  avmmwritedata ,
	input	adapt_reset ,
	input	adapt_start ,
	input	deser_clk ,
	input	[63:0]  deser_data ,
	input	[63:0]  deser_error ,
	input	[63:0]  deser_odi ,
	input	deser_odi_clk ,
	input	global_pipe_se ,
	input	[2:0]  i_rxpreset ,
	input	radp_ctle_hold_en ,
	input	radp_ctle_patt_en ,
	input	radp_ctle_preset_sel ,
	input	radp_enable_max_lfeq_scale ,
	input	radp_lfeq_hold_en ,
	input	radp_vga_polarity ,
	input	rx_pllfreqlock ,
	input	scan_clk ,
	input	[9:0]  scan_in ,
	input	test_mode ,
	input	test_se ,

	output	[7:0]  avmmreaddata ,
	output	blockselect ,
	output	[27:0]  ctle_acgain_4s ,
	output	[14:0]  ctle_eqz_1s_sel ,
	output	[6:0]  ctle_lfeq_fb_sel ,
	output	dfe_adapt_en ,
	output	dfe_adp_clk ,
	output	[5:0]  dfe_fltap1 ,
	output	dfe_fltap1_sgn ,
	output	[5:0]  dfe_fltap2 ,
	output	dfe_fltap2_sgn ,
	output	[5:0]  dfe_fltap3 ,
	output	dfe_fltap3_sgn ,
	output	[5:0]  dfe_fltap4 ,
	output	dfe_fltap4_sgn ,
	output	dfe_fltap_bypdeser ,
	output	[5:0]  dfe_fltap_position ,
	output	[6:0]  dfe_fxtap1 ,
	output	[6:0]  dfe_fxtap2 ,
	output	dfe_fxtap2_sgn ,
	output	[6:0]  dfe_fxtap3 ,
	output	dfe_fxtap3_sgn ,
	output	[5:0]  dfe_fxtap4 ,
	output	dfe_fxtap4_sgn ,
	output	[5:0]  dfe_fxtap5 ,
	output	dfe_fxtap5_sgn ,
	output	[4:0]  dfe_fxtap6 ,
	output	dfe_fxtap6_sgn ,
	output	[4:0]  dfe_fxtap7 ,
	output	dfe_fxtap7_sgn ,
	output	dfe_spec_disable ,
	output	dfe_spec_sign_sel ,
	output	dfe_vref_sign_sel ,
	output	[4:0]  odi_vref ,
	output	[9:0]  scan_out ,
	output	[7:0]  status_bus ,
	output	[6:0]  vga_sel ,
	output	[4:0]  vref_sel 

);


	twentynm_hssi_pma_adaptation_encrypted
	#(
		.enable_debug_info(enable_debug_info) ,

		.adapt_dfe_control_sel(adapt_dfe_control_sel) ,
		.adapt_dfe_sel(adapt_dfe_sel) ,
		.adapt_mode(adapt_mode) ,
		.adapt_vga_sel(adapt_vga_sel) ,
		.adapt_vref_sel(adapt_vref_sel) ,
		.adp_1s_ctle_bypass(adp_1s_ctle_bypass) ,
		.adp_4s_ctle_bypass(adp_4s_ctle_bypass) ,
		.adp_adapt_control_sel(adp_adapt_control_sel) ,
		.adp_adapt_rstn(adp_adapt_rstn) ,
		.adp_adapt_start(adp_adapt_start) ,
		.adp_bist_auxpath_en(adp_bist_auxpath_en) ,
		.adp_bist_count_rstn(adp_bist_count_rstn) ,
		.adp_bist_datapath_en(adp_bist_datapath_en) ,
		.adp_bist_mode(adp_bist_mode) ,
		.adp_bist_odi_dfe_sel(adp_bist_odi_dfe_sel) ,
		.adp_bist_spec_en(adp_bist_spec_en) ,
		.adp_control_mux_bypass(adp_control_mux_bypass) ,
		.adp_ctle_acgain_4s(adp_ctle_acgain_4s) ,
		.adp_ctle_adapt_bw(adp_ctle_adapt_bw) ,
		.adp_ctle_adapt_cycle_window(adp_ctle_adapt_cycle_window) ,
		.adp_ctle_adapt_oneshot(adp_ctle_adapt_oneshot) ,
		.adp_ctle_en(adp_ctle_en) ,
		.adp_ctle_eqz_1s_sel(adp_ctle_eqz_1s_sel) ,
		.adp_ctle_force_spec_sign(adp_ctle_force_spec_sign) ,
		.adp_ctle_hold_en(adp_ctle_hold_en) ,
		.adp_ctle_load(adp_ctle_load) ,
		.adp_ctle_load_value(adp_ctle_load_value) ,
		.adp_ctle_scale(adp_ctle_scale) ,
		.adp_ctle_scale_en(adp_ctle_scale_en) ,
		.adp_ctle_spec_sign(adp_ctle_spec_sign) ,
		.adp_ctle_sweep_direction(adp_ctle_sweep_direction) ,
		.adp_ctle_threshold(adp_ctle_threshold) ,
		.adp_ctle_threshold_en(adp_ctle_threshold_en) ,
		.adp_ctle_vref_polarity(adp_ctle_vref_polarity) ,
		.adp_ctle_window(adp_ctle_window) ,
		.adp_dfe_bw(adp_dfe_bw) ,
		.adp_dfe_clkout_div_sel(adp_dfe_clkout_div_sel) ,
		.adp_dfe_cycle(adp_dfe_cycle) ,
		.adp_dfe_fltap_bypass(adp_dfe_fltap_bypass) ,
		.adp_dfe_fltap_en(adp_dfe_fltap_en) ,
		.adp_dfe_fltap_hold_en(adp_dfe_fltap_hold_en) ,
		.adp_dfe_fltap_load(adp_dfe_fltap_load) ,
		.adp_dfe_fltap_position(adp_dfe_fltap_position) ,
		.adp_dfe_force_spec_sign(adp_dfe_force_spec_sign) ,
		.adp_dfe_fxtap1(adp_dfe_fxtap1) ,
		.adp_dfe_fxtap10(adp_dfe_fxtap10) ,
		.adp_dfe_fxtap10_sgn(adp_dfe_fxtap10_sgn) ,
		.adp_dfe_fxtap11(adp_dfe_fxtap11) ,
		.adp_dfe_fxtap11_sgn(adp_dfe_fxtap11_sgn) ,
		.adp_dfe_fxtap2(adp_dfe_fxtap2) ,
		.adp_dfe_fxtap2_sgn(adp_dfe_fxtap2_sgn) ,
		.adp_dfe_fxtap3(adp_dfe_fxtap3) ,
		.adp_dfe_fxtap3_sgn(adp_dfe_fxtap3_sgn) ,
		.adp_dfe_fxtap4(adp_dfe_fxtap4) ,
		.adp_dfe_fxtap4_sgn(adp_dfe_fxtap4_sgn) ,
		.adp_dfe_fxtap5(adp_dfe_fxtap5) ,
		.adp_dfe_fxtap5_sgn(adp_dfe_fxtap5_sgn) ,
		.adp_dfe_fxtap6(adp_dfe_fxtap6) ,
		.adp_dfe_fxtap6_sgn(adp_dfe_fxtap6_sgn) ,
		.adp_dfe_fxtap7(adp_dfe_fxtap7) ,
		.adp_dfe_fxtap7_sgn(adp_dfe_fxtap7_sgn) ,
		.adp_dfe_fxtap8(adp_dfe_fxtap8) ,
		.adp_dfe_fxtap8_sgn(adp_dfe_fxtap8_sgn) ,
		.adp_dfe_fxtap9(adp_dfe_fxtap9) ,
		.adp_dfe_fxtap9_sgn(adp_dfe_fxtap9_sgn) ,
		.adp_dfe_fxtap_bypass(adp_dfe_fxtap_bypass) ,
		.adp_dfe_fxtap_en(adp_dfe_fxtap_en) ,
		.adp_dfe_fxtap_hold_en(adp_dfe_fxtap_hold_en) ,
		.adp_dfe_fxtap_load(adp_dfe_fxtap_load) ,
		.adp_dfe_mode(adp_dfe_mode) ,
		.adp_dfe_spec_sign(adp_dfe_spec_sign) ,
		.adp_dfe_vref_polarity(adp_dfe_vref_polarity) ,
		.adp_force_freqlock(adp_force_freqlock) ,
		.adp_frame_capture(adp_frame_capture) ,
		.adp_frame_en(adp_frame_en) ,
		.adp_frame_odi_sel(adp_frame_odi_sel) ,
		.adp_frame_out_sel(adp_frame_out_sel) ,
		.adp_lfeq_fb_sel(adp_lfeq_fb_sel) ,
		.adp_mode(adp_mode) ,
		.adp_odi_control_sel(adp_odi_control_sel) ,
		.adp_onetime_dfe(adp_onetime_dfe) ,
		.adp_spec_avg_window(adp_spec_avg_window) ,
		.adp_spec_trans_filter(adp_spec_trans_filter) ,
		.adp_status_sel(adp_status_sel) ,
		.adp_vga_bypass(adp_vga_bypass) ,
		.adp_vga_en(adp_vga_en) ,
		.adp_vga_load(adp_vga_load) ,
		.adp_vga_polarity(adp_vga_polarity) ,
		.adp_vga_sel(adp_vga_sel) ,
		.adp_vga_sweep_direction(adp_vga_sweep_direction) ,
		.adp_vga_threshold(adp_vga_threshold) ,
		.adp_vref_bw(adp_vref_bw) ,
		.adp_vref_bypass(adp_vref_bypass) ,
		.adp_vref_cycle(adp_vref_cycle) ,
		.adp_vref_dfe_spec_en(adp_vref_dfe_spec_en) ,
		.adp_vref_en(adp_vref_en) ,
		.adp_vref_hold_en(adp_vref_hold_en) ,
		.adp_vref_load(adp_vref_load) ,
		.adp_vref_polarity(adp_vref_polarity) ,
		.adp_vref_sel(adp_vref_sel) ,
		.adp_vref_vga_level(adp_vref_vga_level) ,
		.datarate(datarate) ,
		.initial_settings(initial_settings) ,
		.odi_count_threshold(odi_count_threshold) ,
		.odi_dfe_spec_en(odi_dfe_spec_en) ,
		.odi_en(odi_en) ,
		.odi_mode(odi_mode) ,
		.odi_rstn(odi_rstn) ,
		.odi_spec_sel(odi_spec_sel) ,
		.odi_start(odi_start) ,
		.odi_vref_sel(odi_vref_sel) ,
		.optimal(optimal) ,
		.prot_mode(prot_mode) ,
		.rrx_pcie_eqz(rrx_pcie_eqz) ,
		.silicon_rev(silicon_rev) ,
		.sup_mode(sup_mode)

	)
	twentynm_hssi_pma_adaptation_encrypted_inst (

		.avmmaddress(avmmaddress),
		.avmmclk(avmmclk),
		.avmmread(avmmread),
		.avmmrstn(avmmrstn),
		.avmmwrite(avmmwrite),
		.avmmwritedata(avmmwritedata),
		.adapt_reset(adapt_reset),
		.adapt_start(adapt_start),
		.deser_clk(deser_clk),
		.deser_data(deser_data),
		.deser_error(deser_error),
		.deser_odi(deser_odi),
		.deser_odi_clk(deser_odi_clk),
		.global_pipe_se(global_pipe_se),
		.i_rxpreset(i_rxpreset),
		.radp_ctle_hold_en(radp_ctle_hold_en),
		.radp_ctle_patt_en(radp_ctle_patt_en),
		.radp_ctle_preset_sel(radp_ctle_preset_sel),
		.radp_enable_max_lfeq_scale(radp_enable_max_lfeq_scale),
		.radp_lfeq_hold_en(radp_lfeq_hold_en),
		.radp_vga_polarity(radp_vga_polarity),
		.rx_pllfreqlock(rx_pllfreqlock),
		.scan_clk(scan_clk),
		.scan_in(scan_in),
		.test_mode(test_mode),
		.test_se(test_se),
		.avmmreaddata(avmmreaddata),
		.blockselect(blockselect),
		.ctle_acgain_4s(ctle_acgain_4s),
		.ctle_eqz_1s_sel(ctle_eqz_1s_sel),
		.ctle_lfeq_fb_sel(ctle_lfeq_fb_sel),
		.dfe_adapt_en(dfe_adapt_en),
		.dfe_adp_clk(dfe_adp_clk),
		.dfe_fltap1(dfe_fltap1),
		.dfe_fltap1_sgn(dfe_fltap1_sgn),
		.dfe_fltap2(dfe_fltap2),
		.dfe_fltap2_sgn(dfe_fltap2_sgn),
		.dfe_fltap3(dfe_fltap3),
		.dfe_fltap3_sgn(dfe_fltap3_sgn),
		.dfe_fltap4(dfe_fltap4),
		.dfe_fltap4_sgn(dfe_fltap4_sgn),
		.dfe_fltap_bypdeser(dfe_fltap_bypdeser),
		.dfe_fltap_position(dfe_fltap_position),
		.dfe_fxtap1(dfe_fxtap1),
		.dfe_fxtap2(dfe_fxtap2),
		.dfe_fxtap2_sgn(dfe_fxtap2_sgn),
		.dfe_fxtap3(dfe_fxtap3),
		.dfe_fxtap3_sgn(dfe_fxtap3_sgn),
		.dfe_fxtap4(dfe_fxtap4),
		.dfe_fxtap4_sgn(dfe_fxtap4_sgn),
		.dfe_fxtap5(dfe_fxtap5),
		.dfe_fxtap5_sgn(dfe_fxtap5_sgn),
		.dfe_fxtap6(dfe_fxtap6),
		.dfe_fxtap6_sgn(dfe_fxtap6_sgn),
		.dfe_fxtap7(dfe_fxtap7),
		.dfe_fxtap7_sgn(dfe_fxtap7_sgn),
		.dfe_spec_disable(dfe_spec_disable),
		.dfe_spec_sign_sel(dfe_spec_sign_sel),
		.dfe_vref_sign_sel(dfe_vref_sign_sel),
		.odi_vref(odi_vref),
		.scan_out(scan_out),
		.status_bus(status_bus),
		.vga_sel(vga_sel),
		.vref_sel(vref_sel)

	);

endmodule
// -----------------------------------------------------------
// This is auto-generated HSSI Simulation Atom Model Encryption Wrapper
// Module Name : work/twentynm_hssi_pma_aux_wrapper.v
// -----------------------------------------------------------

`timescale 1 ps/1 ps

module twentynm_hssi_pma_aux
#(
	// Parameter declaration and default value assignment

	parameter enable_debug_info = "true",	//Valid values: false|true; this is simulation-only parameter, for debug purpose only

	parameter	dprio_base_addr = 9'b000000000 ,		//Valid values: 9 
	parameter	dprio_broadcast_en = "dprio_broadcast_en_csr_ctrl_en" ,		//Valid values: dprio_broadcast_en_csr_ctrl_en dprio_broadcast_en_csr_ctrl_disable 
	parameter	dprio_cvp_mdio_dis = "dprio_cvp_mdio_dis_csr_ctrl_en" ,		//Valid values: dprio_cvp_mdio_dis_csr_ctrl_en dprio_cvp_mdio_dis_csr_ctrl_disable 
	parameter	dprio_force_mdio_dis = "dprio_force_mdio_dis_csr_ctrl_en" ,		//Valid values: dprio_force_mdio_dis_csr_ctrl_en dprio_force_mdio_dis_csr_ctrl_disable 
	parameter	dprio_power_iso_en = "dprio_power_iso_en_csr_ctrl_en" ,		//Valid values: dprio_power_iso_en_csr_ctrl_en dprio_power_iso_en_csr_ctrl_disable 
	parameter	initial_settings = "true" ,		//Valid values: false true 
	parameter	pm_aux_adc_vref_trim = "adc_vref_trim_4" ,		//Valid values: adc_vref_trim_0 adc_vref_trim_1 adc_vref_trim_2 adc_vref_trim_3 adc_vref_trim_4 adc_vref_trim_5 adc_vref_trim_6 adc_vref_trim_7 
	parameter	pm_aux_atb_bgbyp = "atb_bg_ref" ,		//Valid values: atb_bg_ref atb_vcc_ref 
	parameter	pm_aux_atb_en = "atb_global_disable" ,		//Valid values: atb_global_disable atb_global_enable 
	parameter	pm_aux_atb_mode = "atb_default" ,		//Valid values: atb_default atb_vrefgen_1 atb_vrefgen_2 atb_vrefgen_3 atb_vrefgen_4 atb_vrefgen_5 atb_vrefgen_6 atb_vrefgen_7 atb_vrefgen_8 atb_vrefgen_9 atb_vrefgen_10 atb_vrefgen_11 atb_vrefgen_12 atb_impctrl_1 atb_impctrl_2 atb_impctrl_3 atb_impctrl_4 atb_dev_monitor_1 atb_dev_monitor_2 atb_dev_monitor_3 atb_dev_monitor_4 atb_dev_monitor_5 atb_dev_monitor_6 atb_dev_monitor_7 atb_dev_monitor_8 atb_dev_monitor_9 atb_dev_monitor_10 atb_dev_monitor_11 atb_dev_monitor_12 atb_dev_monitor_13 atb_dev_monitor_unused_14 atb_dev_monitor_unused_15 
	parameter	pm_aux_atbcmp_pdb = "atb_comp_power_down" ,		//Valid values: atb_comp_power_on atb_comp_power_down 
	parameter	pm_aux_atben0 = "atben0_disable" ,		//Valid values: atben0_disable atben0_enable 
	parameter	pm_aux_atben0_hssi = "atb0_hssi_precomp_open" ,		//Valid values: atb0_hssi_precomp_open atb0_hssi_precomp_closed 
	parameter	pm_aux_atben0_io = "atb0_io_precomp_open" ,		//Valid values: atb0_io_precomp_open atb0_io_precomp_closed 
	parameter	pm_aux_atben0_swap = "atben0_swap_disable" ,		//Valid values: atben0_swap_disable atben0_swap_enable 
	parameter	pm_aux_atben1 = "atben1_disable" ,		//Valid values: atben1_disable atben1_enable 
	parameter	pm_aux_atben1_hssi = "atb1_hssi_precomp_open" ,		//Valid values: atb1_hssi_precomp_open atb1_hssi_precomp_closed 
	parameter	pm_aux_atben1_io = "atb1_io_precomp_open" ,		//Valid values: atb1_io_precomp_open atb1_io_precomp_closed 
	parameter	pm_aux_atben1_swap = "atben1_swap_disable" ,		//Valid values: atben1_swap_disable atben1_swap_enable 
	parameter	pm_aux_bg_powerdown = "pm_aux_bg_power_up" ,		//Valid values: pm_aux_bg_power_up pm_aux_bg_power_down 
	parameter	pm_aux_bypass_bg_voltage_to_iconstant = "pm_aux_normal_operation_for_iconstant" ,		//Valid values: pm_aux_bypass_bg_voltage_to_iconstant pm_aux_normal_operation_for_iconstant 
	parameter	pm_aux_bypass_bg_voltage_to_itrack = "pm_aux_normal_operation_for_itrack" ,		//Valid values: pm_aux_bypass_bg_voltage_to_itrack pm_aux_normal_operation_for_itrack 
	parameter	pm_aux_comp_minus = "atb_comp_minus_disconnect" ,		//Valid values: atb_comp_minus_disconnect atb_comp_minus_connect 
	parameter	pm_aux_comp_plus = "atb_comp_plus_disconnect" ,		//Valid values: atb_comp_plus_disconnect atb_comp_plus_connect 
	parameter	pm_aux_dac_atb_outsel = "dac_atb_out_off" ,		//Valid values: dac_atb_out_off dac_atb0_out dac_atb1_out 
	parameter	pm_aux_dac_data = 12'b000000000000 ,		//Valid values: 12 
	parameter	pm_aux_dac_data_sel = "dac_data_dprio" ,		//Valid values: dac_data_core dac_data_dprio 
	parameter	pm_aux_dac_dmcn = 14'b11111111111100 ,		//Valid values: 14 
	parameter	pm_aux_dac_dmcp = 14'b11111111111100 ,		//Valid values: 14 
	parameter	pm_aux_dac_lst = "dac_atb1_disable" ,		//Valid values: dac_atb1_disable dac_atb1_cm_opamp_1 dac_atb1_cm_opamp_2 dac_atb1_cm_opamp_3 dac_atb1_cm_opamp_4 dac_atb1_vrefn dac_atb1_vrefp dac_atb1_vcm dac_atb1_vcca_a dac_atb1_vss 
	parameter	pm_aux_dac_neg_trigger = "dac_pos_edge_trigger" ,		//Valid values: dac_pos_edge_trigger dac_neg_edge_trigger 
	parameter	pm_aux_dac_pdb = "dac_power_down" ,		//Valid values: dac_power_on dac_power_down 
	parameter	pm_aux_dac_resetb = "dac_reset_off" ,		//Valid values: dac_reset_on dac_reset_off 
	parameter	pm_aux_dac_tstbus_sel = "dac_tst_0" ,		//Valid values: dac_tst_0 dac_tst_1 dac_tst_2 dac_tst_3 dac_tst_4 
	parameter	pm_aux_dac_vouten = "dac_vout_dis" ,		//Valid values: dac_vout_dis dac_vout_en 
	parameter	pm_aux_dac_vref_sel = "dac_fs_full" ,		//Valid values: dac_fs_full dac_fs_reduced 
	parameter	pm_aux_dac_vref_trim = "dac_vref_trim_4" ,		//Valid values: dac_vref_trim_0 dac_vref_trim_1 dac_vref_trim_2 dac_vref_trim_3 dac_vref_trim_4 dac_vref_trim_5 dac_vref_trim_6 dac_vref_trim_7 
	parameter	pm_aux_dftcmp_pdb = "dft_comp_power_down" ,		//Valid values: dft_comp_power_on dft_comp_power_down 
	parameter	pm_aux_iconstant_opt = "iconstant_opt_50u" ,		//Valid values: iconstant_opt_50u_plus_offset4 iconstant_opt_50u_plus_offset3 iconstant_opt_50u_plus_offset2 iconstant_opt_50u_plus_offset1 iconstant_opt_50u iconstant_opt_50u_minus_offset1 iconstant_opt_50u_minus_offset2 iconstant_opt_50u_minus_offset3 
	parameter	pm_aux_impctrl_tstbus = "pm_aux_impctrl_tstbus_sel0" ,		//Valid values: pm_aux_impctrl_tstbus_sel0 pm_aux_impctrl_tstbus_sel1 pm_aux_impctrl_tstbus_sel2 pm_aux_impctrl_tstbus_sel3 pm_aux_impctrl_tstbus_sel4 pm_aux_impctrl_tstbus_sel5 pm_aux_impctrl_tstbus_sel6 pm_aux_impctrl_tstbus_sel7 
	parameter	pm_aux_itracking_opt = "itracking_opt_50u" ,		//Valid values: itracking_opt_40u itracking_opt_45u itracking_opt_50u itracking_opt_55u itracking_opt_60u itracking_opt_60u_reserved0 itracking_opt_60u_reserved1 itracking_opt_60u_reserved2 
	parameter	pm_aux_lower_limit = 12'b000000000000 ,		//Valid values: 12 
	parameter	pm_aux_refclk_div = "refclk_div_bypass" ,		//Valid values: refclk_div_bypass refclk_div_2 refclk_div_4 refclk_div_8 
	parameter	pm_aux_rx_cal_override_value = "pm_aux_rx_cal_override_value0" ,		//Valid values: pm_aux_rx_cal_override_value0 pm_aux_rx_cal_override_value1 pm_aux_rx_cal_override_value2 pm_aux_rx_cal_override_value3 pm_aux_rx_cal_override_value4 pm_aux_rx_cal_override_value5 pm_aux_rx_cal_override_value6 pm_aux_rx_cal_override_value7 pm_aux_rx_cal_override_value8 pm_aux_rx_cal_override_value9 pm_aux_rx_cal_override_value10 pm_aux_rx_cal_override_value11 pm_aux_rx_cal_override_value12 pm_aux_rx_cal_override_value13 pm_aux_rx_cal_override_value14 pm_aux_rx_cal_override_value15 pm_aux_rx_cal_override_value16 pm_aux_rx_cal_override_value17 pm_aux_rx_cal_override_value18 pm_aux_rx_cal_override_value19 pm_aux_rx_cal_override_value20 pm_aux_rx_cal_override_value21 pm_aux_rx_cal_override_value22 pm_aux_rx_cal_override_value23 pm_aux_rx_cal_override_value24 pm_aux_rx_cal_override_value25 pm_aux_rx_cal_override_value26 pm_aux_rx_cal_override_value27 pm_aux_rx_cal_override_value28 pm_aux_rx_cal_override_value29 pm_aux_rx_cal_override_value30 pm_aux_rx_cal_override_value31 
	parameter	pm_aux_rx_cal_override_value_enable = "pm_aux_rx_cal_override_value_disable" ,		//Valid values: pm_aux_rx_cal_override_value_enable pm_aux_rx_cal_override_value_disable 
	parameter	pm_aux_rx_imp = "pm_aux_rx_imp_48" ,		//Valid values: pm_aux_rx_imp_42 pm_aux_rx_imp_44 pm_aux_rx_imp_46 pm_aux_rx_imp_48 pm_aux_rx_imp_50 pm_aux_rx_imp_52 pm_aux_rx_imp_54 pm_aux_rx_imp_56 
	parameter	pm_aux_sar_atb_insel = "sar_atb_in_off" ,		//Valid values: sar_atb_in_off sar_atb0_in sar_atb1_in 
	parameter	pm_aux_sar_cal_b10 = "sar_b10_cap_off" ,		//Valid values: sar_b10_cap_off sar_b10_cap0_on sar_b10_cap1_on sar_b10_cap2_on sar_b10_cap3_on sar_b10_cap4_on 
	parameter	pm_aux_sar_cal_b11 = "sar_b11_cap_off" ,		//Valid values: sar_b11_cap_off sar_b11_cap0_on sar_b11_cap1_on sar_b11_cap2_on sar_b11_cap3_on sar_b11_cap4_on sar_b11_cap5_on 
	parameter	pm_aux_sar_cal_b5 = "sar_b5_cap_off" ,		//Valid values: sar_b5_cap_off sar_b5_cap0_on sar_b5_cap1_on sar_b5_cap2_on 
	parameter	pm_aux_sar_cal_b6 = "sar_b6_cap_off" ,		//Valid values: sar_b6_cap_off sar_b6_cap0_on sar_b6_cap1_on sar_b6_cap2_on 
	parameter	pm_aux_sar_cal_b7 = "sar_b7_cap_off" ,		//Valid values: sar_b7_cap_off sar_b7_cap0_on sar_b7_cap1_on sar_b7_cap2_on 
	parameter	pm_aux_sar_cal_b8 = "sar_b8_cap_off" ,		//Valid values: sar_b8_cap_off sar_b8_cap0_on sar_b8_cap1_on sar_b8_cap2_on 
	parameter	pm_aux_sar_cal_b9 = "sar_b9_cap_off" ,		//Valid values: sar_b9_cap_off sar_b9_cap0_on sar_b9_cap1_on sar_b9_cap2_on sar_b9_cap3_on 
	parameter	pm_aux_sar_cal_ctrl = "sar_rambit_cal" ,		//Valid values: sar_rambit_cal sar_auto_cal 
	parameter	pm_aux_sar_cal_mode = "sar_normal_mode" ,		//Valid values: sar_normal_mode sar_cal_mode 
	parameter	pm_aux_sar_cal_refn = "sar_refn_sw_off" ,		//Valid values: sar_refn_sw_off sar_refn_b0_sw_on sar_refn_b1_sw_on sar_refn_b2_sw_on sar_refn_b3_sw_on sar_refn_b4_sw_on sar_refn_b5_sw_on sar_refn_b6_sw_on sar_refn_b7_sw_on sar_refn_b8_sw_on sar_refn_b9_sw_on sar_refn_b10_sw_on sar_refn_b11_sw_on 
	parameter	pm_aux_sar_cal_refp = "sar_refp_sw_off" ,		//Valid values: sar_refp_sw_off sar_refp_b0_sw_on sar_refp_b1_sw_on sar_refp_b2_sw_on sar_refp_b3_sw_on sar_refp_b4_sw_on sar_refp_b5_sw_on sar_refp_b6_sw_on sar_refp_b7_sw_on sar_refp_b8_sw_on sar_refp_b9_sw_on sar_refp_b10_sw_on sar_refp_b11_sw_on 
	parameter	pm_aux_sar_cal_top = "sar_top_sw_off" ,		//Valid values: sar_top_sw_off sar_top_sw_on 
	parameter	pm_aux_sar_ckskew = "sar_skew1" ,		//Valid values: sar_skew0 sar_skew1 sar_skew2 sar_skew3 
	parameter	pm_aux_sar_cmp_curr = "sar_cmp_curr11" ,		//Valid values: sar_cmp_curr00 sar_cmp_curr01 sar_cmp_curr02 sar_cmp_curr03 sar_cmp_curr10 sar_cmp_curr11 sar_cmp_curr12 sar_cmp_curr13 
	parameter	pm_aux_sar_dmcn = 14'b11111111111100 ,		//Valid values: 14 
	parameter	pm_aux_sar_dmcp = 14'b11111111111100 ,		//Valid values: 14 
	parameter	pm_aux_sar_inbuf_byp = "sar_inbuf_en" ,		//Valid values: sar_inbuf_en sar_inbuf_byp 
	parameter	pm_aux_sar_insel = "sar_input_off" ,		//Valid values: sar_input_off sar_atb0_pad_in sar_atb0_pad_buf_in sar_atb_in 
	parameter	pm_aux_sar_lowrate = "sar_normal_rate" ,		//Valid values: sar_normal_rate sar_low_rate 
	parameter	pm_aux_sar_lst = "sar_atb1_disable" ,		//Valid values: sar_atb1_10001 sar_atb1_10010 sar_atb1_10011 sar_atb1_10100 sar_atb1_10101 sar_atb1_10110 sar_atb1_10111 sar_atb1_11000 sar_atb1_cm_opamp_1 sar_atb1_cm_opamp_2 sar_atb1_cm_opamp_3 sar_atb1_cm_opamp_4 sar_atb1_comp_1 sar_atb1_comp_2 sar_atb1_comp_3 sar_atb1_disable sar_atb1_ref sar_atb1_vcca sar_atb1_vcca_a sar_atb1_vcm sar_atb1_vrefn sar_atb1_vrefp sar_atb1_vss sar_atb1_x0 sar_atb1_x1 
	parameter	pm_aux_sar_pdb = "sar_power_down" ,		//Valid values: sar_power_on sar_power_down 
	parameter	pm_aux_sar_resetb = "sar_reset_off" ,		//Valid values: sar_reset_on sar_reset_off 
	parameter	pm_aux_sar_tstbus_sel = "sar_tst_0" ,		//Valid values: sar_tst_0 sar_tst_1 sar_tst_2 sar_tst_3 sar_tst_4 sar_tst_5 sar_tst_6 sar_tst_7 
	parameter	pm_aux_sar_vcm_ctrl = "sar_vcm_900mv" ,		//Valid values: sar_vcm_850mv sar_vcm_900mv sar_vcm_950mv sar_vcm_1000mv 
	parameter	pm_aux_sar_vcm_en = "sar_vcm_on" ,		//Valid values: sar_vcm_off sar_vcm_on 
	parameter	pm_aux_sel_fusetrim_cramtrim_adc_dac = "sel_cramtrim_to_adc_dac" ,		//Valid values: sel_cramtrim_to_adc_dac sel_fusetrim_to_adc_dac 
	parameter	pm_aux_termination_cal_ctrl = "pm_aux_termination_cal_ctrl_0" ,		//Valid values: pm_aux_termination_cal_ctrl_1 pm_aux_termination_cal_ctrl_0 
	parameter	pm_aux_test_counter = "pm_aux_test_counter_disable" ,		//Valid values: pm_aux_test_counter_enable pm_aux_test_counter_disable 
	parameter	pm_aux_tstmux_statreg = "pm_aux_tstmux_statreg_0" ,		//Valid values: pm_aux_tstmux_statreg_0 pm_aux_tstmux_statreg_1 pm_aux_tstmux_statreg_2 pm_aux_tstmux_statreg_3 pm_aux_tstmux_statreg_4 pm_aux_tstmux_statreg_5 pm_aux_tstmux_statreg_6 pm_aux_tstmux_statreg_7 
	parameter	pm_aux_tx_cal_override_value = "pm_aux_tx_cal_override_value0" ,		//Valid values: pm_aux_tx_cal_override_value0 pm_aux_tx_cal_override_value1 pm_aux_tx_cal_override_value2 pm_aux_tx_cal_override_value3 pm_aux_tx_cal_override_value4 pm_aux_tx_cal_override_value5 pm_aux_tx_cal_override_value6 pm_aux_tx_cal_override_value7 pm_aux_tx_cal_override_value8 pm_aux_tx_cal_override_value9 pm_aux_tx_cal_override_value10 pm_aux_tx_cal_override_value11 pm_aux_tx_cal_override_value12 pm_aux_tx_cal_override_value13 pm_aux_tx_cal_override_value14 pm_aux_tx_cal_override_value15 pm_aux_tx_cal_override_value16 pm_aux_tx_cal_override_value17 pm_aux_tx_cal_override_value18 pm_aux_tx_cal_override_value19 pm_aux_tx_cal_override_value20 pm_aux_tx_cal_override_value21 pm_aux_tx_cal_override_value22 pm_aux_tx_cal_override_value23 pm_aux_tx_cal_override_value24 pm_aux_tx_cal_override_value25 pm_aux_tx_cal_override_value26 pm_aux_tx_cal_override_value27 pm_aux_tx_cal_override_value28 pm_aux_tx_cal_override_value29 pm_aux_tx_cal_override_value30 pm_aux_tx_cal_override_value31 
	parameter	pm_aux_tx_cal_override_value_enable = "pm_aux_tx_cal_override_value_disable" ,		//Valid values: pm_aux_tx_cal_override_value_enable pm_aux_tx_cal_override_value_disable 
	parameter	pm_aux_tx_imp = "pm_aux_tx_imp_48" ,		//Valid values: pm_aux_tx_imp_pd pm_aux_tx_imp_46 pm_aux_tx_imp_48 pm_aux_tx_imp_50 pm_aux_tx_imp_52 pm_aux_tx_imp_54 pm_aux_tx_imp_na pm_aux_tx_imp_na1 
	parameter	pm_aux_upper_limit = 12'b000000000000 ,		//Valid values: 12 
	parameter	pm_aux_vgen_pdb = "vref_power_down" ,		//Valid values: vref_power_on vref_power_down 
	parameter	pm_aux_vgen_sel = 6'b100000 ,		//Valid values: 6 
	parameter	pm_aux_vrefen_minus = "vref_comp_minus_disconnect" ,		//Valid values: vref_comp_minus_disconnect vref_comp_minus_connect 
	parameter	pm_aux_vrefen_plus = "vref_comp_plus_disconnect" ,		//Valid values: vref_comp_plus_disconnect vref_comp_plus_connect 
	parameter	pma_aux_clock_select = "pma_aux_clock_select_clkusr" ,		//Valid values: pma_aux_clock_select_clkusr pma_aux_clock_select_intosc pma_aux_clock_select_iqclk0 pma_aux_clock_select_iqclk1 pma_aux_clock_select_iqclk2 pma_aux_clock_select_iqclk3 pma_aux_clock_select_iqclk4 pma_aux_clock_select_iqclk5 pma_aux_clock_select_iqclk6 pma_aux_clock_select_iqclk7 pma_aux_clock_select_iqclk8 pma_aux_clock_select_iqclk9 pma_aux_clock_select_iqclk10 pma_aux_clock_select_iqclk11 
	parameter	powerdown_mode = "powerdown" ,		//Valid values: powerdown powerup 
	parameter	silicon_rev = "20nm5es" ,		//Valid values: 20nm5es 20nm5es2 20nm4es 20nm4es2 20nm5 20nm4 20nm3 20nm2 20nm1 
	parameter	sup_mode = "user_mode" ,		//Valid values: user_mode engineering_mode 
	parameter	xdprio_aux_wrap_xdprio_aux_cfg_dprio_sel_core = "avalon_access_from_uc" ,		//Valid values: avalon_access_from_uc avalon_access_from_core 
	parameter	xdprio_aux_wrap_xdprio_aux_uc_channel_base_addr = 8'b00000000 ,		//Valid values: 8 
	parameter	ximpctrl_pm_aux_impctrl_sel_high_code = "pm_aux_impctrl_tx_sel_high" ,		//Valid values: pm_aux_impctrl_tx_sel_low pm_aux_impctrl_tx_sel_high 
	parameter	ximpctrl_pm_aux_impctrl_tx_enable_eos_det = "pm_aux_impctrl_tx_disable_eos_det" ,		//Valid values: pm_aux_impctrl_tx_disable_eos_det pm_aux_impctrl_tx_enable_eos_det 
	parameter	ximpctrl_pm_aux_impctrl_tx_ovwr_ncal = "pm_aux_impctrl_tx_ovwr_pcal" ,		//Valid values: pm_aux_impctrl_tx_ovwr_pcal pm_aux_impctrl_tx_ovwr_ncal 
	parameter	ximpctrl_pm_aux_impctrl_tx_ovwr_state = "pm_aux_impctrl_tx_ovwr_state_disable" ,		//Valid values: pm_aux_impctrl_tx_ovwr_state_disable pm_aux_impctrl_tx_ovwr_state_enable 
	parameter	ximpctrl_pm_aux_impctrl_tx_ovwr_state50 = "pm_aux_impctrl_tx_ovwr_state50" ,		//Valid values: pm_aux_impctrl_tx_ovwr_state42 pm_aux_impctrl_tx_ovwr_state50 
	parameter	ximpctrl_pm_aux_impctrl_txcode_sel = "pm_aux_impctrl_txcode_sel0"		//Valid values: pm_aux_impctrl_txcode_sel0 pm_aux_impctrl_txcode_sel1 pm_aux_impctrl_txcode_sel2 pm_aux_impctrl_txcode_sel3 pm_aux_impctrl_txcode_sel4 pm_aux_impctrl_txcode_sel5 pm_aux_impctrl_txcode_sel6 pm_aux_impctrl_txcode_sel7 
)

(
	//Port declaration

	input	[8:0]  dprio_addr ,
	input	dprio_clk ,
	input	dprio_read ,
	input	dprio_rst_n ,
	input	dprio_write ,
	input	[7:0]  dprio_writedata ,
	input	pld_scan_mode_n ,
	input	pld_scan_shift_n ,
	input	scan_clk_in_impctrl ,
	input	scan_in_impctrl ,

	output	dft_flag_down ,
	output	dft_flag_up ,
	output	scan_out_impctrl ,
	output	[7:0]  tstmux_out 

);


	twentynm_hssi_pma_aux_encrypted
	#(
		.enable_debug_info(enable_debug_info) ,

		.dprio_base_addr(dprio_base_addr) ,
		.dprio_broadcast_en(dprio_broadcast_en) ,
		.dprio_cvp_mdio_dis(dprio_cvp_mdio_dis) ,
		.dprio_force_mdio_dis(dprio_force_mdio_dis) ,
		.dprio_power_iso_en(dprio_power_iso_en) ,
		.initial_settings(initial_settings) ,
		.pm_aux_adc_vref_trim(pm_aux_adc_vref_trim) ,
		.pm_aux_atb_bgbyp(pm_aux_atb_bgbyp) ,
		.pm_aux_atb_en(pm_aux_atb_en) ,
		.pm_aux_atb_mode(pm_aux_atb_mode) ,
		.pm_aux_atbcmp_pdb(pm_aux_atbcmp_pdb) ,
		.pm_aux_atben0(pm_aux_atben0) ,
		.pm_aux_atben0_hssi(pm_aux_atben0_hssi) ,
		.pm_aux_atben0_io(pm_aux_atben0_io) ,
		.pm_aux_atben0_swap(pm_aux_atben0_swap) ,
		.pm_aux_atben1(pm_aux_atben1) ,
		.pm_aux_atben1_hssi(pm_aux_atben1_hssi) ,
		.pm_aux_atben1_io(pm_aux_atben1_io) ,
		.pm_aux_atben1_swap(pm_aux_atben1_swap) ,
		.pm_aux_bg_powerdown(pm_aux_bg_powerdown) ,
		.pm_aux_bypass_bg_voltage_to_iconstant(pm_aux_bypass_bg_voltage_to_iconstant) ,
		.pm_aux_bypass_bg_voltage_to_itrack(pm_aux_bypass_bg_voltage_to_itrack) ,
		.pm_aux_comp_minus(pm_aux_comp_minus) ,
		.pm_aux_comp_plus(pm_aux_comp_plus) ,
		.pm_aux_dac_atb_outsel(pm_aux_dac_atb_outsel) ,
		.pm_aux_dac_data(pm_aux_dac_data) ,
		.pm_aux_dac_data_sel(pm_aux_dac_data_sel) ,
		.pm_aux_dac_dmcn(pm_aux_dac_dmcn) ,
		.pm_aux_dac_dmcp(pm_aux_dac_dmcp) ,
		.pm_aux_dac_lst(pm_aux_dac_lst) ,
		.pm_aux_dac_neg_trigger(pm_aux_dac_neg_trigger) ,
		.pm_aux_dac_pdb(pm_aux_dac_pdb) ,
		.pm_aux_dac_resetb(pm_aux_dac_resetb) ,
		.pm_aux_dac_tstbus_sel(pm_aux_dac_tstbus_sel) ,
		.pm_aux_dac_vouten(pm_aux_dac_vouten) ,
		.pm_aux_dac_vref_sel(pm_aux_dac_vref_sel) ,
		.pm_aux_dac_vref_trim(pm_aux_dac_vref_trim) ,
		.pm_aux_dftcmp_pdb(pm_aux_dftcmp_pdb) ,
		.pm_aux_iconstant_opt(pm_aux_iconstant_opt) ,
		.pm_aux_impctrl_tstbus(pm_aux_impctrl_tstbus) ,
		.pm_aux_itracking_opt(pm_aux_itracking_opt) ,
		.pm_aux_lower_limit(pm_aux_lower_limit) ,
		.pm_aux_refclk_div(pm_aux_refclk_div) ,
		.pm_aux_rx_cal_override_value(pm_aux_rx_cal_override_value) ,
		.pm_aux_rx_cal_override_value_enable(pm_aux_rx_cal_override_value_enable) ,
		.pm_aux_rx_imp(pm_aux_rx_imp) ,
		.pm_aux_sar_atb_insel(pm_aux_sar_atb_insel) ,
		.pm_aux_sar_cal_b10(pm_aux_sar_cal_b10) ,
		.pm_aux_sar_cal_b11(pm_aux_sar_cal_b11) ,
		.pm_aux_sar_cal_b5(pm_aux_sar_cal_b5) ,
		.pm_aux_sar_cal_b6(pm_aux_sar_cal_b6) ,
		.pm_aux_sar_cal_b7(pm_aux_sar_cal_b7) ,
		.pm_aux_sar_cal_b8(pm_aux_sar_cal_b8) ,
		.pm_aux_sar_cal_b9(pm_aux_sar_cal_b9) ,
		.pm_aux_sar_cal_ctrl(pm_aux_sar_cal_ctrl) ,
		.pm_aux_sar_cal_mode(pm_aux_sar_cal_mode) ,
		.pm_aux_sar_cal_refn(pm_aux_sar_cal_refn) ,
		.pm_aux_sar_cal_refp(pm_aux_sar_cal_refp) ,
		.pm_aux_sar_cal_top(pm_aux_sar_cal_top) ,
		.pm_aux_sar_ckskew(pm_aux_sar_ckskew) ,
		.pm_aux_sar_cmp_curr(pm_aux_sar_cmp_curr) ,
		.pm_aux_sar_dmcn(pm_aux_sar_dmcn) ,
		.pm_aux_sar_dmcp(pm_aux_sar_dmcp) ,
		.pm_aux_sar_inbuf_byp(pm_aux_sar_inbuf_byp) ,
		.pm_aux_sar_insel(pm_aux_sar_insel) ,
		.pm_aux_sar_lowrate(pm_aux_sar_lowrate) ,
		.pm_aux_sar_lst(pm_aux_sar_lst) ,
		.pm_aux_sar_pdb(pm_aux_sar_pdb) ,
		.pm_aux_sar_resetb(pm_aux_sar_resetb) ,
		.pm_aux_sar_tstbus_sel(pm_aux_sar_tstbus_sel) ,
		.pm_aux_sar_vcm_ctrl(pm_aux_sar_vcm_ctrl) ,
		.pm_aux_sar_vcm_en(pm_aux_sar_vcm_en) ,
		.pm_aux_sel_fusetrim_cramtrim_adc_dac(pm_aux_sel_fusetrim_cramtrim_adc_dac) ,
		.pm_aux_termination_cal_ctrl(pm_aux_termination_cal_ctrl) ,
		.pm_aux_test_counter(pm_aux_test_counter) ,
		.pm_aux_tstmux_statreg(pm_aux_tstmux_statreg) ,
		.pm_aux_tx_cal_override_value(pm_aux_tx_cal_override_value) ,
		.pm_aux_tx_cal_override_value_enable(pm_aux_tx_cal_override_value_enable) ,
		.pm_aux_tx_imp(pm_aux_tx_imp) ,
		.pm_aux_upper_limit(pm_aux_upper_limit) ,
		.pm_aux_vgen_pdb(pm_aux_vgen_pdb) ,
		.pm_aux_vgen_sel(pm_aux_vgen_sel) ,
		.pm_aux_vrefen_minus(pm_aux_vrefen_minus) ,
		.pm_aux_vrefen_plus(pm_aux_vrefen_plus) ,
		.pma_aux_clock_select(pma_aux_clock_select) ,
		.powerdown_mode(powerdown_mode) ,
		.silicon_rev(silicon_rev) ,
		.sup_mode(sup_mode) ,
		.xdprio_aux_wrap_xdprio_aux_cfg_dprio_sel_core(xdprio_aux_wrap_xdprio_aux_cfg_dprio_sel_core) ,
		.xdprio_aux_wrap_xdprio_aux_uc_channel_base_addr(xdprio_aux_wrap_xdprio_aux_uc_channel_base_addr) ,
		.ximpctrl_pm_aux_impctrl_sel_high_code(ximpctrl_pm_aux_impctrl_sel_high_code) ,
		.ximpctrl_pm_aux_impctrl_tx_enable_eos_det(ximpctrl_pm_aux_impctrl_tx_enable_eos_det) ,
		.ximpctrl_pm_aux_impctrl_tx_ovwr_ncal(ximpctrl_pm_aux_impctrl_tx_ovwr_ncal) ,
		.ximpctrl_pm_aux_impctrl_tx_ovwr_state(ximpctrl_pm_aux_impctrl_tx_ovwr_state) ,
		.ximpctrl_pm_aux_impctrl_tx_ovwr_state50(ximpctrl_pm_aux_impctrl_tx_ovwr_state50) ,
		.ximpctrl_pm_aux_impctrl_txcode_sel(ximpctrl_pm_aux_impctrl_txcode_sel)

	)
	twentynm_hssi_pma_aux_encrypted_inst (

		.dprio_addr(dprio_addr),
		.dprio_clk(dprio_clk),
		.dprio_read(dprio_read),
		.dprio_rst_n(dprio_rst_n),
		.dprio_write(dprio_write),
		.dprio_writedata(dprio_writedata),
		.pld_scan_mode_n(pld_scan_mode_n),
		.pld_scan_shift_n(pld_scan_shift_n),
		.scan_clk_in_impctrl(scan_clk_in_impctrl),
		.scan_in_impctrl(scan_in_impctrl),
		.dft_flag_down(dft_flag_down),
		.dft_flag_up(dft_flag_up),
		.scan_out_impctrl(scan_out_impctrl),
		.tstmux_out(tstmux_out)

	);

endmodule
// -----------------------------------------------------------
// This is auto-generated HSSI Simulation Atom Model Encryption Wrapper
// Module Name : work/twentynm_hssi_pma_cdr_refclk_select_mux_wrapper.v
// -----------------------------------------------------------

`timescale 1 ps/1 ps

module twentynm_hssi_pma_cdr_refclk_select_mux
#(
	// Parameter declaration and default value assignment

	parameter enable_debug_info = "true",	//Valid values: false|true; this is simulation-only parameter, for debug purpose only

	parameter	cdr_clkin_scratch0_src = "cdr_clkin_scratch0_src_refclk_iqclk" ,		//Valid values: cdr_clkin_scratch0_src_refclk_coreclk cdr_clkin_scratch0_src_refclk_iqclk 
	parameter	cdr_clkin_scratch1_src = "cdr_clkin_scratch1_src_refclk_iqclk" ,		//Valid values: cdr_clkin_scratch1_src_refclk_coreclk cdr_clkin_scratch1_src_refclk_iqclk 
	parameter	cdr_clkin_scratch2_src = "cdr_clkin_scratch2_src_refclk_iqclk" ,		//Valid values: cdr_clkin_scratch2_src_refclk_coreclk cdr_clkin_scratch2_src_refclk_iqclk 
	parameter	cdr_clkin_scratch3_src = "cdr_clkin_scratch3_src_refclk_iqclk" ,		//Valid values: cdr_clkin_scratch3_src_refclk_coreclk cdr_clkin_scratch3_src_refclk_iqclk 
	parameter	cdr_clkin_scratch4_src = "cdr_clkin_scratch4_src_refclk_iqclk" ,		//Valid values: cdr_clkin_scratch4_src_refclk_coreclk cdr_clkin_scratch4_src_refclk_iqclk 
	parameter	inclk0_logical_to_physical_mapping = "ref_iqclk0" ,		//Valid values: ref_iqclk0 ref_iqclk1 ref_iqclk2 ref_iqclk3 ref_iqclk4 ref_iqclk5 ref_iqclk6 ref_iqclk7 ref_iqclk8 ref_iqclk9 ref_iqclk10 ref_iqclk11 iqtxrxclk0 iqtxrxclk1 iqtxrxclk2 iqtxrxclk3 iqtxrxclk4 iqtxrxclk5 coreclk fixed_clk lvpecl adj_pll_clk power_down 
	parameter	inclk1_logical_to_physical_mapping = "ref_iqclk0" ,		//Valid values: ref_iqclk0 ref_iqclk1 ref_iqclk2 ref_iqclk3 ref_iqclk4 ref_iqclk5 ref_iqclk6 ref_iqclk7 ref_iqclk8 ref_iqclk9 ref_iqclk10 ref_iqclk11 iqtxrxclk0 iqtxrxclk1 iqtxrxclk2 iqtxrxclk3 iqtxrxclk4 iqtxrxclk5 coreclk fixed_clk lvpecl adj_pll_clk power_down 
	parameter	inclk2_logical_to_physical_mapping = "ref_iqclk0" ,		//Valid values: ref_iqclk0 ref_iqclk1 ref_iqclk2 ref_iqclk3 ref_iqclk4 ref_iqclk5 ref_iqclk6 ref_iqclk7 ref_iqclk8 ref_iqclk9 ref_iqclk10 ref_iqclk11 iqtxrxclk0 iqtxrxclk1 iqtxrxclk2 iqtxrxclk3 iqtxrxclk4 iqtxrxclk5 coreclk fixed_clk lvpecl adj_pll_clk power_down 
	parameter	inclk3_logical_to_physical_mapping = "ref_iqclk0" ,		//Valid values: ref_iqclk0 ref_iqclk1 ref_iqclk2 ref_iqclk3 ref_iqclk4 ref_iqclk5 ref_iqclk6 ref_iqclk7 ref_iqclk8 ref_iqclk9 ref_iqclk10 ref_iqclk11 iqtxrxclk0 iqtxrxclk1 iqtxrxclk2 iqtxrxclk3 iqtxrxclk4 iqtxrxclk5 coreclk fixed_clk lvpecl adj_pll_clk power_down 
	parameter	inclk4_logical_to_physical_mapping = "ref_iqclk0" ,		//Valid values: ref_iqclk0 ref_iqclk1 ref_iqclk2 ref_iqclk3 ref_iqclk4 ref_iqclk5 ref_iqclk6 ref_iqclk7 ref_iqclk8 ref_iqclk9 ref_iqclk10 ref_iqclk11 iqtxrxclk0 iqtxrxclk1 iqtxrxclk2 iqtxrxclk3 iqtxrxclk4 iqtxrxclk5 coreclk fixed_clk lvpecl adj_pll_clk power_down 
	parameter	powerdown_mode = "powerdown" ,		//Valid values: powerup powerdown 
	parameter	receiver_detect_src = "iqclk_src" ,		//Valid values: core_refclk_src iqclk_src 
	parameter	refclk_select = "ref_iqclk0" ,		//Valid values: ref_iqclk0 ref_iqclk1 ref_iqclk2 ref_iqclk3 ref_iqclk4 ref_iqclk5 ref_iqclk6 ref_iqclk7 ref_iqclk8 ref_iqclk9 ref_iqclk10 ref_iqclk11 iqtxrxclk0 iqtxrxclk1 iqtxrxclk2 iqtxrxclk3 iqtxrxclk4 iqtxrxclk5 coreclk fixed_clk lvpecl adj_pll_clk power_down 
	parameter	silicon_rev = "20nm5es" ,		//Valid values: 20nm5es 20nm5es2 20nm4es 20nm4es2 20nm5 20nm4 20nm3 20nm2 20nm1 
	parameter	xmux_refclk_src = "refclk_iqclk" ,		//Valid values: refclk_coreclk refclk_iqclk 
	parameter	xpm_iqref_mux_iqclk_sel = "power_down" ,		//Valid values: ref_iqclk0 ref_iqclk1 ref_iqclk2 ref_iqclk3 ref_iqclk4 ref_iqclk5 ref_iqclk6 ref_iqclk7 ref_iqclk8 ref_iqclk9 ref_iqclk10 ref_iqclk11 iqtxrxclk0 iqtxrxclk1 iqtxrxclk2 iqtxrxclk3 iqtxrxclk4 iqtxrxclk5 power_down 
	parameter	xpm_iqref_mux_scratch0_src = "scratch0_power_down" ,		//Valid values: scratch0_ref_iqclk0 scratch0_ref_iqclk1 scratch0_ref_iqclk2 scratch0_ref_iqclk3 scratch0_ref_iqclk4 scratch0_ref_iqclk5 scratch0_ref_iqclk6 scratch0_ref_iqclk7 scratch0_ref_iqclk8 scratch0_ref_iqclk9 scratch0_ref_iqclk10 scratch0_ref_iqclk11 scratch0_iqtxrxclk0 scratch0_iqtxrxclk1 scratch0_iqtxrxclk2 scratch0_iqtxrxclk3 scratch0_iqtxrxclk4 scratch0_iqtxrxclk5 scratch0_power_down 
	parameter	xpm_iqref_mux_scratch1_src = "scratch1_power_down" ,		//Valid values: scratch1_ref_iqclk0 scratch1_ref_iqclk1 scratch1_ref_iqclk2 scratch1_ref_iqclk3 scratch1_ref_iqclk4 scratch1_ref_iqclk5 scratch1_ref_iqclk6 scratch1_ref_iqclk7 scratch1_ref_iqclk8 scratch1_ref_iqclk9 scratch1_ref_iqclk10 scratch1_ref_iqclk11 scratch1_iqtxrxclk0 scratch1_iqtxrxclk1 scratch1_iqtxrxclk2 scratch1_iqtxrxclk3 scratch1_iqtxrxclk4 scratch1_iqtxrxclk5 scratch1_power_down 
	parameter	xpm_iqref_mux_scratch2_src = "scratch2_power_down" ,		//Valid values: scratch2_ref_iqclk0 scratch2_ref_iqclk1 scratch2_ref_iqclk2 scratch2_ref_iqclk3 scratch2_ref_iqclk4 scratch2_ref_iqclk5 scratch2_ref_iqclk6 scratch2_ref_iqclk7 scratch2_ref_iqclk8 scratch2_ref_iqclk9 scratch2_ref_iqclk10 scratch2_ref_iqclk11 scratch2_iqtxrxclk0 scratch2_iqtxrxclk1 scratch2_iqtxrxclk2 scratch2_iqtxrxclk3 scratch2_iqtxrxclk4 scratch2_iqtxrxclk5 scratch2_power_down 
	parameter	xpm_iqref_mux_scratch3_src = "scratch3_power_down" ,		//Valid values: scratch3_ref_iqclk0 scratch3_ref_iqclk1 scratch3_ref_iqclk2 scratch3_ref_iqclk3 scratch3_ref_iqclk4 scratch3_ref_iqclk5 scratch3_ref_iqclk6 scratch3_ref_iqclk7 scratch3_ref_iqclk8 scratch3_ref_iqclk9 scratch3_ref_iqclk10 scratch3_ref_iqclk11 scratch3_iqtxrxclk0 scratch3_iqtxrxclk1 scratch3_iqtxrxclk2 scratch3_iqtxrxclk3 scratch3_iqtxrxclk4 scratch3_iqtxrxclk5 scratch3_power_down 
	parameter	xpm_iqref_mux_scratch4_src = "scratch4_power_down"		//Valid values: scratch4_ref_iqclk0 scratch4_ref_iqclk1 scratch4_ref_iqclk2 scratch4_ref_iqclk3 scratch4_ref_iqclk4 scratch4_ref_iqclk5 scratch4_ref_iqclk6 scratch4_ref_iqclk7 scratch4_ref_iqclk8 scratch4_ref_iqclk9 scratch4_ref_iqclk10 scratch4_ref_iqclk11 scratch4_iqtxrxclk0 scratch4_iqtxrxclk1 scratch4_iqtxrxclk2 scratch4_iqtxrxclk3 scratch4_iqtxrxclk4 scratch4_iqtxrxclk5 scratch4_power_down 
)

(
	//Port declaration

	input	[8:0]  avmmaddress ,
	input	avmmclk ,
	input	avmmread ,
	input	avmmrstn ,
	input	avmmwrite ,
	input	[7:0]  avmmwritedata ,
	input	core_refclk ,
	input	[5:0]  iqtxrxclk ,
	input	[11:0]  ref_iqclk ,

	output	[7:0]  avmmreaddata ,
	output	blockselect ,
	output	refclk ,
	output	rx_det_clk 

);


	twentynm_hssi_pma_cdr_refclk_select_mux_encrypted
	#(
		.enable_debug_info(enable_debug_info) ,

		.cdr_clkin_scratch0_src(cdr_clkin_scratch0_src) ,
		.cdr_clkin_scratch1_src(cdr_clkin_scratch1_src) ,
		.cdr_clkin_scratch2_src(cdr_clkin_scratch2_src) ,
		.cdr_clkin_scratch3_src(cdr_clkin_scratch3_src) ,
		.cdr_clkin_scratch4_src(cdr_clkin_scratch4_src) ,
		.inclk0_logical_to_physical_mapping(inclk0_logical_to_physical_mapping) ,
		.inclk1_logical_to_physical_mapping(inclk1_logical_to_physical_mapping) ,
		.inclk2_logical_to_physical_mapping(inclk2_logical_to_physical_mapping) ,
		.inclk3_logical_to_physical_mapping(inclk3_logical_to_physical_mapping) ,
		.inclk4_logical_to_physical_mapping(inclk4_logical_to_physical_mapping) ,
		.powerdown_mode(powerdown_mode) ,
		.receiver_detect_src(receiver_detect_src) ,
		.refclk_select(refclk_select) ,
		.silicon_rev(silicon_rev) ,
		.xmux_refclk_src(xmux_refclk_src) ,
		.xpm_iqref_mux_iqclk_sel(xpm_iqref_mux_iqclk_sel) ,
		.xpm_iqref_mux_scratch0_src(xpm_iqref_mux_scratch0_src) ,
		.xpm_iqref_mux_scratch1_src(xpm_iqref_mux_scratch1_src) ,
		.xpm_iqref_mux_scratch2_src(xpm_iqref_mux_scratch2_src) ,
		.xpm_iqref_mux_scratch3_src(xpm_iqref_mux_scratch3_src) ,
		.xpm_iqref_mux_scratch4_src(xpm_iqref_mux_scratch4_src)

	)
	twentynm_hssi_pma_cdr_refclk_select_mux_encrypted_inst (

		.avmmaddress(avmmaddress),
		.avmmclk(avmmclk),
		.avmmread(avmmread),
		.avmmrstn(avmmrstn),
		.avmmwrite(avmmwrite),
		.avmmwritedata(avmmwritedata),
		.core_refclk(core_refclk),
		.iqtxrxclk(iqtxrxclk),
		.ref_iqclk(ref_iqclk),
		.avmmreaddata(avmmreaddata),
		.blockselect(blockselect),
		.refclk(refclk),
		.rx_det_clk(rx_det_clk)

	);

endmodule
// -----------------------------------------------------------
// This is auto-generated HSSI Simulation Atom Model Encryption Wrapper
// Module Name : work/twentynm_hssi_pma_cgb_master_wrapper.v
// -----------------------------------------------------------

`timescale 1 ps/1 ps

module twentynm_hssi_pma_cgb_master
#(
	// Parameter declaration and default value assignment

	parameter enable_debug_info = "true",	//Valid values: false|true; this is simulation-only parameter, for debug purpose only

	parameter	bonding_reset_enable = "allow_bonding_reset" ,		//Valid values: disallow_bonding_reset allow_bonding_reset 
	parameter	cgb_enable_iqtxrxclk = "enable_iqtxrxclk" ,		//Valid values: disable_iqtxrxclk enable_iqtxrxclk 
	parameter	cgb_power_down = "power_down_cgb" ,		//Valid values: normal_cgb power_down_cgb 
	parameter	datarate = "0 bps" ,		//Valid values:  
	parameter	dft_iqtxrxclk_control = "dft_iqtxrxclk_drv_low" ,		//Valid values: dft_iqtxrxclk_drv_low dft_iqtxrxclk_drv_high 
	parameter	initial_settings = "false" ,		//Valid values: false true 
	parameter	input_select = "unused" ,		//Valid values: lcpll_bot lcpll_top fpll_bot fpll_top unused 
	parameter	input_select_gen3 = "unused" ,		//Valid values: lcpll_bot lcpll_top fpll_bot fpll_top unused 
	parameter	master_cgb_clock_control0 = "master_cgb_no_dft_control0" ,		//Valid values: master_cgb_no_dft_control0 master_cgb_dft_control_high0 master_cgb_dft_control_low0 
	parameter	master_cgb_clock_control1 = "master_cgb_no_dft_control1" ,		//Valid values: master_cgb_no_dft_control1 master_cgb_dft_control_high1 master_cgb_dft_control_low1 
	parameter	master_cgb_clock_control2 = "master_cgb_no_dft_control2" ,		//Valid values: master_cgb_no_dft_control2 master_cgb_dft_control_high2 master_cgb_dft_control_low2 
	parameter	master_cgb_clock_control3 = "master_cgb_no_dft_control3" ,		//Valid values: master_cgb_no_dft_control3 master_cgb_dft_control_high3 master_cgb_dft_control_low3 
	parameter	master_cgb_clock_control4 = "master_cgb_no_dft_control4" ,		//Valid values: master_cgb_no_dft_control4 master_cgb_dft_control_high4 master_cgb_dft_control_low4 
	parameter	master_cgb_clock_control5 = "master_cgb_no_dft_control5" ,		//Valid values: master_cgb_no_dft_control5 master_cgb_dft_control_high5 master_cgb_dft_control_low5 
	parameter	mcgb_high_perf_datarate_limit = 36'b000000000000000000000000000000000000 ,		//Valid values: 
	parameter	mcgb_high_perf_voltage = 12'b000000000000 ,		//Valid values: 12 
	parameter	mcgb_low_power_datarate_limit = 36'b000000000000000000000000000000000000 ,		//Valid values: 
	parameter	mcgb_low_power_voltage = 12'b000000000000 ,		//Valid values: 12 
	parameter	mcgb_mid_power_datarate_limit = 36'b000000000000000000000000000000000000 ,		//Valid values: 
	parameter	mcgb_mid_power_voltage = 12'b000000000000 ,		//Valid values: 12 
	parameter	observe_cgb_clocks = "observe_nothing" ,		//Valid values: observe_nothing observe_x1mux_out 
	parameter	optimal = "true" ,		//Valid values: false true 
	parameter	pcie_gen3_bitwidth = "pciegen3_wide" ,		//Valid values: pciegen3_wide pciegen3_narrow 
	parameter	powerdown_mode = "powerup" ,		//Valid values: powerup powerdown 
	parameter	prot_mode = "unused" ,		//Valid values: unused basic_tx pcie_gen1_tx pcie_gen2_tx pcie_gen3_tx pcie_gen4_tx qpi_tx gpon_tx sata_tx 
	parameter	scratch0_x1_clock_src = "unused" ,		//Valid values: lcpll_bot lcpll_top fpll_bot fpll_top unused 
	parameter	scratch1_x1_clock_src = "unused" ,		//Valid values: lcpll_bot lcpll_top fpll_bot fpll_top unused 
	parameter	scratch2_x1_clock_src = "unused" ,		//Valid values: lcpll_bot lcpll_top fpll_bot fpll_top unused 
	parameter	scratch3_x1_clock_src = "unused" ,		//Valid values: lcpll_bot lcpll_top fpll_bot fpll_top unused 
	parameter	ser_mode = "sixty_four_bit" ,		//Valid values: eight_bit ten_bit sixteen_bit twenty_bit thirty_two_bit forty_bit sixty_four_bit 
	parameter	silicon_rev = "20nm5es" ,		//Valid values: 20nm5es 20nm5es2 20nm4es 20nm4es2 20nm5 20nm4 20nm3 20nm2 20nm1 
	parameter	sup_mode = "user_mode" ,		//Valid values: user_mode engineering_mode 
	parameter	tx_ucontrol_en = "disable" ,		//Valid values: disable enable 
	parameter	tx_ucontrol_pcie = "gen1" ,		//Valid values: gen1 gen2 gen3 gen4 
	parameter	tx_ucontrol_reset = "disable" ,		//Valid values: disable enable 
	parameter	vccdreg_output = "vccdreg_nominal" ,		//Valid values: vccdreg_nominal vccdreg_pos_setting1 vccdreg_pos_setting2 vccdreg_pos_setting3 vccdreg_pos_setting4 vccdreg_pos_setting5 vccdreg_pos_setting6 vccdreg_pos_setting7 vccdreg_pos_setting8 vccdreg_pos_setting9 vccdreg_pos_setting10 vccdreg_pos_setting11 vccdreg_pos_setting12 vccdreg_pos_setting13 vccdreg_pos_setting14 vccdreg_pos_setting15 vccdreg_pos_setting16 vccdreg_pos_setting17 vccdreg_pos_setting18 vccdreg_pos_setting19 vccdreg_pos_setting20 vccdreg_pos_setting21 vccdreg_pos_setting22 vccdreg_pos_setting23 vccdreg_pos_setting24 vccdreg_pos_setting25 vccdreg_pos_setting26 vccdreg_pos_setting27 vccdreg_neg_setting1 vccdreg_neg_setting2 vccdreg_neg_setting3 vccdreg_neg_setting4 
	parameter	x1_clock_source_sel = "fpll_top" ,		//Valid values: lcpll_bot lcpll_top fpll_bot fpll_top lcpll_bot_g1_g2 lcpll_top_g1_g2 fpll_bot_g1_g2 fpll_top_g1_g2 fpll_bot_g2_lcpll_bot_g3 fpll_bot_g2_lcpll_top_g3 fpll_top_g2_lcpll_bot_g3 fpll_top_g2_lcpll_top_g3 
	parameter	x1_div_m_sel = "divbypass"		//Valid values: divbypass divby2 divby4 divby8 
)

(
	//Port declaration

	input	[8:0]  avmmaddress ,
	input	avmmclk ,
	input	avmmread ,
	input	avmmrstn ,
	input	avmmwrite ,
	input	[7:0]  avmmwritedata ,
	input	cgb_rstb ,
	input	clk_fpll_b ,
	input	clk_fpll_t ,
	input	clk_lc_b ,
	input	clk_lc_t ,
	input	clkb_fpll_b ,
	input	clkb_fpll_t ,
	input	clkb_lc_b ,
	input	clkb_lc_t ,
	input	[1:0]  pcie_sw ,
	input	tx_bonding_rstb ,

	output	[7:0]  avmmreaddata ,
	output	blockselect ,
	output	[5:0]  cpulse_out_bus ,
	output	[1:0]  mstcgb_core ,
	output	[1:0]  pcie_sw_done ,
	output	tx_iqtxrxclk_out 

);

// Function to convert a 64bit binary to a string.
function [128*8-1 : 0] m_bin_to_str;
	input [128 : 1]   s;
	reg   [128 : 1]   reg_s;
	reg   [7 : 0]    tmp;
	reg   [128*8 : 1] res;
	integer m, index;

	begin
		reg_s = s;
		res = 128'h00000000000000000000000000000000;

		for (m = 128; m > 0; m = m-1 )
		begin
			tmp = reg_s[128];
			res[(((m-1)*8)+1)] = tmp & 1'b1;
			reg_s = reg_s << 1;
		end

		m_bin_to_str = res;
	end
endfunction

localparam [8*128-1 : 0] mcgb_high_perf_datarate_limit_string	= m_bin_to_str(mcgb_high_perf_datarate_limit);
localparam [8*128-1 : 0] mcgb_low_power_datarate_limit_string	= m_bin_to_str(mcgb_low_power_datarate_limit);
localparam [8*128-1 : 0] mcgb_mid_power_datarate_limit_string	= m_bin_to_str(mcgb_mid_power_datarate_limit);


	twentynm_hssi_pma_cgb_master_encrypted
	#(
		.enable_debug_info(enable_debug_info) ,

		.bonding_reset_enable(bonding_reset_enable) ,
		.cgb_enable_iqtxrxclk(cgb_enable_iqtxrxclk) ,
		.cgb_power_down(cgb_power_down) ,
		.datarate(datarate) ,
		.dft_iqtxrxclk_control(dft_iqtxrxclk_control) ,
		.initial_settings(initial_settings) ,
		.input_select(input_select) ,
		.input_select_gen3(input_select_gen3) ,
		.master_cgb_clock_control0(master_cgb_clock_control0) ,
		.master_cgb_clock_control1(master_cgb_clock_control1) ,
		.master_cgb_clock_control2(master_cgb_clock_control2) ,
		.master_cgb_clock_control3(master_cgb_clock_control3) ,
		.master_cgb_clock_control4(master_cgb_clock_control4) ,
		.master_cgb_clock_control5(master_cgb_clock_control5) ,
		.mcgb_high_perf_datarate_limit(mcgb_high_perf_datarate_limit_string) ,
		.mcgb_high_perf_voltage(mcgb_high_perf_voltage) ,
		.mcgb_low_power_datarate_limit(mcgb_low_power_datarate_limit_string) ,
		.mcgb_low_power_voltage(mcgb_low_power_voltage) ,
		.mcgb_mid_power_datarate_limit(mcgb_mid_power_datarate_limit_string) ,
		.mcgb_mid_power_voltage(mcgb_mid_power_voltage) ,
		.observe_cgb_clocks(observe_cgb_clocks) ,
		.optimal(optimal) ,
		.pcie_gen3_bitwidth(pcie_gen3_bitwidth) ,
		.powerdown_mode(powerdown_mode) ,
		.prot_mode(prot_mode) ,
		.scratch0_x1_clock_src(scratch0_x1_clock_src) ,
		.scratch1_x1_clock_src(scratch1_x1_clock_src) ,
		.scratch2_x1_clock_src(scratch2_x1_clock_src) ,
		.scratch3_x1_clock_src(scratch3_x1_clock_src) ,
		.ser_mode(ser_mode) ,
		.silicon_rev(silicon_rev) ,
		.sup_mode(sup_mode) ,
		.tx_ucontrol_en(tx_ucontrol_en) ,
		.tx_ucontrol_pcie(tx_ucontrol_pcie) ,
		.tx_ucontrol_reset(tx_ucontrol_reset) ,
		.vccdreg_output(vccdreg_output) ,
		.x1_clock_source_sel(x1_clock_source_sel) ,
		.x1_div_m_sel(x1_div_m_sel)

	)
	twentynm_hssi_pma_cgb_master_encrypted_inst (

		.avmmaddress(avmmaddress),
		.avmmclk(avmmclk),
		.avmmread(avmmread),
		.avmmrstn(avmmrstn),
		.avmmwrite(avmmwrite),
		.avmmwritedata(avmmwritedata),
		.cgb_rstb(cgb_rstb),
		.clk_fpll_b(clk_fpll_b),
		.clk_fpll_t(clk_fpll_t),
		.clk_lc_b(clk_lc_b),
		.clk_lc_t(clk_lc_t),
		.clkb_fpll_b(clkb_fpll_b),
		.clkb_fpll_t(clkb_fpll_t),
		.clkb_lc_b(clkb_lc_b),
		.clkb_lc_t(clkb_lc_t),
		.pcie_sw(pcie_sw),
		.tx_bonding_rstb(tx_bonding_rstb),
		.avmmreaddata(avmmreaddata),
		.blockselect(blockselect),
		.cpulse_out_bus(cpulse_out_bus),
		.mstcgb_core(mstcgb_core),
		.pcie_sw_done(pcie_sw_done),
		.tx_iqtxrxclk_out(tx_iqtxrxclk_out)

	);

endmodule
// -----------------------------------------------------------
// This is auto-generated HSSI Simulation Atom Model Encryption Wrapper
// Module Name : work/twentynm_hssi_pma_channel_pll_wrapper.v
// -----------------------------------------------------------

`timescale 1 ps/1 ps

module twentynm_hssi_pma_channel_pll
#(
	// Parameter declaration and default value assignment

	parameter enable_debug_info = "true",	//Valid values: false|true; this is simulation-only parameter, for debug purpose only

	parameter	analog_mode = "user_custom" ,		//Valid values: user_custom 
	parameter	atb_select_control = "atb_off" ,		//Valid values: atb_off atb_select_tp_1 atb_select_tp_2 atb_select_tp_3 atb_select_tp_4 atb_select_tp_5 atb_select_tp_6 atb_select_tp_7 atb_select_tp_8 atb_select_tp_9 atb_select_tp_10 atb_select_tp_11 atb_select_tp_12 atb_select_tp_13 atb_select_tp_14 atb_select_tp_15 atb_select_tp_16 atb_select_tp_17 atb_select_tp_18 atb_select_tp_19 atb_select_tp_20 atb_select_tp_21 atb_select_tp_22 atb_select_tp_23 atb_select_tp_24 atb_select_tp_25 atb_select_tp_26 atb_select_tp_27 atb_select_tp_28 atb_select_tp_29 atb_select_tp_30 atb_select_tp_31 atb_select_tp_32 atb_select_tp_33 atb_select_tp_34 atb_select_tp_35 atb_select_tp_36 atb_select_tp_37 atb_select_tp_38 atb_select_tp_39 atb_select_tp_40 atb_select_tp_41 atb_select_tp_42 atb_select_tp_43 atb_select_tp_44 atb_select_tp_45 atb_select_tp_46 atb_select_tp_47 atb_select_tp_48 atb_select_tp_49 atb_select_tp_50 atb_select_tp_51 atb_select_tp_52 atb_select_tp_53 atb_select_tp_54 atb_select_tp_55 atb_select_tp_56 atb_select_tp_57 atb_select_tp_58 atb_select_tp_59 atb_select_tp_60 atb_select_tp_61 atb_select_tp_62 atb_select_tp_63 
	parameter	auto_reset_on = "auto_reset_on" ,		//Valid values: auto_reset_on auto_reset_off 
	parameter	bandwidth_range_high = "0 hz" ,		//Valid values:  
	parameter	bandwidth_range_low = "0 hz" ,		//Valid values:  
	parameter	bbpd_data_pattern_filter_select = "bbpd_data_pat_off" ,		//Valid values: bbpd_data_pat_off bbpd_data_pat_1 bbpd_data_pat_2 bbpd_data_pat_3 
	parameter	bw_sel = "low" ,		//Valid values: low medium high 
	parameter	cal_vco_count_length = "sel_8b_count" ,		//Valid values: sel_8b_count sel_12b_count 
	parameter	cdr_odi_select = "sel_cdr" ,		//Valid values: sel_cdr sel_odi 
	parameter	cdr_phaselock_mode = "no_ignore_lock" ,		//Valid values: no_ignore_lock ignore_lock 
	parameter	cdr_powerdown_mode = "power_down" ,		//Valid values: power_down power_up 
	parameter	cgb_div = 1 ,		//Valid values: 1 2 4 8 
	parameter	chgpmp_current_dn_pd = "cp_current_pd_dn_setting0" ,		//Valid values: cp_current_pd_dn_setting0 cp_current_pd_dn_setting1 cp_current_pd_dn_setting2 cp_current_pd_dn_setting3 cp_current_pd_dn_setting4 
	parameter	chgpmp_current_dn_trim = "cp_current_trimming_dn_setting0" ,		//Valid values: cp_current_trimming_dn_setting0 cp_current_trimming_dn_setting1 cp_current_trimming_dn_setting2 cp_current_trimming_dn_setting3 cp_current_trimming_dn_setting4 cp_current_trimming_dn_setting5 cp_current_trimming_dn_setting6 cp_current_trimming_dn_setting7 cp_current_trimming_dn_setting8 cp_current_trimming_dn_setting9 cp_current_trimming_dn_setting10 cp_current_trimming_dn_setting11 cp_current_trimming_dn_setting12 cp_current_trimming_dn_setting13 cp_current_trimming_dn_setting14 cp_current_trimming_dn_setting15 
	parameter	chgpmp_current_pd = "cp_current_pd_setting0" ,		//Valid values: cp_current_pd_setting0 cp_current_pd_setting1 cp_current_pd_setting2 cp_current_pd_setting3 cp_current_pd_setting4 
	parameter	chgpmp_current_pfd = "cp_current_pfd_setting0" ,		//Valid values: cp_current_pfd_setting0 cp_current_pfd_setting1 cp_current_pfd_setting2 cp_current_pfd_setting3 cp_current_pfd_setting4 
	parameter	chgpmp_current_up_pd = "cp_current_pd_up_setting0" ,		//Valid values: cp_current_pd_up_setting0 cp_current_pd_up_setting1 cp_current_pd_up_setting2 cp_current_pd_up_setting3 cp_current_pd_up_setting4 
	parameter	chgpmp_current_up_trim = "cp_current_trimming_up_setting0" ,		//Valid values: cp_current_trimming_up_setting0 cp_current_trimming_up_setting1 cp_current_trimming_up_setting2 cp_current_trimming_up_setting3 cp_current_trimming_up_setting4 cp_current_trimming_up_setting5 cp_current_trimming_up_setting6 cp_current_trimming_up_setting7 cp_current_trimming_up_setting8 cp_current_trimming_up_setting9 cp_current_trimming_up_setting10 cp_current_trimming_up_setting11 cp_current_trimming_up_setting12 cp_current_trimming_up_setting13 cp_current_trimming_up_setting14 cp_current_trimming_up_setting15 
	parameter	chgpmp_dn_pd_trim_double = "normal_dn_trim_current" ,		//Valid values: normal_dn_trim_current double_dn_trim_current 
	parameter	chgpmp_replicate = "false" ,		//Valid values: false true 
	parameter	chgpmp_testmode = "cp_test_disable" ,		//Valid values: cp_test_disable cp_test_up cp_test_dn cp_tristate 
	parameter	chgpmp_up_pd_trim_double = "normal_up_trim_current" ,		//Valid values: normal_up_trim_current double_up_trim_current 
	parameter	chgpmp_vccreg = "vreg_fw0" ,		//Valid values: vreg_fw0 vreg_fw1 vreg_fw2 vreg_fw3 vreg_fw4 vreg_fw5 vreg_fw6 vreg_fw7 
	parameter	clklow_mux_select = "clklow_mux_cdr_fbclk" ,		//Valid values: clklow_mux_cdr_fbclk clklow_mux_fpll_test1 clklow_mux_reserved_1 clklow_mux_rx_deser_pclk_test clklow_mux_reserved_2 clklow_mux_reserved_3 clklow_mux_reserved_4 clklow_mux_dfe_test 
	parameter	datarate = "0 bps" ,		//Valid values:  
	parameter	diag_loopback_enable = "false" ,		//Valid values: true false 
	parameter	disable_up_dn = "true" ,		//Valid values: true false 
	parameter	enable_idle_rx_channel_support = "false" ,		//Valid values: true false 
	parameter	f_max_cmu_out_freq = 36'b000000000000000000000000000000000001 ,		//Valid values: 
	parameter	f_max_m_counter = 36'b000000000000000000000000000000000001 ,		//Valid values: 
	parameter	f_max_pfd = "0 hz" ,		//Valid values:  
	parameter	f_max_ref = "0 hz" ,		//Valid values:  
	parameter	f_max_vco = "0 hz" ,		//Valid values:  
	parameter	f_min_gt_channel = "0 hz" ,		//Valid values:  
	parameter	f_min_pfd = "0 hz" ,		//Valid values:  
	parameter	f_min_ref = "0 hz" ,		//Valid values:  
	parameter	f_min_vco = "0 hz" ,		//Valid values:  
	parameter	fb_select = "direct_fb" ,		//Valid values: iqtxrxclk_fb direct_fb 
	parameter	fref_clklow_div = 1 ,		//Valid values: 1 2 4 8 
	parameter	fref_mux_select = "fref_mux_cdr_refclk" ,		//Valid values: fref_mux_cdr_refclk fref_mux_fpll_test0 fref_mux_reserved_1 fref_mux_tx_ser_pclk_test fref_mux_reserved_2 fref_mux_reserved_3 fref_mux_reserved_4 fref_mux_reserved_5 
	parameter	gpon_lck2ref_control = "gpon_lck2ref_off" ,		//Valid values: gpon_lck2ref_off gpon_lck2ref_on 
	parameter	initial_settings = "false" ,		//Valid values: false true 
	parameter	iqclk_mux_sel = "power_down" ,		//Valid values: iqtxrxclk0 iqtxrxclk1 iqtxrxclk2 iqtxrxclk3 iqtxrxclk4 iqtxrxclk5 power_down 
	parameter	is_cascaded_pll = "false" ,		//Valid values: true false 
	parameter	lck2ref_delay_control = "lck2ref_delay_off" ,		//Valid values: lck2ref_delay_off lck2ref_delay_1 lck2ref_delay_2 lck2ref_delay_3 lck2ref_delay_4 lck2ref_delay_5 lck2ref_delay_6 lck2ref_delay_7 
	parameter	lf_resistor_pd = "lf_pd_setting0" ,		//Valid values: lf_pd_setting0 lf_pd_setting1 lf_pd_setting2 lf_pd_setting3 
	parameter	lf_resistor_pfd = "lf_pfd_setting0" ,		//Valid values: lf_pfd_setting0 lf_pfd_setting1 lf_pfd_setting2 lf_pfd_setting3 
	parameter	lf_ripple_cap = "lf_no_ripple" ,		//Valid values: lf_no_ripple lf_ripple_cap1 
	parameter	loop_filter_bias_select = "lpflt_bias_off" ,		//Valid values: lpflt_bias_off lpflt_bias_1 lpflt_bias_2 lpflt_bias_3 lpflt_bias_4 lpflt_bias_5 lpflt_bias_6 lpflt_bias_7 
	parameter	loopback_mode = "loopback_disabled" ,		//Valid values: loopback_disabled loopback_recovered_data rx_refclk rx_refclk_cdr_loopback unused2 loopback_received_data unused1 
	parameter	lpd_counter = 5'b00001 ,		//Valid values: 5 
	parameter	lpfd_counter = 5'b00001 ,		//Valid values: 5 
	parameter	ltd_ltr_micro_controller_select = "ltd_ltr_pcs" ,		//Valid values: ltd_ltr_pcs ltr_ucontroller ltd_ucontroller 
	parameter	m_counter = 16 ,		//Valid values: 0..255 
	parameter	n_counter = 1 ,		//Valid values: 1 2 4 8 
	parameter	n_counter_scratch = 6'b000001 ,		//Valid values: 6 
	parameter	optimal = "true" ,		//Valid values: false true 
	parameter	output_clock_frequency = "0 hz" ,		//Valid values:  
	parameter	pcie_gen = "non_pcie" ,		//Valid values: pcie_gen1_100mhzref pcie_gen2_100mhzref pcie_gen3_100mhzref pcie_gen1_125mhzref pcie_gen2_125mhzref pcie_gen3_125mhzref non_pcie 
	parameter	pd_fastlock_mode = "false" ,		//Valid values: false true 
	parameter	pd_l_counter = 1 ,		//Valid values: 0 1 2 4 8 16 
	parameter	pfd_l_counter = 1 ,		//Valid values: 0 1 2 4 8 16 100 
	parameter	pm_speed_grade = "e2" ,		//Valid values: e1 i1 e2 i2 e3 i3 m3 e4 i4 m4 e5 i5 
	parameter	pma_width = 8 ,		//Valid values: 8 10 16 20 32 40 64 
	parameter	position = "position_unknown" ,		//Valid values: position0 position1 position2 position_unknown 
	parameter	power_mode = "low_power" ,		//Valid values: low_power mid_power high_perf 
	parameter	primary_use = "cmu" ,		//Valid values: cmu cdr 
	parameter	prot_mode = "unused" ,		//Valid values: basic_rx pcie_gen1_rx pcie_gen2_rx pcie_gen3_rx pcie_gen4_rx qpi_rx unused gpon_rx sata_rx 
	parameter	reference_clock_frequency = "0 hz" ,		//Valid values:  
	parameter	requires_gt_capable_channel = "false" ,		//Valid values: false true 
	parameter	reverse_serial_loopback = "no_loopback" ,		//Valid values: no_loopback loopback_data_no_posttap loopback_data_with_posttap loopback_data_0_1 
	parameter	set_cdr_input_freq_range = 8'b00000000 ,		//Valid values: 8 
	parameter	set_cdr_v2i_enable = "true" ,		//Valid values: true false 
	parameter	set_cdr_vco_reset = "false" ,		//Valid values: true false 
	parameter	set_cdr_vco_speed = 5'b00001 ,		//Valid values: 5 
	parameter	set_cdr_vco_speed_fix = 8'b00000000 ,		//Valid values: 8 
	parameter	set_cdr_vco_speed_pciegen3 = "cdr_vco_max_speedbin_pciegen3" ,		//Valid values: cdr_vco_min_speedbin_pciegen3 cdr_vco_max_speedbin_pciegen3 
	parameter	side = "side_unknown" ,		//Valid values: left right side_unknown 
	parameter	silicon_rev = "20nm5es" ,		//Valid values: 20nm5es 20nm5es2 20nm4es 20nm4es2 20nm5 20nm4 20nm3 20nm2 20nm1 
	parameter	sup_mode = "user_mode" ,		//Valid values: user_mode engineering_mode 
	parameter	top_or_bottom = "tb_unknown" ,		//Valid values: top bot tb_unknown 
	parameter	tx_pll_prot_mode = "txpll_unused" ,		//Valid values: txpll_unused txpll_enable_pcie txpll_enable 
	parameter	txpll_hclk_driver_enable = "false" ,		//Valid values: true false 
	parameter	uc_cru_rstb = "cdr_lf_reset_off" ,		//Valid values: cdr_lf_reset_off cdr_lf_reset_on 
	parameter	uc_ro_cal = "uc_ro_cal_off" ,		//Valid values: uc_ro_cal_off uc_ro_cal_on 
	parameter	uc_ro_cal_status = "uc_ro_cal_notdone" ,		//Valid values: uc_ro_cal_notdone uc_ro_cal_done 
	parameter	vco_freq = "0 hz" ,		//Valid values:  
	parameter	vco_overrange_voltage = "vco_overrange_off" ,		//Valid values: vco_overrange_off vco_overrange_ref_1 vco_overrange_ref_2 vco_overrange_ref_3 
	parameter	vco_underrange_voltage = "vco_underange_off"		//Valid values: vco_underange_off vco_underange_ref_1 vco_underange_ref_2 vco_underange_ref_3 
)

(
	//Port declaration

	input	[8:0]  avmmaddress ,
	input	avmmclk ,
	input	avmmread ,
	input	avmmrstn ,
	input	avmmwrite ,
	input	[7:0]  avmmwritedata ,
	input	adapt_en ,
	input	[62:0]  atbsel ,
	input	clk0_bbpd ,
	input	clk180_bbpd ,
	input	clk270_bbpd ,
	input	clk90_bbpd ,
	input	deven ,
	input	devenb ,
	input	dfe_test ,
	input	dodd ,
	input	doddb ,
	input	e270 ,
	input	e270b ,
	input	e90 ,
	input	e90b ,
	input	early_eios ,
	input	error_even ,
	input	error_evenb ,
	input	error_odd ,
	input	error_oddb ,
	input	fpll_test0 ,
	input	fpll_test1 ,
	input	[5:0]  iqtxrxclk ,
	input	ltd_b ,
	input	ltr ,
	input	odi_clk ,
	input	odi_clkb ,
	input	[1:0]  pcie_sw_ret ,
	input	ppm_lock ,
	input	refclk ,
	input	rst_n ,
	input	rx_deser_pclk_test ,
	input	rx_lpbkn ,
	input	rx_lpbkp ,
	input	rxp ,
	input	sd ,
	input	tx_ser_pclk_test ,

	output	[7:0]  avmmreaddata ,
	output	blockselect ,
	output	cdr_cnt_done ,
	output	cdr_lpbkdp ,
	output	cdr_lpbkp ,
	output	[11:0]  cdr_refclk_cal_out ,
	output	[11:0]  cdr_vco_cal_out ,
	output	clk0_des ,
	output	clk0_odi ,
	output	clk0_pd ,
	output	clk0_pfd ,
	output	clk180_des ,
	output	clk180_odi ,
	output	clk180_pd ,
	output	clk180_pfd ,
	output	clk270_des ,
	output	clk270_odi ,
	output	clk270_pd ,
	output	clk90_des ,
	output	clk90_odi ,
	output	clk90_pd ,
	output	clklow ,
	output	deven_des ,
	output	devenb_des ,
	output	dodd_des ,
	output	doddb_des ,
	output	error_even_des ,
	output	error_evenb_des ,
	output	error_odd_des ,
	output	error_oddb_des ,
	output	fref ,
	output	lock2ref ,
	output	overrange ,
	output	pfdmode_lock ,
	output	rlpbkdn ,
	output	rlpbkdp ,
	output	rlpbkn ,
	output	rlpbkp ,
	output	rx_signal_ok ,
	output	rxpll_lock ,
	output	tx_rlpbk ,
	output	underrange ,
	output	von_lp ,
	output	vop_lp 

);

// Function to convert a 64bit binary to a string.
function [128*8-1 : 0] m_bin_to_str;
	input [128 : 1]   s;
	reg   [128 : 1]   reg_s;
	reg   [7 : 0]    tmp;
	reg   [128*8 : 1] res;
	integer m, index;

	begin
		reg_s = s;
		res = 128'h00000000000000000000000000000000;

		for (m = 128; m > 0; m = m-1 )
		begin
			tmp = reg_s[128];
			res[(((m-1)*8)+1)] = tmp & 1'b1;
			reg_s = reg_s << 1;
		end

		m_bin_to_str = res;
	end
endfunction

localparam [8*128-1 : 0] f_max_cmu_out_freq_string	= m_bin_to_str(f_max_cmu_out_freq);
localparam [8*128-1 : 0] f_max_m_counter_string	= m_bin_to_str(f_max_m_counter);

	assign clk270_des = clk180_des;
	assign clk90_des = clk0_des;

	twentynm_hssi_pma_channel_pll_encrypted
	#(
		.enable_debug_info(enable_debug_info) ,

		.analog_mode(analog_mode) ,
		.atb_select_control(atb_select_control) ,
		.auto_reset_on(auto_reset_on) ,
		.bandwidth_range_high(bandwidth_range_high) ,
		.bandwidth_range_low(bandwidth_range_low) ,
		.bbpd_data_pattern_filter_select(bbpd_data_pattern_filter_select) ,
		.bw_sel(bw_sel) ,
		.cal_vco_count_length(cal_vco_count_length) ,
		.cdr_odi_select(cdr_odi_select) ,
		.cdr_phaselock_mode(cdr_phaselock_mode) ,
		.cdr_powerdown_mode(cdr_powerdown_mode) ,
		.cgb_div(cgb_div) ,
		.chgpmp_current_dn_pd(chgpmp_current_dn_pd) ,
		.chgpmp_current_dn_trim(chgpmp_current_dn_trim) ,
		.chgpmp_current_pfd(chgpmp_current_pfd) ,
		.chgpmp_current_up_pd(chgpmp_current_up_pd) ,
		.chgpmp_current_up_trim(chgpmp_current_up_trim) ,
		.chgpmp_dn_pd_trim_double(chgpmp_dn_pd_trim_double) ,
		.chgpmp_replicate(chgpmp_replicate) ,
		.chgpmp_testmode(chgpmp_testmode) ,
		.chgpmp_up_pd_trim_double(chgpmp_up_pd_trim_double) ,
		.chgpmp_vccreg(chgpmp_vccreg) ,
		.clklow_mux_select(clklow_mux_select) ,
		.datarate(datarate) ,
		.diag_loopback_enable(diag_loopback_enable) ,
		.disable_up_dn(disable_up_dn) ,
		.enable_idle_rx_channel_support(enable_idle_rx_channel_support) ,
		.f_max_cmu_out_freq(f_max_cmu_out_freq_string) ,
		.f_max_m_counter(f_max_m_counter_string) ,
		.f_max_pfd(f_max_pfd) ,
		.f_max_ref(f_max_ref) ,
		.f_max_vco(f_max_vco) ,
		.f_min_gt_channel(f_min_gt_channel) ,
		.f_min_pfd(f_min_pfd) ,
		.f_min_ref(f_min_ref) ,
		.f_min_vco(f_min_vco) ,
		.fb_select(fb_select) ,
		.fref_clklow_div(fref_clklow_div) ,
		.fref_mux_select(fref_mux_select) ,
		.gpon_lck2ref_control(gpon_lck2ref_control) ,
		.initial_settings(initial_settings) ,
		.iqclk_mux_sel(iqclk_mux_sel) ,
		.is_cascaded_pll(is_cascaded_pll) ,
		.lck2ref_delay_control(lck2ref_delay_control) ,
		.lf_resistor_pd(lf_resistor_pd) ,
		.lf_resistor_pfd(lf_resistor_pfd) ,
		.lf_ripple_cap(lf_ripple_cap) ,
		.loop_filter_bias_select(loop_filter_bias_select) ,
		.loopback_mode(loopback_mode) ,
		.lpd_counter(lpd_counter) ,
		.lpfd_counter(lpfd_counter) ,
		.ltd_ltr_micro_controller_select(ltd_ltr_micro_controller_select) ,
		.m_counter(m_counter) ,
		.n_counter(n_counter) ,
		.n_counter_scratch(n_counter_scratch) ,
		.optimal(optimal) ,
		.output_clock_frequency(output_clock_frequency) ,
		.pcie_gen(pcie_gen) ,
		.pd_fastlock_mode(pd_fastlock_mode) ,
		.pd_l_counter(pd_l_counter) ,
		.pfd_l_counter(pfd_l_counter) ,
		.pm_speed_grade(pm_speed_grade) ,
		.pma_width(pma_width) ,
		.position(position) ,
		.power_mode(power_mode) ,
		.primary_use(primary_use) ,
		.prot_mode(prot_mode) ,
		.reference_clock_frequency(reference_clock_frequency) ,
		.requires_gt_capable_channel(requires_gt_capable_channel) ,
		.reverse_serial_loopback(reverse_serial_loopback) ,
		.set_cdr_input_freq_range(set_cdr_input_freq_range) ,
		.set_cdr_v2i_enable(set_cdr_v2i_enable) ,
		.set_cdr_vco_reset(set_cdr_vco_reset) ,
		.set_cdr_vco_speed(set_cdr_vco_speed) ,
		.set_cdr_vco_speed_fix(set_cdr_vco_speed_fix) ,
		.set_cdr_vco_speed_pciegen3(set_cdr_vco_speed_pciegen3) ,
		.side(side) ,
		.silicon_rev(silicon_rev) ,
		.sup_mode(sup_mode) ,
		.top_or_bottom(top_or_bottom) ,
		.tx_pll_prot_mode(tx_pll_prot_mode) ,
		.txpll_hclk_driver_enable(txpll_hclk_driver_enable) ,
		.uc_cru_rstb(uc_cru_rstb) ,
		.uc_ro_cal(uc_ro_cal) ,
		.uc_ro_cal_status(uc_ro_cal_status) ,
		.vco_freq(vco_freq) ,
		.vco_overrange_voltage(vco_overrange_voltage) ,
		.vco_underrange_voltage(vco_underrange_voltage)

	)
	twentynm_hssi_pma_channel_pll_encrypted_inst (

		.avmmaddress(avmmaddress),
		.avmmclk(avmmclk),
		.avmmread(avmmread),
		.avmmrstn(avmmrstn),
		.avmmwrite(avmmwrite),
		.avmmwritedata(avmmwritedata),
		.adapt_en(adapt_en),
		.atbsel(atbsel),
		.clk0_bbpd(clk0_bbpd),
		.clk180_bbpd(clk180_bbpd),
		.clk270_bbpd(clk270_bbpd),
		.clk90_bbpd(clk90_bbpd),
		.deven(deven),
		.devenb(devenb),
		.dfe_test(dfe_test),
		.dodd(dodd),
		.doddb(doddb),
		.e270(e270),
		.e270b(e270b),
		.e90(e90),
		.e90b(e90b),
		.early_eios(early_eios),
		.error_even(error_even),
		.error_evenb(error_evenb),
		.error_odd(error_odd),
		.error_oddb(error_oddb),
		.fpll_test0(fpll_test0),
		.fpll_test1(fpll_test1),
		.iqtxrxclk(iqtxrxclk),
		.ltd_b(ltd_b),
		.ltr(ltr),
		.odi_clk(odi_clk),
		.odi_clkb(odi_clkb),
		.pcie_sw_ret(pcie_sw_ret),
		.ppm_lock(ppm_lock),
		.refclk(refclk),
		.rst_n(rst_n),
		.rx_deser_pclk_test(rx_deser_pclk_test),
		.rx_lpbkn(rx_lpbkn),
		.rx_lpbkp(rx_lpbkp),
		.rxp(rxp),
		.sd(sd),
		.tx_ser_pclk_test(tx_ser_pclk_test),
		.avmmreaddata(avmmreaddata),
		.blockselect(blockselect),
		.cdr_cnt_done(cdr_cnt_done),
		.cdr_lpbkdp(cdr_lpbkdp),
		.cdr_lpbkp(cdr_lpbkp),
		.cdr_refclk_cal_out(cdr_refclk_cal_out),
		.cdr_vco_cal_out(cdr_vco_cal_out),
		.clk0_des(clk0_des),
		.clk0_odi(clk0_odi),
		.clk0_pd(clk0_pd),
		.clk0_pfd(clk0_pfd),
		.clk180_des(clk180_des),
		.clk180_odi(clk180_odi),
		.clk180_pd(clk180_pd),
		.clk180_pfd(clk180_pfd),
		.clk270_odi(clk270_odi),
		.clk270_pd(clk270_pd),
		.clk90_odi(clk90_odi),
		.clk90_pd(clk90_pd),
		.clklow(clklow),
		.deven_des(deven_des),
		.devenb_des(devenb_des),
		.dodd_des(dodd_des),
		.doddb_des(doddb_des),
		.error_even_des(error_even_des),
		.error_evenb_des(error_evenb_des),
		.error_odd_des(error_odd_des),
		.error_oddb_des(error_oddb_des),
		.fref(fref),
		.lock2ref(lock2ref),
		.overrange(overrange),
		.pfdmode_lock(pfdmode_lock),
		.rlpbkdn(rlpbkdn),
		.rlpbkdp(rlpbkdp),
		.rlpbkn(rlpbkn),
		.rlpbkp(rlpbkp),
		.rx_signal_ok(rx_signal_ok),
		.rxpll_lock(rxpll_lock),
		.tx_rlpbk(tx_rlpbk),
		.underrange(underrange),
		.von_lp(von_lp),
		.vop_lp(vop_lp)

	);

endmodule
// -----------------------------------------------------------
// This is auto-generated HSSI Simulation Atom Model Encryption Wrapper
// Module Name : work/twentynm_hssi_pma_lc_refclk_select_mux_wrapper.v
// -----------------------------------------------------------

`timescale 1 ps/1 ps

module twentynm_hssi_pma_lc_refclk_select_mux
#(
	// Parameter declaration and default value assignment

	parameter enable_debug_info = "true",	//Valid values: false|true; this is simulation-only parameter, for debug purpose only

	parameter	inclk0_logical_to_physical_mapping = "ref_iqclk0" ,		//Valid values: ref_iqclk0 ref_iqclk1 ref_iqclk2 ref_iqclk3 ref_iqclk4 ref_iqclk5 ref_iqclk6 ref_iqclk7 ref_iqclk8 ref_iqclk9 ref_iqclk10 ref_iqclk11 iqtxrxclk0 iqtxrxclk1 iqtxrxclk2 iqtxrxclk3 iqtxrxclk4 iqtxrxclk5 coreclk fixed_clk lvpecl adj_pll_clk power_down 
	parameter	inclk1_logical_to_physical_mapping = "ref_iqclk0" ,		//Valid values: ref_iqclk0 ref_iqclk1 ref_iqclk2 ref_iqclk3 ref_iqclk4 ref_iqclk5 ref_iqclk6 ref_iqclk7 ref_iqclk8 ref_iqclk9 ref_iqclk10 ref_iqclk11 iqtxrxclk0 iqtxrxclk1 iqtxrxclk2 iqtxrxclk3 iqtxrxclk4 iqtxrxclk5 coreclk fixed_clk lvpecl adj_pll_clk power_down 
	parameter	inclk2_logical_to_physical_mapping = "ref_iqclk0" ,		//Valid values: ref_iqclk0 ref_iqclk1 ref_iqclk2 ref_iqclk3 ref_iqclk4 ref_iqclk5 ref_iqclk6 ref_iqclk7 ref_iqclk8 ref_iqclk9 ref_iqclk10 ref_iqclk11 iqtxrxclk0 iqtxrxclk1 iqtxrxclk2 iqtxrxclk3 iqtxrxclk4 iqtxrxclk5 coreclk fixed_clk lvpecl adj_pll_clk power_down 
	parameter	inclk3_logical_to_physical_mapping = "ref_iqclk0" ,		//Valid values: ref_iqclk0 ref_iqclk1 ref_iqclk2 ref_iqclk3 ref_iqclk4 ref_iqclk5 ref_iqclk6 ref_iqclk7 ref_iqclk8 ref_iqclk9 ref_iqclk10 ref_iqclk11 iqtxrxclk0 iqtxrxclk1 iqtxrxclk2 iqtxrxclk3 iqtxrxclk4 iqtxrxclk5 coreclk fixed_clk lvpecl adj_pll_clk power_down 
	parameter	inclk4_logical_to_physical_mapping = "ref_iqclk0" ,		//Valid values: ref_iqclk0 ref_iqclk1 ref_iqclk2 ref_iqclk3 ref_iqclk4 ref_iqclk5 ref_iqclk6 ref_iqclk7 ref_iqclk8 ref_iqclk9 ref_iqclk10 ref_iqclk11 iqtxrxclk0 iqtxrxclk1 iqtxrxclk2 iqtxrxclk3 iqtxrxclk4 iqtxrxclk5 coreclk fixed_clk lvpecl adj_pll_clk power_down 
	parameter	powerdown_mode = "powerup" ,		//Valid values: powerup powerdown 
	parameter	refclk_select = "ref_iqclk0" ,		//Valid values: ref_iqclk0 ref_iqclk1 ref_iqclk2 ref_iqclk3 ref_iqclk4 ref_iqclk5 ref_iqclk6 ref_iqclk7 ref_iqclk8 ref_iqclk9 ref_iqclk10 ref_iqclk11 iqtxrxclk0 iqtxrxclk1 iqtxrxclk2 iqtxrxclk3 iqtxrxclk4 iqtxrxclk5 coreclk fixed_clk lvpecl adj_pll_clk power_down 
	parameter	silicon_rev = "20nm5es" ,		//Valid values: 20nm5es 20nm5es2 20nm4es 20nm4es2 20nm5 20nm4 20nm3 20nm2 20nm1 
	parameter	xmux_lc_scratch0_src = "scratch0_src_lvpecl" ,		//Valid values: scratch0_src_lvpecl scratch0_src_iqclk scratch0_src_coreclk 
	parameter	xmux_lc_scratch1_src = "scratch1_src_lvpecl" ,		//Valid values: scratch1_src_lvpecl scratch1_src_iqclk scratch1_src_coreclk 
	parameter	xmux_lc_scratch2_src = "scratch2_src_lvpecl" ,		//Valid values: scratch2_src_lvpecl scratch2_src_iqclk scratch2_src_coreclk 
	parameter	xmux_lc_scratch3_src = "scratch3_src_lvpecl" ,		//Valid values: scratch3_src_lvpecl scratch3_src_iqclk scratch3_src_coreclk 
	parameter	xmux_lc_scratch4_src = "scratch4_src_lvpecl" ,		//Valid values: scratch4_src_lvpecl scratch4_src_iqclk scratch4_src_coreclk 
	parameter	xmux_refclk_src = "src_lvpecl" ,		//Valid values: src_lvpecl src_iqclk src_coreclk 
	parameter	xpm_iqref_mux_iqclk_sel = "power_down" ,		//Valid values: ref_iqclk0 ref_iqclk1 ref_iqclk2 ref_iqclk3 ref_iqclk4 ref_iqclk5 ref_iqclk6 ref_iqclk7 ref_iqclk8 ref_iqclk9 ref_iqclk10 ref_iqclk11 iqtxrxclk0 iqtxrxclk1 iqtxrxclk2 iqtxrxclk3 iqtxrxclk4 iqtxrxclk5 power_down 
	parameter	xpm_iqref_mux_scratch0_src = "scratch0_power_down" ,		//Valid values: scratch0_ref_iqclk0 scratch0_ref_iqclk1 scratch0_ref_iqclk2 scratch0_ref_iqclk3 scratch0_ref_iqclk4 scratch0_ref_iqclk5 scratch0_ref_iqclk6 scratch0_ref_iqclk7 scratch0_ref_iqclk8 scratch0_ref_iqclk9 scratch0_ref_iqclk10 scratch0_ref_iqclk11 scratch0_iqtxrxclk0 scratch0_iqtxrxclk1 scratch0_iqtxrxclk2 scratch0_iqtxrxclk3 scratch0_iqtxrxclk4 scratch0_iqtxrxclk5 scratch0_power_down 
	parameter	xpm_iqref_mux_scratch1_src = "scratch1_power_down" ,		//Valid values: scratch1_ref_iqclk0 scratch1_ref_iqclk1 scratch1_ref_iqclk2 scratch1_ref_iqclk3 scratch1_ref_iqclk4 scratch1_ref_iqclk5 scratch1_ref_iqclk6 scratch1_ref_iqclk7 scratch1_ref_iqclk8 scratch1_ref_iqclk9 scratch1_ref_iqclk10 scratch1_ref_iqclk11 scratch1_iqtxrxclk0 scratch1_iqtxrxclk1 scratch1_iqtxrxclk2 scratch1_iqtxrxclk3 scratch1_iqtxrxclk4 scratch1_iqtxrxclk5 scratch1_power_down 
	parameter	xpm_iqref_mux_scratch2_src = "scratch2_power_down" ,		//Valid values: scratch2_ref_iqclk0 scratch2_ref_iqclk1 scratch2_ref_iqclk2 scratch2_ref_iqclk3 scratch2_ref_iqclk4 scratch2_ref_iqclk5 scratch2_ref_iqclk6 scratch2_ref_iqclk7 scratch2_ref_iqclk8 scratch2_ref_iqclk9 scratch2_ref_iqclk10 scratch2_ref_iqclk11 scratch2_iqtxrxclk0 scratch2_iqtxrxclk1 scratch2_iqtxrxclk2 scratch2_iqtxrxclk3 scratch2_iqtxrxclk4 scratch2_iqtxrxclk5 scratch2_power_down 
	parameter	xpm_iqref_mux_scratch3_src = "scratch3_power_down" ,		//Valid values: scratch3_ref_iqclk0 scratch3_ref_iqclk1 scratch3_ref_iqclk2 scratch3_ref_iqclk3 scratch3_ref_iqclk4 scratch3_ref_iqclk5 scratch3_ref_iqclk6 scratch3_ref_iqclk7 scratch3_ref_iqclk8 scratch3_ref_iqclk9 scratch3_ref_iqclk10 scratch3_ref_iqclk11 scratch3_iqtxrxclk0 scratch3_iqtxrxclk1 scratch3_iqtxrxclk2 scratch3_iqtxrxclk3 scratch3_iqtxrxclk4 scratch3_iqtxrxclk5 scratch3_power_down 
	parameter	xpm_iqref_mux_scratch4_src = "scratch4_power_down"		//Valid values: scratch4_ref_iqclk0 scratch4_ref_iqclk1 scratch4_ref_iqclk2 scratch4_ref_iqclk3 scratch4_ref_iqclk4 scratch4_ref_iqclk5 scratch4_ref_iqclk6 scratch4_ref_iqclk7 scratch4_ref_iqclk8 scratch4_ref_iqclk9 scratch4_ref_iqclk10 scratch4_ref_iqclk11 scratch4_iqtxrxclk0 scratch4_iqtxrxclk1 scratch4_iqtxrxclk2 scratch4_iqtxrxclk3 scratch4_iqtxrxclk4 scratch4_iqtxrxclk5 scratch4_power_down 
)

(
	//Port declaration

	input	[8:0]  avmmaddress ,
	input	avmmclk ,
	input	avmmread ,
	input	avmmrstn ,
	input	avmmwrite ,
	input	[7:0]  avmmwritedata ,
	input	core_refclk ,
	input	cr_pdb ,
	input	[5:0]  iqtxrxclk ,
	input	lvpecl_in ,
	input	[11:0]  ref_iqclk ,

	output	[7:0]  avmmreaddata ,
	output	blockselect ,
	output	refclk 

);


	twentynm_hssi_pma_lc_refclk_select_mux_encrypted
	#(
		.enable_debug_info(enable_debug_info) ,

		.inclk0_logical_to_physical_mapping(inclk0_logical_to_physical_mapping) ,
		.inclk1_logical_to_physical_mapping(inclk1_logical_to_physical_mapping) ,
		.inclk2_logical_to_physical_mapping(inclk2_logical_to_physical_mapping) ,
		.inclk3_logical_to_physical_mapping(inclk3_logical_to_physical_mapping) ,
		.inclk4_logical_to_physical_mapping(inclk4_logical_to_physical_mapping) ,
		.powerdown_mode(powerdown_mode) ,
		.refclk_select(refclk_select) ,
		.silicon_rev(silicon_rev) ,
		.xmux_lc_scratch0_src(xmux_lc_scratch0_src) ,
		.xmux_lc_scratch1_src(xmux_lc_scratch1_src) ,
		.xmux_lc_scratch2_src(xmux_lc_scratch2_src) ,
		.xmux_lc_scratch3_src(xmux_lc_scratch3_src) ,
		.xmux_lc_scratch4_src(xmux_lc_scratch4_src) ,
		.xmux_refclk_src(xmux_refclk_src) ,
		.xpm_iqref_mux_iqclk_sel(xpm_iqref_mux_iqclk_sel) ,
		.xpm_iqref_mux_scratch0_src(xpm_iqref_mux_scratch0_src) ,
		.xpm_iqref_mux_scratch1_src(xpm_iqref_mux_scratch1_src) ,
		.xpm_iqref_mux_scratch2_src(xpm_iqref_mux_scratch2_src) ,
		.xpm_iqref_mux_scratch3_src(xpm_iqref_mux_scratch3_src) ,
		.xpm_iqref_mux_scratch4_src(xpm_iqref_mux_scratch4_src)

	)
	twentynm_hssi_pma_lc_refclk_select_mux_encrypted_inst (

		.avmmaddress(avmmaddress),
		.avmmclk(avmmclk),
		.avmmread(avmmread),
		.avmmrstn(avmmrstn),
		.avmmwrite(avmmwrite),
		.avmmwritedata(avmmwritedata),
		.core_refclk(core_refclk),
		.cr_pdb(cr_pdb),
		.iqtxrxclk(iqtxrxclk),
		.lvpecl_in(lvpecl_in),
		.ref_iqclk(ref_iqclk),
		.avmmreaddata(avmmreaddata),
		.blockselect(blockselect),
		.refclk(refclk)

	);

endmodule
// -----------------------------------------------------------
// This is auto-generated HSSI Simulation Atom Model Encryption Wrapper
// Module Name : work/twentynm_hssi_pma_rx_buf_wrapper.v
// -----------------------------------------------------------

`timescale 1 ps/1 ps

module twentynm_hssi_pma_rx_buf
#(
	// Parameter declaration and default value assignment

	parameter enable_debug_info = "true",	//Valid values: false|true; this is simulation-only parameter, for debug purpose only

	parameter	act_isource_disable = "isrc_en" ,		//Valid values: isrc_en isrc_dis 
	parameter	bodybias_enable = "bodybias_en" ,		//Valid values: bodybias_en bodybias_dis 
	parameter	bodybias_select = "bodybias_sel1" ,		//Valid values: bodybias_sel1 bodybias_sel2 
	parameter	bypass_eqz_stages_234 = "bypass_off" ,		//Valid values: bypass_off byypass_stages_234 
	parameter	cdrclk_to_cgb = "cdrclk_2cgb_dis" ,		//Valid values: cdrclk_2cgb_dis cdrclk_2cgb_en 
	parameter	cgm_bias_disable = "cgmbias_en" ,		//Valid values: cgmbias_en cgmbias_dis 
	parameter	datarate = "0 bps" ,		//Valid values:  
	parameter	diag_lp_en = "dlp_off" ,		//Valid values: dlp_off dlp_on 
	parameter	eq_bw_sel = "eq_bw_1" ,		//Valid values: eq_bw_1 eq_bw_2 eq_bw_3 eq_bw_4 
	parameter	eq_dc_gain_trim = "no_dc_gain" ,		//Valid values: no_dc_gain stg1_gain1 stg1_gain2 stg1_gain3 stg1_gain4 stg1_gain5 stg1_gain6 stg1_gain7 stg2_gain1 stg2_gain2 stg2_gain3 stg2_gain4 stg2_gain5 stg2_gain6 stg2_gain7 stg3_gain1 stg3_gain2 stg3_gain3 stg3_gain4 stg3_gain5 stg3_gain6 stg3_gain7 stg4_gain1 stg4_gain2 stg4_gain3 stg4_gain4 stg4_gain5 stg4_gain6 stg4_gain7 
	parameter	initial_settings = "false" ,		//Valid values: false true 
	parameter	input_vcm_sel = "high_vcm" ,		//Valid values: high_vcm low_vcm 
	parameter	iostandard = "hssi_diffio" ,		//Valid values: hssi_diffio cml lvpecl lvds 
	parameter	lfeq_enable = "non_lfeq_mode" ,		//Valid values: non_lfeq_mode lfeq_mode 
	parameter	lfeq_zero_control = "lfeq_setting_2" ,		//Valid values: lfeq_setting_0 lfeq_setting_1 lfeq_setting_2 lfeq_setting_3 
	parameter	link = "sr" ,		//Valid values: sr mr lr 
	parameter	link_rx = "sr" ,		//Valid values: lr mr sr 
	parameter	loopback_modes = "lpbk_disable" ,		//Valid values: lpbk_disable pre_cdr post_cdr 
	parameter	offset_cal_pd = "eqz1_en" ,		//Valid values: eqz1_pd eqz1_en 
	parameter	offset_cancellation_coarse = "coarse_setting_00" ,		//Valid values: coarse_setting_00 coarse_setting_01 coarse_setting_02 coarse_setting_03 coarse_setting_04 coarse_setting_05 coarse_setting_06 coarse_setting_07 coarse_setting_08 coarse_setting_09 coarse_setting_10 coarse_setting_11 coarse_setting_12 coarse_setting_13 coarse_setting_14 coarse_setting_15 
	parameter	offset_cancellation_ctrl = "volt_0mv" ,		//Valid values: volt_0mv minus_delta1 minus_delta2 minus_delta3 minus_delta4 minus_delta5 minus_delta6 minus_delta7 minus_delta8 minus_delta9 minus_delta10 minus_delta11 minus_delta12 minus_delta13 minus_delta14 minus_delta15 plus_delta1 plus_delta2 plus_delta3 plus_delta4 plus_delta5 plus_delta6 plus_delta7 plus_delta8 plus_delta9 plus_delta10 plus_delta11 plus_delta12 plus_delta13 plus_delta14 plus_delta15 
	parameter	offset_cancellation_fine = "fine_setting_00" ,		//Valid values: fine_setting_00 fine_setting_01 fine_setting_02 fine_setting_03 fine_setting_04 fine_setting_05 fine_setting_06 fine_setting_07 
	parameter	offset_pd = "oc_en" ,		//Valid values: oc_pd oc_en 
	parameter	one_stage_enable = "non_s1_mode" ,		//Valid values: non_s1_mode s1_mode 
	parameter	optimal = "true" ,		//Valid values: false true 
	parameter	pdb_rx = "power_down_rx" ,		//Valid values: normal_rx_on power_down_rx 
	parameter	pm_speed_grade = "e2" ,		//Valid values: e1 i1 e2 i2 e3 i3 m3 e4 i4 m4 e5 i5 
	parameter	pm_tx_rx_cvp_mode = "cvp_off" ,		//Valid values: cvp_off cvp_on 
	parameter	pm_tx_rx_pcie_gen = "non_pcie" ,		//Valid values: pcie_gen1_100mhzref pcie_gen2_100mhzref pcie_gen3_100mhzref pcie_gen1_125mhzref pcie_gen2_125mhzref pcie_gen3_125mhzref non_pcie 
	parameter	pm_tx_rx_pcie_gen_bitwidth = "pcie_gen3_32b" ,		//Valid values: pcie_gen3_32b pcie_gen3_16b 
	parameter	pm_tx_rx_testmux_select = "setting0" ,		//Valid values: setting0 setting1 setting2 setting3 setting4 setting5 setting6 setting7 setting8 setting9 setting10 setting11 setting12 setting13 setting14 setting15 
	parameter	power_mode = "low_power" ,		//Valid values: low_power mid_power high_perf 
	parameter	power_mode_rx = "low_power" ,		//Valid values: low_power mid_power high_perf 
	parameter	power_rail_eht = 0 ,		//Valid values: 0..4095 
	parameter	power_rail_er = 0 ,		//Valid values: 0..4095 
	parameter	prot_mode = "basic_rx" ,		//Valid values: basic_rx pcie_gen1_rx pcie_gen2_rx pcie_gen3_rx pcie_gen4_rx qpi_rx unused gpon_rx sata_rx 
	parameter	qpi_enable = "non_qpi_mode" ,		//Valid values: non_qpi_mode qpi_mode 
	parameter	refclk_en = "enable" ,		//Valid values: disable enable 
	parameter	rx_atb_select = "atb_disable" ,		//Valid values: atb_disable 
	parameter	rx_refclk_divider = "bypass_divider" ,		//Valid values: bypass_divider divide_by_2 
	parameter	rx_sel_bias_source = "bias_vcmdrv" ,		//Valid values: bias_vcmdrv bias_int 
	parameter	rx_vga_oc_en = "vga_cal_off" ,		//Valid values: vga_cal_off vga_cal_on 
	parameter	silicon_rev = "20nm5es" ,		//Valid values: 20nm5es 20nm5es2 20nm4es 20nm4es2 20nm5 20nm4 20nm3 20nm2 20nm1 
	parameter	sup_mode = "user_mode" ,		//Valid values: user_mode engineering_mode 
	parameter	term_sel = "r_r1" ,		//Valid values: r_ext0 r_r1 r_r2 r_ext1 
	parameter	term_tri_enable = "disable_tri" ,		//Valid values: disable_tri enable_tri 
	parameter	vccela_supply_voltage = "vccela_1p1v" ,		//Valid values: vccela_1p1v vccela_0p9v 
	parameter	vcm_current_add = "vcm_current_default" ,		//Valid values: vcm_current_default vcm_current_1 vcm_current_2 vcm_current_3 
	parameter	vcm_sel = "vcm_setting_10" ,		//Valid values: vcm_setting_00 vcm_setting_01 vcm_setting_02 vcm_setting_03 vcm_setting_04 vcm_setting_05 vcm_setting_06 vcm_setting_07 vcm_setting_08 vcm_setting_09 vcm_setting_10 vcm_setting_11 vcm_setting_12 vcm_setting_13 vcm_setting_14 vcm_setting_15 
	parameter	vga_bandwidth_select = "vga_bw_1" ,		//Valid values: vga_bw_1 vga_bw_2 vga_bw_3 vga_bw_4 
	parameter	xrx_path_analog_mode = "user_custom" ,		//Valid values: user_custom 
	parameter	xrx_path_datarate = "0 bps" ,		//Valid values:  
	parameter	xrx_path_datawidth = 8'b00000000 ,		//Valid values: 8 
	parameter	xrx_path_gt_enabled = "disable" ,		//Valid values: disable enable 
	parameter	xrx_path_initial_settings = "false" ,		//Valid values: false true 
	parameter	xrx_path_jtag_hys = "hys_increase_disable" ,		//Valid values: hys_increase_enable hys_increase_disable 
	parameter	xrx_path_jtag_lp = "lp_off" ,		//Valid values: lp_off lp_on 
	parameter	xrx_path_optimal = "true" ,		//Valid values: false true 
	parameter	xrx_path_pma_rx_divclk_hz = 32'b00000000000000000000000000000000 ,		//Valid values: 
	parameter	xrx_path_prot_mode = "unused" ,		//Valid values: basic_rx pcie_gen1_rx pcie_gen2_rx pcie_gen3_rx pcie_gen4_rx qpi_rx unused gpon_rx sata_rx 
	parameter	xrx_path_sup_mode = "user_mode" ,		//Valid values: user_mode engineering_mode 
	parameter	xrx_path_uc_cal_enable = "rx_cal_off" ,		//Valid values: rx_cal_off rx_cal_on 
	parameter	xrx_path_uc_cru_rstb = "cdr_lf_reset_off" ,		//Valid values: cdr_lf_reset_off cdr_lf_reset_on 
	parameter	xrx_path_uc_pcie_sw = "uc_pcie_gen1" ,		//Valid values: uc_pcie_gen1 uc_pcie_gen2 uc_pcie_gen3 not_allowed 
	parameter	xrx_path_uc_rx_rstb = "rx_reset_on"		//Valid values: rx_reset_on rx_reset_off 
)

(
	//Port declaration

	input	[8:0]  avmmaddress ,
	input	avmmclk ,
	input	avmmread ,
	input	avmmrstn ,
	input	avmmwrite ,
	input	[7:0]  avmmwritedata ,
	input	clk_divrx ,
	input	lpbkn ,
	input	lpbkp ,
	input	rx_qpi_pulldn ,
	input	rx_rstn ,
	input	[5:0]  rx_sel_b50 ,
	input	rxn ,
	input	rxp ,
	input	s_lpbk_b ,
	input	[27:0]  vcz ,
	input	[14:0]  vds_eqz_s1_set ,
	input	[1:0]  vds_lfeqz_czero ,
	input	[6:0]  vds_lfeqz_fb_set ,
	input	[6:0]  vds_vga_set ,
	input	vga_cm_bidir_in ,

	output	[7:0]  avmmreaddata ,
	output	blockselect ,
	output	inn ,
	output	inp ,
	output	outn ,
	output	outp ,
	output	pull_dn ,
	output	rdlpbkn ,
	output	rdlpbkp ,
	output	rx_refclk ,
	output	vga_cm_bidir_out 

);

// Function to convert a 64bit binary to a string.
function [128*8-1 : 0] m_bin_to_str;
	input [128 : 1]   s;
	reg   [128 : 1]   reg_s;
	reg   [7 : 0]    tmp;
	reg   [128*8 : 1] res;
	integer m, index;

	begin
		reg_s = s;
		res = 128'h00000000000000000000000000000000;

		for (m = 128; m > 0; m = m-1 )
		begin
			tmp = reg_s[128];
			res[(((m-1)*8)+1)] = tmp & 1'b1;
			reg_s = reg_s << 1;
		end

		m_bin_to_str = res;
	end
endfunction

localparam [8*128-1 : 0] xrx_path_pma_rx_divclk_hz_string	= m_bin_to_str(xrx_path_pma_rx_divclk_hz);


	twentynm_hssi_pma_rx_buf_encrypted
	#(
		.enable_debug_info(enable_debug_info) ,

		.act_isource_disable(act_isource_disable) ,
		.bodybias_enable(bodybias_enable) ,
		.bodybias_select(bodybias_select) ,
		.bypass_eqz_stages_234(bypass_eqz_stages_234) ,
		.cdrclk_to_cgb(cdrclk_to_cgb) ,
		.cgm_bias_disable(cgm_bias_disable) ,
		.datarate(datarate) ,
		.diag_lp_en(diag_lp_en) ,
		.eq_bw_sel(eq_bw_sel) ,
		.eq_dc_gain_trim(eq_dc_gain_trim) ,
		.initial_settings(initial_settings) ,
		.input_vcm_sel(input_vcm_sel) ,
		.iostandard(iostandard) ,
		.lfeq_enable(lfeq_enable) ,
		.lfeq_zero_control(lfeq_zero_control) ,
		.link(link) ,
		.link_rx(link_rx) ,
		.loopback_modes(loopback_modes) ,
		.offset_cal_pd(offset_cal_pd) ,
		.offset_cancellation_coarse(offset_cancellation_coarse) ,
		.offset_cancellation_ctrl(offset_cancellation_ctrl) ,
		.offset_cancellation_fine(offset_cancellation_fine) ,
		.offset_pd(offset_pd) ,
		.one_stage_enable(one_stage_enable) ,
		.optimal(optimal) ,
		.pdb_rx(pdb_rx) ,
		.pm_speed_grade(pm_speed_grade) ,
		.pm_tx_rx_cvp_mode(pm_tx_rx_cvp_mode) ,
		.pm_tx_rx_pcie_gen(pm_tx_rx_pcie_gen) ,
		.pm_tx_rx_pcie_gen_bitwidth(pm_tx_rx_pcie_gen_bitwidth) ,
		.pm_tx_rx_testmux_select(pm_tx_rx_testmux_select) ,
		.power_mode(power_mode) ,
		.power_mode_rx(power_mode_rx) ,
		.power_rail_eht(power_rail_eht) ,
		.power_rail_er(power_rail_er) ,
		.prot_mode(prot_mode) ,
		.qpi_enable(qpi_enable) ,
		.refclk_en(refclk_en) ,
		.rx_atb_select(rx_atb_select) ,
		.rx_refclk_divider(rx_refclk_divider) ,
		.rx_sel_bias_source(rx_sel_bias_source) ,
		.rx_vga_oc_en(rx_vga_oc_en) ,
		.silicon_rev(silicon_rev) ,
		.sup_mode(sup_mode) ,
		.term_sel(term_sel) ,
		.term_tri_enable(term_tri_enable) ,
		.vccela_supply_voltage(vccela_supply_voltage) ,
		.vcm_current_add(vcm_current_add) ,
		.vcm_sel(vcm_sel) ,
		.vga_bandwidth_select(vga_bandwidth_select) ,
		.xrx_path_analog_mode(xrx_path_analog_mode) ,
		.xrx_path_datarate(xrx_path_datarate) ,
		.xrx_path_datawidth(xrx_path_datawidth) ,
		.xrx_path_gt_enabled(xrx_path_gt_enabled) ,
		.xrx_path_initial_settings(xrx_path_initial_settings) ,
		.xrx_path_jtag_hys(xrx_path_jtag_hys) ,
		.xrx_path_jtag_lp(xrx_path_jtag_lp) ,
		.xrx_path_optimal(xrx_path_optimal) ,
		.xrx_path_pma_rx_divclk_hz(xrx_path_pma_rx_divclk_hz_string) ,
		.xrx_path_prot_mode(xrx_path_prot_mode) ,
		.xrx_path_sup_mode(xrx_path_sup_mode) ,
		.xrx_path_uc_cal_enable(xrx_path_uc_cal_enable) ,
		.xrx_path_uc_cru_rstb(xrx_path_uc_cru_rstb) ,
		.xrx_path_uc_pcie_sw(xrx_path_uc_pcie_sw) ,
		.xrx_path_uc_rx_rstb(xrx_path_uc_rx_rstb)

	)
	twentynm_hssi_pma_rx_buf_encrypted_inst (

		.avmmaddress(avmmaddress),
		.avmmclk(avmmclk),
		.avmmread(avmmread),
		.avmmrstn(avmmrstn),
		.avmmwrite(avmmwrite),
		.avmmwritedata(avmmwritedata),
		.clk_divrx(clk_divrx),
		.lpbkn(lpbkn),
		.lpbkp(lpbkp),
		.rx_qpi_pulldn(rx_qpi_pulldn),
		.rx_rstn(rx_rstn),
		.rx_sel_b50(rx_sel_b50),
		.rxn(rxn),
		.rxp(rxp),
		.s_lpbk_b(s_lpbk_b),
		.vcz(vcz),
		.vds_eqz_s1_set(vds_eqz_s1_set),
		.vds_lfeqz_czero(vds_lfeqz_czero),
		.vds_lfeqz_fb_set(vds_lfeqz_fb_set),
		.vds_vga_set(vds_vga_set),
		.vga_cm_bidir_in(vga_cm_bidir_in),
		.avmmreaddata(avmmreaddata),
		.blockselect(blockselect),
		.inn(inn),
		.inp(inp),
		.outn(outn),
		.outp(outp),
		.pull_dn(pull_dn),
		.rdlpbkn(rdlpbkn),
		.rdlpbkp(rdlpbkp),
		.rx_refclk(rx_refclk),
		.vga_cm_bidir_out(vga_cm_bidir_out)

	);

endmodule
// -----------------------------------------------------------
// This is auto-generated HSSI Simulation Atom Model Encryption Wrapper
// Module Name : work/twentynm_hssi_pma_rx_deser_wrapper.v
// -----------------------------------------------------------

`timescale 1 ps/1 ps

module twentynm_hssi_pma_rx_deser
#(
	// Parameter declaration and default value assignment

	parameter enable_debug_info = "true",	//Valid values: false|true; this is simulation-only parameter, for debug purpose only

	parameter	bitslip_bypass = "bs_bypass_no" ,		//Valid values: bs_bypass_no bs_bypass_yes 
	parameter	clkdiv_source = "vco_bypass_normal" ,		//Valid values: vco_bypass_normal clklow_to_clkdivrx fref_to_clkdivrx 
	parameter	clkdivrx_user_mode = "clkdivrx_user_disabled" ,		//Valid values: clkdivrx_user_disabled clkdivrx_user_clkdiv clkdivrx_user_clkdiv_div2 clkdivrx_user_div40 clkdivrx_user_div33 clkdivrx_user_div66 
	parameter	datarate = "0 bps" ,		//Valid values:  
	parameter	deser_factor = 8 ,		//Valid values: 8 10 16 20 32 40 64 
	parameter	deser_powerdown = "deser_power_up" ,		//Valid values: deser_power_up deser_power_down 
	parameter	force_adaptation_outputs = "normal_outputs" ,		//Valid values: normal_outputs forced_all_zeros forced_all_ones forced_1010 forced_0101 
	parameter	force_clkdiv_for_testing = "normal_clkdiv" ,		//Valid values: normal_clkdiv forced_0 forced_1 
	parameter	optimal = "true" ,		//Valid values: false true 
	parameter	pcie_gen = "non_pcie" ,		//Valid values: pcie_gen1_100mhzref pcie_gen2_100mhzref pcie_gen3_100mhzref pcie_gen1_125mhzref pcie_gen2_125mhzref pcie_gen3_125mhzref non_pcie 
	parameter	pcie_gen_bitwidth = "pcie_gen3_32b" ,		//Valid values: pcie_gen3_32b pcie_gen3_16b 
	parameter	prot_mode = "basic_rx" ,		//Valid values: basic_rx pcie_gen1_rx pcie_gen2_rx pcie_gen3_rx pcie_gen4_rx qpi_rx unused gpon_rx sata_rx 
	parameter	rst_n_adapt_odi = "no_rst_adapt_odi" ,		//Valid values: yes_rst_adapt_odi no_rst_adapt_odi 
	parameter	sdclk_enable = "false" ,		//Valid values: false true 
	parameter	silicon_rev = "20nm5es" ,		//Valid values: 20nm5es 20nm5es2 20nm4es 20nm4es2 20nm5 20nm4 20nm3 20nm2 20nm1 
	parameter	sup_mode = "user_mode" ,		//Valid values: user_mode engineering_mode 
	parameter	tdr_mode = "select_bbpd_data"		//Valid values: select_bbpd_data select_odi_data 
)

(
	//Port declaration

	input	[8:0]  avmmaddress ,
	input	avmmclk ,
	input	avmmread ,
	input	avmmrstn ,
	input	avmmwrite ,
	input	[7:0]  avmmwritedata ,
	input	adapt_en ,
	input	bitslip ,
	input	clk0 ,
	input	clk0_odi ,
	input	clk180 ,
	input	clk180_odi ,
	input	clk270 ,
	input	clk90 ,
	input	clklow ,
	input	deven ,
	input	deven_odi ,
	input	devenb ,
	input	devenb_odi ,
	input	dodd ,
	input	dodd_odi ,
	input	doddb ,
	input	doddb_odi ,
	input	error_even ,
	input	error_evenb ,
	input	error_odd ,
	input	error_oddb ,
	input	fref ,
	input	odi_en ,
	input	[1:0]  pcie_sw ,
	input	pfdmode_lock ,
	input	rst_n ,
	input	tdr_en ,

	output	[7:0]  avmmreaddata ,
	output	blockselect ,
	output	adapt_clk ,
	output	clkdiv ,
	output	clkdiv_user ,
	output	clkdivrx_rx ,
	output	[63:0]  data ,
	output	[63:0]  dout ,
	output	[63:0]  error_deser ,
	output	odi_clkout ,
	output	[63:0]  odi_dout ,
	output	[1:0]  pcie_sw_ret ,
	output	[7:0]  tstmx_deser 

);


	twentynm_hssi_pma_rx_deser_encrypted
	#(
		.enable_debug_info(enable_debug_info) ,

		.bitslip_bypass(bitslip_bypass) ,
		.clkdiv_source(clkdiv_source) ,
		.clkdivrx_user_mode(clkdivrx_user_mode) ,
		.datarate(datarate) ,
		.deser_factor(deser_factor) ,
		.deser_powerdown(deser_powerdown) ,
		.force_adaptation_outputs(force_adaptation_outputs) ,
		.force_clkdiv_for_testing(force_clkdiv_for_testing) ,
		.optimal(optimal) ,
		.pcie_gen(pcie_gen) ,
		.pcie_gen_bitwidth(pcie_gen_bitwidth) ,
		.prot_mode(prot_mode) ,
		.rst_n_adapt_odi(rst_n_adapt_odi) ,
		.sdclk_enable(sdclk_enable) ,
		.silicon_rev(silicon_rev) ,
		.sup_mode(sup_mode) ,
		.tdr_mode(tdr_mode)

	)
	twentynm_hssi_pma_rx_deser_encrypted_inst (

		.avmmaddress(avmmaddress),
		.avmmclk(avmmclk),
		.avmmread(avmmread),
		.avmmrstn(avmmrstn),
		.avmmwrite(avmmwrite),
		.avmmwritedata(avmmwritedata),
		.adapt_en(adapt_en),
		.bitslip(bitslip),
		.clk0((silicon_rev == "20nm5es") ? clk90 : clk0),
		.clk0_odi(clk0_odi),
		.clk180((silicon_rev == "20nm5es") ? clk270 : clk180),
		.clk180_odi(clk180_odi),
		.clklow(clklow),
		.deven(deven),
		.deven_odi(deven_odi),
		.devenb(devenb),
		.devenb_odi(devenb_odi),
		.dodd(dodd),
		.dodd_odi(dodd_odi),
		.doddb(doddb),
		.doddb_odi(doddb_odi),
		.error_even(error_even),
		.error_evenb(error_evenb),
		.error_odd(error_odd),
		.error_oddb(error_oddb),
		.fref(fref),
		.odi_en(odi_en),
		.pcie_sw(pcie_sw),
		.pfdmode_lock(pfdmode_lock),
		.rst_n(rst_n),
		.avmmreaddata(avmmreaddata),
		.blockselect(blockselect),
		.adapt_clk(adapt_clk),
		.clkdiv(clkdiv),
		.clkdiv_user(clkdiv_user),
		.clkdivrx_rx(clkdivrx_rx),
		.data(data),
		.dout(dout),
		.error_deser(error_deser),
		.odi_dout(odi_dout),
		.pcie_sw_ret(pcie_sw_ret),
		.tstmx_deser(tstmx_deser)

	);

endmodule
// -----------------------------------------------------------
// This is auto-generated HSSI Simulation Atom Model Encryption Wrapper
// Module Name : work/twentynm_hssi_pma_rx_dfe_wrapper.v
// -----------------------------------------------------------

`timescale 1 ps/1 ps

module twentynm_hssi_pma_rx_dfe
#(
	// Parameter declaration and default value assignment

	parameter enable_debug_info = "true",	//Valid values: false|true; this is simulation-only parameter, for debug purpose only

	parameter	atb_select = "atb_disable" ,		//Valid values: atb_disable atb_sel0 atb_sel1 atb_sel10 atb_sel11 atb_sel12 atb_sel13 atb_sel14 atb_sel15 atb_sel16 atb_sel17 atb_sel18 atb_sel19 atb_sel2 atb_sel20 atb_sel21 atb_sel22 atb_sel23 atb_sel24 atb_sel25 atb_sel26 atb_sel27 atb_sel28 atb_sel29 atb_sel3 atb_sel30 atb_sel4 atb_sel5 atb_sel6 atb_sel7 atb_sel8 atb_sel9 
	parameter	datarate = "0 bps" ,		//Valid values:  
	parameter	dft_en = "dft_disable" ,		//Valid values: dft_disable dft_enalbe 
	parameter	initial_settings = "true" ,		//Valid values: false true 
	parameter	oc_sa_adp1 = 8'b00000000 ,		//Valid values: 8 
	parameter	oc_sa_adp2 = 8'b00000000 ,		//Valid values: 8 
	parameter	oc_sa_c270 = 8'b00000000 ,		//Valid values: 8 
	parameter	oc_sa_c90 = 8'b00000000 ,		//Valid values: 8 
	parameter	oc_sa_d0c0 = 8'b00000000 ,		//Valid values: 8 
	parameter	oc_sa_d0c180 = 8'b00000000 ,		//Valid values: 8 
	parameter	oc_sa_d1c0 = 8'b00000000 ,		//Valid values: 8 
	parameter	oc_sa_d1c180 = 8'b00000000 ,		//Valid values: 8 
	parameter	optimal = "true" ,		//Valid values: false true 
	parameter	pdb = "dfe_enable" ,		//Valid values: dfe_powerdown dfe_reset dfe_enable 
	parameter	pdb_fixedtap = "fixtap_dfe_powerdown" ,		//Valid values: fixtap_dfe_powerdown fixtap_dfe_enable 
	parameter	pdb_floattap = "floattap_dfe_powerdown" ,		//Valid values: floattap_dfe_powerdown floattap_dfe_enable 
	parameter	pdb_fxtap4t7 = "fxtap4t7_powerdown" ,		//Valid values: fxtap4t7_powerdown fxtap4t7_enable 
	parameter	power_mode = "low_power" ,		//Valid values: low_power mid_power high_perf 
	parameter	prot_mode = "basic_rx" ,		//Valid values: basic_rx pcie_gen1_rx pcie_gen2_rx pcie_gen3_rx pcie_gen4_rx qpi_rx unused gpon_rx sata_rx 
	parameter	sel_fltapstep_dec = "fltap_step_no_dec" ,		//Valid values: fltap_step_no_dec fltap_step_dec 
	parameter	sel_fltapstep_inc = "fltap_step_no_inc" ,		//Valid values: fltap_step_no_inc fltap_step_inc 
	parameter	sel_fxtapstep_dec = "fxtap_step_no_dec" ,		//Valid values: fxtap_step_no_dec fxtap23_step_dec fxtap45_step_dec fxtap2345_step_dec fxtap67_step_dec fxtap2367_step_dec fxtap4567_step_dec fxtap234567_step_dec 
	parameter	sel_fxtapstep_inc = "fxtap_step_no_inc" ,		//Valid values: fxtap_step_no_inc fxtap23_step_inc fxtap45_step_inc fxtap2345_step_inc fxtap67_step_inc fxtap2367_step_inc fxtap4567_step_inc fxtap234567_step_inc 
	parameter	sel_oc_en = "off_canc_disable" ,		//Valid values: off_canc_disable off_canc_enable 
	parameter	sel_probe_tstmx = "probe_tstmx_none" ,		//Valid values: probe_tstmx_none probe_fxtap1_coeff probe_fxtap2_coeff probe_fxtap3_coeff probe_fxtap4_coeff probe_fxtap5_coeff probe_fxtap6_coeff probe_fxtap7_coeff probe_fxtap8_coeff probe_fxtap9_coeff probe_fxtap10_coeff probe_fltap1_coeff probe_fltap2_coeff probe_fltap3_coeff probe_fltap4_coeff probe_none 
	parameter	silicon_rev = "20nm5es" ,		//Valid values: 20nm5es 20nm5es2 20nm4es 20nm4es2 20nm5 20nm4 20nm3 20nm2 20nm1 
	parameter	sup_mode = "user_mode" ,		//Valid values: user_mode engineering_mode 
	parameter	uc_rx_dfe_cal = "uc_rx_dfe_cal_off" ,		//Valid values: uc_rx_dfe_cal_off uc_rx_dfe_cal_on 
	parameter	uc_rx_dfe_cal_status = "uc_rx_dfe_cal_notdone"		//Valid values: uc_rx_dfe_cal_notdone uc_rx_dfe_cal_done 
)

(
	//Port declaration

	input	[8:0]  avmmaddress ,
	input	avmmclk ,
	input	avmmread ,
	input	avmmrstn ,
	input	avmmwrite ,
	input	[7:0]  avmmwritedata ,
	input	adapt_en ,
	input	adp_clk ,
	input	clk0 ,
	input	clk180 ,
	input	clk270 ,
	input	clk90 ,
	input	[5:0]  dfe_fltap1_coeff ,
	input	dfe_fltap1_sgn ,
	input	[5:0]  dfe_fltap2_coeff ,
	input	dfe_fltap2_sgn ,
	input	[5:0]  dfe_fltap3_coeff ,
	input	dfe_fltap3_sgn ,
	input	[5:0]  dfe_fltap4_coeff ,
	input	dfe_fltap4_sgn ,
	input	dfe_fltap_bypdeser ,
	input	[5:0]  dfe_fltap_position ,
	input	[6:0]  dfe_fxtap1_coeff ,
	input	[6:0]  dfe_fxtap2_coeff ,
	input	dfe_fxtap2_sgn ,
	input	[6:0]  dfe_fxtap3_coeff ,
	input	dfe_fxtap3_sgn ,
	input	[5:0]  dfe_fxtap4_coeff ,
	input	dfe_fxtap4_sgn ,
	input	[5:0]  dfe_fxtap5_coeff ,
	input	dfe_fxtap5_sgn ,
	input	[4:0]  dfe_fxtap6_coeff ,
	input	dfe_fxtap6_sgn ,
	input	[4:0]  dfe_fxtap7_coeff ,
	input	dfe_fxtap7_sgn ,
	input	dfe_rstn ,
	input	dfe_spec_disable ,
	input	dfe_spec_sgn_sel ,
	input	dfe_vref_sgn_sel ,
	input	rxn ,
	input	rxp ,
	input	vga_vcm ,
	input	[4:0]  vref_level_coeff ,

	output	[7:0]  avmmreaddata ,
	output	blockselect ,
	output	clk0_bbpd ,
	output	clk180_bbpd ,
	output	clk270_bbpd ,
	output	clk90_bbpd ,
	output	deven ,
	output	devenb ,
	output	[7:0]  dfe_oc_tstmx ,
	output	dodd ,
	output	doddb ,
	output	edge270 ,
	output	edge270b ,
	output	edge90 ,
	output	edge90b ,
	output	err_ev ,
	output	err_evb ,
	output	err_od ,
	output	err_odb ,
	output	spec_vrefh ,
	output	spec_vrefl 

);


	twentynm_hssi_pma_rx_dfe_encrypted
	#(
		.enable_debug_info(enable_debug_info) ,

		.atb_select(atb_select) ,
		.datarate(datarate) ,
		.dft_en(dft_en) ,
		.initial_settings(initial_settings) ,
		.oc_sa_adp1(oc_sa_adp1) ,
		.oc_sa_adp2(oc_sa_adp2) ,
		.oc_sa_c270(oc_sa_c270) ,
		.oc_sa_c90(oc_sa_c90) ,
		.oc_sa_d0c0(oc_sa_d0c0) ,
		.oc_sa_d0c180(oc_sa_d0c180) ,
		.oc_sa_d1c0(oc_sa_d1c0) ,
		.oc_sa_d1c180(oc_sa_d1c180) ,
		.optimal(optimal) ,
		.pdb(pdb) ,
		.pdb_fixedtap(pdb_fixedtap) ,
		.pdb_floattap(pdb_floattap) ,
		.pdb_fxtap4t7(pdb_fxtap4t7) ,
		.power_mode(power_mode) ,
		.prot_mode(prot_mode) ,
		.sel_fltapstep_dec(sel_fltapstep_dec) ,
		.sel_fltapstep_inc(sel_fltapstep_inc) ,
		.sel_fxtapstep_dec(sel_fxtapstep_dec) ,
		.sel_fxtapstep_inc(sel_fxtapstep_inc) ,
		.sel_oc_en(sel_oc_en) ,
		.sel_probe_tstmx(sel_probe_tstmx) ,
		.silicon_rev(silicon_rev) ,
		.sup_mode(sup_mode) ,
		.uc_rx_dfe_cal(uc_rx_dfe_cal) ,
		.uc_rx_dfe_cal_status(uc_rx_dfe_cal_status)

	)
	twentynm_hssi_pma_rx_dfe_encrypted_inst (

		.avmmaddress(avmmaddress),
		.avmmclk(avmmclk),
		.avmmread(avmmread),
		.avmmrstn(avmmrstn),
		.avmmwrite(avmmwrite),
		.avmmwritedata(avmmwritedata),
		.adapt_en(adapt_en),
		.adp_clk(adp_clk),
		.clk0(clk0),
		.clk180(clk180),
		.clk270(clk270),
		.clk90(clk90),
		.dfe_fltap1_coeff(dfe_fltap1_coeff),
		.dfe_fltap1_sgn(dfe_fltap1_sgn),
		.dfe_fltap2_coeff(dfe_fltap2_coeff),
		.dfe_fltap2_sgn(dfe_fltap2_sgn),
		.dfe_fltap3_coeff(dfe_fltap3_coeff),
		.dfe_fltap3_sgn(dfe_fltap3_sgn),
		.dfe_fltap4_coeff(dfe_fltap4_coeff),
		.dfe_fltap4_sgn(dfe_fltap4_sgn),
		.dfe_fltap_bypdeser(dfe_fltap_bypdeser),
		.dfe_fltap_position(dfe_fltap_position),
		.dfe_fxtap1_coeff(dfe_fxtap1_coeff),
		.dfe_fxtap2_coeff(dfe_fxtap2_coeff),
		.dfe_fxtap2_sgn(dfe_fxtap2_sgn),
		.dfe_fxtap3_coeff(dfe_fxtap3_coeff),
		.dfe_fxtap3_sgn(dfe_fxtap3_sgn),
		.dfe_fxtap4_coeff(dfe_fxtap4_coeff),
		.dfe_fxtap4_sgn(dfe_fxtap4_sgn),
		.dfe_fxtap5_coeff(dfe_fxtap5_coeff),
		.dfe_fxtap5_sgn(dfe_fxtap5_sgn),
		.dfe_fxtap6_coeff(dfe_fxtap6_coeff),
		.dfe_fxtap6_sgn(dfe_fxtap6_sgn),
		.dfe_fxtap7_coeff(dfe_fxtap7_coeff),
		.dfe_fxtap7_sgn(dfe_fxtap7_sgn),
		.dfe_rstn(dfe_rstn),
		.dfe_spec_disable(dfe_spec_disable),
		.dfe_spec_sgn_sel(dfe_spec_sgn_sel),
		.dfe_vref_sgn_sel(dfe_vref_sgn_sel),
		.rxn(rxn),
		.rxp(rxp),
		.vga_vcm(vga_vcm),
		.vref_level_coeff(vref_level_coeff),
		.avmmreaddata(avmmreaddata),
		.blockselect(blockselect),
		.clk0_bbpd(clk0_bbpd),
		.clk180_bbpd(clk180_bbpd),
		.clk270_bbpd(clk270_bbpd),
		.clk90_bbpd(clk90_bbpd),
		.deven(deven),
		.devenb(devenb),
		.dfe_oc_tstmx(dfe_oc_tstmx),
		.dodd(dodd),
		.doddb(doddb),
		.edge270(edge270),
		.edge270b(edge270b),
		.edge90(edge90),
		.edge90b(edge90b),
		.err_ev(err_ev),
		.err_evb(err_evb),
		.err_od(err_od),
		.err_odb(err_odb),
		.spec_vrefh(spec_vrefh),
		.spec_vrefl(spec_vrefl)

	);

endmodule
// -----------------------------------------------------------
// This is auto-generated HSSI Simulation Atom Model Encryption Wrapper
// Module Name : work/twentynm_hssi_pma_rx_odi_wrapper.v
// -----------------------------------------------------------

`timescale 1 ps/1 ps

module twentynm_hssi_pma_rx_odi
#(
	// Parameter declaration and default value assignment

	parameter enable_debug_info = "true",	//Valid values: false|true; this is simulation-only parameter, for debug purpose only

	parameter	clk_dcd_bypass = "no_bypass" ,		//Valid values: bypass no_bypass 
	parameter	datarate = "0 bps" ,		//Valid values:  
	parameter	enable_odi = "power_down_eye" ,		//Valid values: jitter_modulation normal_eye_on_dfe normal_eye_on_eqin power_down_eye 
	parameter	initial_settings = "false" ,		//Valid values: false true 
	parameter	invert_dfe_vref = "no_inversion" ,		//Valid values: no_inversion inversion 
	parameter	monitor_bw_sel = "bw_1" ,		//Valid values: bw_1 bw_2 bw_3 bw_4 
	parameter	oc_sa_c0 = 8'b00000000 ,		//Valid values: 8 
	parameter	oc_sa_c180 = 8'b00000000 ,		//Valid values: 8 
	parameter	optimal = "true" ,		//Valid values: false true 
	parameter	phase_steps_64_vs_128 = "phase_steps_64" ,		//Valid values: phase_steps_64 phase_steps_128 
	parameter	phase_steps_sel = "step40" ,		//Valid values: step1 step2 step3 step4 step5 step6 step7 step8 step9 step10 step11 step12 step13 step14 step15 step16 step17 step18 step19 step20 step21 step22 step23 step24 step25 step26 step27 step28 step29 step30 step31 step32 step33 step34 step35 step36 step37 step38 step39 step40 step41 step42 step43 step44 step45 step46 step47 step48 step49 step50 step51 step52 step53 step54 step55 step56 step57 step58 step59 step60 step61 step62 step63 step64 step65 step66 step67 step68 step69 step70 step71 step72 step73 step74 step75 step76 step77 step78 step79 step80 step81 step82 step83 step84 step85 step86 step87 step88 step89 step90 step91 step92 step93 step94 step95 step96 step97 step98 step99 step100 step101 step102 step103 step104 step105 step106 step107 step108 step109 step110 step111 step112 step113 step114 step115 step116 step117 step118 step119 step120 step121 step122 step123 step124 step125 step126 step127 step128 
	parameter	power_mode = "low_power" ,		//Valid values: low_power mid_power high_perf 
	parameter	prot_mode = "basic_rx" ,		//Valid values: basic_rx pcie_gen1_rx pcie_gen2_rx pcie_gen3_rx pcie_gen4_rx qpi_rx unused gpon_rx sata_rx 
	parameter	sel_oc_en = "off_canc_disable" ,		//Valid values: off_canc_enable off_canc_disable 
	parameter	silicon_rev = "20nm5es" ,		//Valid values: 20nm5es 20nm5es2 20nm4es 20nm4es2 20nm5 20nm4 20nm3 20nm2 20nm1 
	parameter	step_ctrl_sel = "feedback_mode" ,		//Valid values: dprio_mode feedback_mode jm_mode 
	parameter	sup_mode = "user_mode" ,		//Valid values: user_mode engineering_mode 
	parameter	v_vert_sel = "plus" ,		//Valid values: minus plus 
	parameter	v_vert_threshold_scaling = "scale_3" ,		//Valid values: scale_0 scale_1 scale_2 scale_3 
	parameter	vert_threshold = "vert_0"		//Valid values: vert_0 vert_1 vert_2 vert_3 vert_4 vert_5 vert_6 vert_7 vert_8 vert_9 vert_10 vert_11 vert_12 vert_13 vert_14 vert_15 vert_16 vert_17 vert_18 vert_19 vert_20 vert_21 vert_22 vert_23 vert_24 vert_25 vert_26 vert_27 vert_28 vert_29 vert_30 vert_31 vert_32 vert_33 vert_34 vert_35 vert_36 vert_37 vert_38 vert_39 vert_40 vert_41 vert_42 vert_43 vert_44 vert_45 vert_46 vert_47 vert_48 vert_49 vert_50 vert_51 vert_52 vert_53 vert_54 vert_55 vert_56 vert_57 vert_58 vert_59 vert_60 vert_61 vert_62 vert_63 
)

(
	//Port declaration

	input	[8:0]  avmmaddress ,
	input	avmmclk ,
	input	avmmread ,
	input	avmmrstn ,
	input	avmmwrite ,
	input	[7:0]  avmmwritedata ,
	input	clk0 ,
	input	clk180 ,
	input	clk270 ,
	input	clk90 ,
	input	it50u ,
	input	it50u2 ,
	input	it50u4 ,
	input	[2:0]  odi_atb_sel ,
	input	odi_dft_clr ,
	input	odi_latch_clk ,
	input	odi_shift_clk ,
	input	odi_shift_in ,
	input	rx_n ,
	input	rx_p ,
	input	rxn_sum ,
	input	rxp_sum ,
	input	spec_vrefh ,
	input	spec_vrefl ,
	input	vcm_vref ,
	input	[4:0]  vertical_fb ,

	output	[7:0]  avmmreaddata ,
	output	blockselect ,
	output	atb0 ,
	output	atb1 ,
	output	clk0_eye ,
	output	clk0_eye_lb ,
	output	clk180_eye ,
	output	clk180_eye_lb ,
	output	de_eye ,
	output	deb_eye ,
	output	do_eye ,
	output	dob_eye ,
	output	odi_en ,
	output	[1:0]  odi_oc_tstmx ,
	output	tdr_en ,
	output	vref_sel_out 

);


	twentynm_hssi_pma_rx_odi_encrypted
	#(
		.enable_debug_info(enable_debug_info) ,

		.clk_dcd_bypass(clk_dcd_bypass) ,
		.datarate(datarate) ,
		.enable_odi(enable_odi) ,
		.initial_settings(initial_settings) ,
		.invert_dfe_vref(invert_dfe_vref) ,
		.monitor_bw_sel(monitor_bw_sel) ,
		.oc_sa_c0(oc_sa_c0) ,
		.oc_sa_c180(oc_sa_c180) ,
		.optimal(optimal) ,
		.phase_steps_64_vs_128(phase_steps_64_vs_128) ,
		.phase_steps_sel(phase_steps_sel) ,
		.power_mode(power_mode) ,
		.prot_mode(prot_mode) ,
		.sel_oc_en(sel_oc_en) ,
		.silicon_rev(silicon_rev) ,
		.step_ctrl_sel(step_ctrl_sel) ,
		.sup_mode(sup_mode) ,
		.v_vert_sel(v_vert_sel) ,
		.v_vert_threshold_scaling(v_vert_threshold_scaling) ,
		.vert_threshold(vert_threshold)

	)
	twentynm_hssi_pma_rx_odi_encrypted_inst (

		.avmmaddress(avmmaddress),
		.avmmclk(avmmclk),
		.avmmread(avmmread),
		.avmmrstn(avmmrstn),
		.avmmwrite(avmmwrite),
		.avmmwritedata(avmmwritedata),
		.clk0(clk0),
		.clk180(clk180),
		.clk270(clk270),
		.clk90(clk90),
		.it50u(it50u),
		.it50u2(it50u2),
		.it50u4(it50u4),
		.odi_atb_sel(odi_atb_sel),
		.odi_dft_clr(odi_dft_clr),
		.odi_latch_clk(odi_latch_clk),
		.odi_shift_clk(odi_shift_clk),
		.odi_shift_in(odi_shift_in),
		.rx_n(rx_n),
		.rx_p(rx_p),
		.rxn_sum(rxn_sum),
		.rxp_sum(rxp_sum),
		.spec_vrefh(spec_vrefh),
		.spec_vrefl(spec_vrefl),
		.vcm_vref(vcm_vref),
		.vertical_fb(vertical_fb),
		.avmmreaddata(avmmreaddata),
		.blockselect(blockselect),
		.atb0(atb0),
		.atb1(atb1),
		.clk0_eye(clk0_eye),
		.clk0_eye_lb(clk0_eye_lb),
		.clk180_eye(clk180_eye),
		.clk180_eye_lb(clk180_eye_lb),
		.de_eye(de_eye),
		.deb_eye(deb_eye),
		.do_eye(do_eye),
		.dob_eye(dob_eye),
		.odi_en(odi_en),
		.odi_oc_tstmx(odi_oc_tstmx),
		.tdr_en(tdr_en),
		.vref_sel_out(vref_sel_out)

	);

endmodule
// -----------------------------------------------------------
// This is auto-generated HSSI Simulation Atom Model Encryption Wrapper
// Module Name : work/twentynm_hssi_pma_rx_sd_wrapper.v
// -----------------------------------------------------------

`timescale 1 ps/1 ps

module twentynm_hssi_pma_rx_sd
#(
	// Parameter declaration and default value assignment

	parameter enable_debug_info = "true",	//Valid values: false|true; this is simulation-only parameter, for debug purpose only

	parameter	link = "sr" ,		//Valid values: lr mr sr 
	parameter	optimal = "true" ,		//Valid values: false true 
	parameter	power_mode = "low_power" ,		//Valid values: low_power mid_power high_perf 
	parameter	prot_mode = "basic_rx" ,		//Valid values: basic_rx pcie_gen1_rx pcie_gen2_rx pcie_gen3_rx pcie_gen4_rx qpi_rx unused gpon_rx sata_rx 
	parameter	sd_output_off = 1 ,		//Valid values: 0..28 
	parameter	sd_output_on = 1 ,		//Valid values: 0..15 
	parameter	sd_pdb = "sd_off" ,		//Valid values: sd_on sd_off 
	parameter	sd_threshold = "sdlv_3" ,		//Valid values: sdlv_0 sdlv_1 sdlv_2 sdlv_3 sdlv_4 sdlv_5 sdlv_6 sdlv_7 sdlv_8 sdlv_9 sdlv_10 sdlv_11 sdlv_12 sdlv_13 sdlv_14 sdlv_15 
	parameter	silicon_rev = "20nm5es" ,		//Valid values: 20nm5es 20nm5es2 20nm4es 20nm4es2 20nm5 20nm4 20nm3 20nm2 20nm1 
	parameter	sup_mode = "user_mode"		//Valid values: user_mode engineering_mode 
)

(
	//Port declaration

	input	[8:0]  avmmaddress ,
	input	avmmclk ,
	input	avmmread ,
	input	avmmrstn ,
	input	avmmwrite ,
	input	[7:0]  avmmwritedata ,
	input	clk ,
	input	qpi ,
	input	rstn_sd ,
	input	s_lpbk_b ,
	input	vin ,
	input	vip ,

	output	[7:0]  avmmreaddata ,
	output	blockselect ,
	output	sd 

);


	twentynm_hssi_pma_rx_sd_encrypted
	#(
		.enable_debug_info(enable_debug_info) ,

		.link(link) ,
		.optimal(optimal) ,
		.power_mode(power_mode) ,
		.prot_mode(prot_mode) ,
		.sd_output_off(sd_output_off) ,
		.sd_output_on(sd_output_on) ,
		.sd_pdb(sd_pdb) ,
		.sd_threshold(sd_threshold) ,
		.silicon_rev(silicon_rev) ,
		.sup_mode(sup_mode)

	)
	twentynm_hssi_pma_rx_sd_encrypted_inst (

		.avmmaddress(avmmaddress),
		.avmmclk(avmmclk),
		.avmmread(avmmread),
		.avmmrstn(avmmrstn),
		.avmmwrite(avmmwrite),
		.avmmwritedata(avmmwritedata),
		.clk(clk),
		.qpi(qpi),
		.rstn_sd(rstn_sd),
		.s_lpbk_b(s_lpbk_b),
		.vin(vin),
		.vip(vip),
		.avmmreaddata(avmmreaddata),
		.blockselect(blockselect),
		.sd(sd)

	);

endmodule
// -----------------------------------------------------------
// This is auto-generated HSSI Simulation Atom Model Encryption Wrapper
// Module Name : work/twentynm_hssi_pma_tx_buf_wrapper.v
// -----------------------------------------------------------

`timescale 1 ps/1 ps

module twentynm_hssi_pma_tx_buf
#(
	// Parameter declaration and default value assignment

	parameter enable_debug_info = "true",	//Valid values: false|true; this is simulation-only parameter, for debug purpose only

	parameter	calibration_en = "false" ,		//Valid values: false true 
	parameter	calibration_resistor_value = "res_setting0" ,		//Valid values: res_setting0 res_setting1 res_setting2 res_setting3 
	parameter	cdr_cp_calibration_en = "cdr_cp_cal_disable" ,		//Valid values: cdr_cp_cal_disable cdr_cp_cal_enable 
	parameter	chgpmp_current_dn_trim = "cp_current_trimming_dn_setting0" ,		//Valid values: cp_current_trimming_dn_setting0 cp_current_trimming_dn_setting1 cp_current_trimming_dn_setting2 cp_current_trimming_dn_setting3 cp_current_trimming_dn_setting4 cp_current_trimming_dn_setting5 cp_current_trimming_dn_setting6 cp_current_trimming_dn_setting7 cp_current_trimming_dn_setting8 cp_current_trimming_dn_setting9 cp_current_trimming_dn_setting10 cp_current_trimming_dn_setting11 cp_current_trimming_dn_setting12 cp_current_trimming_dn_setting13 cp_current_trimming_dn_setting14 cp_current_trimming_dn_setting15 
	parameter	chgpmp_current_up_trim = "cp_current_trimming_up_setting0" ,		//Valid values: cp_current_trimming_up_setting0 cp_current_trimming_up_setting1 cp_current_trimming_up_setting2 cp_current_trimming_up_setting3 cp_current_trimming_up_setting4 cp_current_trimming_up_setting5 cp_current_trimming_up_setting6 cp_current_trimming_up_setting7 cp_current_trimming_up_setting8 cp_current_trimming_up_setting9 cp_current_trimming_up_setting10 cp_current_trimming_up_setting11 cp_current_trimming_up_setting12 cp_current_trimming_up_setting13 cp_current_trimming_up_setting14 cp_current_trimming_up_setting15 
	parameter	chgpmp_dn_trim_double = "normal_dn_trim_current" ,		//Valid values: normal_dn_trim_current double_dn_trim_current 
	parameter	chgpmp_up_trim_double = "normal_up_trim_current" ,		//Valid values: normal_up_trim_current double_up_trim_current 
	parameter	compensation_driver_en = "disable" ,		//Valid values: disable enable 
	parameter	compensation_en = "enable" ,		//Valid values: disable enable 
	parameter	cpen_ctrl = "cp_l0" ,		//Valid values: cp_l0 cp_l1 
	parameter	datarate = "0 bps" ,		//Valid values:  
	parameter	dcd_clk_div_ctrl = "dcd_ck_div128" ,		//Valid values: dcd_ck_div128 dcd_ck_div256 
	parameter	dcd_detection_en = "enable" ,		//Valid values: disable enable 
	parameter	dft_sel = "dft_disabled" ,		//Valid values: s_pr1_15_8 tx50_7_0 s_main_7_0 s_main_15_8 s_main_23_16 s_main_31_24 s_main_39_32 s_main_47_40 s_main_55_48 en_t50_8_s_main_59_56 s_po1_7_0 s_po1_15_8 s_po1_23_16 en_tri_s_po1_24 s_pr1_7_0 dft_disabled 
	parameter	duty_cycle_correction_bandwidth = "dcc_bw_12" ,		//Valid values: dcc_bw_0 dcc_bw_1 dcc_bw_2 dcc_bw_3 dcc_bw_4 dcc_bw_5 dcc_bw_6 dcc_bw_7 dcc_bw_8 dcc_bw_9 dcc_bw_10 dcc_bw_11 dcc_bw_12 dcc_bw_13 dcc_bw_14 dcc_bw_15 
	parameter	duty_cycle_correction_bandwidth_dn = "dcd_bw_dn_0" ,		//Valid values: dcd_bw_dn_0 dcd_bw_dn_1 dcd_bw_dn_2 dcd_bw_dn_3 
	parameter	duty_cycle_correction_mode_ctrl = "dcc_disable" ,		//Valid values: dcc_disable dcc_0000011111 dcc_1111100000 dcc_continuous 
	parameter	duty_cycle_correction_reference1 = "dcc_ref1_3" ,		//Valid values: dcc_ref1_0 dcc_ref1_1 dcc_ref1_2 dcc_ref1_3 dcc_ref1_4 dcc_ref1_5 dcc_ref1_6 dcc_ref1_7 dcc_ref1_8 dcc_ref1_9 dcc_ref1_10 dcc_ref1_11 dcc_ref1_12 dcc_ref1_13 dcc_ref1_14 dcc_ref1_15 
	parameter	duty_cycle_correction_reference2 = "dcc_ref2_3" ,		//Valid values: dcc_ref2_0 dcc_ref2_1 dcc_ref2_2 dcc_ref2_3 dcc_ref2_4 dcc_ref2_5 dcc_ref2_6 dcc_ref2_7 
	parameter	duty_cycle_correction_reset_n = "reset_n" ,		//Valid values: reset_n reset 
	parameter	duty_cycle_cp_comp_en = "cp_comp_off" ,		//Valid values: cp_comp_off cp_comp_on 
	parameter	duty_cycle_detector_cp_cal = "dcd_cp_cal_disable" ,		//Valid values: dcd_cp_cal_disable dcd_cp_cal_tri dcd_cp_cal_ip dcd_cp_cal_in 
	parameter	duty_cycle_detector_sa_cal = "dcd_sa_cal_disable" ,		//Valid values: dcd_sa_cal_disable dcd_sa_cal_enable 
	parameter	duty_cycle_input_polarity = "dcc_input_pos" ,		//Valid values: dcc_input_pos dcc_input_neg 
	parameter	duty_cycle_setting = "dcc_t32" ,		//Valid values: dcc_t0 dcc_t1 dcc_t2 dcc_t3 dcc_t4 dcc_t5 dcc_t6 dcc_t7 dcc_t8 dcc_t9 dcc_t10 dcc_t11 dcc_t12 dcc_t13 dcc_t14 dcc_t15 dcc_t16 dcc_t17 dcc_t18 dcc_t19 dcc_t20 dcc_t21 dcc_t22 dcc_t23 dcc_t24 dcc_t25 dcc_t26 dcc_t27 dcc_t28 dcc_t29 dcc_t30 dcc_t31 dcc_t32 dcc_t33 dcc_t34 dcc_t35 dcc_t36 dcc_t37 dcc_t38 dcc_t39 dcc_t40 dcc_t41 dcc_t42 dcc_t43 dcc_t44 dcc_t45 dcc_t46 dcc_t47 dcc_t48 dcc_t49 dcc_t50 dcc_t51 dcc_t52 dcc_t53 dcc_t54 dcc_t55 dcc_t56 dcc_t57 dcc_t58 dcc_t59 dcc_t60 dcc_t61 dcc_t62 dcc_t63 
	parameter	duty_cycle_setting_aux = "dcc2_t32" ,		//Valid values: dcc2_t0 dcc2_t1 dcc2_t2 dcc2_t3 dcc2_t4 dcc2_t5 dcc2_t6 dcc2_t7 dcc2_t8 dcc2_t9 dcc2_t10 dcc2_t11 dcc2_t12 dcc2_t13 dcc2_t14 dcc2_t15 dcc2_t16 dcc2_t17 dcc2_t18 dcc2_t19 dcc2_t20 dcc2_t21 dcc2_t22 dcc2_t23 dcc2_t24 dcc2_t25 dcc2_t26 dcc2_t27 dcc2_t28 dcc2_t29 dcc2_t30 dcc2_t31 dcc2_t32 dcc2_t33 dcc2_t34 dcc2_t35 dcc2_t36 dcc2_t37 dcc2_t38 dcc2_t39 dcc2_t40 dcc2_t41 dcc2_t42 dcc2_t43 dcc2_t44 dcc2_t45 dcc2_t46 dcc2_t47 dcc2_t48 dcc2_t49 dcc2_t50 dcc2_t51 dcc2_t52 dcc2_t53 dcc2_t54 dcc2_t55 dcc2_t56 dcc2_t57 dcc2_t58 dcc2_t59 dcc2_t60 dcc2_t61 dcc2_t62 dcc2_t63 
	parameter	enable_idle_tx_channel_support = "false" ,		//Valid values: true false 
	parameter	initial_settings = "false" ,		//Valid values: false true 
	parameter	jtag_drv_sel = "drv1" ,		//Valid values: drv1 drv2 drv3 drv4 
	parameter	jtag_lp = "lp_off" ,		//Valid values: lp_off lp_on 
	parameter	link = "sr" ,		//Valid values: sr mr lr 
	parameter	link_tx = "sr" ,		//Valid values: lr mr sr 
	parameter	low_power_en = "disable" ,		//Valid values: disable enable 
	parameter	lst = "atb_disabled" ,		//Valid values: atb_0 atb_1 atb_2 atb_3 atb_4 atb_5 atb_6 atb_7 atb_8 atb_disabled not_used0 not_used1 not_used2 atb_9 atb_10 atb_11 atb_12 atb_13 atb_14 
	parameter	mcgb_location_for_pcie = 4'b0000 ,		//Valid values: 4 
	parameter	optimal = "true" ,		//Valid values: false true 
	parameter	pm_speed_grade = "e2" ,		//Valid values: e1 i1 e2 i2 e3 i3 m3 e4 i4 m4 e5 i5 
	parameter	power_mode = "low_power" ,		//Valid values: low_power mid_power high_perf 
	parameter	power_rail_eht = 0 ,		//Valid values: 0..4095 
	parameter	power_rail_et = 0 ,		//Valid values: 0..4095 
	parameter	pre_emp_sign_1st_post_tap = "fir_post_1t_neg" ,		//Valid values: fir_post_1t_pos fir_post_1t_neg 
	parameter	pre_emp_sign_2nd_post_tap = "fir_post_2t_neg" ,		//Valid values: fir_post_2t_pos fir_post_2t_neg 
	parameter	pre_emp_sign_pre_tap_1t = "fir_pre_1t_neg" ,		//Valid values: fir_pre_1t_pos fir_pre_1t_neg 
	parameter	pre_emp_sign_pre_tap_2t = "fir_pre_2t_neg" ,		//Valid values: fir_pre_2t_pos fir_pre_2t_neg 
	parameter	pre_emp_switching_ctrl_1st_post_tap = 6'b000000 ,		//Valid values: 6 
	parameter	pre_emp_switching_ctrl_2nd_post_tap = 4'b0000 ,		//Valid values: 4 
	parameter	pre_emp_switching_ctrl_pre_tap_1t = 5'b00000 ,		//Valid values: 5 
	parameter	pre_emp_switching_ctrl_pre_tap_2t = 3'b000 ,		//Valid values: 3 
	parameter	prot_mode = "basic_tx" ,		//Valid values: unused basic_tx pcie_gen1_tx pcie_gen2_tx pcie_gen3_tx pcie_gen4_tx qpi_tx gpon_tx sata_tx 
	parameter	res_cal_local = "non_local" ,		//Valid values: non_local local 
	parameter	rx_det = "mode_0" ,		//Valid values: mode_0 mode_1 mode_2 mode_3 mode_4 mode_5 mode_6 mode_7 mode_8 mode_9 mode_10 mode_11 mode_12 mode_13 mode_14 mode_15 
	parameter	rx_det_output_sel = "rx_det_pcie_out" ,		//Valid values: rx_det_pcie_out rx_det_qpi_out 
	parameter	rx_det_pdb = "rx_det_off" ,		//Valid values: rx_det_off rx_det_on 
	parameter	sense_amp_offset_cal_curr_n = "sa_os_cal_in_0" ,		//Valid values: sa_os_cal_in_0 sa_os_cal_in_1 sa_os_cal_in_2 sa_os_cal_in_3 
	parameter	sense_amp_offset_cal_curr_p = 5'b00000 ,		//Valid values: 5 
	parameter	ser_powerdown = "power_down_ser" ,		//Valid values: normal_ser_on power_down_ser 
	parameter	silicon_rev = "20nm5es" ,		//Valid values: 20nm5es 20nm5es2 20nm4es 20nm4es2 20nm5 20nm4 20nm3 20nm2 20nm1 
	parameter	slew_rate_ctrl = "slew_r7" ,		//Valid values: slew_r0 slew_r1 slew_r2 slew_r3 slew_r4 slew_r5 slew_r6 slew_r7 
	parameter	sup_mode = "user_mode" ,		//Valid values: user_mode engineering_mode 
	parameter	swing_level = "lv" ,		//Valid values: lv lvii lviii hv 
	parameter	term_code = "rterm_code7" ,		//Valid values: rterm_code0 rterm_code1 rterm_code2 rterm_code3 rterm_code4 rterm_code5 rterm_code6 rterm_code7 rterm_code8 rterm_code9 rterm_code10 rterm_code11 rterm_code12 rterm_code13 rterm_code14 rterm_code15 
	parameter	term_n_tune = "rterm_n0" ,		//Valid values: rterm_n0 rterm_n1 rterm_n2 rterm_n3 rterm_n4 rterm_n5 rterm_n6 rterm_n7 rterm_n8 rterm_n9 rterm_n10 rterm_n11 rterm_n12 rterm_n13 rterm_n14 rterm_n15 
	parameter	term_p_tune = "rterm_p0" ,		//Valid values: rterm_p0 rterm_p1 rterm_p2 rterm_p3 rterm_p4 rterm_p5 rterm_p6 rterm_p7 rterm_p8 rterm_p9 rterm_p10 rterm_p11 rterm_p12 rterm_p13 rterm_p14 rterm_p15 
	parameter	term_sel = "r_r1" ,		//Valid values: r_r1 r_r2 r_r1_calp r_r2_calp r_r1_capn r_r2_caln 
	parameter	tri_driver = "tri_driver_disable" ,		//Valid values: tri_driver_disable tri_driver_enable 
	parameter	tx_powerdown = "normal_tx_on" ,		//Valid values: normal_tx_on power_down_tx 
	parameter	uc_dcd_cal = "uc_dcd_cal_off" ,		//Valid values: uc_dcd_cal_off uc_dcd_cal_on 
	parameter	uc_dcd_cal_status = "uc_dcd_cal_notdone" ,		//Valid values: uc_dcd_cal_notdone uc_dcd_cal_done 
	parameter	uc_gen3 = "gen3_off" ,		//Valid values: gen3_off gen3_on 
	parameter	uc_gen4 = "gen4_off" ,		//Valid values: gen4_off gen4_on 
	parameter	uc_skew_cal = "uc_skew_cal_off" ,		//Valid values: uc_skew_cal_off uc_skew_cal_on 
	parameter	uc_skew_cal_status = "uc_skew_cal_notdone" ,		//Valid values: uc_skew_cal_notdone uc_skew_cal_done 
	parameter	uc_txvod_cal = "uc_tx_vod_cal_off" ,		//Valid values: uc_tx_vod_cal_off uc_tx_vod_cal_on 
	parameter	uc_txvod_cal_cont = "uc_tx_vod_cal_cont_off" ,		//Valid values: uc_tx_vod_cal_cont_off uc_tx_vod_cal_cont_on 
	parameter	uc_txvod_cal_status = "uc_tx_vod_cal_notdone" ,		//Valid values: uc_tx_vod_cal_notdone uc_tx_vod_cal_done 
	parameter	uc_vcc_setting = "vcc_setting0" ,		//Valid values: vcc_setting0 vcc_setting1 vcc_setting2 vcc_setting3 
	parameter	user_fir_coeff_ctrl_sel = "ram_ctl" ,		//Valid values: ram_ctl dynamic_ctl 
	parameter	vod_output_swing_ctrl = 5'b00000 ,		//Valid values: 5 
	parameter	vreg_output = "vccdreg_nominal" ,		//Valid values: vccdreg_nominal vccdreg_pos_setting1 vccdreg_pos_setting2 vccdreg_pos_setting3 vccdreg_pos_setting4 vccdreg_pos_setting5 vccdreg_pos_setting6 vccdreg_pos_setting7 vccdreg_pos_setting8 vccdreg_pos_setting9 vccdreg_pos_setting10 vccdreg_pos_setting11 vccdreg_pos_setting12 vccdreg_pos_setting13 vccdreg_pos_setting14 vccdreg_pos_setting15 vccdreg_pos_setting16 vccdreg_pos_setting17 vccdreg_pos_setting18 vccdreg_pos_setting19 vccdreg_pos_setting20 vccdreg_pos_setting21 vccdreg_pos_setting22 vccdreg_pos_setting23 vccdreg_pos_setting24 vccdreg_pos_setting25 vccdreg_pos_setting26 vccdreg_pos_setting27 vccdreg_neg_setting1 vccdreg_neg_setting2 vccdreg_neg_setting3 vccdreg_neg_setting4 
	parameter	xtx_path_analog_mode = "user_custom" ,		//Valid values: user_custom pcie_cable xaui_3125 srio_1250_sr srio_1250_lr srio_2500_sr srio_2500_lr srio_3125_sr srio_3125_lr srio_5000_sr srio_5000_mr srio_5000_lr srio_6250_sr srio_6250_mr srio_6250_lr srio_10312_sr srio_10312_lr cpri_e6lv cpri_e6hv cpri_e6lvii cpri_e6lviii cpri_e12lv cpri_e12hv cpri_e12lvii cpri_e12lviii cpri_e24lv cpri_e24lvii cpri_e24lviii cpri_e30lv cpri_e30lvii cpri_e30lviii cpri_e48lvii cpri_e48lviii cpri_e60lvii cpri_e60lviii cpri_e96lviii cpri_e99lviii cpri_12500 interlaken_3125 interlaken_6375 interlaken_11100 interlaken_12500 interlaken_25781 cei_4976_sr cei_4976_lr cei_6375_sr cei_6375_lr cei_9950_sr cei_9950_lr cei_11100_sr cei_11100_lr cei_12500_sr cei_12500_lr cei_19000_vsr cei_28000_vsr sfi_2488 sfi_3125 sfi_s_6250 sfi_s_11200 sff_8431 sonet_oc12_622 sonet_oc48_2488 sonet_oc192_9953 gpon_155 gpon_622 gpon_1244 gpon_2488 ieee_itut_10g_gpon_epon sdi_270_sd sdi_1485_hd sdi_2970_3g sdi_6000 sdi_12000 sata_1500 sata_3000 sata_6000 sas_1500 sas_3000 sas_6000 sas_12000 fc_400_df_el_s fc_400_df_ea_s fc_800_df_el_s fc_800_df_ea_s fc_1600_df_el_s fc_1600_df_ea_s jesd204_a_b_312 jesd204_a_b_3125 jesd204_a_b_6375 jesd204_a_b_12500 dp_1620 dp_2700 dp_5400 dp_8100 ieee_1000_base_cx ieee_10g_base_cx4 ieee_1000_base_kx ieee_10g_base_kx4 ieee_10g_kr_10312 ieee_40g_base_kr_10312 ieee_10g_base_cr_10312 ieee_40g_base_cr4_10312 ieee_100g_base_cr10_10312 xfp_9950 xfp_10310 xfp_10520 xfp_10700 xfp_11320 xfp_12500 higig_3125 higig_3750 higig_4062 higig_5000 higig_6250 higig_6562 otu2_10709 infiniband_sdr_2500 infiniband_ddr_5000 infiniband_qdr_10000 infiniband_fdr_14000 hdmi_3400 hdmi_6000 hmc_10000 hmc_12500 hmc_15000 qsgmii_5000 gige_1250 serial_lite_iii_16400 serial_lite_iii_17400 nppi_10312 upi 
	parameter	xtx_path_bonding_mode = "x1_non_bonded" ,		//Valid values: x1_non_bonded x1_reset_bonded x6_xn_bonded xn_non_bonded 
	parameter	xtx_path_calibration_en = "false" ,		//Valid values: false true 
	parameter	xtx_path_clock_divider_ratio = 4'b0000 ,		//Valid values: 4 
	parameter	xtx_path_datarate = "0 bps" ,		//Valid values:  
	parameter	xtx_path_datawidth = 8'b00000000 ,		//Valid values: 8 
	parameter	xtx_path_gt_enabled = "disable" ,		//Valid values: disable enable 
	parameter	xtx_path_initial_settings = "false" ,		//Valid values: false true 
	parameter	xtx_path_optimal = "true" ,		//Valid values: false true 
	parameter	xtx_path_pma_tx_divclk_hz = 32'b00000000000000000000000000000000 ,		//Valid values: 
	parameter	xtx_path_prot_mode = "basic_tx" ,		//Valid values: unused basic_tx pcie_gen1_tx pcie_gen2_tx pcie_gen3_tx pcie_gen4_tx qpi_tx gpon_tx sata_tx 
	parameter	xtx_path_sup_mode = "user_mode" ,		//Valid values: user_mode engineering_mode 
	parameter	xtx_path_swing_level = "lv" ,		//Valid values: lv lvii lviii hv 
	parameter	xtx_path_tx_pll_clk_hz = "0 hz"		//Valid values:  
)

(
	//Port declaration

	input	[8:0]  avmmaddress ,
	input	avmmclk ,
	input	avmmread ,
	input	avmmrstn ,
	input	avmmwrite ,
	input	[7:0]  avmmwritedata ,
	input	bsmode ,
	input	bsoeb ,
	input	bstxn_in ,
	input	bstxp_in ,
	input	clk0_tx ,
	input	clk180_tx ,
	input	clk_dcd ,
	input	clksn ,
	input	clksp ,
	input	cr_rdynamic_sw ,
	input	[17:0]  i_coeff ,
	input	oe ,
	input	oeb ,
	input	oo ,
	input	oob ,
	input	pcie_sw_master ,
	input	rx_det_clk ,
	input	rx_n_bidir_in ,
	input	rx_p_bidir_in ,
	input	s_lpbk_b ,
	input	[8:0]  tx50 ,
	input	tx_det_rx ,
	input	tx_elec_idle ,
	input	tx_qpi_pulldn ,
	input	tx_qpi_pullup ,
	input	tx_rlpbk ,
	input	vrlpbkn ,
	input	vrlpbkn_1t ,
	input	vrlpbkp ,
	input	vrlpbkp_1t ,

	output	[7:0]  avmmreaddata ,
	output	blockselect ,
	output	[2:0]  atbsel ,
	output	ckn ,
	output	ckp ,
	output	dcd_out1 ,
	output	dcd_out2 ,
	output	dcd_out_ready ,
	output	[1:0]  detect_on ,
	output	lbvon ,
	output	lbvop ,
	output	rx_detect_valid ,
	output	rx_found ,
	output	rx_found_pcie_spl_test ,
	output	sel_vreg ,
	output	spl_clk_test ,
	output	[7:0]  tx_dftout ,
	output	vlptxn ,
	output	vlptxp ,
	output	von ,
	output	vop 

);

// Function to convert a 64bit binary to a string.
function [128*8-1 : 0] m_bin_to_str;
	input [128 : 1]   s;
	reg   [128 : 1]   reg_s;
	reg   [7 : 0]    tmp;
	reg   [128*8 : 1] res;
	integer m, index;

	begin
		reg_s = s;
		res = 128'h00000000000000000000000000000000;

		for (m = 128; m > 0; m = m-1 )
		begin
			tmp = reg_s[128];
			res[(((m-1)*8)+1)] = tmp & 1'b1;
			reg_s = reg_s << 1;
		end

		m_bin_to_str = res;
	end
endfunction

localparam [8*128-1 : 0] xtx_path_pma_tx_divclk_hz_string	= m_bin_to_str(xtx_path_pma_tx_divclk_hz);


	twentynm_hssi_pma_tx_buf_encrypted
	#(
		.enable_debug_info(enable_debug_info) ,

		.calibration_en(calibration_en) ,
		.calibration_resistor_value(calibration_resistor_value) ,
		.cdr_cp_calibration_en(cdr_cp_calibration_en) ,
		.chgpmp_current_dn_trim(chgpmp_current_dn_trim) ,
		.chgpmp_current_up_trim(chgpmp_current_up_trim) ,
		.chgpmp_dn_trim_double(chgpmp_dn_trim_double) ,
		.chgpmp_up_trim_double(chgpmp_up_trim_double) ,
		.compensation_driver_en(compensation_driver_en) ,
		.compensation_en(compensation_en) ,
		.cpen_ctrl(cpen_ctrl) ,
		.datarate(datarate) ,
		.dcd_clk_div_ctrl(dcd_clk_div_ctrl) ,
		.dcd_detection_en(dcd_detection_en) ,
		.dft_sel(dft_sel) ,
		.duty_cycle_correction_bandwidth(duty_cycle_correction_bandwidth) ,
		.duty_cycle_correction_bandwidth_dn(duty_cycle_correction_bandwidth_dn) ,
		.duty_cycle_correction_mode_ctrl(duty_cycle_correction_mode_ctrl) ,
		.duty_cycle_correction_reference1(duty_cycle_correction_reference1) ,
		.duty_cycle_correction_reference2(duty_cycle_correction_reference2) ,
		.duty_cycle_correction_reset_n(duty_cycle_correction_reset_n) ,
		.duty_cycle_cp_comp_en(duty_cycle_cp_comp_en) ,
		.duty_cycle_detector_cp_cal(duty_cycle_detector_cp_cal) ,
		.duty_cycle_detector_sa_cal(duty_cycle_detector_sa_cal) ,
		.duty_cycle_input_polarity(duty_cycle_input_polarity) ,
		.duty_cycle_setting(duty_cycle_setting) ,
		.duty_cycle_setting_aux(duty_cycle_setting_aux) ,
		.enable_idle_tx_channel_support(enable_idle_tx_channel_support) ,
		.initial_settings(initial_settings) ,
		.jtag_drv_sel(jtag_drv_sel) ,
		.jtag_lp(jtag_lp) ,
		.link(link) ,
		.link_tx(link_tx) ,
		.low_power_en(low_power_en) ,
		.lst(lst) ,
		.mcgb_location_for_pcie(mcgb_location_for_pcie) ,
		.optimal(optimal) ,
		.pm_speed_grade(pm_speed_grade) ,
		.power_mode(power_mode) ,
		.power_rail_eht(power_rail_eht) ,
		.power_rail_et(power_rail_et) ,
		.pre_emp_sign_1st_post_tap(pre_emp_sign_1st_post_tap) ,
		.pre_emp_sign_2nd_post_tap(pre_emp_sign_2nd_post_tap) ,
		.pre_emp_sign_pre_tap_1t(pre_emp_sign_pre_tap_1t) ,
		.pre_emp_sign_pre_tap_2t(pre_emp_sign_pre_tap_2t) ,
		.pre_emp_switching_ctrl_1st_post_tap(pre_emp_switching_ctrl_1st_post_tap) ,
		.pre_emp_switching_ctrl_2nd_post_tap(pre_emp_switching_ctrl_2nd_post_tap) ,
		.pre_emp_switching_ctrl_pre_tap_1t(pre_emp_switching_ctrl_pre_tap_1t) ,
		.pre_emp_switching_ctrl_pre_tap_2t(pre_emp_switching_ctrl_pre_tap_2t) ,
		.prot_mode(prot_mode) ,
		.res_cal_local(res_cal_local) ,
		.rx_det(rx_det) ,
		.rx_det_output_sel(rx_det_output_sel) ,
		.rx_det_pdb(rx_det_pdb) ,
		.sense_amp_offset_cal_curr_n(sense_amp_offset_cal_curr_n) ,
		.sense_amp_offset_cal_curr_p(sense_amp_offset_cal_curr_p) ,
		.ser_powerdown(ser_powerdown) ,
		.silicon_rev(silicon_rev) ,
		.slew_rate_ctrl(slew_rate_ctrl) ,
		.sup_mode(sup_mode) ,
		.swing_level(swing_level) ,
		.term_code(term_code) ,
		.term_n_tune(term_n_tune) ,
		.term_p_tune(term_p_tune) ,
		.term_sel(term_sel) ,
		.tri_driver(tri_driver) ,
		.tx_powerdown(tx_powerdown) ,
		.uc_dcd_cal(uc_dcd_cal) ,
		.uc_dcd_cal_status(uc_dcd_cal_status) ,
		.uc_gen3(uc_gen3) ,
		.uc_gen4(uc_gen4) ,
		.uc_skew_cal(uc_skew_cal) ,
		.uc_skew_cal_status(uc_skew_cal_status) ,
		.uc_txvod_cal(uc_txvod_cal) ,
		.uc_txvod_cal_cont(uc_txvod_cal_cont) ,
		.uc_txvod_cal_status(uc_txvod_cal_status) ,
		.uc_vcc_setting(uc_vcc_setting) ,
		.user_fir_coeff_ctrl_sel(user_fir_coeff_ctrl_sel) ,
		.vod_output_swing_ctrl(vod_output_swing_ctrl) ,
		.vreg_output(vreg_output) ,
		.xtx_path_analog_mode(xtx_path_analog_mode) ,
		.xtx_path_bonding_mode(xtx_path_bonding_mode) ,
		.xtx_path_calibration_en(xtx_path_calibration_en) ,
		.xtx_path_clock_divider_ratio(xtx_path_clock_divider_ratio) ,
		.xtx_path_datarate(xtx_path_datarate) ,
		.xtx_path_datawidth(xtx_path_datawidth) ,
		.xtx_path_gt_enabled(xtx_path_gt_enabled) ,
		.xtx_path_initial_settings(xtx_path_initial_settings) ,
		.xtx_path_optimal(xtx_path_optimal) ,
		.xtx_path_pma_tx_divclk_hz(xtx_path_pma_tx_divclk_hz_string) ,
		.xtx_path_prot_mode(xtx_path_prot_mode) ,
		.xtx_path_sup_mode(xtx_path_sup_mode) ,
		.xtx_path_swing_level(xtx_path_swing_level) ,
		.xtx_path_tx_pll_clk_hz(xtx_path_tx_pll_clk_hz)

	)
	twentynm_hssi_pma_tx_buf_encrypted_inst (

		.avmmaddress(avmmaddress),
		.avmmclk(avmmclk),
		.avmmread(avmmread),
		.avmmrstn(avmmrstn),
		.avmmwrite(avmmwrite),
		.avmmwritedata(avmmwritedata),
		.bsmode(bsmode),
		.bsoeb(bsoeb),
		.bstxn_in(bstxn_in),
		.bstxp_in(bstxp_in),
		.clk0_tx((silicon_rev == "20nm5es") ? clk180_tx : clk0_tx),
		.clk180_tx((silicon_rev == "20nm5es") ? clk0_tx  : clk180_tx),
		.clk_dcd(clk_dcd),
		.clksn(clksn),
		.clksp(clksp),
		.cr_rdynamic_sw(cr_rdynamic_sw),
		.i_coeff(i_coeff),
		.oe(oe),
		.oeb(oeb),
		.oo(oo),
		.oob(oob),
		.pcie_sw_master(pcie_sw_master),
		.rx_det_clk(rx_det_clk),
		.rx_n_bidir_in(rx_n_bidir_in),
		.rx_p_bidir_in(rx_p_bidir_in),
		.s_lpbk_b(s_lpbk_b),
		.tx50(tx50),
		.tx_det_rx(tx_det_rx),
		.tx_elec_idle(tx_elec_idle),
		.tx_qpi_pulldn(tx_qpi_pulldn),
		.tx_qpi_pullup(tx_qpi_pullup),
		.tx_rlpbk(tx_rlpbk),
		.vrlpbkn(vrlpbkn),
		.vrlpbkn_1t(vrlpbkn_1t),
		.vrlpbkp(vrlpbkp),
		.vrlpbkp_1t(vrlpbkp_1t),
		.avmmreaddata(avmmreaddata),
		.blockselect(blockselect),
		.atbsel(atbsel),
		.ckn(ckn),
		.ckp(ckp),
		.dcd_out1(dcd_out1),
		.dcd_out2(dcd_out2),
		.dcd_out_ready(dcd_out_ready),
		.detect_on(detect_on),
		.lbvon(lbvon),
		.lbvop(lbvop),
		.rx_detect_valid(rx_detect_valid),
		.rx_found(rx_found),
		.rx_found_pcie_spl_test(rx_found_pcie_spl_test),
		.sel_vreg(sel_vreg),
		.spl_clk_test(spl_clk_test),
		.tx_dftout(tx_dftout),
		.vlptxn(vlptxn),
		.vlptxp(vlptxp),
		.von(von),
		.vop(vop)

	);

endmodule
// -----------------------------------------------------------
// This is auto-generated HSSI Simulation Atom Model Encryption Wrapper
// Module Name : work/twentynm_hssi_pma_tx_cgb_wrapper.v
// -----------------------------------------------------------

`timescale 1 ps/1 ps

module twentynm_hssi_pma_tx_cgb
#(
	// Parameter declaration and default value assignment

	parameter enable_debug_info = "true",	//Valid values: false|true; this is simulation-only parameter, for debug purpose only

	parameter	bitslip_enable = "enable_bitslip" ,		//Valid values: disable_bitslip enable_bitslip 
	parameter	bonding_mode = "x1_non_bonded" ,		//Valid values: x1_non_bonded x1_reset_bonded x6_xn_bonded xn_non_bonded 
	parameter	bonding_reset_enable = "allow_bonding_reset" ,		//Valid values: disallow_bonding_reset allow_bonding_reset 
	parameter	cgb_power_down = "power_down_cgb" ,		//Valid values: normal_cgb power_down_cgb 
	parameter	datarate = "0 bps" ,		//Valid values:  
	parameter	dprio_cgb_vreg_boost = "no_voltage_boost" ,		//Valid values: no_voltage_boost boost_1_step boost_2_step boost_3_step boost_4_step boost_5_step boost_6_step boost_7_step 
	parameter	initial_settings = "false" ,		//Valid values: false true 
	parameter	input_select_gen3 = "unused" ,		//Valid values: lcpll_bot lcpll_top fpll_bot fpll_top cdr_txpll_b cdr_txpll_t same_ch_txpll lcpll_hs hfclk_xn_up hfclk_x6_dn hfclk_xn_dn hfclk_x6_up unused 
	parameter	input_select_x1 = "unused" ,		//Valid values: lcpll_bot lcpll_top fpll_bot fpll_top cdr_txpll_b cdr_txpll_t same_ch_txpll lcpll_hs hfclk_xn_up hfclk_x6_dn hfclk_xn_dn hfclk_x6_up unused 
	parameter	input_select_xn = "unused" ,		//Valid values: sel_xn_up sel_xn_dn sel_x6_up sel_x6_dn sel_cgb_loc unused 
	parameter	observe_cgb_clocks = "observe_nothing" ,		//Valid values: observe_nothing observe_x1mux_out observe_cpulseout_bus 
	parameter	pcie_gen3_bitwidth = "pciegen3_wide" ,		//Valid values: pciegen3_wide pciegen3_narrow 
	parameter	prot_mode = "basic_tx" ,		//Valid values: unused basic_tx pcie_gen1_tx pcie_gen2_tx pcie_gen3_tx pcie_gen4_tx qpi_tx gpon_tx sata_tx 
	parameter	scratch0_x1_clock_src = "unused" ,		//Valid values: lcpll_bot lcpll_top fpll_bot fpll_top cdr_txpll_b cdr_txpll_t same_ch_txpll lcpll_hs hfclk_xn_up hfclk_x6_dn hfclk_xn_dn hfclk_x6_up unused 
	parameter	scratch1_x1_clock_src = "unused" ,		//Valid values: lcpll_bot lcpll_top fpll_bot fpll_top cdr_txpll_b cdr_txpll_t same_ch_txpll lcpll_hs hfclk_xn_up hfclk_x6_dn hfclk_xn_dn hfclk_x6_up unused 
	parameter	scratch2_x1_clock_src = "unused" ,		//Valid values: lcpll_bot lcpll_top fpll_bot fpll_top cdr_txpll_b cdr_txpll_t same_ch_txpll lcpll_hs hfclk_xn_up hfclk_x6_dn hfclk_xn_dn hfclk_x6_up unused 
	parameter	scratch3_x1_clock_src = "unused" ,		//Valid values: lcpll_bot lcpll_top fpll_bot fpll_top cdr_txpll_b cdr_txpll_t same_ch_txpll lcpll_hs hfclk_xn_up hfclk_x6_dn hfclk_xn_dn hfclk_x6_up unused 
	parameter	select_done_master_or_slave = "choose_slave_pcie_sw_done" ,		//Valid values: choose_master_pcie_sw_done choose_slave_pcie_sw_done 
	parameter	ser_mode = "eight_bit" ,		//Valid values: eight_bit ten_bit sixteen_bit twenty_bit thirty_two_bit forty_bit sixty_four_bit 
	parameter	ser_powerdown = "normal_poweron_ser" ,		//Valid values: powerdown_ser normal_poweron_ser 
	parameter	silicon_rev = "20nm5es" ,		//Valid values: 20nm5es 20nm5es2 20nm4es 20nm4es2 20nm5 20nm4 20nm3 20nm2 20nm1 
	parameter	sup_mode = "user_mode" ,		//Valid values: user_mode engineering_mode 
	parameter	tx_ucontrol_en = "disable" ,		//Valid values: disable enable 
	parameter	tx_ucontrol_pcie = "gen1" ,		//Valid values: gen1 gen2 gen3 gen4 
	parameter	tx_ucontrol_reset = "disable" ,		//Valid values: disable enable 
	parameter	vccdreg_output = "vccdreg_nominal" ,		//Valid values: vccdreg_nominal vccdreg_pos_setting1 vccdreg_pos_setting2 vccdreg_pos_setting3 vccdreg_pos_setting4 vccdreg_pos_setting5 vccdreg_pos_setting6 vccdreg_pos_setting7 vccdreg_pos_setting8 vccdreg_pos_setting9 vccdreg_pos_setting10 vccdreg_pos_setting11 vccdreg_pos_setting12 vccdreg_pos_setting13 vccdreg_pos_setting14 vccdreg_pos_setting15 vccdreg_pos_setting16 vccdreg_pos_setting17 vccdreg_pos_setting18 vccdreg_pos_setting19 vccdreg_pos_setting20 vccdreg_pos_setting21 vccdreg_pos_setting22 vccdreg_pos_setting23 vccdreg_pos_setting24 vccdreg_pos_setting25 vccdreg_pos_setting26 vccdreg_pos_setting27 vccdreg_neg_setting1 vccdreg_neg_setting2 vccdreg_neg_setting3 vccdreg_neg_setting4 
	parameter	x1_clock_source_sel = "cdr_txpll_t" ,		//Valid values: lcpll_bot lcpll_top fpll_bot fpll_top cdr_txpll_b cdr_txpll_t same_ch_txpll lcpll_hs lcpll_bot_g1_g2 lcpll_top_g1_g2 fpll_bot_g1_g2 fpll_top_g1_g2 fpll_bot_g2_lcpll_bot_g3 fpll_bot_g2_lcpll_top_g3 fpll_top_g2_lcpll_bot_g3 fpll_top_g2_lcpll_top_g3 xn_non_bonding 
	parameter	x1_div_m_sel = "divbypass" ,		//Valid values: divbypass divby2 divby4 divby8 
	parameter	xn_clock_source_sel = "sel_xn_up"		//Valid values: sel_xn_up sel_xn_dn sel_x6_top sel_x6_bot sel_cgb_loc 
)

(
	//Port declaration

	input	[8:0]  avmmaddress ,
	input	avmmclk ,
	input	avmmread ,
	input	avmmrstn ,
	input	avmmwrite ,
	input	[7:0]  avmmwritedata ,
	input	ckdccn ,
	input	ckdccp ,
	input	clk_cdr_b ,
	input	clk_cdr_direct ,
	input	clk_cdr_t ,
	input	clk_fpll_b ,
	input	clk_fpll_t ,
	input	clk_lc_b ,
	input	clk_lc_hs ,
	input	clk_lc_t ,
	input	clkb_cdr_b ,
	input	clkb_cdr_direct ,
	input	clkb_cdr_t ,
	input	clkb_fpll_b ,
	input	clkb_fpll_t ,
	input	clkb_lc_b ,
	input	clkb_lc_hs ,
	input	clkb_lc_t ,
	input	[5:0]  cpulse_x6_dn_bus ,
	input	[5:0]  cpulse_x6_up_bus ,
	input	[5:0]  cpulse_xn_dn_bus ,
	input	[5:0]  cpulse_xn_up_bus ,
	input	[1:0]  pcie_sw ,
	input	[1:0]  pcie_sw_done_master ,
	input	tx_bitslip ,
	input	tx_bonding_rstb ,
	input	tx_pma_rstb ,

	output	[7:0]  avmmreaddata ,
	output	blockselect ,
	output	bitslipstate ,
	output	[5:0]  cpulse_out_bus ,
	output	div2 ,
	output	div4 ,
	output	div5 ,
	output	hifreqclkn ,
	output	hifreqclkp ,
	output	[1:0]  pcie_sw_done ,
	output	[1:0]  pcie_sw_master ,
	output	rstb 

);


	twentynm_hssi_pma_tx_cgb_encrypted
	#(
		.enable_debug_info(enable_debug_info) ,

		.bitslip_enable(bitslip_enable) ,
		.bonding_mode(bonding_mode) ,
		.bonding_reset_enable(bonding_reset_enable) ,
		.cgb_power_down(cgb_power_down) ,
		.datarate(datarate) ,
		.dprio_cgb_vreg_boost(dprio_cgb_vreg_boost) ,
		.initial_settings(initial_settings) ,
		.input_select_gen3(input_select_gen3) ,
		.input_select_x1(input_select_x1) ,
		.input_select_xn(input_select_xn) ,
		.observe_cgb_clocks(observe_cgb_clocks) ,
		.pcie_gen3_bitwidth(pcie_gen3_bitwidth) ,
		.prot_mode(prot_mode) ,
		.scratch0_x1_clock_src(scratch0_x1_clock_src) ,
		.scratch1_x1_clock_src(scratch1_x1_clock_src) ,
		.scratch2_x1_clock_src(scratch2_x1_clock_src) ,
		.scratch3_x1_clock_src(scratch3_x1_clock_src) ,
		.select_done_master_or_slave(select_done_master_or_slave) ,
		.ser_mode(ser_mode) ,
		.ser_powerdown(ser_powerdown) ,
		.silicon_rev(silicon_rev) ,
		.sup_mode(sup_mode) ,
		.tx_ucontrol_en(tx_ucontrol_en) ,
		.tx_ucontrol_pcie(tx_ucontrol_pcie) ,
		.tx_ucontrol_reset(tx_ucontrol_reset) ,
		.vccdreg_output(vccdreg_output) ,
		.x1_clock_source_sel(x1_clock_source_sel) ,
		.x1_div_m_sel(x1_div_m_sel) ,
		.xn_clock_source_sel(xn_clock_source_sel)

	)
	twentynm_hssi_pma_tx_cgb_encrypted_inst (

		.avmmaddress(avmmaddress),
		.avmmclk(avmmclk),
		.avmmread(avmmread),
		.avmmrstn(avmmrstn),
		.avmmwrite(avmmwrite),
		.avmmwritedata(avmmwritedata),
		.ckdccn(ckdccn),
		.ckdccp(ckdccp),
		.clk_cdr_b(clk_cdr_b),
		.clk_cdr_direct(clk_cdr_direct),
		.clk_cdr_t(clk_cdr_t),
		.clk_fpll_b(clk_fpll_b),
		.clk_fpll_t(clk_fpll_t),
		.clk_lc_b(clk_lc_b),
		.clk_lc_hs(clk_lc_hs),
		.clk_lc_t(clk_lc_t),
		.clkb_cdr_b(clkb_cdr_b),
		.clkb_cdr_direct(clkb_cdr_direct),
		.clkb_cdr_t(clkb_cdr_t),
		.clkb_fpll_b(clkb_fpll_b),
		.clkb_fpll_t(clkb_fpll_t),
		.clkb_lc_b(clkb_lc_b),
		.clkb_lc_hs(clkb_lc_hs),
		.clkb_lc_t(clkb_lc_t),
		.cpulse_x6_dn_bus(cpulse_x6_dn_bus),
		.cpulse_x6_up_bus(cpulse_x6_up_bus),
		.cpulse_xn_dn_bus(cpulse_xn_dn_bus),
		.cpulse_xn_up_bus(cpulse_xn_up_bus),
		.pcie_sw(pcie_sw),
		.pcie_sw_done_master(pcie_sw_done_master),
		.tx_bitslip(tx_bitslip),
		.tx_bonding_rstb(tx_bonding_rstb),
		.tx_pma_rstb(tx_pma_rstb),
		.avmmreaddata(avmmreaddata),
		.blockselect(blockselect),
		.bitslipstate(bitslipstate),
		.cpulse_out_bus(cpulse_out_bus),
		.div2(div2),
		.div4(div4),
		.div5(div5),
		.hifreqclkn(hifreqclkn),
		.hifreqclkp(hifreqclkp),
		.pcie_sw_done(pcie_sw_done),
		.pcie_sw_master(pcie_sw_master),
		.rstb(rstb)

	);

endmodule
// -----------------------------------------------------------
// This is auto-generated HSSI Simulation Atom Model Encryption Wrapper
// Module Name : work/twentynm_hssi_pma_tx_ser_wrapper.v
// -----------------------------------------------------------

`timescale 1 ps/1 ps

module twentynm_hssi_pma_tx_ser
#(
	// Parameter declaration and default value assignment

	parameter enable_debug_info = "true",	//Valid values: false|true; this is simulation-only parameter, for debug purpose only

	parameter	bonding_mode = "x1_non_bonded" ,		//Valid values: x1_non_bonded x1_reset_bonded x6_xn_bonded xn_non_bonded 
	parameter	clk_divtx_deskew = "deskew_delay8" ,		//Valid values: deskew_delay0 deskew_delay1 deskew_delay2 deskew_delay3 deskew_delay4 deskew_delay5 deskew_delay6 deskew_delay7 deskew_delay8 deskew_delay9 deskew_delay10 deskew_delay11 deskew_delay12 deskew_delay13 deskew_delay14 deskew_delay15 
	parameter	control_clk_divtx = "no_dft_control_clkdivtx" ,		//Valid values: no_dft_control_clkdivtx dft_control_clkdivtx_high dft_control_clkdivtx_low 
	parameter	duty_cycle_correction_mode_ctrl = "dcc_disable" ,		//Valid values: dcc_disable dcc_0000011111 dcc_1111100000 dcc_continuous 
	parameter	initial_settings = "false" ,		//Valid values: false true 
	parameter	prot_mode = "basic_tx" ,		//Valid values: unused basic_tx pcie_gen1_tx pcie_gen2_tx pcie_gen3_tx pcie_gen4_tx qpi_tx gpon_tx sata_tx 
	parameter	ser_clk_divtx_user_sel = "divtx_user_33" ,		//Valid values: divtx_user_2 divtx_user_40 divtx_user_33 divtx_user_66 divtx_user_1 divtx_user_off 
	parameter	ser_clk_mon = "disable_clk_mon" ,		//Valid values: disable_clk_mon enable_clk_mon_1010 enable_clk_mon_0101 
	parameter	ser_powerdown = "normal_poweron_ser" ,		//Valid values: powerdown_ser normal_poweron_ser 
	parameter	silicon_rev = "20nm5es" ,		//Valid values: 20nm5es 20nm5es2 20nm4es 20nm4es2 20nm5 20nm4 20nm3 20nm2 20nm1 
	parameter	sup_mode = "user_mode"		//Valid values: user_mode engineering_mode 
)

(
	//Port declaration

	input	[8:0]  avmmaddress ,
	input	avmmclk ,
	input	avmmread ,
	input	avmmrstn ,
	input	avmmwrite ,
	input	[7:0]  avmmwritedata ,
	input	bitslipstate ,
	input	cpulse ,
	input	[63:0]  data ,
	input	hfclkn ,
	input	hfclkp ,
	input	lfclk ,
	input	lfclk2 ,
	input	paraclk ,
	input	rser_div2 ,
	input	rser_div4 ,
	input	rser_div5 ,
	input	rst_n ,

	output	[7:0]  avmmreaddata ,
	output	blockselect ,
	output	ckdrvn ,
	output	ckdrvp ,
	output	clk_divtx ,
	output	clk_divtx_user ,
	output	oe ,
	output	oeb ,
	output	oo ,
	output	oob 

);


	twentynm_hssi_pma_tx_ser_encrypted
	#(
		.enable_debug_info(enable_debug_info) ,

		.bonding_mode(bonding_mode) ,
		.clk_divtx_deskew(clk_divtx_deskew) ,
		.control_clk_divtx(control_clk_divtx) ,
		.duty_cycle_correction_mode_ctrl(duty_cycle_correction_mode_ctrl) ,
		.initial_settings(initial_settings) ,
		.prot_mode(prot_mode) ,
		.ser_clk_divtx_user_sel(ser_clk_divtx_user_sel) ,
		.ser_clk_mon(ser_clk_mon) ,
		.ser_powerdown(ser_powerdown) ,
		.silicon_rev(silicon_rev) ,
		.sup_mode(sup_mode)

	)
	twentynm_hssi_pma_tx_ser_encrypted_inst (

		.avmmaddress(avmmaddress),
		.avmmclk(avmmclk),
		.avmmread(avmmread),
		.avmmrstn(avmmrstn),
		.avmmwrite(avmmwrite),
		.avmmwritedata(avmmwritedata),
		.bitslipstate(bitslipstate),
		.cpulse(cpulse),
		.data(data),
		.hfclkn(hfclkn),
		.hfclkp(hfclkp),
		.lfclk(lfclk),
		.lfclk2(lfclk2),
		.paraclk(paraclk),
		.rser_div2(rser_div2),
		.rser_div4(rser_div4),
		.rser_div5(rser_div5),
		.rst_n(rst_n),
		.avmmreaddata(avmmreaddata),
		.blockselect(blockselect),
		.ckdrvn(ckdrvn),
		.ckdrvp(ckdrvp),
		.clk_divtx(clk_divtx),
		.clk_divtx_user(clk_divtx_user),
		.oe(oe),
		.oeb(oeb),
		.oo(oo),
		.oob(oob)

	);

endmodule
// -----------------------------------------------------------
// This is auto-generated HSSI Simulation Atom Model Encryption Wrapper
// Module Name : work/twentynm_hssi_pma_uc_wrapper.v
// -----------------------------------------------------------

`timescale 1 ps/1 ps

module twentynm_hssi_pma_uc
#(
	// Parameter declaration and default value assignment

	parameter enable_debug_info = "true",	//Valid values: false|true; this is simulation-only parameter, for debug purpose only

	parameter	a_break_vector_word_addr = 16'b0000000000001000 ,		//Valid values: 16 
	parameter	a_exception_vector_word_addr = 16'b0000000000001000 ,		//Valid values: 16 
	parameter	a_reset_vector_word_addr = 16'b0000000000000000 ,		//Valid values: 16 
	parameter	cal_mode = "cal_en" ,		//Valid values: cal_en cal_dis 
	parameter	pm_uc_aux_base_addr = 8'b00000000 ,		//Valid values: 8 
	parameter	pm_uc_cal_clk_div = 5'b00100 ,		//Valid values: 5 
	parameter	pm_uc_cal_clk_inv = "disable_inv" ,		//Valid values: disable_inv enable_inv 
	parameter	pm_uc_cal_clk_ph = 5'b00010 ,		//Valid values: 5 
	parameter	pm_uc_clkdiv_sel = "div2" ,		//Valid values: bypass div2 div4 
	parameter	pm_uc_clksel_core = "disable_core_clk" ,		//Valid values: disable_core_clk enable_core_clk 
	parameter	pm_uc_clksel_osc = "cb_clkusr" ,		//Valid values: cb_clkusr cb_intosc 
	parameter	pm_uc_core_jtg_rst_disable = "disable_jtg_rst" ,		//Valid values: enable_jtg_rst disable_jtg_rst 
	parameter	pm_uc_core_sys_rst_disable = "disable_core_rst" ,		//Valid values: enable_core_rst disable_core_rst 
	parameter	pm_uc_ecc_rst_disable = "enable_ecc_rst" ,		//Valid values: enable_ecc_rst disable_ecc_rst 
	parameter	pm_uc_engg_opt = "reserved" ,		//Valid values: 7 reserved 
	parameter	pm_uc_family_device_info = 24'b000000000000000000000000 ,		//Valid values: 24 
	parameter	pm_uc_hssi_base_addr = 8'b00000001 ,		//Valid values: 8 
	parameter	pm_uc_pcs_dft_out = 10'b0000000000 ,		//Valid values: 10 
	parameter	pm_uc_pcs_dft_sel = "disable_pcs_dft" ,		//Valid values: disable_pcs_dft enable_pcs_dft 
	parameter	pm_uc_pcs_rd_lat = 3'b010 ,		//Valid values: 3 
	parameter	pm_uc_pcs_slave_count = 8'b00000000 ,		//Valid values: 8 
	parameter	pm_uc_ram = 38'b00000000000000000000000000000000000000 ,		//Valid values: 
	parameter	pm_uc_rmw_dis = "enable_rmw" ,		//Valid values: enable_rmw disable_rmw 
	parameter	pm_uc_soft_nios = "disable_soft" ,		//Valid values: disable_soft enable_soft 
	parameter	pm_uc_sys_enable = "enable_sys" ,		//Valid values: disable_sys enable_sys 
	parameter	pmu_cal_bin_fname = "nf_hssi_cal_v10.hex'" ,		//Valid values:  
	parameter	pmu_qparam_fname = "nf_qparam_nf1.hex'" ,		//Valid values:  
	parameter	powerdown_mode = "powerdown" ,		//Valid values: powerup powerdown 
	parameter	silicon_rev = "20nm5es" ,		//Valid values: 20nm5es 20nm5es2 20nm4es 20nm4es2 20nm5 20nm4 20nm3 20nm2 20nm1 
	parameter	sup_mode = "user_mode"		//Valid values: user_mode engineering_mode 
)

(
	//Port declaration

	input	cb_clkusr ,
	input	cb_intosc ,
	input	core_avl_clk ,
	input	[31:0]  core_avl_readdata ,
	input	core_avl_readdatavalid ,
	input	core_avl_rst_n ,
	input	core_avl_waitrequest ,
	input	[7:0]  core_interrupt_in ,
	input	core_uc_rst_n ,
	input	dbg_dfx_clk ,
	input	[3:0]  dbg_dfx_sel ,
	input	dbg_jtg_cdr ,
	input	[1:0]  dbg_jtg_ir_in ,
	input	dbg_jtg_rti ,
	input	dbg_jtg_sdr ,
	input	dbg_jtg_tck ,
	input	dbg_jtg_tdi ,
	input	dbg_jtg_udr ,
	input	dbg_jtg_uir ,
	input	[3:0]  dft_clk ,
	input	partial_reconfig ,
	input	[19:0]  soft_nios_addr ,
	input	soft_nios_clk ,
	input	soft_nios_read ,
	input	soft_nios_write ,
	input	[7:0]  soft_nios_writedata ,

	output	[15:0]  core_avl_addr ,
	output	core_avl_burstcount ,
	output	[3:0]  core_avl_byteenable ,
	output	core_avl_debugaccess ,
	output	core_avl_read ,
	output	core_avl_write ,
	output	[31:0]  core_avl_writedata ,
	output	[7:0]  core_interrupt_out ,
	output	[15:0]  dbg_dfx_out ,
	output	[1:0]  dbg_jtg_ir_out ,
	output	dbg_jtg_tdo ,
	output	dft_flag_down ,
	output	dft_flag_up ,
	output	[7:0]  soft_nios_readdata 

);

// Function to convert a 64bit binary to a string.
function [128*8-1 : 0] m_bin_to_str;
	input [128 : 1]   s;
	reg   [128 : 1]   reg_s;
	reg   [7 : 0]    tmp;
	reg   [128*8 : 1] res;
	integer m, index;

	begin
		reg_s = s;
		res = 128'h00000000000000000000000000000000;

		for (m = 128; m > 0; m = m-1 )
		begin
			tmp = reg_s[128];
			res[(((m-1)*8)+1)] = tmp & 1'b1;
			reg_s = reg_s << 1;
		end

		m_bin_to_str = res;
	end
endfunction

localparam [8*128-1 : 0] pm_uc_ram_string	= m_bin_to_str(pm_uc_ram);


	twentynm_hssi_pma_uc_encrypted
	#(
		.enable_debug_info(enable_debug_info) ,

		.a_break_vector_word_addr(a_break_vector_word_addr) ,
		.a_exception_vector_word_addr(a_exception_vector_word_addr) ,
		.a_reset_vector_word_addr(a_reset_vector_word_addr) ,
		.cal_mode(cal_mode) ,
		.pm_uc_aux_base_addr(pm_uc_aux_base_addr) ,
		.pm_uc_cal_clk_div(pm_uc_cal_clk_div) ,
		.pm_uc_cal_clk_inv(pm_uc_cal_clk_inv) ,
		.pm_uc_cal_clk_ph(pm_uc_cal_clk_ph) ,
		.pm_uc_clkdiv_sel(pm_uc_clkdiv_sel) ,
		.pm_uc_clksel_core(pm_uc_clksel_core) ,
		.pm_uc_clksel_osc(pm_uc_clksel_osc) ,
		.pm_uc_core_jtg_rst_disable(pm_uc_core_jtg_rst_disable) ,
		.pm_uc_core_sys_rst_disable(pm_uc_core_sys_rst_disable) ,
		.pm_uc_ecc_rst_disable(pm_uc_ecc_rst_disable) ,
		.pm_uc_engg_opt(pm_uc_engg_opt) ,
		.pm_uc_family_device_info(pm_uc_family_device_info) ,
		.pm_uc_hssi_base_addr(pm_uc_hssi_base_addr) ,
		.pm_uc_pcs_dft_out(pm_uc_pcs_dft_out) ,
		.pm_uc_pcs_dft_sel(pm_uc_pcs_dft_sel) ,
		.pm_uc_pcs_rd_lat(pm_uc_pcs_rd_lat) ,
		.pm_uc_pcs_slave_count(pm_uc_pcs_slave_count) ,
		.pm_uc_ram(pm_uc_ram_string) ,
		.pm_uc_rmw_dis(pm_uc_rmw_dis) ,
		.pm_uc_soft_nios(pm_uc_soft_nios) ,
		.pm_uc_sys_enable(pm_uc_sys_enable) ,
		.pmu_cal_bin_fname(pmu_cal_bin_fname) ,
		.pmu_qparam_fname(pmu_qparam_fname) ,
		.powerdown_mode(powerdown_mode) ,
		.silicon_rev(silicon_rev) ,
		.sup_mode(sup_mode)

	)
	twentynm_hssi_pma_uc_encrypted_inst (

		.cb_clkusr(cb_clkusr),
		.cb_intosc(cb_intosc),
		.core_avl_clk(core_avl_clk),
		.core_avl_readdata(core_avl_readdata),
		.core_avl_readdatavalid(core_avl_readdatavalid),
		.core_avl_rst_n(core_avl_rst_n),
		.core_avl_waitrequest(core_avl_waitrequest),
		.core_interrupt_in(core_interrupt_in),
		.core_uc_rst_n(core_uc_rst_n),
		.dbg_dfx_clk(dbg_dfx_clk),
		.dbg_dfx_sel(dbg_dfx_sel),
		.dbg_jtg_cdr(dbg_jtg_cdr),
		.dbg_jtg_ir_in(dbg_jtg_ir_in),
		.dbg_jtg_rti(dbg_jtg_rti),
		.dbg_jtg_sdr(dbg_jtg_sdr),
		.dbg_jtg_tck(dbg_jtg_tck),
		.dbg_jtg_tdi(dbg_jtg_tdi),
		.dbg_jtg_udr(dbg_jtg_udr),
		.dbg_jtg_uir(dbg_jtg_uir),
		.dft_clk(dft_clk),
		.partial_reconfig(partial_reconfig),
		.soft_nios_addr(soft_nios_addr),
		.soft_nios_clk(soft_nios_clk),
		.soft_nios_read(soft_nios_read),
		.soft_nios_write(soft_nios_write),
		.soft_nios_writedata(soft_nios_writedata),
		.core_avl_addr(core_avl_addr),
		.core_avl_burstcount(core_avl_burstcount),
		.core_avl_byteenable(core_avl_byteenable),
		.core_avl_debugaccess(core_avl_debugaccess),
		.core_avl_read(core_avl_read),
		.core_avl_write(core_avl_write),
		.core_avl_writedata(core_avl_writedata),
		.core_interrupt_out(core_interrupt_out),
		.dbg_dfx_out(dbg_dfx_out),
		.dbg_jtg_ir_out(dbg_jtg_ir_out),
		.dbg_jtg_tdo(dbg_jtg_tdo),
		.dft_flag_down(dft_flag_down),
		.dft_flag_up(dft_flag_up),
		.soft_nios_readdata(soft_nios_readdata)

	);

endmodule
// -----------------------------------------------------------
// This is auto-generated HSSI Simulation Atom Model Encryption Wrapper
// Module Name : work/twentynm_hssi_refclk_divider_wrapper.v
// -----------------------------------------------------------

`timescale 1 ps/1 ps

module twentynm_hssi_refclk_divider
#(
	// Parameter declaration and default value assignment

	parameter enable_debug_info = "true",	//Valid values: false|true; this is simulation-only parameter, for debug purpose only

	parameter	clk_divider = "div2_off" ,		//Valid values: div2_off div2_on 
	parameter	clkbuf_sel = "high_vcm" ,		//Valid values: high_vcm low_vcm 
	parameter	core_clk_lvpecl = "core_clk_lvpecl_off" ,		//Valid values: core_clk_lvpecl_off core_clk_lvpecl_on 
	parameter	enable_lvpecl = "lvpecl_enable" ,		//Valid values: lvpecl_enable lvpecl_disable 
	parameter	iostandard = "lvpecl" ,		//Valid values: hcsl lvpecl cml lvds 
	parameter	optimal = "true" ,		//Valid values: false true 
	parameter	powerdown_mode = "powerup" ,		//Valid values: powerup powerdown 
	parameter	sel_pldclk = "iqclk_sel_lvpecl" ,		//Valid values: iqclk_sel_lvpecl iqclk_sel_pldclk 
	parameter	silicon_rev = "20nm5es" ,		//Valid values: 20nm5es 20nm5es2 20nm4es 20nm4es2 20nm5 20nm4 20nm3 20nm2 20nm1 
	parameter	sup_mode = "user_mode" ,		//Valid values: user_mode engineering_mode 
	parameter	term_tristate = "tristate_off" ,		//Valid values: tristate_off tristate_on 
	parameter	vcm_pup = "pup_off"		//Valid values: pup_off pup_on 
)

(
	//Port declaration

	input	[8:0]  avmmaddress ,
	input	avmmclk ,
	input	avmmread ,
	input	avmmrstn ,
	input	avmmwrite ,
	input	[7:0]  avmmwritedata ,
	input	ac_mode ,
	input	atb_0_bidir_in ,
	input	atb_1_bidir_in ,
	input	atbsel_lvpecl ,
	input	[5:0]  clkbuf_b50 ,
	input	highz ,
	input	hotsckt ,
	input	mem_init ,
	input	mode ,
	input	pldclk ,
	input	refclk_inn ,
	input	refclk_inp ,
	input	refclk_n ,
	input	refclk_p ,
	input	[1:0]  rjdrv_sel ,
	input	rjhys_sel ,
	input	rjtaglp ,
	input	vlprxn ,
	input	vlprxp ,

	output	[7:0]  avmmreaddata ,
	output	blockselect ,
	output	bsrefclkn ,
	output	bsrefclkp ,
	output	refclk_a 

);


	twentynm_hssi_refclk_divider_encrypted
	#(
		.enable_debug_info(enable_debug_info) ,

		.clk_divider(clk_divider) ,
		.clkbuf_sel(clkbuf_sel) ,
		.core_clk_lvpecl(core_clk_lvpecl) ,
		.enable_lvpecl(enable_lvpecl) ,
		.iostandard(iostandard) ,
		.optimal(optimal) ,
		.powerdown_mode(powerdown_mode) ,
		.sel_pldclk(sel_pldclk) ,
		.silicon_rev(silicon_rev) ,
		.sup_mode(sup_mode) ,
		.term_tristate(term_tristate) ,
		.vcm_pup(vcm_pup)

	)
	twentynm_hssi_refclk_divider_encrypted_inst (

		.avmmaddress(avmmaddress),
		.avmmclk(avmmclk),
		.avmmread(avmmread),
		.avmmrstn(avmmrstn),
		.avmmwrite(avmmwrite),
		.avmmwritedata(avmmwritedata),
		.ac_mode(ac_mode),
		.atb_0_bidir_in(atb_0_bidir_in),
		.atb_1_bidir_in(atb_1_bidir_in),
		.atbsel_lvpecl(atbsel_lvpecl),
		.clkbuf_b50(clkbuf_b50),
		.highz(highz),
		.hotsckt(hotsckt),
		.mem_init(mem_init),
		.mode(mode),
		.pldclk(pldclk),
		.refclk_inn(refclk_inn),
		.refclk_inp(refclk_inp),
		.refclk_n(refclk_n),
		.refclk_p(refclk_p),
		.rjdrv_sel(rjdrv_sel),
		.rjhys_sel(rjhys_sel),
		.rjtaglp(rjtaglp),
		.vlprxn(vlprxn),
		.vlprxp(vlprxp),
		.avmmreaddata(avmmreaddata),
		.blockselect(blockselect),
		.bsrefclkn(bsrefclkn),
		.bsrefclkp(bsrefclkp),
		.refclk_a(refclk_a)

	);

endmodule
// -----------------------------------------------------------
// This is auto-generated HSSI Simulation Atom Model Encryption Wrapper
// Module Name : work/twentynm_hssi_rx_pcs_pma_interface_wrapper.v
// -----------------------------------------------------------

`timescale 1 ps/1 ps

module twentynm_hssi_rx_pcs_pma_interface
#(
	// Parameter declaration and default value assignment

	parameter enable_debug_info = "true",	//Valid values: false|true; this is simulation-only parameter, for debug purpose only

	parameter	block_sel = "eight_g_pcs" ,		//Valid values: eight_g_pcs ten_g_pcs direct_pld 
	parameter	channel_operation_mode = "tx_rx_pair_enabled" ,		//Valid values: tx_rx_pair_enabled tx_rx_independent 
	parameter	clkslip_sel = "pld" ,		//Valid values: pld slip_eight_g_pcs 
	parameter	lpbk_en = "disable" ,		//Valid values: disable enable 
	parameter	master_clk_sel = "master_rx_pma_clk" ,		//Valid values: master_rx_pma_clk master_tx_pma_clk master_refclk_dig 
	parameter	pldif_datawidth_mode = "pldif_data_10bit" ,		//Valid values: pldif_data_10bit pldif_data_8bit 
	parameter	pma_dw_rx = "pma_8b_rx" ,		//Valid values: pma_8b_rx pma_10b_rx pma_16b_rx pma_20b_rx pma_32b_rx pma_40b_rx pma_64b_rx pcie_g3_dyn_dw_rx 
	parameter	pma_if_dft_en = "dft_dis" ,		//Valid values: dft_dis dft_en 
	parameter	pma_if_dft_val = "dft_0" ,		//Valid values: dft_0 dft_1 
	parameter	prbs9_dwidth = "prbs9_64b" ,		//Valid values: prbs9_64b prbs9_10b 
	parameter	prbs_clken = "prbs_clk_dis" ,		//Valid values: prbs_clk_dis prbs_clk_en 
	parameter	prbs_ver = "prbs_off" ,		//Valid values: prbs_off prbs_31 prbs_15 prbs_23 prbs_9 prbs_7 
	parameter	prot_mode_rx = "disabled_prot_mode_rx" ,		//Valid values: disabled_prot_mode_rx pcs_direct_mode_rx eightg_only_pld_mode_rx eightg_pcie_g12_pld_mode_rx eightg_g3_pcie_g3_pld_mode_rx eightg_pcie_g12_hip_mode_rx eightg_g3_pcie_g3_hip_mode_rx teng_krfec_mode_rx eightg_basic_mode_rx teng_basic_mode_rx teng_sfis_sdi_mode_rx prbs_mode_rx 
	parameter	reconfig_settings = "{}" ,		//Valid values:  
	parameter	rx_dyn_polarity_inversion = "rx_dyn_polinv_dis" ,		//Valid values: rx_dyn_polinv_dis rx_dyn_polinv_en 
	parameter	rx_lpbk_en = "lpbk_dis" ,		//Valid values: lpbk_dis lpbk_en 
	parameter	rx_prbs_force_signal_ok = "unforce_sig_ok" ,		//Valid values: unforce_sig_ok force_sig_ok 
	parameter	rx_prbs_mask = "prbsmask128" ,		//Valid values: prbsmask128 prbsmask256 prbsmask512 prbsmask1024 
	parameter	rx_prbs_mode = "teng_mode" ,		//Valid values: teng_mode eightg_mode 
	parameter	rx_signalok_signaldet_sel = "sel_sig_det" ,		//Valid values: sel_sig_det sel_sig_ok 
	parameter	rx_static_polarity_inversion = "rx_stat_polinv_dis" ,		//Valid values: rx_stat_polinv_dis rx_stat_polinv_en 
	parameter	rx_uhsif_lpbk_en = "uhsif_lpbk_dis" ,		//Valid values: uhsif_lpbk_dis uhsif_lpbk_en 
	parameter	silicon_rev = "20nm5es" ,		//Valid values: 20nm5es 20nm5es2 20nm4es 20nm4es2 20nm5 20nm4 20nm3 20nm2 20nm1 
	parameter	sup_mode = "user_mode"		//Valid values: user_mode engineering_mode 
)

(
	//Port declaration

	input	[8:0]  avmmaddress ,
	input	avmmclk ,
	input	avmmread ,
	input	avmmrstn ,
	input	avmmwrite ,
	input	[7:0]  avmmwritedata ,
	input	int_pmaif_10g_random_err ,
	input	int_pmaif_8g_rx_clkslip ,
	input	[5:0]  int_pmaif_pldif_eye_monitor ,
	input	int_pmaif_pldif_pmaif_rx_pld_rst_n ,
	input	int_pmaif_pldif_polinv_rx ,
	input	int_pmaif_pldif_prbs_err_clr ,
	input	int_pmaif_pldif_rx_clkslip ,
	input	int_pmaif_pldif_rxpma_rstb ,
	input	pma_rx_clkdiv_user ,
	input	pma_rx_detect_valid ,
	input	pma_rx_found ,
	input	pma_rx_pma_clk ,
	input	[63:0]  pma_rx_pma_data ,
	input	pma_rx_signal_ok ,
	input	pma_rxpll_lock ,
	input	pma_signal_det ,
	input	pma_tx_pma_clk ,
	input	refclk_dig ,
	input	scan_mode_n ,
	input	[63:0]  tx_pma_data_loopback ,
	input	[63:0]  tx_pma_uhsif_data_loopback ,

	output	[7:0]  avmmreaddata ,
	output	blockselect ,
	output	int_pmaif_10g_rx_pma_clk ,
	output	[63:0]  int_pmaif_10g_rx_pma_data ,
	output	int_pmaif_10g_signal_ok ,
	output	[19:0]  int_pmaif_8g_pudi ,
	output	int_pmaif_8g_rcvd_clk_pma ,
	output	int_pmaif_8g_rx_detect_valid ,
	output	int_pmaif_8g_rx_found ,
	output	int_pmaif_8g_sigdetni ,
	output	[31:0]  int_pmaif_g3_pma_data_in ,
	output	int_pmaif_g3_pma_rx_detect_valid ,
	output	int_pmaif_g3_pma_rx_found ,
	output	int_pmaif_g3_pma_signal_det ,
	output	int_pmaif_g3_rcvd_clk ,
	output	[63:0]  int_pmaif_krfec_rx_pma_data ,
	output	int_pmaif_krfec_rx_signal_ok_in ,
	output	int_pmaif_pldif_prbs_err ,
	output	int_pmaif_pldif_prbs_err_done ,
	output	int_pmaif_pldif_rx_clkdiv ,
	output	int_pmaif_pldif_rx_clkdiv_user ,
	output	[63:0]  int_pmaif_pldif_rx_data ,
	output	int_pmaif_pldif_rx_detect_valid ,
	output	int_pmaif_pldif_rx_found ,
	output	int_pmaif_pldif_rxpll_lock ,
	output	int_pmaif_pldif_signal_ok ,
	output	int_rx_dft_obsrv_clk ,
	output	[5:0]  pma_eye_monitor ,
	output	pma_rx_clkslip ,
	output	pma_rxpma_rstb ,
	output	prbs_err_lt ,
	output	[19:0]  rx_pmaif_test_out ,
	output	[19:0]  rx_prbs_ver_test 

);


	twentynm_hssi_rx_pcs_pma_interface_encrypted
	#(
		.enable_debug_info(enable_debug_info) ,

		.block_sel(block_sel) ,
		.channel_operation_mode(channel_operation_mode) ,
		.clkslip_sel(clkslip_sel) ,
		.lpbk_en(lpbk_en) ,
		.master_clk_sel(master_clk_sel) ,
		.pldif_datawidth_mode(pldif_datawidth_mode) ,
		.pma_dw_rx(pma_dw_rx) ,
		.pma_if_dft_en(pma_if_dft_en) ,
		.pma_if_dft_val(pma_if_dft_val) ,
		.prbs9_dwidth(prbs9_dwidth) ,
		.prbs_clken(prbs_clken) ,
		.prbs_ver(prbs_ver) ,
		.prot_mode_rx(prot_mode_rx) ,
		.reconfig_settings(reconfig_settings) ,
		.rx_dyn_polarity_inversion(rx_dyn_polarity_inversion) ,
		.rx_lpbk_en(rx_lpbk_en) ,
		.rx_prbs_force_signal_ok(rx_prbs_force_signal_ok) ,
		.rx_prbs_mask(rx_prbs_mask) ,
		.rx_prbs_mode(rx_prbs_mode) ,
		.rx_signalok_signaldet_sel(rx_signalok_signaldet_sel) ,
		.rx_static_polarity_inversion(rx_static_polarity_inversion) ,
		.rx_uhsif_lpbk_en(rx_uhsif_lpbk_en) ,
		.silicon_rev(silicon_rev) ,
		.sup_mode(sup_mode)

	)
	twentynm_hssi_rx_pcs_pma_interface_encrypted_inst (

		.avmmaddress(avmmaddress),
		.avmmclk(avmmclk),
		.avmmread(avmmread),
		.avmmrstn(avmmrstn),
		.avmmwrite(avmmwrite),
		.avmmwritedata(avmmwritedata),
		.int_pmaif_10g_random_err(int_pmaif_10g_random_err),
		.int_pmaif_8g_rx_clkslip(int_pmaif_8g_rx_clkslip),
		.int_pmaif_pldif_eye_monitor(int_pmaif_pldif_eye_monitor),
		.int_pmaif_pldif_pmaif_rx_pld_rst_n(int_pmaif_pldif_pmaif_rx_pld_rst_n),
		.int_pmaif_pldif_polinv_rx(int_pmaif_pldif_polinv_rx),
		.int_pmaif_pldif_prbs_err_clr(int_pmaif_pldif_prbs_err_clr),
		.int_pmaif_pldif_rx_clkslip(int_pmaif_pldif_rx_clkslip),
		.int_pmaif_pldif_rxpma_rstb(int_pmaif_pldif_rxpma_rstb),
		.pma_rx_clkdiv_user(pma_rx_clkdiv_user),
		.pma_rx_detect_valid(pma_rx_detect_valid),
		.pma_rx_found(pma_rx_found),
		.pma_rx_pma_clk(pma_rx_pma_clk),
		.pma_rx_pma_data(pma_rx_pma_data),
		.pma_rx_signal_ok(pma_rx_signal_ok),
		.pma_rxpll_lock(pma_rxpll_lock),
		.pma_signal_det(pma_signal_det),
		.pma_tx_pma_clk(pma_tx_pma_clk),
		.refclk_dig(refclk_dig),
		.scan_mode_n(scan_mode_n),
		.tx_pma_data_loopback(tx_pma_data_loopback),
		.tx_pma_uhsif_data_loopback(tx_pma_uhsif_data_loopback),
		.avmmreaddata(avmmreaddata),
		.blockselect(blockselect),
		.int_pmaif_10g_rx_pma_clk(int_pmaif_10g_rx_pma_clk),
		.int_pmaif_10g_rx_pma_data(int_pmaif_10g_rx_pma_data),
		.int_pmaif_10g_signal_ok(int_pmaif_10g_signal_ok),
		.int_pmaif_8g_pudi(int_pmaif_8g_pudi),
		.int_pmaif_8g_rcvd_clk_pma(int_pmaif_8g_rcvd_clk_pma),
		.int_pmaif_8g_rx_detect_valid(int_pmaif_8g_rx_detect_valid),
		.int_pmaif_8g_rx_found(int_pmaif_8g_rx_found),
		.int_pmaif_8g_sigdetni(int_pmaif_8g_sigdetni),
		.int_pmaif_g3_pma_data_in(int_pmaif_g3_pma_data_in),
		.int_pmaif_g3_pma_rx_detect_valid(int_pmaif_g3_pma_rx_detect_valid),
		.int_pmaif_g3_pma_rx_found(int_pmaif_g3_pma_rx_found),
		.int_pmaif_g3_pma_signal_det(int_pmaif_g3_pma_signal_det),
		.int_pmaif_g3_rcvd_clk(int_pmaif_g3_rcvd_clk),
		.int_pmaif_krfec_rx_pma_data(int_pmaif_krfec_rx_pma_data),
		.int_pmaif_krfec_rx_signal_ok_in(int_pmaif_krfec_rx_signal_ok_in),
		.int_pmaif_pldif_prbs_err(int_pmaif_pldif_prbs_err),
		.int_pmaif_pldif_prbs_err_done(int_pmaif_pldif_prbs_err_done),
		.int_pmaif_pldif_rx_clkdiv(int_pmaif_pldif_rx_clkdiv),
		.int_pmaif_pldif_rx_clkdiv_user(int_pmaif_pldif_rx_clkdiv_user),
		.int_pmaif_pldif_rx_data(int_pmaif_pldif_rx_data),
		.int_pmaif_pldif_rx_detect_valid(int_pmaif_pldif_rx_detect_valid),
		.int_pmaif_pldif_rx_found(int_pmaif_pldif_rx_found),
		.int_pmaif_pldif_rxpll_lock(int_pmaif_pldif_rxpll_lock),
		.int_pmaif_pldif_signal_ok(int_pmaif_pldif_signal_ok),
		.int_rx_dft_obsrv_clk(int_rx_dft_obsrv_clk),
		.pma_eye_monitor(pma_eye_monitor),
		.pma_rx_clkslip(pma_rx_clkslip),
		.pma_rxpma_rstb(pma_rxpma_rstb),
		.prbs_err_lt(prbs_err_lt),
		.rx_pmaif_test_out(rx_pmaif_test_out),
		.rx_prbs_ver_test(rx_prbs_ver_test)

	);

endmodule
// -----------------------------------------------------------
// This is auto-generated HSSI Simulation Atom Model Encryption Wrapper
// Module Name : work/twentynm_hssi_rx_pld_pcs_interface_wrapper.v
// -----------------------------------------------------------

`timescale 1 ps/1 ps

module twentynm_hssi_rx_pld_pcs_interface
#(
	// Parameter declaration and default value assignment

	parameter enable_debug_info = "true",	//Valid values: false|true; this is simulation-only parameter, for debug purpose only

	parameter	hd_10g_advanced_user_mode_rx = "disable" ,		//Valid values: disable enable 
	parameter	hd_10g_channel_operation_mode = "tx_rx_pair_enabled" ,		//Valid values: tx_rx_pair_enabled tx_rx_independent 
	parameter	hd_10g_ctrl_plane_bonding_rx = "individual_rx" ,		//Valid values: individual_rx ctrl_master_rx ctrl_slave_abv_rx ctrl_slave_blw_rx 
	parameter	hd_10g_fifo_mode_rx = "fifo_rx" ,		//Valid values: fifo_rx reg_rx 
	parameter	hd_10g_low_latency_en_rx = "enable" ,		//Valid values: disable enable 
	parameter	hd_10g_lpbk_en = "disable" ,		//Valid values: disable enable 
	parameter	hd_10g_pma_dw_rx = "pma_64b_rx" ,		//Valid values: pma_32b_rx pma_40b_rx pma_64b_rx 
	parameter	hd_10g_prot_mode_rx = "disabled_prot_mode_rx" ,		//Valid values: disabled_prot_mode_rx teng_baser_mode_rx interlaken_mode_rx sfis_mode_rx teng_sdi_mode_rx basic_mode_rx test_prp_mode_rx test_prp_krfec_mode_rx teng_1588_mode_rx teng_baser_krfec_mode_rx teng_1588_krfec_mode_rx basic_krfec_mode_rx 
	parameter	hd_10g_shared_fifo_width_rx = "single_rx" ,		//Valid values: single_rx double_rx 
	parameter	hd_10g_sup_mode = "user_mode" ,		//Valid values: user_mode engineering_mode 
	parameter	hd_10g_test_bus_mode = "tx" ,		//Valid values: tx rx 
	parameter	hd_8g_channel_operation_mode = "tx_rx_pair_enabled" ,		//Valid values: tx_rx_pair_enabled tx_rx_independent 
	parameter	hd_8g_ctrl_plane_bonding_rx = "individual_rx" ,		//Valid values: individual_rx ctrl_master_rx ctrl_slave_abv_rx ctrl_slave_blw_rx 
	parameter	hd_8g_fifo_mode_rx = "fifo_rx" ,		//Valid values: fifo_rx reg_rx 
	parameter	hd_8g_hip_mode = "disable" ,		//Valid values: disable enable 
	parameter	hd_8g_lpbk_en = "disable" ,		//Valid values: disable enable 
	parameter	hd_8g_pma_dw_rx = "pma_8b_rx" ,		//Valid values: pma_8b_rx pma_10b_rx pma_16b_rx pma_20b_rx 
	parameter	hd_8g_prot_mode_rx = "disabled_prot_mode_rx" ,		//Valid values: pipe_g1_rx pipe_g2_rx pipe_g3_rx cpri_rx cpri_rx_tx_rx gige_rx gige_1588_rx basic_rm_enable_rx basic_rm_disable_rx disabled_prot_mode_rx 
	parameter	hd_8g_sup_mode = "user_mode" ,		//Valid values: user_mode engineering_mode 
	parameter	hd_chnl_channel_operation_mode = "tx_rx_pair_enabled" ,		//Valid values: tx_rx_pair_enabled tx_rx_independent 
	parameter	hd_chnl_clklow_clk_hz = 30'b000000000000000000000000000000 ,		//Valid values: 30 
	parameter	hd_chnl_ctrl_plane_bonding_rx = "individual_rx" ,		//Valid values: individual_rx ctrl_master_rx ctrl_slave_abv_rx ctrl_slave_blw_rx 
	parameter	hd_chnl_fref_clk_hz = 30'b000000000000000000000000000000 ,		//Valid values: 30 
	parameter	hd_chnl_frequency_rules_en = "disable" ,		//Valid values: disable enable 
	parameter	hd_chnl_func_mode = "disable" ,		//Valid values: disable enable 
	parameter	hd_chnl_hclk_clk_hz = 30'b000000000000000000000000000000 ,		//Valid values: 30 
	parameter	hd_chnl_hip_en = "disable" ,		//Valid values: disable enable 
	parameter	hd_chnl_hrdrstctl_en = "disable" ,		//Valid values: disable enable 
	parameter	hd_chnl_low_latency_en_rx = "disable" ,		//Valid values: disable enable 
	parameter	hd_chnl_lpbk_en = "disable" ,		//Valid values: disable enable 
	parameter	hd_chnl_operating_voltage = "standard" ,		//Valid values: standard vidint vidmin 
	parameter	hd_chnl_pcs_ac_pwr_rules_en = "disable" ,		//Valid values: disable enable 
	parameter	hd_chnl_pcs_pair_ac_pwr_uw_per_mhz = 20'b00000000000000000000 ,		//Valid values: 20 
	parameter	hd_chnl_pcs_rx_ac_pwr_uw_per_mhz = 20'b00000000000000000000 ,		//Valid values: 20 
	parameter	hd_chnl_pcs_rx_pwr_scaling_clk = "pma_rx_clk" ,		//Valid values: pma_rx_clk 
	parameter	hd_chnl_pld_8g_refclk_dig_nonatpg_mode_clk_hz = 30'b000000000000000000000000000000 ,		//Valid values: 30 
	parameter	hd_chnl_pld_fifo_mode_rx = "fifo_rx" ,		//Valid values: fifo_rx reg_rx 
	parameter	hd_chnl_pld_pcs_refclk_dig_nonatpg_mode_clk_hz = 30'b000000000000000000000000000000 ,		//Valid values: 30 
	parameter	hd_chnl_pld_rx_clk_hz = 30'b000000000000000000000000000000 ,		//Valid values: 30 
	parameter	hd_chnl_pma_dw_rx = "pma_8b_rx" ,		//Valid values: pma_8b_rx pma_10b_rx pma_16b_rx pma_20b_rx pma_32b_rx pma_40b_rx pma_64b_rx pcie_g3_dyn_dw_rx 
	parameter	hd_chnl_pma_rx_clk_hz = 30'b000000000000000000000000000000 ,		//Valid values: 30 
	parameter	hd_chnl_prot_mode_rx = "disabled_prot_mode_rx" ,		//Valid values: disabled_prot_mode_rx pcie_g1_capable_rx pcie_g2_capable_rx pcie_g3_capable_rx gige_rx teng_baser_rx teng_basekr_krfec_rx fortyg_basekr_krfec_rx cpri_8b10b_rx interlaken_rx sfis_rx teng_sdi_rx gige_1588_rx teng_1588_baser_rx teng_1588_basekr_krfec_rx basic_8gpcs_rm_enable_rx basic_8gpcs_rm_disable_rx basic_10gpcs_rx basic_10gpcs_krfec_rx pcs_direct_rx prp_rx prp_krfec_rx prbs_rx 
	parameter	hd_chnl_shared_fifo_width_rx = "single_rx" ,		//Valid values: single_rx double_rx 
	parameter	hd_chnl_speed_grade = "e2" ,		//Valid values: e2 i2 e3 i3 e4 i4 
	parameter	hd_chnl_sup_mode = "user_mode" ,		//Valid values: user_mode engineering_mode 
	parameter	hd_chnl_transparent_pcs_rx = "disable" ,		//Valid values: disable enable 
	parameter	hd_fifo_channel_operation_mode = "tx_rx_pair_enabled" ,		//Valid values: tx_rx_pair_enabled tx_rx_independent 
	parameter	hd_fifo_prot_mode_rx = "teng_mode_rx" ,		//Valid values: teng_mode_rx non_teng_mode_rx 
	parameter	hd_fifo_shared_fifo_width_rx = "single_rx" ,		//Valid values: single_rx double_rx 
	parameter	hd_fifo_sup_mode = "user_mode" ,		//Valid values: user_mode engineering_mode 
	parameter	hd_g3_prot_mode = "disabled_prot_mode" ,		//Valid values: pipe_g1 pipe_g2 pipe_g3 disabled_prot_mode 
	parameter	hd_g3_sup_mode = "user_mode" ,		//Valid values: user_mode engineering_mode 
	parameter	hd_krfec_channel_operation_mode = "tx_rx_pair_enabled" ,		//Valid values: tx_rx_pair_enabled tx_rx_independent 
	parameter	hd_krfec_low_latency_en_rx = "disable" ,		//Valid values: disable enable 
	parameter	hd_krfec_lpbk_en = "disable" ,		//Valid values: disable enable 
	parameter	hd_krfec_prot_mode_rx = "disabled_prot_mode_rx" ,		//Valid values: disabled_prot_mode_rx teng_basekr_mode_rx fortyg_basekr_mode_rx teng_1588_basekr_mode_rx basic_mode_rx 
	parameter	hd_krfec_sup_mode = "user_mode" ,		//Valid values: user_mode engineering_mode 
	parameter	hd_krfec_test_bus_mode = "tx" ,		//Valid values: tx rx 
	parameter	hd_pldif_hrdrstctl_en = "disable" ,		//Valid values: disable enable 
	parameter	hd_pldif_prot_mode_rx = "disabled_prot_mode_rx" ,		//Valid values: disabled_prot_mode_rx eightg_and_g3_pld_fifo_mode_rx eightg_and_g3_reg_mode_rx eightg_and_g3_reg_mode_hip_rx teng_pld_fifo_mode_rx teng_reg_mode_rx teng_and_krfec_pld_fifo_mode_rx teng_and_krfec_reg_mode_rx pcs_direct_reg_mode_rx 
	parameter	hd_pldif_sup_mode = "user_mode" ,		//Valid values: user_mode engineering_mode 
	parameter	hd_pmaif_channel_operation_mode = "tx_rx_pair_enabled" ,		//Valid values: tx_rx_pair_enabled tx_rx_independent 
	parameter	hd_pmaif_lpbk_en = "disable" ,		//Valid values: disable enable 
	parameter	hd_pmaif_pma_dw_rx = "pma_8b_rx" ,		//Valid values: pma_8b_rx pma_10b_rx pma_16b_rx pma_20b_rx pma_32b_rx pma_40b_rx pma_64b_rx pcie_g3_dyn_dw_rx 
	parameter	hd_pmaif_prot_mode_rx = "disabled_prot_mode_rx" ,		//Valid values: disabled_prot_mode_rx pcs_direct_mode_rx eightg_only_pld_mode_rx eightg_pcie_g12_pld_mode_rx eightg_g3_pcie_g3_pld_mode_rx eightg_pcie_g12_hip_mode_rx eightg_g3_pcie_g3_hip_mode_rx teng_krfec_mode_rx eightg_basic_mode_rx teng_basic_mode_rx teng_sfis_sdi_mode_rx prbs_mode_rx 
	parameter	hd_pmaif_sim_mode = "disable" ,		//Valid values: disable enable 
	parameter	hd_pmaif_sup_mode = "user_mode" ,		//Valid values: user_mode engineering_mode 
	parameter	pcs_rx_block_sel = "pcs_direct" ,		//Valid values: eightg teng pcs_direct 
	parameter	pcs_rx_clk_out_sel = "teng_clk_out" ,		//Valid values: eightg_clk_out teng_clk_out pma_rx_clk pma_rx_clk_user 
	parameter	pcs_rx_clk_sel = "pld_rx_clk" ,		//Valid values: pld_rx_clk pcs_rx_clk 
	parameter	pcs_rx_hip_clk_en = "hip_rx_enable" ,		//Valid values: hip_rx_enable hip_rx_disable 
	parameter	pcs_rx_output_sel = "teng_output" ,		//Valid values: krfec_output teng_output 
	parameter	reconfig_settings = "{}" ,		//Valid values:  
	parameter	silicon_rev = "20nm5es"		//Valid values: 20nm5es 20nm5es2 20nm4es 20nm4es2 20nm5 20nm4 20nm3 20nm2 20nm1 
)

(
	//Port declaration

	input	[8:0]  avmmaddress ,
	input	avmmclk ,
	input	avmmread ,
	input	avmmrstn ,
	input	avmmwrite ,
	input	[7:0]  avmmwritedata ,
	input	int_pldif_10g_rx_align_val ,
	input	int_pldif_10g_rx_blk_lock ,
	input	int_pldif_10g_rx_clk_out ,
	input	int_pldif_10g_rx_clk_out_pld_if ,
	input	[19:0]  int_pldif_10g_rx_control ,
	input	int_pldif_10g_rx_crc32_err ,
	input	[127:0]  int_pldif_10g_rx_data ,
	input	int_pldif_10g_rx_data_valid ,
	input	[1:0]  int_pldif_10g_rx_diag_status ,
	input	int_pldif_10g_rx_empty ,
	input	int_pldif_10g_rx_fifo_del ,
	input	int_pldif_10g_rx_fifo_insert ,
	input	[4:0]  int_pldif_10g_rx_fifo_num ,
	input	int_pldif_10g_rx_frame_lock ,
	input	int_pldif_10g_rx_hi_ber ,
	input	int_pldif_10g_rx_oflw_err ,
	input	int_pldif_10g_rx_pempty ,
	input	int_pldif_10g_rx_pfull ,
	input	int_pldif_10g_rx_rx_frame ,
	input	[3:0]  int_pldif_8g_a1a2_k1k2_flag ,
	input	int_pldif_8g_empty_rmf ,
	input	int_pldif_8g_empty_rx ,
	input	int_pldif_8g_full_rmf ,
	input	int_pldif_8g_full_rx ,
	input	int_pldif_8g_phystatus ,
	input	[3:0]  int_pldif_8g_rx_blk_start ,
	input	int_pldif_8g_rx_clk ,
	input	int_pldif_8g_rx_clk_out_pld_if ,
	input	[3:0]  int_pldif_8g_rx_data_valid ,
	input	int_pldif_8g_rx_rstn_sync2wrfifo ,
	input	[1:0]  int_pldif_8g_rx_sync_hdr ,
	input	[63:0]  int_pldif_8g_rxd ,
	input	int_pldif_8g_rxelecidle ,
	input	[2:0]  int_pldif_8g_rxstatus ,
	input	int_pldif_8g_rxvalid ,
	input	int_pldif_8g_signal_detect_out ,
	input	[4:0]  int_pldif_8g_wa_boundary ,
	input	int_pldif_krfec_rx_block_lock ,
	input	[1:0]  int_pldif_krfec_rx_data_status ,
	input	int_pldif_krfec_rx_frame ,
	input	int_pldif_pmaif_clkdiv_rx ,
	input	int_pldif_pmaif_clkdiv_rx_user ,
	input	[63:0]  int_pldif_pmaif_rx_data ,
	input	int_pldif_pmaif_rx_prbs_done ,
	input	int_pldif_pmaif_rx_prbs_err ,
	input	int_pldif_pmaif_rxpll_lock ,
	input	int_pldif_pmaif_signal_ok ,
	input	int_pldif_usr_rst_sel ,
	input	pld_10g_krfec_rx_clr_errblk_cnt ,
	input	pld_10g_krfec_rx_pld_rst_n ,
	input	pld_10g_rx_align_clr ,
	input	pld_10g_rx_clr_ber_count ,
	input	pld_10g_rx_rd_en ,
	input	pld_8g_a1a2_size ,
	input	pld_8g_bitloc_rev_en ,
	input	pld_8g_byte_rev_en ,
	input	pld_8g_encdt ,
	input	pld_8g_g3_rx_pld_rst_n ,
	input	pld_8g_rdenable_rx ,
	input	pld_8g_rxpolarity ,
	input	pld_8g_wrdisable_rx ,
	input	pld_bitslip ,
	input	pld_partial_reconfig ,
	input	pld_pma_rxpma_rstb ,
	input	pld_pmaif_rx_pld_rst_n ,
	input	pld_pmaif_rxclkslip ,
	input	pld_polinv_rx ,
	input	pld_rx_clk ,
	input	pld_rx_prbs_err_clr ,
	input	pld_syncsm_en ,
	input	scan_mode_n ,

	output	[7:0]  avmmreaddata ,
	output	blockselect ,
	output	pld_8g_wa_boundary_txclk_fastreg ,
	output	pld_8g_wa_boundary_txclk_reg ,
	output	pld_bitslip_10g_txclk_reg ,
	output	pld_bitslip_8g_txclk_reg ,
	output	pld_bitslip_rxclk_parallel_loopback_reg ,
	output	pld_bitslip_rxclk_reg ,
	output	pld_pcs_rx_clk_out_pcsdirect_wire ,
	output	pld_pma_rx_clk_out_10g_or_pcsdirect_wire ,
	output	pld_pma_rx_clk_out_8g_wire ,
	output	pld_pmaif_rx_pld_rst_n_reg ,
	output	pld_pmaif_tx_pld_rst_n_txclk_reg ,
	output	pld_polinv_rx_reg ,
	output	pld_rx_clk_fifo ,
	output	pld_rx_control_fifo ,
	output	pld_rx_control_pcsdirect_reg ,
	output	pld_rx_data_fifo ,
	output	pld_rx_data_pcsdirect_reg ,
	output	pld_rx_prbs_done_reg ,
	output	pld_rx_prbs_done_txclk_reg ,
	output	pld_rx_prbs_err_clr_pcsdirect_txclk_reg ,
	output	pld_rx_prbs_err_clr_reg ,
	output	pld_rx_prbs_err_disprbs_reg ,
	output	pld_rx_prbs_err_pcsdirect_txclk_reg ,
	output	pld_rx_prbs_err_reg ,
	output	pma_rx_pma_clk_reg ,
	output	[1:0]  hip_rx_ctrl ,
	output	[50:0]  hip_rx_data ,
	output	int_pldif_10g_rx_align_clr ,
	output	int_pldif_10g_rx_bitslip ,
	output	int_pldif_10g_rx_clr_ber_count ,
	output	int_pldif_10g_rx_clr_errblk_cnt ,
	output	[19:0]  int_pldif_10g_rx_control_fb ,
	output	[127:0]  int_pldif_10g_rx_data_fb ,
	output	int_pldif_10g_rx_data_valid_fb ,
	output	int_pldif_10g_rx_pld_clk ,
	output	int_pldif_10g_rx_pld_rst_n ,
	output	int_pldif_10g_rx_prbs_err_clr ,
	output	int_pldif_10g_rx_rd_en ,
	output	int_pldif_8g_a1a2_size ,
	output	int_pldif_8g_bitloc_rev_en ,
	output	int_pldif_8g_bitslip ,
	output	int_pldif_8g_byte_rev_en ,
	output	int_pldif_8g_encdt ,
	output	int_pldif_8g_pld_rx_clk ,
	output	int_pldif_8g_rdenable_rx ,
	output	int_pldif_8g_rxpolarity ,
	output	int_pldif_8g_rxurstpcs_n ,
	output	int_pldif_8g_syncsm_en ,
	output	int_pldif_8g_wrdisable_rx ,
	output	int_pldif_g3_syncsm_en ,
	output	int_pldif_krfec_rx_clr_counters ,
	output	int_pldif_pmaif_polinv_rx ,
	output	int_pldif_pmaif_rx_clkslip ,
	output	int_pldif_pmaif_rx_pld_clk ,
	output	int_pldif_pmaif_rx_pld_rst_n ,
	output	int_pldif_pmaif_rx_prbs_err_clr ,
	output	int_pldif_pmaif_rxpma_rstb ,
	output	pld_10g_krfec_rx_blk_lock ,
	output	[1:0]  pld_10g_krfec_rx_diag_data_status ,
	output	pld_10g_krfec_rx_frame ,
	output	pld_10g_rx_align_val ,
	output	pld_10g_rx_crc32_err ,
	output	pld_10g_rx_data_valid ,
	output	pld_10g_rx_empty ,
	output	pld_10g_rx_fifo_del ,
	output	pld_10g_rx_fifo_insert ,
	output	[4:0]  pld_10g_rx_fifo_num ,
	output	pld_10g_rx_frame_lock ,
	output	pld_10g_rx_hi_ber ,
	output	pld_10g_rx_oflw_err ,
	output	pld_10g_rx_pempty ,
	output	pld_10g_rx_pfull ,
	output	[3:0]  pld_8g_a1a2_k1k2_flag ,
	output	pld_8g_empty_rmf ,
	output	pld_8g_empty_rx ,
	output	pld_8g_full_rmf ,
	output	pld_8g_full_rx ,
	output	pld_8g_rxelecidle ,
	output	pld_8g_signal_detect_out ,
	output	[4:0]  pld_8g_wa_boundary ,
	output	pld_pcs_rx_clk_out ,
	output	pld_pma_clkdiv_rx_user ,
	output	pld_pma_rx_clk_out ,
	output	pld_pma_signal_ok ,
	output	[19:0]  pld_rx_control ,
	output	[127:0]  pld_rx_data ,
	output	pld_rx_prbs_done ,
	output	pld_rx_prbs_err 

);


	twentynm_hssi_rx_pld_pcs_interface_encrypted
	#(
		.enable_debug_info(enable_debug_info) ,

		.hd_10g_advanced_user_mode_rx(hd_10g_advanced_user_mode_rx) ,
		.hd_10g_channel_operation_mode(hd_10g_channel_operation_mode) ,
		.hd_10g_ctrl_plane_bonding_rx(hd_10g_ctrl_plane_bonding_rx) ,
		.hd_10g_fifo_mode_rx(hd_10g_fifo_mode_rx) ,
		.hd_10g_low_latency_en_rx(hd_10g_low_latency_en_rx) ,
		.hd_10g_lpbk_en(hd_10g_lpbk_en) ,
		.hd_10g_pma_dw_rx(hd_10g_pma_dw_rx) ,
		.hd_10g_prot_mode_rx(hd_10g_prot_mode_rx) ,
		.hd_10g_shared_fifo_width_rx(hd_10g_shared_fifo_width_rx) ,
		.hd_10g_sup_mode(hd_10g_sup_mode) ,
		.hd_10g_test_bus_mode(hd_10g_test_bus_mode) ,
		.hd_8g_channel_operation_mode(hd_8g_channel_operation_mode) ,
		.hd_8g_ctrl_plane_bonding_rx(hd_8g_ctrl_plane_bonding_rx) ,
		.hd_8g_fifo_mode_rx(hd_8g_fifo_mode_rx) ,
		.hd_8g_hip_mode(hd_8g_hip_mode) ,
		.hd_8g_lpbk_en(hd_8g_lpbk_en) ,
		.hd_8g_pma_dw_rx(hd_8g_pma_dw_rx) ,
		.hd_8g_prot_mode_rx(hd_8g_prot_mode_rx) ,
		.hd_8g_sup_mode(hd_8g_sup_mode) ,
		.hd_chnl_channel_operation_mode(hd_chnl_channel_operation_mode) ,
		.hd_chnl_clklow_clk_hz(hd_chnl_clklow_clk_hz) ,
		.hd_chnl_ctrl_plane_bonding_rx(hd_chnl_ctrl_plane_bonding_rx) ,
		.hd_chnl_fref_clk_hz(hd_chnl_fref_clk_hz) ,
		.hd_chnl_frequency_rules_en(hd_chnl_frequency_rules_en) ,
		.hd_chnl_func_mode(hd_chnl_func_mode) ,
		.hd_chnl_hclk_clk_hz(hd_chnl_hclk_clk_hz) ,
		.hd_chnl_hip_en(hd_chnl_hip_en) ,
		.hd_chnl_hrdrstctl_en(hd_chnl_hrdrstctl_en) ,
		.hd_chnl_low_latency_en_rx(hd_chnl_low_latency_en_rx) ,
		.hd_chnl_lpbk_en(hd_chnl_lpbk_en) ,
		.hd_chnl_operating_voltage(hd_chnl_operating_voltage) ,
		.hd_chnl_pcs_ac_pwr_rules_en(hd_chnl_pcs_ac_pwr_rules_en) ,
		.hd_chnl_pcs_pair_ac_pwr_uw_per_mhz(hd_chnl_pcs_pair_ac_pwr_uw_per_mhz) ,
		.hd_chnl_pcs_rx_ac_pwr_uw_per_mhz(hd_chnl_pcs_rx_ac_pwr_uw_per_mhz) ,
		.hd_chnl_pcs_rx_pwr_scaling_clk(hd_chnl_pcs_rx_pwr_scaling_clk) ,
		.hd_chnl_pld_8g_refclk_dig_nonatpg_mode_clk_hz(hd_chnl_pld_8g_refclk_dig_nonatpg_mode_clk_hz) ,
		.hd_chnl_pld_fifo_mode_rx(hd_chnl_pld_fifo_mode_rx) ,
		.hd_chnl_pld_pcs_refclk_dig_nonatpg_mode_clk_hz(hd_chnl_pld_pcs_refclk_dig_nonatpg_mode_clk_hz) ,
		.hd_chnl_pld_rx_clk_hz(hd_chnl_pld_rx_clk_hz) ,
		.hd_chnl_pma_dw_rx(hd_chnl_pma_dw_rx) ,
		.hd_chnl_pma_rx_clk_hz(hd_chnl_pma_rx_clk_hz) ,
		.hd_chnl_prot_mode_rx(hd_chnl_prot_mode_rx) ,
		.hd_chnl_shared_fifo_width_rx(hd_chnl_shared_fifo_width_rx) ,
		.hd_chnl_speed_grade(hd_chnl_speed_grade) ,
		.hd_chnl_sup_mode(hd_chnl_sup_mode) ,
		.hd_chnl_transparent_pcs_rx(hd_chnl_transparent_pcs_rx) ,
		.hd_fifo_channel_operation_mode(hd_fifo_channel_operation_mode) ,
		.hd_fifo_prot_mode_rx(hd_fifo_prot_mode_rx) ,
		.hd_fifo_shared_fifo_width_rx(hd_fifo_shared_fifo_width_rx) ,
		.hd_fifo_sup_mode(hd_fifo_sup_mode) ,
		.hd_g3_prot_mode(hd_g3_prot_mode) ,
		.hd_g3_sup_mode(hd_g3_sup_mode) ,
		.hd_krfec_channel_operation_mode(hd_krfec_channel_operation_mode) ,
		.hd_krfec_low_latency_en_rx(hd_krfec_low_latency_en_rx) ,
		.hd_krfec_lpbk_en(hd_krfec_lpbk_en) ,
		.hd_krfec_prot_mode_rx(hd_krfec_prot_mode_rx) ,
		.hd_krfec_sup_mode(hd_krfec_sup_mode) ,
		.hd_krfec_test_bus_mode(hd_krfec_test_bus_mode) ,
		.hd_pldif_hrdrstctl_en(hd_pldif_hrdrstctl_en) ,
		.hd_pldif_prot_mode_rx(hd_pldif_prot_mode_rx) ,
		.hd_pldif_sup_mode(hd_pldif_sup_mode) ,
		.hd_pmaif_channel_operation_mode(hd_pmaif_channel_operation_mode) ,
		.hd_pmaif_lpbk_en(hd_pmaif_lpbk_en) ,
		.hd_pmaif_pma_dw_rx(hd_pmaif_pma_dw_rx) ,
		.hd_pmaif_prot_mode_rx(hd_pmaif_prot_mode_rx) ,
		.hd_pmaif_sim_mode(hd_pmaif_sim_mode) ,
		.hd_pmaif_sup_mode(hd_pmaif_sup_mode) ,
		.pcs_rx_block_sel(pcs_rx_block_sel) ,
		.pcs_rx_clk_out_sel(pcs_rx_clk_out_sel) ,
		.pcs_rx_clk_sel(pcs_rx_clk_sel) ,
		.pcs_rx_hip_clk_en(pcs_rx_hip_clk_en) ,
		.pcs_rx_output_sel(pcs_rx_output_sel) ,
		.reconfig_settings(reconfig_settings) ,
		.silicon_rev(silicon_rev)

	)
	twentynm_hssi_rx_pld_pcs_interface_encrypted_inst (

		.avmmaddress(avmmaddress),
		.avmmclk(avmmclk),
		.avmmread(avmmread),
		.avmmrstn(avmmrstn),
		.avmmwrite(avmmwrite),
		.avmmwritedata(avmmwritedata),
		.int_pldif_10g_rx_align_val(int_pldif_10g_rx_align_val),
		.int_pldif_10g_rx_blk_lock(int_pldif_10g_rx_blk_lock),
		.int_pldif_10g_rx_clk_out(int_pldif_10g_rx_clk_out),
		.int_pldif_10g_rx_clk_out_pld_if(int_pldif_10g_rx_clk_out_pld_if),
		.int_pldif_10g_rx_control(int_pldif_10g_rx_control),
		.int_pldif_10g_rx_crc32_err(int_pldif_10g_rx_crc32_err),
		.int_pldif_10g_rx_data(int_pldif_10g_rx_data),
		.int_pldif_10g_rx_data_valid(int_pldif_10g_rx_data_valid),
		.int_pldif_10g_rx_diag_status(int_pldif_10g_rx_diag_status),
		.int_pldif_10g_rx_empty(int_pldif_10g_rx_empty),
		.int_pldif_10g_rx_fifo_del(int_pldif_10g_rx_fifo_del),
		.int_pldif_10g_rx_fifo_insert(int_pldif_10g_rx_fifo_insert),
		.int_pldif_10g_rx_fifo_num(int_pldif_10g_rx_fifo_num),
		.int_pldif_10g_rx_frame_lock(int_pldif_10g_rx_frame_lock),
		.int_pldif_10g_rx_hi_ber(int_pldif_10g_rx_hi_ber),
		.int_pldif_10g_rx_oflw_err(int_pldif_10g_rx_oflw_err),
		.int_pldif_10g_rx_pempty(int_pldif_10g_rx_pempty),
		.int_pldif_10g_rx_pfull(int_pldif_10g_rx_pfull),
		.int_pldif_10g_rx_rx_frame(int_pldif_10g_rx_rx_frame),
		.int_pldif_8g_a1a2_k1k2_flag(int_pldif_8g_a1a2_k1k2_flag),
		.int_pldif_8g_empty_rmf(int_pldif_8g_empty_rmf),
		.int_pldif_8g_empty_rx(int_pldif_8g_empty_rx),
		.int_pldif_8g_full_rmf(int_pldif_8g_full_rmf),
		.int_pldif_8g_full_rx(int_pldif_8g_full_rx),
		.int_pldif_8g_phystatus(int_pldif_8g_phystatus),
		.int_pldif_8g_rx_blk_start(int_pldif_8g_rx_blk_start),
		.int_pldif_8g_rx_clk(int_pldif_8g_rx_clk),
		.int_pldif_8g_rx_clk_out_pld_if(int_pldif_8g_rx_clk_out_pld_if),
		.int_pldif_8g_rx_data_valid(int_pldif_8g_rx_data_valid),
		.int_pldif_8g_rx_rstn_sync2wrfifo(int_pldif_8g_rx_rstn_sync2wrfifo),
		.int_pldif_8g_rx_sync_hdr(int_pldif_8g_rx_sync_hdr),
		.int_pldif_8g_rxd(int_pldif_8g_rxd),
		.int_pldif_8g_rxelecidle(int_pldif_8g_rxelecidle),
		.int_pldif_8g_rxstatus(int_pldif_8g_rxstatus),
		.int_pldif_8g_rxvalid(int_pldif_8g_rxvalid),
		.int_pldif_8g_signal_detect_out(int_pldif_8g_signal_detect_out),
		.int_pldif_8g_wa_boundary(int_pldif_8g_wa_boundary),
		.int_pldif_krfec_rx_block_lock(int_pldif_krfec_rx_block_lock),
		.int_pldif_krfec_rx_data_status(int_pldif_krfec_rx_data_status),
		.int_pldif_krfec_rx_frame(int_pldif_krfec_rx_frame),
		.int_pldif_pmaif_clkdiv_rx(int_pldif_pmaif_clkdiv_rx),
		.int_pldif_pmaif_clkdiv_rx_user(int_pldif_pmaif_clkdiv_rx_user),
		.int_pldif_pmaif_rx_data(int_pldif_pmaif_rx_data),
		.int_pldif_pmaif_rx_prbs_done(int_pldif_pmaif_rx_prbs_done),
		.int_pldif_pmaif_rx_prbs_err(int_pldif_pmaif_rx_prbs_err),
		.int_pldif_pmaif_rxpll_lock(int_pldif_pmaif_rxpll_lock),
		.int_pldif_pmaif_signal_ok(int_pldif_pmaif_signal_ok),
		.int_pldif_usr_rst_sel(int_pldif_usr_rst_sel),
		.pld_10g_krfec_rx_clr_errblk_cnt(pld_10g_krfec_rx_clr_errblk_cnt),
		.pld_10g_krfec_rx_pld_rst_n(pld_10g_krfec_rx_pld_rst_n),
		.pld_10g_rx_align_clr(pld_10g_rx_align_clr),
		.pld_10g_rx_clr_ber_count(pld_10g_rx_clr_ber_count),
		.pld_10g_rx_rd_en(pld_10g_rx_rd_en),
		.pld_8g_a1a2_size(pld_8g_a1a2_size),
		.pld_8g_bitloc_rev_en(pld_8g_bitloc_rev_en),
		.pld_8g_byte_rev_en(pld_8g_byte_rev_en),
		.pld_8g_encdt(pld_8g_encdt),
		.pld_8g_g3_rx_pld_rst_n(pld_8g_g3_rx_pld_rst_n),
		.pld_8g_rdenable_rx(pld_8g_rdenable_rx),
		.pld_8g_rxpolarity(pld_8g_rxpolarity),
		.pld_8g_wrdisable_rx(pld_8g_wrdisable_rx),
		.pld_bitslip(pld_bitslip),
		.pld_partial_reconfig(pld_partial_reconfig),
		.pld_pma_rxpma_rstb(pld_pma_rxpma_rstb),
		.pld_pmaif_rx_pld_rst_n(pld_pmaif_rx_pld_rst_n),
		.pld_pmaif_rxclkslip(pld_pmaif_rxclkslip),
		.pld_polinv_rx(pld_polinv_rx),
		.pld_rx_clk(pld_rx_clk),
		.pld_rx_prbs_err_clr(pld_rx_prbs_err_clr),
		.pld_syncsm_en(pld_syncsm_en),
		.scan_mode_n(scan_mode_n),
		.avmmreaddata(avmmreaddata),
		.blockselect(blockselect),
		.pld_8g_wa_boundary_txclk_fastreg(pld_8g_wa_boundary_txclk_fastreg),
		.pld_8g_wa_boundary_txclk_reg(pld_8g_wa_boundary_txclk_reg),
		.pld_bitslip_10g_txclk_reg(pld_bitslip_10g_txclk_reg),
		.pld_bitslip_8g_txclk_reg(pld_bitslip_8g_txclk_reg),
		.pld_bitslip_rxclk_parallel_loopback_reg(pld_bitslip_rxclk_parallel_loopback_reg),
		.pld_bitslip_rxclk_reg(pld_bitslip_rxclk_reg),
		.pld_pcs_rx_clk_out_pcsdirect_wire(pld_pcs_rx_clk_out_pcsdirect_wire),
		.pld_pma_rx_clk_out_10g_or_pcsdirect_wire(pld_pma_rx_clk_out_10g_or_pcsdirect_wire),
		.pld_pma_rx_clk_out_8g_wire(pld_pma_rx_clk_out_8g_wire),
		.pld_pmaif_rx_pld_rst_n_reg(pld_pmaif_rx_pld_rst_n_reg),
		.pld_pmaif_tx_pld_rst_n_txclk_reg(pld_pmaif_tx_pld_rst_n_txclk_reg),
		.pld_polinv_rx_reg(pld_polinv_rx_reg),
		.pld_rx_clk_fifo(pld_rx_clk_fifo),
		.pld_rx_control_fifo(pld_rx_control_fifo),
		.pld_rx_control_pcsdirect_reg(pld_rx_control_pcsdirect_reg),
		.pld_rx_data_fifo(pld_rx_data_fifo),
		.pld_rx_data_pcsdirect_reg(pld_rx_data_pcsdirect_reg),
		.pld_rx_prbs_done_reg(pld_rx_prbs_done_reg),
		.pld_rx_prbs_done_txclk_reg(pld_rx_prbs_done_txclk_reg),
		.pld_rx_prbs_err_clr_pcsdirect_txclk_reg(pld_rx_prbs_err_clr_pcsdirect_txclk_reg),
		.pld_rx_prbs_err_clr_reg(pld_rx_prbs_err_clr_reg),
		.pld_rx_prbs_err_disprbs_reg(pld_rx_prbs_err_disprbs_reg),
		.pld_rx_prbs_err_pcsdirect_txclk_reg(pld_rx_prbs_err_pcsdirect_txclk_reg),
		.pld_rx_prbs_err_reg(pld_rx_prbs_err_reg),
		.pma_rx_pma_clk_reg(pma_rx_pma_clk_reg),
		.hip_rx_ctrl(hip_rx_ctrl),
		.hip_rx_data(hip_rx_data),
		.int_pldif_10g_rx_align_clr(int_pldif_10g_rx_align_clr),
		.int_pldif_10g_rx_bitslip(int_pldif_10g_rx_bitslip),
		.int_pldif_10g_rx_clr_ber_count(int_pldif_10g_rx_clr_ber_count),
		.int_pldif_10g_rx_clr_errblk_cnt(int_pldif_10g_rx_clr_errblk_cnt),
		.int_pldif_10g_rx_control_fb(int_pldif_10g_rx_control_fb),
		.int_pldif_10g_rx_data_fb(int_pldif_10g_rx_data_fb),
		.int_pldif_10g_rx_data_valid_fb(int_pldif_10g_rx_data_valid_fb),
		.int_pldif_10g_rx_pld_clk(int_pldif_10g_rx_pld_clk),
		.int_pldif_10g_rx_pld_rst_n(int_pldif_10g_rx_pld_rst_n),
		.int_pldif_10g_rx_prbs_err_clr(int_pldif_10g_rx_prbs_err_clr),
		.int_pldif_10g_rx_rd_en(int_pldif_10g_rx_rd_en),
		.int_pldif_8g_a1a2_size(int_pldif_8g_a1a2_size),
		.int_pldif_8g_bitloc_rev_en(int_pldif_8g_bitloc_rev_en),
		.int_pldif_8g_bitslip(int_pldif_8g_bitslip),
		.int_pldif_8g_byte_rev_en(int_pldif_8g_byte_rev_en),
		.int_pldif_8g_encdt(int_pldif_8g_encdt),
		.int_pldif_8g_pld_rx_clk(int_pldif_8g_pld_rx_clk),
		.int_pldif_8g_rdenable_rx(int_pldif_8g_rdenable_rx),
		.int_pldif_8g_rxpolarity(int_pldif_8g_rxpolarity),
		.int_pldif_8g_rxurstpcs_n(int_pldif_8g_rxurstpcs_n),
		.int_pldif_8g_syncsm_en(int_pldif_8g_syncsm_en),
		.int_pldif_8g_wrdisable_rx(int_pldif_8g_wrdisable_rx),
		.int_pldif_g3_syncsm_en(int_pldif_g3_syncsm_en),
		.int_pldif_krfec_rx_clr_counters(int_pldif_krfec_rx_clr_counters),
		.int_pldif_pmaif_polinv_rx(int_pldif_pmaif_polinv_rx),
		.int_pldif_pmaif_rx_clkslip(int_pldif_pmaif_rx_clkslip),
		.int_pldif_pmaif_rx_pld_clk(int_pldif_pmaif_rx_pld_clk),
		.int_pldif_pmaif_rx_pld_rst_n(int_pldif_pmaif_rx_pld_rst_n),
		.int_pldif_pmaif_rx_prbs_err_clr(int_pldif_pmaif_rx_prbs_err_clr),
		.int_pldif_pmaif_rxpma_rstb(int_pldif_pmaif_rxpma_rstb),
		.pld_10g_krfec_rx_blk_lock(pld_10g_krfec_rx_blk_lock),
		.pld_10g_krfec_rx_diag_data_status(pld_10g_krfec_rx_diag_data_status),
		.pld_10g_krfec_rx_frame(pld_10g_krfec_rx_frame),
		.pld_10g_rx_align_val(pld_10g_rx_align_val),
		.pld_10g_rx_crc32_err(pld_10g_rx_crc32_err),
		.pld_10g_rx_data_valid(pld_10g_rx_data_valid),
		.pld_10g_rx_empty(pld_10g_rx_empty),
		.pld_10g_rx_fifo_del(pld_10g_rx_fifo_del),
		.pld_10g_rx_fifo_insert(pld_10g_rx_fifo_insert),
		.pld_10g_rx_fifo_num(pld_10g_rx_fifo_num),
		.pld_10g_rx_frame_lock(pld_10g_rx_frame_lock),
		.pld_10g_rx_hi_ber(pld_10g_rx_hi_ber),
		.pld_10g_rx_oflw_err(pld_10g_rx_oflw_err),
		.pld_10g_rx_pempty(pld_10g_rx_pempty),
		.pld_10g_rx_pfull(pld_10g_rx_pfull),
		.pld_8g_a1a2_k1k2_flag(pld_8g_a1a2_k1k2_flag),
		.pld_8g_empty_rmf(pld_8g_empty_rmf),
		.pld_8g_empty_rx(pld_8g_empty_rx),
		.pld_8g_full_rmf(pld_8g_full_rmf),
		.pld_8g_full_rx(pld_8g_full_rx),
		.pld_8g_rxelecidle(pld_8g_rxelecidle),
		.pld_8g_signal_detect_out(pld_8g_signal_detect_out),
		.pld_8g_wa_boundary(pld_8g_wa_boundary),
		.pld_pcs_rx_clk_out(pld_pcs_rx_clk_out),
		.pld_pma_clkdiv_rx_user(pld_pma_clkdiv_rx_user),
		.pld_pma_rx_clk_out(pld_pma_rx_clk_out),
		.pld_pma_signal_ok(pld_pma_signal_ok),
		.pld_rx_control(pld_rx_control),
		.pld_rx_data(pld_rx_data),
		.pld_rx_prbs_done(pld_rx_prbs_done),
		.pld_rx_prbs_err(pld_rx_prbs_err)

	);

endmodule
// -----------------------------------------------------------
// This is auto-generated HSSI Simulation Atom Model Encryption Wrapper
// Module Name : work/twentynm_hssi_tx_pcs_pma_interface_wrapper.v
// -----------------------------------------------------------

`timescale 1 ps/1 ps

module twentynm_hssi_tx_pcs_pma_interface
#(
	// Parameter declaration and default value assignment

	parameter enable_debug_info = "true",	//Valid values: false|true; this is simulation-only parameter, for debug purpose only

	parameter	bypass_pma_txelecidle = "false" ,		//Valid values: false true 
	parameter	channel_operation_mode = "tx_rx_pair_enabled" ,		//Valid values: tx_rx_pair_enabled tx_rx_independent 
	parameter	lpbk_en = "disable" ,		//Valid values: disable enable 
	parameter	master_clk_sel = "master_tx_pma_clk" ,		//Valid values: master_tx_pma_clk master_refclk_dig 
	parameter	pcie_sub_prot_mode_tx = "other_prot_mode" ,		//Valid values: pipe_g12 pipe_g3 other_prot_mode 
	parameter	pldif_datawidth_mode = "pldif_data_10bit" ,		//Valid values: pldif_data_10bit pldif_data_8bit 
	parameter	pma_dw_tx = "pma_8b_tx" ,		//Valid values: pma_8b_tx pma_10b_tx pma_16b_tx pma_20b_tx pma_32b_tx pma_40b_tx pma_64b_tx pcie_g3_dyn_dw_tx 
	parameter	pma_if_dft_en = "dft_dis" ,		//Valid values: dft_dis dft_en 
	parameter	pmagate_en = "pmagate_dis" ,		//Valid values: pmagate_dis pmagate_en 
	parameter	prbs9_dwidth = "prbs9_64b" ,		//Valid values: prbs9_64b prbs9_10b 
	parameter	prbs_clken = "prbs_clk_dis" ,		//Valid values: prbs_clk_dis prbs_clk_en 
	parameter	prbs_gen_pat = "prbs_gen_dis" ,		//Valid values: prbs_gen_dis prbs_31 prbs_23 prbs_15 prbs_9 prbs_7 
	parameter	prot_mode_tx = "disabled_prot_mode_tx" ,		//Valid values: disabled_prot_mode_tx pcs_direct_mode_tx uhsif_reg_mode_tx uhsif_direct_mode_tx eightg_only_pld_mode_tx eightg_pcie_g12_pld_mode_tx eightg_g3_pcie_g3_pld_mode_tx eightg_pcie_g12_hip_mode_tx eightg_g3_pcie_g3_hip_mode_tx teng_krfec_mode_tx eightg_basic_mode_tx teng_basic_mode_tx teng_sfis_sdi_mode_tx prbs_mode_tx sqwave_mode_tx 
	parameter	reconfig_settings = "{}" ,		//Valid values:  
	parameter	silicon_rev = "20nm5es" ,		//Valid values: 20nm5es 20nm5es2 20nm4es 20nm4es2 20nm5 20nm4 20nm3 20nm2 20nm1 
	parameter	sq_wave_num = "sq_wave_4" ,		//Valid values: sq_wave_1 sq_wave_4 sq_wave_8 sq_wave_6 sq_wave_default 
	parameter	sqwgen_clken = "sqwgen_clk_dis" ,		//Valid values: sqwgen_clk_dis sqwgen_clk_en 
	parameter	sup_mode = "user_mode" ,		//Valid values: user_mode engineering_mode 
	parameter	tx_dyn_polarity_inversion = "tx_dyn_polinv_dis" ,		//Valid values: tx_dyn_polinv_dis tx_dyn_polinv_en 
	parameter	tx_pma_data_sel = "pld_dir" ,		//Valid values: pld_dir pcie_gen3 eight_g_pcs ten_g_pcs prbs_pat sq_wave_pat block_sel_default registered_uhsif_dat directed_uhsif_dat 
	parameter	tx_static_polarity_inversion = "tx_stat_polinv_dis" ,		//Valid values: tx_stat_polinv_dis tx_stat_polinv_en 
	parameter	uhsif_cnt_step_filt_before_lock = "uhsif_filt_stepsz_b4lock_4" ,		//Valid values: uhsif_filt_stepsz_b4lock_2 uhsif_filt_stepsz_b4lock_4 uhsif_filt_stepsz_b4lock_6 uhsif_filt_stepsz_b4lock_8 
	parameter	uhsif_cnt_thresh_filt_after_lock_value = 4'b1011 ,		//Valid values: 4 
	parameter	uhsif_cnt_thresh_filt_before_lock = "uhsif_filt_cntthr_b4lock_16" ,		//Valid values: uhsif_filt_cntthr_b4lock_8 uhsif_filt_cntthr_b4lock_16 uhsif_filt_cntthr_b4lock_24 uhsif_filt_cntthr_b4lock_32 
	parameter	uhsif_dcn_test_update_period = "uhsif_dcn_test_period_4" ,		//Valid values: uhsif_dcn_test_period_4 uhsif_dcn_test_period_8 uhsif_dcn_test_period_12 uhsif_dcn_test_period_16 
	parameter	uhsif_dcn_testmode_enable = "uhsif_dcn_test_mode_disable" ,		//Valid values: uhsif_dcn_test_mode_enable uhsif_dcn_test_mode_disable 
	parameter	uhsif_dead_zone_count_thresh = "uhsif_dzt_cnt_thr_4" ,		//Valid values: uhsif_dzt_cnt_thr_2 uhsif_dzt_cnt_thr_4 uhsif_dzt_cnt_thr_6 uhsif_dzt_cnt_thr_8 
	parameter	uhsif_dead_zone_detection_enable = "uhsif_dzt_enable" ,		//Valid values: uhsif_dzt_disable uhsif_dzt_enable 
	parameter	uhsif_dead_zone_obser_window = "uhsif_dzt_obr_win_32" ,		//Valid values: uhsif_dzt_obr_win_16 uhsif_dzt_obr_win_32 uhsif_dzt_obr_win_48 uhsif_dzt_obr_win_64 
	parameter	uhsif_dead_zone_skip_size = "uhsif_dzt_skipsz_8" ,		//Valid values: uhsif_dzt_skipsz_4 uhsif_dzt_skipsz_8 uhsif_dzt_skipsz_12 uhsif_dzt_skipsz_16 
	parameter	uhsif_delay_cell_index_sel = "uhsif_index_internal" ,		//Valid values: uhsif_index_internal uhsif_index_cram 
	parameter	uhsif_delay_cell_margin = "uhsif_dcn_margin_4" ,		//Valid values: uhsif_dcn_margin_2 uhsif_dcn_margin_3 uhsif_dcn_margin_4 uhsif_dcn_margin_5 
	parameter	uhsif_delay_cell_static_index_value = 8'b10000000 ,		//Valid values: 8 
	parameter	uhsif_dft_dead_zone_control = "uhsif_dft_dz_det_val_0" ,		//Valid values: uhsif_dft_dz_det_val_0 uhsif_dft_dz_det_val_1 
	parameter	uhsif_dft_up_filt_control = "uhsif_dft_up_val_0" ,		//Valid values: uhsif_dft_up_val_0 uhsif_dft_up_val_1 
	parameter	uhsif_enable = "uhsif_disable" ,		//Valid values: uhsif_disable uhsif_enable 
	parameter	uhsif_lock_det_segsz_after_lock = "uhsif_lkd_segsz_aflock_2048" ,		//Valid values: uhsif_lkd_segsz_aflock_512 uhsif_lkd_segsz_aflock_1024 uhsif_lkd_segsz_aflock_2048 uhsif_lkd_segsz_aflock_4096 
	parameter	uhsif_lock_det_segsz_before_lock = "uhsif_lkd_segsz_b4lock_32" ,		//Valid values: uhsif_lkd_segsz_b4lock_16 uhsif_lkd_segsz_b4lock_32 uhsif_lkd_segsz_b4lock_64 uhsif_lkd_segsz_b4lock_128 
	parameter	uhsif_lock_det_thresh_cnt_after_lock_value = 4'b1000 ,		//Valid values: 4 
	parameter	uhsif_lock_det_thresh_cnt_before_lock_value = 4'b1000 ,		//Valid values: 4 
	parameter	uhsif_lock_det_thresh_diff_after_lock_value = 4'b0011 ,		//Valid values: 4 
	parameter	uhsif_lock_det_thresh_diff_before_lock_value = 4'b0011		//Valid values: 4 
)

(
	//Port declaration

	input	[8:0]  avmmaddress ,
	input	avmmclk ,
	input	avmmread ,
	input	avmmrstn ,
	input	avmmwrite ,
	input	[7:0]  avmmwritedata ,
	input	int_pmaif_10g_tx_clk_out ,
	input	[63:0]  int_pmaif_10g_tx_pma_data ,
	input	[63:0]  int_pmaif_10g_tx_pma_data_gate_val ,
	input	[19:0]  int_pmaif_8g_pudr ,
	input	int_pmaif_8g_tx_clk_out ,
	input	int_pmaif_8g_tx_elec_idle ,
	input	int_pmaif_g3_data_sel ,
	input	[31:0]  int_pmaif_g3_pma_data_out ,
	input	int_pmaif_g3_pma_tx_elec_idle ,
	input	int_pmaif_pldif_pmaif_tx_pld_rst_n ,
	input	int_pmaif_pldif_polinv_tx ,
	input	[63:0]  int_pmaif_pldif_tx_data ,
	input	int_pmaif_pldif_txelecidle ,
	input	int_pmaif_pldif_txpma_rstb ,
	input	int_pmaif_pldif_uhsif_scan_chain_in ,
	input	int_pmaif_pldif_uhsif_tx_clk ,
	input	[63:0]  int_pmaif_pldif_uhsif_tx_data ,
	input	pma_tx_clkdiv_user ,
	input	pma_tx_pma_clk ,
	input	refclk_dig ,
	input	refclk_dig_uhsif ,
	input	scan_mode_n ,
	input	uhsif_scan_mode_n ,
	input	uhsif_scan_shift_n ,
	input	[1:0]  write_en ,

	output	[7:0]  avmmreaddata ,
	output	blockselect ,
	output	[15:0]  avmm_user_dataout ,
	output	int_pmaif_10g_tx_pma_clk ,
	output	int_pmaif_8g_txpma_local_clk ,
	output	int_pmaif_pldif_tx_clkdiv ,
	output	int_pmaif_pldif_tx_clkdiv_user ,
	output	int_pmaif_pldif_uhsif_lock ,
	output	int_pmaif_pldif_uhsif_scan_chain_out ,
	output	int_pmaif_pldif_uhsif_tx_clk_out ,
	output	[4:0]  int_tx_dft_obsrv_clk ,
	output	pma_tx_elec_idle ,
	output	[63:0]  pma_tx_pma_data ,
	output	pma_txpma_rstb ,
	output	[63:0]  tx_pma_data_loopback ,
	output	[63:0]  tx_pma_uhsif_data_loopback ,
	output	[19:0]  tx_prbs_gen_test ,
	output	[19:0]  uhsif_test_out_1 ,
	output	[19:0]  uhsif_test_out_2 ,
	output	[19:0]  uhsif_test_out_3 ,
	output	[1:0]  write_en_ack 

);


	twentynm_hssi_tx_pcs_pma_interface_encrypted
	#(
		.enable_debug_info(enable_debug_info) ,

		.bypass_pma_txelecidle(bypass_pma_txelecidle) ,
		.channel_operation_mode(channel_operation_mode) ,
		.lpbk_en(lpbk_en) ,
		.master_clk_sel(master_clk_sel) ,
		.pcie_sub_prot_mode_tx(pcie_sub_prot_mode_tx) ,
		.pldif_datawidth_mode(pldif_datawidth_mode) ,
		.pma_dw_tx(pma_dw_tx) ,
		.pma_if_dft_en(pma_if_dft_en) ,
		.pmagate_en(pmagate_en) ,
		.prbs9_dwidth(prbs9_dwidth) ,
		.prbs_clken(prbs_clken) ,
		.prbs_gen_pat(prbs_gen_pat) ,
		.prot_mode_tx(prot_mode_tx) ,
		.reconfig_settings(reconfig_settings) ,
		.silicon_rev(silicon_rev) ,
		.sq_wave_num(sq_wave_num) ,
		.sqwgen_clken(sqwgen_clken) ,
		.sup_mode(sup_mode) ,
		.tx_dyn_polarity_inversion(tx_dyn_polarity_inversion) ,
		.tx_pma_data_sel(tx_pma_data_sel) ,
		.tx_static_polarity_inversion(tx_static_polarity_inversion) ,
		.uhsif_cnt_step_filt_before_lock(uhsif_cnt_step_filt_before_lock) ,
		.uhsif_cnt_thresh_filt_after_lock_value(uhsif_cnt_thresh_filt_after_lock_value) ,
		.uhsif_cnt_thresh_filt_before_lock(uhsif_cnt_thresh_filt_before_lock) ,
		.uhsif_dcn_test_update_period(uhsif_dcn_test_update_period) ,
		.uhsif_dcn_testmode_enable(uhsif_dcn_testmode_enable) ,
		.uhsif_dead_zone_count_thresh(uhsif_dead_zone_count_thresh) ,
		.uhsif_dead_zone_detection_enable(uhsif_dead_zone_detection_enable) ,
		.uhsif_dead_zone_obser_window(uhsif_dead_zone_obser_window) ,
		.uhsif_dead_zone_skip_size(uhsif_dead_zone_skip_size) ,
		.uhsif_delay_cell_index_sel(uhsif_delay_cell_index_sel) ,
		.uhsif_delay_cell_margin(uhsif_delay_cell_margin) ,
		.uhsif_delay_cell_static_index_value(uhsif_delay_cell_static_index_value) ,
		.uhsif_dft_dead_zone_control(uhsif_dft_dead_zone_control) ,
		.uhsif_dft_up_filt_control(uhsif_dft_up_filt_control) ,
		.uhsif_enable(uhsif_enable) ,
		.uhsif_lock_det_segsz_after_lock(uhsif_lock_det_segsz_after_lock) ,
		.uhsif_lock_det_segsz_before_lock(uhsif_lock_det_segsz_before_lock) ,
		.uhsif_lock_det_thresh_cnt_after_lock_value(uhsif_lock_det_thresh_cnt_after_lock_value) ,
		.uhsif_lock_det_thresh_cnt_before_lock_value(uhsif_lock_det_thresh_cnt_before_lock_value) ,
		.uhsif_lock_det_thresh_diff_after_lock_value(uhsif_lock_det_thresh_diff_after_lock_value) ,
		.uhsif_lock_det_thresh_diff_before_lock_value(uhsif_lock_det_thresh_diff_before_lock_value)

	)
	twentynm_hssi_tx_pcs_pma_interface_encrypted_inst (

		.avmmaddress(avmmaddress),
		.avmmclk(avmmclk),
		.avmmread(avmmread),
		.avmmrstn(avmmrstn),
		.avmmwrite(avmmwrite),
		.avmmwritedata(avmmwritedata),
		.int_pmaif_10g_tx_clk_out(int_pmaif_10g_tx_clk_out),
		.int_pmaif_10g_tx_pma_data(int_pmaif_10g_tx_pma_data),
		.int_pmaif_10g_tx_pma_data_gate_val(int_pmaif_10g_tx_pma_data_gate_val),
		.int_pmaif_8g_pudr(int_pmaif_8g_pudr),
		.int_pmaif_8g_tx_clk_out(int_pmaif_8g_tx_clk_out),
		.int_pmaif_8g_tx_elec_idle(int_pmaif_8g_tx_elec_idle),
		.int_pmaif_g3_data_sel(int_pmaif_g3_data_sel),
		.int_pmaif_g3_pma_data_out(int_pmaif_g3_pma_data_out),
		.int_pmaif_g3_pma_tx_elec_idle(int_pmaif_g3_pma_tx_elec_idle),
		.int_pmaif_pldif_pmaif_tx_pld_rst_n(int_pmaif_pldif_pmaif_tx_pld_rst_n),
		.int_pmaif_pldif_polinv_tx(int_pmaif_pldif_polinv_tx),
		.int_pmaif_pldif_tx_data(int_pmaif_pldif_tx_data),
		.int_pmaif_pldif_txelecidle(int_pmaif_pldif_txelecidle),
		.int_pmaif_pldif_txpma_rstb(int_pmaif_pldif_txpma_rstb),
		.int_pmaif_pldif_uhsif_scan_chain_in(int_pmaif_pldif_uhsif_scan_chain_in),
		.int_pmaif_pldif_uhsif_tx_clk(int_pmaif_pldif_uhsif_tx_clk),
		.int_pmaif_pldif_uhsif_tx_data(int_pmaif_pldif_uhsif_tx_data),
		.pma_tx_clkdiv_user(pma_tx_clkdiv_user),
		.pma_tx_pma_clk(pma_tx_pma_clk),
		.refclk_dig(refclk_dig),
		.refclk_dig_uhsif(refclk_dig_uhsif),
		.scan_mode_n(scan_mode_n),
		.uhsif_scan_mode_n(uhsif_scan_mode_n),
		.uhsif_scan_shift_n(uhsif_scan_shift_n),
		.write_en(write_en),
		.avmmreaddata(avmmreaddata),
		.blockselect(blockselect),
		.avmm_user_dataout(avmm_user_dataout),
		.int_pmaif_10g_tx_pma_clk(int_pmaif_10g_tx_pma_clk),
		.int_pmaif_8g_txpma_local_clk(int_pmaif_8g_txpma_local_clk),
		.int_pmaif_pldif_tx_clkdiv(int_pmaif_pldif_tx_clkdiv),
		.int_pmaif_pldif_tx_clkdiv_user(int_pmaif_pldif_tx_clkdiv_user),
		.int_pmaif_pldif_uhsif_lock(int_pmaif_pldif_uhsif_lock),
		.int_pmaif_pldif_uhsif_scan_chain_out(int_pmaif_pldif_uhsif_scan_chain_out),
		.int_pmaif_pldif_uhsif_tx_clk_out(int_pmaif_pldif_uhsif_tx_clk_out),
		.int_tx_dft_obsrv_clk(int_tx_dft_obsrv_clk),
		.pma_tx_elec_idle(pma_tx_elec_idle),
		.pma_tx_pma_data(pma_tx_pma_data),
		.pma_txpma_rstb(pma_txpma_rstb),
		.tx_pma_data_loopback(tx_pma_data_loopback),
		.tx_pma_uhsif_data_loopback(tx_pma_uhsif_data_loopback),
		.tx_prbs_gen_test(tx_prbs_gen_test),
		.uhsif_test_out_1(uhsif_test_out_1),
		.uhsif_test_out_2(uhsif_test_out_2),
		.uhsif_test_out_3(uhsif_test_out_3),
		.write_en_ack(write_en_ack)

	);

endmodule
// -----------------------------------------------------------
// This is auto-generated HSSI Simulation Atom Model Encryption Wrapper
// Module Name : work/twentynm_hssi_tx_pld_pcs_interface_wrapper.v
// -----------------------------------------------------------

`timescale 1 ps/1 ps

module twentynm_hssi_tx_pld_pcs_interface
#(
	// Parameter declaration and default value assignment

	parameter enable_debug_info = "true",	//Valid values: false|true; this is simulation-only parameter, for debug purpose only

	parameter	hd_10g_advanced_user_mode_tx = "disable" ,		//Valid values: disable enable 
	parameter	hd_10g_channel_operation_mode = "tx_rx_pair_enabled" ,		//Valid values: tx_rx_pair_enabled tx_rx_independent 
	parameter	hd_10g_ctrl_plane_bonding_tx = "individual_tx" ,		//Valid values: individual_tx ctrl_master_tx ctrl_slave_abv_tx ctrl_slave_blw_tx 
	parameter	hd_10g_fifo_mode_tx = "fifo_tx" ,		//Valid values: fifo_tx reg_tx fastreg_tx 
	parameter	hd_10g_low_latency_en_tx = "enable" ,		//Valid values: disable enable 
	parameter	hd_10g_lpbk_en = "disable" ,		//Valid values: disable enable 
	parameter	hd_10g_pma_dw_tx = "pma_64b_tx" ,		//Valid values: pma_32b_tx pma_40b_tx pma_64b_tx 
	parameter	hd_10g_prot_mode_tx = "disabled_prot_mode_tx" ,		//Valid values: disabled_prot_mode_tx teng_baser_mode_tx interlaken_mode_tx sfis_mode_tx teng_sdi_mode_tx basic_mode_tx test_prp_mode_tx test_prp_krfec_mode_tx teng_1588_mode_tx teng_baser_krfec_mode_tx teng_1588_krfec_mode_tx basic_krfec_mode_tx 
	parameter	hd_10g_shared_fifo_width_tx = "single_tx" ,		//Valid values: single_tx double_tx 
	parameter	hd_10g_sup_mode = "user_mode" ,		//Valid values: user_mode engineering_mode 
	parameter	hd_8g_channel_operation_mode = "tx_rx_pair_enabled" ,		//Valid values: tx_rx_pair_enabled tx_rx_independent 
	parameter	hd_8g_ctrl_plane_bonding_tx = "individual_tx" ,		//Valid values: individual_tx ctrl_master_tx ctrl_slave_abv_tx ctrl_slave_blw_tx 
	parameter	hd_8g_fifo_mode_tx = "fifo_tx" ,		//Valid values: fifo_tx reg_tx fastreg_tx 
	parameter	hd_8g_hip_mode = "disable" ,		//Valid values: disable enable 
	parameter	hd_8g_lpbk_en = "disable" ,		//Valid values: disable enable 
	parameter	hd_8g_pma_dw_tx = "pma_8b_tx" ,		//Valid values: pma_8b_tx pma_10b_tx pma_16b_tx pma_20b_tx 
	parameter	hd_8g_prot_mode_tx = "disabled_prot_mode_tx" ,		//Valid values: pipe_g1_tx pipe_g2_tx pipe_g3_tx cpri_tx cpri_rx_tx_tx gige_tx gige_1588_tx basic_tx disabled_prot_mode_tx 
	parameter	hd_8g_sup_mode = "user_mode" ,		//Valid values: user_mode engineering_mode 
	parameter	hd_chnl_channel_operation_mode = "tx_rx_pair_enabled" ,		//Valid values: tx_rx_pair_enabled tx_rx_independent 
	parameter	hd_chnl_ctrl_plane_bonding_tx = "individual_tx" ,		//Valid values: individual_tx ctrl_master_tx ctrl_slave_abv_tx ctrl_slave_blw_tx 
	parameter	hd_chnl_frequency_rules_en = "disable" ,		//Valid values: disable enable 
	parameter	hd_chnl_func_mode = "disable" ,		//Valid values: disable enable 
	parameter	hd_chnl_hclk_clk_hz = 30'b000000000000000000000000000000 ,		//Valid values: 30 
	parameter	hd_chnl_hip_en = "disable" ,		//Valid values: disable enable 
	parameter	hd_chnl_hrdrstctl_en = "disable" ,		//Valid values: disable enable 
	parameter	hd_chnl_low_latency_en_tx = "disable" ,		//Valid values: disable enable 
	parameter	hd_chnl_lpbk_en = "disable" ,		//Valid values: disable enable 
	parameter	hd_chnl_pcs_tx_ac_pwr_uw_per_mhz = 20'b00000000000000000000 ,		//Valid values: 20 
	parameter	hd_chnl_pcs_tx_pwr_scaling_clk = "pma_tx_clk" ,		//Valid values: pma_tx_clk 
	parameter	hd_chnl_pld_8g_refclk_dig_nonatpg_mode_clk_hz = 30'b000000000000000000000000000000 ,		//Valid values: 30 
	parameter	hd_chnl_pld_fifo_mode_tx = "fifo_tx" ,		//Valid values: fifo_tx reg_tx fastreg_tx 
	parameter	hd_chnl_pld_pcs_refclk_dig_nonatpg_mode_clk_hz = 30'b000000000000000000000000000000 ,		//Valid values: 30 
	parameter	hd_chnl_pld_tx_clk_hz = 30'b000000000000000000000000000000 ,		//Valid values: 30 
	parameter	hd_chnl_pld_uhsif_tx_clk_hz = 30'b000000000000000000000000000000 ,		//Valid values: 30 
	parameter	hd_chnl_pma_dw_tx = "pma_8b_tx" ,		//Valid values: pma_8b_tx pma_10b_tx pma_16b_tx pma_20b_tx pma_32b_tx pma_40b_tx pma_64b_tx pcie_g3_dyn_dw_tx 
	parameter	hd_chnl_pma_tx_clk_hz = 30'b000000000000000000000000000000 ,		//Valid values: 30 
	parameter	hd_chnl_prot_mode_tx = "disabled_prot_mode_tx" ,		//Valid values: disabled_prot_mode_tx pcie_g1_capable_tx pcie_g2_capable_tx pcie_g3_capable_tx gige_tx teng_baser_tx teng_basekr_krfec_tx fortyg_basekr_krfec_tx cpri_8b10b_tx interlaken_tx sfis_tx teng_sdi_tx gige_1588_tx teng_1588_baser_tx teng_1588_basekr_krfec_tx basic_8gpcs_tx basic_10gpcs_tx basic_10gpcs_krfec_tx pcs_direct_tx uhsif_tx prp_tx prp_krfec_tx prbs_tx sqwave_tx 
	parameter	hd_chnl_shared_fifo_width_tx = "single_tx" ,		//Valid values: single_tx double_tx 
	parameter	hd_chnl_speed_grade = "e2" ,		//Valid values: e2 i2 e3 i3 e4 i4 
	parameter	hd_chnl_sup_mode = "user_mode" ,		//Valid values: user_mode engineering_mode 
	parameter	hd_fifo_channel_operation_mode = "tx_rx_pair_enabled" ,		//Valid values: tx_rx_pair_enabled tx_rx_independent 
	parameter	hd_fifo_prot_mode_tx = "teng_mode_tx" ,		//Valid values: teng_mode_tx non_teng_mode_tx 
	parameter	hd_fifo_shared_fifo_width_tx = "single_tx" ,		//Valid values: single_tx double_tx 
	parameter	hd_fifo_sup_mode = "user_mode" ,		//Valid values: user_mode engineering_mode 
	parameter	hd_g3_prot_mode = "disabled_prot_mode" ,		//Valid values: pipe_g1 pipe_g2 pipe_g3 disabled_prot_mode 
	parameter	hd_g3_sup_mode = "user_mode" ,		//Valid values: user_mode engineering_mode 
	parameter	hd_krfec_channel_operation_mode = "tx_rx_pair_enabled" ,		//Valid values: tx_rx_pair_enabled tx_rx_independent 
	parameter	hd_krfec_low_latency_en_tx = "disable" ,		//Valid values: disable enable 
	parameter	hd_krfec_lpbk_en = "disable" ,		//Valid values: disable enable 
	parameter	hd_krfec_prot_mode_tx = "disabled_prot_mode_tx" ,		//Valid values: disabled_prot_mode_tx teng_basekr_mode_tx fortyg_basekr_mode_tx teng_1588_basekr_mode_tx basic_mode_tx 
	parameter	hd_krfec_sup_mode = "user_mode" ,		//Valid values: user_mode engineering_mode 
	parameter	hd_pldif_hrdrstctl_en = "disable" ,		//Valid values: disable enable 
	parameter	hd_pldif_prot_mode_tx = "disabled_prot_mode_tx" ,		//Valid values: disabled_prot_mode_tx eightg_and_g3_pld_fifo_mode_tx eightg_and_g3_reg_mode_tx eightg_and_g3_reg_mode_hip_tx eightg_and_g3_fastreg_mode_tx teng_pld_fifo_mode_tx teng_reg_mode_tx teng_fastreg_mode_tx teng_and_krfec_pld_fifo_mode_tx teng_and_krfec_reg_mode_tx teng_and_krfec_fastreg_mode_tx pcs_direct_fastreg_mode_tx uhsif_mode_tx 
	parameter	hd_pldif_sup_mode = "user_mode" ,		//Valid values: user_mode engineering_mode 
	parameter	hd_pmaif_channel_operation_mode = "tx_rx_pair_enabled" ,		//Valid values: tx_rx_pair_enabled tx_rx_independent 
	parameter	hd_pmaif_ctrl_plane_bonding = "individual" ,		//Valid values: individual ctrl_master ctrl_slave_abv ctrl_slave_blw 
	parameter	hd_pmaif_lpbk_en = "disable" ,		//Valid values: disable enable 
	parameter	hd_pmaif_pma_dw_tx = "pma_8b_tx" ,		//Valid values: pma_8b_tx pma_10b_tx pma_16b_tx pma_20b_tx pma_32b_tx pma_40b_tx pma_64b_tx pcie_g3_dyn_dw_tx 
	parameter	hd_pmaif_prot_mode_tx = "disabled_prot_mode_tx" ,		//Valid values: disabled_prot_mode_tx pcs_direct_mode_tx uhsif_reg_mode_tx uhsif_direct_mode_tx eightg_only_pld_mode_tx eightg_pcie_g12_pld_mode_tx eightg_g3_pcie_g3_pld_mode_tx eightg_pcie_g12_hip_mode_tx eightg_g3_pcie_g3_hip_mode_tx teng_krfec_mode_tx eightg_basic_mode_tx teng_basic_mode_tx teng_sfis_sdi_mode_tx prbs_mode_tx sqwave_mode_tx 
	parameter	hd_pmaif_sim_mode = "disable" ,		//Valid values: disable enable 
	parameter	hd_pmaif_sup_mode = "user_mode" ,		//Valid values: user_mode engineering_mode 
	parameter	pcs_tx_clk_out_sel = "teng_clk_out" ,		//Valid values: eightg_clk_out teng_clk_out pma_tx_clk pma_tx_clk_user 
	parameter	pcs_tx_clk_source = "teng" ,		//Valid values: eightg teng pma_clk 
	parameter	pcs_tx_data_source = "hip_disable" ,		//Valid values: hip_disable hip_enable 
	parameter	pcs_tx_delay1_clk_en = "delay1_clk_disable" ,		//Valid values: delay1_clk_enable delay1_clk_disable 
	parameter	pcs_tx_delay1_clk_sel = "pld_tx_clk" ,		//Valid values: pld_tx_clk pcs_tx_clk 
	parameter	pcs_tx_delay1_ctrl = "delay1_path0" ,		//Valid values: delay1_path0 delay1_path1 delay1_path2 delay1_path3 delay1_path4 
	parameter	pcs_tx_delay1_data_sel = "one_ff_delay" ,		//Valid values: one_ff_delay two_ff_delay 
	parameter	pcs_tx_delay2_clk_en = "delay2_clk_disable" ,		//Valid values: delay2_clk_enable delay2_clk_disable 
	parameter	pcs_tx_delay2_ctrl = "delay2_path0" ,		//Valid values: delay2_path0 delay2_path1 delay2_path2 delay2_path3 delay2_path4 
	parameter	pcs_tx_output_sel = "teng_output" ,		//Valid values: krfec_output teng_output 
	parameter	reconfig_settings = "{}" ,		//Valid values:  
	parameter	silicon_rev = "20nm5es"		//Valid values: 20nm5es 20nm5es2 20nm4es 20nm4es2 20nm5 20nm4 20nm3 20nm2 20nm1 
)

(
	//Port declaration

	input	[8:0]  avmmaddress ,
	input	avmmclk ,
	input	avmmread ,
	input	avmmrstn ,
	input	avmmwrite ,
	input	[7:0]  avmmwritedata ,
	input	[63:0]  hip_tx_data ,
	input	int_pldif_10g_tx_burst_en_exe ,
	input	int_pldif_10g_tx_clk_out ,
	input	int_pldif_10g_tx_clk_out_pld_if ,
	input	int_pldif_10g_tx_empty ,
	input	[3:0]  int_pldif_10g_tx_fifo_num ,
	input	int_pldif_10g_tx_frame ,
	input	int_pldif_10g_tx_full ,
	input	int_pldif_10g_tx_pempty ,
	input	int_pldif_10g_tx_pfull ,
	input	int_pldif_10g_tx_wordslip_exe ,
	input	int_pldif_8g_empty_tx ,
	input	int_pldif_8g_full_tx ,
	input	int_pldif_8g_tx_clk_out ,
	input	int_pldif_8g_tx_clk_out_pld_if ,
	input	int_pldif_krfec_tx_alignment ,
	input	int_pldif_krfec_tx_frame ,
	input	int_pldif_pmaif_clkdiv_tx ,
	input	int_pldif_pmaif_clkdiv_tx_user ,
	input	int_pldif_pmaif_uhsif_tx_clk_out ,
	input	pld_10g_krfec_tx_pld_rst_n ,
	input	[6:0]  pld_10g_tx_bitslip ,
	input	pld_10g_tx_burst_en ,
	input	pld_10g_tx_data_valid ,
	input	[1:0]  pld_10g_tx_diag_status ,
	input	pld_10g_tx_wordslip ,
	input	pld_8g_g3_tx_pld_rst_n ,
	input	pld_8g_rddisable_tx ,
	input	[4:0]  pld_8g_tx_boundary_sel ,
	input	pld_8g_wrenable_tx ,
	input	pld_partial_reconfig ,
	input	pld_pma_txpma_rstb ,
	input	pld_pmaif_tx_pld_rst_n ,
	input	pld_polinv_tx ,
	input	pld_tx_clk ,
	input	[17:0]  pld_tx_control ,
	input	[127:0]  pld_tx_data ,
	input	pld_txelecidle ,
	input	pld_uhsif_tx_clk ,
	input	scan_mode_n ,

	output	[7:0]  avmmreaddata ,
	output	blockselect ,
	output	hip_clk_out_div_by_2_wire ,
	output	hip_clk_out_wire ,
	output	pld_10g_tx_burst_en_exe_10g_fastreg ,
	output	pld_10g_tx_burst_en_exe_plddirect_reg ,
	output	pld_10g_tx_data_valid_2ff_delay1_fastreg ,
	output	pld_10g_tx_data_valid_2ff_delay3_fastreg ,
	output	pld_10g_tx_data_valid_2ff_delay4_fastreg ,
	output	pld_10g_tx_data_valid_2ff_delay4_plddirect_fastreg ,
	output	pld_10g_tx_data_valid_2ff_delay6_fastreg ,
	output	pld_10g_tx_data_valid_2ff_delay6_plddirect_fastreg ,
	output	pld_10g_tx_data_valid_fastreg ,
	output	pld_10g_tx_data_valid_plddirect_fastreg ,
	output	pld_pcs_tx_clk_out_pma_wire ,
	output	pld_pma_tx_clk_out_wire ,
	output	pld_pmaif_tx_pld_rst_n_reg ,
	output	pld_polinv_tx_10g_pcsdirect_reg ,
	output	pld_polinv_tx_8g_reg ,
	output	pld_polinv_tx_pat_reg ,
	output	pld_tx_clk_fifo ,
	output	pld_tx_control_fifo ,
	output	pld_tx_control_hi_10g_reg ,
	output	pld_tx_control_lo_10g_2ff_delay4_fastreg ,
	output	pld_tx_control_lo_10g_2ff_delay6_fastreg ,
	output	pld_tx_control_lo_10g_fastreg ,
	output	pld_tx_control_lo_8g_2ff_delay4_fastreg ,
	output	pld_tx_control_lo_8g_2ff_delay6_fastreg ,
	output	pld_tx_control_lo_8g_fastreg ,
	output	pld_tx_control_lo_plddirect_2ff_delay1_fastreg ,
	output	pld_tx_control_lo_plddirect_2ff_delay3_fastreg ,
	output	pld_tx_control_lo_plddirect_2ff_delay4_fastreg ,
	output	pld_tx_control_lo_plddirect_2ff_delay6_fastreg ,
	output	pld_tx_control_lo_plddirect_fastreg ,
	output	pld_tx_control_lo_plddirect_reg ,
	output	pld_tx_data_hi_reg ,
	output	pld_tx_data_lo_10g_2ff_delay4_fastreg ,
	output	pld_tx_data_lo_10g_2ff_delay6_fastreg ,
	output	pld_tx_data_lo_10g_fastreg ,
	output	pld_tx_data_lo_8g_2ff_delay4_fastreg ,
	output	pld_tx_data_lo_8g_2ff_delay6_fastreg ,
	output	pld_tx_data_lo_8g_fastreg ,
	output	pld_tx_data_lo_plddirect_2ff_delay1_fastreg ,
	output	pld_tx_data_lo_plddirect_2ff_delay3_fastreg ,
	output	pld_tx_data_lo_plddirect_2ff_delay4_fastreg ,
	output	pld_tx_data_lo_plddirect_2ff_delay6_fastreg ,
	output	pld_tx_data_lo_plddirect_fastreg ,
	output	pld_tx_data_lo_plddirect_reg ,
	output	pld_uhsif_reg ,
	output	pma_tx_pma_clk_reg ,
	output	hip_tx_clk ,
	output	[6:0]  int_pldif_10g_tx_bitslip ,
	output	int_pldif_10g_tx_burst_en ,
	output	[17:0]  int_pldif_10g_tx_control ,
	output	[8:0]  int_pldif_10g_tx_control_reg ,
	output	[127:0]  int_pldif_10g_tx_data ,
	output	[63:0]  int_pldif_10g_tx_data_reg ,
	output	int_pldif_10g_tx_data_valid ,
	output	int_pldif_10g_tx_data_valid_reg ,
	output	[1:0]  int_pldif_10g_tx_diag_status ,
	output	int_pldif_10g_tx_pld_clk ,
	output	int_pldif_10g_tx_pld_rst_n ,
	output	int_pldif_10g_tx_wordslip ,
	output	int_pldif_8g_pld_tx_clk ,
	output	[1:0]  int_pldif_8g_powerdown ,
	output	int_pldif_8g_rddisable_tx ,
	output	int_pldif_8g_rev_loopbk ,
	output	[3:0]  int_pldif_8g_tx_blk_start ,
	output	[4:0]  int_pldif_8g_tx_boundary_sel ,
	output	[3:0]  int_pldif_8g_tx_data_valid ,
	output	[1:0]  int_pldif_8g_tx_sync_hdr ,
	output	[43:0]  int_pldif_8g_txd ,
	output	[43:0]  int_pldif_8g_txd_fast_reg ,
	output	int_pldif_8g_txdeemph ,
	output	int_pldif_8g_txdetectrxloopback ,
	output	int_pldif_8g_txelecidle ,
	output	[2:0]  int_pldif_8g_txmargin ,
	output	int_pldif_8g_txswing ,
	output	int_pldif_8g_txurstpcs_n ,
	output	int_pldif_8g_wrenable_tx ,
	output	int_pldif_pmaif_8g_txurstpcs_n ,
	output	int_pldif_pmaif_polinv_tx ,
	output	[63:0]  int_pldif_pmaif_tx_data ,
	output	int_pldif_pmaif_tx_pld_clk ,
	output	int_pldif_pmaif_tx_pld_rst_n ,
	output	int_pldif_pmaif_txelecidle ,
	output	int_pldif_pmaif_txpma_rstb ,
	output	int_pldif_pmaif_uhsif_tx_clk ,
	output	[63:0]  int_pldif_pmaif_uhsif_tx_data ,
	output	pld_10g_krfec_tx_frame ,
	output	pld_10g_tx_burst_en_exe ,
	output	pld_10g_tx_empty ,
	output	[3:0]  pld_10g_tx_fifo_num ,
	output	pld_10g_tx_full ,
	output	pld_10g_tx_pempty ,
	output	pld_10g_tx_pfull ,
	output	pld_10g_tx_wordslip_exe ,
	output	pld_8g_empty_tx ,
	output	pld_8g_full_tx ,
	output	pld_krfec_tx_alignment ,
	output	pld_pcs_tx_clk_out ,
	output	pld_pma_clkdiv_tx_user ,
	output	pld_pma_tx_clk_out ,
	output	pld_uhsif_tx_clk_out 

);


	twentynm_hssi_tx_pld_pcs_interface_encrypted
	#(
		.enable_debug_info(enable_debug_info) ,

		.hd_10g_advanced_user_mode_tx(hd_10g_advanced_user_mode_tx) ,
		.hd_10g_channel_operation_mode(hd_10g_channel_operation_mode) ,
		.hd_10g_ctrl_plane_bonding_tx(hd_10g_ctrl_plane_bonding_tx) ,
		.hd_10g_fifo_mode_tx(hd_10g_fifo_mode_tx) ,
		.hd_10g_low_latency_en_tx(hd_10g_low_latency_en_tx) ,
		.hd_10g_lpbk_en(hd_10g_lpbk_en) ,
		.hd_10g_pma_dw_tx(hd_10g_pma_dw_tx) ,
		.hd_10g_prot_mode_tx(hd_10g_prot_mode_tx) ,
		.hd_10g_shared_fifo_width_tx(hd_10g_shared_fifo_width_tx) ,
		.hd_10g_sup_mode(hd_10g_sup_mode) ,
		.hd_8g_channel_operation_mode(hd_8g_channel_operation_mode) ,
		.hd_8g_ctrl_plane_bonding_tx(hd_8g_ctrl_plane_bonding_tx) ,
		.hd_8g_fifo_mode_tx(hd_8g_fifo_mode_tx) ,
		.hd_8g_hip_mode(hd_8g_hip_mode) ,
		.hd_8g_lpbk_en(hd_8g_lpbk_en) ,
		.hd_8g_pma_dw_tx(hd_8g_pma_dw_tx) ,
		.hd_8g_prot_mode_tx(hd_8g_prot_mode_tx) ,
		.hd_8g_sup_mode(hd_8g_sup_mode) ,
		.hd_chnl_channel_operation_mode(hd_chnl_channel_operation_mode) ,
		.hd_chnl_ctrl_plane_bonding_tx(hd_chnl_ctrl_plane_bonding_tx) ,
		.hd_chnl_frequency_rules_en(hd_chnl_frequency_rules_en) ,
		.hd_chnl_func_mode(hd_chnl_func_mode) ,
		.hd_chnl_hclk_clk_hz(hd_chnl_hclk_clk_hz) ,
		.hd_chnl_hip_en(hd_chnl_hip_en) ,
		.hd_chnl_hrdrstctl_en(hd_chnl_hrdrstctl_en) ,
		.hd_chnl_low_latency_en_tx(hd_chnl_low_latency_en_tx) ,
		.hd_chnl_lpbk_en(hd_chnl_lpbk_en) ,
		.hd_chnl_pcs_tx_ac_pwr_uw_per_mhz(hd_chnl_pcs_tx_ac_pwr_uw_per_mhz) ,
		.hd_chnl_pcs_tx_pwr_scaling_clk(hd_chnl_pcs_tx_pwr_scaling_clk) ,
		.hd_chnl_pld_8g_refclk_dig_nonatpg_mode_clk_hz(hd_chnl_pld_8g_refclk_dig_nonatpg_mode_clk_hz) ,
		.hd_chnl_pld_fifo_mode_tx(hd_chnl_pld_fifo_mode_tx) ,
		.hd_chnl_pld_pcs_refclk_dig_nonatpg_mode_clk_hz(hd_chnl_pld_pcs_refclk_dig_nonatpg_mode_clk_hz) ,
		.hd_chnl_pld_tx_clk_hz(hd_chnl_pld_tx_clk_hz) ,
		.hd_chnl_pld_uhsif_tx_clk_hz(hd_chnl_pld_uhsif_tx_clk_hz) ,
		.hd_chnl_pma_dw_tx(hd_chnl_pma_dw_tx) ,
		.hd_chnl_pma_tx_clk_hz(hd_chnl_pma_tx_clk_hz) ,
		.hd_chnl_prot_mode_tx(hd_chnl_prot_mode_tx) ,
		.hd_chnl_shared_fifo_width_tx(hd_chnl_shared_fifo_width_tx) ,
		.hd_chnl_speed_grade(hd_chnl_speed_grade) ,
		.hd_chnl_sup_mode(hd_chnl_sup_mode) ,
		.hd_fifo_channel_operation_mode(hd_fifo_channel_operation_mode) ,
		.hd_fifo_prot_mode_tx(hd_fifo_prot_mode_tx) ,
		.hd_fifo_shared_fifo_width_tx(hd_fifo_shared_fifo_width_tx) ,
		.hd_fifo_sup_mode(hd_fifo_sup_mode) ,
		.hd_g3_prot_mode(hd_g3_prot_mode) ,
		.hd_g3_sup_mode(hd_g3_sup_mode) ,
		.hd_krfec_channel_operation_mode(hd_krfec_channel_operation_mode) ,
		.hd_krfec_low_latency_en_tx(hd_krfec_low_latency_en_tx) ,
		.hd_krfec_lpbk_en(hd_krfec_lpbk_en) ,
		.hd_krfec_prot_mode_tx(hd_krfec_prot_mode_tx) ,
		.hd_krfec_sup_mode(hd_krfec_sup_mode) ,
		.hd_pldif_hrdrstctl_en(hd_pldif_hrdrstctl_en) ,
		.hd_pldif_prot_mode_tx(hd_pldif_prot_mode_tx) ,
		.hd_pldif_sup_mode(hd_pldif_sup_mode) ,
		.hd_pmaif_channel_operation_mode(hd_pmaif_channel_operation_mode) ,
		.hd_pmaif_ctrl_plane_bonding(hd_pmaif_ctrl_plane_bonding) ,
		.hd_pmaif_lpbk_en(hd_pmaif_lpbk_en) ,
		.hd_pmaif_pma_dw_tx(hd_pmaif_pma_dw_tx) ,
		.hd_pmaif_prot_mode_tx(hd_pmaif_prot_mode_tx) ,
		.hd_pmaif_sim_mode(hd_pmaif_sim_mode) ,
		.hd_pmaif_sup_mode(hd_pmaif_sup_mode) ,
		.pcs_tx_clk_out_sel(pcs_tx_clk_out_sel) ,
		.pcs_tx_clk_source(pcs_tx_clk_source) ,
		.pcs_tx_data_source(pcs_tx_data_source) ,
		.pcs_tx_delay1_clk_en(pcs_tx_delay1_clk_en) ,
		.pcs_tx_delay1_clk_sel(pcs_tx_delay1_clk_sel) ,
		.pcs_tx_delay1_ctrl(pcs_tx_delay1_ctrl) ,
		.pcs_tx_delay1_data_sel(pcs_tx_delay1_data_sel) ,
		.pcs_tx_delay2_clk_en(pcs_tx_delay2_clk_en) ,
		.pcs_tx_delay2_ctrl(pcs_tx_delay2_ctrl) ,
		.pcs_tx_output_sel(pcs_tx_output_sel) ,
		.reconfig_settings(reconfig_settings) ,
		.silicon_rev(silicon_rev)

	)
	twentynm_hssi_tx_pld_pcs_interface_encrypted_inst (

		.avmmaddress(avmmaddress),
		.avmmclk(avmmclk),
		.avmmread(avmmread),
		.avmmrstn(avmmrstn),
		.avmmwrite(avmmwrite),
		.avmmwritedata(avmmwritedata),
		.hip_tx_data(hip_tx_data),
		.int_pldif_10g_tx_burst_en_exe(int_pldif_10g_tx_burst_en_exe),
		.int_pldif_10g_tx_clk_out(int_pldif_10g_tx_clk_out),
		.int_pldif_10g_tx_clk_out_pld_if(int_pldif_10g_tx_clk_out_pld_if),
		.int_pldif_10g_tx_empty(int_pldif_10g_tx_empty),
		.int_pldif_10g_tx_fifo_num(int_pldif_10g_tx_fifo_num),
		.int_pldif_10g_tx_frame(int_pldif_10g_tx_frame),
		.int_pldif_10g_tx_full(int_pldif_10g_tx_full),
		.int_pldif_10g_tx_pempty(int_pldif_10g_tx_pempty),
		.int_pldif_10g_tx_pfull(int_pldif_10g_tx_pfull),
		.int_pldif_10g_tx_wordslip_exe(int_pldif_10g_tx_wordslip_exe),
		.int_pldif_8g_empty_tx(int_pldif_8g_empty_tx),
		.int_pldif_8g_full_tx(int_pldif_8g_full_tx),
		.int_pldif_8g_tx_clk_out(int_pldif_8g_tx_clk_out),
		.int_pldif_8g_tx_clk_out_pld_if(int_pldif_8g_tx_clk_out_pld_if),
		.int_pldif_krfec_tx_alignment(int_pldif_krfec_tx_alignment),
		.int_pldif_krfec_tx_frame(int_pldif_krfec_tx_frame),
		.int_pldif_pmaif_clkdiv_tx(int_pldif_pmaif_clkdiv_tx),
		.int_pldif_pmaif_clkdiv_tx_user(int_pldif_pmaif_clkdiv_tx_user),
		.int_pldif_pmaif_uhsif_tx_clk_out(int_pldif_pmaif_uhsif_tx_clk_out),
		.pld_10g_krfec_tx_pld_rst_n(pld_10g_krfec_tx_pld_rst_n),
		.pld_10g_tx_bitslip(pld_10g_tx_bitslip),
		.pld_10g_tx_burst_en(pld_10g_tx_burst_en),
		.pld_10g_tx_data_valid(pld_10g_tx_data_valid),
		.pld_10g_tx_diag_status(pld_10g_tx_diag_status),
		.pld_10g_tx_wordslip(pld_10g_tx_wordslip),
		.pld_8g_g3_tx_pld_rst_n(pld_8g_g3_tx_pld_rst_n),
		.pld_8g_rddisable_tx(pld_8g_rddisable_tx),
		.pld_8g_tx_boundary_sel(pld_8g_tx_boundary_sel),
		.pld_8g_wrenable_tx(pld_8g_wrenable_tx),
		.pld_partial_reconfig(pld_partial_reconfig),
		.pld_pma_txpma_rstb(pld_pma_txpma_rstb),
		.pld_pmaif_tx_pld_rst_n(pld_pmaif_tx_pld_rst_n),
		.pld_polinv_tx(pld_polinv_tx),
		.pld_tx_clk(pld_tx_clk),
		.pld_tx_control(pld_tx_control),
		.pld_tx_data(pld_tx_data),
		.pld_txelecidle(pld_txelecidle),
		.pld_uhsif_tx_clk(pld_uhsif_tx_clk),
		.scan_mode_n(scan_mode_n),
		.avmmreaddata(avmmreaddata),
		.blockselect(blockselect),
		.hip_clk_out_div_by_2_wire(hip_clk_out_div_by_2_wire),
		.hip_clk_out_wire(hip_clk_out_wire),
		.pld_10g_tx_burst_en_exe_10g_fastreg(pld_10g_tx_burst_en_exe_10g_fastreg),
		.pld_10g_tx_burst_en_exe_plddirect_reg(pld_10g_tx_burst_en_exe_plddirect_reg),
		.pld_10g_tx_data_valid_2ff_delay1_fastreg(pld_10g_tx_data_valid_2ff_delay1_fastreg),
		.pld_10g_tx_data_valid_2ff_delay3_fastreg(pld_10g_tx_data_valid_2ff_delay3_fastreg),
		.pld_10g_tx_data_valid_2ff_delay4_fastreg(pld_10g_tx_data_valid_2ff_delay4_fastreg),
		.pld_10g_tx_data_valid_2ff_delay4_plddirect_fastreg(pld_10g_tx_data_valid_2ff_delay4_plddirect_fastreg),
		.pld_10g_tx_data_valid_2ff_delay6_fastreg(pld_10g_tx_data_valid_2ff_delay6_fastreg),
		.pld_10g_tx_data_valid_2ff_delay6_plddirect_fastreg(pld_10g_tx_data_valid_2ff_delay6_plddirect_fastreg),
		.pld_10g_tx_data_valid_fastreg(pld_10g_tx_data_valid_fastreg),
		.pld_10g_tx_data_valid_plddirect_fastreg(pld_10g_tx_data_valid_plddirect_fastreg),
		.pld_pcs_tx_clk_out_pma_wire(pld_pcs_tx_clk_out_pma_wire),
		.pld_pma_tx_clk_out_wire(pld_pma_tx_clk_out_wire),
		.pld_pmaif_tx_pld_rst_n_reg(pld_pmaif_tx_pld_rst_n_reg),
		.pld_polinv_tx_10g_pcsdirect_reg(pld_polinv_tx_10g_pcsdirect_reg),
		.pld_polinv_tx_8g_reg(pld_polinv_tx_8g_reg),
		.pld_polinv_tx_pat_reg(pld_polinv_tx_pat_reg),
		.pld_tx_clk_fifo(pld_tx_clk_fifo),
		.pld_tx_control_fifo(pld_tx_control_fifo),
		.pld_tx_control_hi_10g_reg(pld_tx_control_hi_10g_reg),
		.pld_tx_control_lo_10g_2ff_delay4_fastreg(pld_tx_control_lo_10g_2ff_delay4_fastreg),
		.pld_tx_control_lo_10g_2ff_delay6_fastreg(pld_tx_control_lo_10g_2ff_delay6_fastreg),
		.pld_tx_control_lo_10g_fastreg(pld_tx_control_lo_10g_fastreg),
		.pld_tx_control_lo_8g_2ff_delay4_fastreg(pld_tx_control_lo_8g_2ff_delay4_fastreg),
		.pld_tx_control_lo_8g_2ff_delay6_fastreg(pld_tx_control_lo_8g_2ff_delay6_fastreg),
		.pld_tx_control_lo_8g_fastreg(pld_tx_control_lo_8g_fastreg),
		.pld_tx_control_lo_plddirect_2ff_delay1_fastreg(pld_tx_control_lo_plddirect_2ff_delay1_fastreg),
		.pld_tx_control_lo_plddirect_2ff_delay3_fastreg(pld_tx_control_lo_plddirect_2ff_delay3_fastreg),
		.pld_tx_control_lo_plddirect_2ff_delay4_fastreg(pld_tx_control_lo_plddirect_2ff_delay4_fastreg),
		.pld_tx_control_lo_plddirect_2ff_delay6_fastreg(pld_tx_control_lo_plddirect_2ff_delay6_fastreg),
		.pld_tx_control_lo_plddirect_fastreg(pld_tx_control_lo_plddirect_fastreg),
		.pld_tx_control_lo_plddirect_reg(pld_tx_control_lo_plddirect_reg),
		.pld_tx_data_hi_reg(pld_tx_data_hi_reg),
		.pld_tx_data_lo_10g_2ff_delay4_fastreg(pld_tx_data_lo_10g_2ff_delay4_fastreg),
		.pld_tx_data_lo_10g_2ff_delay6_fastreg(pld_tx_data_lo_10g_2ff_delay6_fastreg),
		.pld_tx_data_lo_10g_fastreg(pld_tx_data_lo_10g_fastreg),
		.pld_tx_data_lo_8g_2ff_delay4_fastreg(pld_tx_data_lo_8g_2ff_delay4_fastreg),
		.pld_tx_data_lo_8g_2ff_delay6_fastreg(pld_tx_data_lo_8g_2ff_delay6_fastreg),
		.pld_tx_data_lo_8g_fastreg(pld_tx_data_lo_8g_fastreg),
		.pld_tx_data_lo_plddirect_2ff_delay1_fastreg(pld_tx_data_lo_plddirect_2ff_delay1_fastreg),
		.pld_tx_data_lo_plddirect_2ff_delay3_fastreg(pld_tx_data_lo_plddirect_2ff_delay3_fastreg),
		.pld_tx_data_lo_plddirect_2ff_delay4_fastreg(pld_tx_data_lo_plddirect_2ff_delay4_fastreg),
		.pld_tx_data_lo_plddirect_2ff_delay6_fastreg(pld_tx_data_lo_plddirect_2ff_delay6_fastreg),
		.pld_tx_data_lo_plddirect_fastreg(pld_tx_data_lo_plddirect_fastreg),
		.pld_tx_data_lo_plddirect_reg(pld_tx_data_lo_plddirect_reg),
		.pld_uhsif_reg(pld_uhsif_reg),
		.pma_tx_pma_clk_reg(pma_tx_pma_clk_reg),
		.hip_tx_clk(hip_tx_clk),
		.int_pldif_10g_tx_bitslip(int_pldif_10g_tx_bitslip),
		.int_pldif_10g_tx_burst_en(int_pldif_10g_tx_burst_en),
		.int_pldif_10g_tx_control(int_pldif_10g_tx_control),
		.int_pldif_10g_tx_control_reg(int_pldif_10g_tx_control_reg),
		.int_pldif_10g_tx_data(int_pldif_10g_tx_data),
		.int_pldif_10g_tx_data_reg(int_pldif_10g_tx_data_reg),
		.int_pldif_10g_tx_data_valid(int_pldif_10g_tx_data_valid),
		.int_pldif_10g_tx_data_valid_reg(int_pldif_10g_tx_data_valid_reg),
		.int_pldif_10g_tx_diag_status(int_pldif_10g_tx_diag_status),
		.int_pldif_10g_tx_pld_clk(int_pldif_10g_tx_pld_clk),
		.int_pldif_10g_tx_pld_rst_n(int_pldif_10g_tx_pld_rst_n),
		.int_pldif_10g_tx_wordslip(int_pldif_10g_tx_wordslip),
		.int_pldif_8g_pld_tx_clk(int_pldif_8g_pld_tx_clk),
		.int_pldif_8g_powerdown(int_pldif_8g_powerdown),
		.int_pldif_8g_rddisable_tx(int_pldif_8g_rddisable_tx),
		.int_pldif_8g_rev_loopbk(int_pldif_8g_rev_loopbk),
		.int_pldif_8g_tx_blk_start(int_pldif_8g_tx_blk_start),
		.int_pldif_8g_tx_boundary_sel(int_pldif_8g_tx_boundary_sel),
		.int_pldif_8g_tx_data_valid(int_pldif_8g_tx_data_valid),
		.int_pldif_8g_tx_sync_hdr(int_pldif_8g_tx_sync_hdr),
		.int_pldif_8g_txd(int_pldif_8g_txd),
		.int_pldif_8g_txd_fast_reg(int_pldif_8g_txd_fast_reg),
		.int_pldif_8g_txdeemph(int_pldif_8g_txdeemph),
		.int_pldif_8g_txdetectrxloopback(int_pldif_8g_txdetectrxloopback),
		.int_pldif_8g_txelecidle(int_pldif_8g_txelecidle),
		.int_pldif_8g_txmargin(int_pldif_8g_txmargin),
		.int_pldif_8g_txswing(int_pldif_8g_txswing),
		.int_pldif_8g_txurstpcs_n(int_pldif_8g_txurstpcs_n),
		.int_pldif_8g_wrenable_tx(int_pldif_8g_wrenable_tx),
		.int_pldif_pmaif_8g_txurstpcs_n(int_pldif_pmaif_8g_txurstpcs_n),
		.int_pldif_pmaif_polinv_tx(int_pldif_pmaif_polinv_tx),
		.int_pldif_pmaif_tx_data(int_pldif_pmaif_tx_data),
		.int_pldif_pmaif_tx_pld_clk(int_pldif_pmaif_tx_pld_clk),
		.int_pldif_pmaif_tx_pld_rst_n(int_pldif_pmaif_tx_pld_rst_n),
		.int_pldif_pmaif_txelecidle(int_pldif_pmaif_txelecidle),
		.int_pldif_pmaif_txpma_rstb(int_pldif_pmaif_txpma_rstb),
		.int_pldif_pmaif_uhsif_tx_clk(int_pldif_pmaif_uhsif_tx_clk),
		.int_pldif_pmaif_uhsif_tx_data(int_pldif_pmaif_uhsif_tx_data),
		.pld_10g_krfec_tx_frame(pld_10g_krfec_tx_frame),
		.pld_10g_tx_burst_en_exe(pld_10g_tx_burst_en_exe),
		.pld_10g_tx_empty(pld_10g_tx_empty),
		.pld_10g_tx_fifo_num(pld_10g_tx_fifo_num),
		.pld_10g_tx_full(pld_10g_tx_full),
		.pld_10g_tx_pempty(pld_10g_tx_pempty),
		.pld_10g_tx_pfull(pld_10g_tx_pfull),
		.pld_10g_tx_wordslip_exe(pld_10g_tx_wordslip_exe),
		.pld_8g_empty_tx(pld_8g_empty_tx),
		.pld_8g_full_tx(pld_8g_full_tx),
		.pld_krfec_tx_alignment(pld_krfec_tx_alignment),
		.pld_pcs_tx_clk_out(pld_pcs_tx_clk_out),
		.pld_pma_clkdiv_tx_user(pld_pma_clkdiv_tx_user),
		.pld_pma_tx_clk_out(pld_pma_tx_clk_out),
		.pld_uhsif_tx_clk_out(pld_uhsif_tx_clk_out)

	);

endmodule
// -----------------------------------------------------------
// This is hand-written HSSI Simulation Atom Model Encryption Wrapper
// Module Name : ./twentynm_hssi_avmm_if_wrapper.v
// -----------------------------------------------------------

`timescale 1 ps/1 ps

module twentynm_hssi_avmm_if
#(
    parameter silicon_rev      = "reve",              //Valid values: reve , es 
    parameter calibration_en   = "enable",            //Indicates whether calibration by Hard Nios is enabled or not. Valid values: enable, disable
    parameter arbiter_ctrl     = "uc",                //Indicates whether UC (hard Nios) or PLD AVMM interface uses the internal DPRIO bus. Valid values: UC,PLD
    parameter cal_done         = "cal_done_assert",   //Indicates whether calibration is done. This is the start-up value for the corresponding CRAM. THe CRAM is eventually accessed and updated by the Hard uC during calibration. Valid values: cal_done_assert, cal_done_deassert
    parameter hip_cal_en       = "disable",           //Indicates whether HIP is enabled or not. Valid values: disable, enable
    parameter cal_reserved     = 5'b00000,
    parameter calibration_type = "one_time"           //Virtual attribute with no associated BCM settings. Intended to be set by the IP based on the chosen calibration option and used only by the AVMM sim model to decide whether to release the AVMM interface to the user after start-up or hold on to it until the user request according to the hardware implementation.  Valid values: one_time, continuous

)

(
    //AVMM interface
    input  wire           avmmclk,
    input  wire           avmmwrite,
    input  wire           avmmread,
    input  wire  [ 8:0 ]  avmmaddress,
    input  wire  [ 7:0 ]  avmmwritedata,
    output wire  [ 7:0 ]  avmmreaddata,
    
    //Side-band signals
    input  wire           avmmrequest,//AVMM request from PLD. To support adaptive calibration.
    output wire           avmmbusy,   //Indicates whether the PLD AVMM interface is available   
    output wire           hipcaldone, //Indicates whether calibration is completed (to HIP)    
    output wire           pldcaldone, //Indicates whether calibration is completed (to PLD)    

    //DPRIO interface to/from atoms
    output wire                 clkchnl,
    output wire                 rstnchnl,
    output wire   [  7:0 ]      writedatachnl,
    output wire   [  8:0 ]      regaddrchnl,
    output wire                 writechnl,
    output wire                 readchnl,
    input  wire  [   70 -1:0 ]  blockselect,
    input  wire  [ 70*8 -1:0 ]  readdatachnl,

    //The following ports are not modelled in simulation. They exist to match the avmm interface atom interface
    //Reset for the DPRIO registers (PLD controlled in scan mode only)
    input  wire                 avmmrstn,
    //Scan mode 
    input  wire                 scanmoden,
    input  wire                 scanshiftn,
    //Process monitor
    input  wire                 avmmreservedin,
    output wire                 avmmreservedout
);

	twentynm_hssi_avmm_if_encrypted
	#(
		.silicon_rev(silicon_rev),
		.calibration_en(calibration_en),
		.arbiter_ctrl(arbiter_ctrl),
		.cal_done(cal_done),
		.hip_cal_en(hip_cal_en),
		.cal_reserved(cal_reserved),
		.calibration_type(calibration_type)
	)
	twentynm_hssi_avmm_if_encrypted_inst (

		.avmmaddress(avmmaddress),
		.avmmclk(avmmclk),
		.avmmread(avmmread),
		.avmmrstn(avmmrstn),
		.avmmwrite(avmmwrite),
		.avmmwritedata(avmmwritedata),
		.avmmreaddata(avmmreaddata),
		.blockselect(blockselect),
		.avmmrequest(avmmrequest),
		.avmmbusy(avmmbusy),
		.hipcaldone(hipcaldone),
		.pldcaldone(pldcaldone),
		.clkchnl(clkchnl),
		.rstnchnl(rstnchnl),
		.writedatachnl(writedatachnl),
		.regaddrchnl(regaddrchnl),
		.writechnl(writechnl),
		.readchnl(readchnl),
		.readdatachnl(readdatachnl),
		.scanmoden(scanmoden),
		.scanshiftn(scanshiftn),
		.avmmreservedin(avmmreservedin),
		.avmmreservedout(avmmreservedout)

	);

endmodule
