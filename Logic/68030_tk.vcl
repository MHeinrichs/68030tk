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
DATE = 8/19/16;
TIME = 00:39:39;
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
Max_PTerm_Split = 16;
Max_PTerm_Collapse = 16;
XOR_Synthesis = YES;
Node_Collapse = Yes;
DT_Synthesis = Yes;

[FITTER GLOBAL OPTIONS]

Run_Time = 0;
Set_Reset_Dont_Care = NO;
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
Pull_up = Yes;
Out_Slew_Rate = SLOW, FAST, 7, CLK_DIV_OUT, CLK_EXP, FPU_CS, AMIGA_BUS_DATA_DIR, AMIGA_BUS_ENABLE_LOW, 
	AMIGA_ADDR_ENABLE, AMIGA_BUS_ENABLE_HIGH;
Device_max_fanin = 33;
Device_max_pterms = 20;
Usercode_Format = Hex;

[PIN RESERVATIONS]
layer = OFF;

[LOCATION ASSIGNMENT]

Layer = OFF
BERR = OUTPUT,41,4,-;
RW_000 = BIDIR,80,7,-;
AS_030 = OUTPUT,82,7,-;
AS_000 = OUTPUT,42,4,-;
RW = BIDIR,71,6,-;
UDS_000 = OUTPUT,32,3,-;
LDS_000 = OUTPUT,31,3,-;
A_0_ = BIDIR,69,6,-;
SIZE_1_ = OUTPUT,79,7,-;
SIZE_0_ = OUTPUT,70,6,-;
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
DSACK1 = OUTPUT,81,7,-;
BGACK_030 = OUTPUT,83,7,-;
VMA = OUTPUT,35,3,-;
E = OUTPUT,66,6,-;
AMIGA_BUS_DATA_DIR = OUTPUT,48,4,-;
AMIGA_BUS_ENABLE_HIGH = OUTPUT,34,3,-;
BG_000 = OUTPUT,29,3,-;
DS_030 = OUTPUT,98,0,-;
AVEC = OUTPUT,92,0,-;
FPU_CS = OUTPUT,78,7,-;
CLK_DIV_OUT = OUTPUT,65,6,-;
CIIN = OUTPUT,47,4,-;
AMIGA_ADDR_ENABLE = OUTPUT,33,3,-;
AMIGA_BUS_ENABLE_LOW = OUTPUT,20,2,-;
CLK_EXP = OUTPUT,10,1,-;
RESET = OUTPUT,3,1,-;
CLK_000_D_1_ = NODE,*,7,-;
RN_BGACK_030 = NODE,-1,7,-;
inst_RESET_OUT = NODE,*,0,-;
CLK_000_D_0_ = NODE,*,2,-;
SM_AMIGA_6_ = NODE,*,2,-;
inst_AS_030_D0 = NODE,*,0,-;
SM_AMIGA_0_ = NODE,*,6,-;
SM_AMIGA_i_7_ = NODE,*,5,-;
inst_AS_030_000_SYNC = NODE,*,2,-;
cpu_est_1_ = NODE,*,5,-;
cpu_est_3_ = NODE,*,3,-;
SM_AMIGA_1_ = NODE,*,5,-;
CLK_000_D_2_ = NODE,*,4,-;
inst_CLK_OUT_PRE_D = NODE,*,4,-;
cpu_est_2_ = NODE,*,3,-;
inst_AS_000_DMA = NODE,*,0,-;
RST_DLY_0_ = NODE,*,5,-;
inst_DS_000_ENABLE = NODE,*,1,-;
RN_VMA = NODE,-1,3,-;
SM_AMIGA_5_ = NODE,*,5,-;
SM_AMIGA_4_ = NODE,*,1,-;
SIZE_DMA_1_ = NODE,*,6,-;
SIZE_DMA_0_ = NODE,*,6,-;
cpu_est_0_ = NODE,*,3,-;
RST_DLY_2_ = NODE,*,5,-;
RST_DLY_1_ = NODE,*,5,-;
inst_AMIGA_BUS_ENABLE_DMA_HIGH = NODE,*,6,-;
inst_AMIGA_BUS_ENABLE_DMA_LOW = NODE,*,6,-;
inst_AS_000_INT = NODE,*,2,-;
CLK_000_D_11_ = NODE,*,7,-;
inst_VPA_D = NODE,*,5,-;
inst_BGACK_030_INT_D = NODE,*,7,-;
RN_IPL_030_0_ = NODE,-1,1,-;
RN_IPL_030_1_ = NODE,-1,1,-;
RN_IPL_030_2_ = NODE,-1,1,-;
inst_DS_000_DMA = NODE,*,0,-;
inst_CLK_030_H = NODE,*,0,-;
RN_DSACK1 = NODE,-1,7,-;
RN_RW_000 = NODE,-1,7,-;
SM_AMIGA_2_ = NODE,*,5,-;
SM_AMIGA_3_ = NODE,*,5,-;
CYCLE_DMA_1_ = NODE,*,0,-;
RN_A_0_ = NODE,-1,6,-;
inst_LDS_000_INT = NODE,*,3,-;
CYCLE_DMA_0_ = NODE,*,0,-;
RN_RW = NODE,-1,6,-;
RN_BG_000 = NODE,-1,3,-;
CIIN_0 = NODE,*,4,-;
inst_UDS_000_INT = NODE,*,3,-;
CLK_000_D_12_ = NODE,*,6,-;
CLK_000_D_9_ = NODE,*,0,-;
CLK_000_D_8_ = NODE,*,6,-;
CLK_000_D_7_ = NODE,*,0,-;
CLK_000_D_6_ = NODE,*,3,-;
CLK_000_D_5_ = NODE,*,4,-;
CLK_000_D_4_ = NODE,*,2,-;
CLK_000_D_3_ = NODE,*,4,-;
IPL_D0_2_ = NODE,*,0,-;
IPL_D0_1_ = NODE,*,1,-;
IPL_D0_0_ = NODE,*,1,-;
inst_CLK_OUT_PRE_50 = NODE,*,4,-;
inst_DTACK_D0 = NODE,*,6,-;
CLK_000_D_10_ = NODE,*,2,-;
CLK_OSZI = INPUT,61,-,-;
