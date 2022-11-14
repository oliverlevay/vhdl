-------------------------------------------------------------------------------
-- Title      : FSM
-- Project    : 
-------------------------------------------------------------------------------
-- File       : FSM.vhd
-- Author     : Steffen Malkowsky  <Steffen@Steffens-MacBook-Air.local>
-- Company    : 
-- Created    : 2014-06-14
-- Last update: 2014-07-19
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: implementation of the FSM used to control the stop watch.
-------------------------------------------------------------------------------
-- Copyright (c) 2014 Lund University
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2014-06-14  1.0      Steffen Created
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity FSM is
  
  port (
    clk     : in  std_logic;
    n_rst   : in  std_logic;
    start   : in  std_logic;
    stop    : in  std_logic;
    run_cnt : out std_logic;
    set0    : out std_logic);

end entity FSM;

architecture FSM_arch of FSM is

  -----------------------------------------------------------------------------
  -- TODO:
  -----------------------------------------------------------------------------
  type state_type is (s0, s1, s2, s3);                -- Add your states of the FSM
  signal  current_state, next_state : state_type;
  
begin  -- architecture FSM_arch

  reg : process (clk, n_rst) is
  begin
    if n_rst = '0' then
      current_state <= s0;
    elsif rising_edge(clk) then
      current_state <= next_state;
    end if;
  end process reg;

  next_state_logic : process (current_state, start, stop) is
  begin
    ---------------------------------------------------------------------------
    -- TODO:
    -- Implement your transition logic based on your FSM graph and set the
    -- outputs.
    ---------------------------------------------------------------------------
    next_state <= current_state;
    case current_state is
        when s0 =>
            if start = '1' then
                next_state <= s1;
            end if;
        when s1 =>
            if stop = '1' then
                next_state <= s2;
            end if;
        when s2 =>
            if stop = '1' then 
                next_state <= s3;
            elsif start = '1' then
                next_state <= s1;
            end if;
        when s3 => 
            next_state <= s0;
    end case;
  end process next_state_logic;
  
  output_logic : process (current_state) is
  begin
    ---------------------------------------------------------------------------
    -- TODO:
    -- Implement your transition logic based on your FSM graph and set the
    -- outputs.
    ---------------------------------------------------------------------------
    case current_state is
        when s0 =>
            run_cnt <= '0';
            set0 <= '0';
        when s1 =>
            run_cnt <= '1';
            set0 <= '0';
        when s2 =>
            run_cnt <= '0';
            set0 <= '0';
        when s3 => 
            run_cnt <= '0';
            set0 <= '1';
    end case;
  end process output_logic;
    

  end architecture FSM_arch;
