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
DATE = 6/7/14;
TIME = 23:03:24;
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

Balanced_Partitioning = NO;
Spread_Placement = NO;
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
Set_Reset_Dont_Care = YES;
In_Reg_Optimize = YES;
Clock_Optimize = NO;
Conf_Unused_IOs = OUT_LOW;

[POWER]
Powerlevel = Low, High;
Default = High;
Type = GLB;

[HARDWARE DEVICE OPTIONS]
Zero_Hold_Time = Yes;
Signature_Word = 0;
Pull_up = Yes;
Out_Slew_Rate = SLOW, FAST, 0;
Device_max_fanin = 33;
Device_max_pterms = 20;
Usercode_Format = Hex;

[PIN RESERVATIONS]
layer = OFF;

[LOCATION ASSIGNMENT]

Layer = OFF
AS_000 = BIDIR,33,3,-;
LDS_000 = BIDIR,31,3,-;
UDS_000 = BIDIR,32,3,-;
AS_030 = BIDIR,82,7,-;
RW = OUTPUT,71,6,-;
RW_000 = OUTPUT,80,7,-;
DS_030 = BIDIR,98,0,-;
DSACK1 = BIDIR,81,7,-;
SIZE_1_ = OUTPUT,79,7,-;
SIZE_0_ = OUTPUT,70,6,-;
A0 = OUTPUT,69,6,-;
DTACK = OUTPUT,30,3,-;
E = OUTPUT,66,6,-;
IPL_030_2_ = OUTPUT,9,1,-;
IPL_030_0_ = OUTPUT,8,1,-;
IPL_030_1_ = OUTPUT,7,1,-;
BGACK_030 = OUTPUT,83,7,-;
FPU_CS = OUTPUT,78,7,-;
AMIGA_BUS_DATA_DIR = OUTPUT,48,4,-;
VMA = OUTPUT,35,3,-;
BG_000 = OUTPUT,29,3,-;
AVEC = OUTPUT,92,0,-;
CLK_DIV_OUT = OUTPUT,65,6,-;
CIIN = OUTPUT,47,4,-;
BERR = OUTPUT,41,4,-;
AMIGA_BUS_ENABLE = OUTPUT,34,3,-;
AVEC_EXP = OUTPUT,22,2,-;
AMIGA_BUS_ENABLE_LOW = OUTPUT,20,2,-;
CLK_EXP = OUTPUT,10,1,-;
RESET = OUTPUT,3,1,-;
RN_BGACK_030 = NODE,-1,7,-;
RN_AS_030 = NODE,-1,7,-;
inst_CLK_000_D1 = NODE,*,3,-;
inst_CLK_000_D0 = NODE,*,7,-;
inst_avec_expreg = NODE,*,6,-;
cpu_est_1_ = NODE,*,3,-;
SM_AMIGA_7_ = NODE,*,7,-;
RN_E = NODE,-1,6,-;
SM_AMIGA_1_ = NODE,*,1,-;
inst_RW_000_INT = NODE,*,6,-;
inst_AS_030_000_SYNC = NODE,*,7,-;
inst_CLK_030_H = NODE,*,1,-;
cpu_est_2_ = NODE,*,3,-;
cpu_est_0_ = NODE,*,3,-;
SM_AMIGA_2_ = NODE,*,0,-;
inst_CLK_OUT_PRE_25 = NODE,*,1,-;
RN_VMA = NODE,-1,3,-;
RN_FPU_CS = NODE,-1,7,-;
SM_AMIGA_5_ = NODE,*,3,-;
SM_AMIGA_0_ = NODE,*,7,-;
SM_AMIGA_6_ = NODE,*,6,-;
inst_CLK_000_D2 = NODE,*,7,-;
inst_CLK_OUT_PRE_50 = NODE,*,7,-;
inst_VPA_D = NODE,*,0,-;
RN_LDS_000 = NODE,-1,3,-;
RN_UDS_000 = NODE,-1,3,-;
RN_DS_030 = NODE,-1,0,-;
SM_AMIGA_3_ = NODE,*,0,-;
RN_IPL_030_0_ = NODE,-1,1,-;
RN_IPL_030_1_ = NODE,-1,1,-;
RN_IPL_030_2_ = NODE,-1,1,-;
RN_DSACK1 = NODE,-1,7,-;
RN_BG_000 = NODE,-1,3,-;
RN_AS_000 = NODE,-1,3,-;
SM_AMIGA_4_ = NODE,*,0,-;
inst_DTACK_D0 = NODE,*,1,-;
inst_CLK_OUT_PRE_50_D = NODE,*,7,-;
inst_BGACK_030_INT_D = NODE,*,1,-;
CLK_OSZI = INPUT,61,-,-;
