-- Copyright: Matthias Heinrichs 2014
-- Free for non-comercial use
-- No warranty just for fun
-- If you want to earn money with this code, ask me first!



library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity BUS68030 is

port( 
	AS_030: inout std_logic ;
	AS_000: inout std_logic ;
	RW_000: inout std_logic ;
	DS_030: inout std_logic ;
	UDS_000: inout std_logic;
	LDS_000: inout std_logic;
	SIZE: inout std_logic_vector ( 1 downto 0 );
	A: in std_logic_vector ( 31 downto 16 );
	A0: inout std_logic;
	nEXP_SPACE: in std_logic ;
	BERR: inout std_logic ;
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
	FPU_SENSE: in std_logic ;
	IPL_030: out std_logic_vector ( 2 downto 0 );
	IPL: in std_logic_vector ( 2 downto 0 );
	DSACK1: inout std_logic;
	DTACK: inout std_logic ;
	AVEC: out std_logic ;
	E: out std_logic ;
	VPA: in std_logic ;
	VMA: out std_logic ;
	RST: in std_logic ;
	RESET: out std_logic ;
	RW: inout std_logic ;
--	D: inout std_logic_vector ( 31 downto 28 );
	FC: in std_logic_vector ( 1 downto 0 );
	AMIGA_ADDR_ENABLE: out std_logic ;
	AMIGA_BUS_DATA_DIR: out std_logic ;
	AMIGA_BUS_ENABLE_LOW: out std_logic;
	AMIGA_BUS_ENABLE_HIGH: out std_logic;
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

signal cpu_est : ESTATE;

subtype AMIGA_STATE is std_logic_vector(2 downto 0);
  
constant IDLE_P		 : AMIGA_STATE := "000";
constant IDLE_N		 : AMIGA_STATE := "001";
constant AS_SET_P	 : AMIGA_STATE := "010";  
constant AS_SET_N	 : AMIGA_STATE := "011";  
constant SAMPLE_DTACK_P: AMIGA_STATE := "100";  
constant DATA_FETCH_N: AMIGA_STATE := "101";  
constant DATA_FETCH_P : AMIGA_STATE := "110";  
constant END_CYCLE_N : AMIGA_STATE := "111";  

signal SM_AMIGA : AMIGA_STATE;
  
--signal	Dout:STD_LOGIC_VECTOR(3 downto 0) := "0000";
signal	AS_000_INT:STD_LOGIC		:= '1';
signal	RW_000_INT:STD_LOGIC		:= '1';
signal	AMIGA_BUS_ENABLE_INT:STD_LOGIC		:= '1';
signal	AS_030_D0:STD_LOGIC			:= '1';
signal	DS_030_D0:STD_LOGIC			:= '1';
signal	AS_030_000_SYNC:STD_LOGIC	:= '1';
signal	BGACK_030_INT:STD_LOGIC		:= '1';
signal	BGACK_030_INT_D:STD_LOGIC	:= '1';
signal	AS_000_DMA:STD_LOGIC		:= '1';
signal	DS_000_DMA:STD_LOGIC		:= '1';
signal	RW_000_DMA:STD_LOGIC		:= '1';
signal  SIZE_DMA: STD_LOGIC_VECTOR ( 1 downto 0 ) 	:= "11";
signal	A0_DMA: STD_LOGIC			:= '1';
signal	VMA_INT: STD_LOGIC			:= '1';
signal	VPA_D: STD_LOGIC			:= '1';
signal	UDS_000_INT: STD_LOGIC		:= '1';
signal	LDS_000_INT: STD_LOGIC		:= '1';
signal	DS_000_ENABLE: STD_LOGIC	:= '0';
signal  DSACK1_INT: STD_LOGIC		:= '1';
signal	CLK_CNT_P: STD_LOGIC_VECTOR ( 1 downto 0 ) 	:= "00";
signal	CLK_CNT_N: STD_LOGIC_VECTOR ( 1 downto 0 ) 	:= "00";
signal	CLK_REF: STD_LOGIC_VECTOR ( 1 downto 0 ) 	:= "10";
signal	CLK_OUT_PRE_50: STD_LOGIC	:= '1';
signal	CLK_OUT_PRE_50_D: STD_LOGIC	:= '1';
signal	CLK_OUT_PRE_25: STD_LOGIC	:= '1';
signal	CLK_OUT_PRE_33: STD_LOGIC	:= '1';
signal  CLK_PRE_66:STD_LOGIC		:= '0';
signal	CLK_OUT_PRE: STD_LOGIC		:= '1';
signal	CLK_OUT_PRE_D: STD_LOGIC	:= '1';
signal	CLK_OUT_NE: STD_LOGIC		:= '1';
signal	CLK_OUT_INT: STD_LOGIC		:= '1';
signal	CLK_030_H: STD_LOGIC		:= '1';
signal	CLK_000_D0: STD_LOGIC 		:= '1';
signal	CLK_000_D1: STD_LOGIC 		:= '1';
signal	CLK_000_D2: STD_LOGIC 		:= '1';
signal	CLK_000_D3: STD_LOGIC 		:= '1';
signal	CLK_000_D4: STD_LOGIC 		:= '1';
signal	CLK_000_P_SYNC: STD_LOGIC_VECTOR ( 12 downto 0 ) 	:= "0000000000000";
signal	CLK_000_N_SYNC: STD_LOGIC_VECTOR ( 12 downto 0 ) 	:= "0000000000000";
signal	CLK_000_PE: STD_LOGIC 		:= '0';
signal	CLK_000_NE: STD_LOGIC 		:= '0';
signal	CLK_000_E_ADVANCE: STD_LOGIC 	:= '0';
signal	DTACK_D0: STD_LOGIC 		:= '1';

begin


	--the clocks
	neg_clk: process(RST, CLK_OSZI)
	begin
		if(RST = '0' ) then
			CLK_CNT_N	<= "10";	
		elsif(falling_edge(CLK_OSZI)) then
			if(CLK_CNT_N = "10") then
				CLK_CNT_N	<= "00";	
			else
				CLK_CNT_N	<= CLK_CNT_N+1;					
			end if;
		end if;
	end process neg_clk;
	--the state machine
	state_machine: process(RST, CLK_OSZI)
	begin
		if(RST = '0' ) then
			CLK_CNT_P		<= "00";	
			RESET 			<= '0';
			CLK_OUT_PRE_50 	<= '0';
			CLK_OUT_PRE_50_D <= '0';
			--CLK_OUT_PRE_33 	<= '0';
			CLK_OUT_PRE_25 	<= '0';
			CLK_OUT_PRE 	<= '0';
			CLK_OUT_PRE_D 	<= '0';
			CLK_OUT_NE		<= '0';
			CLK_OUT_INT		<= '0';
			cpu_est			<= E20;
			CLK_000_D0		<= '1';
			CLK_000_D1		<= '1';
			CLK_000_D2		<= '1';
			CLK_000_D3		<= '1';
			CLK_000_D4		<= '1';
			VPA_D			<= '1';
			DTACK_D0		<= '1';
			SM_AMIGA		<= IDLE_P;
			AS_000_INT 		<= '1';
			RW_000_INT		<= '1';
			RW_000_DMA		<= '1';
			AS_030_000_SYNC <= '1';
			UDS_000_INT		<= '1';
			LDS_000_INT		<= '1';
			DS_000_ENABLE	<= '0';
			CLK_REF			<= "00";
			VMA_INT			<= '1';
			BG_000			<= '1';
			BGACK_030_INT	<= '1';
			BGACK_030_INT_D <= '1';
			DSACK1_INT		<= '1';
			IPL_030			<= "111";
			CLK_000_P_SYNC	<= "0000000000000";
			CLK_000_N_SYNC	<= "0000000000000";
			CLK_000_PE		<= '0';
			CLK_000_NE		<= '0';
			CLK_000_E_ADVANCE	<= '0';
			AS_000_DMA		<= '1';
			DS_000_DMA		<= '1';
			SIZE_DMA		<= "11";
			A0_DMA			<= '1';
			AMIGA_BUS_ENABLE_INT <= '1';
			AS_030_D0		<= '1';
			DS_030_D0		<= '1';
		elsif(rising_edge(CLK_OSZI)) then
			--reset buffer
			RESET <= '1';

			--clk generation :

		    CLK_OUT_PRE_50	<=	not CLK_OUT_PRE_50;
		    CLK_OUT_PRE_50_D<=	CLK_OUT_PRE_50;		    
			if(CLK_CNT_P = "10") then				
				CLK_CNT_P	<= "00";	
			else
				CLK_CNT_P	<= CLK_CNT_P+1;					
			end if;
			
			--if(CLK_CNT_P ="00" or CLK_CNT_N ="00")then --33MHz Clock
			--	CLK_OUT_PRE_33 <= '0'; 
			--else 
			--	CLK_OUT_PRE_33 <= '1';
			--end if;
			
			if(CLK_OUT_PRE_50='1' and CLK_OUT_PRE_50_D='0')then
				CLK_OUT_PRE_25	<=	not CLK_OUT_PRE_25;
			end if;
			
			--here the clock is selected
			CLK_OUT_PRE 	<= CLK_OUT_PRE_25;
			CLK_OUT_PRE_D 	<= CLK_OUT_PRE;
			
			--a negative edge is comming next cycle
			if(CLK_OUT_PRE_D='1' and CLK_OUT_PRE='0' )then
				CLK_OUT_NE <= '1';
			else
				CLK_OUT_NE <= '0';
			end if;
			-- the external clock to the processor is generated here
			CLK_OUT_INT	<= CLK_OUT_PRE_D; --this way we know the clock of the next state: Its like looking in the future, cool!
			--delayed Clocks and signals for edge detection
			CLK_000_D0 	<= CLK_000;
			CLK_000_D1 	<= CLK_000_D0;
			CLK_000_D2 	<= CLK_000_D1;
			CLK_000_D3 	<= CLK_000_D2;
			CLK_000_D4 	<= CLK_000_D3;

			--shift registers for edge detection
			CLK_000_P_SYNC( 12 downto 1 ) 	<= CLK_000_P_SYNC( 11 downto 0 );
			CLK_000_P_SYNC(0)				<= CLK_000_D0 AND NOT CLK_000_D1;
			CLK_000_N_SYNC( 12 downto 1 ) 	<= CLK_000_N_SYNC( 11 downto 0 );
			CLK_000_N_SYNC(0)				<= NOT CLK_000_D0 AND CLK_000_D1;
			
			-- values are determined empiracally for 7.09 MHz Clock
			-- since the clock is not symmetrically these values differ!
			CLK_000_PE <= CLK_000_P_SYNC(9);
			CLK_000_NE <= CLK_000_N_SYNC(11);
			CLK_000_E_ADVANCE <= CLK_000_NE; 
			DTACK_D0	<= DTACK;
			VPA_D 		<= VPA;

			--now: 68000 state machine and signals
			
			-- e-clock is changed on the FALLING edge!

			if(CLK_000_E_ADVANCE = '1' ) then
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

			AS_030_D0 <= AS_030;
			DS_030_D0 <= DS_030;


			--bgack is simple: assert as soon as Amiga asserts but hold bg_ack for one amiga-clock 
			if(BGACK_000='0') then
				BGACK_030_INT	<= '0';
			elsif (	BGACK_000='1' 
					AND CLK_000_PE='1'
					--AND CLK_000_D1='0' and CLK_000_D0='1'
					) then -- BGACK_000 is high here!
				BGACK_030_INT 	<= '1'; --hold this signal high until 7m clock goes high
			end if;
			BGACK_030_INT_D <= BGACK_030_INT;

			

			--bus grant only in idle state
			if(BG_030= '1')then
				BG_000	<= '1';
			elsif(	BG_030= '0' --AND (SM_AMIGA 	= IDLE_P)
					and nEXP_SPACE = '1' and AS_030_D0='1'
					and CLK_000_D0='1' 
					--and CLK_000_D0='1' AND CLK_000_D1='0'  
					) then --bus granted no local access and no AS_030 running!
					BG_000 	<= '0';
			end if;

		
			--interrupt buffering to avoid ghost interrupts
			--if(CLK_000_NE='1')then
			if(CLK_000_D0='0' and CLK_000_D1='1')then
				IPL_030<=IPL;			
			end if;
		
			-- as030-sampling and FPU-Select

			
			if(AS_030_D0 ='1' or BERR='0') then -- "async" reset of various signals
				AS_030_000_SYNC <= '1';
				DSACK1_INT		<= '1';
				AS_000_INT  	<= '1';
				DS_000_ENABLE	<= '0';
				AMIGA_BUS_ENABLE_INT <= '1';
			elsif(	--CLK_030  		= '1'  AND --68030 has a valid AS on high clocks					
					AS_030_D0			= '0'  AND --as set
					BGACK_000='1' AND --no dma -cycle
					NOT (FC(1)='1' and FC(0)='1' and A(19)='0' and A(18)='0' and A(17)='1' and A(16)='0') AND --FPU-Select
					nEXP_SPACE ='1' and --not an expansion space cycle
					SM_AMIGA = IDLE_P --last amiga cycle terminated
					) then
					AS_030_000_SYNC <= '0';					
			end if;
			

			-- VMA generation
			if(CLK_000_NE='1' AND VPA_D='0' AND cpu_est = E4)then --assert
				VMA_INT <= '0';
			--elsif(CLK_000_PE='1' AND AS_000_INT='1' AND cpu_est=E1)then --deassert
				
			end if;
			
			--uds/lds precalculation
			if (DS_030_D0 = '0') then --DS: set udl/lds 	
				if(A0='0') then
					UDS_000_INT <= '0';
				else
					UDS_000_INT <= '1';
				end if;
				if((A0='1' OR SIZE(0)='0' OR SIZE(1)='1')) then
					LDS_000_INT <= '0';
				else
					LDS_000_INT <= '1';
				end if;
			end if;


			--Amiga statemachine

			if(BERR='0')then --"async" reset on errors
				SM_AMIGA<=IDLE_P;
			end if;

			case (SM_AMIGA) is
				when IDLE_P 	 => --68000:S0 wait for a falling edge
					RW_000_INT		<= '1';							
					if( CLK_000_D0='0' and CLK_000_D1= '1' and AS_030_000_SYNC = '0')then						
						if(nEXP_SPACE ='1')then -- if this a delayed expansion space detection, do not start an amiga cycle!
							AMIGA_BUS_ENABLE_INT <= '0' ;--for now: allways on for amiga
							SM_AMIGA<=IDLE_N;  --go to s1
						end if;
					end if;
				when IDLE_N 	 => --68000:S1 place Adress on bus and wait for rising edge, on a rising CLK_000 look for a amiga adressrobe
					if(CLK_000_PE='1')then --go to s2
					--if(CLK_000_D0='1')then --go to s2
						SM_AMIGA <= AS_SET_P; --as for amiga set! 
						AS_000_INT <= '0';
						RW_000_INT <= RW;						
						if (RW='1' ) then --read: set udl/lds 	
							DS_000_ENABLE	<= '1';
						end if;
					end if;
				when AS_SET_P	 => --68000:S2 Amiga cycle starts here: since AS is asserted during transition to this state we simply wait here
					if(CLK_000_NE='1')then --go to s3
					--if(CLK_000_D0='0')then --go to s3
						SM_AMIGA<=AS_SET_N; 
					end if;
				when AS_SET_N	 => --68000:S3: nothing happens here; on a transition to s4: assert uds/lds on write 
					
					if(CLK_000_PE='1')then --go to s4
					--if(CLK_000_D0='1')then --go to s4
						DS_000_ENABLE	<= '1';--write: set udl/lds earlier than in the specs. this does not seem to harm anything and is saver, than sampling uds/lds too late 				 
						-- set DS-Enable without respect to rw: this simplifies the life for the syntesizer
						SM_AMIGA <= SAMPLE_DTACK_P; 
					end if;
				when SAMPLE_DTACK_P=> --68000:S4 wait for dtack or VMA
					if(	CLK_000_NE='1' and --falling edge
					--if(	CLK_000_D0 = '0' and CLK_000_D1='1' and --falling edge
						((VPA = '1' AND DTACK='0') OR --DTACK end cycle
						(VPA='0' AND cpu_est=E9 AND VMA_INT='0')) --VPA end cycle
						)then --go to s5
						SM_AMIGA<=DATA_FETCH_N;
					end if;
				when DATA_FETCH_N=> --68000:S5 nothing happens here just wait for positive clock
					if(CLK_000_PE = '1')then --go to s6
					--if(CLK_000_D0='1')then --go to s6
						SM_AMIGA<=DATA_FETCH_P;
					end if;
				when DATA_FETCH_P => --68000:S6: READ: here comes the data on the bus!
					if( (CLK_000_N_SYNC( 5)='1' AND not (CLK_030 ='1' and CLK_OUT_PRE_D='0')) OR
						(CLK_000_N_SYNC( 6)='1' )) then --go to s7 next 030-clock is not a falling edge: dsack is sampled at the falling edge
						DSACK1_INT <='0'; 
					end if;
					--if( CLK_000_D3 ='1' AND CLK_000_D4 = '0' ) then --go to s7 next 030-clock is high: dsack is sampled at the falling edge
					--	DSACK1_INT <='0'; 
					--end if;
					if( CLK_000_NE ='1') then --go to s7 next 030-clock is high: dsack is sampled at the falling edge
					--if( CLK_000_D0 ='0') then --go to s7 next 030-clock is high: dsack is sampled at the falling edge
						
						SM_AMIGA<=END_CYCLE_N;
					end if;
				when END_CYCLE_N =>--68000:S7: Latch/Store data. Wait here for new cycle and go to IDLE on high clock
					if(CLK_000_PE='1')then --go to s0	
					--if(CLK_000_D0='1')then --go to s0																	
						SM_AMIGA<=IDLE_P;	
						VMA_INT <= '1';					
					end if;
			end case;

			if(BGACK_030_INT='0')then			
				--switch amiga bus on for DMA-Cycles
				AMIGA_BUS_ENABLE_INT <= '0' ;
			elsif(BGACK_030_INT_D='0' and BGACK_030_INT='1')then			
				AMIGA_BUS_ENABLE_INT <= '1' ;
			end if;
			
			--dma stuff
			--as can only be done if we know the uds/lds!
			if(BGACK_030_INT='0' and AS_000='0' and (UDS_000='0' or LDS_000='0'))then 

				--set AS_000
				if( CLK_030='1') then 
					AS_000_DMA 	<= '0'; --sampled on rising edges!
					RW_000_DMA	<= RW_000;
				elsif(AS_000_DMA = '0' and CLK_030='0')then
					CLK_030_H		<= '1';
				end if;
				
				if(RW_000='1') then
					DS_000_DMA	<=AS_000_DMA;
				elsif(RW_000='0' and CLK_030_H = '1' and CLK_030='1')then
					DS_000_DMA	<=AS_000_DMA; -- write: one clock delayed!
				end if;
				-- now determine the size: if both uds and lds is set its 16 bit else 8 bit!
				if(UDS_000='0' and LDS_000='0') then
					SIZE_DMA		<= "10"; --16bit
				else
					SIZE_DMA		<= "01"; --8 bit
				end if;
					
				--now calculate the offset: 
				--if uds is set low, a0 is so too.
				--if only lds is set a1 is high
				--therefore a1 = uds 
				--great! life is simple here!
				A0_DMA <= UDS_000;		
					
				--A1 is set by the amiga side													
			else
				AS_000_DMA		<= '1';
				DS_000_DMA		<= '1';
				SIZE_DMA		<= "11";
				A0_DMA			<= '0';	
				RW_000_DMA		<= '1';	
				CLK_030_H		<= '0';						
			end if;
		end if;		
	end process	state_machine;

	CLK_PRE_66 <= (not CLK_CNT_N(0) and CLK_CNT_P(0)) or
            (CLK_CNT_N(1) and CLK_CNT_P(1));

    process_33_clk:process(RST, CLK_PRE_66)
	begin
		if(RST = '0' ) then
			CLK_OUT_PRE_33	<= '0';	
		elsif(rising_edge(CLK_PRE_66)) then
			CLK_OUT_PRE_33 <= not CLK_OUT_PRE_33;
		end if;
	end process process_33_clk; 

	

	--output clock assignment
	CLK_DIV_OUT	<= CLK_OUT_INT;
	CLK_EXP		<= CLK_OUT_INT;

	-- bus drivers
	AMIGA_ADDR_ENABLE	<= AMIGA_BUS_ENABLE_INT;
	AMIGA_BUS_ENABLE_HIGH <= AMIGA_BUS_ENABLE_INT;
	AMIGA_BUS_ENABLE_LOW <= '1';
	AMIGA_BUS_DATA_DIR 	 <= '1' WHEN (RW_000='0' AND BGACK_030_INT ='1') ELSE --Amiga WRITE
							'0' WHEN (RW_000='1' AND BGACK_030_INT ='1') ELSE --Amiga READ
							'1' WHEN (RW_000='1' AND BGACK_030_INT ='0' AND nEXP_SPACE = '0' AND AS_000 = '0') ELSE --DMA READ to expansion space
							'0' WHEN (RW_000='0' AND BGACK_030_INT ='0' AND nEXP_SPACE = '0' AND AS_000 = '0') ELSE --DMA WRITE to expansion space
							'0'; --Point towarts TK
	
	
	--dma stuff
	DTACK	<= 'Z' when BGACK_030_INT ='1' OR nEXP_SPACE = '1' OR AS_000_DMA ='1' else
					DSACK1;
	AS_030	<= 'Z' when BGACK_030_INT ='1' OR nEXP_SPACE = '1' OR AS_000_DMA ='1' else
					AS_000_DMA;
	DS_030	<= 'Z' when BGACK_030_INT ='1' OR nEXP_SPACE = '1' OR AS_000_DMA ='1' else
					DS_000_DMA;
	A0		<= 'Z' when BGACK_030_INT ='1' OR nEXP_SPACE = '1' OR AS_000_DMA ='1' else
					A0_DMA;
	SIZE	<= "ZZ" when BGACK_030_INT ='1' OR nEXP_SPACE = '1' OR AS_000_DMA ='1' else
					SIZE_DMA;
	
	--fpu
	FPU_CS		<=	'0' when AS_030 ='0' and FC(1)='1' and FC(0)='1' and A(19)='0' and A(18)='0' and A(17)='1' and A(16)='0' AND BGACK_000='1' AND FPU_SENSE ='0'
					else '1';
	
	--if no copro is installed:
	BERR		<=	'0' when AS_030 ='0' and FC(1)='1' and FC(0)='1' and A(19)='0' and A(18)='0' and A(17)='1' and A(16)='0' AND BGACK_000='1' AND FPU_SENSE ='1'
					else 'Z';
	--BERR		<=	'Z';



	--cache inhibit:  Tristate for expansion (it decides) and off for the Amiga 
	CIIN <= '1' WHEN A(31 downto 20) = x"00F" and AS_030_D0 ='0' ELSE -- Enable for Kick-rom
			'Z' WHEN (not(A(31 downto 24) = x"00") and AS_030 ='0') OR nEXP_SPACE = '0' ELSE --Tristate for expansion (it decides)
			'0'; --off for the Amiga

		
	--e and VMA		
	E		<= cpu_est(3);
	VMA		<= VMA_INT;
	
	
	--AVEC
	AVEC <=	'1';
		
	--as and uds/lds
	AS_000	<= 'Z' when BGACK_030_INT ='0' else
					AS_000_INT;
	RW_000	<= 'Z' when BGACK_030_INT ='0' else
					RW_000_INT;

	UDS_000	<= 'Z' when BGACK_030_INT ='0' else -- output on cpu cycle
			   '1' when DS_000_ENABLE ='0' else -- datastrobe not ready jet
					UDS_000_INT;
	LDS_000	<= 'Z' when BGACK_030_INT ='0' else -- output on cpu cycle
			   '1' when DS_000_ENABLE ='0' else -- datastrobe not ready jet
					LDS_000_INT;

	--dsack
	DSACK1	<= 'Z' when nEXP_SPACE = '0' else -- output on amiga cycle
			DSACK1_INT;
	--rw
	RW		<= 'Z' when BGACK_030_INT ='1' else
					RW_000_DMA;
	
	BGACK_030	<= BGACK_030_INT;	
end Behavioral;