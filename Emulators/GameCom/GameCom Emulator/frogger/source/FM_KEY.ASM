;;;;;;;;;***;;;***;;;FIGHTERS MEGAMIX;;;***;;;***;;;;;;;;;;;;
	title	Fighter Mega Mix Common Bank program/Entry Point
	type	8521

	include frogger.tmp
	include equate.inc
	include ram.inc
	include disp_ram.inc
	include disp_equ.inc

;ASB	global	CHK_key
;ASB	global	interpreter
;ASB	global	act06
;ASB	global	act42
;ASB	global	act44
;ASB
;ASBENTRY_BANK	equ	20h
;ASBCART_ID 	equ	0a31h
;ASBbankno_l11ao7r6 equ	54h
;ASB
;ASB;;;;;;;;;;;;;;;;;;;;;;;;Game Action;;;;;;;;;;;;;;;;;;;;;;;;;;
;ASB
;ASBCHK_key:			;key2 is the output keycode
;ASB	mov	r0,#0
;ASB	mov	r1,#20h 	;bit 7--Up
;ASB	call	Output_scan	;bit 6--Down
;ASB	call	Return_line	;bit 5--Left
;ASB	mov	key1,r0 	;bit 4--Right
;ASB	mov	key2,r1
;ASB	movw	rr0,#40h	;bit 3--A
;ASB	call	Output_scan	;bit 2--D
;ASB	call	Return_line	;bit 1--C
;ASB	bbs	r0,#1,DQ	;bit 0--B
;ASBq1:	bbs	key1,#7,AQ
;ASBq2:	bbs	key1,#0,upQ
;ASBq3:	bbs	key1,#2,leftQ
;ASBq4:	bbs	key1,#3,rightQ
;ASBq5:	bbs	key1,#1,downQ
;ASBq6:	ret
;ASB
;ASBDQ:	bset	key2,#2
;ASB	br	q1
;ASB
;ASBAQ:	bset	key2,#3
;ASB	br	q2
;ASB
;ASBupQ:	bset	key2,#7
;ASB	br	q3
;ASB
;ASBleftQ:	bset	key2,#5
;ASB	br	q4
;ASB
;ASBrightQ: bset	key2,#4
;ASB	br	q5
;ASB
;ASBdownQ:	bset	key2,#6
;ASB	ret
;ASB
;ASBPLY_info1:				;pointer of current player info1
;ASB	mov	r0,#plyr_info1
;ASB	add	r0,r15
;ASB	mov	r1,@r0
;ASB	ret
;ASB
;ASBPLY_info2:
;ASB	mov	r0,#plyr_info2
;ASB	add	r0,r15
;ASB	mov	r1,@r0
;ASB	ret
;ASB
;ASB;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;ASB;key history function
;ASB
;ASBCK_action:
;ASB	call	PLY_info1
;ASB	mov	r3,r1
;ASBck3:	bbs	key2,#3,SET_H1
;ASBck4:	bbc	key2,#3,RESET_H1
;ASBck5:	bbs	key2,#0,SET_H2
;ASBck6:	bbc	key2,#0,RESET_H2
;ASBck7:	bbs	key2,#2,SET_H3
;ASBck8:	bbc	key2,#2,RESET_H3
;ASBck9:	mov	@r0,r3
;ASB	ret
;ASB
;ASBSET_H1: bset	r3,#1
;ASB	br	ck4
;ASB
;ASBRESET_H1:
;ASB	bclr	r3,#1
;ASB	br	ck5
;ASB
;ASBSET_H2: bset	r3,#4
;ASB	br	ck6
;ASB
;ASBRESET_H2:
;ASB	bclr	r3,#4
;ASB	br	ck7
;ASB
;ASBSET_H3: bset	r3,#3
;ASB	br	ck8
;ASB
;ASBRESET_H3:
;ASB	bclr	r3,#3
;ASB	br	ck9
;ASB
;ASB;;;;;;;;;;;;;;;;;;;;;;Key Interpreter;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;ASB
;ASBinterpreter:
;ASB	call	Cur_statusA
;ASB	call	Chk_jmp_kick
;ASB	call	Chk_SPAA
;ASB	call	Chk_run
;ASB	call	Direct_Set
;ASB	call	movement
;ASB	call	CK_action		;key history
;ASB	ret
;ASB
;ASBCur_statusA:				;Current player status
;ASB	mov	r0,#9
;ASB	add	r0,r15
;ASB	mov	r1,@r0
;ASB	mov	status1,r1
;ASB	ret
;ASB
;ASBChk_jmp_kick:
;ASB	cmp	status1,#22	;jump kick (up)
;ASB	br	eq,jmpkick1
;ASB	cmp	status1,#24	;jump kick (forward)
;ASB	br	eq,jmpkick2
;ASB	cmp	status1,#26	;jump kick (backward)
;ASB	br	eq,jmpkick3
;ASB	ret
;ASB
;ASBjmpkick1:
;ASB	cmp	key2,#1
;ASB	jmp	eq,act36
;ASB	cmp	key2,#81h
;ASB	jmp	eq,act36
;ASB	ret
;ASB
;ASBjmpkick2:
;ASB	bbs	key2,#0,pass_38
;ASB	ret
;ASB
;ASBpass_38:jmp	act38
;ASB
;ASBpass_40:jmp	act40
;ASB
;ASBjmpkick3:
;ASB	bbs	key2,#0,pass_40
;ASB	ret
;ASB
;ASB;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
;ASB
;ASBChk_SPAA:
;ASB	mov	r1,#plyr_id		;23/12/97
;ASB	add	r1,r15			;the different kinds of key set
;ASB	mov	r2,@r1			;SPAA
;ASB	cmp	r2,#hornet_id		;
;ASB	br	eq,hornet_Q		;
;ASB	cmp	r2,#janet_id		;
;ASB	jmp	eq,janet_SPAA		;
;ASB	cmp	r2,#kids_id		;
;ASB	jmp	eq,kids_SPAA		;
;ASB	cmp	r2,#pai_id		;
;ASB	br	eq,pai_Q		;
;ASB	cmp	r2,#siba_id		;
;ASB	jmp	eq,siba_SPAA		;
;ASB	call	PLY_info2		;29/12/1997
;ASB	bclr	r1,#5
;ASB	bclr	r1,#6
;ASB	bclr	r1,#7			;reset the fighter isn't kids & siba
;ASB	mov	@r0,r1			;
;ASB
;ASBChk_SPAA1:
;ASB	call	PLY_info2		;the other fighters SPAA key B+PKG
;ASB	bbs	r1,#5,chk_sppa1
;ASB	bbs	r1,#3,spa_right
;ASB
;ASB;face left
;ASB	cmp	key2,#10h		;move right
;ASB	br	ne,spa_left2
;ASB	bset	r1,#2			;set backward flag
;ASB	mov	@r0,r1
;ASBspa_left2:
;ASB	bbs	key2,#4,chk_sppa
;ASBspa_left3:
;ASB	bclr	r1,#2			;reset backward flag
;ASB	mov	@r0,r1
;ASBclr_timer:
;ASB	bclr	r1,#4			;clear special move allow flag.
;ASB	mov	@r0,r1			;enable special move again.
;ASB	clr	r0
;ASB	cmp	r15,#decode_ptr1
;ASB	br	ne,clr_p2_count
;ASB	mov	p1_timerA,r0
;ASBhornet_Q:
;ASBpai_Q:
;ASBstopb:
;ASB	ret
;ASB
;ASBclr_p2_count:
;ASB	mov	p2_timerA,r0
;ASB	ret
;ASB
;ASBspa_right:
;ASB	cmp	key2,#20h		;move left
;ASB	br	ne,spa_right2
;ASB	bset	r1,#2			;set backward flag
;ASB	mov	@r0,r1
;ASBspa_right2:
;ASB	bbs	key2,#5,chk_sppa
;ASB	br	spa_left3
;ASB
;ASBchk_sppa:
;ASB	bbc	r1,#2,clr_timer 	;reset the timer of SPAA
;ASB	bbs	r1,#4,stopb		;special move allow or not?
;ASB	mov	r2,p1_timerA
;ASBchk_sppa1:
;ASB	cmp	r15,#decode_ptr1
;ASB	br	ne,count_p2
;ASB	add	r2,#1
;ASB	mov	p1_timerA,r2
;ASBcom_count:
;ASB	cmp	r2,#50		       ;value of backward loop counting
;ASB	br	ule,continue_chk	;29/12/1997
;ASB;	 br	 nc,continue_chk
;ASB	bclr	r1,#2
;ASB	bset	r1,#4
;ASB	bclr	r1,#5
;ASB	bclr	r1,#6
;ASB	mov	@r0,r1
;ASBstopa:
;ASB	ret
;ASB
;ASBcount_p2:
;ASB	mov	r2,p2_timerA
;ASB	add	r2,#1
;ASB	mov	p2_timerA,r2
;ASB	br	com_count
;ASB
;ASBcontinue_chk:
;ASB	call	PLY_info2		;29/12/1997
;ASB	bbs	r1,#5,janet_chk
;ASB	bbc	r1,#6,continue_chkA
;ASB	bset	r1,#5
;ASB	mov	@r0,r1
;ASBjanet_chk:
;ASB	bbc	r1,#0,stopa
;ASB
;ASBcontinue_chkA:
;ASB	mov	r0,r15
;ASB	add	r0,#plyr_y
;ASB	cmp	@r0,#init_y
;ASB	br	ult,stopa		;fighter not stand on the earth OUT
;ASB	mov	r0,r15
;ASB	add	r0,#plyr_status
;ASB	cmp	@r0,#st_add_attack
;ASB	br	uge,stopa
;ASB
;ASB	call	PLY_info2		;29/12/1997
;ASB	bbs	r1,#5,janet_fig 	;29/12/1997
;ASB	bbc	r1,#7,cont_chk1 	;the SPAA for KIDS & SIBA
;ASB
;ASB;	 bbc	 r1,#2,stopa		 ;30/12/1997
;ASB;	 cmp	 key2,#18h		 ;only (B+P+P)
;ASB;	 br	 eq,cont_chk2		 ;
;ASB;	 cmp	 key2,#28h		 ;
;ASB;	 br	 eq,cont_chk2		 ;
;ASB;	 ret				 ;
;ASB
;ASB	mov	r0,key2 		;29/12/1997
;ASB	and	r0,#08h 		;check the punch key
;ASB	cmp	r0,#08h 		;(B+P+P)(B+PK)(B+PKG)
;ASB	br	ne,stopa		;
;ASB	br	cont_chk2		;
;ASB
;ASBjanet_fig:
;ASB	mov	r0,key2 		;29/12/1997
;ASB	and	r0,#09h 		;check the punch & kick keys
;ASB	cmp	r0,#09h 		;
;ASB	br	ne,stopa		;
;ASB	call	PLY_info2
;ASB	bclr	r1,#2
;ASB	bset	r1,#4
;ASB	bclr	r1,#5
;ASB	bclr	r1,#6
;ASB	mov	@r0,r1
;ASB	br	cont_chk2		;
;ASB
;ASBcont_chk1:
;ASB	mov	r0,key2
;ASB	and	r0,#0bh
;ASB	cmp	r0,#0bh
;ASB	br	ne,stopa
;ASBcont_chk2:
;ASB	mov	r5,#44			;set the value of the status
;ASB	jmp	act44
;ASB
;ASBkids_SPAA:				;set the SPAA flag
;ASBsiba_SPAA:
;ASB	call	PLY_info2
;ASB	bset	r1,#7
;ASB	mov	@r0,r1
;ASB	jmp	Chk_SPAA1
;ASB
;ASBjanet_SPAA:
;ASB	call	PLY_info2
;ASB	bset	r1,#6
;ASB	mov	@r0,r1
;ASB	jmp	Chk_SPAA1
;ASB
;ASB;/////////////////////////////////////////////////////////////////
;ASB
;ASBDirect_Set:				;direction with player
;ASB	mov	r1,#11			;take current player direction
;ASB	add	r1,r15
;ASB	mov	r0,@r1
;ASB	bbs	r0,#3,face_right
;ASB	br	face_left
;ASB
;ASBface_right:
;ASB	cmp	key2,#10h
;ASB	jmp	eq,act02	;walk_F
;ASB	cmp	key2,#20h
;ASB	jmp	eq,act04	;walk_B
;ASB	cmp	key2,#50h
;ASB	jmp	eq,act16	;crouch_walk_F
;ASB	cmp	key2,#60h
;ASB	jmp	eq,act18	;crouch_walk_B
;ASB	cmp	key2,#90h
;ASB	jmp	eq,act24	;jump_F
;ASB	cmp	key2,#0a0h
;ASB	jmp	eq,act26	;jump_B
;ASB	ret
;ASB
;ASBface_left:
;ASB	cmp	key2,#20h
;ASB	jmp	eq,act02	;walk_F
;ASB	cmp	key2,#10h
;ASB	jmp	eq,act04	;walk_B
;ASB	cmp	key2,#60h
;ASB	jmp	eq,act16	;crouch_walk_F
;ASB	cmp	key2,#50h
;ASB	jmp	eq,act18	;crouch_walk_B
;ASB	cmp	key2,#0a0h
;ASB	jmp	eq,act24	;jump_F
;ASB	cmp	key2,#90h
;ASB	jmp	eq,act26	;jump_B
;ASB	ret
;ASB
;ASB;////////////////////////////////////////////////////////////////////
;ASB;Scankey of Running
;ASB
;ASBChk_run:			;take ram of current player
;ASB	mov	r2,#18
;ASB	add	r2,r15
;ASB	mov	r3,@r2		;plyr_ram
;ASB
;ASB	cmp	r3,#4
;ASB	jmp	ge,set_run5
;ASB	cmp	r3,#0
;ASB	br	eq,set_run1
;ASB	cmp	r3,#1
;ASB	br	eq,set_run2
;ASB	call	Chk_Timer
;ASB	cmp	r3,#2
;ASB	br	eq,set_run3
;ASB	cmp	r3,#3
;ASB	br	eq,set_run4
;ASB	ret
;ASB
;ASBpass_run:
;ASB	add	r3,#1
;ASB	mov	@r2,r3
;ASB	ret
;ASB
;ASBreset_case:
;ASB	mov	r3,#0
;ASB	mov	@r2,r3
;ASB	ret
;ASB
;ASBset_run1:
;ASB	cmp	key2,#0
;ASB	br	ne,reset_case
;ASB	mov	r7,#0
;ASB	call	save_timerB
;ASB	br	pass_run
;ASB
;ASBset_run2:
;ASB	call	PLY_info2
;ASB	bbs	r1,#3,run2_left
;ASB	cmp	key2,#20h
;ASBrun2:	br	ne,run2a
;ASB	mov	r7,#0
;ASB	call	save_timerB
;ASB	br	pass_run
;ASBrun2a:
;ASB	call	Chk_Timer
;ASB	jmp	c,reset_case
;ASB	ret
;ASB
;ASBrun2_left:
;ASB	cmp	key2,#10h
;ASB	call	run2
;ASB	ret
;ASB
;ASBset_run3:
;ASB	cmp	key2,#0
;ASB	br	ne,run_3a
;ASB;	 call	 PLY_info2
;ASB;	 bset	 r1,#7
;ASB;	 mov	 @r0,r1
;ASB	br	pass_run
;ASBrun_3a:
;ASB	call	load_timerB
;ASB	cmp	r7,#200
;ASB	jmp	ugt,reset_case
;ASB	ret
;ASB
;ASBset_run4:
;ASB	call	PLY_info2
;ASB	bbs	r1,#3,run4_left
;ASB	cmp	key2,#20h
;ASBrun4:	jmp	eq,pass06
;ASB	call	load_timerB
;ASB	cmp	r7,#200
;ASB	jmp	ugt,reset_case
;ASB	ret
;ASB
;ASBrun4_left:
;ASB	cmp	key2,#10h
;ASB	call	run4
;ASB	ret
;ASB
;ASBpass06: call	pass_run
;ASB;	 call	 PLY_info2
;ASB;	 bbc	 r1,#7,reset_case
;ASB	jmp	act06
;ASB
;ASBset_run5:
;ASB	call	PLY_info2
;ASB	bbs	r1,#3,run5_left
;ASB	call	hornet_SPAA
;ASB	call	pai_SPAA
;ASB	cmp	key2,#20h
;ASBrun5:	jmp	ne,reset_case
;ASB	jmp	act06
;ASB
;ASBrun5_left:
;ASB	call	hornet_SPAA
;ASB	call	pai_SPAA
;ASB	cmp	key2,#10h
;ASB	call	run5
;ASB	ret
;ASB
;ASBPLY_ID:
;ASB	mov	r5,#8			;plyr_id
;ASB	add	r5,r15
;ASB	mov	r4,@r5
;ASB	ret
;ASB
;ASBhornet_SPAA:				;29/12/1997
;ASB	call	PLY_ID
;ASB	cmp	r4,#6
;ASB	br	ne,quit1
;ASB	cmp	key2,#08h
;ASB	br	eq,SPAA_2
;ASB	cmp	key2,#18h
;ASB	br	eq,SPAA_2
;ASB	cmp	key2,#28h
;ASB	br	eq,SPAA_2
;ASB	ret
;ASB
;ASBpai_SPAA:				;29/12/1997
;ASB	call	PLY_ID
;ASB	cmp	r4,#1
;ASB	br	ne,quit1
;ASB	cmp	key2,#01h
;ASB	br	eq,SPAA_2
;ASB	cmp	key2,#11h
;ASB	br	eq,SPAA_2
;ASB	cmp	key2,#21h
;ASB	br	eq,SPAA_2
;ASB	ret
;ASB
;ASBSPAA_2:
;ASB	call	reset_case
;ASB	jmp	act44
;ASB
;ASB;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
;ASB;load the counter value of player.
;ASB
;ASBload_timerB:
;ASB	mov	r7,p1_timerB
;ASB	cmp	r15,#decode_ptr1
;ASB	br	eq,quit1
;ASB	mov	r7,p2_timerB
;ASBquit1:	ret
;ASB
;ASBsave_timerB:
;ASB	cmp	r15,#decode_ptr1
;ASB	br	ne,save_p2_time
;ASB	mov	p1_timerB,r7
;ASB	ret
;ASB
;ASBsave_p2_time:
;ASB	mov	p2_timerA,r7
;ASB	ret
;ASB
;ASBChk_Timer:
;ASB	call	load_timerB
;ASB	inc	r7
;ASB	call	save_timerB
;ASB	ret
;ASB
;ASB;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
;ASB
;ASBmovement:
;ASB	cmp	key2,#0
;ASB	jmp	eq,act00	;stance
;ASB;	 cmp	 key2,#
;ASB;	 jmp	 eq,act06	 ;run
;ASB	cmp	key2,#2
;ASB	jmp	eq,act08	;guard
;ASB	cmp	key2,#12h
;ASB	jmp	eq,act08	;guard (move right)
;ASB	cmp	key2,#22h
;ASB	jmp	eq,act08	;guard (move left)
;ASB	cmp	key2,#44h
;ASB	jmp	eq,act10	;in_turn
;ASB	cmp	key2,#4
;ASB	jmp	eq,act12	;out_turn
;ASB	cmp	key2,#40h
;ASB	jmp	eq,act14	;crouch
;ASB	cmp	key2,#42h
;ASB	jmp	eq,act20	;crouch_guard
;ASB	cmp	key2,#52h
;ASB	jmp	eq,act20	;crouch_guard (move right)
;ASB	cmp	key2,#62h
;ASB	jmp	eq,act20	;crouch_guard (move left)
;ASB	cmp	key2,#80h
;ASB	jmp	eq,act22	;jump_Up
;ASB	cmp	key2,#8
;ASB	jmp	eq,act28	;punch
;ASB	cmp	key2,#18h
;ASB	jmp	eq,act28	;punch (move right)
;ASB	cmp	key2,#28h
;ASB	jmp	eq,act28	;punch (move left)
;ASB	cmp	key2,#1
;ASB	jmp	eq,act30	;kick
;ASB	cmp	key2,#11h
;ASB	jmp	eq,act30	;kick  (move right)
;ASB	cmp	key2,#21h
;ASB	jmp	eq,act30	;kick  (move left)
;ASB	cmp	key2,#48h
;ASB	jmp	eq,act32	;crouch_punch
;ASB	cmp	key2,#58h
;ASB	jmp	eq,act32	;crouch_punch (move right)
;ASB	cmp	key2,#68h
;ASB	jmp	eq,act32	;crouch_punch (move left)
;ASB	cmp	key2,#41h
;ASB	jmp	eq,act34	;crouch_kick
;ASB	cmp	key2,#51h
;ASB	jmp	eq,act34	;crouch_kick (move right)
;ASB	cmp	key2,#61h
;ASB	jmp	eq,act34	;crouch_kick (move left)
;ASB;	 cmp	 key2,#
;ASB;	 jmp	 eq,act36	 ;jump_kick_Up
;ASB;	 cmp	 key2,#
;ASB;	 jmp	 eq,act38	 ;jump_kick_F
;ASB;	 cmp	 key2,#
;ASB;	 jmp	 eq,act40	 ;jump_kick_B
;ASB	cmp	key2,#88h
;ASB	jmp	eq,act42	;addition attack
;ASB;	 cmp	 key2,#
;ASB;	 jmp	 eq,act44	 ;SPAA
;ASB;	 cmp	 key2,#
;ASB;	 jmp	 eq,act46	 ;get_up
;ASB;	 cmp	 key2,#
;ASB;	 jmp	 eq,act48	 ;return
;ASB;	 cmp	 key2,#
;ASB;	 jmp	 eq,act50	 ;react1
;ASB;	 cmp	 key2,#
;ASB;	 jmp	 eq,act52	 ;react2
;ASB;	 cmp	 key2,#
;ASB;	 jmp	 eq,act54	 ;react3
;ASB;	 cmp	 key2,#
;ASB;	 jmp	 eq,act56	 ;react4
;ASB;	 cmp	 key2,#
;ASB;	 jmp	 eq,act58	 ;react5
;ASB;	 cmp	 key2,#
;ASB;	 jmp	 eq,act60	 ;react6
;ASB;	 cmp	 key2,#
;ASB;	 jmp	 eq,act62	 ;react7
;ASB	bbs	key2,#1,guardA
;ASB	ret
;ASB;
;ASBguardA: bbs	key2,#6,pass20
;ASB	jmp	act08
;ASB
;ASBpass20: jmp	act20
;ASB
;ASB
;ASB;*****************SET INTERPRETER FOR ACTIONS******************
;ASB
;ASBSET1:	cmp	status1,#0		;Stance
;ASB	jmp	eq,true
;ASB	ret
;ASB
;ASBSET2:	call	SET1			;Stance,Walk_2
;ASB	cmp	status1,#2
;ASB	jmp	eq,true
;ASB	cmp	status1,#4
;ASB	jmp	eq,true
;ASB	ret
;ASB
;ASBSET3:	call	SET1			;Stance,Crouch
;ASB	cmp	status1,#14
;ASB	jmp	eq,true
;ASB	ret
;ASB
;ASBSET4:	call	SET3			;Stance,Crouch,Crouch_walk2
;ASB	cmp	status1,#18
;ASB	jmp	eq,true
;ASB	cmp	status1,#16
;ASB	jmp	eq,true
;ASB	ret
;ASB
;ASB;SET5:	 cmp	 status1,#52		 ;react cases for lie down
;ASB;	 jmp	 eq,true
;ASB;	 cmp	 status1,#56
;ASB;	 jmp	 eq,true
;ASB;	 cmp	 status1,#58
;ASB;	 jmp	 eq,true
;ASB;	 cmp	 status1,#60
;ASB;	 jmp	 eq,true
;ASB;	 cmp	 status1,#62
;ASB;	 jmp	 eq,true
;ASB;	 ret
;ASB
;ASBSET6:	cmp	status1,#24
;ASB	jmp	eq,true
;ASB	ret
;ASB
;ASBSET7:	cmp	status1,#26
;ASB	jmp	eq,true
;ASB	ret
;ASB
;ASB;**************************************************************
;ASB
;ASBtrue:	mov	r0,#9		;Update the player status
;ASB	add	r0,r15
;ASB	mov	@r0,r5
;ASB
;ASB	mov	r1,#10		;Set player action init flag
;ASB	add	r1,r15
;ASB	mov	r0,@r1
;ASB	or	r0,#1
;ASB;	 bclr	 r0,#7
;ASB	mov	@r1,r0		;r1 point to plyr1_info1
;ASB	ret
;ASB
;ASBFmove:	mov	r3,#10		;Check player action init flag
;ASB	add	r3,r15
;ASB	mov	r2,@r3
;ASB	bbc	r2,#0,stop
;ASB	mov	r0,#11		;Forward movement
;ASB	add	r0,r15
;ASB	mov	r1,@r0
;ASB	bset	r1,#0
;ASB	mov	@r0,r1
;ASB	ret
;ASB
;ASBBmove:	mov	r3,#10		;Check player action init flag
;ASB	add	r3,r15
;ASB	mov	r2,@r3
;ASB	bbc	r2,#0,stop
;ASB	mov	r0,#11		;Backward movement
;ASB	add	r0,r15
;ASB	mov	r1,@r0
;ASB	bset	r1,#1
;ASB	mov	@r0,r1
;ASBstop:	ret
;ASB
;ASBact00:
;ASB;	 mov	 r5,#0		    ;stance @	    (@=operate anytime)
;ASB;	 call	 true
;ASB	mov	r0,r15
;ASB	add	r0,#10
;ASB	mov	r1,@r0
;ASB	bclr	r1,#7		;reset blackward flag.
;ASB	mov	@r0,r1
;ASB	ret
;ASB
;ASBact02:	mov	r5,#2		   ;walk_F
;ASB	call	SET1
;ASB	call	Fmove
;ASB	ret
;ASB
;ASBact04:
;ASB	mov	r5,#4		   ;walk_B
;ASB	call	SET1
;ASB	call	Bmove
;ASB	ret
;ASB
;ASBact06:	mov	r5,#6		   ;run
;ASB	call	SET2
;ASB	call	Fmove
;ASB	ret
;ASB
;ASBact08:	mov	r5,#8		   ;guard
;ASB	call	SET2
;ASB	ret
;ASB
;ASBact10:	mov	r5,#10		   ;in_turn
;ASB	call	PLY_info1
;ASB	bbs	r1,#3,act14	;stop
;ASB	call	SET2
;ASB	call	SET4
;ASB	ret
;ASB
;ASBact12:	mov	r5,#12		   ;out_turn
;ASB	call	PLY_info1
;ASB	bbs	r1,#3,stop
;ASB	call	SET2
;ASB	ret
;ASB
;ASBact14:	mov	r5,#14		   ;crouch
;ASB	call	SET2
;ASB	ret
;ASB
;ASBact16:	mov	r5,#16		   ;crouch_walk_F
;ASB	call	SET3
;ASB	call	Fmove
;ASB	ret
;ASB
;ASBact18:	mov	r5,#18		   ;crouch_walk_B
;ASB	call	SET3
;ASB	call	Bmove
;ASB	ret
;ASB
;ASBact20:	mov	r5,#20		   ;crouch_guard
;ASB	call	SET4
;ASB	ret
;ASB
;ASBact22:	mov	r5,#22		   ;jump_Up
;ASB	call	SET2
;ASB	ret
;ASB
;ASBact24:	mov	r5,#24		   ;jump_F
;ASB	call	SET2
;ASB	call	Fmove
;ASB	ret
;ASB
;ASBact26:	mov	r5,#26		   ;jump_B
;ASB	call	SET2
;ASB	call	Bmove
;ASB	ret
;ASB
;ASBact28:	mov	r5,#28		   ;punch
;ASB	call	PLY_info1
;ASB	bbs	r1,#1,stop1
;ASB	call	SET2
;ASB	ret
;ASB
;ASBact30:	mov	r5,#30		   ;kick
;ASB	call	PLY_info1
;ASB	bbs	r1,#4,stop1
;ASB	call	SET2
;ASB	ret
;ASB
;ASBact32:	mov	r5,#32		   ;crouch_punch
;ASB	call	PLY_info1
;ASB	bbs	r1,#1,act14	;stop1
;ASB	call	SET4
;ASB	ret
;ASB
;ASBact34:	mov	r5,#34		   ;crouch_kick
;ASB	call	PLY_info1
;ASB	bbs	r1,#4,act14	;stop1
;ASB	call	SET4
;ASB	ret
;ASB
;ASBact36:	mov	r5,#36		   ;jump_kick_Up
;ASB	cmp	status1,#22
;ASB	jmp	eq,true
;ASBstop1:	ret
;ASB
;ASBact38:	mov	r5,#38		   ;jump_kick_F
;ASB	call	SET6
;ASB	call	Fmove
;ASB	ret
;ASB
;ASBact40:	mov	r5,#40		   ;jump_kick_B
;ASB	call	SET7
;ASB	call	Bmove
;ASB	ret
;ASB
;ASBact42:	mov	r5,#42		   ;add_attack
;ASB	call	SET2
;ASB	call	Fmove
;ASB	ret
;ASB
;ASBact44:	mov	r5,#44		   ;SPAA
;ASB	call	true
;ASB	call	Fmove
;ASB	call	PLY_info2
;ASB	bclr	r1,#bit2	;clear backward flag.
;ASB	mov	@r0,r1
;ASB	ret
;ASB
;ASB;act46:  mov	 r5,#46 	    ;get_up
;ASB;	 call	 SET5
;ASB;	 ret
;ASB;
;ASB;act48:  mov	 r5,#48 	    ;return
;ASB;	 call	 SET5
;ASB;	 ret
;ASB
;ASB;act50:  mov	 r5,#50 	    ;react1
;ASB;act52:  mov	 r5,#52 	    ;react2 #	    (#=lie down case)
;ASB;act54:  mov	 r5,#54 	    ;react3
;ASB;act56:  mov	 r5,#56 	    ;react4 #
;ASB;act58:  mov	 r5,#58 	    ;react5 #
;ASB;act60:  mov	 r5,#60 	    ;react6 #
;ASB;act62:  mov	 r5,#62 	    ;react7 #

	end

