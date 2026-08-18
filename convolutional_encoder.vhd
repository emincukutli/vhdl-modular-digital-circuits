library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity convolutional_encoder is
    Port ( 
        clk     : in STD_LOGIC;
        clr     : in STD_LOGIC;
        data_in : in STD_LOGIC;
        C1      : out STD_LOGIC;
        C2      : out STD_LOGIC;
        C3      : out STD_LOGIC
    );
end convolutional_encoder;

architecture Behavioral of convolutional_encoder is

    type state_type is (S0, S1, S2, S3, S4, S5, S6, S7, 
                        S8, S9, S10, S11, S12, S13, S14, S15);
    
    signal present_state, next_state : state_type;

begin

    state_reg: process(clk, clr)
    begin
        if clr = '1' then
            present_state <= S0;
        elsif clk'event and clk='1' then
            present_state <= next_state;
        end if;
    end process;

    comb_proc: process(present_state, data_in)
    begin
        case present_state is

            when S0 =>
                if data_in = '0' then
                    next_state <= S0;
                    C1<='0'; C2<='0'; C3<='0'; 
                else
                    next_state <= S8;
                    C1<='1'; C2<='1'; C3<='1'; 
                end if;

            
            when S1 =>
                if data_in = '0' then
                    next_state <= S0;                    
                    C1<='1'; C2<='1'; C3<='0'; 
                else
                    next_state <= S8; 
                    C1<='0'; C2<='0'; C3<='1';
                end if;

           
            when S2 =>
                if data_in = '0' then
                    next_state <= S1; 
                    C1<='1'; C2<='0'; C3<='1'; 
                else
                    next_state <= S9;
                    C1<='0'; C2<='1'; C3<='0'; 
                end if;
            
            when S3 =>
                if data_in = '0' then
                    next_state <= S1;
                    C1<='0'; C2<='0'; C3<='0'; 
                else
                    next_state <= S9;
                    C1<='1'; C2<='1'; C3<='1'; 
                end if;
                          
             when S4 =>
                if data_in = '0' then
                    next_state <= S2;
                    C1<='1'; C2<='0'; C3<='0'; 
                else
                    next_state <= S10;
                    C1<='0'; C2<='1'; C3<='1'; 
                end if;
                
            when S5 =>
                if data_in = '0' then
                    next_state <= S2;
                    C1<='0'; C2<='0'; C3<='1'; 
                else
                    next_state <= S10;
                    C1<='1'; C2<='1'; C3<='0'; 
                end if;

            when S6 =>
                if data_in = '0' then
                    next_state <= S3;
                    C1<='0'; C2<='1'; C3<='0'; 
                else
                    next_state <= S11;
                    C1<='1'; C2<='0'; C3<='1'; 
                end if;      
                          
            when S7 =>
                if data_in = '0' then
                    next_state <= S3;
                    C1<='1'; C2<='1'; C3<='1'; 
                else
                    next_state <= S11;
                    C1<='0'; C2<='0'; C3<='0'; 
                end if;                
 
            when S8 =>
                if data_in = '0' then
                    next_state <= S4;
                    C1<='1'; C2<='1'; C3<='0'; 
                else
                    next_state <= S12;
                    C1<='0'; C2<='0'; C3<='1'; 
                end if;                

            when S9 =>
                if data_in = '0' then
                    next_state <= S4;
                    C1<='0'; C2<='1'; C3<='1'; 
                else
                    next_state <= S12;
                    C1<='1'; C2<='0'; C3<='0'; 
                end if;                
                
            when S10 =>
                if data_in = '0' then
                    next_state <= S5;
                    C1<='0'; C2<='1'; C3<='1'; 
                else
                    next_state <= S13;
                    C1<='1'; C2<='0'; C3<='0'; 
                end if;                
                
            when S11 =>
                if data_in = '0' then
                    next_state <= S5; 
                    C1<='1'; C2<='1'; C3<='0'; 
                else
                    next_state <= S13;
                    C1<='0'; C2<='0'; C3<='1'; 
                end if;                
                
            when S12 =>
                if data_in = '0' then
                    next_state <= S6;
                    C1<='0'; C2<='1'; C3<='1'; 
                else
                    next_state <= S14;
                    C1<='1'; C2<='0'; C3<='1'; 
                end if;                
                
            when S13 =>
                if data_in = '0' then
                    next_state <= S6;
                    C1<='1'; C2<='1'; C3<='1'; 
                else
                    next_state <= S14;
                    C1<='0'; C2<='0'; C3<='0'; 
                end if;                
                
             when S14 =>
                if data_in = '0' then
                    next_state <= S7;
                    C1<='1'; C2<='0'; C3<='0'; 
                else
                    next_state <= S15;
                    C1<='0'; C2<='1'; C3<='1'; 
                end if;                                
                
            when S15 =>
                if data_in = '0' then
                    next_state <= S7;
                    C1<='0'; C2<='0'; C3<='1'; 
                else
                    next_state <= S15;
                    C1<='1'; C2<='1'; C3<='0'; 
                end if;                 
                
            when others =>
                next_state <= S0;
                C1<='0'; C2<='0'; C3<='0';
        end case;
    end process;

end Behavioral;