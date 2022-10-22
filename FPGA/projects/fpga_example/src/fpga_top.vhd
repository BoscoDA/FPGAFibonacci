library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- packages
use work.fpga_pkg.all;
use work.timer_pkg.all;
use work.state_machine_pkg.all;

entity fpga_top is
    port(
        --input
        clk_osc_20_meg              : in std_logic;
        fpga_async_in_1_n           : in std_logic;
        fpga_async_in_2             : in std_logic;
        --output
        led_1_red_n                 : out std_logic;
        led_1_grn_n                 : out std_logic;
        led_2_red_n                 : out std_logic;
        led_2_grn_n                 : out std_logic
        );

end fpga_top;

architecture rtl of fpga_top is
    --clk/rst
    signal clk_80m                  : std_logic;
    signal rst_80m                  : std_logic;
    signal rst_80m_n                : std_logic;
    signal clk_100m                 : std_logic;
    signal rst_100m                 : std_logic;
    signal rst_100m_n               : std_logic;

    --control
    signal timer_control            : timer_control_record;
    signal state_machine_control    : state_machine_control_record;

    --status
    signal timer_status             : timer_status_record;
    signal state_machine_status     : state_machine_status_record;

begin

----------------------------------------------------------------------
-- -/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\- --
-- -\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/- --
--******************************************************************--
-- fpga pin connections
--******************************************************************--
-- -/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\- --
-- -\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/- --
----------------------------------------------------------------------
    -- inputs
    timer_control.timer_enable      <= not fpga_async_in_1_n;
    state_machine_control.enable    <= fpga_async_in_2;

    -- outputs
    led_1_red_n                     <= not timer_status.led_red;
    led_1_grn_n                     <= not timer_status.led_grn;
    led_2_red_n                     <= not state_machine_status.led_red;
    led_2_grn_n                     <= not state_machine_status.led_grn;


----------------------------------------------------------------------
-- -/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\- --
-- -\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/- --
--******************************************************************--
-- clock and reset
--******************************************************************--
-- -/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\- --
-- -\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/- --
----------------------------------------------------------------------
    --------------------------------------------------------------
    -- clock and reset module
    --------------------------------------------------------------

    clk_rst_module_inst : entity work.clk_rst_module(rtl)
    port map(
        clk_20m                 => clk_osc_20_meg,
        clk_80m                 => clk_80m,
        rst_80m                 => rst_80m,
        rst_80m_n               => rst_80m_n,
        clk_100m                => clk_100m,
        rst_100m                => rst_100m,
        rst_100m_n              => rst_100m_n
    );


----------------------------------------------------------------------
-- -/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\- --
-- -\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/- --
--******************************************************************--
-- clock domain instantiations
--******************************************************************--
-- -/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\- --
-- -\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/- --
----------------------------------------------------------------------

    --------------------------------------------------------------
    -- domain 1
    -------------------------------------------------------------

    clk_domain_1_inst : entity work.clk_domain_1(rtl)
    port map(
        clk             => clk_80m,         -- : std_logic
        rst             => rst_80m,         -- : std_logic
        timer_control   => timer_control,   -- : timer_control_record
        timer_status    => timer_status     -- : timer_status_record
    );

    --------------------------------------------------------------
    -- domain 2
    -------------------------------------------------------------
        state_machine_control.start <= timer_status.timer_state_machine_start;

    clk_domain_2_inst : entity work.clk_domain_2(rtl)
    port map(
        clk                     => clk_100m,                -- : std_logic
        rst                     => rst_100m,                -- : std_logic
        state_machine_control   => state_machine_control,   -- : state_machine_control_record
        state_machine_status    => state_machine_status     -- : state_machine_status_record
    );

end rtl;
