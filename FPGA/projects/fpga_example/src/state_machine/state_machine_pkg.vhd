library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package state_machine_pkg is

    type state_machine_control_record is record
        start   : std_logic;
        enable  : std_logic;
    end record state_machine_control_record;
    -- c_init
    constant c_init_state_machine_control: state_machine_control_record :=
        (
        start   => '0',
        enable  => '0'
        );

    type state_machine_status_record is record
        fibonacci_num   : unsigned (7 downto 0);
        data_valid      : std_logic;
        led_grn         : std_logic;
        led_red         : std_logic;
    end record state_machine_status_record;

end package;
