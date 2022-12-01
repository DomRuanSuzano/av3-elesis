-- Elementos de Sistemas
-- developed by Luciano Soares
-- date: 4/4/2017
-- Modificação:
--   - Renan : prova Av3
--
-- Unidade que controla os componentes da CPU

library ieee;
use ieee.std_logic_1164.all;

entity controlUnit2 is
    port(
		instruction                 : in STD_LOGIC_VECTOR(17 downto 0);
		zr,ng                       : in STD_LOGIC;
		muxALUI                   : out STD_LOGIC;                
		muxAM                       : out STD_LOGIC;  
		muxDM                       : out STD_LOGIC;  
		zx, nx, zy, ny, f, no       : out STD_LOGIC;
		loadA, loadD, loadM, loadPC : out STD_LOGIC
    );
end entity;

architecture arch of controlUnit2 is

begin

  --=================================--
  -- implementar somente o sinal do muxDM
  -- não precisa implementar os demais
  --=================================--

-- loadD <= instruction(17) and instruction(4);
-- loadA <= (instruction(17) and instruction(3)) or (not instruction(17));
-- loadM <= instruction(17) and instruction(5);
-- muxALUI_A <= not(instruction(17));
-- muxAM <= instruction(17) and instruction(13);
muxDM <= instruction(17) and instruction(14);
-- zx <= instruction(17) and instruction(12);
-- nx <= instruction(17) and instruction(11);
-- zy <= instruction(17) and instruction(10);
-- ny <= instruction(17) and instruction(9);
-- f <= instruction(17) and instruction(8);
-- no <= instruction(17) and instruction(7);
-- loadPC <= (instruction(17) and instruction(0) and not(zr) and not(ng)) or (instruction(17) and instruction(1) and zr) or (instruction(17) and instruction(2) and ng);

end architecture;
