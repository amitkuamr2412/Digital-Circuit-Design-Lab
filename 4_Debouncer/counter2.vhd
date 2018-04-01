library ieee;
use ieee.std_logic_1164.all;

entity counter2 is
port (CLK, reset: in std_logic; Q: out std_logic);
end entity counter2;

architecture struct of counter2 is

component counter is
port (CLK, reset: in std_logic; Qbar: out std_logic);
end component counter;

signal f : std_logic_vector(18 downto 0) ;

begin
	C1: counter port map (CLK => CLK , reset => reset ,Qbar => f(0));
l1 : for i in 0 to 17 generate 
begin
	C: counter port map (CLK => f(i) , reset => reset ,Qbar => f(i+1));
end generate l1;
    C2: counter port map (CLK => f(18) , reset => reset ,Qbar => Q);
end architecture struct;	
