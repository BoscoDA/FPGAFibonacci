library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- packages
use work.timer_pkg.all;

entity timer_top is
    port(
        --input
        clk             : in std_logic;
        rst             : in std_logic;
        timer_control   : in timer_control_record;

        --output
        timer_status    : out timer_status_record
        );
end timer_top;

architecture rtl of timer_top is

    signal timer_enable                 : std_logic;
    signal timer_50us_pulse             : std_logic;
    signal timer_100us_pulse            : std_logic;
    signal timer                        : unsigned(12 downto 0);
    signal led_red                      : std_logic;
    signal led_grn                      : std_logic;

        --  constant    c_value         : unsigned(12 downto 0) ;= 13x"0000";

    constant    timer_50us_const                : unsigned(12 downto 0) := 13x"0fa0";
    constant    timer_100us_const               : unsigned(12 downto 0) := 13x"1f40";

    signal      state_machine_counter           : unsigned(1 downto 0);
    constant    timer_state_machine_start_const : unsigned(1 downto 0) := 2x"0003";
    signal      timer_state_machine_start       : std_logic;


begin
    -- connect input record to local signals (timer_enable)
    timer_enable                        <= timer_control.timer_enable;

    -- connect local signals to output record
    timer_status.led_red                    <= led_red;
    timer_status.led_grn                    <= led_grn;
    timer_status.timer_50us_pulse           <= timer_50us_pulse;
    timer_status.timer_100us_pulse          <= timer_100us_pulse;
    timer_status.timer_state_machine_start  <= timer_state_machine_start;

    --process for timer/cnt
    timer_proc: process(clk, rst)
    begin
        if (rst = '1') then
            timer                       <= (others => '0');  -- others keyword means all the bits in the vector
            timer_50us_pulse            <= '0';
            timer_100us_pulse           <= '0';
            state_machine_counter       <= (others => '0');
            timer_state_machine_start   <= '0';
        elsif rising_edge(clk) then
            --timer enabled
            if(timer_enable = '1')then
                --timer not at maximum, count up
                if(timer /= timer_100us_const - 1) then
                    timer <= timer + 1;
                --timer is at maximum resest to 0
                else
                    timer <= (others => '0');
                end if;
            --timer disabled
            else
                timer <= (others => '0');
                state_machine_counter <= (others => '0');
            end if;

            --50us pulse trigger
            if((timer = timer_50us_const - 1) or
            (timer = timer_100us_const - 1)) then
                timer_50us_pulse <= '1';
            else
                timer_50us_pulse <= '0';
            end if;

            --100us pulse trigger
            if(timer = timer_100us_const - 1) then
                timer_100us_pulse <= '1';
            else
                timer_100us_pulse <= '0';
            end if;

            --state machine start pulse 200us
            if(timer = timer_100us_const - 1) then
                if(state_machine_counter = timer_state_machine_start_const - 1) then
                    timer_state_machine_start <= '1';
                    state_machine_counter <= (others => '0');
                else
                    timer_state_machine_start <= '0';
                    state_machine_counter <= state_machine_counter + 1;
                end if;
            else
                timer_state_machine_start <= '0';
            end if;
        end if;
    end process;

    --process for led control, red when disabled, yellow for 50us and green for 50us when enabled until disabled
    led_proc: process(clk, rst)
    begin
        if(rst = '1') then
            led_red     <= '0';
            led_grn     <= '0';
        elsif rising_edge(clk) then
            if(timer_enable = '1') then
                --yellow for 50us
                if(timer < timer_50us_const - 1) then
                    led_red     <= '1';
                    led_grn     <= '1';
                --green for 50us
                else
                    led_red     <= '0';
                    led_grn     <= '1';
                end if;
            --red when timer is not enabled
            else
                led_red         <= '1';
                led_grn         <= '0';
            end if;
        end if;
    end process;

end rtl;
