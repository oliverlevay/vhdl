library ieee;
use ieee.std_logic_1164.all;

entity TB_parity is
--  Port ( );
end TB_parity;

architecture Behavioral of TB_parity is

    component parity is -- Deklarerar komponenten som skall simuleras
        port( 
            clk : in  std_logic;
            i   : in  std_logic;
            p   : out std_logic
        );
    end component;

    signal sim_done     : std_logic := '0'; -- signal som används för att avsluta simuleringen
    
    constant clk_period : time := 100 ns;   -- Konstant för att ställa en klockperiod, 
                                            -- värdet spelar ingen större roll i sammanhanget 
                                            -- (korta tider är bättre => snabbare simulering)


    -- Insignaler
    signal s_clk    : std_logic := '1'; -- Initierar klockan till 1, viktigt! Se rad 45.
    signal s_i      : std_logic;
    signal s_p      : std_logic;

begin


    my_par: parity      -- Instansierar komponenten som skall simuleras
    port map( 
        clk => s_clk,
        i   => s_i,
        p   => s_p
    );

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

    s_i <= '0'; 
    wait for 6*clk_period;

    s_i <= '1';
    wait for 6*clk_period;


    sim_done <= '1';
    report "Simulation parity done! :)" severity note; -- Skriver ut en trevlig kommentar i terminalen!
    
    wait;       -- Avsluta med wait, då signalerna inte uppdateras stannar simuleringen automatiskt

    end process;

end Behavioral;
