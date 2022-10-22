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
// Module Name : work/twentynm_hssi_gen3_x8_pcie_hip_wrapper.v
// -----------------------------------------------------------

`timescale 1 ps/1 ps

module twentynm_hssi_gen3_x8_pcie_hip
#(
	// Parameter declaration and default value assignment

	parameter enable_debug_info = "true",	//Valid values: false|true; this is simulation-only parameter, for debug purpose only

	parameter	acknack_base = 13'b0000000000000 ,		//Valid values: 13 
	parameter	acknack_set = "false" ,		//Valid values: false true 
	parameter	advance_error_reporting = "disable" ,		//Valid values: disable enable 
	parameter	app_interface_width = "avst_64bit" ,		//Valid values: avst_64bit avst_128bit avst_256bit 
	parameter	arb_upfc_30us_counter = 4'b0000 ,		//Valid values: 4 
	parameter	arb_upfc_30us_en = "enable" ,		//Valid values: disable enable 
	parameter	aspm_config_management = "true" ,		//Valid values: false true 
	parameter	aspm_patch_disable = "enable_both" ,		//Valid values: enable_both disable_low_pwr disable_pex_quiet disable_both 
	parameter	ast_width_rx = "rx_64" ,		//Valid values: reserved rx_64 rx_128 rx_256 
	parameter	ast_width_tx = "tx_64" ,		//Valid values: tx_64 tx_128 tx_256 
	parameter	atomic_malformed = "false" ,		//Valid values: false true 
	parameter	atomic_op_completer_32bit = "false" ,		//Valid values: false true 
	parameter	atomic_op_completer_64bit = "false" ,		//Valid values: false true 
	parameter	atomic_op_routing = "false" ,		//Valid values: false true 
	parameter	auto_msg_drop_enable = "false" ,		//Valid values: false true 
	parameter	avmm_cvp_inter_sel_csr_ctrl = "disable" ,		//Valid values: disable enable 
	parameter	avmm_dprio_broadcast_en_csr_ctrl = "disable" ,		//Valid values: disable enable 
	parameter	avmm_force_inter_sel_csr_ctrl = "disable" ,		//Valid values: disable enable 
	parameter	avmm_power_iso_en_csr_ctrl = "disable" ,		//Valid values: disable enable 
	parameter	bar0_size_mask = 28'b1111111111111111111111111111 ,		//Valid values: 28 
	parameter	bar0_type = "bar0_64bit_prefetch_mem" ,		//Valid values: bar0_64bit_prefetch_mem bar0_32bit_non_prefetch_mem bar0_32bit_prefetch_mem bar0_io_addr_space bar0_disable 
	parameter	bar1_size_mask = 28'b0000000000000000000000000000 ,		//Valid values: 28 
	parameter	bar1_type = "bar1_disable" ,		//Valid values: bar1_32bit_non_prefetch_mem bar1_32bit_prefetch_mem bar1_io_addr_space bar1_disable bar1_64_1_one bar1_64_2_one bar1_64_3_one bar1_64_all_one 
	parameter	bar2_size_mask = 28'b0000000000000000000000000000 ,		//Valid values: 28 
	parameter	bar2_type = "bar2_disable" ,		//Valid values: bar2_64bit_prefetch_mem bar2_32bit_non_prefetch_mem bar2_32bit_prefetch_mem bar2_io_addr_space bar2_disable 
	parameter	bar3_size_mask = 28'b0000000000000000000000000000 ,		//Valid values: 28 
	parameter	bar3_type = "bar3_disable" ,		//Valid values: bar3_32bit_non_prefetch_mem bar3_32bit_prefetch_mem bar3_io_addr_space bar3_disable bar3_64_1_one bar3_64_2_one bar3_64_3_one bar3_64_all_one 
	parameter	bar4_size_mask = 28'b0000000000000000000000000000 ,		//Valid values: 28 
	parameter	bar4_type = "bar4_disable" ,		//Valid values: bar4_64bit_prefetch_mem bar4_32bit_non_prefetch_mem bar4_32bit_prefetch_mem bar4_io_addr_space bar4_disable 
	parameter	bar5_size_mask = 28'b0000000000000000000000000000 ,		//Valid values: 28 
	parameter	bar5_type = "bar5_disable" ,		//Valid values: bar5_32bit_non_prefetch_mem bar5_32bit_prefetch_mem bar5_io_addr_space bar5_disable bar5_64_1_one bar5_64_2_one bar5_64_3_one bar5_64_all_one 
	parameter	base_counter_sel = "count_clk_62p5" ,		//Valid values: count_clk_62p5 count_clk_31p25 
	parameter	bist_memory_settings = 84'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000 ,		//Valid values: 
	parameter	bridge_port_ssid_support = "false" ,		//Valid values: false true 
	parameter	bridge_port_vga_enable = "false" ,		//Valid values: false true 
	parameter	bypass_cdc = "false" ,		//Valid values: false true 
	parameter	bypass_clk_switch = "false" ,		//Valid values: false true 
	parameter	bypass_tl = "false" ,		//Valid values: false true 
	parameter	capab_rate_rxcfg_en = "disable" ,		//Valid values: disable enable 
	parameter	cas_completer_128bit = "false" ,		//Valid values: false true 
	parameter	cdc_clk_relation = "plesiochronous" ,		//Valid values: plesiochronous mesochronous 
	parameter	cdc_dummy_insert_limit = 4'b1011 ,		//Valid values: 4 
	parameter	cfg_parchk_ena = "disable" ,		//Valid values: disable enable 
	parameter	cfgbp_req_recov_disable = "false" ,		//Valid values: false true 
	parameter	class_code = 24'b111111110000000000000000 ,		//Valid values: 24 
	parameter	clock_pwr_management = "false" ,		//Valid values: false true 
	parameter	completion_timeout = "abcd" ,		//Valid values: none_compl_timeout a b ab bc abc bcd abcd 
	parameter	core_clk_divider = "div_1" ,		//Valid values: div_1 div_2 div_4 div_8 
	parameter	core_clk_freq_mhz = "core_clk_250mhz" ,		//Valid values: core_clk_62p5mhz core_clk_125mhz core_clk_250mhz 
	parameter	core_clk_out_sel = "core_clk_out_div_1" ,		//Valid values: core_clk_out_div_1 core_clk_out_div_2 core_clk_out_div_4 core_clk_out_div_8 
	parameter	core_clk_sel = "pld_clk" ,		//Valid values: pld_clk core_clk_250 
	parameter	core_clk_source = "pll_fixed_clk" ,		//Valid values: pll_fixed_clk pclk_out core_clk_in 
	parameter	cseb_bar_match_checking = "enable" ,		//Valid values: disable enable 
	parameter	cseb_config_bypass = "disable" ,		//Valid values: disable enable 
	parameter	cseb_cpl_status_during_cvp = "completer_abort" ,		//Valid values: success_data_ffff unsupported_request config_retry_status completer_abort success_data_0000 success_next_cap_ptr_0 
	parameter	cseb_cpl_tag_checking = "enable" ,		//Valid values: disable enable 
	parameter	cseb_disable_auto_crs = "false" ,		//Valid values: false true 
	parameter	cseb_extend_pci = "false" ,		//Valid values: false true 
	parameter	cseb_extend_pcie = "false" ,		//Valid values: false true 
	parameter	cseb_min_error_checking = "false" ,		//Valid values: false true 
	parameter	cseb_route_to_avl_rx_st = "cseb" ,		//Valid values: cseb avst 
	parameter	cseb_temp_busy_crs = "completer_abort_tmp_busy" ,		//Valid values: completer_abort_tmp_busy config_retry_status_tmp_busy 
	parameter	cvp_clk_reset = "false" ,		//Valid values: false true 
	parameter	cvp_data_compressed = "false" ,		//Valid values: false true 
	parameter	cvp_data_encrypted = "false" ,		//Valid values: false true 
	parameter	cvp_enable = "cvp_dis" ,		//Valid values: cvp_dis cvp_en 
	parameter	cvp_mode_reset = "false" ,		//Valid values: false true 
	parameter	cvp_rate_sel = "full_rate" ,		//Valid values: full_rate half_rate 
	parameter	d0_pme = "false" ,		//Valid values: false true 
	parameter	d1_pme = "false" ,		//Valid values: false true 
	parameter	d1_support = "false" ,		//Valid values: false true 
	parameter	d2_pme = "false" ,		//Valid values: false true 
	parameter	d2_support = "false" ,		//Valid values: false true 
	parameter	d3_cold_pme = "false" ,		//Valid values: false true 
	parameter	d3_hot_pme = "false" ,		//Valid values: false true 
	parameter	data_pack_rx = "disable" ,		//Valid values: disable enable 
	parameter	deemphasis_enable = "false" ,		//Valid values: false true 
	parameter	deskew_comma = "skp_eieos_deskw" ,		//Valid values: skp_eieos_deskw com_deskw 
	parameter	device_id = 16'b1110000000000001 ,		//Valid values: 16 
	parameter	device_number = 5'b00000 ,		//Valid values: 5 
	parameter	device_specific_init = "false" ,		//Valid values: false true 
	parameter	dft_clock_obsrv_en = "disable" ,		//Valid values: disable enable 
	parameter	dft_clock_obsrv_sel = "dft_pclk" ,		//Valid values: dft_pclk dft_pll_fixed_clk dft_pld_clk dft_core_clk_lt 
	parameter	diffclock_nfts_count = 8'b00000000 ,		//Valid values: 8 
	parameter	dis_cplovf = "disable" ,		//Valid values: disable enable 
	parameter	dis_paritychk = "enable" ,		//Valid values: disable enable 
	parameter	disable_link_x2_support = "false" ,		//Valid values: false true 
	parameter	disable_snoop_packet = "false" ,		//Valid values: false true 
	parameter	dl_tx_check_parity_edb = "disable" ,		//Valid values: disable enable 
	parameter	dll_active_report_support = "false" ,		//Valid values: false true 
	parameter	early_dl_up = "true" ,		//Valid values: false true 
	parameter	eco_fb332688_dis = "true" ,		//Valid values: false true 
	parameter	ecrc_check_capable = "true" ,		//Valid values: false true 
	parameter	ecrc_gen_capable = "true" ,		//Valid values: false true 
	parameter	egress_block_err_report_ena = "false" ,		//Valid values: false true 
	parameter	ei_delay_powerdown_count = 8'b00001010 ,		//Valid values: 8 
	parameter	eie_before_nfts_count = 4'b0100 ,		//Valid values: 4 
	parameter	electromech_interlock = "false" ,		//Valid values: false true 
	parameter	en_ieiupdatefc = "false" ,		//Valid values: false true 
	parameter	en_lane_errchk = "false" ,		//Valid values: false true 
	parameter	en_phystatus_dly = "false" ,		//Valid values: false true 
	parameter	ena_ido_cpl = "false" ,		//Valid values: false true 
	parameter	ena_ido_req = "false" ,		//Valid values: false true 
	parameter	enable_adapter_half_rate_mode = "false" ,		//Valid values: false true 
	parameter	enable_ch01_pclk_out = "pclk_ch0" ,		//Valid values: pclk_ch0 pclk_ch1 
	parameter	enable_ch0_pclk_out = "pclk_ch01" ,		//Valid values: pclk_ch01 pclk_central 
	parameter	enable_completion_timeout_disable = "true" ,		//Valid values: false true 
	parameter	enable_directed_spd_chng = "false" ,		//Valid values: false true 
	parameter	enable_function_msix_support = "true" ,		//Valid values: false true 
	parameter	enable_l0s_aspm = "false" ,		//Valid values: false true 
	parameter	enable_l1_aspm = "false" ,		//Valid values: false true 
	parameter	enable_rx_buffer_checking = "false" ,		//Valid values: false true 
	parameter	enable_rx_reordering = "true" ,		//Valid values: false true 
	parameter	enable_slot_register = "false" ,		//Valid values: false true 
	parameter	endpoint_l0_latency = 3'b000 ,		//Valid values: 3 
	parameter	endpoint_l1_latency = 3'b000 ,		//Valid values: 3 
	parameter	eql_rq_int_en_number = 6'b000000 ,		//Valid values: 6 
	parameter	errmgt_fcpe_patch_dis = "enable" ,		//Valid values: disable enable 
	parameter	errmgt_fep_patch_dis = "enable" ,		//Valid values: disable enable 
	parameter	expansion_base_address_register = 32'b00000000000000000000000000000000 ,		//Valid values: 
	parameter	extend_tag_field = "false" ,		//Valid values: false true 
	parameter	extended_format_field = "true" ,		//Valid values: false true 
	parameter	extended_tag_reset = "false" ,		//Valid values: false true 
	parameter	fc_init_timer = 11'b10000000000 ,		//Valid values: 11 
	parameter	flow_control_timeout_count = 8'b11001000 ,		//Valid values: 8 
	parameter	flow_control_update_count = 5'b11110 ,		//Valid values: 5 
	parameter	flr_capability = "true" ,		//Valid values: false true 
	parameter	force_dis_to_det = "false" ,		//Valid values: false true 
	parameter	force_gen1_dis = "false" ,		//Valid values: false true 
	parameter	force_tx_coeff_preset_lpbk = "false" ,		//Valid values: false true 
	parameter	frame_err_patch_dis = "enable" ,		//Valid values: disable enable 
	parameter	func_mode = "disable" ,		//Valid values: disable enable 
	parameter	g3_bypass_equlz = "false" ,		//Valid values: false true 
	parameter	g3_coeff_done_tmout = "enable" ,		//Valid values: disable enable 
	parameter	g3_deskew_char = "default_sdsos" ,		//Valid values: default_sdsos skpos eieos sdsos 
	parameter	g3_dis_be_frm_err = "false" ,		//Valid values: false true 
	parameter	g3_dn_rx_hint_eqlz_0 = 3'b000 ,		//Valid values: 3 
	parameter	g3_dn_rx_hint_eqlz_1 = 3'b000 ,		//Valid values: 3 
	parameter	g3_dn_rx_hint_eqlz_2 = 3'b000 ,		//Valid values: 3 
	parameter	g3_dn_rx_hint_eqlz_3 = 3'b000 ,		//Valid values: 3 
	parameter	g3_dn_rx_hint_eqlz_4 = 3'b000 ,		//Valid values: 3 
	parameter	g3_dn_rx_hint_eqlz_5 = 3'b000 ,		//Valid values: 3 
	parameter	g3_dn_rx_hint_eqlz_6 = 3'b000 ,		//Valid values: 3 
	parameter	g3_dn_rx_hint_eqlz_7 = 3'b000 ,		//Valid values: 3 
	parameter	g3_dn_tx_preset_eqlz_0 = 4'b0000 ,		//Valid values: 4 
	parameter	g3_dn_tx_preset_eqlz_1 = 4'b0000 ,		//Valid values: 4 
	parameter	g3_dn_tx_preset_eqlz_2 = 4'b0000 ,		//Valid values: 4 
	parameter	g3_dn_tx_preset_eqlz_3 = 4'b0000 ,		//Valid values: 4 
	parameter	g3_dn_tx_preset_eqlz_4 = 4'b0000 ,		//Valid values: 4 
	parameter	g3_dn_tx_preset_eqlz_5 = 4'b0000 ,		//Valid values: 4 
	parameter	g3_dn_tx_preset_eqlz_6 = 4'b0000 ,		//Valid values: 4 
	parameter	g3_dn_tx_preset_eqlz_7 = 4'b0000 ,		//Valid values: 4 
	parameter	g3_force_ber_max = "false" ,		//Valid values: false true 
	parameter	g3_force_ber_min = "false" ,		//Valid values: false true 
	parameter	g3_lnk_trn_rx_ts = "false" ,		//Valid values: false true 
	parameter	g3_ltssm_eq_dbg = "false" ,		//Valid values: false true 
	parameter	g3_ltssm_rec_dbg = "false" ,		//Valid values: false true 
	parameter	g3_pause_ltssm_rec_en = "disable" ,		//Valid values: disable enable 
	parameter	g3_quiesce_guarant = "false" ,		//Valid values: false true 
	parameter	g3_redo_equlz_dis = "false" ,		//Valid values: false true 
	parameter	g3_redo_equlz_en = "false" ,		//Valid values: false true 
	parameter	g3_up_rx_hint_eqlz_0 = 3'b000 ,		//Valid values: 3 
	parameter	g3_up_rx_hint_eqlz_1 = 3'b000 ,		//Valid values: 3 
	parameter	g3_up_rx_hint_eqlz_2 = 3'b000 ,		//Valid values: 3 
	parameter	g3_up_rx_hint_eqlz_3 = 3'b000 ,		//Valid values: 3 
	parameter	g3_up_rx_hint_eqlz_4 = 3'b000 ,		//Valid values: 3 
	parameter	g3_up_rx_hint_eqlz_5 = 3'b000 ,		//Valid values: 3 
	parameter	g3_up_rx_hint_eqlz_6 = 3'b000 ,		//Valid values: 3 
	parameter	g3_up_rx_hint_eqlz_7 = 3'b000 ,		//Valid values: 3 
	parameter	g3_up_tx_preset_eqlz_0 = 4'b0000 ,		//Valid values: 4 
	parameter	g3_up_tx_preset_eqlz_1 = 4'b0000 ,		//Valid values: 4 
	parameter	g3_up_tx_preset_eqlz_2 = 4'b0000 ,		//Valid values: 4 
	parameter	g3_up_tx_preset_eqlz_3 = 4'b0000 ,		//Valid values: 4 
	parameter	g3_up_tx_preset_eqlz_4 = 4'b0000 ,		//Valid values: 4 
	parameter	g3_up_tx_preset_eqlz_5 = 4'b0000 ,		//Valid values: 4 
	parameter	g3_up_tx_preset_eqlz_6 = 4'b0000 ,		//Valid values: 4 
	parameter	g3_up_tx_preset_eqlz_7 = 4'b0000 ,		//Valid values: 4 
	parameter	gen123_lane_rate_mode = "gen1_rate" ,		//Valid values: gen1_rate gen1_gen2 gen1_gen2_gen3 
	parameter	gen2_diffclock_nfts_count = 8'b11111111 ,		//Valid values: 8 
	parameter	gen2_pma_pll_usage = "not_applicaple" ,		//Valid values: not_applicaple use_ffpll use_lcpll 
	parameter	gen2_sameclock_nfts_count = 8'b11111111 ,		//Valid values: 8 
	parameter	gen3_coeff_1 = 18'b000000000000000100 ,		//Valid values: 18 
	parameter	gen3_coeff_10 = 18'b000000000000000111 ,		//Valid values: 18 
	parameter	gen3_coeff_10_ber_meas = 6'b000010 ,		//Valid values: 6 
	parameter	gen3_coeff_10_nxtber_less = 4'b1111 ,		//Valid values: 4 
	parameter	gen3_coeff_10_nxtber_more = 4'b1010 ,		//Valid values: 4 
	parameter	gen3_coeff_10_preset_hint = 3'b011 ,		//Valid values: 3 
	parameter	gen3_coeff_10_reqber = 5'b01000 ,		//Valid values: 5 
	parameter	gen3_coeff_10_sel = "preset_10" ,		//Valid values: coeff_10 preset_10 
	parameter	gen3_coeff_11 = 18'b000000000000000111 ,		//Valid values: 18 
	parameter	gen3_coeff_11_ber_meas = 6'b000010 ,		//Valid values: 6 
	parameter	gen3_coeff_11_nxtber_less = 4'b1111 ,		//Valid values: 4 
	parameter	gen3_coeff_11_nxtber_more = 4'b1111 ,		//Valid values: 4 
	parameter	gen3_coeff_11_preset_hint = 3'b100 ,		//Valid values: 3 
	parameter	gen3_coeff_11_reqber = 5'b01000 ,		//Valid values: 5 
	parameter	gen3_coeff_11_sel = "preset_11" ,		//Valid values: coeff_11 preset_11 
	parameter	gen3_coeff_12 = 18'b000000000000000111 ,		//Valid values: 18 
	parameter	gen3_coeff_12_ber_meas = 6'b000010 ,		//Valid values: 6 
	parameter	gen3_coeff_12_nxtber_less = 4'b1111 ,		//Valid values: 4 
	parameter	gen3_coeff_12_nxtber_more = 4'b1111 ,		//Valid values: 4 
	parameter	gen3_coeff_12_preset_hint = 3'b010 ,		//Valid values: 3 
	parameter	gen3_coeff_12_reqber = 5'b01000 ,		//Valid values: 5 
	parameter	gen3_coeff_12_sel = "preset_12" ,		//Valid values: coeff_12 preset_12 
	parameter	gen3_coeff_13 = 18'b000000000000000100 ,		//Valid values: 18 
	parameter	gen3_coeff_13_ber_meas = 6'b000010 ,		//Valid values: 6 
	parameter	gen3_coeff_13_nxtber_less = 4'b1101 ,		//Valid values: 4 
	parameter	gen3_coeff_13_nxtber_more = 4'b0001 ,		//Valid values: 4 
	parameter	gen3_coeff_13_preset_hint = 3'b100 ,		//Valid values: 3 
	parameter	gen3_coeff_13_reqber = 5'b01000 ,		//Valid values: 5 
	parameter	gen3_coeff_13_sel = "preset_13" ,		//Valid values: coeff_13 preset_13 
	parameter	gen3_coeff_14 = 18'b000000000000000100 ,		//Valid values: 18 
	parameter	gen3_coeff_14_ber_meas = 6'b000010 ,		//Valid values: 6 
	parameter	gen3_coeff_14_nxtber_less = 4'b1111 ,		//Valid values: 4 
	parameter	gen3_coeff_14_nxtber_more = 4'b0010 ,		//Valid values: 4 
	parameter	gen3_coeff_14_preset_hint = 3'b000 ,		//Valid values: 3 
	parameter	gen3_coeff_14_reqber = 5'b01000 ,		//Valid values: 5 
	parameter	gen3_coeff_14_sel = "preset_14" ,		//Valid values: coeff_14 preset_14 
	parameter	gen3_coeff_15 = 18'b000000000000000000 ,		//Valid values: 18 
	parameter	gen3_coeff_15_ber_meas = 6'b000010 ,		//Valid values: 6 
	parameter	gen3_coeff_15_nxtber_less = 4'b0000 ,		//Valid values: 4 
	parameter	gen3_coeff_15_nxtber_more = 4'b0000 ,		//Valid values: 4 
	parameter	gen3_coeff_15_preset_hint = 3'b000 ,		//Valid values: 3 
	parameter	gen3_coeff_15_reqber = 5'b00000 ,		//Valid values: 5 
	parameter	gen3_coeff_15_sel = "coeff_15" ,		//Valid values: coeff_15 preset_15 
	parameter	gen3_coeff_16 = 18'b000000000000000000 ,		//Valid values: 18 
	parameter	gen3_coeff_16_ber_meas = 6'b000000 ,		//Valid values: 6 
	parameter	gen3_coeff_16_nxtber_less = 4'b0000 ,		//Valid values: 4 
	parameter	gen3_coeff_16_nxtber_more = 4'b0000 ,		//Valid values: 4 
	parameter	gen3_coeff_16_preset_hint = 3'b000 ,		//Valid values: 3 
	parameter	gen3_coeff_16_reqber = 5'b00000 ,		//Valid values: 5 
	parameter	gen3_coeff_16_sel = "coeff_16" ,		//Valid values: coeff_16 preset_16 
	parameter	gen3_coeff_17 = 18'b000000000000000000 ,		//Valid values: 18 
	parameter	gen3_coeff_17_ber_meas = 6'b000000 ,		//Valid values: 6 
	parameter	gen3_coeff_17_nxtber_less = 4'b0000 ,		//Valid values: 4 
	parameter	gen3_coeff_17_nxtber_more = 4'b0000 ,		//Valid values: 4 
	parameter	gen3_coeff_17_preset_hint = 3'b000 ,		//Valid values: 3 
	parameter	gen3_coeff_17_reqber = 5'b00000 ,		//Valid values: 5 
	parameter	gen3_coeff_17_sel = "coeff_17" ,		//Valid values: coeff_17 preset_17 
	parameter	gen3_coeff_18 = 18'b000000000000000000 ,		//Valid values: 18 
	parameter	gen3_coeff_18_ber_meas = 6'b000000 ,		//Valid values: 6 
	parameter	gen3_coeff_18_nxtber_less = 4'b0000 ,		//Valid values: 4 
	parameter	gen3_coeff_18_nxtber_more = 4'b0000 ,		//Valid values: 4 
	parameter	gen3_coeff_18_preset_hint = 3'b000 ,		//Valid values: 3 
	parameter	gen3_coeff_18_reqber = 5'b00000 ,		//Valid values: 5 
	parameter	gen3_coeff_18_sel = "coeff_18" ,		//Valid values: coeff_18 preset_18 
	parameter	gen3_coeff_19 = 18'b000000000000000000 ,		//Valid values: 18 
	parameter	gen3_coeff_19_ber_meas = 6'b000000 ,		//Valid values: 6 
	parameter	gen3_coeff_19_nxtber_less = 4'b0000 ,		//Valid values: 4 
	parameter	gen3_coeff_19_nxtber_more = 4'b0000 ,		//Valid values: 4 
	parameter	gen3_coeff_19_preset_hint = 3'b000 ,		//Valid values: 3 
	parameter	gen3_coeff_19_reqber = 5'b00000 ,		//Valid values: 5 
	parameter	gen3_coeff_19_sel = "coeff_19" ,		//Valid values: coeff_19 preset_19 
	parameter	gen3_coeff_1_ber_meas = 6'b000010 ,		//Valid values: 6 
	parameter	gen3_coeff_1_nxtber_less = 4'b1100 ,		//Valid values: 4 
	parameter	gen3_coeff_1_nxtber_more = 4'b0110 ,		//Valid values: 4 
	parameter	gen3_coeff_1_preset_hint = 3'b010 ,		//Valid values: 3 
	parameter	gen3_coeff_1_reqber = 5'b01000 ,		//Valid values: 5 
	parameter	gen3_coeff_1_sel = "preset_1" ,		//Valid values: coeff_1 preset_1 
	parameter	gen3_coeff_2 = 18'b000000000000000001 ,		//Valid values: 18 
	parameter	gen3_coeff_20 = 18'b000000000000000000 ,		//Valid values: 18 
	parameter	gen3_coeff_20_ber_meas = 6'b000000 ,		//Valid values: 6 
	parameter	gen3_coeff_20_nxtber_less = 4'b0000 ,		//Valid values: 4 
	parameter	gen3_coeff_20_nxtber_more = 4'b0000 ,		//Valid values: 4 
	parameter	gen3_coeff_20_preset_hint = 3'b000 ,		//Valid values: 3 
	parameter	gen3_coeff_20_reqber = 5'b00000 ,		//Valid values: 5 
	parameter	gen3_coeff_20_sel = "coeff_20" ,		//Valid values: coeff_20 preset_20 
	parameter	gen3_coeff_21 = 18'b000000000000000000 ,		//Valid values: 18 
	parameter	gen3_coeff_21_ber_meas = 6'b000000 ,		//Valid values: 6 
	parameter	gen3_coeff_21_nxtber_less = 4'b0000 ,		//Valid values: 4 
	parameter	gen3_coeff_21_nxtber_more = 4'b0000 ,		//Valid values: 4 
	parameter	gen3_coeff_21_preset_hint = 3'b000 ,		//Valid values: 3 
	parameter	gen3_coeff_21_reqber = 5'b00000 ,		//Valid values: 5 
	parameter	gen3_coeff_21_sel = "coeff_21" ,		//Valid values: coeff_21 preset_21 
	parameter	gen3_coeff_22 = 18'b000000000000000000 ,		//Valid values: 18 
	parameter	gen3_coeff_22_ber_meas = 6'b000000 ,		//Valid values: 6 
	parameter	gen3_coeff_22_nxtber_less = 4'b0000 ,		//Valid values: 4 
	parameter	gen3_coeff_22_nxtber_more = 4'b0000 ,		//Valid values: 4 
	parameter	gen3_coeff_22_preset_hint = 3'b000 ,		//Valid values: 3 
	parameter	gen3_coeff_22_reqber = 5'b00000 ,		//Valid values: 5 
	parameter	gen3_coeff_22_sel = "coeff_22" ,		//Valid values: coeff_22 preset_22 
	parameter	gen3_coeff_23 = 18'b000000000000000000 ,		//Valid values: 18 
	parameter	gen3_coeff_23_ber_meas = 6'b000000 ,		//Valid values: 6 
	parameter	gen3_coeff_23_nxtber_less = 4'b0000 ,		//Valid values: 4 
	parameter	gen3_coeff_23_nxtber_more = 4'b0000 ,		//Valid values: 4 
	parameter	gen3_coeff_23_preset_hint = 3'b000 ,		//Valid values: 3 
	parameter	gen3_coeff_23_reqber = 5'b00000 ,		//Valid values: 5 
	parameter	gen3_coeff_23_sel = "coeff_23" ,		//Valid values: coeff_23 preset_23 
	parameter	gen3_coeff_24 = 18'b000000000000000000 ,		//Valid values: 18 
	parameter	gen3_coeff_24_ber_meas = 6'b000000 ,		//Valid values: 6 
	parameter	gen3_coeff_24_nxtber_less = 4'b0000 ,		//Valid values: 4 
	parameter	gen3_coeff_24_nxtber_more = 4'b0000 ,		//Valid values: 4 
	parameter	gen3_coeff_24_preset_hint = 3'b000 ,		//Valid values: 3 
	parameter	gen3_coeff_24_reqber = 5'b00000 ,		//Valid values: 5 
	parameter	gen3_coeff_24_sel = "coeff_24" ,		//Valid values: coeff_24 preset_24 
	parameter	gen3_coeff_2_ber_meas = 6'b000010 ,		//Valid values: 6 
	parameter	gen3_coeff_2_nxtber_less = 4'b0010 ,		//Valid values: 4 
	parameter	gen3_coeff_2_nxtber_more = 4'b0100 ,		//Valid values: 4 
	parameter	gen3_coeff_2_preset_hint = 3'b100 ,		//Valid values: 3 
	parameter	gen3_coeff_2_reqber = 5'b01000 ,		//Valid values: 5 
	parameter	gen3_coeff_2_sel = "preset_2" ,		//Valid values: coeff_2 preset_2 
	parameter	gen3_coeff_3 = 18'b000000000000000001 ,		//Valid values: 18 
	parameter	gen3_coeff_3_ber_meas = 6'b000010 ,		//Valid values: 6 
	parameter	gen3_coeff_3_nxtber_less = 4'b1111 ,		//Valid values: 4 
	parameter	gen3_coeff_3_nxtber_more = 4'b0011 ,		//Valid values: 4 
	parameter	gen3_coeff_3_preset_hint = 3'b000 ,		//Valid values: 3 
	parameter	gen3_coeff_3_reqber = 5'b01000 ,		//Valid values: 5 
	parameter	gen3_coeff_3_sel = "preset_3" ,		//Valid values: coeff_3 preset_3 
	parameter	gen3_coeff_4 = 18'b000000000000000000 ,		//Valid values: 18 
	parameter	gen3_coeff_4_ber_meas = 6'b000010 ,		//Valid values: 6 
	parameter	gen3_coeff_4_nxtber_less = 4'b1111 ,		//Valid values: 4 
	parameter	gen3_coeff_4_nxtber_more = 4'b0100 ,		//Valid values: 4 
	parameter	gen3_coeff_4_preset_hint = 3'b000 ,		//Valid values: 3 
	parameter	gen3_coeff_4_reqber = 5'b01000 ,		//Valid values: 5 
	parameter	gen3_coeff_4_sel = "preset_4" ,		//Valid values: coeff_4 preset_4 
	parameter	gen3_coeff_5 = 18'b000000000000000000 ,		//Valid values: 18 
	parameter	gen3_coeff_5_ber_meas = 6'b000010 ,		//Valid values: 6 
	parameter	gen3_coeff_5_nxtber_less = 4'b1111 ,		//Valid values: 4 
	parameter	gen3_coeff_5_nxtber_more = 4'b0101 ,		//Valid values: 4 
	parameter	gen3_coeff_5_preset_hint = 3'b100 ,		//Valid values: 3 
	parameter	gen3_coeff_5_reqber = 5'b01000 ,		//Valid values: 5 
	parameter	gen3_coeff_5_sel = "preset_5" ,		//Valid values: coeff_5 preset_5 
	parameter	gen3_coeff_6 = 18'b000000000000000111 ,		//Valid values: 18 
	parameter	gen3_coeff_6_ber_meas = 6'b000010 ,		//Valid values: 6 
	parameter	gen3_coeff_6_nxtber_less = 4'b1111 ,		//Valid values: 4 
	parameter	gen3_coeff_6_nxtber_more = 4'b1111 ,		//Valid values: 4 
	parameter	gen3_coeff_6_preset_hint = 3'b100 ,		//Valid values: 3 
	parameter	gen3_coeff_6_reqber = 5'b01000 ,		//Valid values: 5 
	parameter	gen3_coeff_6_sel = "preset_6" ,		//Valid values: coeff_6 preset_6 
	parameter	gen3_coeff_7 = 18'b000000000000000001 ,		//Valid values: 18 
	parameter	gen3_coeff_7_ber_meas = 6'b000010 ,		//Valid values: 6 
	parameter	gen3_coeff_7_nxtber_less = 4'b0001 ,		//Valid values: 4 
	parameter	gen3_coeff_7_nxtber_more = 4'b0111 ,		//Valid values: 4 
	parameter	gen3_coeff_7_preset_hint = 3'b010 ,		//Valid values: 3 
	parameter	gen3_coeff_7_reqber = 5'b01000 ,		//Valid values: 5 
	parameter	gen3_coeff_7_sel = "preset_7" ,		//Valid values: coeff_7 preset_7 
	parameter	gen3_coeff_8 = 18'b000000000000000000 ,		//Valid values: 18 
	parameter	gen3_coeff_8_ber_meas = 6'b000010 ,		//Valid values: 6 
	parameter	gen3_coeff_8_nxtber_less = 4'b0100 ,		//Valid values: 4 
	parameter	gen3_coeff_8_nxtber_more = 4'b1000 ,		//Valid values: 4 
	parameter	gen3_coeff_8_preset_hint = 3'b010 ,		//Valid values: 3 
	parameter	gen3_coeff_8_reqber = 5'b01000 ,		//Valid values: 5 
	parameter	gen3_coeff_8_sel = "preset_8" ,		//Valid values: coeff_8 preset_8 
	parameter	gen3_coeff_9 = 18'b000000000000000000 ,		//Valid values: 18 
	parameter	gen3_coeff_9_ber_meas = 6'b000010 ,		//Valid values: 6 
	parameter	gen3_coeff_9_nxtber_less = 4'b1011 ,		//Valid values: 4 
	parameter	gen3_coeff_9_nxtber_more = 4'b1001 ,		//Valid values: 4 
	parameter	gen3_coeff_9_preset_hint = 3'b011 ,		//Valid values: 3 
	parameter	gen3_coeff_9_reqber = 5'b01000 ,		//Valid values: 5 
	parameter	gen3_coeff_9_sel = "preset_9" ,		//Valid values: coeff_9 preset_9 
	parameter	gen3_coeff_delay_count = 7'b1111101 ,		//Valid values: 7 
	parameter	gen3_coeff_errchk = "enable" ,		//Valid values: disable enable 
	parameter	gen3_dcbal_en = "true" ,		//Valid values: false true 
	parameter	gen3_diffclock_nfts_count = 8'b10000000 ,		//Valid values: 8 
	parameter	gen3_force_local_coeff = "false" ,		//Valid values: false true 
	parameter	gen3_full_swing = 6'b111111 ,		//Valid values: 6 
	parameter	gen3_half_swing = "false" ,		//Valid values: false true 
	parameter	gen3_low_freq = 6'b000001 ,		//Valid values: 6 
	parameter	gen3_paritychk = "enable" ,		//Valid values: disable enable 
	parameter	gen3_pl_framing_err_dis = "enable" ,		//Valid values: disable enable 
	parameter	gen3_preset_coeff_1 = 18'b000000110101001010 ,		//Valid values: 18 
	parameter	gen3_preset_coeff_10 = 18'b001011110100000000 ,		//Valid values: 18 
	parameter	gen3_preset_coeff_11 = 18'b011110100001000000 ,		//Valid values: 18 
	parameter	gen3_preset_coeff_2 = 18'b000000110100001011 ,		//Valid values: 18 
	parameter	gen3_preset_coeff_3 = 18'b000000110010001101 ,		//Valid values: 18 
	parameter	gen3_preset_coeff_4 = 18'b000000110111001000 ,		//Valid values: 18 
	parameter	gen3_preset_coeff_5 = 18'b000000111111000000 ,		//Valid values: 18 
	parameter	gen3_preset_coeff_6 = 18'b000110111001000000 ,		//Valid values: 18 
	parameter	gen3_preset_coeff_7 = 18'b001000110111000000 ,		//Valid values: 18 
	parameter	gen3_preset_coeff_8 = 18'b000110101100001101 ,		//Valid values: 18 
	parameter	gen3_preset_coeff_9 = 18'b001000101111001000 ,		//Valid values: 18 
	parameter	gen3_reset_eieos_cnt_bit = "false" ,		//Valid values: false true 
	parameter	gen3_rxfreqlock_counter = 20'b00000000000000000000 ,		//Valid values: 20 
	parameter	gen3_sameclock_nfts_count = 8'b10000000 ,		//Valid values: 8 
	parameter	gen3_scrdscr_bypass = "false" ,		//Valid values: false true 
	parameter	gen3_skip_ph2_ph3 = "false" ,		//Valid values: false true 
	parameter	hard_reset_bypass = "false" ,		//Valid values: false true 
	parameter	hard_rst_sig_chnl_en = "disable_hrc_sig" ,		//Valid values: disable_hrc_sig enable_hrc_sig_x1 enable_hrc_sig_x2 enable_hrc_sig_x4 enable_hrc_sig_x8 
	parameter	hard_rst_tx_pll_rst_chnl_en = "disable_hrc_txpll_rst" ,		//Valid values: disable_hrc_txpll_rst enable_hrc_txpll_rst_ch0 enable_hrc_txpll_rst_ch1 enable_hrc_txpll_rst_ch3 enable_hrc_txpll_rst_ch4 enable_hrc_txpll_rst_ch01 enable_hrc_txpll_rst_ch34 
	parameter	hip_ac_pwr_clk_freq_in_hz = 30'b000000000000000000000000000000 ,		//Valid values: 30 
	parameter	hip_ac_pwr_uw_per_mhz = 30'b000000000000000000000000000000 ,		//Valid values: 30 
	parameter	hip_base_address = 10'b0000000000 ,		//Valid values: 10 
	parameter	hip_clock_dis = "enable_hip_clk" ,		//Valid values: disable_hip_clk enable_hip_clk 
	parameter	hip_hard_reset = "enable" ,		//Valid values: disable enable 
	parameter	hip_pcs_sig_chnl_en = "disable_hip_pcs_sig" ,		//Valid values: disable_hip_pcs_sig enable_hip_pcs_sig_x1 enable_hip_pcs_sig_x2 enable_hip_pcs_sig_x4 enable_hip_pcs_sig_x8 
	parameter	hot_plug_support = 7'b0000000 ,		//Valid values: 7 
	parameter	hrc_chnl_txpll_master_cgb_rst_select = "disable_master_cgb_sel" ,		//Valid values: disable_master_cgb_sel ch0_master_cgb_sel ch1_master_cgb_sel ch2_master_cgb_sel ch3_master_cgb_sel ch4_master_cgb_sel ch5_master_cgb_sel ch6_master_cgb_sel ch7_master_cgb_sel 
	parameter	hrdrstctrl_en = "hrdrstctrl_dis" ,		//Valid values: hrdrstctrl_dis hrdrstctrl_en 
	parameter	iei_enable_settings = "gen3gen2_infei_infsd_gen1_infei_sd" ,		//Valid values: disable_iei_logic gen3gen2gen1_sd_only gen3gen2_infei_infsd_gen1_infei_infsd gen3gen2_infei_gen1_infei gen3gen2_infei_gen1_infei_sd gen3gen2_infei_infsd_gen1_infei_sd gen3_infei_infsd_gen2_infsd_gen1_infsd_sd gen3_infei_infsd_gen2_infsd_sd_gen1_infsd_sd 
	parameter	indicator = 3'b111 ,		//Valid values: 3 
	parameter	intel_id_access = "false" ,		//Valid values: false true 
	parameter	interrupt_pin = "inta" ,		//Valid values: none_int_pin inta intb intc intd 
	parameter	io_window_addr_width = "window_32_bit" ,		//Valid values: none window_16_bit window_32_bit 
	parameter	jtag_id = 128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 ,		//Valid values: 
	parameter	ko_compl_data = 12'b000000000000 ,		//Valid values: 12 
	parameter	ko_compl_header = 12'b000000000000 ,		//Valid values: 12 
	parameter	l01_entry_latency = 5'b11111 ,		//Valid values: 5 
	parameter	l0_exit_latency_diffclock = 3'b110 ,		//Valid values: 3 
	parameter	l0_exit_latency_sameclock = 3'b110 ,		//Valid values: 3 
	parameter	l0s_adj_rply_timer_dis = "enable" ,		//Valid values: disable enable 
	parameter	l1_exit_latency_diffclock = 3'b000 ,		//Valid values: 3 
	parameter	l1_exit_latency_sameclock = 3'b000 ,		//Valid values: 3 
	parameter	l2_async_logic = "enable" ,		//Valid values: disable enable 
	parameter	lane_mask = "ln_mask_x4" ,		//Valid values: ln_mask_x1 ln_mask_x2 ln_mask_x4 ln_mask_x8 
	parameter	lane_rate = "gen1" ,		//Valid values: gen1 gen2 gen3 
	parameter	link_width = "x1" ,		//Valid values: x8 x4 x2 x1 
	parameter	lmi_hold_off_cfg_timer_en = "disable" ,		//Valid values: disable enable 
	parameter	low_priority_vc = "single_vc_low_pr" ,		//Valid values: single_vc_low_pr 
	parameter	ltr_mechanism = "false" ,		//Valid values: false true 
	parameter	ltssm_1ms_timeout = "disable" ,		//Valid values: disable enable 
	parameter	ltssm_freqlocked_check = "disable" ,		//Valid values: disable enable 
	parameter	malformed_tlp_truncate_en = "disable" ,		//Valid values: disable enable 
	parameter	max_link_width = "x4_link_width" ,		//Valid values: x1_link_width x2_link_width x4_link_width x8_link_width 
	parameter	max_payload_size = "payload_512" ,		//Valid values: payload_128 payload_256 payload_512 payload_1024 payload_2048 payload_4096 
	parameter	maximum_current = 3'b000 ,		//Valid values: 3 
	parameter	millisecond_cycle_count = 20'b00000000000000000000 ,		//Valid values: 20 
	parameter	msi_64bit_addressing_capable = "true" ,		//Valid values: false true 
	parameter	msi_masking_capable = "false" ,		//Valid values: false true 
	parameter	msi_multi_message_capable = "count_4" ,		//Valid values: count_1 count_2 count_4 count_8 count_16 count_32 
	parameter	msi_support = "true" ,		//Valid values: false true 
	parameter	msix_pba_bir = 3'b000 ,		//Valid values: 3 
	parameter	msix_pba_offset = 29'b00000000000000000000000000000 ,		//Valid values: 29 
	parameter	msix_table_bir = 3'b000 ,		//Valid values: 3 
	parameter	msix_table_offset = 29'b00000000000000000000000000000 ,		//Valid values: 29 
	parameter	msix_table_size = 11'b00000000000 ,		//Valid values: 11 
	parameter	national_inst_thru_enhance = "true" ,		//Valid values: false true 
	parameter	no_command_completed = "true" ,		//Valid values: false true 
	parameter	no_soft_reset = "false" ,		//Valid values: false true 
	parameter	not_use_k_gbl_bits = "not_used_k_gbl" ,		//Valid values: not_used_k_gbl 
	parameter	operating_voltage = "standard" ,		//Valid values: standard vidint vidmin 
	parameter	pcie_base_spec = "pcie_2p1" ,		//Valid values: pcie_2p1 pcie_3p0 
	parameter	pcie_mode = "shared_mode" ,		//Valid values: ep_native ep_legacy rp sw_up sw_dn bridge switch_mode shared_mode 
	parameter	pcie_spec_1p0_compliance = "spec_1p1" ,		//Valid values: spec_1p1 spec_1p0a 
	parameter	pcie_spec_version = "v2" ,		//Valid values: v1 v2 v3 
	parameter	pclk_out_sel = "pclk" ,		//Valid values: pclk core_clk_in_p 
	parameter	pld_in_use_reg = "false" ,		//Valid values: false true 
	parameter	pm_latency_patch_dis = "enable" ,		//Valid values: disable enable 
	parameter	pm_txdl_patch_dis = "enable" ,		//Valid values: disable enable 
	parameter	pme_clock = "false" ,		//Valid values: false true 
	parameter	port_link_number = 8'b00000001 ,		//Valid values: 8 
	parameter	port_type = "native_ep" ,		//Valid values: native_ep legacy_ep root_port others 
	parameter	powerdown_mode = "powerup" ,		//Valid values: powerup powerdown 
	parameter	prefetchable_mem_window_addr_width = "prefetch_32" ,		//Valid values: prefetch_0 prefetch_32 prefetch_64 
	parameter	r2c_mask_easy = "false" ,		//Valid values: false true 
	parameter	r2c_mask_enable = "false" ,		//Valid values: false true 
	parameter	rec_frqlk_mon_en = "disable" ,		//Valid values: disable enable 
	parameter	register_pipe_signals = "true" ,		//Valid values: false true 
	parameter	retry_buffer_last_active_address = 10'b1111111111 ,		//Valid values: 10 
	parameter	retry_buffer_memory_settings = 36'b000000000000000000000000000000000000 ,		//Valid values: 
	parameter	retry_ecc_corr_mask_dis = "enable" ,		//Valid values: disable enable 
	parameter	revision_id = 8'b00000001 ,		//Valid values: 8 
	parameter	role_based_error_reporting = "false" ,		//Valid values: false true 
	parameter	rp_bug_fix_pri_sec_stat_reg = 7'b1111111 ,		//Valid values: 7 
	parameter	rpltim_base = 14'b00000000000000 ,		//Valid values: 14 
	parameter	rpltim_set = "false" ,		//Valid values: false true 
	parameter	rstctl_ltssm_dis = "false" ,		//Valid values: false true 
	parameter	rstctrl_1ms_count_fref_clk = 20'b00001111010000100100 ,		//Valid values: 20 
	parameter	rstctrl_1us_count_fref_clk = 20'b00000000000000111111 ,		//Valid values: 20 
	parameter	rstctrl_altpe3_crst_n_inv = "false" ,		//Valid values: false true 
	parameter	rstctrl_altpe3_rst_n_inv = "false" ,		//Valid values: false true 
	parameter	rstctrl_altpe3_srst_n_inv = "false" ,		//Valid values: false true 
	parameter	rstctrl_chnl_cal_done_select = "not_active_chnl_cal_done" ,		//Valid values: ch0_out_chnl_cal_done ch01_out_chnl_cal_done ch0123_out_chnl_cal_done ch01234567_out_chnl_cal_done not_active_chnl_cal_done 
	parameter	rstctrl_debug_en = "false" ,		//Valid values: false true 
	parameter	rstctrl_force_inactive_rst = "false" ,		//Valid values: false true 
	parameter	rstctrl_fref_clk_select = "ch0_sel" ,		//Valid values: ch0_sel ch1_sel ch2_sel ch3_sel ch4_sel ch5_sel ch6_sel ch7_sel 
	parameter	rstctrl_hard_block_enable = "hard_rst_ctl" ,		//Valid values: hard_rst_ctl pld_rst_ctl 
	parameter	rstctrl_hip_ep = "hip_ep" ,		//Valid values: hip_ep hip_not_ep 
	parameter	rstctrl_mask_tx_pll_lock_select = "not_active_mask_tx_pll_lock" ,		//Valid values: ch0_sel_mask_tx_pll_lock ch1_sel_mask_tx_pll_lock ch3_sel_mask_tx_pll_lock not_active_mask_tx_pll_lock 
	parameter	rstctrl_perst_enable = "level" ,		//Valid values: level neg_edge not_used 
	parameter	rstctrl_perstn_select = "perstn_pin" ,		//Valid values: perstn_pin perstn_pld 
	parameter	rstctrl_pld_clr = "false" ,		//Valid values: false true 
	parameter	rstctrl_pll_cal_done_select = "not_active_pll_cal_done" ,		//Valid values: ch0_sel_pll_cal_done ch1_sel_pll_cal_done ch01_sel_pll_cal_done ch3_sel_pll_cal_done ch4_sel_pll_cal_done ch34_sel_pll_cal_done not_active_pll_cal_done 
	parameter	rstctrl_rx_pcs_rst_n_inv = "false" ,		//Valid values: false true 
	parameter	rstctrl_rx_pcs_rst_n_select = "not_active_rx_pcs_rst" ,		//Valid values: ch0_out_rx_pcs_rst ch01_out_rx_pcs_rst ch0123_out_rx_pcs_rst ch01234567_out_rx_pcs_rst not_active_rx_pcs_rst 
	parameter	rstctrl_rx_pll_freq_lock_select = "not_active_rx_pll_f_lock" ,		//Valid values: ch0_sel_rx_pll_f_lock ch01_sel_rx_pll_f_lock ch0123_sel_rx_pll_f_lock ch01234567_sel_rx_pll_f_lock not_active_rx_pll_f_lock ch0_phs_sel_rx_pll_f_lock ch01_phs_sel_rx_pll_f_lock ch0123_phs_sel_rx_pll_f_lock ch01234567_phs_sel_rx_pll_f_lock 
	parameter	rstctrl_rx_pll_lock_select = "not_active_rx_pll_lock" ,		//Valid values: ch0_sel_rx_pll_lock ch01_sel_rx_pll_lock ch0123_sel_rx_pll_lock ch01234567_sel_rx_pll_lock not_active_rx_pll_lock 
	parameter	rstctrl_rx_pma_rstb_inv = "false" ,		//Valid values: false true 
	parameter	rstctrl_rx_pma_rstb_select = "not_active_rx_pma_rstb" ,		//Valid values: ch0_out_rx_pma_rstb ch01_out_rx_pma_rstb ch0123_out_rx_pma_rstb ch01234567_out_rx_pma_rstb not_active_rx_pma_rstb 
	parameter	rstctrl_timer_a = 8'b00001010 ,		//Valid values: 8 
	parameter	rstctrl_timer_a_type = "a_timer_milli_secs" ,		//Valid values: a_timer_not_enabled a_timer_milli_secs a_timer_micro_secs a_timer_fref_cycles 
	parameter	rstctrl_timer_b = 8'b00001010 ,		//Valid values: 8 
	parameter	rstctrl_timer_b_type = "b_timer_milli_secs" ,		//Valid values: b_timer_not_enabled b_timer_milli_secs b_timer_micro_secs b_timer_fref_cycles 
	parameter	rstctrl_timer_c = 8'b00001010 ,		//Valid values: 8 
	parameter	rstctrl_timer_c_type = "c_timer_milli_secs" ,		//Valid values: c_timer_not_enabled c_timer_milli_secs c_timer_micro_secs c_timer_fref_cycles 
	parameter	rstctrl_timer_d = 8'b00010100 ,		//Valid values: 8 
	parameter	rstctrl_timer_d_type = "d_timer_milli_secs" ,		//Valid values: d_timer_not_enabled d_timer_milli_secs d_timer_micro_secs d_timer_fref_cycles 
	parameter	rstctrl_timer_e = 8'b00000001 ,		//Valid values: 8 
	parameter	rstctrl_timer_e_type = "e_timer_milli_secs" ,		//Valid values: e_timer_not_enabled e_timer_milli_secs e_timer_micro_secs e_timer_fref_cycles 
	parameter	rstctrl_timer_f = 8'b00001010 ,		//Valid values: 8 
	parameter	rstctrl_timer_f_type = "f_timer_milli_secs" ,		//Valid values: f_timer_not_enabled f_timer_milli_secs f_timer_micro_secs f_timer_fref_cycles 
	parameter	rstctrl_timer_g = 8'b00001010 ,		//Valid values: 8 
	parameter	rstctrl_timer_g_type = "g_timer_milli_secs" ,		//Valid values: g_timer_not_enabled g_timer_milli_secs g_timer_micro_secs g_timer_fref_cycles 
	parameter	rstctrl_timer_h = 8'b00000100 ,		//Valid values: 8 
	parameter	rstctrl_timer_h_type = "h_timer_milli_secs" ,		//Valid values: h_timer_not_enabled h_timer_milli_secs h_timer_micro_secs h_timer_fref_cycles 
	parameter	rstctrl_timer_i = 8'b00010100 ,		//Valid values: 8 
	parameter	rstctrl_timer_i_type = "i_timer_milli_secs" ,		//Valid values: i_timer_not_enabled i_timer_milli_secs i_timer_micro_secs i_timer_fref_cycles 
	parameter	rstctrl_timer_j = 8'b00010100 ,		//Valid values: 8 
	parameter	rstctrl_timer_j_type = "j_timer_milli_secs" ,		//Valid values: j_timer_not_enabled j_timer_milli_secs j_timer_micro_secs j_timer_fref_cycles 
	parameter	rstctrl_tx_lcff_pll_lock_select = "not_active_lcff_pll_lock" ,		//Valid values: ch0_sel_lcff_pll_lock ch1_sel_lcff_pll_lock ch3_sel_lcff_pll_lock ch4_sel_lcff_pll_lock ch01_sel_lcff_pll_lock ch34_sel_lcff_pll_lock not_active_lcff_pll_lock 
	parameter	rstctrl_tx_lcff_pll_rstb_select = "not_active_lcff_pll_rstb" ,		//Valid values: ch0_out_lcff_pll_rstb ch1_out_lcff_pll_rstb ch3_out_lcff_pll_rstb ch4_out_lcff_pll_rstb ch01_out_lcff_pll_rstb ch34_out_lcff_pll_rstb not_active_lcff_pll_rstb 
	parameter	rstctrl_tx_pcs_rst_n_inv = "false" ,		//Valid values: false true 
	parameter	rstctrl_tx_pcs_rst_n_select = "not_active_tx_pcs_rst" ,		//Valid values: ch0_out_tx_pcs_rst ch01_out_tx_pcs_rst ch0123_out_tx_pcs_rst ch01234567_out_tx_pcs_rst not_active_tx_pcs_rst 
	parameter	rstctrl_tx_pma_rstb_inv = "false" ,		//Valid values: false true 
	parameter	rstctrl_tx_pma_syncp_inv = "false" ,		//Valid values: false true 
	parameter	rstctrl_tx_pma_syncp_select = "not_active_tx_pma_syncp" ,		//Valid values: ch0_out_tx_pma_syncp ch1_out_tx_pma_syncp ch3_out_tx_pma_syncp not_active_tx_pma_syncp 
	parameter	rx_ast_parity = "disable" ,		//Valid values: disable enable 
	parameter	rx_buffer_credit_alloc = "balance" ,		//Valid values: minimum low balance high maximum 
	parameter	rx_buffer_fc_protect = 20'b00000000000001000100 ,		//Valid values: 20 
	parameter	rx_buffer_protect = 11'b00001000100 ,		//Valid values: 11 
	parameter	rx_cdc_almost_empty = 4'b0011 ,		//Valid values: 4 
	parameter	rx_cdc_almost_full = 4'b1100 ,		//Valid values: 4 
	parameter	rx_cred_ctl_param = "disable" ,		//Valid values: disable enable 
	parameter	rx_ei_l0s = "disable" ,		//Valid values: disable enable 
	parameter	rx_l0s_count_idl = 8'b00000000 ,		//Valid values: 8 
	parameter	rx_ptr0_nonposted_dpram_max = 11'b00000000000 ,		//Valid values: 11 
	parameter	rx_ptr0_nonposted_dpram_min = 11'b00000000000 ,		//Valid values: 11 
	parameter	rx_ptr0_posted_dpram_max = 11'b00000000000 ,		//Valid values: 11 
	parameter	rx_ptr0_posted_dpram_min = 11'b00000000000 ,		//Valid values: 11 
	parameter	rx_runt_patch_dis = "enable" ,		//Valid values: disable enable 
	parameter	rx_sop_ctrl = "rx_sop_boundary_64" ,		//Valid values: rx_sop_boundary_64 rx_sop_boundary_128 rx_sop_boundary_256 
	parameter	rx_trunc_patch_dis = "enable" ,		//Valid values: disable enable 
	parameter	rx_use_prst = "false" ,		//Valid values: false true 
	parameter	rx_use_prst_ep = "true" ,		//Valid values: false true 
	parameter	rxbuf_ecc_corr_mask_dis = "enable" ,		//Valid values: disable enable 
	parameter	rxdl_bad_sop_eop_filter_dis = "rxdlbug1_enable_both" ,		//Valid values: rxdlbug1_disable_both rxdlbug1_enable1 rxdlbug1_enable0 rxdlbug1_enable_both 
	parameter	rxdl_bad_tlp_patch_dis = "rxdlbug2_enable_both" ,		//Valid values: rxdlbug2_disable_both rxdlbug2_enable1 rxdlbug2_enable0 rxdlbug2_enable_both 
	parameter	rxdl_lcrc_patch_dis = "rxdlbug3_enable_both" ,		//Valid values: rxdlbug3_disable_both rxdlbug3_enable1 rxdlbug3_enable0 rxdlbug3_enable_both 
	parameter	sameclock_nfts_count = 8'b00000000 ,		//Valid values: 8 
	parameter	sel_enable_pcs_rx_fifo_err = "disable_sel" ,		//Valid values: disable_sel enable_x1 enable_x2 enable_x4 enable_x8 
	parameter	silicon_rev = "20nm5es" ,		//Valid values: 20nm5es 20nm5es2 20nm4es 20nm4es2 20nm5 20nm4 20nm3 20nm2 20nm1 
	parameter	sim_mode = "disable" ,		//Valid values: disable enable 
	parameter	simple_ro_fifo_control_en = "disable" ,		//Valid values: disable enable 
	parameter	single_rx_detect = "detect_all_lanes" ,		//Valid values: detect_lane0_3 detect_lane0_or_3 detect_lane0_only detect_lane4_7 detect_lane6_and_7 detect_lane7_only detect_lane2_and_3 detect_lane3_only detect_lane1_only detect_all_lanes 
	parameter	skp_os_gen3_count = 11'b00000000000 ,		//Valid values: 11 
	parameter	skp_os_schedule_count = 11'b00000000000 ,		//Valid values: 11 
	parameter	slot_number = 13'b0000000000000 ,		//Valid values: 13 
	parameter	slot_power_limit = 8'b00000000 ,		//Valid values: 8 
	parameter	slot_power_scale = 2'b00 ,		//Valid values: 2 
	parameter	slotclk_cfg = "static_slotclkcfgon" ,		//Valid values: static_slotclkcfgon static_slotclkcfgoff dynamic_slotclkcfg 
	parameter	ssid = 16'b0000000000000000 ,		//Valid values: 16 
	parameter	ssvid = 16'b0000000000000000 ,		//Valid values: 16 
	parameter	subsystem_device_id = 16'b1110000000000001 ,		//Valid values: 16 
	parameter	subsystem_vendor_id = 16'b0001000101110010 ,		//Valid values: 16 
	parameter	sup_mode = "user_mode" ,		//Valid values: user_mode engineering_mode 
	parameter	surprise_down_error_support = "false" ,		//Valid values: false true 
	parameter	tl_cfg_div = "cfg_clk_div_7" ,		//Valid values: cfg_clk_div_0 cfg_clk_div_1 cfg_clk_div_2 cfg_clk_div_3 cfg_clk_div_4 cfg_clk_div_5 cfg_clk_div_6 cfg_clk_div_7 
	parameter	tl_tx_check_parity_msg = "disable" ,		//Valid values: disable enable 
	parameter	tph_completer = "false" ,		//Valid values: false true 
	parameter	tx_ast_parity = "disable" ,		//Valid values: disable enable 
	parameter	tx_cdc_almost_empty = 4'b0101 ,		//Valid values: 4 
	parameter	tx_cdc_almost_full = 4'b1100 ,		//Valid values: 4 
	parameter	tx_sop_ctrl = "boundary_64" ,		//Valid values: boundary_64 boundary_128 boundary_256 
	parameter	tx_swing = 8'b00000000 ,		//Valid values: 8 
	parameter	txdl_fair_arbiter_counter = 4'b0000 ,		//Valid values: 4 
	parameter	txdl_fair_arbiter_en = "enable" ,		//Valid values: disable enable 
	parameter	txrate_adv = "capability" ,		//Valid values: capability target_link_speed 
	parameter	uc_calibration_en = "uc_calibration_dis" ,		//Valid values: uc_calibration_en uc_calibration_dis 
	parameter	use_aer = "false" ,		//Valid values: false true 
	parameter	use_crc_forwarding = "false" ,		//Valid values: false true 
	parameter	user_id = 16'b0000000000000000 ,		//Valid values: 16 
	parameter	vc0_clk_enable = "true" ,		//Valid values: false true 
	parameter	vc0_rx_buffer_memory_settings = 36'b000000000000000000000000000000000000 ,		//Valid values: 
	parameter	vc0_rx_flow_ctrl_compl_data = 12'b000111000000 ,		//Valid values: 12 
	parameter	vc0_rx_flow_ctrl_compl_header = 8'b01110000 ,		//Valid values: 8 
	parameter	vc0_rx_flow_ctrl_nonposted_data = 8'b00000000 ,		//Valid values: 8 
	parameter	vc0_rx_flow_ctrl_nonposted_header = 8'b00110110 ,		//Valid values: 8 
	parameter	vc0_rx_flow_ctrl_posted_data = 12'b000101101000 ,		//Valid values: 12 
	parameter	vc0_rx_flow_ctrl_posted_header = 8'b00110010 ,		//Valid values: 8 
	parameter	vc1_clk_enable = "false" ,		//Valid values: false true 
	parameter	vc_arbitration = "single_vc_arb" ,		//Valid values: single_vc_arb 
	parameter	vc_enable = "single_vc" ,		//Valid values: single_vc 
	parameter	vendor_id = 16'b0001000101110010 ,		//Valid values: 16 
	parameter	vsec_cap = 4'b0000 ,		//Valid values: 4 
	parameter	vsec_id = 16'b0001000101110010 ,		//Valid values: 16 
	parameter	wrong_device_id = "disable"		//Valid values: disable enable 
)

(
	//Port declaration

	input	[4:0]  aer_msi_num ,
	input	[1:0]  app_int_err ,
	input	app_inta_sts ,
	input	[4:0]  app_msi_num ,
	input	app_msi_req ,
	input	[2:0]  app_msi_tc ,
	input	atpg_los_en_n ,
	input	[9:0]  avmm_address ,
	input	[1:0]  avmm_byte_en ,
	input	avmm_clk ,
	input	avmm_read ,
	input	avmm_rst_n ,
	input	avmm_write ,
	input	[15:0]  avmm_writedata ,
	input	bist_scanen ,
	input	bist_scanin ,
	input	bisten_rcv_n ,
	input	bisten_rpl_n ,
	input	bistmode_n ,
	input	[15:0]  cfg_link2csr_pld ,
	input	[7:0]  cfg_prmbus_pld ,
	input	chnl_cal_done0 ,
	input	chnl_cal_done1 ,
	input	chnl_cal_done2 ,
	input	chnl_cal_done3 ,
	input	chnl_cal_done4 ,
	input	chnl_cal_done5 ,
	input	chnl_cal_done6 ,
	input	chnl_cal_done7 ,
	input	core_clk_in ,
	input	core_crst ,
	input	core_por ,
	input	core_rst ,
	input	core_srst ,
	input	[6:0]  cpl_err ,
	input	cpl_pending ,
	input	[31:0]  cseb_rddata ,
	input	[3:0]  cseb_rddata_parity ,
	input	[4:0]  cseb_rdresponse ,
	input	cseb_waitrequest ,
	input	cseb_wrresp_valid ,
	input	[4:0]  cseb_wrresponse ,
	input	csr_cbdin ,
	input	csr_clk ,
	input	csr_din ,
	input	csr_en ,
	input	csr_enscan ,
	input	csr_entest ,
	input	csr_in ,
	input	csr_load_csr ,
	input	csr_pipe_in ,
	input	csr_seg ,
	input	csr_tcsrin ,
	input	csr_tverify ,
	input	cvp_config_done ,
	input	cvp_config_error ,
	input	cvp_config_ready ,
	input	cvp_en ,
	input	egress_blk_err ,
	input	entest ,
	input	flr_reset ,
	input	force_tx_eidle ,
	input	fref_clk0 ,
	input	fref_clk1 ,
	input	fref_clk2 ,
	input	fref_clk3 ,
	input	fref_clk4 ,
	input	fref_clk5 ,
	input	fref_clk6 ,
	input	fref_clk7 ,
	input	frzlogic ,
	input	frzreg ,
	input	hold_ltssm_rec ,
	input	[4:0]  hpg_ctrler ,
	input	iocsrrdy_dly ,
	input	[11:0]  lmi_addr ,
	input	[7:0]  lmi_din ,
	input	lmi_rden ,
	input	lmi_wren ,
	input	[2:0]  m10k_select ,
	input	mask_tx_pll_lock0 ,
	input	mask_tx_pll_lock1 ,
	input	mask_tx_pll_lock2 ,
	input	mask_tx_pll_lock3 ,
	input	mask_tx_pll_lock4 ,
	input	mask_tx_pll_lock5 ,
	input	mask_tx_pll_lock6 ,
	input	mask_tx_pll_lock7 ,
	input	mem_hip_test_enable ,
	input	mem_regscanen_n ,
	input	mem_rscin_rcv_bot ,
	input	mem_rscin_rcv_top ,
	input	mem_rscin_rtry ,
	input	nfrzdrv ,
	input	npor ,
	input	pclk_central ,
	input	pclk_ch0 ,
	input	pclk_ch1 ,
	input	[4:0]  pex_msi_num ,
	input	phy_rst ,
	input	phy_srst ,
	input	phystatus0 ,
	input	phystatus1 ,
	input	phystatus2 ,
	input	phystatus3 ,
	input	phystatus4 ,
	input	phystatus5 ,
	input	phystatus6 ,
	input	phystatus7 ,
	input	pin_perst_n ,
	input	pld_clk ,
	input	pld_clrhip_n ,
	input	pld_clrpcship_n ,
	input	pld_clrpmapcship_n ,
	input	pld_core_ready ,
	input	[7:0]  pld_gp_status ,
	input	pld_perst_n ,
	input	pll_cal_done0 ,
	input	pll_cal_done1 ,
	input	pll_cal_done2 ,
	input	pll_cal_done3 ,
	input	pll_cal_done4 ,
	input	pll_cal_done5 ,
	input	pll_cal_done6 ,
	input	pll_cal_done7 ,
	input	pll_fixed_clk_central ,
	input	pll_fixed_clk_ch0 ,
	input	pll_fixed_clk_ch1 ,
	input	plniotri ,
	input	pm_auxpwr ,
	input	[9:0]  pm_data ,
	input	pm_event ,
	input	pm_exit_d0_ack ,
	input	pme_to_cr ,
	input	reserved_clk_in ,
	input	[7:0]  reserved_in ,
	input	[15:0]  rx_cred_ctl ,
	input	rx_pll_freq_lock0 ,
	input	rx_pll_freq_lock1 ,
	input	rx_pll_freq_lock2 ,
	input	rx_pll_freq_lock3 ,
	input	rx_pll_freq_lock4 ,
	input	rx_pll_freq_lock5 ,
	input	rx_pll_freq_lock6 ,
	input	rx_pll_freq_lock7 ,
	input	rx_pll_phase_lock0 ,
	input	rx_pll_phase_lock1 ,
	input	rx_pll_phase_lock2 ,
	input	rx_pll_phase_lock3 ,
	input	rx_pll_phase_lock4 ,
	input	rx_pll_phase_lock5 ,
	input	rx_pll_phase_lock6 ,
	input	rx_pll_phase_lock7 ,
	input	rx_st_mask ,
	input	rx_st_ready ,
	input	rxblkst0 ,
	input	rxblkst1 ,
	input	rxblkst2 ,
	input	rxblkst3 ,
	input	rxblkst4 ,
	input	rxblkst5 ,
	input	rxblkst6 ,
	input	rxblkst7 ,
	input	[31:0]  rxdata0 ,
	input	[31:0]  rxdata1 ,
	input	[31:0]  rxdata2 ,
	input	[31:0]  rxdata3 ,
	input	[31:0]  rxdata4 ,
	input	[31:0]  rxdata5 ,
	input	[31:0]  rxdata6 ,
	input	[31:0]  rxdata7 ,
	input	[3:0]  rxdatak0 ,
	input	[3:0]  rxdatak1 ,
	input	[3:0]  rxdatak2 ,
	input	[3:0]  rxdatak3 ,
	input	[3:0]  rxdatak4 ,
	input	[3:0]  rxdatak5 ,
	input	[3:0]  rxdatak6 ,
	input	[3:0]  rxdatak7 ,
	input	rxdataskip0 ,
	input	rxdataskip1 ,
	input	rxdataskip2 ,
	input	rxdataskip3 ,
	input	rxdataskip4 ,
	input	rxdataskip5 ,
	input	rxdataskip6 ,
	input	rxdataskip7 ,
	input	rxelecidle0 ,
	input	rxelecidle1 ,
	input	rxelecidle2 ,
	input	rxelecidle3 ,
	input	rxelecidle4 ,
	input	rxelecidle5 ,
	input	rxelecidle6 ,
	input	rxelecidle7 ,
	input	rxfreqlocked0 ,
	input	rxfreqlocked1 ,
	input	rxfreqlocked2 ,
	input	rxfreqlocked3 ,
	input	rxfreqlocked4 ,
	input	rxfreqlocked5 ,
	input	rxfreqlocked6 ,
	input	rxfreqlocked7 ,
	input	[2:0]  rxstatus0 ,
	input	[2:0]  rxstatus1 ,
	input	[2:0]  rxstatus2 ,
	input	[2:0]  rxstatus3 ,
	input	[2:0]  rxstatus4 ,
	input	[2:0]  rxstatus5 ,
	input	[2:0]  rxstatus6 ,
	input	[2:0]  rxstatus7 ,
	input	[1:0]  rxsynchd0 ,
	input	[1:0]  rxsynchd1 ,
	input	[1:0]  rxsynchd2 ,
	input	[1:0]  rxsynchd3 ,
	input	[1:0]  rxsynchd4 ,
	input	[1:0]  rxsynchd5 ,
	input	[1:0]  rxsynchd6 ,
	input	[1:0]  rxsynchd7 ,
	input	rxvalid0 ,
	input	rxvalid1 ,
	input	rxvalid2 ,
	input	rxvalid3 ,
	input	rxvalid4 ,
	input	rxvalid5 ,
	input	rxvalid6 ,
	input	rxvalid7 ,
	input	scan_mode_n ,
	input	scan_shift_n ,
	input	[1:0]  sw_ctmod ,
	input	[2:0]  swdn_in ,
	input	[6:0]  swup_in ,
	input	[31:0]  test_in_1_hip ,
	input	[31:0]  test_in_hip ,
	input	[31:0]  test_pl_dbg_eqin ,
	input	tx_cred_cons_select ,
	input	[1:0]  tx_cred_fc_sel ,
	input	tx_lcff_pll_lock0 ,
	input	tx_lcff_pll_lock1 ,
	input	tx_lcff_pll_lock2 ,
	input	tx_lcff_pll_lock3 ,
	input	tx_lcff_pll_lock4 ,
	input	tx_lcff_pll_lock5 ,
	input	tx_lcff_pll_lock6 ,
	input	tx_lcff_pll_lock7 ,
	input	[255:0]  tx_st_data ,
	input	[1:0]  tx_st_empty ,
	input	[3:0]  tx_st_eop ,
	input	[3:0]  tx_st_err ,
	input	[31:0]  tx_st_parity ,
	input	[3:0]  tx_st_sop ,
	input	tx_st_valid ,
	input	user_mode ,

	output	sta_hd_altpe3_hip_core_top_hd_altpe3_hip_core_u_clkmux_core_clk_cnt_reg_0_0_Q ,
	output	sta_hd_altpe3_hip_core_top_hd_altpe3_hip_core_u_clkmux_core_clk_cnt_reg_1_0_Q ,
	output	sta_hd_altpe3_hip_core_top_hd_altpe3_hip_core_u_clkmux_core_clk_cnt_reg_2_0_Q ,
	output	app_inta_ack ,
	output	app_msi_ack ,
	output	[15:0]  avmm_readdata ,
	output	cfg_par_err ,
	output	core_clk_out ,
	output	[31:0]  cseb_addr ,
	output	[3:0]  cseb_addr_parity ,
	output	[3:0]  cseb_be ,
	output	cseb_is_shadow ,
	output	cseb_rden ,
	output	[31:0]  cseb_wrdata ,
	output	[3:0]  cseb_wrdata_parity ,
	output	cseb_wren ,
	output	cseb_wrresp_req ,
	output	csr_dout ,
	output	csr_out ,
	output	csr_pipe_out ,
	output	[17:0]  current_coeff0 ,
	output	[17:0]  current_coeff1 ,
	output	[17:0]  current_coeff2 ,
	output	[17:0]  current_coeff3 ,
	output	[17:0]  current_coeff4 ,
	output	[17:0]  current_coeff5 ,
	output	[17:0]  current_coeff6 ,
	output	[17:0]  current_coeff7 ,
	output	[2:0]  current_rxpreset0 ,
	output	[2:0]  current_rxpreset1 ,
	output	[2:0]  current_rxpreset2 ,
	output	[2:0]  current_rxpreset3 ,
	output	[2:0]  current_rxpreset4 ,
	output	[2:0]  current_rxpreset5 ,
	output	[2:0]  current_rxpreset6 ,
	output	[2:0]  current_rxpreset7 ,
	output	[1:0]  current_speed ,
	output	cvp_clk ,
	output	cvp_config ,
	output	[31:0]  cvp_data ,
	output	cvp_full_config ,
	output	cvp_start_xfer ,
	output	dl_up ,
	output	dlup_exit ,
	output	[2:0]  eidle_infer_sel0 ,
	output	[2:0]  eidle_infer_sel1 ,
	output	[2:0]  eidle_infer_sel2 ,
	output	[2:0]  eidle_infer_sel3 ,
	output	[2:0]  eidle_infer_sel4 ,
	output	[2:0]  eidle_infer_sel5 ,
	output	[2:0]  eidle_infer_sel6 ,
	output	[2:0]  eidle_infer_sel7 ,
	output	ev_128ns ,
	output	ev_1us ,
	output	flr_sts ,
	output	g3_rx_pcs_rst_n0 ,
	output	g3_rx_pcs_rst_n1 ,
	output	g3_rx_pcs_rst_n2 ,
	output	g3_rx_pcs_rst_n3 ,
	output	g3_rx_pcs_rst_n4 ,
	output	g3_rx_pcs_rst_n5 ,
	output	g3_rx_pcs_rst_n6 ,
	output	g3_rx_pcs_rst_n7 ,
	output	g3_tx_pcs_rst_n0 ,
	output	g3_tx_pcs_rst_n1 ,
	output	g3_tx_pcs_rst_n2 ,
	output	g3_tx_pcs_rst_n3 ,
	output	g3_tx_pcs_rst_n4 ,
	output	g3_tx_pcs_rst_n5 ,
	output	g3_tx_pcs_rst_n6 ,
	output	g3_tx_pcs_rst_n7 ,
	output	hotrst_exit ,
	output	[3:0]  int_status ,
	output	[7:0]  k_hip_pcs_chnl_en ,
	output	[7:0]  k_hrc_chnl_en ,
	output	[7:0]  k_hrc_chnl_txpll_master_cgb_rst_en ,
	output	[7:0]  k_hrc_chnl_txpll_rst_en ,
	output	l2_exit ,
	output	[3:0]  lane_act ,
	output	lmi_ack ,
	output	[7:0]  lmi_dout ,
	output	[4:0]  ltssm_state ,
	output	mem_rscout_rcv_bot ,
	output	mem_rscout_rcv_top ,
	output	mem_rscout_rtry ,
	output	pld_clk_in_use ,
	output	[7:0]  pld_gp_ctrl ,
	output	pm_exit_d0_req ,
	output	pme_to_sr ,
	output	[1:0]  powerdown0 ,
	output	[1:0]  powerdown1 ,
	output	[1:0]  powerdown2 ,
	output	[1:0]  powerdown3 ,
	output	[1:0]  powerdown4 ,
	output	[1:0]  powerdown5 ,
	output	[1:0]  powerdown6 ,
	output	[1:0]  powerdown7 ,
	output	r2c_unc_ecc ,
	output	[1:0]  rate0 ,
	output	[1:0]  rate1 ,
	output	[1:0]  rate2 ,
	output	[1:0]  rate3 ,
	output	[1:0]  rate4 ,
	output	[1:0]  rate5 ,
	output	[1:0]  rate6 ,
	output	[1:0]  rate7 ,
	output	[1:0]  rate_ctrl ,
	output	reserved_clk_out ,
	output	[7:0]  reserved_out ,
	output	reset_status ,
	output	retry_corr_ecc ,
	output	retry_unc_ecc ,
	output	rx_corr_ecc ,
	output	[19:0]  rx_cred_status ,
	output	rx_par_err ,
	output	rx_pcs_rst_n0 ,
	output	rx_pcs_rst_n1 ,
	output	rx_pcs_rst_n2 ,
	output	rx_pcs_rst_n3 ,
	output	rx_pcs_rst_n4 ,
	output	rx_pcs_rst_n5 ,
	output	rx_pcs_rst_n6 ,
	output	rx_pcs_rst_n7 ,
	output	rx_pma_rstb0 ,
	output	rx_pma_rstb1 ,
	output	rx_pma_rstb2 ,
	output	rx_pma_rstb3 ,
	output	rx_pma_rstb4 ,
	output	rx_pma_rstb5 ,
	output	rx_pma_rstb6 ,
	output	rx_pma_rstb7 ,
	output	[7:0]  rx_st_bardec1 ,
	output	[7:0]  rx_st_bardec2 ,
	output	[31:0]  rx_st_be ,
	output	[255:0]  rx_st_data ,
	output	[1:0]  rx_st_empty ,
	output	[3:0]  rx_st_eop ,
	output	[3:0]  rx_st_err ,
	output	[31:0]  rx_st_parity ,
	output	[3:0]  rx_st_sop ,
	output	[3:0]  rx_st_valid ,
	output	rxfc_cplbuf_ovf ,
	output	[7:0]  rxfc_cplovf_tag ,
	output	rxpolarity0 ,
	output	rxpolarity1 ,
	output	rxpolarity2 ,
	output	rxpolarity3 ,
	output	rxpolarity4 ,
	output	rxpolarity5 ,
	output	rxpolarity6 ,
	output	rxpolarity7 ,
	output	serr_out ,
	output	[6:0]  swdn_out ,
	output	[2:0]  swup_out ,
	output	test_fref_clk ,
	output	[63:0]  test_out_1_hip ,
	output	[255:0]  test_out_hip ,
	output	[3:0]  tl_cfg_add ,
	output	[31:0]  tl_cfg_ctl ,
	output	[52:0]  tl_cfg_sts ,
	output	tl_cfg_sts_wr ,
	output	[11:0]  tx_cred_data_fc ,
	output	[5:0]  tx_cred_fc_hip_cons ,
	output	[5:0]  tx_cred_fc_infinite ,
	output	[7:0]  tx_cred_hdr_fc ,
	output	tx_deemph0 ,
	output	tx_deemph1 ,
	output	tx_deemph2 ,
	output	tx_deemph3 ,
	output	tx_deemph4 ,
	output	tx_deemph5 ,
	output	tx_deemph6 ,
	output	tx_deemph7 ,
	output	tx_lcff_pll_rstb0 ,
	output	tx_lcff_pll_rstb1 ,
	output	tx_lcff_pll_rstb2 ,
	output	tx_lcff_pll_rstb3 ,
	output	tx_lcff_pll_rstb4 ,
	output	tx_lcff_pll_rstb5 ,
	output	tx_lcff_pll_rstb6 ,
	output	tx_lcff_pll_rstb7 ,
	output	[2:0]  tx_margin0 ,
	output	[2:0]  tx_margin1 ,
	output	[2:0]  tx_margin2 ,
	output	[2:0]  tx_margin3 ,
	output	[2:0]  tx_margin4 ,
	output	[2:0]  tx_margin5 ,
	output	[2:0]  tx_margin6 ,
	output	[2:0]  tx_margin7 ,
	output	[1:0]  tx_par_err ,
	output	tx_pcs_rst_n0 ,
	output	tx_pcs_rst_n1 ,
	output	tx_pcs_rst_n2 ,
	output	tx_pcs_rst_n3 ,
	output	tx_pcs_rst_n4 ,
	output	tx_pcs_rst_n5 ,
	output	tx_pcs_rst_n6 ,
	output	tx_pcs_rst_n7 ,
	output	tx_pma_syncp0 ,
	output	tx_pma_syncp1 ,
	output	tx_pma_syncp2 ,
	output	tx_pma_syncp3 ,
	output	tx_pma_syncp4 ,
	output	tx_pma_syncp5 ,
	output	tx_pma_syncp6 ,
	output	tx_pma_syncp7 ,
	output	tx_st_ready ,
	output	txblkst0 ,
	output	txblkst1 ,
	output	txblkst2 ,
	output	txblkst3 ,
	output	txblkst4 ,
	output	txblkst5 ,
	output	txblkst6 ,
	output	txblkst7 ,
	output	txcompl0 ,
	output	txcompl1 ,
	output	txcompl2 ,
	output	txcompl3 ,
	output	txcompl4 ,
	output	txcompl5 ,
	output	txcompl6 ,
	output	txcompl7 ,
	output	[31:0]  txdata0 ,
	output	[31:0]  txdata1 ,
	output	[31:0]  txdata2 ,
	output	[31:0]  txdata3 ,
	output	[31:0]  txdata4 ,
	output	[31:0]  txdata5 ,
	output	[31:0]  txdata6 ,
	output	[31:0]  txdata7 ,
	output	[3:0]  txdatak0 ,
	output	[3:0]  txdatak1 ,
	output	[3:0]  txdatak2 ,
	output	[3:0]  txdatak3 ,
	output	[3:0]  txdatak4 ,
	output	[3:0]  txdatak5 ,
	output	[3:0]  txdatak6 ,
	output	[3:0]  txdatak7 ,
	output	txdataskip0 ,
	output	txdataskip1 ,
	output	txdataskip2 ,
	output	txdataskip3 ,
	output	txdataskip4 ,
	output	txdataskip5 ,
	output	txdataskip6 ,
	output	txdataskip7 ,
	output	txdetectrx0 ,
	output	txdetectrx1 ,
	output	txdetectrx2 ,
	output	txdetectrx3 ,
	output	txdetectrx4 ,
	output	txdetectrx5 ,
	output	txdetectrx6 ,
	output	txdetectrx7 ,
	output	txelecidle0 ,
	output	txelecidle1 ,
	output	txelecidle2 ,
	output	txelecidle3 ,
	output	txelecidle4 ,
	output	txelecidle5 ,
	output	txelecidle6 ,
	output	txelecidle7 ,
	output	txst_prot_err ,
	output	txswing0 ,
	output	txswing1 ,
	output	txswing2 ,
	output	txswing3 ,
	output	txswing4 ,
	output	txswing5 ,
	output	txswing6 ,
	output	txswing7 ,
	output	[1:0]  txsynchd0 ,
	output	[1:0]  txsynchd1 ,
	output	[1:0]  txsynchd2 ,
	output	[1:0]  txsynchd3 ,
	output	[1:0]  txsynchd4 ,
	output	[1:0]  txsynchd5 ,
	output	[1:0]  txsynchd6 ,
	output	[1:0]  txsynchd7 ,
	output	wake_oen 

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

localparam [8*128-1 : 0] bist_memory_settings_string	= m_bin_to_str(bist_memory_settings);
localparam [8*128-1 : 0] expansion_base_address_register_string	= m_bin_to_str(expansion_base_address_register);
localparam [8*128-1 : 0] jtag_id_string	= m_bin_to_str(jtag_id);
localparam [8*128-1 : 0] retry_buffer_memory_settings_string	= m_bin_to_str(retry_buffer_memory_settings);
localparam [8*128-1 : 0] vc0_rx_buffer_memory_settings_string	= m_bin_to_str(vc0_rx_buffer_memory_settings);


	twentynm_hssi_gen3_x8_pcie_hip_encrypted
	#(
		.enable_debug_info(enable_debug_info) ,

		.acknack_base(acknack_base) ,
		.acknack_set(acknack_set) ,
		.advance_error_reporting(advance_error_reporting) ,
		.app_interface_width(app_interface_width) ,
		.arb_upfc_30us_counter(arb_upfc_30us_counter) ,
		.arb_upfc_30us_en(arb_upfc_30us_en) ,
		.aspm_config_management(aspm_config_management) ,
		.aspm_patch_disable(aspm_patch_disable) ,
		.ast_width_rx(ast_width_rx) ,
		.ast_width_tx(ast_width_tx) ,
		.atomic_malformed(atomic_malformed) ,
		.atomic_op_completer_32bit(atomic_op_completer_32bit) ,
		.atomic_op_completer_64bit(atomic_op_completer_64bit) ,
		.atomic_op_routing(atomic_op_routing) ,
		.auto_msg_drop_enable(auto_msg_drop_enable) ,
		.avmm_cvp_inter_sel_csr_ctrl(avmm_cvp_inter_sel_csr_ctrl) ,
		.avmm_dprio_broadcast_en_csr_ctrl(avmm_dprio_broadcast_en_csr_ctrl) ,
		.avmm_force_inter_sel_csr_ctrl(avmm_force_inter_sel_csr_ctrl) ,
		.avmm_power_iso_en_csr_ctrl(avmm_power_iso_en_csr_ctrl) ,
		.bar0_size_mask(bar0_size_mask) ,
		.bar0_type(bar0_type) ,
		.bar1_size_mask(bar1_size_mask) ,
		.bar1_type(bar1_type) ,
		.bar2_size_mask(bar2_size_mask) ,
		.bar2_type(bar2_type) ,
		.bar3_size_mask(bar3_size_mask) ,
		.bar3_type(bar3_type) ,
		.bar4_size_mask(bar4_size_mask) ,
		.bar4_type(bar4_type) ,
		.bar5_size_mask(bar5_size_mask) ,
		.bar5_type(bar5_type) ,
		.base_counter_sel(base_counter_sel) ,
		.bist_memory_settings(bist_memory_settings_string) ,
		.bridge_port_ssid_support(bridge_port_ssid_support) ,
		.bridge_port_vga_enable(bridge_port_vga_enable) ,
		.bypass_cdc(bypass_cdc) ,
		.bypass_clk_switch(bypass_clk_switch) ,
		.bypass_tl(bypass_tl) ,
		.capab_rate_rxcfg_en(capab_rate_rxcfg_en) ,
		.cas_completer_128bit(cas_completer_128bit) ,
		.cdc_clk_relation(cdc_clk_relation) ,
		.cdc_dummy_insert_limit(cdc_dummy_insert_limit) ,
		.cfg_parchk_ena(cfg_parchk_ena) ,
		.cfgbp_req_recov_disable(cfgbp_req_recov_disable) ,
		.class_code(class_code) ,
		.clock_pwr_management(clock_pwr_management) ,
		.completion_timeout(completion_timeout) ,
		.core_clk_divider(core_clk_divider) ,
		.core_clk_freq_mhz(core_clk_freq_mhz) ,
		.core_clk_out_sel(core_clk_out_sel) ,
		.core_clk_sel(core_clk_sel) ,
		.core_clk_source(core_clk_source) ,
		.cseb_bar_match_checking(cseb_bar_match_checking) ,
		.cseb_config_bypass(cseb_config_bypass) ,
		.cseb_cpl_status_during_cvp(cseb_cpl_status_during_cvp) ,
		.cseb_cpl_tag_checking(cseb_cpl_tag_checking) ,
		.cseb_disable_auto_crs(cseb_disable_auto_crs) ,
		.cseb_extend_pci(cseb_extend_pci) ,
		.cseb_extend_pcie(cseb_extend_pcie) ,
		.cseb_min_error_checking(cseb_min_error_checking) ,
		.cseb_route_to_avl_rx_st(cseb_route_to_avl_rx_st) ,
		.cseb_temp_busy_crs(cseb_temp_busy_crs) ,
		.cvp_clk_reset(cvp_clk_reset) ,
		.cvp_data_compressed(cvp_data_compressed) ,
		.cvp_data_encrypted(cvp_data_encrypted) ,
		.cvp_enable(cvp_enable) ,
		.cvp_mode_reset(cvp_mode_reset) ,
		.cvp_rate_sel(cvp_rate_sel) ,
		.d0_pme(d0_pme) ,
		.d1_pme(d1_pme) ,
		.d1_support(d1_support) ,
		.d2_pme(d2_pme) ,
		.d2_support(d2_support) ,
		.d3_cold_pme(d3_cold_pme) ,
		.d3_hot_pme(d3_hot_pme) ,
		.data_pack_rx(data_pack_rx) ,
		.deemphasis_enable(deemphasis_enable) ,
		.deskew_comma(deskew_comma) ,
		.device_id(device_id) ,
		.device_number(device_number) ,
		.device_specific_init(device_specific_init) ,
		.dft_clock_obsrv_en(dft_clock_obsrv_en) ,
		.dft_clock_obsrv_sel(dft_clock_obsrv_sel) ,
		.diffclock_nfts_count(diffclock_nfts_count) ,
		.dis_cplovf(dis_cplovf) ,
		.dis_paritychk(dis_paritychk) ,
		.disable_link_x2_support(disable_link_x2_support) ,
		.disable_snoop_packet(disable_snoop_packet) ,
		.dl_tx_check_parity_edb(dl_tx_check_parity_edb) ,
		.dll_active_report_support(dll_active_report_support) ,
		.early_dl_up(early_dl_up) ,
		.eco_fb332688_dis(eco_fb332688_dis) ,
		.ecrc_check_capable(ecrc_check_capable) ,
		.ecrc_gen_capable(ecrc_gen_capable) ,
		.egress_block_err_report_ena(egress_block_err_report_ena) ,
		.ei_delay_powerdown_count(ei_delay_powerdown_count) ,
		.eie_before_nfts_count(eie_before_nfts_count) ,
		.electromech_interlock(electromech_interlock) ,
		.en_ieiupdatefc(en_ieiupdatefc) ,
		.en_lane_errchk(en_lane_errchk) ,
		.en_phystatus_dly(en_phystatus_dly) ,
		.ena_ido_cpl(ena_ido_cpl) ,
		.ena_ido_req(ena_ido_req) ,
		.enable_adapter_half_rate_mode(enable_adapter_half_rate_mode) ,
		.enable_ch01_pclk_out(enable_ch01_pclk_out) ,
		.enable_ch0_pclk_out(enable_ch0_pclk_out) ,
		.enable_completion_timeout_disable(enable_completion_timeout_disable) ,
		.enable_directed_spd_chng(enable_directed_spd_chng) ,
		.enable_function_msix_support(enable_function_msix_support) ,
		.enable_l0s_aspm(enable_l0s_aspm) ,
		.enable_l1_aspm(enable_l1_aspm) ,
		.enable_rx_buffer_checking(enable_rx_buffer_checking) ,
		.enable_rx_reordering(enable_rx_reordering) ,
		.enable_slot_register(enable_slot_register) ,
		.endpoint_l0_latency(endpoint_l0_latency) ,
		.endpoint_l1_latency(endpoint_l1_latency) ,
		.eql_rq_int_en_number(eql_rq_int_en_number) ,
		.errmgt_fcpe_patch_dis(errmgt_fcpe_patch_dis) ,
		.errmgt_fep_patch_dis(errmgt_fep_patch_dis) ,
		.expansion_base_address_register(expansion_base_address_register_string) ,
		.extend_tag_field(extend_tag_field) ,
		.extended_format_field(extended_format_field) ,
		.extended_tag_reset(extended_tag_reset) ,
		.fc_init_timer(fc_init_timer) ,
		.flow_control_timeout_count(flow_control_timeout_count) ,
		.flow_control_update_count(flow_control_update_count) ,
		.flr_capability(flr_capability) ,
		.force_dis_to_det(force_dis_to_det) ,
		.force_gen1_dis(force_gen1_dis) ,
		.force_tx_coeff_preset_lpbk(force_tx_coeff_preset_lpbk) ,
		.frame_err_patch_dis(frame_err_patch_dis) ,
		.func_mode(func_mode) ,
		.g3_bypass_equlz(g3_bypass_equlz) ,
		.g3_coeff_done_tmout(g3_coeff_done_tmout) ,
		.g3_deskew_char(g3_deskew_char) ,
		.g3_dis_be_frm_err(g3_dis_be_frm_err) ,
		.g3_dn_rx_hint_eqlz_0(g3_dn_rx_hint_eqlz_0) ,
		.g3_dn_rx_hint_eqlz_1(g3_dn_rx_hint_eqlz_1) ,
		.g3_dn_rx_hint_eqlz_2(g3_dn_rx_hint_eqlz_2) ,
		.g3_dn_rx_hint_eqlz_3(g3_dn_rx_hint_eqlz_3) ,
		.g3_dn_rx_hint_eqlz_4(g3_dn_rx_hint_eqlz_4) ,
		.g3_dn_rx_hint_eqlz_5(g3_dn_rx_hint_eqlz_5) ,
		.g3_dn_rx_hint_eqlz_6(g3_dn_rx_hint_eqlz_6) ,
		.g3_dn_rx_hint_eqlz_7(g3_dn_rx_hint_eqlz_7) ,
		.g3_dn_tx_preset_eqlz_0(g3_dn_tx_preset_eqlz_0) ,
		.g3_dn_tx_preset_eqlz_1(g3_dn_tx_preset_eqlz_1) ,
		.g3_dn_tx_preset_eqlz_2(g3_dn_tx_preset_eqlz_2) ,
		.g3_dn_tx_preset_eqlz_3(g3_dn_tx_preset_eqlz_3) ,
		.g3_dn_tx_preset_eqlz_4(g3_dn_tx_preset_eqlz_4) ,
		.g3_dn_tx_preset_eqlz_5(g3_dn_tx_preset_eqlz_5) ,
		.g3_dn_tx_preset_eqlz_6(g3_dn_tx_preset_eqlz_6) ,
		.g3_dn_tx_preset_eqlz_7(g3_dn_tx_preset_eqlz_7) ,
		.g3_force_ber_max(g3_force_ber_max) ,
		.g3_force_ber_min(g3_force_ber_min) ,
		.g3_lnk_trn_rx_ts(g3_lnk_trn_rx_ts) ,
		.g3_ltssm_eq_dbg(g3_ltssm_eq_dbg) ,
		.g3_ltssm_rec_dbg(g3_ltssm_rec_dbg) ,
		.g3_pause_ltssm_rec_en(g3_pause_ltssm_rec_en) ,
		.g3_quiesce_guarant(g3_quiesce_guarant) ,
		.g3_redo_equlz_dis(g3_redo_equlz_dis) ,
		.g3_redo_equlz_en(g3_redo_equlz_en) ,
		.g3_up_rx_hint_eqlz_0(g3_up_rx_hint_eqlz_0) ,
		.g3_up_rx_hint_eqlz_1(g3_up_rx_hint_eqlz_1) ,
		.g3_up_rx_hint_eqlz_2(g3_up_rx_hint_eqlz_2) ,
		.g3_up_rx_hint_eqlz_3(g3_up_rx_hint_eqlz_3) ,
		.g3_up_rx_hint_eqlz_4(g3_up_rx_hint_eqlz_4) ,
		.g3_up_rx_hint_eqlz_5(g3_up_rx_hint_eqlz_5) ,
		.g3_up_rx_hint_eqlz_6(g3_up_rx_hint_eqlz_6) ,
		.g3_up_rx_hint_eqlz_7(g3_up_rx_hint_eqlz_7) ,
		.g3_up_tx_preset_eqlz_0(g3_up_tx_preset_eqlz_0) ,
		.g3_up_tx_preset_eqlz_1(g3_up_tx_preset_eqlz_1) ,
		.g3_up_tx_preset_eqlz_2(g3_up_tx_preset_eqlz_2) ,
		.g3_up_tx_preset_eqlz_3(g3_up_tx_preset_eqlz_3) ,
		.g3_up_tx_preset_eqlz_4(g3_up_tx_preset_eqlz_4) ,
		.g3_up_tx_preset_eqlz_5(g3_up_tx_preset_eqlz_5) ,
		.g3_up_tx_preset_eqlz_6(g3_up_tx_preset_eqlz_6) ,
		.g3_up_tx_preset_eqlz_7(g3_up_tx_preset_eqlz_7) ,
		.gen123_lane_rate_mode(gen123_lane_rate_mode) ,
		.gen2_diffclock_nfts_count(gen2_diffclock_nfts_count) ,
		.gen2_pma_pll_usage(gen2_pma_pll_usage) ,
		.gen2_sameclock_nfts_count(gen2_sameclock_nfts_count) ,
		.gen3_coeff_1(gen3_coeff_1) ,
		.gen3_coeff_10(gen3_coeff_10) ,
		.gen3_coeff_10_ber_meas(gen3_coeff_10_ber_meas) ,
		.gen3_coeff_10_nxtber_less(gen3_coeff_10_nxtber_less) ,
		.gen3_coeff_10_nxtber_more(gen3_coeff_10_nxtber_more) ,
		.gen3_coeff_10_preset_hint(gen3_coeff_10_preset_hint) ,
		.gen3_coeff_10_reqber(gen3_coeff_10_reqber) ,
		.gen3_coeff_10_sel(gen3_coeff_10_sel) ,
		.gen3_coeff_11(gen3_coeff_11) ,
		.gen3_coeff_11_ber_meas(gen3_coeff_11_ber_meas) ,
		.gen3_coeff_11_nxtber_less(gen3_coeff_11_nxtber_less) ,
		.gen3_coeff_11_nxtber_more(gen3_coeff_11_nxtber_more) ,
		.gen3_coeff_11_preset_hint(gen3_coeff_11_preset_hint) ,
		.gen3_coeff_11_reqber(gen3_coeff_11_reqber) ,
		.gen3_coeff_11_sel(gen3_coeff_11_sel) ,
		.gen3_coeff_12(gen3_coeff_12) ,
		.gen3_coeff_12_ber_meas(gen3_coeff_12_ber_meas) ,
		.gen3_coeff_12_nxtber_less(gen3_coeff_12_nxtber_less) ,
		.gen3_coeff_12_nxtber_more(gen3_coeff_12_nxtber_more) ,
		.gen3_coeff_12_preset_hint(gen3_coeff_12_preset_hint) ,
		.gen3_coeff_12_reqber(gen3_coeff_12_reqber) ,
		.gen3_coeff_12_sel(gen3_coeff_12_sel) ,
		.gen3_coeff_13(gen3_coeff_13) ,
		.gen3_coeff_13_ber_meas(gen3_coeff_13_ber_meas) ,
		.gen3_coeff_13_nxtber_less(gen3_coeff_13_nxtber_less) ,
		.gen3_coeff_13_nxtber_more(gen3_coeff_13_nxtber_more) ,
		.gen3_coeff_13_preset_hint(gen3_coeff_13_preset_hint) ,
		.gen3_coeff_13_reqber(gen3_coeff_13_reqber) ,
		.gen3_coeff_13_sel(gen3_coeff_13_sel) ,
		.gen3_coeff_14(gen3_coeff_14) ,
		.gen3_coeff_14_ber_meas(gen3_coeff_14_ber_meas) ,
		.gen3_coeff_14_nxtber_less(gen3_coeff_14_nxtber_less) ,
		.gen3_coeff_14_nxtber_more(gen3_coeff_14_nxtber_more) ,
		.gen3_coeff_14_preset_hint(gen3_coeff_14_preset_hint) ,
		.gen3_coeff_14_reqber(gen3_coeff_14_reqber) ,
		.gen3_coeff_14_sel(gen3_coeff_14_sel) ,
		.gen3_coeff_15(gen3_coeff_15) ,
		.gen3_coeff_15_ber_meas(gen3_coeff_15_ber_meas) ,
		.gen3_coeff_15_nxtber_less(gen3_coeff_15_nxtber_less) ,
		.gen3_coeff_15_nxtber_more(gen3_coeff_15_nxtber_more) ,
		.gen3_coeff_15_preset_hint(gen3_coeff_15_preset_hint) ,
		.gen3_coeff_15_reqber(gen3_coeff_15_reqber) ,
		.gen3_coeff_15_sel(gen3_coeff_15_sel) ,
		.gen3_coeff_16(gen3_coeff_16) ,
		.gen3_coeff_16_ber_meas(gen3_coeff_16_ber_meas) ,
		.gen3_coeff_16_nxtber_less(gen3_coeff_16_nxtber_less) ,
		.gen3_coeff_16_nxtber_more(gen3_coeff_16_nxtber_more) ,
		.gen3_coeff_16_preset_hint(gen3_coeff_16_preset_hint) ,
		.gen3_coeff_16_reqber(gen3_coeff_16_reqber) ,
		.gen3_coeff_16_sel(gen3_coeff_16_sel) ,
		.gen3_coeff_17(gen3_coeff_17) ,
		.gen3_coeff_17_ber_meas(gen3_coeff_17_ber_meas) ,
		.gen3_coeff_17_nxtber_less(gen3_coeff_17_nxtber_less) ,
		.gen3_coeff_17_nxtber_more(gen3_coeff_17_nxtber_more) ,
		.gen3_coeff_17_preset_hint(gen3_coeff_17_preset_hint) ,
		.gen3_coeff_17_reqber(gen3_coeff_17_reqber) ,
		.gen3_coeff_17_sel(gen3_coeff_17_sel) ,
		.gen3_coeff_18(gen3_coeff_18) ,
		.gen3_coeff_18_ber_meas(gen3_coeff_18_ber_meas) ,
		.gen3_coeff_18_nxtber_less(gen3_coeff_18_nxtber_less) ,
		.gen3_coeff_18_nxtber_more(gen3_coeff_18_nxtber_more) ,
		.gen3_coeff_18_preset_hint(gen3_coeff_18_preset_hint) ,
		.gen3_coeff_18_reqber(gen3_coeff_18_reqber) ,
		.gen3_coeff_18_sel(gen3_coeff_18_sel) ,
		.gen3_coeff_19(gen3_coeff_19) ,
		.gen3_coeff_19_ber_meas(gen3_coeff_19_ber_meas) ,
		.gen3_coeff_19_nxtber_less(gen3_coeff_19_nxtber_less) ,
		.gen3_coeff_19_nxtber_more(gen3_coeff_19_nxtber_more) ,
		.gen3_coeff_19_preset_hint(gen3_coeff_19_preset_hint) ,
		.gen3_coeff_19_reqber(gen3_coeff_19_reqber) ,
		.gen3_coeff_19_sel(gen3_coeff_19_sel) ,
		.gen3_coeff_1_ber_meas(gen3_coeff_1_ber_meas) ,
		.gen3_coeff_1_nxtber_less(gen3_coeff_1_nxtber_less) ,
		.gen3_coeff_1_nxtber_more(gen3_coeff_1_nxtber_more) ,
		.gen3_coeff_1_preset_hint(gen3_coeff_1_preset_hint) ,
		.gen3_coeff_1_reqber(gen3_coeff_1_reqber) ,
		.gen3_coeff_1_sel(gen3_coeff_1_sel) ,
		.gen3_coeff_2(gen3_coeff_2) ,
		.gen3_coeff_20(gen3_coeff_20) ,
		.gen3_coeff_20_ber_meas(gen3_coeff_20_ber_meas) ,
		.gen3_coeff_20_nxtber_less(gen3_coeff_20_nxtber_less) ,
		.gen3_coeff_20_nxtber_more(gen3_coeff_20_nxtber_more) ,
		.gen3_coeff_20_preset_hint(gen3_coeff_20_preset_hint) ,
		.gen3_coeff_20_reqber(gen3_coeff_20_reqber) ,
		.gen3_coeff_20_sel(gen3_coeff_20_sel) ,
		.gen3_coeff_21(gen3_coeff_21) ,
		.gen3_coeff_21_ber_meas(gen3_coeff_21_ber_meas) ,
		.gen3_coeff_21_nxtber_less(gen3_coeff_21_nxtber_less) ,
		.gen3_coeff_21_nxtber_more(gen3_coeff_21_nxtber_more) ,
		.gen3_coeff_21_preset_hint(gen3_coeff_21_preset_hint) ,
		.gen3_coeff_21_reqber(gen3_coeff_21_reqber) ,
		.gen3_coeff_21_sel(gen3_coeff_21_sel) ,
		.gen3_coeff_22(gen3_coeff_22) ,
		.gen3_coeff_22_ber_meas(gen3_coeff_22_ber_meas) ,
		.gen3_coeff_22_nxtber_less(gen3_coeff_22_nxtber_less) ,
		.gen3_coeff_22_nxtber_more(gen3_coeff_22_nxtber_more) ,
		.gen3_coeff_22_preset_hint(gen3_coeff_22_preset_hint) ,
		.gen3_coeff_22_reqber(gen3_coeff_22_reqber) ,
		.gen3_coeff_22_sel(gen3_coeff_22_sel) ,
		.gen3_coeff_23(gen3_coeff_23) ,
		.gen3_coeff_23_ber_meas(gen3_coeff_23_ber_meas) ,
		.gen3_coeff_23_nxtber_less(gen3_coeff_23_nxtber_less) ,
		.gen3_coeff_23_nxtber_more(gen3_coeff_23_nxtber_more) ,
		.gen3_coeff_23_preset_hint(gen3_coeff_23_preset_hint) ,
		.gen3_coeff_23_reqber(gen3_coeff_23_reqber) ,
		.gen3_coeff_23_sel(gen3_coeff_23_sel) ,
		.gen3_coeff_24(gen3_coeff_24) ,
		.gen3_coeff_24_ber_meas(gen3_coeff_24_ber_meas) ,
		.gen3_coeff_24_nxtber_less(gen3_coeff_24_nxtber_less) ,
		.gen3_coeff_24_nxtber_more(gen3_coeff_24_nxtber_more) ,
		.gen3_coeff_24_preset_hint(gen3_coeff_24_preset_hint) ,
		.gen3_coeff_24_reqber(gen3_coeff_24_reqber) ,
		.gen3_coeff_24_sel(gen3_coeff_24_sel) ,
		.gen3_coeff_2_ber_meas(gen3_coeff_2_ber_meas) ,
		.gen3_coeff_2_nxtber_less(gen3_coeff_2_nxtber_less) ,
		.gen3_coeff_2_nxtber_more(gen3_coeff_2_nxtber_more) ,
		.gen3_coeff_2_preset_hint(gen3_coeff_2_preset_hint) ,
		.gen3_coeff_2_reqber(gen3_coeff_2_reqber) ,
		.gen3_coeff_2_sel(gen3_coeff_2_sel) ,
		.gen3_coeff_3(gen3_coeff_3) ,
		.gen3_coeff_3_ber_meas(gen3_coeff_3_ber_meas) ,
		.gen3_coeff_3_nxtber_less(gen3_coeff_3_nxtber_less) ,
		.gen3_coeff_3_nxtber_more(gen3_coeff_3_nxtber_more) ,
		.gen3_coeff_3_preset_hint(gen3_coeff_3_preset_hint) ,
		.gen3_coeff_3_reqber(gen3_coeff_3_reqber) ,
		.gen3_coeff_3_sel(gen3_coeff_3_sel) ,
		.gen3_coeff_4(gen3_coeff_4) ,
		.gen3_coeff_4_ber_meas(gen3_coeff_4_ber_meas) ,
		.gen3_coeff_4_nxtber_less(gen3_coeff_4_nxtber_less) ,
		.gen3_coeff_4_nxtber_more(gen3_coeff_4_nxtber_more) ,
		.gen3_coeff_4_preset_hint(gen3_coeff_4_preset_hint) ,
		.gen3_coeff_4_reqber(gen3_coeff_4_reqber) ,
		.gen3_coeff_4_sel(gen3_coeff_4_sel) ,
		.gen3_coeff_5(gen3_coeff_5) ,
		.gen3_coeff_5_ber_meas(gen3_coeff_5_ber_meas) ,
		.gen3_coeff_5_nxtber_less(gen3_coeff_5_nxtber_less) ,
		.gen3_coeff_5_nxtber_more(gen3_coeff_5_nxtber_more) ,
		.gen3_coeff_5_preset_hint(gen3_coeff_5_preset_hint) ,
		.gen3_coeff_5_reqber(gen3_coeff_5_reqber) ,
		.gen3_coeff_5_sel(gen3_coeff_5_sel) ,
		.gen3_coeff_6(gen3_coeff_6) ,
		.gen3_coeff_6_ber_meas(gen3_coeff_6_ber_meas) ,
		.gen3_coeff_6_nxtber_less(gen3_coeff_6_nxtber_less) ,
		.gen3_coeff_6_nxtber_more(gen3_coeff_6_nxtber_more) ,
		.gen3_coeff_6_preset_hint(gen3_coeff_6_preset_hint) ,
		.gen3_coeff_6_reqber(gen3_coeff_6_reqber) ,
		.gen3_coeff_6_sel(gen3_coeff_6_sel) ,
		.gen3_coeff_7(gen3_coeff_7) ,
		.gen3_coeff_7_ber_meas(gen3_coeff_7_ber_meas) ,
		.gen3_coeff_7_nxtber_less(gen3_coeff_7_nxtber_less) ,
		.gen3_coeff_7_nxtber_more(gen3_coeff_7_nxtber_more) ,
		.gen3_coeff_7_preset_hint(gen3_coeff_7_preset_hint) ,
		.gen3_coeff_7_reqber(gen3_coeff_7_reqber) ,
		.gen3_coeff_7_sel(gen3_coeff_7_sel) ,
		.gen3_coeff_8(gen3_coeff_8) ,
		.gen3_coeff_8_ber_meas(gen3_coeff_8_ber_meas) ,
		.gen3_coeff_8_nxtber_less(gen3_coeff_8_nxtber_less) ,
		.gen3_coeff_8_nxtber_more(gen3_coeff_8_nxtber_more) ,
		.gen3_coeff_8_preset_hint(gen3_coeff_8_preset_hint) ,
		.gen3_coeff_8_reqber(gen3_coeff_8_reqber) ,
		.gen3_coeff_8_sel(gen3_coeff_8_sel) ,
		.gen3_coeff_9(gen3_coeff_9) ,
		.gen3_coeff_9_ber_meas(gen3_coeff_9_ber_meas) ,
		.gen3_coeff_9_nxtber_less(gen3_coeff_9_nxtber_less) ,
		.gen3_coeff_9_nxtber_more(gen3_coeff_9_nxtber_more) ,
		.gen3_coeff_9_preset_hint(gen3_coeff_9_preset_hint) ,
		.gen3_coeff_9_reqber(gen3_coeff_9_reqber) ,
		.gen3_coeff_9_sel(gen3_coeff_9_sel) ,
		.gen3_coeff_delay_count(gen3_coeff_delay_count) ,
		.gen3_coeff_errchk(gen3_coeff_errchk) ,
		.gen3_dcbal_en(gen3_dcbal_en) ,
		.gen3_diffclock_nfts_count(gen3_diffclock_nfts_count) ,
		.gen3_force_local_coeff(gen3_force_local_coeff) ,
		.gen3_full_swing(gen3_full_swing) ,
		.gen3_half_swing(gen3_half_swing) ,
		.gen3_low_freq(gen3_low_freq) ,
		.gen3_paritychk(gen3_paritychk) ,
		.gen3_pl_framing_err_dis(gen3_pl_framing_err_dis) ,
		.gen3_preset_coeff_1(gen3_preset_coeff_1) ,
		.gen3_preset_coeff_10(gen3_preset_coeff_10) ,
		.gen3_preset_coeff_11(gen3_preset_coeff_11) ,
		.gen3_preset_coeff_2(gen3_preset_coeff_2) ,
		.gen3_preset_coeff_3(gen3_preset_coeff_3) ,
		.gen3_preset_coeff_4(gen3_preset_coeff_4) ,
		.gen3_preset_coeff_5(gen3_preset_coeff_5) ,
		.gen3_preset_coeff_6(gen3_preset_coeff_6) ,
		.gen3_preset_coeff_7(gen3_preset_coeff_7) ,
		.gen3_preset_coeff_8(gen3_preset_coeff_8) ,
		.gen3_preset_coeff_9(gen3_preset_coeff_9) ,
		.gen3_reset_eieos_cnt_bit(gen3_reset_eieos_cnt_bit) ,
		.gen3_rxfreqlock_counter(gen3_rxfreqlock_counter) ,
		.gen3_sameclock_nfts_count(gen3_sameclock_nfts_count) ,
		.gen3_scrdscr_bypass(gen3_scrdscr_bypass) ,
		.gen3_skip_ph2_ph3(gen3_skip_ph2_ph3) ,
		.hard_reset_bypass(hard_reset_bypass) ,
		.hard_rst_sig_chnl_en(hard_rst_sig_chnl_en) ,
		.hard_rst_tx_pll_rst_chnl_en(hard_rst_tx_pll_rst_chnl_en) ,
		.hip_ac_pwr_clk_freq_in_hz(hip_ac_pwr_clk_freq_in_hz) ,
		.hip_ac_pwr_uw_per_mhz(hip_ac_pwr_uw_per_mhz) ,
		.hip_base_address(hip_base_address) ,
		.hip_clock_dis(hip_clock_dis) ,
		.hip_hard_reset(hip_hard_reset) ,
		.hip_pcs_sig_chnl_en(hip_pcs_sig_chnl_en) ,
		.hot_plug_support(hot_plug_support) ,
		.hrc_chnl_txpll_master_cgb_rst_select(hrc_chnl_txpll_master_cgb_rst_select) ,
		.hrdrstctrl_en(hrdrstctrl_en) ,
		.iei_enable_settings(iei_enable_settings) ,
		.indicator(indicator) ,
		.intel_id_access(intel_id_access) ,
		.interrupt_pin(interrupt_pin) ,
		.io_window_addr_width(io_window_addr_width) ,
		.jtag_id(jtag_id_string) ,
		.ko_compl_data(ko_compl_data) ,
		.ko_compl_header(ko_compl_header) ,
		.l01_entry_latency(l01_entry_latency) ,
		.l0_exit_latency_diffclock(l0_exit_latency_diffclock) ,
		.l0_exit_latency_sameclock(l0_exit_latency_sameclock) ,
		.l0s_adj_rply_timer_dis(l0s_adj_rply_timer_dis) ,
		.l1_exit_latency_diffclock(l1_exit_latency_diffclock) ,
		.l1_exit_latency_sameclock(l1_exit_latency_sameclock) ,
		.l2_async_logic(l2_async_logic) ,
		.lane_mask(lane_mask) ,
		.lane_rate(lane_rate) ,
		.link_width(link_width) ,
		.lmi_hold_off_cfg_timer_en(lmi_hold_off_cfg_timer_en) ,
		.low_priority_vc(low_priority_vc) ,
		.ltr_mechanism(ltr_mechanism) ,
		.ltssm_1ms_timeout(ltssm_1ms_timeout) ,
		.ltssm_freqlocked_check(ltssm_freqlocked_check) ,
		.malformed_tlp_truncate_en(malformed_tlp_truncate_en) ,
		.max_link_width(max_link_width) ,
		.max_payload_size(max_payload_size) ,
		.maximum_current(maximum_current) ,
		.millisecond_cycle_count(millisecond_cycle_count) ,
		.msi_64bit_addressing_capable(msi_64bit_addressing_capable) ,
		.msi_masking_capable(msi_masking_capable) ,
		.msi_multi_message_capable(msi_multi_message_capable) ,
		.msi_support(msi_support) ,
		.msix_pba_bir(msix_pba_bir) ,
		.msix_pba_offset(msix_pba_offset) ,
		.msix_table_bir(msix_table_bir) ,
		.msix_table_offset(msix_table_offset) ,
		.msix_table_size(msix_table_size) ,
		.national_inst_thru_enhance(national_inst_thru_enhance) ,
		.no_command_completed(no_command_completed) ,
		.no_soft_reset(no_soft_reset) ,
		.not_use_k_gbl_bits(not_use_k_gbl_bits) ,
		.operating_voltage(operating_voltage) ,
		.pcie_base_spec(pcie_base_spec) ,
		.pcie_mode(pcie_mode) ,
		.pcie_spec_1p0_compliance(pcie_spec_1p0_compliance) ,
		.pcie_spec_version(pcie_spec_version) ,
		.pclk_out_sel(pclk_out_sel) ,
		.pld_in_use_reg(pld_in_use_reg) ,
		.pm_latency_patch_dis(pm_latency_patch_dis) ,
		.pm_txdl_patch_dis(pm_txdl_patch_dis) ,
		.pme_clock(pme_clock) ,
		.port_link_number(port_link_number) ,
		.port_type(port_type) ,
		.powerdown_mode(powerdown_mode) ,
		.prefetchable_mem_window_addr_width(prefetchable_mem_window_addr_width) ,
		.r2c_mask_easy(r2c_mask_easy) ,
		.r2c_mask_enable(r2c_mask_enable) ,
		.rec_frqlk_mon_en(rec_frqlk_mon_en) ,
		.register_pipe_signals(register_pipe_signals) ,
		.retry_buffer_last_active_address(retry_buffer_last_active_address) ,
		.retry_buffer_memory_settings(retry_buffer_memory_settings_string) ,
		.retry_ecc_corr_mask_dis(retry_ecc_corr_mask_dis) ,
		.revision_id(revision_id) ,
		.role_based_error_reporting(role_based_error_reporting) ,
		.rp_bug_fix_pri_sec_stat_reg(rp_bug_fix_pri_sec_stat_reg) ,
		.rpltim_base(rpltim_base) ,
		.rpltim_set(rpltim_set) ,
		.rstctl_ltssm_dis(rstctl_ltssm_dis) ,
		.rstctrl_1ms_count_fref_clk(rstctrl_1ms_count_fref_clk) ,
		.rstctrl_1us_count_fref_clk(rstctrl_1us_count_fref_clk) ,
		.rstctrl_altpe3_crst_n_inv(rstctrl_altpe3_crst_n_inv) ,
		.rstctrl_altpe3_rst_n_inv(rstctrl_altpe3_rst_n_inv) ,
		.rstctrl_altpe3_srst_n_inv(rstctrl_altpe3_srst_n_inv) ,
		.rstctrl_chnl_cal_done_select(rstctrl_chnl_cal_done_select) ,
		.rstctrl_debug_en(rstctrl_debug_en) ,
		.rstctrl_force_inactive_rst(rstctrl_force_inactive_rst) ,
		.rstctrl_fref_clk_select(rstctrl_fref_clk_select) ,
		.rstctrl_hard_block_enable(rstctrl_hard_block_enable) ,
		.rstctrl_hip_ep(rstctrl_hip_ep) ,
		.rstctrl_mask_tx_pll_lock_select(rstctrl_mask_tx_pll_lock_select) ,
		.rstctrl_perst_enable(rstctrl_perst_enable) ,
		.rstctrl_perstn_select(rstctrl_perstn_select) ,
		.rstctrl_pld_clr(rstctrl_pld_clr) ,
		.rstctrl_pll_cal_done_select(rstctrl_pll_cal_done_select) ,
		.rstctrl_rx_pcs_rst_n_inv(rstctrl_rx_pcs_rst_n_inv) ,
		.rstctrl_rx_pcs_rst_n_select(rstctrl_rx_pcs_rst_n_select) ,
		.rstctrl_rx_pll_freq_lock_select(rstctrl_rx_pll_freq_lock_select) ,
		.rstctrl_rx_pll_lock_select(rstctrl_rx_pll_lock_select) ,
		.rstctrl_rx_pma_rstb_inv(rstctrl_rx_pma_rstb_inv) ,
		.rstctrl_rx_pma_rstb_select(rstctrl_rx_pma_rstb_select) ,
		.rstctrl_timer_a(rstctrl_timer_a) ,
		.rstctrl_timer_a_type(rstctrl_timer_a_type) ,
		.rstctrl_timer_b(rstctrl_timer_b) ,
		.rstctrl_timer_b_type(rstctrl_timer_b_type) ,
		.rstctrl_timer_c(rstctrl_timer_c) ,
		.rstctrl_timer_c_type(rstctrl_timer_c_type) ,
		.rstctrl_timer_d(rstctrl_timer_d) ,
		.rstctrl_timer_d_type(rstctrl_timer_d_type) ,
		.rstctrl_timer_e(rstctrl_timer_e) ,
		.rstctrl_timer_e_type(rstctrl_timer_e_type) ,
		.rstctrl_timer_f(rstctrl_timer_f) ,
		.rstctrl_timer_f_type(rstctrl_timer_f_type) ,
		.rstctrl_timer_g(rstctrl_timer_g) ,
		.rstctrl_timer_g_type(rstctrl_timer_g_type) ,
		.rstctrl_timer_h(rstctrl_timer_h) ,
		.rstctrl_timer_h_type(rstctrl_timer_h_type) ,
		.rstctrl_timer_i(rstctrl_timer_i) ,
		.rstctrl_timer_i_type(rstctrl_timer_i_type) ,
		.rstctrl_timer_j(rstctrl_timer_j) ,
		.rstctrl_timer_j_type(rstctrl_timer_j_type) ,
		.rstctrl_tx_lcff_pll_lock_select(rstctrl_tx_lcff_pll_lock_select) ,
		.rstctrl_tx_lcff_pll_rstb_select(rstctrl_tx_lcff_pll_rstb_select) ,
		.rstctrl_tx_pcs_rst_n_inv(rstctrl_tx_pcs_rst_n_inv) ,
		.rstctrl_tx_pcs_rst_n_select(rstctrl_tx_pcs_rst_n_select) ,
		.rstctrl_tx_pma_rstb_inv(rstctrl_tx_pma_rstb_inv) ,
		.rstctrl_tx_pma_syncp_inv(rstctrl_tx_pma_syncp_inv) ,
		.rstctrl_tx_pma_syncp_select(rstctrl_tx_pma_syncp_select) ,
		.rx_ast_parity(rx_ast_parity) ,
		.rx_buffer_credit_alloc(rx_buffer_credit_alloc) ,
		.rx_buffer_fc_protect(rx_buffer_fc_protect) ,
		.rx_buffer_protect(rx_buffer_protect) ,
		.rx_cdc_almost_empty(rx_cdc_almost_empty) ,
		.rx_cdc_almost_full(rx_cdc_almost_full) ,
		.rx_cred_ctl_param(rx_cred_ctl_param) ,
		.rx_ei_l0s(rx_ei_l0s) ,
		.rx_l0s_count_idl(rx_l0s_count_idl) ,
		.rx_ptr0_nonposted_dpram_max(rx_ptr0_nonposted_dpram_max) ,
		.rx_ptr0_nonposted_dpram_min(rx_ptr0_nonposted_dpram_min) ,
		.rx_ptr0_posted_dpram_max(rx_ptr0_posted_dpram_max) ,
		.rx_ptr0_posted_dpram_min(rx_ptr0_posted_dpram_min) ,
		.rx_runt_patch_dis(rx_runt_patch_dis) ,
		.rx_sop_ctrl(rx_sop_ctrl) ,
		.rx_trunc_patch_dis(rx_trunc_patch_dis) ,
		.rx_use_prst(rx_use_prst) ,
		.rx_use_prst_ep(rx_use_prst_ep) ,
		.rxbuf_ecc_corr_mask_dis(rxbuf_ecc_corr_mask_dis) ,
		.rxdl_bad_sop_eop_filter_dis(rxdl_bad_sop_eop_filter_dis) ,
		.rxdl_bad_tlp_patch_dis(rxdl_bad_tlp_patch_dis) ,
		.rxdl_lcrc_patch_dis(rxdl_lcrc_patch_dis) ,
		.sameclock_nfts_count(sameclock_nfts_count) ,
		.sel_enable_pcs_rx_fifo_err(sel_enable_pcs_rx_fifo_err) ,
		.silicon_rev(silicon_rev) ,
		.sim_mode(sim_mode) ,
		.simple_ro_fifo_control_en(simple_ro_fifo_control_en) ,
		.single_rx_detect(single_rx_detect) ,
		.skp_os_gen3_count(skp_os_gen3_count) ,
		.skp_os_schedule_count(skp_os_schedule_count) ,
		.slot_number(slot_number) ,
		.slot_power_limit(slot_power_limit) ,
		.slot_power_scale(slot_power_scale) ,
		.slotclk_cfg(slotclk_cfg) ,
		.ssid(ssid) ,
		.ssvid(ssvid) ,
		.subsystem_device_id(subsystem_device_id) ,
		.subsystem_vendor_id(subsystem_vendor_id) ,
		.sup_mode(sup_mode) ,
		.surprise_down_error_support(surprise_down_error_support) ,
		.tl_cfg_div(tl_cfg_div) ,
		.tl_tx_check_parity_msg(tl_tx_check_parity_msg) ,
		.tph_completer(tph_completer) ,
		.tx_ast_parity(tx_ast_parity) ,
		.tx_cdc_almost_empty(tx_cdc_almost_empty) ,
		.tx_cdc_almost_full(tx_cdc_almost_full) ,
		.tx_sop_ctrl(tx_sop_ctrl) ,
		.tx_swing(tx_swing) ,
		.txdl_fair_arbiter_counter(txdl_fair_arbiter_counter) ,
		.txdl_fair_arbiter_en(txdl_fair_arbiter_en) ,
		.txrate_adv(txrate_adv) ,
		.uc_calibration_en(uc_calibration_en) ,
		.use_aer(use_aer) ,
		.use_crc_forwarding(use_crc_forwarding) ,
		.user_id(user_id) ,
		.vc0_clk_enable(vc0_clk_enable) ,
		.vc0_rx_buffer_memory_settings(vc0_rx_buffer_memory_settings_string) ,
		.vc0_rx_flow_ctrl_compl_data(vc0_rx_flow_ctrl_compl_data) ,
		.vc0_rx_flow_ctrl_compl_header(vc0_rx_flow_ctrl_compl_header) ,
		.vc0_rx_flow_ctrl_nonposted_data(vc0_rx_flow_ctrl_nonposted_data) ,
		.vc0_rx_flow_ctrl_nonposted_header(vc0_rx_flow_ctrl_nonposted_header) ,
		.vc0_rx_flow_ctrl_posted_data(vc0_rx_flow_ctrl_posted_data) ,
		.vc0_rx_flow_ctrl_posted_header(vc0_rx_flow_ctrl_posted_header) ,
		.vc1_clk_enable(vc1_clk_enable) ,
		.vc_arbitration(vc_arbitration) ,
		.vc_enable(vc_enable) ,
		.vendor_id(vendor_id) ,
		.vsec_cap(vsec_cap) ,
		.vsec_id(vsec_id) ,
		.wrong_device_id(wrong_device_id)

	)
	twentynm_hssi_gen3_x8_pcie_hip_encrypted_inst (

		.aer_msi_num(aer_msi_num),
		.app_int_err(app_int_err),
		.app_inta_sts(app_inta_sts),
		.app_msi_num(app_msi_num),
		.app_msi_req(app_msi_req),
		.app_msi_tc(app_msi_tc),
		.atpg_los_en_n(atpg_los_en_n),
		.avmm_address(avmm_address),
		.avmm_byte_en(avmm_byte_en),
		.avmm_clk(avmm_clk),
		.avmm_read(avmm_read),
		.avmm_rst_n(avmm_rst_n),
		.avmm_write(avmm_write),
		.avmm_writedata(avmm_writedata),
		.bist_scanen(bist_scanen),
		.bist_scanin(bist_scanin),
		.bisten_rcv_n(bisten_rcv_n),
		.bisten_rpl_n(bisten_rpl_n),
		.bistmode_n(bistmode_n),
		.cfg_link2csr_pld(cfg_link2csr_pld),
		.cfg_prmbus_pld(cfg_prmbus_pld),
		.chnl_cal_done0(chnl_cal_done0),
		.chnl_cal_done1(chnl_cal_done1),
		.chnl_cal_done2(chnl_cal_done2),
		.chnl_cal_done3(chnl_cal_done3),
		.chnl_cal_done4(chnl_cal_done4),
		.chnl_cal_done5(chnl_cal_done5),
		.chnl_cal_done6(chnl_cal_done6),
		.chnl_cal_done7(chnl_cal_done7),
		.core_clk_in(core_clk_in),
		.core_crst(core_crst),
		.core_por(core_por),
		.core_rst(core_rst),
		.core_srst(core_srst),
		.cpl_err(cpl_err),
		.cpl_pending(cpl_pending),
		.cseb_rddata(cseb_rddata),
		.cseb_rddata_parity(cseb_rddata_parity),
		.cseb_rdresponse(cseb_rdresponse),
		.cseb_waitrequest(cseb_waitrequest),
		.cseb_wrresp_valid(cseb_wrresp_valid),
		.cseb_wrresponse(cseb_wrresponse),
		.csr_cbdin(csr_cbdin),
		.csr_clk(csr_clk),
		.csr_din(csr_din),
		.csr_en(csr_en),
		.csr_enscan(csr_enscan),
		.csr_entest(csr_entest),
		.csr_in(csr_in),
		.csr_load_csr(csr_load_csr),
		.csr_pipe_in(csr_pipe_in),
		.csr_seg(csr_seg),
		.csr_tcsrin(csr_tcsrin),
		.csr_tverify(csr_tverify),
		.cvp_config_done(cvp_config_done),
		.cvp_config_error(cvp_config_error),
		.cvp_config_ready(cvp_config_ready),
		.cvp_en(cvp_en),
		.egress_blk_err(egress_blk_err),
		.entest(entest),
		.flr_reset(flr_reset),
		.force_tx_eidle(force_tx_eidle),
		.fref_clk0(fref_clk0),
		.fref_clk1(fref_clk1),
		.fref_clk2(fref_clk2),
		.fref_clk3(fref_clk3),
		.fref_clk4(fref_clk4),
		.fref_clk5(fref_clk5),
		.fref_clk6(fref_clk6),
		.fref_clk7(fref_clk7),
		.frzlogic(frzlogic),
		.frzreg(frzreg),
		.hold_ltssm_rec(hold_ltssm_rec),
		.hpg_ctrler(hpg_ctrler),
		.iocsrrdy_dly(iocsrrdy_dly),
		.lmi_addr(lmi_addr),
		.lmi_din(lmi_din),
		.lmi_rden(lmi_rden),
		.lmi_wren(lmi_wren),
		.m10k_select(m10k_select),
		.mask_tx_pll_lock0(mask_tx_pll_lock0),
		.mask_tx_pll_lock1(mask_tx_pll_lock1),
		.mask_tx_pll_lock2(mask_tx_pll_lock2),
		.mask_tx_pll_lock3(mask_tx_pll_lock3),
		.mask_tx_pll_lock4(mask_tx_pll_lock4),
		.mask_tx_pll_lock5(mask_tx_pll_lock5),
		.mask_tx_pll_lock6(mask_tx_pll_lock6),
		.mask_tx_pll_lock7(mask_tx_pll_lock7),
		.mem_hip_test_enable(mem_hip_test_enable),
		.mem_regscanen_n(mem_regscanen_n),
		.mem_rscin_rcv_bot(mem_rscin_rcv_bot),
		.mem_rscin_rcv_top(mem_rscin_rcv_top),
		.mem_rscin_rtry(mem_rscin_rtry),
		.nfrzdrv(nfrzdrv),
		.npor(npor),
		.pclk_central(pclk_central),
		.pclk_ch0(pclk_ch0),
		.pclk_ch1(pclk_ch1),
		.pex_msi_num(pex_msi_num),
		.phy_rst(phy_rst),
		.phy_srst(phy_srst),
		.phystatus0(phystatus0),
		.phystatus1(phystatus1),
		.phystatus2(phystatus2),
		.phystatus3(phystatus3),
		.phystatus4(phystatus4),
		.phystatus5(phystatus5),
		.phystatus6(phystatus6),
		.phystatus7(phystatus7),
		.pin_perst_n(pin_perst_n),
		.pld_clk(pld_clk),
		.pld_clrhip_n(pld_clrhip_n),
		.pld_clrpcship_n(pld_clrpcship_n),
		.pld_clrpmapcship_n(pld_clrpmapcship_n),
		.pld_core_ready(pld_core_ready),
		.pld_gp_status(pld_gp_status),
		.pld_perst_n(pld_perst_n),
		.pll_cal_done0(pll_cal_done0),
		.pll_cal_done1(pll_cal_done1),
		.pll_cal_done2(pll_cal_done2),
		.pll_cal_done3(pll_cal_done3),
		.pll_cal_done4(pll_cal_done4),
		.pll_cal_done5(pll_cal_done5),
		.pll_cal_done6(pll_cal_done6),
		.pll_cal_done7(pll_cal_done7),
		.pll_fixed_clk_central(pll_fixed_clk_central),
		.pll_fixed_clk_ch0(pll_fixed_clk_ch0),
		.pll_fixed_clk_ch1(pll_fixed_clk_ch1),
		.plniotri(plniotri),
		.pm_auxpwr(pm_auxpwr),
		.pm_data(pm_data),
		.pm_event(pm_event),
		.pm_exit_d0_ack(pm_exit_d0_ack),
		.pme_to_cr(pme_to_cr),
		.reserved_clk_in(reserved_clk_in),
		.reserved_in(reserved_in),
		.rx_cred_ctl(rx_cred_ctl),
		.rx_pll_freq_lock0(rx_pll_freq_lock0),
		.rx_pll_freq_lock1(rx_pll_freq_lock1),
		.rx_pll_freq_lock2(rx_pll_freq_lock2),
		.rx_pll_freq_lock3(rx_pll_freq_lock3),
		.rx_pll_freq_lock4(rx_pll_freq_lock4),
		.rx_pll_freq_lock5(rx_pll_freq_lock5),
		.rx_pll_freq_lock6(rx_pll_freq_lock6),
		.rx_pll_freq_lock7(rx_pll_freq_lock7),
		.rx_pll_phase_lock0(rx_pll_phase_lock0),
		.rx_pll_phase_lock1(rx_pll_phase_lock1),
		.rx_pll_phase_lock2(rx_pll_phase_lock2),
		.rx_pll_phase_lock3(rx_pll_phase_lock3),
		.rx_pll_phase_lock4(rx_pll_phase_lock4),
		.rx_pll_phase_lock5(rx_pll_phase_lock5),
		.rx_pll_phase_lock6(rx_pll_phase_lock6),
		.rx_pll_phase_lock7(rx_pll_phase_lock7),
		.rx_st_mask(rx_st_mask),
		.rx_st_ready(rx_st_ready),
		.rxblkst0(rxblkst0),
		.rxblkst1(rxblkst1),
		.rxblkst2(rxblkst2),
		.rxblkst3(rxblkst3),
		.rxblkst4(rxblkst4),
		.rxblkst5(rxblkst5),
		.rxblkst6(rxblkst6),
		.rxblkst7(rxblkst7),
		.rxdata0(rxdata0),
		.rxdata1(rxdata1),
		.rxdata2(rxdata2),
		.rxdata3(rxdata3),
		.rxdata4(rxdata4),
		.rxdata5(rxdata5),
		.rxdata6(rxdata6),
		.rxdata7(rxdata7),
		.rxdatak0(rxdatak0),
		.rxdatak1(rxdatak1),
		.rxdatak2(rxdatak2),
		.rxdatak3(rxdatak3),
		.rxdatak4(rxdatak4),
		.rxdatak5(rxdatak5),
		.rxdatak6(rxdatak6),
		.rxdatak7(rxdatak7),
		.rxdataskip0(rxdataskip0),
		.rxdataskip1(rxdataskip1),
		.rxdataskip2(rxdataskip2),
		.rxdataskip3(rxdataskip3),
		.rxdataskip4(rxdataskip4),
		.rxdataskip5(rxdataskip5),
		.rxdataskip6(rxdataskip6),
		.rxdataskip7(rxdataskip7),
		.rxelecidle0(rxelecidle0),
		.rxelecidle1(rxelecidle1),
		.rxelecidle2(rxelecidle2),
		.rxelecidle3(rxelecidle3),
		.rxelecidle4(rxelecidle4),
		.rxelecidle5(rxelecidle5),
		.rxelecidle6(rxelecidle6),
		.rxelecidle7(rxelecidle7),
		.rxfreqlocked0(rxfreqlocked0),
		.rxfreqlocked1(rxfreqlocked1),
		.rxfreqlocked2(rxfreqlocked2),
		.rxfreqlocked3(rxfreqlocked3),
		.rxfreqlocked4(rxfreqlocked4),
		.rxfreqlocked5(rxfreqlocked5),
		.rxfreqlocked6(rxfreqlocked6),
		.rxfreqlocked7(rxfreqlocked7),
		.rxstatus0(rxstatus0),
		.rxstatus1(rxstatus1),
		.rxstatus2(rxstatus2),
		.rxstatus3(rxstatus3),
		.rxstatus4(rxstatus4),
		.rxstatus5(rxstatus5),
		.rxstatus6(rxstatus6),
		.rxstatus7(rxstatus7),
		.rxsynchd0(rxsynchd0),
		.rxsynchd1(rxsynchd1),
		.rxsynchd2(rxsynchd2),
		.rxsynchd3(rxsynchd3),
		.rxsynchd4(rxsynchd4),
		.rxsynchd5(rxsynchd5),
		.rxsynchd6(rxsynchd6),
		.rxsynchd7(rxsynchd7),
		.rxvalid0(rxvalid0),
		.rxvalid1(rxvalid1),
		.rxvalid2(rxvalid2),
		.rxvalid3(rxvalid3),
		.rxvalid4(rxvalid4),
		.rxvalid5(rxvalid5),
		.rxvalid6(rxvalid6),
		.rxvalid7(rxvalid7),
		.scan_mode_n(scan_mode_n),
		.scan_shift_n(scan_shift_n),
		.sw_ctmod(sw_ctmod),
		.swdn_in(swdn_in),
		.swup_in(swup_in),
		.test_in_1_hip(test_in_1_hip),
		.test_in_hip(test_in_hip),
		.test_pl_dbg_eqin(test_pl_dbg_eqin),
		.tx_cred_cons_select(tx_cred_cons_select),
		.tx_cred_fc_sel(tx_cred_fc_sel),
		.tx_lcff_pll_lock0(tx_lcff_pll_lock0),
		.tx_lcff_pll_lock1(tx_lcff_pll_lock1),
		.tx_lcff_pll_lock2(tx_lcff_pll_lock2),
		.tx_lcff_pll_lock3(tx_lcff_pll_lock3),
		.tx_lcff_pll_lock4(tx_lcff_pll_lock4),
		.tx_lcff_pll_lock5(tx_lcff_pll_lock5),
		.tx_lcff_pll_lock6(tx_lcff_pll_lock6),
		.tx_lcff_pll_lock7(tx_lcff_pll_lock7),
		.tx_st_data(tx_st_data),
		.tx_st_empty(tx_st_empty),
		.tx_st_eop(tx_st_eop),
		.tx_st_err(tx_st_err),
		.tx_st_parity(tx_st_parity),
		.tx_st_sop(tx_st_sop),
		.tx_st_valid(tx_st_valid),
		.user_mode(user_mode),
		.sta_hd_altpe3_hip_core_top_hd_altpe3_hip_core_u_clkmux_core_clk_cnt_reg_0_0_Q(sta_hd_altpe3_hip_core_top_hd_altpe3_hip_core_u_clkmux_core_clk_cnt_reg_0_0_Q),
		.sta_hd_altpe3_hip_core_top_hd_altpe3_hip_core_u_clkmux_core_clk_cnt_reg_1_0_Q(sta_hd_altpe3_hip_core_top_hd_altpe3_hip_core_u_clkmux_core_clk_cnt_reg_1_0_Q),
		.sta_hd_altpe3_hip_core_top_hd_altpe3_hip_core_u_clkmux_core_clk_cnt_reg_2_0_Q(sta_hd_altpe3_hip_core_top_hd_altpe3_hip_core_u_clkmux_core_clk_cnt_reg_2_0_Q),
		.app_inta_ack(app_inta_ack),
		.app_msi_ack(app_msi_ack),
		.avmm_readdata(avmm_readdata),
		.cfg_par_err(cfg_par_err),
		.core_clk_out(core_clk_out),
		.cseb_addr(cseb_addr),
		.cseb_addr_parity(cseb_addr_parity),
		.cseb_be(cseb_be),
		.cseb_is_shadow(cseb_is_shadow),
		.cseb_rden(cseb_rden),
		.cseb_wrdata(cseb_wrdata),
		.cseb_wrdata_parity(cseb_wrdata_parity),
		.cseb_wren(cseb_wren),
		.cseb_wrresp_req(cseb_wrresp_req),
		.csr_dout(csr_dout),
		.csr_out(csr_out),
		.csr_pipe_out(csr_pipe_out),
		.current_coeff0(current_coeff0),
		.current_coeff1(current_coeff1),
		.current_coeff2(current_coeff2),
		.current_coeff3(current_coeff3),
		.current_coeff4(current_coeff4),
		.current_coeff5(current_coeff5),
		.current_coeff6(current_coeff6),
		.current_coeff7(current_coeff7),
		.current_rxpreset0(current_rxpreset0),
		.current_rxpreset1(current_rxpreset1),
		.current_rxpreset2(current_rxpreset2),
		.current_rxpreset3(current_rxpreset3),
		.current_rxpreset4(current_rxpreset4),
		.current_rxpreset5(current_rxpreset5),
		.current_rxpreset6(current_rxpreset6),
		.current_rxpreset7(current_rxpreset7),
		.current_speed(current_speed),
		.cvp_clk(cvp_clk),
		.cvp_config(cvp_config),
		.cvp_data(cvp_data),
		.cvp_full_config(cvp_full_config),
		.cvp_start_xfer(cvp_start_xfer),
		.dl_up(dl_up),
		.dlup_exit(dlup_exit),
		.eidle_infer_sel0(eidle_infer_sel0),
		.eidle_infer_sel1(eidle_infer_sel1),
		.eidle_infer_sel2(eidle_infer_sel2),
		.eidle_infer_sel3(eidle_infer_sel3),
		.eidle_infer_sel4(eidle_infer_sel4),
		.eidle_infer_sel5(eidle_infer_sel5),
		.eidle_infer_sel6(eidle_infer_sel6),
		.eidle_infer_sel7(eidle_infer_sel7),
		.ev_128ns(ev_128ns),
		.ev_1us(ev_1us),
		.flr_sts(flr_sts),
		.g3_rx_pcs_rst_n0(g3_rx_pcs_rst_n0),
		.g3_rx_pcs_rst_n1(g3_rx_pcs_rst_n1),
		.g3_rx_pcs_rst_n2(g3_rx_pcs_rst_n2),
		.g3_rx_pcs_rst_n3(g3_rx_pcs_rst_n3),
		.g3_rx_pcs_rst_n4(g3_rx_pcs_rst_n4),
		.g3_rx_pcs_rst_n5(g3_rx_pcs_rst_n5),
		.g3_rx_pcs_rst_n6(g3_rx_pcs_rst_n6),
		.g3_rx_pcs_rst_n7(g3_rx_pcs_rst_n7),
		.g3_tx_pcs_rst_n0(g3_tx_pcs_rst_n0),
		.g3_tx_pcs_rst_n1(g3_tx_pcs_rst_n1),
		.g3_tx_pcs_rst_n2(g3_tx_pcs_rst_n2),
		.g3_tx_pcs_rst_n3(g3_tx_pcs_rst_n3),
		.g3_tx_pcs_rst_n4(g3_tx_pcs_rst_n4),
		.g3_tx_pcs_rst_n5(g3_tx_pcs_rst_n5),
		.g3_tx_pcs_rst_n6(g3_tx_pcs_rst_n6),
		.g3_tx_pcs_rst_n7(g3_tx_pcs_rst_n7),
		.hotrst_exit(hotrst_exit),
		.int_status(int_status),
		.k_hip_pcs_chnl_en(k_hip_pcs_chnl_en),
		.k_hrc_chnl_en(k_hrc_chnl_en),
		.k_hrc_chnl_txpll_master_cgb_rst_en(k_hrc_chnl_txpll_master_cgb_rst_en),
		.k_hrc_chnl_txpll_rst_en(k_hrc_chnl_txpll_rst_en),
		.l2_exit(l2_exit),
		.lane_act(lane_act),
		.lmi_ack(lmi_ack),
		.lmi_dout(lmi_dout),
		.ltssm_state(ltssm_state),
		.mem_rscout_rcv_bot(mem_rscout_rcv_bot),
		.mem_rscout_rcv_top(mem_rscout_rcv_top),
		.mem_rscout_rtry(mem_rscout_rtry),
		.pld_clk_in_use(pld_clk_in_use),
		.pld_gp_ctrl(pld_gp_ctrl),
		.pm_exit_d0_req(pm_exit_d0_req),
		.pme_to_sr(pme_to_sr),
		.powerdown0(powerdown0),
		.powerdown1(powerdown1),
		.powerdown2(powerdown2),
		.powerdown3(powerdown3),
		.powerdown4(powerdown4),
		.powerdown5(powerdown5),
		.powerdown6(powerdown6),
		.powerdown7(powerdown7),
		.r2c_unc_ecc(r2c_unc_ecc),
		.rate0(rate0),
		.rate1(rate1),
		.rate2(rate2),
		.rate3(rate3),
		.rate4(rate4),
		.rate5(rate5),
		.rate6(rate6),
		.rate7(rate7),
		.rate_ctrl(rate_ctrl),
		.reserved_clk_out(reserved_clk_out),
		.reserved_out(reserved_out),
		.reset_status(reset_status),
		.retry_corr_ecc(retry_corr_ecc),
		.retry_unc_ecc(retry_unc_ecc),
		.rx_corr_ecc(rx_corr_ecc),
		.rx_cred_status(rx_cred_status),
		.rx_par_err(rx_par_err),
		.rx_pcs_rst_n0(rx_pcs_rst_n0),
		.rx_pcs_rst_n1(rx_pcs_rst_n1),
		.rx_pcs_rst_n2(rx_pcs_rst_n2),
		.rx_pcs_rst_n3(rx_pcs_rst_n3),
		.rx_pcs_rst_n4(rx_pcs_rst_n4),
		.rx_pcs_rst_n5(rx_pcs_rst_n5),
		.rx_pcs_rst_n6(rx_pcs_rst_n6),
		.rx_pcs_rst_n7(rx_pcs_rst_n7),
		.rx_pma_rstb0(rx_pma_rstb0),
		.rx_pma_rstb1(rx_pma_rstb1),
		.rx_pma_rstb2(rx_pma_rstb2),
		.rx_pma_rstb3(rx_pma_rstb3),
		.rx_pma_rstb4(rx_pma_rstb4),
		.rx_pma_rstb5(rx_pma_rstb5),
		.rx_pma_rstb6(rx_pma_rstb6),
		.rx_pma_rstb7(rx_pma_rstb7),
		.rx_st_bardec1(rx_st_bardec1),
		.rx_st_bardec2(rx_st_bardec2),
		.rx_st_be(rx_st_be),
		.rx_st_data(rx_st_data),
		.rx_st_empty(rx_st_empty),
		.rx_st_eop(rx_st_eop),
		.rx_st_err(rx_st_err),
		.rx_st_parity(rx_st_parity),
		.rx_st_sop(rx_st_sop),
		.rx_st_valid(rx_st_valid),
		.rxfc_cplbuf_ovf(rxfc_cplbuf_ovf),
		.rxfc_cplovf_tag(rxfc_cplovf_tag),
		.rxpolarity0(rxpolarity0),
		.rxpolarity1(rxpolarity1),
		.rxpolarity2(rxpolarity2),
		.rxpolarity3(rxpolarity3),
		.rxpolarity4(rxpolarity4),
		.rxpolarity5(rxpolarity5),
		.rxpolarity6(rxpolarity6),
		.rxpolarity7(rxpolarity7),
		.serr_out(serr_out),
		.swdn_out(swdn_out),
		.swup_out(swup_out),
		.test_fref_clk(test_fref_clk),
		.test_out_1_hip(test_out_1_hip),
		.test_out_hip(test_out_hip),
		.tl_cfg_add(tl_cfg_add),
		.tl_cfg_ctl(tl_cfg_ctl),
		.tl_cfg_sts(tl_cfg_sts),
		.tl_cfg_sts_wr(tl_cfg_sts_wr),
		.tx_cred_data_fc(tx_cred_data_fc),
		.tx_cred_fc_hip_cons(tx_cred_fc_hip_cons),
		.tx_cred_fc_infinite(tx_cred_fc_infinite),
		.tx_cred_hdr_fc(tx_cred_hdr_fc),
		.tx_deemph0(tx_deemph0),
		.tx_deemph1(tx_deemph1),
		.tx_deemph2(tx_deemph2),
		.tx_deemph3(tx_deemph3),
		.tx_deemph4(tx_deemph4),
		.tx_deemph5(tx_deemph5),
		.tx_deemph6(tx_deemph6),
		.tx_deemph7(tx_deemph7),
		.tx_lcff_pll_rstb0(tx_lcff_pll_rstb0),
		.tx_lcff_pll_rstb1(tx_lcff_pll_rstb1),
		.tx_lcff_pll_rstb2(tx_lcff_pll_rstb2),
		.tx_lcff_pll_rstb3(tx_lcff_pll_rstb3),
		.tx_lcff_pll_rstb4(tx_lcff_pll_rstb4),
		.tx_lcff_pll_rstb5(tx_lcff_pll_rstb5),
		.tx_lcff_pll_rstb6(tx_lcff_pll_rstb6),
		.tx_lcff_pll_rstb7(tx_lcff_pll_rstb7),
		.tx_margin0(tx_margin0),
		.tx_margin1(tx_margin1),
		.tx_margin2(tx_margin2),
		.tx_margin3(tx_margin3),
		.tx_margin4(tx_margin4),
		.tx_margin5(tx_margin5),
		.tx_margin6(tx_margin6),
		.tx_margin7(tx_margin7),
		.tx_par_err(tx_par_err),
		.tx_pcs_rst_n0(tx_pcs_rst_n0),
		.tx_pcs_rst_n1(tx_pcs_rst_n1),
		.tx_pcs_rst_n2(tx_pcs_rst_n2),
		.tx_pcs_rst_n3(tx_pcs_rst_n3),
		.tx_pcs_rst_n4(tx_pcs_rst_n4),
		.tx_pcs_rst_n5(tx_pcs_rst_n5),
		.tx_pcs_rst_n6(tx_pcs_rst_n6),
		.tx_pcs_rst_n7(tx_pcs_rst_n7),
		.tx_pma_syncp0(tx_pma_syncp0),
		.tx_pma_syncp1(tx_pma_syncp1),
		.tx_pma_syncp2(tx_pma_syncp2),
		.tx_pma_syncp3(tx_pma_syncp3),
		.tx_pma_syncp4(tx_pma_syncp4),
		.tx_pma_syncp5(tx_pma_syncp5),
		.tx_pma_syncp6(tx_pma_syncp6),
		.tx_pma_syncp7(tx_pma_syncp7),
		.tx_st_ready(tx_st_ready),
		.txblkst0(txblkst0),
		.txblkst1(txblkst1),
		.txblkst2(txblkst2),
		.txblkst3(txblkst3),
		.txblkst4(txblkst4),
		.txblkst5(txblkst5),
		.txblkst6(txblkst6),
		.txblkst7(txblkst7),
		.txcompl0(txcompl0),
		.txcompl1(txcompl1),
		.txcompl2(txcompl2),
		.txcompl3(txcompl3),
		.txcompl4(txcompl4),
		.txcompl5(txcompl5),
		.txcompl6(txcompl6),
		.txcompl7(txcompl7),
		.txdata0(txdata0),
		.txdata1(txdata1),
		.txdata2(txdata2),
		.txdata3(txdata3),
		.txdata4(txdata4),
		.txdata5(txdata5),
		.txdata6(txdata6),
		.txdata7(txdata7),
		.txdatak0(txdatak0),
		.txdatak1(txdatak1),
		.txdatak2(txdatak2),
		.txdatak3(txdatak3),
		.txdatak4(txdatak4),
		.txdatak5(txdatak5),
		.txdatak6(txdatak6),
		.txdatak7(txdatak7),
		.txdataskip0(txdataskip0),
		.txdataskip1(txdataskip1),
		.txdataskip2(txdataskip2),
		.txdataskip3(txdataskip3),
		.txdataskip4(txdataskip4),
		.txdataskip5(txdataskip5),
		.txdataskip6(txdataskip6),
		.txdataskip7(txdataskip7),
		.txdetectrx0(txdetectrx0),
		.txdetectrx1(txdetectrx1),
		.txdetectrx2(txdetectrx2),
		.txdetectrx3(txdetectrx3),
		.txdetectrx4(txdetectrx4),
		.txdetectrx5(txdetectrx5),
		.txdetectrx6(txdetectrx6),
		.txdetectrx7(txdetectrx7),
		.txelecidle0(txelecidle0),
		.txelecidle1(txelecidle1),
		.txelecidle2(txelecidle2),
		.txelecidle3(txelecidle3),
		.txelecidle4(txelecidle4),
		.txelecidle5(txelecidle5),
		.txelecidle6(txelecidle6),
		.txelecidle7(txelecidle7),
		.txst_prot_err(txst_prot_err),
		.txswing0(txswing0),
		.txswing1(txswing1),
		.txswing2(txswing2),
		.txswing3(txswing3),
		.txswing4(txswing4),
		.txswing5(txswing5),
		.txswing6(txswing6),
		.txswing7(txswing7),
		.txsynchd0(txsynchd0),
		.txsynchd1(txsynchd1),
		.txsynchd2(txsynchd2),
		.txsynchd3(txsynchd3),
		.txsynchd4(txsynchd4),
		.txsynchd5(txsynchd5),
		.txsynchd6(txsynchd6),
		.txsynchd7(txsynchd7),
		.wake_oen(wake_oen)

	);

endmodule
