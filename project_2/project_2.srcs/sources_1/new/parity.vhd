library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity parity is
    Port ( clk : in STD_LOGIC;
           i : in STD_LOGIC;
           p : out STD_LOGIC);
end parity;

architecture Behavioral of parity is
    type state_type is (even, odd);
    signal current_state, next_state : state_type;
begin

    clocking : process(clk)
    begin
        if rising_edge(clk) then
            current_state <= next_state;
        end if;
    end process;
    
    process (i, current_state)
    begin
        next_state <= current_state;
        case current_state is
            when even =>
                if i = '1' then
                    p <= '1';
                    next_state <= odd;
                else
                    p <= '0';
                end if;
            when odd =>
                if i = '1' then
                    p <= '0';
                    next_state <= even;
                else
                    p <= '1';
                end if;
        end case;
    end process;      
end Behavioral;
