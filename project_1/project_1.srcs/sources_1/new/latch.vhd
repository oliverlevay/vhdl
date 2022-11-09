----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/09/2022 09:04:01 AM
-- Design Name: 
-- Module Name: latch - Behavioral
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

entity latch is
    Port ( phi : in STD_LOGIC;
           x1 : in STD_LOGIC;
           x2 : in STD_LOGIC;
           f1 : out STD_LOGIC;
           f2 : out STD_LOGIC);
end latch;

architecture Behavioral of latch is
    signal s_f1 : STD_LOGIC;
    signal s_f2 : STD_LOGIC;

begin
    f1 <= s_f1;
    f2 <= s_f2;
    s_f1 <= not (not (x1 and phi) and s_f2);
    s_f2 <= not (not (x2 and phi) and s_f1);
end Behavioral;
