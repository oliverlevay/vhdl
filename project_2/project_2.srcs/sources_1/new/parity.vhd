----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/09/2022 03:21:05 PM
-- Design Name: 
-- Module Name: parity - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

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
