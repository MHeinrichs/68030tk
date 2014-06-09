library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
 
entity clk_div_2by3 is
  
  port (
    clk      : in  std_logic;
    rst_n    : in  std_logic;
    clk_2by3 : out std_logic
    clk_1by3 : out std_logic);
 
end clk_div_2by3;
 
architecture clk_div_2by3_arch of clk_div_2by3 is
signal clk_div_by3_pos : std_logic_vector(1 downto 0);
signal clk_div_by3_neg : std_logic_vector(1 downto 0);
 
begin  -- behavior
clk_2by3 <= (not clk_div_by3_neg(0) and clk_div_by3_pos(0)) or
            (clk_div_by3_neg(1) and clk_div_by3_pos(1));
  
pos_edge: process (clk, rst_n)
begin  -- process posedge
  if rst_n = '0' then -- asynchronous reset (active low)
    clk_div_by3_pos <= (others => '0');
  elsif clk'event and clk = '1' then -- rising clock edge
    if clk_div_by3_pos = "10" then
      clk_div_by3_pos <= (others => '0');   
    else
      clk_div_by3_pos <= clk_div_by3_pos + 1; 
    end if;
  end if;
end process pos_edge;
 
neg_edge: process (clk, rst_n)
begin  -- process posedge
  if rst_n = '0' then -- asynchronous reset (active low)
    clk_div_by3_neg <= (others => '0');
  elsif clk'event and clk = '0' then -- rising clock edge
    if clk_div_by3_neg = "10" then
      clk_div_by3_neg <= (others => '0');   
    else
      clk_div_by3_neg <= clk_div_by3_neg + 1; 
    end if;
  end if;
end process neg_edge;

half_clk: process(clk_2by3, rst_n)
begin
  if rst_n = '0' then -- asynchronous reset (active low)
    clk_1by3 <= '0';
  elsif rising_edge(clk_2by3) then -- rising clock edge
	clk_1by3 <= not clk_1by3;
  end if;
end process half_clk;
 
end clk_div_2by3_arch;