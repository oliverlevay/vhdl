----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/09/2022 09:40:03 AM
-- Design Name: 
-- Module Name: flipflop - Behavioral
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

entity flipflop is
    Port ( clk : in STD_LOGIC;
           D : in STD_LOGIC;
           Q : out STD_LOGIC;
           Q_p : out STD_LOGIC);
end flipflop;

architecture Behavioral of flipflop is
    component control is
        port (
            clk : in STD_LOGIC;
            phi1 : out STD_LOGIC;
            phi2 : out STD_LOGIC
        );
    end component;
    
    component latch is
        port (
            phi : in STD_LOGIC;
            x1 : in STD_LOGIC;
            x2 : in STD_LOGIC;
            f1 : out STD_LOGIC;
            f2 : out STD_LOGIC
        );
    end component;

    signal s_Q : std_logic;
    signal s_Q_p : std_logic;
    signal s_y1 : std_logic;
    signal s_y2 : std_logic;
    signal s_phi1 : std_logic;
    signal s_phi2 : std_logic;
    signal s_not_d : std_logic;
begin
    Q <= s_Q;
    Q_p <= s_Q_p;
    s_not_d <= not D;

    contr: control
    port map(
        clk => clk,
        phi1 => s_phi1,
        phi2 => s_phi2
    );

    l1: latch
    port map(
        phi => s_phi1,
        x1 => D,
        x2 => s_not_D,
        f1 => s_y1,
        f2 => s_y2
    );

    l2: latch
    port map(
        phi => s_phi2,
        x1 => s_y1,
        x2 => s_y2,
        f1 => s_Q,
        f2 => s_Q_p
    );
end Behavioral;
