	title	Fighter Mega Mix Common Bank program/Entry Point
	type	8521

	include frogger.tmp
	include equate.inc
	include ram.inc
	include disp_ram.inc
	include disp_equ.inc


;ASB	global		BLKA_BMP
;ASB	global		BLKA_NUM
;ASB	global		BLKB_BMP
;ASB	global		WD_MODE_SELECT
;ASB	global		WD_RECORDS
;ASB	global		WD_1P_MODE
;ASB	global		WD_VS_MODE
;ASB	global		WD_SUR_MODE
;ASB	global		WD_STAGE_SEL
;ASB	global		WD_pressbx
;ASB	global		WD_pressbo
;ASB	global		WD_sel_yr_fig
;ASB	global		WD_1P_MODE_OPT
;ASB	global		WD_VS_MODE_OPT
;ASB	global		WD_DIFF
;ASB	global		WD_RND
;ASB	global		WD_TIME
;ASB	global		WD_1p_life
;ASB	global		WD_2p_life
;ASB;	 global 	 WD_live
;ASB	global		WD_RESULT
;ASB	global		WD_LIMIT_TIME
;ASB	global		WD_limit_time
;ASB	global		WD_fighter
;ASB	global		WD_best_records
;ASB	global		WD_game_type
;ASB	global		WD_1P_VS_CPU
;ASB	global		WD_1P_VS_2P
;ASB	global		WD_EASY
;ASB	global		WD_NORMAL
;ASB	global		WD_HARD
;ASB	global		WD_1
;ASB	global		WD_3
;ASB	global		WD_5
;ASB	global		WD_45
;ASB	global		WD_75
;ASB	global		WD_99
;ASB	global		WD_FC1
;ASB	global		WD_FC2
;ASB	global		WD_FC3
;ASB	global		WD_FC4
;ASB	global		WD_FC5
;ASB	global		WD_FC6
;ASB	global		WD_FC7
;ASB	global		WD_FC8
;ASB	global		WD_FC9
;ASB	global		WD_FC0
;ASB	global		WD_FC15
;ASB	global		WD_FC32
;ASB	global		WD_wins
;ASB	global		WD_win02
;ASB	global		WD_min
;ASB	global		WD_1P
;ASB	global		WD_2P
;ASB	global		WD_CPU
;ASB	global		WD_STAGE_TYPE
;ASB	global		WD_AKIRA
;ASB	global		WD_PAI
;ASB	global		WD_LION
;ASB	global		WD_JACKY
;ASB	global		WD_BAHN
;ASB	global		WD_CANDY
;ASB	global		WD_SANMAN
;ASB	global		WD_MAHLER
;ASB	global		WD_KIDS
;ASB	global		WD_JANET
;ASB	global		WD_HORNET
;ASB	global		WD_SIBA
;ASB	global		WD_course
;ASB	global		WD_best_time
;ASB	global		WD_A
;ASB	global		WD_B
;ASB	global		WD_C
;ASB	global		WD_D
;ASB	global		WD_min1
;ASB	global		WD_sec1
;ASB	global		WD_sel_cpu_opp
;ASB	global		SHOW_STAGE
;ASB	global		SHOW_round
;ASB	global		ABCD
;ASB	global		LTIME3
;ASB	global		NAME_WIN
;ASB;	 global 	 WD_X_MAS
;ASB
;ASB	global		SELECT
;ASB	global		STz00
;ASB	global		STz01
;ASB	global		STz02
;ASB	global		START
;ASB	global		CS
;ASB	global		FS
;ASB	global		OPTION
;ASB	global		STz05
;ASB	global		STz03
;ASB	global		H00
;ASB	global		H01
;ASB	global		H02
;ASB	global		H03
;ASB	global		H04
;ASB	global		H05
;ASB	global		H06
;ASB	global		H07
;ASB	global		H08
;ASB	global		H09
;ASB	global		H10
;ASB	global		H11
;ASB	global		STz04
;ASB	global		COURSE
;ASB	global		no4
;ASB	global		A
;ASB	global		K
;ASB	global		M
;ASB	global		V
;ASB	global		W
;ASB	global		Y
;ASB	global		Q
;ASB	global		no0
;ASB	global		no1
;ASB	global		no2
;ASB	global		no3
;ASB	global		no5
;ASB	global		no6
;ASB	global		no7
;ASB	global		no8
;ASB	global		no9
;ASB	global		B
;ASB	global		C
;ASB	global		D
;ASB	global		E
;ASB	global		F
;ASB	global		G
;ASB	global		I
;ASB	global		J
;ASB	global		L
;ASB	global		N
;ASB	global		O
;ASB	global		P
;ASB	global		R
;ASB	global		S
;ASB	global		T
;ASB	global		U
;ASB	global		X
;ASB	global		Z
;ASB	global		H
;ASB	global		COURzA
;ASB	global		COURzG
;ASB	global		COURzF
;ASB	global		COURzE
;ASB	global		COURzD
;ASB	global		COURzC
;ASB	global		COURzB
;ASB	global		ST
;ASB	global		OPzSA01
;ASB	global		OPzBA02
;ASB	global		OPzHO02
;ASB	global		OPzMA02
;ASB	global		BACK
;ASB	global		OPzSA03
;ASB	global		OPzMA03
;ASB	global		OPzLI03
;ASB	global		KID
;ASB	global		MAHLER
;ASB	global		HORNET
;ASB	global		SIBA
;ASB	global		OPzBA01
;ASB	global		OPzPA01
;ASB	global		LOGOz03
;ASB	global		OPzAK03
;ASB	global		OPzJA03
;ASB	global		OPzBA03
;ASB	global		SANMAN
;ASB	global		AKIRA
;ASB	global		HONEY
;ASB	global		JACKY
;ASB	global		JANET
;ASB	global		BAHN
;ASB	global		LION
;ASB	global		PAI
;ASB	global		OPzMA01
;ASB	global		OPzLI01
;ASB	global		LOGOz02
;ASB	global		OPzHO01
;ASB	global		OPzJA02
;ASB	global		OPzSA02
;ASB	global		OPzPA02
;ASB	global		OPzAK01
;ASB	global		OPzJA01
;ASB	global		OPzLI02
;ASB	global		OPzAK02
;ASB	global		LIVE
;ASB	global		FRAME05
;ASB	global		FRAME04
;ASB	global		FRAME03
;ASB	global		FRAME02
;ASB	global		FRAME01
;ASB	global		PRESS
;ASB	global		LOGOz01
;ASB	global		OPzHO03
;ASB	global		OPzPA03
;ASB	global		SEL99
;ASB	global		FB0Z
;ASB	global		FB0Y
;ASB	global		FB0X
;ASB	global		FB0V
;ASB	global		FB0U
;ASB	global		FB0T
;ASB	global		FB0S
;ASB	global		FB0R
;ASB	global		FB0P
;ASB	global		FB0O
;ASB	global		FB0N
;ASB	global		FB0M
;ASB	global		FB0L
;ASB	global		FB0K
;ASB	global		FB0J
;ASB	global		FB0I
;ASB	global		FB0H
;ASB	global		FB0G
;ASB	global		FB0F
;ASB	global		FB0E
;ASB	global		FB0D
;ASB	global		FB0C
;ASB	global		FB0B
;ASB	global		FB0A
;ASB	global		FB09
;ASB	global		FB08
;ASB	global		FB07
;ASB	global		FB06
;ASB	global		FB05
;ASB	global		FB04
;ASB	global		FB03
;ASB	global		FB02
;ASB	global		FB01
;ASB	global		FB00
;ASB	global		FA0A
;ASB	global		FA0B
;ASB	global		FA0C
;ASB	global		FA0D
;ASB	global		FA0E
;ASB	global		FA0F
;ASB	global		FA0H
;ASB	global		FA0I
;ASB	global		FA0J
;ASB	global		FA0K
;ASB	global		FA0L
;ASB	global		FA0M
;ASB	global		FA0N
;ASB	global		FA00
;ASB	global		FA0P
;ASB	global		FA09
;ASB	global		FA08
;ASB	global		FA07
;ASB	global		FA06
;ASB	global		FA05
;ASB	global		FA04
;ASB	global		FA03
;ASB	global		FA02
;ASB	global		FA01
;ASB	global		FA0W
;ASB	global		FA0V
;ASB	global		FA0R
;ASB	global		FA0O
;ASB	global		FA0G
;ASB	global		FA0Z
;ASB	global		FA0Y
;ASB	global		FA0X
;ASB	global		FA0U
;ASB	global		FA0T
;ASB	global		FA0S
;ASB	global		FB0Q
;ASB	global		FB0W
;ASB	global		FA0Q
;ASB	global		FC07
;ASB	global		FC05
;ASB	global		R01
;ASB	global		FC01
;ASB	global		R09
;ASB	global		R08
;ASB	global		R07
;ASB	global		R06
;ASB	global		R05
;ASB	global		R04
;ASB	global		R03
;ASB	global		R02
;ASB	global		R00
;ASB	global		FC09
;ASB	global		FC08
;ASB	global		FC06
;ASB	global		FC04
;ASB	global		FC03
;ASB	global		FC02
;ASB	global		FC00
;ASB	global		S0WIN
;ASB	global		S0MIN
;ASB	global		slash
;ASB	global		slash01
;ASB	global		slash02
;ASB	global		EBAR01
;ASB	global		EBAR02
;ASB	global		MARROW01
;ASB	global		MUNLIMIT
;ASB
;ASB
;ASB	global		FC_value
;ASB	global		NAME12A
;ASB	global		table_1PM_OPT
;ASB	global		table_VS_M
;ASB	global		table_M_SEL
;ASB	global		COURSE_select
;ASB	global		Fighter12
;ASB	global		ST_WALL
;ASB	global		movie
;ASB
;ASB	program
;ASB
;ASB;]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]
;ASB
;ASBLTIME3:
;ASB	dw	WD_FC3,WD_FC7,WD_FC15
;ASB
;ASBABCD:	dw	WD_A,WD_B,WD_C,WD_D
;ASB
;ASBmovie:	dw	akira,bahn,pal,honey,lion,sanman,jacky,mahler
;ASB
;ASBakira:	db	12,18			;picY,picX
;ASB	dw	OPzAK01 		;Running graphic
;ASB	dw	OPzAK02 		;Faces graphic
;ASB	dw	OPzAK03 		;Names graphic
;ASB
;ASBbahn:	db	12,70
;ASB	dw	OPzBA01
;ASB	dw	OPzBA02
;ASB	dw	OPzBA03
;ASB
;ASBpal:	db	10,10
;ASB	dw	OPzPA01
;ASB	dw	OPzPA02
;ASB	dw	OPzPA03
;ASB
;ASBhoney:	db	10,100
;ASB	dw	OPzHO01
;ASB	dw	OPzHO02
;ASB	dw	OPzHO03
;ASB
;ASBlion:	db	10,4
;ASB	dw	OPzLI01
;ASB	dw	OPzLI02
;ASB	dw	OPzLI03
;ASB
;ASBsanman: db	7,100
;ASB	dw	OPzSA01
;ASB	dw	OPzSA02
;ASB	dw	OPzSA03
;ASB
;ASBjacky:	db	12,20
;ASB	dw	OPzJA01
;ASB	dw	OPzJA02
;ASB	dw	OPzJA03
;ASB
;ASBmahler: db	8,92
;ASB	dw	OPzMA01
;ASB	dw	OPzMA02
;ASB	dw	OPzMA03
;ASB
;ASBST_WALL:dw	st_A,st_B,st_C
;ASB
;ASBst_A:	dw	STz00
;ASB	db	8,50
;ASBst_B:	dw	STz01
;ASB	db	72,50
;ASBst_C:	dw	STz02
;ASB	db	136,50
;ASB
;ASBFighter12:				;Fighter select
;ASB	dw	AKR,PAL,LIO,JAC,BAH,HON,SAN,MAH,KDS,JAN,HOR,SIB
;ASB
;ASBAKR:	dw	H00			;graph_no
;ASB	db	55,45			;x,y
;ASB	dw	A			;name
;ASB	db	10
;ASB	dw	K
;ASB	db	10
;ASB	dw	I
;ASB	db	4
;ASB	dw	R
;ASB	db	9
;ASB	dw	A
;ASB	db	0
;ASB
;ASBPAL:	dw	H01
;ASB	db	77,45
;ASB	dw	P
;ASB	db	8
;ASB	dw	A
;ASB	db	10
;ASB	dw	I
;ASB	db	0
;ASB
;ASBLIO:	dw	H02
;ASB	db	99,45
;ASB	dw	L
;ASB	db	7
;ASB	dw	I
;ASB	db	4
;ASB	dw	O
;ASB	db	9
;ASB	dw	N
;ASB	db	0
;ASB
;ASBJAC:	dw	H03
;ASB	db	121,45
;ASB	dw	J
;ASB	db	6
;ASB	dw	A
;ASB	db	10
;ASB	dw	C
;ASB	db	9
;ASB	dw	K
;ASB	db	10
;ASB	dw	Y
;ASB	db	0
;ASB
;ASBBAH:	dw	H04
;ASB	db	55,70
;ASB	dw	B
;ASB	db	9
;ASB	dw	A
;ASB	db	10
;ASB	dw	H
;ASB	db	9
;ASB	dw	N
;ASB	db	0
;ASB
;ASBHON:	dw	H05
;ASB	db	77,70
;ASB	dw	C
;ASB	db	9
;ASB	dw	A
;ASB	db	10
;ASB	dw	N
;ASB	db	9
;ASB	dw	D
;ASB	db	9
;ASB	dw	Y
;ASB	db	0
;ASB
;ASBSAN:	dw	H06
;ASB	db	99,70
;ASB	dw	S
;ASB	db	7
;ASB	dw	A
;ASB	db	10
;ASB	dw	N
;ASB	db	9
;ASB	dw	M
;ASB	db	12
;ASB	dw	A
;ASB	db	10
;ASB	dw	N
;ASB	db	0
;ASB
;ASBMAH:	dw	H07
;ASB	db	121,70
;ASB	dw	M
;ASB	db	12
;ASB	dw	A
;ASB	db	10
;ASB	dw	H
;ASB	db	9
;ASB	dw	L
;ASB	db	7
;ASB	dw	E
;ASB	db	7
;ASB	dw	R
;ASB	db	0
;ASB
;ASBKDS:	dw	H08
;ASB	db	55,95
;ASB	dw	K
;ASB	db	10
;ASB	dw	I
;ASB	db	4
;ASB	dw	D
;ASB	db	9
;ASB	dw	S
;ASB	db	13
;ASB	dw	S
;ASB	db	8
;ASB	dw	A
;ASB	db	10
;ASB	dw	R
;ASB	db	9
;ASB	dw	A
;ASB	db	10
;ASB	dw	H
;ASB	db	0
;ASB
;ASBJAN:	dw	H09
;ASB	db	77,95
;ASB	dw	J
;ASB	db	6
;ASB	dw	A
;ASB	db	10
;ASB	dw	N
;ASB	db	9
;ASB	dw	E
;ASB	db	7
;ASB	dw	T
;ASB	db	0
;ASB
;ASBHOR	dw	H10
;ASB	db	99,95
;ASB	dw	H
;ASB	db	9
;ASB	dw	O
;ASB	db	9
;ASB	dw	R
;ASB	db	9
;ASB	dw	N
;ASB	db	9
;ASB	dw	E
;ASB	db	7
;ASB	dw	T
;ASB	db	0
;ASB
;ASBSIB:	dw	H11
;ASB	db	121,95
;ASB	dw	S
;ASB	db	8
;ASB	dw	I
;ASB	db	4
;ASB	dw	B
;ASB	db	9
;ASB	dw	A
;ASB	db	0
;ASB
;ASBCOURSE_select:
;ASB	dw	courseA,courseB,courseC,courseD
;ASB
;ASBcourseA:dw	H04
;ASB	db	63,35
;ASB	dw	H05
;ASB	db	85,35
;ASB	dw	H01
;ASB	db	107,35
;ASB	dw	H06
;ASB	db	129,35
;ASB	dw	H09
;ASB	db	151,35
;ASB	dw	H00
;ASB	db	173,35
;ASB
;ASBcourseB:dw	H00
;ASB	db	63,65
;ASB	dw	H02
;ASB	db	85,65
;ASB	dw	H07
;ASB	db	107,65
;ASB	dw	H04
;ASB	db	129,65
;ASB	dw	H06
;ASB	db	151,65
;ASB	dw	H08
;ASB	db	173,65
;ASB
;ASBcourseC:dw	H02
;ASB	db	63,95
;ASB	dw	H01
;ASB	db	85,95
;ASB	dw	H11
;ASB	db	107,95
;ASB	dw	H05
;ASB	db	129,95
;ASB	dw	H03
;ASB	db	151,95
;ASB	dw	H07
;ASB	db	173,95
;ASB
;ASBcourseD:dw	H07
;ASB	db	63,125
;ASB	dw	H06
;ASB	db	85,125
;ASB	dw	H01
;ASB	db	107,125
;ASB	dw	H00
;ASB	db	129,125
;ASB	dw	H04
;ASB	db	151,125
;ASB	dw	H10
;ASB	db	173,125
;ASB
;ASBtable_M_SEL:
;ASB	db	71,35			;r8,r9
;ASB	dw	WD_1P_MODE		;rr6
;ASB	db	69,60
;ASB	dw	WD_VS_MODE
;ASB	db	42,85
;ASB	dw	WD_SUR_MODE
;ASB	db	68,110
;ASB	dw	WD_RECORDS
;ASB	dw	0
;ASB
;ASBFC_value:
;ASB	dw	WD_FC0,WD_FC1,WD_FC2,WD_FC3,WD_FC4
;ASB	dw	WD_FC5,WD_FC6,WD_FC7,WD_FC8,WD_FC9
;ASB
;ASBNAME12A:
;ASB	dw	WD_AKIRA,WD_PAI,WD_JACKY,WD_KIDS,WD_LION,WD_SIBA
;ASB	dw	WD_HORNET,WD_JANET,WD_BAHN,WD_SANMAN,WD_CANDY,WD_MAHLER
;ASB	dw	WD_CANDY
;ASB
;ASBtable_1PM_OPT:
;ASB	dw	PMO1,PMO2,PMO3
;ASB
;ASBPMO1:
;ASB	db	16,42
;ASB	dw	WD_DIFF
;ASB	db	120,42
;ASB	dw	WD_EASY
;ASB	dw	WD_NORMAL
;ASB	dw	WD_HARD
;ASBPMO2:
;ASB	db	16,67
;ASB	dw	WD_RND
;ASB	db	120,67
;ASB	dw	WD_1
;ASB	dw	WD_3
;ASB	dw	WD_5
;ASBPMO3:
;ASB	db	16,92
;ASB	dw	WD_TIME
;ASB	db	120,92
;ASB	dw	WD_45
;ASB	dw	WD_75
;ASB	dw	WD_99
;ASB	dw	WD_nolimit
;ASB
;ASBtable_VS_M:
;ASB	db	66,70
;ASB	dw	WD_1P_VS_CPU
;ASB	db	71,95
;ASB	dw	WD_1P_VS_2P
;ASB	dw	0
;ASB
;ASB
;ASB;////////////////////////////////////////////////////////////
;ASBBLKA_NUM:			;ASCII code 30h to 39h
;ASB	db	30h		;3 DIFFERENT TYPES NUMBER
;ASB	DW	FA00
;ASB	DW	FB00
;ASB	DW	FC00
;ASB	db	31h
;ASB	DW	FA01
;ASB	DW	FB01
;ASB	DW	FC01
;ASB	db	32h
;ASB	DW	FA02
;ASB	DW	FB02
;ASB	DW	FC02
;ASB	db	33h
;ASB	DW	FA03
;ASB	DW	FB03
;ASB	DW	FC03
;ASB	db	34h
;ASB	DW	FA04
;ASB	DW	FB04
;ASB	DW	FC04
;ASB	db	35h
;ASB	DW	FA05
;ASB	DW	FB05
;ASB	DW	FC05
;ASB	db	36h
;ASB	DW	FA06
;ASB	DW	FB06
;ASB	DW	FC06
;ASB	db	37h
;ASB	DW	FA07
;ASB	DW	FB07
;ASB	DW	FC07
;ASB	db	38h
;ASB	DW	FA08
;ASB	DW	FB08
;ASB	DW	FC08
;ASB	db	39h
;ASB	DW	FA09
;ASB	DW	FB09
;ASB	DW	FC09
;ASB	DW	0
;ASB
;ASBBLKA_BMP:			;ASCII code 41h to 5ah
;ASB	db	41h
;ASB	DW	FA0A
;ASB	db	42h
;ASB	DW	FA0B
;ASB	db	43h
;ASB	DW	FA0C
;ASB	db	44h
;ASB	DW	FA0D
;ASB	db	45h
;ASB	DW	FA0E
;ASB	db	46h
;ASB	DW	FA0F
;ASB	db	47h
;ASB	DW	FA0G
;ASB	db	48h
;ASB	DW	FA0H
;ASB	db	49h
;ASB	DW	FA0I
;ASB	db	4ah
;ASB	DW	FA0J
;ASB	db	4bh
;ASB	DW	FA0K
;ASB	db	4ch
;ASB	DW	FA0L
;ASB	db	4dh
;ASB	DW	FA0M
;ASB	db	4eh
;ASB	DW	FA0N
;ASB	db	4fh
;ASB	DW	FA0O
;ASB	db	50h
;ASB	DW	FA0P
;ASB	db	51h
;ASB	DW	FA0Q
;ASB	db	52h
;ASB	DW	FA0R
;ASB	db	53h
;ASB	DW	FA0S
;ASB	db	54h
;ASB	DW	FA0T
;ASB	db	55h
;ASB	DW	FA0U
;ASB	db	56h
;ASB	DW	FA0V
;ASB	db	57h
;ASB	DW	FA0W
;ASB	db	58h
;ASB	DW	FA0X
;ASB	db	59h
;ASB	DW	FA0Y
;ASB	db	5ah
;ASB	DW	FA0Z
;ASB	DW	0
;ASB
;ASBBLKB_BMP:			;ASCII code 61h to 7ah
;ASB;	 db	 5ch
;ASB;	 DW	 LIVE
;ASB	db	5ch		;add on 9/3/1998
;ASB	dw	MUNLIMIT
;ASB	db	5eh		;add on 6/2/1998
;ASB	DW	win02
;ASB	db	5fh
;ASB	DW	S0WIN
;ASB	db	60h
;ASB	DW	S0MIN
;ASB	db	61h
;ASB	DW	FB0A
;ASB	db	62h
;ASB	DW	FB0B
;ASB	db	63h
;ASB	DW	FB0C
;ASB	db	64h
;ASB	DW	FB0D
;ASB	db	65h
;ASB	DW	FB0E
;ASB	db	66h
;ASB	DW	FB0F
;ASB	db	67h
;ASB	DW	FB0G
;ASB	db	68h
;ASB	DW	FB0H
;ASB	db	69h
;ASB	DW	FB0I
;ASB	db	6ah
;ASB	DW	FB0J
;ASB	db	6bh
;ASB	DW	FB0K
;ASB	db	6ch
;ASB	DW	FB0L
;ASB	db	6dh
;ASB	DW	FB0M
;ASB	db	6eh
;ASB	DW	FB0N
;ASB	db	6fh
;ASB	DW	FB0O
;ASB	db	70h
;ASB	DW	FB0P
;ASB	db	71h
;ASB	DW	FB0Q
;ASB	db	72h
;ASB	DW	FB0R
;ASB	db	73h
;ASB	DW	FB0S
;ASB	db	74h
;ASB	DW	FB0T
;ASB	db	75h
;ASB	DW	FB0U
;ASB	db	76h
;ASB	DW	FB0V
;ASB	db	77h
;ASB	DW	FB0W
;ASB	db	78h
;ASB	DW	FB0X
;ASB	db	79h
;ASB	DW	FB0Y
;ASB	db	7ah
;ASB	DW	FB0Z
;ASB	DW	0
;ASB
;ASB;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;ASB;BY CHEUNG SETTING :
;ASB;;;;;	    \ = LIVE bitmap
;ASB;	_ = S-WIN
;ASB;	` = S-MIN
;ASB;	[ = FB number mark
;ASB;	] = FC number mark
;ASB
;ASB
;ASBWD_MODE_SELECT:
;ASB	dm	"MODE SELECT"
;ASB	db	0
;ASB
;ASBWD_RECORDS:
;ASB	dm	"RECORDS"
;ASB	db	0
;ASB
;ASBWD_1P_MODE:
;ASB	dm	"1P MODE"
;ASB	db	0
;ASB
;ASBWD_VS_MODE:
;ASB	dm	"VS MODE"
;ASB	db	0
;ASB
;ASBWD_SUR_MODE:
;ASB	dm	"SURVIVAL MODE"
;ASB	db	0
;ASB
;ASBWD_STAGE_SEL:
;ASB	dm	"STAGE SELECT"
;ASB	db	0
;ASB
;ASBWD_pressbx:
;ASB	dm	"press b to exit"
;ASB	db	0
;ASB
;ASBWD_pressbo:
;ASB	dm	"press b to exit or c to options"
;ASB	db	0
;ASB
;ASBWD_sel_yr_fig:
;ASB	dm	"select your fighter"
;ASB	db	0
;ASB
;ASBWD_1P_MODE_OPT:
;ASB	dm	"1P MODE OPTIONS"
;ASB	db	00
;ASB
;ASBWD_VS_MODE_OPT:
;ASB	dm	"VS MODE OPTIONS"
;ASB	db	00
;ASB
;ASBWD_DIFF:
;ASB	dm	"DIFFICULTY"
;ASB	db	0
;ASB
;ASBWD_RND:
;ASB	dm	"ROUND"
;ASB	db	0
;ASB
;ASBWD_TIME:
;ASB	dm	"TIME"
;ASB	db	0
;ASB
;ASBWD_1p_life:
;ASB	dm	"[1p life"
;ASB	db	0
;ASB
;ASBWD_2p_life:
;ASB	dm	"[2p life"
;ASB	db	0
;ASB
;ASB;WD_live:
;ASB;	 dm	 "\\\\\\\\"
;ASB;	 db	 0
;ASB
;ASBWD_RESULT:
;ASB	dm	"RESULT"
;ASB	db	0
;ASB
;ASBWD_LIMIT_TIME:
;ASB	dm	"TIME LIMIT"
;ASB	db	0
;ASB
;ASBWD_limit_time:
;ASB	dm	"time limit"
;ASB	db	0
;ASB
;ASBWD_fighter:
;ASB	dm	"fighter"
;ASB	db	0
;ASB
;ASBWD_best_records:
;ASB	dm	"best records"
;ASB	db	0
;ASB
;ASBWD_game_type:
;ASB	dm	"game type"
;ASB	db	0
;ASB
;ASBWD_1P_VS_CPU:
;ASB	dm	"1P VS CPU"
;ASB	db	0
;ASB
;ASBWD_1P_VS_2P:
;ASB	dm	"1P VS 2P"
;ASB	db	0
;ASB
;ASBWD_EASY:
;ASB	dm	"EASY"
;ASB	db	0
;ASB
;ASBWD_NORMAL:
;ASB	dm	"NORMAL"
;ASB	db	0
;ASB
;ASBWD_HARD:
;ASB	dm	"HARD"
;ASB	db	0
;ASB
;ASBWD_1:
;ASB	dm	"1"
;ASB	db	0
;ASB
;ASBWD_3:
;ASB	dm	"3"
;ASB	db	0
;ASB
;ASBWD_5:
;ASB	dm	"5"
;ASB	db	0
;ASB
;ASBWD_45:
;ASB	dm	"45"
;ASB	db	0
;ASB
;ASBWD_75:
;ASB	dm	"75"
;ASB	db	0
;ASB
;ASBWD_99:
;ASB	dm	"99"
;ASB	db	0
;ASB
;ASBWD_FC1:
;ASB	dm	"]1"
;ASB	db	0
;ASB
;ASBWD_FC2:
;ASB	dm	"]2"
;ASB	db	0
;ASB
;ASBWD_FC3:
;ASB	dm	"]3"
;ASB	db	0
;ASB
;ASBWD_FC4:
;ASB	dm	"]4"
;ASB	db	0
;ASB
;ASBWD_FC5:
;ASB	dm	"]5"
;ASB	db	0
;ASB
;ASBWD_FC6:
;ASB	dm	"]6"
;ASB	db	0
;ASB
;ASBWD_FC7:
;ASB	dm	"]7"
;ASB	db	0
;ASB
;ASBWD_FC8:
;ASB	dm	"]8"
;ASB	db	0
;ASB
;ASBWD_FC9:
;ASB	dm	"]9"
;ASB	db	0
;ASB
;ASBWD_FC0:
;ASB	dm	"]0"
;ASB	db	0
;ASB
;ASBWD_FC15:
;ASB	dm	"]15"
;ASB	db	0
;ASB
;ASBWD_FC32:
;ASB	dm	"]32"
;ASB	db	0
;ASB
;ASBWD_wins:
;ASB	dm	"_"
;ASB	db	0
;ASB
;ASBWD_win02:
;ASB	dm	"^"
;ASB	db	0
;ASB
;ASBWD_min:
;ASB	dm	"`"
;ASB	db	0
;ASB
;ASBWD_1P:
;ASB	dm	"1P"
;ASB	db	0
;ASB
;ASBWD_2P:
;ASB	dm	"2P"
;ASB	db	0
;ASB
;ASBWD_CPU:
;ASB	dm	"CPU"
;ASB	db	0
;ASB
;ASBWD_STAGE_TYPE:
;ASB	dm	"STAGE TYPE"
;ASB	db	0
;ASB
;ASBWD_AKIRA:
;ASB	dm	"AKIRA"
;ASB	db	0
;ASB
;ASBWD_PAI:
;ASB	dm	"PAI"
;ASB	db	0
;ASB
;ASBWD_LION:
;ASB	dm	"LION"
;ASB	db	0
;ASB
;ASBWD_JACKY:
;ASB	dm	"JACKY"
;ASB	db	0
;ASB
;ASBWD_BAHN:
;ASB	dm	"BAHN"
;ASB	db	0
;ASB
;ASBWD_CANDY:
;ASB	dm	"CANDY"
;ASB	db	0
;ASB
;ASBWD_SANMAN:
;ASB	dm	"SANMAN"
;ASB	db	0
;ASB
;ASBWD_MAHLER:
;ASB	dm	"MAHLER"
;ASB	db	0
;ASB
;ASBWD_KIDS:
;ASB	dm	"KIDS SARAH"
;ASB	db	0
;ASB
;ASBWD_JANET:
;ASB	dm	"JANET"
;ASB	db	0
;ASB
;ASBWD_HORNET:
;ASB	dm	"HORNET"
;ASB	db	0
;ASB
;ASBWD_SIBA:
;ASB	dm	"SIBA"
;ASB	db	0
;ASB
;ASBWD_best_time:
;ASB	dm	"best time"
;ASB	db	0
;ASB
;ASBWD_course:
;ASB	dm	"course"
;ASB	db	0
;ASB
;ASBWD_A:
;ASB	dm	"A"
;ASB	db	0
;ASB
;ASBWD_B:
;ASB	dm	"B"
;ASB	db	0
;ASB
;ASBWD_C:
;ASB	dm	"C"
;ASB	db	0
;ASB
;ASBWD_D:
;ASB	dm	"D"
;ASB	db	0
;ASB
;ASBWD_min1:
;ASB	dm	"min"
;ASB	db	0
;ASB
;ASBWD_sec1:
;ASB	dm	"sec"
;ASB	db	0
;ASB
;ASBWD_nolimit:
;ASB	dm	"\"
;ASB	db	0
;ASB
;ASBSHOW_STAGE:
;ASB	dw	WD_STAGE1,WD_STAGE2,WD_STAGE3,WD_STAGE4,WD_STAGE5
;ASB	dw	WD_STAGE6,WD_STAGE7,WD_STAGE8,WD_STAGE9,WD_STAGE10
;ASB
;ASBWD_STAGE1:
;ASB	dm	" JACKY STAGE"
;ASB	db	0
;ASB
;ASBWD_STAGE2:
;ASB	dm	"SANMAN STAGE"
;ASB	db	0
;ASB
;ASBWD_STAGE3:
;ASB	dm	" JANET STAGE"
;ASB	db	0
;ASB
;ASBWD_STAGE4:
;ASB	dm	" CANDY STAGE"
;ASB	db	0
;ASB
;ASBWD_STAGE5:
;ASB	dm	" LION STAGE"
;ASB	db	0
;ASB
;ASBWD_STAGE6:
;ASB	dm	" BAHN STAGE"
;ASB	db	0
;ASB
;ASBWD_STAGE7:
;ASB	dm	"MAHLER STAGE"
;ASB	db	0
;ASB
;ASBWD_STAGE8:
;ASB	dm	"  PAI STAGE"
;ASB	db	0
;ASB
;ASBWD_STAGE9:
;ASB	dm	" AKIRA STAGE"
;ASB	db	0
;ASB
;ASBWD_STAGE10:
;ASB	dm	"KIDS SARAH STAGE"
;ASB	db	0
;ASB
;ASBSHOW_round:
;ASB	dw	WD_1ROUND,WD_3ROUND,WD_5ROUND
;ASB
;ASBWD_1ROUND:
;ASB	dm	"1 ROUND"
;ASB	db	0
;ASB
;ASBWD_3ROUND:
;ASB	dm	"3 ROUNDS"
;ASB	db	0
;ASB
;ASBWD_5ROUND:
;ASB	dm	"5 ROUNDS"
;ASB	db	0
;ASB
;ASBWD_sel_cpu_opp:
;ASB	dm	"select cpu opponent"
;ASB	db	0
;ASB
;ASBNAME_WIN:
;ASB	dw	WD_W_AKI,WD_W_PAI,WD_W_JAC,WD_W_KID,WD_W_LIO,WD_W_SIB
;ASB	dw	WD_W_HOR,WD_W_JAN,WD_W_BAH,WD_W_SAN,WD_W_CAN,WD_W_MAH
;ASB	dw	WD_W_CAN
;ASB
;ASBWD_W_AKI:
;ASB	dm	" AKIRA WIN"
;ASB	db	0
;ASB
;ASBWD_W_PAI:
;ASB	dm	"  PAI WIN"
;ASB	db	0
;ASB
;ASBWD_W_LIO:
;ASB	dm	" LION WIN"
;ASB	db	0
;ASB
;ASBWD_W_JAC:
;ASB	dm	" JACKY WIN"
;ASB	db	0
;ASB
;ASBWD_W_BAH:
;ASB	dm	" BAHN WIN"
;ASB	db	0
;ASB
;ASBWD_W_CAN:
;ASB	dm	" CANDY WIN"
;ASB	db	0
;ASB
;ASBWD_W_SAN:
;ASB	dm	"SANMAN WIN"
;ASB	db	0
;ASB
;ASBWD_W_MAH:
;ASB	dm	"MAHLER WIN"
;ASB	db	0
;ASB
;ASBWD_W_KID:
;ASB	dm	"KIDS SARAH WIN"
;ASB	db	0
;ASB
;ASBWD_W_JAN:
;ASB	dm	" JANET WIN"
;ASB	db	0
;ASB
;ASBWD_W_HOR:
;ASB	dm	"HORNET WIN"
;ASB	db	0
;ASB
;ASBWD_W_SIB:
;ASB	dm	" SIBA WIN"
;ASB	db	0
;ASB
;ASB
;ASB;WD_X_MAS:
;ASB;	 dm	 "MERRY CHRISTMAS"
;ASB;	 db	 0
;ASB
;ASB;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;ASB;///////////////////////////////////////////////////////////
;ASB;change "-" to "z"
;ASB
;ASBSELECT:      defb    63,17,0,0,bankno_la1	     ;SELECT
;ASBSTz00:	     defb    56,56,0,17,bankno_la1	     ;ST-00
;ASBSTz01:	     defb    56,56,0,73,bankno_la1	     ;ST-01
;ASBSTz02:	     defb    56,56,0,129,bankno_la1	     ;ST-02
;ASBSTART:	     defb    92,22,63,0,bankno_la1	     ;START
;ASBCS:	     defb    78,17,155,0,bankno_la1	     ;CS
;ASBFS:	     defb    78,17,56,22,bankno_la1	     ;FS
;ASBOPTION:      defb    75,17,56,39,bankno_la1	     ;OPTION
;ASBSTz05:	     defb    51,22,0,185,bankno_la1	     ;ST-05
;ASBSTz03:	     defb    29,22,56,56,bankno_la1	     ;ST-03
;ASBH00:	     defb    23,26,0,207,bankno_la1	     ;H00
;ASBH01:	     defb    23,26,23,207,bankno_la1	     ;H01
;ASBH02:	     defb    23,26,134,22,bankno_la1	     ;H02
;ASBH03:	     defb    23,26,157,17,bankno_la1	     ;H03
;ASBH04:	     defb    23,26,180,17,bankno_la1	     ;H04
;ASBH05:	     defb    23,26,203,17,bankno_la1	     ;H05
;ASBH06:	     defb    23,26,233,0,bankno_la1	     ;H06
;ASBH07:	     defb    23,26,56,78,bankno_la1	     ;H07
;ASBH08:	     defb    23,26,56,104,bankno_la1	     ;H08
;ASBH09:	     defb    23,26,56,130,bankno_la1	     ;H09
;ASBH10:	     defb    23,26,56,156,bankno_la1	     ;H10
;ASBH11:	     defb    23,26,56,182,bankno_la1	     ;H11
;ASBSTz04:	     defb    50,9,85,56,bankno_la1	     ;ST-04
;ASBCOURSE:      defb    43,9,85,65,bankno_la1	     ;COURSE
;ASBno4:	       defb    9,14,135,48,bankno_la1	       ;4
;ASBA:	     defb    9,14,144,48,bankno_la1	     ;A
;ASBK:	     defb    9,14,153,48,bankno_la1	     ;K
;ASBM:	     defb    11,14,162,43,bankno_la1	     ;M
;ASBV:	     defb    9,14,173,43,bankno_la1	     ;V
;ASBW:	     defb    13,14,182,43,bankno_la1	     ;W
;ASBY:	     defb    9,14,195,43,bankno_la1	     ;Y
;ASBQ:	     defb    8,16,204,43,bankno_la1	     ;Q
;ASBno0:	       defb    8,14,212,43,bankno_la1	       ;0
;ASBno1:	       defb    6,14,226,17,bankno_la1	       ;1
;ASBno2:	       defb    7,14,220,43,bankno_la1	       ;2
;ASBno3:	       defb    8,14,227,31,bankno_la1	       ;3
;ASBno5:	       defb    8,14,235,26,bankno_la1	       ;5
;ASBno6:	       defb    8,14,243,26,bankno_la1	       ;6
;ASBno7:	       defb    7,14,227,45,bankno_la1	       ;7
;ASBno8:	       defb    8,14,235,40,bankno_la1	       ;8
;ASBno9:	       defb    8,14,243,40,bankno_la1	       ;9
;ASBB:	     defb    8,14,135,62,bankno_la1	     ;B
;ASBC:	     defb    8,14,143,62,bankno_la1	     ;C
;ASBD:	     defb    8,14,151,62,bankno_la1	     ;D
;ASBE:	     defb    6,14,159,62,bankno_la1	     ;E
;ASBF:	     defb    6,14,165,57,bankno_la1	     ;F
;ASBG:	     defb    8,14,171,57,bankno_la1	     ;G
;ASBI:	     defb    3,14,179,57,bankno_la1	     ;I
;ASBJ:	     defb    5,14,182,57,bankno_la1	     ;J
;ASBL:	     defb    6,14,187,57,bankno_la1	     ;L
;ASBN:	     defb    8,14,193,57,bankno_la1	     ;N
;ASBO:	     defb    8,14,201,59,bankno_la1	     ;O
;ASBP:	     defb    7,14,209,59,bankno_la1	     ;P
;ASBR:	     defb    8,14,216,57,bankno_la1	     ;R
;ASBS:	     defb    7,14,224,59,bankno_la1	     ;S
;ASBT:	     defb    8,14,231,59,bankno_la1	     ;T
;ASBU:	     defb    8,14,239,54,bankno_la1	     ;U
;ASBX:	     defb    7,14,247,54,bankno_la1	     ;X
;ASBZ:	     defb    7,14,239,68,bankno_la1	     ;Z
;ASBH:	     defb    8,14,246,68,bankno_la1	     ;H
;ASBCOURzA:      defb    8,9,79,78,bankno_la1	     ;COUR-A
;ASBCOURzG:      defb    8,9,79,87,bankno_la1	     ;COUR-G
;ASBCOURzF:      defb    5,9,79,96,bankno_la1	     ;COUR-F
;ASBCOURzE:      defb    5,9,79,105,bankno_la1	     ;COUR-E
;ASBCOURzD:      defb    7,9,79,114,bankno_la1	     ;COUR-D
;ASBCOURzC:      defb    6,9,79,123,bankno_la1	     ;COUR-C
;ASBCOURzB:      defb    6,9,79,132,bankno_la1	     ;COUR-B
;ASBST:	     defb    119,17,0,233,bankno_la1	     ;ST
;ASB
;ASB
;ASBOPzSA01:	defb	143,137,0,0,bankno_123R0	;OP-SA01
;ASBOPzBA02:	defb	129,97,0,137,bankno_123R0	;OP-BA02
;ASBOPzHO02:	defb	122,97,129,137,bankno_123R0	;OP-HO02
;ASBOPzMA02:	defb	113,97,143,0,bankno_123R0	;OP-MA02
;ASBBACK:		defb	200,19,0,234,bankno_123R0	;BACK
;ASBOPzSA03:	defb	76,14,143,97,bankno_123R0	;OP-SA03
;ASBOPzMA03:	defb	71,14,143,111,bankno_123R0	;OP-MA03
;ASBOPzLI03:	defb	41,14,214,111,bankno_123R0	;OP-LI03
;ASB;BAR02: 	 defb	 25,19,200,234,bankno_123R0	 ;BAR02
;ASB;OPzPA03:	 defb	 30,14,219,97,bankno_123R0	 ;OP-PA03  *
;ASBKID:		defb	42,7,194,125,bankno_123R0	;KID
;ASBMAHLER: 	defb	30,7,225,234,bankno_123R0	;MAHLER
;ASBHORNET: 	defb	29,7,225,241,bankno_123R0	;HORNET
;ASBSIBA:		defb	20,7,236,125,bankno_123R0	;SIBA
;ASB;4:		 defb	 7,9,249,97,bankno_123R0	 ;4
;ASB;0:		 defb	 6,9,143,125,bankno_123R0	 ;0
;ASB;2:		 defb	 6,9,149,125,bankno_123R0	 ;2
;ASB;3:		 defb	 6,9,155,125,bankno_123R0	 ;3
;ASB;5:		 defb	 6,9,161,125,bankno_123R0	 ;5
;ASB;6:		 defb	 6,9,167,125,bankno_123R0	 ;6
;ASB;7:		 defb	 6,9,173,125,bankno_123R0	 ;7
;ASB;8:		 defb	 6,9,179,125,bankno_123R0	 ;8
;ASB;9:		 defb	 6,9,185,125,bankno_123R0	 ;9
;ASB;1:		 defb	 3,9,191,125,bankno_123R0	 ;1
;ASB;BAR07: 	 defb	 2,3,249,106,bankno_123R0	 ;BAR07
;ASBOPzBA01:	defb	130,145,0,0,bankno_123R1	;OP-BA01
;ASBOPzPA01:	defb	85,145,130,0,bankno_123R1	;OP-PA01
;ASB;LOGOz01:	 defb	 172,65,0,145,bankno_123R1	 ;LOGO-01  *
;ASBLOGOz03:	defb	116,15,0,210,bankno_123R1	;LOGO-03
;ASB;OPzHO03:	 defb	 60,14,172,145,bankno_123R1	 ;OP-HO03  *
;ASBOPzAK03:	defb	53,14,172,159,bankno_123R1	;OP-AK03
;ASBOPzJA03:	defb	51,14,172,173,bankno_123R1	;OP-JA03
;ASBOPzBA03:	defb	48,14,172,187,bankno_123R1	;OP-BA03
;ASB;BAR01: 	 defb	 65,8,172,201,bankno_123R1	 ;BAR01
;ASB;BAR05: 	 defb	 13,34,215,0,bankno_123R1	 ;BAR05
;ASB;BAR06: 	 defb	 13,34,228,0,bankno_123R1	 ;BAR06
;ASBSANMAN: 	defb	32,7,215,34,bankno_123R1	;SANMAN
;ASBAKIRA:		defb	24,7,215,41,bankno_123R1	;AKIRA
;ASBHONEY:		defb	24,7,215,48,bankno_123R1	;HONEY
;ASBJACKY:		defb	23,7,215,55,bankno_123R1	;JACKY
;ASBJANET:		defb	23,7,215,62,bankno_123R1	;JANET
;ASBBAHN:		defb	21,7,215,69,bankno_123R1	;BAHN
;ASBLION:		defb	19,7,236,69,bankno_123R1	;LION
;ASBPAI:		defb	15,7,241,0,bankno_123R1 	;PAI
;ASB;BAR03: 	 defb	 7,7,241,7,bankno_123R1 	 ;BAR03
;ASB;BAR04: 	 defb	 7,7,248,7,bankno_123R1 	 ;BAR04
;ASBOPzMA01:	defb	117,143,0,0,bankno_123R2	;OP-MA01
;ASBOPzLI01:	defb	104,143,117,0,bankno_123R2	;OP-LI01
;ASBLOGOz02:	defb	171,65,0,143,bankno_123R2	;LOGO-02
;ASBOPzHO01:	defb	120,138,0,0,bankno_123R3	;OP-HO01
;ASBOPzJA02:	defb	109,97,120,0,bankno_123R3	;OP-JA02
;ASBOPzSA02:	defb	104,97,0,138,bankno_123R3	;OP-SA02
;ASBOPzPA02:	defb	103,97,104,138,bankno_123R3	;OP-PA02
;ASBOPzAK01:	defb	107,148,0,0,bankno_123R4	;OP-AK01
;ASBOPzJA01:	defb	94,146,107,0,bankno_123R4	;OP-JA01
;ASBOPzLI02:	defb	101,97,0,148,bankno_123R4	;OP-LI02
;ASBOPzAK02:	defb	95,97,101,148,bankno_123R4	;OPn-AK02
;ASB
;ASB;////////////////////////////////////////////////////////////////////
;ASB;change "-" to "0"
;ASB
;ASBLIVE:	    defb    3,7,168,0,bankno_new1	    ;LIVE
;ASBFRAME05:    defb    139,32,0,71,bankno_new1	    ;FRAME05
;ASBFRAME04:    defb    29,32,0,122,bankno_new1	    ;FRAME04
;ASBFRAME03:    defb    29,32,0,154,bankno_new1	    ;FRAME03
;ASBFRAME02:    defb    29,32,0,186,bankno_new1	    ;FRAME02
;ASBFRAME01:    defb    29,32,0,218,bankno_new1	    ;FRAME01
;ASBPRESS:	    defb    66,19,0,103,bankno_new1	    ;PRESS
;ASBLOGOz01:    defb    172,64,0,7,bankno_new1	    ;LOGO01 **
;ASBOPzHO03:    defb    55,14,168,73,bankno_new1	    ;OP-HO03  **
;ASBOPzPA03:    defb    26,14,66,103,bankno_new1	    ;OP-PA03  **
;ASBSEL99:	    defb    23,26,75,174,bankno_new1	    ;SEL99
;ASB
;ASBFB0Z:	    defb    4,7,0,0,bankno_new1 	    ;FB-Z
;ASBFB0Y:	    defb    5,7,4,0,bankno_new1 	    ;FB-Y
;ASBFB0X:	    defb    5,7,9,0,bankno_new1 	    ;FB-X
;ASBFB0V:	    defb    7,7,14,0,bankno_new1	    ;FB-V
;ASBFB0U:	    defb    5,7,21,0,bankno_new1	    ;FB-U
;ASBFB0T:	    defb    5,7,26,0,bankno_new1	    ;FB-T
;ASBFB0S:	    defb    5,7,31,0,bankno_new1	    ;FB-S
;ASBFB0R:	    defb    5,7,36,0,bankno_new1	    ;FB-R
;ASBFB0P:	    defb    5,7,41,0,bankno_new1	    ;FB-P
;ASBFB0O:	    defb    6,7,46,0,bankno_new1	    ;FB-O
;ASBFB0N:	    defb    5,7,52,0,bankno_new1	    ;FB-N
;ASBFB0M:	    defb    7,7,57,0,bankno_new1	    ;FB-M
;ASBFB0L:	    defb    4,7,64,0,bankno_new1	    ;FB-L
;ASBFB0K:	    defb    5,7,68,0,bankno_new1	    ;FB-K
;ASBFB0J:	    defb    4,7,73,0,bankno_new1	    ;FB-J
;ASBFB0I:	    defb    1,7,77,0,bankno_new1	    ;FB-I
;ASBFB0H:	    defb    5,7,78,0,bankno_new1	    ;FB-H
;ASBFB0G:	    defb    6,7,83,0,bankno_new1	    ;FB-G
;ASBFB0F:	    defb    4,7,89,0,bankno_new1	    ;FB-F
;ASBFB0E:	    defb    5,7,93,0,bankno_new1	    ;FB-E
;ASBFB0D:	    defb    5,7,98,0,bankno_new1	    ;FB-D
;ASBFB0C:	    defb    5,7,103,0,bankno_new1	    ;FB-C
;ASBFB0B:	    defb    5,7,108,0,bankno_new1	    ;FB-B
;ASBFB0A:	    defb    7,7,113,0,bankno_new1	    ;FB-A
;ASBFB09:	    defb    5,7,120,0,bankno_new1	    ;FB-9
;ASBFB08:	    defb    5,7,125,0,bankno_new1	    ;FB-8
;ASBFB07:	    defb    5,7,130,0,bankno_new1	    ;FB-7
;ASBFB06:	    defb    5,7,135,0,bankno_new1	    ;FB-6
;ASBFB05:	    defb    5,7,140,0,bankno_new1	    ;FB-5
;ASBFB04:	    defb    5,7,145,0,bankno_new1	    ;FB-4
;ASBFB03:	    defb    5,7,150,0,bankno_new1	    ;FB-3
;ASBFB02:	    defb    5,7,155,0,bankno_new1	    ;FB-2
;ASBFB01:	    defb    3,7,160,0,bankno_new1	    ;FB-1
;ASBFB00:	    defb    5,7,163,0,bankno_new1	    ;FB-0
;ASBFA0A:	    defb    9,10,172,7,bankno_new1	    ;FA-A
;ASBFA0B:	    defb    8,10,181,7,bankno_new1	    ;FA-B
;ASBFA0C:	    defb    8,10,189,7,bankno_new1	    ;FA-C
;ASBFA0D:	    defb    8,10,197,7,bankno_new1	    ;FA-D
;ASBFA0E:	    defb    7,10,205,7,bankno_new1	    ;FA-E
;ASBFA0F:	    defb    7,10,212,7,bankno_new1	    ;FA-F
;ASBFA0H:	    defb    8,10,219,7,bankno_new1	    ;FA-H
;ASBFA0I:	    defb    2,10,227,7,bankno_new1	    ;FA-I
;ASBFA0J:	    defb    7,10,229,7,bankno_new1	    ;FA-J
;ASBFA0K:	    defb    8,10,236,7,bankno_new1	    ;FA-K
;ASBFA0L:	    defb    7,10,172,17,bankno_new1	    ;FA-L
;ASBFA0M:	    defb    11,10,179,17,bankno_new1	    ;FA-M
;ASBFA0N:	    defb    8,10,190,17,bankno_new1	    ;FA-N
;ASBFA00:	    defb    7,10,198,17,bankno_new1	    ;FA-0
;ASBFA0P:	    defb    7,10,205,17,bankno_new1	    ;FA-P
;ASBFA09:	    defb    7,10,212,17,bankno_new1	    ;FA-9
;ASBFA08:	    defb    7,10,219,17,bankno_new1	    ;FA-8
;ASBFA07:	    defb    7,10,226,17,bankno_new1	    ;FA-7
;ASBFA06:	    defb    7,10,233,17,bankno_new1	    ;FA-6
;ASBFA05:	    defb    7,10,240,17,bankno_new1	    ;FA-5
;ASBFA04:	    defb    7,10,172,27,bankno_new1	    ;FA-4
;ASBFA03:	    defb    7,10,179,27,bankno_new1	    ;FA-3
;ASBFA02:	    defb    7,10,186,27,bankno_new1	    ;FA-2
;ASBFA01:	    defb    4,10,193,27,bankno_new1	    ;FA-1
;ASBFA0W:	    defb    13,10,197,27,bankno_new1	    ;FA-W
;ASBFA0V:	    defb    9,10,210,27,bankno_new1	    ;FA-V
;ASBFA0R:	    defb    9,10,219,27,bankno_new1	    ;FA-R
;ASBFA0O:	    defb    9,10,228,27,bankno_new1	    ;FA-O
;ASBFA0G:	    defb    9,10,237,27,bankno_new1	    ;FA-G
;ASBFA0Z:	    defb    8,10,172,37,bankno_new1	    ;FA-Z
;ASBFA0Y:	    defb    8,10,180,37,bankno_new1	    ;FA-Y
;ASBFA0X:	    defb    7,10,188,37,bankno_new1	    ;FA-X
;ASBFA0U:	    defb    8,10,195,37,bankno_new1	    ;FA-U
;ASBFA0T:	    defb    8,10,203,37,bankno_new1	    ;FA-T
;ASBFA0S:	    defb    7,10,211,37,bankno_new1	    ;FA-S
;ASBFB0Q:	    defb    6,8,244,0,bankno_new1	    ;FB-Q
;ASBFB0W:	    defb    9,7,244,8,bankno_new1	    ;FB-W
;ASBFA0Q:	    defb    9,11,247,15,bankno_new1	    ;FA-Q
;ASBFC07:	    defb    9,12,247,26,bankno_new1	    ;FC-7
;ASBFC05:	    defb    12,12,172,47,bankno_new1	    ;FC-5
;ASBR01:	    defb    7,13,184,47,bankno_new1	    ;R01
;ASBFC01:	    defb    8,13,191,47,bankno_new1	    ;FC-1
;ASBR09:	    defb    10,13,199,47,bankno_new1	    ;R09
;ASBR08:	    defb    10,13,209,47,bankno_new1	    ;R08
;ASBR07:	    defb    10,13,219,47,bankno_new1	    ;R07
;ASBR06:	    defb    10,13,229,44,bankno_new1	    ;R06
;ASBR05:	    defb    10,13,239,44,bankno_new1	    ;R05
;ASBR04:	    defb    11,13,172,60,bankno_new1	    ;R04
;ASBR03:	    defb    10,13,183,60,bankno_new1	    ;R03
;ASBR02:	    defb    10,13,193,60,bankno_new1	    ;R02
;ASBR00:	    defb    10,13,203,60,bankno_new1	    ;R00
;ASBFC09:	    defb    11,13,213,60,bankno_new1	    ;FC-9
;ASBFC08:	    defb    10,13,224,60,bankno_new1	    ;FC-8
;ASBFC06:	    defb    11,13,234,60,bankno_new1	    ;FC-6
;ASBFC04:	    defb    10,13,245,60,bankno_new1	    ;FC-4
;ASBFC03:	    defb    10,13,139,71,bankno_new1	    ;FC-3
;ASBFC02:	    defb    10,13,149,71,bankno_new1	    ;FC-2
;ASBFC00:	    defb    9,13,159,71,bankno_new1	    ;FC-0
;ASBS0WIN:	    defb    31,9,223,73,bankno_new1	    ;S-WIN
;ASBS0MIN:	    defb    24,7,218,37,bankno_new1	    ;S-MIN
;ASBslash:	    defb    20,19,188,115,bankno_new1	    ;slash  (2/3/1998)
;ASBEBAR01:     defb    30,5,223,82,bankno_new1	    ;EBAR01 (9/3/1998)
;ASBEBAR02:     defb    3,9,201,87,bankno_new1	    ;EBAR02
;ASBMARROW01:   defb    6,12,249,47,bankno_new1	    ;MARROW01
;ASBMUNLIMIT:   defb    17,7,204,87,bankno_new1	    ;MUNLIMIT
;ASB
;ASBwin02:		defb	27,9,81,160,bankno_legal1      ;win02
;ASBslash01:	defb	5,14,71,160,bankno_legal1      ;slash01
;ASBslash02:	defb	5,14,76,160,bankno_legal1      ;slash02

	end

