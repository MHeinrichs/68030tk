[DEVICE]

Family = M4A5;
PartType = M4A5-128/64;
Package = 100TQFP;
PartNumber = M4A5-128/64-10VC;
Speed = -10;
Operating_condition = COM;
EN_Segment = NO;
Pin_MC_1to1 = NO;
Voltage = 5.0;

[REVISION]

RCS = "$Revision: 1.2 $";
Parent = m4a5.lci;
SDS_file = m4a5.sds;
Design = 68030_tk.tt4;
Rev = 0.01;
DATE = 12/29/16;
TIME = 16:02:00;
Type = TT2;
Pre_Fit_Time = 1;
Source_Format = Pure_VHDL;

[IGNORE ASSIGNMENTS]

Pin_Assignments = NO;
Pin_Keep_Block = NO;
Pin_Keep_Segment = NO;
Group_Assignments = NO;
Macrocell_Assignments = NO;
Macrocell_Keep_Block = NO;
Macrocell_Keep_Segment = NO;
Pin_Reservation = NO;
Timing_Constraints = NO;
Block_Reservation = NO;
Segment_Reservation = NO;
Ignore_Source_Location = NO;
Ignore_Source_Optimization = NO;
Ignore_Source_Timing = NO;

[CLEAR ASSIGNMENTS]

Pin_Assignments = NO;
Pin_Keep_Block = NO;
Pin_Keep_Segment = NO;
Group_Assignments = NO;
Macrocell_Assignments = NO;
Macrocell_Keep_Block = NO;
Macrocell_Keep_Segment = NO;
Pin_Reservation = NO;
Timing_Constraints = NO;
Block_Reservation = NO;
Segment_Reservation = NO;
Ignore_Source_Location = NO;
Ignore_Source_Optimization = NO;
Ignore_Source_Timing = NO;

[BACKANNOTATE NETLIST]

Netlist = VHDL;
Delay_File = SDF;
Generic_VCC = ;
Generic_GND = ;

[BACKANNOTATE ASSIGNMENTS]

Pin_Assignment = NO;
Pin_Block = NO;
Pin_Macrocell_Block = NO;
Routing = NO;

[GLOBAL PROJECT OPTIMIZATION]

Balanced_Partitioning = YES;
Spread_Placement = YES;
Max_Pin_Percent = 100;
Max_Macrocell_Percent = 100;
Max_Inter_Seg_Percent = 100;
Max_Seg_In_Percent = 100;
Max_Blk_In_Percent = 100;

[FITTER REPORT FORMAT]

Fitter_Options = YES;
Pinout_Diagram = NO;
Pinout_Listing = YES;
Detailed_Block_Segment_Summary = YES;
Input_Signal_List = YES;
Output_Signal_List = YES;
Bidir_Signal_List = YES;
Node_Signal_List = YES;
Signal_Fanout_List = YES;
Block_Segment_Fanin_List = YES;
Prefit_Eqn = YES;
Postfit_Eqn = YES;
Page_Break = YES;

[OPTIMIZATION OPTIONS]

Logic_Reduction = YES;
Max_PTerm_Split = 20;
Max_PTerm_Collapse = 20;
XOR_Synthesis = YES;
Node_Collapse = Yes;
DT_Synthesis = Yes;

[FITTER GLOBAL OPTIONS]

Run_Time = 0;
Set_Reset_Dont_Care = YES;
In_Reg_Optimize = YES;
Clock_Optimize = NO;
Conf_Unused_IOs = OUT_LOW;

[POWER]
Powerlevel = Low, High;
Default = High;
Low = 8, H, G, F, E, D, C, B, A;
Type = GLB;

[HARDWARE DEVICE OPTIONS]
Zero_Hold_Time = Yes;
Signature_Word = 0;
Pull_up = No;
Out_Slew_Rate = SLOW, FAST, 57, CLK_DIV_OUT, CLK_EXP, FPU_CS, AMIGA_BUS_DATA_DIR, AMIGA_BUS_ENABLE_LOW, 
	AMIGA_ADDR_ENABLE, AMIGA_BUS_ENABLE_HIGH, AS_030, A_16_, A_17_, A_18_, 
	A_19_, RW, SIZE_1_, SIZE_0_, AVEC, BGACK_030, BG_000, E, IPL_030_0_, IPL_030_1_, 
	IPL_030_2_, LDS_000, UDS_000, VMA, RESET, CIIN, A_20_, A_21_, A_22_, A_24_, 
	A_25_, A_26_, A_27_, A_28_, A_29_, A_30_, A_31_, DS_030, BERR, A0, DSACK1, 
	RW_000, AS_000, A_23_, A1, A_3_, A_2_, AHIGH_24_, AHIGH_25_, AHIGH_26_, 
	AHIGH_27_, AHIGH_28_, AHIGH_29_, AHIGH_30_, AHIGH_31_, A_0_;
Device_max_fanin = 33;
Device_max_pterms = 20;
Usercode_Format = Hex;

[PIN RESERVATIONS]
layer = OFF;

[LOCATION ASSIGNMENT]

Layer = OFF
AS_030 = OUTPUT,82,7,-;
RW_000 = BIDIR,80,7,-;
AS_000 = OUTPUT,42,4,-;
UDS_000 = OUTPUT,32,3,-;
LDS_000 = OUTPUT,31,3,-;
RW = BIDIR,71,6,-;
SIZE_1_ = BIDIR,79,7,-;
SIZE_0_ = BIDIR,70,6,-;
A_0_ = BIDIR,69,6,-;
BERR = OUTPUT,41,4,-;
DTACK = OUTPUT,30,3,-;
AHIGH_24_ = OUTPUT,19,2,-;
AHIGH_25_ = OUTPUT,18,2,-;
AHIGH_26_ = OUTPUT,17,2,-;
AHIGH_27_ = OUTPUT,16,2,-;
AHIGH_28_ = OUTPUT,15,2,-;
AHIGH_29_ = OUTPUT,6,1,-;
AHIGH_30_ = OUTPUT,5,1,-;
AHIGH_31_ = OUTPUT,4,1,-;
IPL_030_2_ = OUTPUT,9,1,-;
IPL_030_0_ = OUTPUT,8,1,-;
IPL_030_1_ = OUTPUT,7,1,-;
BGACK_030 = OUTPUT,83,7,-;
VMA = OUTPUT,35,3,-;
E = OUTPUT,66,6,-;
AMIGA_BUS_DATA_DIR = OUTPUT,48,4,-;
AMIGA_BUS_ENABLE_HIGH = OUTPUT,34,3,-;
BG_000 = OUTPUT,29,3,-;
DS_030 = OUTPUT,98,0,-;
AVEC = OUTPUT,92,0,-;
DSACK1 = OUTPUT,81,7,-;
FPU_CS = OUTPUT,78,7,-;
CLK_DIV_OUT = OUTPUT,65,6,-;
CIIN = OUTPUT,47,4,-;
AMIGA_ADDR_ENABLE = OUTPUT,33,3,-;
AMIGA_BUS_ENABLE_LOW = OUTPUT,20,2,-;
CLK_EXP = OUTPUT,10,1,-;
RN_BGACK_030 = NODE,-1,7,-;
CLK_000_D_0_ = NODE,*,3,-;
CLK_000_D_1_ = NODE,*,7,-;
inst_RESET_OUT = NODE,*,6,-;
SM_AMIGA_6_ = NODE,*,5,-;
inst_BGACK_030_INT_D = NODE,*,7,-;
inst_AS_030_000_SYNC = NODE,*,1,-;
inst_AS_000_DMA = NODE,*,0,-;
cpu_est_3_ = NODE,*,3,-;
cpu_est_1_ = NODE,*,3,-;
SM_AMIGA_i_7_ = NODE,*,5,-;
SM_AMIGA_0_ = NODE,*,0,-;
cpu_est_0_ = NODE,*,6,-;
CLK_OUT_INTreg = NODE,*,3,-;
inst_AS_030_D0 = NODE,*,7,-;
cpu_est_2_ = NODE,*,3,-;
SM_AMIGA_2_ = NODE,*,2,-;
RN_VMA = NODE,-1,3,-;
SM_AMIGA_5_ = NODE,*,6,-;
SM_AMIGA_1_ = NODE,*,5,-;
SM_AMIGA_4_ = NODE,*,0,-;
inst_DS_000_ENABLE = NODE,*,2,-;
inst_LDS_000_INT = NODE,*,5,-;
inst_AS_000_INT = NODE,*,2,-;
inst_DSACK1_INT = NODE,*,0,-;
inst_UDS_000_INT = NODE,*,5,-;
inst_AMIGA_BUS_ENABLE_DMA_LOW = NODE,*,5,-;
inst_AMIGA_BUS_ENABLE_DMA_HIGH = NODE,*,5,-;
inst_CLK_OUT_PRE_D = NODE,*,4,-;
inst_CLK_OUT_PRE_50 = NODE,*,6,-;
CLK_000_D_3_ = NODE,*,5,-;
inst_VPA_D = NODE,*,5,-;
RN_IPL_030_2_ = NODE,-1,1,-;
RN_IPL_030_0_ = NODE,-1,1,-;
RN_IPL_030_1_ = NODE,-1,1,-;
CLK_030_PE_0_ = NODE,*,0,-;
inst_DS_000_DMA = NODE,*,0,-;
CLK_030_PE_1_ = NODE,*,0,-;
SM_AMIGA_3_ = NODE,*,2,-;
RN_RW_000 = NODE,-1,7,-;
RST_DLY_0_ = NODE,*,6,-;
CYCLE_DMA_0_ = NODE,*,0,-;
RN_SIZE_0_ = NODE,-1,6,-;
RN_SIZE_1_ = NODE,-1,7,-;
RN_A_0_ = NODE,-1,6,-;
RN_RW = NODE,-1,6,-;
RN_BG_000 = NODE,-1,3,-;
CIIN_0 = NODE,*,4,-;
RST_DLY_2_ = NODE,*,6,-;
RST_DLY_1_ = NODE,*,6,-;
CYCLE_DMA_1_ = NODE,*,0,-;
inst_AMIGA_DS = NODE,*,2,-;
CLK_000_D_4_ = NODE,*,2,-;
CLK_000_D_2_ = NODE,*,7,-;
IPL_D0_2_ = NODE,*,1,-;
IPL_D0_1_ = NODE,*,1,-;
IPL_D0_0_ = NODE,*,1,-;
inst_DTACK_D0 = NODE,*,1,-;
CLK_OSZI = INPUT,61,-,-;
