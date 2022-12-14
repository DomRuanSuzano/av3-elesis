-- Elementos de Sistemas
-- developed by Luciano Soares
-- 1 tb_q1_ControlUnit.vhd
-- date: 4/4/2017

Library ieee;
use ieee.std_logic_1164.all;

library vunit_lib;
context vunit_lib.vunit_context;

entity tb_ControlUnit2 is
  generic (runner_cfg : string);
end entity;

architecture tb of tb_controlUnit2 is

  component controlUnit2 is
      port(
        	instruction                 : in STD_LOGIC_VECTOR(17 downto 0);
		zr,ng                       : in STD_LOGIC;
		muxALUI                     : out STD_LOGIC;                
		muxAM                       : out STD_LOGIC;  
    muxDM                       : out STD_LOGIC;  
		zx, nx, zy, ny, f, no       : out STD_LOGIC;
		loadA, loadD, loadM, loadPC : out STD_LOGIC
        );
  end component;

  signal clk : std_logic := '0';
  signal instruction                 : STD_LOGIC_VECTOR(17 downto 0) := (others => '0');
  signal zr,ng                       : STD_LOGIC := '0';
  signal muxALUI                     : STD_LOGIC := '0';
  signal muxAM                       : STD_LOGIC := '0';
  signal muxDM                       : STD_LOGIC := '0';
  signal zx, nx, zy, ny, f, no       : STD_LOGIC := '0';
  signal loadA, loadD                : STD_LOGIC := '0'; 
  signal loadM, loadPC		     : STD_LOGIC := '0';

begin

	uCU: controlUnit2 port map(instruction, zr, ng, muxALUI, muxAM, muxDM, zx, nx, zy, ny, f, no, loadA, loadD, loadM, loadPC);

	clk <= not clk after 100 ps;

  main : process
    begin
      test_runner_setup(runner, runner_cfg);

    instruction <= "00" & "000" & "000010" & "0001" & "000";
    zr <= '0';  ng <= '0';
    wait until clk = '1';
    assert(muxDM = '0')
      report "**Falha** Teste 0" severity error;

    instruction <= "00" & "010" & "000010" & "0001" & "000";
    wait until clk = '1';
    assert(muxDM = '0')
      report "**Falha** Teste 1" severity error;

    instruction <= "10" & "000" & "000010" & "0001" & "000";
    wait until clk = '1';
    assert(muxDM = '0')
      report "**Falha** Teste 2" severity error;
      
    instruction <= "10" & "010" & "000010" & "0001" & "000";
    wait until clk = '1';
    assert(muxDM = '1')
      report "**Falha** Teste 3" severity error;
 

    test_runner_cleanup(runner); -- Simulation ends here

	wait;
  end process;
end architecture;
