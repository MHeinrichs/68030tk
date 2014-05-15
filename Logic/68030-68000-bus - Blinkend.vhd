library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity BUS68030 is

port( 
	AS_030: inout std_logic ;
	AS_000: inout std_logic ;
--	DS_030: inout std_logic ;
	UDS_000: inout std_logic;
	LDS_000: inout std_logic;
	SIZE: inout std_logic_vector ( 1 downto 0 );
	A: inout std_logic_vector ( 31 downto 0 );
	CPU_SPACE: in std_logic ;
--	BERR: inout std_logic ; --error: this is connected to a global input pin :(
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
--	AVEC_EXP: inout std_logic ; --this is a "free pin"
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

subtype AMIGA_STATE is std_logic_vector(1 downto 0);
  
constant IDLE		: AMIGA_STATE := "00";
constant AS_SET		: AMIGA_STATE := "01";  
constant DATA_FETCH	: AMIGA_STATE := "10";  
constant END_CYCLE	: AMIGA_STATE := "11";  

signal SM_AMIGA : AMIGA_STATE;
signal SM_AMIGA_LAST : AMIGA_STATE;


  
--signal	Dout:STD_LOGIC_VECTOR(3 downto 0) := "0000";
signal	ZorroII:STD_LOGIC:= '0';
signal	AS_000_INT:STD_LOGIC:= '1';
signal	AS_000_INT_D:STD_LOGIC:= '1';
signal	BGACK_030_INT:STD_LOGIC:= '1';
signal	DTACK_DMA:STD_LOGIC:= '1';
signal	DTACK_INT:STD_LOGIC:= '1';
signal	DTACK_SYNC:STD_LOGIC:= '1';
signal	DTACK_SYNC_D:STD_LOGIC:= '1';
signal	DTACK_SYNC_DD:STD_LOGIC:= '1';
signal	FPU_CS_INT:STD_LOGIC:= '1';
signal	E_INT: STD_LOGIC:='1';
signal	VPA_SYNC: STD_LOGIC:='1';
signal	VMA_INT: STD_LOGIC:='1';
signal	VMA_INT_D: STD_LOGIC:='1';
signal	UDS_000_INT: STD_LOGIC:='1';
signal	LDS_000_INT: STD_LOGIC:='1';
signal	UDS_LOGIC: STD_LOGIC:='1';
signal	LDS_LOGIC: STD_LOGIC:='1';
--signal  AS_030_delay: STD_LOGIC:='1';
signal	AS_AMIGA_ENABLE: STD_LOGIC:='1';
--signal	DS_030_INT: STD_LOGIC:='Z';
--signal	A_INT: STD_LOGIC_VECTOR ( 1 downto 0 ) := "00";
--signal  SIZE_INT: STD_LOGIC_VECTOR ( 1 downto 0 ) := "00";
signal  DSACK_INT: STD_LOGIC_VECTOR ( 1 downto 0 ) := "11";
signal	CLK_CNT: STD_LOGIC_VECTOR ( 1 downto 0 ) := "00";
signal	CLK_OUT_INT: STD_LOGIC:='1';
signal	CLK_000_D: STD_LOGIC := '1';

begin

  --clk generation : up to now just half the clock
	cpu_clk: process(CLK_OSZI)
	begin
		if(rising_edge(CLK_OSZI)) then

			if(CLK_CNT="10") then
				CLK_OUT_INT	<=	not CLK_OUT_INT;			
				CLK_CNT	<= "00";	
			else
				CLK_CNT	<= CLK_CNT+1;					
			end if;
		end if;
		
	end process	cpu_clk;
	CLK_DIV_OUT	<=	CLK_OUT_INT;
	CLK_EXP		<=	CLK_OUT_INT;


	clk_delay: process(CLK_OSZI)
	begin
		if(rising_edge(CLK_OSZI)) then
			CLK_000_D <= CLK_000;
		end if;

	end process clk_delay;
	
	--ZORROII (Amiga) space?
	ZorroII		<= '1' 	when (A(31 downto 24)= x"00") else '0'; -- 24-bit addres space.

	--BG_ACK is simple:
	BGACK_030_gen: process (CLK_000,BGACK_000) begin
		if(BGACK_000='0') then
			BGACK_030_INT	<= '0';
		elsif rising_edge(CLK_000) then
			BGACK_030_INT 	<= '1'; --hold this signal high until 7m clock goes high
		end if;
	end process BGACK_030_gen;
	BGACK_030	<= BGACK_030_INT;

	--DTACK
	DTACK    	<= 	'Z' when BGACK_030_INT ='1' else
					DTACK_DMA;
	DTACK_DMA 	<= 	'0' when AS_000_INT ='0' AND DSACK(1) ='0' else
					'1';

	--CO-Processor Chip select
	FPU_CS_INT	<= '0' 	when FC(1)='1' and FC(0)='1' and A(19)='0' and A(18)='0' and A(17)='1' and A(16)='0' AND BGACK_000='0'
						else '1';
	FPU_CS		<=	FPU_CS_INT;
	
	--if no copro is installed:
--	BERR		<=	'Z' when FPU_CS_INT ='1' else '0';

	--reset buffer
	RESET <= RST;

	--cache inhibit: For now: disable
	CIIN <= '1' WHEN A(31 downto 20) = x"00F" ELSE
			'1' WHEN A(31 downto 16) = x"00E0" ELSE
			'0';

	--bus buffers
	AMIGA_BUS_ENABLE <= '0'; --for now: allways on
	AMIGA_BUS_DATA_DIR <='1' WHEN RW='0' ELSE '0';
	AMIGA_BUS_ENABLE_LOW <= '1'; --for now: allways off
		
				
	-- vma and e clock
	e_clk: process (CLK_000) 
	begin
		if rising_edge(CLK_000) then
			-- next state.
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
	end process e_clk; 	

	vma_gen: process (CLK_000,AS_030) begin
		if(AS_030='1') then
			VMA_INT		<= '1';
			VPA_SYNC	<= '1';
		elsif falling_edge(CLK_000) then
			VPA_SYNC <= VPA;
			if(cpu_est = E3 AND VPA_SYNC = '0' AND AS_000_INT = '0') then
				VMA_INT <= '0';  -- low active !
			end if;
			if(cpu_est = E10) then
				VMA_INT <= '1';  
			end if;

		end if;
	end process vma_gen; 	

	vma_delay: process(CLK_030)
	begin
		if(rising_edge(CLK_030)) then
			VMA_INT_D<=VMA_INT;			
		end if;
	end process vma_delay;

	E_INT	<= cpu_est(3);
	E		<= E_INT;
	VMA		<= VMA_INT AND VMA_INT_D;
	
	
	--AVEC
	--AVEC <=	'0' WHEN VMA='1' AND cpu_est = E10	-- 
	--			ELSE '1';
	AVEC <=	'1';

	--IPL: Buffer interrupts for a CPU-Cycle to avoid fake interupts
	ipl_amiga: process(CLK_000)
	begin
		if(rising_edge(CLK_000)) then
			IPL_030<=IPL;			
		end if;
	end process ipl_amiga;

	--BG
	bg_amiga: process(CLK_030,BG_030)
	begin
		if(BG_030= '1')then
			BG_000	<= '1';
		elsif(falling_edge(CLK_030)) then
			if(SM_AMIGA 	= IDLE and CPU_SPACE = '0' and AS_030='1') then --bus granted no local access and no AS_030 running!
				BG_000 	<= '0';
			else
				BG_000	<='1'; 
			end if;
		end if;
	end process bg_amiga;
	
	
	
	--as uds/lds generation
	UDS_LOGIC <= '0' WHEN AS_030 = '0' AND  A(0)='0' ELSE '1';
	LDS_LOGIC <= '0' WHEN AS_030 = '0' AND (A(0)='1' OR SIZE(0)='0' OR SIZE(1)='1') ELSE '1';

	as_amiga: process(AS_030, CLK_030)
	begin
		if(AS_030 = '1') then
			AS_000_INT <= '1';
			UDS_000_INT<= '1';
			LDS_000_INT<= '1';
		elsif(rising_edge(CLK_030)) then --as is sampled at rising edge on a 68020/030

			if (	AS_030 		= '0'  AND -- obviously as must be low 
					CPU_SPACE 	= '0'  AND -- expansion board not in action
					SM_AMIGA 	= IDLE AND -- last cycle completed
					AS_AMIGA_ENABLE = '1'  --indicator ready
					AND CLK_000 	= '1'  --AND CLK_000_D = '1' -- as is sampled at falling edge on a 68000/010 thus it is set during high CLK_000			
				) then 
	      		AS_000_INT <= '0';
				if (RW='1') then --read: set udl/lds 				 
					UDS_000_INT <= UDS_LOGIC;
					LDS_000_INT <= LDS_LOGIC;
				end if;
	    	elsif(RW='0' AND AS_000_INT_D='0')then --write: uds/lds have to wait for one 7m-clock later
				UDS_000_INT <= UDS_LOGIC;
				LDS_000_INT <= LDS_LOGIC;				
	    	end if;

		end if;
	end process as_amiga;

	--helper signal for a delayed version of AS_000	
	as_pe_amiga: process(AS_030, CLK_000)
	begin
		if(AS_030 ='1') then
			AS_000_INT_D <= '1';
		elsif(rising_edge(CLK_000)) then  -- positive edge delayed AS_000
			AS_000_INT_D <= AS_000_INT;
		end if;
	end process as_pe_amiga;		


	--state machine for amiga-cycle
	sm_amiga: process(RST, CLK_000)
	begin
		if(RST='0') then
			SM_AMIGA <= IDLE;
			DTACK_INT<= '1';
		elsif(falling_edge(CLK_000)) then  
			case (SM_AMIGA) is
				when IDLE 	=> 
					if(AS_000_INT='0') then
						SM_AMIGA <= AS_SET;
					end if;
				when AS_SET => 
					if(VPA_SYNC = '1' AND DTACK_SYNC='0') then 
						DTACK_INT<= '0';
						SM_AMIGA <= DATA_FETCH ;
					elsif(E10=cpu_est AND VPA_SYNC='0' AND VMA_INT='0') then --vpa/vma cycle
						DTACK_INT<= '0';
						SM_AMIGA <= DATA_FETCH ;
					end if;
				when DATA_FETCH => --here the data is written/read												
						SM_AMIGA <= END_CYCLE; 
				when END_CYCLE  => -- internal DTACK is high here. end cycle!
						DTACK_INT<= '1';	
						SM_AMIGA <= IDLE ;
			end case;			
			
		end if;
	end process sm_amiga;		

	--positive edge deleyed statemachine
	state_amiga_pe: process(CLK_000)
	begin
		if(rising_edge(CLK_000)) then --as is sampled at rising edge on a 68020/030
			SM_AMIGA_LAST <= SM_AMIGA;
		end if;
	end process state_amiga_pe;


	AS_000		<= 'Z' 	when BGACK_030_INT ='0' else
					AS_000_INT;
	UDS_000	<= 'Z' when BGACK_030_INT ='0' else -- output on cpu cycle
					UDS_000_INT;
	LDS_000	<= 'Z' when BGACK_030_INT ='0' else -- output on cpu cycle
					LDS_000_INT;
	--dsack generation
	dtack_sync: process(CLK_030)
	begin
		if(rising_edge(CLK_030)) then
			DTACK_SYNC <= DTACK; --for the AMIGA state machine
			DTACK_SYNC_D <= DTACK_SYNC;
			DTACK_SYNC_DD <= DTACK_SYNC_D;
		end if;
	end process dtack_sync;

	--dsack generation
	dsack_CPU: process(AS_030,CLK_030)
	begin
		if(AS_030 ='1') then
			DSACK_INT<="11";
			AS_AMIGA_ENABLE <='0';
		elsif(rising_edge(CLK_030)) then			
			-- this is a indicator, that we have been in idle state
			-- this avoids that an "old" DTACK is used a second time in a new memory cycle
			if(SM_AMIGA = IDLE) then
				AS_AMIGA_ENABLE <= '1';
			end if;
			if(SM_AMIGA = END_CYCLE AND AS_AMIGA_ENABLE = '1') then
				DSACK_INT<="01";
				AS_AMIGA_ENABLE<='0';
			end if;
		end if;
	end process dsack_CPU;

	DSACK		<= "ZZ" when CPU_SPACE = '1' else -- output on amiga cycle
					DSACK_INT;

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
