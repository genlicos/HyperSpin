        ;note : temp_code for qc & comment use only.
	;kill it if release code.

	title	FIGHTER MEGAMIX
	type	8521

	NLIST
	include equate.inc
	include ram.inc
	include disp_ram.inc
	include disp_equ.inc
	LIST

	include fighter.inc

	global	Fi_graphx
	global	fighter_init
	global	set_status
	global	plyr1_init
	global	plyr2_init
	global	CK_page
	global	text_ab
	global	text_abi
	global	restart_init
	global	clrdisplaybuffer
	global	random
	global	random2
	global	getlookupinfo
	global	refill_energy
	global	Fi_grapha
        global  armor_fighter
	global	armor_init
	global	armor_init2
	global	jmp_record_show
	global	p2_win_game2a
	global	p1_armor_init2
	global	p2_armor_init2
	global	p2_init
        global  open_h2h
        global  exchg_open
;	 global  end_open_init
        global  end_h2h_init
        global  high_score_init
        global  update_score
        global  open_connect
	global	h2h_timer
	global	open_message
	global	quit_to_menu
        global  cont_melody
        global  win_animat
        global  h2h_fun_key
        global  start_melody
        global  decode
        global  open_connectx
        GLOBAL  scan_3B


	program


	db	10h
	db	20h
	dw	fightentry
	db	00000011b		;3
	dm	'TigerDMGC'
        db      bankno_winpic10         ;icon located bank no.
        db      175                     ;x_coord.
        db      0                       ;y_coord.
	dm	'fightmega'             ;9-bytes
	dw	fighter_id		;0426h
	db	08fh
	db	0
	dw	0




fightentry:

	clr	r0
	cmp	r2,#ini_game
	br	eq,fighter_init
	cmp	r2,#exe_game
	jmp	eq,fighter_exe
	cmp	r2,#close_game
	br	eq,fighter_close
	cmp	r2,#reset_game
	br	eq,fighter_reset
	mov	r0,#0ffh
	ret

fighter_reset:

	ret

;ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·
;º  game close	 º
;ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ½

fighter_close:

        call    stop_melody
	mov	r0,#4
	call	CTRL_SP
        call    restore_uart
        call    update_score
	call	restore_isr
        and     p3,#0f0h
	ret

;ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·
;º  game init	º
;ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄ½

fighter_init:


	mov	mmu3,#program_bank2
	call	init_isr
	call	Disp_setup
	call	enable_timeout		;(11/3_)
	call	enable_pause
	call	h2h_setup
	clr	r0
	mov	r2,#0beh

upper_clean:

	cmp	r2,#0
	br	eq,lower_cleanx
	mov	(r2)+,r0
	br	upper_clean

lower_cleanx:

	movw	rr2,#208h

lower_clean:

	mov	(rr2)+,r0
	cmpw	rr2,#37fh
	br	ule,lower_clean
	call	refill_energy
	call	high_score_init
	call	cheat_code_init
	mov	temp2,#22	     ;9/12/1997 (cheung)
	bbc	game_info2,#bit5,end_init_rec
	mov	r2,#3
	mov	Record_min1R,r2
	mov	r2,#6
	mov	Record_min3R,r2
	mov	r2,#9
	mov	Record_min5R,r2
	clr	r2
	mov	Record_sec1R,r2
	mov	Record_sec3R,r2
	mov	Record_sec5R,r2
	mov	r2,#2
	mov	Record_3min,r2
        inc     r2
        mov     Record_7min,r2
        inc     r2
	mov	Record_15min,r2

end_init_rec:

	mov	r2,#2
	mov	diff_ram,r2
	mov	rnd_ram,r2
        mov     r2,#8
        mov     plyr1_life,r2
        mov     plyr2_life,r2
	mov	r2,#80h
	mov	legal_flag,r2
        and     p3,#0f0h
        bset    game_info,#bit7         ;set start melody flag.
        mov     r0,#05                  ;opening melody.
        mov     new_melody_ptr,r0
        mov     r5,#silience
        call    speech

restart_init:

	clr	r0
;	 mov	 p1_armor_ok,r0 	 ;18/12/1997	 (cheung)
;	 mov	 p2_armor_ok,r0 	 ;18/12/1997	 (cheung)
	mov	plyr1_x,#p1_init_x
	mov	plyr1_y,#init_y
	mov	plyr2_x,#p2_init_x
	mov	plyr2_y,#init_y
	mov	plyr1_acttmr0,r0
	mov	plyr1_seqtmr0,r0
	mov	plyr2_acttmr0,r0
	mov	plyr2_seqtmr0,r0
	mov	intell_flag1,r0
	mov	attack_step,r0
	mov	start_word_seq,r0
	mov	plyr1_info1,r0
	mov	plyr1_info2,r0
	mov	plyr2_info1,r0
	mov	plyr2_info2,r0
	mov	ramBB,r0		;background x location
	mov	ramCC,r0		;earth
	mov	ramEE,r0		;stage
	mov	quit_flag,r0
	mov	game_info2,r0
        mov     game_info3,r0
	mov	p1_explose,r0
	mov	p2_explose,r0
	mov	cheat_code,r0
	mov	cheat_flag,r0
	mov	open_con,r0
	mov	speech_flag,r0
        mov     sp_time,r0
        mov     r0,#8
        mov     plyr1_life,r0
        mov     plyr2_life,r0
        bclr    game_info3,#bit0
        call    stop_melody

;**************************************************************
;        mov     r0,#07                  ;temp_code.
;        mov     internet_flag,r0
;**************************************************************

	bset	plyr1_info2,#bit3
	mov	r1,#01
	mov	start_word_flag,r1
	mov	r0,#enable_mem
	call	CTRL_KBD
	mov	r8,#01
	call	Sel_font
	mov	r0,#0
	push	mmu3
	mov	mmu3,#program_bank5
	call	SET_TIME		;3/1/1998 (cheung) game timer
	pop	mmu3
	ret




;ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·
;º   game execute   º
;ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ½

fighter_exe:


;----------------------------------------------------------
;in test mode.

IF TEST_MODE
	call	SCAN_KEY
	mov	cur_key,r0
	br	nc,do_chk_key
	call	key_handler
	br	do_chk_key


quit_to_menu:

;        call    restore_uart
;        call    update_score
        and     p3,#0f0h
        mov     r0,#02
	ret



do_chk_key:

	mov	r1,status_buffer
	mov	r0,cur_key
	mov	temp_key,r0
	cmp	r0,#up_key
	br	ne,take_key0
	cmp	plyr1_id,#honeys_id
	br	uge,take_key0
	inc	plyr1_id

take_key0:

	cmp	r0,#down_key
	br	ne,take_key01
	cmp	plyr1_id,#akira_id
	br	eq,take_key01
	dec	plyr1_id

take_key01:

	cmp	r0,#left_key
	br	ne,take_key1
	cmp	r1,#00
	br	eq,take_key1
	sub	r1,#02
	mov	status_buffer,r1

take_key1:

	cmp	r0,#right_key
	br	ne,take_key2
	cmp	r1,#68
	br	uge,take_key2
	add	r1,#02
	mov	status_buffer,r1

take_key2:

	cmp	r0,#a_key
	br	ne,take_key3
	mov	r1,status_buffer
	mov	plyr1_status,r1
	bset	plyr1_info1,#bit0

take_key3:

	cmp	r0,#b_key
	br	ne,main
	mov	r5,slave_key
	call	speech
	mov	r5,slave_key
	inc	r5
	mov	slave_key,r5
	cmp	r5,#13
	br	ult,main
	clr	r5
	mov	slave_key,r5
ENDIF


;----------------------------------------------------------
;in normal game

IF KEY_CALL

	call	legal_screen
	call	SCAN_KEY
	mov	cur_key,r0
	br	do_chk_key

menu_handle:

	bbc	game_info,#bit3,quit_to_menu
	bclr	game_info,#bit3
	mov	mmu3,#program_bank2
	call	p2_win_game
	call	refill_energy
	clr	r0
	mov	plyr1_status,r0
	mov	plyr2_status,r0
	mov	stage_num,r0
	mov	p1_win_times,r0
	mov	p2_win_times,r0
	mov	cur_key,r0
	bset	game_info,#bit5
	bbc	uart_info,#bit0,do_chk_key
	call	end_h2h
	bset	game_info,#bit5
	bclr	game_info2,#bit7
        call    stop_melody
	br	do_chk_key

quit_to_menu:

;        call    restore_uart
;        call    update_score
;        call    restore_isr
;        mov     r0,p3
;        and     r0,#0f0h
;        mov     p3,r0
	mov	r0,#02
	ret



one_play_modey:

        jmp     one_play_mode

do_chk_key:

        bbc     uart_info,#bit0,one_play_modey   ;one player mode ?
        bbs     uart_info,#bit1,slave_trans     ;master or slave ?
        jmp     master_receive

slave_trans:

;        bbs     uart_info,#bit4,slave_trans2
;        bbs     game_info2,#bit7,kkoo
        call    CHK_key
	mov	r0,key2
	mov	temp_key,r0

slave_trans1:

        call    transmit_key
        call    h2h_fun_key
	br	nc,slave_main
	cmp	r0,#on_off_key
	br	ne,slave_trans2
	call	end_h2h
        bclr    game_info2,#bit7
	br	mainx

slave_main:

;        call    Speech_Stop
;        br      nc,slave_main1
;        mov     r0,tm1d
;        cmp     r0,#208
;        br      eq,slave_main1
;        di
;        mov     r0,#208
;        mov     tm1d,r0
;        ei

slave_main1:
        bbs     uart_info,#bit4,slave_trans2     ;slave receive not enough byte or checksum error?
	bbs	uart_info,#bit2,menu_handle
        bbs     game_info,#bit3,slave_main3
        bbs     game_info2,#bit7,kkoo
        mov     r0,open_con
	bbc	r0,#bit0,kkoo		;check open connection.
	clr	r0			;open connection.
	mov	open_con,r0
	jmp	main
kkoo:
;        mov     r0,#00
;        mov     OPT_ramA,r0
        call    end_h2h_game
;        call    Active_page_B
;        clr     r0
;        mov     temp_ctrl,r0
;        mov     r0,#20h
;        mov     control_ram,r0
;        mov     r0,#0c0h
;        mov     option_ram,r0
;        call    stop_melody

slave_main2:

;        bbs     uart_info,#bit4,slave_main3     ;slave receive not enough byte ?

slave_main2a:

        bclr    game_info2,#bit7
        bset    game_info,#bit5
        push    mmu3
	mov	mmu3,#program_bank3
	call	OPEN
	mov	mmu3,#program_bank5
	call	OPTIONS
	pop	mmu3
	mov	r0,quit_flag
        bbs     r0,#bit0,quit_to_menu
        bbs     r0,#bit1,off_systemx
	bbc	game_info,#bit3,slave_main2

slave_main3:

	call	off_wait
	call	key_handler
	br	nc,slave_trans2
	bset	uart_info,#bit2

slave_trans2:

        mov     r0,GAME_TIMER0
        cmp     r0,#00
        br      ne,slave_trans3
        movw    rr0,#16
	movw	GAME_TIMER1A,rr0
	mov	r0,#1
	mov	GAME_TIMER0,r0
slave_trans3:
        call    Reset_UART_queue
        jmp     slave_stop


off_systemx:

        jmp     off_system

one_play_modex:

	jmp	one_play_mode


mainx:
	jmp	main


master_receive:

;        bbs     uart_info,#bit4,slave_trans2
        bset    game_info,#bit5
;        bbs     game_info2,#bit7,main
        call    receive_key
        call    h2h_fun_key
	br	nc,master_receive2
	cmp	r0,#on_off_key
        br      ne,slave_trans3
	call	end_h2h
        bclr    game_info2,#bit7
	br	main

master_receive2:

        clr     r0
	mov	open_con,r0
	bbs	uart_info,#bit2,menu_handlex
	bbs	game_info,#bit0,main	       ;round end flag.
	bbs	game_info,#bit2,main	       ;game end flag.
	mov	r0,start_word_flag
	bbs	r0,#bit0,main
	call	CHK_key
	mov	r15,#decode_ptr1
	mov	r14,#decode_ptr2
	call	interpreter
	mov	r0,slave_key
	mov	key2,r0
	mov	r14,#decode_ptr1
	mov	r15,#decode_ptr2
	call	interpreter
	br	main


slave_stop:

	mov	r0,start_word_flag
	bclr	r0,#bit6
	mov	start_word_flag,r0
        jmp     slave_stop2




menu_handlex:

	jmp	menu_handle



one_play_mode:

	mov	r0,start_word_flag
	bbs	r0,#bit0,main
	bbs	game_info,#bit0,main	       ;round end flag.
	bbs	game_info,#bit2,main	       ;game end flag.
	call	CHK_key
	mov	r15,#decode_ptr1
	mov	r14,#decode_ptr2
	call	interpreter


ENDIF

main:

IF KEY_CALL


	call	off_wait
	call	key_handler
	br	nc,main1a
	bbc	uart_info,#bit0,menu_handlex
	bset	uart_info,#bit2 	;menu key quit program.
main1a1:
	mov	r0,cur_key
	cmp	r0,#menu_key
	br	ult,main1a
	cmp	r0,#pause_key
	jmp	ule,slave_stop

main1a:
	mov	r0,game_info
	mov	tmp_game_info,r0
        bbc     game_info2,#bit7,main1
        bbs     uart_info,#bit4,main1b
        bclr    game_info2,#bit7
        call    end_h2h_game
	br	main2

main1b:
        call    Reset_UART_queue
        br      main1c


main1:
	push	mmu4
	mov	mmu4,#misc_tbl
	call	restart_game
	pop	mmu4
	bbc	game_info2,#bit7,main2
	bbc	uart_info,#bit0,main2
main1x:
        bset    decode_info,#bit0
        bclr    game_info3,#bit0
;        mov     r0,#00
;        mov     OPT_ramA,r0
        call    Reset_UART_queue
	jmp	slave_stop

main2:

;        call    Speech_Stop
;        br      nc,main2a
;        mov     r0,tm1d
;        cmp     r0,#208
;        br      eq,main2a
;        di
;        mov     r0,#208
;        mov     tm1d,r0
;        ei
main2a:
        push    mmu3
	mov	mmu3,#program_bank3
	call	OPEN
	mov	mmu3,#program_bank5
        call    OPTIONS
        pop     mmu3
        bbc     game_info2,#4,main_code
main1c:
        push    mmu3
	mov	mmu3,#program_bank4
        call    Sky1
	call	Sky
	call	earthB
	call	BACKGROUND
	mov	mmu3,#program_bank3
	call	DISPLAY_stage
	pop	mmu3

main_code:

	mov	r0,quit_flag
	bbs	r0,#bit0,quit_to_menux
        bbs     r0,#bit1,off_system
	bbc	game_info,#bit3,main1a
	push	mmu4
	mov	mmu4,#misc_tbl
	call	start_word
	pop	mmu4
	call	game_timeout
	call	finish_count
ENDIF
	call	plyr1_update
	call	plyr2_update
	call	plyr1_move
	call	plyr2_move

IF KEY_CALL

	call	intelligence
ENDIF

	call	check_hit
	call	block_move
	call	p1_scroll_char
	call	p2_scroll_char

IF KEY_CALL

	push	mmu3
	mov	mmu3,#program_bank4
	call	Sky1			;add by cheung (11/6)
	call	GAME_timer		;add by cheung (11/13)
	call	earth_move		;add by cheung (11/10)
	call	stage_movement
	pop	mmu3
	call	count_energy
	call	count_explose
ENDIF
slave_stop2:
	bbs	uart_info,#bit1,slave_stop3
	mov	r0,game_info
	mov	tmp_game_info,r0
slave_stop3:
	call	decode
        call    cont_melody
        bbs     uart_info,#bit1,jump_exe
;        bbs     uart_info,#bit4,jump_exe
        bclr    game_info3,#bit0
jump_exe:
        jmp     fighter_exe


quit_to_menux:

	jmp	quit_to_menu


off_system:

	mov	r0,#on_off_key
	mov	cur_key,r0
        jmp     key_handler







plyr1_update:

	bbs	plyr1_info1,#bit0,p1_action_init
	cmp	plyr1_seq_no,plyr1_total_seq
	br	ugt,p1_stand
	mov	r0,plyr1_acttmr0
	cmp	r0,#00
	br	ne,player1_next1

p1_stand:

	bbs	game_info,#bit6,p1_stand2
        bbs     game_info3,#bit4,p1_standa
        mov     r0,game_info
	and	r0,#03
	cmp	r0,#03
	br	ne,p1_stand1

p1_standa:

	mov	r0,start_word_flag
	bbs	r0,#bit5,p1_stand1
	mov	plyr1_status,#st_react7
	br	p1_define_st


p1_stand1:

	cmp	plyr1_status,#st_react4
	br	ult,p1_stand2
	cmp	plyr1_status,#st_react6
	br	ugt,p1_stand2
	mov	plyr1_status,#st_get_up
	br	p1_define_st

p1_stand2:

	mov	plyr1_status,#st_stance

p1_define_st:

	mov	plyr1_y,#init_y
	and	plyr1_info2,#0fch	;clear bit0,1(forward/backward move flag)
	mov	r0,block_flag
	bclr	r0,#bit1		;clear player 2 hitted flag.
	mov	block_flag,r0

p1_action_init:

	cmp	plyr1_status,#st_SPAA
	br	ne,p1_init
;	 mov	 r5,#spc_hit
;	 call	 speech
p1_init:
	call	set_p1_direction
	call	plyr1_init
	bclr	plyr1_info1,#bit0
	call	p1_play_snd

player1_next1:

	mov	r0,plyr1_seqtmr0
	cmp	r0,#00
	br	ne,player1_next2
	call	p1_up_next_seq

player1_next2:

	ret





plyr2_update:

	bbs	plyr2_info1,#bit0,p2_action_init
	cmp	plyr2_seq_no,plyr2_total_seq
	br	ugt,p2_stand
	mov	r0,plyr2_acttmr0
	cmp	r0,#00
	br	ne,player2_next1

p2_stand:

	bbs	game_info,#bit6,p2_stand2
	mov	r0,game_info
	and	r0,#03
	cmp	r0,#01
	br	ne,p2_stand1
	mov	r0,start_word_flag
	bbs	r0,#bit5,p2_stand1
	mov	plyr2_status,#st_react7
	br	p2_define_st

p2_stand1:

	cmp	plyr2_status,#st_react4
	br	ult,p2_stand2
	cmp	plyr2_status,#st_react6
	br	ugt,p2_stand2
	mov	plyr2_status,#st_get_up
	br	p2_define_st

p2_stand2:

	mov	plyr2_status,#st_stance

p2_define_st:

	mov	plyr2_y,#init_y
	and	plyr2_info2,#0fch	;clear bit0,1 (forward/backward move flag)
	mov	r0,block_flag
	bclr	r0,#bit2		;clear player 2 hitted flag.
	mov	block_flag,r0
	mov	r0,intell_flag1
	bclr	r0,#bit0
	mov	intell_flag1,r0 	;reset intelligence action start flag.

p2_action_init:

	cmp	plyr2_status,#st_SPAA
	br	ne,p2_init
;	 mov	 r5,#spc_hit
;	 call	 speech
p2_init:
	call	set_p2_direction
	call	plyr2_init
	bclr	plyr2_info1,#bit0
	call	p2_play_snd

player2_next1:

	mov	r0,plyr2_seqtmr0
	cmp	r0,#00
	br	ne,player2_next2
	call	p2_up_next_seq

player2_next2:

	ret




set_p1_direction:

	mov	r0,plyr1_x
	mov	r1,plyr2_x
	cmp	plyr1_status,#st_walk_B
	br	ne,ok_direction
	bbs	plyr1_info2,#bit3,p1_face_r
p1_face_l:
	sub	r0,r1
	br	nc,ok_direction
	bset	plyr1_info2,#bit3
	mov	plyr1_status,#st_walk_F
ok_direction:

	ret


p1_face_r:
	sub	r1,r0
	br	nc,ok_direction
	bclr	plyr1_info2,#bit3
	mov	plyr1_status,#st_walk_F
	ret





set_p2_direction:

	mov	r0,plyr1_x
	mov	r1,plyr2_x
	cmp	plyr2_status,#st_walk_B
	br	ne,ok_direction2
	bbs	plyr2_info2,#bit3,p2_face_r
p2_face_l:
	sub	r1,r0
	br	nc,ok_direction2
	bset	plyr2_info2,#bit3

	mov	plyr2_status,#st_walk_F

ok_direction2:

	ret


p2_face_r:

	sub	r0,r1
	br	nc,ok_direction2
	bclr	plyr2_info2,#bit3
	mov	plyr2_status,#st_walk_F
	ret





;ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·
;º    player 1 new action init	   º
;ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ½

plyr1_init:

	mov	r3,plyr1_id
	clr	r2
	mult	rr2,#03
	mov	r0,fighter_bank(rr2)
	incw	rr2
	mov	plyr1_bankno,r0
	movw	rr4,fighter_bank(rr2)
	mov	mmu4,plyr1_bankno
	mov	r3,plyr1_status
	clr	r2
	addw	rr2,rr4
	movw	rr4,@rr2
	clr	r2
	mov	r3,plyr1_id
	cmp	r3,#janet_id
	br	ule,table1_id
	sub	r3,#janet_id+1
table1_id:
	sll	r3
	addw	rr4,rr2
	movw	rr6,@rr4
	call	comp_p1_kick_st
	br	ne,p1_normal_move
	addw	rr6,#02
	movw	rr0,@rr6
	movw	decode_ptr1,rr0
	ret

p1_normal_move:

	movw	plyr1_ptr,rr6
	mov	r0,(rr6)+		;total sequence timer value.
	mov	plyr1_acttmr1b,r0
	mov	r0,#0
	mov	plyr1_acttmr1a,r0
	mov	r1,(rr6)+		;totol sequence no.
	mov	plyr1_total_seq,r1
	movw	plyr1_seq_ptr,rr6
	mov	plyr1_seq_no,#00
	mov	r0,#1
	mov	plyr1_acttmr0,r0	;start action timer

p1_up_next_seq:


p1_inc_seq:

	mov	mmu4,plyr1_bankno
	inc	plyr1_seq_no
	bset	decode_info,#bit0
	movw	rr2,plyr1_seq_ptr
	movw	rr4,(rr2)+
	call	comp_p1_kick_st
	br	eq,p1_skip_ptr
	movw	decode_ptr1,rr4 	;bmp pointer.

p1_skip_ptr:

	mov	r0,(rr2)+
	mov	plyr1_disp_x,r0 	;x velocite
	mov	r0,(rr2)+
	mov	plyr1_disp_y,r0 	;y velocite
	mov	r0,DMG_timer
	mov	plyr1_loopx,r0		;init new loop counter x
	mov	plyr1_loopy,r0		;init new loop counter y
	mov	r0,(rr2)+
	mov	plyr1_seqtmr1b,r0	;init the seq timer
	mov	r0,#0
	mov	plyr1_seqtmr1a,r0
	mov	r1,plyr1_disp_x
	movw	rr4,#plyr1_x
	mov	r6,#max_width
	mov	r8,#0
	bmov	bf,plyr1_info2,#3
	bmov	r8,#0,bf
	call	update_offset		;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
	movw	plyr1_seq_ptr,rr2	;update the seq ptr
	mov	r1,plyr1_disp_y
	movw	rr4,#plyr1_y
	mov	r6,#max_height
	mov	r8,#1			;assume +ve y_offset
	call	update_offset		;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
	movw	plyr1_seq_ptr,rr2	;update the seq ptr
	mov	r0,#01
	mov	plyr1_seqtmr0,r0
	ret


comp_p1_kick_st:

	cmp	plyr1_status,#st_jump_kick_Up
	br	eq,p1_change_bmp
	cmp	plyr1_status,#st_jump_kick_F
	br	eq,p1_change_bmp
	cmp	plyr1_status,#st_jump_kick_B
p1_change_bmp:
	ret

;ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·
;º    player 2 new action init	   º
;ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ½

plyr2_init:

	mov	r3,plyr2_id
	clr	r2
	mult	rr2,#03
	mov	r0,fighter_bank(rr2)
	incw	rr2
	mov	plyr2_bankno,r0
	movw	rr4,fighter_bank(rr2)
	mov	mmu4,plyr2_bankno
	mov	r3,plyr2_status
	clr	r2
	addw	rr2,rr4
	movw	rr4,@rr2
	clr	r2
	mov	r3,plyr2_id
	cmp	r3,#janet_id
	br	ule,p2_table2_id
	sub	r3,#janet_id+1

p2_table2_id:

	sll	r3
	addw	rr4,rr2
	movw	rr6,@rr4
	call	comp_p2_kick_st
	br	ne,p2_normal_move
	addw	rr6,#02
	movw	rr0,@rr6
	movw	decode_ptr2,rr0
	ret

p2_normal_move:

	movw	plyr2_ptr,rr6
	mov	r0,(rr6)+		;total sequence timer value.
	mov	plyr2_acttmr1b,r0
	mov	r0,#0
	mov	plyr2_acttmr1a,r0
	mov	r1,(rr6)+		;totol sequence no.
	mov	plyr2_total_seq,r1
	movw	plyr2_seq_ptr,rr6
	mov	plyr2_seq_no,#00
	mov	r0,#1
	mov	plyr2_acttmr0,r0	;start action timer

p2_up_next_seq:

p2_inc_seq:

	mov	mmu4,plyr2_bankno
	inc	plyr2_seq_no
	bset	decode_info,#bit0
	movw	rr2,plyr2_seq_ptr
	movw	rr4,(rr2)+
	call	comp_p2_kick_st
	br	eq,p2_skip_ptr
	movw	decode_ptr2,rr4 	;bmp pointer.

p2_skip_ptr:

	mov	r0,(rr2)+
	mov	plyr2_disp_x,r0 	;x velocite
	mov	r0,(rr2)+
	mov	plyr2_disp_y,r0 	;y velocite
	mov	r0,DMG_timer
	mov	plyr2_loopx,r0		;init new loop counter x
	mov	plyr2_loopy,r0		;init new loop counter y
	mov	r0,(rr2)+
	mov	plyr2_seqtmr1b,r0	;init the seq timer
	mov	r0,#0
	mov	plyr2_seqtmr1a,r0
	mov	r1,plyr2_disp_x
	movw	rr4,#plyr2_x
	mov	r6,#max_width
	mov	r8,#0
	bmov	bf,plyr2_info2,#3
	bmov	r8,#0,bf
	call	update_offset		;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
	movw	plyr2_seq_ptr,rr2	;update the seq ptr
	mov	r1,plyr2_disp_y
	movw	rr4,#plyr2_y
	mov	r6,#max_height
	mov	r8,#1			;assume +ve y_offset
	call	update_offset		;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
	movw	plyr2_seq_ptr,rr2	;update the seq ptr
	mov	r0,#01
	mov	plyr2_seqtmr0,r0
	ret



comp_p2_kick_st:

	cmp	plyr2_status,#st_jump_kick_Up
	br	eq,p2_change_bmp
	cmp	plyr2_status,#st_jump_kick_F
	br	eq,p2_change_bmp
	cmp	plyr2_status,#st_jump_kick_B

p2_change_bmp:

	ret



;ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·
;º   player 1 movement	  º
;ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ½

plyr1_move:

	movw	rr8,#plyr1_x
	mov	r10,#max_x		;right_bound
	mov	r11,#min_x		;left_bound
	mov	r13,#0
	bmov	bf,plyr1_info2,#3
	bmov	r13,#0,bf
	call	update_disp
	mov	x1_move,r1
	movw	rr8,#plyr1_y
	mov	r10,#lower_bound
	mov	r11,#upper_bound
	mov	r13,#1
	call	update_disp
	ret



;ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·
;º   player 2 movement	  º
;ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ½

plyr2_move:

	movw	rr8,#plyr2_x
	mov	r10,#max_x		;right_bound
	mov	r11,#min_x		;left_bound
	mov	r13,#0
	bmov	bf,plyr2_info2,#3
	bmov	r13,#0,bf
	call	update_disp
	mov	x2_move,r1
	movw	rr8,#plyr2_y
	mov	r10,#lower_bound
	mov	r11,#upper_bound
	mov	r13,#1
	call	update_disp
	ret



;ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·
;º    update player display coordinate.     º
;ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ½

;not_input:
;	 r4  - *_x/ *_y
;	 r5  - *_loopx/*_loopy
;	 r7  - *_disp_x/*_disp_y
;	 rr8 - plyr*_x /weapon*_x

update_disp:
	mov	r4,(rr8)+	;
	incw	rr8
	mov	r5,(rr8)+
	incw	rr8
	mov	r7,@rr8 	;
	mov	r12,r7		;*_disp_x/ *_disp_y
	subw	rr8,#2		;

	mov	r1,DMG_timer
	sub	r1,r5
	mov	r0,#0		;result - rr0

	and	r7,#3fh
	br	eq,no_update
	mov	r6,#0		;result - rr6

	div	rr0,rr6 	;quotient - r1
	cmp	r1,#0		;reminder - r6
	br	eq,no_update

	bset	decode_info,#0
	mov	r0,DMG_timer
	sub	r0,r6
	mov	@rr8,r0 	;rr8 -> *_loop*
	subw	rr8,#2		;rr8 -> *_*

;(14/5_)	cmp	r13,#0
;(14/5_)	br	eq,normal_u
	cmp	r13,#1
	br	eq,normal_u

;....... facing left
abnormal_u:
	bbs	r12,#7,positive_b
	br	negative_b

;....... facing right
normal_u:
	bbc	r12,#7,positive_b
negative_b:
	mov	r5,r4
	sub	r4,r1
	br	c,kkk
	cmp	r4,r11
	br	uge,ok
kkk:
	mov	r4,r11
	br	ok

positive_b:
	mov	r5,r4
	add	r4,r1
	cmp	r4,r10
	br	ule,ok

	mov	r4,r10

ok:
	mov	@rr8,r4
	ret

no_update:
	mov	r1,#0
	ret





;ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·
;º    update player display offset coordinate.	 º
;ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ½

;input:
;	r1  - *_disp_*
;	rr4 - pointer to *_*
;	rr2 - sequence pointer
;	r6  - +ve bound
;	r8  - direction : 1 - face right
;			  0 - face left
;
;output:
;	. update the plyr*_x/plyr*_y/weapon*_x/weapn*_y
;	. increment the sequence pointer
;

update_offset:
	bbc	r1,#6,no_offset
	mov	r0,(rr2)+
	mov	r7,@rr4

	cmp	r8,#1
	br	eq,face_r

face_l:
	bbc	r1,#7,neg_offset
	br	plus_offset
face_r:
	bbs	r1,#7,neg_offset

plus_offset:
	add	r7,r0
	cmp	r7,r6
	br	ule,up_offset
	mov	r7,r6
	br	up_offset

neg_offset:
	sub	r7,r0
	br	nc,up_offset
	mov	r7,#0

up_offset:
	mov	@rr4,r7
no_offset:
	ret




set_status:

	mov	r4,r15
	add	r4,#plyr_status
	mov	@r4,r2
	mov	r4,r15
	add	r4,#plyr_info1
	bset	@r4,#bit0	;set action flag.
	ret








;ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·
;º   If both players are meet, if one side move forward, push the other side º
;º   move. Check block_flag bit0.					     º
;ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ½

block_move:
p1_block_move:

;	 bbc	 plyr1_info2,#bit0,p2_block_move ;forward flag set ?
	call	plyr1_move1

p2_block_move:

;	 bbc	 plyr2_info2,#bit0,end_block_move ;forward flag set ?
	call	plyr2_move2

end_block_move:

	ret



;playback sound effect of characters action.

p1_play_snd:

	mov	r3,plyr1_status

play_snd:

	cmp	r3,#st_punch
	br	ult,end_play_snd
	cmp	r3,#st_SPAA
	br	ugt,end_play_snd
	mov	r5,#p_k_miss
	call	speech

end_play_snd:

	ret

p2_play_snd:

	mov	r3,plyr2_status
	br	play_snd




;ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·
;º   decode station    º
;ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ½

decode:
	bbc	uart_info,#bit0,decode2
	call	p2_decode_data
	bbc	uart_info,#bit1,decode2
        bbc     game_info3,#bit0,decode2
        mov     r5,speechnum
	call	speech
decode2:
	bbs	decode_info,#bit0,do_decode
	ret

do_decode:

	bclr	decode_info,#bit0

p1_mode_decode:

IF KEY_CALL
	push	mmu3
	mov	mmu3,#program_bank4
	call	Sky
	call	earthB
	call	BACKGROUND
        bbs     game_info3,#bit2,no_stage
        call    stage1
no_stage:
	pop	mmu3
ENDIF

        bbs     game_info3,#bit2,skip_body
	call	plyr1_decode
	call	plyr1_effect
	call	plyr2_decode
	call	plyr2_effect

IF TEST_STR

	call	status_decode
	call	id_decode
ENDIF

IF KEY_CALL

skip_body:

        call    map_energy
	push	mmu3
	mov	mmu3,#program_bank4
	call	TIME_UP
	pop	mmu3
	push	mmu4
	mov	mmu4,#misc_tbl
	call	map_start_word
	call	ko_word
	call	map_continue
        call    map_gameover
	call	map_name
	call	map_win_point
	call	map_timeout
	call	map_mode_misc
	call	map_armor_body
	call	map_explose
        call    win_animat
	pop	mmu4
ENDIF
	mov	r0,start_word_flag
	bbs	r0,#bit4,no_swap_page
	call	Swap_page
	call	clrdisplaybuffer
no_swap_page:
	ret




plyr1_decode:

	mov	mmu4,plyr1_bankno
	movw	rr2,decode_ptr1
	cmp	plyr1_id,#honey_id		;19/12/1997
	br	ne,p1_honey			;
	mov	r0,p1_armor_ok
	cmp	r0,#00
	br	eq,p1_honey
	addw	rr2,#05 			;
	mov	r0,(rr2)+			;
	bbc	r0,#bit7,p1_honey		;
	addw	rr2,#02 			;
p1_honey:
	mov	r8,plyr1_x
	mov	r9,plyr1_y
	mov	r5,plyr1_info2
	mov	r15,#plyr1_status
	call	plyr_decode
	mov	r0,r8
	mov	p1_disp_x1,r0
	add	r0,r12
	mov	p1_disp_x2,r0
	mov	r0,r9
	mov	p1_disp_y1,r0
	add	r0,r13
	mov	p1_disp_y2,r0
	cmp	plyr1_id,#bahn_id
	br	eq,p1_armor
	cmp	plyr1_id,#mahler_id
	br	eq,p1_armor
	cmp	plyr1_id,#san_id
	br	eq,p1_armor

no_p1_armor:

	ret

p1_armor:

	mov	r0,p1_armor_ok
	cmp	r0,#00
	br	eq,no_p1_armor
	movw	rr4,decode_ptr1
	addw	rr4,#05
	mov	r0,(rr4)+
	bbc	r0,#bit7,p1_skip_byte
	addw	rr4,#02

p1_skip_byte:

	mov	r0,(rr4)+
	mov	r1,p1_disp_x2
	bbc	plyr1_info2,#bit3,p1_l_armor
	sub	r1,r0
	mov	r8,r1
	mov	r0,(rr4)+
	add	r9,r0
	call	getlookupinfo
	sub	r8,r12
	mov	r7,#41h
	mov	r15,#plyr1_status
	call	spc_move_decode
	br	c,end_p1_armor
	mov	r15,#41h
	call	CK_page
	call	Fi_grapha
	ret


p1_l_armor:

	add	r8,r0
	mov	r0,(rr4)+
	add	r9,r0
	call	getlookupinfo
	mov	r7,#composite
	mov	r15,#plyr1_status
	call	spc_move_decode
	br	c,end_p1_armor
	mov	r15,#composite
	call	CK_page
	call	Fi_grapha

end_p1_armor:

	ret





;player 1 special move effect.

plyr1_effect:

	cmp	plyr1_status,#st_SPAA
	br	ne,no_p1_effect
	mov	r0,plyr1_x
	sub	r0,#44
	mov	r8,r0
	mov	r9,#77
	cmp	plyr1_seq_no,#00
	br	ne,chk_effect1
	mov	r0,plyr1_x
	mov	r8,r0
	mov	r9,#77

map_effect0:

	movw	rr4,#IEF_00
	br	map_effect

chk_effect1:

	cmp	plyr1_seq_no,#01
	br	ne,no_p1_effect

map_effect1:

	movw	rr4,#IEF_01

map_effect:

	call	getlookupinfo
	mov	r15,#composite
	call	CK_page
	call	Fi_grapha


no_p1_effect:

	ret


;player 2 special move effect.

plyr2_effect:

	cmp	plyr2_status,#st_SPAA
	br	ne,no_p1_effect
	mov	r0,plyr2_x
	sub	r0,#44
	mov	r8,r0
	mov	r9,#77
	cmp	plyr2_seq_no,#00
	br	eq,map_effect0
	cmp	plyr2_seq_no,#01
	br	eq,map_effect1
	ret


plyr2_decode:

	mov	mmu4,plyr2_bankno
	movw	rr2,decode_ptr2
	cmp	plyr2_id,#honey_id		;19/12/1997
	br	ne,p2_honey			;
	mov	r0,p2_armor_ok
	cmp	r0,#00
	br	eq,p2_honey
	addw	rr2,#05 			;
	mov	r0,(rr2)+			;
	bbc	r0,#bit7,p2_honey		;
	addw	rr2,#02 			;
p2_honey:
	mov	r8,plyr2_x
	mov	r9,plyr2_y
	mov	r5,plyr2_info2
	mov	r15,#plyr2_status
	call	plyr_decode
	mov	r0,r8			;x
	mov	p2_disp_x1,r0
	add	r0,r12			;x + width
	mov	p2_disp_x2,r0
	mov	r0,r9			;y
	mov	p2_disp_y1,r0
	add	r0,r13			;y + height
	mov	p2_disp_y2,r0
	cmp	plyr2_id,#bahn_id
	br	eq,p2_armor
	cmp	plyr2_id,#mahler_id
	br	eq,p2_armor
	cmp	plyr2_id,#san_id
	br	eq,p2_armor
	ret

p2_armor:

	mov	r0,p2_armor_ok
	cmp	r0,#00
	br	eq,no_p2_armor
	movw	rr4,decode_ptr2
	addw	rr4,#05
	mov	r0,(rr4)+
	bbc	r0,#bit7,p2_skip_byte
	addw	rr4,#02

p2_skip_byte:

	mov	r0,(rr4)+
	mov	r1,p2_disp_x2
	bbc	plyr2_info2,#bit3,p2_l_armor
	sub	r1,r0
	mov	r8,r1
	mov	r0,(rr4)+
	add	r9,r0
	call	getlookupinfo
	sub	r8,r12
	mov	r7,#41h
	mov	r15,#plyr2_status
	call	spc_move_decode
	br	c,no_p2_armor
	mov	r15,#41h
	call	CK_page
	call	Fi_grapha

no_p2_armor:

	ret


p2_l_armor:

	add	r8,r0
	mov	r0,(rr4)+
	add	r9,r0
	call	getlookupinfo
	mov	r7,#composite
	mov	r15,#plyr2_status
	call	spc_move_decode
	br	c,no_p2_armor
	mov	r15,#composite
	call	CK_page
	call	Fi_grapha
	ret







IF TEST_STR

status_decode:

	call	text_ab

status_decode2:

	movw	rr12,#status_str
	mov	r8,#01
	mov	r9,#10
	call	Str_abs
	mov	r3,status_buffer
	clr	r2
	movw	rr0,status_no_tbl(rr2)
	movw	rr12,rr0
	mov	r8,#2
	mov	r9,#11
	call	Str_abs
	ret


id_decode:

	movw	rr12,#id_str
	mov	r8,#10
	mov	r9,#10
	call	Str_abs
	mov	r3,plyr1_id
	clr	r2
	mult	rr2,#02
	movw	rr0,id_no_tbl(rr2)
	movw	rr12,rr0
	mov	r8,#10
	mov	r9,#11
	call	Str_abs
	ret

ENDIF

text_ab:
	call	Text_in_A
	bbs	cur_page,#bit0,text_a
	call	Text_in_B
text_a:
	ret


text_abi:
	call	Text_in_A
	bbc	cur_page,#bit0,text_a
	call	Text_in_B
	ret



;
;ÕÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¸
;³	DECODING ROUTINE	³
;ÔÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¾
;	INPUT: rr2 (decode_ptr*)
;	     : plyr1_x, plyr1_y


;input: 	rr2 - decode_ptr
;		r8  - x_coordinate
;		r9  - y_coordinate
;		r5  - plyr_info2,check bit3 for face left or right
;		r15 - addreass of player's decode pointer
;not input:	r4  - delta x

null_pointer:
	ret

plyr_decode:
	cmpw	rr2,#0
	br	eq,null_pointer

	bbc	r5,#bit3,plyr_decode_l
	jmp	plyr_decode_r

;......... player face left
plyr_decode_l:
	mov	r0,(rr2)+	;cg_x

plyr_decode_lx:
	mov	r6,r0		;
	and	r6,#03fh	;displacement

	and	r0,#0c0h	;sign
	br	nz,abnormal_cgx1
	jmp	normal_cgx1

;======= ABNORMAL CASE 1 ==========
abnormal_cgx1:
	cmp	r0,#80h 	;
	jmp	eq,ab_case2

ab_case3:
	mov	r0,(rr2)+	;
	mov	r12,r0		;width
	mov	r0,(rr2)+
	mov	r13,r0		;height
	mov	r0,(rr2)+
	mov	r10,r0		;source_x
	mov	r0,(rr2)+
	mov	r11,r0		;source_y

	sub	r9,r13		;dest_y ??

	mov	r0,r6		;cgx
	add	r0,r12		;cgx+width
	cmp	r0,r8
	br	ugt,ab_lcase3_ab

;======= FACE LEFT CASE 3 NORMAL =======
ab_lcase3_n:
	sub	r8,r0		;new dest_x
	br	abnormal_ok1

;======= FACE LEFT CASE 3 ABNORMAL =======
ab_lcase3_ab:
	cmp	r6,r8
	br	uge,map_nothing

	mov	r0,r8
	mov	r8,#0		;new dest_x

	sub	r0,r6		;delta width
	sub	r12,r0		;
	mov	r10,r12 	;new source_x

	mov	r12,r0		;
	inc	r12		;new width
	br	abnormal_ok1

map_nothing:
	ret

;======= FACE LEFT CASE 2 =======
ab_case2:
	mov	r0,(rr2)+	;
	mov	r12,r0		;width
	mov	r0,(rr2)+
	mov	r13,r0		;height
	mov	r0,(rr2)+
	mov	r10,r0		;source_x
	mov	r0,(rr2)+
	mov	r11,r0		;source_y

	sub	r9,r13		;

	add	r8,r6			;new dest_x
	cmp	r8,#max_width		;
	br	uge,map_nothing 	;

	mov	r0,r8			;
	add	r0,r6			;(27/5_)
	add	r0,r12			;x_coordinate + width
	cmp	r0,#max_width		;
	br	ule,abnormal_ok1	;

	mov	r0,#max_width		;
	sub	r0,r8			;
	mov	r12,r0			;new width
	inc	r12			;

abnormal_ok1:
	jmp	plyr1_decode1c

;======= NORMAL CASE 2 ==========
normal_cgx1:
	mov	r0,r6
	cmp	r8,r0
	br	uge,ok_dest_x

set_delta_x:
	sub	r0,r8
	mov	r4,r0		;delta_x
	mov	r8,#0
	br	plyr_decode1a
ok_dest_x:
	mov	r4,#0
	sub	r8,r0		;new_dest_x

plyr_decode1a:
	mov	r0,(rr2)+
	mov	r12,r0		;width
	mov	r0,(rr2)+
	mov	r13,r0		;height
	mov	r0,(rr2)+
	mov	r10,r0		;source_x
	mov	r0,(rr2)+
	mov	r11,r0		;source_y

	sub	r9,r13

;........ check delta_x
	cmp	r4,#0
	br	eq,plyr_decode1b

	cmp	r12,r4		;
	br	uge,yyy 	;
	ret			;
yyy:
	sub	r12,r4		;dec. width
;(8/7_)        inc     r12	       ;daniell
	add	r10,r4		;dec. source_x
	br	plyr1_decode1c

;........ zero delta_x
;........ check width + dest_x
plyr_decode1b:
	mov	r7,r8			;new_dest_x
	add	r7,r12			;new_dest_x + width
	cmp	r7,#max_width
	br	ule,plyr1_decode1c

	mov	r12,#max_width
	sub	r12,r8			;new_width
	inc	r12			;daniell

plyr1_decode1c:
	mov	r0,(rr2)+
	and	r0,#7fh 	;
	mov	r14,r0		;bank no.
	mov	r7,#composite
	call	spc_move_decode
	br	c,end_decode1
	mov	r15,#composite
	call	CK_page
	call	Fi_grapha
end_decode1:
	ret


CK_page:
	cmp	cur_page,#1
	br	eq,back_page_a
	bset	r15,#1
back_page_a:
	ret



;input: 	rr2 - decode_ptr
;		r8  - x_coordinate
;		r9  - y_coordinate
;		r5  - plyr_info2,check bit3 for face left or right
;not input:	r4  - delta x
;		r6  - cg_x

plyr_decode_r:
	mov	r0,(rr2)+	;cg_x
plyr_decode_rx:
	mov	r6,r0
	and	r6,#03fh	;displacement
	and	r0,#0c0h	;sign
	br	nz,abnormal_cgx2
	jmp	normal_cgx2

;======= MIRROR CASE 1 ==========
abnormal_cgx2:
	cmp	r0,#80h 	;
	jmp	eq,abm_case2	;

;======= FACE RIGHT CASE 3 =======
ab_rcase3:
	mov	r0,(rr2)+
	mov	r12,r0		;width
	mov	r0,(rr2)+
	mov	r13,r0		;height
	mov	r0,(rr2)+
	mov	r10,r0		;source_x
	mov	r0,(rr2)+
	mov	r11,r0		;source_y
	mov	r0,(rr2)+
	and	r0,#7fh
	mov	r14,r0		;bank no.

	sub	r9,r13		;dest_y

	mov	r0,r8			;
	add	r0,r6			;dest_x+cgx+width
	cmp	r0,#max_width
	br	uge,map_nothing2	;
	add	r0,r12			;
	cmp	r0,#max_width		;
	br	ugt,ab_rcase3_ab

;======= FACE RIGHT CASE 3 NORMAL =======
ab_rcase3_n:
	add	r8,r6			;new dest_x
	br	ab_com1 		;

;======= FACE RIGHT CASE 3 ABNORMAL =======
ab_rcase3_ab:
	add	r8,r6			;new dest_x
	mov	r0,#max_width		;
	sub	r0,r8			;delta_width
	inc	r0			;
	sub	r12,r0			;
	dec	r12
	add	r10,r12 		;new source_x
	mov	r12,r0			;new width
	br	ab_com1 		;

map_nothing2:
	ret

;======= FACE RIGHT CASE 2 =======
abm_case2:
	mov	r0,(rr2)+
	mov	r12,r0		;width
	mov	r0,(rr2)+
	mov	r13,r0		;height
	mov	r0,(rr2)+
	mov	r10,r0		;source_x
	mov	r0,(rr2)+
	mov	r11,r0		;source_y
	mov	r0,(rr2)+

	and	r0,#7fh
	mov	r14,r0		;bank no.

	sub	r9,r13		;new dest. y_coordinate

	mov	r0,r8		;dest. x_coordinate
	sub	r0,r12		;r8 - width - cgx = r8 - width + cgx
	sub	r0,r6		;- cgx
	br	nc,abnormal_ok2 ;

abnormal_nok2:
	com	r0
	add	r0,#1		;
	sub	r12,r0		;
	br	c,map_nothing2	;
	inc	r12		;new width
	mov	r8,#0		;new dest. x_coordinate
	br	ab_com1

abnormal_ok2:
	mov	r8,r0		;new dest. x_coordinate
ab_com1:
	jmp	plyr_decode2a

;======= MIRROR CASE 2 ==========
normal_cgx2:
	mov	r0,(rr2)+
	mov	r12,r0		;width
	mov	r0,(rr2)+
	mov	r13,r0		;height
	mov	r0,(rr2)+
	mov	r10,r0		;source_x
	mov	r0,(rr2)+
	mov	r11,r0		;source_y
	mov	r0,(rr2)+
	and	r0,#7fh 	;
	mov	r14,r0		;bank no.

	sub	r9,r13

	mov	r5,r12		;width
	sub	r5,r6		;width - cg_x
	br	nc,rrr
	ret
rrr:
	cmp	r8,r5
	br	uge,no_delta_x1
delta_x1:
	add	r8,r6		;delt_x = cg_x + dest_x(old)

	mov	r12,r8		;new_width
	inc	r12		;daniell
	mov	r8,#0		;dest_x
	br	plyr_decode2a

no_delta_x1:
	sub	r8,r5			;new_dest_x

	mov	r5,r12			;width
	add	r5,r8			;width+dest_x
	cmp	r5,#max_width		;
	br	ule,plyr_decode2a

	mov	r5,#max_width
	sub	r5,r8
	inc	r5			;new_width

	mov	r6,r12			;old width
	sub	r6,r5			;old width - new_width
	add	r10,r6			;new_source_x
	mov	r12,r5			;new_width ;daniell

plyr_decode2a:

	mov	r7,#composite+mirror_v
	call	spc_move_decode
	br	c,end_decode2
	mov	r15,#composite+mirror_v
	call	CK_page
;	 cmp	 cur_page,#1
;	 br	 eq,back_a1
;back_b1:
;	 bset	 r15,#1
;back_a1:
	call	Fi_grapha

end_decode2:

	ret




;special handle player 1 special move decode.
;input registers : r7 - decode option flag (equal to r15 in Fi_graph)
;		 : r15 - pointer to plyr_status.

spc_move_decode:

	mov	r0,r15
	cmp	@r0,#st_SPAA
	br	ne,normal_decode
	add	r0,#03	       ;r15 point to plyr_seq_no
	cmp	@r0,#01
	br	ne,normal_decode
	mov	r15,r7
	call	CK_page
	push	dmpl		;fill character bmp with white color.
	mov	dmpl,#00
	call	Fi_graph
	pop	dmpl
	setc
	ret

normal_decode:

	clrc
	ret




Fi_grapha:

	push	dmpl
	mov	dmpl,#0c4h
	call	Fi_graph
	pop	dmpl
	ret

clrdisplaybuffer:

	btst	cur_page,#01
	br	nz,clrbufferA
	call	clear_B
	ret
clrbufferA:
	call	clear_A
	ret


Fi_graphx:
	push	r15
	call	Fi_graph
	pop	r15

	mov	r1,dmc_image
	bbc	r15,#6,next1

lr_mirror:
	bset	dmc_image,#4

next1:
	bbc	r15,#7,next2
	bset	dmc_image,#5

next2:

fi_white:
	mov	r0,dmpl
	mov	dmpl,#0
	inc	dmbr
	push	ps1
	di
	push	ie0
	push	ie1
	mov	ie0,#80h
	clr	ie1
	mov	dmc,dmc_image		;change later for mirror
	bclr	dmc,#0			;composite mode
	halt
	bclr	ir0,#7
	pop	ie1
	pop	ie0
	pop	ps1
	mov	dmpl,r0
	mov	dmc_image,r1
	ret



;gen random number
;input : no.
;output : r13
;registers used : r5,rr6,r13

random:
	call	random_loop
	movw	rr6,#plyr1_acttmr0

random_loop:

	mov	r5,(rr6)+
	add	r13,r5
	cmpw	rr6,#GAME_TIMER1B
	br	ule,random_loop
	mov	r5,DMG_timer
	add	r13,r5
	ret


;gen random number
;input : no.
;output : r13
;registers used : r5,rr6,r13

random2:
	addw	rr6,rr0
	addw	rr6,rr2
	addw	rr6,rr4
	call	random
	mult	r13,r5
	ret



getlookupinfo:

	movw	rr12,(rr4)+		;width & height
	movw	rr10,(rr4)+		;source xy
	mov	r1,@rr4 		;origin bank num
	mov	r14,r1
	RET


;fighter with armor ?

armor_fighter:

	mov	r0,r15
	add	r0,#plyr_id
	cmp	@r0,#bahn_id
	br	ult,no_armor_f

yes_armor_f:

	setc
	ret

no_armor_f:

	clrc
	ret




jmp_record_show:

	push	mmu3
	push	mmu4
	mov	mmu3,#program_bank3
	mov	mmu4,#table2_bank
	call	record_show
	pop	mmu4
	pop	mmu3
	ret

p2_win_game2a:
	push	mmu3
	push	mmu4
	mov	mmu3,#program_bank3
	mov	mmu4,#table2_bank
	mov	r0,Msel_ram
	cmp	r0,#survival_mode
	br	eq,set_new_record2
	cmp	r0,#one_player_mode
	br	ne,p2_win_game2
	mov	mmu3,#program_bank5
	call	NEW_RECORD2		;p1 mode record update.
	br	p2_win_game2

set_new_record2:

	mov	mmu3,#program_bank5
	call	NEW_RECORD1		;survival mode record update.

p2_win_game2:

	pop	mmu4
	pop	mmu3
	ret



win_animat:

        bbc     game_info3,#bit2,quit_win
        mov     r0,Msel_ram
	cmp	r0,#00
	br	ne,quit_win
        call    win_picture
quit_win:
	ret



fighter_bank:

	db	table1_bank	    ;akira_id
	dw	group1
	db	table1_bank	    ;pai_id
	dw	group1
	db	table1_bank	    ;jacky_id
	dw	group1
	db	table1_bank	    ;kids_id
	dw	group1
	db	table1_bank	    ;lion_id
	dw	group1
	db	table1_bank	    ;siba_id
	dw	group1
	db	table1_bank	    ;hornet_id
	dw	group1
	db	table1_bank	    ;janet_id
	dw	group1
	db	table2_bank	    ;bahn_id
	dw	group2
	db	table2_bank	    ;san_id
	dw	group2
	db	table2_bank	    ;honey_id
	dw	group2
	db	table2_bank	    ;mahler_id
	dw	group2
	db	table2_bank	    ;honey-s_id
	dw	group2



;special move effect bmp table.

IEF_00:

defb	88,83,45,173,bankno_ALL017	;EF-00

IEF_01:

defb	88,83,133,173,bankno_ALL017	;EF-01





IF TEST_STR

status_str:

	defm	'status'
	db	0

id_str:
	defm	'id'
	db	0


status_no_tbl:

	dw	status_0
	dw	status_2
	dw	status_4
	dw	status_6
	dw	status_8
	dw	status_10
	dw	status_12
	dw	status_14
	dw	status_16
	dw	status_18
	dw	status_20
	dw	status_22
	dw	status_24
	dw	status_26
	dw	status_28
	dw	status_30
	dw	status_32
	dw	status_34
	dw	status_36
	dw	status_38
	dw	status_40
	dw	status_42
	dw	status_44
	dw	status_46
	dw	status_48
	dw	status_50
	dw	status_52
	dw	status_54
	dw	status_56
	dw	status_58
	dw	status_60
	dw	status_62
	dw	status_64
	dw	status_66
	dw	status_68



status_0:
	defm	'0'
	db	0
status_2:
	defm	'2'
	db	0
status_4:
	defm	'4'
	db	0
status_6:
	defm	'6'
	db	0
status_8:
	defm	'8'
	db	0
status_10:
	defm	'10'
	db	0
status_12:
	defm	'12'
	db	0
status_14:
	defm	'14'
	db	0
status_16:
	defm	'16'
	db	0
status_18:
	defm	'18'
	db	0
status_20:
	defm	'20'
	db	0
status_22:
	defm	'22'
	db	0
status_24:
	defm	'24'
	db	0
status_26:
	defm	'26'
	db	0
status_28:
	defm	'28'
	db	0
status_30:
	defm	'30'
	db	0
status_32:
	defm	'32'
	db	0
status_34:
	defm	'34'
	db	0
status_36:
	defm	'36'
	db	0
status_38:
	defm	'38'
	db	0
status_40:
	defm	'40'
	db	0
status_42:
	defm	'42'
	db	0
status_44:
	defm	'44'
	db	0
status_46:
	defm	'46'
	db	0
status_48:
	defm	'48'
	db	0
status_50:
	defm	'50'
	db	0
status_52:
	defm	'52'
	db	0
status_54:
	defm	'54'
	db	0
status_56:
	defm	'56'
	db	0
status_58:
	defm	'58'
	db	0
status_60:
	defm	'60'
	db	0
status_62:
	defm	'62'
	db	0
status_64:
	defm	'64'
	db	0
status_66:
	defm	'66'
	db	0
status_68:
	defm	'68'
	db	0

id_no_tbl:

	dw	id_00
	dw	id_01
	dw	id_02
	dw	id_03
	dw	id_04
	dw	id_05
	dw	id_06
	dw	id_07
	dw	id_08
	dw	id_09
	dw	id_10
	dw	id_11
	dw	id_12

id_00:
	defm	'AKIRA'
	DB	0

id_01:
	defm	'PAL'
	db	0

id_02:
	defm	'JACKY'
	db	0

id_03:
	defm	'KID'
	db	0

id_04:
	defm	'LION'
	db	0

id_05:
	defm	'SIBA'
	db	0

id_06:
	defm	'HORNET'
	db	0
id_07:
	defm	'JANET'
	DB	0

id_08:
	defm	'BAHN'
	DB	0

id_09:
	defm	'SAN'
	DB	0

id_10:
	defm	'HONEY'
	DB	0

id_11:
	defm	'MAHLER'
	db	0

id_12:
	defm	'HONEY'
	db	0


ENDIF

rec_decode_datax:

	jmp	rec_decode_data

p2_decode_data:

	clr	r14
	bclr	uart_info,#bit4
        movw    rr10,#00
        movw    rr2,#35
	bbs	uart_info,#bit1,rec_decode_datax

p2_decode_data2:

        bbs     uart_info,#bit3,p2_decode_data3
        call    wait_count
        jmp     c,open_connect

p2_decode_data3:

	mov	r1,p3
	bset	r1,#bit0
	mov	p3,r1
	bbc	r1,#bit2,p2_decode_data2
	mov	r0,#5ah

send_header1:


send_header1a:

	call	Send_a_byte
	br	c,send_header1
	mov	r0,#0a5h

send_header2:
send_header2a:

	call	Send_a_byte
	br	c,send_header2

send_loop:

	mov	r1,pack_tbl1(rr2)
	decw	rr2
	decw	rr2
	br	mi,end_send_data
	movw	rr6,pack_tbl1(rr2)
	decw	rr2

send_loop1:

	mov	r0,(rr6)+

send_loop3:


send_header3a:

	call	Send_a_byte
	br	c,send_loop3
	add	r14,r0
	dec	r1
	br	nz,send_loop1
	br	send_loop

end_send_data:

	mov	r0,r14
	call	Send_a_byte		;send checksum byte.
	br	c,end_send_data
        movw    rr10,#00

end_send_data1:

        bbs     uart_info,#bit3,end_send_data2
        call    wait_count
        jmp     c,open_connect

end_send_data2:

        mov     r0,p3
        and     r0,#0ch
        cmp     r0,#0ch
        br      ne,end_send_data3
        or      p3,#03
        bset    uart_info,#bit4

end_send_data3:

        btst    p3,#0ch
	br	ne,end_send_data1
        and     p3,#0fch
	ret





rec_decode_data:

        bbs     uart_info,#bit3,rec_decode_data2
        call    wait_count
        jmp     c,open_connect

rec_decode_data2:

	mov	r1,p3
	bbc	r1,#bit2,rec_decode_data
	bset	r1,#bit0
	mov	p3,r1
	movw	rr4,#0
	mov	r8,r4
        movw    rr10,#0

receive_header1:

	incw	rr4
	cmpw	rr4,#180h
	jmp	ugt,rec_loop3

receive_header1a:

	call	Receive_a_byte
	br	c,receive_header1
	cmp	r0,#5ah
	br	ne,receive_header1
	movw	rr4,#00

receive_header2:

	incw	rr4
	cmpw	rr4,#180h
	br	ugt,rec_loop3

receive_header2a:

	call	Receive_a_byte
	br	c,receive_header2
	cmp	r0,#0a5h
	br	ne,receive_header2
	clr	r9

rec_loop:
	mov	r1,pack_tbl1(rr2)
	decw	rr2
	decw	rr2
	br	mi,rec_end
	movw	rr6,pack_tbl1(rr2)
	decw	rr2

rec_loop2:

	incw	rr4
	cmpw	rr4,#180h
	br	ugt,rec_loop3
	btst	uart_ram,#18h
	br	ne,rec_loop3

rec_loop2a:

	call	Receive_a_byte
	br	c,rec_loop2
	add	r14,r0
	movw	rr4,#00
	mov	(rr6)+,r0
	inc	r9
	dec	r1
	br	nz,rec_loop2
	br	rec_loop


rec_end:
	incw	rr4
	cmpw	rr4,#180h
	br	ugt,rec_loop3
	call	Receive_a_byte
	br	c,rec_end
	cmp	r14,r0
	br	ne,rec_loop3
        cmp     r9,#68                  ;total byte send
        br      eq,rec_end2a

rec_loop3:

	bclr	decode_info,#bit0
	bset	uart_info,#bit4 	;set slave recevie not enough byte
        or      p3,#03h

rec_end2a:

        bbc     uart_info,#bit4,rec_end2
        mov     r1,p3
        and     r1,#0ch
        cmp     r1,#0ch
        br      ne,rec_end2a


rec_end2:

        bbs     uart_info,#bit3,rec_end2b
        call    wait_count
        jmp     c,open_connect

rec_end2b:

        and     p3,#0fch
        btst    p3,#0ch
        br      ne,rec_end2
        bbc     uart_info,#bit4,rec_end3
        movw    rr4,#00
rec_loop4:
	incw	rr4
	cmpw	rr4,#180h
	br	ult,rec_loop4
	CALL	Reset_UART_queue

rec_end3:

	ret






open_connect:

        call    end_h2h
        bclr    game_info2,#bit7
	bclr	decode_info,#bit0

open_message:

	movw	rr0,#20h
	movw	gen_timer1,rr0
	mov	r0,#01
	mov	gen_timer0,r0
	call	clr_screen
	call	text_abi
	movw	rr12,#connect_err
	mov	r8,#5
	mov	r9,#4
	call	Str_abs

err_loop:

	call	SCAN_KEY
	mov	r0,gen_timer0
	cmp	r0,#00
	br	ne,err_loop
	mov	r0,#01
	mov	open_con,r0
	ret


connect_err:

	defm	"connection error"
	db	00





;ÕÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¸
;³		HEAD TO HEAD			   ³
;ÔÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¾
SIO_SETUP	EQU	00100101B	;1 N 8 AT  19200
SIO_ENABLE	EQU	00111111B	;USE APP. RXQ AND APP. TXQ
SIO_DISABLE	EQU	00000000B
READY		EQU	$E0
DHEADER 	EQU	$E3
KHEADER 	EQU	$EF
BHEADER 	EQU	$D1
CONFIRM 	EQU	$5A
P1HEADER	EQU	$3A
P2HEADER	EQU	$A3


;/////// SETUP THE UART FOR H2H ///////////////
h2h_setup:
	MOV	R0,#SIO_SETUP
	CALL	UART_setup

	CALL	init_new_uart

	MOV	R0,#SIO_ENABLE
	MOVW	RR2,#0f400h	       ;TXQ START AT   $f400h
	MOVW	RR8,#0ffH	       ;TXQ LENGTH     $ff
	MOVW	RR4,#0f500h	       ;RXQ START AT   $f500h
	MOVW	RR10,#0ffH	       ;RXQ LENGTH     $ff
	CALL	UART_enable
	CALL	Reset_UART_queue
	ret



pack_tbl1:

pack1:
	dw	ramAA		;221h
	db	6

pack2:
	dw	ram_BG		;227h
	db	7

pack3:
	dw	p2_win_times	;25bh
	db	5

pack4:
	dw	stage_num	;255h
	db	6

pack5:
        dw      ramBB           ;eeh
	db	02

pack6:
	dw	p1_energy	;232h
	db	8

pack7:
        dw      energy_count    ;23ah
        db      8

pack8:
	dw	plyr2_id	;deh
	db	5

pack9:
	dw	decode_ptr2	;d6h
	db	4

pack10:
	dw	plyr1_id	;cah
	db	5

pack12:
	dw	decode_info	;beh
	db	8

pack11:
	dw	game_info	;f6h
	db	4












refill_energy:

	mov	r1,#full_energy
	mov	p1_energy,r1
	mov	p2_energy,r1
	mov	p1_energy_buf,r1
	mov	p2_energy_buf,r1
	ret







armor_init:

	mov	r0,Msel_ram
	cmp	r0,#survival_mode
	br	eq,p2_armor_init2

armor_init2:

	call	p2_armor_init2

p1_armor_init2:

	clr	r0
	mov	p1_armor_ok,r0
	mov	p1_armour1,r0
	mov	r15,#decode_ptr1
	call	armor_fighter
	br	nc,no_armor_init
	mov	r0,#01
	mov	p1_armor_ok,r0
	mov	r0,#0ah
	mov	p1_armour1,r0
	ret

p2_armor_init2:

	clr	r0
	mov	p2_armor_ok,r0
	mov	p2_armour1,r0
	mov	r15,#decode_ptr2
	call	armor_fighter
	br	nc,no_armor_init
	mov	r0,#01
	mov	p2_armor_ok,r0
	mov	r0,#0ah
	mov	p2_armour1,r0

no_armor_init:

	ret






end_h2h:
	clr	r0
	mov	master_cur_key,r0
	mov	slave_cur_key,r0
	push	mmu3
	mov	mmu3,#program_bank2
	call	p2_win_game
        bclr    game_info2,#bit7
        pop     mmu3
	mov	r0,#04
	mov	Msel_ram,r0
	bclr	game_info,#bit3

end_h2h_init:

	mov	r0,p3
	and	r0,#0f0h
	mov	p3,r0
        clr     r0
	mov	uart_info,r0
	mov	temp_ctrl,r0
	mov	temp_quit,r0
	mov	quit_flag,r0
	mov	temp_key,r0
	mov	temp_key2,r0
	mov	r0,#16h
	mov	temp2,r0
	mov	r0,#80h
	mov	option_ram,r0
	mov	r0,#20h
	mov	control_ram,r0
	call	Reset_UART_queue
	mov	r0,game_info
	mov	tmp_game_info,r0
        call    stop_melody
	ret


end_h2h_game:

        bbc     uart_info,#bit0,no_h2h_game
        clr     r0
	mov	temp_ctrl,r0
	mov	temp_quit,r0
	mov	quit_flag,r0
	mov	temp_key,r0
	mov	temp_key2,r0
        mov     OPT_ramA,r0
	mov	r0,#16h
	mov	temp2,r0
	mov	r0,#0c0h
	mov	option_ram,r0
	mov	r0,#20h
	mov	control_ram,r0
        bclr    uart_info,#bit4
        call    Reset_UART_queue
	mov	r0,game_info
	mov	tmp_game_info,r0
        call    stop_melody

no_h2h_game:

	ret



h2h_timer:
	pushw	rr2
	push	r0
	clr	r2
	mov	gen_timer0,r2
	movw	rr2,#18h
	movw	gen_timer1,rr2
	mov	r2,#01
	mov	gen_timer0,r2
	pop	r0
	popw	rr2
	ret



transmit_key:

	clr	r8
        movw    rr10,#00

transmit_key2:

        bbs     uart_info,#bit3,transmit_key3
        call    wait_count
        jmp     c,open_connect

transmit_key3:

	mov	r1,p3
	bset	r1,#bit1
	mov	p3,r1
	bbc	r1,#bit3,transmit_key2

transmit_sig1:

        mov     r0,#0aah
        call    Send_a_byte
        br      c,transmit_sig1

transmit_sig2:

        mov     r0,#55h
        call    Send_a_byte
        br      c,transmit_sig2

transmit_loop:

	mov	r0,key2
	call	Send_a_byte
	br	c,transmit_loop
	mov	r0,cur_key
	bbc	uart_info,#bit2,transmit_loop2
	mov	r0,#a_key

transmit_loop2:

	call	Send_a_byte
	br	c,transmit_loop2
	movw	rr4,#00

transmit_loop3:

	incw	rr4
	cmpw	rr4,#180h
	br	ugt,transmit_loop3x
	call	Receive_a_byte
	br	c,transmit_loop3
	br	transmit_loop3a

transmit_loop3x:

	mov	r8,#0ffh
        bset    uart_info,#bit4
        clr     r0

transmit_loop3a:

        mov     master_cur_key,r0
        movw    rr4,#00

transmit_loop4:

	incw	rr4
        cmpw    rr4,#280h
        br      ugt,transmit_l

transmit_loop5:

	call	Receive_a_byte
	br	c,transmit_loop4
	cmp	r0,#0ffh
	br	ne,transmit_loop4
transmit_l:
        bbs     p3,#bit3,transmit_l
        and     p3,#0fch

clr_q_chk:

;        cmp     r8,#00
;        br      eq,end_trans_key

transmit_loop6:

	call	Reset_UART_queue

end_trans_key:

	ret








receive_key:

	clr	r8
        movw    rr10,#00

receive_key2:

        bbs     uart_info,#bit3,receive_key3
        call    wait_count
        jmp     c,open_connect

receive_key3:

        bbc     p3,#bit3,receive_key2
        bset    p3,#bit1
	movw	rr4,#00

receive_sig1:

	incw	rr4
	cmpw	rr4,#180h
        br      ugt,receive_fail
        call    Receive_a_byte
        br      c,receive_sig1
        cmp     r0,#0aah
        br      ne,receive_sig1
        movw    rr4,#00

receive_sig2:

        incw    rr4
	cmpw	rr4,#180h
        br      ugt,receive_fail
        call    Receive_a_byte
        br      c,receive_sig2
        cmp     r0,#055h
        br      ne,receive_sig2
        movw    rr4,#00

receive_loop:

	incw	rr4
	cmpw	rr4,#180h
	br	ugt,receive_loop1x
	call	Receive_a_byte
	br	c,receive_loop
	br	receive_loop1

receive_loop1x:

	mov	r8,#0ffh
        bset    uart_info,#bit4
        clr     r0

receive_loop1:

	mov	slave_key,r0
	movw	rr4,#00

receive_loop2:

	incw	rr4
	cmpw	rr4,#180h
	br	ugt,receive_loop2x
	call	Receive_a_byte
	br	c,receive_loop2
	br	receive_loop2a

receive_loop2x:

	mov	r8,#0ffh
        bset    uart_info,#bit4
        clr     r0

receive_loop2a:

	mov	slave_cur_key,r0

receive_loop3:

	mov	r0,cur_key
	bbc	uart_info,#bit2,receive_loop3a
	mov	r0,#a_key

receive_loop3a:

	call	Send_a_byte
        br      c,receive_loop3a
	mov	r0,#0ffh

receive_loop4:

	call	Send_a_byte
        br      c,receive_loop4
        br      receive_l


receive_l:
        and     p3,#0fch
        bbs     p3,#bit3,receive_l
        jmp     clr_q_chk


receive_fail:

        mov     r8,#0ffh
        bset    uart_info,#bit4
        br      receive_l




wait_count:


        incw    rr10
        cmpw    rr10,#0fff0h
        br      ult,wait_count1
        movw    rr10,#0
        setc
        ret

wait_count1:

        clrc
        ret



;handle head to head mode press function key.

h2h_fun_key:

	bbc	uart_info,#bit1,slave_fun_key	;master / slave ?

;slave check master press function key.

master_fun_key:

        mov     r0,master_cur_key

com_fun_key:

	bbc	uart_info,#bit3,com_fun_key2
	cmp	r0,#a_key
	br	ne,com_fun_key2
	bset	uart_info,#bit2
	br	no_fun_key


        ds      10h
sec00:  db      5ah

com_fun_key2:

	cmp	r0,#menu_key
	br	eq,h2h_menu_key
	cmp	r0,#on_off_key
	br	eq,h2h_onoff_key
	cmp	r0,#pause_key
	br	eq,h2h_pause_key
	cmp	r0,#mute_key
	br	ne,no_fun_key

h2h_pause_key:
h2h_menu_key:

        call    wait_screen2
	mov	r0,#00
	mov	master_cur_key,r0
	mov	slave_cur_key,r0
	bset	uart_info,#bit3
        call    stop_melody

h2h_onoff_key:

	setc
	ret

no_fun_key:

	bclr	uart_info,#bit3
	clrc
	ret


;master check slave press function key.

slave_fun_key:

	mov	r0,slave_cur_key
	br	com_fun_key



wait_screen2:

	call	clr_screen
        call    text_abi
	movw	rr12,#wait_list1
	bbs	uart_info,#bit1,wait_screen2b
	movw	rr12,#wait_list2
	br	wait_screen2b


wait_screen2b:

	mov	r8,#4
	mov	r9,#4
	call	Str_abs
	ret


clr_screen:

	mov	r8,#00h
	bbc	cur_page,#bit0,wait_screen2a
	mov	r8,#10h

wait_screen2a:

	call	Scn_colr
	mov	r8,#01
	call	Sel_font
	call	Text_in_A
	bbc	cur_page,#bit0,text_screen
	call	Text_in_B

text_screen:

	ret


wait_list1:

	defm	"wait for player 1"
	db	00



wait_list2:

	defm	"wait for player 2"
	db	00






open_h2h:

	push	mmu3
	mov	mmu3,#program_bank4
	call	open_h2hx
	pop	mmu3
	ret




exchg_open:

        push    mmu3
        mov     mmu3,#program_bank4
        call    exchg_openx
        pop     mmu3
        ret




open_connectx:

        call    open_message
	mov	r0,#01h
	mov	temp_quit,r0
	ret



off_wait:

	mov	r0,cur_key
	cmp	r0,#on_off_key
	br	ne,no_off_wait
	call	clrdisplaybuffer
	call	Swap_page
	call	clrdisplaybuffer
	call	Swap_page
	clr	r0
	mov	gen_timer0,r0
	movw	rr0,#02
	movw	gen_timer1,rr0
	mov	r0,#01
	mov	gen_timer0,r0

off_wait_loop:

        call    SCAN_KEY
        mov     r0,gen_timer0
	cmp	r0,#00
	br	ne,off_wait_loop

no_off_wait:

	ret



high_score_init:

	movw	rr0,#fighter_id
	clr	r2
	call	MemoryBlkReq		;request high score system block
        br      nc,old_blk
	br	new_blk


new_blk:
        movw    rr4,#fight_rec
inithss2:
	mov	r2,(rr4)+		;init title and score
	mov	(rr0)+,r2
	cmp	r2,#00h
	br	ne,inithss2		;destination end address
        addw    rr0,#03

rec_flag_init:

	bclr	game_info2,#bit5
	mov	r2,@rr0
	cmp	r2,#5ah
	br	eq,end_flag_init
	bset	game_info2,#bit5
	mov	r2,#5ah
        mov     @rr0,r2

end_flag_init:

	ret


old_blk:
	pushw	rr0
	addw	rr0,#15
        call    rec_flag_init
	popw	rr0
	addw	rr0,#internet_offset	;check internet download code.
	movw	rr2,(rr0)+
	movw	rr6,#0a5a5h		;compare internet download sign.
	cmpw	rr2,rr6
	br	ne,reload_hidden
        movw    rr4,#internet1

load_internet:

	mov	r2,(rr0)+
	mov	(rr4)+,r2
	cmpw	rr4,#internet4
	br	ule,load_internet
	br	reload_hidden2


reload_hidden:

	addw	rr0,#04

reload_hidden2:

	mov	r2,(rr0)+		;load hidden fighter code.
	mov	hidden_ram,r2
	movw	rr4,#Record_3min

reload_loop:

	mov	r2,(rr0)+		;reload record.
	mov	(rr4)+,r2
	cmpw	rr4,#Record_name15
	br	ule,reload_loop
        clr     r1
        mov     r0,internet1
        or      r1,r0
        mov     r0,internet2
        or      r1,r0
        mov     r0,internet3
        or      r1,r0
        mov     internet_flag,r1

end_score_init:

	ret

;high score ram map

;	00h	04	;I.D.
;	01h	26	;I.D.
;	02h	"F"
;       03h     "M"
;       04h     "E"
;       05h     "G"
;       06h     "A"
;       07h     "M"
;       08h     "I"
;       09h     "X"
;       0ah     01
;       0bh     XX      ;MARK
;       0ch     XX      ;MARK
;       0dh     00      ;end of mark.
;       0eh     NOT USE
;       0fh     NOT USE
;       10h     NOT USE
;	11h	5ah	;first time init value.
;	12h	0a5h	;internet init code.
;	13h	0a5h	;internet init code.
;	14h	internet1
;	15h	internet2
;	16h	internet3
;	17h	internet4
;	18h	hidden_ram
;       19h     Record_3min
;	1ah	Record_7min
;	1bh	Record_15min
;	1ch	Record_min1R
;	1dh	Record_sec1R
;	1eh	Record_name1R
;	1fh	Record_course1R
;	20h	Record_min3R
;	21h	Record_sec3R
;	22h	Record_name3R
;	23h	Record_course3R
;	24h	Record_min5R
;	25h	Record_sec5R
;	26h	Record_name5R
;	27h	Record_course5R
;	28h	Record_name3
;	29h	Record_name7
;	2ah	Record_name15
;	2bh
;	2ch
;	2dh
;	2eh
;	2fh
;       30h
;       31h
;       32h
;       33h
;       34h
;       35h
;	36h
;	37h
;	38h
;	39h
;	3ah
;	3bh
;	3ch
;	3dh
;	3eh
;	3fh

fight_rec:

        defm    "FMEGAMIX"
	db	1
        defm    "00"
	db	00





;update high score when quit game.

update_score:

        mov     r0,Record_3min
	mov	high_score,r0
	movw	rr0,#fighter_id
	clr	r2
	call	MemoryBlkReq		;request high score system block
	clr	r2
        addw    rr0,#record_offset
	mov	r6,(rr0)+
	mov	r7,@rr0
	decw	rr0

compare_score:

	mov	r3,high_score
	clr	r2
chk10:
	cmp	r3,#10
	br	ult,to_ascii
	sub	r3,#10
	inc	r2
	br	chk10

to_ascii:

	add	r2,#'0'
	add	r3,#'0'
	cmp	r2,r6
	br	ult,nor_update
	br	ugt,save_ascii
	cmp	r3,r7		;r2=r6
	br	ugt,save_ascii
nor_update:
	clrc
        addw    rr0,#13
	br	update_hidden


save_ascii:

	mov	(rr0)+,r2
	mov	(rr0)+,r3
        addw    rr0,#11

update_hidden:

	mov	r2,hidden_ram
	mov	(rr0)+,r2
	movw	rr4,#Record_3min

update_rec_lop:

	mov	r2,(rr4)+
	mov	(rr0)+,r2
	cmpw	rr4,#Record_name15
	br	ule,update_rec_lop
	ret


cheat_code_init:			;18/2/1998 (cheung)

	movw	rr0,#fighter_id
	clr	r2
	call	MemoryBlkReq		;request high score system block
	addw	rr0,#internet_code	;External Ram address - 2
	movw	rr4,(rr0)+
	cmpw	rr4,#0baddh
	br	eq,SET_no_demage
cheat_code_initA:
	movw	rr4,(rr0)+
	cmpw	rr4,#1eafh
	br	eq,SET_ahlf_life
cheat_code_initB:
	movw	rr4,(rr0)+
	cmpw	rr4,#0dcdch
	br	eq,SET_stage_sel
	ret

SET_no_demage:
	mov	r2,internet_flag
	bset	r2,#0
	mov	internet_flag,r2
	br	cheat_code_initA

SET_ahlf_life:
	mov	r2,internet_flag
	bset	r2,#1
	mov	internet_flag,r2
	br	cheat_code_initB

SET_stage_sel:
	mov	r2,internet_flag
	bset	r2,#2
	mov	internet_flag,r2
	ret



cont_melody:
;        ret
	bbs	game_info,#bit7,start_melody	   ;start again.
	bbs	sp_control,#0,bat_mel1
	mov	r0,Melody_Register
	bbs	r0,#0,bat_mel1
start_melody:
	bclr	game_info,#bit7
	push	mmu3
	mov	mmu3,#program_bank5
	mov	r3,new_melody_ptr
	cmp	r3,#0
	br	eq,bat_mel1
	dec	r3
	sll	r3
	clr	r2
	movw	rr2,melody_high(rr2)
        call    start_chan0
	mov	r3,new_melody_ptr
	dec	r3
	sll	r3
	clr	r2
	movw	rr2,melody_low(rr2)
	call	start_chan1
	pop	mmu3
bat_mel1:
	ret


melody_high:

        dw      game_mel1H      ;1
        dw      game_mel2H      ;2
        dw      game_mel3H      ;3
        dw      game_mel4H      ;4
        dw      open_melH       ;5
        dw      s_end_melH      ;6
        dw      h_end_melH      ;7
        dw      option_melH     ;8

melody_low:

	dw	game_mel1L
	dw	game_mel2L
	dw	game_mel3L
        dw      game_mel4L
	dw	open_melL
	dw	s_end_melL
	dw	h_end_melL
	dw	option_melL

scan_3B:
        cmp     r0,#30h
        br      eq,more_scan
	ret
more_scan:
;        mov     p2,#0feh                ;col 0 - col 13 all high.
;        bset    p3,#4                   ;col 14 high.
;        or      p1,#0fch                ;except col 6.
;        mov     r0,#20
;ddloop:
;        dbnz    r0,ddloop               ;pure delay loop.
;        mov     r0,p0
;        bbc     p0,#4,is_key3B
        clr     r0
        mov     r1,#01
        call    Output_scan
        call    Return_line
        bbs     r0,#bit3,is_key3B
        clr     r0
	br	portk_oout
is_key3B:
        mov     r0,#30h
portk_oout:
	mov	p2,#0ffh		;all ports high now.
	ret

	end


