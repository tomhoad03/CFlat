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
happyExpList = Happy_Data_Array.listArray (0,164) ([34816,24974,512,64,0,0,0,32768,0,0,0,0,0,32,0,0,1,0,2048,0,2,8,0,0,2,0,4096,0,0,128,32768,0,0,16,0,0,0,288,0,0,8,0,2048,8192,0,512,0,48,0,4096,0,0,0,512,0,0,0,0,0,16385,0,0,512,0,0,32,0,16384,3188,4099,0,0,0,0,0,1,0,8,0,1024,0,0,0,8,0,8192,0,0,256,0,0,24,0,0,0,0,512,0,2,0,0,0,1,0,0,0,0,16,0,128,0,0,512,0,0,32,0,256,0,1,0,4096,0,256,128,0,0,0,0,0,0,0,0,1,0,0,16384,0,0,512,0,4,0,51012,48,1,0,2048,2048,0,0,0,0,0,0,4096,0,0,0,0,0,0,0,1024,0,0,0,0,0,0,4,0,8192,0,256,0,0,8,2048,0,0,0,512,0,0,32,0,0,0,0,0,0,0,16,0,128,0,0,504,0,0,16,0,0,0,0,12288,0,0,0,0,0,0,0,8192,0,32,0,256,0,0,25506,32792,0,0,128,0,0,8,0,0,32769,0,0,0,0,32,0,16,1,0,2048,0,0,64,0,0,2,0,4096,0,0,128,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32768,0,0,0,2048,0,0,0,0,0,0,4096,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseCFlat","Exp","Sets","Set","Cols","Col","Wheres","Where","Words","load","'='","'\"'","'.csv'","var","add","unite","preach","select","all","where","of","arrange","append","asc","desc","nullCase","notNull","update","delete","','","'=='","'>='","'<='","'>'","'<'","'!='","'('","')'","int","word","%eof"]
        bit_start = st Prelude.* 43
        bit_end = (st Prelude.+ 1) Prelude.* 43
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..42]
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
action_0 (42) = happyShift action_12
action_0 (4) = happyGoto action_3
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (12) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (42) = happyShift action_23
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (43) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (42) = happyShift action_22
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (42) = happyShift action_21
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (42) = happyShift action_20
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (21) = happyShift action_18
action_7 (39) = happyShift action_19
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (42) = happyShift action_17
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (42) = happyShift action_16
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (42) = happyShift action_15
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (23) = happyShift action_14
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (17) = happyShift action_13
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (39) = happyShift action_37
action_13 (42) = happyShift action_38
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (42) = happyShift action_36
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (39) = happyShift action_35
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (14) = happyShift action_33
action_16 (42) = happyShift action_34
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (26) = happyShift action_31
action_17 (27) = happyShift action_32
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (23) = happyShift action_30
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (41) = happyShift action_29
action_19 (7) = happyGoto action_27
action_19 (8) = happyGoto action_28
action_19 _ = happyFail (happyExpListPerState 19)

action_20 _ = happyReduce_16

action_21 (42) = happyShift action_26
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (13) = happyShift action_25
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (13) = happyShift action_24
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (14) = happyShift action_54
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (12) = happyShift action_2
action_25 (16) = happyShift action_4
action_25 (18) = happyShift action_5
action_25 (19) = happyShift action_6
action_25 (20) = happyShift action_7
action_25 (24) = happyShift action_8
action_25 (25) = happyShift action_9
action_25 (30) = happyShift action_10
action_25 (31) = happyShift action_11
action_25 (42) = happyShift action_12
action_25 (4) = happyGoto action_53
action_25 _ = happyFail (happyExpListPerState 25)

action_26 _ = happyReduce_9

action_27 (40) = happyShift action_52
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (32) = happyShift action_51
action_28 _ = happyReduce_25

action_29 (28) = happyShift action_50
action_29 _ = happyReduce_27

action_30 (42) = happyShift action_49
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (41) = happyShift action_48
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (41) = happyShift action_47
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (41) = happyShift action_45
action_33 (42) = happyShift action_46
action_33 _ = happyFail (happyExpListPerState 33)

action_34 _ = happyReduce_12

action_35 (41) = happyShift action_44
action_35 (5) = happyGoto action_42
action_35 (6) = happyGoto action_43
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (22) = happyShift action_41
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (42) = happyShift action_40
action_37 (11) = happyGoto action_39
action_37 _ = happyFail (happyExpListPerState 37)

action_38 _ = happyReduce_3

action_39 (40) = happyShift action_69
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (32) = happyShift action_68
action_40 _ = happyReduce_38

action_41 (39) = happyShift action_67
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (40) = happyShift action_66
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (32) = happyShift action_65
action_43 _ = happyReduce_20

action_44 (13) = happyShift action_64
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (14) = happyShift action_62
action_45 (42) = happyShift action_63
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (14) = happyShift action_61
action_46 _ = happyFail (happyExpListPerState 46)

action_47 _ = happyReduce_11

action_48 _ = happyReduce_10

action_49 (22) = happyShift action_60
action_49 _ = happyReduce_5

action_50 (41) = happyShift action_59
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (41) = happyShift action_29
action_51 (7) = happyGoto action_58
action_51 (8) = happyGoto action_28
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (23) = happyShift action_57
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (12) = happyShift action_2
action_53 (16) = happyShift action_4
action_53 (18) = happyShift action_5
action_53 (19) = happyShift action_6
action_53 (20) = happyShift action_7
action_53 (24) = happyShift action_8
action_53 (25) = happyShift action_9
action_53 (30) = happyShift action_10
action_53 (31) = happyShift action_11
action_53 (42) = happyShift action_12
action_53 (4) = happyGoto action_56
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (42) = happyShift action_55
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (15) = happyShift action_81
action_55 _ = happyFail (happyExpListPerState 55)

action_56 _ = happyReduce_2

action_57 (42) = happyShift action_80
action_57 _ = happyFail (happyExpListPerState 57)

action_58 _ = happyReduce_24

action_59 _ = happyReduce_26

action_60 (39) = happyShift action_79
action_60 _ = happyFail (happyExpListPerState 60)

action_61 _ = happyReduce_13

action_62 _ = happyReduce_14

action_63 (14) = happyShift action_78
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (14) = happyShift action_76
action_64 (41) = happyShift action_77
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (41) = happyShift action_44
action_65 (5) = happyGoto action_75
action_65 (6) = happyGoto action_43
action_65 _ = happyFail (happyExpListPerState 65)

action_66 (22) = happyShift action_74
action_66 _ = happyFail (happyExpListPerState 66)

action_67 (41) = happyShift action_73
action_67 (9) = happyGoto action_71
action_67 (10) = happyGoto action_72
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (42) = happyShift action_40
action_68 (11) = happyGoto action_70
action_68 _ = happyFail (happyExpListPerState 68)

action_69 _ = happyReduce_4

action_70 _ = happyReduce_37

action_71 (40) = happyShift action_95
action_71 _ = happyFail (happyExpListPerState 71)

action_72 (32) = happyShift action_94
action_72 _ = happyReduce_29

action_73 (33) = happyShift action_88
action_73 (34) = happyShift action_89
action_73 (35) = happyShift action_90
action_73 (36) = happyShift action_91
action_73 (37) = happyShift action_92
action_73 (38) = happyShift action_93
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (39) = happyShift action_87
action_74 _ = happyFail (happyExpListPerState 74)

action_75 _ = happyReduce_19

action_76 (41) = happyShift action_85
action_76 (42) = happyShift action_86
action_76 _ = happyFail (happyExpListPerState 76)

action_77 _ = happyReduce_22

action_78 _ = happyReduce_15

action_79 (41) = happyShift action_73
action_79 (9) = happyGoto action_84
action_79 (10) = happyGoto action_72
action_79 _ = happyFail (happyExpListPerState 79)

action_80 (22) = happyShift action_83
action_80 _ = happyReduce_6

action_81 (14) = happyShift action_82
action_81 _ = happyFail (happyExpListPerState 81)

action_82 (12) = happyShift action_2
action_82 (16) = happyShift action_4
action_82 (18) = happyShift action_5
action_82 (19) = happyShift action_6
action_82 (20) = happyShift action_7
action_82 (24) = happyShift action_8
action_82 (25) = happyShift action_9
action_82 (30) = happyShift action_10
action_82 (31) = happyShift action_11
action_82 (42) = happyShift action_12
action_82 (4) = happyGoto action_109
action_82 _ = happyFail (happyExpListPerState 82)

action_83 (39) = happyShift action_108
action_83 _ = happyFail (happyExpListPerState 83)

action_84 (40) = happyShift action_107
action_84 _ = happyFail (happyExpListPerState 84)

action_85 (42) = happyShift action_106
action_85 _ = happyFail (happyExpListPerState 85)

action_86 (14) = happyShift action_105
action_86 _ = happyFail (happyExpListPerState 86)

action_87 (41) = happyShift action_73
action_87 (9) = happyGoto action_104
action_87 (10) = happyGoto action_72
action_87 _ = happyFail (happyExpListPerState 87)

action_88 (29) = happyShift action_102
action_88 (41) = happyShift action_103
action_88 _ = happyFail (happyExpListPerState 88)

action_89 (41) = happyShift action_101
action_89 _ = happyFail (happyExpListPerState 89)

action_90 (41) = happyShift action_100
action_90 _ = happyFail (happyExpListPerState 90)

action_91 (41) = happyShift action_99
action_91 _ = happyFail (happyExpListPerState 91)

action_92 (41) = happyShift action_98
action_92 _ = happyFail (happyExpListPerState 92)

action_93 (41) = happyShift action_97
action_93 _ = happyFail (happyExpListPerState 93)

action_94 (41) = happyShift action_73
action_94 (9) = happyGoto action_96
action_94 (10) = happyGoto action_72
action_94 _ = happyFail (happyExpListPerState 94)

action_95 _ = happyReduce_18

action_96 _ = happyReduce_28

action_97 _ = happyReduce_35

action_98 _ = happyReduce_34

action_99 _ = happyReduce_33

action_100 _ = happyReduce_32

action_101 _ = happyReduce_31

action_102 _ = happyReduce_36

action_103 _ = happyReduce_30

action_104 (40) = happyShift action_112
action_104 _ = happyFail (happyExpListPerState 104)

action_105 _ = happyReduce_21

action_106 (14) = happyShift action_111
action_106 _ = happyFail (happyExpListPerState 106)

action_107 _ = happyReduce_7

action_108 (41) = happyShift action_73
action_108 (9) = happyGoto action_110
action_108 (10) = happyGoto action_72
action_108 _ = happyFail (happyExpListPerState 108)

action_109 _ = happyReduce_1

action_110 (40) = happyShift action_113
action_110 _ = happyFail (happyExpListPerState 110)

action_111 _ = happyReduce_23

action_112 _ = happyReduce_17

action_113 _ = happyReduce_8

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

happyReduce_9 = happySpecReduce_3  4 happyReduction_9
happyReduction_9 (HappyTerminal (TokenWord    _ happy_var_3))
	(HappyTerminal (TokenWord    _ happy_var_2))
	_
	 =  HappyAbsSyn4
		 (TmUnite happy_var_2 happy_var_3
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happyReduce 4 4 happyReduction_10
happyReduction_10 ((HappyTerminal (TokenInt     _ happy_var_4)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenWord    _ happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (TmArr1 happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_11 = happyReduce 4 4 happyReduction_11
happyReduction_11 ((HappyTerminal (TokenInt     _ happy_var_4)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenWord    _ happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (TmArr2 happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_12 = happySpecReduce_3  4 happyReduction_12
happyReduction_12 (HappyTerminal (TokenWord    _ happy_var_3))
	(HappyTerminal (TokenWord    _ happy_var_2))
	_
	 =  HappyAbsSyn4
		 (TmApp1 happy_var_2 happy_var_3
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happyReduce 5 4 happyReduction_13
happyReduction_13 (_ `HappyStk`
	(HappyTerminal (TokenWord    _ happy_var_4)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenWord    _ happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (TmApp2 happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_14 = happyReduce 5 4 happyReduction_14
happyReduction_14 (_ `HappyStk`
	(HappyTerminal (TokenInt     _ happy_var_4)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenWord    _ happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (TmApp3 happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_15 = happyReduce 6 4 happyReduction_15
happyReduction_15 (_ `HappyStk`
	(HappyTerminal (TokenWord    _ happy_var_5)) `HappyStk`
	(HappyTerminal (TokenInt     _ happy_var_4)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenWord    _ happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (TmApp4 happy_var_2 happy_var_4 happy_var_5
	) `HappyStk` happyRest

happyReduce_16 = happySpecReduce_2  4 happyReduction_16
happyReduction_16 (HappyTerminal (TokenWord    _ happy_var_2))
	_
	 =  HappyAbsSyn4
		 (TmPreach happy_var_2
	)
happyReduction_16 _ _  = notHappyAtAll 

happyReduce_17 = happyReduce 9 4 happyReduction_17
happyReduction_17 (_ `HappyStk`
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

happyReduce_18 = happyReduce 7 4 happyReduction_18
happyReduction_18 (_ `HappyStk`
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

happyReduce_19 = happySpecReduce_3  5 happyReduction_19
happyReduction_19 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 (Tm1Sets happy_var_1 happy_var_3
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_1  5 happyReduction_20
happyReduction_20 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 (Tm2Sets happy_var_1
	)
happyReduction_20 _  = notHappyAtAll 

happyReduce_21 = happyReduce 5 6 happyReduction_21
happyReduction_21 (_ `HappyStk`
	(HappyTerminal (TokenWord    _ happy_var_4)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenInt     _ happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (TmSet1 happy_var_1 happy_var_4
	) `HappyStk` happyRest

happyReduce_22 = happySpecReduce_3  6 happyReduction_22
happyReduction_22 (HappyTerminal (TokenInt     _ happy_var_3))
	_
	(HappyTerminal (TokenInt     _ happy_var_1))
	 =  HappyAbsSyn6
		 (TmSet2 happy_var_1 happy_var_3
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happyReduce 6 6 happyReduction_23
happyReduction_23 (_ `HappyStk`
	(HappyTerminal (TokenWord    _ happy_var_5)) `HappyStk`
	(HappyTerminal (TokenInt     _ happy_var_4)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenInt     _ happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (TmSet3 happy_var_1 happy_var_4 happy_var_5
	) `HappyStk` happyRest

happyReduce_24 = happySpecReduce_3  7 happyReduction_24
happyReduction_24 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 (Tm1Cols happy_var_1 happy_var_3
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_1  7 happyReduction_25
happyReduction_25 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 (Tm2Cols happy_var_1
	)
happyReduction_25 _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_3  8 happyReduction_26
happyReduction_26 (HappyTerminal (TokenInt     _ happy_var_3))
	_
	(HappyTerminal (TokenInt     _ happy_var_1))
	 =  HappyAbsSyn8
		 (TmNullCol happy_var_1 happy_var_3
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_1  8 happyReduction_27
happyReduction_27 (HappyTerminal (TokenInt     _ happy_var_1))
	 =  HappyAbsSyn8
		 (TmCol happy_var_1
	)
happyReduction_27 _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_3  9 happyReduction_28
happyReduction_28 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 (Tm1Wheres happy_var_1 happy_var_3
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_1  9 happyReduction_29
happyReduction_29 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 (Tm2Wheres happy_var_1
	)
happyReduction_29 _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_3  10 happyReduction_30
happyReduction_30 (HappyTerminal (TokenInt     _ happy_var_3))
	_
	(HappyTerminal (TokenInt     _ happy_var_1))
	 =  HappyAbsSyn10
		 (Tm2Where happy_var_1 happy_var_3
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_3  10 happyReduction_31
happyReduction_31 (HappyTerminal (TokenInt     _ happy_var_3))
	_
	(HappyTerminal (TokenInt     _ happy_var_1))
	 =  HappyAbsSyn10
		 (Tm3Where happy_var_1 happy_var_3
	)
happyReduction_31 _ _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_3  10 happyReduction_32
happyReduction_32 (HappyTerminal (TokenInt     _ happy_var_3))
	_
	(HappyTerminal (TokenInt     _ happy_var_1))
	 =  HappyAbsSyn10
		 (Tm4Where happy_var_1 happy_var_3
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_3  10 happyReduction_33
happyReduction_33 (HappyTerminal (TokenInt     _ happy_var_3))
	_
	(HappyTerminal (TokenInt     _ happy_var_1))
	 =  HappyAbsSyn10
		 (Tm5Where happy_var_1 happy_var_3
	)
happyReduction_33 _ _ _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_3  10 happyReduction_34
happyReduction_34 (HappyTerminal (TokenInt     _ happy_var_3))
	_
	(HappyTerminal (TokenInt     _ happy_var_1))
	 =  HappyAbsSyn10
		 (Tm6Where happy_var_1 happy_var_3
	)
happyReduction_34 _ _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_3  10 happyReduction_35
happyReduction_35 (HappyTerminal (TokenInt     _ happy_var_3))
	_
	(HappyTerminal (TokenInt     _ happy_var_1))
	 =  HappyAbsSyn10
		 (Tm7Where happy_var_1 happy_var_3
	)
happyReduction_35 _ _ _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_3  10 happyReduction_36
happyReduction_36 _
	_
	(HappyTerminal (TokenInt     _ happy_var_1))
	 =  HappyAbsSyn10
		 (Tm8Where happy_var_1
	)
happyReduction_36 _ _ _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_3  11 happyReduction_37
happyReduction_37 (HappyAbsSyn11  happy_var_3)
	_
	(HappyTerminal (TokenWord    _ happy_var_1))
	 =  HappyAbsSyn11
		 (TmWords happy_var_1 happy_var_3
	)
happyReduction_37 _ _ _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_1  11 happyReduction_38
happyReduction_38 (HappyTerminal (TokenWord    _ happy_var_1))
	 =  HappyAbsSyn11
		 (TmWord happy_var_1
	)
happyReduction_38 _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 43 43 notHappyAtAll (HappyState action) sts stk []

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
	TokenCom     _ -> cont 32;
	TokenEq      _ -> cont 33;
	TokenGreatEq _ -> cont 34;
	TokenLessEq  _ -> cont 35;
	TokenGreat   _ -> cont 36;
	TokenLess    _ -> cont 37;
	TokenNotEq   _ -> cont 38;
	TokenLB      _ -> cont 39;
	TokenRB      _ -> cont 40;
	TokenInt     _ happy_dollar_dollar -> cont 41;
	TokenWord    _ happy_dollar_dollar -> cont 42;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 43 tk tks = happyError' (tks, explist)
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
parseError (t : ts) = error ("Parse error at " ++ (tokenPosn t) ++ show t)

data Exp = TmLoad String String Exp
         | TmVar String Exp Exp
		 | Tm1Add String String
		 | Tm2Add String Words
		 | Tm1Select String
		 | Tm2Select Cols String
		 | Tm3Select String Wheres
		 | Tm4Select Cols String Wheres
		 | TmUnite String String
         | TmArr1 String Int
         | TmArr2 String Int
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
            | Tm8Where Int
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
