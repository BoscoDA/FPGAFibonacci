library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package fpga_pkg is
    type fpga_port_o_record is record
        led_1_red_n                 : std_logic;
        led_1_grn_n                 : std_logic;
        led_2_red_n                 : std_logic;
        led_2_grn_n                 : std_logic;
    end record fpga_port_o_record;

    type fpga_port_i_record is record
        fpga_async_in_1_n           : std_logic;
        fpga_async_in_2             : std_logic;
    end record fpga_port_i_record;

end package;
