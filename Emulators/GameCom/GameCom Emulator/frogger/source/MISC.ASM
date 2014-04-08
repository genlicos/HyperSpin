	title   FIGHTER MEGAMIX
	type    8521

	NLIST
	include equate.inc
	include ram.inc
	include disp_ram.inc
	include disp_equ.inc
	LIST

	include frogger.tmp

;ASB	global  restart_game
;ASB	global  map_start_word
;ASB	global  start_word
;ASB	global  ko_word
;ASB	global  map_name
;ASB	global  finish_count
;ASB	global  game_timeout
;ASB	global  map_timeout
;ASB	global  key_handler
;ASB	global  map_mode_misc
;ASB	global  map_armor_body
;ASB	global  p1_win_num
;ASB	global  p2_win_num
;ASB	global  map_explose
;ASB	global  count_explose
;ASB	global  p2_win_game
;ASB	global  map_continue
;ASB	global  do_continue
;ASB	global  win_picture
;ASB	global  Win_show_name
;ASB	global  map_gameover


	program



;ASBrestart_game:
;ASB
;ASB	mov     r0,start_word_flag
;ASB	bbs     r0,#bit3,do_restart_game
;ASB	ret
;ASB
;ASBdo_restart_game:
;ASB
;ASB	clr     r0
;ASB	mov     start_word_flag,r0
;ASB	mov     GAME_TIMER0,R0
;ASB	mov     r1,Msel_ram
;ASB	cmp     r1,#survival_mode
;ASB	br      ne,normal_restart
;ASB	mov     r1,#full_energy
;ASB	mov     p2_energy,r1
;ASB	mov     p2_energy_buf,r1
;ASB	mov     r1,p1_energy
;ASB	cmp     r1,#30
;ASB	br      ugt,survival_dead
;ASB	add     r1,#08
;ASB	mov     p1_energy,r1
;ASB	br      survival_dead
;ASB
;ASBnormal_restart:
;ASB
;ASB	bbc     game_info,#bit2,new_roundx
;ASB
;ASBsurvival_dead:
;ASB
;ASB	mov     null_round,r0
;ASB	mov     round_num,r0
;ASB	mov     p1_win_round,r0
;ASB	mov     p2_win_round,r0
;ASB	mov     r1,Msel_ram
;ASB	cmp     r1,#vs_mode
;ASB	br      eq,p2_win_game
;ASB	bbs     game_info,#bit1,p2_win_game
;ASB	bbs     game_info2,#bit0,p2_win_game
;ASB
;ASBnext_char_loop:
;ASB
;ASB	mov     r0,Msel_ram
;ASB	cmp     r0,#survival_mode
;ASB	br      eq,survival_char
;ASB	mov     r3,course_ram
;ASB	clr     r2
;ASB;       movw    rr4,co(rr2)
;ASB	mov     r3,opp_pointer
;ASB	inc     r3
;ASB	mov     opp_pointer,r3
;ASB	clr     r2
;ASB	addw    rr4,rr2
;ASB	mov     r2,@rr4
;ASB	cmp     r2,#0ffh
;ASB	br      ne,save_char
;ASB	call    p2_win_game2a
;ASB	br      p2_win_game
;ASB
;ASBsave_char:
;ASB
;ASB	mov     plyr2_id,r2
;ASB	mov     r0,stage_num
;ASB	inc     r0
;ASB	mov     stage_num,r0
;ASB	call    armor_init
;ASB	mov     r0,ram_BG
;ASB	add     r0,#02
;ASB	mov     ram_BG,r0
;ASB	cmp     r0,#20                  ;change on 15/12/1997
;ASB	br      ult,new_roundx
;ASB	clr     r0
;ASB	mov     ram_BG,r0
;ASB
;ASBnew_roundx:
;ASB
;ASB	and     game_info,#038h
;ASB	jmp     new_round
;ASB
;ASB
;ASBsurvival_char:
;ASB
;ASB	mov     r2,plyr2_id
;ASB	inc     r2
;ASB	cmp     r2,#honeys_id
;ASB	br      ult,save_char
;ASB	clr     r2
;ASB	br      save_char
;ASB
;ASB
;ASBp2_win_game:
;ASB
;ASB	clr     r0
;ASB	mov     opp_pointer,r0
;ASB	mov     game_info,r0
;ASB	mov     game_min,r0
;ASB	mov     game_sec,r0
;ASB	mov     start_word_flag,r0
;ASB;        mov     stage_num,r0
;ASB	mov     null_round,r0
;ASB	mov     round_num,r0
;ASB	mov     p1_win_round,r0
;ASB	mov     p2_win_round,r0
;ASB	movw    rr2,#Msel_ram+1
;ASBclr_loop:
;ASB	mov     (rr2)+,r0
;ASB	cmpw    rr2,#control_ram        ;clear opening ram
;ASB	br      ule,clr_loop
;ASB	mov     temp1,#0
;ASB	mov     temp2,#22
;ASB	call    clrdisplaybuffer
;ASB	call    Swap_page
;ASB	call    clrdisplaybuffer
;ASB	call    Active_page_B
;ASB;        call    stop_melody
;ASB	bset    game_info,#bit7
;ASB	mov     r0,#05
;ASB	mov     new_melody_ptr,r0
;ASB	mov     r0,Msel_ram
;ASB	cmp     r0,#vs_mode
;ASB	br      ne,survival_restart
;ASB	mov     r0,#0c0h
;ASB	mov     option_ram,r0
;ASB	br      vs_restart
;ASB
;ASBsurvival_restart:
;ASB
;ASB	cmp     r0,#survival_mode
;ASB	br      eq,survival_x
;ASB	and     game_info,#038h
;ASB	br      p1_x
;ASB
;ASBsurvival_x:
;ASB
;ASB	call    p2_win_game2a
;ASB	bbc     game_info2,#bit1,p1_x
;ASB	bclr    game_info2,#bit1
;ASB	mov     r0,#80h
;ASB	mov     option_ram,r0
;ASB
;ASBvs_restart:
;ASB
;ASB	bset    game_info,#bit5
;ASB	mov     r0,#20h
;ASB	mov     control_ram,r0
;ASBp1_x:
;ASB	call    refill_energy
;ASB	call    restart_init
;ASB	clr     r0
;ASB	mov     stage_num,r0
;ASB	mov     p1_win_times,r0
;ASB	mov     p2_win_times,r0
;ASB	bset    game_info2,#bit7
;ASB;        call    stop_melody
;ASB	ret
;ASB
;ASB
;ASB
;ASBnew_round:
;ASB
;ASB	bclr    game_info3,#bit1
;ASB	mov     r1,Msel_ram
;ASB	cmp     r1,#survival_mode
;ASB	br      eq,survival_round
;ASB	call    refill_energy
;ASB
;ASBsurvival_round:
;ASB
;ASB	call    restart_init
;ASB	ret
;ASB
;ASB
;ASB
;ASB
;ASB
;ASBstart_word:
;ASB
;ASB	mov     r0,start_word_flag
;ASB	bbc     r0,#bit0,do_start_word
;ASB	bbs     r0,#bit1,chk_start_word
;ASB	bset    r0,#bit1
;ASB	mov     start_word_flag,r0
;ASB	mov     r5,#fight
;ASB;       call    speech
;ASB	movw    rr0,#80
;ASB
;ASBnormal_start:
;ASB
;ASB	movw    GAME_TIMER1A,rr0
;ASB	mov     r1,#01
;ASB	mov     GAME_TIMER0,r1
;ASB
;ASB
;ASBchk_start_word:
;ASB
;ASB	movw    rr0,GAME_TIMER1A
;ASB	cmpw    rr0,#50
;ASB	br      ult,chk_start_word2
;ASB	cmpw    rr0,#55
;ASB	br      ugt,chk_start_word2
;ASB	mov     r2,speech_flag
;ASB	bbs     r2,#bit2,chk_start_word2
;ASB	bset    r2,#bit2
;ASB	mov     speech_flag,r2
;ASB	mov     r5,#ready
;ASB;       call    speech
;ASB
;ASBchk_start_word2:
;ASB
;ASB	cmpw    rr0,#06
;ASB	br      ugt,chk_start_word3
;ASB	cmpw    rr0,#04
;ASB	br      ult,chk_start_word3
;ASB	mov     r0,speech_flag
;ASB	bbs     r0,#bit3,chk_start_word3
;ASB	bset    r0,#bit3
;ASB	mov     speech_flag,r0
;ASB	mov     r5,#go
;ASB;       call    speech
;ASB
;ASBchk_start_word3:
;ASB
;ASB	mov     r2,GAME_TIMER0
;ASB	cmp     r2,#00
;ASB	br      ne,do_start_word
;ASB	clr     r2
;ASB	mov     GAME_TIMER1A,r2
;ASB	mov     GAME_TIMER1B,r2
;ASB	mov     start_word_flag,r2
;ASB	mov     start_word_seq,r2
;ASB	mov     speech_flag,r2
;ASB
;ASBdo_start_word:
;ASB
;ASB	ret
;ASB
;ASB
;ASB
;ASB
;ASB
;ASB
;ASB
;ASBmap_start_word:
;ASB
;ASB	mov     r0,Msel_ram
;ASB	cmp     r0,#survival_mode
;ASB	br      eq,no_map_word
;ASB	mov     r0,start_word_flag
;ASB	bbs     r0,#bit1,map_start_word1
;ASB
;ASBno_map_word:
;ASB
;ASB	ret
;ASB
;ASB
;ASBmap_start_word1:
;ASB
;ASB	mov     r8,#61
;ASB	mov     r9,#70
;ASB	movw    rr4,#0 ;#IROUND
;ASB	call    getlookupinfo
;ASB	mov     r15,#composite
;ASB	call    CK_page
;ASB	call    Fi_grapha
;ASB	mov     r3,round_num
;ASB	inc     r3
;ASB	clr     r4
;ASB	cmp     r3,#10
;ASB	br      ult,single_round
;ASBcount_10:
;ASB	sub     r3,#10
;ASB	inc     r4
;ASB	cmp     r3,#10
;ASB	br      uge,count_10
;ASB	push    r4
;ASB	mov     r8,#127
;ASB	call    map_round
;ASB	pop     r4
;ASB	mov     r3,r4
;ASB
;ASBsingle_round:
;ASB
;ASB	mov     r8,#138
;ASB
;ASBmap_round:
;ASB
;ASB	mov     r9,#70
;ASB	sll     r3
;ASB	clr     r2
;ASB;       movw    rr4,round_num_tbl(rr2)
;ASB	jmp     map_rtn
;ASB
;ASB
;ASB
;ASB;check round/game end,then map 'k.o.'
;ASB
;ASBko_word:
;ASB
;ASB	bbc     game_info,#bit0,no_ko_word      ;round end flag.
;ASB	bbs     game_info,#bit6,no_ko_wordx
;ASB	mov     r0,start_word_flag
;ASB	bbs     r0,#bit2,finish_word
;ASBno_ko_word:
;ASB	mov     r0,speech_flag
;ASB	and     r0,#0fch
;ASB	mov     speech_flag,r0
;ASBno_ko_wordx:
;ASB	ret
;ASB
;ASBfinish_word:
;ASB
;ASB	bbc     uart_info,#bit1,finish_word1
;ASB	jmp     p2_ko_word
;ASB
;ASBfinish_word1:
;ASB
;ASB	bbs     game_info,#bit2,finish_word2
;ASB	jmp     step1_word
;ASB
;ASBfinish_word2:
;ASB
;ASB	mov     r2,start_word_flag
;ASB	bclr    r2,#bit6
;ASB	mov     start_word_flag,r2
;ASB	mov     r0,Msel_ram
;ASB	cmp     r0,#00                  ;1 player mode ?
;ASB	br      ne,non_p1_mode
;ASB	bbc     game_info,#bit1,win_mel?     ;player lose ?
;ASB	movw    rr0,GAME_TIMER1A
;ASB	cmpw    rr0,#35
;ASB	br      ugt,non_p1_mode
;ASB	jmp     set_continue
;ASB
;ASB
;ASB;p1 win.
;ASB
;ASBwin_mel?:
;ASB
;ASB	mov     r0,stage_num
;ASB	cmp     r0,#05
;ASB	br      ne,non_p1_mode
;ASB	movw    rr0,GAME_TIMER1A
;ASB	cmpw    rr0,#192
;ASB	jmp     ugt,step1_word
;ASB	br      map_win_lose
;ASB
;ASBnon_p1_mode:
;ASB
;ASB	movw    rr0,GAME_TIMER1A
;ASB	cmpw    rr0,#96
;ASB	jmp     ugt,step1_word
;ASB
;ASBmap_win_lose:
;ASB
;ASB	bbs     game_info,#bit1,map_win_losex
;ASB	bbc     game_info,#bit2,map_win_losex
;ASB	mov     r0,new_melody_ptr
;ASB	cmp     r0,#07
;ASB	br      ne,no_win_mel
;ASB	movw    rr0,GAME_TIMER1A
;ASB	cmpw    rr0,#150
;ASB	br      ugt,map_win_losex
;ASB	br      win_mel_anim
;ASB
;ASBno_win_mel:
;ASB
;ASB	movw    rr0,GAME_TIMER1A
;ASB	cmpw    rr0,#80
;ASB	br      ugt,map_win_losex
;ASB	mov     r0,stage_num            ;yes.
;ASB	cmp     r0,#05
;ASB	br      ult,map_win_losex
;ASBwin_mel_anim:
;ASB	mov     r0,Msel_ram
;ASB	cmp     r0,#00                  ;p1 mode ?
;ASB	br      ne,map_win_losex
;ASB	bset    game_info3,#bit2
;ASB;        call    win_animat
;ASB	br      map_loss2
;ASB
;ASBmap_win_losex:
;ASB
;ASB	mov     r2,start_word_flag
;ASB	bset    r2,#bit6
;ASB	mov     start_word_flag,r2
;ASB	bbc     game_info,#bit1,map_win
;ASB	bbs     uart_info,#bit0,p1_lose_snd
;ASB	mov     r0,speech_flag
;ASB	bset    r0,#bit1
;ASB	mov     speech_flag,r0
;ASB
;ASBp1_lose_snd:
;ASB
;ASB	mov     speechnum,#you_lose
;ASB	movw    rr4,#0 ;#ILOSE
;ASB	mov     r8,#55
;ASB	br      map_loss
;ASB
;ASBmap_win:
;ASB	mov     speechnum,#you_win
;ASB	movw    rr4,#0 ;#IWIN
;ASB	mov     r8,#60
;ASBmap_loss:
;ASB	mov     r9,#70
;ASB	call    map_rtn
;ASB	bbc     game_info,#bit2,map_loss2
;ASB	mov     r0,speech_flag
;ASB	bbs     r0,#bit1,map_loss2
;ASB	bset    r0,#bit1
;ASB	mov     speech_flag,r0
;ASB	mov     r5,speechnum
;ASB;       call    speech
;ASB	bclr    game_info3,#bit0
;ASBmap_loss2:
;ASB	ret
;ASB
;ASB
;ASBstep1_word:
;ASB
;ASB	mov     r0,p1_energy
;ASB	cmp     r0,#full_energy
;ASB	br      eq,map_perfect
;ASB	bbs     uart_info,#bit0,map_ko
;ASB	mov     r0,p2_energy
;ASB	cmp     r0,#full_energy
;ASB	br      ne,map_ko
;ASB
;ASBmap_perfect:
;ASB
;ASB	mov     r0,speech_flag
;ASB	bbs     r0,#bit0,map_perfect1
;ASB	bset    r0,#bit0
;ASB	mov     speech_flag,r0
;ASB	mov     r5,#excellent
;ASB;       call    speech
;ASB	bclr    game_info3,#bit0
;ASB
;ASBmap_perfect1:
;ASB
;ASB	mov     r8,#60
;ASB	mov     r9,#70
;ASB	movw    rr4,#0 ;#IPERFECT
;ASB	br      map_rtn
;ASB
;ASBmap_ko:
;ASB	mov     r0,speech_flag
;ASB	bbs     r0,#bit0,map_kox
;ASB	bset    r0,#bit0
;ASB	mov     speech_flag,r0
;ASB	mov     r5,#ko
;ASB;       call    speech
;ASB	bclr    game_info3,#bit0
;ASBmap_kox:
;ASB	mov     r0,p1_energy
;ASB	cmp     r0,#00
;ASB	br      ne,map_ko1
;ASB	mov     r0,p2_energy
;ASB	cmp     r0,#00
;ASB	br      eq,map_ko2
;ASBmap_ko1:
;ASB	mov     r8,#85
;ASB	mov     r9,#70
;ASB	movw    rr4,#0 ;#IKO
;ASBmap_rtn:
;ASB	call    getlookupinfo
;ASB	mov     r15,#composite
;ASB	call    CK_page
;ASB	call    Fi_grapha
;ASB	ret
;ASB
;ASBmap_ko2:
;ASB	bclr    game_info,#bit1         ;set player 1 win.
;ASB	mov     r8,#40
;ASB	mov     r9,#70
;ASB	movw    rr4,#IDOUBLE
;ASB	call    map_rtn
;ASB	mov     r8,#119
;ASB	mov     r9,#70
;ASB	movw    rr4,#0 ;#IKO
;ASB	br      map_rtn
;ASB
;ASB
;ASB
;ASB
;ASB;check round/game end,then map 'k.o.' for head to head mode.
;ASB
;ASB
;ASBp2_ko_word:
;ASB
;ASB	bbc     game_info,#bit2,p2_step1_word
;ASB	mov     r0,start_word_flag
;ASB	bbc     r0,#bit6,p2_step1_word
;ASB
;ASBp2_win_lose:
;ASB
;ASB	bbs     game_info3,#bit4,quit_finish
;ASB	mov     speechnum,#you_lose
;ASB	movw    rr4,#0; #ILOSE
;ASB	mov     r8,#55
;ASB	bbc     game_info,#bit1,map_lossx
;ASB	mov     speechnum,#you_win
;ASB	movw    rr4,#0 ;#IWIN
;ASB	mov     r8,#60
;ASBmap_lossx:
;ASB;        bbs     game_info,#bit2,map_lossx1
;ASB;        mov     r0,speech_flag
;ASB;        bset    r0,#bit1
;ASB;        mov     speech_flag,r0
;ASBmap_lossx1:
;ASB	jmp     map_loss
;ASB
;ASB
;ASBp2_step1_word:
;ASB
;ASB	mov     r0,p2_energy
;ASB	cmp     r0,#full_energy
;ASB	jmp     eq,map_perfect
;ASB	jmp     map_ko
;ASB
;ASB
;ASB
;ASB
;ASBJmpDo_continue:
;ASB
;ASB	jmp     do_continue
;ASB
;ASBquit_finish:
;ASB
;ASB	ret
;ASB
;ASB
;ASB
;ASB;count the time from map 'k.o.' to start new round/game.
;ASB
;ASBfinish_count:
;ASB
;ASB	bbc     game_info,#bit0,quit_finish
;ASB	mov     r0,start_word_flag
;ASB	bbs     r0,#bit5,JmpDo_continue
;ASB	bbs     r0,#bit2,do_finish_count
;ASB	bset    r0,#bit2
;ASB	mov     start_word_flag,r0
;ASB	bbs     game_info,#bit6,not_endx
;ASB	movw    rr0,#50
;ASB	bbc     game_info,#bit2,not_end
;ASB	bbs     game_info3,#bit4,not_end
;ASBnot_endx:
;ASB	movw    rr0,#08ah
;ASB	bbs     game_info,#bit1,not_end
;ASB	mov     r2,stage_num
;ASB	cmp     r2,#05
;ASB	br      ult,not_end
;ASB	bset    game_info,#bit7
;ASB	mov     r2,#07
;ASB	mov     new_melody_ptr,r2
;ASB	movw    rr0,#0d0h
;ASB
;ASBnot_end:
;ASB	movw    GAME_TIMER1A,rr0
;ASB	mov     r0,#01
;ASB	mov     GAME_TIMER0,r0
;ASB
;ASBdo_finish_count:
;ASB
;ASB	mov     r0,GAME_TIMER0
;ASB	cmp     r0,#00
;ASB	br      eq,set_continue
;ASB	mov     r0,Msel_ram
;ASB	cmp     r0,#survival_mode
;ASB	br      ne,non_survival
;ASB	bbs     game_info2,#bit0,survival_tout
;ASB	bbc     game_info,#bit1,non_survival    ;player 1 win ?
;ASB
;ASBsurvival_tout:
;ASB
;ASB	mov     r1,GAME_TIMER1B
;ASB	cmp     r1,#45
;ASB	br      ugt,end_finish_count
;ASB	bclr    game_info,#bit2
;ASB	mov     r0,start_word_flag
;ASB	bbs     r0,#bit4,skip_record
;ASB	bset    r0,#bit4
;ASB	mov     start_word_flag,r0
;ASB	call    Active_page_B
;ASB	call    jmp_record_show
;ASB	mov     r0,#00
;ASB	mov     GAME_TIMER0,r0
;ASB	mov     start_word_seq,r0
;ASB	movw    rr0,#70
;ASB	movw    GAME_TIMER1A,rr0
;ASB	mov     r0,#01
;ASB	mov     GAME_TIMER0,r0
;ASB
;ASBnon_survival:
;ASB
;ASB	mov     r1,GAME_TIMER1B
;ASB	cmp     r1,#20
;ASB	br      ugt,end_finish_count
;ASB	mov     r0,#00
;ASB	mov     start_word_seq,r0
;ASB
;ASBend_finish_count:
;ASB
;ASB	ret
;ASB
;ASB
;ASB
;ASBskip_record:
;ASB
;ASB	mov     r0,cur_key
;ASB	cmp     r0,#b_key
;ASB	br      ne,end_finish_count
;ASB	bset    game_info2,#bit1
;ASB
;ASBset_restart_y:
;ASB
;ASB	jmp     set_restart_x
;ASB
;ASB
;ASB
;ASBset_continue:
;ASB
;ASB	mov     r0,Msel_ram
;ASB	cmp     r0,#one_player_mode             ;one player mode ?
;ASB	jmp     ne,set_restart_x
;ASB	bbc     game_info,#bit2,set_restart_y        ;game end ?
;ASB	bbc     game_info,#bit1,set_restart_y        ;player 1 win ?
;ASB	mov     r0,#20h
;ASB	mov     start_word_flag,r0      ;set show continue flag.
;ASB	mov     r0,#09
;ASB	mov     continue_count,r0
;ASB	bclr    game_info,#bit6
;ASB
;ASBdo_continue2:
;ASB
;ASB	movw    rr0,#25
;ASB	movw    GAME_TIMER1A,rr0
;ASB	mov     r0,#01
;ASB	mov     GAME_TIMER0,r0
;ASBno_continue:
;ASB	ret
;ASB
;ASB
;ASB
;ASB
;ASB
;ASB
;ASBdo_continue:
;ASB
;ASB	call    Speech_Stop
;ASB	br      nc,do_continue1
;ASB	mov     r5,#you_lose
;ASB;       call    speech
;ASB
;ASBdo_continue1:
;ASB
;ASB	bbs     game_info3,#bit3,do_gameover
;ASB	mov     r0,cur_key
;ASB	cmp     r0,#a_key
;ASB	br      eq,set_resume
;ASB	cmp     r0,#b_key
;ASB	br      eq,down_time
;ASB	cmp     r0,#c_key
;ASB	br      eq,down_time
;ASB	cmp     r0,#d_key
;ASB	br      eq,down_time
;ASB	mov     r0,GAME_TIMER0
;ASB	cmp     r0,#00
;ASB	br      ne,no_continue
;ASBdown_time:
;ASB	mov     r0,continue_count
;ASB	cmp     r0,#00
;ASB	br      eq,set_game_over
;ASB	dec     r0
;ASB	mov     continue_count,r0
;ASB	br      do_continue2
;ASB
;ASBset_game_over:
;ASB
;ASB	bset    game_info3,#bit3
;ASB	movw    rr0,#70
;ASB	movw    GAME_TIMER1A,rr0
;ASB	mov     r0,#01
;ASB	mov     GAME_TIMER0,r0
;ASBgo_gameover:
;ASB	ret
;ASB
;ASBdo_gameover:
;ASB
;ASB	mov     r0,GAME_TIMER0
;ASB	cmp     r0,#00
;ASB	br      ne,go_gameover
;ASB
;ASBset_restart_x:
;ASB
;ASB	mov     r0,#0ch
;ASB	call    CTRL_SP
;ASB	jmp     set_restart_flag
;ASB
;ASB
;ASB
;ASBset_resume:
;ASB
;ASB	clr     r0
;ASB	mov     start_word_flag,r0
;ASB	mov     GAME_TIMER0,R0
;ASB	mov     round_num,r0
;ASB	mov     p1_win_round,r0
;ASB	mov     p2_win_round,r0
;ASB	and     game_info,#38h
;ASB	jmp     new_round
;ASB
;ASB
;ASB
;ASB
;ASBmap_continue:
;ASB
;ASB	bbs     game_info3,#bit3,no_map_continue
;ASB	mov     r0,start_word_flag
;ASB	bbc     r0,#bit5,no_map_continue
;ASB	mov     r3,continue_count
;ASB	sll     r3
;ASB	clr     r2
;ASB	mov     r8,#95
;ASB	mov     r9,#80
;ASB;       movw    rr4,round_num_tbl(rr2)
;ASB	call    map_rtn
;ASB	movw    rr4,#0 ;#ICONTINUE
;ASB	call    getlookupinfo
;ASB	mov     r8,#55
;ASB	mov     r9,#120
;ASB	mov     r15,#composite
;ASB	call    CK_page
;ASB	call    Fi_graphx
;ASB
;ASBno_map_continue:
;ASB
;ASB	ret
;ASB
;ASB
;ASBmap_gameover:
;ASB
;ASB	bbc     game_info3,#bit3,no_gameover
;ASB	movw    rr4,#0 ;#IGMOVER
;ASB	mov     r8,#46
;ASB	mov     r9,#70
;ASB	call    map_rtn3
;ASBno_gameover:
;ASB	ret
;ASB
;ASB
;ASB
;ASB
;ASBset_restart_flag:
;ASB
;ASB	mov     r0,#08
;ASB	mov     start_word_flag,r0
;ASB	bclr    game_info,#bit6
;ASB
;ASBno_timeoutx:
;ASB
;ASB	ret
;ASB
;ASB
;ASB
;ASB
;ASB
;ASBgame_timeout:
;ASB
;ASB	mov     r0,start_word_flag
;ASB	bbs     r0,#bit5,no_timeoutx
;ASB	bbs     game_info,#bit6,no_timeoutx
;ASB	bbs     game_info2,#bit0,set_timeout
;ASB	mov     r0,gtimer1
;ASB	cmp     r0,#12h
;ASB	jmp     ne,no_timeout
;ASB	mov     r0,gtimer2
;ASB	cmp     r0,#12h
;ASB	br      ne,no_timeout
;ASB
;ASBset_timeout:
;ASB
;ASB	mov     r5,#time_over
;ASB;       call    speech
;ASB	bset    game_info,#bit6
;ASB	mov     r0,p1_energy
;ASB	mov     r1,p2_energy
;ASB	cmp     r0,r1
;ASB	br      eq,set_draw
;ASB	br      ult,p2_timeout_win
;ASB
;ASBp1_timeout_win:
;ASB
;ASB	bclr    game_info,#bit1         ;player 2 less energy, set player 1 win.
;ASB	mov     r0,p1_win_round
;ASB	inc     r0
;ASB	mov     p1_win_round,r0
;ASB;       call    finish_set
;ASB	ret
;ASB
;ASBp2_timeout_win:
;ASB
;ASB	bset    game_info,#bit1         ;player 1 less energy, set player 2 win.
;ASB	mov     r0,p2_win_round
;ASB	inc     r0
;ASB	mov     p2_win_round,r0
;ASB;       call    finish_set
;ASB	ret
;ASB
;ASB
;ASB;draw game.
;ASB
;ASBset_draw:
;ASB
;ASB	bset    game_info3,#bit1        ;set draw game flag.
;ASB	bset    game_info,#bit0         ;set round end flag.
;ASB	ret
;ASB
;ASB
;ASB
;ASBmap_timeout:
;ASB
;ASB	mov     r0,start_word_flag
;ASB	bbs     r0,#bit5,no_timeout
;ASB	bbc     game_info,#bit6,no_timeout
;ASB	bbc     uart_info,#bit1,map_timeout1
;ASB	bbc     r0,#bit6,map_timeout2
;ASB	bbs     game_info3,#bit1,map_draw
;ASB	jmp     p2_win_lose
;ASB
;ASBmap_timeout1:
;ASB
;ASB	movw    rr0,GAME_TIMER1A
;ASB	cmpw    rr0,#96
;ASB	br      ugt,map_timeout2
;ASB	bbs     game_info3,#bit1,map_draw       ;draw game ?
;ASB	bbs     game_info,#bit2,timeout_win
;ASB;        movw    rr0,#40
;ASB	mov     r0,speech_flag
;ASB	bset    r0,#bit1
;ASB	mov     speech_flag,r0
;ASB
;ASBtimeout_win:
;ASB
;ASB	jmp     map_win_lose
;ASB
;ASBmap_timeout2:
;ASB
;ASB	mov     r8,#50
;ASB	mov     r9,#70
;ASB	movw    rr4,#0 ;#ITIMEOVER
;ASB	jmp     map_rtn
;ASB
;ASBno_timeout:
;ASB
;ASB	ret
;ASB
;ASB
;ASBmap_draw:
;ASB
;ASB	mov     r0,start_word_flag
;ASB	bset    r0,#bit6
;ASB	mov     start_word_flag,r0
;ASB	mov     r8,#72
;ASB	mov     r9,#70
;ASB	movw    rr4,#0 ;#IDRAW
;ASB	jmp     map_rtn3
;ASB
;ASB
;ASB
;ASB
;ASB
;ASBmap_name:
;ASB
;ASB;map player 1 name.
;ASB
;ASB	mov     r3,plyr1_id
;ASB	clr     r2
;ASB	sll     r3
;ASB;       movw    rr4,name_tbl(rr2)
;ASB	mov     r8,#22
;ASB	mov     r9,#4
;ASB	call    map_rtn2
;ASB
;ASB	mov     r3,plyr2_id
;ASB	clr     r2
;ASB	sll     r3
;ASB;       movw    rr4,name_tbl(rr2)
;ASB	call    getlookupinfo
;ASB	mov     r8,#177
;ASB	sub     r8,r12
;ASB	mov     r15,#override
;ASB	call    CK_page
;ASB	call    Fi_graph
;ASB	ret
;ASB
;ASB
;ASB
;ASBmap_rtn2:
;ASB	call    getlookupinfo
;ASB	mov     r15,#override
;ASB	call    CK_page
;ASB	call    Fi_graph
;ASB	ret
;ASB
;ASBmap_rtn3:
;ASB	call    getlookupinfo
;ASB	mov     r15,#composite
;ASB	call    CK_page
;ASB	call    Fi_graphx
;ASB	ret
;ASB
;ASB
;ASB
;ASB
;ASB
;ASB
;ASBkey_handler:
;ASB
;ASBkey_p1:
;ASB;        call    GetUser
;ASB;        mov     cur_key,r0
;ASB	mov     r0,cur_key
;ASBkey_h1:
;ASB	cmp     r0,#89h         ;mute key
;ASB	br      ne,key_h2
;ASB
;ASBgo_2:
;ASB	;
;ASB	;mute_key is pressed
;ASB	;
;ASB	mov     r0,#4
;ASB;        call    CTRL_SPX
;ASB	call    CTRL_SP
;ASB	mov     r0,#89h
;ASB	br      key_h_end
;ASB
;ASBkey_h2:
;ASB	cmp     r0,#88h         ;off key
;ASB	br      ne,key_h3
;ASB
;ASB	mov     r0,#4
;ASB;        call    CTRL_SPX
;ASB	call    CTRL_SP
;ASB;        call    restore_uart
;ASB;        call    update_score
;ASB;        and     p3,#0f0h
;ASB	mov     r0,#88h
;ASB	br      key_h_end
;ASB
;ASBkey_h3:
;ASB	cmp     r0,#8ah         ;pause key
;ASB	br      ne,key_h_next
;ASB	bset    sp_control,#5   ;disable time_out
;ASB	mov     r0,#4
;ASB;        call    CTRL_SPX
;ASB	call    CTRL_SP
;ASB;       call    stop_melody
;ASB	mov     r7,inverse
;ASB	cmp     r7,#0
;ASB	br      eq,no_problem
;ASB	nop
;ASBno_problem:
;ASB	mov     r0,#8ah
;ASB	bbs     uart_info,#bit0,key_h_end       ;h2h mode ?
;ASB	call    save_screen
;ASB	mov     r1,internet_flag
;ASB	and     r1,#03
;ASB	cmp     r1,#00
;ASB	br      eq,key_h_end
;ASB	call    pause_box
;ASB	call    Short_Beep
;ASB	call    pause_wait
;ASB	call    Short_Beep
;ASB	bset    game_info,#bit7         ;set start melody flag.
;ASB	br      key_h_end2
;ASB
;ASBkey_h_end:
;ASB	;
;ASB	;handle system key i.e. mute, on/off
;ASB	;
;ASB;        bset    uart_info1,#4
;ASB
;ASB	call    save_screen
;ASB;        push    r0
;ASB;        call    restore_isr
;ASB;        pop     r0
;ASB	call    SysKeyHandler
;ASB	push    r0
;ASB;        call    init_isr
;ASB	bbc     0bch,#5,key_h_endx
;ASB	bclr    sgc,#7
;ASBkey_h_endx:
;ASB	pop     r0
;ASB
;ASBkey_h_end2:
;ASB
;ASB	call    restore_screen
;ASB	bclr    sp_control,#5           ;enable time_out
;ASB	mov     r6,i_sysflag
;ASB	bmov    bf,SYSFLAG,#5
;ASB	bmov    r6,#5,bf
;ASB	mov     i_sysflag,r6
;ASB
;ASB	;
;ASB	;check menu key
;ASB	;
;ASB
;ASBkey_h_next:
;ASB	mov     r0,cur_key
;ASB	cmp     r0,#87h
;ASB	br      ne,key_handle2
;ASB
;ASB;        mov     r6,spec_flag
;ASB;        bbs     r6,#0,key_handle2
;ASB
;ASB;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ASB;³      MENU KEY HANDLING        ³
;ASB;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
;ASB;        bset    uart_info1,#4
;ASB
;ASB	call    Short_Beep
;ASB;       call    stop_melody
;ASBquit_anim:
;ASB;        cmp     cur_page,#1
;ASB;        br      ne,quit_anim1
;ASB
;ASB	call    save_screen
;ASB	mov     r1,KBDFLAG
;ASB	mov     i_kbdflag,r1
;ASB
;ASB	mov     r0,#enable_mem
;ASB	call    CTRL_KBD
;ASB
;ASBquit_anim1:
;ASB	mov     r2,#0
;ASB	call    quit_box
;ASBquit_clight:
;ASB	mov     r2,#1
;ASB	call    quit_box
;ASB	br      c,quit_clight
;ASB
;ASB	mov     r1,i_kbdflag
;ASB	mov     KBDFLAG,r1
;ASB
;ASB	cmp     r0,#0
;ASBresume_clo:
;ASB;        br      ne,key_handle2
;ASB	br      eq,exit_all
;ASB
;ASB	call    Swap_page
;ASB	br      key_handle2
;ASB
;ASBexit_all:
;ASB	mov     r0,#1
;ASB	mov     r1,#87h                 ;menu key
;ASB	setc                            ;QUIT GAME !!
;ASB	ret
;ASB
;ASBkey_handle2:
;ASB	mov     r0,cur_key
;ASB	cmp     r0,#89h                 ;mute
;ASB	br      eq,key_loop
;ASB	cmp     r0,#87h                 ;menu
;ASB	br      eq,key_loop
;ASB	cmp     r0,#8ah                 ;pause
;ASB	br      ne,end_key_handle
;ASB
;ASBkey_loop:
;ASB	call    GetUser
;ASB	cmp     r0,#0
;ASB	br      ne,key_loop
;ASB
;ASBend_key_handle:
;ASB	clrc                    ;SAFE RET
;ASB	ret
;ASB
;ASB
;ASBsave_screen:
;ASB	movw    rr8,#0
;ASB	movw    rr10,#0c8a0h
;ASB	movw    rr12,#0
;ASB	mov     r14,#0
;ASB	cmp     cur_page,#0
;ASB	br      eq,act_a
;ASBact_b:
;ASB	mov     r15,#01h                ;page B->A
;ASB	br      act_com
;ASBact_a:
;ASB	mov     r15,#02h                ;page A->B
;ASB
;ASBact_com:
;ASB	call    Blk_mov_2
;ASB	ret
;ASB
;ASBrestore_screen:
;ASB	movw    rr8,#0
;ASB	movw    rr10,#0c8a0h
;ASB	movw    rr12,#0
;ASB	mov     r14,#0
;ASB	cmp     cur_page,#0
;ASB	br      ne,act_a
;ASB	br      act_b
;ASB
;ASB;map p1 mode stage number & game timer.
;ASB
;ASBmap_mode_misc:
;ASB
;ASB	mov     r1,Msel_ram
;ASB	cmp     r1,#one_player_mode
;ASB	jmp     eq,map_p1_modex
;ASB	mov     r1,Msel_ram
;ASB	cmp     r1,#survival_mode
;ASB	br      ne,no_map_mode
;ASB	call    p1_win_num
;ASB	call    map_min_sec
;ASB	ret
;ASB
;ASB;map_p2_win_num:
;ASB;
;ASB;        call    p2_win_num
;ASB
;ASBno_map_mode:
;ASB
;ASB	ret
;ASB
;ASB
;ASB
;ASB
;ASB
;ASBp1_win_num:
;ASB
;ASB	clr     r3
;ASB	mov     r9,#140
;ASB	mov     r4,p1_win_times
;ASB	cmp     r4,#100
;ASB	br      ult,p1_win_num10
;ASB
;ASBwin_num100:
;ASB
;ASB	sub     r4,#100
;ASB	inc     r3
;ASB	cmp     r4,#100
;ASB	br      uge,win_num100
;ASB	push    r4
;ASB	mov     r8,#04
;ASB	call    map_win_num
;ASB	pop     r4
;ASB
;ASBp1_win_num10:
;ASB
;ASB	clr     r3
;ASB	mov     r5,p1_win_times
;ASB	cmp     r5,#10
;ASB	br      ult,p1_win_num1
;ASB	cmp     r4,#10
;ASB	br      ult,win_num10a
;ASB
;ASBwin_num10:
;ASB
;ASB	sub     r4,#10
;ASB	inc     r3
;ASB	cmp     r4,#10
;ASB	br      uge,win_num10
;ASBwin_num10a:
;ASB	push    r4
;ASB	mov     r8,#12
;ASB	call    map_win_num
;ASB	pop     r4
;ASB
;ASBp1_win_num1:
;ASB
;ASB	mov     r3,r4
;ASB	mov     r8,#20
;ASB	call    map_win_num
;ASB	mov     r3,p1_win_times
;ASB	call    map_win_word
;ASB	ret
;ASB
;ASB
;ASB
;ASBp2_win_num:
;ASB
;ASB	clr     r3
;ASB	mov     r9,#140
;ASB	mov     r4,p2_win_times
;ASB	cmp     r4,#100
;ASB	br      ult,p2_win_num10
;ASB
;ASBp2_win_num100:
;ASB
;ASB	sub     r4,#100
;ASB	inc     r3
;ASB	cmp     r4,#100
;ASB	br      uge,p2_win_num100
;ASB	push    r4
;ASB	mov     r8,#125
;ASB	call    map_win_num
;ASB	pop     r4
;ASB
;ASBp2_win_num10:
;ASB
;ASB	clr     r3
;ASB	mov     r5,p2_win_times
;ASB	cmp     r5,#10
;ASB	br      ult,p2_win_num1
;ASB	cmp     r4,#10
;ASB	br      ult,p2_win_num10a
;ASB
;ASBp2_win_num10x:
;ASB
;ASB	sub     r4,#10
;ASB	inc     r3
;ASB	cmp     r4,#10
;ASB	br      uge,p2_win_num10x
;ASB
;ASBp2_win_num10a:
;ASB
;ASB	push    r4
;ASB	mov     r8,#133
;ASB	call    map_win_num
;ASB	pop     r4
;ASB
;ASBp2_win_num1:
;ASB
;ASB	mov     r3,r4
;ASB	mov     r8,#141
;ASB	call    map_win_num
;ASB	mov     r3,p2_win_times
;ASB	call    map_win_word
;ASB	ret
;ASB
;ASB
;ASB
;ASB
;ASB
;ASB;map how many times fighter's win game.
;ASB
;ASBmap_win_num:
;ASB
;ASB	push    mmu4
;ASB	mov     mmu4,#misc_tbl
;ASB	sll     r3
;ASB	clr     r2
;ASB;       movw    rr4,time_num_tbl(rr2)
;ASB	call    map_rtn
;ASB	pop     mmu4
;ASB	ret
;ASB
;ASB
;ASBmap_win_word:
;ASB
;ASB	push    mmu4
;ASB	mov     mmu4,#misc_tbl
;ASB	movw    rr4,#0 ;#IWIN_S
;ASB	add     r8,#12
;ASB	cmp     r3,#02
;ASB	br      ult,map_win_num1
;ASB	movw    rr4,#0 ;#IWINS_S
;ASB
;ASBmap_win_num1:
;ASB
;ASB	call    map_rtn
;ASB
;ASBno_win_num:
;ASB
;ASB	pop     mmu4
;ASB	ret
;ASB
;ASB
;ASB
;ASBmap_p1_modex:
;ASB
;ASB	movw    rr4,#0 ;#ISTAGE
;ASB	mov     r8,#20
;ASB	mov     r9,#140
;ASB	call    map_rtn
;ASB	mov     r3,stage_num
;ASB	inc     r3
;ASB	sll     r3
;ASB	clr     r2
;ASB;       movw    rr4,time_num_tbl(rr2)
;ASB	mov     r8,#62
;ASB	mov     r9,#140
;ASB	call    map_rtn
;ASB
;ASBmap_min_sec:
;ASB
;ASB	clr     r7
;ASB	mov     r3,game_min
;ASBmin_loop:
;ASB	cmp     r3,#10
;ASB	br      ult,map_min
;ASB	sub     r3,#10
;ASB	inc     r7
;ASB	br      min_loop
;ASB
;ASBmap_min:
;ASB
;ASB	push    r3
;ASB	sll     r7
;ASB	clr     r6
;ASB;       movw    rr4,time_num_tbl(rr6)
;ASB	mov     r8,#155
;ASB	mov     r9,#140
;ASB	call    map_rtn
;ASB	pop     r3
;ASB
;ASBmap_single_min:
;ASB
;ASB	sll     r3
;ASB	clr     r2
;ASB;       movw    rr4,time_num_tbl(rr2)
;ASB	mov     r8,#163
;ASB	mov     r9,#140
;ASB	call    map_rtn
;ASB	movw    rr4,#0 ;#IT_H
;ASB	mov     r8,#172
;ASB	mov     r9,#140
;ASB	call    map_rtn
;ASB
;ASB	clr     r7
;ASB	mov     r3,game_sec
;ASBsec_loop:
;ASB	cmp     r3,#10
;ASB	br      ult,map_sec
;ASB	sub     r3,#10
;ASB	inc     r7
;ASB	br      sec_loop
;ASB
;ASBmap_sec:
;ASB
;ASB	push    r3
;ASB	sll     r7
;ASB	clr     r6
;ASB;       movw    rr4,time_num_tbl(rr6)
;ASB	mov     r8,#178
;ASB	mov     r9,#140
;ASB	call    map_rtn
;ASB	pop     r3
;ASB
;ASBmap_single_sec:
;ASB
;ASB	sll     r3
;ASB	clr     r2
;ASB;       movw    rr4,time_num_tbl(rr2)
;ASB	mov     r8,#186
;ASB	mov     r9,#140
;ASB	jmp     map_rtn
;ASB
;ASB
;ASB
;ASB
;ASB
;ASB
;ASB
;ASB;map small armor body for armored character.
;ASB
;ASBmap_armor_body:
;ASB
;ASB	mov     r15,#decode_ptr1
;ASB	call    armor_fighter
;ASB	br      nc,chk_p2_armor
;ASB	call    p1_armor_body
;ASB	mov     r0,p1_armour1
;ASB	cmp     r0,#00
;ASB	br      ne,chk_p2_armor
;ASB	movw    rr4,#0 ;#0 ;#IBAR05
;ASB	call    p1_light_body
;ASB
;ASBchk_p2_armor:
;ASB
;ASB	mov     r15,#decode_ptr2
;ASB	call    armor_fighter
;ASB	br      nc,no_armor_body
;ASB	call    p2_armor_body
;ASB	mov     r0,p2_armour1
;ASB	cmp     r0,#00
;ASB	br      ne,no_armor_body
;ASB	movw    rr4,#0 ;#IBAR05
;ASB	call    p2_light_body
;ASB
;ASBno_armor_body:
;ASB
;ASB	ret
;ASB
;ASB;player 1 has armor.
;ASB
;ASBp1_armor_body:
;ASB
;ASB	mov     r0,p1_armour1
;ASB	cmp     r0,#6
;ASB	br      ugt,p1_solid_body
;ASB	movw    rr4,#0 ;#IBAR05
;ASB	movw    rr2,GAME_TIMER1A
;ASB	cmp     r0,#03
;ASB	br      ugt,p1_slow_flash
;ASB	cmpw    rr2,#04
;ASB	br      ult,p1_solid_body
;ASB	cmpw    rr2,#08
;ASB	br      ult,p1_light_body
;ASB	cmpw    rr2,#0ch
;ASB	br      ult,p1_solid_body
;ASB
;ASBp1_slow_flash:
;ASB	cmpw    rr2,#8
;ASB	br      ugt,p1_light_body
;ASB
;ASBp1_solid_body:
;ASB
;ASB	movw    rr4,#0 ;#IBAR06
;ASB
;ASBp1_light_body:
;ASB
;ASB	mov     r8,#6
;ASB	mov     r9,#4
;ASB	jmp     map_rtn3
;ASB
;ASB
;ASB;player 2 has armor.
;ASB
;ASBp2_armor_body:
;ASB
;ASB	mov     r0,p2_armour1
;ASB	cmp     r0,#5
;ASB	br      ugt,p2_solid_body
;ASB	movw    rr4,#0 ;#IBAR05
;ASB	movw    rr2,GAME_TIMER1A
;ASB	cmp     r0,#03
;ASB	br      ugt,p2_slow_flash
;ASB	cmpw    rr2,#04
;ASB	br      ult,p2_solid_body
;ASB	cmpw    rr2,#08
;ASB	br      ult,p2_light_body
;ASB	cmpw    rr2,#0ch
;ASB	br      ult,p2_solid_body
;ASB
;ASBp2_slow_flash:
;ASB
;ASB	cmpw    rr2,#8
;ASB	br      ugt,p2_light_body
;ASB
;ASBp2_solid_body:
;ASB
;ASB	movw    rr4,#0 ;#IBAR06
;ASB
;ASBp2_light_body:
;ASB
;ASB	mov     r8,#181
;ASB	mov     r9,#4
;ASB	jmp     map_rtn3
;ASB
;ASB
;ASB
;ASBcount_explose:
;ASB
;ASB	mov     r0,p1_explose
;ASB	call    incr_explose
;ASB	mov     p1_explose,r0
;ASB	mov     r0,p2_explose
;ASB	call    incr_explose
;ASB	mov     p2_explose,r0
;ASB	ret
;ASB
;ASB
;ASB
;ASBincr_explose:
;ASB
;ASB	cmp     r0,#00
;ASB	br      eq,no_incr_explo
;ASB	movw    rr2,GAME_TIMER1A
;ASB	cmpw    rr2,#0ch
;ASB	br      ult,incr_explose1
;ASB	bbs     r0,#bit7,no_incr_explo
;ASB	bset    r0,#bit7
;ASB
;ASBincr_explose2:
;ASB
;ASB	bset    decode_info,#bit0
;ASB	inc     r0
;ASB	mov     r1,r0
;ASB	bclr    r1,#bit7
;ASB	cmp     r1,#04
;ASB	br      ult,no_incr_explo
;ASB	clr     r0
;ASB
;ASBno_incr_explo:
;ASB
;ASB	ret
;ASB
;ASBincr_explose1:
;ASB
;ASB	bbc     r0,#bit7,no_incr_explo
;ASB	bclr    r0,#bit7
;ASB	br      incr_explose2
;ASB
;ASB
;ASB;map armour explose.
;ASB
;ASBmap_explose:
;ASB
;ASB	mov     r0,plyr1_x
;ASB	mov     r1,plyr1_y
;ASB	sub     r1,#40
;ASB	movw    temp_ram1,rr0
;ASB	mov     r3,p1_explose
;ASB	bclr    r3,#bit7
;ASB	cmp     r3,#00
;ASB	br      eq,chk_p2_explose
;ASB	dec     r3
;ASB;debug1:
;ASB;        cmp     r3,#03
;ASB;        br      uge,debug1
;ASB	sll     r3
;ASB	call    @explose_idx(r3)
;ASB
;ASBchk_p2_explose:
;ASB
;ASB	mov     r0,plyr2_x
;ASB	mov     r1,plyr2_y
;ASB	sub     r1,#40
;ASB	movw    temp_ram1,rr0
;ASB	mov     r3,p2_explose
;ASB	bclr    r3,#bit7
;ASB	cmp     r3,#00
;ASB	br      eq,no_explose
;ASB	dec     r3
;ASBdebug2:
;ASB	cmp     r3,#03
;ASB	br      uge,debug2
;ASB	sll     r3
;ASB	call    @explose_idx(r3)
;ASB
;ASBno_explose:
;ASB
;ASB	ret
;ASB
;ASB
;ASBexplose_idx:
;ASB
;ASB	dw      explose1
;ASB	dw      explose2
;ASB	dw      explose3
;ASB
;ASB
;ASBexplose1:
;ASB
;ASB;       movw    rr2,#explose1_tbl
;ASB	br      explose1a_loop
;ASB
;ASBexplose2:
;ASB
;ASB	sub     r1,#20
;ASB;       movw    rr2,#explose2_tbl
;ASB	br      explose1a_loop
;ASB
;ASBexplose3:
;ASB
;ASB	sub     r1,#30
;ASB;       movw    rr2,#explose3_tbl
;ASB
;ASBexplose1a_loop:
;ASB
;ASB	movw    rr4,(rr2)+
;ASB	cmpw    rr4,#00
;ASB	br      eq,end_explose1a
;ASB	mov     r0,(rr2)+
;ASB	mov     r8,r0
;ASB	mov     r0,(rr2)+
;ASB	mov     r9,r0
;ASB	movw    rr0,temp_ram1
;ASB	add     r8,r0
;ASB	cmp     r8,#193
;ASB	br      ugt,explose1a_loop
;ASB	add     r9,r1
;ASB	cmp     r9,#153
;ASB	br      ugt,explose1a_loop
;ASB	pushw   rr2
;ASB	call    map_rtn
;ASB	popw    rr2
;ASB	br      explose1a_loop
;ASB
;ASBend_explose1a:
;ASB
;ASB	ret
;ASB
;ASB
;ASB
;ASB
;ASB
;ASB
;ASB
;ASBpause_box:
;ASB
;ASB	movw    rr8,#0827h
;ASB	mov     r10,#177
;ASB	mov     r11,#81
;ASB	call    Blk_cls
;ASB	movw    rr8,#0827h
;ASB	mov     r10,#177
;ASB	mov     r11,#03
;ASB	mov     r12,#04
;ASB	mov     r14,#81
;ASB	call    draw_rectx
;ASB	call    text_abi
;ASB	mov     R8, #1          ; 16 X 8 FONT
;ASB	call    Sel_font        ; DISPLAY THE INSTRUCTION IN 16 * 8
;ASB	movw    rr8,#0504h
;ASB	movw    rr12,#pause_str
;ASB	call    Str_abs
;ASB	movw    rr8,#0805h
;ASB	movw    rr12,#continue_str
;ASB	call    Str_abs
;ASB	ret
;ASB
;ASBpause_str:
;ASB
;ASB	defm    "Press PAUSE to"
;ASB	db      00
;ASB
;ASBcontinue_str:
;ASB
;ASB	defm    "continue."
;ASB	db      00
;ASB
;ASB
;ASB
;ASB;pass in parameters :   r8 - rectangle upper left x coordinate.
;ASB;                       r9 - rectangle upper left y coordinate.
;ASB;                       r10 - rectangle width
;ASB;                       r11 - color
;ASB;                       r12 - line width
;ASB;                       r14 - rectangle height
;ASB
;ASB
;ASBdraw_rectx:
;ASB	push    r9
;ASB	call    draw_linex
;ASB	add     r9,r14
;ASB	call    draw_linex
;ASB	pop     r9
;ASB	push    r10
;ASB	mov     r10,r14
;ASB	call    draw_v_line
;ASB	pop     r10
;ASB	add     r8,r10
;ASB	sub     r8,r12
;ASB	mov     r10,r14
;ASB	call    draw_v_line
;ASB	ret
;ASB
;ASB
;ASBdraw_v_line:
;ASB
;ASB	mov     r13,#00
;ASB	bbc     cur_page,#0,map_v_line
;ASB	mov     r13,#01
;ASB
;ASBmap_v_line:
;ASB
;ASB	call    Draw_line_v
;ASB	ret
;ASB
;ASB
;ASBdraw_linex:
;ASB	mov     r13,#00
;ASB	bbc     cur_page,#0,map_line
;ASB	mov     r13,#01
;ASBmap_line:
;ASB	call    Draw_line_h
;ASB	ret
;ASB
;ASB
;ASB
;ASBpause_wait:
;ASB
;ASB	call    GetUser
;ASB	cmp     r0,#pause_key
;ASB	br      eq,pause_again
;ASB	cmp     r0,#00
;ASB	br      eq,pause_wait
;ASB	cmp     r0,#b_key
;ASB	br      eq,chk_code_b
;ASB	cmp     r0,#a_key
;ASB	br      eq,chk_code_a
;ASB	cmp     r0,#d_key
;ASB	br      ne,wrong_code
;ASB
;ASBchk_code_d:
;ASB
;ASB	mov     r1,cheat_code
;ASB	cmp     r1,#02
;ASB	br      eq,accept_code
;ASB	cmp     r1,#03
;ASB	br      eq,accept_code
;ASB	cmp     r1,#00
;ASB	br      eq,accept_code2
;ASB	cmp     r1,#81h
;ASB	br      ult,pause_wait
;ASB	cmp     r1,#84h
;ASB	br      ule,accept_code2
;ASB
;ASBwrong_code:
;ASB
;ASB	mov     r1,#00
;ASB	mov     cheat_code,r1
;ASB	br      pause_wait
;ASB
;ASBpause_again:
;ASB
;ASB	ret
;ASB
;ASB
;ASBchk_code_b:
;ASB
;ASB	mov     r1,#00
;ASB	mov     cheat_code,r1
;ASB	br      accept_code
;ASB;        mov     r1,cheat_code
;ASB;        cmp     r1,#00
;ASB;        br      eq,accept_code
;ASB;        br      wrong_code
;ASB
;ASBchk_code_a:
;ASB
;ASB	mov     r1,cheat_code
;ASB	cmp     r1,#85h
;ASB	br      eq,accept_code2
;ASB	cmp     r1,#01
;ASB	br      ne,wrong_code
;ASB
;ASBaccept_code:
;ASB
;ASB	bbs     game_info,#bit0,wrong_code
;ASB	bbs     game_info,#bit6,wrong_code
;ASB	mov     r2,cheat_flag
;ASB	bbs     r2,#bit0,wrong_code
;ASB	mov     r2,internet_flag
;ASB	bbc     r2,#bit0,wrong_code
;ASB	inc     r1
;ASB	mov     cheat_code,r1
;ASB	cmp     r1,#4
;ASB	br      ne,pause_wait
;ASB	mov     r5,#new_screen
;ASB;       call    speech
;ASB	mov     r0,#full_energy
;ASB	mov     p1_energy,r0
;ASB	mov     r0,cheat_flag
;ASB	bset    r0,#bit0
;ASB	mov     cheat_flag,r0
;ASB	clr     r0
;ASB	mov     cheat_code,r0
;ASB	jmp     pause_wait
;ASB
;ASB
;ASB
;ASBaccept_code2:
;ASB
;ASB	bbs     game_info,#bit0,wrong_code
;ASB	bbs     game_info,#bit6,wrong_code
;ASB	mov     r2,cheat_flag
;ASB	bbs     r2,#bit1,wrong_code
;ASB	mov     r2,internet_flag
;ASB	bbc     r2,#bit1,wrong_code
;ASB	bset    r1,#bit7
;ASB	inc     r1
;ASB	mov     cheat_code,r1
;ASB	cmp     r1,#86h
;ASB	jmp     ne,pause_wait
;ASB	mov     r5,#new_screen
;ASB;       call    speech
;ASB	mov     r0,p2_energy
;ASB	clrc
;ASB	srl     r0
;ASB	mov     p2_energy,r0
;ASB	mov     r0,cheat_flag
;ASB	bset    r0,#bit1
;ASB	mov     cheat_flag,r0
;ASB	clr     r0
;ASB	mov     cheat_code,r0
;ASB	jmp     pause_wait
;ASB
;ASB
;ASB
;ASB;in one player mode, final winner's picture show.
;ASB
;ASBwin_picture:
;ASB
;ASB	ret
;ASB
;ASB
;ASBWin_show_name:
;ASB	push    mmu4
;ASB	mov     mmu4,#table2_bank
;ASB	mov     r0,graph_flag
;ASB	bset    r0,#1
;ASB	mov     graph_flag,r0
;ASB	mov     r8,#40
;ASB	mov     r9,#120
;ASB	clr     r2
;ASB	mov     r3,plyr1_id
;ASB	mult    rr2,#2
;ASB	movw    rr6,NAME_WIN(rr2)
;ASB	call    DIS_word
;ASB	mov     r0,graph_flag
;ASB	bclr    r0,#1
;ASB	mov     graph_flag,r0
;ASB	pop     mmu4
;ASB	ret
;ASB
;ASB
;ASBIDOUBLE:
;ASB	defb    71,14,0,160,bankno_legal1      ;double
;ASB
;ASB;IKIDS:
;ASB;        defb    47,7,0,174,bankno_legal1       ;kids
;ASB
;ASBROM_SIGN_1b:
;ASB	 ds     995h
;ASBROM_SIGN_2b:
;ASB	 db     0
	 
	 end

