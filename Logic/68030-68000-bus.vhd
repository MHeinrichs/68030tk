library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity BUS68030 is

port( 
	AS_030: inout std_logic ;
	AS_000: inout std_logic ;
	DS_030: inout std_logic ;
	UDS_000: inout std_logic;
	LDS_000: inout std_logic;
	SIZE: inout std_logic_vector ( 1 downto 0 );
	A: inout std_logic_vector ( 31 downto 0 );
	CPU_SPACE: in std_logic ;
	BERR: inout std_logic ; --error: this is connected to a global input pin :(
	BG_030: in std_logic ;
	BG_000: out std_logic ;
	BGACK_030: out std_logic ;
	BGACK_000: in std_logic ;
	CLK_030: in std_logic ;
	CLK_000: in std_logic ;
	CLK_OSZI: in std_logic ;
	CLK_DIV_OUT: out std_logic ;
	CLK_EXP: out std_logic	; 
	FPU_CS: out std_logic ;
	IPL_030: out std_logic_vector ( 2 downto 0 );
	IPL: in std_logic_vector ( 2 downto 0 );
	DSACK: inout std_logic_vector ( 1 downto 0 );
	DTACK: inout std_logic ;
	AVEC: out std_logic ;
	AVEC_EXP: inout std_logic ; --this is a "free pin"
	E: out std_logic ;
	VPA: in std_logic ;
	VMA: out std_logic ;
	RST: in std_logic ;
	RESET: out std_logic ;
	RW: in std_logic ;
--	D: inout std_logic_vector ( 31 downto 28 );
	FC: in std_logic_vector ( 1 downto 0 );
	AMIGA_BUS_ENABLE: out std_logic ;
	AMIGA_BUS_DATA_DIR: out std_logic ;
	AMIGA_BUS_ENABLE_LOW: out std_logic;
	CIIN: out std_logic
	);
end BUS68030;

architecture Behavioral of BUS68030 is


subtype ESTATE is std_logic_vector(3 downto 0);
  
constant E1  : ESTATE := "0110";
constant E2  : ESTATE := "0111";  
constant E3  : ESTATE := "0100";  
constant E4  : ESTATE := "0101";  
constant E5  : ESTATE := "0010";  
constant E6  : ESTATE := "0011";  
constant E7  : ESTATE := "1010";  
constant E8  : ESTATE := "1011";  
constant E9  : ESTATE := "1100";  
constant E10 : ESTATE := "1111";
-- Illegal states  
constant E20 : ESTATE := "0000";  
constant E4a : ESTATE := "0001";  
constant E21 : ESTATE := "1000";  
constant E22 : ESTATE := "1001";  
constant E23 : ESTATE := "1101";  
constant E24 : ESTATE := "1110";  

signal cpu_est : ESTATE := E20;
signal cpu_est_d : ESTATE := E20;

subtype AMIGA_STATE is std_logic_vector(2 downto 0);
  
constant IDLE_P		 : AMIGA_STATE := "000";
constant IDLE_N		 : AMIGA_STATE := "001";
constant AS_SET_P	 : AMIGA_STATE := "010";  
constant AS_SET_N	 : AMIGA_STATE := "011";  
constant SAMPLE_DTACK_P: AMIGA_STATE := "100";  
constant DATA_FETCH_N: AMIGA_STATE := "101";  
constant DATA_FETCH_P : AMIGA_STATE := "110";  
constant END_CYCLE_N : AMIGA_STATE := "111";  

signal SM_AMIGA : AMIGA_STATE := IDLE_P;
signal SM_AMIGA_D : AMIGA_STATE := IDLE_P;
  
--signal	Dout:STD_LOGIC_VECTOR(3 downto 0) := "0000";
signal	AS_000_INT:STD_LOGIC:= '1';
signal	AS_000_START:STD_LOGIC:= '1';
signal	AS_030_000_SYNC:STD_LOGIC:= '1';
signal	BGACK_030_INT:STD_LOGIC:= '1';
signal	DTACK_SYNC:STD_LOGIC:= '1';
signal	DTACK_DMA:STD_LOGIC:= '1';
signal	FPU_CS_INT:STD_LOGIC:= '1';
signal	VPA_D: STD_LOGIC:='1';
signal	VPA_SYNC: STD_LOGIC:='1';
signal	VMA_INT: STD_LOGIC:='1';
signal	VMA_INT_D: STD_LOGIC:='1';
signal	UDS_000_INT: STD_LOGIC:='1';
signal	LDS_000_INT: STD_LOGIC:='1';
signal  DSACK_INT: STD_LOGIC_VECTOR ( 1 downto 0 ) := "11";
signal	CLK_CNT: STD_LOGIC_VECTOR ( 1 downto 0 ) := "00";
signal	CLK_REF: STD_LOGIC_VECTOR ( 1 downto 0 ) := "10";
signal	CLK_000_CNT: STD_LOGIC_VECTOR ( 3 downto 0 ) := "0000";
signal	CLK_OUT_PRE: STD_LOGIC:='1';
signal	CLK_OUT_INT: STD_LOGIC:='1';
signal	CLK_030_D: STD_LOGIC:='1';
signal	CLK_000_D: STD_LOGIC := '1';
signal	CLK_000_DD: STD_LOGIC := '1';
signal	RISING_CLK_AMIGA: STD_LOGIC :='0';
signal	FALLING_CLK_AMIGA: STD_LOGIC :='0';
--signal	RISING_CLK_030: STD_LOGIC :='0';
--signal	FALLING_CLK_030: STD_LOGIC :='0';

begin



	--the clocks
	clk: process(CLK_OSZI)
	begin
		if(rising_edge(CLK_OSZI)) then
			--reset buffer
			RESET <= RST;
		    
			--clk generation : up to now just half the clock
			if(CLK_CNT="01") then
				CLK_OUT_PRE	<=	not CLK_OUT_PRE;			
				CLK_CNT	<= "00";	
			else
				CLK_CNT	<= CLK_CNT+1;					
			end if;
			-- the external clock to the processor is generated here
			CLK_OUT_INT	<= CLK_OUT_PRE; --this way we know the clock of the next state: Its like looking in the future, cool!
			--delayed Clocks for edge detection
			CLK_000_D <= CLK_000;
			CLK_000_DD <= CLK_000_D;



			--RISING_CLK_030 		<= CLK_OUT_PRE and not CLK_030;
			--FALLING_CLK_030 	<= not CLK_OUT_PRE and CLK_030;
			--edge detection stuff
			RISING_CLK_AMIGA 	<= not CLK_000_D and CLK_000;
			FALLING_CLK_AMIGA 	<= CLK_000_D and not CLK_000;

			--cycle counter for Amiga-Bus-Timing


			if( CLK_000_D /= CLK_000)then --not equal
				CLK_000_CNT <= "0001";
			else
				CLK_000_CNT <= CLK_000_CNT+1;	--4bit counter	
			end if;

			-- e-clock
			if(CLK_000_DD = '0' and CLK_000_D = '1') then
				case (cpu_est) is
					when E1 => cpu_est <= E2 ; 
					when E2 => cpu_est <= E3 ;
					when E3 => cpu_est <= E4;
					when E4  => cpu_est <= E5 ;
					when E5  => cpu_est <= E6 ;
					when E6  => cpu_est <= E7 ;
					when E7  => cpu_est <= E8 ;
					when E8  => cpu_est <= E9 ;
					when E9  => cpu_est <= E10;
					when E10 => cpu_est <= E1 ;
					-- Illegal states
					when E4a => cpu_est <= E5 ;
					when E20 => cpu_est <= E10;
					when E21 => cpu_est <= E10;
					when E22 => cpu_est <= E9 ;
					when E23 => cpu_est <= E9 ;
					when E24 => cpu_est <= E10;
					when others =>
						null;
				end case;
			end if;
			cpu_est_d <= cpu_est;
			VPA_D <= VPA;
		end if;
	end process clk;

	--eclk: process(CLK_000)
	--begin
	--	if(rising_edge(CLK_000)) then
	--		-- e clock
	--		case (cpu_est) is
	--			when E1 => cpu_est <= E2 ; 
	--			when E2 => cpu_est <= E3 ;
	--			when E3 => cpu_est <= E4;
	--			when E4  => cpu_est <= E5 ;
	--			when E5  => cpu_est <= E6 ;
	--			when E6  => cpu_est <= E7 ;
	--			when E7  => cpu_est <= E8 ;
	--			when E8  => cpu_est <= E9 ;
	--			when E9  => cpu_est <= E10;
	--			when E10 => cpu_est <= E1 ;
	--			-- Illegal states
	--			when E4a => cpu_est <= E5 ;
	--			when E20 => cpu_est <= E10;
	--			when E21 => cpu_est <= E10;
	--			when E22 => cpu_est <= E9 ;
	--			when E23 => cpu_est <= E9 ;
	--			when E24 => cpu_est <= E10;
	--			when others =>
	--				null;
	--		end case;
	--	end if;
	--end process eclk;



	--the state process
	state_machine: process(RST, CLK_OSZI)
	begin
		if(RST = '0' ) then
			SM_AMIGA	<= IDLE_P;
			AS_000_INT 	<='1';
			AS_000_START<= '0';
			AS_030_000_SYNC 	<='1';
			UDS_000_INT	<='1';
			LDS_000_INT	<='1';
			CLK_REF		<= "10";
			VMA_INT		<= '1';
			VMA_INT_D	<= '1';
			FPU_CS_INT	<= '1';
			BG_000		<= '1';
			BGACK_030_INT	<= '1';
			DSACK_INT	<= "11";
			DTACK_DMA 	<= 	'1';
			DTACK_SYNC  <= '1';
			VPA_SYNC	<= '1';
			IPL_030		<=	"111";
		elsif(rising_edge(CLK_OSZI)) then



			--bgack is simple: assert as soon as Amiga asserts but hold bg_ack for one amiga-clock 
			if(BGACK_000='0') then
				BGACK_030_INT	<= '0';
			elsif (BGACK_000='1' AND RISING_CLK_AMIGA='1') then -- BGACK_000 is high here!
				BGACK_030_INT 	<= '1'; --hold this signal high until 7m clock goes high
			end if;

			--bus grant only in idle state
			if(BG_030= '1')then
				BG_000	<= '1';
			elsif(CLK_030 ='0') then
				if(	BG_030= '0' AND (SM_AMIGA 	= IDLE_N or SM_AMIGA 	= IDLE_P)
					and CPU_SPACE = '0' and AS_030='1') then --bus granted no local access and no AS_030 running!
					BG_000 	<= '0';
				else
					BG_000	<= '1'; 
				end if;
			end if;

			--CO-Processor Chip select


			
			--interrupt buffering to avoid ghost interrupts
			if(RISING_CLK_AMIGA='1')then
				IPL_030<=IPL;			
			end if;
		
			-- as030-sampling and FPU-Select

			if(AS_030 ='1') then
				AS_030_000_SYNC <= '1';
				FPU_CS_INT		<= '1';
			elsif(	CLK_030  	= '1'  AND --68030 has a valid AS on high clocks
					AS_030 		= '0') then

				if(FC(1)='1' and FC(0)='1' and A(19)='0' and A(18)='0' and A(17)='1' and A(16)='0' AND BGACK_000='1') then
					FPU_CS_INT	<= '0';
					AS_030_000_SYNC 	<= '1';					
				else 
					AS_030_000_SYNC <= CPU_SPACE;					
					FPU_CS_INT		<= '1';
				end if;
			end if;

			-- "async" reset
			if(AS_030 ='1') then
				DSACK_INT<="11";
				AS_000_INT  <= '1';
				UDS_000_INT <= '1';
				LDS_000_INT <= '1';
				DTACK_SYNC  <= '1';
				VPA_SYNC	<= '1';
			end if;

			-- VMA generation
			--assert
			if(CLK_000_D='0' AND VPA_D='0' AND cpu_est = E4)then
				VMA_INT <= '0';
			end if;

			--deassert
			if(CLK_000_D='1' AND AS_000_INT='1' AND cpu_est_d=E1)then
				VMA_INT <= '1';
			end if;


			--Amiga statemachine
			case (SM_AMIGA) is
				when IDLE_P 	 => --68000:S0 wait for a falling edge
					if( CLK_000_D='0' )then
						SM_AMIGA<=IDLE_N;
					end if;
				when IDLE_N 	 => --68000:S1 wait for rising edge, on a rising CLK_000 look for a amiga adressrobe
					--AS_000_START <='0';
					if(CLK_000_D='1' and CLK_000_DD = '0')then --sample AS only at the rising edge!
						if( AS_030_000_SYNC 	= '0'  )then
							AS_000_INT <= '0';
							if (RW='1' and DS_030 = '0') then --read: set udl/lds 	
								if(A(0)='0') then
									UDS_000_INT <= '0';
								else
									UDS_000_INT <= '1';
								end if;
								if((A(0)='1' OR SIZE(0)='0' OR SIZE(1)='1')) then
									LDS_000_INT <= '0';
								else
									LDS_000_INT <= '1';
								end if;
							end if;
							SM_AMIGA <= AS_SET_P; --as for amiga set!
						end if;
					end if;
				when AS_SET_P	 => --68000:S2 Amiga cycle starts here: since AS is asserted during transition to this state we simply wait here
					if(CLK_000_D='0')then
						SM_AMIGA<=AS_SET_N;
					end if;
				when AS_SET_N	 => --68000:S3: nothing happens here; on a transition to s4: assert uds/lds on write 
					if(CLK_000_D='1')then
						if (RW='0' and DS_030 = '0') then --write: set udl/lds 				 
							if(A(0)='0') then
								UDS_000_INT <= '0';
							else
								UDS_000_INT <= '1';
							end if;
							if((A(0)='1' OR SIZE(0)='0' OR SIZE(1)='1')) then
								LDS_000_INT <= '0';
							else
								LDS_000_INT <= '1';
							end if;
						end if;
						SM_AMIGA <= SAMPLE_DTACK_P;
					end if;
				when SAMPLE_DTACK_P=> --68000:S4 wait for dtack or VMA
					if(CLK_000_D='0' )then
						if(DTACK_SYNC = '0' OR VPA_SYNC ='0')then
							SM_AMIGA<=DATA_FETCH_N;
						--else
						--	SM_AMIGA<=AS_SET_N; -- no dtack sampled wait one clock: go back to AS_SET_N
						end if;
					else -- high clock: sample DTACK
						if(VPA_D = '1' AND DTACK='0') then 
							DTACK_SYNC  <= '0';
						elsif(VPA_D='0' AND cpu_est=E9 AND VMA_INT='0') then --vpa/vma cycle: sync VPA on E9: one 7M-clock to latch!
							VPA_SYNC  <= '0';
							
						end if;
					end if;
				when DATA_FETCH_N=> --68000:S5 nothing happens here just wait for positive clock
					if(CLK_000_D='1')then
						SM_AMIGA<=DATA_FETCH_P;
					end if;
				when DATA_FETCH_P => --68000:S6: READ: here comes the data on the bus!
					if( CLK_000_D ='0' AND CLK_OUT_PRE='1'
					) then
						DSACK_INT<="01"; 
						SM_AMIGA<=END_CYCLE_N;
					end if;
				when END_CYCLE_N =>--68000:S7: Latch/Store data and go to IDLE on high clock
					if(CLK_000_D='1' and AS_000_INT='1' )then
						SM_AMIGA<=IDLE_P;
					--elsif(	CLK_OUT_PRE='1' --assert here (next 68030-Clock will be high)! 
					--		and AS_030_000_SYNC ='0' -- if the cycle somehow aboarded do not send a dsack!
					--	) then --timing is everything!
							--if(	(VPA_SYNC  ='0' AND CLK_000_CNT > x"0" and RW='0') OR
							--	(VPA_SYNC  ='0' AND CLK_000_CNT > x"0" and RW='1') OR
							--	(DTACK_SYNC='0' AND CLK_000_CNT > x"0" and RW='0') OR
							--	(DTACK_SYNC='0' AND CLK_000_CNT > x"0" and RW='1')
							--)then
					--			DSACK_INT<="01"; 
							--end if;
								
					end if;
			end case;
			
			--delay for hold time of CIAs
			VMA_INT_D <= VMA_INT;
	

			--dma stuff
			--DTACK for DMA cycles
			if(AS_000_INT ='0' AND DSACK(1) ='0') then
				DTACK_DMA 	<= 	'0';
			else
				DTACK_DMA 	<= 	'1';
			end if;

			SM_AMIGA_D <= SM_AMIGA;

		end if;		
	end process	state_machine;

	--output clock assignment
	CLK_DIV_OUT	<= CLK_OUT_INT;
	CLK_EXP		<= CLK_OUT_INT;
	AVEC_EXP	<= 'Z' when FPU_CS_INT ='1' else '0';
	
	--dtack for dma
	DTACK    	<= 	'Z' when BGACK_030_INT ='1' else
					DTACK_DMA;

	--fpu
	FPU_CS		<=	FPU_CS_INT;
	
	--if no copro is installed:
	BERR		<=	'Z' when FPU_CS_INT ='1' else '0';



	--cache inhibit: For now: disable
	CIIN <= '1' WHEN A(31 downto 20) = x"00F" ELSE
			--'1' WHEN A(31 downto 16) = x"00E0" ELSE
			'Z' WHEN not(A(31 downto 24) = x"00")  ELSE
			'0';

	--bus buffers
	AMIGA_BUS_ENABLE <= '0'; --for now: allways on
	AMIGA_BUS_DATA_DIR <='1' WHEN RW='0' ELSE '0';
	AMIGA_BUS_ENABLE_LOW <= '1'; --for now: allways off
		
	--e and VMA		
	E		<= cpu_est(3);
	VMA		<= VMA_INT;
	
	
	--AVEC
	AVEC <=	'1';
		
	--as and uds/lds
	AS_000	<= 'Z' 	when BGACK_030_INT ='0' else
					AS_000_INT;
	UDS_000	<= 'Z' when BGACK_030_INT ='0' else -- output on cpu cycle
					UDS_000_INT;
	LDS_000	<= 'Z' when BGACK_030_INT ='0' else -- output on cpu cycle
					LDS_000_INT;

	--dsack
	DSACK		<= "ZZ" when CPU_SPACE = '1' else -- output on amiga cycle
					DSACK_INT;
	BGACK_030	<= BGACK_030_INT;
	-- signal assignment
	--DS_030	<= "ZZ"; 					
	--DS_030	<= "ZZ" when BGACK_030_INT ='1' else -- output on dma cycle
	--				DS_030_INT;
	
	--A(1) <= 'Z';
	--A(0) <= 'Z';
	--A[1 downto 0] <= "ZZ" when BGACK_030_INT ='1' else -- output on dma cycle
	--				A_INT;
	
	--SIZE		<= "ZZ";
	--SIZE		<= "ZZ" when BGACK_030_INT ='1' else -- output on dma cycle
	--				SIZE_INT;
	
end Behavioral;

