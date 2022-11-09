library ieee;
use ieee.std_logic_1164.all;

entity TB_latch is
--  Port ( );
end TB_latch;

architecture Behavioral of TB_latch is

    component latch is
        port(
            phi : in  std_logic;
            x1  : in  std_logic;
            x2  : in  std_logic;
            f1  : out std_logic;
            f2  : out std_logic
        );
    end component;

    signal s_phi : std_logic;
    signal s_x1  : std_logic;
    signal s_x2  : std_logic;
    signal s_f1  : std_logic;
    signal s_f2  : std_logic;

begin


    DUT: latch
    port map(
        phi => s_phi,
        x1  => s_x1,
        x2  => s_x2,
        f1  => s_f1,
        f2  => s_f2
    );

    DUT_stimuli: process
    begin
        
        s_phi <= '0';
        s_x1 <= '0';
        s_x2 <= '0';
        wait for 10 us;

        s_x1 <= '1';
        s_x2 <= '0';
        wait for 10 us;

        s_x1 <= '0';
        s_x2 <= '1';
        wait for 10 us;

        s_phi <= '1';
        s_x1 <= '0';
        s_x2 <= '0';
        wait for 10 us;

        s_x1 <= '1';
        s_x2 <= '0';
        wait for 10 us;

        s_x1 <= '0';
        s_x2 <= '1';
        wait for 10 us;

        s_x1 <= '1';
        s_x2 <= '1';
        wait for 10 us;
        
        s_x1 <= '0';
        s_x2 <= '1';
        wait for 10 us;

        wait;

    end process;

end Behavioral;
