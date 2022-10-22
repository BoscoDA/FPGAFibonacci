library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package timer_pkg is
    type timer_control_record is record
        timer_enable    : std_logic;
    end record timer_control_record;
    -- c_init
    constant c_init_timer_control: timer_control_record :=
        (
        timer_enable    => '0'  -- std_logic;
        );

    type timer_status_record is record
        led_grn                     : std_logic;
        led_red                     : std_logic;
        timer_50us_pulse            : std_logic;
        timer_100us_pulse           : std_logic;
        timer_state_machine_start   : std_logic;
    end record timer_status_record;

end package;
