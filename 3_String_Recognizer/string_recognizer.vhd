library ieee;
use ieee.std_logic_1164.all;
-- X4,X3,X2,X1,X0: in std_logic
 entity string_recognizer is
port (X: in std_logic_vector(4 downto 0) ; W: out std_logic;
CLK,reset: in std_logic);
end entity string_recognizer;

architecture struct of string_recognizer is

component GUN is
port (X: in std_logic_vector(4 downto 0) ; W: out std_logic;
CLK,reset: in std_logic);
end component GUN;

component BOMB is
port (X: in std_logic_vector(4 downto 0) ; W: out std_logic;
CLK,reset: in std_logic);
end component  BOMB;

component  KNIFE is
port (X: in std_logic_vector(4 downto 0) ; W: out std_logic;
CLK,reset: in std_logic);
end component  KNIFE;

component  TERROR is
port (X: in std_logic_vector(4 downto 0) ; W: out std_logic;
CLK,reset: in std_logic);
end component  TERROR;

signal w1,w2,w3,w4: std_logic;
begin

gun1: GUN port map (X => X, CLK => CLK, reset => reset,W => w1);
bomb1: BOMB port map (X => X, CLK => CLK, reset => reset,W => w2);
knife1: KNIFE port map (X => X, CLK => CLK, reset => reset,W => w3);
terror1: TERROR port map (X => X, CLK => CLK, reset => reset,W => w4);

W <= w1 or w2 or w2 or w3 or w4;

end struct;
