library ieee;
use ieee.std_logic_1164.all;

entity DUT is
port (x: in std_logic ; W: out std_logic;
CLK,reset: in std_logic);
end entity DUT;

architecture struct of DUT is

component counter2 is
port (CLK, reset: in std_logic; Q: out std_logic);
end component counter2;

component debounce is
port (x: in std_logic ; W: out std_logic;
CLK,reset: in std_logic);
end component debounce;

signal Q: std_logic ;

begin 

count: counter2 port map (CLK => CLK ,reset => reset , Q => Q  );

debou: debounce port map (x,W,Q,reset);

end architecture struct;	