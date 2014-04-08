	title   Centipede Frogger opening series
	type    8521

;============================================================================
;
;           Includes and equates
;
;----------------------------------------------------------------------------

	include frogger.tmp
	include equate.inc
	include ram.inc
	include disp_ram.inc
	include disp_equ.inc

            global  delay10ms

	program

;============================================================================
;
;           Opening sequence of screens
;
;----------------------------------------------------------------------------

Opening:    global  Opening

            mov     r1,#Game_Open
            mov     GameState,r1

            br      OpeningBypass          ;ZZZ

            call    GameCom

            call    LegalScreen

            call    TitleScreen

OpeningBypass:                             ;ZZZ

            ret

;============================================================================
;
;           The Frogger Legal screen
;
;----------------------------------------------------------------------------

LegalScreen:
            push    dmpl
	mov     dmpl,#0e4h
            mov     r0,#0e4h
            mov     hold_byte1,r0

            ; draw the legal screen frame

            call    DrawFrame

            ; print the text

            movw    rr0,#FrogLegal1
            movw    page_ptr1,rr0
            call    print_string

            movw    rr0,#FrogLegal2
            movw    page_ptr1,rr0
            call    print_string

            movw    rr0,#FrogLegal3
            movw    page_ptr1,rr0
            call    print_string

            movw    rr0,#FrogLegal4
            movw    page_ptr1,rr0
            call    print_string

            movw    rr0,#FrogLegal5
            movw    page_ptr1,rr0
            call    print_string

            movw    rr0,#FrogLegal6
            movw    page_ptr1,rr0
            call    print_string

            ; wait for player to read it

            call    Swap_page
            mov     r2,#25
LegalScreenL1:
            call    delay200ms
            dec     r2
            br      nz,LegalScreenL1

            pop     dmpl
            ret

FrogLegalT1:
            defm    'Frogger is copyright'
FrogLegalL1 equ     $-FrogLegalT1*8
            defb    0
FrogLegalT2:
            defm    'somebody'
FrogLegalL2 equ     $-FrogLegalT2*8
            defb    0
FrogLegalT3:
            defm    'Please tell me who.'
FrogLegalL3 equ     $-FrogLegalT3*8
            defb    0
FrogLegalT4:
            defm    'Software and Graphics'
FrogLegalL4 equ     $-FrogLegalT4*8
            defb    0
FrogLegalT5:
            defb    19
            defm    ' Copyright 1998'
FrogLegalL5 equ     $-FrogLegalT5*8
            defb    0
FrogLegalT6:
            defm    'Tiger Electronics LTD.'
FrogLegalL6 equ     $-FrogLegalT6*8
            defb    0

FrogLegal1:
            defb    200-FrogLegalL1/2,76-24
            defw    FrogLegalT1
FrogLegal2:
            defb    200-FrogLegalL2/2,76-16
            defw    FrogLegalT2
FrogLegal3:
            defb    200-FrogLegalL3/2,76-8
            defw    FrogLegalT3
FrogLegal4:
            defb    200-FrogLegalL4/2,84
            defw    FrogLegalT4
FrogLegal5:
            defb    200-FrogLegalL5/2,84+8
            defw    FrogLegalT5
FrogLegal6:
            defb    200-FrogLegalL6/2,84+16
            defw    FrogLegalT6

;============================================================================
;
;           Draw the Title Screen
;
;           Return r0=0   if end via time expiration
;           Return r0=key if end via keypress
;
;----------------------------------------------------------------------------

TitleScreen:
            push    dmpl
	mov     dmpl,#0e4h
            mov     r0,#0e4h
            mov     hold_byte1,r0

            ; wait for player to press key

            mov     r3,#20
TitleScreenL1:
            mov     temp0,r3
            mov     r2,#30
TitleScreenL2:
            push    r2

            ; draw the Title Screen again

            call    DrawTitle

            ; print the text

            mov     r3,temp0
            btst    r3,#1
            br      z,TitleScreenXT
            movw    rr0,#FrogTitle1
            movw    page_ptr1,rr0
            call    print_string

            movw    rr0,#FrogTitle2
            movw    page_ptr1,rr0
            call    print_string
TitleScreenXT:

            mov     r3,temp0
            push    r3
            call    GetUser
            pop     r3
            mov     temp0,r3
            cmp     r0,#89h
            br      eq,TitleScreenE1
            cmp     r0,#8ah
            br      eq,TitleScreenE1
            cmp     r0,#87h
            br      eq,TitleScreenE1
            cmp     r0,#0
            br      ne,TitleScreenX
TitleScreenE1:
            call    delay20ms
            pop     r2
            dec     r2
            br      nz,TitleScreenL2
            call    Swap_page
            mov     r3,temp0
            dec     r3
            br      nz,TitleScreenL1
            mov     r0,#1
            mov     DemoMode,r0

            pop     dmpl
            ret

            ; player pressed A button

TitleScreenX:
            pop     r2
            pop     dmpl
            ret


FrogTitleT1:
            defm    'Press A Button'
FrogTitleL1 equ     $-FrogTitleT1*8
            defb    0
FrogTitleT2:
            defm    'to Start'
FrogTitleL2 equ     $-FrogTitleT2*8
            defb    0

FrogTitle1:
            defb    200-FrogTitleL1/2,76-8
            defw    FrogTitleT1
FrogTitle2:
            defb    200-FrogTitleL2/2,84
            defw    FrogTitleT2

;============================================================================
;
;           Draw a Frame on the screen
;
;----------------------------------------------------------------------------

DrawFrame:  global  DrawFrame

            ; fill screen with light grey

            mov     r8,#2
            cmp     cur_page,#1
            br      eq,DrawFrame1
            bset    r8,#4
DrawFrame1:
            call    Scn_colr

            ; set up destination as top band

            mov     r9,#0
            mov     r15,#override

            ; draw top frame

            mov     r11,#16
            call    DrawFrame2
            mov     r11,#24
            call    DrawFrame2

            ; draw middle frames

            mov     r1,#16
DrawFrameL1:
            mov     r11,#32
            push    r1
            call    DrawFrame2
            pop     r1
            dec     r1
            br      nz,DrawFrameL1

            ; draw bottom frame

            mov     r11,#240
            call    DrawFrame2
            mov     r11,#248
            jmp     DrawFrame2

            ; subroutine to draw a band

DrawFrame2:

            push    r9
            push    r15

            ; initialize all initial Fi_graph values

            mov     r8,#0
            mov     r10,#0
            mov     r12,#200
            mov     r13,#8
            mov     r14,#bankno_front1

            cmp     cur_page,#1
            br      eq,DrawFrame21
            bset    r15,#1
DrawFrame21

            ; do Fi_graph

            call    Fi_graph

            ; move destination y value down a band and loop

            pop     r15
            pop     r9
            add     r9,#8

            ret

;============================================================================
;
;           Draw title screen raw
;
;----------------------------------------------------------------------------

DrawTitle:

            ; fill screen with light grey

            mov     r8,#2
            cmp     cur_page,#1
            br      eq,DrawTitle1
            bset    r8,#4
DrawTitle1:
            call    Scn_colr

            ; initialize all initial Fi_graph values

            mov     r8,#0
            mov     r9,#0
            mov     r10,#0
            mov     r11,#0
            mov     r12,#200
            mov     r13,#160
            mov     r14,#bankno_front0
            mov     r15,#override

            ; composite is ok for background.

            cmp     cur_page,#1
            br      eq,DrawTitle21
            bset    r15,#1
DrawTitle21

            ; do Fi_graph

            call    Fi_graph

            ret

;============================================================================
;
;           Delay a fifth of a second
;
;----------------------------------------------------------------------------

delay200ms:
        movw    rr0,#0f000h             ;6
d200ms_loop:
        decw    rr0                     ;8
        br      nz,d200ms_loop          ;8

        ret

;============================================================================
;
;           Left Over Stuff
;
;----------------------------------------------------------------------------

delay10ms:
        movw    rr0,#0c00h             ;6
d10ms_loop:
        decw    rr0                     ;8
        br      nz,d10ms_loop           ;8

        ret

        end
