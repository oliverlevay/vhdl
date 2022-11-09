----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/09/2022 09:22:18 AM
-- Design Name: 
-- Module Name: control - Behavioral
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

entity control is
    Port ( clk : in STD_LOGIC;
           phi1 : out STD_LOGIC;
           phi2 : out STD_LOGIC);
end control;

architecture Behavioral of control is
    signal s_phi1 : STD_LOGIC;
    signal s_phi2 : STD_LOGIC;
begin
    phi1 <= s_phi1;
    phi2 <= s_phi2;

    s_phi1 <= clk and not s_phi2;
    s_phi2 <= not clk and not s_phi1;
end Behavioral;
