-- VHDL netlist-file
library mach;
use mach.components.all;

library ieee;
use ieee.std_logic_1164.all;
entity BUS68030 is
  port (
    SIZE : inout std_logic_vector(1 downto 0);
    AHIGH : inout std_logic_vector(31 downto 24);
    A_DECODE : in std_logic_vector(23 downto 2);
    IPL : in std_logic_vector(2 downto 0);
    FC : in std_logic_vector(1 downto 0);
    AS_030 : inout std_logic;
    AS_000 : inout std_logic;
    DS_030 : out std_logic;
    UDS_000 : inout std_logic;
    LDS_000 : inout std_logic;
    nEXP_SPACE : in std_logic;
    BERR : inout std_logic;
    BG_030 : in std_logic;
    BGACK_000 : in std_logic;
    CLK_030 : in std_logic;
    CLK_000 : in std_logic;
    CLK_OSZI : in std_logic;
    CLK_DIV_OUT : out std_logic;
    FPU_CS : out std_logic;
    FPU_SENSE : in std_logic;
    DTACK : in std_logic;
    AVEC : out std_logic;
    E : out std_logic;
    VPA : in std_logic;
    RST : in std_logic;
    RESET : out std_logic;
    AMIGA_ADDR_ENABLE : out std_logic;
    AMIGA_BUS_DATA_DIR : out std_logic;
    AMIGA_BUS_ENABLE_LOW : out std_logic;
    AMIGA_BUS_ENABLE_HIGH : out std_logic;
    CIIN : out std_logic;
    A : inout std_logic_vector(1 downto 0);
    IPL_030 : out std_logic_vector(2 downto 0);
    RW_000 : inout std_logic;
    BG_000 : out std_logic;
    BGACK_030 : out std_logic;
    CLK_EXP : out std_logic;
    DSACK1 : out std_logic;
    VMA : out std_logic;
    RW : inout std_logic
  );
end BUS68030;

architecture NetList of BUS68030 is

  signal SIZE_1XPIN : std_logic;
  signal SIZE_1XCOM : std_logic;
  signal AHIGH_31XPIN : std_logic;
  signal A_DECODE_23XPIN : std_logic;
  signal IPL_2XPIN : std_logic;
  signal FC_1XPIN : std_logic;
  signal AS_030PIN : std_logic;
  signal AS_030COM : std_logic;
  signal AS_000PIN : std_logic;
  signal AS_000COM : std_logic;
  signal DS_030COM : std_logic;
  signal UDS_000PIN : std_logic;
  signal UDS_000COM : std_logic;
  signal LDS_000PIN : std_logic;
  signal LDS_000COM : std_logic;
  signal nEXP_SPACEPIN : std_logic;
  signal SIZE_0XPIN : std_logic;
  signal SIZE_0XCOM : std_logic;
  signal BERRPIN : std_logic;
  signal AHIGH_30XPIN : std_logic;
  signal BG_030PIN : std_logic;
  signal AHIGH_29XPIN : std_logic;
  signal AHIGH_28XPIN : std_logic;
  signal AHIGH_27XPIN : std_logic;
  signal BGACK_000PIN : std_logic;
  signal AHIGH_26XPIN : std_logic;
  signal CLK_030PIN : std_logic;
  signal AHIGH_25XPIN : std_logic;
  signal CLK_000PIN : std_logic;
  signal AHIGH_24XPIN : std_logic;
  signal CLK_OSZIPIN : std_logic;
  signal A_DECODE_22XPIN : std_logic;
  signal CLK_DIV_OUTQ : std_logic;
  signal A_DECODE_21XPIN : std_logic;
  signal A_DECODE_20XPIN : std_logic;
  signal FPU_CSCOM : std_logic;
  signal A_DECODE_19XPIN : std_logic;
  signal FPU_SENSEPIN : std_logic;
  signal A_DECODE_18XPIN : std_logic;
  signal A_DECODE_17XPIN : std_logic;
  signal DTACKPIN : std_logic;
  signal A_DECODE_16XPIN : std_logic;
  signal ECOM : std_logic;
  signal VPAPIN : std_logic;
  signal RSTPIN : std_logic;
  signal AMIGA_BUS_DATA_DIRCOM : std_logic;
  signal AMIGA_BUS_ENABLE_LOWCOM : std_logic;
  signal AMIGA_BUS_ENABLE_HIGHCOM : std_logic;
  signal CIINCOM : std_logic;
  signal IPL_1XPIN : std_logic;
  signal IPL_0XPIN : std_logic;
  signal FC_0XPIN : std_logic;
  signal A_1XPIN : std_logic;
  signal IPL_030_2XQ : std_logic;
  signal RW_000PIN : std_logic;
  signal RW_000Q : std_logic;
  signal BG_000Q : std_logic;
  signal BGACK_030Q : std_logic;
  signal CLK_EXPQ : std_logic;
  signal DSACK1Q : std_logic;
  signal VMAQ : std_logic;
  signal RWPIN : std_logic;
  signal RWQ : std_logic;
  signal A_0XPIN : std_logic;
  signal A_0XQ : std_logic;
  signal IPL_030_1XQ : std_logic;
  signal IPL_030_0XQ : std_logic;
  signal cpu_est_3_busQ : std_logic;
  signal cpu_est_0_busQ : std_logic;
  signal cpu_est_1_busQ : std_logic;
  signal cpu_est_2_busQ : std_logic;
  signal inst_AS_000_INTQ : std_logic;
  signal inst_AMIGA_BUS_ENABLE_DMA_LOWQ : std_logic;
  signal inst_AS_030_D0Q : std_logic;
  signal inst_AS_030_000_SYNCQ : std_logic;
  signal inst_BGACK_030_INT_DQ : std_logic;
  signal inst_AS_000_DMAQ : std_logic;
  signal inst_DS_000_DMAQ : std_logic;
  signal CYCLE_DMA_0_busQ : std_logic;
  signal CYCLE_DMA_1_busQ : std_logic;
  signal SIZE_DMA_0_busQ : std_logic;
  signal SIZE_DMA_1_busQ : std_logic;
  signal inst_VPA_DQ : std_logic;
  signal inst_UDS_000_INTQ : std_logic;
  signal inst_LDS_000_INTQ : std_logic;
  signal inst_CLK_OUT_PRE_DQ : std_logic;
  signal CLK_000_D_6_busQ : std_logic;
  signal CLK_000_D_7_busQ : std_logic;
  signal inst_DTACK_D0Q : std_logic;
  signal inst_RESET_OUTQ : std_logic;
  signal CLK_000_D_1_busQ : std_logic;
  signal CLK_000_D_0_busQ : std_logic;
  signal inst_CLK_OUT_PRE_50Q : std_logic;
  signal inst_CLK_OUT_PRE_25Q : std_logic;
  signal IPL_D0_0_busQ : std_logic;
  signal IPL_D0_1_busQ : std_logic;
  signal IPL_D0_2_busQ : std_logic;
  signal CLK_000_D_2_busQ : std_logic;
  signal CLK_000_D_3_busQ : std_logic;
  signal CLK_000_D_4_busQ : std_logic;
  signal CLK_000_D_5_busQ : std_logic;
  signal CLK_000_D_8_busQ : std_logic;
  signal inst_AMIGA_BUS_ENABLE_DMA_HIGHQ : std_logic;
  signal inst_DS_000_ENABLEQ : std_logic;
  signal SM_AMIGA_6_busQ : std_logic;
  signal SM_AMIGA_0_busQ : std_logic;
  signal SM_AMIGA_4_busQ : std_logic;
  signal RST_DLY_0_busQ : std_logic;
  signal RST_DLY_1_busQ : std_logic;
  signal RST_DLY_2_busQ : std_logic;
  signal inst_CLK_030_HQ : std_logic;
  signal SM_AMIGA_1_busQ : std_logic;
  signal SM_AMIGA_5_busQ : std_logic;
  signal SM_AMIGA_3_busQ : std_logic;
  signal SM_AMIGA_2_busQ : std_logic;
  signal SM_AMIGA_i_7_busQ : std_logic;
  signal SIZE_1X_OE : std_logic;
  signal AHIGH_31X_OE : std_logic;
  signal T_0 : std_logic;
  signal AS_030_OE : std_logic;
  signal T_1 : std_logic;
  signal AS_000_OE : std_logic;
  signal T_2 : std_logic;
  signal DS_030_OE : std_logic;
  signal T_3 : std_logic;
  signal UDS_000_OE : std_logic;
  signal T_4 : std_logic;
  signal LDS_000_OE : std_logic;
  signal SIZE_0X_OE : std_logic;
  signal BERR_OE : std_logic;
  signal AHIGH_30X_OE : std_logic;
  signal AHIGH_29X_OE : std_logic;
  signal AHIGH_28X_OE : std_logic;
  signal AHIGH_27X_OE : std_logic;
  signal AHIGH_26X_OE : std_logic;
  signal AHIGH_25X_OE : std_logic;
  signal AHIGH_24X_OE : std_logic;
  signal T_5 : std_logic;
  signal RESET_OE : std_logic;
  signal T_6 : std_logic;
  signal T_7 : std_logic;
  signal T_8 : std_logic;
  signal RW_000_OE : std_logic;
  signal T_9 : std_logic;
  signal BGACK_030_D : std_logic;
  signal T_10 : std_logic;
  signal VMA_T : std_logic;
  signal T_11 : std_logic;
  signal RW_OE : std_logic;
  signal A_0X_D : std_logic;
  signal A_0X_OE : std_logic;
  signal T_12 : std_logic;
  signal T_13 : std_logic;
  signal cpu_est_3_bus_D : std_logic;
  signal cpu_est_0_bus_D : std_logic;
  signal cpu_est_1_bus_D : std_logic;
  signal cpu_est_2_bus_D_X1 : std_logic;
  signal T_14 : std_logic;
  signal T_15 : std_logic;
  signal T_16 : std_logic;
  signal T_17 : std_logic;
  signal T_18 : std_logic;
  signal inst_AS_000_DMA_D : std_logic;
  signal inst_DS_000_DMA_D : std_logic;
  signal CYCLE_DMA_0_bus_D : std_logic;
  signal CYCLE_DMA_1_bus_D : std_logic;
  signal T_19 : std_logic;
  signal SIZE_DMA_1_bus_D : std_logic;
  signal T_20 : std_logic;
  signal T_21 : std_logic;
  signal inst_LDS_000_INT_D : std_logic;
  signal T_22 : std_logic;
  signal inst_RESET_OUT_D : std_logic;
  signal inst_CLK_OUT_PRE_50_D : std_logic;
  signal inst_CLK_OUT_PRE_25_D : std_logic;
  signal T_23 : std_logic;
  signal T_24 : std_logic;
  signal T_25 : std_logic;
  signal T_26 : std_logic;
  signal inst_DS_000_ENABLE_D : std_logic;
  signal SM_AMIGA_6_bus_D : std_logic;
  signal SM_AMIGA_0_bus_D : std_logic;
  signal SM_AMIGA_4_bus_D : std_logic;
  signal RST_DLY_0_bus_D : std_logic;
  signal RST_DLY_1_bus_D_X1 : std_logic;
  signal RST_DLY_1_bus_D_X2 : std_logic;
  signal RST_DLY_2_bus_D : std_logic;
  signal inst_CLK_030_H_D : std_logic;
  signal SM_AMIGA_1_bus_D : std_logic;
  signal SM_AMIGA_5_bus_D : std_logic;
  signal SM_AMIGA_3_bus_D_X1 : std_logic;
  signal SM_AMIGA_3_bus_D_X2 : std_logic;
  signal SM_AMIGA_2_bus_D : std_logic;
  signal SM_AMIGA_i_7_bus_D_X1 : std_logic;
  signal SM_AMIGA_i_7_bus_D_X2 : std_logic;
  signal CIIN_OE : std_logic;
  signal cpu_est_2_bus_D : std_logic;
  signal RST_DLY_1_bus_D : std_logic;
  signal SM_AMIGA_3_bus_D : std_logic;
  signal SM_AMIGA_i_7_bus_D : std_logic;
  signal IPL_030_2X_D : std_logic;
  signal RW_000_D : std_logic;
  signal BG_000_D : std_logic;
  signal DSACK1_D : std_logic;
  signal RW_D : std_logic;
  signal IPL_030_1X_D : std_logic;
  signal IPL_030_0X_D : std_logic;
  signal inst_AS_000_INT_D : std_logic;
  signal inst_AMIGA_BUS_ENABLE_DMA_LOW_D : std_logic;
  signal inst_AS_030_D0_D : std_logic;
  signal inst_AS_030_000_SYNC_D : std_logic;
  signal inst_BGACK_030_INT_D_D : std_logic;
  signal SIZE_DMA_0_bus_D : std_logic;
  signal inst_VPA_D_D : std_logic;
  signal inst_UDS_000_INT_D : std_logic;
  signal inst_DTACK_D0_D : std_logic;
  signal IPL_D0_0_bus_D : std_logic;
  signal IPL_D0_1_bus_D : std_logic;
  signal IPL_D0_2_bus_D : std_logic;
  signal inst_AMIGA_BUS_ENABLE_DMA_HIGH_D : std_logic;
  signal T_27 : std_logic;
  signal T_28 : std_logic;
  signal T_29 : std_logic;
  signal T_30 : std_logic;
  signal T_31 : std_logic;
  signal T_32 : std_logic;
  signal T_33 : std_logic;
  signal T_34 : std_logic;
  signal T_35 : std_logic;
  signal T_36 : std_logic;
  signal T_37 : std_logic;
  signal T_38 : std_logic;
  signal T_39 : std_logic;
  signal T_40 : std_logic;
  signal T_41 : std_logic;
  signal T_42 : std_logic;
  signal T_43 : std_logic;
  signal T_44 : std_logic;
  signal T_45 : std_logic;
  signal T_46 : std_logic;
  signal T_47 : std_logic;
  signal T_48 : std_logic;
  signal T_49 : std_logic;
  signal T_50 : std_logic;
  signal T_51 : std_logic;
  signal T_52 : std_logic;
  signal T_53 : std_logic;
  signal T_54 : std_logic;
  signal T_55 : std_logic;
  signal T_56 : std_logic;
  signal T_57 : std_logic;
  signal T_58 : std_logic;
  signal T_59 : std_logic;
  signal T_60 : std_logic;
  signal T_61 : std_logic;
  signal T_62 : std_logic;
  signal T_63 : std_logic;
  signal T_64 : std_logic;
  signal T_65 : std_logic;
  signal T_66 : std_logic;
  signal T_67 : std_logic;
  signal T_68 : std_logic;
  signal T_69 : std_logic;
  signal T_70 : std_logic;
  signal T_71 : std_logic;
  signal T_72 : std_logic;
  signal T_73 : std_logic;
  signal T_74 : std_logic;
  signal T_75 : std_logic;
  signal T_76 : std_logic;
  signal T_77 : std_logic;
  signal T_78 : std_logic;
  signal T_79 : std_logic;
  signal T_80 : std_logic;
  signal T_81 : std_logic;
  signal T_82 : std_logic;
  signal T_83 : std_logic;
  signal T_84 : std_logic;
  signal T_85 : std_logic;
  signal T_86 : std_logic;
  signal T_87 : std_logic;
  signal T_88 : std_logic;
  signal T_89 : std_logic;
  signal T_90 : std_logic;
  signal T_91 : std_logic;
  signal T_92 : std_logic;
  signal T_93 : std_logic;
  signal T_94 : std_logic;
  signal T_95 : std_logic;
  signal T_96 : std_logic;
  signal T_97 : std_logic;
  signal T_98 : std_logic;
  signal T_99 : std_logic;
  signal T_100 : std_logic;
  signal T_101 : std_logic;
  signal T_102 : std_logic;
  signal T_103 : std_logic;
  signal T_104 : std_logic;
  signal T_105 : std_logic;
  signal T_106 : std_logic;
  signal T_107 : std_logic;
  signal T_108 : std_logic;
  signal T_109 : std_logic;
  signal T_110 : std_logic;
  signal T_111 : std_logic;
  signal T_112 : std_logic;
  signal T_113 : std_logic;
  signal T_114 : std_logic;
  signal T_115 : std_logic;
  signal T_116 : std_logic;
  signal T_117 : std_logic;
  signal T_118 : std_logic;
  signal T_119 : std_logic;
  signal T_120 : std_logic;
  signal T_121 : std_logic;
  signal T_122 : std_logic;
  signal T_123 : std_logic;
  signal T_124 : std_logic;
  signal T_125 : std_logic;
  signal T_126 : std_logic;
  signal T_127 : std_logic;
  signal T_128 : std_logic;
  signal T_129 : std_logic;
  signal T_130 : std_logic;
  signal T_131 : std_logic;
  signal T_132 : std_logic;
  signal T_133 : std_logic;
  signal T_134 : std_logic;
  signal T_135 : std_logic;
  signal T_136 : std_logic;
  signal T_137 : std_logic;
  signal T_138 : std_logic;
  signal T_139 : std_logic;
  signal T_140 : std_logic;
  signal T_141 : std_logic;
  signal T_142 : std_logic;
  signal T_143 : std_logic;
  signal T_144 : std_logic;
  signal T_145 : std_logic;
  signal T_146 : std_logic;
  signal T_147 : std_logic;
  signal T_148 : std_logic;
  signal T_149 : std_logic;
  signal T_150 : std_logic;
  signal T_151 : std_logic;
  signal T_152 : std_logic;
  signal T_153 : std_logic;
  signal T_154 : std_logic;
  signal T_155 : std_logic;
  signal T_156 : std_logic;
  signal T_157 : std_logic;
  signal T_158 : std_logic;
  signal T_159 : std_logic;
  signal T_160 : std_logic;
  signal T_161 : std_logic;
  signal T_162 : std_logic;
  signal T_163 : std_logic;
  signal T_164 : std_logic;
  signal T_165 : std_logic;
  signal T_166 : std_logic;
  signal T_167 : std_logic;
  signal T_168 : std_logic;
  signal T_169 : std_logic;
  signal T_170 : std_logic;
  signal T_171 : std_logic;
  signal T_172 : std_logic;
  signal T_173 : std_logic;
  signal T_174 : std_logic;
  signal T_175 : std_logic;
  signal T_176 : std_logic;
  signal T_177 : std_logic;
  signal T_178 : std_logic;
  signal T_179 : std_logic;
  signal T_180 : std_logic;
  signal T_181 : std_logic;
  signal T_182 : std_logic;
  signal T_183 : std_logic;
  signal T_184 : std_logic;
  signal T_185 : std_logic;
  signal T_186 : std_logic;
  signal T_187 : std_logic;
  signal T_188 : std_logic;
  signal T_189 : std_logic;
  signal T_190 : std_logic;
  signal T_191 : std_logic;
  signal T_192 : std_logic;
  signal T_193 : std_logic;
  signal T_194 : std_logic;
  signal T_195 : std_logic;
  signal T_196 : std_logic;
  signal T_197 : std_logic;
  signal T_198 : std_logic;
  signal T_199 : std_logic;
  signal T_200 : std_logic;
  signal T_201 : std_logic;
  signal T_202 : std_logic;
  signal T_203 : std_logic;
  signal T_204 : std_logic;
  signal T_205 : std_logic;
  signal T_206 : std_logic;
  signal T_207 : std_logic;
  signal T_208 : std_logic;
  signal T_209 : std_logic;
  signal T_210 : std_logic;
  signal T_211 : std_logic;
  signal T_212 : std_logic;
  signal T_213 : std_logic;
  signal T_214 : std_logic;
  signal T_215 : std_logic;
  signal T_216 : std_logic;
  signal T_217 : std_logic;
  signal T_218 : std_logic;
  signal T_219 : std_logic;
  signal T_220 : std_logic;
  signal T_221 : std_logic;
  signal T_222 : std_logic;
  signal T_223 : std_logic;
  signal T_224 : std_logic;
  signal T_225 : std_logic;
  signal T_226 : std_logic;
  signal T_227 : std_logic;
  signal T_228 : std_logic;
  signal T_229 : std_logic;
  signal T_230 : std_logic;
  signal T_231 : std_logic;
  signal T_232 : std_logic;
  signal T_233 : std_logic;
  signal T_234 : std_logic;
  signal T_235 : std_logic;
  signal T_236 : std_logic;
  signal T_237 : std_logic;
  signal T_238 : std_logic;
  signal T_239 : std_logic;
  signal T_240 : std_logic;
  signal T_241 : std_logic;
  signal T_242 : std_logic;
  signal T_243 : std_logic;
  signal T_244 : std_logic;
  signal T_245 : std_logic;
  signal T_246 : std_logic;
  signal T_247 : std_logic;
  signal T_248 : std_logic;
  signal T_249 : std_logic;
  signal T_250 : std_logic;
  signal T_251 : std_logic;
  signal T_252 : std_logic;
  signal T_253 : std_logic;
  signal T_254 : std_logic;
  signal T_255 : std_logic;
  signal T_256 : std_logic;
  signal T_257 : std_logic;
  signal T_258 : std_logic;
  signal T_259 : std_logic;
  signal T_260 : std_logic;
  signal T_261 : std_logic;
  signal T_262 : std_logic;
  signal T_263 : std_logic;
  signal T_264 : std_logic;
  signal T_265 : std_logic;
  signal T_266 : std_logic;
  signal T_267 : std_logic;
  signal T_268 : std_logic;
  signal T_269 : std_logic;
  signal T_270 : std_logic;
  signal T_271 : std_logic;
  signal T_272 : std_logic;
  signal T_273 : std_logic;
  signal T_274 : std_logic;
  signal T_275 : std_logic;
  signal T_276 : std_logic;
  signal T_277 : std_logic;
  signal T_278 : std_logic;
  signal T_279 : std_logic;
  signal T_280 : std_logic;
  signal T_281 : std_logic;
  signal T_282 : std_logic;
  signal T_283 : std_logic;
  signal T_284 : std_logic;
  signal T_285 : std_logic;
  signal T_286 : std_logic;
  signal T_287 : std_logic;
  signal T_288 : std_logic;
  signal T_289 : std_logic;
  signal T_290 : std_logic;
  signal T_291 : std_logic;
  signal T_292 : std_logic;
  signal T_293 : std_logic;
  signal T_294 : std_logic;
  signal T_295 : std_logic;
  signal T_296 : std_logic;
  signal T_297 : std_logic;
  signal T_298 : std_logic;
  signal T_299 : std_logic;
  signal T_300 : std_logic;
  signal T_301 : std_logic;
  signal T_302 : std_logic;
  signal T_303 : std_logic;
  signal T_304 : std_logic;
  signal T_305 : std_logic;
  signal T_306 : std_logic;
  signal T_307 : std_logic;
  signal T_308 : std_logic;
  signal T_309 : std_logic;
  signal T_310 : std_logic;
  signal T_311 : std_logic;
  signal T_312 : std_logic;
  signal T_313 : std_logic;
  signal T_314 : std_logic;
  signal T_315 : std_logic;
  signal T_316 : std_logic;
  signal T_317 : std_logic;
  signal T_318 : std_logic;
  signal T_319 : std_logic;
  signal T_320 : std_logic;
  signal T_321 : std_logic;
  signal T_322 : std_logic;
  signal T_323 : std_logic;
  signal T_324 : std_logic;
  signal T_325 : std_logic;
  signal T_326 : std_logic;
  signal T_327 : std_logic;
  signal T_328 : std_logic;
  signal T_329 : std_logic;
  signal T_330 : std_logic;
  signal T_331 : std_logic;
  signal T_332 : std_logic;
  signal T_333 : std_logic;
  signal T_334 : std_logic;
  signal T_335 : std_logic;
  signal T_336 : std_logic;
  signal T_337 : std_logic;
  signal T_338 : std_logic;
  signal T_339 : std_logic;
  signal T_340 : std_logic;
  signal T_341 : std_logic;
  signal T_342 : std_logic;
  signal T_343 : std_logic;
  signal T_344 : std_logic;
  signal T_345 : std_logic;
  signal T_346 : std_logic;
  signal T_347 : std_logic;
  signal T_348 : std_logic;
  signal T_349 : std_logic;
  signal T_350 : std_logic;
  signal T_351 : std_logic;
  signal T_352 : std_logic;
  signal T_353 : std_logic;
  signal T_354 : std_logic;
  signal T_355 : std_logic;
  signal T_356 : std_logic;
  signal T_357 : std_logic;
  signal T_358 : std_logic;
  signal T_359 : std_logic;
  signal T_360 : std_logic;
  signal T_361 : std_logic;
  signal T_362 : std_logic;
  signal T_363 : std_logic;
  signal T_364 : std_logic;
  signal T_365 : std_logic;
  signal T_366 : std_logic;
  signal T_367 : std_logic;
  signal T_368 : std_logic;
  signal T_369 : std_logic;
  signal T_370 : std_logic;
  signal T_371 : std_logic;
  signal T_372 : std_logic;
  signal T_373 : std_logic;
  signal T_374 : std_logic;
  signal T_375 : std_logic;
  signal T_376 : std_logic;
  signal T_377 : std_logic;
  signal T_378 : std_logic;
  signal T_379 : std_logic;
  signal T_380 : std_logic;
  signal T_381 : std_logic;
  signal T_382 : std_logic;
  signal T_383 : std_logic;
  signal T_384 : std_logic;
  signal T_385 : std_logic;
  signal T_386 : std_logic;
  signal T_387 : std_logic;
  signal T_388 : std_logic;
  signal T_389 : std_logic;
  signal T_390 : std_logic;
  signal T_391 : std_logic;
  signal T_392 : std_logic;
  signal T_393 : std_logic;
  signal T_394 : std_logic;
  signal T_395 : std_logic;
  signal T_396 : std_logic;
  signal T_397 : std_logic;
  signal T_398 : std_logic;
  signal T_399 : std_logic;
  signal T_400 : std_logic;
  signal T_401 : std_logic;
  signal T_402 : std_logic;
  signal T_403 : std_logic;
  signal T_404 : std_logic;
  signal T_405 : std_logic;
  signal T_406 : std_logic;
  signal T_407 : std_logic;
  signal T_408 : std_logic;
  signal T_409 : std_logic;
  signal T_410 : std_logic;
  signal T_411 : std_logic;
  signal T_412 : std_logic;
  signal T_413 : std_logic;
  signal T_414 : std_logic;
  signal T_415 : std_logic;
  signal T_416 : std_logic;
  signal T_417 : std_logic;
  signal T_418 : std_logic;
  signal T_419 : std_logic;
  signal T_420 : std_logic;
  signal T_421 : std_logic;
  signal T_422 : std_logic;
  signal T_423 : std_logic;
  signal T_424 : std_logic;
  signal T_425 : std_logic;
  signal T_426 : std_logic;
  signal T_427 : std_logic;
  signal T_428 : std_logic;
  signal T_429 : std_logic;
  signal T_430 : std_logic;
  signal T_431 : std_logic;
  signal T_432 : std_logic;
  signal T_433 : std_logic;
  signal VCC_net : std_logic;
  signal GND_net : std_logic;
  signal GATE_SIZE_1_XA : std_logic;
  signal GATE_AHIGH_31X_OE_A : std_logic;
  signal GATE_AHIGH_31X_OE_B : std_logic;
  signal GATE_AS_030_OE_A : std_logic;
  signal GATE_AS_030_OE_B : std_logic;
  signal GATE_DS_030_OE_A : std_logic;
  signal GATE_DS_030_OE_B : std_logic;
  signal GATE_T_3_A : std_logic;
  signal GATE_T_4_A : std_logic;
  signal GATE_SIZE_0_XA : std_logic;
  signal GATE_AHIGH_30X_OE_A : std_logic;
  signal GATE_AHIGH_30X_OE_B : std_logic;
  signal GATE_AHIGH_29X_OE_A : std_logic;
  signal GATE_AHIGH_29X_OE_B : std_logic;
  signal GATE_AHIGH_28X_OE_A : std_logic;
  signal GATE_AHIGH_28X_OE_B : std_logic;
  signal GATE_AHIGH_27X_OE_A : std_logic;
  signal GATE_AHIGH_27X_OE_B : std_logic;
  signal GATE_AHIGH_26X_OE_A : std_logic;
  signal GATE_AHIGH_26X_OE_B : std_logic;
  signal GATE_AHIGH_25X_OE_A : std_logic;
  signal GATE_AHIGH_25X_OE_B : std_logic;
  signal GATE_AHIGH_24X_OE_A : std_logic;
  signal GATE_AHIGH_24X_OE_B : std_logic;
  signal GATE_CIIN_A : std_logic;
  signal GATE_BGACK_030_D_B : std_logic;
  signal GATE_BGACK_030_D_A : std_logic;
  signal GATE_RW_OE_A : std_logic;
  signal GATE_A_0X_D_B : std_logic;
  signal GATE_A_0X_D_A : std_logic;
  signal GATE_A_0X_OE_A : std_logic;
  signal GATE_A_0X_OE_B : std_logic;
  signal GATE_cpu_est_2_bus_D_X1_A : std_logic;
  signal GATE_T_16_A : std_logic;
  signal GATE_T_18_A : std_logic;
  signal GATE_inst_AS_000_DMA_D_C : std_logic;
  signal GATE_inst_AS_000_DMA_D_B : std_logic;
  signal GATE_inst_AS_000_DMA_D_A : std_logic;
  signal GATE_SIZE_DMA_1_bus_D_B : std_logic;
  signal GATE_SIZE_DMA_1_bus_D_A : std_logic;
  signal GATE_T_20_A : std_logic;
  signal GATE_inst_LDS_000_INT_D_B : std_logic;
  signal GATE_inst_LDS_000_INT_D_A : std_logic;
  signal GATE_T_22_A : std_logic;
  signal GATE_T_23_A : std_logic;
  signal GATE_T_24_A : std_logic;
  signal GATE_T_25_A : std_logic;
  signal GATE_T_34_A : std_logic;
  signal GATE_T_35_A : std_logic;
  signal GATE_T_36_A : std_logic;
  signal GATE_T_37_A : std_logic;
  signal GATE_T_38_A : std_logic;
  signal GATE_T_39_A : std_logic;
  signal GATE_T_42_A : std_logic;
  signal GATE_T_43_A : std_logic;
  signal GATE_T_44_A : std_logic;
  signal GATE_T_45_A : std_logic;
  signal GATE_T_48_A : std_logic;
  signal GATE_T_51_A : std_logic;
  signal GATE_T_52_A : std_logic;
  signal GATE_T_54_A : std_logic;
  signal GATE_T_55_A : std_logic;
  signal GATE_T_60_A : std_logic;
  signal GATE_T_61_A : std_logic;
  signal GATE_T_62_A : std_logic;
  signal GATE_T_63_A : std_logic;
  signal GATE_T_67_B : std_logic;
  signal GATE_T_67_A : std_logic;
  signal GATE_T_69_A : std_logic;
  signal GATE_T_70_A : std_logic;
  signal GATE_T_72_A : std_logic;
  signal GATE_T_73_A : std_logic;
  signal GATE_T_75_A : std_logic;
  signal GATE_T_82_A : std_logic;
  signal GATE_T_83_A : std_logic;
  signal GATE_T_84_A : std_logic;
  signal GATE_T_84_B : std_logic;
  signal GATE_T_87_B : std_logic;
  signal GATE_T_87_A : std_logic;
  signal GATE_T_88_A : std_logic;
  signal GATE_T_89_A : std_logic;
  signal GATE_T_90_A : std_logic;
  signal GATE_T_90_B : std_logic;
  signal GATE_T_93_DN : std_logic;
  signal GATE_T_94_A : std_logic;
  signal GATE_T_95_A : std_logic;
  signal GATE_T_96_A : std_logic;
  signal GATE_T_97_A : std_logic;
  signal GATE_T_98_A : std_logic;
  signal GATE_T_99_A : std_logic;
  signal GATE_T_101_A : std_logic;
  signal GATE_T_102_A : std_logic;
  signal GATE_T_103_A : std_logic;
  signal GATE_T_104_A : std_logic;
  signal GATE_T_104_B : std_logic;
  signal GATE_T_105_A : std_logic;
  signal GATE_T_105_B : std_logic;
  signal GATE_T_112_A : std_logic;
  signal GATE_T_119_B : std_logic;
  signal GATE_T_119_A : std_logic;
  signal GATE_T_120_A : std_logic;
  signal GATE_T_121_A : std_logic;
  signal GATE_T_122_B : std_logic;
  signal GATE_T_122_A : std_logic;
  signal GATE_T_123_A : std_logic;
  signal GATE_T_124_A : std_logic;
  signal GATE_T_126_A : std_logic;
  signal GATE_T_127_A : std_logic;
  signal GATE_T_128_A : std_logic;
  signal GATE_T_128_B : std_logic;
  signal GATE_T_130_A : std_logic;
  signal GATE_T_131_A : std_logic;
  signal GATE_T_132_A : std_logic;
  signal GATE_T_132_B : std_logic;
  signal GATE_T_134_A : std_logic;
  signal GATE_T_135_A : std_logic;
  signal GATE_T_136_A : std_logic;
  signal GATE_T_139_B : std_logic;
  signal GATE_T_139_A : std_logic;
  signal GATE_T_140_B : std_logic;
  signal GATE_T_140_A : std_logic;
  signal GATE_T_141_B : std_logic;
  signal GATE_T_141_A : std_logic;
  signal GATE_T_142_B : std_logic;
  signal GATE_T_142_A : std_logic;
  signal GATE_T_143_A : std_logic;
  signal GATE_T_143_B : std_logic;
  signal GATE_T_144_A : std_logic;
  signal GATE_T_144_B : std_logic;
  signal GATE_T_145_A : std_logic;
  signal GATE_T_146_A : std_logic;
  signal GATE_T_149_B : std_logic;
  signal GATE_T_149_A : std_logic;
  signal GATE_T_150_B : std_logic;
  signal GATE_T_150_A : std_logic;
  signal GATE_T_151_B : std_logic;
  signal GATE_T_151_A : std_logic;
  signal GATE_T_152_B : std_logic;
  signal GATE_T_152_A : std_logic;
  signal GATE_T_153_A : std_logic;
  signal GATE_T_153_B : std_logic;
  signal GATE_T_154_A : std_logic;
  signal GATE_T_154_B : std_logic;
  signal GATE_T_156_A : std_logic;
  signal GATE_T_157_A : std_logic;
  signal GATE_T_158_A : std_logic;
  signal GATE_T_158_B : std_logic;
  signal GATE_T_164_B : std_logic;
  signal GATE_T_164_A : std_logic;
  signal GATE_T_165_A : std_logic;
  signal GATE_T_166_A : std_logic;
  signal GATE_T_167_A : std_logic;
  signal GATE_T_170_A : std_logic;
  signal GATE_T_170_B : std_logic;
  signal GATE_T_171_A : std_logic;
  signal GATE_T_173_B : std_logic;
  signal GATE_T_173_A : std_logic;
  signal GATE_T_174_A : std_logic;
  signal GATE_T_175_A : std_logic;
  signal GATE_T_176_A : std_logic;
  signal GATE_T_177_A : std_logic;
  signal GATE_T_178_A : std_logic;
  signal GATE_T_179_B : std_logic;
  signal GATE_T_179_A : std_logic;
  signal GATE_T_180_B : std_logic;
  signal GATE_T_180_A : std_logic;
  signal GATE_T_181_B : std_logic;
  signal GATE_T_181_A : std_logic;
  signal GATE_T_182_B : std_logic;
  signal GATE_T_182_A : std_logic;
  signal GATE_T_183_A : std_logic;
  signal GATE_T_183_B : std_logic;
  signal GATE_T_184_A : std_logic;
  signal GATE_T_184_B : std_logic;
  signal GATE_T_185_A : std_logic;
  signal GATE_T_186_A : std_logic;
  signal GATE_T_188_DN : std_logic;
  signal GATE_T_189_A : std_logic;
  signal GATE_T_190_A : std_logic;
  signal GATE_T_190_B : std_logic;
  signal GATE_T_191_A : std_logic;
  signal GATE_T_196_A : std_logic;
  signal GATE_T_198_A : std_logic;
  signal GATE_T_199_A : std_logic;
  signal GATE_T_201_A : std_logic;
  signal GATE_T_204_A : std_logic;
  signal GATE_T_205_A : std_logic;
  signal GATE_T_206_A : std_logic;
  signal GATE_T_210_A : std_logic;
  signal GATE_T_213_A : std_logic;
  signal GATE_T_213_B : std_logic;
  signal GATE_T_216_A : std_logic;
  signal GATE_T_219_A : std_logic;
  signal GATE_T_219_B : std_logic;
  signal GATE_T_222_A : std_logic;
  signal GATE_T_223_A : std_logic;
  signal GATE_T_224_A : std_logic;
  signal GATE_T_224_B : std_logic;
  signal GATE_T_226_A : std_logic;
  signal GATE_T_229_A : std_logic;
  signal GATE_T_229_B : std_logic;
  signal GATE_T_230_A : std_logic;
  signal GATE_T_232_A : std_logic;
  signal GATE_T_234_A : std_logic;
  signal GATE_T_235_A : std_logic;
  signal GATE_T_236_A : std_logic;
  signal GATE_T_239_A : std_logic;
  signal GATE_T_239_B : std_logic;
  signal GATE_T_241_A : std_logic;
  signal GATE_T_242_A : std_logic;
  signal GATE_T_244_A : std_logic;
  signal GATE_T_246_A : std_logic;
  signal GATE_T_247_A : std_logic;
  signal GATE_T_249_A : std_logic;
  signal GATE_T_249_B : std_logic;
  signal GATE_T_251_A : std_logic;
  signal GATE_T_256_A : std_logic;
  signal GATE_T_257_A : std_logic;
  signal GATE_T_258_A : std_logic;
  signal GATE_T_259_A : std_logic;
  signal GATE_T_260_A : std_logic;
  signal GATE_T_261_A : std_logic;
  signal GATE_T_262_A : std_logic;
  signal GATE_T_263_A : std_logic;
  signal GATE_T_264_A : std_logic;
  signal GATE_T_265_A : std_logic;
  signal GATE_T_266_A : std_logic;
  signal GATE_T_267_A : std_logic;
  signal GATE_T_269_A : std_logic;
  signal GATE_T_271_A : std_logic;
  signal GATE_T_273_A : std_logic;
  signal GATE_T_275_A : std_logic;
  signal GATE_T_277_A : std_logic;
  signal GATE_T_279_A : std_logic;
  signal GATE_T_281_A : std_logic;
  signal GATE_T_283_A : std_logic;
  signal GATE_T_284_A : std_logic;
  signal GATE_T_289_A : std_logic;
  signal GATE_T_291_A : std_logic;
  signal GATE_T_293_A : std_logic;
  signal GATE_T_295_A : std_logic;
  signal GATE_T_297_A : std_logic;
  signal GATE_T_298_A : std_logic;
  signal GATE_T_299_A : std_logic;
  signal GATE_T_300_A : std_logic;
  signal GATE_T_301_A : std_logic;
  signal GATE_T_303_A : std_logic;
  signal GATE_T_305_A : std_logic;
  signal GATE_T_306_A : std_logic;
  signal GATE_T_308_A : std_logic;
  signal GATE_T_309_A : std_logic;
  signal GATE_T_310_A : std_logic;
  signal GATE_T_311_A : std_logic;
  signal GATE_T_312_A : std_logic;
  signal GATE_T_313_A : std_logic;
  signal GATE_T_315_A : std_logic;
  signal GATE_T_316_A : std_logic;
  signal GATE_T_317_A : std_logic;
  signal GATE_T_318_A : std_logic;
  signal GATE_T_320_A : std_logic;
  signal GATE_T_321_B : std_logic;
  signal GATE_T_321_A : std_logic;
  signal GATE_T_330_A : std_logic;
  signal GATE_T_331_A : std_logic;
  signal GATE_T_333_A : std_logic;
  signal GATE_T_334_A : std_logic;
  signal GATE_T_335_A : std_logic;
  signal GATE_T_338_A : std_logic;
  signal GATE_T_339_A : std_logic;
  signal GATE_T_342_A : std_logic;
  signal GATE_T_343_A : std_logic;
  signal GATE_T_344_A : std_logic;
  signal GATE_T_346_A : std_logic;
  signal GATE_T_347_A : std_logic;
  signal GATE_T_350_A : std_logic;
  signal GATE_T_351_A : std_logic;
  signal GATE_T_352_A : std_logic;
  signal GATE_T_354_A : std_logic;
  signal GATE_T_355_A : std_logic;
  signal GATE_T_361_A : std_logic;
  signal GATE_T_362_A : std_logic;
  signal GATE_T_367_A : std_logic;
  signal GATE_T_368_A : std_logic;
  signal GATE_T_369_A : std_logic;
  signal GATE_T_372_A : std_logic;
  signal GATE_T_376_A : std_logic;
  signal GATE_T_377_A : std_logic;
  signal GATE_T_382_A : std_logic;
  signal GATE_T_383_A : std_logic;
  signal GATE_T_384_A : std_logic;
  signal GATE_T_387_A : std_logic;
  signal GATE_T_391_A : std_logic;
  signal GATE_T_391_B : std_logic;
  signal GATE_T_392_A : std_logic;
  signal GATE_T_393_A : std_logic;
  signal GATE_T_396_A : std_logic;
  signal GATE_T_397_A : std_logic;
  signal GATE_T_398_A : std_logic;
  signal GATE_T_401_A : std_logic;
  signal GATE_T_403_A : std_logic;
  signal GATE_T_404_A : std_logic;
  signal GATE_T_406_A : std_logic;
  signal GATE_T_412_A : std_logic;
  signal GATE_T_413_A : std_logic;
  signal GATE_T_414_A : std_logic;
  signal GATE_T_415_A : std_logic;
  signal GATE_T_416_A : std_logic;
  signal GATE_T_417_A : std_logic;
  signal GATE_T_418_A : std_logic;
  signal GATE_T_421_A : std_logic;
  signal GATE_T_428_A : std_logic;
  signal GATE_T_428_B : std_logic;
  signal GATE_T_429_A : std_logic;
  signal GATE_T_429_B : std_logic;
  signal GATE_T_430_A : std_logic;
  signal GATE_T_431_A : std_logic;
  signal GATE_T_431_B : std_logic;
  signal GATE_T_432_A : std_logic;
  signal GATE_T_432_B : std_logic;

begin
  VCC_I_I_1:   VCC port map ( X=>VCC_net );
  GND_I_I_1:   GND port map ( X=>GND_net );
  OUT_SIZE_1_XI_1:   BI_DIR
 generic map( PULL => "Up")
 port map ( O=>SIZE_1XPIN, 
            I0=>SIZE_1XCOM, 
            IO=>SIZE(1), 
            OE=>SIZE_1X_OE );
  OUT_AHIGH_31_XI_1:   BI_DIR
 generic map( PULL => "Up")
 port map ( O=>AHIGH_31XPIN, 
            I0=>GND_net, 
            IO=>AHIGH(31), 
            OE=>AHIGH_31X_OE );
  IN_A_DECODE_23_XI_1:   IBUF
 generic map( PULL => "Up")
 port map ( O=>A_DECODE_23XPIN, 
            I0=>A_DECODE(23) );
  IN_IPL_2_XI_1:   IBUF
 generic map( PULL => "Up")
 port map ( O=>IPL_2XPIN, 
            I0=>IPL(2) );
  IN_FC_1_XI_1:   IBUF
 generic map( PULL => "Up")
 port map ( O=>FC_1XPIN, 
            I0=>FC(1) );
  OUT_AS_030_I_1:   BI_DIR
 generic map( PULL => "Up")
 port map ( O=>AS_030PIN, 
            I0=>AS_030COM, 
            IO=>AS_030, 
            OE=>AS_030_OE );
  OUT_AS_000_I_1:   BI_DIR
 generic map( PULL => "Up")
 port map ( O=>AS_000PIN, 
            I0=>AS_000COM, 
            IO=>AS_000, 
            OE=>AS_000_OE );
  OUT_DS_030_I_1:   BUFTH port map ( I0=>DS_030COM, 
            O=>DS_030, 
            OE=>DS_030_OE );
  OUT_UDS_000_I_1:   BI_DIR
 generic map( PULL => "Up")
 port map ( O=>UDS_000PIN, 
            I0=>UDS_000COM, 
            IO=>UDS_000, 
            OE=>UDS_000_OE );
  OUT_LDS_000_I_1:   BI_DIR
 generic map( PULL => "Up")
 port map ( O=>LDS_000PIN, 
            I0=>LDS_000COM, 
            IO=>LDS_000, 
            OE=>LDS_000_OE );
  IN_nEXP_SPACE_I_1:   IBUF
 generic map( PULL => "Up")
 port map ( O=>nEXP_SPACEPIN, 
            I0=>nEXP_SPACE );
  OUT_SIZE_0_XI_1:   BI_DIR
 generic map( PULL => "Up")
 port map ( O=>SIZE_0XPIN, 
            I0=>SIZE_0XCOM, 
            IO=>SIZE(0), 
            OE=>SIZE_0X_OE );
  OUT_BERR_I_1:   BI_DIR
 generic map( PULL => "Up")
 port map ( O=>BERRPIN, 
            I0=>GND_net, 
            IO=>BERR, 
            OE=>BERR_OE );
  OUT_AHIGH_30_XI_1:   BI_DIR
 generic map( PULL => "Up")
 port map ( O=>AHIGH_30XPIN, 
            I0=>GND_net, 
            IO=>AHIGH(30), 
            OE=>AHIGH_30X_OE );
  IN_BG_030_I_1:   IBUF
 generic map( PULL => "Up")
 port map ( O=>BG_030PIN, 
            I0=>BG_030 );
  OUT_AHIGH_29_XI_1:   BI_DIR
 generic map( PULL => "Up")
 port map ( O=>AHIGH_29XPIN, 
            I0=>GND_net, 
            IO=>AHIGH(29), 
            OE=>AHIGH_29X_OE );
  OUT_AHIGH_28_XI_1:   BI_DIR
 generic map( PULL => "Up")
 port map ( O=>AHIGH_28XPIN, 
            I0=>GND_net, 
            IO=>AHIGH(28), 
            OE=>AHIGH_28X_OE );
  OUT_AHIGH_27_XI_1:   BI_DIR
 generic map( PULL => "Up")
 port map ( O=>AHIGH_27XPIN, 
            I0=>GND_net, 
            IO=>AHIGH(27), 
            OE=>AHIGH_27X_OE );
  IN_BGACK_000_I_1:   IBUF
 generic map( PULL => "Up")
 port map ( O=>BGACK_000PIN, 
            I0=>BGACK_000 );
  OUT_AHIGH_26_XI_1:   BI_DIR
 generic map( PULL => "Up")
 port map ( O=>AHIGH_26XPIN, 
            I0=>GND_net, 
            IO=>AHIGH(26), 
            OE=>AHIGH_26X_OE );
  IN_CLK_030_I_1:   IBUF
 generic map( PULL => "Up")
 port map ( O=>CLK_030PIN, 
            I0=>CLK_030 );
  OUT_AHIGH_25_XI_1:   BI_DIR
 generic map( PULL => "Up")
 port map ( O=>AHIGH_25XPIN, 
            I0=>GND_net, 
            IO=>AHIGH(25), 
            OE=>AHIGH_25X_OE );
  IN_CLK_000_I_1:   IBUF
 generic map( PULL => "Up")
 port map ( O=>CLK_000PIN, 
            I0=>CLK_000 );
  OUT_AHIGH_24_XI_1:   BI_DIR
 generic map( PULL => "Up")
 port map ( O=>AHIGH_24XPIN, 
            I0=>GND_net, 
            IO=>AHIGH(24), 
            OE=>AHIGH_24X_OE );
  IN_CLK_OSZI_I_1:   IBUF
 generic map( PULL => "Up")
 port map ( O=>CLK_OSZIPIN, 
            I0=>CLK_OSZI );
  IN_A_DECODE_22_XI_1:   IBUF
 generic map( PULL => "Up")
 port map ( O=>A_DECODE_22XPIN, 
            I0=>A_DECODE(22) );
  OUT_CLK_DIV_OUT_I_1:   OBUF port map ( O=>CLK_DIV_OUT, 
            I0=>CLK_DIV_OUTQ );
  IN_A_DECODE_21_XI_1:   IBUF
 generic map( PULL => "Up")
 port map ( O=>A_DECODE_21XPIN, 
            I0=>A_DECODE(21) );
  IN_A_DECODE_20_XI_1:   IBUF
 generic map( PULL => "Up")
 port map ( O=>A_DECODE_20XPIN, 
            I0=>A_DECODE(20) );
  OUT_FPU_CS_I_1:   OBUF port map ( O=>FPU_CS, 
            I0=>FPU_CSCOM );
  IN_A_DECODE_19_XI_1:   IBUF
 generic map( PULL => "Up")
 port map ( O=>A_DECODE_19XPIN, 
            I0=>A_DECODE(19) );
  IN_FPU_SENSE_I_1:   IBUF
 generic map( PULL => "Up")
 port map ( O=>FPU_SENSEPIN, 
            I0=>FPU_SENSE );
  IN_A_DECODE_18_XI_1:   IBUF
 generic map( PULL => "Up")
 port map ( O=>A_DECODE_18XPIN, 
            I0=>A_DECODE(18) );
  IN_A_DECODE_17_XI_1:   IBUF
 generic map( PULL => "Up")
 port map ( O=>A_DECODE_17XPIN, 
            I0=>A_DECODE(17) );
  IN_DTACK_I_1:   IBUF
 generic map( PULL => "Up")
 port map ( O=>DTACKPIN, 
            I0=>DTACK );
  IN_A_DECODE_16_XI_1:   IBUF
 generic map( PULL => "Up")
 port map ( O=>A_DECODE_16XPIN, 
            I0=>A_DECODE(16) );
  OUT_AVEC_I_1:   OBUF port map ( O=>AVEC, 
            I0=>VCC_net );
  OUT_E_I_1:   OBUF port map ( O=>E, 
            I0=>ECOM );
  IN_VPA_I_1:   IBUF
 generic map( PULL => "Up")
 port map ( O=>VPAPIN, 
            I0=>VPA );
  IN_RST_I_1:   IBUF
 generic map( PULL => "Up")
 port map ( O=>RSTPIN, 
            I0=>RST );
  OUT_RESET_I_1:   BUFTH port map ( I0=>GND_net, 
            O=>RESET, 
            OE=>RESET_OE );
  OUT_AMIGA_ADDR_ENABLE_I_1:   OBUF port map ( O=>AMIGA_ADDR_ENABLE, 
            I0=>GND_net );
  OUT_AMIGA_BUS_DATA_DIR_I_1:   OBUF port map ( O=>AMIGA_BUS_DATA_DIR, 
            I0=>AMIGA_BUS_DATA_DIRCOM );
  OUT_AMIGA_BUS_ENABLE_LOW_I_1:   OBUF port map ( O=>AMIGA_BUS_ENABLE_LOW, 
            I0=>AMIGA_BUS_ENABLE_LOWCOM );
  OUT_AMIGA_BUS_ENABLE_HIGH_I_1:   OBUF port map ( O=>AMIGA_BUS_ENABLE_HIGH, 
            I0=>AMIGA_BUS_ENABLE_HIGHCOM );
  OUT_CIIN_I_1:   BUFTH port map ( I0=>CIINCOM, 
            O=>CIIN, 
            OE=>CIIN_OE );
  IN_IPL_1_XI_1:   IBUF
 generic map( PULL => "Up")
 port map ( O=>IPL_1XPIN, 
            I0=>IPL(1) );
  IN_IPL_0_XI_1:   IBUF
 generic map( PULL => "Up")
 port map ( O=>IPL_0XPIN, 
            I0=>IPL(0) );
  IN_FC_0_XI_1:   IBUF
 generic map( PULL => "Up")
 port map ( O=>FC_0XPIN, 
            I0=>FC(0) );
  IN_A_1_XI_1:   IBUF
 generic map( PULL => "Up")
 port map ( O=>A_1XPIN, 
            I0=>A(1) );
  OUT_IPL_030_2_XI_1:   OBUF port map ( O=>IPL_030(2), 
            I0=>IPL_030_2XQ );
  OUT_RW_000_I_1:   BI_DIR
 generic map( PULL => "Up")
 port map ( O=>RW_000PIN, 
            I0=>RW_000Q, 
            IO=>RW_000, 
            OE=>RW_000_OE );
  OUT_BG_000_I_1:   OBUF port map ( O=>BG_000, 
            I0=>BG_000Q );
  OUT_BGACK_030_I_1:   OBUF port map ( O=>BGACK_030, 
            I0=>BGACK_030Q );
  OUT_CLK_EXP_I_1:   OBUF port map ( O=>CLK_EXP, 
            I0=>CLK_EXPQ );
  OUT_DSACK1_I_1:   BUFTH port map ( I0=>DSACK1Q, 
            O=>DSACK1, 
            OE=>nEXP_SPACEPIN );
  OUT_VMA_I_1:   OBUF port map ( O=>VMA, 
            I0=>VMAQ );
  OUT_RW_I_1:   BI_DIR
 generic map( PULL => "Up")
 port map ( O=>RWPIN, 
            I0=>RWQ, 
            IO=>RW, 
            OE=>RW_OE );
  OUT_A_0_XI_1:   BI_DIR
 generic map( PULL => "Up")
 port map ( O=>A_0XPIN, 
            I0=>A_0XQ, 
            IO=>A(0), 
            OE=>A_0X_OE );
  OUT_IPL_030_1_XI_1:   OBUF port map ( O=>IPL_030(1), 
            I0=>IPL_030_1XQ );
  OUT_IPL_030_0_XI_1:   OBUF port map ( O=>IPL_030(0), 
            I0=>IPL_030_0XQ );
  FF_CLK_DIV_OUT_I_1:   DFF port map ( D=>inst_CLK_OUT_PRE_DQ, 
            Q=>CLK_DIV_OUTQ, 
            CLK=>CLK_OSZIPIN );
  FF_IPL_030_2_XI_1:   DFF port map ( D=>IPL_030_2X_D, 
            Q=>IPL_030_2XQ, 
            CLK=>CLK_OSZIPIN );
  FF_RW_000_I_1:   DFF port map ( D=>RW_000_D, 
            Q=>RW_000Q, 
            CLK=>CLK_OSZIPIN );
  FF_BG_000_I_1:   DFF port map ( D=>BG_000_D, 
            Q=>BG_000Q, 
            CLK=>CLK_OSZIPIN );
  FF_BGACK_030_I_1:   DFF port map ( D=>BGACK_030_D, 
            Q=>BGACK_030Q, 
            CLK=>CLK_OSZIPIN );
  FF_CLK_EXP_I_1:   DFF port map ( D=>inst_CLK_OUT_PRE_DQ, 
            Q=>CLK_EXPQ, 
            CLK=>CLK_OSZIPIN );
  FF_DSACK1_I_1:   DFF port map ( D=>DSACK1_D, 
            Q=>DSACK1Q, 
            CLK=>CLK_OSZIPIN );
  FF_VMA_I_1:   TFF port map ( T=>VMA_T, 
            Q=>VMAQ, 
            CLK=>CLK_OSZIPIN );
  FF_RW_I_1:   DFF port map ( D=>RW_D, 
            Q=>RWQ, 
            CLK=>CLK_OSZIPIN );
  FF_A_0_XI_1:   DFF port map ( D=>A_0X_D, 
            Q=>A_0XQ, 
            CLK=>CLK_OSZIPIN );
  FF_IPL_030_1_XI_1:   DFF port map ( D=>IPL_030_1X_D, 
            Q=>IPL_030_1XQ, 
            CLK=>CLK_OSZIPIN );
  FF_IPL_030_0_XI_1:   DFF port map ( D=>IPL_030_0X_D, 
            Q=>IPL_030_0XQ, 
            CLK=>CLK_OSZIPIN );
  FF_cpu_est_3_bus_I_1:   DFF port map ( D=>cpu_est_3_bus_D, 
            Q=>cpu_est_3_busQ, 
            CLK=>CLK_OSZIPIN );
  FF_cpu_est_0_bus_I_1:   DFF port map ( D=>cpu_est_0_bus_D, 
            Q=>cpu_est_0_busQ, 
            CLK=>CLK_OSZIPIN );
  FF_cpu_est_1_bus_I_1:   DFF port map ( D=>cpu_est_1_bus_D, 
            Q=>cpu_est_1_busQ, 
            CLK=>CLK_OSZIPIN );
  FF_cpu_est_2_bus_I_1:   DFF port map ( D=>cpu_est_2_bus_D, 
            Q=>cpu_est_2_busQ, 
            CLK=>CLK_OSZIPIN );
  FF_inst_AS_000_INT_I_1:   DFF port map ( D=>inst_AS_000_INT_D, 
            Q=>inst_AS_000_INTQ, 
            CLK=>CLK_OSZIPIN );
  FF_inst_AMIGA_BUS_ENABLE_DMA_LOW_I_1:   DFF port map ( D=>inst_AMIGA_BUS_ENABLE_DMA_LOW_D, 
            Q=>inst_AMIGA_BUS_ENABLE_DMA_LOWQ, 
            CLK=>CLK_OSZIPIN );
  FF_inst_AS_030_D0_I_1:   DFF port map ( D=>inst_AS_030_D0_D, 
            Q=>inst_AS_030_D0Q, 
            CLK=>CLK_OSZIPIN );
  FF_inst_AS_030_000_SYNC_I_1:   DFF port map ( D=>inst_AS_030_000_SYNC_D, 
            Q=>inst_AS_030_000_SYNCQ, 
            CLK=>CLK_OSZIPIN );
  FF_inst_BGACK_030_INT_D_I_1:   DFF port map ( D=>inst_BGACK_030_INT_D_D, 
            Q=>inst_BGACK_030_INT_DQ, 
            CLK=>CLK_OSZIPIN );
  FF_inst_AS_000_DMA_I_1:   DFF port map ( D=>inst_AS_000_DMA_D, 
            Q=>inst_AS_000_DMAQ, 
            CLK=>CLK_OSZIPIN );
  FF_inst_DS_000_DMA_I_1:   DFF port map ( D=>inst_DS_000_DMA_D, 
            Q=>inst_DS_000_DMAQ, 
            CLK=>CLK_OSZIPIN );
  FF_CYCLE_DMA_0_bus_I_1:   DFF port map ( D=>CYCLE_DMA_0_bus_D, 
            Q=>CYCLE_DMA_0_busQ, 
            CLK=>CLK_OSZIPIN );
  FF_CYCLE_DMA_1_bus_I_1:   DFF port map ( D=>CYCLE_DMA_1_bus_D, 
            Q=>CYCLE_DMA_1_busQ, 
            CLK=>CLK_OSZIPIN );
  FF_SIZE_DMA_0_bus_I_1:   DFF port map ( D=>SIZE_DMA_0_bus_D, 
            Q=>SIZE_DMA_0_busQ, 
            CLK=>CLK_OSZIPIN );
  FF_SIZE_DMA_1_bus_I_1:   DFF port map ( D=>SIZE_DMA_1_bus_D, 
            Q=>SIZE_DMA_1_busQ, 
            CLK=>CLK_OSZIPIN );
  FF_inst_VPA_D_I_1:   DFF port map ( D=>inst_VPA_D_D, 
            Q=>inst_VPA_DQ, 
            CLK=>CLK_OSZIPIN );
  FF_inst_UDS_000_INT_I_1:   DFF port map ( D=>inst_UDS_000_INT_D, 
            Q=>inst_UDS_000_INTQ, 
            CLK=>CLK_OSZIPIN );
  FF_inst_LDS_000_INT_I_1:   DFF port map ( D=>inst_LDS_000_INT_D, 
            Q=>inst_LDS_000_INTQ, 
            CLK=>CLK_OSZIPIN );
  FF_inst_CLK_OUT_PRE_D_I_1:   DFF port map ( D=>inst_CLK_OUT_PRE_25Q, 
            Q=>inst_CLK_OUT_PRE_DQ, 
            CLK=>CLK_OSZIPIN );
  FF_CLK_000_D_6_bus_I_1:   DFF port map ( D=>CLK_000_D_5_busQ, 
            Q=>CLK_000_D_6_busQ, 
            CLK=>CLK_OSZIPIN );
  FF_CLK_000_D_7_bus_I_1:   DFF port map ( D=>CLK_000_D_6_busQ, 
            Q=>CLK_000_D_7_busQ, 
            CLK=>CLK_OSZIPIN );
  FF_inst_DTACK_D0_I_1:   DFF port map ( D=>inst_DTACK_D0_D, 
            Q=>inst_DTACK_D0Q, 
            CLK=>CLK_OSZIPIN );
  FF_inst_RESET_OUT_I_1:   DFF port map ( D=>inst_RESET_OUT_D, 
            Q=>inst_RESET_OUTQ, 
            CLK=>CLK_OSZIPIN );
  FF_CLK_000_D_1_bus_I_1:   DFF port map ( D=>CLK_000_D_0_busQ, 
            Q=>CLK_000_D_1_busQ, 
            CLK=>CLK_OSZIPIN );
  FF_CLK_000_D_0_bus_I_1:   DFF port map ( D=>CLK_000PIN, 
            Q=>CLK_000_D_0_busQ, 
            CLK=>CLK_OSZIPIN );
  FF_inst_CLK_OUT_PRE_50_I_1:   DFF port map ( D=>inst_CLK_OUT_PRE_50_D, 
            Q=>inst_CLK_OUT_PRE_50Q, 
            CLK=>CLK_OSZIPIN );
  FF_inst_CLK_OUT_PRE_25_I_1:   DFF port map ( D=>inst_CLK_OUT_PRE_25_D, 
            Q=>inst_CLK_OUT_PRE_25Q, 
            CLK=>CLK_OSZIPIN );
  FF_IPL_D0_0_bus_I_1:   DFF port map ( D=>IPL_D0_0_bus_D, 
            Q=>IPL_D0_0_busQ, 
            CLK=>CLK_OSZIPIN );
  FF_IPL_D0_1_bus_I_1:   DFF port map ( D=>IPL_D0_1_bus_D, 
            Q=>IPL_D0_1_busQ, 
            CLK=>CLK_OSZIPIN );
  FF_IPL_D0_2_bus_I_1:   DFF port map ( D=>IPL_D0_2_bus_D, 
            Q=>IPL_D0_2_busQ, 
            CLK=>CLK_OSZIPIN );
  FF_CLK_000_D_2_bus_I_1:   DFF port map ( D=>CLK_000_D_1_busQ, 
            Q=>CLK_000_D_2_busQ, 
            CLK=>CLK_OSZIPIN );
  FF_CLK_000_D_3_bus_I_1:   DFF port map ( D=>CLK_000_D_2_busQ, 
            Q=>CLK_000_D_3_busQ, 
            CLK=>CLK_OSZIPIN );
  FF_CLK_000_D_4_bus_I_1:   DFF port map ( D=>CLK_000_D_3_busQ, 
            Q=>CLK_000_D_4_busQ, 
            CLK=>CLK_OSZIPIN );
  FF_CLK_000_D_5_bus_I_1:   DFF port map ( D=>CLK_000_D_4_busQ, 
            Q=>CLK_000_D_5_busQ, 
            CLK=>CLK_OSZIPIN );
  FF_CLK_000_D_8_bus_I_1:   DFF port map ( D=>CLK_000_D_7_busQ, 
            Q=>CLK_000_D_8_busQ, 
            CLK=>CLK_OSZIPIN );
  FF_inst_AMIGA_BUS_ENABLE_DMA_HIGH_I_1:   DFF port map ( D=>inst_AMIGA_BUS_ENABLE_DMA_HIGH_D, 
            Q=>inst_AMIGA_BUS_ENABLE_DMA_HIGHQ, 
            CLK=>CLK_OSZIPIN );
  FF_inst_DS_000_ENABLE_I_1:   DFF port map ( D=>inst_DS_000_ENABLE_D, 
            Q=>inst_DS_000_ENABLEQ, 
            CLK=>CLK_OSZIPIN );
  FF_SM_AMIGA_6_bus_I_1:   DFF port map ( D=>SM_AMIGA_6_bus_D, 
            Q=>SM_AMIGA_6_busQ, 
            CLK=>CLK_OSZIPIN );
  FF_SM_AMIGA_0_bus_I_1:   DFF port map ( D=>SM_AMIGA_0_bus_D, 
            Q=>SM_AMIGA_0_busQ, 
            CLK=>CLK_OSZIPIN );
  FF_SM_AMIGA_4_bus_I_1:   DFF port map ( D=>SM_AMIGA_4_bus_D, 
            Q=>SM_AMIGA_4_busQ, 
            CLK=>CLK_OSZIPIN );
  FF_RST_DLY_0_bus_I_1:   DFF port map ( D=>RST_DLY_0_bus_D, 
            Q=>RST_DLY_0_busQ, 
            CLK=>CLK_OSZIPIN );
  FF_RST_DLY_1_bus_I_1:   DFF port map ( D=>RST_DLY_1_bus_D, 
            Q=>RST_DLY_1_busQ, 
            CLK=>CLK_OSZIPIN );
  FF_RST_DLY_2_bus_I_1:   DFF port map ( D=>RST_DLY_2_bus_D, 
            Q=>RST_DLY_2_busQ, 
            CLK=>CLK_OSZIPIN );
  FF_inst_CLK_030_H_I_1:   DFF port map ( D=>inst_CLK_030_H_D, 
            Q=>inst_CLK_030_HQ, 
            CLK=>CLK_OSZIPIN );
  FF_SM_AMIGA_1_bus_I_1:   DFF port map ( D=>SM_AMIGA_1_bus_D, 
            Q=>SM_AMIGA_1_busQ, 
            CLK=>CLK_OSZIPIN );
  FF_SM_AMIGA_5_bus_I_1:   DFF port map ( D=>SM_AMIGA_5_bus_D, 
            Q=>SM_AMIGA_5_busQ, 
            CLK=>CLK_OSZIPIN );
  FF_SM_AMIGA_3_bus_I_1:   DFF port map ( D=>SM_AMIGA_3_bus_D, 
            Q=>SM_AMIGA_3_busQ, 
            CLK=>CLK_OSZIPIN );
  FF_SM_AMIGA_2_bus_I_1:   DFF port map ( D=>SM_AMIGA_2_bus_D, 
            Q=>SM_AMIGA_2_busQ, 
            CLK=>CLK_OSZIPIN );
  FF_SM_AMIGA_i_7_bus_I_1:   DFF port map ( D=>SM_AMIGA_i_7_bus_D, 
            Q=>SM_AMIGA_i_7_busQ, 
            CLK=>CLK_OSZIPIN );
  GATE_SIZE_1_XI_1:   AND2 port map ( O=>SIZE_1XCOM, 
            I1=>SIZE_DMA_1_busQ, 
            I0=>GATE_SIZE_1_XA );
  GATE_SIZE_1_XI_2:   INV port map ( O=>GATE_SIZE_1_XA, 
            I0=>SIZE_DMA_0_busQ );
  GATE_SIZE_1X_OE_I_1:   NOR2 port map ( O=>SIZE_1X_OE, 
            I1=>BGACK_030Q, 
            I0=>nEXP_SPACEPIN );
  GATE_AHIGH_31X_OE_I_1:   INV port map ( I0=>BGACK_030Q, 
            O=>GATE_AHIGH_31X_OE_A );
  GATE_AHIGH_31X_OE_I_2:   INV port map ( I0=>nEXP_SPACEPIN, 
            O=>GATE_AHIGH_31X_OE_B );
  GATE_AHIGH_31X_OE_I_3:   AND3 port map ( O=>AHIGH_31X_OE, 
            I0=>inst_RESET_OUTQ, 
            I2=>GATE_AHIGH_31X_OE_A, 
            I1=>GATE_AHIGH_31X_OE_B );
  GATE_T_0_I_1:   NOR2 port map ( O=>T_0, 
            I1=>AS_000PIN, 
            I0=>inst_AS_000_DMAQ );
  GATE_AS_030_OE_I_1:   INV port map ( I0=>BGACK_030Q, 
            O=>GATE_AS_030_OE_A );
  GATE_AS_030_OE_I_2:   INV port map ( I0=>nEXP_SPACEPIN, 
            O=>GATE_AS_030_OE_B );
  GATE_AS_030_OE_I_3:   AND3 port map ( O=>AS_030_OE, 
            I0=>inst_RESET_OUTQ, 
            I2=>GATE_AS_030_OE_A, 
            I1=>GATE_AS_030_OE_B );
  GATE_T_1_I_1:   NOR2 port map ( O=>T_1, 
            I1=>AS_030PIN, 
            I0=>inst_AS_000_INTQ );
  GATE_AS_000_OE_I_1:   AND2 port map ( O=>AS_000_OE, 
            I1=>inst_RESET_OUTQ, 
            I0=>BGACK_030Q );
  GATE_T_2_I_1:   NOR2 port map ( O=>T_2, 
            I1=>AS_000PIN, 
            I0=>inst_DS_000_DMAQ );
  GATE_DS_030_OE_I_1:   INV port map ( I0=>BGACK_030Q, 
            O=>GATE_DS_030_OE_A );
  GATE_DS_030_OE_I_2:   INV port map ( I0=>nEXP_SPACEPIN, 
            O=>GATE_DS_030_OE_B );
  GATE_DS_030_OE_I_3:   AND3 port map ( O=>DS_030_OE, 
            I0=>inst_RESET_OUTQ, 
            I2=>GATE_DS_030_OE_A, 
            I1=>GATE_DS_030_OE_B );
  GATE_T_3_I_1:   AND2 port map ( O=>T_3, 
            I1=>inst_DS_000_ENABLEQ, 
            I0=>GATE_T_3_A );
  GATE_T_3_I_2:   INV port map ( O=>GATE_T_3_A, 
            I0=>inst_UDS_000_INTQ );
  GATE_UDS_000_OE_I_1:   AND2 port map ( O=>UDS_000_OE, 
            I1=>inst_RESET_OUTQ, 
            I0=>BGACK_030Q );
  GATE_T_4_I_1:   AND2 port map ( O=>T_4, 
            I1=>inst_DS_000_ENABLEQ, 
            I0=>GATE_T_4_A );
  GATE_T_4_I_2:   INV port map ( O=>GATE_T_4_A, 
            I0=>inst_LDS_000_INTQ );
  GATE_LDS_000_OE_I_1:   AND2 port map ( O=>LDS_000_OE, 
            I1=>inst_RESET_OUTQ, 
            I0=>BGACK_030Q );
  GATE_SIZE_0_XI_1:   AND2 port map ( O=>SIZE_0XCOM, 
            I1=>SIZE_DMA_0_busQ, 
            I0=>GATE_SIZE_0_XA );
  GATE_SIZE_0_XI_2:   INV port map ( O=>GATE_SIZE_0_XA, 
            I0=>SIZE_DMA_1_busQ );
  GATE_SIZE_0X_OE_I_1:   NOR2 port map ( O=>SIZE_0X_OE, 
            I1=>BGACK_030Q, 
            I0=>nEXP_SPACEPIN );
  GATE_BERR_OE_I_1:   AND3 port map ( O=>BERR_OE, 
            I2=>T_432, 
            I1=>T_433, 
            I0=>T_431 );
  GATE_AHIGH_30X_OE_I_1:   INV port map ( I0=>BGACK_030Q, 
            O=>GATE_AHIGH_30X_OE_A );
  GATE_AHIGH_30X_OE_I_2:   INV port map ( I0=>nEXP_SPACEPIN, 
            O=>GATE_AHIGH_30X_OE_B );
  GATE_AHIGH_30X_OE_I_3:   AND3 port map ( O=>AHIGH_30X_OE, 
            I0=>inst_RESET_OUTQ, 
            I2=>GATE_AHIGH_30X_OE_A, 
            I1=>GATE_AHIGH_30X_OE_B );
  GATE_AHIGH_29X_OE_I_1:   INV port map ( I0=>BGACK_030Q, 
            O=>GATE_AHIGH_29X_OE_A );
  GATE_AHIGH_29X_OE_I_2:   INV port map ( I0=>nEXP_SPACEPIN, 
            O=>GATE_AHIGH_29X_OE_B );
  GATE_AHIGH_29X_OE_I_3:   AND3 port map ( O=>AHIGH_29X_OE, 
            I0=>inst_RESET_OUTQ, 
            I2=>GATE_AHIGH_29X_OE_A, 
            I1=>GATE_AHIGH_29X_OE_B );
  GATE_AHIGH_28X_OE_I_1:   INV port map ( I0=>BGACK_030Q, 
            O=>GATE_AHIGH_28X_OE_A );
  GATE_AHIGH_28X_OE_I_2:   INV port map ( I0=>nEXP_SPACEPIN, 
            O=>GATE_AHIGH_28X_OE_B );
  GATE_AHIGH_28X_OE_I_3:   AND3 port map ( O=>AHIGH_28X_OE, 
            I0=>inst_RESET_OUTQ, 
            I2=>GATE_AHIGH_28X_OE_A, 
            I1=>GATE_AHIGH_28X_OE_B );
  GATE_AHIGH_27X_OE_I_1:   INV port map ( I0=>BGACK_030Q, 
            O=>GATE_AHIGH_27X_OE_A );
  GATE_AHIGH_27X_OE_I_2:   INV port map ( I0=>nEXP_SPACEPIN, 
            O=>GATE_AHIGH_27X_OE_B );
  GATE_AHIGH_27X_OE_I_3:   AND3 port map ( O=>AHIGH_27X_OE, 
            I0=>inst_RESET_OUTQ, 
            I2=>GATE_AHIGH_27X_OE_A, 
            I1=>GATE_AHIGH_27X_OE_B );
  GATE_AHIGH_26X_OE_I_1:   INV port map ( I0=>BGACK_030Q, 
            O=>GATE_AHIGH_26X_OE_A );
  GATE_AHIGH_26X_OE_I_2:   INV port map ( I0=>nEXP_SPACEPIN, 
            O=>GATE_AHIGH_26X_OE_B );
  GATE_AHIGH_26X_OE_I_3:   AND3 port map ( O=>AHIGH_26X_OE, 
            I0=>inst_RESET_OUTQ, 
            I2=>GATE_AHIGH_26X_OE_A, 
            I1=>GATE_AHIGH_26X_OE_B );
  GATE_AHIGH_25X_OE_I_1:   INV port map ( I0=>BGACK_030Q, 
            O=>GATE_AHIGH_25X_OE_A );
  GATE_AHIGH_25X_OE_I_2:   INV port map ( I0=>nEXP_SPACEPIN, 
            O=>GATE_AHIGH_25X_OE_B );
  GATE_AHIGH_25X_OE_I_3:   AND3 port map ( O=>AHIGH_25X_OE, 
            I0=>inst_RESET_OUTQ, 
            I2=>GATE_AHIGH_25X_OE_A, 
            I1=>GATE_AHIGH_25X_OE_B );
  GATE_AHIGH_24X_OE_I_1:   INV port map ( I0=>BGACK_030Q, 
            O=>GATE_AHIGH_24X_OE_A );
  GATE_AHIGH_24X_OE_I_2:   INV port map ( I0=>nEXP_SPACEPIN, 
            O=>GATE_AHIGH_24X_OE_B );
  GATE_AHIGH_24X_OE_I_3:   AND3 port map ( O=>AHIGH_24X_OE, 
            I0=>inst_RESET_OUTQ, 
            I2=>GATE_AHIGH_24X_OE_A, 
            I1=>GATE_AHIGH_24X_OE_B );
  GATE_T_5_I_1:   AND3 port map ( O=>T_5, 
            I2=>T_429, 
            I1=>T_430, 
            I0=>T_428 );
  GATE_E_I_1:   OR2 port map ( O=>ECOM, 
            I1=>T_191, 
            I0=>T_190 );
  GATE_RESET_OE_I_1:   INV port map ( I0=>inst_RESET_OUTQ, 
            O=>RESET_OE );
  GATE_AMIGA_BUS_DATA_DIR_I_1:   OR2 port map ( O=>AMIGA_BUS_DATA_DIRCOM, 
            I1=>T_189, 
            I0=>T_188 );
  GATE_T_6_I_1:   NOR2 port map ( O=>T_6, 
            I1=>inst_AMIGA_BUS_ENABLE_DMA_LOWQ, 
            I0=>BGACK_030Q );
  GATE_AMIGA_BUS_ENABLE_HIGH_I_1:   OR2 port map ( O=>AMIGA_BUS_ENABLE_HIGHCOM, 
            I1=>T_187, 
            I0=>T_186 );
  GATE_CIIN_I_1:   AND4 port map ( O=>CIINCOM, 
            I3=>T_425, 
            I2=>T_426, 
            I1=>T_427, 
            I0=>GATE_CIIN_A );
  GATE_CIIN_I_2:   INV port map ( I0=>AHIGH_31XPIN, 
            O=>GATE_CIIN_A );
  GATE_T_7_I_1:   OR4 port map ( I0=>T_184, 
            I1=>T_409, 
            O=>T_7, 
            I2=>T_408, 
            I3=>T_407 );
  GATE_T_8_I_1:   OR4 port map ( I0=>T_171, 
            I1=>T_172, 
            O=>T_8, 
            I2=>T_173, 
            I3=>T_174 );
  GATE_RW_000_OE_I_1:   AND2 port map ( O=>RW_000_OE, 
            I1=>inst_RESET_OUTQ, 
            I0=>BGACK_030Q );
  GATE_T_9_I_1:   OR2 port map ( O=>T_9, 
            I1=>T_170, 
            I0=>T_169 );
  GATE_BGACK_030_D_I_3:   NAN3 port map ( O=>BGACK_030_D, 
            I2=>RSTPIN, 
            I1=>GATE_BGACK_030_D_B, 
            I0=>GATE_BGACK_030_D_A );
  GATE_BGACK_030_D_I_2:   INV port map ( I0=>T_167, 
            O=>GATE_BGACK_030_D_B );
  GATE_BGACK_030_D_I_1:   INV port map ( I0=>T_168, 
            O=>GATE_BGACK_030_D_A );
  GATE_T_10_I_1:   OR3 port map ( O=>T_10, 
            I2=>T_395, 
            I1=>T_166, 
            I0=>T_394 );
  GATE_VMA_T_I_1:   OR3 port map ( O=>VMA_T, 
            I2=>T_160, 
            I1=>T_159, 
            I0=>T_161 );
  GATE_T_11_I_1:   OR2 port map ( O=>T_11, 
            I1=>T_158, 
            I0=>T_157 );
  GATE_RW_OE_I_1:   AND2 port map ( O=>RW_OE, 
            I1=>inst_RESET_OUTQ, 
            I0=>GATE_RW_OE_A );
  GATE_RW_OE_I_2:   INV port map ( O=>GATE_RW_OE_A, 
            I0=>BGACK_030Q );
  GATE_A_0X_D_I_3:   NAN3 port map ( O=>A_0X_D, 
            I2=>RSTPIN, 
            I1=>GATE_A_0X_D_B, 
            I0=>GATE_A_0X_D_A );
  GATE_A_0X_D_I_2:   INV port map ( I0=>T_155, 
            O=>GATE_A_0X_D_B );
  GATE_A_0X_D_I_1:   INV port map ( I0=>T_156, 
            O=>GATE_A_0X_D_A );
  GATE_A_0X_OE_I_1:   INV port map ( I0=>BGACK_030Q, 
            O=>GATE_A_0X_OE_A );
  GATE_A_0X_OE_I_2:   INV port map ( I0=>nEXP_SPACEPIN, 
            O=>GATE_A_0X_OE_B );
  GATE_A_0X_OE_I_3:   AND3 port map ( O=>A_0X_OE, 
            I0=>inst_RESET_OUTQ, 
            I2=>GATE_A_0X_OE_A, 
            I1=>GATE_A_0X_OE_B );
  GATE_T_12_I_1:   OR4 port map ( I0=>T_154, 
            I1=>T_375, 
            O=>T_12, 
            I2=>T_374, 
            I3=>T_373 );
  GATE_T_13_I_1:   OR4 port map ( I0=>T_144, 
            I1=>T_360, 
            O=>T_13, 
            I2=>T_359, 
            I3=>T_358 );
  GATE_cpu_est_3_bus_D_I_1:   OR4 port map ( I0=>T_131, 
            I1=>T_132, 
            O=>cpu_est_3_bus_D, 
            I2=>T_133, 
            I3=>T_134 );
  GATE_cpu_est_0_bus_D_I_1:   OR3 port map ( O=>cpu_est_0_bus_D, 
            I2=>T_129, 
            I1=>T_128, 
            I0=>T_130 );
  GATE_cpu_est_1_bus_D_I_1:   OR4 port map ( I0=>T_124, 
            I1=>T_125, 
            O=>cpu_est_1_bus_D, 
            I2=>T_126, 
            I3=>T_127 );
  GATE_cpu_est_2_bus_D_X1_I_1:   AND4 port map ( O=>cpu_est_2_bus_D_X1, 
            I3=>cpu_est_1_busQ, 
            I2=>cpu_est_0_busQ, 
            I1=>CLK_000_D_1_busQ, 
            I0=>GATE_cpu_est_2_bus_D_X1_A );
  GATE_cpu_est_2_bus_D_X1_I_2:   INV port map ( I0=>CLK_000_D_0_busQ, 
            O=>GATE_cpu_est_2_bus_D_X1_A );
  GATE_T_14_I_1:   OR2 port map ( O=>T_14, 
            I1=>T_123, 
            I0=>T_122 );
  GATE_T_15_I_1:   OR2 port map ( O=>T_15, 
            I1=>T_121, 
            I0=>T_120 );
  GATE_T_16_I_1:   AND2 port map ( O=>T_16, 
            I1=>RSTPIN, 
            I0=>GATE_T_16_A );
  GATE_T_16_I_2:   INV port map ( O=>GATE_T_16_A, 
            I0=>AS_030PIN );
  GATE_T_17_I_1:   OR4 port map ( I0=>T_119, 
            I1=>T_329, 
            O=>T_17, 
            I2=>T_328, 
            I3=>T_327 );
  GATE_T_18_I_1:   AND2 port map ( O=>T_18, 
            I1=>RSTPIN, 
            I0=>GATE_T_18_A );
  GATE_T_18_I_2:   INV port map ( O=>GATE_T_18_A, 
            I0=>BGACK_030Q );
  GATE_inst_AS_000_DMA_D_I_1:   NAN4 port map ( I3=>RSTPIN, 
            O=>inst_AS_000_DMA_D, 
            I2=>GATE_inst_AS_000_DMA_D_C, 
            I1=>GATE_inst_AS_000_DMA_D_B, 
            I0=>GATE_inst_AS_000_DMA_D_A );
  GATE_inst_AS_000_DMA_D_I_2:   INV port map ( I0=>T_325, 
            O=>GATE_inst_AS_000_DMA_D_A );
  GATE_inst_AS_000_DMA_D_I_3:   INV port map ( I0=>T_324, 
            O=>GATE_inst_AS_000_DMA_D_B );
  GATE_inst_AS_000_DMA_D_I_4:   INV port map ( I0=>T_326, 
            O=>GATE_inst_AS_000_DMA_D_C );
  GATE_inst_DS_000_DMA_D_I_1:   OR3 port map ( O=>inst_DS_000_DMA_D, 
            I2=>T_322, 
            I1=>T_323, 
            I0=>T_321 );
  GATE_CYCLE_DMA_0_bus_D_I_1:   OR3 port map ( O=>CYCLE_DMA_0_bus_D, 
            I2=>T_101, 
            I1=>T_100, 
            I0=>T_102 );
  GATE_CYCLE_DMA_1_bus_D_I_1:   OR4 port map ( I0=>T_96, 
            I1=>T_97, 
            O=>CYCLE_DMA_1_bus_D, 
            I2=>T_98, 
            I3=>T_99 );
  GATE_T_19_I_1:   OR3 port map ( O=>T_19, 
            I2=>T_94, 
            I1=>T_93, 
            I0=>T_95 );
  GATE_SIZE_DMA_1_bus_D_I_3:   NAN3 port map ( O=>SIZE_DMA_1_bus_D, 
            I2=>RSTPIN, 
            I1=>GATE_SIZE_DMA_1_bus_D_B, 
            I0=>GATE_SIZE_DMA_1_bus_D_A );
  GATE_SIZE_DMA_1_bus_D_I_2:   INV port map ( I0=>T_91, 
            O=>GATE_SIZE_DMA_1_bus_D_B );
  GATE_SIZE_DMA_1_bus_D_I_1:   INV port map ( I0=>T_92, 
            O=>GATE_SIZE_DMA_1_bus_D_A );
  GATE_T_20_I_1:   AND2 port map ( O=>T_20, 
            I1=>RSTPIN, 
            I0=>GATE_T_20_A );
  GATE_T_20_I_2:   INV port map ( O=>GATE_T_20_A, 
            I0=>VPAPIN );
  GATE_T_21_I_1:   OR2 port map ( O=>T_21, 
            I1=>T_90, 
            I0=>T_89 );
  GATE_inst_LDS_000_INT_D_I_3:   NAN3 port map ( O=>inst_LDS_000_INT_D, 
            I2=>RSTPIN, 
            I1=>GATE_inst_LDS_000_INT_D_B, 
            I0=>GATE_inst_LDS_000_INT_D_A );
  GATE_inst_LDS_000_INT_D_I_2:   INV port map ( I0=>T_87, 
            O=>GATE_inst_LDS_000_INT_D_B );
  GATE_inst_LDS_000_INT_D_I_1:   INV port map ( I0=>T_88, 
            O=>GATE_inst_LDS_000_INT_D_A );
  GATE_T_22_I_1:   AND2 port map ( O=>T_22, 
            I1=>RSTPIN, 
            I0=>GATE_T_22_A );
  GATE_T_22_I_2:   INV port map ( O=>GATE_T_22_A, 
            I0=>DTACKPIN );
  GATE_inst_RESET_OUT_D_I_1:   OR2 port map ( O=>inst_RESET_OUT_D, 
            I1=>T_86, 
            I0=>T_85 );
  GATE_inst_CLK_OUT_PRE_50_D_I_1:   INV port map ( I0=>inst_CLK_OUT_PRE_50Q, 
            O=>inst_CLK_OUT_PRE_50_D );
  GATE_inst_CLK_OUT_PRE_25_D_I_1:   XOR2 port map ( O=>inst_CLK_OUT_PRE_25_D, 
            I1=>inst_CLK_OUT_PRE_25Q, 
            I0=>inst_CLK_OUT_PRE_50Q );
  GATE_T_23_I_1:   AND2 port map ( O=>T_23, 
            I1=>RSTPIN, 
            I0=>GATE_T_23_A );
  GATE_T_23_I_2:   INV port map ( O=>GATE_T_23_A, 
            I0=>IPL_0XPIN );
  GATE_T_24_I_1:   AND2 port map ( O=>T_24, 
            I1=>RSTPIN, 
            I0=>GATE_T_24_A );
  GATE_T_24_I_2:   INV port map ( O=>GATE_T_24_A, 
            I0=>IPL_1XPIN );
  GATE_T_25_I_1:   AND2 port map ( O=>T_25, 
            I1=>RSTPIN, 
            I0=>GATE_T_25_A );
  GATE_T_25_I_2:   INV port map ( O=>GATE_T_25_A, 
            I0=>IPL_2XPIN );
  GATE_T_26_I_1:   OR2 port map ( O=>T_26, 
            I1=>T_84, 
            I0=>T_83 );
  GATE_inst_DS_000_ENABLE_D_I_1:   OR4 port map ( I0=>T_79, 
            I1=>T_80, 
            O=>inst_DS_000_ENABLE_D, 
            I2=>T_81, 
            I3=>T_82 );
  GATE_SM_AMIGA_6_bus_D_I_1:   OR3 port map ( O=>SM_AMIGA_6_bus_D, 
            I2=>T_77, 
            I1=>T_76, 
            I0=>T_78 );
  GATE_SM_AMIGA_0_bus_D_I_1:   OR3 port map ( O=>SM_AMIGA_0_bus_D, 
            I2=>T_74, 
            I1=>T_73, 
            I0=>T_75 );
  GATE_SM_AMIGA_4_bus_D_I_1:   OR3 port map ( O=>SM_AMIGA_4_bus_D, 
            I2=>T_71, 
            I1=>T_70, 
            I0=>T_72 );
  GATE_RST_DLY_0_bus_D_I_1:   OR4 port map ( I0=>T_66, 
            I1=>T_67, 
            O=>RST_DLY_0_bus_D, 
            I2=>T_68, 
            I3=>T_69 );
  GATE_RST_DLY_1_bus_D_X1_I_1:   OR2 port map ( O=>RST_DLY_1_bus_D_X1, 
            I1=>T_45, 
            I0=>T_44 );
  GATE_RST_DLY_1_bus_D_X2_I_1:   AND2 port map ( O=>RST_DLY_1_bus_D_X2, 
            I1=>RST_DLY_1_busQ, 
            I0=>RSTPIN );
  GATE_RST_DLY_2_bus_D_I_1:   OR2 port map ( O=>RST_DLY_2_bus_D, 
            I1=>T_65, 
            I0=>T_64 );
  GATE_inst_CLK_030_H_D_I_1:   OR4 port map ( I0=>T_255, 
            I1=>T_254, 
            O=>inst_CLK_030_H_D, 
            I2=>T_253, 
            I3=>T_252 );
  GATE_SM_AMIGA_1_bus_D_I_1:   OR3 port map ( O=>SM_AMIGA_1_bus_D, 
            I2=>T_54, 
            I1=>T_53, 
            I0=>T_55 );
  GATE_SM_AMIGA_5_bus_D_I_1:   OR3 port map ( O=>SM_AMIGA_5_bus_D, 
            I2=>T_51, 
            I1=>T_50, 
            I0=>T_52 );
  GATE_SM_AMIGA_3_bus_D_X1_I_1:   OR4 port map ( I0=>T_40, 
            I1=>T_41, 
            O=>SM_AMIGA_3_bus_D_X1, 
            I2=>T_42, 
            I3=>T_43 );
  GATE_SM_AMIGA_3_bus_D_X2_I_1:   AND3 port map ( O=>SM_AMIGA_3_bus_D_X2, 
            I2=>SM_AMIGA_3_busQ, 
            I1=>RSTPIN, 
            I0=>BERRPIN );
  GATE_SM_AMIGA_2_bus_D_I_1:   OR4 port map ( I0=>T_46, 
            I1=>T_47, 
            O=>SM_AMIGA_2_bus_D, 
            I2=>T_48, 
            I3=>T_49 );
  GATE_SM_AMIGA_i_7_bus_D_X1_I_1:   OR4 port map ( I0=>T_39, 
            I1=>T_194, 
            O=>SM_AMIGA_i_7_bus_D_X1, 
            I2=>T_193, 
            I3=>T_192 );
  GATE_SM_AMIGA_i_7_bus_D_X2_I_1:   AND2 port map ( O=>SM_AMIGA_i_7_bus_D_X2, 
            I1=>BERRPIN, 
            I0=>RSTPIN );
  GATE_CIIN_OE_I_1:   OR2 port map ( O=>CIIN_OE, 
            I1=>T_185, 
            I0=>nEXP_SPACEPIN );
  GATE_cpu_est_2_bus_D_I_1:   XOR2 port map ( O=>cpu_est_2_bus_D, 
            I1=>cpu_est_2_bus_D_X1, 
            I0=>cpu_est_2_busQ );
  GATE_RST_DLY_1_bus_D_I_1:   XOR2 port map ( O=>RST_DLY_1_bus_D, 
            I1=>RST_DLY_1_bus_D_X2, 
            I0=>RST_DLY_1_bus_D_X1 );
  GATE_SM_AMIGA_3_bus_D_I_1:   XOR2 port map ( O=>SM_AMIGA_3_bus_D, 
            I1=>SM_AMIGA_3_bus_D_X2, 
            I0=>SM_AMIGA_3_bus_D_X1 );
  GATE_SM_AMIGA_i_7_bus_D_I_1:   XOR2 port map ( O=>SM_AMIGA_i_7_bus_D, 
            I1=>SM_AMIGA_i_7_bus_D_X2, 
            I0=>SM_AMIGA_i_7_bus_D_X1 );
  GATE_AS_030_I_1:   INV port map ( I0=>T_0, 
            O=>AS_030COM );
  GATE_AS_000_I_1:   INV port map ( I0=>T_1, 
            O=>AS_000COM );
  GATE_DS_030_I_1:   INV port map ( I0=>T_2, 
            O=>DS_030COM );
  GATE_UDS_000_I_1:   INV port map ( I0=>T_3, 
            O=>UDS_000COM );
  GATE_LDS_000_I_1:   INV port map ( I0=>T_4, 
            O=>LDS_000COM );
  GATE_FPU_CS_I_1:   INV port map ( I0=>T_5, 
            O=>FPU_CSCOM );
  GATE_AMIGA_BUS_ENABLE_LOW_I_1:   INV port map ( I0=>T_6, 
            O=>AMIGA_BUS_ENABLE_LOWCOM );
  GATE_IPL_030_2X_D_I_1:   INV port map ( I0=>T_7, 
            O=>IPL_030_2X_D );
  GATE_RW_000_D_I_1:   INV port map ( I0=>T_8, 
            O=>RW_000_D );
  GATE_BG_000_D_I_1:   INV port map ( I0=>T_9, 
            O=>BG_000_D );
  GATE_DSACK1_D_I_1:   INV port map ( I0=>T_10, 
            O=>DSACK1_D );
  GATE_RW_D_I_1:   INV port map ( I0=>T_11, 
            O=>RW_D );
  GATE_IPL_030_1X_D_I_1:   INV port map ( I0=>T_12, 
            O=>IPL_030_1X_D );
  GATE_IPL_030_0X_D_I_1:   INV port map ( I0=>T_13, 
            O=>IPL_030_0X_D );
  GATE_inst_AS_000_INT_D_I_1:   INV port map ( I0=>T_14, 
            O=>inst_AS_000_INT_D );
  GATE_inst_AMIGA_BUS_ENABLE_DMA_LOW_D_I_1:   INV port map ( I0=>T_15, 
            O=>inst_AMIGA_BUS_ENABLE_DMA_LOW_D );
  GATE_inst_AS_030_D0_D_I_1:   INV port map ( I0=>T_16, 
            O=>inst_AS_030_D0_D );
  GATE_inst_AS_030_000_SYNC_D_I_1:   INV port map ( I0=>T_17, 
            O=>inst_AS_030_000_SYNC_D );
  GATE_inst_BGACK_030_INT_D_D_I_1:   INV port map ( I0=>T_18, 
            O=>inst_BGACK_030_INT_D_D );
  GATE_SIZE_DMA_0_bus_D_I_1:   INV port map ( I0=>T_19, 
            O=>SIZE_DMA_0_bus_D );
  GATE_inst_VPA_D_D_I_1:   INV port map ( I0=>T_20, 
            O=>inst_VPA_D_D );
  GATE_inst_UDS_000_INT_D_I_1:   INV port map ( I0=>T_21, 
            O=>inst_UDS_000_INT_D );
  GATE_inst_DTACK_D0_D_I_1:   INV port map ( I0=>T_22, 
            O=>inst_DTACK_D0_D );
  GATE_IPL_D0_0_bus_D_I_1:   INV port map ( I0=>T_23, 
            O=>IPL_D0_0_bus_D );
  GATE_IPL_D0_1_bus_D_I_1:   INV port map ( I0=>T_24, 
            O=>IPL_D0_1_bus_D );
  GATE_IPL_D0_2_bus_D_I_1:   INV port map ( I0=>T_25, 
            O=>IPL_D0_2_bus_D );
  GATE_inst_AMIGA_BUS_ENABLE_DMA_HIGH_D_I_1:   INV port map ( I0=>T_26, 
            O=>inst_AMIGA_BUS_ENABLE_DMA_HIGH_D );
  GATE_T_27_I_1:   AND4 port map ( O=>T_27, 
            I3=>T_227, 
            I2=>T_228, 
            I1=>T_229, 
            I0=>T_230 );
  GATE_T_28_I_1:   AND4 port map ( O=>T_28, 
            I3=>T_223, 
            I2=>T_224, 
            I1=>T_225, 
            I0=>T_226 );
  GATE_T_29_I_1:   AND4 port map ( O=>T_29, 
            I3=>T_220, 
            I2=>T_221, 
            I1=>T_222, 
            I0=>BERRPIN );
  GATE_T_30_I_1:   AND4 port map ( O=>T_30, 
            I3=>T_217, 
            I2=>T_218, 
            I1=>T_219, 
            I0=>BERRPIN );
  GATE_T_31_I_1:   AND4 port map ( O=>T_31, 
            I3=>T_214, 
            I2=>T_215, 
            I1=>T_216, 
            I0=>BERRPIN );
  GATE_T_32_I_1:   AND4 port map ( O=>T_32, 
            I3=>T_211, 
            I2=>T_212, 
            I1=>T_213, 
            I0=>BERRPIN );
  GATE_T_33_I_1:   AND4 port map ( O=>T_33, 
            I3=>T_208, 
            I2=>T_209, 
            I1=>T_210, 
            I0=>BERRPIN );
  GATE_T_34_I_1:   AND4 port map ( O=>T_34, 
            I3=>T_205, 
            I2=>T_206, 
            I1=>T_207, 
            I0=>GATE_T_34_A );
  GATE_T_34_I_2:   INV port map ( I0=>BERRPIN, 
            O=>GATE_T_34_A );
  GATE_T_35_I_1:   INV port map ( I0=>BERRPIN, 
            O=>GATE_T_35_A );
  GATE_T_35_I_2:   AND3 port map ( O=>T_35, 
            I2=>T_204, 
            I1=>T_203, 
            I0=>GATE_T_35_A );
  GATE_T_36_I_1:   INV port map ( I0=>BERRPIN, 
            O=>GATE_T_36_A );
  GATE_T_36_I_2:   AND3 port map ( O=>T_36, 
            I2=>T_202, 
            I1=>T_201, 
            I0=>GATE_T_36_A );
  GATE_T_37_I_1:   INV port map ( I0=>BERRPIN, 
            O=>GATE_T_37_A );
  GATE_T_37_I_2:   AND3 port map ( O=>T_37, 
            I2=>T_200, 
            I1=>T_199, 
            I0=>GATE_T_37_A );
  GATE_T_38_I_1:   INV port map ( I0=>BERRPIN, 
            O=>GATE_T_38_A );
  GATE_T_38_I_2:   AND3 port map ( O=>T_38, 
            I2=>T_198, 
            I1=>T_197, 
            I0=>GATE_T_38_A );
  GATE_T_39_I_1:   INV port map ( I0=>BERRPIN, 
            O=>GATE_T_39_A );
  GATE_T_39_I_2:   AND3 port map ( O=>T_39, 
            I2=>T_196, 
            I1=>T_195, 
            I0=>GATE_T_39_A );
  GATE_T_40_I_1:   AND4 port map ( O=>T_40, 
            I3=>T_238, 
            I2=>T_239, 
            I1=>T_240, 
            I0=>T_241 );
  GATE_T_41_I_1:   AND4 port map ( O=>T_41, 
            I3=>T_235, 
            I2=>T_236, 
            I1=>T_237, 
            I0=>BERRPIN );
  GATE_T_42_I_1:   INV port map ( I0=>BERRPIN, 
            O=>GATE_T_42_A );
  GATE_T_42_I_2:   AND3 port map ( O=>T_42, 
            I2=>T_234, 
            I1=>T_233, 
            I0=>GATE_T_42_A );
  GATE_T_43_I_1:   INV port map ( I0=>SM_AMIGA_3_busQ, 
            O=>GATE_T_43_A );
  GATE_T_43_I_2:   AND3 port map ( O=>T_43, 
            I2=>T_232, 
            I1=>T_231, 
            I0=>GATE_T_43_A );
  GATE_T_44_I_1:   INV port map ( I0=>RST_DLY_2_busQ, 
            O=>GATE_T_44_A );
  GATE_T_44_I_2:   AND3 port map ( O=>T_44, 
            I2=>T_245, 
            I1=>T_244, 
            I0=>GATE_T_44_A );
  GATE_T_45_I_1:   INV port map ( I0=>RST_DLY_1_busQ, 
            O=>GATE_T_45_A );
  GATE_T_45_I_2:   AND3 port map ( O=>T_45, 
            I2=>T_243, 
            I1=>T_242, 
            I0=>GATE_T_45_A );
  GATE_T_46_I_1:   AND4 port map ( O=>T_46, 
            I3=>T_249, 
            I2=>T_250, 
            I1=>T_251, 
            I0=>SM_AMIGA_3_busQ );
  GATE_T_47_I_1:   AND3 port map ( O=>T_47, 
            I2=>T_247, 
            I1=>T_248, 
            I0=>T_246 );
  GATE_T_48_I_1:   AND4 port map ( O=>T_48, 
            I3=>BERRPIN, 
            I2=>SM_AMIGA_2_busQ, 
            I1=>RSTPIN, 
            I0=>GATE_T_48_A );
  GATE_T_48_I_2:   INV port map ( I0=>CLK_000_D_0_busQ, 
            O=>GATE_T_48_A );
  GATE_T_49_I_1:   AND4 port map ( O=>T_49, 
            I3=>BERRPIN, 
            I2=>SM_AMIGA_2_busQ, 
            I1=>CLK_000_D_1_busQ, 
            I0=>RSTPIN );
  GATE_T_50_I_1:   AND4 port map ( O=>T_50, 
            I3=>BERRPIN, 
            I2=>SM_AMIGA_5_busQ, 
            I1=>CLK_000_D_0_busQ, 
            I0=>RSTPIN );
  GATE_T_51_I_1:   AND4 port map ( O=>T_51, 
            I3=>BERRPIN, 
            I2=>SM_AMIGA_5_busQ, 
            I1=>RSTPIN, 
            I0=>GATE_T_51_A );
  GATE_T_51_I_2:   INV port map ( I0=>CLK_000_D_1_busQ, 
            O=>GATE_T_51_A );
  GATE_T_52_I_1:   AND4 port map ( O=>T_52, 
            I3=>SM_AMIGA_6_busQ, 
            I2=>CLK_000_D_0_busQ, 
            I1=>RSTPIN, 
            I0=>GATE_T_52_A );
  GATE_T_52_I_2:   INV port map ( I0=>CLK_000_D_1_busQ, 
            O=>GATE_T_52_A );
  GATE_T_53_I_1:   AND4 port map ( O=>T_53, 
            I3=>BERRPIN, 
            I2=>SM_AMIGA_1_busQ, 
            I1=>CLK_000_D_0_busQ, 
            I0=>RSTPIN );
  GATE_T_54_I_1:   AND4 port map ( O=>T_54, 
            I3=>BERRPIN, 
            I2=>SM_AMIGA_1_busQ, 
            I1=>RSTPIN, 
            I0=>GATE_T_54_A );
  GATE_T_54_I_2:   INV port map ( I0=>CLK_000_D_1_busQ, 
            O=>GATE_T_54_A );
  GATE_T_55_I_1:   AND4 port map ( O=>T_55, 
            I3=>SM_AMIGA_2_busQ, 
            I2=>CLK_000_D_0_busQ, 
            I1=>RSTPIN, 
            I0=>GATE_T_55_A );
  GATE_T_55_I_2:   INV port map ( I0=>CLK_000_D_1_busQ, 
            O=>GATE_T_55_A );
  GATE_T_56_I_1:   AND4 port map ( O=>T_56, 
            I3=>T_280, 
            I2=>T_281, 
            I1=>T_282, 
            I0=>T_283 );
  GATE_T_57_I_1:   AND4 port map ( O=>T_57, 
            I3=>T_276, 
            I2=>T_277, 
            I1=>T_278, 
            I0=>T_279 );
  GATE_T_58_I_1:   AND4 port map ( O=>T_58, 
            I3=>T_272, 
            I2=>T_273, 
            I1=>T_274, 
            I0=>T_275 );
  GATE_T_59_I_1:   AND4 port map ( O=>T_59, 
            I3=>T_268, 
            I2=>T_269, 
            I1=>T_270, 
            I0=>T_271 );
  GATE_T_60_I_1:   AND4 port map ( O=>T_60, 
            I3=>T_265, 
            I2=>T_266, 
            I1=>T_267, 
            I0=>GATE_T_60_A );
  GATE_T_60_I_2:   INV port map ( I0=>LDS_000PIN, 
            O=>GATE_T_60_A );
  GATE_T_61_I_1:   AND4 port map ( O=>T_61, 
            I3=>T_262, 
            I2=>T_263, 
            I1=>T_264, 
            I0=>GATE_T_61_A );
  GATE_T_61_I_2:   INV port map ( I0=>LDS_000PIN, 
            O=>GATE_T_61_A );
  GATE_T_62_I_1:   AND4 port map ( O=>T_62, 
            I3=>T_259, 
            I2=>T_260, 
            I1=>T_261, 
            I0=>GATE_T_62_A );
  GATE_T_62_I_2:   INV port map ( I0=>UDS_000PIN, 
            O=>GATE_T_62_A );
  GATE_T_63_I_1:   AND4 port map ( O=>T_63, 
            I3=>T_256, 
            I2=>T_257, 
            I1=>T_258, 
            I0=>GATE_T_63_A );
  GATE_T_63_I_2:   INV port map ( I0=>UDS_000PIN, 
            O=>GATE_T_63_A );
  GATE_T_64_I_1:   AND3 port map ( O=>T_64, 
            I2=>T_285, 
            I1=>RST_DLY_1_busQ, 
            I0=>T_284 );
  GATE_T_65_I_1:   AND2 port map ( O=>T_65, 
            I1=>RST_DLY_2_busQ, 
            I0=>RSTPIN );
  GATE_T_66_I_1:   AND4 port map ( O=>T_66, 
            I3=>RST_DLY_2_busQ, 
            I2=>RST_DLY_1_busQ, 
            I1=>RST_DLY_0_busQ, 
            I0=>RSTPIN );
  GATE_T_67_I_3:   AND4 port map ( O=>T_67, 
            I3=>CLK_000_D_1_busQ, 
            I2=>RSTPIN, 
            I1=>GATE_T_67_B, 
            I0=>GATE_T_67_A );
  GATE_T_67_I_2:   INV port map ( I0=>RST_DLY_0_busQ, 
            O=>GATE_T_67_B );
  GATE_T_67_I_1:   INV port map ( I0=>CLK_000_D_0_busQ, 
            O=>GATE_T_67_A );
  GATE_T_68_I_1:   AND3 port map ( O=>T_68, 
            I2=>CLK_000_D_0_busQ, 
            I1=>RSTPIN, 
            I0=>RST_DLY_0_busQ );
  GATE_T_69_I_1:   INV port map ( I0=>CLK_000_D_1_busQ, 
            O=>GATE_T_69_A );
  GATE_T_69_I_2:   AND3 port map ( O=>T_69, 
            I2=>RSTPIN, 
            I1=>RST_DLY_0_busQ, 
            I0=>GATE_T_69_A );
  GATE_T_70_I_1:   AND4 port map ( O=>T_70, 
            I3=>BERRPIN, 
            I2=>SM_AMIGA_4_busQ, 
            I1=>RSTPIN, 
            I0=>GATE_T_70_A );
  GATE_T_70_I_2:   INV port map ( I0=>CLK_000_D_0_busQ, 
            O=>GATE_T_70_A );
  GATE_T_71_I_1:   AND4 port map ( O=>T_71, 
            I3=>BERRPIN, 
            I2=>SM_AMIGA_4_busQ, 
            I1=>CLK_000_D_1_busQ, 
            I0=>RSTPIN );
  GATE_T_72_I_1:   AND4 port map ( O=>T_72, 
            I3=>CLK_000_D_1_busQ, 
            I2=>RSTPIN, 
            I1=>SM_AMIGA_5_busQ, 
            I0=>GATE_T_72_A );
  GATE_T_72_I_2:   INV port map ( I0=>CLK_000_D_0_busQ, 
            O=>GATE_T_72_A );
  GATE_T_73_I_1:   AND4 port map ( O=>T_73, 
            I3=>BERRPIN, 
            I2=>SM_AMIGA_0_busQ, 
            I1=>RSTPIN, 
            I0=>GATE_T_73_A );
  GATE_T_73_I_2:   INV port map ( I0=>CLK_000_D_0_busQ, 
            O=>GATE_T_73_A );
  GATE_T_74_I_1:   AND4 port map ( O=>T_74, 
            I3=>BERRPIN, 
            I2=>SM_AMIGA_0_busQ, 
            I1=>CLK_000_D_1_busQ, 
            I0=>RSTPIN );
  GATE_T_75_I_1:   AND4 port map ( O=>T_75, 
            I3=>CLK_000_D_1_busQ, 
            I2=>RSTPIN, 
            I1=>SM_AMIGA_1_busQ, 
            I0=>GATE_T_75_A );
  GATE_T_75_I_2:   INV port map ( I0=>CLK_000_D_0_busQ, 
            O=>GATE_T_75_A );
  GATE_T_76_I_1:   AND3 port map ( O=>T_76, 
            I2=>T_291, 
            I1=>T_292, 
            I0=>T_290 );
  GATE_T_77_I_1:   AND3 port map ( O=>T_77, 
            I2=>T_289, 
            I1=>BERRPIN, 
            I0=>T_288 );
  GATE_T_78_I_1:   AND3 port map ( O=>T_78, 
            I2=>T_287, 
            I1=>BERRPIN, 
            I0=>T_286 );
  GATE_T_79_I_1:   AND4 port map ( O=>T_79, 
            I3=>T_299, 
            I2=>T_300, 
            I1=>T_301, 
            I0=>RWPIN );
  GATE_T_80_I_1:   AND4 port map ( O=>T_80, 
            I3=>T_296, 
            I2=>T_297, 
            I1=>T_298, 
            I0=>SM_AMIGA_i_7_busQ );
  GATE_T_81_I_1:   AND3 port map ( O=>T_81, 
            I2=>T_294, 
            I1=>T_295, 
            I0=>T_293 );
  GATE_T_82_I_1:   AND4 port map ( O=>T_82, 
            I3=>BERRPIN, 
            I2=>inst_DS_000_ENABLEQ, 
            I1=>RSTPIN, 
            I0=>GATE_T_82_A );
  GATE_T_82_I_2:   INV port map ( I0=>inst_AS_030_D0Q, 
            O=>GATE_T_82_A );
  GATE_T_83_I_1:   AND4 port map ( O=>T_83, 
            I3=>BGACK_030Q, 
            I2=>RSTPIN, 
            I1=>inst_BGACK_030_INT_DQ, 
            I0=>GATE_T_83_A );
  GATE_T_83_I_2:   INV port map ( I0=>inst_AMIGA_BUS_ENABLE_DMA_HIGHQ, 
            O=>GATE_T_83_A );
  GATE_T_84_I_1:   INV port map ( I0=>BGACK_030Q, 
            O=>GATE_T_84_A );
  GATE_T_84_I_2:   INV port map ( I0=>A_1XPIN, 
            O=>GATE_T_84_B );
  GATE_T_84_I_3:   AND3 port map ( O=>T_84, 
            I0=>RSTPIN, 
            I2=>GATE_T_84_A, 
            I1=>GATE_T_84_B );
  GATE_T_85_I_1:   AND3 port map ( O=>T_85, 
            I2=>T_303, 
            I1=>T_304, 
            I0=>T_302 );
  GATE_T_86_I_1:   AND2 port map ( O=>T_86, 
            I1=>inst_RESET_OUTQ, 
            I0=>RSTPIN );
  GATE_T_87_I_3:   AND4 port map ( O=>T_87, 
            I3=>SIZE_0XPIN, 
            I2=>SM_AMIGA_6_busQ, 
            I1=>GATE_T_87_B, 
            I0=>GATE_T_87_A );
  GATE_T_87_I_2:   INV port map ( I0=>A_0XPIN, 
            O=>GATE_T_87_B );
  GATE_T_87_I_1:   INV port map ( I0=>SIZE_1XPIN, 
            O=>GATE_T_87_A );
  GATE_T_88_I_1:   AND2 port map ( O=>T_88, 
            I1=>inst_LDS_000_INTQ, 
            I0=>GATE_T_88_A );
  GATE_T_88_I_2:   INV port map ( O=>GATE_T_88_A, 
            I0=>SM_AMIGA_6_busQ );
  GATE_T_89_I_1:   INV port map ( I0=>A_0XPIN, 
            O=>GATE_T_89_A );
  GATE_T_89_I_2:   AND3 port map ( O=>T_89, 
            I2=>SM_AMIGA_6_busQ, 
            I1=>RSTPIN, 
            I0=>GATE_T_89_A );
  GATE_T_90_I_1:   INV port map ( I0=>SM_AMIGA_6_busQ, 
            O=>GATE_T_90_A );
  GATE_T_90_I_2:   INV port map ( I0=>inst_UDS_000_INTQ, 
            O=>GATE_T_90_B );
  GATE_T_90_I_3:   AND3 port map ( O=>T_90, 
            I0=>RSTPIN, 
            I2=>GATE_T_90_A, 
            I1=>GATE_T_90_B );
  GATE_T_91_I_1:   NOR3 port map ( O=>T_91, 
            I2=>UDS_000PIN, 
            I1=>BGACK_030Q, 
            I0=>LDS_000PIN );
  GATE_T_92_I_1:   AND3 port map ( O=>T_92, 
            I2=>inst_BGACK_030_INT_DQ, 
            I1=>BGACK_030Q, 
            I0=>SIZE_DMA_1_busQ );
  GATE_T_93_I_1:   NOR4 port map ( I0=>UDS_000PIN, 
            I1=>LDS_000PIN, 
            O=>T_93, 
            I2=>BGACK_030Q, 
            I3=>GATE_T_93_DN );
  GATE_T_93_I_2:   INV port map ( I0=>RSTPIN, 
            O=>GATE_T_93_DN );
  GATE_T_94_I_1:   INV port map ( I0=>SIZE_DMA_0_busQ, 
            O=>GATE_T_94_A );
  GATE_T_94_I_2:   AND3 port map ( O=>T_94, 
            I2=>BGACK_030Q, 
            I1=>RSTPIN, 
            I0=>GATE_T_94_A );
  GATE_T_95_I_1:   INV port map ( I0=>inst_BGACK_030_INT_DQ, 
            O=>GATE_T_95_A );
  GATE_T_95_I_2:   AND3 port map ( O=>T_95, 
            I2=>BGACK_030Q, 
            I1=>RSTPIN, 
            I0=>GATE_T_95_A );
  GATE_T_96_I_1:   AND4 port map ( O=>T_96, 
            I3=>T_311, 
            I2=>T_312, 
            I1=>T_313, 
            I0=>GATE_T_96_A );
  GATE_T_96_I_2:   INV port map ( I0=>AS_000PIN, 
            O=>GATE_T_96_A );
  GATE_T_97_I_1:   INV port map ( I0=>AS_000PIN, 
            O=>GATE_T_97_A );
  GATE_T_97_I_2:   AND3 port map ( O=>T_97, 
            I2=>T_310, 
            I1=>T_309, 
            I0=>GATE_T_97_A );
  GATE_T_98_I_1:   INV port map ( I0=>AS_000PIN, 
            O=>GATE_T_98_A );
  GATE_T_98_I_2:   AND3 port map ( O=>T_98, 
            I2=>T_308, 
            I1=>T_307, 
            I0=>GATE_T_98_A );
  GATE_T_99_I_1:   INV port map ( I0=>AS_000PIN, 
            O=>GATE_T_99_A );
  GATE_T_99_I_2:   AND3 port map ( O=>T_99, 
            I2=>T_306, 
            I1=>T_305, 
            I0=>GATE_T_99_A );
  GATE_T_100_I_1:   AND3 port map ( O=>T_100, 
            I2=>T_319, 
            I1=>T_320, 
            I0=>T_318 );
  GATE_T_101_I_1:   INV port map ( I0=>AS_000PIN, 
            O=>GATE_T_101_A );
  GATE_T_101_I_2:   AND3 port map ( O=>T_101, 
            I2=>T_317, 
            I1=>T_316, 
            I0=>GATE_T_101_A );
  GATE_T_102_I_1:   INV port map ( I0=>AS_000PIN, 
            O=>GATE_T_102_A );
  GATE_T_102_I_2:   AND3 port map ( O=>T_102, 
            I2=>T_315, 
            I1=>T_314, 
            I0=>GATE_T_102_A );
  GATE_T_103_I_1:   AND4 port map ( O=>T_103, 
            I3=>inst_AS_000_DMAQ, 
            I2=>CLK_030PIN, 
            I1=>inst_CLK_030_HQ, 
            I0=>GATE_T_103_A );
  GATE_T_103_I_2:   INV port map ( I0=>RW_000PIN, 
            O=>GATE_T_103_A );
  GATE_T_104_I_1:   INV port map ( I0=>RW_000PIN, 
            O=>GATE_T_104_A );
  GATE_T_104_I_2:   INV port map ( I0=>inst_CLK_030_HQ, 
            O=>GATE_T_104_B );
  GATE_T_104_I_3:   AND3 port map ( O=>T_104, 
            I0=>inst_DS_000_DMAQ, 
            I2=>GATE_T_104_A, 
            I1=>GATE_T_104_B );
  GATE_T_105_I_1:   INV port map ( I0=>RW_000PIN, 
            O=>GATE_T_105_A );
  GATE_T_105_I_2:   INV port map ( I0=>CLK_030PIN, 
            O=>GATE_T_105_B );
  GATE_T_105_I_3:   AND3 port map ( O=>T_105, 
            I0=>inst_DS_000_DMAQ, 
            I2=>GATE_T_105_A, 
            I1=>GATE_T_105_B );
  GATE_T_106_I_1:   AND2 port map ( O=>T_106, 
            I1=>LDS_000PIN, 
            I0=>UDS_000PIN );
  GATE_T_107_I_1:   NOR2 port map ( O=>T_107, 
            I1=>CYCLE_DMA_1_busQ, 
            I0=>CYCLE_DMA_0_busQ );
  GATE_T_108_I_1:   AND2 port map ( O=>T_108, 
            I1=>CYCLE_DMA_1_busQ, 
            I0=>CYCLE_DMA_0_busQ );
  GATE_T_109_I_1:   AND2 port map ( O=>T_109, 
            I1=>LDS_000PIN, 
            I0=>UDS_000PIN );
  GATE_T_110_I_1:   NOR2 port map ( O=>T_110, 
            I1=>CYCLE_DMA_1_busQ, 
            I0=>CYCLE_DMA_0_busQ );
  GATE_T_111_I_1:   AND2 port map ( O=>T_111, 
            I1=>CYCLE_DMA_1_busQ, 
            I0=>CYCLE_DMA_0_busQ );
  GATE_T_112_I_1:   AND2 port map ( O=>T_112, 
            I1=>inst_AS_000_DMAQ, 
            I0=>GATE_T_112_A );
  GATE_T_112_I_2:   INV port map ( O=>GATE_T_112_A, 
            I0=>CLK_030PIN );
  GATE_T_113_I_1:   AND4 port map ( O=>T_113, 
            I3=>T_350, 
            I2=>T_351, 
            I1=>T_352, 
            I0=>T_353 );
  GATE_T_114_I_1:   AND4 port map ( O=>T_114, 
            I3=>T_346, 
            I2=>T_347, 
            I1=>T_348, 
            I0=>T_349 );
  GATE_T_115_I_1:   AND4 port map ( O=>T_115, 
            I3=>T_342, 
            I2=>T_343, 
            I1=>T_344, 
            I0=>T_345 );
  GATE_T_116_I_1:   AND4 port map ( O=>T_116, 
            I3=>T_338, 
            I2=>T_339, 
            I1=>T_340, 
            I0=>T_341 );
  GATE_T_117_I_1:   AND4 port map ( O=>T_117, 
            I3=>T_334, 
            I2=>T_335, 
            I1=>T_336, 
            I0=>T_337 );
  GATE_T_118_I_1:   AND4 port map ( O=>T_118, 
            I3=>T_330, 
            I2=>T_331, 
            I1=>T_332, 
            I0=>T_333 );
  GATE_T_119_I_3:   AND4 port map ( O=>T_119, 
            I3=>BERRPIN, 
            I2=>RSTPIN, 
            I1=>GATE_T_119_B, 
            I0=>GATE_T_119_A );
  GATE_T_119_I_2:   INV port map ( I0=>inst_AS_030_000_SYNCQ, 
            O=>GATE_T_119_B );
  GATE_T_119_I_1:   INV port map ( I0=>inst_AS_030_D0Q, 
            O=>GATE_T_119_A );
  GATE_T_120_I_1:   AND4 port map ( O=>T_120, 
            I3=>BGACK_030Q, 
            I2=>RSTPIN, 
            I1=>inst_BGACK_030_INT_DQ, 
            I0=>GATE_T_120_A );
  GATE_T_120_I_2:   INV port map ( I0=>inst_AMIGA_BUS_ENABLE_DMA_LOWQ, 
            O=>GATE_T_120_A );
  GATE_T_121_I_1:   INV port map ( I0=>BGACK_030Q, 
            O=>GATE_T_121_A );
  GATE_T_121_I_2:   AND3 port map ( O=>T_121, 
            I2=>A_1XPIN, 
            I1=>RSTPIN, 
            I0=>GATE_T_121_A );
  GATE_T_122_I_3:   AND4 port map ( O=>T_122, 
            I3=>BERRPIN, 
            I2=>RSTPIN, 
            I1=>GATE_T_122_B, 
            I0=>GATE_T_122_A );
  GATE_T_122_I_2:   INV port map ( I0=>inst_AS_030_D0Q, 
            O=>GATE_T_122_B );
  GATE_T_122_I_1:   INV port map ( I0=>inst_AS_000_INTQ, 
            O=>GATE_T_122_A );
  GATE_T_123_I_1:   AND4 port map ( O=>T_123, 
            I3=>SM_AMIGA_6_busQ, 
            I2=>CLK_000_D_0_busQ, 
            I1=>RSTPIN, 
            I0=>GATE_T_123_A );
  GATE_T_123_I_2:   INV port map ( I0=>CLK_000_D_1_busQ, 
            O=>GATE_T_123_A );
  GATE_T_124_I_1:   INV port map ( I0=>CLK_000_D_0_busQ, 
            O=>GATE_T_124_A );
  GATE_T_124_I_2:   AND3 port map ( O=>T_124, 
            I2=>T_355, 
            I1=>T_354, 
            I0=>GATE_T_124_A );
  GATE_T_125_I_1:   AND2 port map ( O=>T_125, 
            I1=>CLK_000_D_0_busQ, 
            I0=>cpu_est_1_busQ );
  GATE_T_126_I_1:   AND2 port map ( O=>T_126, 
            I1=>cpu_est_1_busQ, 
            I0=>GATE_T_126_A );
  GATE_T_126_I_2:   INV port map ( O=>GATE_T_126_A, 
            I0=>CLK_000_D_1_busQ );
  GATE_T_127_I_1:   AND2 port map ( O=>T_127, 
            I1=>cpu_est_1_busQ, 
            I0=>GATE_T_127_A );
  GATE_T_127_I_2:   INV port map ( O=>GATE_T_127_A, 
            I0=>cpu_est_0_busQ );
  GATE_T_128_I_1:   INV port map ( I0=>CLK_000_D_0_busQ, 
            O=>GATE_T_128_A );
  GATE_T_128_I_2:   INV port map ( I0=>cpu_est_0_busQ, 
            O=>GATE_T_128_B );
  GATE_T_128_I_3:   AND3 port map ( O=>T_128, 
            I0=>CLK_000_D_1_busQ, 
            I2=>GATE_T_128_A, 
            I1=>GATE_T_128_B );
  GATE_T_129_I_1:   AND2 port map ( O=>T_129, 
            I1=>CLK_000_D_0_busQ, 
            I0=>cpu_est_0_busQ );
  GATE_T_130_I_1:   AND2 port map ( O=>T_130, 
            I1=>cpu_est_0_busQ, 
            I0=>GATE_T_130_A );
  GATE_T_130_I_2:   INV port map ( O=>GATE_T_130_A, 
            I0=>CLK_000_D_1_busQ );
  GATE_T_131_I_1:   INV port map ( I0=>CLK_000_D_0_busQ, 
            O=>GATE_T_131_A );
  GATE_T_131_I_2:   AND3 port map ( O=>T_131, 
            I2=>T_357, 
            I1=>T_356, 
            I0=>GATE_T_131_A );
  GATE_T_132_I_1:   INV port map ( I0=>cpu_est_2_busQ, 
            O=>GATE_T_132_A );
  GATE_T_132_I_2:   INV port map ( I0=>cpu_est_0_busQ, 
            O=>GATE_T_132_B );
  GATE_T_132_I_3:   AND3 port map ( O=>T_132, 
            I0=>cpu_est_3_busQ, 
            I2=>GATE_T_132_A, 
            I1=>GATE_T_132_B );
  GATE_T_133_I_1:   AND2 port map ( O=>T_133, 
            I1=>CLK_000_D_0_busQ, 
            I0=>cpu_est_3_busQ );
  GATE_T_134_I_1:   AND2 port map ( O=>T_134, 
            I1=>cpu_est_3_busQ, 
            I0=>GATE_T_134_A );
  GATE_T_134_I_2:   INV port map ( O=>GATE_T_134_A, 
            I0=>CLK_000_D_1_busQ );
  GATE_T_135_I_1:   AND4 port map ( O=>T_135, 
            I3=>T_370, 
            I2=>T_371, 
            I1=>T_372, 
            I0=>GATE_T_135_A );
  GATE_T_135_I_2:   INV port map ( I0=>IPL_D0_2_busQ, 
            O=>GATE_T_135_A );
  GATE_T_136_I_1:   AND4 port map ( O=>T_136, 
            I3=>T_367, 
            I2=>T_368, 
            I1=>T_369, 
            I0=>GATE_T_136_A );
  GATE_T_136_I_2:   INV port map ( I0=>IPL_D0_2_busQ, 
            O=>GATE_T_136_A );
  GATE_T_137_I_1:   AND4 port map ( O=>T_137, 
            I3=>T_364, 
            I2=>T_365, 
            I1=>T_366, 
            I0=>IPL_D0_2_busQ );
  GATE_T_138_I_1:   AND4 port map ( O=>T_138, 
            I3=>T_361, 
            I2=>T_362, 
            I1=>T_363, 
            I0=>IPL_D0_2_busQ );
  GATE_T_139_I_3:   AND4 port map ( O=>T_139, 
            I3=>RSTPIN, 
            I2=>IPL_2XPIN, 
            I1=>GATE_T_139_B, 
            I0=>GATE_T_139_A );
  GATE_T_139_I_2:   INV port map ( I0=>IPL_030_0XQ, 
            O=>GATE_T_139_B );
  GATE_T_139_I_1:   INV port map ( I0=>IPL_D0_2_busQ, 
            O=>GATE_T_139_A );
  GATE_T_140_I_3:   AND4 port map ( O=>T_140, 
            I3=>IPL_D0_2_busQ, 
            I2=>RSTPIN, 
            I1=>GATE_T_140_B, 
            I0=>GATE_T_140_A );
  GATE_T_140_I_2:   INV port map ( I0=>IPL_030_0XQ, 
            O=>GATE_T_140_B );
  GATE_T_140_I_1:   INV port map ( I0=>IPL_2XPIN, 
            O=>GATE_T_140_A );
  GATE_T_141_I_3:   AND4 port map ( O=>T_141, 
            I3=>IPL_1XPIN, 
            I2=>RSTPIN, 
            I1=>GATE_T_141_B, 
            I0=>GATE_T_141_A );
  GATE_T_141_I_2:   INV port map ( I0=>IPL_030_0XQ, 
            O=>GATE_T_141_B );
  GATE_T_141_I_1:   INV port map ( I0=>IPL_D0_1_busQ, 
            O=>GATE_T_141_A );
  GATE_T_142_I_3:   AND4 port map ( O=>T_142, 
            I3=>IPL_D0_1_busQ, 
            I2=>RSTPIN, 
            I1=>GATE_T_142_B, 
            I0=>GATE_T_142_A );
  GATE_T_142_I_2:   INV port map ( I0=>IPL_030_0XQ, 
            O=>GATE_T_142_B );
  GATE_T_142_I_1:   INV port map ( I0=>IPL_1XPIN, 
            O=>GATE_T_142_A );
  GATE_T_143_I_1:   INV port map ( I0=>IPL_030_0XQ, 
            O=>GATE_T_143_A );
  GATE_T_143_I_2:   INV port map ( I0=>IPL_D0_0_busQ, 
            O=>GATE_T_143_B );
  GATE_T_143_I_3:   AND3 port map ( O=>T_143, 
            I0=>RSTPIN, 
            I2=>GATE_T_143_A, 
            I1=>GATE_T_143_B );
  GATE_T_144_I_1:   INV port map ( I0=>IPL_030_0XQ, 
            O=>GATE_T_144_A );
  GATE_T_144_I_2:   INV port map ( I0=>IPL_0XPIN, 
            O=>GATE_T_144_B );
  GATE_T_144_I_3:   AND3 port map ( O=>T_144, 
            I0=>RSTPIN, 
            I2=>GATE_T_144_A, 
            I1=>GATE_T_144_B );
  GATE_T_145_I_1:   AND4 port map ( O=>T_145, 
            I3=>T_385, 
            I2=>T_386, 
            I1=>T_387, 
            I0=>GATE_T_145_A );
  GATE_T_145_I_2:   INV port map ( I0=>IPL_D0_2_busQ, 
            O=>GATE_T_145_A );
  GATE_T_146_I_1:   AND4 port map ( O=>T_146, 
            I3=>T_382, 
            I2=>T_383, 
            I1=>T_384, 
            I0=>GATE_T_146_A );
  GATE_T_146_I_2:   INV port map ( I0=>IPL_D0_2_busQ, 
            O=>GATE_T_146_A );
  GATE_T_147_I_1:   AND4 port map ( O=>T_147, 
            I3=>T_379, 
            I2=>T_380, 
            I1=>T_381, 
            I0=>IPL_D0_2_busQ );
  GATE_T_148_I_1:   AND4 port map ( O=>T_148, 
            I3=>T_376, 
            I2=>T_377, 
            I1=>T_378, 
            I0=>IPL_D0_2_busQ );
  GATE_T_149_I_3:   AND4 port map ( O=>T_149, 
            I3=>RSTPIN, 
            I2=>IPL_2XPIN, 
            I1=>GATE_T_149_B, 
            I0=>GATE_T_149_A );
  GATE_T_149_I_2:   INV port map ( I0=>IPL_030_1XQ, 
            O=>GATE_T_149_B );
  GATE_T_149_I_1:   INV port map ( I0=>IPL_D0_2_busQ, 
            O=>GATE_T_149_A );
  GATE_T_150_I_3:   AND4 port map ( O=>T_150, 
            I3=>IPL_D0_2_busQ, 
            I2=>RSTPIN, 
            I1=>GATE_T_150_B, 
            I0=>GATE_T_150_A );
  GATE_T_150_I_2:   INV port map ( I0=>IPL_030_1XQ, 
            O=>GATE_T_150_B );
  GATE_T_150_I_1:   INV port map ( I0=>IPL_2XPIN, 
            O=>GATE_T_150_A );
  GATE_T_151_I_3:   AND4 port map ( O=>T_151, 
            I3=>IPL_0XPIN, 
            I2=>RSTPIN, 
            I1=>GATE_T_151_B, 
            I0=>GATE_T_151_A );
  GATE_T_151_I_2:   INV port map ( I0=>IPL_030_1XQ, 
            O=>GATE_T_151_B );
  GATE_T_151_I_1:   INV port map ( I0=>IPL_D0_0_busQ, 
            O=>GATE_T_151_A );
  GATE_T_152_I_3:   AND4 port map ( O=>T_152, 
            I3=>IPL_D0_0_busQ, 
            I2=>RSTPIN, 
            I1=>GATE_T_152_B, 
            I0=>GATE_T_152_A );
  GATE_T_152_I_2:   INV port map ( I0=>IPL_030_1XQ, 
            O=>GATE_T_152_B );
  GATE_T_152_I_1:   INV port map ( I0=>IPL_0XPIN, 
            O=>GATE_T_152_A );
  GATE_T_153_I_1:   INV port map ( I0=>IPL_030_1XQ, 
            O=>GATE_T_153_A );
  GATE_T_153_I_2:   INV port map ( I0=>IPL_D0_1_busQ, 
            O=>GATE_T_153_B );
  GATE_T_153_I_3:   AND3 port map ( O=>T_153, 
            I0=>RSTPIN, 
            I2=>GATE_T_153_A, 
            I1=>GATE_T_153_B );
  GATE_T_154_I_1:   INV port map ( I0=>IPL_030_1XQ, 
            O=>GATE_T_154_A );
  GATE_T_154_I_2:   INV port map ( I0=>IPL_1XPIN, 
            O=>GATE_T_154_B );
  GATE_T_154_I_3:   AND3 port map ( O=>T_154, 
            I0=>RSTPIN, 
            I2=>GATE_T_154_A, 
            I1=>GATE_T_154_B );
  GATE_T_155_I_1:   AND3 port map ( O=>T_155, 
            I2=>inst_BGACK_030_INT_DQ, 
            I1=>BGACK_030Q, 
            I0=>A_0XQ );
  GATE_T_156_I_1:   AND2 port map ( O=>T_156, 
            I1=>UDS_000PIN, 
            I0=>GATE_T_156_A );
  GATE_T_156_I_2:   INV port map ( O=>GATE_T_156_A, 
            I0=>BGACK_030Q );
  GATE_T_157_I_1:   AND4 port map ( O=>T_157, 
            I3=>BGACK_030Q, 
            I2=>RSTPIN, 
            I1=>inst_BGACK_030_INT_DQ, 
            I0=>GATE_T_157_A );
  GATE_T_157_I_2:   INV port map ( I0=>RWQ, 
            O=>GATE_T_157_A );
  GATE_T_158_I_1:   INV port map ( I0=>RW_000PIN, 
            O=>GATE_T_158_A );
  GATE_T_158_I_2:   INV port map ( I0=>BGACK_030Q, 
            O=>GATE_T_158_B );
  GATE_T_158_I_3:   AND3 port map ( O=>T_158, 
            I0=>RSTPIN, 
            I2=>GATE_T_158_A, 
            I1=>GATE_T_158_B );
  GATE_T_159_I_1:   AND3 port map ( O=>T_159, 
            I2=>T_392, 
            I1=>T_393, 
            I0=>T_391 );
  GATE_T_160_I_1:   AND4 port map ( O=>T_160, 
            I3=>T_388, 
            I2=>T_389, 
            I1=>T_390, 
            I0=>CLK_000_D_0_busQ );
  GATE_T_161_I_1:   NOR2 port map ( O=>T_161, 
            I1=>VMAQ, 
            I0=>RSTPIN );
  GATE_T_162_I_1:   AND3 port map ( O=>T_162, 
            I2=>T_399, 
            I1=>SM_AMIGA_1_busQ, 
            I0=>T_398 );
  GATE_T_163_I_1:   AND3 port map ( O=>T_163, 
            I2=>T_397, 
            I1=>SM_AMIGA_1_busQ, 
            I0=>T_396 );
  GATE_T_164_I_3:   AND4 port map ( O=>T_164, 
            I3=>BERRPIN, 
            I2=>RSTPIN, 
            I1=>GATE_T_164_B, 
            I0=>GATE_T_164_A );
  GATE_T_164_I_2:   INV port map ( I0=>DSACK1Q, 
            O=>GATE_T_164_B );
  GATE_T_164_I_1:   INV port map ( I0=>inst_AS_030_D0Q, 
            O=>GATE_T_164_A );
  GATE_T_165_I_1:   AND4 port map ( O=>T_165, 
            I3=>SM_AMIGA_1_busQ, 
            I2=>CLK_000_D_8_busQ, 
            I1=>RSTPIN, 
            I0=>GATE_T_165_A );
  GATE_T_165_I_2:   INV port map ( I0=>CLK_000_D_7_busQ, 
            O=>GATE_T_165_A );
  GATE_T_166_I_1:   AND4 port map ( O=>T_166, 
            I3=>CLK_000_D_1_busQ, 
            I2=>RSTPIN, 
            I1=>SM_AMIGA_1_busQ, 
            I0=>GATE_T_166_A );
  GATE_T_166_I_2:   INV port map ( I0=>CLK_000_D_0_busQ, 
            O=>GATE_T_166_A );
  GATE_T_167_I_1:   AND4 port map ( O=>T_167, 
            I3=>AS_000PIN, 
            I2=>CLK_000_D_0_busQ, 
            I1=>BGACK_000PIN, 
            I0=>GATE_T_167_A );
  GATE_T_167_I_2:   INV port map ( I0=>CLK_000_D_1_busQ, 
            O=>GATE_T_167_A );
  GATE_T_168_I_1:   AND2 port map ( O=>T_168, 
            I1=>BGACK_030Q, 
            I0=>BGACK_000PIN );
  GATE_T_169_I_1:   AND3 port map ( O=>T_169, 
            I2=>T_401, 
            I1=>CLK_000_D_0_busQ, 
            I0=>T_400 );
  GATE_T_170_I_1:   INV port map ( I0=>BG_000Q, 
            O=>GATE_T_170_A );
  GATE_T_170_I_2:   INV port map ( I0=>BG_030PIN, 
            O=>GATE_T_170_B );
  GATE_T_170_I_3:   AND3 port map ( O=>T_170, 
            I0=>RSTPIN, 
            I2=>GATE_T_170_A, 
            I1=>GATE_T_170_B );
  GATE_T_171_I_1:   AND4 port map ( O=>T_171, 
            I3=>T_404, 
            I2=>T_405, 
            I1=>T_406, 
            I0=>GATE_T_171_A );
  GATE_T_171_I_2:   INV port map ( I0=>RWPIN, 
            O=>GATE_T_171_A );
  GATE_T_172_I_1:   AND3 port map ( O=>T_172, 
            I2=>T_403, 
            I1=>SM_AMIGA_i_7_busQ, 
            I0=>T_402 );
  GATE_T_173_I_3:   AND4 port map ( O=>T_173, 
            I3=>SM_AMIGA_i_7_busQ, 
            I2=>RSTPIN, 
            I1=>GATE_T_173_B, 
            I0=>GATE_T_173_A );
  GATE_T_173_I_2:   INV port map ( I0=>RW_000Q, 
            O=>GATE_T_173_B );
  GATE_T_173_I_1:   INV port map ( I0=>CLK_000_D_0_busQ, 
            O=>GATE_T_173_A );
  GATE_T_174_I_1:   AND4 port map ( O=>T_174, 
            I3=>CLK_000_D_1_busQ, 
            I2=>RSTPIN, 
            I1=>SM_AMIGA_i_7_busQ, 
            I0=>GATE_T_174_A );
  GATE_T_174_I_2:   INV port map ( I0=>RW_000Q, 
            O=>GATE_T_174_A );
  GATE_T_175_I_1:   AND4 port map ( O=>T_175, 
            I3=>T_419, 
            I2=>T_420, 
            I1=>T_421, 
            I0=>GATE_T_175_A );
  GATE_T_175_I_2:   INV port map ( I0=>IPL_D0_2_busQ, 
            O=>GATE_T_175_A );
  GATE_T_176_I_1:   AND4 port map ( O=>T_176, 
            I3=>T_416, 
            I2=>T_417, 
            I1=>T_418, 
            I0=>GATE_T_176_A );
  GATE_T_176_I_2:   INV port map ( I0=>IPL_D0_2_busQ, 
            O=>GATE_T_176_A );
  GATE_T_177_I_1:   AND4 port map ( O=>T_177, 
            I3=>T_413, 
            I2=>T_414, 
            I1=>T_415, 
            I0=>GATE_T_177_A );
  GATE_T_177_I_2:   INV port map ( I0=>IPL_D0_2_busQ, 
            O=>GATE_T_177_A );
  GATE_T_178_I_1:   AND4 port map ( O=>T_178, 
            I3=>T_410, 
            I2=>T_411, 
            I1=>T_412, 
            I0=>GATE_T_178_A );
  GATE_T_178_I_2:   INV port map ( I0=>IPL_D0_2_busQ, 
            O=>GATE_T_178_A );
  GATE_T_179_I_3:   AND4 port map ( O=>T_179, 
            I3=>IPL_1XPIN, 
            I2=>RSTPIN, 
            I1=>GATE_T_179_B, 
            I0=>GATE_T_179_A );
  GATE_T_179_I_2:   INV port map ( I0=>IPL_030_2XQ, 
            O=>GATE_T_179_B );
  GATE_T_179_I_1:   INV port map ( I0=>IPL_D0_1_busQ, 
            O=>GATE_T_179_A );
  GATE_T_180_I_3:   AND4 port map ( O=>T_180, 
            I3=>IPL_D0_1_busQ, 
            I2=>RSTPIN, 
            I1=>GATE_T_180_B, 
            I0=>GATE_T_180_A );
  GATE_T_180_I_2:   INV port map ( I0=>IPL_030_2XQ, 
            O=>GATE_T_180_B );
  GATE_T_180_I_1:   INV port map ( I0=>IPL_1XPIN, 
            O=>GATE_T_180_A );
  GATE_T_181_I_3:   AND4 port map ( O=>T_181, 
            I3=>IPL_0XPIN, 
            I2=>RSTPIN, 
            I1=>GATE_T_181_B, 
            I0=>GATE_T_181_A );
  GATE_T_181_I_2:   INV port map ( I0=>IPL_030_2XQ, 
            O=>GATE_T_181_B );
  GATE_T_181_I_1:   INV port map ( I0=>IPL_D0_0_busQ, 
            O=>GATE_T_181_A );
  GATE_T_182_I_3:   AND4 port map ( O=>T_182, 
            I3=>IPL_D0_0_busQ, 
            I2=>RSTPIN, 
            I1=>GATE_T_182_B, 
            I0=>GATE_T_182_A );
  GATE_T_182_I_2:   INV port map ( I0=>IPL_030_2XQ, 
            O=>GATE_T_182_B );
  GATE_T_182_I_1:   INV port map ( I0=>IPL_0XPIN, 
            O=>GATE_T_182_A );
  GATE_T_183_I_1:   INV port map ( I0=>IPL_030_2XQ, 
            O=>GATE_T_183_A );
  GATE_T_183_I_2:   INV port map ( I0=>IPL_D0_2_busQ, 
            O=>GATE_T_183_B );
  GATE_T_183_I_3:   AND3 port map ( O=>T_183, 
            I0=>RSTPIN, 
            I2=>GATE_T_183_A, 
            I1=>GATE_T_183_B );
  GATE_T_184_I_1:   INV port map ( I0=>IPL_030_2XQ, 
            O=>GATE_T_184_A );
  GATE_T_184_I_2:   INV port map ( I0=>IPL_2XPIN, 
            O=>GATE_T_184_B );
  GATE_T_184_I_3:   AND3 port map ( O=>T_184, 
            I0=>RSTPIN, 
            I2=>GATE_T_184_A, 
            I1=>GATE_T_184_B );
  GATE_T_185_I_1:   AND4 port map ( O=>T_185, 
            I3=>T_422, 
            I2=>T_423, 
            I1=>T_424, 
            I0=>GATE_T_185_A );
  GATE_T_185_I_2:   INV port map ( I0=>AHIGH_31XPIN, 
            O=>GATE_T_185_A );
  GATE_T_186_I_1:   AND2 port map ( O=>T_186, 
            I1=>inst_AMIGA_BUS_ENABLE_DMA_HIGHQ, 
            I0=>GATE_T_186_A );
  GATE_T_186_I_2:   INV port map ( O=>GATE_T_186_A, 
            I0=>BGACK_030Q );
  GATE_T_187_I_1:   AND2 port map ( O=>T_187, 
            I1=>inst_AS_030_000_SYNCQ, 
            I0=>BGACK_030Q );
  GATE_T_188_I_1:   NOR4 port map ( I0=>nEXP_SPACEPIN, 
            I1=>BGACK_030Q, 
            O=>T_188, 
            I2=>AS_000PIN, 
            I3=>GATE_T_188_DN );
  GATE_T_188_I_2:   INV port map ( I0=>RW_000PIN, 
            O=>GATE_T_188_DN );
  GATE_T_189_I_1:   AND2 port map ( O=>T_189, 
            I1=>BGACK_030Q, 
            I0=>GATE_T_189_A );
  GATE_T_189_I_2:   INV port map ( O=>GATE_T_189_A, 
            I0=>RW_000PIN );
  GATE_T_190_I_1:   INV port map ( I0=>cpu_est_2_busQ, 
            O=>GATE_T_190_A );
  GATE_T_190_I_2:   INV port map ( I0=>cpu_est_1_busQ, 
            O=>GATE_T_190_B );
  GATE_T_190_I_3:   AND3 port map ( O=>T_190, 
            I0=>cpu_est_3_busQ, 
            I2=>GATE_T_190_A, 
            I1=>GATE_T_190_B );
  GATE_T_191_I_1:   INV port map ( I0=>cpu_est_3_busQ, 
            O=>GATE_T_191_A );
  GATE_T_191_I_2:   AND3 port map ( O=>T_191, 
            I2=>cpu_est_1_busQ, 
            I1=>cpu_est_2_busQ, 
            I0=>GATE_T_191_A );
  GATE_T_192_I_1:   OR4 port map ( I0=>T_35, 
            I1=>T_36, 
            O=>T_192, 
            I2=>T_37, 
            I3=>T_38 );
  GATE_T_193_I_1:   OR4 port map ( I0=>T_31, 
            I1=>T_32, 
            O=>T_193, 
            I2=>T_33, 
            I3=>T_34 );
  GATE_T_194_I_1:   OR4 port map ( I0=>T_27, 
            I1=>T_28, 
            O=>T_194, 
            I2=>T_29, 
            I3=>T_30 );
  GATE_T_195_I_1:   AND2 port map ( O=>T_195, 
            I1=>SM_AMIGA_6_busQ, 
            I0=>CLK_000_D_0_busQ );
  GATE_T_196_I_1:   AND2 port map ( O=>T_196, 
            I1=>RSTPIN, 
            I0=>GATE_T_196_A );
  GATE_T_196_I_2:   INV port map ( O=>GATE_T_196_A, 
            I0=>CLK_000_D_1_busQ );
  GATE_T_197_I_1:   AND2 port map ( O=>T_197, 
            I1=>SM_AMIGA_4_busQ, 
            I0=>CLK_000_D_0_busQ );
  GATE_T_198_I_1:   AND2 port map ( O=>T_198, 
            I1=>RSTPIN, 
            I0=>GATE_T_198_A );
  GATE_T_198_I_2:   INV port map ( O=>GATE_T_198_A, 
            I0=>CLK_000_D_1_busQ );
  GATE_T_199_I_1:   AND2 port map ( O=>T_199, 
            I1=>SM_AMIGA_1_busQ, 
            I0=>GATE_T_199_A );
  GATE_T_199_I_2:   INV port map ( O=>GATE_T_199_A, 
            I0=>CLK_000_D_0_busQ );
  GATE_T_200_I_1:   AND2 port map ( O=>T_200, 
            I1=>CLK_000_D_1_busQ, 
            I0=>RSTPIN );
  GATE_T_201_I_1:   AND2 port map ( O=>T_201, 
            I1=>SM_AMIGA_5_busQ, 
            I0=>GATE_T_201_A );
  GATE_T_201_I_2:   INV port map ( O=>GATE_T_201_A, 
            I0=>CLK_000_D_0_busQ );
  GATE_T_202_I_1:   AND2 port map ( O=>T_202, 
            I1=>CLK_000_D_1_busQ, 
            I0=>RSTPIN );
  GATE_T_203_I_1:   AND2 port map ( O=>T_203, 
            I1=>SM_AMIGA_2_busQ, 
            I0=>CLK_000_D_0_busQ );
  GATE_T_204_I_1:   AND2 port map ( O=>T_204, 
            I1=>RSTPIN, 
            I0=>GATE_T_204_A );
  GATE_T_204_I_2:   INV port map ( O=>GATE_T_204_A, 
            I0=>CLK_000_D_1_busQ );
  GATE_T_205_I_1:   AND2 port map ( O=>T_205, 
            I1=>SM_AMIGA_3_busQ, 
            I0=>GATE_T_205_A );
  GATE_T_205_I_2:   INV port map ( O=>GATE_T_205_A, 
            I0=>CLK_000_D_0_busQ );
  GATE_T_206_I_1:   AND2 port map ( O=>T_206, 
            I1=>CLK_000_D_1_busQ, 
            I0=>GATE_T_206_A );
  GATE_T_206_I_2:   INV port map ( O=>GATE_T_206_A, 
            I0=>inst_DTACK_D0Q );
  GATE_T_207_I_1:   AND2 port map ( O=>T_207, 
            I1=>inst_VPA_DQ, 
            I0=>RSTPIN );
  GATE_T_208_I_1:   NOR3 port map ( O=>T_208, 
            I2=>SM_AMIGA_3_busQ, 
            I1=>SM_AMIGA_5_busQ, 
            I0=>SM_AMIGA_2_busQ );
  GATE_T_209_I_1:   NOR3 port map ( O=>T_209, 
            I2=>SM_AMIGA_4_busQ, 
            I1=>SM_AMIGA_6_busQ, 
            I0=>SM_AMIGA_1_busQ );
  GATE_T_210_I_1:   INV port map ( I0=>CLK_000_D_1_busQ, 
            O=>GATE_T_210_A );
  GATE_T_210_I_2:   AND3 port map ( O=>T_210, 
            I2=>RSTPIN, 
            I1=>CLK_000_D_0_busQ, 
            I0=>GATE_T_210_A );
  GATE_T_211_I_1:   NOR3 port map ( O=>T_211, 
            I2=>SM_AMIGA_3_busQ, 
            I1=>SM_AMIGA_5_busQ, 
            I0=>SM_AMIGA_2_busQ );
  GATE_T_212_I_1:   NOR3 port map ( O=>T_212, 
            I2=>SM_AMIGA_4_busQ, 
            I1=>SM_AMIGA_0_busQ, 
            I0=>SM_AMIGA_1_busQ );
  GATE_T_213_I_1:   INV port map ( I0=>SM_AMIGA_6_busQ, 
            O=>GATE_T_213_A );
  GATE_T_213_I_2:   INV port map ( I0=>nEXP_SPACEPIN, 
            O=>GATE_T_213_B );
  GATE_T_213_I_3:   AND3 port map ( O=>T_213, 
            I0=>RSTPIN, 
            I2=>GATE_T_213_A, 
            I1=>GATE_T_213_B );
  GATE_T_214_I_1:   NOR3 port map ( O=>T_214, 
            I2=>SM_AMIGA_3_busQ, 
            I1=>SM_AMIGA_5_busQ, 
            I0=>SM_AMIGA_2_busQ );
  GATE_T_215_I_1:   NOR3 port map ( O=>T_215, 
            I2=>SM_AMIGA_4_busQ, 
            I1=>SM_AMIGA_0_busQ, 
            I0=>SM_AMIGA_1_busQ );
  GATE_T_216_I_1:   INV port map ( I0=>SM_AMIGA_6_busQ, 
            O=>GATE_T_216_A );
  GATE_T_216_I_2:   AND3 port map ( O=>T_216, 
            I2=>inst_AS_030_000_SYNCQ, 
            I1=>RSTPIN, 
            I0=>GATE_T_216_A );
  GATE_T_217_I_1:   NOR3 port map ( O=>T_217, 
            I2=>SM_AMIGA_3_busQ, 
            I1=>SM_AMIGA_5_busQ, 
            I0=>SM_AMIGA_2_busQ );
  GATE_T_218_I_1:   NOR3 port map ( O=>T_218, 
            I2=>SM_AMIGA_4_busQ, 
            I1=>SM_AMIGA_0_busQ, 
            I0=>SM_AMIGA_1_busQ );
  GATE_T_219_I_1:   INV port map ( I0=>SM_AMIGA_6_busQ, 
            O=>GATE_T_219_A );
  GATE_T_219_I_2:   INV port map ( I0=>CLK_000_D_1_busQ, 
            O=>GATE_T_219_B );
  GATE_T_219_I_3:   AND3 port map ( O=>T_219, 
            I0=>RSTPIN, 
            I2=>GATE_T_219_A, 
            I1=>GATE_T_219_B );
  GATE_T_220_I_1:   NOR3 port map ( O=>T_220, 
            I2=>SM_AMIGA_3_busQ, 
            I1=>SM_AMIGA_5_busQ, 
            I0=>SM_AMIGA_2_busQ );
  GATE_T_221_I_1:   NOR3 port map ( O=>T_221, 
            I2=>SM_AMIGA_4_busQ, 
            I1=>SM_AMIGA_0_busQ, 
            I0=>SM_AMIGA_1_busQ );
  GATE_T_222_I_1:   INV port map ( I0=>SM_AMIGA_6_busQ, 
            O=>GATE_T_222_A );
  GATE_T_222_I_2:   AND3 port map ( O=>T_222, 
            I2=>CLK_000_D_0_busQ, 
            I1=>RSTPIN, 
            I0=>GATE_T_222_A );
  GATE_T_223_I_1:   AND2 port map ( O=>T_223, 
            I1=>SM_AMIGA_3_busQ, 
            I0=>GATE_T_223_A );
  GATE_T_223_I_2:   INV port map ( O=>GATE_T_223_A, 
            I0=>BERRPIN );
  GATE_T_224_I_1:   INV port map ( I0=>CLK_000_D_0_busQ, 
            O=>GATE_T_224_A );
  GATE_T_224_I_2:   INV port map ( I0=>inst_VPA_DQ, 
            O=>GATE_T_224_B );
  GATE_T_224_I_3:   AND3 port map ( O=>T_224, 
            I0=>CLK_000_D_1_busQ, 
            I2=>GATE_T_224_A, 
            I1=>GATE_T_224_B );
  GATE_T_225_I_1:   NOR3 port map ( O=>T_225, 
            I2=>cpu_est_1_busQ, 
            I1=>cpu_est_0_busQ, 
            I0=>cpu_est_2_busQ );
  GATE_T_226_I_1:   INV port map ( I0=>VMAQ, 
            O=>GATE_T_226_A );
  GATE_T_226_I_2:   AND3 port map ( O=>T_226, 
            I2=>RSTPIN, 
            I1=>cpu_est_3_busQ, 
            I0=>GATE_T_226_A );
  GATE_T_227_I_1:   NOR2 port map ( O=>T_227, 
            I1=>BERRPIN, 
            I0=>SM_AMIGA_2_busQ );
  GATE_T_228_I_1:   NOR3 port map ( O=>T_228, 
            I2=>SM_AMIGA_4_busQ, 
            I1=>SM_AMIGA_0_busQ, 
            I0=>SM_AMIGA_3_busQ );
  GATE_T_229_I_1:   INV port map ( I0=>SM_AMIGA_6_busQ, 
            O=>GATE_T_229_A );
  GATE_T_229_I_2:   INV port map ( I0=>CLK_000_D_0_busQ, 
            O=>GATE_T_229_B );
  GATE_T_229_I_3:   AND3 port map ( O=>T_229, 
            I0=>CLK_000_D_1_busQ, 
            I2=>GATE_T_229_A, 
            I1=>GATE_T_229_B );
  GATE_T_230_I_1:   INV port map ( I0=>inst_AS_030_000_SYNCQ, 
            O=>GATE_T_230_A );
  GATE_T_230_I_2:   AND3 port map ( O=>T_230, 
            I2=>RSTPIN, 
            I1=>nEXP_SPACEPIN, 
            I0=>GATE_T_230_A );
  GATE_T_231_I_1:   AND2 port map ( O=>T_231, 
            I1=>SM_AMIGA_4_busQ, 
            I0=>CLK_000_D_0_busQ );
  GATE_T_232_I_1:   AND2 port map ( O=>T_232, 
            I1=>RSTPIN, 
            I0=>GATE_T_232_A );
  GATE_T_232_I_2:   INV port map ( O=>GATE_T_232_A, 
            I0=>CLK_000_D_1_busQ );
  GATE_T_233_I_1:   AND2 port map ( O=>T_233, 
            I1=>SM_AMIGA_4_busQ, 
            I0=>CLK_000_D_0_busQ );
  GATE_T_234_I_1:   AND2 port map ( O=>T_234, 
            I1=>RSTPIN, 
            I0=>GATE_T_234_A );
  GATE_T_234_I_2:   INV port map ( O=>GATE_T_234_A, 
            I0=>CLK_000_D_1_busQ );
  GATE_T_235_I_1:   AND2 port map ( O=>T_235, 
            I1=>SM_AMIGA_3_busQ, 
            I0=>GATE_T_235_A );
  GATE_T_235_I_2:   INV port map ( O=>GATE_T_235_A, 
            I0=>CLK_000_D_0_busQ );
  GATE_T_236_I_1:   AND2 port map ( O=>T_236, 
            I1=>CLK_000_D_1_busQ, 
            I0=>GATE_T_236_A );
  GATE_T_236_I_2:   INV port map ( O=>GATE_T_236_A, 
            I0=>inst_DTACK_D0Q );
  GATE_T_237_I_1:   AND2 port map ( O=>T_237, 
            I1=>inst_VPA_DQ, 
            I0=>RSTPIN );
  GATE_T_238_I_1:   AND2 port map ( O=>T_238, 
            I1=>BERRPIN, 
            I0=>SM_AMIGA_3_busQ );
  GATE_T_239_I_1:   INV port map ( I0=>CLK_000_D_0_busQ, 
            O=>GATE_T_239_A );
  GATE_T_239_I_2:   INV port map ( I0=>inst_VPA_DQ, 
            O=>GATE_T_239_B );
  GATE_T_239_I_3:   AND3 port map ( O=>T_239, 
            I0=>CLK_000_D_1_busQ, 
            I2=>GATE_T_239_A, 
            I1=>GATE_T_239_B );
  GATE_T_240_I_1:   NOR3 port map ( O=>T_240, 
            I2=>cpu_est_1_busQ, 
            I1=>cpu_est_0_busQ, 
            I0=>cpu_est_2_busQ );
  GATE_T_241_I_1:   INV port map ( I0=>VMAQ, 
            O=>GATE_T_241_A );
  GATE_T_241_I_2:   AND3 port map ( O=>T_241, 
            I2=>RSTPIN, 
            I1=>cpu_est_3_busQ, 
            I0=>GATE_T_241_A );
  GATE_T_242_I_1:   AND2 port map ( O=>T_242, 
            I1=>RST_DLY_0_busQ, 
            I0=>GATE_T_242_A );
  GATE_T_242_I_2:   INV port map ( O=>GATE_T_242_A, 
            I0=>CLK_000_D_0_busQ );
  GATE_T_243_I_1:   AND2 port map ( O=>T_243, 
            I1=>CLK_000_D_1_busQ, 
            I0=>RSTPIN );
  GATE_T_244_I_1:   AND2 port map ( O=>T_244, 
            I1=>RST_DLY_0_busQ, 
            I0=>GATE_T_244_A );
  GATE_T_244_I_2:   INV port map ( O=>GATE_T_244_A, 
            I0=>CLK_000_D_0_busQ );
  GATE_T_245_I_1:   AND2 port map ( O=>T_245, 
            I1=>CLK_000_D_1_busQ, 
            I0=>RSTPIN );
  GATE_T_246_I_1:   AND2 port map ( O=>T_246, 
            I1=>SM_AMIGA_3_busQ, 
            I0=>GATE_T_246_A );
  GATE_T_246_I_2:   INV port map ( O=>GATE_T_246_A, 
            I0=>CLK_000_D_0_busQ );
  GATE_T_247_I_1:   AND2 port map ( O=>T_247, 
            I1=>CLK_000_D_1_busQ, 
            I0=>GATE_T_247_A );
  GATE_T_247_I_2:   INV port map ( O=>GATE_T_247_A, 
            I0=>inst_DTACK_D0Q );
  GATE_T_248_I_1:   AND2 port map ( O=>T_248, 
            I1=>inst_VPA_DQ, 
            I0=>RSTPIN );
  GATE_T_249_I_1:   INV port map ( I0=>CLK_000_D_0_busQ, 
            O=>GATE_T_249_A );
  GATE_T_249_I_2:   INV port map ( I0=>inst_VPA_DQ, 
            O=>GATE_T_249_B );
  GATE_T_249_I_3:   AND3 port map ( O=>T_249, 
            I0=>CLK_000_D_1_busQ, 
            I2=>GATE_T_249_A, 
            I1=>GATE_T_249_B );
  GATE_T_250_I_1:   NOR3 port map ( O=>T_250, 
            I2=>cpu_est_1_busQ, 
            I1=>cpu_est_0_busQ, 
            I0=>cpu_est_2_busQ );
  GATE_T_251_I_1:   INV port map ( I0=>VMAQ, 
            O=>GATE_T_251_A );
  GATE_T_251_I_2:   AND3 port map ( O=>T_251, 
            I2=>RSTPIN, 
            I1=>cpu_est_3_busQ, 
            I0=>GATE_T_251_A );
  GATE_T_252_I_1:   OR2 port map ( O=>T_252, 
            I1=>T_63, 
            I0=>T_62 );
  GATE_T_253_I_1:   OR2 port map ( O=>T_253, 
            I1=>T_61, 
            I0=>T_60 );
  GATE_T_254_I_1:   OR2 port map ( O=>T_254, 
            I1=>T_59, 
            I0=>T_58 );
  GATE_T_255_I_1:   OR2 port map ( O=>T_255, 
            I1=>T_57, 
            I0=>T_56 );
  GATE_T_256_I_1:   AND2 port map ( O=>T_256, 
            I1=>inst_CLK_030_HQ, 
            I0=>GATE_T_256_A );
  GATE_T_256_I_2:   INV port map ( O=>GATE_T_256_A, 
            I0=>AS_000PIN );
  GATE_T_257_I_1:   AND2 port map ( O=>T_257, 
            I1=>CYCLE_DMA_1_busQ, 
            I0=>GATE_T_257_A );
  GATE_T_257_I_2:   INV port map ( O=>GATE_T_257_A, 
            I0=>CYCLE_DMA_0_busQ );
  GATE_T_258_I_1:   AND2 port map ( O=>T_258, 
            I1=>RSTPIN, 
            I0=>GATE_T_258_A );
  GATE_T_258_I_2:   INV port map ( O=>GATE_T_258_A, 
            I0=>BGACK_030Q );
  GATE_T_259_I_1:   AND2 port map ( O=>T_259, 
            I1=>inst_CLK_030_HQ, 
            I0=>GATE_T_259_A );
  GATE_T_259_I_2:   INV port map ( O=>GATE_T_259_A, 
            I0=>AS_000PIN );
  GATE_T_260_I_1:   AND2 port map ( O=>T_260, 
            I1=>CYCLE_DMA_0_busQ, 
            I0=>GATE_T_260_A );
  GATE_T_260_I_2:   INV port map ( O=>GATE_T_260_A, 
            I0=>CYCLE_DMA_1_busQ );
  GATE_T_261_I_1:   AND2 port map ( O=>T_261, 
            I1=>RSTPIN, 
            I0=>GATE_T_261_A );
  GATE_T_261_I_2:   INV port map ( O=>GATE_T_261_A, 
            I0=>BGACK_030Q );
  GATE_T_262_I_1:   AND2 port map ( O=>T_262, 
            I1=>inst_CLK_030_HQ, 
            I0=>GATE_T_262_A );
  GATE_T_262_I_2:   INV port map ( O=>GATE_T_262_A, 
            I0=>AS_000PIN );
  GATE_T_263_I_1:   AND2 port map ( O=>T_263, 
            I1=>CYCLE_DMA_1_busQ, 
            I0=>GATE_T_263_A );
  GATE_T_263_I_2:   INV port map ( O=>GATE_T_263_A, 
            I0=>CYCLE_DMA_0_busQ );
  GATE_T_264_I_1:   AND2 port map ( O=>T_264, 
            I1=>RSTPIN, 
            I0=>GATE_T_264_A );
  GATE_T_264_I_2:   INV port map ( O=>GATE_T_264_A, 
            I0=>BGACK_030Q );
  GATE_T_265_I_1:   AND2 port map ( O=>T_265, 
            I1=>inst_CLK_030_HQ, 
            I0=>GATE_T_265_A );
  GATE_T_265_I_2:   INV port map ( O=>GATE_T_265_A, 
            I0=>AS_000PIN );
  GATE_T_266_I_1:   AND2 port map ( O=>T_266, 
            I1=>CYCLE_DMA_0_busQ, 
            I0=>GATE_T_266_A );
  GATE_T_266_I_2:   INV port map ( O=>GATE_T_266_A, 
            I0=>CYCLE_DMA_1_busQ );
  GATE_T_267_I_1:   AND2 port map ( O=>T_267, 
            I1=>RSTPIN, 
            I0=>GATE_T_267_A );
  GATE_T_267_I_2:   INV port map ( O=>GATE_T_267_A, 
            I0=>BGACK_030Q );
  GATE_T_268_I_1:   NOR2 port map ( O=>T_268, 
            I1=>UDS_000PIN, 
            I0=>AS_000PIN );
  GATE_T_269_I_1:   AND2 port map ( O=>T_269, 
            I1=>CYCLE_DMA_1_busQ, 
            I0=>GATE_T_269_A );
  GATE_T_269_I_2:   INV port map ( O=>GATE_T_269_A, 
            I0=>CYCLE_DMA_0_busQ );
  GATE_T_270_I_1:   NOR2 port map ( O=>T_270, 
            I1=>inst_AS_000_DMAQ, 
            I0=>BGACK_030Q );
  GATE_T_271_I_1:   AND2 port map ( O=>T_271, 
            I1=>RSTPIN, 
            I0=>GATE_T_271_A );
  GATE_T_271_I_2:   INV port map ( O=>GATE_T_271_A, 
            I0=>CLK_030PIN );
  GATE_T_272_I_1:   NOR2 port map ( O=>T_272, 
            I1=>UDS_000PIN, 
            I0=>AS_000PIN );
  GATE_T_273_I_1:   AND2 port map ( O=>T_273, 
            I1=>CYCLE_DMA_0_busQ, 
            I0=>GATE_T_273_A );
  GATE_T_273_I_2:   INV port map ( O=>GATE_T_273_A, 
            I0=>CYCLE_DMA_1_busQ );
  GATE_T_274_I_1:   NOR2 port map ( O=>T_274, 
            I1=>inst_AS_000_DMAQ, 
            I0=>BGACK_030Q );
  GATE_T_275_I_1:   AND2 port map ( O=>T_275, 
            I1=>RSTPIN, 
            I0=>GATE_T_275_A );
  GATE_T_275_I_2:   INV port map ( O=>GATE_T_275_A, 
            I0=>CLK_030PIN );
  GATE_T_276_I_1:   NOR2 port map ( O=>T_276, 
            I1=>LDS_000PIN, 
            I0=>AS_000PIN );
  GATE_T_277_I_1:   AND2 port map ( O=>T_277, 
            I1=>CYCLE_DMA_1_busQ, 
            I0=>GATE_T_277_A );
  GATE_T_277_I_2:   INV port map ( O=>GATE_T_277_A, 
            I0=>CYCLE_DMA_0_busQ );
  GATE_T_278_I_1:   NOR2 port map ( O=>T_278, 
            I1=>inst_AS_000_DMAQ, 
            I0=>BGACK_030Q );
  GATE_T_279_I_1:   AND2 port map ( O=>T_279, 
            I1=>RSTPIN, 
            I0=>GATE_T_279_A );
  GATE_T_279_I_2:   INV port map ( O=>GATE_T_279_A, 
            I0=>CLK_030PIN );
  GATE_T_280_I_1:   NOR2 port map ( O=>T_280, 
            I1=>LDS_000PIN, 
            I0=>AS_000PIN );
  GATE_T_281_I_1:   AND2 port map ( O=>T_281, 
            I1=>CYCLE_DMA_0_busQ, 
            I0=>GATE_T_281_A );
  GATE_T_281_I_2:   INV port map ( O=>GATE_T_281_A, 
            I0=>CYCLE_DMA_1_busQ );
  GATE_T_282_I_1:   NOR2 port map ( O=>T_282, 
            I1=>inst_AS_000_DMAQ, 
            I0=>BGACK_030Q );
  GATE_T_283_I_1:   AND2 port map ( O=>T_283, 
            I1=>RSTPIN, 
            I0=>GATE_T_283_A );
  GATE_T_283_I_2:   INV port map ( O=>GATE_T_283_A, 
            I0=>CLK_030PIN );
  GATE_T_284_I_1:   AND2 port map ( O=>T_284, 
            I1=>RST_DLY_0_busQ, 
            I0=>GATE_T_284_A );
  GATE_T_284_I_2:   INV port map ( O=>GATE_T_284_A, 
            I0=>CLK_000_D_0_busQ );
  GATE_T_285_I_1:   AND2 port map ( O=>T_285, 
            I1=>CLK_000_D_1_busQ, 
            I0=>RSTPIN );
  GATE_T_286_I_1:   AND2 port map ( O=>T_286, 
            I1=>SM_AMIGA_i_7_busQ, 
            I0=>SM_AMIGA_6_busQ );
  GATE_T_287_I_1:   AND2 port map ( O=>T_287, 
            I1=>CLK_000_D_1_busQ, 
            I0=>RSTPIN );
  GATE_T_288_I_1:   AND2 port map ( O=>T_288, 
            I1=>SM_AMIGA_i_7_busQ, 
            I0=>SM_AMIGA_6_busQ );
  GATE_T_289_I_1:   AND2 port map ( O=>T_289, 
            I1=>RSTPIN, 
            I0=>GATE_T_289_A );
  GATE_T_289_I_2:   INV port map ( O=>GATE_T_289_A, 
            I0=>CLK_000_D_0_busQ );
  GATE_T_290_I_1:   NOR2 port map ( O=>T_290, 
            I1=>SM_AMIGA_i_7_busQ, 
            I0=>CLK_000_D_0_busQ );
  GATE_T_291_I_1:   AND2 port map ( O=>T_291, 
            I1=>CLK_000_D_1_busQ, 
            I0=>GATE_T_291_A );
  GATE_T_291_I_2:   INV port map ( O=>GATE_T_291_A, 
            I0=>inst_AS_030_000_SYNCQ );
  GATE_T_292_I_1:   AND2 port map ( O=>T_292, 
            I1=>RSTPIN, 
            I0=>nEXP_SPACEPIN );
  GATE_T_293_I_1:   AND2 port map ( O=>T_293, 
            I1=>SM_AMIGA_i_7_busQ, 
            I0=>GATE_T_293_A );
  GATE_T_293_I_2:   INV port map ( O=>GATE_T_293_A, 
            I0=>SM_AMIGA_5_busQ );
  GATE_T_294_I_1:   NOR2 port map ( O=>T_294, 
            I1=>SM_AMIGA_4_busQ, 
            I0=>SM_AMIGA_0_busQ );
  GATE_T_295_I_1:   AND2 port map ( O=>T_295, 
            I1=>RSTPIN, 
            I0=>GATE_T_295_A );
  GATE_T_295_I_2:   INV port map ( O=>GATE_T_295_A, 
            I0=>SM_AMIGA_6_busQ );
  GATE_T_296_I_1:   NOR2 port map ( O=>T_296, 
            I1=>SM_AMIGA_5_busQ, 
            I0=>SM_AMIGA_0_busQ );
  GATE_T_297_I_1:   AND2 port map ( O=>T_297, 
            I1=>CLK_000_D_0_busQ, 
            I0=>GATE_T_297_A );
  GATE_T_297_I_2:   INV port map ( O=>GATE_T_297_A, 
            I0=>SM_AMIGA_6_busQ );
  GATE_T_298_I_1:   AND2 port map ( O=>T_298, 
            I1=>RSTPIN, 
            I0=>GATE_T_298_A );
  GATE_T_298_I_2:   INV port map ( O=>GATE_T_298_A, 
            I0=>CLK_000_D_1_busQ );
  GATE_T_299_I_1:   AND2 port map ( O=>T_299, 
            I1=>SM_AMIGA_i_7_busQ, 
            I0=>GATE_T_299_A );
  GATE_T_299_I_2:   INV port map ( O=>GATE_T_299_A, 
            I0=>SM_AMIGA_5_busQ );
  GATE_T_300_I_1:   AND2 port map ( O=>T_300, 
            I1=>CLK_000_D_0_busQ, 
            I0=>GATE_T_300_A );
  GATE_T_300_I_2:   INV port map ( O=>GATE_T_300_A, 
            I0=>SM_AMIGA_0_busQ );
  GATE_T_301_I_1:   AND2 port map ( O=>T_301, 
            I1=>RSTPIN, 
            I0=>GATE_T_301_A );
  GATE_T_301_I_2:   INV port map ( O=>GATE_T_301_A, 
            I0=>CLK_000_D_1_busQ );
  GATE_T_302_I_1:   AND2 port map ( O=>T_302, 
            I1=>RST_DLY_2_busQ, 
            I0=>RST_DLY_1_busQ );
  GATE_T_303_I_1:   AND2 port map ( O=>T_303, 
            I1=>RST_DLY_0_busQ, 
            I0=>GATE_T_303_A );
  GATE_T_303_I_2:   INV port map ( O=>GATE_T_303_A, 
            I0=>CLK_000_D_0_busQ );
  GATE_T_304_I_1:   AND2 port map ( O=>T_304, 
            I1=>CLK_000_D_1_busQ, 
            I0=>RSTPIN );
  GATE_T_305_I_1:   AND2 port map ( O=>T_305, 
            I1=>CYCLE_DMA_1_busQ, 
            I0=>GATE_T_305_A );
  GATE_T_305_I_2:   INV port map ( O=>GATE_T_305_A, 
            I0=>CYCLE_DMA_0_busQ );
  GATE_T_306_I_1:   AND2 port map ( O=>T_306, 
            I1=>RSTPIN, 
            I0=>GATE_T_306_A );
  GATE_T_306_I_2:   INV port map ( O=>GATE_T_306_A, 
            I0=>BGACK_030Q );
  GATE_T_307_I_1:   AND2 port map ( O=>T_307, 
            I1=>CLK_000_D_1_busQ, 
            I0=>CYCLE_DMA_1_busQ );
  GATE_T_308_I_1:   AND2 port map ( O=>T_308, 
            I1=>RSTPIN, 
            I0=>GATE_T_308_A );
  GATE_T_308_I_2:   INV port map ( O=>GATE_T_308_A, 
            I0=>BGACK_030Q );
  GATE_T_309_I_1:   AND2 port map ( O=>T_309, 
            I1=>CYCLE_DMA_1_busQ, 
            I0=>GATE_T_309_A );
  GATE_T_309_I_2:   INV port map ( O=>GATE_T_309_A, 
            I0=>CLK_000_D_0_busQ );
  GATE_T_310_I_1:   AND2 port map ( O=>T_310, 
            I1=>RSTPIN, 
            I0=>GATE_T_310_A );
  GATE_T_310_I_2:   INV port map ( O=>GATE_T_310_A, 
            I0=>BGACK_030Q );
  GATE_T_311_I_1:   AND2 port map ( O=>T_311, 
            I1=>CLK_000_D_0_busQ, 
            I0=>GATE_T_311_A );
  GATE_T_311_I_2:   INV port map ( O=>GATE_T_311_A, 
            I0=>CLK_000_D_1_busQ );
  GATE_T_312_I_1:   AND2 port map ( O=>T_312, 
            I1=>CYCLE_DMA_0_busQ, 
            I0=>GATE_T_312_A );
  GATE_T_312_I_2:   INV port map ( O=>GATE_T_312_A, 
            I0=>CYCLE_DMA_1_busQ );
  GATE_T_313_I_1:   AND2 port map ( O=>T_313, 
            I1=>RSTPIN, 
            I0=>GATE_T_313_A );
  GATE_T_313_I_2:   INV port map ( O=>GATE_T_313_A, 
            I0=>BGACK_030Q );
  GATE_T_314_I_1:   AND2 port map ( O=>T_314, 
            I1=>CLK_000_D_1_busQ, 
            I0=>CYCLE_DMA_0_busQ );
  GATE_T_315_I_1:   AND2 port map ( O=>T_315, 
            I1=>RSTPIN, 
            I0=>GATE_T_315_A );
  GATE_T_315_I_2:   INV port map ( O=>GATE_T_315_A, 
            I0=>BGACK_030Q );
  GATE_T_316_I_1:   AND2 port map ( O=>T_316, 
            I1=>CYCLE_DMA_0_busQ, 
            I0=>GATE_T_316_A );
  GATE_T_316_I_2:   INV port map ( O=>GATE_T_316_A, 
            I0=>CLK_000_D_0_busQ );
  GATE_T_317_I_1:   AND2 port map ( O=>T_317, 
            I1=>RSTPIN, 
            I0=>GATE_T_317_A );
  GATE_T_317_I_2:   INV port map ( O=>GATE_T_317_A, 
            I0=>BGACK_030Q );
  GATE_T_318_I_1:   AND2 port map ( O=>T_318, 
            I1=>CLK_000_D_0_busQ, 
            I0=>GATE_T_318_A );
  GATE_T_318_I_2:   INV port map ( O=>GATE_T_318_A, 
            I0=>AS_000PIN );
  GATE_T_319_I_1:   NOR2 port map ( O=>T_319, 
            I1=>CLK_000_D_1_busQ, 
            I0=>CYCLE_DMA_0_busQ );
  GATE_T_320_I_1:   AND2 port map ( O=>T_320, 
            I1=>RSTPIN, 
            I0=>GATE_T_320_A );
  GATE_T_320_I_2:   INV port map ( O=>GATE_T_320_A, 
            I0=>BGACK_030Q );
  GATE_T_321_I_3:   NAN3 port map ( O=>T_321, 
            I2=>RSTPIN, 
            I1=>GATE_T_321_B, 
            I0=>GATE_T_321_A );
  GATE_T_321_I_2:   INV port map ( I0=>BGACK_030Q, 
            O=>GATE_T_321_B );
  GATE_T_321_I_1:   INV port map ( I0=>AS_000PIN, 
            O=>GATE_T_321_A );
  GATE_T_322_I_1:   OR3 port map ( O=>T_322, 
            I2=>T_107, 
            I1=>T_106, 
            I0=>T_108 );
  GATE_T_323_I_1:   OR3 port map ( O=>T_323, 
            I2=>T_104, 
            I1=>T_103, 
            I0=>T_105 );
  GATE_T_324_I_1:   OR2 port map ( O=>T_324, 
            I1=>AS_000PIN, 
            I0=>BGACK_030Q );
  GATE_T_325_I_1:   OR2 port map ( O=>T_325, 
            I1=>T_112, 
            I0=>T_111 );
  GATE_T_326_I_1:   OR2 port map ( O=>T_326, 
            I1=>T_110, 
            I0=>T_109 );
  GATE_T_327_I_1:   OR2 port map ( O=>T_327, 
            I1=>T_118, 
            I0=>T_117 );
  GATE_T_328_I_1:   OR2 port map ( O=>T_328, 
            I1=>T_116, 
            I0=>T_115 );
  GATE_T_329_I_1:   OR2 port map ( O=>T_329, 
            I1=>T_114, 
            I0=>T_113 );
  GATE_T_330_I_1:   AND2 port map ( O=>T_330, 
            I1=>BERRPIN, 
            I0=>GATE_T_330_A );
  GATE_T_330_I_2:   INV port map ( O=>GATE_T_330_A, 
            I0=>SM_AMIGA_i_7_busQ );
  GATE_T_331_I_1:   AND2 port map ( O=>T_331, 
            I1=>inst_BGACK_030_INT_DQ, 
            I0=>GATE_T_331_A );
  GATE_T_331_I_2:   INV port map ( O=>GATE_T_331_A, 
            I0=>inst_AS_030_D0Q );
  GATE_T_332_I_1:   AND2 port map ( O=>T_332, 
            I1=>BGACK_030Q, 
            I0=>RSTPIN );
  GATE_T_333_I_1:   AND2 port map ( O=>T_333, 
            I1=>nEXP_SPACEPIN, 
            I0=>GATE_T_333_A );
  GATE_T_333_I_2:   INV port map ( O=>GATE_T_333_A, 
            I0=>FC_1XPIN );
  GATE_T_334_I_1:   AND2 port map ( O=>T_334, 
            I1=>BERRPIN, 
            I0=>GATE_T_334_A );
  GATE_T_334_I_2:   INV port map ( O=>GATE_T_334_A, 
            I0=>SM_AMIGA_i_7_busQ );
  GATE_T_335_I_1:   AND2 port map ( O=>T_335, 
            I1=>inst_BGACK_030_INT_DQ, 
            I0=>GATE_T_335_A );
  GATE_T_335_I_2:   INV port map ( O=>GATE_T_335_A, 
            I0=>inst_AS_030_D0Q );
  GATE_T_336_I_1:   AND2 port map ( O=>T_336, 
            I1=>BGACK_030Q, 
            I0=>A_DECODE_19XPIN );
  GATE_T_337_I_1:   AND2 port map ( O=>T_337, 
            I1=>RSTPIN, 
            I0=>nEXP_SPACEPIN );
  GATE_T_338_I_1:   AND2 port map ( O=>T_338, 
            I1=>BERRPIN, 
            I0=>GATE_T_338_A );
  GATE_T_338_I_2:   INV port map ( O=>GATE_T_338_A, 
            I0=>SM_AMIGA_i_7_busQ );
  GATE_T_339_I_1:   AND2 port map ( O=>T_339, 
            I1=>inst_BGACK_030_INT_DQ, 
            I0=>GATE_T_339_A );
  GATE_T_339_I_2:   INV port map ( O=>GATE_T_339_A, 
            I0=>inst_AS_030_D0Q );
  GATE_T_340_I_1:   AND2 port map ( O=>T_340, 
            I1=>BGACK_030Q, 
            I0=>A_DECODE_18XPIN );
  GATE_T_341_I_1:   AND2 port map ( O=>T_341, 
            I1=>RSTPIN, 
            I0=>nEXP_SPACEPIN );
  GATE_T_342_I_1:   AND2 port map ( O=>T_342, 
            I1=>BERRPIN, 
            I0=>GATE_T_342_A );
  GATE_T_342_I_2:   INV port map ( O=>GATE_T_342_A, 
            I0=>SM_AMIGA_i_7_busQ );
  GATE_T_343_I_1:   AND2 port map ( O=>T_343, 
            I1=>inst_BGACK_030_INT_DQ, 
            I0=>GATE_T_343_A );
  GATE_T_343_I_2:   INV port map ( O=>GATE_T_343_A, 
            I0=>inst_AS_030_D0Q );
  GATE_T_344_I_1:   AND2 port map ( O=>T_344, 
            I1=>BGACK_030Q, 
            I0=>GATE_T_344_A );
  GATE_T_344_I_2:   INV port map ( O=>GATE_T_344_A, 
            I0=>A_DECODE_17XPIN );
  GATE_T_345_I_1:   AND2 port map ( O=>T_345, 
            I1=>RSTPIN, 
            I0=>nEXP_SPACEPIN );
  GATE_T_346_I_1:   AND2 port map ( O=>T_346, 
            I1=>BERRPIN, 
            I0=>GATE_T_346_A );
  GATE_T_346_I_2:   INV port map ( O=>GATE_T_346_A, 
            I0=>SM_AMIGA_i_7_busQ );
  GATE_T_347_I_1:   AND2 port map ( O=>T_347, 
            I1=>inst_BGACK_030_INT_DQ, 
            I0=>GATE_T_347_A );
  GATE_T_347_I_2:   INV port map ( O=>GATE_T_347_A, 
            I0=>inst_AS_030_D0Q );
  GATE_T_348_I_1:   AND2 port map ( O=>T_348, 
            I1=>BGACK_030Q, 
            I0=>A_DECODE_16XPIN );
  GATE_T_349_I_1:   AND2 port map ( O=>T_349, 
            I1=>RSTPIN, 
            I0=>nEXP_SPACEPIN );
  GATE_T_350_I_1:   AND2 port map ( O=>T_350, 
            I1=>BERRPIN, 
            I0=>GATE_T_350_A );
  GATE_T_350_I_2:   INV port map ( O=>GATE_T_350_A, 
            I0=>SM_AMIGA_i_7_busQ );
  GATE_T_351_I_1:   AND2 port map ( O=>T_351, 
            I1=>inst_BGACK_030_INT_DQ, 
            I0=>GATE_T_351_A );
  GATE_T_351_I_2:   INV port map ( O=>GATE_T_351_A, 
            I0=>inst_AS_030_D0Q );
  GATE_T_352_I_1:   AND2 port map ( O=>T_352, 
            I1=>BGACK_030Q, 
            I0=>GATE_T_352_A );
  GATE_T_352_I_2:   INV port map ( O=>GATE_T_352_A, 
            I0=>FC_0XPIN );
  GATE_T_353_I_1:   AND2 port map ( O=>T_353, 
            I1=>RSTPIN, 
            I0=>nEXP_SPACEPIN );
  GATE_T_354_I_1:   AND2 port map ( O=>T_354, 
            I1=>CLK_000_D_1_busQ, 
            I0=>GATE_T_354_A );
  GATE_T_354_I_2:   INV port map ( O=>GATE_T_354_A, 
            I0=>cpu_est_1_busQ );
  GATE_T_355_I_1:   AND2 port map ( O=>T_355, 
            I1=>cpu_est_0_busQ, 
            I0=>GATE_T_355_A );
  GATE_T_355_I_2:   INV port map ( O=>GATE_T_355_A, 
            I0=>cpu_est_3_busQ );
  GATE_T_356_I_1:   AND2 port map ( O=>T_356, 
            I1=>CLK_000_D_1_busQ, 
            I0=>cpu_est_2_busQ );
  GATE_T_357_I_1:   AND2 port map ( O=>T_357, 
            I1=>cpu_est_1_busQ, 
            I0=>cpu_est_0_busQ );
  GATE_T_358_I_1:   OR3 port map ( O=>T_358, 
            I2=>T_142, 
            I1=>T_141, 
            I0=>T_143 );
  GATE_T_359_I_1:   OR3 port map ( O=>T_359, 
            I2=>T_139, 
            I1=>T_138, 
            I0=>T_140 );
  GATE_T_360_I_1:   OR3 port map ( O=>T_360, 
            I2=>T_136, 
            I1=>T_135, 
            I0=>T_137 );
  GATE_T_361_I_1:   AND2 port map ( O=>T_361, 
            I1=>IPL_D0_1_busQ, 
            I0=>GATE_T_361_A );
  GATE_T_361_I_2:   INV port map ( O=>GATE_T_361_A, 
            I0=>IPL_D0_0_busQ );
  GATE_T_362_I_1:   AND2 port map ( O=>T_362, 
            I1=>IPL_1XPIN, 
            I0=>GATE_T_362_A );
  GATE_T_362_I_2:   INV port map ( O=>GATE_T_362_A, 
            I0=>IPL_0XPIN );
  GATE_T_363_I_1:   AND2 port map ( O=>T_363, 
            I1=>RSTPIN, 
            I0=>IPL_2XPIN );
  GATE_T_364_I_1:   NOR2 port map ( O=>T_364, 
            I1=>IPL_D0_1_busQ, 
            I0=>IPL_D0_0_busQ );
  GATE_T_365_I_1:   NOR2 port map ( O=>T_365, 
            I1=>IPL_0XPIN, 
            I0=>IPL_1XPIN );
  GATE_T_366_I_1:   AND2 port map ( O=>T_366, 
            I1=>RSTPIN, 
            I0=>IPL_2XPIN );
  GATE_T_367_I_1:   AND2 port map ( O=>T_367, 
            I1=>IPL_D0_1_busQ, 
            I0=>GATE_T_367_A );
  GATE_T_367_I_2:   INV port map ( O=>GATE_T_367_A, 
            I0=>IPL_D0_0_busQ );
  GATE_T_368_I_1:   AND2 port map ( O=>T_368, 
            I1=>IPL_1XPIN, 
            I0=>GATE_T_368_A );
  GATE_T_368_I_2:   INV port map ( O=>GATE_T_368_A, 
            I0=>IPL_0XPIN );
  GATE_T_369_I_1:   AND2 port map ( O=>T_369, 
            I1=>RSTPIN, 
            I0=>GATE_T_369_A );
  GATE_T_369_I_2:   INV port map ( O=>GATE_T_369_A, 
            I0=>IPL_2XPIN );
  GATE_T_370_I_1:   NOR2 port map ( O=>T_370, 
            I1=>IPL_D0_1_busQ, 
            I0=>IPL_D0_0_busQ );
  GATE_T_371_I_1:   NOR2 port map ( O=>T_371, 
            I1=>IPL_0XPIN, 
            I0=>IPL_1XPIN );
  GATE_T_372_I_1:   AND2 port map ( O=>T_372, 
            I1=>RSTPIN, 
            I0=>GATE_T_372_A );
  GATE_T_372_I_2:   INV port map ( O=>GATE_T_372_A, 
            I0=>IPL_2XPIN );
  GATE_T_373_I_1:   OR3 port map ( O=>T_373, 
            I2=>T_152, 
            I1=>T_151, 
            I0=>T_153 );
  GATE_T_374_I_1:   OR3 port map ( O=>T_374, 
            I2=>T_149, 
            I1=>T_148, 
            I0=>T_150 );
  GATE_T_375_I_1:   OR3 port map ( O=>T_375, 
            I2=>T_146, 
            I1=>T_145, 
            I0=>T_147 );
  GATE_T_376_I_1:   AND2 port map ( O=>T_376, 
            I1=>IPL_D0_0_busQ, 
            I0=>GATE_T_376_A );
  GATE_T_376_I_2:   INV port map ( O=>GATE_T_376_A, 
            I0=>IPL_D0_1_busQ );
  GATE_T_377_I_1:   AND2 port map ( O=>T_377, 
            I1=>IPL_0XPIN, 
            I0=>GATE_T_377_A );
  GATE_T_377_I_2:   INV port map ( O=>GATE_T_377_A, 
            I0=>IPL_1XPIN );
  GATE_T_378_I_1:   AND2 port map ( O=>T_378, 
            I1=>RSTPIN, 
            I0=>IPL_2XPIN );
  GATE_T_379_I_1:   NOR2 port map ( O=>T_379, 
            I1=>IPL_D0_1_busQ, 
            I0=>IPL_D0_0_busQ );
  GATE_T_380_I_1:   NOR2 port map ( O=>T_380, 
            I1=>IPL_0XPIN, 
            I0=>IPL_1XPIN );
  GATE_T_381_I_1:   AND2 port map ( O=>T_381, 
            I1=>RSTPIN, 
            I0=>IPL_2XPIN );
  GATE_T_382_I_1:   AND2 port map ( O=>T_382, 
            I1=>IPL_D0_0_busQ, 
            I0=>GATE_T_382_A );
  GATE_T_382_I_2:   INV port map ( O=>GATE_T_382_A, 
            I0=>IPL_D0_1_busQ );
  GATE_T_383_I_1:   AND2 port map ( O=>T_383, 
            I1=>IPL_0XPIN, 
            I0=>GATE_T_383_A );
  GATE_T_383_I_2:   INV port map ( O=>GATE_T_383_A, 
            I0=>IPL_1XPIN );
  GATE_T_384_I_1:   AND2 port map ( O=>T_384, 
            I1=>RSTPIN, 
            I0=>GATE_T_384_A );
  GATE_T_384_I_2:   INV port map ( O=>GATE_T_384_A, 
            I0=>IPL_2XPIN );
  GATE_T_385_I_1:   NOR2 port map ( O=>T_385, 
            I1=>IPL_D0_1_busQ, 
            I0=>IPL_D0_0_busQ );
  GATE_T_386_I_1:   NOR2 port map ( O=>T_386, 
            I1=>IPL_0XPIN, 
            I0=>IPL_1XPIN );
  GATE_T_387_I_1:   AND2 port map ( O=>T_387, 
            I1=>RSTPIN, 
            I0=>GATE_T_387_A );
  GATE_T_387_I_2:   INV port map ( O=>GATE_T_387_A, 
            I0=>IPL_2XPIN );
  GATE_T_388_I_1:   NOR2 port map ( O=>T_388, 
            I1=>CLK_000_D_1_busQ, 
            I0=>cpu_est_2_busQ );
  GATE_T_389_I_1:   NOR2 port map ( O=>T_389, 
            I1=>cpu_est_1_busQ, 
            I0=>cpu_est_0_busQ );
  GATE_T_390_I_1:   NOR2 port map ( O=>T_390, 
            I1=>cpu_est_3_busQ, 
            I0=>VMAQ );
  GATE_T_391_I_1:   INV port map ( I0=>CLK_000_D_0_busQ, 
            O=>GATE_T_391_A );
  GATE_T_391_I_2:   INV port map ( I0=>inst_VPA_DQ, 
            O=>GATE_T_391_B );
  GATE_T_391_I_3:   AND3 port map ( O=>T_391, 
            I0=>CLK_000_D_1_busQ, 
            I2=>GATE_T_391_A, 
            I1=>GATE_T_391_B );
  GATE_T_392_I_1:   INV port map ( I0=>cpu_est_2_busQ, 
            O=>GATE_T_392_A );
  GATE_T_392_I_2:   AND3 port map ( O=>T_392, 
            I2=>cpu_est_1_busQ, 
            I1=>cpu_est_0_busQ, 
            I0=>GATE_T_392_A );
  GATE_T_393_I_1:   INV port map ( I0=>cpu_est_3_busQ, 
            O=>GATE_T_393_A );
  GATE_T_393_I_2:   AND3 port map ( O=>T_393, 
            I2=>VMAQ, 
            I1=>RSTPIN, 
            I0=>GATE_T_393_A );
  GATE_T_394_I_1:   OR2 port map ( O=>T_394, 
            I1=>T_165, 
            I0=>T_164 );
  GATE_T_395_I_1:   OR2 port map ( O=>T_395, 
            I1=>T_163, 
            I0=>T_162 );
  GATE_T_396_I_1:   AND2 port map ( O=>T_396, 
            I1=>CLK_000_D_7_busQ, 
            I0=>GATE_T_396_A );
  GATE_T_396_I_2:   INV port map ( O=>GATE_T_396_A, 
            I0=>CLK_000_D_6_busQ );
  GATE_T_397_I_1:   AND2 port map ( O=>T_397, 
            I1=>RSTPIN, 
            I0=>GATE_T_397_A );
  GATE_T_397_I_2:   INV port map ( O=>GATE_T_397_A, 
            I0=>CLK_030PIN );
  GATE_T_398_I_1:   AND2 port map ( O=>T_398, 
            I1=>CLK_000_D_7_busQ, 
            I0=>GATE_T_398_A );
  GATE_T_398_I_2:   INV port map ( O=>GATE_T_398_A, 
            I0=>CLK_000_D_6_busQ );
  GATE_T_399_I_1:   AND2 port map ( O=>T_399, 
            I1=>inst_CLK_OUT_PRE_DQ, 
            I0=>RSTPIN );
  GATE_T_400_I_1:   AND2 port map ( O=>T_400, 
            I1=>inst_AS_030_D0Q, 
            I0=>RSTPIN );
  GATE_T_401_I_1:   AND2 port map ( O=>T_401, 
            I1=>nEXP_SPACEPIN, 
            I0=>GATE_T_401_A );
  GATE_T_401_I_2:   INV port map ( O=>GATE_T_401_A, 
            I0=>BG_030PIN );
  GATE_T_402_I_1:   NOR2 port map ( O=>T_402, 
            I1=>RW_000Q, 
            I0=>SM_AMIGA_0_busQ );
  GATE_T_403_I_1:   AND2 port map ( O=>T_403, 
            I1=>RSTPIN, 
            I0=>GATE_T_403_A );
  GATE_T_403_I_2:   INV port map ( O=>GATE_T_403_A, 
            I0=>SM_AMIGA_6_busQ );
  GATE_T_404_I_1:   AND2 port map ( O=>T_404, 
            I1=>SM_AMIGA_i_7_busQ, 
            I0=>GATE_T_404_A );
  GATE_T_404_I_2:   INV port map ( O=>GATE_T_404_A, 
            I0=>SM_AMIGA_0_busQ );
  GATE_T_405_I_1:   AND2 port map ( O=>T_405, 
            I1=>SM_AMIGA_6_busQ, 
            I0=>CLK_000_D_0_busQ );
  GATE_T_406_I_1:   AND2 port map ( O=>T_406, 
            I1=>RSTPIN, 
            I0=>GATE_T_406_A );
  GATE_T_406_I_2:   INV port map ( O=>GATE_T_406_A, 
            I0=>CLK_000_D_1_busQ );
  GATE_T_407_I_1:   OR3 port map ( O=>T_407, 
            I2=>T_182, 
            I1=>T_181, 
            I0=>T_183 );
  GATE_T_408_I_1:   OR3 port map ( O=>T_408, 
            I2=>T_179, 
            I1=>T_178, 
            I0=>T_180 );
  GATE_T_409_I_1:   OR3 port map ( O=>T_409, 
            I2=>T_176, 
            I1=>T_175, 
            I0=>T_177 );
  GATE_T_410_I_1:   AND2 port map ( O=>T_410, 
            I1=>IPL_D0_1_busQ, 
            I0=>IPL_D0_0_busQ );
  GATE_T_411_I_1:   AND2 port map ( O=>T_411, 
            I1=>IPL_0XPIN, 
            I0=>IPL_1XPIN );
  GATE_T_412_I_1:   AND2 port map ( O=>T_412, 
            I1=>RSTPIN, 
            I0=>GATE_T_412_A );
  GATE_T_412_I_2:   INV port map ( O=>GATE_T_412_A, 
            I0=>IPL_2XPIN );
  GATE_T_413_I_1:   AND2 port map ( O=>T_413, 
            I1=>IPL_D0_1_busQ, 
            I0=>GATE_T_413_A );
  GATE_T_413_I_2:   INV port map ( O=>GATE_T_413_A, 
            I0=>IPL_D0_0_busQ );
  GATE_T_414_I_1:   AND2 port map ( O=>T_414, 
            I1=>IPL_1XPIN, 
            I0=>GATE_T_414_A );
  GATE_T_414_I_2:   INV port map ( O=>GATE_T_414_A, 
            I0=>IPL_0XPIN );
  GATE_T_415_I_1:   AND2 port map ( O=>T_415, 
            I1=>RSTPIN, 
            I0=>GATE_T_415_A );
  GATE_T_415_I_2:   INV port map ( O=>GATE_T_415_A, 
            I0=>IPL_2XPIN );
  GATE_T_416_I_1:   AND2 port map ( O=>T_416, 
            I1=>IPL_D0_0_busQ, 
            I0=>GATE_T_416_A );
  GATE_T_416_I_2:   INV port map ( O=>GATE_T_416_A, 
            I0=>IPL_D0_1_busQ );
  GATE_T_417_I_1:   AND2 port map ( O=>T_417, 
            I1=>IPL_0XPIN, 
            I0=>GATE_T_417_A );
  GATE_T_417_I_2:   INV port map ( O=>GATE_T_417_A, 
            I0=>IPL_1XPIN );
  GATE_T_418_I_1:   AND2 port map ( O=>T_418, 
            I1=>RSTPIN, 
            I0=>GATE_T_418_A );
  GATE_T_418_I_2:   INV port map ( O=>GATE_T_418_A, 
            I0=>IPL_2XPIN );
  GATE_T_419_I_1:   NOR2 port map ( O=>T_419, 
            I1=>IPL_D0_1_busQ, 
            I0=>IPL_D0_0_busQ );
  GATE_T_420_I_1:   NOR2 port map ( O=>T_420, 
            I1=>IPL_0XPIN, 
            I0=>IPL_1XPIN );
  GATE_T_421_I_1:   AND2 port map ( O=>T_421, 
            I1=>RSTPIN, 
            I0=>GATE_T_421_A );
  GATE_T_421_I_2:   INV port map ( O=>GATE_T_421_A, 
            I0=>IPL_2XPIN );
  GATE_T_422_I_14:   NOR4 port map ( O=>T_422, 
            I3=>AHIGH_30XPIN, 
            I2=>AHIGH_29XPIN, 
            I1=>AHIGH_28XPIN, 
            I0=>AHIGH_27XPIN );
  GATE_T_423_I_14:   NOR4 port map ( O=>T_423, 
            I3=>AHIGH_26XPIN, 
            I2=>AHIGH_25XPIN, 
            I1=>AHIGH_24XPIN, 
            I0=>inst_AS_030_D0Q );
  GATE_T_424_I_1:   AND4 port map ( O=>T_424, 
            I3=>A_DECODE_20XPIN, 
            I2=>A_DECODE_21XPIN, 
            I1=>A_DECODE_22XPIN, 
            I0=>A_DECODE_23XPIN );
  GATE_T_425_I_14:   NOR4 port map ( O=>T_425, 
            I3=>AHIGH_30XPIN, 
            I2=>AHIGH_29XPIN, 
            I1=>AHIGH_28XPIN, 
            I0=>AHIGH_27XPIN );
  GATE_T_426_I_14:   NOR4 port map ( O=>T_426, 
            I3=>AHIGH_26XPIN, 
            I2=>AHIGH_25XPIN, 
            I1=>AHIGH_24XPIN, 
            I0=>inst_AS_030_D0Q );
  GATE_T_427_I_1:   AND4 port map ( O=>T_427, 
            I3=>A_DECODE_20XPIN, 
            I2=>A_DECODE_21XPIN, 
            I1=>A_DECODE_22XPIN, 
            I0=>A_DECODE_23XPIN );
  GATE_T_428_I_1:   INV port map ( I0=>AS_030PIN, 
            O=>GATE_T_428_A );
  GATE_T_428_I_2:   INV port map ( I0=>A_DECODE_16XPIN, 
            O=>GATE_T_428_B );
  GATE_T_428_I_3:   AND3 port map ( O=>T_428, 
            I0=>FC_0XPIN, 
            I2=>GATE_T_428_A, 
            I1=>GATE_T_428_B );
  GATE_T_429_I_1:   INV port map ( I0=>A_DECODE_18XPIN, 
            O=>GATE_T_429_A );
  GATE_T_429_I_2:   INV port map ( I0=>A_DECODE_19XPIN, 
            O=>GATE_T_429_B );
  GATE_T_429_I_3:   AND3 port map ( O=>T_429, 
            I0=>A_DECODE_17XPIN, 
            I2=>GATE_T_429_A, 
            I1=>GATE_T_429_B );
  GATE_T_430_I_1:   INV port map ( I0=>FPU_SENSEPIN, 
            O=>GATE_T_430_A );
  GATE_T_430_I_2:   AND3 port map ( O=>T_430, 
            I2=>BGACK_000PIN, 
            I1=>FC_1XPIN, 
            I0=>GATE_T_430_A );
  GATE_T_431_I_1:   INV port map ( I0=>AS_030PIN, 
            O=>GATE_T_431_A );
  GATE_T_431_I_2:   INV port map ( I0=>A_DECODE_16XPIN, 
            O=>GATE_T_431_B );
  GATE_T_431_I_3:   AND3 port map ( O=>T_431, 
            I0=>FC_0XPIN, 
            I2=>GATE_T_431_A, 
            I1=>GATE_T_431_B );
  GATE_T_432_I_1:   INV port map ( I0=>A_DECODE_18XPIN, 
            O=>GATE_T_432_A );
  GATE_T_432_I_2:   INV port map ( I0=>A_DECODE_19XPIN, 
            O=>GATE_T_432_B );
  GATE_T_432_I_3:   AND3 port map ( O=>T_432, 
            I0=>A_DECODE_17XPIN, 
            I2=>GATE_T_432_A, 
            I1=>GATE_T_432_B );
  GATE_T_433_I_1:   AND3 port map ( O=>T_433, 
            I2=>BGACK_000PIN, 
            I1=>FC_1XPIN, 
            I0=>FPU_SENSEPIN );

end NetList;
