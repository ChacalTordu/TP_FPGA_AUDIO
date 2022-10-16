library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DAC is
port(	RESET: in std_logic;
		
		DAC_MCLK: in std_logic;
		DAC_SCLK: in std_logic;
		DAC_LRCK: in std_logic;
		LOAD : in std_logic;
		DAC_SDIN: in std_logic;
		OE : in std_logic;
		indice_visu : in integer range 0 to 47;
		
		SDATAL : out std_logic_vector(23 downto 0);
		SDATAR : out std_logic_vector(23 downto 0));
				
end DAC;

architecture Behavioral of DAC is
begin 
    process 
        begin
       --Prise en compte de la 1Ã¨re donnÃ©e (MSB de la data L) sur le 2Ã¨me front montant de SCLK aprÃ¨s le
      --front descendant de LRCK
      --PARTIE GAUCHE  
    if(falling_edge(DAC_LRCK)) then  
        if(rising_edge(DAC_SCLK))then
            if(rising_edge(DAC_SCLK))then
            
          for i in 0 to 23 loop
            SDATAL(i) <= DAC_SDIN;
            wait for 20ns;
            wait until rising_edge(DAC_SCLK);
            wait for 55ns;
            
          end loop;
         end if;
         end if;
         end if; 
        
        
             --PARTIE DROITE  

     if(falling_edge(DAC_LRCK)) then
        if(rising_edge(DAC_SCLK))then
            if(rising_edge(DAC_SCLK))then
            
          for i in 0 to 23 loop
            SDATAR(i) <= DAC_SDIN;
            wait for 20ns;
            wait until rising_edge(DAC_SCLK);
            wait for 55ns;
            
          end loop;
         end if;
         end if; 
         end if;
     
end process;
end Behavioral;
