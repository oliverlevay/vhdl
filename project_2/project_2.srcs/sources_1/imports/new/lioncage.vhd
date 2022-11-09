library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity lioncage is
    Port ( clk : in STD_LOGIC;
           x1 : in STD_LOGIC;
           x2 : in STD_LOGIC;
           u : out STD_LOGIC);
end lioncage;

architecture Behavioral of lioncage is
    type state_type is (s0, s1, s2, s3);
    signal current_state, next_state : state_type;
begin
    clocking : process(clk)
    begin
        if rising_edge(clk) then
            current_state <= next_state;
        end if;
    end process;
    
    process (x1, x2, current_state)
    begin
        next_state <= current_state;
        
        case current_state is
            when s0 =>
                if x1 = '0' and x2 = '0' then
                    u <= '0';
                else
                    u <= '1';
                end if;
                
                if x1 = '0' and x2 = '1' then
                    next_state <= s1;
                end if;
            when s1 =>
                u <= '1';
                
                if x1 = '1' and x2 = '1' then
                    next_state <= s0;
                elsif x1 = '1' and x2 = '0' then
                    next_state <= s2;
                end if;
            when s2 =>
                u <= '1';
                if x1 = '0' and x2 = '0' then
                    next_state <= s1;
                elsif x1 = '0' and x2 = '1' then
                    next_state <= s3;
                end if;
            when s3 =>
                u <= '1';
                if x1 = '1' and x2 = '1' then
                    next_state <= s2;
                end if;
        end case;
    end process;      
end Behavioral;
