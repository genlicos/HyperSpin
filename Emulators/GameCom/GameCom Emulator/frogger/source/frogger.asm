	;note : temp_code for qc & comment use only.
	;kill it if release code.

	title   FIGHTER MEGAMIX
	type    8521

	NLIST
	include equate.inc
	include ram.inc
	include disp_ram.inc
	include disp_equ.inc
	LIST

	include frogger.tmp

	program


	db      08h
	db      20h
	dw      GameEntry
	db      00000011b               ;3
	dm      'TigerDMGC'
	db      bankno_winpic10         ;icon located bank no.
	db      175                     ;x_coord.
	db      0                       ;y_coord.
	dm      'froggmega'             ;9-bytes
	dw      frogger_id              ;0426h
	db      08fh
	db      0
	dw      0



abaker1:    global  abaker1
            nop
            ret

abaker2:    global  abaker2
            nop
            ret

abaker3:    global  abaker3
            nop
            ret

abaker4:    global  abaker4
            nop
            ret

abaker5:    global  abaker5
	cmp	LastKey,#08bh
	br	nz,abaker5x
            nop
abaker5x:
            ret

GameEntry:

	clr     r0
	cmp     r2,#ini_game
	br      eq,GameInit
	cmp     r2,#exe_game
	jmp     eq,Game_Exe
	cmp     r2,#close_game
	br      eq,Game_Close
	cmp     r2,#reset_game
	br      eq,Game_Reset
	mov     r0,#0ffh
	ret

Game_Reset:

	ret

;ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·
;º  game close   º
;ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ½

Game_Close:
	call	stop_melody
	ret

;ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·
;º  game init   º
;ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄ½

GameInit:
            clr     0
            ret
real_init:


	mov     mmu3,#program_bank2
;        call    init_isr
	call    Disp_setup
	call    enable_timeout          ;(11/3_)
	call    enable_pause
	clr     r0
	mov     r2,#0c0h

upper_clean:

	cmp     r2,#0
	br      eq,lower_cleanx
	mov     (r2)+,r0
	br      upper_clean

lower_cleanx:

	movw    rr2,#208h

lower_clean:

	mov     (rr2)+,r0
	cmpw    rr2,#37fh
	br      ule,lower_clean
;ASB	bbc     game_info2,#bit5,end_init_rec
;ASB	mov     r2,#3
;	mov     Record_min1R,r2
;ASB	mov     r2,#6
;	mov     Record_min3R,r2
;ASB	mov     r2,#9
;	mov     Record_min5R,r2
;ASB	clr     r2
;	mov     Record_sec1R,r2
;	mov     Record_sec3R,r2
;	mov     Record_sec5R,r2
;ASB	mov     r2,#2
;	mov     Record_3min,r2
;ASB	inc     r2
;	mov     Record_7min,r2
;ASB	inc     r2
;	mov     Record_15min,r2

end_init_rec:

;ASB	mov     r2,#2
;ASB	mov     diff_ram,r2
;ASB	mov     rnd_ram,r2
;ASB	mov     r2,#8
;ASB	mov     plyr1_life,r2
;ASB	mov     plyr2_life,r2
;ASB	mov     r2,#80h
;ASB	mov     legal_flag,r2
	and     p3,#0f0h
	bset    sound_flag,#7         ;set start melody flag.
	mov     r0,#05                  ;opening melody.
	mov     new_melody_ptr,r0
;ASB	mov     r5,#silience

;        call    speech

restart_init:

	call	stop_melody
	clr     r0
            mov     DemoMode,r0
            mov     GameMode,r0
            mov     Continue,r0
            mov     Paused,r0
            inc     r0
	mov     new_melody_ptr,r0
            mov     NumPlayers,r0
            mov     Difficulty,r0
            mov     StartLevel,r0
            mov     SfxOn,r0
            mov     MusicOn,r0
            inc     r0
            inc     r0
            mov     Lives,r0
            clr     r0

	ret




;ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·
;º   game execute   º
;ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ½

Game_Die:   global  Game_Die
            movw    sp,HoldSP
	mov     r0,#02
	ret
Game_Exe:
            movw    HoldSP,sp
ResetGame:  global  ResetGame
            movw    sp,HoldSP

            call    real_init

	push    mmu3
	mov     mmu3,#program_bank5

            call    Opening

	pop     mmu3

            mov     r0,DemoMode
            cmp     r0,#1
            br      eq,BypassMenus

FromMainMenu:   global  FromMainMenu

            movw    sp,HoldSP

	;call	cont_melody
	push    mmu3
	mov     mmu3,#program_bank5

            mov     r1,#Game_Menus
            mov     GameState,r1

            call    Menus

	pop     mmu3

BypassMenus:

	movw	rr2,#DemoInput
	movw	DemoPtr,rr2

	mov	r1,#1
	mov	DemoCnt,r1

            mov     r1,#Game_Init
            mov     GameState,r1

	mov     mmu3,#program_bank3
	mov     mmu4,#program_bank6
            jmp     Game


CK_page:
	cmp     cur_page,#1
	br      eq,back_page_a
	bset    r15,#1
back_page_a:
	ret

;============================================================================
;
;           Process keyboard with pop-up menus
;
;----------------------------------------------------------------------------

GetUser:    global  GetUser

            movw    rr2,CursorX
            pushw   rr2
            mov     r2,temp0
            push    r2

	push    mmu3
	mov     mmu3,#program_bank5

	mov	r1,GameState
	cmp	r1,#Game_Play
	br	ne,GetUserKey

            mov     r1,DemoMode
            cmp     r1,#1
            br      eq,GetUserDemo

GetUserKey:
            call    SCAN_KEY
	mov	LastKey,r0
	br	GetUserDone

GetUserDemo:
	call	SCAN_KEY
	cmp	r0,#0
	jmp	nz,FromMainMenu

	mov	r0,DemoCnt
	dec	r0
	br	z,GetUserNext
	mov	DemoCnt,r0
	mov	r0,#0
	br	GetUserDone

GetUserNext:
	movw	rr2,DemoPtr
	mov	r0,(rr2)+
	movw	DemoPtr,rr2
	btst	r0,#80h
	br	nz,GetUserDone
	cmp	r0,#0
	jmp	z,ResetGame
	mov	DemoCnt,r0
	mov	r0,#0

GetUserDone:
	

            mov     r1,GameState
            cmp     r1,#Game_Init
            br      lt,GetUserNoP

            mov     r1,DemoMode
            cmp     r1,#1
            br      eq,GetUserNoP

            cmp     r0,#8ah
            br      eq,GetUserPause

GetUserNoP:
            cmp     r0,#87h
            br      eq,GetUserMenu
            cmp     r0,#89h
            br      ne,GetUserExit

            ; handle Sound Menu

GetUserSound:
            call    SoundMenu
            mov     r0,#0
            br      GetUserExit

            ; handle Menu Menu

GetUserMenu:
            mov     r1,DemoMode
            cmp     r1,#1
            br      eq,GetUserExiter

            mov     r1,GameState
            cmp     r1,#Game_Init
            br      lt,GetUserExiter

GetUserRestart:
            call    RestartMenu
            mov     r0,#0
            br      GetUserExit

GetUserExiter:
            call    ExitMenu
            mov     r0,#0
            br      GetUserExit

            ; handle Pause Menu

GetUserPause:
            call    PauseMenu
            mov     r0,#0

            ; bail

GetUserExit:
	pop     mmu3
            pop     r2
            mov     temp0,r2
            popw    rr2
            movw    CursorX,rr2
            ret

;============================================================================
;
;           print a string on the screen: Variable
;
;	r0  =  x
;	r1  =  y
;	rr2 -> Text String
;
;----------------------------------------------------------------------------

print_stringv: global print_stringv
	mov	index1,r0
	mov	index2,r1
	movw	page_ptr1,rr2
	br	pstring_loop

;============================================================================
;
;           print a string on the screen: Full fixed
;
;----------------------------------------------------------------------------

print_string: global print_string
       movw     rr2,page_ptr1
       mov      r0,(rr2)+
       mov      index1,r0
       mov      r0,(rr2)+
       mov      index2,r0
       movw     rr2,@rr2
       movw     page_ptr1,rr2

pstring_loop:
       movw     rr2,page_ptr1
       mov      r0,(rr2)+
       movw     page_ptr1,rr2
       or       r0,r0
       br       z,pstring_exit

       cmp      r0,#' '
       br       z,pstring_space

       call     get_font_info
       mov      r0,index2
       mov      r9,r0          ;yloc
       mov      r0,index1
       mov      r8,r0          ;xloc
       mov      r15,#01        ;1=trans/0=rep
       call     CK_page
       push     dmpl
       mov      r0,hold_byte1 ;#0e4h ;hold_byte1
       mov      dmpl,r0
       call     Fi_graph
       pop      dmpl

pstring_space:
       mov      r0,index1
       add      r0,#8
       mov      index1,r0
       br       pstring_loop

pstring_exit:
       ret

;============================================================================
;
;           get the font information for the print routines
;
;----------------------------------------------------------------------------

get_font_info:

            mov     R15,#0

            ; test for numeric or less

            cmp     r0,#'9'
            br      ule,gfilow

            ; alpha test entry

gfiretest:
            ; test for alpha or less

            cmp     r0,#'Z'
            br      ule,gficap

            ; test for lower

            cmp     r0,#'a'
            br      ult,gfihigh

            ; lower case

            sub     r0,#20h
            br      gfiretest

gfilow:
            ; test for numeric

            cmp     r0,#'0'
            br      eq,gfisetzero
            br      ge,gfinumber

            movw    rr10,#0a008h
            cmp     r0,#'('
            br      eq,gfidone

            movw    rr10,#0a808h
            cmp     r0,#'.'
            br      eq,gfidone

            movw    rr10,#06808h
            cmp     r0,#'-'
            br      eq,gfidone

            cmp     r0,#20h
            br      lt,gfispecial

gfiblank:
            movw    rr10,#0b808h
            cmp     r0,#'?'
            br      eq,gfidone

            movw    RR10,#1820h
            cmp     r0,#')'
            br      ne,gfidone

            movw    rr10,#0a008h
            mov     r15,#left_right
            br      gfidone

gfihigh:
            cmp     r0,#'_'
            br      ne,gfiblank

            movw    rr10,#0b008h
            br      gfiblank

gfinumber:
            sub     r0,#'1'
            sll     r0
            sll     r0
            sll     r0
            mov     r10,r0
            mov     r11,#8
            br      gfidone

gfisetzero:
            mov     r0,#'O'

gficap:
            cmp     r0,#'A'
            br      ult,gfiblank

            sub     r0,#'A'
            sll     r0
            sll     r0
            sll     r0
            mov     r10,r0
            mov     r11,#0

gfidone:
            movw    rr12,#0808h              ;xsize,ysize
            mov     r14,#bankno_front1       ;ROM page

            ret

gfispecial:
	dec	r0
            sll     r0
            mov     r1,r0
            mov     r0,#0
            movw    rr2,#gfidata
            addw    rr2,rr0
            mov     r1,(rr2)+
            mov     r15,r1
            mov     r1,(rr2)+
            mov     r10,r1
            mov     r11,#8
            br      gfidone

gfidata:
            defb    000h,72             ; 1 = Whatever
            defb    000h,80             ; 2 = Frog
            defb    000h,88             ; 3 = upper left edge
            defb    040h,88             ; 4 = upper right edge
            defb    080h,88             ; 5 = lower left edge
            defb    0c0h,88             ; 6 = lower right edge
            defb    000h,96             ; 7 = right edge
            defb    040h,96             ; 8 = left edge
            defb    000h,112            ; 9 = right hemi
            defb    040h,112            ;10 = left hemi
            defb    000h,120            ;11 = sphere
            defb    000h,128            ;12 = down arrow
            defb    080h,128            ;13 = up arrow
            defb    000h,136            ;14 = right arrow
            defb    040h,136            ;15 = left arrow
            defb    000h,144            ;16 = copyright
            defb    000h,152            ;17 = registered

;============================================================================
;
;           Print the score
;
;	r0  =  x
;	r1  =  y
;	rr2 =  score
;
;----------------------------------------------------------------------------

print_score: global print_score

	; set field to zeros

	movw	temp0w,#3030h
	movw	temp1w,#3030h
	movw	temp0,#3000h

	; get divisor and pointer to field

	movw	rr4,#10
	movw	rr6,#temp1

print_scoreL0:

	; if no more score, bail

	cmpw	rr2,#0
	br	eq,print_scoreJ0

	; get lowest order figit

	div	rr2,rr4
	or	r4,#30h
	mov	-(rr6),r4

	; loop

	br	print_scoreL0

print_scoreJ0:

	; assume erase zeros and five digits

	movw	rr4,#4
	movw	rr6,#temp0w

print_scoreL1:

	;get digit and test for zero

	mov	r2,@rr6
	cmp	r2,#0
	br	eq,print_scoreJ1

	; not zero, set "do not erase flag"

	inc	r4
	br	print_scoreJ2

	; test do not erase flag

print_scoreJ1:
	cmp	r4,#0
	br	ne,print_scoreJ2

	; erase zero to blanks

	mov	r7,#32
	mov 	0(rr6),r7

print_scoreJ2:

	; go to next digit

	incw	rr6
	dec	r5
	br	nz,print_scoreL1

	; do the print

	movw	rr2,#temp0w
	call	print_stringv
	ret

cont_melody: global cont_melody
	bbs	sound_flag,#7,start_melody	   ;start again.
	bbs	sp_control,#0,bat_mel1
	mov	r0,Melody_Register
	bbs	r0,#0,bat_mel1
start_melody: global start_melody
	bclr	sound_flag,#7
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
        dw      option_melH     ;9
        dw      option_melH     ;10
        dw      option_melH     ;11
        dw      option_melH     ;12
        dw      option_melH     ;13
        dw      option_melH     ;14
        dw      option_melH     ;15
        dw      option_melH     ;16
        dw      option_melH     ;17
        dw      option_melH     ;18
        dw      option_melH     ;19

melody_low:

	dw	game_mel1L
	dw	game_mel2L
	dw	game_mel3L
        dw      game_mel4L
	dw	open_melL
	dw	s_end_melL
	dw	h_end_melL
	dw	option_melL
	dw	option_melL
	dw	option_melL
	dw	option_melL
	dw	option_melL
	dw	option_melL
	dw	option_melL
	dw	option_melL
	dw	option_melL
	dw	option_melL
	dw	option_melL
	dw	option_melL

	end
