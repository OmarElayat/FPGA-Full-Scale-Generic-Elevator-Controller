library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity up_down is
   port(
      curr_floor: in std_logic_vector(3 downto 0);
      up: in std_logic;
      down: in std_logic;
      timer_done: in std_logic;
--      time_en : out std_logic_vector(1 downto 0);
      new_floor : out std_logic_vector(3 downto 0);
      new_floor_wr : out std_logic

   );
end up_down;

architecture up_down_arch of up_down is
begin
   -- state register
   process(curr_floor,up,down,timer_done)
   begin
    new_floor_wr <= '0';
    if(timer_done = '1' and up = '1')then
        new_floor <= std_logic_vector(unsigned(curr_floor) + 1);
--        time_en <= "00";
        new_floor_wr <= '1';
    elsif(timer_done = '1' and down = '1')then
        new_floor <= std_logic_vector(unsigned(curr_floor) - 1);
--        time_en <= "00";
        new_floor_wr <= '1';
    end if;
   end process;
end up_down_arch;