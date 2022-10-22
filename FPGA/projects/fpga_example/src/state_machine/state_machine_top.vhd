library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- packages
use work.state_machine_pkg.all;

entity state_machine_top is
    port(
        --input
        clk                     : in std_logic;
        rst                     : in std_logic;
        state_machine_control   : in state_machine_control_record;

        --output
        state_machine_status    : out state_machine_status_record
        );
end state_machine_top;

architecture rtl of state_machine_top is

    --control
    signal start                    : std_logic;
    signal enable                   : std_logic;

    --status
    signal fibonacci_num            : unsigned(7 downto 0);
    signal data_valid               : std_logic;
    signal led_grn                  : std_logic;
    signal led_red                  : std_logic;

    --clk divider
    signal counter                  : unsigned(9 downto 0);
    constant counter_divisor_const  : unsigned(9 downto 0) := 10x"03E8";
    signal clk_en                   : std_logic;

    --fib proc
    signal num_1                    : unsigned(7 downto 0) := 8x"0000";
    signal num_2                    : unsigned(7 downto 0) := 8x"0001";
    signal fib_it                   : unsigned(3 downto 0) := 4x"0000";

    --edge detect
    signal enable_r1                : std_logic;
    signal en_rising                : std_logic;
    signal en_falling               : std_logic;
    signal enable_int               : std_logic;

    -- fibonacci number states
    type fibonacci_states is
        (
        idle_st,
        calculate_st,
        loop_st,
        end_st
        );

    -- fibonacci number state machine
    signal fibonacci_state  : fibonacci_states;


begin
    --connect input record to local signals
    start                                   <= state_machine_control.start;
    enable                                  <= state_machine_control.enable;

    --connect output record to local signals
    state_machine_status.led_grn            <= led_grn;
    state_machine_status.led_red            <= led_red;
    state_machine_status.data_valid         <= data_valid;
    state_machine_status.fibonacci_num      <= fibonacci_num;

     --clock divider
    clock_divider_proc: process(clk, rst)
    begin
    if (rst = '1') then
        counter <= (others => '0');
        clk_en  <= '0';
    elsif(rising_edge(clk)) then
        if(enable_int = '1') then
            if(counter = counter_divisor_const-1) then
                counter <= (others => '0');
                clk_en  <= '1';
            else
                clk_en  <= '0';
                counter <= counter + 1;
            end if;
        else
            clk_en <= '0';
            counter <= (others => '0');
        end if;
    end if;
    end process;


    --edge dectection
    enable_edge_detect_proc: process(clk, rst)
    begin
        if (rst = '1') then
            enable_r1   <= '0';
            en_rising   <= '0';
            en_falling  <= '0';
        elsif(rising_edge(clk)) then
            enable_r1   <= enable;
            --rising edge
            if((enable = '1') and (enable_r1 = '0')) then
                en_rising <= '1';
            else
                en_rising <= '0';
            end if;

            --falling edge
            if((enable = '0') and (enable_r1 = '1')) then
                en_falling <= '1';
            else
                en_falling <= '0';
            end if;
        end if;
    end process;

    --enable_int
    ebable_int_proc: process(clk,rst)
    begin
        if(rst ='1') then
            enable_int <= '0';

        elsif(rising_edge(clk)) then
            if(en_rising = '1') then
                enable_int <= '1';
            elsif(en_falling = '1') then
                enable_int  <= '0';
            end if;
        end if;
    end process;

    --state machine
    state_machine_proc: process(clk, rst)
    begin
        if (rst = '1') then
            fibonacci_num <= (others => '0');
            fib_it <= (others => '0');
            data_valid <= '0';
        elsif(rising_edge(clk)) then
            case fibonacci_state is
            when idle_st =>
                fib_it <= (others => '0');
                num_1 <= 8x"0000";
                num_2 <= 8x"0001";
                fibonacci_num <= (others => '0');

                if(enable_int = '1') and ( start = '1') then
                    fibonacci_state <= loop_st;

                end if;
            when calculate_st =>
                if((clk_en = '1') and (enable_int = '1')) then
                    fibonacci_num <= fibonacci_num + num_2;
                    data_valid <= '1';
                    num_1 <= num_2;
                    num_2 <= fibonacci_num;
                    fib_it <= fib_it + 1;
                    fibonacci_state <= loop_st;
                elsif(enable_int = '0') then
                    fibonacci_state <= idle_st;
                end if;

            when loop_st =>
                if((clk_en = '1') and (enable_int = '1')) then
                    if(fib_it < 4x"0009") then
                        fibonacci_state <= calculate_st;
                    else
                        fibonacci_state <= end_st;
                    end if;
                elsif(enable_int = '0') then
                    fibonacci_state <= idle_st;
                else
                    data_valid <= '0';
                end if;
            when end_st =>
                if((clk_en = '1') and (enable_int = '1')) then
                    if(start = '0') then
                        fibonacci_state <= idle_st;
                    end if;
                elsif(enable_int = '0') then
                    fibonacci_state <= idle_st;
                end if;
            end case;
        end if;
    end process;

    --led behavior
    state_led_proc: process(clk, rst)
    begin
        if(rst = '1') then
            led_red <= '0';
            led_grn <= '0';
        elsif(rising_edge(clk)) then
            if(enable_int = '0') then
                led_red <= '1';
                led_grn <= '0';
            elsif(enable_int = '1') then
                if(fibonacci_state = idle_st) then
                    led_red <= '0';
                    led_grn <= '1';
                else
                    led_red <= '1';
                    led_grn <= '1';
                end if;
            end if;
        end if;
    end process;

end rtl;
