----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.01.2021 21:54:31
-- Design Name: 
-- Module Name: TLC_sim - Behavioral
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


entity TLC_sim is
--  Port ( );
end TLC_sim;

architecture Behavioral of TLC_sim is

component TLC
    Port ( sensor : in std_logic;
           clk : in std_logic;
           rst_n : in std_logic;
           T1, T3, T5, T7 : out std_logic_vector(2 downto 0);
           T2, T4, T6, T8 : out std_logic_vector(1 downto 0)
            );
  end component;

  signal sensor: std_logic;
  signal clk: std_logic;
  signal rst_n: std_logic;
  signal T1, T3, T5, T7: std_logic_vector(2 downto 0);
  signal T2, T4, T6, T8: std_logic_vector(1 downto 0) ;

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: TLC port map ( sensor => sensor,
                      clk    => clk,
                      rst_n  => rst_n,
                      T1     => T1,
                      T3     => T3,
                      T5     => T5,
                      T7     => T7,
                      T2     => T2,
                      T4     => T4,
                      T6     => T6,
                      T8     => T8 );

  stimulus: process
  begin
  
    -- Put initialisation code here

    rst_n<='1';
   wait for 200ns;
   rst_n<='0';  
    -- Put test bench stimulus code here

    --stop_the_clock <= true;
    wait;
  end process;

  clocking: process
  begin
    while not stop_the_clock loop
      clk <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end;
  

