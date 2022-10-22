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

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.VITAL_Timing.all;
use IEEE.VITAL_Primitives.all;

package twentynm_atom_pack is

function str_to_bin (lut_mask : string ) return std_logic_vector;

function product(list : std_logic_vector) return std_logic ;

function alt_conv_integer(arg : in std_logic_vector) return integer;


-- default generic values
    CONSTANT DefWireDelay        : VitalDelayType01      := (0 ns, 0 ns);
    CONSTANT DefPropDelay01      : VitalDelayType01      := (0 ns, 0 ns);
    CONSTANT DefPropDelay01Z     : VitalDelayType01Z     := (OTHERS => 0 ns);
    CONSTANT DefSetupHoldCnst    : TIME := 0 ns;
    CONSTANT DefPulseWdthCnst    : TIME := 0 ns;
-- default control options
--    CONSTANT DefGlitchMode       : VitalGlitchKindType   := OnEvent;
-- change default delay type to Transport : for spr 68748
    CONSTANT DefGlitchMode       : VitalGlitchKindType   := VitalTransport;
    CONSTANT DefGlitchMsgOn      : BOOLEAN       := FALSE;
    CONSTANT DefGlitchXOn        : BOOLEAN       := FALSE;
    CONSTANT DefMsgOnChecks      : BOOLEAN       := TRUE;
    CONSTANT DefXOnChecks        : BOOLEAN       := TRUE;
-- output strength mapping
                                                --  UX01ZWHL-
    CONSTANT PullUp      : VitalOutputMapType    := "UX01HX01X";
    CONSTANT NoPullUpZ   : VitalOutputMapType    := "UX01ZX01X";
    CONSTANT PullDown    : VitalOutputMapType    := "UX01LX01X";
-- primitive result strength mapping
    CONSTANT wiredOR     : VitalResultMapType    := ( 'U', 'X', 'L', '1' );
    CONSTANT wiredAND    : VitalResultMapType    := ( 'U', 'X', '0', 'H' );
    CONSTANT L : VitalTableSymbolType := '0';
    CONSTANT H : VitalTableSymbolType := '1';
    CONSTANT x : VitalTableSymbolType := '-';
    CONSTANT S : VitalTableSymbolType := 'S';
    CONSTANT R : VitalTableSymbolType := '/';
    CONSTANT U : VitalTableSymbolType := 'X';
    CONSTANT V : VitalTableSymbolType := 'B'; -- valid clock signal (non-rising)

-- Declare array types for CAM_SLICE
    TYPE twentynm_mem_data IS ARRAY (0 to 31) of STD_LOGIC_VECTOR (31 downto 0);

function int2str( value : integer ) return string;

function map_x_to_0 (value : std_logic) return std_logic;

function SelectDelay (CONSTANT Paths: IN  VitalPathArray01Type) return TIME;

function int2bit (arg : boolean) return std_logic;
function int2bit (arg : integer) return std_logic;
function bin2int (s : bit_vector) return integer;
function bin2int (s : bit) return integer;
function bin2int (s : std_logic_vector) return integer;
function bin2int (s : std_logic) return integer;
function int2bin (arg : integer; size : integer) return std_logic_vector;
function int2bin (arg : boolean; size : integer) return std_logic_vector;
function calc_sum_len( widtha : integer; widthb : integer) return integer;

end twentynm_atom_pack;

library IEEE;
use IEEE.std_logic_1164.all;

package body twentynm_atom_pack is

type masklength is array (4 downto 1) of std_logic_vector(3 downto 0);
function str_to_bin (lut_mask : string) return std_logic_vector is
variable slice : masklength := (OTHERS => "0000");
variable mask : std_logic_vector(15 downto 0);


begin

    for i in 1 to lut_mask'length loop
        case lut_mask(i) is
            when '0' => slice(i) := "0000";
            when '1' => slice(i) := "0001";
            when '2' => slice(i) := "0010";
            when '3' => slice(i) := "0011";
            when '4' => slice(i) := "0100";
            when '5' => slice(i) := "0101";
            when '6' => slice(i) := "0110";
            when '7' => slice(i) := "0111";
            when '8' => slice(i) := "1000";
            when '9' => slice(i) := "1001";
            when 'a' => slice(i) := "1010";
            when 'A' => slice(i) := "1010";
            when 'b' => slice(i) := "1011";
            when 'B' => slice(i) := "1011";
            when 'c' => slice(i) := "1100";
            when 'C' => slice(i) := "1100";
            when 'd' => slice(i) := "1101";
            when 'D' => slice(i) := "1101";
            when 'e' => slice(i) := "1110";
            when 'E' => slice(i) := "1110";
            when others => slice(i) := "1111";
        end case;
    end loop;
 
 
    mask := (slice(1) & slice(2) & slice(3) & slice(4));
    return (mask);
 
end str_to_bin;
 
function product (list: std_logic_vector) return std_logic is
begin

    for i in 0 to 31 loop
        if list(i) = '0' then
            return ('0');
        end if;
    end loop;
    return ('1');

end product;

function alt_conv_integer(arg : in std_logic_vector) return integer is
variable result : integer;
begin
    result := 0;
    for i in arg'range loop
        if arg(i) = '1' then
            result := result + 2**i;
        end if;
    end loop;
    return result;
end alt_conv_integer;

function int2str( value : integer ) return string is
variable ivalue,index : integer;
variable digit : integer;
variable line_no: string(8 downto 1) := "        ";
begin
    ivalue := value;
    index := 1;
    if (ivalue = 0) then
        line_no := "       0";
    end if;
    while (ivalue > 0) loop
        digit := ivalue MOD 10;
        ivalue := ivalue/10;
        case digit is
            when 0 =>
                    line_no(index) := '0';
            when 1 =>
                    line_no(index) := '1';
            when 2 =>
                    line_no(index) := '2';
            when 3 =>
                    line_no(index) := '3';
            when 4 =>
                    line_no(index) := '4';
            when 5 =>
                    line_no(index) := '5';
            when 6 =>
                    line_no(index) := '6';
            when 7 =>
                    line_no(index) := '7';
            when 8 =>
                    line_no(index) := '8';
            when 9 =>
                    line_no(index) := '9';
            when others =>
                    ASSERT FALSE
                    REPORT "Illegal number!"
                    SEVERITY ERROR;
        end case;
        index := index + 1;
    end loop;
    return line_no;
end;

function map_x_to_0 (value : std_logic) return std_logic is
begin
    if (Is_X (value) = TRUE) then
        return '0';
    else
        return value;
    end if;
end;

function SelectDelay (CONSTANT Paths : IN  VitalPathArray01Type) return TIME IS

variable Temp  : TIME;
variable TransitionTime  : TIME := TIME'HIGH;
variable PathDelay : TIME := TIME'HIGH;

begin

    for i IN Paths'RANGE loop
        next when not Paths(i).PathCondition;

        next when Paths(i).InputChangeTime > TransitionTime;

        Temp := Paths(i).PathDelay(tr01);

        if Paths(i).InputChangeTime < TransitionTime then
            PathDelay := Temp;
        else
            if Temp < PathDelay then
                PathDelay := Temp;
            end if;
        end if;
        TransitionTime := Paths(i).InputChangeTime;
    end loop;

    return PathDelay;

end;

function int2bit (arg : integer) return std_logic is
    variable int_val : integer := arg;
    variable result : std_logic;
    begin
        
            if (int_val  = 0) then
                result := '0';
            else
                result := '1';
            end if;
            
        return result;
end int2bit;

function int2bit (arg : boolean) return std_logic is
    variable int_val : boolean := arg;
    variable result : std_logic;
    begin
        
            if (int_val ) then
                result := '1';
            else
                result := '0';
            end if;
            
        return result;
end int2bit;

function bin2int (s : bit_vector) return integer is

      constant temp      : bit_vector(s'high-s'low DOWNTO 0) := s;      
      variable result      : integer := 0;
   begin
      for i in temp'range loop
         if (temp(i) = '1') then
            result := result + (2**i);
         end if;
      end loop;
      return(result);
   end bin2int;

function bin2int (s : bit) return integer is
      constant temp      : bit := s;      
      variable result      : integer := 0;
   begin
         if (temp = '1') then
            result := 1;
         else
         	result := 0;
     	 end if;
      return(result);
	end bin2int;

function bin2int (s : std_logic_vector) return integer is

      constant temp      : std_logic_vector(s'high-s'low DOWNTO 0) := s;      
      variable result      : integer := 0;
   begin
      for i in temp'range loop
         if (temp(i) = '1') then
            result := result + (2**i);
         end if;
      end loop;
      return(result);
   end bin2int;
                  
function bin2int (s : std_logic) return integer is
      constant temp      : std_logic := s;      
      variable result      : integer := 0;
   begin
         if (temp = '1') then
            result := 1;
         else
                result := 0;
         end if;
      return(result);
        end bin2int;

        function int2bin (arg : integer; size : integer) return std_logic_vector is
    variable int_val : integer := arg;
    variable result : std_logic_vector(size-1 downto 0);
    begin
        for i in 0 to result'left loop
            if ((int_val mod 2) = 0) then
                result(i) := '0';
            else
                result(i) := '1';
            end if;
            int_val := int_val/2;
        end loop;
        return result;
    end int2bin;
    
function int2bin (arg : boolean; size : integer) return std_logic_vector is
    variable result : std_logic_vector(size-1 downto 0);
    begin
                if(arg)then
                        result := (OTHERS => '1');
                else
                        result := (OTHERS => '0');
                end if;
        return result;
    end int2bin;

function calc_sum_len( widtha : integer; widthb : integer) return integer is
variable result: integer;
begin
        if(widtha >= widthb) then
                result := widtha + 1;
        else
                result := widthb + 1;
        end if;
        return result;
end calc_sum_len;

end twentynm_atom_pack;

Library ieee;
use ieee.std_logic_1164.all;

Package twentynm_pllpack is


    procedure find_simple_integer_fraction( numerator   : in integer;
                                            denominator : in integer;
                                            max_denom   : in integer;
                                            fraction_num : out integer; 
                                            fraction_div : out integer);

    procedure find_m_and_n_4_manual_phase ( inclock_period : in integer;
                                            vco_phase_shift_step : in integer;
                                            clk0_mult: in integer; clk1_mult: in integer;
                                            clk2_mult: in integer; clk3_mult: in integer;
                                            clk4_mult: in integer; clk5_mult: in integer;
                                            clk6_mult: in integer; clk7_mult: in integer;
                                            clk8_mult: in integer; clk9_mult: in integer;
                                            clk0_div : in integer; clk1_div : in integer;
                                            clk2_div : in integer; clk3_div : in integer;
                                            clk4_div : in integer; clk5_div : in integer;
                                            clk6_div : in integer; clk7_div : in integer;
                                            clk8_div : in integer; clk9_div : in integer;
                                            clk0_used : in string; clk1_used : in string;
                                            clk2_used : in string; clk3_used : in string;
                                            clk4_used : in string; clk5_used : in string;
                                            clk6_used : in string; clk7_used : in string;
                                            clk8_used : in string; clk9_used : in string;
                                            m : out integer;
                                            n : out integer );

    function gcd (X: integer; Y: integer) return integer;

    function count_digit (X: integer) return integer;

    function scale_num (X: integer; Y: integer) return integer;

    function lcm (A1: integer; A2: integer; A3: integer; A4: integer;
                A5: integer; A6: integer; A7: integer;
                A8: integer; A9: integer; A10: integer; P: integer) return integer;

    function output_counter_value (clk_divide: integer; clk_mult : integer ;
            M: integer; N: integer ) return integer;

    function counter_mode (duty_cycle: integer; output_counter_value: integer) return string;

    function counter_high (output_counter_value: integer := 1; duty_cycle: integer)
                        return integer;

    function counter_low (output_counter_value: integer; duty_cycle: integer)
                        return integer;

    function mintimedelay (t1: integer; t2: integer; t3: integer; t4: integer;
                        t5: integer; t6: integer; t7: integer; t8: integer;
                        t9: integer; t10: integer) return integer;

    function maxnegabs (t1: integer; t2: integer; t3: integer; t4: integer;
                        t5: integer; t6: integer; t7: integer; t8: integer;
                        t9: integer; t10: integer) return integer;

    function counter_time_delay ( clk_time_delay: integer;
                        m_time_delay: integer; n_time_delay: integer)
                        return integer;

    function get_phase_degree (phase_shift: integer; clk_period: integer) return integer;

    function counter_initial (tap_phase: integer; m: integer; n: integer)
                        return integer;

    function counter_ph (tap_phase: integer; m : integer; n: integer) return integer;

    function ph_adjust (tap_phase: integer; ph_base : integer) return integer;

    function translate_string (mode : string) return string;
    
    function str2int (s : string) return integer;

    function dqs_str2int (s : string) return integer;

end twentynm_pllpack;

package body twentynm_pllpack is


-- finds the closest integer fraction of a given pair of numerator and denominator. 
procedure find_simple_integer_fraction( numerator   : in integer;
                                        denominator : in integer;
                                        max_denom   : in integer;
                                        fraction_num : out integer; 
                                        fraction_div : out integer) is
    constant MAX_ITER : integer := 20; 
    type INT_ARRAY is array ((MAX_ITER-1) downto 0) of integer;

    variable quotient_array : INT_ARRAY;
    variable int_loop_iter : integer;
    variable int_quot  : integer;
    variable m_value   : integer;
    variable d_value   : integer;
    variable old_m_value : integer;
    variable swap  : integer;
    variable loop_iter : integer;
    variable num   : integer;
    variable den   : integer;
    variable i_max_iter : integer;

begin      
    loop_iter := 0;

    if (numerator = 0) then
        num := 1;
    else
        num := numerator;
    end if;

    if (denominator = 0) then
        den := 1;
    else
        den := denominator;
    end if;

    i_max_iter := max_iter;
   
    while (loop_iter < i_max_iter) loop
        int_quot := num / den;
        quotient_array(loop_iter) := int_quot;
        num := num - (den*int_quot);
        loop_iter := loop_iter+1;
        
        if ((num = 0) or (max_denom /= -1) or (loop_iter = i_max_iter)) then
            -- calculate the numerator and denominator if there is a restriction on the
            -- max denom value or if the loop is ending
            m_value := 0;
            d_value := 1;
            -- get the rounded value at this stage for the remaining fraction
            if (den /= 0) then
                m_value := (2*num/den);
            end if;
            -- calculate the fraction numerator and denominator at this stage
            for int_loop_iter in (loop_iter-1) downto 0 loop
                if (m_value = 0) then
                    m_value := quotient_array(int_loop_iter);
                    d_value := 1;
                else
                    old_m_value := m_value;
                    m_value := (quotient_array(int_loop_iter)*m_value) + d_value;
                    d_value := old_m_value;
                end if;
            end loop;
            -- if the denominator is less than the maximum denom_value or if there is no restriction save it
            if ((d_value <= max_denom) or (max_denom = -1)) then
                if ((m_value = 0) or (d_value = 0)) then
                    fraction_num := numerator;
                    fraction_div := denominator;
                else
                    fraction_num := m_value;
                    fraction_div := d_value;
                end if;
            end if;
            -- end the loop if the denomitor has overflown or the numerator is zero (no remainder during this round)
            if (((d_value > max_denom) and (max_denom /= -1)) or (num = 0)) then
                i_max_iter := loop_iter;
            end if;
        end if;
        -- swap the numerator and denominator for the next round
        swap := den;
        den := num;
        num := swap;
    end loop;
end find_simple_integer_fraction;

-- find the M and N values for Manual phase based on the following 5 criterias:
-- 1. The PFD frequency (i.e. Fin / N) must be in the range 5 MHz to 720 MHz
-- 2. The VCO frequency (i.e. Fin * M / N) must be in the range 300 MHz to 1300 MHz
-- 3. M is less than 512
-- 4. N is less than 512
-- 5. It's the smallest M/N which satisfies all the above constraints, and is within 2ps
--    of the desired vco-phase-shift-step
procedure find_m_and_n_4_manual_phase ( inclock_period : in integer;
                                        vco_phase_shift_step : in integer;
                                        clk0_mult: in integer; clk1_mult: in integer;
                                        clk2_mult: in integer; clk3_mult: in integer;
                                        clk4_mult: in integer; clk5_mult: in integer;
                                        clk6_mult: in integer; clk7_mult: in integer;
                                        clk8_mult: in integer; clk9_mult: in integer;
                                        clk0_div : in integer; clk1_div : in integer;
                                        clk2_div : in integer; clk3_div : in integer;
                                        clk4_div : in integer; clk5_div : in integer;
                                        clk6_div : in integer; clk7_div : in integer;
                                        clk8_div : in integer; clk9_div : in integer;
                                        clk0_used : in string; clk1_used : in string;
                                        clk2_used : in string; clk3_used : in string;
                                        clk4_used : in string; clk5_used : in string;
                                        clk6_used : in string; clk7_used : in string;
                                        clk8_used : in string; clk9_used : in string;
                                        m : out integer;
                                        n : out integer ) is
        constant MAX_M : integer := 511;
        constant MAX_N : integer := 511;
        constant MAX_PFD : integer := 720;
        constant MIN_PFD : integer := 5;
        constant MAX_VCO : integer := 1600; -- max vco frequency. (in mHz)
        constant MIN_VCO : integer := 300;  -- min vco frequency. (in mHz)
        constant MAX_OFFSET : real := 0.004;

        variable vco_period : integer;
        variable pfd_freq : integer;
        variable vco_freq : integer;
        variable vco_ps_step_value : integer;

        variable i_m : integer;
        variable i_n : integer;

        variable i_pre_m : integer;
        variable i_pre_n : integer;

        variable closest_vco_step_value : integer;

        variable i_max_iter : integer;
        variable loop_iter : integer;
        
        variable clk0_div_factor_real : real;
        variable clk1_div_factor_real : real;
        variable clk2_div_factor_real : real;
        variable clk3_div_factor_real : real;
        variable clk4_div_factor_real : real;
        variable clk5_div_factor_real : real;
        variable clk6_div_factor_real : real;
        variable clk7_div_factor_real : real;
        variable clk8_div_factor_real : real;
        variable clk9_div_factor_real : real;
        variable clk0_div_factor_int : integer;
        variable clk1_div_factor_int : integer;
        variable clk2_div_factor_int : integer;
        variable clk3_div_factor_int : integer;
        variable clk4_div_factor_int : integer;
        variable clk5_div_factor_int : integer;
        variable clk6_div_factor_int : integer;
        variable clk7_div_factor_int : integer;
        variable clk8_div_factor_int : integer;
        variable clk9_div_factor_int : integer;
begin
    vco_period := vco_phase_shift_step * 8;
    i_pre_m := 0;
    i_pre_n := 0;
    closest_vco_step_value := 0;

    LOOP_1 :   for i_n_out in 1 to MAX_N loop
        for i_m_out in 1 to MAX_M loop
        
            clk0_div_factor_real := real(clk0_div * i_m_out) / real(clk0_mult * i_n_out);
            clk1_div_factor_real := real(clk1_div * i_m_out) / real(clk1_mult * i_n_out);
            clk2_div_factor_real := real(clk2_div * i_m_out) / real(clk2_mult * i_n_out);
            clk3_div_factor_real := real(clk3_div * i_m_out) / real(clk3_mult * i_n_out);
            clk4_div_factor_real := real(clk4_div * i_m_out) / real(clk4_mult * i_n_out);
            clk5_div_factor_real := real(clk5_div * i_m_out) / real(clk5_mult * i_n_out);
            clk6_div_factor_real := real(clk6_div * i_m_out) / real(clk6_mult * i_n_out);
            clk7_div_factor_real := real(clk7_div * i_m_out) / real(clk7_mult * i_n_out);
            clk8_div_factor_real := real(clk8_div * i_m_out) / real(clk8_mult * i_n_out);
            clk9_div_factor_real := real(clk9_div * i_m_out) / real(clk9_mult * i_n_out);

            clk0_div_factor_int := integer(clk0_div_factor_real);
            clk1_div_factor_int := integer(clk1_div_factor_real);
            clk2_div_factor_int := integer(clk2_div_factor_real);
            clk3_div_factor_int := integer(clk3_div_factor_real);
            clk4_div_factor_int := integer(clk4_div_factor_real);
            clk5_div_factor_int := integer(clk5_div_factor_real);
            clk6_div_factor_int := integer(clk6_div_factor_real);
            clk7_div_factor_int := integer(clk7_div_factor_real);
            clk8_div_factor_int := integer(clk8_div_factor_real);
            clk9_div_factor_int := integer(clk9_div_factor_real);
                        
            if (((abs(clk0_div_factor_real - real(clk0_div_factor_int)) < MAX_OFFSET) or (clk0_used = "unused")) and
                ((abs(clk1_div_factor_real - real(clk1_div_factor_int)) < MAX_OFFSET) or (clk1_used = "unused")) and
                ((abs(clk2_div_factor_real - real(clk2_div_factor_int)) < MAX_OFFSET) or (clk2_used = "unused")) and
                ((abs(clk3_div_factor_real - real(clk3_div_factor_int)) < MAX_OFFSET) or (clk3_used = "unused")) and
                ((abs(clk4_div_factor_real - real(clk4_div_factor_int)) < MAX_OFFSET) or (clk4_used = "unused")) and
                ((abs(clk5_div_factor_real - real(clk5_div_factor_int)) < MAX_OFFSET) or (clk5_used = "unused")) and
                ((abs(clk6_div_factor_real - real(clk6_div_factor_int)) < MAX_OFFSET) or (clk6_used = "unused")) and
                ((abs(clk7_div_factor_real - real(clk7_div_factor_int)) < MAX_OFFSET) or (clk7_used = "unused")) and
                ((abs(clk8_div_factor_real - real(clk8_div_factor_int)) < MAX_OFFSET) or (clk8_used = "unused")) and
                ((abs(clk9_div_factor_real - real(clk9_div_factor_int)) < MAX_OFFSET) or (clk9_used = "unused")) )
            then
                if ((i_m_out /= 0) and (i_n_out /= 0))
                then
                    pfd_freq := 1000000 / (inclock_period * i_n_out);
                    vco_freq := (1000000 * i_m_out) / (inclock_period * i_n_out);
                    vco_ps_step_value := (inclock_period * i_n_out) / (8 * i_m_out);
    
                    if ( (i_m_out < max_m) and (i_n_out < max_n) and (pfd_freq >= min_pfd) and (pfd_freq <= max_pfd) and
                        (vco_freq >= min_vco) and (vco_freq <= max_vco) )
                    then
                        if (abs(vco_ps_step_value - vco_phase_shift_step) <= 2)
                        then
                            i_pre_m := i_m_out;
                            i_pre_n := i_n_out;
                            exit LOOP_1;
                        else
                            if ((closest_vco_step_value = 0) or (abs(vco_ps_step_value - vco_phase_shift_step) < abs(closest_vco_step_value - vco_phase_shift_step)))
                            then
                                i_pre_m := i_m_out;
                                i_pre_n := i_n_out;
                                closest_vco_step_value := vco_ps_step_value;
                            end if;
                        end if;
                    end if;
                end if;
            end if;
        end loop;
    end loop;
    
    if ((i_pre_m /= 0) and (i_pre_n /= 0))
    then
        find_simple_integer_fraction(i_pre_m, i_pre_n,
                    MAX_N, m, n);
    else
        n := 1;
        m := lcm  (clk0_mult, clk1_mult, clk2_mult, clk3_mult,
                clk4_mult, clk5_mult, clk6_mult,
                clk7_mult, clk8_mult, clk9_mult, inclock_period);
    end if;
end find_m_and_n_4_manual_phase;

-- find the greatest common denominator of X and Y
function gcd (X: integer; Y: integer) return integer is
variable L, S, R, G : integer := 1;
begin
    if (X < Y) then -- find which is smaller.
        S := X;
        L := Y;
    else
        S := Y;
        L := X;
    end if;

    R := S;
    while ( R > 1) loop
        S := L;
        L := R;
        R := S rem L;   -- divide bigger number by smaller.
                        -- remainder becomes smaller number.
    end loop;
    if (R = 0) then  -- if evenly divisible then L is gcd else it is 1.
        G := L;
    else
        G := R;
    end if;

    return G;
end gcd;

-- count the number of digits in the given integer
function count_digit (X: integer)
        return integer is
variable count, result: integer := 0;
begin
    result := X;
    while (result /= 0) loop
        result := (result / 10);
        count := count + 1;
    end loop;
    
    return count;
end count_digit;
    
-- reduce the given huge number to Y significant digits
function scale_num (X: integer; Y: integer)
        return integer is
variable count : integer := 0; 
variable lc, fac_ten, result: integer := 1;
begin
    count := count_digit(X);

    for lc in 1 to (count-Y) loop
        fac_ten := fac_ten * 10;
    end loop;
    
    result := (X / fac_ten);
    
    return result;
end scale_num;

-- find the least common multiple of A1 to A10
function lcm (A1: integer; A2: integer; A3: integer; A4: integer;
            A5: integer; A6: integer; A7: integer;
            A8: integer; A9: integer; A10: integer; P: integer)
        return integer is
variable M1, M2, M3, M4, M5 , M6, M7, M8, M9, R: integer := 1;
begin
    M1 := (A1 * A2)/gcd(A1, A2);
    M2 := (M1 * A3)/gcd(M1, A3);
    M3 := (M2 * A4)/gcd(M2, A4);
    M4 := (M3 * A5)/gcd(M3, A5);
    M5 := (M4 * A6)/gcd(M4, A6);
    M6 := (M5 * A7)/gcd(M5, A7);
    M7 := (M6 * A8)/gcd(M6, A8);
    M8 := (M7 * A9)/gcd(M7, A9);
    M9 := (M8 * A10)/gcd(M8, A10);
    if (M9 < 3) then
        R := 10;
    elsif (M9 = 3) then
        R := 9;
    elsif ((M9 <= 10) and (M9 > 3)) then
        R := 4 * M9;
    elsif (M9 > 1000) then
        R := scale_num(M9,3);
    else
        R := M9 ;
    end if;

    return R;
end lcm;

-- find the factor of division of the output clock frequency compared to the VCO
function output_counter_value (clk_divide: integer; clk_mult: integer ;
                                M: integer; N: integer ) return integer is
variable r_real : real := 1.0;
variable r: integer := 1;
begin
    r_real := real(clk_divide * M)/ real(clk_mult * N);
    r := integer(r_real);

    return R;
end output_counter_value;

-- find the mode of each PLL counter - bypass, even or odd
function counter_mode (duty_cycle: integer; output_counter_value: integer)
        return string is
variable R: string (1 to 6) := "      ";
variable counter_value: integer := 1;
begin
    counter_value := (2*duty_cycle*output_counter_value)/100;
    if output_counter_value = 1 then
        R := "bypass";
    elsif (counter_value REM 2) = 0 then
        R := "  even";
    else
        R := "   odd";
    end if;

    return R;
end counter_mode;

-- find the number of VCO clock cycles to hold the output clock high
function counter_high (output_counter_value: integer := 1; duty_cycle: integer)
        return integer is
variable R: integer := 1;
variable half_cycle_high : integer := 1;
begin
    half_cycle_high := (duty_cycle * output_counter_value *2)/100 ;
    if (half_cycle_high REM 2 = 0) then
        R := half_cycle_high/2 ;
    else
        R := (half_cycle_high/2) + 1;
    end if;

    return R;
end;

-- find the number of VCO clock cycles to hold the output clock low
function counter_low (output_counter_value: integer; duty_cycle: integer)
        return integer is
variable R, R1: integer := 1;
variable half_cycle_high : integer := 1;
begin
    half_cycle_high := (duty_cycle * output_counter_value*2)/100 ;
    if (half_cycle_high REM 2 = 0) then
        R1 := half_cycle_high/2 ;
    else
        R1 := (half_cycle_high/2) + 1;
    end if;

    R := output_counter_value - R1;

    if (R = 0) then
        R := 1;
    end if;

    return R;
end;

-- find the smallest time delay amongst t1 to t10
function mintimedelay (t1: integer; t2: integer; t3: integer; t4: integer;
                        t5: integer; t6: integer; t7: integer; t8: integer;
                        t9: integer; t10: integer) return integer is
variable m1,m2,m3,m4,m5,m6,m7,m8,m9 : integer := 0;
begin
    if (t1 < t2) then m1 := t1; else m1 := t2; end if;
    if (m1 < t3) then m2 := m1; else m2 := t3; end if;
    if (m2 < t4) then m3 := m2; else m3 := t4; end if;
    if (m3 < t5) then m4 := m3; else m4 := t5; end if;
    if (m4 < t6) then m5 := m4; else m5 := t6; end if;
    if (m5 < t7) then m6 := m5; else m6 := t7; end if;
    if (m6 < t8) then m7 := m6; else m7 := t8; end if;
    if (m7 < t9) then m8 := m7; else m8 := t9; end if;
    if (m8 < t10) then m9 := m8; else m9 := t10; end if;
    if (m9 > 0) then return m9; else return 0; end if;
end;

-- find the numerically largest negative number, and return its absolute value
function maxnegabs (t1: integer; t2: integer; t3: integer; t4: integer;
                    t5: integer; t6: integer; t7: integer; t8: integer;
                    t9: integer; t10: integer) return integer is
variable m1,m2,m3,m4,m5,m6,m7,m8,m9 : integer := 0;
begin
    if (t1 < t2) then m1 := t1; else m1 := t2; end if;
    if (m1 < t3) then m2 := m1; else m2 := t3; end if;
    if (m2 < t4) then m3 := m2; else m3 := t4; end if;
    if (m3 < t5) then m4 := m3; else m4 := t5; end if;
    if (m4 < t6) then m5 := m4; else m5 := t6; end if;
    if (m5 < t7) then m6 := m5; else m6 := t7; end if;
    if (m6 < t8) then m7 := m6; else m7 := t8; end if;
    if (m7 < t9) then m8 := m7; else m8 := t9; end if;
    if (m8 < t10) then m9 := m8; else m9 := t10; end if;
    if (m9 < 0) then return (0 - m9); else return 0; end if;
end;

-- adjust the phase (tap_phase) with the largest negative number (ph_base)
function ph_adjust (tap_phase: integer; ph_base : integer) return integer is
begin
    return (tap_phase + ph_base);
end;

-- find the time delay for each PLL counter
function counter_time_delay (clk_time_delay: integer;
                            m_time_delay: integer; n_time_delay: integer)
        return integer is
variable R: integer := 0;
begin
    R := clk_time_delay + m_time_delay - n_time_delay;

    return R;
end;

-- calculate the given phase shift (in ps) in terms of degrees
function get_phase_degree (phase_shift: integer; clk_period: integer)
        return integer is
variable result: integer := 0;
begin
    result := ( phase_shift * 360 ) / clk_period;
    -- to round up the calculation result
    if (result > 0) then
        result := result + 1;
    elsif (result < 0) then
        result := result - 1;
    else
        result := 0;
    end if;

    return result;
end;

-- find the number of VCO clock cycles to wait initially before the first rising
-- edge of the output clock
function counter_initial (tap_phase: integer; m: integer; n: integer)
        return integer is
variable R: integer;
variable R1: real;
begin
    R1 := (real(abs(tap_phase)) * real(m))/(360.0 * real(n)) + 0.6;
    -- Note NCSim VHDL had problem in rounding up for 0.5 - 0.99. 
    -- This checking will ensure that the rounding up is done.
    if (R1 >= 0.5) and (R1 <= 1.0) then
        R1 := 1.0;
    end if;

    R := integer(R1);

    return R;
end;

-- find which VCO phase tap (0 to 7) to align the rising edge of the output clock to
function counter_ph (tap_phase: integer; m: integer; n: integer) return integer is
variable R: integer := 0;
begin
    -- 0.5 is added for proper rounding of the tap_phase.
    R := integer(real(integer(real(tap_phase * m / n)+ 0.5) REM 360)/45.0) rem 8;

    return R;
end;

-- convert given string to length 6 by padding with spaces
function translate_string (mode : string) return string is
variable new_mode : string (1 to 6) := "      ";
begin
    if (mode = "bypass") then
        new_mode := "bypass";
    elsif (mode = "even") then
        new_mode := "  even";
    elsif (mode = "odd") then
        new_mode := "   odd";
    end if;

    return new_mode;
end;

function str2int (s : string) return integer is
variable len : integer := s'length;
variable newdigit : integer := 0;
variable sign : integer := 1;
variable digit : integer := 0;
begin
    for i in 1 to len loop
        case s(i) is
            when '-' =>
                if i = 1 then
                    sign := -1;
                else
                    ASSERT FALSE
                    REPORT "Illegal Character "&  s(i) & "i n string parameter! "
                    SEVERITY ERROR;
                end if;
            when '0' =>
                digit := 0;
            when '1' =>
                digit := 1;
            when '2' =>
                digit := 2;
            when '3' =>
                digit := 3;
            when '4' =>
                digit := 4;
            when '5' =>
                digit := 5;
            when '6' =>
                digit := 6;
            when '7' =>
                digit := 7;
            when '8' =>
                digit := 8;
            when '9' =>
                digit := 9;
            when others =>
                ASSERT FALSE
                REPORT "Illegal Character "&  s(i) & "in string parameter! "
                SEVERITY ERROR;
        end case;
        newdigit := newdigit * 10 + digit;
    end loop;

    return (sign*newdigit);
end;

function dqs_str2int (s : string) return integer is
variable len : integer := s'length;
variable newdigit : integer := 0;
variable sign : integer := 1;
variable digit : integer := 0;
variable err : boolean := false;
begin
    for i in 1 to len loop
        case s(i) is
            when '-' =>
                if i = 1 then
                    sign := -1;
                else
                    ASSERT FALSE
                    REPORT "Illegal Character "&  s(i) & " in string parameter! "
                    SEVERITY ERROR;
                    err := true;
                end if;
            when '0' =>
                digit := 0;
            when '1' =>
                digit := 1;
            when '2' =>
                digit := 2;
            when '3' =>
                digit := 3;
            when '4' =>
                digit := 4;
            when '5' =>
                digit := 5;
            when '6' =>
                digit := 6;
            when '7' =>
                digit := 7;
            when '8' =>
                digit := 8;
            when '9' =>
                digit := 9;
            when others =>
                -- set error flag
                err := true;
        end case;
        if (err) then
            err := false;
        else
            newdigit := newdigit * 10 + digit;
        end if;
    end loop;

    return (sign*newdigit);
end;

end twentynm_pllpack;

--
--
--  DFFE Model
--
--

LIBRARY IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.VITAL_Timing.all;
use IEEE.VITAL_Primitives.all;
use work.twentynm_atom_pack.all;

entity twentynm_dffe is
    generic(
        TimingChecksOn: Boolean := True;
        XOn: Boolean := DefGlitchXOn;
        MsgOn: Boolean := DefGlitchMsgOn;
        MsgOnChecks: Boolean := DefMsgOnChecks;
        XOnChecks: Boolean := DefXOnChecks;
        InstancePath: STRING := "*";
        tpd_PRN_Q_negedge              :  VitalDelayType01 := DefPropDelay01;
        tpd_CLRN_Q_negedge             :  VitalDelayType01 := DefPropDelay01;
        tpd_CLK_Q_posedge              :  VitalDelayType01 := DefPropDelay01;
        tpd_ENA_Q_posedge              :  VitalDelayType01 := DefPropDelay01;
        tsetup_D_CLK_noedge_posedge    :  VitalDelayType := DefSetupHoldCnst;
        tsetup_D_CLK_noedge_negedge    :  VitalDelayType := DefSetupHoldCnst;
        tsetup_ENA_CLK_noedge_posedge  :  VitalDelayType := DefSetupHoldCnst;
        thold_D_CLK_noedge_posedge     :   VitalDelayType := DefSetupHoldCnst;
        thold_D_CLK_noedge_negedge     :   VitalDelayType := DefSetupHoldCnst;
        thold_ENA_CLK_noedge_posedge   :   VitalDelayType := DefSetupHoldCnst;
        tipd_D                         :  VitalDelayType01 := DefPropDelay01;
        tipd_CLRN                      :  VitalDelayType01 := DefPropDelay01;
        tipd_PRN                       :  VitalDelayType01 := DefPropDelay01;
        tipd_CLK                       :  VitalDelayType01 := DefPropDelay01;
        tipd_ENA                       :  VitalDelayType01 := DefPropDelay01);

    port(
        Q                              :  out   STD_LOGIC := '0';
        D                              :  in    STD_LOGIC;
        CLRN                           :  in    STD_LOGIC;
        PRN                            :  in    STD_LOGIC;
        CLK                            :  in    STD_LOGIC;
        ENA                            :  in    STD_LOGIC);
    attribute VITAL_LEVEL0 of twentynm_dffe : entity is TRUE;
end twentynm_dffe;

-- architecture body --

architecture behave of twentynm_dffe is
    attribute VITAL_LEVEL0 of behave : architecture is TRUE;
    
    signal D_ipd  : STD_ULOGIC := 'U';
    signal CLRN_ipd       : STD_ULOGIC := 'U';
    signal PRN_ipd        : STD_ULOGIC := 'U';
    signal CLK_ipd        : STD_ULOGIC := 'U';
    signal ENA_ipd        : STD_ULOGIC := 'U';

begin

    ---------------------
    --  INPUT PATH DELAYs
    ---------------------
    WireDelay : block
    begin
        VitalWireDelay (D_ipd, D, tipd_D);
        VitalWireDelay (CLRN_ipd, CLRN, tipd_CLRN);
        VitalWireDelay (PRN_ipd, PRN, tipd_PRN);
        VitalWireDelay (CLK_ipd, CLK, tipd_CLK);
        VitalWireDelay (ENA_ipd, ENA, tipd_ENA);
    end block;
    --------------------
    --  BEHAVIOR SECTION
    --------------------
    VITALBehavior : process (D_ipd, CLRN_ipd, PRN_ipd, CLK_ipd, ENA_ipd)
    
    -- timing check results
    VARIABLE Tviol_D_CLK : STD_ULOGIC := '0';
    VARIABLE Tviol_ENA_CLK       : STD_ULOGIC := '0';
    VARIABLE TimingData_D_CLK : VitalTimingDataType := VitalTimingDataInit;
    VARIABLE TimingData_ENA_CLK : VitalTimingDataType := VitalTimingDataInit;
    
    -- functionality results
    VARIABLE Violation : STD_ULOGIC := '0';
    VARIABLE PrevData_Q : STD_LOGIC_VECTOR(0 to 7);
    VARIABLE D_delayed : STD_ULOGIC := 'U';
    VARIABLE CLK_delayed : STD_ULOGIC := 'U';
    VARIABLE ENA_delayed : STD_ULOGIC := 'U';
    VARIABLE Results : STD_LOGIC_VECTOR(1 to 1) := (others => '0');

    -- output glitch detection variables
    VARIABLE Q_VitalGlitchData   : VitalGlitchDataType;


    CONSTANT dffe_Q_tab : VitalStateTableType := (
        ( L,  L,  x,  x,  x,  x,  x,  x,  x,  L ),
        ( L,  H,  L,  H,  H,  x,  x,  H,  x,  H ),
        ( L,  H,  L,  H,  x,  L,  x,  H,  x,  H ),
        ( L,  H,  L,  x,  H,  H,  x,  H,  x,  H ),
        ( L,  H,  H,  x,  x,  x,  H,  x,  x,  S ),
        ( L,  H,  x,  x,  x,  x,  L,  x,  x,  H ),
        ( L,  H,  x,  x,  x,  x,  H,  L,  x,  S ),
        ( L,  x,  L,  L,  L,  x,  H,  H,  x,  L ),
        ( L,  x,  L,  L,  x,  L,  H,  H,  x,  L ),
        ( L,  x,  L,  x,  L,  H,  H,  H,  x,  L ),
        ( L,  x,  x,  x,  x,  x,  x,  x,  x,  S ));
    begin

        ------------------------
        --  Timing Check Section
        ------------------------
        if (TimingChecksOn) then
            VitalSetupHoldCheck (
                Violation       => Tviol_D_CLK,
                TimingData      => TimingData_D_CLK,
                TestSignal      => D_ipd,
                TestSignalName  => "D",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK",
                SetupHigh       => tsetup_D_CLK_noedge_posedge,
                SetupLow        => tsetup_D_CLK_noedge_posedge,
                HoldHigh        => thold_D_CLK_noedge_posedge,
                HoldLow         => thold_D_CLK_noedge_posedge,
                CheckEnabled    => TO_X01(( (NOT PRN_ipd) ) OR ( (NOT CLRN_ipd) ) OR ( (NOT ENA_ipd) )) /= '1',
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/DFFE",
                XOn             => XOnChecks,
                MsgOn           => MsgOnChecks );

            VitalSetupHoldCheck (
                Violation       => Tviol_ENA_CLK,
                TimingData      => TimingData_ENA_CLK,
                TestSignal      => ENA_ipd,
                TestSignalName  => "ENA",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK",
                SetupHigh       => tsetup_ENA_CLK_noedge_posedge,
                SetupLow        => tsetup_ENA_CLK_noedge_posedge,
                HoldHigh        => thold_ENA_CLK_noedge_posedge,
                HoldLow         => thold_ENA_CLK_noedge_posedge,
                CheckEnabled    => TO_X01(( (NOT PRN_ipd) ) OR ( (NOT CLRN_ipd) ) ) /= '1',
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/DFFE",
                XOn             => XOnChecks,
                MsgOn           => MsgOnChecks );
        end if;

        -------------------------
        --  Functionality Section
        -------------------------
        Violation := Tviol_D_CLK or Tviol_ENA_CLK;
        VitalStateTable(
        StateTable => dffe_Q_tab,
        DataIn => (
                Violation, CLRN_ipd, CLK_delayed, Results(1), D_delayed, ENA_delayed, PRN_ipd, CLK_ipd),
        Result => Results,
        NumStates => 1,
        PreviousDataIn => PrevData_Q);
        D_delayed := D_ipd;
        CLK_delayed := CLK_ipd;
        ENA_delayed := ENA_ipd;

        ----------------------
        --  Path Delay Section
        ----------------------
        VitalPathDelay01 (
        OutSignal => Q,
        OutSignalName => "Q",
        OutTemp => Results(1),
        Paths => (  0 => (PRN_ipd'last_event, tpd_PRN_Q_negedge, TRUE),
                    1 => (CLRN_ipd'last_event, tpd_CLRN_Q_negedge, TRUE),
                    2 => (CLK_ipd'last_event, tpd_CLK_Q_posedge, TRUE)),
        GlitchData => Q_VitalGlitchData,
        Mode => DefGlitchMode,
        XOn  => XOn,
        MsgOn        => MsgOn );

    end process;

end behave;

--
--
--  twentynm_mux21 Model
--
--

LIBRARY IEEE;
use ieee.std_logic_1164.all;
use IEEE.VITAL_Timing.all;
use work.twentynm_atom_pack.all;

entity twentynm_mux21 is
    generic(
        TimingChecksOn: Boolean := True;
        MsgOn: Boolean := DefGlitchMsgOn;
        XOn: Boolean := DefGlitchXOn;
        InstancePath: STRING := "*";
        tpd_A_MO                      :   VitalDelayType01 := DefPropDelay01;
        tpd_B_MO                      :   VitalDelayType01 := DefPropDelay01;
        tpd_S_MO                      :   VitalDelayType01 := DefPropDelay01;
        tipd_A                       :    VitalDelayType01 := DefPropDelay01;
        tipd_B                       :    VitalDelayType01 := DefPropDelay01;
        tipd_S                       :    VitalDelayType01 := DefPropDelay01);
    port (
        A : in std_logic := '0';
        B : in std_logic := '0';
        S : in std_logic := '0';
        MO : out std_logic);
    attribute VITAL_LEVEL0 of twentynm_mux21 : entity is TRUE;
end twentynm_mux21;

architecture AltVITAL of twentynm_mux21 is
    attribute VITAL_LEVEL0 of AltVITAL : architecture is TRUE;

    signal A_ipd, B_ipd, S_ipd  : std_logic;

begin

    ---------------------
    --  INPUT PATH DELAYs
    ---------------------
    WireDelay : block
    begin
        VitalWireDelay (A_ipd, A, tipd_A);
        VitalWireDelay (B_ipd, B, tipd_B);
        VitalWireDelay (S_ipd, S, tipd_S);
    end block;

    --------------------
    --  BEHAVIOR SECTION
    --------------------
    VITALBehavior : process (A_ipd, B_ipd, S_ipd)

    -- output glitch detection variables
    VARIABLE MO_GlitchData       : VitalGlitchDataType;

    variable tmp_MO : std_logic;
    begin
        -------------------------
        --  Functionality Section
        -------------------------
        if (S_ipd = '1') then
            tmp_MO := B_ipd;
        else
            tmp_MO := A_ipd;
        end if;

        ----------------------
        --  Path Delay Section
        ----------------------
        VitalPathDelay01 (
        OutSignal => MO,
        OutSignalName => "MO",
        OutTemp => tmp_MO,
        Paths => (  0 => (A_ipd'last_event, tpd_A_MO, TRUE),
                    1 => (B_ipd'last_event, tpd_B_MO, TRUE),
                    2 => (S_ipd'last_event, tpd_S_MO, TRUE)),
        GlitchData => MO_GlitchData,
        Mode => DefGlitchMode,
        XOn  => XOn,
        MsgOn        => MsgOn );

    end process;
end AltVITAL;

--
--
--  twentynm_mux41 Model
--
--

LIBRARY IEEE;
use ieee.std_logic_1164.all;
use IEEE.VITAL_Timing.all;
use work.twentynm_atom_pack.all;

entity twentynm_mux41 is
    generic(
            TimingChecksOn: Boolean := True;
            MsgOn: Boolean := DefGlitchMsgOn;
            XOn: Boolean := DefGlitchXOn;
            InstancePath: STRING := "*";
            tpd_IN0_MO : VitalDelayType01 := DefPropDelay01;
            tpd_IN1_MO : VitalDelayType01 := DefPropDelay01;
            tpd_IN2_MO : VitalDelayType01 := DefPropDelay01;
            tpd_IN3_MO : VitalDelayType01 := DefPropDelay01;
            tpd_S_MO : VitalDelayArrayType01(1 downto 0) := (OTHERS => DefPropDelay01);
            tipd_IN0 : VitalDelayType01 := DefPropDelay01;
            tipd_IN1 : VitalDelayType01 := DefPropDelay01;
            tipd_IN2 : VitalDelayType01 := DefPropDelay01;
            tipd_IN3 : VitalDelayType01 := DefPropDelay01;
            tipd_S : VitalDelayArrayType01(1 downto 0) := (OTHERS => DefPropDelay01)
        );
    port (
            IN0 : in std_logic := '0';
            IN1 : in std_logic := '0';
            IN2 : in std_logic := '0';
            IN3 : in std_logic := '0';
            S : in std_logic_vector(1 downto 0) := (OTHERS => '0');
            MO : out std_logic
        );
    attribute VITAL_LEVEL0 of twentynm_mux41 : entity is TRUE;
end twentynm_mux41;

architecture AltVITAL of twentynm_mux41 is
    attribute VITAL_LEVEL0 of AltVITAL : architecture is TRUE;

    signal IN0_ipd, IN1_ipd, IN2_ipd, IN3_ipd  : std_logic;
    signal S_ipd : std_logic_vector(1 downto 0);

begin

    ---------------------
    --  INPUT PATH DELAYs
    ---------------------
    WireDelay : block
    begin
        VitalWireDelay (IN0_ipd, IN0, tipd_IN0);
        VitalWireDelay (IN1_ipd, IN1, tipd_IN1);
        VitalWireDelay (IN2_ipd, IN2, tipd_IN2);
        VitalWireDelay (IN3_ipd, IN3, tipd_IN3);
        VitalWireDelay (S_ipd(0), S(0), tipd_S(0));
        VitalWireDelay (S_ipd(1), S(1), tipd_S(1));
    end block;

    --------------------
    --  BEHAVIOR SECTION
    --------------------
    VITALBehavior : process (IN0_ipd, IN1_ipd, IN2_ipd, IN3_ipd, S_ipd(0), S_ipd(1))

    -- output glitch detection variables
    VARIABLE MO_GlitchData       : VitalGlitchDataType;

    variable tmp_MO : std_logic;
    begin
        -------------------------
        --  Functionality Section
        -------------------------
        if ((S_ipd(1) = '1') AND (S_ipd(0) = '1')) then
            tmp_MO := IN3_ipd;
        elsif ((S_ipd(1) = '1') AND (S_ipd(0) = '0')) then
            tmp_MO := IN2_ipd;
        elsif ((S_ipd(1) = '0') AND (S_ipd(0) = '1')) then
            tmp_MO := IN1_ipd;
        else
            tmp_MO := IN0_ipd;
        end if;

        ----------------------
        --  Path Delay Section
        ----------------------
        VitalPathDelay01 (
                        OutSignal => MO,
                        OutSignalName => "MO",
                        OutTemp => tmp_MO,
                        Paths => (  0 => (IN0_ipd'last_event, tpd_IN0_MO, TRUE),
                                    1 => (IN1_ipd'last_event, tpd_IN1_MO, TRUE),
                                    2 => (IN2_ipd'last_event, tpd_IN2_MO, TRUE),
                                    3 => (IN3_ipd'last_event, tpd_IN3_MO, TRUE),
                                    4 => (S_ipd(0)'last_event, tpd_S_MO(0), TRUE),
                                    5 => (S_ipd(1)'last_event, tpd_S_MO(1), TRUE)),
                        GlitchData => MO_GlitchData,
                        Mode => DefGlitchMode,
                        XOn  => XOn,
                        MsgOn => MsgOn );

    end process;
end AltVITAL;

--
--
--  twentynm_and1 Model
--
--
LIBRARY IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.VITAL_Timing.all;
use work.twentynm_atom_pack.all;

-- entity declaration --
entity twentynm_and1 is
    generic(
        TimingChecksOn: Boolean := True;
        MsgOn: Boolean := DefGlitchMsgOn;
        XOn: Boolean := DefGlitchXOn;
        InstancePath: STRING := "*";
        tpd_IN1_Y                      :  VitalDelayType01 := DefPropDelay01;
        tipd_IN1                       :  VitalDelayType01 := DefPropDelay01);

    port(
        Y                              :  out   STD_LOGIC;
        IN1                            :  in    STD_LOGIC);
    attribute VITAL_LEVEL0 of twentynm_and1 : entity is TRUE;
end twentynm_and1;

-- architecture body --

architecture AltVITAL of twentynm_and1 is
    attribute VITAL_LEVEL0 of AltVITAL : architecture is TRUE;

    SIGNAL IN1_ipd    : STD_ULOGIC := 'U';

begin

    ---------------------
    --  INPUT PATH DELAYs
    ---------------------
    WireDelay : block
    begin
    VitalWireDelay (IN1_ipd, IN1, tipd_IN1);
    end block;
    --------------------
    --  BEHAVIOR SECTION
    --------------------
    VITALBehavior : process (IN1_ipd)


    -- functionality results
    VARIABLE Results : STD_LOGIC_VECTOR(1 to 1) := (others => 'X');
    ALIAS Y_zd : STD_ULOGIC is Results(1);

    -- output glitch detection variables
    VARIABLE Y_GlitchData    : VitalGlitchDataType;

    begin

        -------------------------
        --  Functionality Section
        -------------------------
        Y_zd := TO_X01(IN1_ipd);

        ----------------------
        --  Path Delay Section
        ----------------------
        VitalPathDelay01 (
            OutSignal => Y,
            OutSignalName => "Y",
            OutTemp => Y_zd,
            Paths => (0 => (IN1_ipd'last_event, tpd_IN1_Y, TRUE)),
            GlitchData => Y_GlitchData,
            Mode => DefGlitchMode,
            XOn  => XOn,
            MsgOn        => MsgOn );

    end process;
end AltVITAL;
---------------------------------------------------------------------
--
-- Entity Name :  twentynm_ff
-- 
-- Description :  Stratix III FF VHDL simulation model
--  
--
---------------------------------------------------------------------
LIBRARY IEEE;
use IEEE.std_logic_1164.all;
use IEEE.VITAL_Timing.all;
use IEEE.VITAL_Primitives.all;
use work.twentynm_atom_pack.all;
use work.twentynm_and1;

entity twentynm_ff is
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
   attribute VITAL_LEVEL0 of twentynm_ff : entity is TRUE;
end twentynm_ff;
        
architecture vital_lcell_ff of twentynm_ff is
   attribute VITAL_LEVEL0 of vital_lcell_ff : architecture is TRUE;
   signal clk_ipd : std_logic;
   signal d_ipd : std_logic;
   signal d_dly : std_logic;
   signal asdata_ipd : std_logic;
   signal asdata_dly : std_logic;
   signal asdata_dly1 : std_logic;
   signal sclr_ipd : std_logic;
   signal sload_ipd : std_logic;
   signal clrn_ipd : std_logic;
   signal aload_ipd : std_logic;
   signal ena_ipd : std_logic;

component twentynm_and1
    generic (XOn                  : Boolean := DefGlitchXOn;
             MsgOn                : Boolean := DefGlitchMsgOn;
             tpd_IN1_Y            : VitalDelayType01 := DefPropDelay01;
             tipd_IN1             : VitalDelayType01 := DefPropDelay01
            );
        
    port    (Y                    :  out   STD_LOGIC;
             IN1                  :  in    STD_LOGIC
            );
end component;

begin

ddelaybuffer: twentynm_and1
                   port map(IN1 => d_ipd,
                            Y => d_dly);

asdatadelaybuffer: twentynm_and1
                   port map(IN1 => asdata_ipd,
                            Y => asdata_dly);

asdatadelaybuffer1: twentynm_and1
                   port map(IN1 => asdata_dly,
                            Y => asdata_dly1);


    ---------------------
    --  INPUT PATH DELAYs
    ---------------------
    WireDelay : block
    begin
        VitalWireDelay (clk_ipd, clk, tipd_clk);
        VitalWireDelay (d_ipd, d, tipd_d);
        VitalWireDelay (asdata_ipd, asdata, tipd_asdata);
        VitalWireDelay (sclr_ipd, sclr, tipd_sclr);
        VitalWireDelay (sload_ipd, sload, tipd_sload);
        VitalWireDelay (clrn_ipd, clrn, tipd_clrn);
        VitalWireDelay (aload_ipd, aload, tipd_aload);
        VitalWireDelay (ena_ipd, ena, tipd_ena);
    end block;

    VITALtiming : process (clk_ipd, d_dly, asdata_dly1,
                           sclr_ipd, sload_ipd, clrn_ipd, aload_ipd,
                           ena_ipd, devclrn, devpor)
    
    variable Tviol_d_clk : std_ulogic := '0';
    variable Tviol_asdata_clk : std_ulogic := '0';
    variable Tviol_sclr_clk : std_ulogic := '0';
    variable Tviol_sload_clk : std_ulogic := '0';
    variable Tviol_ena_clk : std_ulogic := '0';
    variable TimingData_d_clk : VitalTimingDataType := VitalTimingDataInit;
    variable TimingData_asdata_clk : VitalTimingDataType := VitalTimingDataInit;
    variable TimingData_sclr_clk : VitalTimingDataType := VitalTimingDataInit;
    variable TimingData_sload_clk : VitalTimingDataType := VitalTimingDataInit;
    variable TimingData_ena_clk : VitalTimingDataType := VitalTimingDataInit;
    variable q_VitalGlitchData : VitalGlitchDataType;
    
    variable iq : std_logic := '0';
    variable idata: std_logic := '0';
    
    -- variables for 'X' generation
    variable violation : std_logic := '0';
    
    begin
      
        if (now = 0 ns) then
            if (power_up = "low") then
                iq := '0';
            elsif (power_up = "high") then
                iq := '1';
            end if;
        end if;

        ------------------------
        --  Timing Check Section
        ------------------------
        if (TimingChecksOn) then
        
            VitalSetupHoldCheck (
                Violation       => Tviol_d_clk,
                TimingData      => TimingData_d_clk,
                TestSignal      => d,
                TestSignalName  => "DATAIN",
                RefSignal       => clk_ipd,
                RefSignalName   => "CLK",
                SetupHigh       => tsetup_d_clk_noedge_posedge,
                SetupLow        => tsetup_d_clk_noedge_posedge,
                HoldHigh        => thold_d_clk_noedge_posedge,
                HoldLow         => thold_d_clk_noedge_posedge,
                CheckEnabled    => TO_X01((NOT clrn_ipd) OR
                                          (sload_ipd) OR
                                          (sclr_ipd) OR
                                          (NOT devpor) OR
                                          (NOT devclrn) OR
                                          (NOT ena_ipd)) /= '1',
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/LCELL_FF",
                XOn             => XOnChecks,
                MsgOn           => MsgOnChecks );
            
            VitalSetupHoldCheck (
                Violation       => Tviol_asdata_clk,
                TimingData      => TimingData_asdata_clk,
                TestSignal      => asdata_ipd,
                TestSignalName  => "ASDATA",
                RefSignal       => clk_ipd,
                RefSignalName   => "CLK",
                SetupHigh       => tsetup_asdata_clk_noedge_posedge,
                SetupLow        => tsetup_asdata_clk_noedge_posedge,
                HoldHigh        => thold_asdata_clk_noedge_posedge,
                HoldLow         => thold_asdata_clk_noedge_posedge,
                CheckEnabled    => TO_X01((NOT clrn_ipd) OR
                                          (NOT sload_ipd) OR
                                          (NOT devpor) OR
                                          (NOT devclrn) OR
                                          (NOT ena_ipd)) /= '1',
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/LCELL_FF",
                XOn             => XOnChecks,
                MsgOn           => MsgOnChecks );
    
            VitalSetupHoldCheck (
                Violation       => Tviol_sclr_clk,
                TimingData      => TimingData_sclr_clk,
                TestSignal      => sclr_ipd,
                TestSignalName  => "SCLR",
                RefSignal       => clk_ipd,
                RefSignalName   => "CLK",
                SetupHigh       => tsetup_sclr_clk_noedge_posedge,
                SetupLow        => tsetup_sclr_clk_noedge_posedge,
                HoldHigh        => thold_sclr_clk_noedge_posedge,
                HoldLow         => thold_sclr_clk_noedge_posedge,
                CheckEnabled    => TO_X01((NOT clrn_ipd) OR
                                          (NOT devpor) OR
                                          (NOT devclrn) OR
                                          (NOT ena_ipd)) /= '1',
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/LCELL_FF",
                XOn             => XOnChecks,
                MsgOn           => MsgOnChecks );
            
            VitalSetupHoldCheck (
                Violation       => Tviol_sload_clk,
                TimingData      => TimingData_sload_clk,
                TestSignal      => sload_ipd,
                TestSignalName  => "SLOAD",
                RefSignal       => clk_ipd,
                RefSignalName   => "CLK",
                SetupHigh       => tsetup_sload_clk_noedge_posedge,
                SetupLow        => tsetup_sload_clk_noedge_posedge,
                HoldHigh        => thold_sload_clk_noedge_posedge,
                HoldLow         => thold_sload_clk_noedge_posedge,
                CheckEnabled    => TO_X01((NOT clrn_ipd) OR
                                          (NOT devpor) OR
                                          (NOT devclrn) OR
                                          (NOT ena_ipd)) /= '1',
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/LCELL_FF",
                XOn             => XOnChecks,
                MsgOn           => MsgOnChecks );
        
            VitalSetupHoldCheck (
                Violation       => Tviol_ena_clk,
                TimingData      => TimingData_ena_clk,
                TestSignal      => ena_ipd,
                TestSignalName  => "ENA",
                RefSignal       => clk_ipd,
                RefSignalName   => "CLK",
                SetupHigh       => tsetup_ena_clk_noedge_posedge,
                SetupLow        => tsetup_ena_clk_noedge_posedge,
                HoldHigh        => thold_ena_clk_noedge_posedge,
                HoldLow         => thold_ena_clk_noedge_posedge,
                CheckEnabled    => TO_X01((NOT clrn_ipd) OR
                                          (NOT devpor) OR
                                          (NOT devclrn) ) /= '1',
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/LCELL_FF",
                XOn             => XOnChecks,
                MsgOn           => MsgOnChecks );
    
        end if;
    
        violation := Tviol_d_clk or Tviol_asdata_clk or 
                     Tviol_sclr_clk or Tviol_sload_clk or Tviol_ena_clk;
    
    
        if ((devpor = '0') or (devclrn = '0') or (clrn_ipd = '0'))  then
            iq := '0';
        elsif (aload_ipd = '1') then
            iq := asdata_dly1;
        elsif (violation = 'X' and x_on_violation = "on") then
            iq := 'X';
        elsif clk_ipd'event and clk_ipd = '1' and clk_ipd'last_value = '0' then
            if (ena_ipd = '1') then
                if (sclr_ipd = '1') then
                    iq := '0';
                elsif (sload_ipd = '1') then
                    iq := asdata_dly1;
                else
                    iq := d_dly;
                end if;
            end if;
        end if;
    
        ----------------------
        --  Path Delay Section
        ----------------------
        VitalPathDelay01 (
            OutSignal => q,
            OutSignalName => "Q",
            OutTemp => iq,
            Paths => (0 => (clrn_ipd'last_event, tpd_clrn_q_posedge, TRUE),
                      1 => (aload_ipd'last_event, tpd_aload_q_posedge, TRUE),
                      2 => (asdata_ipd'last_event, tpd_asdata_q, TRUE),
                      3 => (clk_ipd'last_event, tpd_clk_q_posedge, TRUE)),
            GlitchData => q_VitalGlitchData,
            Mode => DefGlitchMode,
            XOn  => XOn,
            MsgOn  => MsgOn );
    
    end process;

end vital_lcell_ff;	

---------------------------------------------------------------------
--
-- Entity Name :  twentynm_lcell_comb
-- 
-- Description :  Stratix II LCELL_COMB VHDL simulation model
--  
--
---------------------------------------------------------------------

LIBRARY IEEE;
use IEEE.std_logic_1164.all;
use IEEE.VITAL_Timing.all;
use IEEE.VITAL_Primitives.all;
use work.twentynm_atom_pack.all;

entity twentynm_lcell_comb is
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
   attribute VITAL_LEVEL0 of twentynm_lcell_comb : entity is TRUE;
end twentynm_lcell_comb;
        
architecture vital_lcell_comb of twentynm_lcell_comb is
    attribute VITAL_LEVEL0 of vital_lcell_comb : architecture is TRUE;
    signal dataa_ipd : std_logic;
    signal datab_ipd : std_logic;
    signal datac_ipd : std_logic;
    signal datad_ipd : std_logic;
    signal datae_ipd : std_logic;
    signal dataf_ipd : std_logic;
    signal datag_ipd : std_logic;
    signal cin_ipd : std_logic;
    signal sharein_ipd : std_logic;
    signal f2_input3 : std_logic;
    -- sub masks
    signal f0_mask : std_logic_vector(15 downto 0);
    signal f1_mask : std_logic_vector(15 downto 0);
    signal f2_mask : std_logic_vector(15 downto 0);
    signal f3_mask : std_logic_vector(15 downto 0);
begin

    ---------------------
    --  INPUT PATH DELAYs
    ---------------------
    WireDelay : block
    begin
        VitalWireDelay (dataa_ipd, dataa, tipd_dataa);
        VitalWireDelay (datab_ipd, datab, tipd_datab);
        VitalWireDelay (datac_ipd, datac, tipd_datac);
        VitalWireDelay (datad_ipd, datad, tipd_datad);
        VitalWireDelay (datae_ipd, datae, tipd_datae);
        VitalWireDelay (dataf_ipd, dataf, tipd_dataf);
        VitalWireDelay (datag_ipd, datag, tipd_datag);
        VitalWireDelay (cin_ipd, cin, tipd_cin);
        VitalWireDelay (sharein_ipd, sharein, tipd_sharein);
    end block;

    f0_mask <= lut_mask(15 downto 0);
    f1_mask <= lut_mask(31 downto 16);
    f2_mask <= lut_mask(47 downto 32);
    f3_mask <= lut_mask(63 downto 48);

    f2_input3 <= datag_ipd WHEN (extended_lut = "on") ELSE datac_ipd;

VITALtiming : process(dataa_ipd, datab_ipd, datac_ipd, datad_ipd,
                      datae_ipd, dataf_ipd, f2_input3, cin_ipd, 
                      sharein_ipd)

variable combout_VitalGlitchData : VitalGlitchDataType;
variable sumout_VitalGlitchData : VitalGlitchDataType;
variable cout_VitalGlitchData : VitalGlitchDataType;
variable shareout_VitalGlitchData : VitalGlitchDataType;
-- sub lut outputs
variable f0_out : std_logic;
variable f1_out : std_logic;
variable f2_out : std_logic;
variable f3_out : std_logic;
-- muxed output
variable g0_out : std_logic;
variable g1_out : std_logic;
-- internal variables
variable f2_f : std_logic;
variable adder_input2 : std_logic;
-- output variables
variable combout_tmp : std_logic;
variable sumout_tmp : std_logic;
variable cout_tmp : std_logic;
-- temp variable for NCVHDL
variable lut_mask_var : std_logic_vector(63 downto 0) := (OTHERS => '1');

begin
  
    lut_mask_var := lut_mask;

    ------------------------
    --  Timing Check Section
    ------------------------

    f0_out := VitalMUX(data => f0_mask,
                       dselect => (datad_ipd,
                                   datac_ipd,
                                   datab_ipd,
                                   dataa_ipd));
    f1_out := VitalMUX(data => f1_mask,
                       dselect => (datad_ipd,
                                   f2_input3,
                                   datab_ipd,
                                   dataa_ipd));
    f2_out := VitalMUX(data => f2_mask,
                       dselect => (datad_ipd,
                                   datac_ipd,
                                   datab_ipd,
                                   dataa_ipd));
    f3_out := VitalMUX(data => f3_mask,
                       dselect => (datad_ipd,
                                   f2_input3,
                                   datab_ipd,
                                   dataa_ipd));
    
    -- combout 
    if (extended_lut = "on") then
        if (datae_ipd = '0') then
            g0_out := f0_out;
            g1_out := f2_out;
        elsif (datae_ipd = '1') then
            g0_out := f1_out;
            g1_out := f3_out;
        else
            g0_out := 'X';
            g1_out := 'X';
        end if;

        if (dataf_ipd = '0') then
            combout_tmp := g0_out;
        elsif ((dataf_ipd = '1')  or (g0_out = g1_out))then
            combout_tmp := g1_out;
        else
            combout_tmp := 'X';
        end if;
    else
        combout_tmp := VitalMUX(data => lut_mask_var,
                                dselect => (dataf_ipd,
                                            datae_ipd,
                                            datad_ipd,
                                            datac_ipd,
                                            datab_ipd,
                                            dataa_ipd));
    end if;

    -- sumout and cout
    f2_f := VitalMUX(data => f2_mask,
                     dselect => (dataf_ipd,
                                 datac_ipd,
                                 datab_ipd,
                                 dataa_ipd));

    if (shared_arith = "on") then
        adder_input2 := sharein_ipd;
    else
        adder_input2 := NOT f2_f;
    end if;

    sumout_tmp := cin_ipd XOR f0_out XOR adder_input2;
    cout_tmp := (cin_ipd AND f0_out) OR (cin_ipd AND adder_input2) OR
                (f0_out AND adder_input2);

    ----------------------
    --  Path Delay Section
    ----------------------

    VitalPathDelay01 (
        OutSignal => combout,
        OutSignalName => "COMBOUT",
        OutTemp => combout_tmp,
        Paths => (0 => (dataa_ipd'last_event, tpd_dataa_combout, TRUE),
                  1 => (datab_ipd'last_event, tpd_datab_combout, TRUE),
                  2 => (datac_ipd'last_event, tpd_datac_combout, TRUE),
                  3 => (datad_ipd'last_event, tpd_datad_combout, TRUE),
                  4 => (datae_ipd'last_event, tpd_datae_combout, TRUE),
                  5 => (dataf_ipd'last_event, tpd_dataf_combout, TRUE),
                  6 => (datag_ipd'last_event, tpd_datag_combout, TRUE)),
        GlitchData => combout_VitalGlitchData,
        Mode => DefGlitchMode,
        XOn  => XOn,
        MsgOn => MsgOn );

    VitalPathDelay01 (
        OutSignal => sumout,
        OutSignalName => "SUMOUT",
        OutTemp => sumout_tmp,
        Paths => (0 => (dataa_ipd'last_event, tpd_dataa_sumout, TRUE),
                  1 => (datab_ipd'last_event, tpd_datab_sumout, TRUE),
                  2 => (datac_ipd'last_event, tpd_datac_sumout, TRUE),
                  3 => (datad_ipd'last_event, tpd_datad_sumout, TRUE),
                  4 => (dataf_ipd'last_event, tpd_dataf_sumout, TRUE),
                  5 => (cin_ipd'last_event, tpd_cin_sumout, TRUE),
                  6 => (sharein_ipd'last_event, tpd_sharein_sumout, TRUE)),
        GlitchData => sumout_VitalGlitchData,
        Mode => DefGlitchMode,
        XOn  => XOn,
        MsgOn => MsgOn );

    VitalPathDelay01 (
        OutSignal => cout,
        OutSignalName => "COUT",
        OutTemp => cout_tmp,
        Paths => (0 => (dataa_ipd'last_event, tpd_dataa_cout, TRUE),
                  1 => (datab_ipd'last_event, tpd_datab_cout, TRUE),
                  2 => (datac_ipd'last_event, tpd_datac_cout, TRUE),
                  3 => (datad_ipd'last_event, tpd_datad_cout, TRUE),
                  4 => (dataf_ipd'last_event, tpd_dataf_cout, TRUE),
                  5 => (cin_ipd'last_event, tpd_cin_cout, TRUE),
                  6 => (sharein_ipd'last_event, tpd_sharein_cout, TRUE)),
        GlitchData => cout_VitalGlitchData,
        Mode => DefGlitchMode,
        XOn  => XOn,
        MsgOn => MsgOn );

    VitalPathDelay01 (
        OutSignal => shareout,
        OutSignalName => "SHAREOUT",
        OutTemp => f2_out,
        Paths => (0 => (dataa_ipd'last_event, tpd_dataa_shareout, TRUE),
                  1 => (datab_ipd'last_event, tpd_datab_shareout, TRUE),
                  2 => (datac_ipd'last_event, tpd_datac_shareout, TRUE),
                  3 => (datad_ipd'last_event, tpd_datad_shareout, TRUE)),
        GlitchData => shareout_VitalGlitchData,
        Mode => DefGlitchMode,
        XOn  => XOn,
        MsgOn => MsgOn );

end process;

end vital_lcell_comb;	


---------------------------------------------------------------------
--
-- Entity Name :  twentynm_routing_wire
--
-- Description :  StratixII Routing Wire VHDL simulation model
--
--
---------------------------------------------------------------------

LIBRARY IEEE;
use IEEE.std_logic_1164.all;
use IEEE.VITAL_Timing.all;
use IEEE.VITAL_Primitives.all;
use work.twentynm_atom_pack.all;

ENTITY twentynm_routing_wire is
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
   attribute VITAL_LEVEL0 of twentynm_routing_wire : entity is TRUE;
end twentynm_routing_wire;

ARCHITECTURE behave of twentynm_routing_wire is
attribute VITAL_LEVEL0 of behave : architecture is TRUE;
signal datain_ipd : std_logic;
signal datainglitch_inert : std_logic;
begin
    ---------------------
    --  INPUT PATH DELAYs
    ---------------------
    WireDelay : block
    begin
        VitalWireDelay (datain_ipd, datain, tipd_datain);
    end block;

    VITAL: process(datain_ipd, datainglitch_inert)
    variable datain_inert_VitalGlitchData : VitalGlitchDataType;
    variable dataout_VitalGlitchData : VitalGlitchDataType;

    begin
        ----------------------
        --  Path Delay Section
        ----------------------
        VitalPathDelay01 (
            OutSignal => datainglitch_inert,
            OutSignalName => "datainglitch_inert",
            OutTemp => datain_ipd,
            Paths => (1 => (datain_ipd'last_event, tpd_datainglitch_dataout, TRUE)),
            GlitchData => datain_inert_VitalGlitchData,
            Mode => VitalInertial,
            XOn  => XOn,
            MsgOn  => MsgOn );
    
        VitalPathDelay01 (
            OutSignal => dataout,
            OutSignalName => "dataout",
            OutTemp => datainglitch_inert,
            Paths => (1 => (datain_ipd'last_event, tpd_datain_dataout, TRUE)),
            GlitchData => dataout_VitalGlitchData,
            Mode => DefGlitchMode,
            XOn  => XOn,
            MsgOn  => MsgOn );

    end process;

end behave;
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

LIBRARY altera_lnsim;
use altera_lnsim.altera_lnsim_components.all;
ENTITY twentynm_ram_block IS
    GENERIC (
        -- -------- GLOBAL PARAMETERS ---------
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
    -- -------- PORT DECLARATIONS ---------
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

END twentynm_ram_block;

ARCHITECTURE block_arch OF twentynm_ram_block IS

BEGIN

inst : generic_m20k 
    generic map (
        operation_mode                 =>        operation_mode,
        mixed_port_feed_through_mode   =>        mixed_port_feed_through_mode,
        ram_block_type                 =>        ram_block_type,
        logical_ram_name               =>        logical_ram_name,
        init_file                      =>        init_file,
        init_file_layout               =>        init_file_layout,
        ecc_pipeline_stage_enabled     =>        ecc_pipeline_stage_enabled,
        enable_ecc                     =>        enable_ecc,
        width_eccstatus                =>        width_eccstatus,
        data_interleave_width_in_bits  =>        data_interleave_width_in_bits,
        data_interleave_offset_in_bits =>        data_interleave_offset_in_bits,
        port_a_logical_ram_depth       =>        port_a_logical_ram_depth,
        port_a_logical_ram_width       =>        port_a_logical_ram_width,
        port_a_first_address           =>        port_a_first_address,
        port_a_last_address            =>        port_a_last_address,
        port_a_first_bit_number        =>        port_a_first_bit_number,
        port_a_data_out_clear          =>        port_a_data_out_clear,
        port_a_data_out_clock          =>        port_a_data_out_clock,
        port_a_data_width              =>        port_a_data_width,
        port_a_address_width           =>        port_a_address_width,
        port_a_byte_enable_mask_width  =>        port_a_byte_enable_mask_width,
        port_b_logical_ram_depth       =>        port_b_logical_ram_depth,
        port_b_logical_ram_width       =>        port_b_logical_ram_width,
        port_b_first_address           =>        port_b_first_address,
        port_b_last_address            =>        port_b_last_address,
        port_b_first_bit_number        =>        port_b_first_bit_number,
        port_b_address_clear           =>        port_b_address_clear,
        port_b_data_out_clear          =>        port_b_data_out_clear,
        port_b_data_in_clock           =>        port_b_data_in_clock,
        port_b_address_clock           =>        port_b_address_clock,
        port_b_write_enable_clock      =>        port_b_write_enable_clock,
        port_b_read_enable_clock       =>        port_b_read_enable_clock,
        port_b_byte_enable_clock       =>        port_b_byte_enable_clock,
        port_b_data_out_clock          =>        port_b_data_out_clock,
        port_b_data_width              =>        port_b_data_width,
        port_b_address_width           =>        port_b_address_width,
        port_b_byte_enable_mask_width  =>        port_b_byte_enable_mask_width,
        port_a_read_during_write_mode  =>        port_a_read_during_write_mode,
        port_b_read_during_write_mode  =>        port_b_read_during_write_mode,
        power_up_uninitialized         =>        power_up_uninitialized,
        lpm_type                       =>        lpm_type,
        lpm_hint                       =>        lpm_hint,
        connectivity_checking          =>        connectivity_checking,
        mem_init0                      =>        mem_init0,
        mem_init1                      =>        mem_init1,
        mem_init2                      =>        mem_init2,
        mem_init3                      =>        mem_init3,
        mem_init4                      =>        mem_init4,
        mem_init5                      =>        mem_init5,
        mem_init6                      =>        mem_init6,
        mem_init7                      =>        mem_init7,
        mem_init8                      =>        mem_init8,
        mem_init9                      =>        mem_init9,
        port_a_byte_size               =>        port_a_byte_size,
        port_b_byte_size               =>        port_b_byte_size,
        clk0_input_clock_enable        =>        clk0_input_clock_enable,
        clk0_core_clock_enable         =>        clk0_core_clock_enable,
        clk0_output_clock_enable       =>        clk0_output_clock_enable,
        clk1_input_clock_enable        =>        clk1_input_clock_enable,
        clk1_core_clock_enable         =>        clk1_core_clock_enable,
        clk1_output_clock_enable       =>        clk1_output_clock_enable,
        bist_ena                       =>        bist_ena,
        port_a_address_clear           =>        port_a_address_clear,
        port_a_data_in_clock           =>        port_a_data_in_clock,
        port_a_address_clock           =>        port_a_address_clock,
        port_a_write_enable_clock      =>        port_a_write_enable_clock,
        port_a_byte_enable_clock       =>        port_a_byte_enable_clock,
        port_a_read_enable_clock       =>        port_a_read_enable_clock
    )
    port map (
        portadatain     =>        portadatain    ,
        portaaddr       =>        portaaddr      ,
        portawe         =>        portawe        ,
        portare         =>        portare        ,
        portbdatain     =>        portbdatain    ,
        portbaddr       =>        portbaddr      ,
        portbwe         =>        portbwe        ,
        portbre         =>        portbre        ,
        clk0            =>        clk0           ,
        clk1            =>        clk1           ,
        ena0            =>        ena0           ,
        ena1            =>        ena1           ,
        ena2            =>        ena2           ,
        ena3            =>        ena3           ,
        clr0            =>        clr0           ,
        clr1            =>        clr1           ,
        nerror          =>        nerror         ,
        portabyteenamasks =>        portabyteenamasks,
        portbbyteenamasks =>        portbbyteenamasks,
        portaaddrstall  =>        portaaddrstall ,
        portbaddrstall  =>        portbaddrstall ,
        devclrn         =>        devclrn        ,
        devpor          =>        devpor         ,
        eccstatus       =>        eccstatus      ,
        portadataout    =>        portadataout   ,
        portbdataout    =>        portbdataout   ,
        dftout          =>        dftout
    );

END block_arch;


----------------------------------------------------------------------------
-- Entity Name     : twentynm_mlab_cell
-- Description     : LUTRAM VHDL Simulation Model
----------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;
USE work.twentynm_atom_pack.all;

LIBRARY altera_lnsim;
use altera_lnsim.altera_lnsim_components.all;

ENTITY twentynm_mlab_cell IS
   GENERIC (
      -- -------- GLOBAL PARAMETERS ---------      
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
      -- -------- PORT DECLARATIONS ---------
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
END twentynm_mlab_cell;

ARCHITECTURE trans OF twentynm_mlab_cell IS

BEGIN

inst : generic_28nm_lc_mlab_cell_impl
    generic map (
      logical_ram_name              => logical_ram_name              ,
      logical_ram_depth             => logical_ram_depth             ,
      logical_ram_width             => logical_ram_width             ,
      first_address                 => first_address                 ,
      last_address                  => last_address                  ,
      first_bit_number              => first_bit_number              ,
      init_file                     => init_file                     ,
      data_width                    => data_width                    ,
      address_width                 => address_width                 ,
      byte_enable_mask_width        => byte_enable_mask_width        ,
      byte_size                     => byte_size                     ,
      port_b_data_out_clock         => port_b_data_out_clock         ,
      port_b_data_out_clear         => port_b_data_out_clear         ,
      lpm_type                      => lpm_type                      ,
      lpm_hint                      => lpm_hint                      ,
      mem_init0                     => mem_init0                     ,
      mixed_port_feed_through_mode  => mixed_port_feed_through_mode  
   )
   port map (
      portadatain                   => portadatain                   ,
      portaaddr                     => portaaddr                     ,
      portabyteenamasks             => portabyteenamasks             ,
      portbaddr                     => portbaddr                     ,
      clk0                          => clk0                          ,
      clk1                          => clk1                          ,
      ena0                          => ena0                          ,
      ena1                          => ena1                          ,
      ena2                          => ena2                          ,
      clr                           => clr                           ,
      devclrn                       => devclrn                       ,
      devpor                        => devpor                        ,
      portbdataout                  => portbdataout                  
   );

          
END trans;
---------------------------------------------------------------------
--
-- Entity Name :  twentynm_io_ibuf
-- 
-- Description :  Twentynm IO Ibuf VHDL simulation model
--  
--
---------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.VITAL_Timing.all;
use IEEE.VITAL_Primitives.all;
use work.twentynm_atom_pack.all;

ENTITY twentynm_io_ibuf IS
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
END twentynm_io_ibuf;

ARCHITECTURE arch OF twentynm_io_ibuf IS
    SIGNAL i_ipd    : std_logic := '0';   
    SIGNAL ibar_ipd : std_logic := '0';     
    SIGNAL o_tmp    :  std_logic; 
    SIGNAL out_tmp    :  std_logic;
    SIGNAL prev_value : std_logic := '0'; 
    SIGNAL dynamicterminationcontrol_ipd : std_logic := '0';   
    SIGNAL seriesterminationcontrol_ipd    : std_logic_vector(15 DOWNTO 0) := (others => '0'); 
    SIGNAL parallelterminationcontrol_ipd    : std_logic_vector(15 DOWNTO 0) := (others => '0');   
BEGIN
    WireDelay : block
        begin                                                             
            VitalWireDelay (i_ipd, i, tipd_i);          
            VitalWireDelay (ibar_ipd, ibar, tipd_ibar);
	    VitalWireDelay (dynamicterminationcontrol_ipd, dynamicterminationcontrol, tipd_dynamicterminationcontrol);   
	    g1 :for i in seriesterminationcontrol'range generate
		    VitalWireDelay (seriesterminationcontrol_ipd(i), seriesterminationcontrol(i), tipd_seriesterminationcontrol(i));
	    end generate;
	    g2 :for i in parallelterminationcontrol'range generate                                                                         
		    VitalWireDelay (parallelterminationcontrol_ipd(i), parallelterminationcontrol(i), tipd_parallelterminationcontrol(i));     
	    end generate;     
end block;                                                        

    PROCESS(i_ipd, ibar_ipd)
        BEGIN                                             
            IF (differential_mode = "false") THEN         
                IF (i_ipd = '1') THEN                         
                    o_tmp <= '1'; 
                    prev_value <= '1';                            
                ELSIF (i_ipd = '0') THEN                                     
                    o_tmp <= '0';                               
                    prev_value <= '0';
                ELSE
                    o_tmp <= i_ipd;
                END IF;
            ELSE                                          
                IF (( i_ipd =  '0' ) and (ibar_ipd = '1')) then       
                        o_tmp <= '0';                             
                ELSIF (( i_ipd =  '1' ) and (ibar_ipd = '0')) then
                    o_tmp <= '1';                             
                ELSIF((( i_ipd =  '1' ) and (ibar_ipd = '1'))  or (( i_ipd =  '0' ) and (ibar_ipd = '0')))then    
                    o_tmp <= 'X';
                ELSE                                   
                    o_tmp <= 'X';                             
                END IF;                                   
            END IF;        
        END PROCESS;
                
    out_tmp <= prev_value when (bus_hold = "true") else 
                'Z' when((o_tmp = 'Z') AND (simulate_z_as = "Z")) else
                'X' when((o_tmp = 'Z') AND (simulate_z_as = "X")) else
                '1' when((o_tmp = 'Z') AND (simulate_z_as = "vcc")) else
                '0' when((o_tmp = 'Z') AND (simulate_z_as = "gnd")) else
                o_tmp;    
             ----------------------
             --  Path Delay Section
             ----------------------
    PROCESS( out_tmp)
        variable output_VitalGlitchData : VitalGlitchDataType;
    BEGIN                                                                             
        VitalPathDelay01 (                                                            
                           OutSignal => o,                                                 
                           OutSignalName => "o",                                           
                           OutTemp => out_tmp,                                               
                           Paths => (0 => (i_ipd'last_event, tpd_i_o, TRUE),             
                                     1 => (ibar_ipd'last_event, tpd_ibar_o, TRUE)),   
                           GlitchData => output_VitalGlitchData,                                
                           Mode => DefGlitchMode,                                                
                           XOn  => XOn,                                                          
                           MsgOn  => MsgOn                                            
                         );                                                           
    END PROCESS;
 END arch;
 
 
 
---------------------------------------------------------------------
--
-- Entity Name :  twentynm_io_obuf
-- 
-- Description :  Twentynm IO Obuf VHDL simulation model
--  
--
---------------------------------------------------------------------

LIBRARY IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.VITAL_Timing.all;
use IEEE.VITAL_Primitives.all;
use work.twentynm_atom_pack.all;

ENTITY twentynm_io_obuf IS
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
END twentynm_io_obuf;

ARCHITECTURE arch OF twentynm_io_obuf IS
    --INTERNAL Signals
    SIGNAL i_ipd                    : std_logic := '0'; 
    SIGNAL oe_ipd                   : std_logic := '0'; 
    SIGNAL dynamicterminationcontrol_ipd : std_logic := '0';   
    SIGNAL out_tmp                  :  std_logic := 'Z';   
    SIGNAL out_tmp_bar              :  std_logic;   
    SIGNAL prev_value               :  std_logic := '0';     
    SIGNAL o_tmp                    :  std_logic;    
    SIGNAL obar_tmp                 :  std_logic;  
    SIGNAL o_tmp1                    :  std_logic;    
    SIGNAL obar_tmp1                 :  std_logic;  
    SIGNAL seriesterminationcontrol_ipd    : std_logic_vector(15 DOWNTO 0) := (others => '0'); 
    SIGNAL parallelterminationcontrol_ipd    : std_logic_vector(15 DOWNTO 0) := (others => '0');   
 
BEGIN

WireDelay : block
    begin                                                             
        VitalWireDelay (i_ipd, i, tipd_i);          
        VitalWireDelay (oe_ipd, oe, tipd_oe); 
        VitalWireDelay (dynamicterminationcontrol_ipd, dynamicterminationcontrol, tipd_dynamicterminationcontrol);   
        g1 :for i in seriesterminationcontrol'range generate
            VitalWireDelay (seriesterminationcontrol_ipd(i), seriesterminationcontrol(i), tipd_seriesterminationcontrol(i));
        end generate;
        g2 :for i in parallelterminationcontrol'range generate                                                                         
            VitalWireDelay (parallelterminationcontrol_ipd(i), parallelterminationcontrol(i), tipd_parallelterminationcontrol(i));     
        end generate;                                                                                                                  


    end block;                                                                              
    PROCESS( i_ipd, oe_ipd)
        BEGIN                                              
            IF (oe_ipd = '1') THEN                      
                IF (open_drain_output = "true") THEN
                    IF (i_ipd = '0') THEN               
                        out_tmp <= '0';             
                        out_tmp_bar <= '1';         
                        prev_value <= '0';          
                    ELSE                            
                        out_tmp <= 'Z';             
                        out_tmp_bar <= 'Z';         
                    END IF;                         
                ELSE                                
                    IF (i_ipd = '0') THEN               
                        out_tmp <= '0';             
                        out_tmp_bar <= '1';         
                        prev_value <= '0';          
                    ELSE                            
                        IF (i_ipd = '1') THEN           
                            out_tmp <= '1';         
                            out_tmp_bar <= '0';     
                            prev_value <= '1';      
                        ELSE                        
                            out_tmp <= i_ipd;           
                            out_tmp_bar <= i_ipd;       
                        END IF;                     
                    END IF;                         
                END IF;                             
            ELSE                                    
                IF (oe_ipd = '0') THEN                  
                    out_tmp <= 'Z';                 
                    out_tmp_bar <= 'Z';             
                ELSE                                
                    out_tmp <= 'X';                 
                    out_tmp_bar <= 'X';             
                END IF;                             
            END IF;                                     
    END PROCESS;
    o_tmp1 <= prev_value WHEN (bus_hold = "true") ELSE out_tmp;
    obar_tmp1 <= NOT prev_value WHEN (bus_hold = "true") ELSE out_tmp_bar;  
    o_tmp <= 'X' when (( oe_ipd = '1') and (dynamicterminationcontrol = '1') and (sim_dynamic_termination_control_is_connected = "true")) else o_tmp1 WHEN (devoe = '1') ELSE 'Z'; 
    obar_tmp <= 'X' when (( oe_ipd = '1') and (dynamicterminationcontrol = '1')and (sim_dynamic_termination_control_is_connected = "true")) else obar_tmp1 WHEN (devoe = '1') ELSE 'Z'; 
	
         ---------------------
     --  Path Delay Section
     ----------------------
    PROCESS( o_tmp,obar_tmp)
        variable o_VitalGlitchData : VitalGlitchDataType;
        variable obar_VitalGlitchData : VitalGlitchDataType;
        BEGIN
            VitalPathDelay01 (                                                                  
                              OutSignal => o,                                                  
                              OutSignalName => "o",                                            
                              OutTemp => o_tmp,                                                
                              Paths => (0 => (i_ipd'last_event, tpd_i_o, TRUE),                
                                        1 => (oe_ipd'last_event, tpd_oe_o, TRUE)),   
                              GlitchData => o_VitalGlitchData,                           
                              Mode => DefGlitchMode,                                           
                              XOn  => XOn,                                                     
                              MsgOn  => MsgOn                                                  
                              ); 
            VitalPathDelay01 (                                                               
                  OutSignal => obar,                                                
                  OutSignalName => "obar",                                          
                  OutTemp => obar_tmp,                                              
                  Paths => (0 => (i_ipd'last_event, tpd_i_obar, TRUE),              
                            1 => (oe_ipd'last_event, tpd_oe_obar, TRUE)),   
                  GlitchData => obar_VitalGlitchData,                         
                  Mode => DefGlitchMode,                                         
                  XOn  => XOn,                                                   
                  MsgOn  => MsgOn                                                
                  ); 
        END PROCESS;                                                                                                                                              
END arch;

                                                                                                              
----------------------------------------------------------------------------------
--Module Name:                    twentynm_pseudo_diff_out                     --
--Description:                    Simulation model for Twentynm Pseudo Differential --
--                                Output Buffer                                  --
----------------------------------------------------------------------------------

LIBRARY IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.VITAL_Timing.all;
use IEEE.VITAL_Primitives.all;
use work.twentynm_atom_pack.all;

ENTITY twentynm_pseudo_diff_out IS
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
END twentynm_pseudo_diff_out;

ARCHITECTURE arch OF twentynm_pseudo_diff_out IS
        SIGNAL i_ipd                  : std_logic;
        SIGNAL ibar_ipd               : std_logic;
        SIGNAL oein_ipd               : std_logic;
        SIGNAL oebin_ipd              : std_logic;
        SIGNAL dtcin_ipd              : std_logic;
        SIGNAL dtcbarin_ipd           : std_logic;
        SIGNAL o_tmp                  : std_logic;
        SIGNAL obar_tmp               : std_logic;
        SIGNAL oeout_tmp              : std_logic;
        SIGNAL oebout_tmp             : std_logic;
        SIGNAL dtc_tmp                : std_logic;
        SIGNAL dtcbar_tmp             : std_logic;

BEGIN
    WireDelay : block
    begin
        VitalWireDelay (i_ipd, i, tipd_i);
        VitalWireDelay (ibar_ipd, ibar, tipd_ibar);
    end block;

    PROCESS(i_ipd, ibar_ipd)
        BEGIN
            IF (feedthrough = "true") THEN
                IF (i_ipd = '0') THEN
                    o_tmp <= '0';
                ELSIF (i_ipd = '1') THEN
                    o_tmp <= '1';
                ELSE
                    o_tmp <= i_ipd;
                END IF;
                IF (ibar_ipd = '0') THEN
                    obar_tmp <= '1';
                ELSIF (ibar_ipd = '1') THEN
                    obar_tmp <= '0';
                ELSE
                    obar_tmp <= ibar_ipd;
                END IF;
            ELSE
                IF (i_ipd = '0') THEN
                    o_tmp <= '0';
                    obar_tmp <= '1';
                ELSIF (i_ipd = '1') THEN
                    o_tmp <= '1';
                    obar_tmp <= '0';
                ELSE
                    o_tmp <= i_ipd;
                    obar_tmp <= i_ipd;
                END IF;
            END IF;
        END PROCESS;

        ---------------------
     --  Path Delay Section
     ----------------------
    PROCESS( o_tmp,obar_tmp)
        variable o_VitalGlitchData : VitalGlitchDataType;
        variable obar_VitalGlitchData : VitalGlitchDataType;
        BEGIN
            VitalPathDelay01 (
                              OutSignal => o,
                              OutSignalName => "o",
                              OutTemp => o_tmp,
                              Paths => (0 => (i_ipd'last_event, tpd_i_o, TRUE)),
                              GlitchData => o_VitalGlitchData,
                              Mode => DefGlitchMode,
                              XOn  => XOn,
                              MsgOn  => MsgOn
                              );
            VitalPathDelay01 (
                  OutSignal => obar,
                  OutSignalName => "obar",
                  OutTemp => obar_tmp,
                  Paths => (0 => (i_ipd'last_event, tpd_i_obar, TRUE),
                            1 => (ibar_ipd'last_event, tpd_ibar_obar, TRUE)),
                  GlitchData => obar_VitalGlitchData,
                  Mode => DefGlitchMode,
                  XOn  => XOn,
                  MsgOn  => MsgOn
                  );
        END PROCESS;

-- oe
         WireDelay_OE : block
    begin
        VitalWireDelay (oein_ipd, oein, tipd_oein);
        VitalWireDelay (oebin_ipd, oebin, tipd_oebin);
    end block;

    PROCESS(oein_ipd, oebin_ipd)
        BEGIN
            IF (feedthrough = "true") THEN
                IF (oein_ipd = '0') THEN
                    oeout_tmp <= '0';
                ELSIF (oein_ipd = '1') THEN
                    oeout_tmp <= '1';
                ELSE
                    oeout_tmp <= oein_ipd;
                END IF;
                IF (oebin_ipd = '0') THEN
                    oebout_tmp <= '0';
                ELSIF (oebin_ipd = '1') THEN
                    oebout_tmp <= '1';
                ELSE
                    oebout_tmp <= oebin_ipd;
                END IF;
            ELSE
                IF (oein_ipd = '0') THEN
                    oeout_tmp <= '0';
                    oebout_tmp <= '0';
                ELSIF (oein_ipd = '1') THEN
                    oeout_tmp <= '1';
                    oebout_tmp <= '1';
                ELSE
                    oeout_tmp <= oein_ipd;
                    oebout_tmp <= oein_ipd;
                END IF;
            END IF;
        END PROCESS;

        ---------------------
     --  Path Delay Section
     ----------------------
    PROCESS( oeout_tmp,oebout_tmp)
        variable o_VitalGlitchData : VitalGlitchDataType;
        variable obar_VitalGlitchData : VitalGlitchDataType;
        BEGIN
            VitalPathDelay01 (
                              OutSignal => oeout,
                              OutSignalName => "oeout",
                              OutTemp => oeout_tmp,
                              Paths => (0 => (oein_ipd'last_event, tpd_oein_oeout, TRUE)),
                              GlitchData => o_VitalGlitchData,
                              Mode => DefGlitchMode,
                              XOn  => XOn,
                              MsgOn  => MsgOn
                              );
            VitalPathDelay01 (
                  OutSignal => oebout,
                  OutSignalName => "oebout",
                  OutTemp => oebout_tmp,
                  Paths => (0 => (oein_ipd'last_event, tpd_oein_oebout, TRUE),
                            1 => (oebin_ipd'last_event, tpd_oebin_oebout, TRUE)),
                  GlitchData => obar_VitalGlitchData,
                  Mode => DefGlitchMode,
                  XOn  => XOn,
                  MsgOn  => MsgOn
                  );
        END PROCESS;



-- dtc

         WireDelay_DTC : block
    begin
        VitalWireDelay (dtcin_ipd, dtcin, tipd_dtcin);
        VitalWireDelay (dtcbarin_ipd, dtcbarin, tipd_dtcbarin);
    end block;

    PROCESS(dtcin_ipd, dtcbarin_ipd)
        BEGIN
            IF (feedthrough = "true") THEN
                IF (dtcin_ipd = '0') THEN
                    dtc_tmp <= '0';
                ELSIF (dtcin_ipd = '1') THEN
                    dtc_tmp <= '1';
                ELSE
                    dtc_tmp <= dtcin_ipd;
                END IF;
                IF (dtcbarin_ipd = '0') THEN
                    dtcbar_tmp <= '0';
                ELSIF (dtcbarin_ipd = '1') THEN
                    dtcbar_tmp <= '1';
                ELSE
                    dtcbar_tmp <= dtcbarin_ipd;
                END IF;
            ELSE
                IF (dtcin_ipd = '0') THEN
                    dtc_tmp <= '0';
                    dtcbar_tmp <= '0';
                ELSIF (dtcin_ipd = '1') THEN
                    dtc_tmp <= '1';
                    dtcbar_tmp <= '1';
                ELSE
                    dtc_tmp <= dtcin_ipd;
                    dtcbar_tmp <= dtcin_ipd;
                END IF;
            END IF;
        END PROCESS;

        ---------------------
     --  Path Delay Section
     ----------------------
    PROCESS( dtc_tmp,dtcbar_tmp)
        variable o_VitalGlitchData : VitalGlitchDataType;
        variable dtcbar_VitalGlitchData : VitalGlitchDataType;
        BEGIN
            VitalPathDelay01 (
                              OutSignal => dtc,
                              OutSignalName => "dtc",
                              OutTemp => dtc_tmp,
                              Paths => (0 => (dtcin_ipd'last_event, tpd_dtcin_dtc, TRUE)),
                              GlitchData => o_VitalGlitchData,
                              Mode => DefGlitchMode,
                              XOn  => XOn,
                              MsgOn  => MsgOn
                              );
            VitalPathDelay01 (
                  OutSignal => dtcbar,
                  OutSignalName => "dtcbar",
                  OutTemp => dtcbar_tmp,
                  Paths => (0 => (dtcin_ipd'last_event, tpd_dtcin_dtcbar, TRUE),
                            1 => (dtcbarin_ipd'last_event, tpd_dtcbarin_dtcbar, TRUE)),
                  GlitchData => dtcbar_VitalGlitchData,
                  Mode => DefGlitchMode,
                  XOn  => XOn,
                  MsgOn  => MsgOn
                  );
        END PROCESS;
END arch;
----------------------------------------------------------------------------
-- Module Name     : twentynm_io_pad
-- Description     : Simulation model for stratixiii IO pad
----------------------------------------------------------------------------
LIBRARY IEEE;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;
use IEEE.VITAL_Timing.all;
use IEEE.VITAL_Primitives.all;

ENTITY twentynm_io_pad IS
    GENERIC (
        lpm_type                       :  string := "twentynm_io_pad");    
    PORT (
        --INPUT PORTS

        padin                   : IN std_logic := '0';   -- Input Pad
        --OUTPUT PORTS

        padout                  : OUT std_logic);   -- Output Pad
END twentynm_io_pad;

ARCHITECTURE arch OF twentynm_io_pad IS

BEGIN
    padout <= padin;    
END arch;
--------------------------------------------------------------
--
-- Entity Name : twentynm_bias_logic
--
-- Description : STRATIXIII Bias Block's Logic Block
--               VHDL simulation model
--
--------------------------------------------------------------
LIBRARY IEEE;
use IEEE.VITAL_Timing.all;
use IEEE.VITAL_Primitives.all;
use IEEE.std_logic_1164.all;
use work.twentynm_atom_pack.all;

ENTITY twentynm_bias_logic IS
    GENERIC (
            tipd_clk : VitalDelayType01 := DefPropDelay01;
            tipd_shiftnld : VitalDelayType01 := DefPropDelay01;
            tipd_captnupdt : VitalDelayType01 := DefPropDelay01;
            MsgOn: Boolean := DefGlitchMsgOn;
            XOn: Boolean := DefGlitchXOn;
            MsgOnChecks: Boolean := DefMsgOnChecks;
            XOnChecks: Boolean := DefXOnChecks
            );
    PORT (
        clk : in std_logic := '0';
        shiftnld : in std_logic := '0';
        captnupdt : in std_logic := '0';
        mainclk : out std_logic := '0';
        updateclk : out std_logic := '0';
        capture : out std_logic := '0';
        update : out std_logic := '0'
        );

    attribute VITAL_LEVEL0 of twentynm_bias_logic : ENTITY IS TRUE;
end twentynm_bias_logic;

ARCHITECTURE vital_bias_logic of twentynm_bias_logic IS
    attribute VITAL_LEVEL0 of vital_bias_logic : ARCHITECTURE IS TRUE;
    signal clk_ipd : std_logic := '0';
    signal shiftnld_ipd : std_logic := '0';
    signal captnupdt_ipd : std_logic := '0';
begin

    WireDelay : block
    begin
        VitalWireDelay (clk_ipd, clk, tipd_clk);
        VitalWireDelay (shiftnld_ipd, shiftnld, tipd_shiftnld);
        VitalWireDelay (captnupdt_ipd, captnupdt, tipd_captnupdt);
    end block;

    process (clk_ipd, shiftnld_ipd, captnupdt_ipd)
    variable select_tmp : std_logic_vector(1 DOWNTO 0) := (others => '0');
    begin
        select_tmp := captnupdt_ipd & shiftnld_ipd;
        case select_tmp IS
            when "10"|"11" =>
                mainclk <= '0';
                updateclk <= clk_ipd;
                capture <= '1';
                update <= '0';
            when "01" =>
                mainclk <= '0';
                updateclk <= clk_ipd;
                capture <= '0';
                update <= '0';
            when "00" =>
                mainclk <= clk_ipd;
                updateclk <= '0';
                capture <= '0';
                update <= '1';
            when others =>
                mainclk <= '0';
                updateclk <= '0';
                capture <= '0';
                update <= '0';
        end case;
    end process;

end vital_bias_logic;

--------------------------------------------------------------
--
-- Entity Name : twentynm_bias_generator
--
-- Description : STRATIXIII Bias Generator VHDL simulation model
--
--------------------------------------------------------------
LIBRARY IEEE;
use IEEE.VITAL_Timing.all;
use IEEE.VITAL_Primitives.all;
use IEEE.std_logic_1164.all;
use work.twentynm_atom_pack.all;

ENTITY twentynm_bias_generator IS
    GENERIC (
        tipd_din : VitalDelayType01 := DefPropDelay01;
        tipd_mainclk : VitalDelayType01 := DefPropDelay01;
        tipd_updateclk : VitalDelayType01 := DefPropDelay01;
        tipd_update : VitalDelayType01 := DefPropDelay01;
        tipd_capture : VitalDelayType01 := DefPropDelay01;
        MsgOn: Boolean := DefGlitchMsgOn;
        XOn: Boolean := DefGlitchXOn;
        MsgOnChecks: Boolean := DefMsgOnChecks;
        XOnChecks: Boolean := DefXOnChecks
        );
    PORT (
        din : in std_logic := '0';
        mainclk : in std_logic := '0';
        updateclk : in std_logic := '0';
        capture : in std_logic := '0';
        update : in std_logic := '0';
        dout : out std_logic := '0'
        );

    attribute VITAL_LEVEL0 of twentynm_bias_generator : ENTITY IS TRUE;
end twentynm_bias_generator;

ARCHITECTURE vital_bias_generator of twentynm_bias_generator IS
    attribute VITAL_LEVEL0 of vital_bias_generator : ARCHITECTURE IS TRUE;
    CONSTANT TOTAL_REG : integer := 202;
    signal din_ipd : std_logic := '0';
    signal mainclk_ipd : std_logic := '0';
    signal updateclk_ipd : std_logic := '0';
    signal update_ipd : std_logic := '0';
    signal capture_ipd : std_logic := '0';
    signal generator_reg : std_logic_vector((TOTAL_REG - 1) DOWNTO 0) := (others => '0');
    signal update_reg : std_logic_vector((TOTAL_REG - 1) DOWNTO 0) := (others => '0');
    signal dout_tmp : std_logic := '0';
    signal i : integer := 0;
    
begin

    WireDelay : block
    begin
        VitalWireDelay (din_ipd, din, tipd_din);
        VitalWireDelay (mainclk_ipd, mainclk, tipd_mainclk);
        VitalWireDelay (updateclk_ipd, updateclk, tipd_updateclk);
        VitalWireDelay (update_ipd, update, tipd_update);
        VitalWireDelay (capture_ipd, capture, tipd_capture);
    end block;

    process (mainclk_ipd)
    begin
        if (mainclk_ipd'event AND (mainclk_ipd = '1') AND (mainclk_ipd'last_value = '0')) then 
            if ((capture_ipd = '0') AND (update_ipd = '1')) then 
                for i in 0 to (TOTAL_REG - 1)
                loop
                    generator_reg(i) <= update_reg(i);
                end loop;
            end if;
        end if;
    end process;

    process (updateclk_ipd)
    begin
        if (updateclk_ipd'event AND (updateclk_ipd = '1') AND (updateclk_ipd'last_value = '0')) then 
            dout_tmp <= update_reg(TOTAL_REG - 1);
    
            if ((capture_ipd = '0') AND (update_ipd = '0')) then 
                for i in 1 to (TOTAL_REG - 1)
                loop
                    update_reg(i) <= update_reg(i - 1);
                end loop;
                update_reg(0) <= din_ipd;
            elsif ((capture_ipd = '1') AND (update_ipd = '0')) then 
                for i in 1 to (TOTAL_REG - 1)
                loop
                    update_reg(i) <= generator_reg(i);
                end loop;
            end if; 
        end if;
    end process;

    dout <= dout_tmp;

end vital_bias_generator;

--------------------------------------------------------------
--
-- Entity Name : twentynm_bias_block
--
-- Description : STRATIXIII Bias Block VHDL simulation model
--
--------------------------------------------------------------
LIBRARY IEEE;
use IEEE.VITAL_Timing.all;
use IEEE.VITAL_Primitives.all;
use IEEE.std_logic_1164.all;
use work.twentynm_atom_pack.all;

ENTITY twentynm_bias_block IS
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

    attribute VITAL_LEVEL0 of twentynm_bias_block : ENTITY IS TRUE;
end twentynm_bias_block;

ARCHITECTURE vital_bias_block of twentynm_bias_block IS

    COMPONENT twentynm_bias_logic
        GENERIC (
                tipd_clk : VitalDelayType01 := DefPropDelay01;
                tipd_shiftnld : VitalDelayType01 := DefPropDelay01;
                tipd_captnupdt : VitalDelayType01 := DefPropDelay01;
                MsgOn: Boolean := DefGlitchMsgOn;
                XOn: Boolean := DefGlitchXOn;
                MsgOnChecks: Boolean := DefMsgOnChecks;
                XOnChecks: Boolean := DefXOnChecks
                );
        PORT (
            clk : in std_logic := '0';
            shiftnld : in std_logic := '0';
            captnupdt : in std_logic := '0';
            mainclk : out std_logic := '0';
            updateclk : out std_logic := '0';
            capture : out std_logic := '0';
            update : out std_logic := '0'
            );
    end COMPONENT;
    
    COMPONENT twentynm_bias_generator
        GENERIC (
            tipd_din : VitalDelayType01 := DefPropDelay01;
            tipd_mainclk : VitalDelayType01 := DefPropDelay01;
            tipd_updateclk : VitalDelayType01 := DefPropDelay01;
            tipd_update : VitalDelayType01 := DefPropDelay01;
            tipd_capture : VitalDelayType01 := DefPropDelay01;
            MsgOn: Boolean := DefGlitchMsgOn;
            XOn: Boolean := DefGlitchXOn;
            MsgOnChecks: Boolean := DefMsgOnChecks;
            XOnChecks: Boolean := DefXOnChecks
            );
        PORT (
            din : in std_logic := '0';
            mainclk : in std_logic := '0';
            updateclk : in std_logic := '0';
            capture : in std_logic := '0';
            update : in std_logic := '0';
            dout : out std_logic := '0'
            );
    end COMPONENT;

    signal mainclk_wire : std_logic := '0';
    signal updateclk_wire : std_logic := '0';
    signal capture_wire : std_logic := '0';
    signal update_wire : std_logic := '0';

begin

    logic_block : twentynm_bias_logic
                  PORT MAP (
                           clk => clk,
                           shiftnld => shiftnld,
                           captnupdt => captnupdt,
                           mainclk => mainclk_wire,
                           updateclk => updateclk_wire,
                           capture => capture_wire,
                           update => update_wire
                           );

    bias_generator : twentynm_bias_generator
                  PORT MAP (
                           din => din,
                           mainclk => mainclk_wire,
                           updateclk => updateclk_wire,
                           capture => capture_wire,
                           update => update_wire,
                           dout => dout
                           );
    
end vital_bias_block;
library IEEE;
use IEEE.std_logic_1164.all;


entity twentynm_clk_phase_select is
    generic (
        phase_setting : integer := 0;
        invert_phase : string := "dynamic";
        use_phasectrlin : string := "true";
        physical_clock_source : string := "dqs_2x_clk";
        use_dqs_input : string := "false"
    );
    port (
        clkin : in std_logic_vector(3 downto 0) := (OTHERS => '0');
        dqsin : in std_logic := '0';
        phaseinvertctrl : in std_logic := '0';
        clkout : out std_logic;
        phasectrlin : in std_logic_vector(1 downto 0) := (OTHERS => '0')
    );
end twentynm_clk_phase_select;

architecture behavior of twentynm_clk_phase_select is

component twentynm_clk_phase_select_encrypted
    generic (
        phase_setting : integer := 0;
        invert_phase : string := "dynamic";
        use_phasectrlin : string := "true";
        physical_clock_source : string := "dqs_2x_clk";
        use_dqs_input : string := "false"
    );
    port (
        clkin : in std_logic_vector(3 downto 0) := (OTHERS => '0');
        dqsin : in std_logic := '0';
        phaseinvertctrl : in std_logic := '0';
        clkout : out std_logic;
        phasectrlin : in std_logic_vector(1 downto 0) := (OTHERS => '0')
    );
end component;

begin

inst : twentynm_clk_phase_select_encrypted
    generic map (
        phase_setting => phase_setting,
        invert_phase => invert_phase,
        use_phasectrlin => use_phasectrlin,
        physical_clock_source => physical_clock_source,
        use_dqs_input => use_dqs_input
    )
    port map (
        clkin => clkin,
        dqsin => dqsin,
        phaseinvertctrl => phaseinvertctrl,
        clkout => clkout,
        phasectrlin => phasectrlin
    );

end behavior;

library IEEE;
use IEEE.std_logic_1164.all;


entity    twentynm_clkena    is
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
end twentynm_clkena;

architecture behavior of twentynm_clkena is

component    twentynm_clkena_encrypted
    generic    (
        clock_type    :    string    :=    "auto";
        ena_register_mode    :    string    :=    "always enabled";
        lpm_type    :    string    :=    "twentynm_clkena";
        ena_register_power_up    :    string    :=    "high";
        disable_mode    :    string    :=    "low";
        test_syn    :    string    :=    "high"
    );
    port    (
        inclk    :    in    std_logic;
        ena    :    in    std_logic;
        enaout    :    out    std_logic;
        outclk    :    out    std_logic
    );
end component;

begin


inst : twentynm_clkena_encrypted
    generic  map  (
        clock_type    =>   clock_type,
        ena_register_mode    =>   ena_register_mode,
        lpm_type    =>   lpm_type,
        ena_register_power_up    =>   ena_register_power_up,
        disable_mode    =>   disable_mode,
        test_syn    =>   test_syn
    )
    port  map  (
        inclk    =>    inclk,
        ena    =>    ena,
        enaout    =>    enaout,
        outclk    =>    outclk
    );


end behavior;

library IEEE;
use IEEE.std_logic_1164.all;


entity    twentynm_clkselect    is
    generic    (
        lpm_type    :    string    :=    "twentynm_clkselect";
        test_cff    :    string    :=    "low"
    );
    port    (
        inclk    :    in    std_logic_vector(3 downto 0)    :=    "0000";
        clkselect    :    in    std_logic_vector(1 downto 0)    :=    "00";
        outclk    :    out    std_logic
    );
end twentynm_clkselect;

architecture behavior of twentynm_clkselect is

component    twentynm_clkselect_encrypted
    generic    (
        lpm_type    :    string    :=    "twentynm_clkselect";
        test_cff    :    string    :=    "low"
    );
    port    (
        inclk    :    in    std_logic_vector(3 downto 0);
        clkselect    :    in    std_logic_vector(1 downto 0);
        outclk    :    out    std_logic
    );
end component;

begin


inst : twentynm_clkselect_encrypted
    generic  map  (
        lpm_type    =>   lpm_type,
        test_cff    =>   test_cff
    )
    port  map  (
        inclk    =>    inclk,
        clkselect    =>    clkselect,
        outclk    =>    outclk
    );


end behavior;

library IEEE;
use IEEE.std_logic_1164.all;


entity twentynm_delay_chain is
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
end twentynm_delay_chain;

architecture behavior of twentynm_delay_chain is

component twentynm_delay_chain_encrypted
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
end component;

begin

inst : twentynm_delay_chain_encrypted
    generic map (
        lpm_type => lpm_type,
        sim_intrinsic_falling_delay => sim_intrinsic_falling_delay,
        sim_intrinsic_rising_delay => sim_intrinsic_rising_delay,
        sim_falling_delay_increment => sim_falling_delay_increment,
        sim_rising_delay_increment => sim_rising_delay_increment
    )
    port map (
        datain => datain,
        dataout => dataout,
        delayctrlin => delayctrlin
    );

end behavior;


library IEEE;
use IEEE.std_logic_1164.all;


entity    twentynm_dll_offset_ctrl    is
    generic    (
        use_offset    :    string    :=    "false";
        static_offset    :    integer    :=    0;
        use_pvt_compensation    :    string    :=    "false"
    );
    port    (
        clk    :    in    std_logic	:= '0';
        offsetdelayctrlin    :    in    std_logic_vector(6 downto 0)	:= (OTHERS => '0');
        offset    :    in    std_logic_vector(6 downto 0)	:= (OTHERS => '0');
        addnsub    :    in    std_logic	:= '0';
        aload    :    in    std_logic	:= '0';
        offsetctrlout    :    out    std_logic_vector(6 downto 0);
        offsettestout    :    out    std_logic_vector(6 downto 0)
    );
end twentynm_dll_offset_ctrl;

architecture behavior of twentynm_dll_offset_ctrl is

component    twentynm_dll_offset_ctrl_encrypted
    generic    (
        use_offset    :    string    :=    "false";
        static_offset    :    integer    :=    0;
        use_pvt_compensation    :    string    :=    "false"
    );
    port    (
        clk    :    in    std_logic	:= '0';
        offsetdelayctrlin    :    in    std_logic_vector(6 downto 0)	:= (OTHERS => '0');
        offset    :    in    std_logic_vector(6 downto 0)	:= (OTHERS => '0');
        addnsub    :    in    std_logic	:= '0';
        aload    :    in    std_logic	:= '0';
        offsetctrlout    :    out    std_logic_vector(6 downto 0);
        offsettestout    :    out    std_logic_vector(6 downto 0)
    );
end component;

begin


inst : twentynm_dll_offset_ctrl_encrypted
    generic  map  (
        use_offset    =>   use_offset,
        static_offset    =>   static_offset,
        use_pvt_compensation    =>   use_pvt_compensation
    )
    port  map  (
        clk    =>    clk,
        offsetdelayctrlin    =>    offsetdelayctrlin,
        offset    =>    offset,
        addnsub    =>    addnsub,
        aload    =>    aload,
        offsetctrlout    =>    offsetctrlout,
        offsettestout    =>    offsettestout
    );


end behavior;

library IEEE;
use IEEE.std_logic_1164.all;


entity twentynm_dll is
    generic (
        sim_valid_lockcount : integer := 0;
        sim_valid_lock : integer := 16;
        delayctrlout_mode : string := "normal";
        delay_chain_length : integer := 8;
        dtf_core_mode : string := "clock";
        static_delay_ctrl : integer := 0;
        lpm_type : string := "twentynm_dll";
        upndnout_mode : string := "clock";
        sim_buffer_intrinsic_delay : integer := 175;
        jitter_reduction : string := "false";
        use_upndnin : string := "false";
        use_upndninclkena : string := "false";
        sim_buffer_delay_increment : integer := 10
    );
    port (
        dftcore : out std_logic;
        locked : out std_logic;
        upndnout : out std_logic;
        dffin : out std_logic;
        dqsupdate : out std_logic;
        delayctrlout : out std_logic_vector(6 downto 0);
        clk : in std_logic := '0';
        upndninclkena : in std_logic := '0';
        aload : in std_logic := '0';
        upndnin : in std_logic := '0'
    );
end twentynm_dll;

architecture behavior of twentynm_dll is

component twentynm_dll_encrypted
    generic (
        sim_valid_lockcount : integer := 0;
        sim_valid_lock : integer := 16;
        delayctrlout_mode : string := "normal";
        delay_chain_length : integer := 8;
        dtf_core_mode : string := "clock";
        static_delay_ctrl : integer := 0;
        lpm_type : string := "twentynm_dll";
        upndnout_mode : string := "clock";
        sim_buffer_intrinsic_delay : integer := 175;
        jitter_reduction : string := "false";
        use_upndnin : string := "false";
        use_upndninclkena : string := "false";
        sim_buffer_delay_increment : integer := 10
    );
    port (
        dftcore : out std_logic;
        locked : out std_logic;
        upndnout : out std_logic;
        dffin : out std_logic;
        dqsupdate : out std_logic;
        delayctrlout : out std_logic_vector(6 downto 0);
        clk : in std_logic := '0';
        upndninclkena : in std_logic := '0';
        aload : in std_logic := '0';
        upndnin : in std_logic := '0'
    );
end component;

begin

inst : twentynm_dll_encrypted
    generic map (
        sim_valid_lockcount => sim_valid_lockcount,
        sim_valid_lock => sim_valid_lock,
        delayctrlout_mode => delayctrlout_mode,
        delay_chain_length => delay_chain_length,
        dtf_core_mode => dtf_core_mode,
        static_delay_ctrl => static_delay_ctrl,
        lpm_type => lpm_type,
        upndnout_mode => upndnout_mode,
        sim_buffer_intrinsic_delay => sim_buffer_intrinsic_delay,
        jitter_reduction => jitter_reduction,
        use_upndnin => use_upndnin,
        use_upndninclkena => use_upndninclkena,
        sim_buffer_delay_increment => sim_buffer_delay_increment
    )
    port map (
        dftcore => dftcore,
        locked => locked,
        upndnout => upndnout,
        dffin => dffin,
        dqsupdate => dqsupdate,
        delayctrlout => delayctrlout,
        clk => clk,
        upndninclkena => upndninclkena,
        aload => aload,
        upndnin => upndnin
    );

end behavior;

library IEEE;
use IEEE.std_logic_1164.all;


library IEEE;
use IEEE.std_logic_1164.all;


entity twentynm_dqs_config is
    generic (
        lpm_type : string := "twentynm_dqs_config"
    );
    port (
        datain : in std_logic := '0';
        dqsenablegatingdelaysetting : out std_logic_vector(4 downto 0);
        dqshalfratebypass : out std_logic;
        enadqsenablephasetransferreg : out std_logic;
        postamblephaseinvert : out std_logic;
        dqsenableungatingdelaysetting : out std_logic_vector(4 downto 0);
        octdelaysetting : out std_logic_vector(4 downto 0);
        clk : in std_logic := '0';
        dqsbusoutdelaysetting : out std_logic_vector(4 downto 0);
        postamblephasesetting : out std_logic_vector(1 downto 0);
        ena : in std_logic := '0';
        dataout : out std_logic;
        update : in std_logic := '0'
    );
end twentynm_dqs_config;

architecture behavior of twentynm_dqs_config is

component twentynm_dqs_config_encrypted
    generic (
        lpm_type : string := "twentynm_dqs_config"
    );
    port (
        datain : in std_logic := '0';
        dqsenablegatingdelaysetting : out std_logic_vector(4 downto 0);
        dqshalfratebypass : out std_logic;
        enadqsenablephasetransferreg : out std_logic;
        postamblephaseinvert : out std_logic;
        dqsenableungatingdelaysetting : out std_logic_vector(4 downto 0);
        octdelaysetting : out std_logic_vector(4 downto 0);
        clk : in std_logic := '0';
        dqsbusoutdelaysetting : out std_logic_vector(4 downto 0);
        postamblephasesetting : out std_logic_vector(1 downto 0);
        ena : in std_logic := '0';
        dataout : out std_logic;
        update : in std_logic := '0'
    );
end component;

begin

inst : twentynm_dqs_config_encrypted
    generic map (
        lpm_type => lpm_type
    )
    port map (
        datain => datain,
        dqsenablegatingdelaysetting => dqsenablegatingdelaysetting,
        dqshalfratebypass => dqshalfratebypass,
        enadqsenablephasetransferreg => enadqsenablephasetransferreg,
        postamblephaseinvert => postamblephaseinvert,
        dqsenableungatingdelaysetting => dqsenableungatingdelaysetting,
        octdelaysetting => octdelaysetting,
        clk => clk,
        dqsbusoutdelaysetting => dqsbusoutdelaysetting,
        postamblephasesetting => postamblephasesetting,
        ena => ena,
        dataout => dataout,
        update => update
    );

end behavior;

library IEEE;
use IEEE.std_logic_1164.all;


entity twentynm_dqs_delay_chain is
    generic (
        dqs_network_width : string := "unused";
        dqs_delay_chain_test_mode : string := "OFF";
        dqs_delay_chain_bypass : string := "false";
        dqs_phase_shift : string := "unused";
        dqs_ctrl_latches_enable : string := "false";
        dqs_input_frequency : string := "unused";
        dqs_period : string := "unused";
        sim_buffer_intrinsic_delay : integer := 175;
        sim_buffer_delay_increment : integer := 10
    );
    port (
        dqsdisablen : in std_logic := '0';
        dqsupdateen : in std_logic := '0';
        dqsbusout : out std_logic;
        dffin : out std_logic;
        delayctrlin : in std_logic_vector(6 downto 0) := (OTHERS => '0');
        testin : in std_logic := '0';
        dqsin : in std_logic := '0';
        dqsenable : in std_logic := '0'
    );
end twentynm_dqs_delay_chain;

architecture behavior of twentynm_dqs_delay_chain is

component twentynm_dqs_delay_chain_encrypted
    generic (
        dqs_network_width : string := "unused";
        dqs_delay_chain_test_mode : string := "OFF";
        dqs_delay_chain_bypass : string := "false";
        dqs_phase_shift : string := "unused";
        dqs_ctrl_latches_enable : string := "false";
        dqs_input_frequency : string := "unused";
        dqs_period : string := "unused";
        sim_buffer_intrinsic_delay : integer := 175;
        sim_buffer_delay_increment : integer := 10
    );
    port (
        dqsdisablen : in std_logic := '0';
        dqsupdateen : in std_logic := '0';
        dqsbusout : out std_logic;
        dffin : out std_logic;
        delayctrlin : in std_logic_vector(6 downto 0) := (OTHERS => '0');
        testin : in std_logic := '0';
        dqsin : in std_logic := '0';
        dqsenable : in std_logic := '0'
    );
end component;

begin

inst : twentynm_dqs_delay_chain_encrypted
    generic map (
        dqs_network_width => dqs_network_width,
        dqs_delay_chain_test_mode => dqs_delay_chain_test_mode,
        dqs_delay_chain_bypass => dqs_delay_chain_bypass,
        dqs_phase_shift => dqs_phase_shift,
        dqs_ctrl_latches_enable => dqs_ctrl_latches_enable,
        dqs_input_frequency => dqs_input_frequency,
        dqs_period => dqs_period,
        sim_buffer_intrinsic_delay => sim_buffer_intrinsic_delay,
        sim_buffer_delay_increment => sim_buffer_delay_increment
    )
    port map (
        dqsdisablen => dqsdisablen,
        dqsupdateen => dqsupdateen,
        dqsbusout => dqsbusout,
        dffin => dffin,
        delayctrlin => delayctrlin,
        testin => testin,
        dqsin => dqsin,
        dqsenable => dqsenable
    );

end behavior;

library IEEE;
use IEEE.std_logic_1164.all;


entity twentynm_dqs_enable_ctrl is
    generic (
        add_phase_transfer_reg : string := "false";
        delay_dqs_enable : string := "onecycle"
    );
    port (
        dqsenablein : in std_logic := '0';
        dqsenableout : out std_logic;
        enaphasetransferreg : in std_logic := '0';
        zerophaseclk : in std_logic := '0';
        dffin : out std_logic;
        levelingclk : in std_logic := '0'
    );
end twentynm_dqs_enable_ctrl;

architecture behavior of twentynm_dqs_enable_ctrl is

component twentynm_dqs_enable_ctrl_encrypted
    generic (
        add_phase_transfer_reg : string := "false";
        delay_dqs_enable : string := "onecycle"
    );
    port (
        dqsenablein : in std_logic := '0';
        dqsenableout : out std_logic;
        enaphasetransferreg : in std_logic := '0';
        zerophaseclk : in std_logic := '0';
        dffin : out std_logic;
        levelingclk : in std_logic := '0'
    );
end component;

begin

inst : twentynm_dqs_enable_ctrl_encrypted
    generic map (
        add_phase_transfer_reg => add_phase_transfer_reg,
        delay_dqs_enable => delay_dqs_enable
    )
    port map (
        dqsenablein => dqsenablein,
        dqsenableout => dqsenableout,
        enaphasetransferreg => enaphasetransferreg,
        zerophaseclk => zerophaseclk,
        dffin => dffin,
        levelingclk => levelingclk
    );

end behavior;

library IEEE;
use IEEE.std_logic_1164.all;


entity    twentynm_duty_cycle_adjustment    is
    generic    (
        dca_config_mode    :    integer    :=    0;
	duty_cycle_delay_mode    :    string    :=    "none";
        lpm_type    :    string    :=    "twentynm_duty_cycle_adjustment"
    );
    port    (
        clkin    :    in    std_logic	:= '0';
        delaymode    :     in    std_logic_vector(1 downto 0)	:= (OTHERS => '0');
        delayctrlin    :    in    std_logic_vector(3 downto 0)	:= (OTHERS => '0');
        clkout    :    out    std_logic
    );
end twentynm_duty_cycle_adjustment;

architecture behavior of twentynm_duty_cycle_adjustment is

component    twentynm_duty_cycle_adjustment_encrypted
    generic    (
        dca_config_mode    :    integer    :=    0;
	duty_cycle_delay_mode    :    string    :=    "none";
        lpm_type    :    string    :=    "twentynm_duty_cycle_adjustment"
    );
    port    (
        clkin    :    in    std_logic	:= '0';
        delaymode    :     in    std_logic_vector(1 downto 0)	:= (OTHERS => '0');
        delayctrlin    :    in    std_logic_vector(3 downto 0)	:= (OTHERS => '0');
        clkout    :    out    std_logic
    );
end component;

begin


inst : twentynm_duty_cycle_adjustment_encrypted
    generic  map  (
        dca_config_mode    => dca_config_mode,
	duty_cycle_delay_mode    =>   duty_cycle_delay_mode,
        lpm_type    =>   lpm_type
    )
    port  map  (
        clkin    =>    clkin,
        delaymode    =>    delaymode,
        delayctrlin    =>    delayctrlin,
        clkout    =>    clkout
    );


end behavior;


library IEEE;
use IEEE.std_logic_1164.all;


entity    twentynm_half_rate_input    is
    generic    (
        power_up    :    string    :=    "low";
        async_mode    :    string    :=    "no_reset";
        use_dataoutbypass    :    string    :=    "false"
    );
    port    (
        datain    :    in    std_logic_vector(1 downto 0)	:= (OTHERS => '1');
        directin    :    in    std_logic	:= '1';
        clk    :    in    std_logic	:= '0';
        areset    :    in    std_logic	:= '0';
        dataoutbypass    :    in    std_logic	:= '0';
        dataout    :    out    std_logic_vector(3 downto 0);
        dffin    :    out    std_logic_vector(1 downto 0)
    );
end twentynm_half_rate_input;

architecture behavior of twentynm_half_rate_input is

component    twentynm_half_rate_input_encrypted
    generic    (
        power_up    :    string    :=    "low";
        async_mode    :    string    :=    "no_reset";
        use_dataoutbypass    :    string    :=    "false"
    );
    port    (
        datain    :    in    std_logic_vector(1 downto 0)	:= (OTHERS => '1');
        directin    :    in    std_logic	:= '1';
        clk    :    in    std_logic	:= '0';
        areset    :    in    std_logic	:= '0';
        dataoutbypass    :    in    std_logic	:= '0';
        dataout    :    out    std_logic_vector(3 downto 0);
        dffin    :    out    std_logic_vector(1 downto 0)
    );
end component;

begin


inst : twentynm_half_rate_input_encrypted
    generic  map  (
        power_up    =>   power_up,
        async_mode    =>   async_mode,
        use_dataoutbypass    =>   use_dataoutbypass
    )
    port  map  (
        datain    =>    datain,
        directin    =>    directin,
        clk    =>    clk,
        areset    =>    areset,
        dataoutbypass    =>    dataoutbypass,
        dataout    =>    dataout,
        dffin    =>    dffin
    );


end behavior;

library IEEE;
use IEEE.std_logic_1164.all;


entity    twentynm_input_phase_alignment    is
    generic    (
        power_up    :    string    :=    "low";
        async_mode    :    string    :=    "no_reset";
        add_input_cycle_delay    :    string    :=    "false";
        bypass_output_register    :    string    :=    "false";
        add_phase_transfer_reg    :    string    :=    "false";
        lpm_type    :    string    :=    "twentynm_input_phase_alignment"
    );
    port    (
        datain    :    in    std_logic	:= '1';
        levelingclk    :    in    std_logic	:= '0';
        zerophaseclk    :    in    std_logic	:= '0';
        areset    :    in    std_logic	:= '0';
        enainputcycledelay    :    in    std_logic	:= '0';
        enaphasetransferreg    :    in    std_logic	:= '0';
        dataout    :    out    std_logic;
        dffin    :    out    std_logic;
        dff1t    :    out    std_logic;
        dffphasetransfer    :    out    std_logic
    );
end twentynm_input_phase_alignment;

architecture behavior of twentynm_input_phase_alignment is

component    twentynm_input_phase_alignment_encrypted
    generic    (
        power_up    :    string    :=    "low";
        async_mode    :    string    :=    "no_reset";
        add_input_cycle_delay    :    string    :=    "false";
        bypass_output_register    :    string    :=    "false";
        add_phase_transfer_reg    :    string    :=    "false";
        lpm_type    :    string    :=    "twentynm_input_phase_alignment"
    );
    port    (
        datain    :    in    std_logic	:= '1';
        levelingclk    :    in    std_logic	:= '0';
        zerophaseclk    :    in    std_logic	:= '0';
        areset    :    in    std_logic	:= '0';
        enainputcycledelay    :    in    std_logic	:= '0';
        enaphasetransferreg    :    in    std_logic	:= '0';
        dataout    :    out    std_logic;
        dffin    :    out    std_logic;
        dff1t    :    out    std_logic;
        dffphasetransfer    :    out    std_logic
    );
end component;

begin


inst : twentynm_input_phase_alignment_encrypted
    generic  map  (
        power_up    =>   power_up,
        async_mode    =>   async_mode,
        add_input_cycle_delay    =>   add_input_cycle_delay,
        bypass_output_register    =>   bypass_output_register,
        add_phase_transfer_reg    =>   add_phase_transfer_reg,
        lpm_type    =>   lpm_type
    )
    port  map  (
        datain    =>    datain,
        levelingclk    =>    levelingclk,
        zerophaseclk    =>    zerophaseclk,
        areset    =>    areset,
        enainputcycledelay    =>    enainputcycledelay,
        enaphasetransferreg    =>    enaphasetransferreg,
        dataout    =>    dataout,
        dffin    =>    dffin,
        dff1t    =>    dff1t,
        dffphasetransfer    =>    dffphasetransfer
    );


end behavior;

library IEEE;
use IEEE.std_logic_1164.all;


entity    twentynm_io_clock_divider    is
    generic    (
        power_up    :    string    :=    "low";
        invert_phase    :    string    :=    "false";
        use_masterin    :    string    :=    "false";
        lpm_type    :    string    :=    "twentynm_io_clock_divider"
    );
    port    (
        clk    :    in    std_logic	:= '0';
        phaseinvertctrl    :    in    std_logic	:= '0';
        masterin    :    in    std_logic	:= '0';
        clkout    :    out    std_logic;
        slaveout    :    out    std_logic
    );
end twentynm_io_clock_divider;

architecture behavior of twentynm_io_clock_divider is

component    twentynm_io_clock_divider_encrypted
    generic    (
        power_up    :    string    :=    "low";
        invert_phase    :    string    :=    "false";
        use_masterin    :    string    :=    "false";
        lpm_type    :    string    :=    "twentynm_io_clock_divider"
    );
    port    (
        clk    :    in    std_logic	:= '0';
        phaseinvertctrl    :    in    std_logic	:= '0';
        masterin    :    in    std_logic	:= '0';
        clkout    :    out    std_logic;
        slaveout    :    out    std_logic
    );
end component;

begin


inst : twentynm_io_clock_divider_encrypted
    generic  map  (
        power_up    =>   power_up,
        invert_phase    =>   invert_phase,
        use_masterin    =>   use_masterin,
        lpm_type    =>   lpm_type
    )
    port  map  (
        clk    =>    clk,
        phaseinvertctrl    =>    phaseinvertctrl,
        masterin    =>    masterin,
        clkout    =>    clkout,
        slaveout    =>    slaveout
    );


end behavior;

library IEEE;
use IEEE.std_logic_1164.all;


entity twentynm_io_config is
    generic (
        lpm_type : string := "twentynm_io_config"
    );
    port (
        outputenabledelaysetting : out std_logic_vector(4 downto 0);
        outputhalfratebypass : out std_logic;
        datain : in std_logic := '0';
        readfifomode : out std_logic_vector(2 downto 0);
        readfiforeadclockselect : out std_logic_vector(1 downto 0);
        padtoinputregisterdelaysetting : out std_logic_vector(4 downto 0);
        clk : in std_logic := '0';
        ena : in std_logic := '0';
        outputregdelaysetting : out std_logic_vector(4 downto 0);
        dataout : out std_logic;
        update : in std_logic := '0'
    );
end twentynm_io_config;

architecture behavior of twentynm_io_config is

component twentynm_io_config_encrypted
    generic (
        lpm_type : string := "twentynm_io_config"
    );
    port (
        outputenabledelaysetting : out std_logic_vector(4 downto 0);
        outputhalfratebypass : out std_logic;
        datain : in std_logic := '0';
        readfifomode : out std_logic_vector(2 downto 0);
        readfiforeadclockselect : out std_logic_vector(1 downto 0);
        padtoinputregisterdelaysetting : out std_logic_vector(4 downto 0);
        clk : in std_logic := '0';
        ena : in std_logic := '0';
        outputregdelaysetting : out std_logic_vector(4 downto 0);
        dataout : out std_logic;
        update : in std_logic := '0'
    );
end component;

begin

inst : twentynm_io_config_encrypted
    generic map (
        lpm_type => lpm_type
    )
    port map (
        outputenabledelaysetting => outputenabledelaysetting,
        outputhalfratebypass => outputhalfratebypass,
        datain => datain,
        readfifomode => readfifomode,
        readfiforeadclockselect => readfiforeadclockselect,
        padtoinputregisterdelaysetting => padtoinputregisterdelaysetting,
        clk => clk,
        ena => ena,
        outputregdelaysetting => outputregdelaysetting,
        dataout => dataout,
        update => update
    );

end behavior;

library IEEE;
use IEEE.std_logic_1164.all;


entity twentynm_ir_fifo_userdes is
    generic (
        a_rb_bypass_serializer : string := "false";
        a_use_dynamic_fifo_mode : string := "false";
        a_rb_fifo_mode : string := "serializer_mode";
        a_rb_data_width : integer := 9;
        a_enable_soft_cdr : string := "false";
        a_rb_tx_outclk : string := "false";
        a_rb_bslipcfg : integer := 0;
        a_sim_wclk_pre_delay : integer := 0;
        a_sim_readenable_pre_delay : integer := 0
    );
    port (
        bslipmax : out std_logic;
        dynfifomode : in std_logic_vector(2 downto 0) := (OTHERS => '0');
        observableout : out std_logic;
        writeenable : in std_logic := '0';
        readclk : in std_logic := '0';
        txin : in std_logic_vector(9 downto 0) := (OTHERS => '0');
        regscanovrd : in std_logic := '0';
        rxout : out std_logic_vector(9 downto 0);
        bslipout : out std_logic;
        rstn : in std_logic := '0';
        loaden : in std_logic := '0';
        lvdsmodeen : out std_logic;
        bslipctl : in std_logic := '0';
        observablefout3 : out std_logic;
        scanin : in std_logic := '0';
        readenable : in std_logic := '0';
        scanout : out std_logic;
        writeclk : in std_logic := '0';
        observablefout2 : out std_logic;
        dinfiforx : in std_logic_vector(1 downto 0) := (OTHERS => '0');
        tstclk : in std_logic := '0';
        observablefout4 : out std_logic;
        observablefout1 : out std_logic;
        dout : out std_logic_vector(3 downto 0);
        bslipin : in std_logic := '0';
        txout : out std_logic;
        regscan : in std_logic := '0';
        observablewaddrcnt : out std_logic;
        lvdstxsel : out std_logic
    );
end twentynm_ir_fifo_userdes;

architecture behavior of twentynm_ir_fifo_userdes is

component twentynm_ir_fifo_userdes_encrypted
    generic (
        a_rb_bypass_serializer : string := "false";
        a_use_dynamic_fifo_mode : string := "false";
        a_rb_fifo_mode : string := "serializer_mode";
        a_rb_data_width : integer := 9;
        a_enable_soft_cdr : string := "false";
        a_rb_tx_outclk : string := "false";
        a_rb_bslipcfg : integer := 0;
        a_sim_wclk_pre_delay : integer := 0;
        a_sim_readenable_pre_delay : integer := 0
    );
    port (
        bslipmax : out std_logic;
        dynfifomode : in std_logic_vector(2 downto 0) := (OTHERS => '0');
        observableout : out std_logic;
        writeenable : in std_logic := '0';
        readclk : in std_logic := '0';
        txin : in std_logic_vector(9 downto 0) := (OTHERS => '0');
        regscanovrd : in std_logic := '0';
        rxout : out std_logic_vector(9 downto 0);
        bslipout : out std_logic;
        rstn : in std_logic := '0';
        loaden : in std_logic := '0';
        lvdsmodeen : out std_logic;
        bslipctl : in std_logic := '0';
        observablefout3 : out std_logic;
        scanin : in std_logic := '0';
        readenable : in std_logic := '0';
        scanout : out std_logic;
        writeclk : in std_logic := '0';
        observablefout2 : out std_logic;
        dinfiforx : in std_logic_vector(1 downto 0) := (OTHERS => '0');
        tstclk : in std_logic := '0';
        observablefout4 : out std_logic;
        observablefout1 : out std_logic;
        dout : out std_logic_vector(3 downto 0);
        bslipin : in std_logic := '0';
        txout : out std_logic;
        regscan : in std_logic := '0';
        observablewaddrcnt : out std_logic;
        lvdstxsel : out std_logic
    );
end component;

begin

inst : twentynm_ir_fifo_userdes_encrypted
    generic map (
        a_rb_bypass_serializer => a_rb_bypass_serializer,
        a_use_dynamic_fifo_mode => a_use_dynamic_fifo_mode,
        a_rb_fifo_mode => a_rb_fifo_mode,
        a_rb_data_width => a_rb_data_width,
        a_enable_soft_cdr => a_enable_soft_cdr,
        a_rb_tx_outclk => a_rb_tx_outclk,
        a_rb_bslipcfg => a_rb_bslipcfg,
        a_sim_wclk_pre_delay => a_sim_wclk_pre_delay,
        a_sim_readenable_pre_delay => a_sim_readenable_pre_delay
    )
    port map (
        bslipmax => bslipmax,
        dynfifomode => dynfifomode,
        observableout => observableout,
        writeenable => writeenable,
        readclk => readclk,
        txin => txin,
        regscanovrd => regscanovrd,
        rxout => rxout,
        bslipout => bslipout,
        rstn => rstn,
        loaden => loaden,
        lvdsmodeen => lvdsmodeen,
        bslipctl => bslipctl,
        observablefout3 => observablefout3,
        scanin => scanin,
        readenable => readenable,
        scanout => scanout,
        writeclk => writeclk,
        observablefout2 => observablefout2,
        dinfiforx => dinfiforx,
        tstclk => tstclk,
        observablefout4 => observablefout4,
        observablefout1 => observablefout1,
        dout => dout,
        bslipin => bslipin,
        txout => txout,
        regscan => regscan,
        observablewaddrcnt => observablewaddrcnt,
        lvdstxsel => lvdstxsel
    );

end behavior;

library IEEE;
use IEEE.std_logic_1164.all;


entity twentynm_leveling_delay_chain is
    generic (
        sim_buffer_intrinsic_delay : integer := 175;
        sim_buffer_delay_increment : integer := 10;
        physical_clock_source : string := "dqs"
    );
    port (
        clkin : in std_logic := '0';
        delayctrlin : in std_logic_vector(6 downto 0) := (OTHERS => '0');
        clkout : out std_logic_vector(3 downto 0)
    );
end twentynm_leveling_delay_chain;

architecture behavior of twentynm_leveling_delay_chain is

component twentynm_leveling_delay_chain_encrypted
    generic (
        sim_buffer_intrinsic_delay : integer := 175;
        sim_buffer_delay_increment : integer := 10;
        physical_clock_source : string := "dqs"
    );
    port (
        clkin : in std_logic := '0';
        delayctrlin : in std_logic_vector(6 downto 0) := (OTHERS => '0');
        clkout : out std_logic_vector(3 downto 0)
    );
end component;

begin

inst : twentynm_leveling_delay_chain_encrypted
    generic map (
        sim_buffer_intrinsic_delay => sim_buffer_intrinsic_delay,
        sim_buffer_delay_increment => sim_buffer_delay_increment,
        physical_clock_source => physical_clock_source
    )
    port map (
        clkin => clkin,
        delayctrlin => delayctrlin,
        clkout => clkout
    );

end behavior;

library IEEE;
use IEEE.std_logic_1164.all;


entity twentynm_lfifo is
    generic (
        oct_lfifo_enable : integer := -1
    );
    port (
        rdlatency : in std_logic_vector(4 downto 0) := (OTHERS => '0');
        rdatavalid : out std_logic;
        clk : in std_logic := '0';
        rden : out std_logic;
        rdataen : in std_logic := '0';
        rstn : in std_logic := '0';
        rdataenfull : in std_logic := '0'
    );
end twentynm_lfifo;

architecture behavior of twentynm_lfifo is

component twentynm_lfifo_encrypted
    generic (
        oct_lfifo_enable : integer := -1
    );
    port (
        rdlatency : in std_logic_vector(4 downto 0) := (OTHERS => '0');
        rdatavalid : out std_logic;
        clk : in std_logic := '0';
        rden : out std_logic;
        rdataen : in std_logic := '0';
        rstn : in std_logic := '0';
        rdataenfull : in std_logic := '0'
    );
end component;

begin

inst : twentynm_lfifo_encrypted
    generic map (
        oct_lfifo_enable => oct_lfifo_enable
    )
    port map (
        rdlatency => rdlatency,
        rdatavalid => rdatavalid,
        clk => clk,
        rden => rden,
        rdataen => rdataen,
        rstn => rstn,
        rdataenfull => rdataenfull
    );

end behavior;


library IEEE;
use IEEE.std_logic_1164.all;


entity twentynm_vfifo is
    port (
        qvldin : in std_logic := '0';
        rdclk : in std_logic := '0';
        rstn : in std_logic := '0';
        wrclk : in std_logic := '0';
        incwrptr : in std_logic := '0'
    );
end twentynm_vfifo;

architecture behavior of twentynm_vfifo is

component twentynm_vfifo_encrypted
    port (
        qvldin : in std_logic := '0';
        rdclk : in std_logic := '0';
        rstn : in std_logic := '0';
        wrclk : in std_logic := '0';
        incwrptr : in std_logic := '0'
    );
end component;

begin

inst : twentynm_vfifo_encrypted
    port map (
        qvldin => qvldin,
        rdclk => rdclk,
        rstn => rstn,
        wrclk => wrclk,
        incwrptr => incwrptr
    );

end behavior;


library IEEE;
use IEEE.std_logic_1164.all;


entity twentynm_mem_phy is
    generic (
        hphy_use_hphy : string := "true";
        hphy_reset_delay_en : string := "false";
        hphy_hhp_hps : string := "false";
        hphy_wrap_back_en : string := "false";
        hphy_datapath_delay : string := "zero_cycles";
        m_hphy_ac_rom_init_file : string := "ac_ROM.hex";
        hphy_ac_ddr_disable : string := "true";
        hphy_csr_pipelineglobalenable : string := "true";
        m_hphy_inst_rom_init_file : string := "inst_ROM.hex";
        hphy_atpg_en : string := "false"
    );
    port (
        iointaddrdout : in std_logic_vector(63 downto 0) := (OTHERS => '0');
        iointresetndout : in std_logic_vector(3 downto 0) := (OTHERS => '0');
        iointckedout : in std_logic_vector(7 downto 0) := (OTHERS => '0');
        afirlat : out std_logic_vector(4 downto 0);
        iointdqoe : in std_logic_vector(89 downto 0) := (OTHERS => '0');
        afiaddr : in std_logic_vector(19 downto 0) := (OTHERS => '0');
        cfgtwr : in std_logic_vector(7 downto 0) := (OTHERS => '0');
        afidm : in std_logic_vector(9 downto 0) := (OTHERS => '0');
        afiwdatavalid : in std_logic_vector(4 downto 0) := (OTHERS => '0');
        avlread : in std_logic := '0';
        phyddiockndout : out std_logic_vector(3 downto 0);
        iointckndout : in std_logic_vector(3 downto 0) := (OTHERS => '0');
        iointbadout : in std_logic_vector(11 downto 0) := (OTHERS => '0');
        cfgdevicewidth : in std_logic_vector(7 downto 0) := (OTHERS => '0');
        cfgcoladdrwidth : in std_logic_vector(7 downto 0) := (OTHERS => '0');
        iointdqdin : out std_logic_vector(179 downto 0);
        scanen : in std_logic := '0';
        afiwlat : out std_logic_vector(3 downto 0);
        phyddiodqsoe : out std_logic_vector(9 downto 0);
        cfgaddlat : in std_logic_vector(7 downto 0) := (OTHERS => '0');
        afirdataen : in std_logic_vector(4 downto 0) := (OTHERS => '0');
        phyddiodqslogicincrdataen : out std_logic_vector(9 downto 0);
        phyddiodqslogicoct : out std_logic_vector(9 downto 0);
        iointdqsoe : in std_logic_vector(9 downto 0) := (OTHERS => '0');
        phyddiodqslogicaclrpstamble : out std_logic_vector(4 downto 0);
        phyddiodqsboe : out std_logic_vector(9 downto 0);
        phyddiodqdout : out std_logic_vector(179 downto 0);
        iointaficalfail : out std_logic;
        avlwritedata : in std_logic_vector(31 downto 0) := (OTHERS => '0');
        iointdqsboe : in std_logic_vector(9 downto 0) := (OTHERS => '0');
        phyddiodqslogicreadlatency : out std_logic_vector(24 downto 0);
        iointwendout : in std_logic_vector(3 downto 0) := (OTHERS => '0');
        afiodt : in std_logic_vector(1 downto 0) := (OTHERS => '0');
        iointcsndout : in std_logic_vector(7 downto 0) := (OTHERS => '0');
        phyddiorasndout : out std_logic_vector(3 downto 0);
        phyddiocsndout : out std_logic_vector(7 downto 0);
        iointdqslogicoct : in std_logic_vector(9 downto 0) := (OTHERS => '0');
        softresetn : in std_logic := '0';
        phyddiodqsdout : out std_logic_vector(19 downto 0);
        iointafiwlat : out std_logic_vector(3 downto 0);
        iointdqslogicdqsena : in std_logic_vector(9 downto 0) := (OTHERS => '0');
        afiba : in std_logic_vector(2 downto 0) := (OTHERS => '0');
        phyddiodqslogicdqsena : out std_logic_vector(9 downto 0);
        pllavlclk : in std_logic := '0';
        aficasn : in std_logic := '0';
        cfgbankaddrwidth : in std_logic_vector(7 downto 0) := (OTHERS => '0');
        phyddiowendout : out std_logic_vector(3 downto 0);
        phyddiockedout : out std_logic_vector(7 downto 0);
        cfgdramconfig : in std_logic_vector(23 downto 0) := (OTHERS => '0');
        aficsn : in std_logic_vector(1 downto 0) := (OTHERS => '0');
        avlwaitrequest : out std_logic;
        phyddioodtdout : out std_logic_vector(7 downto 0);
        ddiophydqslogicrdatavalid : in std_logic_vector(4 downto 0) := (OTHERS => '0');
        avlwrite : in std_logic := '0';
        afirasn : in std_logic := '0';
        plladdrcmdclk : in std_logic := '0';
        phyddioaddrdout : out std_logic_vector(63 downto 0);
        aficalfail : out std_logic;
        afimemclkdisable : in std_logic := '0';
        afiwdata : in std_logic_vector(79 downto 0) := (OTHERS => '0');
        iointdqslogicreadlatency : in std_logic_vector(24 downto 0) := (OTHERS => '0');
        phyddiodmdout : out std_logic_vector(19 downto 0);
        pllaficlk : in std_logic := '0';
        cfgtrfc : in std_logic_vector(7 downto 0) := (OTHERS => '0');
        iointckdout : in std_logic_vector(3 downto 0) := (OTHERS => '0');
        aficke : in std_logic_vector(1 downto 0) := (OTHERS => '0');
        iointrasndout : in std_logic_vector(3 downto 0) := (OTHERS => '0');
        phyddioresetndout : out std_logic_vector(3 downto 0);
        aficalsuccess : out std_logic;
        ddiophydqdin : in std_logic_vector(179 downto 0) := (OTHERS => '0');
        iointcasndout : in std_logic_vector(3 downto 0) := (OTHERS => '0');
        iointdqsdout : in std_logic_vector(19 downto 0) := (OTHERS => '0');
        cfgcsaddrwidth : in std_logic_vector(7 downto 0) := (OTHERS => '0');
        phyddiockdout : out std_logic_vector(3 downto 0);
        avlreaddata : out std_logic_vector(31 downto 0);
        afirdata : out std_logic_vector(79 downto 0);
        phyresetn : out std_logic;
        iointdqslogicincrdataen : in std_logic_vector(9 downto 0) := (OTHERS => '0');
        afiwen : in std_logic := '0';
        globalresetn : in std_logic := '0';
        phyddiodqsbdout : out std_logic_vector(19 downto 0);
        plllocked : in std_logic := '0';
        phyddiodqslogicfiforeset : out std_logic_vector(4 downto 0);
        iointdqslogicfiforeset : in std_logic_vector(4 downto 0) := (OTHERS => '0');
        iointodtdout : in std_logic_vector(7 downto 0) := (OTHERS => '0');
        iointafirlat : out std_logic_vector(4 downto 0);
        iointaficalsuccess : out std_logic;
        iointdqdout : in std_logic_vector(179 downto 0) := (OTHERS => '0');
        cfgrowaddrwidth : in std_logic_vector(7 downto 0) := (OTHERS => '0');
        phyddiodqslogicaclrfifoctrl : out std_logic_vector(4 downto 0);
        phyddiobadout : out std_logic_vector(11 downto 0);
        afirdatavalid : out std_logic;
        cfgtrefi : in std_logic_vector(15 downto 0) := (OTHERS => '0');
        cfgcaswrlat : in std_logic_vector(7 downto 0) := (OTHERS => '0');
        afirstn : in std_logic := '0';
        avlresetn : in std_logic := '0';
        iointdqsbdout : in std_logic_vector(19 downto 0) := (OTHERS => '0');
        phyddiodqoe : out std_logic_vector(89 downto 0);
        iointdqslogicrdatavalid : out std_logic_vector(4 downto 0);
        avladdress : in std_logic_vector(15 downto 0) := (OTHERS => '0');
        afidqsburst : in std_logic_vector(4 downto 0) := (OTHERS => '0');
        iointdqslogicincwrptr : in std_logic_vector(9 downto 0) := (OTHERS => '0');
        phyddiodqslogicincwrptr : out std_logic_vector(9 downto 0);
        cfgtcl : in std_logic_vector(7 downto 0) := (OTHERS => '0');
        ctlresetn : out std_logic;
        cfginterfacewidth : in std_logic_vector(7 downto 0) := (OTHERS => '0');
        phyddiocasndout : out std_logic_vector(3 downto 0);
        afirdataenfull : in std_logic_vector(4 downto 0) := (OTHERS => '0');
        cfgtmrd : in std_logic_vector(7 downto 0) := (OTHERS => '0');
        iointdmdout : in std_logic_vector(19 downto 0) := (OTHERS => '0')
    );
end twentynm_mem_phy;

architecture behavior of twentynm_mem_phy is

component twentynm_mem_phy_encrypted
    generic (
        hphy_use_hphy : string := "true";
        hphy_reset_delay_en : string := "false";
        hphy_hhp_hps : string := "false";
        hphy_wrap_back_en : string := "false";
        hphy_datapath_delay : string := "zero_cycles";
        m_hphy_ac_rom_init_file : string := "ac_ROM.hex";
        hphy_ac_ddr_disable : string := "true";
        hphy_csr_pipelineglobalenable : string := "true";
        m_hphy_inst_rom_init_file : string := "inst_ROM.hex";
        hphy_atpg_en : string := "false"
    );
    port (
        iointaddrdout : in std_logic_vector(63 downto 0) := (OTHERS => '0');
        iointresetndout : in std_logic_vector(3 downto 0) := (OTHERS => '0');
        iointckedout : in std_logic_vector(7 downto 0) := (OTHERS => '0');
        afirlat : out std_logic_vector(4 downto 0);
        iointdqoe : in std_logic_vector(89 downto 0) := (OTHERS => '0');
        afiaddr : in std_logic_vector(19 downto 0) := (OTHERS => '0');
        cfgtwr : in std_logic_vector(7 downto 0) := (OTHERS => '0');
        afidm : in std_logic_vector(9 downto 0) := (OTHERS => '0');
        afiwdatavalid : in std_logic_vector(4 downto 0) := (OTHERS => '0');
        avlread : in std_logic := '0';
        phyddiockndout : out std_logic_vector(3 downto 0);
        iointckndout : in std_logic_vector(3 downto 0) := (OTHERS => '0');
        iointbadout : in std_logic_vector(11 downto 0) := (OTHERS => '0');
        cfgdevicewidth : in std_logic_vector(7 downto 0) := (OTHERS => '0');
        cfgcoladdrwidth : in std_logic_vector(7 downto 0) := (OTHERS => '0');
        iointdqdin : out std_logic_vector(179 downto 0);
        scanen : in std_logic := '0';
        afiwlat : out std_logic_vector(3 downto 0);
        phyddiodqsoe : out std_logic_vector(9 downto 0);
        cfgaddlat : in std_logic_vector(7 downto 0) := (OTHERS => '0');
        afirdataen : in std_logic_vector(4 downto 0) := (OTHERS => '0');
        phyddiodqslogicincrdataen : out std_logic_vector(9 downto 0);
        phyddiodqslogicoct : out std_logic_vector(9 downto 0);
        iointdqsoe : in std_logic_vector(9 downto 0) := (OTHERS => '0');
        phyddiodqslogicaclrpstamble : out std_logic_vector(4 downto 0);
        phyddiodqsboe : out std_logic_vector(9 downto 0);
        phyddiodqdout : out std_logic_vector(179 downto 0);
        iointaficalfail : out std_logic;
        avlwritedata : in std_logic_vector(31 downto 0) := (OTHERS => '0');
        iointdqsboe : in std_logic_vector(9 downto 0) := (OTHERS => '0');
        phyddiodqslogicreadlatency : out std_logic_vector(24 downto 0);
        iointwendout : in std_logic_vector(3 downto 0) := (OTHERS => '0');
        afiodt : in std_logic_vector(1 downto 0) := (OTHERS => '0');
        iointcsndout : in std_logic_vector(7 downto 0) := (OTHERS => '0');
        phyddiorasndout : out std_logic_vector(3 downto 0);
        phyddiocsndout : out std_logic_vector(7 downto 0);
        iointdqslogicoct : in std_logic_vector(9 downto 0) := (OTHERS => '0');
        softresetn : in std_logic := '0';
        phyddiodqsdout : out std_logic_vector(19 downto 0);
        iointafiwlat : out std_logic_vector(3 downto 0);
        iointdqslogicdqsena : in std_logic_vector(9 downto 0) := (OTHERS => '0');
        afiba : in std_logic_vector(2 downto 0) := (OTHERS => '0');
        phyddiodqslogicdqsena : out std_logic_vector(9 downto 0);
        pllavlclk : in std_logic := '0';
        aficasn : in std_logic := '0';
        cfgbankaddrwidth : in std_logic_vector(7 downto 0) := (OTHERS => '0');
        phyddiowendout : out std_logic_vector(3 downto 0);
        phyddiockedout : out std_logic_vector(7 downto 0);
        cfgdramconfig : in std_logic_vector(23 downto 0) := (OTHERS => '0');
        aficsn : in std_logic_vector(1 downto 0) := (OTHERS => '0');
        avlwaitrequest : out std_logic;
        phyddioodtdout : out std_logic_vector(7 downto 0);
        ddiophydqslogicrdatavalid : in std_logic_vector(4 downto 0) := (OTHERS => '0');
        avlwrite : in std_logic := '0';
        afirasn : in std_logic := '0';
        plladdrcmdclk : in std_logic := '0';
        phyddioaddrdout : out std_logic_vector(63 downto 0);
        aficalfail : out std_logic;
        afimemclkdisable : in std_logic := '0';
        afiwdata : in std_logic_vector(79 downto 0) := (OTHERS => '0');
        iointdqslogicreadlatency : in std_logic_vector(24 downto 0) := (OTHERS => '0');
        phyddiodmdout : out std_logic_vector(19 downto 0);
        pllaficlk : in std_logic := '0';
        cfgtrfc : in std_logic_vector(7 downto 0) := (OTHERS => '0');
        iointckdout : in std_logic_vector(3 downto 0) := (OTHERS => '0');
        aficke : in std_logic_vector(1 downto 0) := (OTHERS => '0');
        iointrasndout : in std_logic_vector(3 downto 0) := (OTHERS => '0');
        phyddioresetndout : out std_logic_vector(3 downto 0);
        aficalsuccess : out std_logic;
        ddiophydqdin : in std_logic_vector(179 downto 0) := (OTHERS => '0');
        iointcasndout : in std_logic_vector(3 downto 0) := (OTHERS => '0');
        iointdqsdout : in std_logic_vector(19 downto 0) := (OTHERS => '0');
        cfgcsaddrwidth : in std_logic_vector(7 downto 0) := (OTHERS => '0');
        phyddiockdout : out std_logic_vector(3 downto 0);
        avlreaddata : out std_logic_vector(31 downto 0);
        afirdata : out std_logic_vector(79 downto 0);
        phyresetn : out std_logic;
        iointdqslogicincrdataen : in std_logic_vector(9 downto 0) := (OTHERS => '0');
        afiwen : in std_logic := '0';
        globalresetn : in std_logic := '0';
        phyddiodqsbdout : out std_logic_vector(19 downto 0);
        plllocked : in std_logic := '0';
        phyddiodqslogicfiforeset : out std_logic_vector(4 downto 0);
        iointdqslogicfiforeset : in std_logic_vector(4 downto 0) := (OTHERS => '0');
        iointodtdout : in std_logic_vector(7 downto 0) := (OTHERS => '0');
        iointafirlat : out std_logic_vector(4 downto 0);
        iointaficalsuccess : out std_logic;
        iointdqdout : in std_logic_vector(179 downto 0) := (OTHERS => '0');
        cfgrowaddrwidth : in std_logic_vector(7 downto 0) := (OTHERS => '0');
        phyddiodqslogicaclrfifoctrl : out std_logic_vector(4 downto 0);
        phyddiobadout : out std_logic_vector(11 downto 0);
        afirdatavalid : out std_logic;
        cfgtrefi : in std_logic_vector(15 downto 0) := (OTHERS => '0');
        cfgcaswrlat : in std_logic_vector(7 downto 0) := (OTHERS => '0');
        afirstn : in std_logic := '0';
        avlresetn : in std_logic := '0';
        iointdqsbdout : in std_logic_vector(19 downto 0) := (OTHERS => '0');
        phyddiodqoe : out std_logic_vector(89 downto 0);
        iointdqslogicrdatavalid : out std_logic_vector(4 downto 0);
        avladdress : in std_logic_vector(15 downto 0) := (OTHERS => '0');
        afidqsburst : in std_logic_vector(4 downto 0) := (OTHERS => '0');
        iointdqslogicincwrptr : in std_logic_vector(9 downto 0) := (OTHERS => '0');
        phyddiodqslogicincwrptr : out std_logic_vector(9 downto 0);
        cfgtcl : in std_logic_vector(7 downto 0) := (OTHERS => '0');
        ctlresetn : out std_logic;
        cfginterfacewidth : in std_logic_vector(7 downto 0) := (OTHERS => '0');
        phyddiocasndout : out std_logic_vector(3 downto 0);
        afirdataenfull : in std_logic_vector(4 downto 0) := (OTHERS => '0');
        cfgtmrd : in std_logic_vector(7 downto 0) := (OTHERS => '0');
        iointdmdout : in std_logic_vector(19 downto 0) := (OTHERS => '0')
    );
end component;

begin

inst : twentynm_mem_phy_encrypted
    generic map (
        hphy_use_hphy => hphy_use_hphy,
        hphy_reset_delay_en => hphy_reset_delay_en,
        hphy_hhp_hps => hphy_hhp_hps,
        hphy_wrap_back_en => hphy_wrap_back_en,
        hphy_datapath_delay => hphy_datapath_delay,
        m_hphy_ac_rom_init_file => m_hphy_ac_rom_init_file,
        hphy_ac_ddr_disable => hphy_ac_ddr_disable,
        hphy_csr_pipelineglobalenable => hphy_csr_pipelineglobalenable,
        m_hphy_inst_rom_init_file => m_hphy_inst_rom_init_file,
        hphy_atpg_en => hphy_atpg_en
    )
    port map (
        iointaddrdout => iointaddrdout,
        iointresetndout => iointresetndout,
        iointckedout => iointckedout,
        afirlat => afirlat,
        iointdqoe => iointdqoe,
        afiaddr => afiaddr,
        cfgtwr => cfgtwr,
        afidm => afidm,
        afiwdatavalid => afiwdatavalid,
        avlread => avlread,
        phyddiockndout => phyddiockndout,
        iointckndout => iointckndout,
        iointbadout => iointbadout,
        cfgdevicewidth => cfgdevicewidth,
        cfgcoladdrwidth => cfgcoladdrwidth,
        iointdqdin => iointdqdin,
        scanen => scanen,
        afiwlat => afiwlat,
        phyddiodqsoe => phyddiodqsoe,
        cfgaddlat => cfgaddlat,
        afirdataen => afirdataen,
        phyddiodqslogicincrdataen => phyddiodqslogicincrdataen,
        phyddiodqslogicoct => phyddiodqslogicoct,
        iointdqsoe => iointdqsoe,
        phyddiodqslogicaclrpstamble => phyddiodqslogicaclrpstamble,
        phyddiodqsboe => phyddiodqsboe,
        phyddiodqdout => phyddiodqdout,
        iointaficalfail => iointaficalfail,
        avlwritedata => avlwritedata,
        iointdqsboe => iointdqsboe,
        phyddiodqslogicreadlatency => phyddiodqslogicreadlatency,
        iointwendout => iointwendout,
        afiodt => afiodt,
        iointcsndout => iointcsndout,
        phyddiorasndout => phyddiorasndout,
        phyddiocsndout => phyddiocsndout,
        iointdqslogicoct => iointdqslogicoct,
        softresetn => softresetn,
        phyddiodqsdout => phyddiodqsdout,
        iointafiwlat => iointafiwlat,
        iointdqslogicdqsena => iointdqslogicdqsena,
        afiba => afiba,
        phyddiodqslogicdqsena => phyddiodqslogicdqsena,
        pllavlclk => pllavlclk,
        aficasn => aficasn,
        cfgbankaddrwidth => cfgbankaddrwidth,
        phyddiowendout => phyddiowendout,
        phyddiockedout => phyddiockedout,
        cfgdramconfig => cfgdramconfig,
        aficsn => aficsn,
        avlwaitrequest => avlwaitrequest,
        phyddioodtdout => phyddioodtdout,
        ddiophydqslogicrdatavalid => ddiophydqslogicrdatavalid,
        avlwrite => avlwrite,
        afirasn => afirasn,
        plladdrcmdclk => plladdrcmdclk,
        phyddioaddrdout => phyddioaddrdout,
        aficalfail => aficalfail,
        afimemclkdisable => afimemclkdisable,
        afiwdata => afiwdata,
        iointdqslogicreadlatency => iointdqslogicreadlatency,
        phyddiodmdout => phyddiodmdout,
        pllaficlk => pllaficlk,
        cfgtrfc => cfgtrfc,
        iointckdout => iointckdout,
        aficke => aficke,
        iointrasndout => iointrasndout,
        phyddioresetndout => phyddioresetndout,
        aficalsuccess => aficalsuccess,
        ddiophydqdin => ddiophydqdin,
        iointcasndout => iointcasndout,
        iointdqsdout => iointdqsdout,
        cfgcsaddrwidth => cfgcsaddrwidth,
        phyddiockdout => phyddiockdout,
        avlreaddata => avlreaddata,
        afirdata => afirdata,
        phyresetn => phyresetn,
        iointdqslogicincrdataen => iointdqslogicincrdataen,
        afiwen => afiwen,
        globalresetn => globalresetn,
        phyddiodqsbdout => phyddiodqsbdout,
        plllocked => plllocked,
        phyddiodqslogicfiforeset => phyddiodqslogicfiforeset,
        iointdqslogicfiforeset => iointdqslogicfiforeset,
        iointodtdout => iointodtdout,
        iointafirlat => iointafirlat,
        iointaficalsuccess => iointaficalsuccess,
        iointdqdout => iointdqdout,
        cfgrowaddrwidth => cfgrowaddrwidth,
        phyddiodqslogicaclrfifoctrl => phyddiodqslogicaclrfifoctrl,
        phyddiobadout => phyddiobadout,
        afirdatavalid => afirdatavalid,
        cfgtrefi => cfgtrefi,
        cfgcaswrlat => cfgcaswrlat,
        afirstn => afirstn,
        avlresetn => avlresetn,
        iointdqsbdout => iointdqsbdout,
        phyddiodqoe => phyddiodqoe,
        iointdqslogicrdatavalid => iointdqslogicrdatavalid,
        avladdress => avladdress,
        afidqsburst => afidqsburst,
        iointdqslogicincwrptr => iointdqslogicincwrptr,
        phyddiodqslogicincwrptr => phyddiodqslogicincwrptr,
        cfgtcl => cfgtcl,
        ctlresetn => ctlresetn,
        cfginterfacewidth => cfginterfacewidth,
        phyddiocasndout => phyddiocasndout,
        afirdataenfull => afirdataenfull,
        cfgtmrd => cfgtmrd,
        iointdmdout => iointdmdout
    );

end behavior;


library IEEE;
use IEEE.std_logic_1164.all;


entity twentynm_phy_clkbuf is
    port (
        outclk : out std_logic_vector(3 downto 0);
        inclk : in std_logic_vector(3 downto 0) := (OTHERS => '0')
    );
end twentynm_phy_clkbuf;

architecture behavior of twentynm_phy_clkbuf is

component twentynm_phy_clkbuf_encrypted
    port (
        outclk : out std_logic_vector(3 downto 0);
        inclk : in std_logic_vector(3 downto 0) := (OTHERS => '0')
    );
end component;

begin

inst : twentynm_phy_clkbuf_encrypted
    port map (
        outclk => outclk,
        inclk => inclk
    );

end behavior;


library IEEE;
use IEEE.std_logic_1164.all;


entity twentynm_read_fifo_read_clock_select is
    port (
        clksel : in std_logic_vector(1 downto 0) := (OTHERS => '0');
        clkin : in std_logic_vector(2 downto 0) := (OTHERS => '0')
    );
end twentynm_read_fifo_read_clock_select;

architecture behavior of twentynm_read_fifo_read_clock_select is

component twentynm_read_fifo_read_clock_select_encrypted
    port (
        clksel : in std_logic_vector(1 downto 0) := (OTHERS => '0');
        clkin : in std_logic_vector(2 downto 0) := (OTHERS => '0')
    );
end component;

begin

inst : twentynm_read_fifo_read_clock_select_encrypted
    port map (
        clksel => clksel,
        clkin => clkin
    );

end behavior;


library IEEE;
use IEEE.std_logic_1164.all;


entity    twentynm_lvds_rx    is
    generic    (
        data_align_rollover    :    integer    :=    2;
        enable_dpa    :    string    :=    "off";
        lose_lock_on_one_change    :    string    :=    "off";
        reset_fifo_at_first_lock    :    string    :=    "on";
        align_to_rising_edge_only    :    string    :=    "on";
        use_serial_feedback_input    :    string    :=    "off";
        dpa_debug    :    string    :=    "off";
        x_on_bitslip    :    string    :=    "on";
        enable_soft_cdr    :    string    :=    "off";
        dpa_output_clock_phase_shift    :    integer    :=    0;
        enable_dpa_initial_phase_selection    :    string    :=    "off";
        dpa_initial_phase_value    :    integer    :=    0;
        enable_dpa_align_to_rising_edge_only    :    string    :=    "off";
        net_ppm_variation    :    integer    :=    0;
        is_negative_ppm_drift    :    string    :=    "off";
        rx_input_path_delay_engineering_bits    :    integer    :=    2;
        lpm_type    :    string    :=    "twentynm_lvds_rx";
        data_width    :    integer    :=    10
    );
    port    (
        clock0    :    in    std_logic	:= '0';
        datain    :    in    std_logic	:= '0';
        enable0    :    in    std_logic	:= '0';
        dpareset    :    in    std_logic	:= '0';
        dpahold    :    in    std_logic	:= '0';
        dpaswitch    :    in    std_logic	:= '0';
        fiforeset    :    in    std_logic	:= '0';
        bitslip    :    in    std_logic	:= '0';
        bitslipreset    :    in    std_logic	:= '0';
        serialfbk    :    in    std_logic	:= '0';
        devclrn    :    in    std_logic	:= '1';
        devpor    :    in    std_logic	:= '1';
        dpaclkin    :    in    std_logic_vector(7 downto 0)	:= (OTHERS => '0');
        dataout    :    out    std_logic_vector(data_width-1 downto 0);
        dpalock    :    out    std_logic;
        bitslipmax    :    out    std_logic;
        serialdataout    :    out    std_logic;
        postdpaserialdataout    :    out    std_logic;
        divfwdclk    :    out    std_logic;
        dpaclkout    :    out    std_logic;
        observableout    :    out    std_logic_vector(3 downto 0)
    );
end twentynm_lvds_rx;

architecture behavior of twentynm_lvds_rx is

component    twentynm_lvds_rx_encrypted
    generic    (
        data_align_rollover    :    integer    :=    2;
        enable_dpa    :    string    :=    "off";
        lose_lock_on_one_change    :    string    :=    "off";
        reset_fifo_at_first_lock    :    string    :=    "on";
        align_to_rising_edge_only    :    string    :=    "on";
        use_serial_feedback_input    :    string    :=    "off";
        dpa_debug    :    string    :=    "off";
        x_on_bitslip    :    string    :=    "on";
        enable_soft_cdr    :    string    :=    "off";
        dpa_output_clock_phase_shift    :    integer    :=    0;
        enable_dpa_initial_phase_selection    :    string    :=    "off";
        dpa_initial_phase_value    :    integer    :=    0;
        enable_dpa_align_to_rising_edge_only    :    string    :=    "off";
        net_ppm_variation    :    integer    :=    0;
        is_negative_ppm_drift    :    string    :=    "off";
        rx_input_path_delay_engineering_bits    :    integer    :=    2;
        lpm_type    :    string    :=    "twentynm_lvds_rx";
        data_width    :    integer    :=    10
    );
    port    (
        clock0    :    in    std_logic	:= '0';
        datain    :    in    std_logic	:= '0';
        enable0    :    in    std_logic	:= '0';
        dpareset    :    in    std_logic	:= '0';
        dpahold    :    in    std_logic	:= '0';
        dpaswitch    :    in    std_logic	:= '0';
        fiforeset    :    in    std_logic	:= '0';
        bitslip    :    in    std_logic	:= '0';
        bitslipreset    :    in    std_logic	:= '0';
        serialfbk    :    in    std_logic	:= '0';
        devclrn    :    in    std_logic	:= '1';
        devpor    :    in    std_logic	:= '1';
        dpaclkin    :    in    std_logic_vector(7 downto 0)	:= (OTHERS => '0');
        dataout    :    out    std_logic_vector(data_width-1 downto 0);
        dpalock    :    out    std_logic;
        bitslipmax    :    out    std_logic;
        serialdataout    :    out    std_logic;
        postdpaserialdataout    :    out    std_logic;
        divfwdclk    :    out    std_logic;
        dpaclkout    :    out    std_logic;
        observableout    :    out    std_logic_vector(3 downto 0)
    );
end component;

begin


inst : twentynm_lvds_rx_encrypted
    generic  map  (
        data_align_rollover    =>   data_align_rollover,
        enable_dpa    =>   enable_dpa,
        lose_lock_on_one_change    =>   lose_lock_on_one_change,
        reset_fifo_at_first_lock    =>   reset_fifo_at_first_lock,
        align_to_rising_edge_only    =>   align_to_rising_edge_only,
        use_serial_feedback_input    =>   use_serial_feedback_input,
        dpa_debug    =>   dpa_debug,
        x_on_bitslip    =>   x_on_bitslip,
        enable_soft_cdr    =>   enable_soft_cdr,
        dpa_output_clock_phase_shift    =>   dpa_output_clock_phase_shift,
        enable_dpa_initial_phase_selection    =>   enable_dpa_initial_phase_selection,
        dpa_initial_phase_value    =>   dpa_initial_phase_value,
        enable_dpa_align_to_rising_edge_only    =>   enable_dpa_align_to_rising_edge_only,
        net_ppm_variation    =>   net_ppm_variation,
        is_negative_ppm_drift    =>   is_negative_ppm_drift,
        rx_input_path_delay_engineering_bits    =>   rx_input_path_delay_engineering_bits,
        lpm_type    =>   lpm_type,
        data_width    =>   data_width
    )
    port  map  (
        clock0    =>    clock0,
        datain    =>    datain,
        enable0    =>    enable0,
        dpareset    =>    dpareset,
        dpahold    =>    dpahold,
        dpaswitch    =>    dpaswitch,
        fiforeset    =>    fiforeset,
        bitslip    =>    bitslip,
        bitslipreset    =>    bitslipreset,
        serialfbk    =>    serialfbk,
        devclrn    =>    devclrn,
        devpor    =>    devpor,
        dpaclkin    =>    dpaclkin,
        dataout    =>    dataout,
        dpalock    =>    dpalock,
        bitslipmax    =>    bitslipmax,
        serialdataout    =>    serialdataout,
        postdpaserialdataout    =>    postdpaserialdataout,
        divfwdclk    =>    divfwdclk,
        dpaclkout    =>    dpaclkout,
        observableout    =>    observableout
    );


end behavior;

library IEEE;
use IEEE.std_logic_1164.all;


entity    twentynm_lvds_tx    is
    generic    (
        bypass_serializer    :    string    :=    "false";
        invert_clock    :    string    :=    "false";
        use_falling_clock_edge    :    string    :=    "false";
        use_serial_data_input    :    string    :=    "false";
        use_post_dpa_serial_data_input    :    string    :=    "false";
        is_used_as_outclk    :    string    :=    "false";
        tx_output_path_delay_engineering_bits    :    integer    :=    -1;
        enable_dpaclk_to_lvdsout    :    string    :=    "off";
        lpm_type    :    string    :=    "twentynm_lvds_tx";
        data_width    :    integer    :=    10
    );
    port    (
        datain    :    in    std_logic_vector(data_width-1 downto 0)	:= (OTHERS => '0');
        clock0    :    in    std_logic	:= '0';
        enable0    :    in    std_logic	:= '0';
        serialdatain    :    in    std_logic	:= '0';
        postdpaserialdatain    :    in    std_logic	:= '0';
        devclrn    :    in    std_logic	:= '1';
        devpor    :    in    std_logic	:= '1';
        dpaclkin    :    in    std_logic	:= '0';
        dataout    :    out    std_logic;
        serialfdbkout    :    out    std_logic;
        observableout    :    out    std_logic_vector(2 downto 0)
    );
end twentynm_lvds_tx;

architecture behavior of twentynm_lvds_tx is

component    twentynm_lvds_tx_encrypted
    generic    (
        bypass_serializer    :    string    :=    "false";
        invert_clock    :    string    :=    "false";
        use_falling_clock_edge    :    string    :=    "false";
        use_serial_data_input    :    string    :=    "false";
        use_post_dpa_serial_data_input    :    string    :=    "false";
        is_used_as_outclk    :    string    :=    "false";
        tx_output_path_delay_engineering_bits    :    integer    :=    -1;
        enable_dpaclk_to_lvdsout    :    string    :=    "off";
        lpm_type    :    string    :=    "twentynm_lvds_tx";
        data_width    :    integer    :=    10
    );
    port    (
        datain    :    in    std_logic_vector(data_width-1 downto 0)	:= (OTHERS => '0');
        clock0    :    in    std_logic	:= '0';
        enable0    :    in    std_logic	:= '0';
        serialdatain    :    in    std_logic	:= '0';
        postdpaserialdatain    :    in    std_logic	:= '0';
        devclrn    :    in    std_logic	:= '1';
        devpor    :    in    std_logic	:= '1';
        dpaclkin    :    in    std_logic	:= '0';
        dataout    :    out    std_logic;
        serialfdbkout    :    out    std_logic;
        observableout    :    out    std_logic_vector(2 downto 0)
    );
end component;

begin


inst : twentynm_lvds_tx_encrypted
    generic  map  (
        bypass_serializer    =>   bypass_serializer,
        invert_clock    =>   invert_clock,
        use_falling_clock_edge    =>   use_falling_clock_edge,
        use_serial_data_input    =>   use_serial_data_input,
        use_post_dpa_serial_data_input    =>   use_post_dpa_serial_data_input,
        is_used_as_outclk    =>   is_used_as_outclk,
        tx_output_path_delay_engineering_bits    =>   tx_output_path_delay_engineering_bits,
        enable_dpaclk_to_lvdsout    =>   enable_dpaclk_to_lvdsout,
        lpm_type    =>   lpm_type,
        data_width    =>   data_width
    )
    port  map  (
        datain    =>    datain,
        clock0    =>    clock0,
        enable0    =>    enable0,
        serialdatain    =>    serialdatain,
        postdpaserialdatain    =>    postdpaserialdatain,
        devclrn    =>    devclrn,
        devpor    =>    devpor,
        dpaclkin    =>    dpaclkin,
        dataout    =>    dataout,
        serialfdbkout    =>    serialfdbkout,
        observableout    =>    observableout
    );


end behavior;

library IEEE;
use IEEE.std_logic_1164.all;


entity    twentynm_output_alignment    is
    generic    (
        power_up    :    string    :=    "low";
        async_mode    :    string    :=    "none";
        sync_mode    :    string    :=    "none";
        add_output_cycle_delay    :    string    :=    "false";
        add_2nd_output_cycle_delay    :    string    :=    "false";
        add_phase_transfer_reg    :    string    :=    "false";
        bypass_output_register    :    string    :=    "false"
    );
    port    (
        datain    :    in    std_logic	:= '1';
        clk    :    in    std_logic	:= '0';
        areset    :    in    std_logic	:= '0';
        sreset    :    in    std_logic	:= '0';
        enaoutputcycledelay    :    in    std_logic	:= '0';
        ena2ndoutputcycledelay    :    in    std_logic	:= '0';
        enaphasetransferreg    :    in    std_logic	:= '0';
        dataout    :    out    std_logic;
        dffin    :    out    std_logic;
        dff1t    :    out    std_logic;
        dff2t    :    out    std_logic;
        dffphasetransfer    :    out    std_logic
    );
end twentynm_output_alignment;

architecture behavior of twentynm_output_alignment is

component    twentynm_output_alignment_encrypted
    generic    (
        power_up    :    string    :=    "low";
        async_mode    :    string    :=    "none";
        sync_mode    :    string    :=    "none";
        add_output_cycle_delay    :    string    :=    "false";
        add_2nd_output_cycle_delay    :    string    :=    "false";
        add_phase_transfer_reg    :    string    :=    "false";
        bypass_output_register    :    string    :=    "false"
    );
    port    (
        datain    :    in    std_logic	:= '1';
        clk    :    in    std_logic	:= '0';
        areset    :    in    std_logic	:= '0';
        sreset    :    in    std_logic	:= '0';
        enaoutputcycledelay    :    in    std_logic	:= '0';
        ena2ndoutputcycledelay    :    in    std_logic	:= '0';
        enaphasetransferreg    :    in    std_logic	:= '0';
        dataout    :    out    std_logic;
        dffin    :    out    std_logic;
        dff1t    :    out    std_logic;
        dff2t    :    out    std_logic;
        dffphasetransfer    :    out    std_logic
    );
end component;

begin


inst : twentynm_output_alignment_encrypted
    generic  map  (
        power_up    =>   power_up,
        async_mode    =>   async_mode,
        sync_mode    =>   sync_mode,
        add_output_cycle_delay    =>   add_output_cycle_delay,
        add_2nd_output_cycle_delay    =>   add_2nd_output_cycle_delay,
        add_phase_transfer_reg    =>   add_phase_transfer_reg,
        bypass_output_register    =>   bypass_output_register
    )
    port  map  (
        datain    =>    datain,
        clk    =>    clk,
        areset    =>    areset,
        sreset    =>    sreset,
        enaoutputcycledelay    =>    enaoutputcycledelay,
        ena2ndoutputcycledelay    =>    ena2ndoutputcycledelay,
        enaphasetransferreg    =>    enaphasetransferreg,
        dataout    =>    dataout,
        dffin    =>    dffin,
        dff1t    =>    dff1t,
        dff2t    =>    dff2t,
        dffphasetransfer    =>    dffphasetransfer
    );


end behavior;


library IEEE;
use IEEE.std_logic_1164.all;


entity twentynm_termination_logic is
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
 	
end twentynm_termination_logic;

architecture behavior of twentynm_termination_logic is

component twentynm_termination_logic_encrypted
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
end component;

begin

inst : twentynm_termination_logic_encrypted
    generic map (
        lpm_type => lpm_type,
	a_iob_oct_block => a_iob_oct_block,
	a_iob_oct_serdata => a_iob_oct_serdata
    )
    port map (
    	s2pload => s2pload,
	serdata => serdata,
	scan_in => scan_in,
	scan_shift_n => scan_shift_n,
	scan_out => scan_out,
    	seriesterminationcontrol => seriesterminationcontrol,
	parallelterminationcontrol => parallelterminationcontrol
    );

end behavior;

library IEEE;
use IEEE.std_logic_1164.all;


entity twentynm_termination is
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
end twentynm_termination;

architecture behavior of twentynm_termination is

component twentynm_termination_encrypted
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
end component;

begin

inst : twentynm_termination_encrypted
    generic map (
        lpm_type => lpm_type,
	a_oct_cal_mode => a_oct_cal_mode,
    	a_oct_user_oct => a_oct_user_oct,
    	a_oct_rsmultp1 => a_oct_rsmultp1,
    	a_oct_rsmultp2 => a_oct_rsmultp2,
    	a_oct_rsmultn1 => a_oct_rsmultn1,
    	a_oct_rsmultn2 => a_oct_rsmultn2,
    	a_oct_rsadjust1 => a_oct_rsadjust1,
    	a_oct_rsadjust2 => a_oct_rsadjust2,
    	a_oct_rtmult1  => a_oct_rtmult1,
    	a_oct_rtmult2  => a_oct_rtmult2,
    	a_oct_rtadjust1 => a_oct_rtadjust1,
    	a_oct_rtadjust2=> a_oct_rtadjust2
	)
    port map (
    	rzqin => rzqin,
    	enserusr => enserusr,
    	nclrusr => nclrusr,
    	clkenusr => clkenusr,
    	clkusr => clkusr,
	ser_data_dq_to_core => ser_data_dq_to_core,
	ser_data_ca_to_core => ser_data_ca_to_core,
	ser_data_dq_from_core => ser_data_dq_from_core,
	ser_data_ca_from_core => ser_data_ca_from_core,
	serdataout => serdataout
    );

end behavior;


library IEEE;
use IEEE.std_logic_1164.all;

entity    twentynm_asmiblock    is
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
end twentynm_asmiblock;

architecture behavior of twentynm_asmiblock is

component    twentynm_asmiblock_encrypted
    generic    (
        lpm_type    :    string		:=  "twentynm_asmiblock";
		enable_sim  :	 string		:=  "false"
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
        data2oe   	:    in    std_logic;
        data3oe   	:    in    std_logic;
        data0in   	:    out   std_logic;
        data1in    	:    out   std_logic;
        data2in    	:    out   std_logic;
        data3in    	:    out   std_logic;
		spidclk		:    out   std_logic;
		spidataout	:    out   std_logic_vector(3 downto 0);
		spisce 		:    out   std_logic_vector(2 downto 0);
		spidatain	:    in    std_logic_vector(3 downto 0)
    );
end component;

begin

inst : twentynm_asmiblock_encrypted
    generic  map  (
        lpm_type    =>   lpm_type,
		enable_sim  =>	 enable_sim
    )
    port  map  (
        dclk    	=>    dclk,
        sce    		=>    sce,
        oe    		=>    oe,
        data0out    =>    data0out,
        data1out    =>    data1out,
        data2out    =>    data2out,
        data3out    =>    data3out,
        data0oe    	=>    data0oe,
        data1oe    	=>    data1oe,
        data2oe    	=>    data2oe,
        data3oe    	=>    data3oe,
        data0in    	=>    data0in,
        data1in    	=>    data1in,
        data2in    	=>    data2in,
        data3in    	=>    data3in,
		spidclk    	=>    spidclk,
		spidataout  =>    spidataout,
		spisce    	=>    spisce,
		spidatain   =>    spidatain
    );

end behavior;


library IEEE;
use IEEE.std_logic_1164.all;

entity    twentynm_crcblock    is
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
end twentynm_crcblock;

architecture behavior of twentynm_crcblock is

component    twentynm_crcblock_encrypted
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
end component;

begin

inst : twentynm_crcblock_encrypted
    generic  map  (
		crc_enable    				=>   crc_enable,
        oscillator_divider    		=>   oscillator_divider,
		error_delay    				=>   error_delay,
		disable_col_bits_updated    =>   disable_col_bits_updated,
		crc_deld_disable   		 	=>   crc_deld_disable,
		col_chk_bit_update_retry	=>   col_chk_bit_update_retry,
		edcrc_start_frame    		=>   edcrc_start_frame,
		edcrc_stop_frame    		=>   edcrc_stop_frame,
		n_edcrc_colums   		 	=>   n_edcrc_colums,
        lpm_type    =>   lpm_type
    )
    port  map  (
        clk    			=>    clk,
        shiftnld    	=>    shiftnld,
        crcerror    	=>    crcerror,
        regout    		=>    regout,
		endofedfullchip	=> endofedfullchip
    );

end behavior;


library IEEE;
use IEEE.std_logic_1164.all;

entity    twentynm_opregblock    is
    generic    (
        lpm_type    :   string  :=  "twentynm_opregblock"
    );
    port    (
        clk         :    in     std_logic;
        shiftnld    :    in     std_logic;
        regout      :    out    std_logic
    );
end twentynm_opregblock;

architecture behavior of twentynm_opregblock is
begin
    -- feedthrough model
end behavior;


library IEEE;
use IEEE.std_logic_1164.all;

entity    twentynm_jtag    is
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
end twentynm_jtag;

architecture behavior of twentynm_jtag is

component    twentynm_jtag_encrypted
    generic    (
        lpm_type    :    string    :=    "twentynm_jtag"
    );
    port    (
        tms    			: in    std_logic;
        tck    			: in    std_logic;
        tdi    			: in    std_logic;
        ntrst    		: in    std_logic;
        tdoutap    		: in    std_logic;
        tdouser    		: in    std_logic;
        tmscore 		: in 	std_logic;
        tckcore 		: in 	std_logic;
        tdicore 		: in 	std_logic;
        ntrstcore 		: in 	std_logic;
        tmscorehps 		: in 	std_logic;
        tckcorehps 		: in 	std_logic;
        tdicorehps 		: in 	std_logic;
        ntrstcorehps	: in 	std_logic;
        tdocorefrwl 	: in 	std_logic;
        corectl 		: in 	std_logic;
        ntdopinena 		: in 	std_logic;
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
end component;

begin

inst : twentynm_jtag_encrypted
    generic  map  (
        lpm_type    =>   lpm_type
    )
    port  map  (
        tms 			=> tms,
        tck 			=> tck,
        tdi 			=> tdi,
        ntrst 			=> ntrst,
        tdoutap 		=> tdoutap,
        tdouser 		=> tdouser,
        tmscore 		=> tmscore,
        tckcore 		=> tckcore,
        tdicore 		=> tdicore,
        ntrstcore 		=> ntrstcore,
        tmscorehps 		=> tmscorehps,
        tckcorehps 		=> tckcorehps,
        tdicorehps 		=> tdicorehps,
        ntrstcorehps	=> ntrstcorehps,
        tdocorefrwl 	=> tdocorefrwl,
        corectl 		=> corectl,
        ntdopinena 		=> ntdopinena,
        tdo 			=> tdo,
        tmsutap 		=> tmsutap,
        tckutap 		=> tckutap,
        tdiutap 		=> tdiutap,
        ntrstutap		=> ntrstutap,
        tmsuhps 		=> tmsuhps,
        tckuhps 		=> tckuhps,
        tdiuhps 		=> tdiuhps,
        ntrstuhps 		=> ntrstuhps,
        tmscoreout 		=> tmscoreout,
        tckcoreout 		=> tckcoreout,
        tdocorehps 		=> tdocorehps,
        ntrstcoreout 	=> ntrstcoreout,
        tdocore 		=> tdocore,
        shiftuser 		=> shiftuser,
        clkdruser 		=> clkdruser,
        updateuser 		=> updateuser,
        runidleuser 	=> runidleuser,
        usr1user 		=> usr1user
     );

end behavior;


library IEEE;
use IEEE.std_logic_1164.all;

entity    twentynm_jtagblock    is
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
end twentynm_jtagblock;

architecture behavior of twentynm_jtagblock is

begin

end behavior;


library IEEE;
use IEEE.std_logic_1164.all;

entity    twentynm_rublock    is
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
end twentynm_rublock;

architecture behavior of twentynm_rublock is

component    twentynm_rublock_encrypted
    generic    (
        sim_init_watchdog_value    		:    integer	:= 0;
        sim_init_status    				:    integer	:= 0;
        sim_init_config_is_application	:    string		:= "false";
        sim_init_watchdog_enabled  		:    string		:= "false";
        lpm_type    					:    string		:= "twentynm_rublock"
    );
    port    (
        clk    		:    in    std_logic;
        ctl    		:    in    std_logic_vector(1 downto 0);
        regin    	:    in    std_logic;
        rsttimer    :    in    std_logic;
        rconfig    	:    in    std_logic;
        regout    	:    out    std_logic
    );
end component;

begin

inst : twentynm_rublock_encrypted
    generic  map  (
        sim_init_watchdog_value    		=>   sim_init_watchdog_value,
        sim_init_status    				=>   sim_init_status,
        sim_init_config_is_application	=>   sim_init_config_is_application,
        sim_init_watchdog_enabled    	=>   sim_init_watchdog_enabled,
        lpm_type    					=>   lpm_type
    )
    port  map  (
        clk    		=>    clk,
        ctl    		=>    ctl,
        regin    	=>    regin,
        rsttimer    =>    rsttimer,
        rconfig    	=>    rconfig,
        regout    	=>    regout
    );

end behavior;


library IEEE;
use IEEE.std_logic_1164.all;

entity    twentynm_tsdblock    is
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
end twentynm_tsdblock;

architecture behavior of twentynm_tsdblock is

component    twentynm_tsdblock_encrypted
    generic    (
        lpm_type    :    string    :=    "twentynm_tsdblock"
    );
    port    (
        corectl	:    in    std_logic;
        reset	:    in    std_logic;
		scanen	:    in    std_logic;
		scanin	:    in    std_logic;
        tempout	:    out   std_logic_vector(9 downto 0);
        eoc		:    out   std_logic
    );
end component;

begin

inst : twentynm_tsdblock_encrypted
    generic  map  (
        lpm_type    =>   lpm_type
    )
    port  map  (
        corectl	=>    corectl,
        reset	=>    reset,
		scanen	=>    scanen,
		scanin	=>    scanin,
        tempout	=>    tempout,
        eoc		=>    eoc
    );

end behavior;


library IEEE;
use IEEE.std_logic_1164.all;

entity    twentynm_vsblock    is
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
end twentynm_vsblock;

architecture behavior of twentynm_vsblock is

component    twentynm_vsblock_encrypted
    generic    (
        lpm_type    :    string    :=    "twentynm_vsblock"
    );
    port    (
        clk  	 	:    in    	std_logic;
        reset    	:    in    	std_logic;
		corectl  	:    in    	std_logic;
		coreconfig  :    in    	std_logic;
		confin	  	:    in    	std_logic;
		chsel  		:    in    	std_logic_vector(3 downto 0);
        dataout  	:    out   	std_logic_vector(11 downto 0);
        eoc		 	:    out   	std_logic;
		eos		 	:    out   	std_logic;
		muxsel  	:    out	std_logic_vector(3 downto 0)
    );
end component;

begin

inst : twentynm_vsblock_encrypted
    generic  map  (
        lpm_type    =>   lpm_type
    )
    port  map  (
        clk    		=>    clk,
        reset	   	=>    reset,
		corectl    	=>    corectl,
		coreconfig  =>    coreconfig,
		confin    	=>    confin,
		chsel    	=>    chsel,
        dataout    	=>    dataout,
		eoc    		=>    eoc,
        eos    		=>    eos,
		muxsel    	=>    muxsel
    );

end behavior;


library IEEE;
use IEEE.std_logic_1164.all;


entity    twentynm_read_fifo    is
    generic    (
        use_half_rate_read    :    string    :=    "false"
    );
    port    (
    	datain	:	in std_logic_vector(1 downto 0)	:= (OTHERS => '0');
        wclk	: in std_logic	:= '0';
        we	: in std_logic	:= '0';
        rclk : in std_logic	:= '0';
        re : in std_logic	:= '0';
        areset : in std_logic	:= '0';
        plus2 : in std_logic	:= '0';
        dataout : out std_logic_vector(3 downto 0)
    );
end twentynm_read_fifo;

architecture behavior of twentynm_read_fifo is

component    twentynm_read_fifo_encrypted
    generic    (
        use_half_rate_read    :    string    :=    "false"
    );
    port    (
        datain	:	in std_logic_vector(1 downto 0)	:= (OTHERS => '0');
        wclk	: in std_logic	:= '0';
        we	: in std_logic	:= '0';
        rclk : in std_logic	:= '0';	
        re : in std_logic	:= '0';
        areset : in std_logic	:= '0';
        plus2 : in std_logic	:= '0';
        dataout : out std_logic_vector(3 downto 0)
    );
end component;

begin


inst : twentynm_read_fifo_encrypted
    generic  map  (
        use_half_rate_read    =>   use_half_rate_read
    )
    port  map  (
    	datain => datain,
    	wclk => wclk,
    	we => we,
    	rclk => rclk,
    	re => re,
    	areset => areset,
    	plus2 => plus2,
    	dataout => dataout
    );


end behavior;

library IEEE;
use IEEE.std_logic_1164.all;


entity    twentynm_read_fifo_read_enable    is
    generic    (
        use_stalled_read_enable    :    string    :=    "false"
    );
    port    (
    	re	:	in std_logic	:= '1';
    	rclk	:	in std_logic	:= '0';
        plus2	:	in std_logic	:= '0';
        areset	:	in std_logic	:= '0';
        reout	: 	out std_logic;
        plus2out	:	out std_logic
    );
end twentynm_read_fifo_read_enable;

architecture behavior of twentynm_read_fifo_read_enable is

component    twentynm_read_fifo_read_enable_encrypted
    generic    (
        use_stalled_read_enable    :    string    :=    "false"
    );
    port    (
    	re	:	in std_logic	:= '1';
    	rclk	:	in std_logic	:= '0';
    	plus2	:	in std_logic	:= '0';
    	areset	:	in std_logic	:= '0';
    	reout	:	out std_logic;
    	plus2out	:	out std_logic	
    );
end component;

begin


inst : twentynm_read_fifo_read_enable_encrypted
    generic  map  (
        use_stalled_read_enable    =>   use_stalled_read_enable
    )
    port  map  (
    	re => re,
    	rclk => rclk,
    	plus2 => plus2,
    	areset => areset,
    	reout => reout,
    	plus2out => plus2out
    );


end behavior;


library IEEE;
use IEEE.std_logic_1164.all;

entity	twentynm_fp_mac	is
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
end twentynm_fp_mac;

architecture behavior of twentynm_fp_mac is

component    twentynm_fp_mac_encrypted
    generic    (
   	operation_mode	:	string;
	use_chainin	:	string;
	adder_subtract	:	string;
	
	ax_clock	:	string;
        ay_clock	:	string;
        az_clock	:	string;
	output_clock	:	string;
	accumulate_clock	:	string;
	accum_pipeline_clock	:	string;
	accum_adder_clock	:	string;
	ax_chainin_pl_clock	:	string;
	mult_pipeline_clock	:	string;
	adder_input_clock	:	string
    );
    port    (
   	ax	:	in std_logic_vector(31 downto 0);
        ay	:	in std_logic_vector(31 downto 0);
	az	:	in std_logic_vector(31 downto 0);
	chainin	:	in std_logic_vector(31 downto 0);
	chainin_overflow	:	in std_logic;
	chainin_underflow	:	in std_logic;
	chainin_inexact	:	in std_logic;
	chainin_invalid	:	in std_logic;
	
	accumulate	:	in std_logic;
	clk	:	in std_logic_vector(2 downto 0);
	ena	:	in std_logic_vector(2 downto 0);
        aclr	:	in std_logic_vector(1 downto 0);
	
	resulta	:	out std_logic_vector(31 downto 0);
	overflow	:	out std_logic;
	underflow	:	out std_logic;
	inexact	:	out std_logic;
	invalid	:	out std_logic;
	chainout	:	out std_logic_vector(31 downto 0);
	chainout_overflow	:	out std_logic;
	chainout_underflow	:	out std_logic;
	chainout_inexact	:	out std_logic;
	chainout_invalid	:	out std_logic
    );
end component;

begin

inst : twentynm_fp_mac_encrypted
    generic map   (
    	operation_mode	=>	operation_mode,
	use_chainin	=>	use_chainin,
	adder_subtract	=>	adder_subtract,
	
	ax_clock	=>	ax_clock,
        ay_clock	=>	ay_clock,
        az_clock	=>	az_clock,
	output_clock	=>	output_clock,
	accumulate_clock	=>	accumulate_clock,
	accum_pipeline_clock	=>	accum_pipeline_clock,
	accum_adder_clock	=>	accum_adder_clock,
	ax_chainin_pl_clock	=>	ax_chainin_pl_clock,
	mult_pipeline_clock	=>	mult_pipeline_clock,
	adder_input_clock	=>	adder_input_clock
    )
    port map  (
    	ax	=>	ax,
        ay	=>	ay,
	az	=>	az,
	chainin	=>	chainin,
	chainin_overflow	=>	chainin_overflow,
	chainin_underflow	=>	chainin_underflow,
	chainin_inexact	=>	chainin_inexact,
	chainin_invalid	=>	chainin_invalid,
	
	accumulate	=>	accumulate,
	clk	=>	clk,
	ena	=>	ena,
        aclr	=>	aclr,
	
	resulta	=>	resulta,
	overflow	=>	overflow,
	underflow	=>	underflow,
	inexact	=>	inexact,
	invalid	=>	invalid,
	chainout	=>	chainout,
	chainout_overflow	=>	chainout_overflow,
	chainout_underflow	=>	chainout_underflow,
	chainout_inexact	=>	chainout_inexact,
	chainout_invalid	=>	chainout_invalid
   );

end behavior;

library IEEE;
use IEEE.std_logic_1164.all;

entity	twentynm_mac	is
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
end twentynm_mac;

architecture behavior of twentynm_mac is

component    twentynm_mac_encrypted
    generic    (
        ax_width	:				integer;
        ay_scan_in_width	:    	integer;
        az_width    :    			integer;
        bx_width    :    			integer;
        by_width    :    			integer;
        bz_width    :    			integer;
        scan_out_width    :    		integer;
        result_a_width    :    		integer;
        result_b_width    :   		integer;

        operation_mode    :    		string;
        mode_sub_location    :    	integer;
        operand_source_max    :   	string;
        operand_source_may    :    	string;
        operand_source_mbx    :    	string;
        operand_source_mby    :   	string;
        preadder_subtract_a    :    string;
        preadder_subtract_b    :    string;
        signed_max    :    			string;
        signed_may    :    			string;
        signed_mbx    :    			string;
        signed_mby    :    			string;

        ay_use_scan_in    :    		string;
        by_use_scan_in    :    		string;
        delay_scan_out_ay    :    	string;
        delay_scan_out_by    :    	string;
        use_chainadder    :    		string;
        enable_double_accum    :    string;
        load_const_value    :    	integer;

        coef_a_0    :    integer;
        coef_a_1    :    integer;
        coef_a_2    :    integer;
        coef_a_3    :    integer;
        coef_a_4    :    integer;
        coef_a_5    :    integer;
        coef_a_6    :    integer;
        coef_a_7    :    integer;
        coef_b_0    :    integer;
        coef_b_1    :    integer;
        coef_b_2    :    integer;
        coef_b_3    :    integer;
        coef_b_4    :    integer;
        coef_b_5    :    integer;
        coef_b_6    :    integer;
        coef_b_7    :    integer;

        ax_clock    :    			string;
        ay_scan_in_clock    :    	string;
        az_clock    :    			string;
        bx_clock    :    			string;
        by_clock    :    			string;
        bz_clock    :    			string;
        coef_sel_a_clock    :    	string;
        coef_sel_b_clock    :    	string;
        sub_clock    :    			string;
	sub_pipeline_clock    :    		string;
        negate_clock    :    		string;
	negate_pipeline_clock    :    	string;
        accumulate_clock    :    	string;
	accum_pipeline_clock    :    	string;
        load_const_clock    :    	string;
	load_const_pipeline_clock    : 	string;
        output_clock    :    		string;
	input_pipeline_clock	:	string
    );
    port    (
        sub    :    in    		std_logic;
        negate    :    in    	std_logic;
        accumulate    :    in   std_logic;
        loadconst    :    in    std_logic;
        ax    :    in    		std_logic_vector(ax_width-1 downto 0);
        ay    :    in    		std_logic_vector(ay_scan_in_width-1 downto 0);
        scanin    :    in    	std_logic_vector(ay_scan_in_width-1 downto 0);
        az    :    in    		std_logic_vector(az_width-1 downto 0);
        bx    :    in    		std_logic_vector(bx_width-1 downto 0);
        by    :    in    		std_logic_vector(by_width-1 downto 0);
        bz    :    in    		std_logic_vector(bz_width-1 downto 0);
        coefsela    :    in    	std_logic_vector(2 downto 0);
        coefselb    :    in    	std_logic_vector(2 downto 0);
        chainin    :    in    	std_logic_vector(63 downto 0);
        clk    :    in    		std_logic_vector(2 downto 0);
        aclr    :    in    		std_logic_vector(1 downto 0);
        ena    :    in    		std_logic_vector(2 downto 0);
        dftout    :    out    	std_logic;
        resulta    :    out    	std_logic_vector(result_a_width-1 downto 0);
        resultb    :    out    	std_logic_vector(result_b_width-1 downto 0);
        scanout    :    out    	std_logic_vector(scan_out_width-1 downto 0);
        chainout    :    out    std_logic_vector(63 downto 0)
    );
end component;

begin

inst : twentynm_mac_encrypted
    generic map   (
        ax_width    =>   ax_width,
        ay_scan_in_width    =>   ay_scan_in_width,
        az_width    =>   az_width,
        bx_width    =>   bx_width,
        by_width    =>   by_width,
        bz_width    =>   bz_width,
        scan_out_width    =>   scan_out_width,
        result_a_width    =>   result_a_width,
        result_b_width    =>   result_b_width,
		
        operation_mode    =>   operation_mode,
        mode_sub_location    =>   mode_sub_location,
        operand_source_max    =>   operand_source_max,
        operand_source_may    =>   operand_source_may,
        operand_source_mbx    =>   operand_source_mbx,
        operand_source_mby    =>   operand_source_mby,
        preadder_subtract_a    =>   preadder_subtract_a,
        preadder_subtract_b    =>   preadder_subtract_b,
        signed_max    =>   signed_max,
        signed_may    =>   signed_may,
        signed_mbx    =>   signed_mbx,
        signed_mby    =>   signed_mby,

        ay_use_scan_in    =>   ay_use_scan_in,
        by_use_scan_in    =>   by_use_scan_in,
        delay_scan_out_ay    =>   delay_scan_out_ay,
        delay_scan_out_by    =>   delay_scan_out_by,
        use_chainadder    =>   use_chainadder,
        enable_double_accum    =>   enable_double_accum,
        load_const_value    =>   load_const_value,

        coef_a_0    =>   coef_a_0,
        coef_a_1    =>   coef_a_1,
        coef_a_2    =>   coef_a_2,
        coef_a_3    =>   coef_a_3,
        coef_a_4    =>   coef_a_4,
        coef_a_5    =>   coef_a_5,
        coef_a_6    =>   coef_a_6,
        coef_a_7    =>   coef_a_7,
        coef_b_0    =>   coef_b_0,
        coef_b_1    =>   coef_b_1,
        coef_b_2    =>   coef_b_2,
        coef_b_3    =>   coef_b_3,
        coef_b_4    =>   coef_b_4,
        coef_b_5    =>   coef_b_5,
        coef_b_6    =>   coef_b_6,
        coef_b_7    =>   coef_b_7,

        ax_clock    =>   ax_clock,
        ay_scan_in_clock    =>   ay_scan_in_clock,
        az_clock    =>   az_clock,
        bx_clock    =>   bx_clock,
        by_clock    =>   by_clock,
        bz_clock    =>   bz_clock,
        coef_sel_a_clock    =>   coef_sel_a_clock,
        coef_sel_b_clock    =>   coef_sel_b_clock,
        sub_clock    =>   sub_clock,
	sub_pipeline_clock    =>   sub_pipeline_clock,
        negate_clock    =>   negate_clock,
	negate_pipeline_clock    =>   negate_pipeline_clock,
        accumulate_clock    =>   accumulate_clock,
	accum_pipeline_clock    =>   accum_pipeline_clock,
        load_const_clock    =>   load_const_clock,
	load_const_pipeline_clock    =>   load_const_pipeline_clock,
        output_clock    =>   output_clock,
	input_pipeline_clock  => input_pipeline_clock 
    )
    port map  (
        sub    =>    sub,
        negate    =>    negate,
        accumulate    =>    accumulate,
        loadconst    =>    loadconst,
        ax    =>    ax,
        ay    =>    ay,
        scanin    =>    scanin,
        az    =>    az,
        bx    =>    bx,
        by    =>    by,
        bz    =>    bz,
        coefsela    =>    coefsela,
        coefselb    =>    coefselb,
        chainin    =>    chainin,
        clk    =>    clk,
        aclr    =>    aclr,
        ena    =>    ena,
        dftout    =>    dftout,
        resulta    =>    resulta,
        resultb    =>    resultb,
        scanout    =>    scanout,
        chainout    =>    chainout
   );

end behavior;

library IEEE;
use IEEE.std_logic_1164.all;


entity twentynm_serdes_dpa is
    generic (
        tx_loaden_delay_engineering_bits : integer := 0;
        is_negative_ppm_drift : string := "false";
        rx_input_path_delay_engineering_bits : integer := 0;
        enable_dpa_initial_phase_selection : string := "false";
        enable_serial_fdbk_loopback : string := "false";
        enable_post_cdr_serial_loopback : string := "false";
        enable_divfwdclk_test_mode : string := "false";
        lose_lock_on_one_change : string := "false";
        enable_dpa_align_to_rising_edge_only : string := "false";
        net_ppm_variation : integer := 0;
        tx_output_path_delay_engineering_bits : integer := 0;
        bypass_dpa_logic : string := "false";
        tx_fclk_delay_engineering_bits : integer := 0;
        dpa_test_select_mode : string := "bslipmax";
        dpa_initial_phase_value : integer := 0;
        enable_soft_cdr : string := "false";
        invert_clock : string := "false";
        enable_dpa : string := "true";
        dpa_debug : string := "false";
        dpa_clock_output_phase_shift : integer := 0;
        rx_data_width : integer := 4;
        reset_fifo_at_first_lock : string := "false";
        use_falling_clock_edge : string := "false";
        enable_serial_input_loopback : string := "false";
        enable_dpa_rx_data_wrap_back : string := "false";
        align_to_rising_edge_only : string := "false";
        tx_data_width : integer := 10;
        rx_fclk_delay_engineering_bits : integer := 0;
        serdes_dpa_mode : string := "receiver";
        rx_loaden_delay_engineering_bits : integer := 0;
        enable_dpaclk_to_lvdsout : string := "false";
        x_on_bitslip : string := "true"
    );
    port (
        ulvdsout : in std_logic := '0';
        bslipmax : out std_logic;
        lock : out std_logic;
        rxloaden : in std_logic := '0';
        serialfbk : in std_logic := '0';
        corein : in std_logic := '0';
        observableout : out std_logic;
        rxdata : out std_logic_vector(9 downto 0);
        divfwdclk : out std_logic;
        serialdatain : in std_logic := '0';
        txlocallden : out std_logic;
        lvdsin : in std_logic := '0';
        rxlocalfclk : out std_logic;
        rxfclk : in std_logic := '0';
        lvdsout : out std_logic;
        txlocalfclk : out std_logic;
        dparst : in std_logic := '0';
        txfclk : in std_logic := '0';
        ioout : in std_logic := '0';
        txdpaclkin : in std_logic := '0';
        ulvdsin : out std_logic;
        serialfdbkout : out std_logic;
        dpaswitch : in std_logic := '0';
        dpaclkout : out std_logic;
        rxlocallden : out std_logic;
        dpahold : in std_logic := '0';
        fiforst : in std_logic := '0';
        txloaden : in std_logic := '0';
        txdata : in std_logic_vector(6 downto 0) := (OTHERS => '0');
        postdpaserialdatain : in std_logic := '0';
        dpaclkin : in std_logic_vector(7 downto 0) := (OTHERS => '0');
        postdpaserialdataout : out std_logic
    );
end twentynm_serdes_dpa;

architecture behavior of twentynm_serdes_dpa is

component twentynm_serdes_dpa_encrypted
    generic (
        tx_loaden_delay_engineering_bits : integer := 0;
        is_negative_ppm_drift : string := "false";
        rx_input_path_delay_engineering_bits : integer := 0;
        enable_dpa_initial_phase_selection : string := "false";
        enable_serial_fdbk_loopback : string := "false";
        enable_post_cdr_serial_loopback : string := "false";
        enable_divfwdclk_test_mode : string := "false";
        lose_lock_on_one_change : string := "false";
        enable_dpa_align_to_rising_edge_only : string := "false";
        net_ppm_variation : integer := 0;
        tx_output_path_delay_engineering_bits : integer := 0;
        bypass_dpa_logic : string := "false";
        tx_fclk_delay_engineering_bits : integer := 0;
        dpa_test_select_mode : string := "bslipmax";
        dpa_initial_phase_value : integer := 0;
        enable_soft_cdr : string := "false";
        invert_clock : string := "false";
        enable_dpa : string := "true";
        dpa_debug : string := "false";
        dpa_clock_output_phase_shift : integer := 0;
        rx_data_width : integer := 4;
        reset_fifo_at_first_lock : string := "false";
        use_falling_clock_edge : string := "false";
        enable_serial_input_loopback : string := "false";
        enable_dpa_rx_data_wrap_back : string := "false";
        align_to_rising_edge_only : string := "false";
        tx_data_width : integer := 10;
        rx_fclk_delay_engineering_bits : integer := 0;
        serdes_dpa_mode : string := "receiver";
        rx_loaden_delay_engineering_bits : integer := 0;
        enable_dpaclk_to_lvdsout : string := "false";
        x_on_bitslip : string := "true"
    );
    port (
        ulvdsout : in std_logic := '0';
        bslipmax : out std_logic;
        lock : out std_logic;
        rxloaden : in std_logic := '0';
        serialfbk : in std_logic := '0';
        corein : in std_logic := '0';
        observableout : out std_logic;
        rxdata : out std_logic_vector(9 downto 0);
        divfwdclk : out std_logic;
        serialdatain : in std_logic := '0';
        txlocallden : out std_logic;
        lvdsin : in std_logic := '0';
        rxlocalfclk : out std_logic;
        rxfclk : in std_logic := '0';
        lvdsout : out std_logic;
        txlocalfclk : out std_logic;
        dparst : in std_logic := '0';
        txfclk : in std_logic := '0';
        ioout : in std_logic := '0';
        txdpaclkin : in std_logic := '0';
        ulvdsin : out std_logic;
        serialfdbkout : out std_logic;
        dpaswitch : in std_logic := '0';
        dpaclkout : out std_logic;
        rxlocallden : out std_logic;
        dpahold : in std_logic := '0';
        fiforst : in std_logic := '0';
        txloaden : in std_logic := '0';
        txdata : in std_logic_vector(6 downto 0) := (OTHERS => '0');
        postdpaserialdatain : in std_logic := '0';
        dpaclkin : in std_logic_vector(7 downto 0) := (OTHERS => '0');
        postdpaserialdataout : out std_logic
    );
end component;

begin

inst : twentynm_serdes_dpa_encrypted
    generic map (
        tx_loaden_delay_engineering_bits => tx_loaden_delay_engineering_bits,
        is_negative_ppm_drift => is_negative_ppm_drift,
        rx_input_path_delay_engineering_bits => rx_input_path_delay_engineering_bits,
        enable_dpa_initial_phase_selection => enable_dpa_initial_phase_selection,
        enable_serial_fdbk_loopback => enable_serial_fdbk_loopback,
        enable_post_cdr_serial_loopback => enable_post_cdr_serial_loopback,
        enable_divfwdclk_test_mode => enable_divfwdclk_test_mode,
        lose_lock_on_one_change => lose_lock_on_one_change,
        enable_dpa_align_to_rising_edge_only => enable_dpa_align_to_rising_edge_only,
        net_ppm_variation => net_ppm_variation,
        tx_output_path_delay_engineering_bits => tx_output_path_delay_engineering_bits,
        bypass_dpa_logic => bypass_dpa_logic,
        tx_fclk_delay_engineering_bits => tx_fclk_delay_engineering_bits,
        dpa_test_select_mode => dpa_test_select_mode,
        dpa_initial_phase_value => dpa_initial_phase_value,
        enable_soft_cdr => enable_soft_cdr,
        invert_clock => invert_clock,
        enable_dpa => enable_dpa,
        dpa_debug => dpa_debug,
        dpa_clock_output_phase_shift => dpa_clock_output_phase_shift,
        rx_data_width => rx_data_width,
        reset_fifo_at_first_lock => reset_fifo_at_first_lock,
        use_falling_clock_edge => use_falling_clock_edge,
        enable_serial_input_loopback => enable_serial_input_loopback,
        enable_dpa_rx_data_wrap_back => enable_dpa_rx_data_wrap_back,
        align_to_rising_edge_only => align_to_rising_edge_only,
        tx_data_width => tx_data_width,
        rx_fclk_delay_engineering_bits => rx_fclk_delay_engineering_bits,
        serdes_dpa_mode => serdes_dpa_mode,
        rx_loaden_delay_engineering_bits => rx_loaden_delay_engineering_bits,
        enable_dpaclk_to_lvdsout => enable_dpaclk_to_lvdsout,
        x_on_bitslip => x_on_bitslip
    )
    port map (
        ulvdsout => ulvdsout,
        bslipmax => bslipmax,
        lock => lock,
        rxloaden => rxloaden,
        serialfbk => serialfbk,
        corein => corein,
        observableout => observableout,
        rxdata => rxdata,
        divfwdclk => divfwdclk,
        serialdatain => serialdatain,
        txlocallden => txlocallden,
        lvdsin => lvdsin,
        rxlocalfclk => rxlocalfclk,
        rxfclk => rxfclk,
        lvdsout => lvdsout,
        txlocalfclk => txlocalfclk,
        dparst => dparst,
        txfclk => txfclk,
        ioout => ioout,
        txdpaclkin => txdpaclkin,
        ulvdsin => ulvdsin,
        serialfdbkout => serialfdbkout,
        dpaswitch => dpaswitch,
        dpaclkout => dpaclkout,
        rxlocallden => rxlocallden,
        dpahold => dpahold,
        fiforst => fiforst,
        txloaden => txloaden,
        txdata => txdata,
        postdpaserialdatain => postdpaserialdatain,
        dpaclkin => dpaclkin,
        postdpaserialdataout => postdpaserialdataout
    );

end behavior;

library IEEE;
use IEEE.std_logic_1164.all;


entity    twentynm_lvds_clock_tree    is
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
end twentynm_lvds_clock_tree;

architecture behavior of twentynm_lvds_clock_tree is

component    twentynm_lvds_clock_tree_encrypted
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
end component;

begin


inst : twentynm_lvds_clock_tree_encrypted
    generic  map  (
        clock_export_compatible    =>   clock_export_compatible
    )
    port  map  (
        lvdsfclk_in   =>   lvdsfclk_in,
        loaden_in    => loaden_in, 
        lvdsfclk_out   =>   lvdsfclk_out,
        loaden_out    => loaden_out, 
        lvdsfclk_top_out   =>   lvdsfclk_top_out,
        loaden_top_out    => loaden_top_out,
        lvdsfclk_bot_out   =>   lvdsfclk_bot_out,
        loaden_bot_out    => loaden_bot_out
    );
end behavior;


library IEEE;
use IEEE.std_logic_1164.all;

entity    twentynm_oscillator    is
    generic    (
        lpm_type    :    string    :=    "twentynm_oscillator");
    port    (
        oscena    :    in	std_logic;
        clkout    :    out	std_logic;
        clkout1   :    out	std_logic
    );
end twentynm_oscillator;

architecture behavior of twentynm_oscillator is

component    twentynm_oscillator_encrypted
    generic    (
        lpm_type    :    string    :=    "twentynm_oscillator");
    port    (
          oscena    :    in	std_logic;
        clkout    :    out	std_logic;
        clkout1   :    out	std_logic
    );
end component;

begin

inst : twentynm_oscillator_encrypted
    generic  map  (
        lpm_type    =>   lpm_type
    )
    port  map  (
        oscena    =>    oscena,
        clkout    =>    clkout,
        clkout1   =>    clkout1
    );
    
end behavior;


library IEEE;
use IEEE.std_logic_1164.all;


entity    twentynm_iopll    is
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
end twentynm_iopll;

architecture behavior of twentynm_iopll is

component    twentynm_iopll_encrypted
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
		pll_cp_current_setting : string :=  "pll_cp_setting2";
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
end component;

begin


inst : twentynm_iopll_encrypted
    generic  map  (
		reference_clock_frequency     =>    reference_clock_frequency,
		vco_frequency     =>    vco_frequency,
		output_clock_frequency_0     =>    output_clock_frequency_0,
		output_clock_frequency_1     =>    output_clock_frequency_1,
		output_clock_frequency_2     =>    output_clock_frequency_2,
		output_clock_frequency_3     =>    output_clock_frequency_3,
		output_clock_frequency_4     =>    output_clock_frequency_4,
		output_clock_frequency_5     =>    output_clock_frequency_5,
		output_clock_frequency_6     =>    output_clock_frequency_6,
		output_clock_frequency_7     =>    output_clock_frequency_7,
		output_clock_frequency_8     =>    output_clock_frequency_8,
		duty_cycle_0     =>    duty_cycle_0,
		duty_cycle_1     =>    duty_cycle_1,
		duty_cycle_2     =>    duty_cycle_2,
		duty_cycle_3     =>    duty_cycle_3,
		duty_cycle_4     =>    duty_cycle_4,
		duty_cycle_5     =>    duty_cycle_5,
		duty_cycle_6     =>    duty_cycle_6,
		duty_cycle_7     =>    duty_cycle_7,
		duty_cycle_8     =>    duty_cycle_8,
		phase_shift_0     =>    phase_shift_0,
		phase_shift_1     =>    phase_shift_1,
		phase_shift_2     =>    phase_shift_2,
		phase_shift_3     =>    phase_shift_3,
		phase_shift_4     =>    phase_shift_4,
		phase_shift_5     =>    phase_shift_5,
		phase_shift_6     =>    phase_shift_6,
		phase_shift_7     =>    phase_shift_7,
		phase_shift_8     =>    phase_shift_8,
		compensation_mode     =>    compensation_mode,
		bw_sel     =>    bw_sel,
		silicon_rev     =>    silicon_rev,
		speed_grade     =>    speed_grade,
		use_default_base_address     =>    use_default_base_address,
		user_base_address     =>    user_base_address,
		is_cascaded_pll     =>    is_cascaded_pll,
		pll_atb     =>    pll_atb,
		pll_auto_clk_sw_en     =>    pll_auto_clk_sw_en,
		pll_bwctrl     =>    pll_bwctrl,
		pll_c0_extclk_dllout_en     =>    pll_c0_extclk_dllout_en,
		pll_c0_out_en     =>    pll_c0_out_en,
		pll_c1_extclk_dllout_en     =>    pll_c1_extclk_dllout_en,
		pll_c1_out_en     =>    pll_c1_out_en,
		pll_c2_extclk_dllout_en     =>    pll_c2_extclk_dllout_en,
		pll_c2_out_en     =>    pll_c2_out_en,
		pll_c3_extclk_dllout_en     =>    pll_c3_extclk_dllout_en,
		pll_c3_out_en     =>    pll_c3_out_en,
		pll_c4_out_en     =>    pll_c4_out_en,
		pll_c5_out_en     =>    pll_c5_out_en,
		pll_c6_out_en     =>    pll_c6_out_en,
		pll_c7_out_en     =>    pll_c7_out_en,
		pll_c8_out_en     =>    pll_c8_out_en,
		pll_c_counter_0_bypass_en     =>    pll_c_counter_0_bypass_en,
		pll_c_counter_0_coarse_dly     =>    pll_c_counter_0_coarse_dly,
		pll_c_counter_0_even_duty_en     =>    pll_c_counter_0_even_duty_en,
		pll_c_counter_0_fine_dly     =>    pll_c_counter_0_fine_dly,
		pll_c_counter_0_high     =>    pll_c_counter_0_high,
		pll_c_counter_0_in_src     =>    pll_c_counter_0_in_src,
		pll_c_counter_0_low     =>    pll_c_counter_0_low,
		pll_c_counter_0_ph_mux_prst     =>    pll_c_counter_0_ph_mux_prst,
		pll_c_counter_0_prst     =>    pll_c_counter_0_prst,
		pll_c_counter_1_bypass_en     =>    pll_c_counter_1_bypass_en,
		pll_c_counter_1_coarse_dly     =>    pll_c_counter_1_coarse_dly,
		pll_c_counter_1_even_duty_en     =>    pll_c_counter_1_even_duty_en,
		pll_c_counter_1_fine_dly     =>    pll_c_counter_1_fine_dly,
		pll_c_counter_1_high     =>    pll_c_counter_1_high,
		pll_c_counter_1_in_src     =>    pll_c_counter_1_in_src,
		pll_c_counter_1_low     =>    pll_c_counter_1_low,
		pll_c_counter_1_ph_mux_prst     =>    pll_c_counter_1_ph_mux_prst,
		pll_c_counter_1_prst     =>    pll_c_counter_1_prst,
		pll_c_counter_2_bypass_en     =>    pll_c_counter_2_bypass_en,
		pll_c_counter_2_coarse_dly     =>    pll_c_counter_2_coarse_dly,
		pll_c_counter_2_even_duty_en     =>    pll_c_counter_2_even_duty_en,
		pll_c_counter_2_fine_dly     =>    pll_c_counter_2_fine_dly,
		pll_c_counter_2_high     =>    pll_c_counter_2_high,
		pll_c_counter_2_in_src     =>    pll_c_counter_2_in_src,
		pll_c_counter_2_low     =>    pll_c_counter_2_low,
		pll_c_counter_2_ph_mux_prst     =>    pll_c_counter_2_ph_mux_prst,
		pll_c_counter_2_prst     =>    pll_c_counter_2_prst,
		pll_c_counter_3_bypass_en     =>    pll_c_counter_3_bypass_en,
		pll_c_counter_3_coarse_dly     =>    pll_c_counter_3_coarse_dly,
		pll_c_counter_3_even_duty_en     =>    pll_c_counter_3_even_duty_en,
		pll_c_counter_3_fine_dly     =>    pll_c_counter_3_fine_dly,
		pll_c_counter_3_high     =>    pll_c_counter_3_high,
		pll_c_counter_3_in_src     =>    pll_c_counter_3_in_src,
		pll_c_counter_3_low     =>    pll_c_counter_3_low,
		pll_c_counter_3_ph_mux_prst     =>    pll_c_counter_3_ph_mux_prst,
		pll_c_counter_3_prst     =>    pll_c_counter_3_prst,
		pll_c_counter_4_bypass_en     =>    pll_c_counter_4_bypass_en,
		pll_c_counter_4_coarse_dly     =>    pll_c_counter_4_coarse_dly,
		pll_c_counter_4_even_duty_en     =>    pll_c_counter_4_even_duty_en,
		pll_c_counter_4_fine_dly     =>    pll_c_counter_4_fine_dly,
		pll_c_counter_4_high     =>    pll_c_counter_4_high,
		pll_c_counter_4_in_src     =>    pll_c_counter_4_in_src,
		pll_c_counter_4_low     =>    pll_c_counter_4_low,
		pll_c_counter_4_ph_mux_prst     =>    pll_c_counter_4_ph_mux_prst,
		pll_c_counter_4_prst     =>    pll_c_counter_4_prst,
		pll_c_counter_5_bypass_en     =>    pll_c_counter_5_bypass_en,
		pll_c_counter_5_coarse_dly     =>    pll_c_counter_5_coarse_dly,
		pll_c_counter_5_even_duty_en     =>    pll_c_counter_5_even_duty_en,
		pll_c_counter_5_fine_dly     =>    pll_c_counter_5_fine_dly,
		pll_c_counter_5_high     =>    pll_c_counter_5_high,
		pll_c_counter_5_in_src     =>    pll_c_counter_5_in_src,
		pll_c_counter_5_low     =>    pll_c_counter_5_low,
		pll_c_counter_5_ph_mux_prst     =>    pll_c_counter_5_ph_mux_prst,
		pll_c_counter_5_prst     =>    pll_c_counter_5_prst,
		pll_c_counter_6_bypass_en     =>    pll_c_counter_6_bypass_en,
		pll_c_counter_6_coarse_dly     =>    pll_c_counter_6_coarse_dly,
		pll_c_counter_6_even_duty_en     =>    pll_c_counter_6_even_duty_en,
		pll_c_counter_6_fine_dly     =>    pll_c_counter_6_fine_dly,
		pll_c_counter_6_high     =>    pll_c_counter_6_high,
		pll_c_counter_6_in_src     =>    pll_c_counter_6_in_src,
		pll_c_counter_6_low     =>    pll_c_counter_6_low,
		pll_c_counter_6_ph_mux_prst     =>    pll_c_counter_6_ph_mux_prst,
		pll_c_counter_6_prst     =>    pll_c_counter_6_prst,
		pll_c_counter_7_bypass_en     =>    pll_c_counter_7_bypass_en,
		pll_c_counter_7_coarse_dly     =>    pll_c_counter_7_coarse_dly,
		pll_c_counter_7_even_duty_en     =>    pll_c_counter_7_even_duty_en,
		pll_c_counter_7_fine_dly     =>    pll_c_counter_7_fine_dly,
		pll_c_counter_7_high     =>    pll_c_counter_7_high,
		pll_c_counter_7_in_src     =>    pll_c_counter_7_in_src,
		pll_c_counter_7_low     =>    pll_c_counter_7_low,
		pll_c_counter_7_ph_mux_prst     =>    pll_c_counter_7_ph_mux_prst,
		pll_c_counter_7_prst     =>    pll_c_counter_7_prst,
		pll_c_counter_8_bypass_en     =>    pll_c_counter_8_bypass_en,
		pll_c_counter_8_coarse_dly     =>    pll_c_counter_8_coarse_dly,
		pll_c_counter_8_even_duty_en     =>    pll_c_counter_8_even_duty_en,
		pll_c_counter_8_fine_dly     =>    pll_c_counter_8_fine_dly,
		pll_c_counter_8_high     =>    pll_c_counter_8_high,
		pll_c_counter_8_in_src     =>    pll_c_counter_8_in_src,
		pll_c_counter_8_low     =>    pll_c_counter_8_low,
		pll_c_counter_8_ph_mux_prst     =>    pll_c_counter_8_ph_mux_prst,
		pll_c_counter_8_prst     =>    pll_c_counter_8_prst,
		pll_clk_loss_edge     =>    pll_clk_loss_edge,
		pll_clk_loss_sw_en     =>    pll_clk_loss_sw_en,
		pll_clk_sw_dly     =>    pll_clk_sw_dly,
		pll_clkin_0_src     =>    pll_clkin_0_src,
		pll_clkin_1_src     =>    pll_clkin_1_src,
		pll_cmp_buf_dly     =>    pll_cmp_buf_dly,
		pll_coarse_dly_0     =>    pll_coarse_dly_0,
		pll_coarse_dly_1     =>    pll_coarse_dly_1,
		pll_coarse_dly_2     =>    pll_coarse_dly_2,
		pll_coarse_dly_3     =>    pll_coarse_dly_3,
		pll_cp_compensation     =>    pll_cp_compensation,
		pll_cp_current_setting     =>    pll_cp_current_setting,
		pll_ctrl_override_setting     =>    pll_ctrl_override_setting,
		pll_dft_plniotri_override     =>    pll_dft_plniotri_override,
		pll_dft_ppmclk     =>    pll_dft_ppmclk,
		pll_dll_src     =>    pll_dll_src,
		pll_dly_0_enable     =>    pll_dly_0_enable,
		pll_dly_1_enable     =>    pll_dly_1_enable,
		pll_dly_2_enable     =>    pll_dly_2_enable,
		pll_dly_3_enable     =>    pll_dly_3_enable,
		pll_enable     =>    pll_enable,
		pll_extclk_0_cnt_src     =>    pll_extclk_0_cnt_src,
		pll_extclk_0_enable     =>    pll_extclk_0_enable,
		pll_extclk_0_invert     =>    pll_extclk_0_invert,
		pll_extclk_1_cnt_src     =>    pll_extclk_1_cnt_src,
		pll_extclk_1_enable     =>    pll_extclk_1_enable,
		pll_extclk_1_invert     =>    pll_extclk_1_invert,
		pll_fbclk_mux_1     =>    pll_fbclk_mux_1,
		pll_fbclk_mux_2     =>    pll_fbclk_mux_2,
		pll_fine_dly_0     =>    pll_fine_dly_0,
		pll_fine_dly_1     =>    pll_fine_dly_1,
		pll_fine_dly_2     =>    pll_fine_dly_2,
		pll_fine_dly_3     =>    pll_fine_dly_3,
		pll_lock_fltr_cfg     =>    pll_lock_fltr_cfg,
		pll_lock_fltr_test     =>    pll_lock_fltr_test,
		pll_m_counter_bypass_en     =>    pll_m_counter_bypass_en,
		pll_m_counter_coarse_dly     =>    pll_m_counter_coarse_dly,
		pll_m_counter_even_duty_en     =>    pll_m_counter_even_duty_en,
		pll_m_counter_fine_dly     =>    pll_m_counter_fine_dly,
		pll_m_counter_high     =>    pll_m_counter_high,
		pll_m_counter_in_src     =>    pll_m_counter_in_src,
		pll_m_counter_low     =>    pll_m_counter_low,
		pll_m_counter_ph_mux_prst     =>    pll_m_counter_ph_mux_prst,
		pll_m_counter_prst     =>    pll_m_counter_prst,
		pll_manu_clk_sw_en     =>    pll_manu_clk_sw_en,
		pll_n_counter_bypass_en     =>    pll_n_counter_bypass_en,
		pll_n_counter_coarse_dly     =>    pll_n_counter_coarse_dly,
		pll_n_counter_fine_dly     =>    pll_n_counter_fine_dly,
		pll_n_counter_high     =>    pll_n_counter_high,
		pll_n_counter_low     =>    pll_n_counter_low,
		pll_n_counter_odd_div_duty_en     =>    pll_n_counter_odd_div_duty_en,
		pll_nreset_invert     =>    pll_nreset_invert,
		pll_phyfb_mux     =>    pll_phyfb_mux,
		pll_powerdown_mode     =>    pll_powerdown_mode,
		pll_ref_buf_dly     =>    pll_ref_buf_dly,
		pll_ripplecap_ctrl     =>    pll_ripplecap_ctrl,
		pll_self_reset     =>    pll_self_reset,
		pll_sw_refclk_src     =>    pll_sw_refclk_src,
		pll_tclk_mux_en     =>    pll_tclk_mux_en,
		pll_tclk_sel     =>    pll_tclk_sel,
		pll_test_enable     =>    pll_test_enable,
		pll_testdn_enable     =>    pll_testdn_enable,
		pll_testup_enable     =>    pll_testup_enable,
		pll_unlock_fltr_cfg     =>    pll_unlock_fltr_cfg,
		pll_dft_vco_ph0_en     =>    pll_dft_vco_ph0_en,
		pll_dft_vco_ph1_en     =>    pll_dft_vco_ph1_en,
		pll_dft_vco_ph2_en     =>    pll_dft_vco_ph2_en,
		pll_dft_vco_ph3_en     =>    pll_dft_vco_ph3_en,
		pll_dft_vco_ph4_en     =>    pll_dft_vco_ph4_en,
		pll_dft_vco_ph5_en     =>    pll_dft_vco_ph5_en,
		pll_dft_vco_ph6_en     =>    pll_dft_vco_ph6_en,
		pll_dft_vco_ph7_en     =>    pll_dft_vco_ph7_en,
		pll_vccr_pd_en     =>    pll_vccr_pd_en,
		pll_vco_ph0_en     =>    pll_vco_ph0_en,
		pll_vco_ph1_en     =>    pll_vco_ph1_en,
		pll_vco_ph2_en     =>    pll_vco_ph2_en,
		pll_vco_ph3_en     =>    pll_vco_ph3_en,
		pll_vco_ph4_en     =>    pll_vco_ph4_en,
		pll_vco_ph5_en     =>    pll_vco_ph5_en,
		pll_vco_ph6_en     =>    pll_vco_ph6_en,
		pll_vco_ph7_en     =>    pll_vco_ph7_en,
        pll_dprio_base_addr => pll_dprio_base_addr, 
		pll_dprio_broadcast_en => pll_dprio_broadcast_en, 
		pll_dprio_cvp_inter_sel => pll_dprio_cvp_inter_sel, 
		pll_dprio_force_inter_sel => pll_dprio_force_inter_sel, 
		pll_dprio_power_iso_en => pll_dprio_power_iso_en,
        pll_vreg_0p9v1_vreg_cal_en => pll_vreg_0p9v1_vreg_cal_en,
		pll_vreg_0p9v0_vreg_cal_en => pll_vreg_0p9v0_vreg_cal_en,
		pll_vreg_0p9v1_vccdreg_cal => pll_vreg_0p9v1_vccdreg_cal,
		pll_vreg_0p9v0_vccdreg_cal => pll_vreg_0p9v0_vccdreg_cal,
		clock_name_0 => clock_name_0,
		clock_name_1 => clock_name_1,
		clock_name_2 => clock_name_2,
		clock_name_3 => clock_name_3,
		clock_name_4 => clock_name_4,
		clock_name_5 => clock_name_5,
		clock_name_6 => clock_name_6,
		clock_name_7 => clock_name_7,
		clock_name_8 => clock_name_8,
		clock_name_global_0 => clock_name_global_0,
		clock_name_global_1 => clock_name_global_1,
		clock_name_global_2 => clock_name_global_2,
		clock_name_global_3 => clock_name_global_3,
		clock_name_global_4 => clock_name_global_4,
		clock_name_global_5 => clock_name_global_5,
		clock_name_global_6 => clock_name_global_6,
		clock_name_global_7 => clock_name_global_7,
		clock_name_global_8 => clock_name_global_8
    )
    port  map  (
		clken    =>   clken,
		cnt_sel    =>   cnt_sel,
		core_refclk    =>   core_refclk,
		csr_clk    =>   csr_clk,
		csr_en    =>   csr_en,
		csr_in    =>   csr_in,
		dprio_address    =>   dprio_address,
		dprio_clk    =>   dprio_clk,
		dprio_rst_n    =>   dprio_rst_n,
		dps_rst_n    =>   dps_rst_n,
		extswitch    =>   extswitch,
		fbclk_in    =>   fbclk_in,
		fblvds_in    =>   fblvds_in,
		mdio_dis    =>   mdio_dis,
		num_phase_shifts    =>   num_phase_shifts,
		pfden    =>   pfden,
		phase_en    =>   phase_en,
		pipeline_global_en_n    =>   pipeline_global_en_n,
		pll_cascade_in    =>   pll_cascade_in,
		pma_csr_test_dis    =>   pma_csr_test_dis,
		read    =>   read,
		refclk    =>   refclk,
		rst_n    =>   rst_n,
		scan_mode_n    =>   scan_mode_n,
		scan_shift_n    =>   scan_shift_n,
		up_dn    =>   up_dn,
		user_mode    =>   user_mode,
		write    =>   write,
		writedata    =>   writedata,
		zdb_in    =>   zdb_in,
		
		block_select    =>   block_select,
		clk0_bad    =>   clk0_bad,
		clk1_bad    =>   clk1_bad,
		clksel    =>   clksel,
		csr_out    =>   csr_out,
		dll_output    =>   dll_output,
		extclk_dft    =>   extclk_dft,
		extclk_output    =>   extclk_output,
		fbclk_out    =>   fbclk_out,
		fblvds_out    =>   fblvds_out,
		lf_reset    =>   lf_reset,
		loaden    =>   loaden,
		lock    =>   lock,
		lvds_clk    =>   lvds_clk,
		outclk    =>   outclk,
		phase_done    =>   phase_done,
		pll_pd    =>   pll_pd,
		pll_cascade_out    =>   pll_cascade_out,
		readdata    =>   readdata,
		vcop_en    =>   vcop_en,
		vcoph    =>   vcoph
    );
    
    
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;

entity twentynm_ddio_out is
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
end twentynm_ddio_out;

architecture behavior of twentynm_ddio_out is

component twentynm_ddio_out_encrypted
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
end component;

begin

inst : twentynm_ddio_out_encrypted
    generic map (
	power_up => power_up,
        async_mode => async_mode,
        sync_mode => sync_mode,
        half_rate_mode  => half_rate_mode
    )
    port map (
    areset => areset,
    sreset => sreset,
    ena  => ena,
    clk => clk,
    clkhi => clkhi,
    clklo => clklo,
    muxsel => muxsel,
    datainlo => datainlo,
    datainhi => datainhi,
    dataout => dataout,
    dfflo => dfflo,
    dffhi => dffhi,
    devpor => devpor,
    hrbypass => hrbypass,
    devclrn => devclrn
    );

end behavior;


library IEEE;
use IEEE.std_logic_1164.all;

entity twentynm_ddio_in is
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
end twentynm_ddio_in;

architecture behavior of twentynm_ddio_in is

component twentynm_ddio_in_encrypted
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
    datain : in std_logic := '0'
 );
end component;

begin

inst : twentynm_ddio_in_encrypted
    generic map (
	power_up => power_up,
        async_mode => async_mode,
        sync_mode => sync_mode,
        use_clkn  => use_clkn
    )
    port map (
    areset => areset,
    sreset => sreset,
    ena  => ena,
    clk => clk,
    regoutlo => regoutlo,
    regouthi => regouthi,
    datain => datain
    );

end behavior;


library IEEE;
use IEEE.std_logic_1164.all;


entity twentynm_io_serdes_dpa is
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
end twentynm_io_serdes_dpa;

architecture behavior of twentynm_io_serdes_dpa is

component twentynm_io_serdes_dpa_encrypted
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
        dprio_write : in std_logic := '0';
        dprio_writedata : in std_logic_vector(7 downto 0) := (OTHERS => '0');
        dprio_read : in std_logic := '0';
        dprio_readdata : out std_logic_vector(7 downto 0);
        dprio_reg_addr : in std_logic_vector(8 downto 0) := (OTHERS => '0');
        bitslipreset : in std_logic := '0'
    );
end component;

begin

inst : twentynm_io_serdes_dpa_encrypted
    generic map (
        loopback_mode => loopback_mode,
        align_to_rising_edge_only => align_to_rising_edge_only,
        reset_fifo_at_first_lock => reset_fifo_at_first_lock,
        mode => mode,
		silicon_rev => silicon_rev,
        is_negative_ppm_drift => is_negative_ppm_drift,
        data_width => data_width,
        use_falling_clock_edge => use_falling_clock_edge,
        bypass_serializer => bypass_serializer,
        enable_clock_pin_mode => enable_clock_pin_mode,
        bitslip_rollover => bitslip_rollover,
        lose_lock_on_one_change => lose_lock_on_one_change,
        is_tx_outclock => is_tx_outclock,
        vco_div_exponent => vco_div_exponent,
        vco_frequency => vco_frequency,
        net_ppm_variation => net_ppm_variation
    )
    port map (
        loopbackin => loopbackin,
        pclk => pclk,
        loadencorein => loadencorein,
        rxdata => rxdata,
        dpareset => dpareset,
        bitslipmax => bitslipmax,
        lvdsin => lvdsin,
        bitslipcntl => bitslipcntl,
        loopbackout => loopbackout,
        lvdsout => lvdsout,
        fclkcorein => fclkcorein,
        dpafiforeset => dpafiforeset,
        loaden => loaden,
        pclkcorein => pclkcorein,
        fclk => fclk,
        dpaswitch => dpaswitch,
        pclkioin => pclkioin,
        dpahold => dpahold,
        txdata => txdata,
        dpalock => dpalock,
        dpaclk => dpaclk,
        mdio_dis => mdio_dis,
        dprio_clk => dprio_clk,
        dprio_rst_n => dprio_rst_n,
        dprio_block_select => dprio_block_select,
        dprio_write => dprio_write,
        dprio_writedata => dprio_writedata,
        dprio_read => dprio_read,
        dprio_readdata => dprio_readdata,
        dprio_reg_addr => dprio_reg_addr,
        bitslipreset => bitslipreset
    );

end behavior;


library IEEE;
use IEEE.std_logic_1164.all;
use work.twentynm_atom_pack.all;

entity twentynm_io_12_lane is
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
end twentynm_io_12_lane;

architecture behavior of twentynm_io_12_lane is

component twentynm_io_12_lane_encrypted
    generic (
    oct_size : integer := 1;
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
        pin_0_output_phase : integer := 0;
        db_crc_dq3 : integer := 0;
        pin_4_initial_out : string := "initial_out_z";
        pin_6_output_phase : integer := 0;
        db_pin_6_oe_bypass : string := "true";
        db_pin_10_in_bypass : string := "true";
        db_pin_4_wr_invert : string := "false";
        mode_rate_out : string := "out_rate_full";
        db_afi_rlat_vlu : integer := 0;
        phy_clk_sel : integer := 0;
        pin_10_initial_out : string := "initial_out_z";
        db_ptr_pipeline_depth : integer := 0;
        pin_1_oct_mode : string := "static_off";
        dqs_lgc_ddr4_search : string := "ddr3_search";
        db_pin_7_oe_bypass : string := "true";
        pin_9_output_phase : integer := 0;
        db_pin_9_in_bypass : string := "true";
        pin_10_oct_mode : string := "static_off";
        pin_0_mode_ddr : string := "mode_ddr";
        db_pin_7_wr_invert : string := "false";
        pin_2_oct_mode : string := "static_off";
        pin_3_oct_mode : string := "static_off";
        db_pin_11_mode : string := "dq_mode";
        db_pin_4_in_bypass : string := "true";
        pin_11_oct_mode : string := "static_off";
        dll_ctl_static : integer := 0;
        db_hmc_or_core : string := "core";
        db_pin_3_oe_bypass : string := "true";
        db_pin_2_wr_invert : string := "false";
        dqs_enable_delay : integer := 0;
        pin_5_data_in_mode : string := "disabled";
        db_pin_1_mode : string := "dq_mode";
        pin_10_mode_ddr : string := "mode_ddr";
        pin_5_output_phase : integer := 0;
        pin_3_mode_ddr : string := "mode_ddr";
        pin_11_data_in_mode : string := "disabled";
        pin_2_data_in_mode : string := "disabled";
        dqs_lgc_phase_shift_a : integer := 0;
        db_crc_dq0 : integer := 0;
        avl_base_addr : integer := 0;
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
	dbc_wb_reserved_entry : integer := 0;
        db_pin_1_wr_invert : string := "false";
        pin_11_output_phase : integer := 0;
        db_pin_5_oe_bypass : string := "true";
        pin_7_output_phase : integer := 0;
        dqs_lgc_pvt_input_delay_a : integer := 0;
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
        dqs_lgc_pvt_input_delay_b : integer := 0;
        db_pin_10_ac_hmc_data_override_ena : string := "false";
        db_pin_0_out_bypass : string := "true";
        pin_10_data_in_mode : string := "disabled";
        pin_8_data_in_mode : string := "disabled";
        db_pin_6_oe_invert : string := "false";
        pin_5_initial_out : string := "initial_out_z";
        pin_2_initial_out : string := "initial_out_z";
        db_pin_2_in_bypass : string := "true";
        db_pin_4_oe_bypass : string := "true";
        pipe_latency : integer := 0;
        pin_9_mode_ddr : string := "mode_ddr";
        pin_3_output_phase : integer := 0;
        db_pin_4_oe_invert : string := "false";
        mode_rate_in : string := "in_rate_1_4";
        db_pin_2_ac_hmc_data_override_ena : string := "false";
        pin_4_output_phase : integer := 0;
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
        dqs_lgc_phase_shift_b : integer := 0;
        db_pin_6_mode : string := "dq_mode";
        db_pin_5_in_bypass : string := "true";
        pin_7_mode_ddr : string := "mode_ddr";
        db_pin_11_oe_invert : string := "false";
        db_pin_10_oe_invert : string := "false";
        db_afi_wlat_vlu : integer := 0;
        db_dbi_sel : integer := 0;
        pin_4_data_in_mode : string := "disabled";
        db_db2core_registered : string := "false";
        db_pin_4_ac_hmc_data_override_ena : string := "false";
        pin_0_oct_mode : string := "static_off";
        db_crc_dq4 : integer := 0;
        pin_10_output_phase : integer := 0;
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
        pin_2_output_phase : integer := 0;
        db_pin_0_oe_invert : string := "false";
        db_pin_2_oe_invert : string := "false";
        db_pin_7_mode : string := "dq_mode";
        dqs_lgc_burst_length : string := "burst_length_2";
        dqs_lgc_count_threshold : integer := 0;
        db_pin_9_oe_invert : string := "false";
        rd_valid_delay : integer := 0;
        db_dbi_wr_en : string := "false";
        pin_11_mode_ddr : string := "mode_ddr";
        db_pin_9_ac_hmc_data_override_ena : string := "false";
        dqs_lgc_pst_preamble_mode : string := "ddr3_preamble";
        db_pin_5_wr_invert : string := "false";
        pin_8_output_phase : integer := 0;
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
        pin_1_output_phase : integer := 0;
        db_pin_11_ac_hmc_data_override_ena : string := "false";
        db_pin_8_oe_invert : string := "false";
        phy_clk_phs_freq : integer := 1000;
        dqs_lgc_dqs_a_interp_en : string := "false";
        db_pin_11_out_bypass : string := "true";
        db_pin_8_in_bypass : string := "true";
        pin_6_initial_out : string := "initial_out_z";
        db_pin_8_oe_bypass : string := "true";
        pin_9_initial_out : string := "initial_out_z";
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
end component;

begin

inst : twentynm_io_12_lane_encrypted
    generic map (
    oct_size => oct_size,
	pin_0_gpio_or_ddr => pin_0_gpio_or_ddr,
	pin_1_gpio_or_ddr => pin_1_gpio_or_ddr,
	pin_2_gpio_or_ddr => pin_2_gpio_or_ddr,
	pin_3_gpio_or_ddr => pin_3_gpio_or_ddr,
	pin_4_gpio_or_ddr => pin_4_gpio_or_ddr,
	pin_5_gpio_or_ddr => pin_5_gpio_or_ddr,
	pin_6_gpio_or_ddr => pin_6_gpio_or_ddr,
	pin_7_gpio_or_ddr => pin_7_gpio_or_ddr,
	pin_8_gpio_or_ddr => pin_8_gpio_or_ddr,
	pin_9_gpio_or_ddr => pin_9_gpio_or_ddr,
	pin_10_gpio_or_ddr => pin_10_gpio_or_ddr,
	pin_11_gpio_or_ddr => pin_11_gpio_or_ddr,
	pin_0_dqs_x4_mode => pin_0_dqs_x4_mode,
	pin_1_dqs_x4_mode => pin_1_dqs_x4_mode,
	pin_2_dqs_x4_mode => pin_2_dqs_x4_mode,
	pin_3_dqs_x4_mode => pin_3_dqs_x4_mode,
	pin_4_dqs_x4_mode => pin_4_dqs_x4_mode,
	pin_5_dqs_x4_mode => pin_5_dqs_x4_mode,
	pin_6_dqs_x4_mode => pin_6_dqs_x4_mode,
	pin_7_dqs_x4_mode => pin_7_dqs_x4_mode,
	pin_8_dqs_x4_mode => pin_8_dqs_x4_mode,
	pin_9_dqs_x4_mode => pin_9_dqs_x4_mode,
	pin_10_dqs_x4_mode => pin_10_dqs_x4_mode,
	pin_11_dqs_x4_mode => pin_11_dqs_x4_mode,
	pingpong_primary => pingpong_primary,	    
	pingpong_secondary => pingpong_secondary,	    
    	silicon_rev => silicon_rev,
    	fast_interpolator_sim => fast_interpolator_sim,
        db_pin_8_out_bypass => db_pin_8_out_bypass,
        pin_0_output_phase => bin2int(pin_0_output_phase),
        db_crc_dq3 => db_crc_dq3,
        pin_4_initial_out => pin_4_initial_out,
        pin_6_output_phase => bin2int(pin_6_output_phase),
        db_pin_6_oe_bypass => db_pin_6_oe_bypass,
        db_pin_10_in_bypass => db_pin_10_in_bypass,
        db_pin_4_wr_invert => db_pin_4_wr_invert,
        mode_rate_out => mode_rate_out,
        db_afi_rlat_vlu => bin2int(db_afi_rlat_vlu),
        phy_clk_sel => phy_clk_sel,
        pin_10_initial_out => pin_10_initial_out,
        db_ptr_pipeline_depth => db_ptr_pipeline_depth,
        pin_1_oct_mode => pin_1_oct_mode,
        dqs_lgc_ddr4_search => dqs_lgc_ddr4_search,
        db_pin_7_oe_bypass => db_pin_7_oe_bypass,
        pin_9_output_phase => bin2int(pin_9_output_phase),
        db_pin_9_in_bypass => db_pin_9_in_bypass,
        pin_10_oct_mode => pin_10_oct_mode,
        pin_0_mode_ddr => pin_0_mode_ddr,
        db_pin_7_wr_invert => db_pin_7_wr_invert,
        pin_2_oct_mode => pin_2_oct_mode,
        pin_3_oct_mode => pin_3_oct_mode,
        db_pin_11_mode => db_pin_11_mode,
        db_pin_4_in_bypass => db_pin_4_in_bypass,
        pin_11_oct_mode => pin_11_oct_mode,
        dll_ctl_static => bin2int(dll_ctl_static),
        db_hmc_or_core => db_hmc_or_core,
        db_pin_3_oe_bypass => db_pin_3_oe_bypass,
        db_pin_2_wr_invert => db_pin_2_wr_invert,
        dqs_enable_delay => bin2int(dqs_enable_delay),
        pin_5_data_in_mode => pin_5_data_in_mode,
        db_pin_1_mode => db_pin_1_mode,
        pin_10_mode_ddr => pin_10_mode_ddr,
        pin_5_output_phase => bin2int(pin_5_output_phase),
        pin_3_mode_ddr => pin_3_mode_ddr,
        pin_11_data_in_mode => pin_11_data_in_mode,
        pin_2_data_in_mode => pin_2_data_in_mode,
        dqs_lgc_phase_shift_a => bin2int(dqs_lgc_phase_shift_a),
        db_crc_dq0 => db_crc_dq0,
        avl_base_addr => bin2int(avl_base_addr),
        db_crc_dq1 => db_crc_dq1,
        pin_1_data_in_mode => pin_1_data_in_mode,
        db_pin_7_out_bypass => db_pin_7_out_bypass,
        dll_en => dll_en,
        pin_4_oct_mode => pin_4_oct_mode,
        db_rwlat_mode => db_rwlat_mode,
        db_pin_10_oe_bypass => db_pin_10_oe_bypass,
        db_pin_2_mode => db_pin_2_mode,
        db_pin_1_oe_invert => db_pin_1_oe_invert,
        db_seq_rd_en_full_pipeline => db_seq_rd_en_full_pipeline,
        dbc_wb_reserved_entry => bin2int(dbc_wb_reserved_entry),
        db_pin_1_wr_invert => db_pin_1_wr_invert,
        pin_11_output_phase => bin2int(pin_11_output_phase),
        db_pin_5_oe_bypass => db_pin_5_oe_bypass,
        pin_7_output_phase => bin2int(pin_7_output_phase),
        dqs_lgc_pvt_input_delay_a => bin2int(dqs_lgc_pvt_input_delay_a),
        pin_6_data_in_mode => pin_6_data_in_mode,
        db_pin_9_out_bypass => db_pin_9_out_bypass,
        pin_8_oct_mode => pin_8_oct_mode,
        db_pin_5_out_bypass => db_pin_5_out_bypass,
        db_crc_x4_or_x8_or_x9 => db_crc_x4_or_x8_or_x9,
        pin_7_data_in_mode => pin_7_data_in_mode,
        db_pin_11_in_bypass => db_pin_11_in_bypass,
        db_pin_11_wr_invert => db_pin_11_wr_invert,
        db_crc_dq5 => db_crc_dq5,
        db_pin_8_mode => db_pin_8_mode,
        db_pin_6_in_bypass => db_pin_6_in_bypass,
        pin_7_oct_mode => pin_7_oct_mode,
        db_crc_dq7 => db_crc_dq7,
        dll_ctlsel => dll_ctlsel,
        pin_7_initial_out => pin_7_initial_out,
        avl_ena => avl_ena,
        dqs_lgc_pvt_input_delay_b => bin2int(dqs_lgc_pvt_input_delay_b),
        db_pin_10_ac_hmc_data_override_ena => db_pin_10_ac_hmc_data_override_ena,
        db_pin_0_out_bypass => db_pin_0_out_bypass,
        pin_10_data_in_mode => pin_10_data_in_mode,
        pin_8_data_in_mode => pin_8_data_in_mode,
        db_pin_6_oe_invert => db_pin_6_oe_invert,
        pin_5_initial_out => pin_5_initial_out,
        pin_2_initial_out => pin_2_initial_out,
        db_pin_2_in_bypass => db_pin_2_in_bypass,
        db_pin_4_oe_bypass => db_pin_4_oe_bypass,
        pipe_latency => bin2int(pipe_latency),
        pin_9_mode_ddr => pin_9_mode_ddr,
        pin_3_output_phase => bin2int(pin_3_output_phase),
        db_pin_4_oe_invert => db_pin_4_oe_invert,
        mode_rate_in => mode_rate_in,
        db_pin_2_ac_hmc_data_override_ena => db_pin_2_ac_hmc_data_override_ena,
        pin_4_output_phase => bin2int(pin_4_output_phase),
        db_pin_10_wr_invert => db_pin_10_wr_invert,
        dll_rst_en => dll_rst_en,
        pin_0_initial_out => pin_0_initial_out,
        db_pin_11_oe_bypass => db_pin_11_oe_bypass,
        pin_4_mode_ddr => pin_4_mode_ddr,
        db_pin_2_out_bypass => db_pin_2_out_bypass,
        db_pin_10_out_bypass => db_pin_10_out_bypass,
        db_pin_7_oe_invert => db_pin_7_oe_invert,
        db_pin_3_out_bypass => db_pin_3_out_bypass,
        db_crc_dq8 => db_crc_dq8,
        db_pin_0_oe_bypass => db_pin_0_oe_bypass,
        db_pin_5_oe_invert => db_pin_5_oe_invert,
        db_crc_dq2 => db_crc_dq2,
        db_pin_1_out_bypass => db_pin_1_out_bypass,
        db_preamble_mode => db_preamble_mode,
        db_pin_2_oe_bypass => db_pin_2_oe_bypass,
        db_pin_1_in_bypass => db_pin_1_in_bypass,
        hps_ctrl_en => hps_ctrl_en,
        db_crc_en => db_crc_en,
        db_data_alignment_mode => db_data_alignment_mode,
        db_pin_3_in_bypass => db_pin_3_in_bypass,
        dqs_lgc_enable_toggler => dqs_lgc_enable_toggler,
        db_pin_9_wr_invert => db_pin_9_wr_invert,
        pin_11_initial_out => pin_11_initial_out,
        dqs_lgc_dqs_b_interp_en => dqs_lgc_dqs_b_interp_en,
        db_pin_1_oe_bypass => db_pin_1_oe_bypass,
        db_pin_9_oe_bypass => db_pin_9_oe_bypass,
        db_pin_9_mode => db_pin_9_mode,
        dqs_lgc_dqs_b_en => dqs_lgc_dqs_b_en,
        dqs_lgc_pack_mode => dqs_lgc_pack_mode,
        db_pin_7_ac_hmc_data_override_ena => db_pin_7_ac_hmc_data_override_ena,
        pin_1_initial_out => pin_1_initial_out,
        db_crc_dq6 => db_crc_dq6,
        db_core_or_hmc2db_registered => db_core_or_hmc2db_registered,
        db_pin_0_wr_invert => db_pin_0_wr_invert,
        db_pin_8_wr_invert => db_pin_8_wr_invert,
        db_reset_auto_release => db_reset_auto_release,
        db_pin_3_wr_invert => db_pin_3_wr_invert,
        dqs_lgc_phase_shift_b => bin2int(dqs_lgc_phase_shift_b),
        db_pin_6_mode => db_pin_6_mode,
        db_pin_5_in_bypass => db_pin_5_in_bypass,
        pin_7_mode_ddr => pin_7_mode_ddr,
        db_pin_11_oe_invert => db_pin_11_oe_invert,
        db_pin_10_oe_invert => db_pin_10_oe_invert,
        db_afi_wlat_vlu => bin2int(db_afi_wlat_vlu),
        db_dbi_sel => db_dbi_sel,
        pin_4_data_in_mode => pin_4_data_in_mode,
        db_db2core_registered => db_db2core_registered,
        db_pin_4_ac_hmc_data_override_ena => db_pin_4_ac_hmc_data_override_ena,
        pin_0_oct_mode => pin_0_oct_mode,
        db_crc_dq4 => db_crc_dq4,
        pin_10_output_phase => bin2int(pin_10_output_phase),
        db_pin_6_wr_invert => db_pin_6_wr_invert,
        pin_2_mode_ddr => pin_2_mode_ddr,
        db_pin_0_mode => db_pin_0_mode,
        pin_6_oct_mode => pin_6_oct_mode,
        db_pin_3_ac_hmc_data_override_ena => db_pin_3_ac_hmc_data_override_ena,
        pin_5_mode_ddr => pin_5_mode_ddr,
        db_pin_4_out_bypass => db_pin_4_out_bypass,
        db_pin_0_in_bypass => db_pin_0_in_bypass,
        pin_9_data_in_mode => pin_9_data_in_mode,
        dqs_lgc_broadcast_enable => dqs_lgc_broadcast_enable,
        dqs_lgc_pst_en_shrink => dqs_lgc_pst_en_shrink,
        pin_3_initial_out => pin_3_initial_out,
        db_pin_8_ac_hmc_data_override_ena => db_pin_8_ac_hmc_data_override_ena,
        pin_2_output_phase => bin2int(pin_2_output_phase),
        db_pin_0_oe_invert => db_pin_0_oe_invert,
        db_pin_2_oe_invert => db_pin_2_oe_invert,
        db_pin_7_mode => db_pin_7_mode,
        dqs_lgc_burst_length => dqs_lgc_burst_length,
        dqs_lgc_count_threshold => bin2int(dqs_lgc_count_threshold),
        db_pin_9_oe_invert => db_pin_9_oe_invert,
        rd_valid_delay => bin2int(rd_valid_delay),
        db_dbi_wr_en => db_dbi_wr_en,
        pin_11_mode_ddr => pin_11_mode_ddr,
        db_pin_9_ac_hmc_data_override_ena => db_pin_9_ac_hmc_data_override_ena,
        dqs_lgc_pst_preamble_mode => dqs_lgc_pst_preamble_mode,
        db_pin_5_wr_invert => db_pin_5_wr_invert,
        pin_8_output_phase => bin2int(pin_8_output_phase),
        pin_8_initial_out => pin_8_initial_out,
        dll_core_updnen => dll_core_updnen,
        pin_6_mode_ddr => pin_6_mode_ddr,
        pin_9_oct_mode => pin_9_oct_mode,
        db_dbi_rd_en => db_dbi_rd_en,
        db_pin_1_ac_hmc_data_override_ena => db_pin_1_ac_hmc_data_override_ena,
        db_pin_7_in_bypass => db_pin_7_in_bypass,
        pin_3_data_in_mode => pin_3_data_in_mode,
        db_pin_5_ac_hmc_data_override_ena => db_pin_5_ac_hmc_data_override_ena,
        dbc_core_clk_sel => dbc_core_clk_sel,
        pin_1_mode_ddr => pin_1_mode_ddr,
        dqs_lgc_swap_dqs_a_b => dqs_lgc_swap_dqs_a_b,
        db_pin_6_out_bypass => db_pin_6_out_bypass,
        db_pin_3_oe_invert => db_pin_3_oe_invert,
        db_pin_4_mode => db_pin_4_mode,
        pin_0_data_in_mode => pin_0_data_in_mode,
        db_pin_0_ac_hmc_data_override_ena => db_pin_0_ac_hmc_data_override_ena,
        db_pin_6_ac_hmc_data_override_ena => db_pin_6_ac_hmc_data_override_ena,
        db_pin_5_mode => db_pin_5_mode,
        pin_5_oct_mode => pin_5_oct_mode,
        db_pin_3_mode => db_pin_3_mode,
        db_pin_10_mode => db_pin_10_mode,
        pin_1_output_phase => bin2int(pin_1_output_phase),
        db_pin_11_ac_hmc_data_override_ena => db_pin_11_ac_hmc_data_override_ena,
        db_pin_8_oe_invert => db_pin_8_oe_invert,
        phy_clk_phs_freq => phy_clk_phs_freq,
        dqs_lgc_dqs_a_interp_en => dqs_lgc_dqs_a_interp_en,
        db_pin_11_out_bypass => db_pin_11_out_bypass,
        db_pin_8_in_bypass => db_pin_8_in_bypass,
        pin_6_initial_out => pin_6_initial_out,
        db_pin_8_oe_bypass => db_pin_8_oe_bypass,
        pin_9_initial_out => pin_9_initial_out,
        pin_8_mode_ddr => pin_8_mode_ddr
    )
    port map (
        dbc2ctl => dbc2ctl,
        sync_clk_bot_out => sync_clk_bot_out,
        data_in => data_in,
        rdata_en_full_core => rdata_en_full_core,
        cal_avl_readdata_in => cal_avl_readdata_in,
        ac_hmc => ac_hmc,
        cal_avl_readdata_out => cal_avl_readdata_out,
        pll_locked => pll_locked,
        broadcast_out_bot => broadcast_out_bot,
        broadcast_in_bot => broadcast_in_bot,
        reset_n => reset_n,
        broadcast_in_top => broadcast_in_top,
        data_oe => data_oe,
        core2dbc_rd_data_rdy => core2dbc_rd_data_rdy,
        dbc2core_rd_data_vld0 => dbc2core_rd_data_vld0,
        phy_clk => phy_clk,
        data_from_core => data_from_core,
        sync_data_bot_in => sync_data_bot_in,
        sync_data_top_out => sync_data_top_out,
        core2dbc_wr_data_vld0 => core2dbc_wr_data_vld0,
        ctl2dbc0 => ctl2dbc0,
        dft_phy_clk => dft_phy_clk,
        dqs_in => dqs_in,
        cal_avl_in => cal_avl_in,
        cfg_dbc => cfg_dbc,
        core2dbc_wr_data_vld1 => core2dbc_wr_data_vld1,
        dll_ref_clk => dll_ref_clk,
        dbc2core_wr_data_rdy => dbc2core_wr_data_rdy,
        sync_data_top_in => sync_data_top_in,
        mrnk_write_core => mrnk_write_core,
        afi_rlat_core => afi_rlat_core,
        cal_avl_out => cal_avl_out,
        core_dll => core_dll,
        afi_wlat_core => afi_wlat_core,
        broadcast_out_top => broadcast_out_top,
        rdata_valid_core => rdata_valid_core,
        core2dbc_wr_ecc_info => core2dbc_wr_ecc_info,
        sync_clk_top_in => sync_clk_top_in,
        sync_clk_top_out => sync_clk_top_out,
        sync_data_bot_out => sync_data_bot_out,
        dbc2core_rd_data_vld1 => dbc2core_rd_data_vld1,
        data_out => data_out,
        mrnk_read_core => mrnk_read_core,
        data_to_core => data_to_core,
        dll_core => dll_core,
        phy_clk_phs => phy_clk_phs,
        sync_clk_bot_in => sync_clk_bot_in,
        oe_from_core => oe_from_core,
        dbc2core_wb_pointer => dbc2core_wb_pointer,
        oct_enable => oct_enable,
        dbc2core_rd_type => dbc2core_rd_type,
        ioereg_locked => ioereg_locked,
        ctl2dbc1 => ctl2dbc1,
		test_clk => test_clk,
		dft_prbs_ena_n => dft_prbs_ena_n,
		dft_prbs_pass => dft_prbs_pass,
		dft_prbs_done => dft_prbs_done
    );

end behavior;



library IEEE;
use IEEE.std_logic_1164.all;
use work.twentynm_atom_pack.all;


entity twentynm_tile_ctrl is
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
end twentynm_tile_ctrl;

architecture behavior of twentynm_tile_ctrl is

component twentynm_tile_ctrl_encrypted
    generic (
    	silicon_rev : string := "20nm5es";
        hmc_arf_period : integer := 0;
        hmc_wr_to_pch : integer := 0;
        hmc_zqcl_to_valid : integer := 0;
        hmc_cfg_bist_cmd1_l : integer := 0;
        pa_feedback_divider_p0 : string := "div_by_1_p0";
        hmc_wb_reserved_entry : integer := 0;
        hmc_cfg_3ds_en : string := "disable";
        hmc_ctrl_slot_rotate_en : integer := 0;
        hmc_cfg_mmr_driver_sel : string := "core_m";
        hmc_dbc3_cmd_rate : string := "half_rate_dbc3";
        physeq_rwlat_mode : string := "csr_vlu";
        pa_mantissa_1 : integer := 0;
        hmc_period_dqstrk_ctrl_en : string := "disable";
        hmc_dbc2_pipe_lat : integer := 0;
        hmc_16_act_to_act : integer := 0;
        hmc_tcl : integer := 0;
        hmc_dbc0_burst_length : string := "bl_8_dbc0";
        hmc_rld3_refresh_seq1 : integer := 0;
        hmc_ctrl_burst_length : string := "bl_8_ctrl";
        hmc_pdn_to_valid : integer := 0;
        hmc_mps_to_valid : integer := 0;
        hmc_mrs_to_valid : integer := 0;
        hmc_period_dqstrk_interval : integer := 0;
        hmc_dbc2_enable_ecc : string := "disable";
        hmc_mem_if_coladdr_width : string := "col_width_12";
        hmc_dbc1_reorder_rdata : string := "disable";
        hmc_act_to_rdwr : integer := 0;
        physeq_bc_id_ena : string := "bc_disable";
        hmc_starve_limit : integer := 0;
        hmc_cfg_bist_cmd0_u : integer := 0;
        hmc_wr_to_wr_diff_bg : integer := 0;
        hmc_rd_to_wr_diff_bg : integer := 0;
        hmc_cfg_cmd_driver_sel : string := "core_c";
        physeq_reset_auto_release : string := "auto";
        hmc_pdn_period : integer := 0;
        hmc_srf_to_valid : integer := 0;
        pa_feedback_mux_sel_1 : string := "fb0_p_clk_1";
        hmc_dbc3_rc_en : string := "disable";
        hmc_ctrl_enable_ecc : string := "disable";
        hmc_dbc1_rc_en : string := "disable";
        hmc_reorder_read : string := "disable";
        hmc_ctrl_mem_type : string := "ddr3";
        hmc_ctrl_dualport_en : string := "disable";
        hmc_dbc2ctrl_sel : string := "dbc0_to_local";
        physeq_afi_wlat_vlu : integer := 0;
        hmc_dbc3_reorder_rdata : string := "disable";
        hmc_ctrl_enable_dm : string := "enable";
        hmc_dbc1_burst_length : string := "bl_8_dbc1";
        hmc_sb_ddr4_mr4 : integer := 0;
        hmc_mmr_cmd_to_valid : integer := 0;
        hmc_rd_to_pch : integer := 0;
        hmc_dbc2_in_protocol : string := "ast_dbc2";
        hmc_sb_ddr4_mr3 : integer := 0;
        hmc_srf_entry_exit_block : string := "presrfenter";
        hmc_dbc0_in_protocol : string := "ast_dbc0";
        hmc_wr_to_wr_diff_chip : integer := 0;
        hmc_ddr4_mps_addr_mirror : integer := 0;
        hmc_arf_to_valid : integer := 0;
        hmc_ck_inv : string := "disable";
        pa_filter_code : integer := 1600;
        hmc_dbc0_pipe_lat : integer := 0;
        hmc_wr_to_rd_diff_chip : integer := 0;
        hmc_dbc2_burst_length : string := "bl_8_dbc2";
        hmc_rd_ap_to_valid : integer := 0;
        hmc_wr_to_rd : integer := 0;
        hmc_local_if_cs_width : string := "cs_width_2";
        hmc_mem_clk_disable_entry_cycles : integer := 0;
        hmc_sb_ddr4_mr5 : integer := 0;
        physeq_hmc_or_core : string := "core";
        hmc_dbc1_ctrl_sel : string := "upper_mux_dbc1";
        hmc_wr_ap_to_valid : integer := 0;
        hmc_rd_to_rd : integer := 0;
        hmc_ctrl2dbc_switch0 : string := "local_tile_dbc0";
        hmc_dbc2_dualport_en : string := "disable";
        hmc_dbc2_slot_rotate_en : integer := 0;
        hmc_cfg_bist_cmd0_l : integer := 0;
        hmc_srf_to_zq_cal : integer := 0;
        hmc_rld3_multibank_mode : string := "singlebank";
        pa_sync_latency : integer := 0;
        hmc_ctrl_in_protocol : string := "ast_in";
        hmc_wr_odt_on : integer := 0;
        hmc_user_rfsh_en : string := "disable";
        hmc_rfsh_warn_threshold : integer := 0;
        hmc_dbc3_slot_offset : integer := 0;
        pa_track_speed : integer := 0;
        hmc_dbc1_slot_rotate_en : integer := 0;
        hmc_dbc1_enable_dm : string := "enable";
        pa_freq_track_speed : integer := 0;
        hmc_dbc3_slot_rotate_en : integer := 0;
        hmc_mps_dqstrk_disable : string := "disable";
        hmc_dbc3_in_protocol : string := "ast_dbc3";
        hmc_rld3_refresh_seq2 : integer := 0;
        pa_feedback_divider_c0 : string := "div_by_1_c0";
        hmc_dbc1_in_protocol : string := "ast_dbc1";
        hmc_geardn_en : string := "disable";
        hmc_dqstrk_to_valid_last : integer := 0;
        hmc_wr_odt_period : integer := 0;
        hmc_short_dqstrk_ctrl_en : string := "disable";
        hmc_dbc1_cmd_rate : string := "half_rate_dbc1";
        hmc_act_to_act_diff_bank : integer := 0;
        physeq_avl_ena : string := "avl_disable";
        hmc_mpr_to_valid : integer := 0;
        pa_exponent_1 : integer := 0;
        physeq_trk_mgr_read_monitor_ena : string := "disable";
        hmc_rd_to_rd_diff_chip : integer := 0;
        physeq_seq_feature : integer := 0;
        hmc_cfg_pinpong_mode : string := "pingpong_off";
        mode : string := "tile_ddr";
        hmc_ctrl_rc_en : string := "disable";
        hmc_rld3_multibank_ref_delay : integer := 0;
        pa_feedback_divider_p1 : string := "div_by_1_p1";
        hmc_enable_dqs_tracking : string := "enable";
        hmc_addr_order : string := "chip_bank_row_col";
        hmc_act_to_act : integer := 0;
        pa_phase_offset_1 : integer := 0;
        hmc_cs_chip : integer := 0;
        pa_mantissa_0 : integer := 0;
        hmc_open_page_en : string := "disable";
        hmc_act_to_act_diff_bg : integer := 0;
        hmc_ctrl_dimm_type : string := "component";
        hmc_dbc3_output_regd : string := "disable";
        hmc_mem_if_bgaddr_width : string := "bg_width_0";
        hmc_dbc0_output_regd : string := "disable";
        hmc_ctrl_cmd_rate : string := "half_rate";
        hps_ctrl_en : string := "false";
        hmc_4_act_to_act : integer := 0;
        hmc_ctrl_slot_offset : integer := 0;
        hmc_wr_to_wr : integer := 0;
        hmc_cfg_dbg_ctrl : integer := 0;
        hmc_cfg_dbg_mode : string := "function";
        hmc_dbc3_enable_ecc : string := "disable";
        hmc_dbc2_cmd_rate : string := "half_rate_dbc2";
        hmc_dbc0_dualport_en : string := "disable";
        hmc_mps_zqcal_disable : string := "disable";
        hmc_rld3_refresh_seq0 : integer := 0;
        hmc_cfg_bist_cmd1_u : integer := 0;
        hmc_dbc0_ctrl_sel : string := "upper_mux_dbc0";
        hmc_write_odt_chip : integer := 0;
        hmc_dbc0_enable_ecc : string := "disable";
        hmc_mem_if_bankaddr_width : string := "bank_width_3";
        hmc_arbiter_type : string := "twot";
        hmc_dbc3_pipe_lat : integer := 0;
        hmc_zqcs_to_valid : integer := 0;
        hmc_srf_autoexit_en : string := "disable";
        physeq_afi_rlat_vlu : integer := 0;
        hmc_dbc1_enable_ecc : string := "disable";
        hmc_dbc3_ctrl_sel : string := "upper_mux_dbc3";
        hmc_dbc2_reorder_rdata : string := "disable";
        hmc_dbc0_reorder_rdata : string := "disable";
        hmc_mrr_to_valid : integer := 0;
        hmc_rld3_refresh_seq3 : integer := 0;
        hmc_power_saving_exit_cycles : integer := 0;
        hmc_dbc2_enable_dm : string := "enable";
        hmc_dbc0_rc_en : string := "disable";
        hmc_mps_exit_cs_to_cke : integer := 0;
        pa_sync_control : string := "no_sync";
        hmc_rd_to_wr : integer := 0;
        hmc_rd_odt_period : integer := 0;
        hmc_ctrl_output_regd : string := "disable";
        pa_feedback_mux_sel_0 : string := "fb0_p_clk_0";
        hmc_tile_id : integer := 0;
        hmc_mem_if_rowaddr_width : string := "row_width_16";
        hmc_ctrl_reorder_rdata : string := "disable";
        hmc_reorder_data : string := "disable";
        hmc_cfg_loopback_en : string := "disable";
        hmc_rd_to_rd_diff_bg : integer := 0;
        hmc_dbc3_burst_length : string := "bl_8_dbc3";
        hmc_dbc2_ctrl_sel : string := "upper_mux_dbc2";
        hmc_dbc2_slot_offset : integer := 0;
        physeq_tile_id : integer := 0;
        hmc_col_cmd_slot : integer := 0;
        hmc_dbc3_enable_dm : string := "enable";
        hmc_dbc2_rc_en : string := "disable";
        pa_feedback_divider_c1 : string := "div_by_1_c1";
        hmc_dbc1_output_regd : string := "disable";
        hmc_second_clk_src : string := "clk1";
        physeq_trk_mgr_mrnk_mode : string := "one_rank";
        hmc_sb_cg_disable : string := "disable";
        hmc_clkgating_en : string := "disable";
        hmc_row_cmd_slot : integer := 0;
        hmc_cfg_prbs_ctrl_sel : string := "hmc";
        hmc_mps_exit_cke_to_cs : integer := 0;
        hmc_dbc1_slot_offset : integer := 0;
        hmc_pch_to_valid : integer := 0;
        hmc_cfg_wdata_driver_sel : string := "core_w";
        hmc_cfg_dbg_out_sel : integer := 0;
        hmc_addr_mplx_en : string := "disable";
        hmc_dbc1_dualport_en : string := "disable";
        hmc_dbc3_dualport_en : string := "disable";
        hmc_dbc0_enable_dm : string := "enable";
        hmc_dbc0_slot_offset : integer := 0;
        hmc_dqstrk_to_valid : integer := 0;
        hmc_dbc0_cmd_rate : string := "half_rate_dbc0";
        hmc_wr_to_rd_diff_bg : integer := 0;
        hmc_rd_odt_on : integer := 0;
        hmc_rb_reserved_entry : integer := 0;
        hmc_dbc0_slot_rotate_en : integer := 0;
        physeq_hmc_id : integer := 0;
        hmc_dbc1_pipe_lat : integer := 0;
        hmc_srf_zqcal_disable : string := "disable";
        pa_phase_offset_0 : integer := 0;
        hmc_pch_all_to_valid : integer := 0;
        hmc_ctrl_ac_pos : string := "use_0_1_2_lane";
        hmc_dbc2_output_regd : string := "disable";
        pa_exponent_0 : integer := 0;
        hmc_rd_to_wr_diff_chip : integer := 0;
        hmc_read_odt_chip : integer := 0;
        hmc_ctrl2dbc_switch1 : string := "local_tile_dbc1";
        hmc_act_to_pch : integer := 0;
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
end component;

begin

inst : twentynm_tile_ctrl_encrypted
    generic map (
    	silicon_rev => silicon_rev,
        hmc_arf_period => bin2int(hmc_arf_period),
        hmc_wr_to_pch => bin2int(hmc_wr_to_pch),
        hmc_zqcl_to_valid => bin2int(hmc_zqcl_to_valid),
        hmc_cfg_bist_cmd1_l => bin2int(hmc_cfg_bist_cmd1_l),
        pa_feedback_divider_p0 => pa_feedback_divider_p0,
        hmc_wb_reserved_entry => bin2int(hmc_wb_reserved_entry),
        hmc_cfg_3ds_en => hmc_cfg_3ds_en,
        hmc_ctrl_slot_rotate_en => bin2int(hmc_ctrl_slot_rotate_en),
        hmc_cfg_mmr_driver_sel => hmc_cfg_mmr_driver_sel,
        hmc_dbc3_cmd_rate => hmc_dbc3_cmd_rate,
        physeq_rwlat_mode => physeq_rwlat_mode,
        pa_mantissa_1 => bin2int(pa_mantissa_1),
        hmc_period_dqstrk_ctrl_en => hmc_period_dqstrk_ctrl_en,
        hmc_dbc2_pipe_lat => bin2int(hmc_dbc2_pipe_lat),
        hmc_16_act_to_act => bin2int(hmc_16_act_to_act),
        hmc_tcl => bin2int(hmc_tcl),
        hmc_dbc0_burst_length => hmc_dbc0_burst_length,
        hmc_rld3_refresh_seq1 => bin2int(hmc_rld3_refresh_seq1),
        hmc_ctrl_burst_length => hmc_ctrl_burst_length,
        hmc_pdn_to_valid => bin2int(hmc_pdn_to_valid),
        hmc_mps_to_valid => bin2int(hmc_mps_to_valid),
        hmc_mrs_to_valid => bin2int(hmc_mrs_to_valid),
        hmc_period_dqstrk_interval => bin2int(hmc_period_dqstrk_interval),
        hmc_dbc2_enable_ecc => hmc_dbc2_enable_ecc,
        hmc_mem_if_coladdr_width => hmc_mem_if_coladdr_width,
        hmc_dbc1_reorder_rdata => hmc_dbc1_reorder_rdata,
        hmc_act_to_rdwr => bin2int(hmc_act_to_rdwr),
        physeq_bc_id_ena => physeq_bc_id_ena,
        hmc_starve_limit => bin2int(hmc_starve_limit),
        hmc_cfg_bist_cmd0_u => bin2int(hmc_cfg_bist_cmd0_u),
        hmc_wr_to_wr_diff_bg => bin2int(hmc_wr_to_wr_diff_bg),
        hmc_rd_to_wr_diff_bg => bin2int(hmc_rd_to_wr_diff_bg),
        hmc_cfg_cmd_driver_sel => hmc_cfg_cmd_driver_sel,
        physeq_reset_auto_release => physeq_reset_auto_release,
        hmc_pdn_period => bin2int(hmc_pdn_period),
        hmc_srf_to_valid => bin2int(hmc_srf_to_valid),
        pa_feedback_mux_sel_1 => pa_feedback_mux_sel_1,
        hmc_dbc3_rc_en => hmc_dbc3_rc_en,
        hmc_ctrl_enable_ecc => hmc_ctrl_enable_ecc,
        hmc_dbc1_rc_en => hmc_dbc1_rc_en,
        hmc_reorder_read => hmc_reorder_read,
        hmc_ctrl_mem_type => hmc_ctrl_mem_type,
        hmc_ctrl_dualport_en => hmc_ctrl_dualport_en,
        hmc_dbc2ctrl_sel => hmc_dbc2ctrl_sel,
        physeq_afi_wlat_vlu => bin2int(physeq_afi_wlat_vlu),
        hmc_dbc3_reorder_rdata => hmc_dbc3_reorder_rdata,
        hmc_ctrl_enable_dm => hmc_ctrl_enable_dm,
        hmc_dbc1_burst_length => hmc_dbc1_burst_length,
        hmc_sb_ddr4_mr4 => bin2int(hmc_sb_ddr4_mr4),
        hmc_mmr_cmd_to_valid => bin2int(hmc_mmr_cmd_to_valid),
        hmc_rd_to_pch => bin2int(hmc_rd_to_pch),
        hmc_dbc2_in_protocol => hmc_dbc2_in_protocol,
        hmc_sb_ddr4_mr3 => bin2int(hmc_sb_ddr4_mr3),
        hmc_srf_entry_exit_block => hmc_srf_entry_exit_block,
        hmc_dbc0_in_protocol => hmc_dbc0_in_protocol,
        hmc_wr_to_wr_diff_chip => bin2int(hmc_wr_to_wr_diff_chip),
        hmc_ddr4_mps_addr_mirror => bin2int(hmc_ddr4_mps_addr_mirror),
        hmc_arf_to_valid => bin2int(hmc_arf_to_valid),
        hmc_ck_inv => hmc_ck_inv,
        pa_filter_code => pa_filter_code,
        hmc_dbc0_pipe_lat => bin2int(hmc_dbc0_pipe_lat),
        hmc_wr_to_rd_diff_chip => bin2int(hmc_wr_to_rd_diff_chip),
        hmc_dbc2_burst_length => hmc_dbc2_burst_length,
        hmc_rd_ap_to_valid => bin2int(hmc_rd_ap_to_valid),
        hmc_wr_to_rd => bin2int(hmc_wr_to_rd),
        hmc_local_if_cs_width => hmc_local_if_cs_width,
        hmc_mem_clk_disable_entry_cycles => bin2int(hmc_mem_clk_disable_entry_cycles),
        hmc_sb_ddr4_mr5 => bin2int(hmc_sb_ddr4_mr5),
        physeq_hmc_or_core => physeq_hmc_or_core,
        hmc_dbc1_ctrl_sel => hmc_dbc1_ctrl_sel,
        hmc_wr_ap_to_valid => bin2int(hmc_wr_ap_to_valid),
        hmc_rd_to_rd => bin2int(hmc_rd_to_rd),
        hmc_ctrl2dbc_switch0 => hmc_ctrl2dbc_switch0,
        hmc_dbc2_dualport_en => hmc_dbc2_dualport_en,
        hmc_dbc2_slot_rotate_en => bin2int(hmc_dbc2_slot_rotate_en),
        hmc_cfg_bist_cmd0_l => bin2int(hmc_cfg_bist_cmd0_l),
        hmc_srf_to_zq_cal => bin2int(hmc_srf_to_zq_cal),
        hmc_rld3_multibank_mode => hmc_rld3_multibank_mode,
        pa_sync_latency => bin2int(pa_sync_latency),
        hmc_ctrl_in_protocol => hmc_ctrl_in_protocol,
        hmc_wr_odt_on => bin2int(hmc_wr_odt_on),
        hmc_user_rfsh_en => hmc_user_rfsh_en,
        hmc_rfsh_warn_threshold => bin2int(hmc_rfsh_warn_threshold),
        hmc_dbc3_slot_offset => bin2int(hmc_dbc3_slot_offset),
        pa_track_speed => bin2int(pa_track_speed),
        hmc_dbc1_slot_rotate_en => bin2int(hmc_dbc1_slot_rotate_en),
        hmc_dbc1_enable_dm => hmc_dbc1_enable_dm,
        pa_freq_track_speed => bin2int(pa_freq_track_speed),
        hmc_dbc3_slot_rotate_en => bin2int(hmc_dbc3_slot_rotate_en),
        hmc_mps_dqstrk_disable => hmc_mps_dqstrk_disable,
        hmc_dbc3_in_protocol => hmc_dbc3_in_protocol,
        hmc_rld3_refresh_seq2 => bin2int(hmc_rld3_refresh_seq2),
        pa_feedback_divider_c0 => pa_feedback_divider_c0,
        hmc_dbc1_in_protocol => hmc_dbc1_in_protocol,
        hmc_geardn_en => hmc_geardn_en,
        hmc_dqstrk_to_valid_last => bin2int(hmc_dqstrk_to_valid_last),
        hmc_wr_odt_period => bin2int(hmc_wr_odt_period),
        hmc_short_dqstrk_ctrl_en => hmc_short_dqstrk_ctrl_en,
        hmc_dbc1_cmd_rate => hmc_dbc1_cmd_rate,
        hmc_act_to_act_diff_bank => bin2int(hmc_act_to_act_diff_bank),
        physeq_avl_ena => physeq_avl_ena,
        hmc_mpr_to_valid => bin2int(hmc_mpr_to_valid),
        pa_exponent_1 => bin2int(pa_exponent_1),
        physeq_trk_mgr_read_monitor_ena => physeq_trk_mgr_read_monitor_ena,
        hmc_rd_to_rd_diff_chip => bin2int(hmc_rd_to_rd_diff_chip),
        physeq_seq_feature => bin2int(physeq_seq_feature),
        hmc_cfg_pinpong_mode => hmc_cfg_pinpong_mode,
        mode => mode,
        hmc_ctrl_rc_en => hmc_ctrl_rc_en,
        hmc_rld3_multibank_ref_delay => bin2int(hmc_rld3_multibank_ref_delay),
        pa_feedback_divider_p1 => pa_feedback_divider_p1,
        hmc_enable_dqs_tracking => hmc_enable_dqs_tracking,
        hmc_addr_order => hmc_addr_order,
        hmc_act_to_act => bin2int(hmc_act_to_act),
        pa_phase_offset_1 => bin2int(pa_phase_offset_1),
        hmc_cs_chip => bin2int(hmc_cs_chip),
        pa_mantissa_0 => bin2int(pa_mantissa_0),
        hmc_open_page_en => hmc_open_page_en,
        hmc_act_to_act_diff_bg => bin2int(hmc_act_to_act_diff_bg),
        hmc_ctrl_dimm_type => hmc_ctrl_dimm_type,
        hmc_dbc3_output_regd => hmc_dbc3_output_regd,
        hmc_mem_if_bgaddr_width => hmc_mem_if_bgaddr_width,
        hmc_dbc0_output_regd => hmc_dbc0_output_regd,
        hmc_ctrl_cmd_rate => hmc_ctrl_cmd_rate,
        hps_ctrl_en => hps_ctrl_en,
        hmc_4_act_to_act => bin2int(hmc_4_act_to_act),
        hmc_ctrl_slot_offset => bin2int(hmc_ctrl_slot_offset),
        hmc_wr_to_wr => bin2int(hmc_wr_to_wr),
        hmc_cfg_dbg_ctrl => bin2int(hmc_cfg_dbg_ctrl),
        hmc_cfg_dbg_mode => hmc_cfg_dbg_mode,
        hmc_dbc3_enable_ecc => hmc_dbc3_enable_ecc,
        hmc_dbc2_cmd_rate => hmc_dbc2_cmd_rate,
        hmc_dbc0_dualport_en => hmc_dbc0_dualport_en,
        hmc_mps_zqcal_disable => hmc_mps_zqcal_disable,
        hmc_rld3_refresh_seq0 => bin2int(hmc_rld3_refresh_seq0),
        hmc_cfg_bist_cmd1_u => bin2int(hmc_cfg_bist_cmd1_u),
        hmc_dbc0_ctrl_sel => hmc_dbc0_ctrl_sel,
        hmc_write_odt_chip => bin2int(hmc_write_odt_chip),
        hmc_dbc0_enable_ecc => hmc_dbc0_enable_ecc,
        hmc_mem_if_bankaddr_width => hmc_mem_if_bankaddr_width,
        hmc_arbiter_type => hmc_arbiter_type,
        hmc_dbc3_pipe_lat => bin2int(hmc_dbc3_pipe_lat),
        hmc_zqcs_to_valid => bin2int(hmc_zqcs_to_valid),
        hmc_srf_autoexit_en => hmc_srf_autoexit_en,
        physeq_afi_rlat_vlu => bin2int(physeq_afi_rlat_vlu),
        hmc_dbc1_enable_ecc => hmc_dbc1_enable_ecc,
        hmc_dbc3_ctrl_sel => hmc_dbc3_ctrl_sel,
        hmc_dbc2_reorder_rdata => hmc_dbc2_reorder_rdata,
        hmc_dbc0_reorder_rdata => hmc_dbc0_reorder_rdata,
        hmc_mrr_to_valid => bin2int(hmc_mrr_to_valid),
        hmc_rld3_refresh_seq3 => bin2int(hmc_rld3_refresh_seq3),
        hmc_power_saving_exit_cycles => bin2int(hmc_power_saving_exit_cycles),
        hmc_dbc2_enable_dm => hmc_dbc2_enable_dm,
        hmc_dbc0_rc_en => hmc_dbc0_rc_en,
        hmc_mps_exit_cs_to_cke => bin2int(hmc_mps_exit_cs_to_cke),
        pa_sync_control => pa_sync_control,
        hmc_rd_to_wr => bin2int(hmc_rd_to_wr),
        hmc_rd_odt_period => bin2int(hmc_rd_odt_period),
        hmc_ctrl_output_regd => hmc_ctrl_output_regd,
        pa_feedback_mux_sel_0 => pa_feedback_mux_sel_0,
        hmc_tile_id => bin2int(hmc_tile_id),
        hmc_mem_if_rowaddr_width => hmc_mem_if_rowaddr_width,
        hmc_ctrl_reorder_rdata => hmc_ctrl_reorder_rdata,
        hmc_reorder_data => hmc_reorder_data,
        hmc_cfg_loopback_en => hmc_cfg_loopback_en,
        hmc_rd_to_rd_diff_bg => bin2int(hmc_rd_to_rd_diff_bg),
        hmc_dbc3_burst_length => hmc_dbc3_burst_length,
        hmc_dbc2_ctrl_sel => hmc_dbc2_ctrl_sel,
        hmc_dbc2_slot_offset => bin2int(hmc_dbc2_slot_offset),
        physeq_tile_id => bin2int(physeq_tile_id),
        hmc_col_cmd_slot => bin2int(hmc_col_cmd_slot),
        hmc_dbc3_enable_dm => hmc_dbc3_enable_dm,
        hmc_dbc2_rc_en => hmc_dbc2_rc_en,
        pa_feedback_divider_c1 => pa_feedback_divider_c1,
        hmc_dbc1_output_regd => hmc_dbc1_output_regd,
        hmc_second_clk_src => hmc_second_clk_src,
        physeq_trk_mgr_mrnk_mode => physeq_trk_mgr_mrnk_mode,
        hmc_sb_cg_disable => hmc_sb_cg_disable,
        hmc_clkgating_en => hmc_clkgating_en,
        hmc_row_cmd_slot => bin2int(hmc_row_cmd_slot),
        hmc_cfg_prbs_ctrl_sel => hmc_cfg_prbs_ctrl_sel,
        hmc_mps_exit_cke_to_cs => bin2int(hmc_mps_exit_cke_to_cs),
        hmc_dbc1_slot_offset => bin2int(hmc_dbc1_slot_offset),
        hmc_pch_to_valid => bin2int(hmc_pch_to_valid),
        hmc_cfg_wdata_driver_sel => hmc_cfg_wdata_driver_sel,
        hmc_cfg_dbg_out_sel => bin2int(hmc_cfg_dbg_out_sel),
        hmc_addr_mplx_en => hmc_addr_mplx_en,
        hmc_dbc1_dualport_en => hmc_dbc1_dualport_en,
        hmc_dbc3_dualport_en => hmc_dbc3_dualport_en,
        hmc_dbc0_enable_dm => hmc_dbc0_enable_dm,
        hmc_dbc0_slot_offset => bin2int(hmc_dbc0_slot_offset),
        hmc_dqstrk_to_valid => bin2int(hmc_dqstrk_to_valid),
        hmc_dbc0_cmd_rate => hmc_dbc0_cmd_rate,
        hmc_wr_to_rd_diff_bg => bin2int(hmc_wr_to_rd_diff_bg),
        hmc_rd_odt_on => bin2int(hmc_rd_odt_on),
        hmc_rb_reserved_entry => bin2int(hmc_rb_reserved_entry),
        hmc_dbc0_slot_rotate_en => bin2int(hmc_dbc0_slot_rotate_en),
        physeq_hmc_id => bin2int(physeq_hmc_id),
        hmc_dbc1_pipe_lat => bin2int(hmc_dbc1_pipe_lat),
        hmc_srf_zqcal_disable => hmc_srf_zqcal_disable,
        pa_phase_offset_0 => bin2int(pa_phase_offset_0),
        hmc_pch_all_to_valid => bin2int(hmc_pch_all_to_valid),
        hmc_ctrl_ac_pos => hmc_ctrl_ac_pos,
        hmc_dbc2_output_regd => hmc_dbc2_output_regd,
        pa_exponent_0 => bin2int(pa_exponent_0),
        hmc_rd_to_wr_diff_chip => bin2int(hmc_rd_to_wr_diff_chip),
        hmc_read_odt_chip => bin2int(hmc_read_odt_chip),
        hmc_ctrl2dbc_switch1 => hmc_ctrl2dbc_switch1,
        hmc_act_to_pch => bin2int(hmc_act_to_pch),
        ioaux_info => ioaux_info,
        ioaux_info_valid => ioaux_info_valid,
        ioaux_param_table => ioaux_param_table,
        rewired => rewired
    )
    port map (
        ctl2core_avl_rdata_id => ctl2core_avl_rdata_id,
        dqs_out_x36_lane0 => dqs_out_x36_lane0,
        mmr_in => mmr_in,
        ctl2core_avl_cmd_ready => ctl2core_avl_cmd_ready,
        phy_clk_out2 => phy_clk_out2,
        ping_pong_in => ping_pong_in,
        dll_clk_out0 => dll_clk_out0,
        global_reset_n => global_reset_n,
        phy_clk_in => phy_clk_in,
        ctl_mem_clk_disable => ctl_mem_clk_disable,
        pa_sync_data_top_out => pa_sync_data_top_out,
        pa_sync_data_bot_out => pa_sync_data_bot_out,
        ctl2dbc_in_up => ctl2dbc_in_up,
        pa_reset_n => pa_reset_n,
        dqs_out_x36_lane3 => dqs_out_x36_lane3,
        dbc2ctl2 => dbc2ctl2,
        pa_fbclk_in => pa_fbclk_in,
        ping_pong_out => ping_pong_out,
        pa_dprio_clk => pa_dprio_clk,
        afi_ctl2core => afi_ctl2core,
        dqs_out_x8_lane0 => dqs_out_x8_lane0,
        dll_clk_out3 => dll_clk_out3,
        dll_clk_in => dll_clk_in,
        pa_dprio_block_select => pa_dprio_block_select,
        cal_avl_in => cal_avl_in,
        dbc2ctl1 => dbc2ctl1,
        afi_lane3_to_ctl => afi_lane3_to_ctl,
        pa_dprio_reg_addr => pa_dprio_reg_addr,
        pa_sync_clk_top_out => pa_sync_clk_top_out,
        cal_avl_out => cal_avl_out,
        core2ctl_avl1 => core2ctl_avl1,
        pll_locked_in => pll_locked_in,
        pa_dprio_readdata => pa_dprio_readdata,
        pll_vco_in => pll_vco_in,
        ctl2core_sideband => ctl2core_sideband,
        dqs_out_x18_lane1 => dqs_out_x18_lane1,
        pa_sync_data_bot_in => pa_sync_data_bot_in,
        dqs_in_x18_1 => dqs_in_x18_1,
        phy_clk_out3 => phy_clk_out3,
        pa_sync_data_top_in => pa_sync_data_top_in,
        dqs_in_x18_0 => dqs_in_x18_0,
        dll_clk_out2 => dll_clk_out2,
        mrnk_read_core => mrnk_read_core,
        dqs_out_x8_lane2 => dqs_out_x8_lane2,
        afi_lane2_to_ctl => afi_lane2_to_ctl,
        pa_dprio_read => pa_dprio_read,
        ctl2dbc1 => ctl2dbc1,
        phy_clk_out1 => phy_clk_out1,
        pa_dprio_rst_n => pa_dprio_rst_n,
        rdata_en_full_core => rdata_en_full_core,
        cfg_dbc2 => cfg_dbc2,
        dqs_out_x18_lane3 => dqs_out_x18_lane3,
        core2ctl_avl0 => core2ctl_avl0,
        pa_sync_clk_bot_in => pa_sync_clk_bot_in,
        cfg_dbc1 => cfg_dbc1,
        dqs_out_x18_lane2 => dqs_out_x18_lane2,
        dqs_in_x36 => dqs_in_x36,
        core2ctl_avl_rd_data_ready => core2ctl_avl_rd_data_ready,
        afi_lane1_to_ctl => afi_lane1_to_ctl,
        dqs_out_x8_lane1 => dqs_out_x8_lane1,
        dqs_in_x8_2 => dqs_in_x8_2,
        dbc2core_wr_data_rdy0 => dbc2core_wr_data_rdy0,
        dqs_out_x36_lane2 => dqs_out_x36_lane2,
        phy_fbclk_out => phy_fbclk_out,
        pa_locked => pa_locked,
        pa_dprio_writedata => pa_dprio_writedata,
        pa_core_clk_in => pa_core_clk_in,
        cal_avl_rdata_out => cal_avl_rdata_out,
        dqs_out_x8_lane3 => dqs_out_x8_lane3,
        core2ctl_sideband => core2ctl_sideband,
        cfg_dbc3 => cfg_dbc3,
        dqs_out_x36_lane1 => dqs_out_x36_lane1,
        ctl2dbc0 => ctl2dbc0,
        pa_core_in => pa_core_in,
        dqs_out_x18_lane0 => dqs_out_x18_lane0,
        dll_clk_out1 => dll_clk_out1,
        pa_dprio_write => pa_dprio_write,
        seq2core_reset_n => seq2core_reset_n,
        dqs_in_x8_1 => dqs_in_x8_1,
        afi_cmd_bus => afi_cmd_bus,
        dbc2core_wr_data_rdy3 => dbc2core_wr_data_rdy3,
        dqs_in_x8_0 => dqs_in_x8_0,
        afi_core2ctl => afi_core2ctl,
        afi_lane0_to_ctl => afi_lane0_to_ctl,
        pa_sync_clk_top_in => pa_sync_clk_top_in,
        dbc2ctl0 => dbc2ctl0,
        pa_core_clk_out => pa_core_clk_out,
        phy_clk_out0 => phy_clk_out0,
        dbc2core_wr_data_rdy1 => dbc2core_wr_data_rdy1,
        test_dbg_in => test_dbg_in,
        dbc2ctl3 => dbc2ctl3,
        pa_sync_clk_bot_out => pa_sync_clk_bot_out,
        dbc2core_wr_data_rdy2 => dbc2core_wr_data_rdy2,
        mmr_out => mmr_out,
        test_dbg_out => test_dbg_out,
        cal_avl_rdata_in => cal_avl_rdata_in,
        cfg_dbc0 => cfg_dbc0,
        ctl2dbc_in_down => ctl2dbc_in_down,
        dqs_in_x8_3 => dqs_in_x8_3,
        dqs_in_x4_a_0		=> dqs_in_x4_a_0,
        dqs_in_x4_a_1 		=> dqs_in_x4_a_1,
        dqs_in_x4_a_2 		=> dqs_in_x4_a_2,
        dqs_in_x4_a_3		=> dqs_in_x4_a_3,
        dqs_in_x4_b_0 		=> dqs_in_x4_b_0,
        dqs_in_x4_b_1 		=> dqs_in_x4_b_1,
        dqs_in_x4_b_2 		=> dqs_in_x4_b_2,
        dqs_in_x4_b_3 		=> dqs_in_x4_b_3,
    	dqs_out_x4_a_lane0 	=> dqs_out_x4_a_lane0,
		dqs_out_x4_b_lane0 	=> dqs_out_x4_b_lane0,
		dqs_out_x4_a_lane1 	=> dqs_out_x4_a_lane1,
		dqs_out_x4_b_lane1 	=> dqs_out_x4_b_lane1,
		dqs_out_x4_a_lane2 	=> dqs_out_x4_a_lane2,
		dqs_out_x4_b_lane2 	=> dqs_out_x4_b_lane2,
		dqs_out_x4_a_lane3	=> dqs_out_x4_a_lane3,
		dqs_out_x4_b_lane3	=> dqs_out_x4_b_lane3,
		dft_scan_clk => dft_scan_clk
    );

end behavior;



library IEEE;
use IEEE.std_logic_1164.all;


entity twentynm_refclk_input is
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
end twentynm_refclk_input;

architecture behavior of twentynm_refclk_input is

component twentynm_refclk_input_encrypted
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
end component;

begin

inst : twentynm_refclk_input_encrypted
    generic map (
    	silicon_rev => silicon_rev,
        tnum => tnum,
        refclk1_btm_dwnen => refclk1_btm_dwnen,
        refclk1_btm_upen => refclk1_btm_upen,
        refclk2_tp_upen => refclk2_tp_upen,
        refclk3_tp_upen => refclk3_tp_upen,
        refclk1in_msel => refclk1in_msel,
        refclk1_dwn => refclk1_dwn,
        refclk2_btm_upen => refclk2_btm_upen,
        refclk3_muxin_en => refclk3_muxin_en,
        ref3to2_en => ref3to2_en,
        clkpin_select => clkpin_select,
        refclk1_muxin_en => refclk1_muxin_en,
        refclk3_dwn => refclk3_dwn,
        refclk1_tp_dwnen => refclk1_tp_dwnen,
        pllin_msel => pllin_msel,
        refclk2_dwn => refclk2_dwn,
        refclk0in_msel => refclk0in_msel,
        refclk2_btm_dwnen => refclk2_btm_dwnen,
        refclk3_tp_dwnen => refclk3_tp_dwnen,
        refclk1_tp_upen => refclk1_tp_upen,
        refclk2in_msel => refclk2in_msel,
        location => location,
        refclk3_btm_upen => refclk3_btm_upen,
        refclk3_btm_dwnen => refclk3_btm_dwnen,
        refclk2_muxin_en => refclk2_muxin_en,
        refclk_3_up_n => refclk_3_up_n,
        refclk3in_msel => refclk3in_msel,
        refclk_2_up_n => refclk_2_up_n,
        refclk2_tp_dwnen => refclk2_tp_dwnen,
        ref2to3_en => ref2to3_en
    )
    port map (
        clk_out => clk_out,
        up_out => up_out,
        ref_clk_in => ref_clk_in,
        down_out => down_out,
        pll_cascade_in => pll_cascade_in,
        down_in => down_in,
        up_in => up_in
    );

end behavior;



library IEEE;
use IEEE.std_logic_1164.all;
use work.twentynm_atom_pack.all;


entity twentynm_io_aux is
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
end twentynm_io_aux;

architecture behavior of twentynm_io_aux is

component twentynm_io_aux_encrypted
    generic (
    	silicon_rev : string := "20nm5es";
        config_io_aux_bypass : string := "false";
        nios_reset_vector_word_addr : integer := 0;
        nios_exception_vector_word_addr : integer := 0;
        config_power_down : string := "false";
        cal_clk_div : integer := 6;
        sys_clk_div : integer := 2;
        interface_id : integer := 0;
        verbose_ioaux : string := "false";
        config_spare : integer := 0;
        sys_clk_source : string := "int_osc_clk";
        nios_break_vector_word_addr : integer := 0;
        config_ram_1 : integer := 0;
        config_ram_0 : integer := 0;
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
end component;

begin

inst : twentynm_io_aux_encrypted
    generic map (
    	silicon_rev => silicon_rev,
        config_io_aux_bypass => config_io_aux_bypass,
        nios_reset_vector_word_addr => bin2int(nios_reset_vector_word_addr),
        nios_exception_vector_word_addr => bin2int(nios_exception_vector_word_addr),
        config_power_down => config_power_down,
        cal_clk_div => cal_clk_div,
        sys_clk_div => sys_clk_div,
        interface_id => interface_id,
        verbose_ioaux => verbose_ioaux,
        config_spare => bin2int(config_spare),
        sys_clk_source => sys_clk_source,
        nios_break_vector_word_addr => bin2int(nios_break_vector_word_addr),
        config_ram_1 => bin2int(config_ram(37 downto 16)),
        config_ram_0 => bin2int(config_ram(15 downto 0)),
        config_hps => config_hps,
        nios_code_hex_file => nios_code_hex_file,
        simulation_osc_freq_mhz => simulation_osc_freq_mhz,
        parameter_table_hex_file => parameter_table_hex_file,
        mem_contents => mem_contents,
        mem_contents_valid => mem_contents_valid,
        mem_contents_updated => mem_contents_updated
    )
    port map (
        soft_nios_write_data => soft_nios_write_data,
        debug_clk => debug_clk,
        soft_nios_out_read_data => soft_nios_out_read_data,
        soft_nios_out_byteenable => soft_nios_out_byteenable,
        uc_read => uc_read,
        soft_ram_addr => soft_ram_addr,
        mode => mode,
        soft_ram_waitrequest => soft_ram_waitrequest,
        usrmode => usrmode,
        debug_select => debug_select,
        soft_nios_read_data => soft_nios_read_data,
        soft_ram_clk => soft_ram_clk,
        vji_uir_to_the_hard_nios => vji_uir_to_the_hard_nios,
        soft_nios_out_reset_n => soft_nios_out_reset_n,
        soft_nios_addr => soft_nios_addr,
        mcu_en => mcu_en,
        soft_nios_waitrequest => soft_nios_waitrequest,
        soft_nios_read_data_valid => soft_nios_read_data_valid,
        core_usr_reset_n => core_usr_reset_n,
        soft_ram_read => soft_ram_read,
        debug_out => debug_out,
        uc_av_bus_clk => uc_av_bus_clk,
        soft_ram_rst_n => soft_ram_rst_n,
        pio_out => pio_out,
        uc_write_data => uc_write_data,
        vji_cdr_to_the_hard_nios => vji_cdr_to_the_hard_nios,
        soft_nios_out_addr => soft_nios_out_addr,
        vji_tdo_from_the_hard_nios => vji_tdo_from_the_hard_nios,
        soft_nios_clk => soft_nios_clk,
        soft_nios_out_clk => soft_nios_out_clk,
        vji_tdi_to_the_hard_nios => vji_tdi_to_the_hard_nios,
        soft_nios_out_read_data_valid => soft_nios_out_read_data_valid,
        vji_ir_in_to_the_hard_nios => vji_ir_in_to_the_hard_nios,
        uc_read_data => uc_read_data,
        soft_nios_read => soft_nios_read,
        soft_ram_burstcount => soft_ram_burstcount,
        vji_sdr_to_the_hard_nios => vji_sdr_to_the_hard_nios,
        soft_nios_out_write_data => soft_nios_out_write_data,
        soft_ram_byteenable => soft_ram_byteenable,
        soft_ram_debugaccess => soft_ram_debugaccess,
        soft_nios_out_burstcount => soft_nios_out_burstcount,
        pio_in => pio_in,
        soft_ram_reset_n => soft_ram_reset_n,
        soft_nios_out_waitrequest => soft_nios_out_waitrequest,
        soft_ram_write => soft_ram_write,
        soft_nios_write => soft_nios_write,
        soft_nios_burstcount => soft_nios_burstcount,
        soft_ram_rdata_valid => soft_ram_rdata_valid,
        vji_udr_to_the_hard_nios => vji_udr_to_the_hard_nios,
        soft_nios_byteenable => soft_nios_byteenable,
        soft_nios_out_write => soft_nios_out_write,
        uc_address => uc_address,
        soft_nios_out_read => soft_nios_out_read,
        core_clk => core_clk,
        uc_write => uc_write,
        soft_ram_write_data => soft_ram_write_data,
        soft_ram_read_data => soft_ram_read_data,
        soft_nios_reset_n => soft_nios_reset_n,
        vji_rti_to_the_hard_nios => vji_rti_to_the_hard_nios,
        vji_tck_to_the_hard_nios => vji_tck_to_the_hard_nios,
        vji_ir_out_from_the_hard_nios => vji_ir_out_from_the_hard_nios
    );

end behavior;



