library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_lioncage is
    -- 
end TB_lioncage;

architecture Behavioral of TB_lioncage is
    component lioncage is -- Deklarerar komponenten som skall simuleras
        port( 
            clk : in  std_logic;
            x1  : in  std_logic;
            x2  : in  std_logic;
            u   : out std_logic
        );
    end component;
    
    signal sim_done     : std_logic := '0';
    
    constant clk_period : time := 100 ns;
    
    signal s_clk    : std_logic := '1'; -- Initierar klockan till 1, viktigt! Se rad 45.
    signal s_x1     : std_logic;
    signal s_x2     : std_logic;
    signal s_u      : std_logic;
begin
    my_lioncage: lioncage
    port map(
        clk => s_clk,
        x1  => s_x1,
        x2  => s_x2,
        u   => s_u);
    
-- Process som genererar klocksignal
    clk_gen: process    
    begin
        if sim_done  = '0' then
            wait for clk_period / 2;
            s_clk <= not s_clk;     
        else
            wait;
        end if;
    end process;
    
    DUT_stimuli: process
    begin

    s_x1 <= '0';
    s_x2 <= '0'; 
    wait for clk_period;

    s_x1 <= '1';
    wait for clk_period;
    
    s_x2 <= '1';
    wait for clk_period;
    
    s_x1 <= '0';
    wait for clk_period;
    
    s_x2 <= '0';
    wait for 2*clk_period;
    
    s_x2 <= '1';
    wait for clk_period;
    
    s_x1 <= '1';
    wait for clk_period;
    
    s_x2 <= '0';
    wait for clk_period;
    
    s_x1 <= '0';
    wait for 2*clk_period;


    sim_done <= '1';
    report "Simulation lioncage done! :)" severity note; -- Skriver ut en trevlig kommentar i terminalen!
    
    wait;       -- Avsluta med wait, då signalerna inte uppdateras stannar simuleringen automatiskt

    end process;


end Behavioral;
