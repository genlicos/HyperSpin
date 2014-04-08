            title   Generalized Game.Com logo screen
            type    8521

;============================================================================
;
;           Includes and equates
;
;----------------------------------------------------------------------------

	include frogger.tmp
	include disp_ram.inc

highdelay   equ     8
plandelay   equ     8

            program

;============================================================================
;
;           Display the Game.Com screen
;
;----------------------------------------------------------------------------

GameCom:    global  GameCom
            push    dmpl
	mov     dmpl,#0e4h

            ; draw two static copies of the Game.Com screen
            call    drawbg
            call    Swap_page
            call    drawbg
            call    Swap_page

            ; set up the counts and delays for the highlight and planet

            mov     r2,#highdelay       ;highlight counter
            mov     r3,#17              ;highlight marker
            mov     r4,#plandelay       ;planet counter
            mov     r5,#6               ;planet marker

            ; this loop is planet and highlight changing
GameComL1:

            ; determine if time to change highlight.  If so, draw on both screens

            dec     r2
            br      nz,GameComNoH
            mov     r2,#highdelay
            pushw   rr2
            pushw   rr4
            call    drawhl
            call    Swap_page
            popw    rr4
            popw    rr2
            pushw   rr2
            pushw   rr4
            call    drawhl
            popw    rr4
            popw    rr2
            dec     r3
            br      z,GameComE1
GameComNoH:
            ; determine if time to rotate planet.  If so, draw on both screens

            dec     r4
            br      nz,GameComNoP1
            mov     r4,#plandelay
            pushw   rr2
            pushw   rr4
            call    drawpl
            call    Swap_page
            popw    rr4
            popw    rr2
            pushw   rr2
            pushw   rr4
            call    drawpl
            popw    rr4
            popw    rr2
            dec     r5
            br      nz,GameComNoP1
            mov     r5,#6
GameComNoP1:
            
            ; keep going in loop

            pushw   rr2
            pushw   rr4
            call    Swap_page
            call    delay20ms
            popw    rr4
            popw    rr2
            br      GameComL1

            ; here once highlight finished-- now loop for planet only

GameComE1:
            mov     r3,#255             ;Delay
GameComL2:
            
            ; only do for a few seconds

            dec     r3
            br      z,GameComE2

            ; rotate planet if it is time

            dec     r4
            br      nz,GameComNoP2
            mov     r4,#plandelay
            pushw   rr2
            pushw   rr4
            call    drawpl
            call    Swap_page
            popw    rr4
            popw    rr2
            pushw   rr2
            pushw   rr4
            call    drawpl
            popw    rr4
            popw    rr2
            dec     r5
            br      nz,GameComNoP2
            mov     r5,#6
GameComNoP2:

            ; continue this loop

            pushw   rr2
            pushw   rr4
            call    Swap_page
            call    delay20ms
            popw    rr4
            popw    rr2
            br      GameComL2

            ; everything done, so bail

GameComE2:
            pop     dmpl
            ret

;============================================================================
;
;           Draw the static Game.Com background
;
;----------------------------------------------------------------------------

drawbg:

            ; fill screen with light grey

            mov     r8,#2
            cmp     cur_page,#1
            br      eq,drawbg1
            bset    r8,#4
drawbg1:
            call    Scn_colr

            ; point to table of vertical source values
	movw    rr4,#bgdata

            ; initialize all initial Fi_graph values

            mov     r8,#0
            mov     r9,#0
            mov     r10,#0
            mov     r12,#200
            mov     r13,#8
            mov     r14,#bankno_front1

            ; composite is ok for background.

            mov     r15,#override
            cmp     cur_page,#1
            br      eq,drawbgLoop
            bset    r15,#1
drawbgLoop:

            ; use vertical source table to load Fi_graph value
            ; quit if value signals end of table

            mov     r7,(rr4)+
            cmp     r7,#255
            br      eq,drawbgEnd
            mov     r11,r7

            ; do register protected Fi_graph

            pushw   rr4
            pushw   rr8
            push    r10
            pushw   rr12
            pushw   rr14
            call    Fi_graph
            popw    rr14
            popw    rr12
            pop     r10
            popw    rr8
            popw    rr4

            ; move destination y value down a band and loop

            add     r9,#8
            br      drawbgLoop
drawbgEnd:
            ret

            ; tell routine which source band to use for next destination band

bgdata:
            defb    16                  ;frame top
            defb    24                  ;frame top
            defb    32                    ;blank
            defb    32                    ;blank
            defb    32                    ;blank
            defb    32                    ;blank
            defb    32                    ;blank
            defb    40                  ;game.com
            defb    48                  ;game.com
            defb    56                  ;game.com
            defb    64                  ;game.com
            defb    32                    ;blank
            defb    32                    ;blank
            defb    32                    ;blank
            defb    32                    ;blank
            defb    32                    ;blank
            defb    32                    ;blank
            defb    72                  ;copyright
            defb    80                  ;frame bottom
            defb    88                  ;frame bottom
            defb    255                 ;QUIT

;============================================================================
;
;           Draw the highlight
;
;----------------------------------------------------------------------------

drawhl:

            ; grab next source band (r3 has band number)

            mov     r2,#0
            movw    rr4,#hldata-1
            addw    rr4,rr2
            mov     r7,(rr4)+

            ; set Fi_graph values

            mov     r8,#19
            mov     r9,#67
            mov     r10,#0
            mov     r11,r7
            mov     r12,#160
            mov     r13,#5
            mov     r14,#bankno_front1

            ; assume forced override of art

            mov     r15,#override
            cmp     cur_page,#1
            br      eq,drawhl1
            bset    r15,#1
drawhl1:
            ; do Fi_graph and exit

            jmp     Fi_graph

            ; source Y offsets of highlight bands

hldata:
            defb    224
            defb    216
            defb    208
            defb    200
            defb    192
            defb    184
            defb    176
            defb    168
            defb    160
            defb    152
            defb    144
            defb    136
            defb    128
            defb    120
            defb    112
            defb    104
            defb    96

;============================================================================
;
;           Draw the Planet
;
;----------------------------------------------------------------------------

drawpl:

            ; get source art x location by converting byte in r5 to word
            ; in rr4.  Then add address of x value table.

            mov     r4,#0
            movw    rr2,#pldatax-1
            addw    rr2,rr4
            mov     r7,(rr2)+
            mov     r10,r7

            ; same idea to get source y location.

            movw    rr2,#pldatay-1
            addw    rr2,rr4
            mov     r7,(rr2)+
            mov     r11,r7

            ; get Fi_graph values

            mov     r8,#102
            mov     r9,#73
            mov     r12,#13
            mov     r13,#13
            mov     r14,#bankno_front1

            ; assume hard replace of image

            mov     r15,#override
            cmp     cur_page,#1
            br      eq,drawpl1
            bset    r15,#1
drawpl1:
            ; call Fi_graph and exit

            jmp     Fi_graph

            ; planet source X offsets

pldatax:
            defb    240
            defb    224
            defb    208
            defb    240
            defb    224
            defb    208

            ; planet source Y offsets

pldatay:
            defb    40
            defb    40
            defb    40
            defb    24
            defb    24
            defb    24

;============================================================================
;
;           Loop for a 50th of a second
;
;----------------------------------------------------------------------------

delay20ms:  global  delay20ms
            movw    rr0,#01800h             ;6
d20ms_loop:
            decw    rr0                     ;8
            br      nz,d20ms_loop          ;8

            ret

            end
