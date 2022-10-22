-- Copyright (C) 2017 Intel Corporation. All rights reserved.
-- This simulation model contains highly confidential and
-- proprietary information of Intel and is being provided
-- in accordance with and subject to the protections of the
-- applicable Intel Program License Subscription Agreement
-- which governs its use and disclosure. Your use of Intel
-- Corporation's design tools, logic functions and other
-- software and tools, and its AMPP partner logic functions,
-- and any output files any of the foregoing (including device
-- programming or simulation files), and any associated
-- documentation or information are expressly subject to the
-- terms and conditions of the Intel Program License Subscription
-- Agreement, the Intel Quartus Prime License Agreement, the Intel
-- MegaCore Function License Agreement, or other applicable 
-- license agreement, including, without limitation, that your
-- use is for the sole purpose of simulating designs for use 
-- exclusively in logic devices manufactured by Intel and sold
-- by Intel or its authorized distributors. Please refer to the
-- applicable agreement for further details. Intel products and
-- services are protected under numerous U.S. and foreign patents,
-- maskwork rights, copyrights and other intellectual property laws.
-- Intel assumes no responsibility or liability arising out of the
-- application or use of this simulation model.
-- Quartus Prime 17.0.1 Build 598 06/07/2017

LIBRARY IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.VITAL_Timing.all;
use work.twentynm_atom_pack.all;

package twentynm_components is


--
-- twentynm_ff
--

COMPONENT twentynm_ff
    generic (
             power_up : string := "low";
             x_on_violation : string := "on";
             lpm_type : string := "twentynm_ff";
             tsetup_d_clk_noedge_posedge : VitalDelayType := DefSetupHoldCnst;
             tsetup_asdata_clk_noedge_posedge : VitalDelayType := DefSetupHoldCnst;
             tsetup_sclr_clk_noedge_posedge : VitalDelayType := DefSetupHoldCnst;
             tsetup_sload_clk_noedge_posedge	: VitalDelayType := DefSetupHoldCnst;
             tsetup_ena_clk_noedge_posedge : VitalDelayType := DefSetupHoldCnst;
             thold_d_clk_noedge_posedge	: VitalDelayType := DefSetupHoldCnst;
             thold_asdata_clk_noedge_posedge : VitalDelayType := DefSetupHoldCnst;
             thold_sclr_clk_noedge_posedge : VitalDelayType := DefSetupHoldCnst;
             thold_sload_clk_noedge_posedge : VitalDelayType := DefSetupHoldCnst;
             thold_ena_clk_noedge_posedge	: VitalDelayType := DefSetupHoldCnst;
             tpd_clk_q_posedge : VitalDelayType01 := DefPropDelay01;
             tpd_clrn_q_posedge : VitalDelayType01 := DefPropDelay01;
             tpd_aload_q_posedge : VitalDelayType01 := DefPropDelay01;
             tpd_asdata_q: VitalDelayType01 := DefPropDelay01;
             tipd_clk : VitalDelayType01 := DefPropDelay01;
             tipd_d : VitalDelayType01 := DefPropDelay01;
             tipd_asdata : VitalDelayType01 := DefPropDelay01;
             tipd_sclr : VitalDelayType01 := DefPropDelay01; 
             tipd_sload : VitalDelayType01 := DefPropDelay01;
             tipd_clrn : VitalDelayType01 := DefPropDelay01; 
             tipd_aload : VitalDelayType01 := DefPropDelay01; 
             tipd_ena : VitalDelayType01 := DefPropDelay01; 
             TimingChecksOn: Boolean := True;
             MsgOn: Boolean := DefGlitchMsgOn;
             XOn: Boolean := DefGlitchXOn;
             MsgOnChecks: Boolean := DefMsgOnChecks;
             XOnChecks: Boolean := DefXOnChecks;
             InstancePath: STRING := "*"
            );
    port (
          d : in std_logic := '0';
          clk : in std_logic := '0';
          clrn : in std_logic := '1';
          aload : in std_logic := '0';
          sclr : in std_logic := '0';
          sload : in std_logic := '0';
          ena : in std_logic := '1';
          asdata : in std_logic := '0';
          devclrn : in std_logic := '1';
          devpor : in std_logic := '1';
          q : out std_logic
         );
END COMPONENT;

--
-- twentynm_lcell_comb
--

COMPONENT twentynm_lcell_comb
    generic (
             lut_mask : std_logic_vector(63 downto 0) := (OTHERS => '1');
             shared_arith : string := "off";
             extended_lut : string := "off";
             dont_touch : string := "off";
             lpm_type : string := "twentynm_lcell_comb";
             TimingChecksOn: Boolean := True;
             MsgOn: Boolean := DefGlitchMsgOn;
             XOn: Boolean := DefGlitchXOn;
             MsgOnChecks: Boolean := DefMsgOnChecks;
             XOnChecks: Boolean := DefXOnChecks;
             InstancePath: STRING := "*";
             tpd_dataa_combout : VitalDelayType01 := DefPropDelay01;
             tpd_datab_combout : VitalDelayType01 := DefPropDelay01;
             tpd_datac_combout : VitalDelayType01 := DefPropDelay01;
             tpd_datad_combout : VitalDelayType01 := DefPropDelay01;
             tpd_datae_combout : VitalDelayType01 := DefPropDelay01;
             tpd_dataf_combout : VitalDelayType01 := DefPropDelay01;
             tpd_datag_combout : VitalDelayType01 := DefPropDelay01;
             tpd_dataa_sumout : VitalDelayType01 := DefPropDelay01;
             tpd_datab_sumout : VitalDelayType01 := DefPropDelay01;
             tpd_datac_sumout : VitalDelayType01 := DefPropDelay01;
             tpd_datad_sumout : VitalDelayType01 := DefPropDelay01;
             tpd_dataf_sumout : VitalDelayType01 := DefPropDelay01;
             tpd_cin_sumout : VitalDelayType01 := DefPropDelay01;
             tpd_sharein_sumout : VitalDelayType01 := DefPropDelay01;
             tpd_dataa_cout : VitalDelayType01 := DefPropDelay01;
             tpd_datab_cout : VitalDelayType01 := DefPropDelay01;
             tpd_datac_cout : VitalDelayType01 := DefPropDelay01;
             tpd_datad_cout : VitalDelayType01 := DefPropDelay01;
             tpd_dataf_cout : VitalDelayType01 := DefPropDelay01;
             tpd_cin_cout : VitalDelayType01 := DefPropDelay01;
             tpd_sharein_cout : VitalDelayType01 := DefPropDelay01;
             tpd_dataa_shareout : VitalDelayType01 := DefPropDelay01;
             tpd_datab_shareout : VitalDelayType01 := DefPropDelay01;
             tpd_datac_shareout : VitalDelayType01 := DefPropDelay01;
             tpd_datad_shareout : VitalDelayType01 := DefPropDelay01;
             tipd_dataa : VitalDelayType01 := DefPropDelay01; 
             tipd_datab : VitalDelayType01 := DefPropDelay01; 
             tipd_datac : VitalDelayType01 := DefPropDelay01; 
             tipd_datad : VitalDelayType01 := DefPropDelay01; 
             tipd_datae : VitalDelayType01 := DefPropDelay01; 
             tipd_dataf : VitalDelayType01 := DefPropDelay01; 
             tipd_datag : VitalDelayType01 := DefPropDelay01; 
             tipd_cin : VitalDelayType01 := DefPropDelay01; 
             tipd_sharein : VitalDelayType01 := DefPropDelay01
            );
    port (
          dataa : in std_logic := '0';
          datab : in std_logic := '0';
          datac : in std_logic := '0';
          datad : in std_logic := '0';
          datae : in std_logic := '0';
          dataf : in std_logic := '0';
          datag : in std_logic := '0';
          cin : in std_logic := '0';
          sharein : in std_logic := '0';
          combout : out std_logic;
          sumout : out std_logic;
          cout : out std_logic;
          shareout : out std_logic
         );
END COMPONENT;

--
-- twentynm_routing_wire
--

COMPONENT twentynm_routing_wire
    generic (
             MsgOn : Boolean := DefGlitchMsgOn;
             XOn : Boolean := DefGlitchXOn;
             tpd_datain_dataout : VitalDelayType01 := DefPropDelay01;
             tpd_datainglitch_dataout : VitalDelayType01 := DefPropDelay01;
             tipd_datain : VitalDelayType01 := DefPropDelay01
            );
    PORT (
          datain : in std_logic;
          dataout : out std_logic
         );
END COMPONENT;

--
-- twentynm_ram_block
--

COMPONENT twentynm_ram_block
    GENERIC (
        operation_mode                 :  STRING := "single_port";    
        mixed_port_feed_through_mode   :  STRING := "dont_care";    
        ram_block_type                 :  STRING := "auto";    
        logical_ram_name               :  STRING := "ram_name";    
        init_file                      :  STRING := "init_file.hex";    
        init_file_layout               :  STRING := "none";    
        ecc_pipeline_stage_enabled     :  STRING := "false";
        enable_ecc                     :  STRING := "false";
	width_eccstatus		       :  INTEGER := 2;   
        data_interleave_width_in_bits  :  INTEGER := 1;    
        data_interleave_offset_in_bits :  INTEGER := 1;    
        port_a_logical_ram_depth       :  INTEGER := 0;    
        port_a_logical_ram_width       :  INTEGER := 0;    
        port_a_first_address           :  INTEGER := 0;    
        port_a_last_address            :  INTEGER := 0;    
        port_a_first_bit_number        :  INTEGER := 0;    
        bist_ena                       :  STRING := "false";
        port_a_address_clear           :  STRING := "none";    
        port_a_data_out_clear          :  STRING := "none";    
        port_a_data_in_clock           :  STRING := "clock0";    
        port_a_address_clock           :  STRING := "clock0";    
        port_a_write_enable_clock      :  STRING := "clock0";    
        port_a_read_enable_clock     :  STRING := "clock0";           
        port_a_byte_enable_clock       :  STRING := "clock0";    
        port_a_data_out_clock          :  STRING := "none";    
        port_a_data_width              :  INTEGER := 1;    
        port_a_address_width           :  INTEGER := 1;    
        port_a_byte_enable_mask_width  :  INTEGER := 1;    
        port_b_logical_ram_depth       :  INTEGER := 0;    
        port_b_logical_ram_width       :  INTEGER := 0;    
        port_b_first_address           :  INTEGER := 0;    
        port_b_last_address            :  INTEGER := 0;    
        port_b_first_bit_number        :  INTEGER := 0;    
        port_b_address_clear           :  STRING := "none";    
        port_b_data_out_clear          :  STRING := "none";    
        port_b_data_in_clock           :  STRING := "clock1";    
        port_b_address_clock           :  STRING := "clock1";    
        port_b_write_enable_clock: STRING := "clock1";    
        port_b_read_enable_clock: STRING := "clock1";    
        port_b_byte_enable_clock       :  STRING := "clock1";    
        port_b_data_out_clock          :  STRING := "none";    
        port_b_data_width              :  INTEGER := 1;    
        port_b_address_width           :  INTEGER := 1;    
        port_b_byte_enable_mask_width  :  INTEGER := 1;    
        port_a_read_during_write_mode  :  STRING  := "new_data_no_nbe_read";
        port_b_read_during_write_mode  :  STRING  := "new_data_no_nbe_read";    
        power_up_uninitialized         :  STRING := "false";  
        port_b_byte_size : INTEGER := 0;
        port_a_byte_size : INTEGER := 0;  
        lpm_type                  : string := "twentynm_ram_block";
        lpm_hint                  : string := "true";
        clk0_input_clock_enable  : STRING := "none"; -- ena0,ena2,none
        clk0_core_clock_enable   : STRING := "none"; -- ena0,ena2,none
        clk0_output_clock_enable : STRING := "none"; -- ena0,none
        clk1_input_clock_enable  : STRING := "none"; -- ena1,ena3,none
        clk1_core_clock_enable   : STRING := "none"; -- ena1,ena3,none
        clk1_output_clock_enable : STRING := "none"; -- ena1,none
        mem_init0 : STRING := "";
        mem_init1 : STRING := "";
        mem_init2 : STRING := "";
        mem_init3 : STRING := "";
        mem_init4 : STRING := "";
        mem_init5 : STRING := "";
        mem_init6 : STRING := "";
        mem_init7 : STRING := "";
        mem_init8 : STRING := "";
        mem_init9 : STRING := "";
        connectivity_checking     : string := "off"
        );    
    PORT (
        portadatain             : IN STD_LOGIC_VECTOR(port_a_data_width - 1 DOWNTO 0)    := (OTHERS => '0');   
        portaaddr               : IN STD_LOGIC_VECTOR(port_a_address_width - 1 DOWNTO 0) := (OTHERS => '0');   
        portawe                 : IN STD_LOGIC := '0';   
        portare                 : IN STD_LOGIC := '1';   
        portbdatain             : IN STD_LOGIC_VECTOR(port_b_data_width - 1 DOWNTO 0)    := (OTHERS => '0');   
        portbaddr               : IN STD_LOGIC_VECTOR(port_b_address_width - 1 DOWNTO 0) := (OTHERS => '0');   
        portbwe                 : IN STD_LOGIC := '0';   
        portbre                 : IN STD_LOGIC := '1';   
        clk0                    : IN STD_LOGIC := '0';   
        clk1                    : IN STD_LOGIC := '0';   
        ena0                    : IN STD_LOGIC := '1';   
        ena1                    : IN STD_LOGIC := '1';   
        ena2                    : IN STD_LOGIC := '1';   
        ena3                    : IN STD_LOGIC := '1';   
        clr0                    : IN STD_LOGIC := '0';   
        clr1                    : IN STD_LOGIC := '0';   
        nerror                  : IN STD_LOGIC := '1';   
        portabyteenamasks       : IN STD_LOGIC_VECTOR(port_a_byte_enable_mask_width - 1 DOWNTO 0) := (OTHERS => '1');   
        portbbyteenamasks       : IN STD_LOGIC_VECTOR(port_b_byte_enable_mask_width - 1 DOWNTO 0) := (OTHERS => '1');   
        devclrn                 : IN STD_LOGIC := '1';   
        devpor                  : IN STD_LOGIC := '1';   
        portaaddrstall : IN STD_LOGIC := '0';
        portbaddrstall : IN STD_LOGIC := '0';
        eccstatus : OUT STD_LOGIC_VECTOR(width_eccstatus - 1 DOWNTO 0) := (OTHERS => '0');
        dftout : OUT STD_LOGIC_VECTOR(8 DOWNTO 0) := "000000000";
        portadataout            : OUT STD_LOGIC_VECTOR(port_a_data_width - 1 DOWNTO 0);   
        portbdataout            : OUT STD_LOGIC_VECTOR(port_b_data_width - 1 DOWNTO 0)
        );
END COMPONENT;

--
-- twentynm_mlab_cell
--

COMPONENT twentynm_mlab_cell
   GENERIC (
      logical_ram_name              : STRING := "lutram";
      logical_ram_depth             : INTEGER := 0;
      logical_ram_width				: INTEGER := 0;
      first_address					: INTEGER := 0;
      last_address                  : INTEGER := 0;
      first_bit_number              : INTEGER := 0;
      init_file						: STRING := "NONE";
      data_width                    : INTEGER := 20;
      address_width                 : INTEGER := 5;
      byte_enable_mask_width        : INTEGER := 1;
      byte_size                     : INTEGER := 1;
      port_b_data_out_clock         : STRING := "none";
      port_b_data_out_clear         : STRING := "none";
      lpm_type                      : STRING := "twentynm_mlab_cell";
      lpm_hint                      : STRING := "true";
      mem_init0                     : STRING := "";
      mixed_port_feed_through_mode  : STRING := "new"
   );
   PORT (
      portadatain                   : IN STD_LOGIC_VECTOR(data_width - 1 DOWNTO 0) := (others => '0');
      portaaddr                     : IN STD_LOGIC_VECTOR(address_width - 1 DOWNTO 0) := (others => '0');
      portabyteenamasks             : IN STD_LOGIC_VECTOR(byte_enable_mask_width - 1 DOWNTO 0) := (others => '1');
      portbaddr                     : IN STD_LOGIC_VECTOR(address_width - 1 DOWNTO 0) := (others => '0');
      clk0                          : IN STD_LOGIC := '0';
      clk1                          : IN STD_LOGIC := '0';
      ena0                          : IN STD_LOGIC := '1';
      ena1                          : IN STD_LOGIC := '1';
      ena2                          : IN STD_LOGIC := '1';
      clr                          : IN STD_LOGIC := '0';
      devclrn                       : IN STD_LOGIC := '1';
      devpor                        : IN STD_LOGIC := '1';
      portbdataout                  : OUT STD_LOGIC_VECTOR(data_width - 1 DOWNTO 0)
   );
END COMPONENT;

--
-- twentynm_io_ibuf
--

COMPONENT twentynm_io_ibuf
    GENERIC (
             tipd_i                  : VitalDelayType01 := DefPropDelay01;
             tipd_ibar               : VitalDelayType01 := DefPropDelay01;
             tipd_seriesterminationcontrol    : VitalDelayArrayType01(15 DOWNTO 0) := (others => DefPropDelay01 );
             tipd_parallelterminationcontrol  : VitalDelayArrayType01(15 DOWNTO 0) := (others => DefPropDelay01 );
             tipd_dynamicterminationcontrol   : VitalDelayType01 := DefPropDelay01;  
             tpd_i_o                 : VitalDelayType01 := DefPropDelay01;
             tpd_ibar_o              : VitalDelayType01 := DefPropDelay01;
             XOn                           : Boolean := DefGlitchXOn;
             MsgOn                         : Boolean := DefGlitchMsgOn;
             differential_mode       :  string := "false";
             bus_hold                :  string := "false";
             simulate_z_as          : string    := "Z";
             lpm_type                :  string := "twentynm_io_ibuf"
            );    
    PORT (
          i                       : IN std_logic := '0';   
          ibar                    : IN std_logic := '0';   
          seriesterminationcontrol    : IN std_logic_vector(15 DOWNTO 0) := (others => '0'); 
          parallelterminationcontrol  : IN std_logic_vector(15 DOWNTO 0) := (others => '0'); 
          dynamicterminationcontrol   : IN std_logic := '0';                                 
          o                       : OUT std_logic
         );       
END COMPONENT;

--
-- twentynm_io_obuf
--

COMPONENT twentynm_io_obuf
    GENERIC (
             tipd_i                           : VitalDelayType01 := DefPropDelay01;
             tipd_oe                          : VitalDelayType01 := DefPropDelay01;
             tipd_dynamicterminationcontrol   : VitalDelayType01 := DefPropDelay01;  
             tipd_seriesterminationcontrol    : VitalDelayArrayType01(15 DOWNTO 0) := (others => DefPropDelay01 );
             tipd_parallelterminationcontrol  : VitalDelayArrayType01(15 DOWNTO 0) := (others => DefPropDelay01 );
             tpd_i_o                          : VitalDelayType01 := DefPropDelay01;
             tpd_oe_o                         : VitalDelayType01 := DefPropDelay01;
             tpd_i_obar                       : VitalDelayType01 := DefPropDelay01;
             tpd_oe_obar                      : VitalDelayType01 := DefPropDelay01;
             XOn                           : Boolean := DefGlitchXOn;
             MsgOn                         : Boolean := DefGlitchMsgOn;  
             open_drain_output                :  string := "false";              
             shift_series_termination_control :  string := "false";  
             sim_dynamic_termination_control_is_connected :  string := "false";                
             bus_hold                         :  string := "false";              
             lpm_type                         :  string := "twentynm_io_obuf"
            );               
    PORT (
           i                       : IN std_logic := '0';                                                 
           oe                      : IN std_logic := '1';                                                 
           dynamicterminationcontrol   : IN std_logic := '0'; 
           seriesterminationcontrol    : IN std_logic_vector(15 DOWNTO 0) := (others => '0'); 
           parallelterminationcontrol  : IN std_logic_vector(15 DOWNTO 0) := (others => '0'); 
           devoe                       : IN std_logic := '1';
           o                       : OUT std_logic;                                                       
           obar                    : OUT std_logic
         );                                                      
END COMPONENT;

--
-- twentynm_pseudo_diff_out
--

COMPONENT twentynm_pseudo_diff_out
 GENERIC (
             tipd_i                           : VitalDelayType01 := DefPropDelay01;
             tipd_ibar                        : VitalDelayType01 := DefPropDelay01;
             tpd_i_o                          : VitalDelayType01 := DefPropDelay01;
             tpd_i_obar                       : VitalDelayType01 := DefPropDelay01;
             tpd_ibar_obar                    : VitalDelayType01 := DefPropDelay01;
             tipd_oein                        : VitalDelayType01 := DefPropDelay01;
             tipd_oebin                       : VitalDelayType01 := DefPropDelay01;
             tpd_oein_oeout                   : VitalDelayType01 := DefPropDelay01;
             tpd_oein_oebout                  : VitalDelayType01 := DefPropDelay01;
             tpd_oebin_oebout                 : VitalDelayType01 := DefPropDelay01;
             tipd_dtcin                       : VitalDelayType01 := DefPropDelay01;
             tipd_dtcbarin                    : VitalDelayType01 := DefPropDelay01;
             tpd_dtcin_dtc                    : VitalDelayType01 := DefPropDelay01;
             tpd_dtcin_dtcbar                 : VitalDelayType01 := DefPropDelay01;
             tpd_dtcbarin_dtcbar              : VitalDelayType01 := DefPropDelay01;
             XOn                              : Boolean := DefGlitchXOn;
             MsgOn                            : Boolean := DefGlitchMsgOn;
             lpm_type                         : string := "twentynm_pseudo_diff_out";
             feedthrough                      : string := "false"
            );
 PORT (
           i                       : IN std_logic := '0';
           ibar                    : IN std_logic := '0';
           oein                    : in std_logic := '0';
           oebin                   : in std_logic := '0';
           dtcin                   : in std_logic := '0';
           dtcbarin                : in std_logic := '0';
           o                       : OUT std_logic;
           obar                    : OUT std_logic;
           oeout                   : OUT std_logic;
           oebout                  : OUT std_logic;
           dtc                     : OUT std_logic;
           dtcbar                  : OUT std_logic
           );
END COMPONENT;

--
-- twentynm_io_pad
--

COMPONENT twentynm_io_pad
    GENERIC (
        lpm_type                       :  string := "twentynm_io_pad");    
    PORT (
        padin                   : IN std_logic := '0';   -- Input Pad
        padout                  : OUT std_logic);   -- Output Pad
END COMPONENT;

--
-- twentynm_bias_block
--

COMPONENT twentynm_bias_block
    GENERIC (
        lpm_type : string := "twentynm_bias_block";
        tipd_clk : VitalDelayType01 := DefPropDelay01;
        tipd_shiftnld : VitalDelayType01 := DefPropDelay01;
        tipd_captnupdt : VitalDelayType01 := DefPropDelay01;
        tipd_din : VitalDelayType01 := DefPropDelay01;
        tsetup_din_clk_noedge_posedge : VitalDelayType := DefSetupHoldCnst;
        tsetup_shiftnld_clk_noedge_posedge : VitalDelayType := DefSetupHoldCnst;
        tsetup_captnupdt_clk_noedge_posedge : VitalDelayType := DefSetupHoldCnst;
        thold_din_clk_noedge_posedge : VitalDelayType := DefSetupHoldCnst;
        thold_shiftnld_clk_noedge_posedge : VitalDelayType := DefSetupHoldCnst;
        thold_captnupdt_clk_noedge_posedge : VitalDelayType := DefSetupHoldCnst;
        tpd_clk_dout_posedge : VitalDelayType01 := DefPropDelay01;
        MsgOn: Boolean := DefGlitchMsgOn;
        XOn: Boolean := DefGlitchXOn;
        MsgOnChecks: Boolean := DefMsgOnChecks;
        XOnChecks: Boolean := DefXOnChecks
        );
    PORT (
        clk : in std_logic := '0';
        shiftnld : in std_logic := '0';
        captnupdt : in std_logic := '0';
        din : in std_logic := '0';
        dout : out std_logic := '0'
        );
END COMPONENT;

--
-- twentynm_clkena
--

COMPONENT twentynm_clkena
    generic    (
        clock_type    :    string    :=    "auto";
        ena_register_mode    :    string    :=    "always enabled";
        lpm_type    :    string    :=    "twentynm_clkena";
        ena_register_power_up    :    string    :=    "high";
        disable_mode    :    string    :=    "low";
        test_syn    :    string    :=    "high"
    );
    port    (
        inclk    :    in    std_logic    :=    '1';
        ena    :    in    std_logic    :=    '1';
        enaout    :    out    std_logic;
        outclk    :    out    std_logic
    );
END COMPONENT;

--
-- twentynm_clkselect
--

COMPONENT twentynm_clkselect
    generic    (
        lpm_type    :    string    :=    "twentynm_clkselect";
        test_cff    :    string    :=    "low"
    );
    port    (
        inclk    :    in    std_logic_vector(3 downto 0)    :=    "0000";
        clkselect    :    in    std_logic_vector(1 downto 0)    :=    "00";
        outclk    :    out    std_logic
    );
END COMPONENT;

--
-- twentynm_delay_chain
--

COMPONENT twentynm_delay_chain
    generic (
        lpm_type : string := "twentynm_delay_chain";
        sim_intrinsic_falling_delay : integer := 50;
        sim_intrinsic_rising_delay : integer := 50;
        sim_falling_delay_increment : integer := 25;
        sim_rising_delay_increment : integer := 25
    );
    port (
        datain : in std_logic := '0';
        dataout : out std_logic;
        delayctrlin : in std_logic_vector(4 downto 0) := (OTHERS => '0')
    );
END COMPONENT;

--
-- twentynm_termination_logic
--

COMPONENT twentynm_termination_logic
    generic (
        lpm_type : string := "twentynm_termination_logic";
        a_iob_oct_block : string := "A_IOB_OCT_BLOCK_NONE";
        a_iob_oct_serdata : string := "A_IOB_OCT_SER_DATA_CA"
   );
    port (
    	s2pload : in std_logic := '0';
    	serdata : in std_logic := '0';
	scan_in : in std_logic := '0';
	scan_shift_n : in std_logic := '0';
	scan_out : out std_logic;  
	seriesterminationcontrol : out std_logic_vector(15 downto 0);
	parallelterminationcontrol : out std_logic_vector(15 downto 0)
    );
END COMPONENT;

--
-- twentynm_termination
--

COMPONENT twentynm_termination
    generic (
        lpm_type : string := "twentynm_termination";
    	a_oct_cal_mode : string := "A_OCT_CAL_MODE_SINGLE";
    	a_oct_user_oct : string := "a_oct_user_oct_off";
    	a_oct_rsmultp1 : string := "A_OCT_RSMULTP1_1";
    	a_oct_rsmultp2 : string := "A_OCT_RSMULTP2_1";
    	a_oct_rsmultn1 : string := "A_OCT_RSMULTN1_1";
    	a_oct_rsmultn2 : string := "A_OCT_RSMULTN2_1";
    	a_oct_rsadjust1 : string := "A_OCT_RSADJUST1_NONE";
    	a_oct_rsadjust2 : string := "A_OCT_RSADJUST2_NONE";
    	a_oct_rtmult1 : string := "A_OCT_RTMULT1_1";
    	a_oct_rtmult2 : string := "A_OCT_RTMULT2_1";
    	a_oct_rtadjust1 : string := "A_OCT_RTADJUST1_NONE";
    	a_oct_rtadjust2 : string := "A_OCT_RTADJUST2_NONE"
    );
    port (
    	rzqin : in std_logic := '0';
    	enserusr : in std_logic := '0';
    	nclrusr : in std_logic := '0';
    	clkenusr : in std_logic := '0';
    	clkusr : in std_logic := '0';
	ser_data_dq_to_core : out std_logic;
	ser_data_ca_to_core : out std_logic;
	ser_data_dq_from_core : in std_logic := '0';
	ser_data_ca_from_core : in std_logic := '0';
    	serdataout : out std_logic
   );
END COMPONENT;

--
-- twentynm_asmiblock
--

COMPONENT twentynm_asmiblock
    generic    (
        lpm_type    :    string :=  "twentynm_asmiblock";
		enable_sim  :	 string	:=  "false"
    );
    port    (
        dclk    	:    in    std_logic;
        sce    		:    in    std_logic_vector(2 downto 0);
        oe    		:    in    std_logic;
        data0out    :    in    std_logic;
        data1out    :    in    std_logic;
        data2out    :    in    std_logic;
        data3out    :    in    std_logic;
        data0oe    	:    in    std_logic;
        data1oe    	:    in    std_logic;
        data2oe    	:    in    std_logic;
        data3oe    	:    in    std_logic;
        data0in    	:    out   std_logic;
        data1in    	:    out   std_logic;
        data2in    	:    out   std_logic;
        data3in    	:    out   std_logic;
		spidclk		:    out   std_logic;
		spidataout	:    out   std_logic_vector(3 downto 0);
		spisce 		:    out   std_logic_vector(2 downto 0);
		spidatain	:    in    std_logic_vector(3 downto 0)
    );
END COMPONENT;

--
-- twentynm_crcblock
--

COMPONENT twentynm_crcblock
    generic    (
		crc_enable					:    string		:=    "false";
        oscillator_divider			:    integer    :=    256;
		error_delay    				:    integer    :=    0;
		disable_col_bits_updated	:    string		:=    "false";
		crc_deld_disable			:    string		:=    "false";
		col_chk_bit_update_retry    :    integer    :=    0;
		edcrc_start_frame    		:    integer    :=    0;
		edcrc_stop_frame    		:    integer    :=    0;
		n_edcrc_colums    			:    integer    :=    0;
        lpm_type    :    string    :=    "twentynm_crcblock"
    );
    port    (
        clk    			:    in    std_logic;
        shiftnld    	:    in    std_logic;
        crcerror    	:    out    std_logic;
        regout    		:    out    std_logic;
		endofedfullchip	:    out    std_logic
    );
END COMPONENT;

--
-- twentynm_opregblock
--

COMPONENT twentynm_opregblock
    generic    (
        lpm_type    :   string  :=  "twentynm_opregblock"
    );
    port    (
        clk         :    in     std_logic;
        shiftnld    :    in     std_logic;
        regout      :    out    std_logic
    );
END COMPONENT;

--
-- twentynm_jtag
--

COMPONENT twentynm_jtag
    generic    (
        lpm_type    :    string    :=    "twentynm_jtag"
    );
    port    (
        tms    			: in    std_logic := '0';
        tck    			: in    std_logic := '0';
        tdi    			: in    std_logic := '0';
        ntrst    		: in    std_logic := '0';
        tdoutap    		: in    std_logic := '0';
        tdouser    		: in    std_logic := '0';
        tmscore 		: in 	std_logic:= '0';
        tckcore 		: in 	std_logic:= '0';
        tdicore 		: in 	std_logic:= '0';
        ntrstcore 		: in 	std_logic:= '0';
        tmscorehps 		: in 	std_logic:= '0';
        tckcorehps 		: in 	std_logic:= '0';
        tdicorehps 		: in 	std_logic:= '0';
        ntrstcorehps	: in 	std_logic:= '0';
        tdocorefrwl 	: in 	std_logic:= '0';
        corectl 		: in 	std_logic:= '0';
        ntdopinena 		: in 	std_logic:= '0';
        tdo    			: out	std_logic;
        tmsutap    		: out   std_logic;
        tckutap    		: out   std_logic;
        tdiutap    		: out   std_logic;
        shiftuser   	: out   std_logic;  
        ntrstutap 		: out 	std_logic;
        tmsuhps 		: out 	std_logic;
        tckuhps 		: out 	std_logic;
        tdiuhps 		: out 	std_logic;
        ntrstuhps 		: out 	std_logic;
        tmscoreout 		: out 	std_logic;
        tckcoreout 		: out 	std_logic;
        tdocorehps 		: out 	std_logic;
        ntrstcoreout 	: out 	std_logic;
        tdocore 		: out 	std_logic;
        clkdruser  		: out   std_logic;
        updateuser  	: out   std_logic;
        runidleuser 	: out   std_logic;
        usr1user    	: out   std_logic
    );
END COMPONENT;

--
-- twentynm_jtagblock
--

COMPONENT twentynm_jtagblock
    generic    (
        lpm_type    :    string    :=    "twentynm_jtagblock"
    );
    port    (
        tmscore 		: in 	std_logic:= '0';
        tckcore 		: in 	std_logic:= '0';
        tdicore 		: in 	std_logic:= '0';
        ntrstcore 		: in 	std_logic:= '0';
        tmscorehps 		: in 	std_logic:= '0';
        tckcorehps 		: in 	std_logic:= '0';
        tdicorehps 		: in 	std_logic:= '0';
        ntrstcorehps	: in 	std_logic:= '0';
        corectl 		: in 	std_logic:= '0';
        tdocorehps 		: out 	std_logic;
        tdocore 		: out 	std_logic
    );
END COMPONENT;

--
-- twentynm_rublock
--

COMPONENT twentynm_rublock
    generic    (
        sim_init_watchdog_value    		:    integer	:= 0;
        sim_init_status    				:    integer	:= 0;
        sim_init_config_is_application	:    string		:= "false";
        sim_init_watchdog_enabled  		:    string		:= "false";
        lpm_type    					:    string		:= "twentynm_rublock"
    );
    port    (
        clk    		:    in    std_logic:= '0';
        ctl    		:    in    std_logic_vector(1 downto 0):= (OTHERS => '0');
        regin    	:    in    std_logic:= '0';
        rsttimer    :    in    std_logic:= '0';
        rconfig    	:    in    std_logic:= '0';
        regout    	:    out    std_logic
    );
END COMPONENT;

--
-- twentynm_tsdblock
--

COMPONENT twentynm_tsdblock
    generic    (
        lpm_type    :    string    :=    "twentynm_tsdblock"
    );
    port    (
        corectl	:    in    std_logic:= '0';
        reset	  :    in    std_logic:= '0';
        scanen	:    in    std_logic:= '0';
        scanin	:    in    std_logic:= '0';
        tempout	:    out   std_logic_vector(9 downto 0);
        eoc		:    out   std_logic
    );
END COMPONENT;

--
-- twentynm_vsblock
--

COMPONENT twentynm_vsblock
    generic    (
        lpm_type    :    string    :=    "twentynm_vsblock"
    );
    port    (
        clk  	 	:    in    	std_logic:= '0';
        reset    	:    in    	std_logic:= '0';
        corectl  	:    in    	std_logic:= '0';
        coreconfig  :    in    	std_logic:= '0';
        confin	  	:    in    	std_logic:= '0';
        chsel  		:    in    	std_logic_vector(3 downto 0):= (OTHERS => '0');
        dataout  	:    out   	std_logic_vector(11 downto 0);
        eoc		 	:    out   	std_logic;
		eos		 	:    out   	std_logic;
		muxsel  	:    out	std_logic_vector(3 downto 0)
    );
END COMPONENT;

--
-- twentynm_fp_mac
--

COMPONENT twentynm_fp_mac
	generic	(
	operation_mode	:	string	:=	"SP_MULT_ADD";
	use_chainin	:	string	:=	"false";
	adder_subtract	:	string	:=	"false";
	ax_clock	:	string	:=	"none";
        ay_clock	:	string	:=	"none";
        az_clock	:	string	:=	"none";
	output_clock	:	string	:=	"none";
	accumulate_clock	:	string	:=	"none";
	accum_pipeline_clock	:	string	:=	"none";
	accum_adder_clock	:	string	:=	"none";
	ax_chainin_pl_clock	:	string	:=	"none";
	mult_pipeline_clock	:	string	:=	"none";
	adder_input_clock	:	string	:=	"none";
	lpm_type	:	string	:=	"twentynm_fp_mac"
    );
    port (
    	ax	:	in std_logic_vector(31 downto 0)	:= (others => '0');
        ay	:	in std_logic_vector(31 downto 0)	:= (others => '0');
	az	:	in std_logic_vector(31 downto 0)	:= (others => '0');
	chainin	:	in std_logic_vector(31 downto 0)	:= (others => '0');
	chainin_overflow	:	in std_logic	:= '0';
	chainin_underflow	:	in std_logic	:= '0';
	chainin_inexact	:	in std_logic	:= '0';
	chainin_invalid	:	in std_logic	:= '0';
	accumulate	:	in std_logic	:= '0';
	clk	:	in std_logic_vector(2 downto 0)	:= (others => '0');
	ena	:	in std_logic_vector(2 downto 0)	:= (others => '1');
        aclr	:	in std_logic_vector(1 downto 0)	:= (others => '0');
	resulta	:	out std_logic_vector(31 downto 0);
	overflow	:	out std_logic;
	underflow	:	out std_logic;
	inexact	:	out std_logic;
	invalid	:	out std_logic;
	chainout	:	out std_logic_vector(31 downto 0);
	chainout_overflow	:	out std_logic;
	chainout_underflow	:	out std_logic;
	chainout_inexact	:	out std_logic;
	chainout_invalid	:	out std_logic;
	dftout	:	out std_logic
    );
END COMPONENT;

--
-- twentynm_mac
--

COMPONENT twentynm_mac
	generic	(
        ax_width	:				integer    :=    16;
        ay_scan_in_width	:    	integer    :=    16;
        az_width    :    			integer    :=    1;
        bx_width    :    			integer    :=    16;
        by_width    :    			integer    :=    16;
        bz_width    :    			integer    :=    1;
        scan_out_width    :    		integer    :=    1;
        result_a_width    :    		integer    :=    33;
        result_b_width    :   		integer    :=    1;
        operation_mode    :    		string    :=    "m18x18_sumof2";
        mode_sub_location    :    	integer    :=    0;
        operand_source_max    :   	string    :=    "input";
        operand_source_may    :    	string    :=    "input";
        operand_source_mbx    :    	string    :=    "input";
        operand_source_mby    :   	string    :=    "input";
        preadder_subtract_a    :    string    :=    "false";
        preadder_subtract_b    :    string    :=    "false";
        signed_max    :    			string    :=    "false";
        signed_may    :    			string    :=    "false";
        signed_mbx    :    			string    :=    "false";
        signed_mby    :    			string    :=    "false";
        ay_use_scan_in    :    		string    :=    "false";
        by_use_scan_in    :    		string    :=    "false";
        delay_scan_out_ay    :    	string    :=    "false";
        delay_scan_out_by    :    	string    :=    "false";
        use_chainadder    :    		string    :=    "false";
        enable_double_accum    :    string    :=    "false";
        load_const_value    :    	integer    :=    0;
        coef_a_0    :    integer    :=    0;
        coef_a_1    :    integer    :=    0;
        coef_a_2    :    integer    :=    0;
        coef_a_3    :    integer    :=    0;
        coef_a_4    :    integer    :=    0;
        coef_a_5    :    integer    :=    0;
        coef_a_6    :    integer    :=    0;
        coef_a_7    :    integer    :=    0;
        coef_b_0    :    integer    :=    0;
        coef_b_1    :    integer    :=    0;
        coef_b_2    :    integer    :=    0;
        coef_b_3    :    integer    :=    0;
        coef_b_4    :    integer    :=    0;
        coef_b_5    :    integer    :=    0;
        coef_b_6    :    integer    :=    0;
        coef_b_7    :    integer    :=    0;
        ax_clock    :    			string    :=    "none";
        ay_scan_in_clock    :    	string    :=    "none";
        az_clock    :    			string    :=    "none";
        bx_clock    :    			string    :=    "none";
        by_clock    :    			string    :=    "none";
        bz_clock    :    			string    :=    "none";
        coef_sel_a_clock    :    	string    :=    "none";
        coef_sel_b_clock    :    	string    :=    "none";
        sub_clock    :    			string    :=    "none";
	sub_pipeline_clock    :    		string    :=    "none";
        negate_clock    :    		string    :=    "none";
	negate_pipeline_clock    :	string    :=    "none";
        accumulate_clock    :    	string    :=    "none";
	accum_pipeline_clock    :    	string    :=    "none";
        load_const_clock    :    	string    :=    "none";
	load_const_pipeline_clock    :  string    :=    "none";
        output_clock    :    		string    :=    "none";
	input_pipeline_clock	:	string    :=    "none";
	lpm_type	:	string	:=	"twentynm_fp_mac"
    );
    port    (
        sub    :    in    		std_logic := '0';
        negate    :    in    	std_logic := '0';
        accumulate    :    in   std_logic := '0';
        loadconst    :    in    std_logic := '0';
        ax    :    in    		std_logic_vector(ax_width-1 downto 0) := (others => '0');
        ay    :    in    		std_logic_vector(ay_scan_in_width-1 downto 0) := (others => '0');
        scanin    :    in    	std_logic_vector(ay_scan_in_width-1 downto 0) := (others => '0');
        az    :    in    		std_logic_vector(az_width-1 downto 0) := (others => '0');
        bx    :    in    		std_logic_vector(bx_width-1 downto 0) := (others => '0');
        by    :    in    		std_logic_vector(by_width-1 downto 0) := (others => '0');
        bz    :    in    		std_logic_vector(bz_width-1 downto 0) := (others => '0');
        coefsela    :    in    	std_logic_vector(2 downto 0) := (others => '0');
        coefselb    :    in    	std_logic_vector(2 downto 0) := (others => '0');
        chainin    :    in    	std_logic_vector(63 downto 0) := (others => '0');
        clk    :    in    		std_logic_vector(2 downto 0) := (others => '0');
        aclr    :    in    		std_logic_vector(1 downto 0) := (others => '0');
        ena    :    in    		std_logic_vector(2 downto 0) := (others => '1');
        dftout    :    out    	std_logic;
        resulta    :    out    	std_logic_vector(result_a_width-1 downto 0);
        resultb    :    out    	std_logic_vector(result_b_width-1 downto 0);
        scanout    :    out    	std_logic_vector(scan_out_width-1 downto 0);
        chainout    :    out    std_logic_vector(63 downto 0)
    );
END COMPONENT;

--
-- twentynm_lvds_clock_tree
--

COMPONENT twentynm_lvds_clock_tree
    generic    (
        clock_export_compatible    :    string    :=    "true");
    port    (
        lvdsfclk_in         :    in     std_logic := '0';
        loaden_in           :    in     std_logic := '0';
        lvdsfclk_out        :    out    std_logic;
        loaden_out          :    out    std_logic;
        lvdsfclk_top_out    :    out    std_logic;
        loaden_top_out      :    out    std_logic;
        lvdsfclk_bot_out    :    out    std_logic;
        loaden_bot_out      :    out    std_logic
    );
END COMPONENT;

--
-- twentynm_oscillator
--

COMPONENT twentynm_oscillator
    generic    (
        lpm_type    :    string    :=    "twentynm_oscillator");
    port    (
        oscena    :    in	std_logic;
        clkout    :    out	std_logic;
        clkout1   :    out	std_logic
    );
END COMPONENT;

--
-- twentynm_iopll
--

COMPONENT twentynm_iopll
    generic    (
		reference_clock_frequency : string := "";
		vco_frequency : string := "";
		output_clock_frequency_0 : string := "";
		output_clock_frequency_1 : string := "";
		output_clock_frequency_2 : string := "";
		output_clock_frequency_3 : string := "";
		output_clock_frequency_4 : string := "";
		output_clock_frequency_5 : string := "";
		output_clock_frequency_6 : string := "";
		output_clock_frequency_7 : string := "";
		output_clock_frequency_8 : string := "";
        duty_cycle_0 : integer := 0;
        duty_cycle_1 : integer := 0;
        duty_cycle_2 : integer := 0;
        duty_cycle_3 : integer := 0;
        duty_cycle_4 : integer := 0;
        duty_cycle_5 : integer := 0;
        duty_cycle_6 : integer := 0;
        duty_cycle_7 : integer := 0;
        duty_cycle_8 : integer := 0;
		phase_shift_0 : string := "0 ps";
		phase_shift_1 : string := "0 ps";
		phase_shift_2 : string := "0 ps";
		phase_shift_3 : string := "0 ps";
		phase_shift_4 : string := "0 ps";
		phase_shift_5 : string := "0 ps";
		phase_shift_6 : string := "0 ps";
		phase_shift_7 : string := "0 ps";
		phase_shift_8 : string := "0 ps";
		compensation_mode : string := "normal";
		bw_sel : string := "auto";
		silicon_rev : string := "reve";
		speed_grade : string := "2";
		use_default_base_address : string := "true";
		user_base_address : integer := 0;
		is_cascaded_pll : string := "false";
		pll_atb : string := "atb_selectdisable";
		pll_auto_clk_sw_en : string := "false";
		pll_bwctrl : string := "pll_bw_res_setting4";
		pll_c0_extclk_dllout_en : string := "false";
		pll_c0_out_en : string := "false";
		pll_c1_extclk_dllout_en : string := "false";
		pll_c1_out_en : string := "false";
		pll_c2_extclk_dllout_en : string := "false";
		pll_c2_out_en : string := "false";
		pll_c3_extclk_dllout_en : string := "false";
		pll_c3_out_en : string := "false";
		pll_c4_out_en : string := "false";
		pll_c5_out_en : string := "false";
		pll_c6_out_en : string := "false";
		pll_c7_out_en : string := "false";
		pll_c8_out_en : string := "false";
		pll_c_counter_0_bypass_en : string :=  "false";
		pll_c_counter_0_coarse_dly : string :=  "0 ps";
		pll_c_counter_0_even_duty_en : string :=  "false";
		pll_c_counter_0_fine_dly : string :=  "0 ps";
		pll_c_counter_0_high : integer :=  256;
		pll_c_counter_0_in_src : string :=  "c_m_cnt_in_src_test_clk";
		pll_c_counter_0_low : integer :=  256;
		pll_c_counter_0_ph_mux_prst : integer :=  0;
		pll_c_counter_0_prst : integer :=  1;
		pll_c_counter_1_bypass_en : string :=  "false";
		pll_c_counter_1_coarse_dly : string :=  "0 ps";
		pll_c_counter_1_even_duty_en : string :=  "false";
		pll_c_counter_1_fine_dly : string :=  "0 ps";
		pll_c_counter_1_high : integer :=  256;
		pll_c_counter_1_in_src : string :=  "c_m_cnt_in_src_test_clk";
		pll_c_counter_1_low : integer :=  256;
		pll_c_counter_1_ph_mux_prst : integer :=  0;
		pll_c_counter_1_prst : integer :=  1;
		pll_c_counter_2_bypass_en : string :=  "false";
		pll_c_counter_2_coarse_dly : string :=  "0 ps";
		pll_c_counter_2_even_duty_en : string :=  "false";
		pll_c_counter_2_fine_dly : string :=  "0 ps";
		pll_c_counter_2_high : integer :=  256;
		pll_c_counter_2_in_src : string :=  "c_m_cnt_in_src_test_clk";
		pll_c_counter_2_low : integer :=  256;
		pll_c_counter_2_ph_mux_prst : integer :=  0;
		pll_c_counter_2_prst : integer :=  1;
		pll_c_counter_3_bypass_en : string :=  "false";
		pll_c_counter_3_coarse_dly : string :=  "0 ps";
		pll_c_counter_3_even_duty_en : string :=  "false";
		pll_c_counter_3_fine_dly : string :=  "0 ps";
		pll_c_counter_3_high : integer :=  256;
		pll_c_counter_3_in_src : string :=  "c_m_cnt_in_src_test_clk";
		pll_c_counter_3_low : integer :=  256;
		pll_c_counter_3_ph_mux_prst : integer :=  0;
		pll_c_counter_3_prst : integer :=  1;
		pll_c_counter_4_bypass_en : string :=  "false";
		pll_c_counter_4_coarse_dly : string :=  "0 ps";
		pll_c_counter_4_even_duty_en : string :=  "false";
		pll_c_counter_4_fine_dly : string :=  "0 ps";
		pll_c_counter_4_high : integer :=  256;
		pll_c_counter_4_in_src : string :=  "c_m_cnt_in_src_test_clk";
		pll_c_counter_4_low : integer :=  256;
		pll_c_counter_4_ph_mux_prst : integer :=  0;
		pll_c_counter_4_prst : integer :=  1;
		pll_c_counter_5_bypass_en : string :=  "false";
		pll_c_counter_5_coarse_dly : string :=  "0 ps";
		pll_c_counter_5_even_duty_en : string :=  "false";
		pll_c_counter_5_fine_dly : string :=  "0 ps";
		pll_c_counter_5_high : integer :=  256;
		pll_c_counter_5_in_src : string :=  "c_m_cnt_in_src_test_clk";
		pll_c_counter_5_low : integer :=  256;
		pll_c_counter_5_ph_mux_prst : integer :=  0;
		pll_c_counter_5_prst : integer :=  1;
		pll_c_counter_6_bypass_en : string :=  "false";
		pll_c_counter_6_coarse_dly : string :=  "0 ps";
		pll_c_counter_6_even_duty_en : string :=  "false";
		pll_c_counter_6_fine_dly : string :=  "0 ps";
		pll_c_counter_6_high : integer :=  256;
		pll_c_counter_6_in_src : string :=  "c_m_cnt_in_src_test_clk";
		pll_c_counter_6_low : integer :=  256;
		pll_c_counter_6_ph_mux_prst : integer :=  0;
		pll_c_counter_6_prst : integer :=  1;
		pll_c_counter_7_bypass_en : string :=  "false";
		pll_c_counter_7_coarse_dly : string :=  "0 ps";
		pll_c_counter_7_even_duty_en : string :=  "false";
		pll_c_counter_7_fine_dly : string :=  "0 ps";
		pll_c_counter_7_high : integer :=  256;
		pll_c_counter_7_in_src : string :=  "c_m_cnt_in_src_test_clk";
		pll_c_counter_7_low : integer :=  256;
		pll_c_counter_7_ph_mux_prst : integer :=  0;
		pll_c_counter_7_prst : integer :=  1;
		pll_c_counter_8_bypass_en : string :=  "false";
		pll_c_counter_8_coarse_dly : string :=  "0 ps";
		pll_c_counter_8_even_duty_en : string :=  "false";
		pll_c_counter_8_fine_dly : string :=  "0 ps";
		pll_c_counter_8_high : integer := 256;
		pll_c_counter_8_in_src : string :=  "c_m_cnt_in_src_test_clk";
		pll_c_counter_8_low : integer :=  256;
		pll_c_counter_8_ph_mux_prst : integer :=  0;
		pll_c_counter_8_prst : integer :=  1;
		pll_clk_loss_edge : string :=  "pll_clk_loss_both_edges";
		pll_clk_loss_sw_en : string :=  "false";
		pll_clk_sw_dly : integer :=  0;
		pll_clkin_0_src : string :=  "pll_clkin_0_src_refclkin";
		pll_clkin_1_src : string :=  "pll_clkin_1_src_refclkin";
		pll_cmp_buf_dly : string :=  "0 ps";
		pll_coarse_dly_0 : string :=  "0 ps";
		pll_coarse_dly_1 : string :=  "0 ps";
		pll_coarse_dly_2 : string :=  "0 ps";
		pll_coarse_dly_3 : string :=  "0 ps";
		pll_cp_compensation : string :=  "true";
		pll_cp_current_setting : string :=  "pll_cp_setting0";
		pll_ctrl_override_setting : string :=  "false";
		pll_dft_plniotri_override : string :=  "false";
		pll_dft_ppmclk : string :=  "c_cnt_out";
		pll_dll_src : string :=  "pll_dll_src_vss";
		pll_dly_0_enable : string :=  "false";
		pll_dly_1_enable : string :=  "false";
		pll_dly_2_enable : string :=  "false";
		pll_dly_3_enable : string :=  "false";
		pll_enable : string :=  "false";
		pll_extclk_0_cnt_src : string :=  "pll_extclk_cnt_src_vss";
		pll_extclk_0_enable : string :=  "false";
		pll_extclk_0_invert : string :=  "false";
		pll_extclk_1_cnt_src : string :=  "pll_extclk_cnt_src_vss";
		pll_extclk_1_enable : string :=  "false";
		pll_extclk_1_invert : string :=  "false";
		pll_fbclk_mux_1 : string :=  "pll_fbclk_mux_1_glb";
		pll_fbclk_mux_2 : string :=  "pll_fbclk_mux_2_fb_1";
		pll_fine_dly_0 : string :=  "0 ps";
		pll_fine_dly_1 : string :=  "0 ps";
		pll_fine_dly_2 : string :=  "0 ps";
		pll_fine_dly_3 : string :=  "0 ps";
		pll_lock_fltr_cfg : integer :=  25;
		pll_lock_fltr_test : string :=  "pll_lock_fltr_nrm";
		pll_m_counter_bypass_en : string :=  "true";
		pll_m_counter_coarse_dly : string :=  "0 ps";
		pll_m_counter_even_duty_en : string :=  "false";
		pll_m_counter_fine_dly : string :=  "0 ps";
		pll_m_counter_high : integer :=  256;
		pll_m_counter_in_src : string :=  "c_m_cnt_in_src_test_clk";
		pll_m_counter_low : integer :=  256;
		pll_m_counter_ph_mux_prst : integer :=  0;
		pll_m_counter_prst : integer :=  1;
		pll_manu_clk_sw_en : string :=  "false";
		pll_n_counter_bypass_en : string :=  "true";
		pll_n_counter_coarse_dly : string :=  "0 ps";
		pll_n_counter_fine_dly : string :=  "0 ps";
		pll_n_counter_high : integer :=  256;
		pll_n_counter_low : integer :=  256;
		pll_n_counter_odd_div_duty_en : string :=  "false";
		pll_nreset_invert : string :=  "false";
		pll_phyfb_mux : string :=  "m_cnt_phmux_out";
		pll_powerdown_mode : string :=  "true";
		pll_ref_buf_dly : string :=  "0 ps";
		pll_ripplecap_ctrl : string :=  "pll_ripplecap_setting0";
		pll_self_reset : string :=  "false";
		pll_sw_refclk_src : string :=  "pll_sw_refclk_src_clk_0";
		pll_tclk_mux_en : string :=  "false";
		pll_tclk_sel : string :=  "pll_tclk_m_src";
		pll_test_enable : string :=  "false";
		pll_testdn_enable : string :=  "false";
		pll_testup_enable : string :=  "false";
		pll_unlock_fltr_cfg : integer :=  2;
		pll_dft_vco_ph0_en : string :=  "false";
		pll_dft_vco_ph1_en : string :=  "false";
		pll_dft_vco_ph2_en : string :=  "false";
		pll_dft_vco_ph3_en : string :=  "false";
		pll_dft_vco_ph4_en : string :=  "false";
		pll_dft_vco_ph5_en : string :=  "false";
		pll_dft_vco_ph6_en : string :=  "false";
		pll_dft_vco_ph7_en : string :=  "false";
		pll_vccr_pd_en : string :=  "false";
		pll_vco_ph0_en : string :=  "false";
		pll_vco_ph1_en : string :=  "false";
		pll_vco_ph2_en : string :=  "false";
		pll_vco_ph3_en : string :=  "false";
		pll_vco_ph4_en : string :=  "false";
		pll_vco_ph5_en : string :=  "false";
		pll_vco_ph6_en : string :=  "false";
		pll_vco_ph7_en : string :=  "false";
        pll_dprio_base_addr : integer := 0;
		pll_dprio_broadcast_en : string := "true";
		pll_dprio_cvp_inter_sel : string := "true";
		pll_dprio_force_inter_sel : string := "true";
		pll_dprio_power_iso_en : string := "true";
        pll_vreg_0p9v1_vreg_cal_en : string := "false";
		pll_vreg_0p9v0_vreg_cal_en : string := "false";
		pll_vreg_0p9v1_vccdreg_cal : string := "vccdreg_nominal";
		pll_vreg_0p9v0_vccdreg_cal : string := "vccdreg_nominal";
		clock_name_0 : string := "";
		clock_name_1 : string := "";
		clock_name_2 : string := "";
		clock_name_3 : string := "";
		clock_name_4 : string := "";
		clock_name_5 : string := "";
		clock_name_6 : string := "";
		clock_name_7 : string := "";
		clock_name_8 : string := "";
		clock_name_global_0 : string := "false";
		clock_name_global_1 : string := "false";
		clock_name_global_2 : string := "false";
		clock_name_global_3 : string := "false";
		clock_name_global_4 : string := "false";
		clock_name_global_5 : string := "false";
		clock_name_global_6 : string := "false";
		clock_name_global_7 : string := "false";
		clock_name_global_8 : string := "false"
	);
    port    (
		clken : in std_logic_vector(1 downto 0) := (OTHERS => '0');
		cnt_sel : in std_logic_vector(3 downto 0) := (OTHERS => '0');
		core_refclk : in std_logic := '0';
		csr_clk : in std_logic := '1';
		csr_en : in std_logic := '1';
		csr_in : in std_logic := '1';
		dprio_address : in std_logic_vector(8 downto 0) := (OTHERS => '0');
		dprio_clk : in std_logic := '0';
		dprio_rst_n : in std_logic := '1';
		dps_rst_n : in std_logic := '1';
		extswitch : in std_logic := '0';
		fbclk_in : in std_logic := '0';
		fblvds_in : in std_logic := '0';
		mdio_dis : in std_logic := '0';
		num_phase_shifts : in std_logic_vector(2 downto 0) := (OTHERS => '0');
		pfden : in std_logic := '0';
		phase_en : in std_logic := '0';
		pipeline_global_en_n : in std_logic := '0';
		pll_cascade_in : in std_logic := '0';
		pma_csr_test_dis : in std_logic := '0';
		read : in std_logic := '0';
		refclk : in std_logic_vector(3 downto 0) := (OTHERS => '0');
		rst_n : in std_logic := '0';
		scan_mode_n : in std_logic := '1';
		scan_shift_n : in std_logic := '1';
		up_dn : in std_logic := '0';
		user_mode : in std_logic := '0';
		write : in std_logic := '0';
		writedata : in std_logic_vector(7 downto 0) := (OTHERS => '0');
		zdb_in : in std_logic := '0';
		block_select : out std_logic;
		clk0_bad : out std_logic;
		clk1_bad : out std_logic;
		clksel : out std_logic;
		csr_out : out std_logic;
		dll_output : out std_logic;
		extclk_dft : out std_logic_vector(1 downto 0);
		extclk_output : out std_logic_vector(1 downto 0);
		fbclk_out : out std_logic;
		fblvds_out : out std_logic;
		lf_reset : out std_logic;
		loaden : out std_logic_vector(1 downto 0);
		lock : out std_logic;
		lvds_clk : out std_logic_vector(1 downto 0);
		outclk : out std_logic_vector(8 downto 0);
		phase_done : out std_logic;
		pll_pd : out std_logic;
		pll_cascade_out : out std_logic;
		readdata : out std_logic_vector(7 downto 0);
		vcop_en : out std_logic;
		vcoph : out std_logic_vector(7 downto 0)
    );
END COMPONENT;

--
-- twentynm_ddio_out
--

COMPONENT twentynm_ddio_out
    generic (
        power_up : string := "low";
        async_mode : string := "none";
        sync_mode : string := "none";
        half_rate_mode : string := "false"
    );
    port (
    areset : in std_logic := '0';
    sreset : in std_logic := '0';
    ena : in std_logic := '1';
    clk : in std_logic := '0';
    clkhi : in std_logic := '0';
    clklo : in std_logic := '0';
    muxsel : in std_logic := '0';
    datainlo : in std_logic := '0';
    datainhi : in std_logic := '0';
    dataout : out std_logic;
    dfflo : in std_logic := '0';
    dffhi : in std_logic := '0';
    devpor : in std_logic := '0';
    hrbypass : in std_logic := '0';
    devclrn : in std_logic := '0'
    );
END COMPONENT;

--
-- twentynm_ddio_in
--

COMPONENT twentynm_ddio_in
    generic (
        power_up : string := "low";
        async_mode : string := "none";
        sync_mode : string := "none";
        use_clkn : string := "false"
    );
    port (
    areset : in std_logic := '0';
    sreset : in std_logic := '0';
    ena : in std_logic := '1';
    clk : in std_logic := '0';
    regoutlo : out std_logic;
    regouthi : out std_logic;
    datain : in std_logic := '0';
    dfflo : in std_logic := '0';
    devpor : in std_logic := '0';
    clkn : in std_logic := '0';
    devclrn : in std_logic := '0'
    );
END COMPONENT;

--
-- twentynm_io_serdes_dpa
--

COMPONENT twentynm_io_serdes_dpa
    generic (
        loopback_mode : integer := 0;
        align_to_rising_edge_only : string := "false";
        reset_fifo_at_first_lock : string := "false";
        mode : string := "off_mode";
		silicon_rev : string := "20nm5es";
        is_negative_ppm_drift : string := "false";
        data_width : integer := 10;
        use_falling_clock_edge : string := "false";
        bypass_serializer : string := "false";
        enable_clock_pin_mode : string := "false";
        bitslip_rollover : integer := 10;
        lose_lock_on_one_change : string := "false";
        is_tx_outclock : string := "false";
        vco_div_exponent : integer := 0;
        vco_frequency : integer := 0;
        net_ppm_variation : integer := 0
    );
    port (
        loopbackin : in std_logic := '0';
        pclk : out std_logic;
        loadencorein : in std_logic := '0';
        rxdata : out std_logic_vector(9 downto 0);
        dpareset : in std_logic := '0';
        bitslipmax : out std_logic;
        lvdsin : in std_logic := '0';
        bitslipcntl : in std_logic := '0';
        loopbackout : out std_logic;
        lvdsout : out std_logic;
        fclkcorein : in std_logic := '0';
        dpafiforeset : in std_logic := '0';
        loaden : in std_logic := '0';
        pclkcorein : in std_logic := '0';
        fclk : in std_logic := '0';
        dpaswitch : in std_logic := '0';
        pclkioin : in std_logic := '0';
        dpahold : in std_logic := '0';
        txdata : in std_logic_vector(9 downto 0) := (OTHERS => '0');
        dpalock : out std_logic;
        dpaclk : in std_logic_vector(7 downto 0) := (OTHERS => '0');
        mdio_dis : in std_logic := '0';
        dprio_clk : in std_logic := '0';
        dprio_rst_n : in std_logic := '0';
        dprio_block_select : out std_logic;
        dprio_writedata : in std_logic_vector(7 downto 0) := (OTHERS => '0');
        dprio_read : in std_logic := '0';
        dprio_readdata : out std_logic_vector(7 downto 0);
        dprio_reg_addr : in std_logic_vector(8 downto 0) := (OTHERS => '0');
        dprio_write : in std_logic := '0';
        bitslipreset : in std_logic := '0'
    );
END COMPONENT;

--
-- twentynm_io_12_lane
--

COMPONENT twentynm_io_12_lane
    generic (
	pin_0_gpio_or_ddr : string := "ddr";		
	pin_1_gpio_or_ddr : string := "ddr";		
	pin_2_gpio_or_ddr : string := "ddr";		
	pin_3_gpio_or_ddr : string := "ddr";		
	pin_4_gpio_or_ddr : string := "ddr";		
	pin_5_gpio_or_ddr : string := "ddr";		
	pin_6_gpio_or_ddr : string := "ddr";		
	pin_7_gpio_or_ddr : string := "ddr";		
	pin_8_gpio_or_ddr : string := "ddr";		
	pin_9_gpio_or_ddr : string := "ddr";		
	pin_10_gpio_or_ddr : string := "ddr";		
	pin_11_gpio_or_ddr : string := "ddr";		
	pin_0_dqs_x4_mode : string := "dqs_x4_not_used";
	pin_1_dqs_x4_mode : string := "dqs_x4_not_used";
	pin_2_dqs_x4_mode : string := "dqs_x4_not_used";
	pin_3_dqs_x4_mode : string := "dqs_x4_not_used";
	pin_4_dqs_x4_mode : string := "dqs_x4_not_used";
	pin_5_dqs_x4_mode : string := "dqs_x4_not_used";
	pin_6_dqs_x4_mode : string := "dqs_x4_not_used";
	pin_7_dqs_x4_mode : string := "dqs_x4_not_used";
	pin_8_dqs_x4_mode : string := "dqs_x4_not_used";
	pin_9_dqs_x4_mode : string := "dqs_x4_not_used";
	pin_10_dqs_x4_mode : string := "dqs_x4_not_used";
	pin_11_dqs_x4_mode : string := "dqs_x4_not_used";
	pingpong_primary : string := "false";	    
	pingpong_secondary : string := "false";	    
    	silicon_rev : string := "20nm5es";
    	fast_interpolator_sim : integer := 0;
        db_pin_8_out_bypass : string := "true";
        pin_0_output_phase : bit_vector(13-1 downto 0) := "0000000000000";
        db_crc_dq3 : integer := 0;
        pin_4_initial_out : string := "initial_out_z";
        pin_6_output_phase : bit_vector(13-1 downto 0) := "0000000000000";
        db_pin_6_oe_bypass : string := "true";
        db_pin_10_in_bypass : string := "true";
        db_pin_4_wr_invert : string := "false";
        mode_rate_out : string := "out_rate_full";
        db_afi_rlat_vlu : bit_vector(6-1 downto 0) := "000000";
        phy_clk_sel : integer := 0;
        pin_10_initial_out : string := "initial_out_z";
        db_ptr_pipeline_depth : integer := 0;
        pin_1_oct_mode : string := "static_off";
        dqs_lgc_ddr4_search : string := "ddr3_search";
        db_pin_7_oe_bypass : string := "true";
        pin_9_output_phase : bit_vector(13-1 downto 0) := "0000000000000";
        db_pin_9_in_bypass : string := "true";
        pin_10_oct_mode : string := "static_off";
        pin_0_mode_ddr : string := "mode_ddr";
        db_pin_7_wr_invert : string := "false";
        pin_2_oct_mode : string := "static_off";
        pin_3_oct_mode : string := "static_off";
        db_pin_11_mode : string := "dq_mode";
        db_pin_4_in_bypass : string := "true";
        pin_11_oct_mode : string := "static_off";
        dll_ctl_static : bit_vector(10-1 downto 0) := "0000000000";
        db_hmc_or_core : string := "core";
        db_pin_3_oe_bypass : string := "true";
        db_pin_2_wr_invert : string := "false";
        dqs_enable_delay : bit_vector(6-1 downto 0) := "000000";
        pin_5_data_in_mode : string := "disabled";
        db_pin_1_mode : string := "dq_mode";
        pin_10_mode_ddr : string := "mode_ddr";
        pin_5_output_phase : bit_vector(13-1 downto 0) := "0000000000000";
        pin_3_mode_ddr : string := "mode_ddr";
        pin_11_data_in_mode : string := "disabled";
        pin_2_data_in_mode : string := "disabled";
        dqs_lgc_phase_shift_a : bit_vector(13-1 downto 0) := "0000000000000";
        db_crc_dq0 : integer := 0;
        avl_base_addr : bit_vector(9-1 downto 0) := "000000000";
        db_crc_dq1 : integer := 0;
        pin_1_data_in_mode : string := "disabled";
        db_pin_7_out_bypass : string := "true";
        dll_en : string := "dll_dis";
        pin_4_oct_mode : string := "static_off";
        db_rwlat_mode : string := "csr_vlu";
        db_pin_10_oe_bypass : string := "true";
        db_pin_2_mode : string := "dq_mode";
        db_pin_1_oe_invert : string := "false";
        db_seq_rd_en_full_pipeline : integer := 0;
	dbc_wb_reserved_entry : bit_vector(7-1 downto 0) := "0000000";
        db_pin_1_wr_invert : string := "false";
        pin_11_output_phase : bit_vector(13-1 downto 0) := "0000000000000";
        db_pin_5_oe_bypass : string := "true";
        pin_7_output_phase : bit_vector(13-1 downto 0) := "0000000000000";
        dqs_lgc_pvt_input_delay_a : bit_vector(10-1 downto 0) := "0000000000";
        pin_6_data_in_mode : string := "disabled";
        db_pin_9_out_bypass : string := "true";
        pin_8_oct_mode : string := "static_off";
        db_pin_5_out_bypass : string := "true";
        db_crc_x4_or_x8_or_x9 : string := "x8_mode";
        pin_7_data_in_mode : string := "disabled";
        db_pin_11_in_bypass : string := "true";
        db_pin_11_wr_invert : string := "false";
        db_crc_dq5 : integer := 0;
        db_pin_8_mode : string := "dq_mode";
        db_pin_6_in_bypass : string := "true";
        pin_7_oct_mode : string := "static_off";
        db_crc_dq7 : integer := 0;
        dll_ctlsel : string := "ctl_dynamic";
        pin_7_initial_out : string := "initial_out_z";
        avl_ena : string := "false";
        dqs_lgc_pvt_input_delay_b : bit_vector(10-1 downto 0) := "0000000000";
        db_pin_10_ac_hmc_data_override_ena : string := "false";
        db_pin_0_out_bypass : string := "true";
        pin_10_data_in_mode : string := "disabled";
        pin_8_data_in_mode : string := "disabled";
        db_pin_6_oe_invert : string := "false";
        pin_5_initial_out : string := "initial_out_z";
        pin_2_initial_out : string := "initial_out_z";
        db_pin_2_in_bypass : string := "true";
        db_pin_4_oe_bypass : string := "true";
        pipe_latency : bit_vector(8-1 downto 0) := "00000000";
        pin_9_mode_ddr : string := "mode_ddr";
        pin_3_output_phase : bit_vector(13-1 downto 0) := "0000000000000";
        db_pin_4_oe_invert : string := "false";
        mode_rate_in : string := "in_rate_1_4";
        db_pin_2_ac_hmc_data_override_ena : string := "false";
        pin_4_output_phase : bit_vector(13-1 downto 0) := "0000000000000";
        db_pin_10_wr_invert : string := "false";
        dll_rst_en : string := "dll_rst_dis";
        pin_0_initial_out : string := "initial_out_z";
        db_pin_11_oe_bypass : string := "true";
        pin_4_mode_ddr : string := "mode_ddr";
        db_pin_2_out_bypass : string := "true";
        db_pin_10_out_bypass : string := "true";
        db_pin_7_oe_invert : string := "false";
        db_pin_3_out_bypass : string := "true";
        db_crc_dq8 : integer := 0;
        db_pin_0_oe_bypass : string := "true";
        db_pin_5_oe_invert : string := "false";
        db_crc_dq2 : integer := 0;
        db_pin_1_out_bypass : string := "true";
        db_preamble_mode : string := "preamble_one_cycle";
        db_pin_2_oe_bypass : string := "true";
        db_pin_1_in_bypass : string := "true";
        hps_ctrl_en : string := "false";
        db_crc_en : string := "crc_disable";
        db_data_alignment_mode : string := "align_disable";
        db_pin_3_in_bypass : string := "true";
        dqs_lgc_enable_toggler : string := "preamble_track_dqs_enable";
        db_pin_9_wr_invert : string := "false";
        pin_11_initial_out : string := "initial_out_z";
        dqs_lgc_dqs_b_interp_en : string := "false";
        db_pin_1_oe_bypass : string := "true";
        db_pin_9_oe_bypass : string := "true";
        db_pin_9_mode : string := "dq_mode";
        dqs_lgc_dqs_b_en : string := "false";
        dqs_lgc_pack_mode : string := "packed";
        db_pin_7_ac_hmc_data_override_ena : string := "false";
        pin_1_initial_out : string := "initial_out_z";
        db_crc_dq6 : integer := 0;
        db_core_or_hmc2db_registered : string := "false";
        db_pin_0_wr_invert : string := "false";
        db_pin_8_wr_invert : string := "false";
        db_reset_auto_release : string := "auto_release";
        db_pin_3_wr_invert : string := "false";
        dqs_lgc_phase_shift_b : bit_vector(13-1 downto 0) := "0000000000000";
        db_pin_6_mode : string := "dq_mode";
        db_pin_5_in_bypass : string := "true";
        pin_7_mode_ddr : string := "mode_ddr";
        db_pin_11_oe_invert : string := "false";
        db_pin_10_oe_invert : string := "false";
        db_afi_wlat_vlu : bit_vector(6-1 downto 0) := "000000";
        db_dbi_sel : integer := 0;
        pin_4_data_in_mode : string := "disabled";
        db_db2core_registered : string := "false";
        db_pin_4_ac_hmc_data_override_ena : string := "false";
        pin_0_oct_mode : string := "static_off";
        db_crc_dq4 : integer := 0;
        pin_10_output_phase : bit_vector(13-1 downto 0) := "0000000000000";
        db_pin_6_wr_invert : string := "false";
        pin_2_mode_ddr : string := "mode_ddr";
        db_pin_0_mode : string := "dq_mode";
        pin_6_oct_mode : string := "static_off";
        db_pin_3_ac_hmc_data_override_ena : string := "false";
        pin_5_mode_ddr : string := "mode_ddr";
        db_pin_4_out_bypass : string := "true";
        db_pin_0_in_bypass : string := "true";
        pin_9_data_in_mode : string := "disabled";
        dqs_lgc_broadcast_enable : string := "disable_broadcast";
        dqs_lgc_pst_en_shrink : string := "shrink_1_0";
        pin_3_initial_out : string := "initial_out_z";
        db_pin_8_ac_hmc_data_override_ena : string := "false";
        pin_2_output_phase : bit_vector(13-1 downto 0) := "0000000000000";
        db_pin_0_oe_invert : string := "false";
        db_pin_2_oe_invert : string := "false";
        db_pin_7_mode : string := "dq_mode";
        dqs_lgc_burst_length : string := "burst_length_2";
        dqs_lgc_count_threshold : bit_vector(7-1 downto 0) := "0000000";
        db_pin_9_oe_invert : string := "false";
        rd_valid_delay : bit_vector(7-1 downto 0) := "0000000";
        db_dbi_wr_en : string := "false";
        pin_11_mode_ddr : string := "mode_ddr";
        db_pin_9_ac_hmc_data_override_ena : string := "false";
        dqs_lgc_pst_preamble_mode : string := "ddr3_preamble";
        db_pin_5_wr_invert : string := "false";
        pin_8_output_phase : bit_vector(13-1 downto 0) := "0000000000000";
        pin_8_initial_out : string := "initial_out_z";
        dll_core_updnen : string := "core_updn_dis";
        pin_6_mode_ddr : string := "mode_ddr";
        pin_9_oct_mode : string := "static_off";
        db_dbi_rd_en : string := "false";
        db_pin_1_ac_hmc_data_override_ena : string := "false";
        db_pin_7_in_bypass : string := "true";
        pin_3_data_in_mode : string := "disabled";
        db_pin_5_ac_hmc_data_override_ena : string := "false";
        dbc_core_clk_sel : integer := 0;
        pin_1_mode_ddr : string := "mode_ddr";
        dqs_lgc_swap_dqs_a_b : string := "false";
        db_pin_6_out_bypass : string := "true";
        db_pin_3_oe_invert : string := "false";
        db_pin_4_mode : string := "dq_mode";
        pin_0_data_in_mode : string := "disabled";
        db_pin_0_ac_hmc_data_override_ena : string := "false";
        db_pin_6_ac_hmc_data_override_ena : string := "false";
        db_pin_5_mode : string := "dq_mode";
        pin_5_oct_mode : string := "static_off";
        db_pin_3_mode : string := "dq_mode";
        db_pin_10_mode : string := "dq_mode";
        pin_1_output_phase : bit_vector(13-1 downto 0) := "0000000000000";
        db_pin_11_ac_hmc_data_override_ena : string := "false";
        db_pin_8_oe_invert : string := "false";
        phy_clk_phs_freq : integer := 1000;
        dqs_lgc_dqs_a_interp_en : string := "false";
        db_pin_11_out_bypass : string := "true";
        db_pin_8_in_bypass : string := "true";
        pin_6_initial_out : string := "initial_out_z";
        db_pin_8_oe_bypass : string := "true";
        pin_9_initial_out : string := "initial_out_z";
        oct_size : integer := 1;
        pin_8_mode_ddr : string := "mode_ddr"
    );
    port (
        dbc2ctl : out std_logic_vector(22 downto 0);
        sync_clk_bot_out : out std_logic;
        data_in : in std_logic_vector(11 downto 0) := (OTHERS => '0');
        rdata_en_full_core : in std_logic_vector(3 downto 0) := (OTHERS => '0');
        cal_avl_readdata_in : in std_logic_vector(31 downto 0) := (OTHERS => '0');
        ac_hmc : in std_logic_vector(95 downto 0) := (OTHERS => '0');
        cal_avl_readdata_out : out std_logic_vector(31 downto 0);
        pll_locked : in std_logic := '0';
        broadcast_out_bot : out std_logic;
        broadcast_in_bot : in std_logic := '0';
        reset_n : in std_logic := '0';
        broadcast_in_top : in std_logic := '0';
        data_oe : out std_logic_vector(11 downto 0);
        core2dbc_rd_data_rdy : in std_logic := '0';
        dbc2core_rd_data_vld0 : out std_logic;
        phy_clk : in std_logic_vector(1 downto 0) := (OTHERS => '0');
        data_from_core : in std_logic_vector(95 downto 0) := (OTHERS => '0');
        sync_data_bot_in : in std_logic := '0';
        sync_data_top_out : out std_logic;
        core2dbc_wr_data_vld0 : in std_logic := '0';
        ctl2dbc0 : in std_logic_vector(50 downto 0) := (OTHERS => '0');
        dft_phy_clk : out std_logic_vector(1 downto 0);
        dqs_in : in std_logic_vector(1 downto 0) := (OTHERS => '0');
        cal_avl_in : in std_logic_vector(54 downto 0) := (OTHERS => '0');
        cfg_dbc : in std_logic_vector(16 downto 0) := (OTHERS => '0');
        core2dbc_wr_data_vld1 : in std_logic := '0';
        dll_ref_clk : in std_logic := '0';
        dbc2core_wr_data_rdy : out std_logic;
        sync_data_top_in : in std_logic := '0';
        mrnk_write_core : in std_logic_vector(15 downto 0) := (OTHERS => '0');
        afi_rlat_core : out std_logic_vector(5 downto 0);
        cal_avl_out : out std_logic_vector(54 downto 0);
        core_dll : in std_logic_vector(2 downto 0) := (OTHERS => '0');
        afi_wlat_core : out std_logic_vector(5 downto 0);
        broadcast_out_top : out std_logic;
        rdata_valid_core : out std_logic_vector(3 downto 0);
        core2dbc_wr_ecc_info : in std_logic_vector(12 downto 0) := (OTHERS => '0');
        sync_clk_top_in : in std_logic := '0';
        sync_clk_top_out : out std_logic;
        sync_data_bot_out : out std_logic;
        dbc2core_rd_data_vld1 : out std_logic;
        data_out : out std_logic_vector(11 downto 0);
        mrnk_read_core : in std_logic_vector(15 downto 0) := (OTHERS => '0');
        data_to_core : out std_logic_vector(95 downto 0);
        dll_core : out std_logic_vector(12 downto 0);
        phy_clk_phs : in std_logic_vector(7 downto 0) := (OTHERS => '0');
        sync_clk_bot_in : in std_logic := '0';
        oe_from_core : in std_logic_vector(47 downto 0) := (OTHERS => '0');
        dbc2core_wb_pointer : out std_logic_vector(11 downto 0);
        oct_enable : out std_logic_vector(11 downto 0);
        dbc2core_rd_type : out std_logic;
        ioereg_locked : out std_logic_vector(5 downto 0);
        ctl2dbc1 : in std_logic_vector(50 downto 0) := (OTHERS => '0');
		test_clk : in std_logic := '0';
		dft_prbs_ena_n : in std_logic := '0';
		dft_prbs_done : out std_logic;
		dft_prbs_pass : out std_logic
    );
END COMPONENT;

--
-- twentynm_tile_ctrl
--

COMPONENT twentynm_tile_ctrl
    generic (
    	silicon_rev : string := "20nm5es";
        hmc_arf_period : bit_vector(12 downto 0) := "0000000000000";
        hmc_wr_to_pch : bit_vector(5 downto 0) := "000000";
        hmc_zqcl_to_valid : bit_vector(8 downto 0) := "000000000";
        hmc_cfg_bist_cmd1_l : bit_vector(31 downto 0) := "00000000000000000000000000000000";
        pa_feedback_divider_p0 : string := "div_by_1_p0";
        hmc_wb_reserved_entry : bit_vector(6 downto 0) := "0000000";
        hmc_cfg_3ds_en : string := "disable";
        hmc_ctrl_slot_rotate_en : bit_vector(1 downto 0) := "00";
        hmc_cfg_mmr_driver_sel : string := "core_m";
        hmc_dbc3_cmd_rate : string := "half_rate_dbc3";
        physeq_rwlat_mode : string := "csr_vlu";
        pa_mantissa_1 : bit_vector(4 downto 0) := "00000";
        hmc_period_dqstrk_ctrl_en : string := "disable";
        hmc_dbc2_pipe_lat : bit_vector(2 downto 0) := "000";
        hmc_16_act_to_act : bit_vector(7 downto 0) := "00000000";
        hmc_tcl : bit_vector(6 downto 0) := "0000000";
        hmc_dbc0_burst_length : string := "bl_8_dbc0";
        hmc_rld3_refresh_seq1 : bit_vector(15 downto 0) := "0000000000000000";
        hmc_ctrl_burst_length : string := "bl_8_ctrl";
        hmc_pdn_to_valid : bit_vector(5 downto 0) := "000000";
        hmc_mps_to_valid : bit_vector(9 downto 0) := "0000000000";
        hmc_mrs_to_valid : bit_vector(3 downto 0) := "0000";
        hmc_period_dqstrk_interval : bit_vector(15 downto 0) := "0000000000000000";
        hmc_dbc2_enable_ecc : string := "disable";
        hmc_mem_if_coladdr_width : string := "col_width_12";
        hmc_dbc1_reorder_rdata : string := "disable";
        hmc_act_to_rdwr : bit_vector(5 downto 0) := "000000";
        physeq_bc_id_ena : string := "bc_disable";
        hmc_starve_limit : bit_vector(5 downto 0) := "000000";
        hmc_cfg_bist_cmd0_u : bit_vector(31 downto 0) := "00000000000000000000000000000000";
        hmc_wr_to_wr_diff_bg : bit_vector(5 downto 0) := "000000";
        hmc_rd_to_wr_diff_bg : bit_vector(5 downto 0) := "000000";
        hmc_cfg_cmd_driver_sel : string := "core_c";
        physeq_reset_auto_release : string := "auto";
        hmc_pdn_period : bit_vector(15 downto 0) := "0000000000000000";
        hmc_srf_to_valid : bit_vector(9 downto 0) := "0000000000";
        pa_feedback_mux_sel_1 : string := "fb0_p_clk_1";
        hmc_dbc3_rc_en : string := "disable";
        hmc_ctrl_enable_ecc : string := "disable";
        hmc_dbc1_rc_en : string := "disable";
        hmc_reorder_read : string := "disable";
        hmc_ctrl_mem_type : string := "ddr3";
        hmc_ctrl_dualport_en : string := "disable";
        hmc_dbc2ctrl_sel : string := "dbc0_to_local";
        physeq_afi_wlat_vlu : bit_vector(5 downto 0) := "000000";
        hmc_dbc3_reorder_rdata : string := "disable";
        hmc_ctrl_enable_dm : string := "enable";
        hmc_dbc1_burst_length : string := "bl_8_dbc1";
        hmc_sb_ddr4_mr4 : bit_vector(19 downto 0) := "00000000000000000000";
        hmc_mmr_cmd_to_valid : bit_vector(7 downto 0) := "00000000";
        hmc_rd_to_pch : bit_vector(5 downto 0) := "000000";
        hmc_dbc2_in_protocol : string := "ast_dbc2";
        hmc_sb_ddr4_mr3 : bit_vector(19 downto 0) := "00000000000000000000";
        hmc_srf_entry_exit_block : string := "presrfenter";
        hmc_dbc0_in_protocol : string := "ast_dbc0";
        hmc_wr_to_wr_diff_chip : bit_vector(5 downto 0) := "000000";
        hmc_ddr4_mps_addr_mirror : bit := '0';
        hmc_arf_to_valid : bit_vector(7 downto 0) := "00000000";
        hmc_ck_inv : string := "disable";
        pa_filter_code : integer := 1600;
        hmc_dbc0_pipe_lat : bit_vector(2 downto 0) := "000";
        hmc_wr_to_rd_diff_chip : bit_vector(5 downto 0) := "000000";
        hmc_dbc2_burst_length : string := "bl_8_dbc2";
        hmc_rd_ap_to_valid : bit_vector(5 downto 0) := "000000";
        hmc_wr_to_rd : bit_vector(5 downto 0) := "000000";
        hmc_local_if_cs_width : string := "cs_width_2";
        hmc_mem_clk_disable_entry_cycles : bit_vector(5 downto 0) := "000000";
        hmc_sb_ddr4_mr5 : bit_vector(15 downto 0) := "0000000000000000";
        physeq_hmc_or_core : string := "core";
        hmc_dbc1_ctrl_sel : string := "upper_mux_dbc1";
        hmc_wr_ap_to_valid : bit_vector(5 downto 0) := "000000";
        hmc_rd_to_rd : bit_vector(5 downto 0) := "000000";
        hmc_ctrl2dbc_switch0 : string := "local_tile_dbc0";
        hmc_dbc2_dualport_en : string := "disable";
        hmc_dbc2_slot_rotate_en : bit_vector(1 downto 0) := "00";
        hmc_cfg_bist_cmd0_l : bit_vector(31 downto 0) := "00000000000000000000000000000000";
        hmc_srf_to_zq_cal : bit_vector(9 downto 0) := "0000000000";
        hmc_rld3_multibank_mode : string := "singlebank";
        pa_sync_latency : bit_vector(3 downto 0) := "0000";
        hmc_ctrl_in_protocol : string := "ast_in";
        hmc_wr_odt_on : bit_vector(5 downto 0) := "000000";
        hmc_user_rfsh_en : string := "disable";
        hmc_rfsh_warn_threshold : bit_vector(6 downto 0) := "0000000";
        hmc_dbc3_slot_offset : bit_vector(1 downto 0) := "00";
        pa_track_speed : bit_vector(4 downto 0) := "00000";
        hmc_dbc1_slot_rotate_en : bit_vector(1 downto 0) := "00";
        hmc_dbc1_enable_dm : string := "enable";
        pa_freq_track_speed : bit_vector(3 downto 0) := "0000";
        hmc_dbc3_slot_rotate_en : bit_vector(1 downto 0) := "00";
        hmc_mps_dqstrk_disable : string := "disable";
        hmc_dbc3_in_protocol : string := "ast_dbc3";
        hmc_rld3_refresh_seq2 : bit_vector(15 downto 0) := "0000000000000000";
        pa_feedback_divider_c0 : string := "div_by_1_c0";
        hmc_dbc1_in_protocol : string := "ast_dbc1";
        hmc_geardn_en : string := "disable";
        hmc_dqstrk_to_valid_last : bit_vector(7 downto 0) := "00000000";
        hmc_wr_odt_period : bit_vector(5 downto 0) := "000000";
        hmc_short_dqstrk_ctrl_en : string := "disable";
        hmc_dbc1_cmd_rate : string := "half_rate_dbc1";
        hmc_act_to_act_diff_bank : bit_vector(5 downto 0) := "000000";
        physeq_avl_ena : string := "avl_disable";
        hmc_mpr_to_valid : bit_vector(4 downto 0) := "00000";
        pa_exponent_1 : bit_vector(2 downto 0) := "000";
        physeq_trk_mgr_read_monitor_ena : string := "disable";
        hmc_rd_to_rd_diff_chip : bit_vector(5 downto 0) := "000000";
        physeq_seq_feature : bit_vector(20 downto 0) := "000000000000000000000";
        hmc_cfg_pinpong_mode : string := "pingpong_off";
        mode : string := "tile_ddr";
        hmc_ctrl_rc_en : string := "disable";
        hmc_rld3_multibank_ref_delay : bit_vector(2 downto 0) := "000";
        pa_feedback_divider_p1 : string := "div_by_1_p1";
        hmc_enable_dqs_tracking : string := "enable";
        hmc_addr_order : string := "chip_bank_row_col";
        hmc_act_to_act : bit_vector(5 downto 0) := "000000";
        pa_phase_offset_1 : bit_vector(11 downto 0) := "000000000000";
        hmc_cs_chip : bit_vector(15 downto 0) := "0000000000000000";
        pa_mantissa_0 : bit_vector(4 downto 0) := "00000";
        hmc_open_page_en : string := "disable";
        hmc_act_to_act_diff_bg : bit_vector(5 downto 0) := "000000";
        hmc_ctrl_dimm_type : string := "component";
        hmc_dbc3_output_regd : string := "disable";
        hmc_mem_if_bgaddr_width : string := "bg_width_0";
        hmc_dbc0_output_regd : string := "disable";
        hmc_ctrl_cmd_rate : string := "half_rate";
        hps_ctrl_en : string := "false";
        hmc_4_act_to_act : bit_vector(7 downto 0) := "00000000";
        hmc_ctrl_slot_offset : bit_vector(1 downto 0) := "00";
        hmc_wr_to_wr : bit_vector(5 downto 0) := "000000";
        hmc_cfg_dbg_ctrl : bit_vector(31 downto 0) := "00000000000000000000000000000000";
        hmc_cfg_dbg_mode : string := "function";
        hmc_dbc3_enable_ecc : string := "disable";
        hmc_dbc2_cmd_rate : string := "half_rate_dbc2";
        hmc_dbc0_dualport_en : string := "disable";
        hmc_mps_zqcal_disable : string := "disable";
        hmc_rld3_refresh_seq0 : bit_vector(15 downto 0) := "0000000000000000";
        hmc_cfg_bist_cmd1_u : bit_vector(31 downto 0) := "00000000000000000000000000000000";
        hmc_dbc0_ctrl_sel : string := "upper_mux_dbc0";
        hmc_write_odt_chip : bit_vector(15 downto 0) := "0000000000000000";
        hmc_dbc0_enable_ecc : string := "disable";
        hmc_mem_if_bankaddr_width : string := "bank_width_3";
        hmc_arbiter_type : string := "twot";
        hmc_dbc3_pipe_lat : bit_vector(2 downto 0) := "000";
        hmc_zqcs_to_valid : bit_vector(6 downto 0) := "0000000";
        hmc_srf_autoexit_en : string := "disable";
        physeq_afi_rlat_vlu : bit_vector(5 downto 0) := "000000";
        hmc_dbc1_enable_ecc : string := "disable";
        hmc_dbc3_ctrl_sel : string := "upper_mux_dbc3";
        hmc_dbc2_reorder_rdata : string := "disable";
        hmc_dbc0_reorder_rdata : string := "disable";
        hmc_mrr_to_valid : bit_vector(3 downto 0) := "0000";
        hmc_rld3_refresh_seq3 : bit_vector(15 downto 0) := "0000000000000000";
        hmc_power_saving_exit_cycles : bit_vector(5 downto 0) := "000000";
        hmc_dbc2_enable_dm : string := "enable";
        hmc_dbc0_rc_en : string := "disable";
        hmc_mps_exit_cs_to_cke : bit_vector(3 downto 0) := "0000";
        pa_sync_control : string := "no_sync";
        hmc_rd_to_wr : bit_vector(5 downto 0) := "000000";
        hmc_rd_odt_period : bit_vector(5 downto 0) := "000000";
        hmc_ctrl_output_regd : string := "disable";
        pa_feedback_mux_sel_0 : string := "fb0_p_clk_0";
        hmc_tile_id : bit_vector(4 downto 0) := "00000";
        hmc_mem_if_rowaddr_width : string := "row_width_16";
        hmc_ctrl_reorder_rdata : string := "disable";
        hmc_reorder_data : string := "disable";
        hmc_cfg_loopback_en : string := "disable";
        hmc_rd_to_rd_diff_bg : bit_vector(5 downto 0) := "000000";
        hmc_dbc3_burst_length : string := "bl_8_dbc3";
        hmc_dbc2_ctrl_sel : string := "upper_mux_dbc2";
        hmc_dbc2_slot_offset : bit_vector(1 downto 0) := "00";
        physeq_tile_id : bit_vector(8 downto 0) := "000000000";
        hmc_col_cmd_slot : bit_vector(3 downto 0) := "0000";
        hmc_dbc3_enable_dm : string := "enable";
        hmc_dbc2_rc_en : string := "disable";
        pa_feedback_divider_c1 : string := "div_by_1_c1";
        hmc_dbc1_output_regd : string := "disable";
        hmc_second_clk_src : string := "clk1";
        physeq_trk_mgr_mrnk_mode : string := "one_rank";
        hmc_sb_cg_disable : string := "disable";
        hmc_clkgating_en : string := "disable";
        hmc_row_cmd_slot : bit_vector(3 downto 0) := "0000";
        hmc_cfg_prbs_ctrl_sel : string := "hmc";
        hmc_mps_exit_cke_to_cs : bit_vector(3 downto 0) := "0000";
        hmc_dbc1_slot_offset : bit_vector(1 downto 0) := "00";
        hmc_pch_to_valid : bit_vector(5 downto 0) := "000000";
        hmc_cfg_wdata_driver_sel : string := "core_w";
        hmc_cfg_dbg_out_sel : bit_vector(15 downto 0) := "0000000000000000";
        hmc_addr_mplx_en : string := "disable";
        hmc_dbc1_dualport_en : string := "disable";
        hmc_dbc3_dualport_en : string := "disable";
        hmc_dbc0_enable_dm : string := "enable";
        hmc_dbc0_slot_offset : bit_vector(1 downto 0) := "00";
        hmc_dqstrk_to_valid : bit_vector(7 downto 0) := "00000000";
        hmc_dbc0_cmd_rate : string := "half_rate_dbc0";
        hmc_wr_to_rd_diff_bg : bit_vector(5 downto 0) := "000000";
        hmc_rd_odt_on : bit_vector(5 downto 0) := "000000";
        hmc_rb_reserved_entry : bit_vector(6 downto 0) := "0000000";
        hmc_dbc0_slot_rotate_en : bit_vector(1 downto 0) := "00";
        physeq_hmc_id : bit_vector(8 downto 0) := "000000000";
        hmc_dbc1_pipe_lat : bit_vector(2 downto 0) := "000";
        hmc_srf_zqcal_disable : string := "disable";
        pa_phase_offset_0 : bit_vector(11 downto 0) := "000000000000";
        hmc_pch_all_to_valid : bit_vector(5 downto 0) := "000000";
        hmc_ctrl_ac_pos : string := "use_0_1_2_lane";
        hmc_dbc2_output_regd : string := "disable";
        pa_exponent_0 : bit_vector(2 downto 0) := "000";
        hmc_rd_to_wr_diff_chip : bit_vector(5 downto 0) := "000000";
        hmc_read_odt_chip : bit_vector(15 downto 0) := "0000000000000000";
        hmc_ctrl2dbc_switch1 : string := "local_tile_dbc1";
        hmc_act_to_pch : bit_vector(5 downto 0) := "000000";
        ioaux_info : string := "";
        ioaux_info_valid : string := "false";
        ioaux_param_table : string := "";
        rewired : string := "false"
    );
    port (
        ctl2core_avl_rdata_id : out std_logic_vector(12 downto 0);
        dqs_out_x36_lane0 : out std_logic_vector(1 downto 0);
        mmr_in : in std_logic_vector(50 downto 0) := (OTHERS => '0');
        ctl2core_avl_cmd_ready : out std_logic;
        phy_clk_out2 : out std_logic_vector(9 downto 0);
        ping_pong_in : in std_logic_vector(47 downto 0) := (OTHERS => '0');
        dll_clk_out0 : out std_logic;
        global_reset_n : in std_logic := '0';
        phy_clk_in : in std_logic_vector(1 downto 0) := (OTHERS => '0');
        ctl_mem_clk_disable : out std_logic_vector(1 downto 0);
        pa_sync_data_top_out : out std_logic;
        pa_sync_data_bot_out : out std_logic;
        ctl2dbc_in_up : in std_logic_vector(50 downto 0) := (OTHERS => '0');
        pa_reset_n : in std_logic := '0';
        dqs_out_x36_lane3 : out std_logic_vector(1 downto 0);
        dbc2ctl2 : in std_logic_vector(22 downto 0) := (OTHERS => '0');
        pa_fbclk_in : in std_logic := '0';
        ping_pong_out : out std_logic_vector(47 downto 0);
        pa_dprio_clk : in std_logic := '0';
        afi_ctl2core : out std_logic_vector(25 downto 0);
        dqs_out_x8_lane0 : out std_logic_vector(1 downto 0);
        dll_clk_out3 : out std_logic;
        dll_clk_in : in std_logic := '0';
        pa_dprio_block_select : out std_logic;
        cal_avl_in : in std_logic_vector(54 downto 0) := (OTHERS => '0');
        dbc2ctl1 : in std_logic_vector(22 downto 0) := (OTHERS => '0');
        afi_lane3_to_ctl : in std_logic_vector(15 downto 0) := (OTHERS => '0');
        pa_dprio_reg_addr : in std_logic_vector(8 downto 0) := (OTHERS => '0');
        pa_sync_clk_top_out : out std_logic;
        cal_avl_out : out std_logic_vector(54 downto 0);
        core2ctl_avl1 : in std_logic_vector(59 downto 0) := (OTHERS => '0');
        pll_locked_in : in std_logic := '0';
        pa_dprio_readdata : out std_logic_vector(7 downto 0);
        pll_vco_in : in std_logic_vector(7 downto 0) := (OTHERS => '0');
        ctl2core_sideband : out std_logic_vector(13 downto 0);
        dqs_out_x18_lane1 : out std_logic_vector(1 downto 0);
        pa_sync_data_bot_in : in std_logic := '0';
        dqs_in_x18_1 : in std_logic_vector(1 downto 0) := (OTHERS => '0');
        phy_clk_out3 : out std_logic_vector(9 downto 0);
        pa_sync_data_top_in : in std_logic := '0';
        dqs_in_x18_0 : in std_logic_vector(1 downto 0) := (OTHERS => '0');
        dll_clk_out2 : out std_logic;
        mrnk_read_core : in std_logic_vector(15 downto 0) := (OTHERS => '0');
        dqs_out_x8_lane2 : out std_logic_vector(1 downto 0);
        afi_lane2_to_ctl : in std_logic_vector(15 downto 0) := (OTHERS => '0');
        pa_dprio_read : in std_logic := '0';
        ctl2dbc1 : out std_logic_vector(50 downto 0);
        phy_clk_out1 : out std_logic_vector(9 downto 0);
        pa_dprio_rst_n : in std_logic := '0';
        rdata_en_full_core : in std_logic_vector(3 downto 0) := (OTHERS => '0');
        cfg_dbc2 : out std_logic_vector(16 downto 0);
        dqs_out_x18_lane3 : out std_logic_vector(1 downto 0);
        core2ctl_avl0 : in std_logic_vector(59 downto 0) := (OTHERS => '0');
        pa_sync_clk_bot_in : in std_logic := '0';
        cfg_dbc1 : out std_logic_vector(16 downto 0);
        dqs_out_x18_lane2 : out std_logic_vector(1 downto 0);
        dqs_in_x36 : in std_logic_vector(1 downto 0) := (OTHERS => '0');
        core2ctl_avl_rd_data_ready : in std_logic := '0';
        afi_lane1_to_ctl : in std_logic_vector(15 downto 0) := (OTHERS => '0');
        dqs_out_x8_lane1 : out std_logic_vector(1 downto 0);
        dqs_in_x8_2 : in std_logic_vector(1 downto 0) := (OTHERS => '0');
        dbc2core_wr_data_rdy0 : in std_logic := '0';
        dqs_out_x36_lane2 : out std_logic_vector(1 downto 0);
        phy_fbclk_out : out std_logic;
        pa_locked : out std_logic_vector(1 downto 0);
        pa_dprio_writedata : in std_logic_vector(7 downto 0) := (OTHERS => '0');
        pa_core_clk_in : in std_logic_vector(1 downto 0) := (OTHERS => '0');
        cal_avl_rdata_out : out std_logic_vector(31 downto 0);
        dqs_out_x8_lane3 : out std_logic_vector(1 downto 0);
        core2ctl_sideband : in std_logic_vector(41 downto 0) := (OTHERS => '0');
        cfg_dbc3 : out std_logic_vector(16 downto 0);
        dqs_out_x36_lane1 : out std_logic_vector(1 downto 0);
        ctl2dbc0 : out std_logic_vector(50 downto 0);
        pa_core_in : in std_logic_vector(11 downto 0) := (OTHERS => '0');
        dqs_out_x18_lane0 : out std_logic_vector(1 downto 0);
        dll_clk_out1 : out std_logic;
        pa_dprio_write : in std_logic := '0';
        seq2core_reset_n : out std_logic;
        dqs_in_x8_1 : in std_logic_vector(1 downto 0) := (OTHERS => '0');
        afi_cmd_bus : out std_logic_vector(383 downto 0);
        dbc2core_wr_data_rdy3 : in std_logic := '0';
        dqs_in_x8_0 : in std_logic_vector(1 downto 0) := (OTHERS => '0');
        afi_core2ctl : in std_logic_vector(16 downto 0) := (OTHERS => '0');
        afi_lane0_to_ctl : in std_logic_vector(15 downto 0) := (OTHERS => '0');
        pa_sync_clk_top_in : in std_logic := '0';
        dbc2ctl0 : in std_logic_vector(22 downto 0) := (OTHERS => '0');
        pa_core_clk_out : out std_logic_vector(1 downto 0);
        phy_clk_out0 : out std_logic_vector(9 downto 0);
        dbc2core_wr_data_rdy1 : in std_logic := '0';
        test_dbg_in : in std_logic_vector(47 downto 0) := (OTHERS => '0');
        dbc2ctl3 : in std_logic_vector(22 downto 0) := (OTHERS => '0');
        pa_sync_clk_bot_out : out std_logic;
        dbc2core_wr_data_rdy2 : in std_logic := '0';
        mmr_out : out std_logic_vector(33 downto 0);
        test_dbg_out : out std_logic_vector(47 downto 0);
        cal_avl_rdata_in : in std_logic_vector(31 downto 0) := (OTHERS => '0');
        cfg_dbc0 : out std_logic_vector(16 downto 0);
        ctl2dbc_in_down : in std_logic_vector(50 downto 0) := (OTHERS => '0');
        dqs_in_x8_3 : in std_logic_vector(1 downto 0) := (OTHERS => '0');
        dqs_in_x4_a_0 : in std_logic := '0';
        dqs_in_x4_a_1 : in std_logic := '0';
        dqs_in_x4_a_2 : in std_logic := '0';
        dqs_in_x4_a_3 : in std_logic := '0';
        dqs_in_x4_b_0 : in std_logic := '0';
        dqs_in_x4_b_1 : in std_logic := '0';
        dqs_in_x4_b_2 : in std_logic := '0';
        dqs_in_x4_b_3 : in std_logic := '0';
    	dqs_out_x4_a_lane0 : out std_logic_vector(0 downto 0) := (OTHERS => '0');
		dqs_out_x4_b_lane0 : out std_logic_vector(0 downto 0) := (OTHERS => '0');
		dqs_out_x4_a_lane1 : out std_logic_vector(0 downto 0) := (OTHERS => '0');
		dqs_out_x4_b_lane1 : out std_logic_vector(0 downto 0) := (OTHERS => '0');
		dqs_out_x4_a_lane2 : out std_logic_vector(0 downto 0) := (OTHERS => '0');
		dqs_out_x4_b_lane2 : out std_logic_vector(0 downto 0) := (OTHERS => '0');
		dqs_out_x4_a_lane3 : out std_logic_vector(0 downto 0) := (OTHERS => '0');
		dqs_out_x4_b_lane3 : out std_logic_vector(0 downto 0) := (OTHERS => '0');
		dft_scan_clk : in std_logic := '0'
   );
END COMPONENT;

--
-- twentynm_refclk_input
--

COMPONENT twentynm_refclk_input
    generic (
    	silicon_rev : string := "20nm5es";
        tnum : string := "tnum_1";
        refclk1_btm_dwnen : string := "disable_bt_dn_1";
        refclk1_btm_upen : string := "disable_bt_up_1";
        refclk2_tp_upen : string := "disable_tp_up_2";
        refclk3_tp_upen : string := "disable_tp_up_3";
        refclk1in_msel : string := "refclk2_1";
        refclk1_dwn : string := "tri1";
        refclk2_btm_upen : string := "disable_bt_up_2";
        refclk3_muxin_en : string := "disable_muxin_3";
        ref3to2_en : string := "disable_3to2";
        clkpin_select : string := "select_clkpin_0";
        refclk1_muxin_en : string := "disable_muxin_1";
        refclk3_dwn : string := "tri3";
        refclk1_tp_dwnen : string := "disable_tp_dn_1";
        pllin_msel : string := "refclk0_ftop";
        refclk2_dwn : string := "tri2";
        refclk0in_msel : string := "refclk1_0";
        refclk2_btm_dwnen : string := "disable_bt_dn_2";
        refclk3_tp_dwnen : string := "disable_tp_dn_3";
        refclk1_tp_upen : string := "disable_tp_up_1";
        refclk2in_msel : string := "high_2";
        location : string := "location_1";
        refclk3_btm_upen : string := "disable_bt_up_3";
        refclk3_btm_dwnen : string := "disable_bt_dn_3";
        refclk2_muxin_en : string := "disable_muxin_2";
        refclk_3_up_n : string := "no_weak_pullup_3";
        refclk3in_msel : string := "high_3";
        refclk_2_up_n : string := "no_weak_pullup_2";
        refclk2_tp_dwnen : string := "disable_tp_dn_2";
        ref2to3_en : string := "disable_2to3"
    );
    port (
        clk_out : out std_logic;
        up_out : out std_logic_vector(3 downto 0);
        ref_clk_in : in std_logic := '0';
        down_out : out std_logic_vector(3 downto 0);
        pll_cascade_in : in std_logic := '0';
        down_in : in std_logic_vector(3 downto 0) := (OTHERS => '0');
        up_in : in std_logic_vector(3 downto 0) := (OTHERS => '0')
    );
END COMPONENT;

--
-- twentynm_io_aux
--

COMPONENT twentynm_io_aux
    generic (
    	silicon_rev : string := "20nm5es";
        config_io_aux_bypass : string := "false";
        nios_reset_vector_word_addr : bit_vector(16-1 downto 0) := "0000000000000000";
        nios_exception_vector_word_addr : bit_vector(16-1 downto 0) := "0000000000000000";
        config_power_down : string := "false";
        cal_clk_div : integer := 6;
        sys_clk_div : integer := 2;
        interface_id : integer := 0;
        verbose_ioaux : string := "false";
        config_spare : bit_vector(8-1 downto 0) := "00000000";
        sys_clk_source : string := "int_osc_clk";
        nios_break_vector_word_addr : bit_vector(16-1 downto 0) := "0000000000000000";
        config_ram : bit_vector(38-1 downto 0) := "00000000000000000000000000000000000000";
        config_hps : string := "false";
        nios_code_hex_file : string := "";
        simulation_osc_freq_mhz : integer := 800;
        parameter_table_hex_file : string := "";
        mem_contents : string := "";
        mem_contents_valid : string := "false";
        mem_contents_updated : string := "false"
    );
    port (
        soft_nios_write_data : in std_logic_vector(31 downto 0) := (OTHERS => '0');
        debug_clk : in std_logic := '0';
        soft_nios_out_read_data : in std_logic_vector(31 downto 0) := (OTHERS => '0');
        soft_nios_out_byteenable : out std_logic_vector(3 downto 0);
        uc_read : out std_logic;
        soft_ram_addr : out std_logic_vector(15 downto 0);
        mode : in std_logic := '0';
        soft_ram_waitrequest : in std_logic := '0';
        usrmode : in std_logic := '0';
        debug_select : in std_logic_vector(3 downto 0) := (OTHERS => '0');
        soft_nios_read_data : out std_logic_vector(31 downto 0);
        soft_ram_clk : in std_logic := '0';
        vji_uir_to_the_hard_nios : in std_logic := '0';
        soft_nios_out_reset_n : out std_logic;
        soft_nios_addr : in std_logic_vector(27 downto 0) := (OTHERS => '0');
        mcu_en : in std_logic := '0';
        soft_nios_waitrequest : out std_logic;
        soft_nios_read_data_valid : out std_logic;
        core_usr_reset_n : in std_logic := '0';
        soft_ram_read : out std_logic;
        debug_out : out std_logic_vector(21 downto 0);
        uc_av_bus_clk : out std_logic;
        soft_ram_rst_n : out std_logic;
        pio_out : out std_logic_vector(7 downto 0);
        uc_write_data : out std_logic_vector(31 downto 0);
        vji_cdr_to_the_hard_nios : in std_logic := '0';
        soft_nios_out_addr : out std_logic_vector(27 downto 0);
        vji_tdo_from_the_hard_nios : out std_logic;
        soft_nios_clk : in std_logic := '0';
        soft_nios_out_clk : out std_logic;
        vji_tdi_to_the_hard_nios : in std_logic := '0';
        soft_nios_out_read_data_valid : in std_logic := '0';
        vji_ir_in_to_the_hard_nios : in std_logic_vector(1 downto 0) := (OTHERS => '0');
        uc_read_data : in std_logic_vector(31 downto 0) := (OTHERS => '0');
        soft_nios_read : in std_logic := '0';
        soft_ram_burstcount : out std_logic;
        vji_sdr_to_the_hard_nios : in std_logic := '0';
        soft_nios_out_write_data : out std_logic_vector(31 downto 0);
        soft_ram_byteenable : out std_logic_vector(3 downto 0);
        soft_ram_debugaccess : out std_logic;
        soft_nios_out_burstcount : out std_logic;
        pio_in : in std_logic_vector(7 downto 0) := (OTHERS => '0');
        soft_ram_reset_n : in std_logic := '0';
        soft_nios_out_waitrequest : in std_logic := '0';
        soft_ram_write : out std_logic;
        soft_nios_write : in std_logic := '0';
        soft_nios_burstcount : in std_logic := '0';
        soft_ram_rdata_valid : in std_logic := '0';
        vji_udr_to_the_hard_nios : in std_logic := '0';
        soft_nios_byteenable : in std_logic_vector(3 downto 0) := (OTHERS => '0');
        soft_nios_out_write : out std_logic;
        uc_address : out std_logic_vector(19 downto 0);
        soft_nios_out_read : out std_logic;
        core_clk : in std_logic := '0';
        uc_write : out std_logic;
        soft_ram_write_data : out std_logic_vector(31 downto 0);
        soft_ram_read_data : in std_logic_vector(31 downto 0) := (OTHERS => '0');
        soft_nios_reset_n : in std_logic := '0';
        vji_rti_to_the_hard_nios : in std_logic := '0';
        vji_tck_to_the_hard_nios : in std_logic := '0';
        vji_ir_out_from_the_hard_nios : out std_logic_vector(1 downto 0)
    );
END COMPONENT;

end twentynm_components;
