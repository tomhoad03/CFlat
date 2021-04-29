{-# OPTIONS_GHC -w #-}
module Grammar where
import Tokens
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.0

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11
	= HappyTerminal (Token)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,168) ([34816,24974,2048,256,0,0,0,0,32,0,0,0,0,32768,0,0,4096,0,0,512,32768,3072,8,0,0,8,0,0,1,0,8192,0,32,0,4096,0,0,0,0,18,0,0,2,0,2048,8192,0,2048,0,192,0,0,1,0,0,32768,0,0,16384,0,0,2048,0,0,0,0,0,64,16,0,0,2,0,32768,0,0,17408,12487,1024,0,0,0,0,0,4,0,128,0,16384,0,0,64,0,0,0,128,0,0,32,0,0,2,0,16384,0,0,6144,0,0,0,0,0,32,8192,0,0,0,0,1,0,0,0,0,256,0,8192,0,0,0,2,0,32768,0,0,16,4096,0,0,1024,0,256,128,0,0,0,0,0,0,0,0,64,0,0,0,128,0,0,64,0,0,4,0,32768,0,256,0,17408,12487,1024,0,0,128,128,0,0,0,0,0,0,16384,0,0,0,0,0,0,0,0,0,8192,0,0,0,4096,0,0,0,0,0,0,256,0,0,32,0,4,0,32768,0,128,0,0,0,512,0,0,128,0,0,0,0,0,0,0,4096,0,0,2,0,32768,31,0,0,4,0,0,0,0,49152,0,0,0,0,0,0,0,0,32,0,0,8,1024,0,32768,0,0,17408,12487,1024,0,0,16,0,0,0,0,32768,0,0,16384,8192,0,0,0,0,128,0,64,48,0,0,2,0,16384,0,0,2048,0,0,256,0,0,32,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,16384,0,0,0,0,0,0,0,32,0,0,0,0,16384,0,0,0,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseCFlat","Exp","Sets","Set","Cols","Col","Wheres","Where","Words","load","'='","'\"'","'.csv'","var","add","unite","preach","select","all","where","of","arrange","append","asc","desc","nullCase","notNull","update","delete","distinct","top","','","'=='","'>='","'<='","'>'","'<'","'!='","'('","')'","int","word","%eof"]
        bit_start = st Prelude.* 45
        bit_end = (st Prelude.+ 1) Prelude.* 45
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..44]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (12) = happyShift action_2
action_0 (16) = happyShift action_4
action_0 (18) = happyShift action_5
action_0 (19) = happyShift action_6
action_0 (20) = happyShift action_7
action_0 (24) = happyShift action_8
action_0 (25) = happyShift action_9
action_0 (30) = happyShift action_10
action_0 (31) = happyShift action_11
action_0 (44) = happyShift action_12
action_0 (4) = happyGoto action_3
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (12) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (44) = happyShift action_25
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (45) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (44) = happyShift action_24
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (44) = happyShift action_23
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (44) = happyShift action_22
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (21) = happyShift action_18
action_7 (32) = happyShift action_19
action_7 (33) = happyShift action_20
action_7 (41) = happyShift action_21
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (44) = happyShift action_17
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (44) = happyShift action_16
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (44) = happyShift action_15
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (23) = happyShift action_14
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (17) = happyShift action_13
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (41) = happyShift action_41
action_13 (44) = happyShift action_42
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (44) = happyShift action_40
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (41) = happyShift action_39
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (14) = happyShift action_37
action_16 (44) = happyShift action_38
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (26) = happyShift action_35
action_17 (27) = happyShift action_36
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (23) = happyShift action_34
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (41) = happyShift action_33
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (43) = happyShift action_32
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (43) = happyShift action_31
action_21 (7) = happyGoto action_29
action_21 (8) = happyGoto action_30
action_21 _ = happyFail (happyExpListPerState 21)

action_22 _ = happyReduce_20

action_23 (44) = happyShift action_28
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (13) = happyShift action_27
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (13) = happyShift action_26
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (14) = happyShift action_60
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (12) = happyShift action_2
action_27 (16) = happyShift action_4
action_27 (18) = happyShift action_5
action_27 (19) = happyShift action_6
action_27 (20) = happyShift action_7
action_27 (24) = happyShift action_8
action_27 (25) = happyShift action_9
action_27 (30) = happyShift action_10
action_27 (31) = happyShift action_11
action_27 (44) = happyShift action_12
action_27 (4) = happyGoto action_59
action_27 _ = happyFail (happyExpListPerState 27)

action_28 _ = happyReduce_11

action_29 (42) = happyShift action_58
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (34) = happyShift action_57
action_30 _ = happyReduce_29

action_31 (28) = happyShift action_56
action_31 _ = happyReduce_31

action_32 (23) = happyShift action_55
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (43) = happyShift action_31
action_33 (7) = happyGoto action_54
action_33 (8) = happyGoto action_30
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (44) = happyShift action_53
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (43) = happyShift action_52
action_35 _ = happyReduce_14

action_36 (43) = happyShift action_51
action_36 _ = happyReduce_15

action_37 (43) = happyShift action_49
action_37 (44) = happyShift action_50
action_37 _ = happyFail (happyExpListPerState 37)

action_38 _ = happyReduce_16

action_39 (43) = happyShift action_48
action_39 (5) = happyGoto action_46
action_39 (6) = happyGoto action_47
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (22) = happyShift action_45
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (44) = happyShift action_44
action_41 (11) = happyGoto action_43
action_41 _ = happyFail (happyExpListPerState 41)

action_42 _ = happyReduce_3

action_43 (42) = happyShift action_77
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (34) = happyShift action_76
action_44 _ = happyReduce_43

action_45 (41) = happyShift action_75
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (42) = happyShift action_74
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (34) = happyShift action_73
action_47 _ = happyReduce_24

action_48 (13) = happyShift action_72
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (14) = happyShift action_70
action_49 (44) = happyShift action_71
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (14) = happyShift action_69
action_50 _ = happyFail (happyExpListPerState 50)

action_51 _ = happyReduce_13

action_52 _ = happyReduce_12

action_53 (22) = happyShift action_68
action_53 _ = happyReduce_5

action_54 (42) = happyShift action_67
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (44) = happyShift action_66
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (43) = happyShift action_65
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (43) = happyShift action_31
action_57 (7) = happyGoto action_64
action_57 (8) = happyGoto action_30
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (23) = happyShift action_63
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (12) = happyShift action_2
action_59 (16) = happyShift action_4
action_59 (18) = happyShift action_5
action_59 (19) = happyShift action_6
action_59 (20) = happyShift action_7
action_59 (24) = happyShift action_8
action_59 (25) = happyShift action_9
action_59 (30) = happyShift action_10
action_59 (31) = happyShift action_11
action_59 (44) = happyShift action_12
action_59 (4) = happyGoto action_62
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (44) = happyShift action_61
action_60 _ = happyFail (happyExpListPerState 60)

action_61 (15) = happyShift action_90
action_61 _ = happyFail (happyExpListPerState 61)

action_62 _ = happyReduce_2

action_63 (44) = happyShift action_89
action_63 _ = happyFail (happyExpListPerState 63)

action_64 _ = happyReduce_28

action_65 _ = happyReduce_30

action_66 _ = happyReduce_10

action_67 (23) = happyShift action_88
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (41) = happyShift action_87
action_68 _ = happyFail (happyExpListPerState 68)

action_69 _ = happyReduce_17

action_70 _ = happyReduce_18

action_71 (14) = happyShift action_86
action_71 _ = happyFail (happyExpListPerState 71)

action_72 (14) = happyShift action_84
action_72 (43) = happyShift action_85
action_72 _ = happyFail (happyExpListPerState 72)

action_73 (43) = happyShift action_48
action_73 (5) = happyGoto action_83
action_73 (6) = happyGoto action_47
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (22) = happyShift action_82
action_74 _ = happyFail (happyExpListPerState 74)

action_75 (43) = happyShift action_81
action_75 (9) = happyGoto action_79
action_75 (10) = happyGoto action_80
action_75 _ = happyFail (happyExpListPerState 75)

action_76 (44) = happyShift action_44
action_76 (11) = happyGoto action_78
action_76 _ = happyFail (happyExpListPerState 76)

action_77 _ = happyReduce_4

action_78 _ = happyReduce_42

action_79 (42) = happyShift action_105
action_79 _ = happyFail (happyExpListPerState 79)

action_80 (34) = happyShift action_104
action_80 _ = happyReduce_33

action_81 (35) = happyShift action_98
action_81 (36) = happyShift action_99
action_81 (37) = happyShift action_100
action_81 (38) = happyShift action_101
action_81 (39) = happyShift action_102
action_81 (40) = happyShift action_103
action_81 _ = happyFail (happyExpListPerState 81)

action_82 (41) = happyShift action_97
action_82 _ = happyFail (happyExpListPerState 82)

action_83 _ = happyReduce_23

action_84 (43) = happyShift action_95
action_84 (44) = happyShift action_96
action_84 _ = happyFail (happyExpListPerState 84)

action_85 _ = happyReduce_26

action_86 _ = happyReduce_19

action_87 (43) = happyShift action_81
action_87 (9) = happyGoto action_94
action_87 (10) = happyGoto action_80
action_87 _ = happyFail (happyExpListPerState 87)

action_88 (44) = happyShift action_93
action_88 _ = happyFail (happyExpListPerState 88)

action_89 (22) = happyShift action_92
action_89 _ = happyReduce_6

action_90 (14) = happyShift action_91
action_90 _ = happyFail (happyExpListPerState 90)

action_91 (12) = happyShift action_2
action_91 (16) = happyShift action_4
action_91 (18) = happyShift action_5
action_91 (19) = happyShift action_6
action_91 (20) = happyShift action_7
action_91 (24) = happyShift action_8
action_91 (25) = happyShift action_9
action_91 (30) = happyShift action_10
action_91 (31) = happyShift action_11
action_91 (44) = happyShift action_12
action_91 (4) = happyGoto action_120
action_91 _ = happyFail (happyExpListPerState 91)

action_92 (41) = happyShift action_119
action_92 _ = happyFail (happyExpListPerState 92)

action_93 _ = happyReduce_9

action_94 (42) = happyShift action_118
action_94 _ = happyFail (happyExpListPerState 94)

action_95 (44) = happyShift action_117
action_95 _ = happyFail (happyExpListPerState 95)

action_96 (14) = happyShift action_116
action_96 _ = happyFail (happyExpListPerState 96)

action_97 (43) = happyShift action_81
action_97 (9) = happyGoto action_115
action_97 (10) = happyGoto action_80
action_97 _ = happyFail (happyExpListPerState 97)

action_98 (29) = happyShift action_112
action_98 (43) = happyShift action_113
action_98 (44) = happyShift action_114
action_98 _ = happyFail (happyExpListPerState 98)

action_99 (43) = happyShift action_111
action_99 _ = happyFail (happyExpListPerState 99)

action_100 (43) = happyShift action_110
action_100 _ = happyFail (happyExpListPerState 100)

action_101 (43) = happyShift action_109
action_101 _ = happyFail (happyExpListPerState 101)

action_102 (43) = happyShift action_108
action_102 _ = happyFail (happyExpListPerState 102)

action_103 (43) = happyShift action_107
action_103 _ = happyFail (happyExpListPerState 103)

action_104 (43) = happyShift action_81
action_104 (9) = happyGoto action_106
action_104 (10) = happyGoto action_80
action_104 _ = happyFail (happyExpListPerState 104)

action_105 _ = happyReduce_22

action_106 _ = happyReduce_32

action_107 _ = happyReduce_39

action_108 _ = happyReduce_38

action_109 _ = happyReduce_37

action_110 _ = happyReduce_36

action_111 _ = happyReduce_35

action_112 _ = happyReduce_41

action_113 _ = happyReduce_34

action_114 _ = happyReduce_40

action_115 (42) = happyShift action_123
action_115 _ = happyFail (happyExpListPerState 115)

action_116 _ = happyReduce_25

action_117 (14) = happyShift action_122
action_117 _ = happyFail (happyExpListPerState 117)

action_118 _ = happyReduce_7

action_119 (43) = happyShift action_81
action_119 (9) = happyGoto action_121
action_119 (10) = happyGoto action_80
action_119 _ = happyFail (happyExpListPerState 119)

action_120 _ = happyReduce_1

action_121 (42) = happyShift action_124
action_121 _ = happyFail (happyExpListPerState 121)

action_122 _ = happyReduce_27

action_123 _ = happyReduce_21

action_124 _ = happyReduce_8

happyReduce_1 = happyReduce 8 4 happyReduction_1
happyReduction_1 ((HappyAbsSyn4  happy_var_8) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenWord    _ happy_var_5)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenWord    _ happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (TmLoad happy_var_2 happy_var_5 happy_var_8
	) `HappyStk` happyRest

happyReduce_2 = happyReduce 5 4 happyReduction_2
happyReduction_2 ((HappyAbsSyn4  happy_var_5) `HappyStk`
	(HappyAbsSyn4  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenWord    _ happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (TmVar happy_var_2 happy_var_4 happy_var_5
	) `HappyStk` happyRest

happyReduce_3 = happySpecReduce_3  4 happyReduction_3
happyReduction_3 (HappyTerminal (TokenWord    _ happy_var_3))
	_
	(HappyTerminal (TokenWord    _ happy_var_1))
	 =  HappyAbsSyn4
		 (Tm1Add happy_var_1 happy_var_3
	)
happyReduction_3 _ _ _  = notHappyAtAll 

happyReduce_4 = happyReduce 5 4 happyReduction_4
happyReduction_4 (_ `HappyStk`
	(HappyAbsSyn11  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenWord    _ happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Tm2Add happy_var_1 happy_var_4
	) `HappyStk` happyRest

happyReduce_5 = happyReduce 4 4 happyReduction_5
happyReduction_5 ((HappyTerminal (TokenWord    _ happy_var_4)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Tm1Select happy_var_4
	) `HappyStk` happyRest

happyReduce_6 = happyReduce 6 4 happyReduction_6
happyReduction_6 ((HappyTerminal (TokenWord    _ happy_var_6)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Tm2Select happy_var_3 happy_var_6
	) `HappyStk` happyRest

happyReduce_7 = happyReduce 8 4 happyReduction_7
happyReduction_7 (_ `HappyStk`
	(HappyAbsSyn9  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenWord    _ happy_var_4)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Tm3Select happy_var_4 happy_var_7
	) `HappyStk` happyRest

happyReduce_8 = happyReduce 10 4 happyReduction_8
happyReduction_8 (_ `HappyStk`
	(HappyAbsSyn9  happy_var_9) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenWord    _ happy_var_6)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Tm4Select happy_var_3 happy_var_6 happy_var_9
	) `HappyStk` happyRest

happyReduce_9 = happyReduce 7 4 happyReduction_9
happyReduction_9 ((HappyTerminal (TokenWord    _ happy_var_7)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Tm5Select happy_var_4 happy_var_7
	) `HappyStk` happyRest

happyReduce_10 = happyReduce 5 4 happyReduction_10
happyReduction_10 ((HappyTerminal (TokenWord    _ happy_var_5)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenInt     _ happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Tm6Select happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_11 = happySpecReduce_3  4 happyReduction_11
happyReduction_11 (HappyTerminal (TokenWord    _ happy_var_3))
	(HappyTerminal (TokenWord    _ happy_var_2))
	_
	 =  HappyAbsSyn4
		 (TmUnite happy_var_2 happy_var_3
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happyReduce 4 4 happyReduction_12
happyReduction_12 ((HappyTerminal (TokenInt     _ happy_var_4)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenWord    _ happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (TmArr1 happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_13 = happyReduce 4 4 happyReduction_13
happyReduction_13 ((HappyTerminal (TokenInt     _ happy_var_4)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenWord    _ happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (TmArr2 happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_14 = happySpecReduce_3  4 happyReduction_14
happyReduction_14 _
	(HappyTerminal (TokenWord    _ happy_var_2))
	_
	 =  HappyAbsSyn4
		 (TmArr3 happy_var_2
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_3  4 happyReduction_15
happyReduction_15 _
	(HappyTerminal (TokenWord    _ happy_var_2))
	_
	 =  HappyAbsSyn4
		 (TmArr4 happy_var_2
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  4 happyReduction_16
happyReduction_16 (HappyTerminal (TokenWord    _ happy_var_3))
	(HappyTerminal (TokenWord    _ happy_var_2))
	_
	 =  HappyAbsSyn4
		 (TmApp1 happy_var_2 happy_var_3
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happyReduce 5 4 happyReduction_17
happyReduction_17 (_ `HappyStk`
	(HappyTerminal (TokenWord    _ happy_var_4)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenWord    _ happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (TmApp2 happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_18 = happyReduce 5 4 happyReduction_18
happyReduction_18 (_ `HappyStk`
	(HappyTerminal (TokenInt     _ happy_var_4)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenWord    _ happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (TmApp3 happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_19 = happyReduce 6 4 happyReduction_19
happyReduction_19 (_ `HappyStk`
	(HappyTerminal (TokenWord    _ happy_var_5)) `HappyStk`
	(HappyTerminal (TokenInt     _ happy_var_4)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenWord    _ happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (TmApp4 happy_var_2 happy_var_4 happy_var_5
	) `HappyStk` happyRest

happyReduce_20 = happySpecReduce_2  4 happyReduction_20
happyReduction_20 (HappyTerminal (TokenWord    _ happy_var_2))
	_
	 =  HappyAbsSyn4
		 (TmPreach happy_var_2
	)
happyReduction_20 _ _  = notHappyAtAll 

happyReduce_21 = happyReduce 9 4 happyReduction_21
happyReduction_21 (_ `HappyStk`
	(HappyAbsSyn9  happy_var_8) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenWord    _ happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (TmUpdate happy_var_2 happy_var_4 happy_var_8
	) `HappyStk` happyRest

happyReduce_22 = happyReduce 7 4 happyReduction_22
happyReduction_22 (_ `HappyStk`
	(HappyAbsSyn9  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenWord    _ happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (TmDelete happy_var_3 happy_var_6
	) `HappyStk` happyRest

happyReduce_23 = happySpecReduce_3  5 happyReduction_23
happyReduction_23 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 (Tm1Sets happy_var_1 happy_var_3
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_1  5 happyReduction_24
happyReduction_24 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 (Tm2Sets happy_var_1
	)
happyReduction_24 _  = notHappyAtAll 

happyReduce_25 = happyReduce 5 6 happyReduction_25
happyReduction_25 (_ `HappyStk`
	(HappyTerminal (TokenWord    _ happy_var_4)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenInt     _ happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (TmSet1 happy_var_1 happy_var_4
	) `HappyStk` happyRest

happyReduce_26 = happySpecReduce_3  6 happyReduction_26
happyReduction_26 (HappyTerminal (TokenInt     _ happy_var_3))
	_
	(HappyTerminal (TokenInt     _ happy_var_1))
	 =  HappyAbsSyn6
		 (TmSet2 happy_var_1 happy_var_3
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happyReduce 6 6 happyReduction_27
happyReduction_27 (_ `HappyStk`
	(HappyTerminal (TokenWord    _ happy_var_5)) `HappyStk`
	(HappyTerminal (TokenInt     _ happy_var_4)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenInt     _ happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (TmSet3 happy_var_1 happy_var_4 happy_var_5
	) `HappyStk` happyRest

happyReduce_28 = happySpecReduce_3  7 happyReduction_28
happyReduction_28 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 (Tm1Cols happy_var_1 happy_var_3
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_1  7 happyReduction_29
happyReduction_29 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 (Tm2Cols happy_var_1
	)
happyReduction_29 _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_3  8 happyReduction_30
happyReduction_30 (HappyTerminal (TokenInt     _ happy_var_3))
	_
	(HappyTerminal (TokenInt     _ happy_var_1))
	 =  HappyAbsSyn8
		 (TmNullCol happy_var_1 happy_var_3
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_1  8 happyReduction_31
happyReduction_31 (HappyTerminal (TokenInt     _ happy_var_1))
	 =  HappyAbsSyn8
		 (TmCol happy_var_1
	)
happyReduction_31 _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_3  9 happyReduction_32
happyReduction_32 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 (Tm1Wheres happy_var_1 happy_var_3
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_1  9 happyReduction_33
happyReduction_33 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 (Tm2Wheres happy_var_1
	)
happyReduction_33 _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_3  10 happyReduction_34
happyReduction_34 (HappyTerminal (TokenInt     _ happy_var_3))
	_
	(HappyTerminal (TokenInt     _ happy_var_1))
	 =  HappyAbsSyn10
		 (Tm2Where happy_var_1 happy_var_3
	)
happyReduction_34 _ _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_3  10 happyReduction_35
happyReduction_35 (HappyTerminal (TokenInt     _ happy_var_3))
	_
	(HappyTerminal (TokenInt     _ happy_var_1))
	 =  HappyAbsSyn10
		 (Tm3Where happy_var_1 happy_var_3
	)
happyReduction_35 _ _ _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_3  10 happyReduction_36
happyReduction_36 (HappyTerminal (TokenInt     _ happy_var_3))
	_
	(HappyTerminal (TokenInt     _ happy_var_1))
	 =  HappyAbsSyn10
		 (Tm4Where happy_var_1 happy_var_3
	)
happyReduction_36 _ _ _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_3  10 happyReduction_37
happyReduction_37 (HappyTerminal (TokenInt     _ happy_var_3))
	_
	(HappyTerminal (TokenInt     _ happy_var_1))
	 =  HappyAbsSyn10
		 (Tm5Where happy_var_1 happy_var_3
	)
happyReduction_37 _ _ _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_3  10 happyReduction_38
happyReduction_38 (HappyTerminal (TokenInt     _ happy_var_3))
	_
	(HappyTerminal (TokenInt     _ happy_var_1))
	 =  HappyAbsSyn10
		 (Tm6Where happy_var_1 happy_var_3
	)
happyReduction_38 _ _ _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_3  10 happyReduction_39
happyReduction_39 (HappyTerminal (TokenInt     _ happy_var_3))
	_
	(HappyTerminal (TokenInt     _ happy_var_1))
	 =  HappyAbsSyn10
		 (Tm7Where happy_var_1 happy_var_3
	)
happyReduction_39 _ _ _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_3  10 happyReduction_40
happyReduction_40 (HappyTerminal (TokenWord    _ happy_var_3))
	_
	(HappyTerminal (TokenInt     _ happy_var_1))
	 =  HappyAbsSyn10
		 (Tm8Where happy_var_1 happy_var_3
	)
happyReduction_40 _ _ _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_3  10 happyReduction_41
happyReduction_41 _
	_
	(HappyTerminal (TokenInt     _ happy_var_1))
	 =  HappyAbsSyn10
		 (Tm9Where happy_var_1
	)
happyReduction_41 _ _ _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_3  11 happyReduction_42
happyReduction_42 (HappyAbsSyn11  happy_var_3)
	_
	(HappyTerminal (TokenWord    _ happy_var_1))
	 =  HappyAbsSyn11
		 (TmWords happy_var_1 happy_var_3
	)
happyReduction_42 _ _ _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_1  11 happyReduction_43
happyReduction_43 (HappyTerminal (TokenWord    _ happy_var_1))
	 =  HappyAbsSyn11
		 (TmWord happy_var_1
	)
happyReduction_43 _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 45 45 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenLoad    _ -> cont 12;
	TokenAssign  _ -> cont 13;
	TokenTxt     _ -> cont 14;
	TokenExt     _ -> cont 15;
	TokenVar     _ -> cont 16;
	TokenAdd     _ -> cont 17;
	TokenUnite   _ -> cont 18;
	TokenPreach  _ -> cont 19;
	TokenSelect  _ -> cont 20;
	TokenAll     _ -> cont 21;
	TokenWhere   _ -> cont 22;
	TokenOf      _ -> cont 23;
	TokenArr     _ -> cont 24;
	TokenApp     _ -> cont 25;
	TokenAsc     _ -> cont 26;
	TokenDesc    _ -> cont 27;
	TokenNC      _ -> cont 28;
	TokenNN      _ -> cont 29;
	TokenUpdate  _ -> cont 30;
	TokenDelete  _ -> cont 31;
	TokenDist    _ -> cont 32;
	TokenTop     _ -> cont 33;
	TokenCom     _ -> cont 34;
	TokenEq      _ -> cont 35;
	TokenGreatEq _ -> cont 36;
	TokenLessEq  _ -> cont 37;
	TokenGreat   _ -> cont 38;
	TokenLess    _ -> cont 39;
	TokenNotEq   _ -> cont 40;
	TokenLB      _ -> cont 41;
	TokenRB      _ -> cont 42;
	TokenInt     _ happy_dollar_dollar -> cont 43;
	TokenWord    _ happy_dollar_dollar -> cont 44;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 45 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Prelude.Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Prelude.Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (Prelude.>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (Prelude.return)
happyThen1 m k tks = (Prelude.>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (Prelude.return) a
happyError' :: () => ([(Token)], [Prelude.String]) -> HappyIdentity a
happyError' = HappyIdentity Prelude.. (\(tokens, _) -> parseError tokens)
parseCFlat tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a
parseError [] = error "Parse Error"
parseError (t : ts) = error ("Parse error at " ++ (tokenPosn t) ++ " " ++ show t)

data Exp = TmLoad String String Exp
         | TmVar String Exp Exp
		 | Tm1Add String String
		 | Tm2Add String Words
		 | Tm1Select String
		 | Tm2Select Cols String
		 | Tm3Select String Wheres
		 | Tm4Select Cols String Wheres
		 | Tm5Select Cols String
         | Tm6Select Int String
		 | TmUnite String String
         | TmArr1 String Int
         | TmArr2 String Int
		 | TmArr3 String
		 | TmArr4 String
         | TmApp1 String String
         | TmApp2 String String
		 | TmApp3 String Int
		 | TmApp4 String Int String
		 | TmPreach String
		 | TmUpdate String Sets Wheres
         | TmDelete String Wheres
         deriving Show

data Sets = Tm1Sets Set Sets
          | Tm2Sets Set
          deriving Show
          
data Set  = TmSet1 Int String
          | TmSet2 Int Int
          | TmSet3 Int Int String
		  deriving Show

data Cols = Tm1Cols Col Cols
          | Tm2Cols Col
          deriving Show

data Col  = TmNullCol Int Int
          | TmCol Int
		  deriving Show

data Wheres = Tm1Wheres Where Wheres
            | Tm2Wheres Where
            deriving Show

data Where  = Tm2Where Int Int
		    | Tm3Where Int Int
		    | Tm4Where Int Int
		    | Tm5Where Int Int
		    | Tm6Where Int Int
		    | Tm7Where Int Int
			| Tm8Where Int String
            | Tm9Where Int
            deriving Show

data Words = TmWords String Words
           | TmWord String
		   deriving Show
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Prelude.Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x Prelude.< y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `Prelude.div` 16)) (bit `Prelude.mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Prelude.Int ->                    -- token number
         Prelude.Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Prelude.- ((1) :: Prelude.Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Prelude.Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n Prelude.- ((1) :: Prelude.Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Prelude.- ((1)::Prelude.Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Prelude.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
