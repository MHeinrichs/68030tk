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
	AHIGH: inout std_logic_vector ( 31 downto 24 );
	A_DECODE: in std_logic_vector ( 23 downto 2 );
	A: inout std_logic_vector ( 1 downto 0 );
	--A0: inout std_logic;
	--A1: in std_logic;
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
	RESET: inout std_logic ;
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

-- values are determined empiracally for 7.09 MHz Clock with a base clock of 100Mhz
constant PE_CLK : integer := 10;
constant NE_CLK : integer := 12;
constant DS_SAMPLE : integer := 12;



TYPE SM_E IS (
				E1,
				E2,
				E3,
				E4,
				E5,
				E6,
				E7,
				E8,
				E9,
				E10
				);



signal cpu_est : SM_E;

TYPE SM_68000 IS (
				IDLE_P,
				IDLE_N,
				AS_SET_P,
				AS_SET_N,
				SAMPLE_DTACK_P,
				DATA_FETCH_N,
				DATA_FETCH_P,
				END_CYCLE_N
				);


signal SM_AMIGA : SM_68000;
  
--signal	Dout:STD_LOGIC_VECTOR(3 downto 0) := "0000";
signal	AS_000_INT:STD_LOGIC		:= '1';
signal	RW_000_INT:STD_LOGIC		:= '1';
signal	AMIGA_BUS_ENABLE_DMA_HIGH:STD_LOGIC		:= '1';
signal	AMIGA_BUS_ENABLE_DMA_LOW:STD_LOGIC		:= '1';
signal	AS_030_D0:STD_LOGIC			:= '1';
signal	nEXP_SPACE_D0:STD_LOGIC		:= '0';
signal	DS_030_D0:STD_LOGIC			:= '1';
signal	AS_030_000_SYNC:STD_LOGIC	:= '1';
signal	BGACK_030_INT:STD_LOGIC		:= '1';
signal	BGACK_030_INT_D:STD_LOGIC	:= '1';
signal	BGACK_030_INT_PRE:STD_LOGIC	:= '1';
signal	AS_000_DMA:STD_LOGIC		:= '1';
signal	DS_000_DMA:STD_LOGIC		:= '1';
signal	RW_000_DMA:STD_LOGIC		:= '1';
signal  CYCLE_DMA: STD_LOGIC_VECTOR ( 1 downto 0 ) 	:= "00";
signal  SIZE_DMA: STD_LOGIC_VECTOR ( 1 downto 0 ) 	:= "11";
signal  IPL_D0: STD_LOGIC_VECTOR ( 2 downto 0 ) 	:= "111";
signal	A0_DMA: STD_LOGIC			:= '1';
signal	VMA_INT: STD_LOGIC			:= '1';
signal	VPA_D: STD_LOGIC			:= '1';
signal	UDS_000_INT: STD_LOGIC		:= '1';
signal	LDS_000_INT: STD_LOGIC		:= '1';
signal	DS_000_ENABLE: STD_LOGIC	:= '0';
signal  DSACK1_INT: STD_LOGIC		:= '1';
signal	CLK_OUT_PRE_50: STD_LOGIC	:= '1';
signal	CLK_OUT_PRE_25: STD_LOGIC	:= '1';
signal	CLK_OUT_PRE: STD_LOGIC		:= '1';
signal	CLK_OUT_PRE_D: STD_LOGIC	:= '1';
signal	CLK_OUT_INT: STD_LOGIC		:= '1';
signal	CLK_OUT_EXP_INT: STD_LOGIC		:= '1';
signal	CLK_030_H: STD_LOGIC		:= '1';
signal	CLK_000_D: STD_LOGIC_VECTOR ( DS_SAMPLE downto 0 );
signal	CLK_000_P_SYNC: STD_LOGIC_VECTOR ( PE_CLK downto 0 );
signal	CLK_000_N_SYNC: STD_LOGIC_VECTOR ( NE_CLK downto 0 );
signal	CLK_000_PE: STD_LOGIC 		:= '0';
signal	CLK_000_NE: STD_LOGIC 		:= '0';
signal	CLK_000_NE_D0: STD_LOGIC 		:= '0';
signal	DTACK_D0: STD_LOGIC 		:= '1';
signal  RESET_OUT: STD_LOGIC 		:= '0';
signal	CLK_030_D0: STD_LOGIC 		:= '0';
--signal  NO_RESET: STD_LOGIC 		:= '0';
signal	RST_DLY: STD_LOGIC_VECTOR ( 2 downto 0 ) 	:= "000";
--signal	RST_DLY_AMIGA: STD_LOGIC_VECTOR ( 7 downto 0 ) 	:= "00000000";
--signal  RESET_OUT_AMIGA: STD_LOGIC 		:= '0';

begin

	CLK_000_PE <= CLK_000_P_SYNC(PE_CLK);
	CLK_000_NE <= CLK_000_N_SYNC(NE_CLK);
	--CLK_000_PE <= CLK_000_D(0) AND NOT CLK_000_D(1);
	--CLK_000_NE <= NOT CLK_000_D(0) AND CLK_000_D(1) AND CLK_000_D(2);


	--pos edge clock process
	--no ansynchronious reset! the reset is sampled synchroniously
	--this mut be because of the e-clock: The E-Clock has to run CONSTANTLY 
	--or the Amiga will fail to boot from a reset. 
	--However a compilation with no resets on thEe-Clock and resets on other signals does not work, either!
	pos_clk: process(CLK_OSZI)
	begin
		if(rising_edge(CLK_OSZI)) then
			--clk generation :
			CLK_030_D0 <=CLK_030;
		  CLK_OUT_PRE_50	<=	not CLK_OUT_PRE_50;		  
		  if(CLK_OUT_PRE_50 = '1' )then
		  	CLK_OUT_PRE_25<=	not CLK_OUT_PRE_25;		    
		  end if;
						
			
			--here the clock is selected
			--CLK_OUT_PRE_D 	<= CLK_OUT_PRE_25;
			CLK_OUT_PRE_D 	<= CLK_OUT_PRE_50;
			
			-- the external clock to the processor is generated here
			CLK_OUT_INT	<= CLK_OUT_PRE_D; --this way we know the clock of the next state: Its like looking in the future, cool!
			CLK_OUT_EXP_INT <= CLK_OUT_PRE_50;
			--delayed Clocks and signals for edge detection
			CLK_000_D(0) 	<= CLK_000;
			CLK_000_D(DS_SAMPLE downto 1) 	<= CLK_000_D((DS_SAMPLE-1) downto 0);

			--shift registers for edge detection
			CLK_000_P_SYNC( PE_CLK downto 1 ) 	<= CLK_000_P_SYNC( (PE_CLK-1) downto 0 );
			CLK_000_P_SYNC(0)				<= CLK_000_D(0) AND NOT CLK_000_D(1);
			CLK_000_N_SYNC( NE_CLK downto 1 ) 	<= CLK_000_N_SYNC( (NE_CLK-1) downto 0 );
			CLK_000_N_SYNC(0)				<= NOT CLK_000_D(0) AND CLK_000_D(1);
			
			CLK_000_NE_D0 <= CLK_000_NE;
			
			-- e-clock is changed on the FALLING edge!

			if(CLK_000_NE_D0 = '1' ) then
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
				end case;
			end if;
			
			--this is a statemachine to propagate an internal reset to the amiga
			--if(	(RESET = '0' and RESET_OUT = '1') or RST_DLY_AMIGA /= "11111111") then --reset condition from the tk-board
			--	if(RST_DLY_AMIGA = "11111111") then --start of reset
			--		RESET_OUT_AMIGA <= '1';
			--		RST_DLY_AMIGA <= "00000000";
			--	else
			--		RST_DLY_AMIGA <= RST_DLY_AMIGA+1;
			--	end if;					
			--else
			--	RST_DLY_AMIGA	<= "11111111";
			--	RESET_OUT_AMIGA <= '0';
			--end if;

			
			--the statemachine
			if(RST = '0' ) then
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
				VMA_INT			<= '1';
				BG_000			<= '1';
				BGACK_030_INT	<= '1';
				BGACK_030_INT_D <= '1';
				BGACK_030_INT_PRE<= '1';
				DSACK1_INT		<= '1';
				IPL_D0			<= "111";
				IPL_030			<= "111";
				AS_000_DMA		<= '1';
				DS_000_DMA		<= '1';
				SIZE_DMA		<= "11";
				A0_DMA			<= '1';
				AMIGA_BUS_ENABLE_DMA_HIGH <= '1';
				AMIGA_BUS_ENABLE_DMA_LOW <= '1';
				AS_030_D0		<= '1';
				nEXP_SPACE_D0	<= '1';
				DS_030_D0		<= '1';
				CLK_030_H		<= '0';	
				CYCLE_DMA		<= "00";
				RST_DLY			<= "000";
				RESET_OUT 		<= '0';
			else 
				
				if(CLK_000_NE='1')then
					if(RST_DLY="111")then
						RESET_OUT 		<= '1';
					else
						RST_DLY <= RST_DLY+1;						
					end if;
				end if;

				--now: 68000 state machine and signals
				
				--buffering signals
				AS_030_D0 <= AS_030;
				nEXP_SPACE_D0 <= nEXP_SPACE;
				DS_030_D0 <= DS_030;
				DTACK_D0	<= DTACK;
				VPA_D 		<= VPA;
	

				--bgack is simple: assert as soon as Amiga asserts but hold bg_ack for one amiga-clock 
				if(BGACK_000='0') then
					BGACK_030_INT	<= '0';
				elsif (	BGACK_000='1' 
						AND CLK_000_PE='1'
						AND AS_000 = '1' --the amiga AS can be still active while bgack is deasserted, so wait for this signal too!
						) then -- BGACK_000 is high here!
					BGACK_030_INT_PRE<= '1';
					BGACK_030_INT 	<= BGACK_030_INT_PRE; --hold this signal high until 7m clock goes low
				end if;
				BGACK_030_INT_D <= BGACK_030_INT;
	
				
	
				--bus grant only in idle state
				if(BG_030= '1')then
					BG_000	<= '1';
				elsif(	BG_030= '0' --AND (SM_AMIGA 	= IDLE_P)
						and nEXP_SPACE = '1' and AS_030_D0='1'
						and CLK_000_D(0)='1' 
						) then --bus granted no local access and no AS_030 running!
						BG_000 	<= '0';
				end if;
	
			
				--interrupt buffering to avoid ghost interrupts
				--if(CLK_000_NE='1')then
					IPL_D0<=IPL;			
					if(IPL = IPL_D0)then
						IPL_030<=IPL;
					end if;
				--end if;
			
				-- as030-sampling and FPU-Select
	
				
				if(AS_030_D0 ='1' or BERR='0') then -- "async" reset of various signals
					AS_030_000_SYNC <= '1';
					DSACK1_INT		<= '1';
					AS_000_INT  	<= '1';
					DS_000_ENABLE	<= '0';
					--RW_000_INT		<= '1';	
				elsif(	--CLK_030  		= '1'  AND --68030 has a valid AS on high clocks					
						AS_030_D0			= '0'  AND --as set
						BGACK_030_INT='1' AND 
						BGACK_030_INT_D='1' AND --no dma -cycle
						NOT (FC(1)='1' and FC(0)='1' and A_DECODE(19)='0' and A_DECODE(18)='0' and A_DECODE(17)='1' and A_DECODE(16)='0') AND --FPU-Select
						nEXP_SPACE ='1' and --not an expansion space cycle
						SM_AMIGA = IDLE_P --last amiga cycle terminated
						) then
						AS_030_000_SYNC <= '0';					
				end if;
				
	
				-- VMA generation
				if(CLK_000_NE='1' AND VPA_D='0' AND cpu_est = E4)then --assert
					VMA_INT <= '0';
				elsif(CLK_000_PE='1' AND cpu_est=E1)then --deassert
					VMA_INT <= '1';										
				end if;
				
				--uds/lds precalculation
				if (SM_AMIGA = IDLE_N) then --DS: set udl/lds 	
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
	
	
				--Amiga statemachine
	
				if(BERR='0')then --"async" reset on errors
					SM_AMIGA<=IDLE_P;
				end if;
	
				case (SM_AMIGA) is
					when IDLE_P 	 => --68000:S0 wait for a falling edge
						RW_000_INT		<= '1';		
						if( CLK_000_D(1)='0' and CLK_000_D(2)= '1' and AS_030_000_SYNC = '0' and nEXP_SPACE ='1')then -- if this a delayed expansion space detection, do not start an amiga cycle!
							SM_AMIGA<=IDLE_N;  --go to s1
						end if;
					when IDLE_N 	 => --68000:S1 place Adress on bus and wait for rising edge, on a rising CLK_000 look for a amiga adressrobe
						if(CLK_000_PE='1')then --go to s2
							SM_AMIGA <= AS_SET_P; --as for amiga set! 
						end if;
					when AS_SET_P	 => --68000:S2 Amiga cycle starts here: since AS is asserted during transition to this state we simply wait here
						RW_000_INT <= RW;						
						AS_000_INT <= '0';
						if (RW='1' ) then --read: set udl/lds 	
							DS_000_ENABLE	<= '1';
						end if;
						if(CLK_000_NE='1')then --go to s3
							SM_AMIGA<=AS_SET_N; 
						end if;
					when AS_SET_N	 => --68000:S3: nothing happens here; on a transition to s4: assert uds/lds on write 
						
						if(CLK_000_PE='1')then --go to s4
							-- set DS-Enable without respect to rw: this simplifies the life for the syntesizer
							DS_000_ENABLE	<= '1';--write: set udl/lds earlier than in the specs. this does not seem to harm anything and is saver, than sampling uds/lds too late 				 
							SM_AMIGA <= SAMPLE_DTACK_P; 
						end if;
					when SAMPLE_DTACK_P=> --68000:S4 wait for dtack or VMA
						DS_000_ENABLE	<= '1';
						if(	CLK_000_NE_D0='1' and --falling edge
							((VPA_D = '1' AND DTACK_D0='0') OR --DTACK end cycle
							(VPA_D='0' AND cpu_est=E9 AND VMA_INT='0')) --VPA end cycle
							)then --go to s5
							SM_AMIGA<=DATA_FETCH_N;
						end if;
					when DATA_FETCH_N=> --68000:S5 nothing happens here just wait for positive clock
						DS_000_ENABLE	<= '1';
						if(CLK_000_PE = '1')then --go to s6
							SM_AMIGA<=DATA_FETCH_P;
						end if;
					when DATA_FETCH_P => --68000:S6: READ: here comes the data on the bus!
						DS_000_ENABLE	<= '1';
						if( (CLK_000_D(DS_SAMPLE-2)='0' AND CLK_000_D((DS_SAMPLE-1))='1' AND not (CLK_030 ='1' and CLK_OUT_PRE_D='0')) OR
							  (CLK_000_D(DS_SAMPLE-1)='0' AND CLK_000_D((DS_SAMPLE-0))='1' )) then --go to s7 next 030-clock is not a falling edge: dsack is sampled at the falling edge
							DSACK1_INT <='0'; 
						end if;
						if( CLK_000_NE ='1') then --go to s7 next 030-clock is high: dsack is sampled at the falling edge
							SM_AMIGA<=END_CYCLE_N;
						end if;
					when END_CYCLE_N =>--68000:S7: Latch/Store data. Wait here for new cycle and go to IDLE on high clock
						if(CLK_000_PE='1')then --go to s0	
							SM_AMIGA<=IDLE_P;	
							RW_000_INT		<= '1';	
						end if;
				end case;
	
				--dma stuff
				if(BGACK_030_INT='0')then			
					--set some signals NOT linked to AS_000='0'
					RW_000_DMA	<= RW_000;
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
					--here  we determine the upper or lower half of the databus
					AMIGA_BUS_ENABLE_DMA_HIGH 	<= A(1);
					AMIGA_BUS_ENABLE_DMA_LOW 	<= not A(1);				
	
				elsif(BGACK_030_INT_D='0' and BGACK_030_INT='1')then			
					RW_000_DMA		<= '1';	
					SIZE_DMA		<= "00";
					A0_DMA			<= '0';	
					AMIGA_BUS_ENABLE_DMA_HIGH 	<= '1';
					AMIGA_BUS_ENABLE_DMA_LOW 	<= '1';				
				end if;
						
				if(BGACK_030_INT='0' and AS_000='0')then 
					-- an 68000-memory cycle is three positive edges long!
					if(CLK_000_PE='1')then
						CYCLE_DMA <= CYCLE_DMA+1;
					end if;
				else
					CYCLE_DMA		<= "00";
				end if;		
											
				--as can only be done if we know the uds/lds!
				if(	BGACK_030_INT='0'
					and AS_000='0' 
					and(UDS_000='0' or LDS_000='0')
					and (					
						--CYCLE_DMA ="00" or
						CYCLE_DMA ="01"
						or CYCLE_DMA ="10"
						--or CYCLE_DMA ="11"
						)				
					)then 
					--set AS_000
					if( CLK_030='1') then 
						AS_000_DMA 	<= '0'; --sampled on rising edges!					
					end if;
					
					--delayed clock for write cycle
					if(AS_000_DMA = '0' and CLK_030='0')then
						CLK_030_H		<= '1';
					end if;
					
					if(RW_000='1') then
						DS_000_DMA	<='0';
					elsif(RW_000='0' and CLK_030_H = '1' and CLK_030='1')then
						DS_000_DMA	<=AS_000_DMA; -- write: one clock delayed!
					end if;					
				else
					AS_000_DMA		<= '1';
					DS_000_DMA		<= '1';
					CLK_030_H		<= '0';		
				end if;		
			end if;					
		end if;
	end process pos_clk;

	--output clock assignment
	CLK_DIV_OUT	<= CLK_OUT_INT;
	CLK_EXP		<= CLK_OUT_INT;--not CLK_OUT_EXP_INT;
	--CLK_DIV_OUT	<= 'Z';
	--CLK_EXP		<= CLK_030;


	
	RESET	<= 'Z' when RESET_OUT ='1' else '0';
	--RST		<= '0' when RESET_OUT_AMIGA = '1' else 'Z';
	--RESET	<=  RESET_OUT;

	-- bus drivers
	AMIGA_ADDR_ENABLE	<= '0';
	AMIGA_BUS_ENABLE_HIGH <= '0' WHEN BGACK_030_INT ='1' and not (SM_AMIGA = IDLE_P or (SM_AMIGA = END_CYCLE_N and CLK_000 = '1')) ELSE 
							 '0' WHEN BGACK_030_INT ='0' AND AMIGA_BUS_ENABLE_DMA_HIGH = '0' ELSE
							 '1';
	AMIGA_BUS_ENABLE_LOW <=  '0' WHEN BGACK_030_INT ='0' AND AMIGA_BUS_ENABLE_DMA_LOW = '0'   ELSE
							 '1';  
	
	
	AMIGA_BUS_DATA_DIR 	 <= '1' WHEN (RW_000='0' AND BGACK_030_INT ='1') ELSE --Amiga WRITE
							'0' WHEN (RW_000='1' AND BGACK_030_INT ='1') ELSE --Amiga READ
							'1' WHEN (RW_000='1' AND BGACK_030_INT ='0' AND nEXP_SPACE = '0' AND AS_000 = '0') ELSE --DMA READ to expansion space
							'0' WHEN (RW_000='0' AND BGACK_030_INT ='0' AND AS_000 = '0') ELSE --DMA WRITE to expansion space
							'0'; --Point towarts TK
	
	
	--dma stuff
	DTACK	<= 	'Z'; --DTACK will be generated by GARY!
	
	AS_030	<= 	'Z' when BGACK_030_INT ='1' OR nEXP_SPACE = '1' or RESET_OUT ='0' else
			   	'0' when AS_000_DMA ='0' and AS_000 ='0' else 
			   	'1';
	DS_030	<= 	'Z' when BGACK_030_INT ='1' OR nEXP_SPACE = '1' or RESET_OUT ='0' else
				'0' when DS_000_DMA ='0' and AS_000 ='0' else 
			   	'1';
	A(0)		<= 	'Z' when BGACK_030_INT ='1' OR nEXP_SPACE = '1' or RESET_OUT ='0' else
				'0' when A0_DMA ='0' else 
			   	'1';
	A(1)	<= 'Z';
	AHIGH <= "ZZZZZZZZ" when BGACK_030_INT ='1' OR nEXP_SPACE = '1' or RESET_OUT ='0' else x"00";
	SIZE	<= 	"ZZ" when BGACK_030_INT ='1' OR nEXP_SPACE = '1' else
				"10" when SIZE_DMA ="10" else 
			   	"01" when SIZE_DMA ="01" else
			   	"00";
	--rw
	RW		<= 	'Z' when BGACK_030_INT ='1' or RESET_OUT ='0' else
				'0' when RW_000_DMA ='0' else 
			   	'1';
	
	BGACK_030	<= BGACK_030_INT;	

	--fpu
	FPU_CS		<=	'0' when AS_030 ='0' and FC(1)='1' and FC(0)='1' and A_DECODE(19)='0' and A_DECODE(18)='0' and A_DECODE(17)='1' and A_DECODE(16)='0' AND BGACK_000='1' AND FPU_SENSE ='0'
					else '1';
	
	--if no copro is installed:
	BERR		<=	'0' when AS_030 ='0' and FC(1)='1' and FC(0)='1' and A_DECODE(19)='0' and A_DECODE(18)='0' and A_DECODE(17)='1' and A_DECODE(16)='0' AND BGACK_000='1' AND FPU_SENSE ='1'
					else 'Z';


	--cache inhibit:  Tristate for expansion (it decides) and off for the Amiga 
	CIIN <= '1' WHEN AHIGH(31 downto 24) = x"00" and A_DECODE(23 downto 20) = x"F" and AS_030_D0 ='0' ELSE -- Enable for Kick-rom
			'Z' WHEN nEXP_SPACE = '0' ELSE --Tristate for expansion (it decides)
			'0'; --off for the Amiga
		
	--e and VMA		
	E		<= '1' when 
							cpu_est = E7 or
							cpu_est = E8 or
							cpu_est = E9 or
							cpu_est = E10 						
						else '0';
	VMA		<= VMA_INT;
	
	
	--AVEC
	AVEC 	<=	'1';
		
	--as and uds/lds
	AS_000	<=  'Z' when BGACK_030_INT ='0' or RESET_OUT ='0' else
				'0' when AS_000_INT ='0' and AS_030 ='0' else 
			   	'1';
	RW_000	<=  'Z' when BGACK_030_INT ='0' or RESET_OUT ='0' else
				'0' when RW_000_INT ='0' else 
			   	'1';

	UDS_000	<=  'Z' when BGACK_030_INT ='0' or RESET_OUT ='0' else -- output on cpu cycle
			    --'1' when DS_000_ENABLE ='0' else 
				'0' when UDS_000_INT ='0' and DS_000_ENABLE ='1' else -- datastrobe not ready jet
			   	'1';
	LDS_000	<= 	'Z' when BGACK_030_INT ='0' or RESET_OUT ='0' else -- output on cpu cycle
			   	--'1' when DS_000_ENABLE ='0' else 
				'0' when LDS_000_INT ='0' and DS_000_ENABLE ='1' else -- datastrobe not ready jet
			   	'1';

	--dsack
	DSACK1	<= 	'Z' when nEXP_SPACE = '0' else -- output on amiga cycle
				'0' when DSACK1_INT ='0' else 
			   	'1';
	
end Behavioral;
