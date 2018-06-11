----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:23:13 06/10/2018 
-- Design Name: 
-- Module Name:    Sum_C4bits_TopModule - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Sum_C4bits_TopModule is
	port(
		a, b : in std_logic_vector(3 downto 0);
		s    : out std_logic_vector(3 downto 0);
		c_out: out std_logic);
end Sum_C4bits_TopModule;

architecture structural of Sum_C4bits_TopModule is
	signal c :std_logic_vector(4 downto 0);
	signal p, g : std_logic_vector(3 downto 0);
	
	--Component Sum_C4bits_Prediccionmd
		COMPONENT Sum_C4bits_Prediccionmd
	PORT(
		a_i : IN std_logic;
		b_i : IN std_logic;
		c_i : IN std_logic;          
		s_i : OUT std_logic;
		p_i : OUT std_logic;
		g_i : OUT std_logic
		);
	END COMPONENT;
	
	--Component Sum_C4bits_PredCarryLookAHead
		COMPONENT Sum_C4bits_PredCarryLookAHead
	PORT(
		g : IN std_logic_vector(3 downto 0);
		p : IN std_logic_vector(3 downto 0);
		c_0 : IN std_logic;          
		c : OUT std_logic_vector(4 downto 1)
		);
	END COMPONENT;
	

begin
	
	c(0) <= '0';
	c_out <= c(4);
	
	GenerateSum : for i in 0 to 3 generate
	Inst_Sum_C4bits_Prediccionmd: Sum_C4bits_Prediccionmd
		port map(
			a_i => a(i),
			b_i => b(i),
			c_i => c(i),
			s_i => s(i),
			p_i => p(i),
			g_i => g(i));
			
	end generate GenerateSum;
	
	--Manual Instance  Sum_C4bits_PredCarryLookAHead 
	Inst_Sum_C4bits_PredCarryLookAHead: Sum_C4bits_PredCarryLookAHead PORT MAP(
		g => g,
		p => p,
		c_0 => c(0),
		c => c(4 downto 1)
	);


end structural;


