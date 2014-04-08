	type	8521
	NLIST
	include	melody.inc
	LIST

        global  game_mel1H,game_mel2H,game_mel3H,game_mel4H,open_melH,s_end_melH
        global  h_end_melH,option_melH
        global  game_mel1L,game_mel2L,game_mel3L,game_mel4L,open_melL,s_end_melL
        global  h_end_melL,option_melL


NLH	EQU	1fh
NLL	EQU	1fh
A_LEN	EQU	5

;
; GAMEPLAY 1
;LABEL0001H:
game_mel1H:
        db      A3,NLH,A_LEN*8/8
        db      A3,NLH,A_LEN*8/8
        db      A3,NLH,A_LEN*16/8
        db      A3,NLH,A_LEN*16/8
        db      A3,NLH,A_LEN*8/8
        db      A3,NLH,A_LEN*8/8
        db      B3,NLH,A_LEN*16/8
        db      A3,NLH,A_LEN*8/8
        db      D3,NLH,A_LEN*8/8
        db      A3,NLH,A_LEN*8/8
        db      D3,NLH,A_LEN*8/8
        db      D3,NLH,A_LEN*8/8
        db      D3,NLH,A_LEN*8/8
        db      E3,NLH,A_LEN*32/8
        db      E3,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*8/8
        db      E3,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*16/8
;LABEL0001H:
        db      A3,NLH,A_LEN*32/8
        db      A3,NLH,A_LEN*24/8
        db      A3,NLH,A_LEN*8/8
        db      A3,NLH,A_LEN*16/8
        db      A4,NLH,A_LEN*16/8
        db      A3,NLH,A_LEN*16/8
        db      A3,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*32/8
        db      E3,NLH,A_LEN*24/8
        db      B3,NLH,A_LEN*8/8
        db      D4,NLH,A_LEN*16/8
        db      E4,NLH,A_LEN*16/8
        db      E4,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*16/8
;LABEL0001H:
        db      E3,NLH,A_LEN*32/8
        db      E4,NLH,A_LEN*24/8
        db      E3,NLH,A_LEN*8/8
        db      B3,NLH,A_LEN*16/8
        db      G3,NLH,A_LEN*8/8
        db      G3,NLH,A_LEN*8/8
        db      G3,NLH,A_LEN*16/8
        db      G3,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*16/8
        db      A3,NLH,A_LEN*8/8
        db      A3,NLH,A_LEN*8/8
        db      A3,NLH,A_LEN*16/8
        db      A3,NLH,A_LEN*16/8
        db      G3,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*8/8
        db      E3,NLH,A_LEN*8/8
        db      E3,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*16/8
;LABEL0001H:
        db      E4,NLH,A_LEN*16/8
        db      A3,NLH,A_LEN*8/8
        db      A3,NLH,A_LEN*8/8
        db      A4,NLH,A_LEN*16/8
        db      A4,NLH,A_LEN*16/8
        db      G3,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*8/8
        db      E3,NLH,A_LEN*8/8
        db      E3,NLH,A_LEN*16/8
        db      E4,NLH,A_LEN*8/8
        db      E3,NLH,A_LEN*8/8
        db      E3,NLH,A_LEN*16/8
        db      A3,NLH,A_LEN*8/8
        db      A3,NLH,A_LEN*8/8
        db      A4,NLH,A_LEN*16/8
        db      A3,NLH,A_LEN*16/8
        db      G3,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*8/8
        db      E3,NLH,A_LEN*8/8
        db      E3,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*8/8
        db      E3,NLH,A_LEN*8/8
;LABEL0001H:
        db      E3,NLH,A_LEN*16/8
        db      A3,NLH,A_LEN*8/8
        db      A3,NLH,A_LEN*8/8
        db      A3,NLH,A_LEN*16/8
        db      A3,NLH,A_LEN*16/8
        db      G3,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*8/8
        db      E3,NLH,A_LEN*8/8
        db      D3,NLH,A_LEN*16/8
        db      D3,NLH,A_LEN*8/8
        db      D3,NLH,A_LEN*8/8
	db	0,0,0

;
; GAMEPLAY 2
;LABEL0002H:
game_mel2H:
        db      E3,NLH,A_LEN*32/8
        db      PAUSE,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*16/8
        db      D3,NLH,A_LEN*16/8
        db      D3,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*32/8
        db      PAUSE,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*16/8
        db      D3,NLH,A_LEN*16/8
        db      D3,NLH,A_LEN*16/8
;LABEL0002H:
        db      E3,NLH,A_LEN*32/8
        db      PAUSE,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*16/8
        db      D3,NLH,A_LEN*16/8
        db      D3,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*32/8
        db      PAUSE,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*16/8
        db      B3,NLH,A_LEN*32/8
        db      B3,NLH,A_LEN*32/8
;LABEL0002H:
        db      E3,NLH,A_LEN*32/8
        db      PAUSE,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*16/8
        db      D3,NLH,A_LEN*16/8
        db      D3,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*32/8
        db      PAUSE,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*16/8
        db      D3,NLH,A_LEN*16/8
        db      D3,NLH,A_LEN*16/8
;LABEL0002H:
        db      E3,NLH,A_LEN*32/8
        db      PAUSE,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*16/8
        db      D3,NLH,A_LEN*16/8
        db      D3,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*32/8
        db      PAUSE,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*16/8
        db      B3,NLH,A_LEN*32/8
        db      B3,NLH,A_LEN*32/8
	db	0,0,0

;
; GAMEPLAY 3
;LABEL0003H:
game_mel3H:
        db      E3,NLH,A_LEN*8/8
        db      E3,NLH,A_LEN*8/8
        db      E3,NLH,A_LEN*8/8
        db      E3,NLH,A_LEN*8/8
        db      E3,NLH,A_LEN*16/8
        db      PAUSE,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*16/8
        db      PAUSE,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*16/8
        db      D3,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*16/8
        db      PAUSE,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*16/8
        db      PAUSE,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*16/8
        db      PAUSE,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*16/8
        db      D3,NLH,A_LEN*16/8
;LABEL0003H:
        db      E3,NLH,A_LEN*8/8
        db      E3,NLH,A_LEN*8/8
        db      E3,NLH,A_LEN*8/8
        db      E3,NLH,A_LEN*8/8
        db      E3,NLH,A_LEN*16/8
        db      PAUSE,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*16/8
        db      PAUSE,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*16/8
        db      C4,NLH,A_LEN*16/8
        db      C4,NLH,A_LEN*16/8
        db      B3,NLH,A_LEN*8/8
        db      C4,NLH,A_LEN*16/8
        db      G3,NLH,A_LEN*16/8
        db      C4,NLH,A_LEN*16/8
        db      D4,NLH,A_LEN*16/8
        db      PAUSE,NLH,A_LEN*16/8
        db      D4,NLH,A_LEN*16/8
        db      D4,NLH,A_LEN*16/8
;LABEL0003H:
        db      E3,NLH,A_LEN*16/8
        db      PAUSE,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*16/8
        db      PAUSE,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*16/8
        db      PAUSE,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*16/8
        db      D3,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*8/8
        db      E3,NLH,A_LEN*8/8
        db      E3,NLH,A_LEN*8/8
        db      E3,NLH,A_LEN*8/8
        db      E3,NLH,A_LEN*16/8
        db      PAUSE,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*16/8
        db      PAUSE,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*16/8
        db      D3,NLH,A_LEN*16/8
;LABEL0003H:
        db      E4,NLH,A_LEN*8/8
        db      E3,NLH,A_LEN*8/8
        db      E3,NLH,A_LEN*8/8
        db      E3,NLH,A_LEN*8/8
        db      E3,NLH,A_LEN*16/8
        db      PAUSE,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*16/8
        db      PAUSE,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*16/8
        db      C4,NLH,A_LEN*16/8
        db      C4,NLH,A_LEN*16/8
        db      C4,NLH,A_LEN*8/8
        db      C4,NLH,A_LEN*8/8
        db      PAUSE,NLH,A_LEN*16/8
        db      C4,NLH,A_LEN*16/8
        db      PAUSE,NLH,A_LEN*16/8
        db      C4,NLH,A_LEN*16/8
        db      G3,NLH,A_LEN*8/8
        db      G3,NLH,A_LEN*8/8
	db	0,0,0

;
; GAMEPLAY 4
;LABEL0004H:
game_mel4H:
        db      C4S,NLH,A_LEN*16/8
        db      C4S,NLH,A_LEN*16/8
        db      C4S,NLH,A_LEN*16/8
        db      B3,NLH,A_LEN*16/8
        db      D4,NLH,A_LEN*16/8
        db      D4,NLH,A_LEN*16/8
        db      D4,NLH,A_LEN*16/8
        db      B3,NLH,A_LEN*16/8
        db      E4,NLH,A_LEN*16/8
        db      E4,NLH,A_LEN*16/8
        db      E4,NLH,A_LEN*16/8
        db      C4S,NLH,A_LEN*16/8
        db      F4S,NLH,A_LEN*16/8
        db      F4S,NLH,A_LEN*16/8
        db      F4S,NLH,A_LEN*16/8
        db      F4S,NLH,A_LEN*16/8
        db      A4,NLH,A_LEN*16/8
        db      E4,NLH,A_LEN*16/8
        db      A4,NLH,A_LEN*16/8
        db      E4,NLH,A_LEN*16/8
        db      D4,NLH,A_LEN*16/8
        db      D4,NLH,A_LEN*16/8
        db      D4,NLH,A_LEN*16/8
        db      A3,NLH,A_LEN*16/8
;LABEL0004H:
        db      E4,NLH,A_LEN*16/8
        db      E4,NLH,A_LEN*16/8
        db      E4,NLH,A_LEN*16/8
        db      E4,NLH,A_LEN*16/8
        db      A4,NLH,A_LEN*16/8
        db      A4,NLH,A_LEN*16/8
        db      A4,NLH,A_LEN*16/8
        db      A4,NLH,A_LEN*16/8
        db      C4S,NLH,A_LEN*16/8
        db      C5S,NLH,A_LEN*16/8
        db      C5S,NLH,A_LEN*16/8
        db      B3,NLH,A_LEN*16/8
        db      D4,NLH,A_LEN*16/8
        db      D4,NLH,A_LEN*16/8
        db      D4,NLH,A_LEN*16/8
        db      B3,NLH,A_LEN*16/8
        db      E4,NLH,A_LEN*16/8
        db      E4,NLH,A_LEN*16/8
        db      E4,NLH,A_LEN*16/8
        db      C4,NLH,A_LEN*16/8
        db      F4S,NLH,A_LEN*16/8
        db      F4S,NLH,A_LEN*16/8
        db      F4S,NLH,A_LEN*16/8
        db      F4S,NLH,A_LEN*16/8
;LABEL0004H:
        db      A4,NLH,A_LEN*16/8
        db      E4,NLH,A_LEN*16/8
        db      A4,NLH,A_LEN*16/8
        db      E4,NLH,A_LEN*16/8
        db      D4,NLH,A_LEN*16/8
        db      D4,NLH,A_LEN*16/8
        db      D4,NLH,A_LEN*16/8
        db      A3,NLH,A_LEN*16/8
        db      E4,NLH,A_LEN*32/8
        db      E4,NLH,A_LEN*16/8
        db      E4,NLH,A_LEN*16/8
	db	0,0,0
;
; OPENING
;LABEL0005H:
open_melH:
        db      B3,NLH,A_LEN*8/8
        db      A3,NLH,A_LEN*8/8
        db      F3S,NLH,A_LEN*8/8
        db      E3,NLH,A_LEN*8/8
        db      D3,NLH,A_LEN*8/8
        db      D3,NLH,A_LEN*8/8
        db      A3,NLH,A_LEN*8/8
        db      C4,NLH,A_LEN*8/8
        db      A3,NLH,A_LEN*8/8
        db      A3,NLH,A_LEN*8/8
        db      A3,NLH,A_LEN*8/8
        db      A3,NLH,A_LEN*8/8
        db      A4,NLH,A_LEN*32/8
        db      A4,NLH,A_LEN*32/8
        db      A4,NLH,A_LEN*16/8
        db      A4,NLH,A_LEN*16/8
;LABEL0005H:
        db      G3,NLH,A_LEN*8/8
        db      G3,NLH,A_LEN*24/8
        db      G3,NLH,A_LEN*8/8
        db      G3,NLH,A_LEN*32/8
        db      G3,NLH,A_LEN*32/8
        db      G3,NLH,A_LEN*16/8
        db      G3,NLH,A_LEN*16/8
        db      F3,NLH,A_LEN*8/8
        db      F3,NLH,A_LEN*8/8
        db      F3,NLH,A_LEN*8/8
        db      F3,NLH,A_LEN*32/8
        db      F3,NLH,A_LEN*32/8
        db      F3,NLH,A_LEN*16/8
        db      F3,NLH,A_LEN*16/8
;LABEL0005H:
        db      G3,NLH,A_LEN*8/8
        db      G3,NLH,A_LEN*8/8
        db      G3,NLH,A_LEN*8/8
        db      G3,NLH,A_LEN*8/8
        db      G5,NLH,A_LEN*32/8
        db      E4,NLH,A_LEN*8/8
        db      D4,NLH,A_LEN*8/8
        db      B3,NLH,A_LEN*8/8
        db      A3,NLH,A_LEN*8/8
        db      G3,NLH,A_LEN*8/8
        db      G5,NLH,A_LEN*8/8
        db      G5,NLH,A_LEN*16/8
        db      D4,NLH,A_LEN*32/8
	db	0,0,0

;
; H-END
;LABEL0006H:
h_end_melH:
        db      A3,NLH,A_LEN*32/8
        db      D4,NLH,A_LEN*32/8
        db      G3,NLH,A_LEN*32/8
        db      C4,NLH,A_LEN*32/8
        db      C4,NLH,A_LEN*16/8
        db      C4,NLH,A_LEN*8/8
        db      C4,NLH,A_LEN*8/8
        db      G3,NLH,A_LEN*8/8
        db      A4,NLH,A_LEN*16/8
        db      G3,NLH,A_LEN*8/8
        db      A4,NLH,A_LEN*16/8
        db      G3,NLH,A_LEN*8/8
        db      A4,NLH,A_LEN*16/8
        db      G3,NLH,A_LEN*8/8
        db      A4,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*16/8
        db      E4,NLH,A_LEN*8/8
        db      E4,NLH,A_LEN*8/8
;LABEL0006H:
        db      G3,NLH,A_LEN*8/8
        db      A3,NLH,A_LEN*16/8
        db      G3,NLH,A_LEN*8/8
        db      A3,NLH,A_LEN*16/8
        db      G3,NLH,A_LEN*8/8
        db      A3,NLH,A_LEN*16/8
        db      G3,NLH,A_LEN*16/8
        db      D4,NLH,A_LEN*24/8
        db      D4,NLH,A_LEN*8/8
        db      C4,NLH,A_LEN*8/8
        db      G3,NLH,A_LEN*8/8
        db      A3,NLH,A_LEN*16/8
        db      G3,NLH,A_LEN*8/8
        db      A3,NLH,A_LEN*16/8
        db      G3,NLH,A_LEN*8/8
        db      A3,NLH,A_LEN*16/8
        db      G3,NLH,A_LEN*8/8
        db      A3,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*8/8
        db      E3,NLH,A_LEN*8/8
        db      G3,NLH,A_LEN*8/8
        db      A3,NLH,A_LEN*16/8
        db      G3,NLH,A_LEN*8/8
        db      A3,NLH,A_LEN*16/8
        db      G3,NLH,A_LEN*8/8
        db      A3,NLH,A_LEN*16/8
        db      G3,NLH,A_LEN*16/8
        db      D4,NLH,A_LEN*24/8
        db      D5,NLH,A_LEN*8/8
        db      D5,NLH,A_LEN*8/8
;LABEL0006H:
        db      G3,NLH,A_LEN*8/8
        db      A3,NLH,A_LEN*16/8
        db      G3,NLH,A_LEN*8/8
        db      A3,NLH,A_LEN*16/8
        db      G3,NLH,A_LEN*8/8
        db      A3,NLH,A_LEN*16/8
        db      G3,NLH,A_LEN*8/8
        db      A3,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*8/8
        db      E3,NLH,A_LEN*8/8
        db      G3,NLH,A_LEN*8/8
        db      A3,NLH,A_LEN*16/8
        db      G3,NLH,A_LEN*8/8
        db      A3,NLH,A_LEN*16/8
        db      G3,NLH,A_LEN*8/8
        db      A3,NLH,A_LEN*16/8
        db      A3,NLH,A_LEN*8/8
        db      A3,NLH,A_LEN*8/8
        db      A3,NLH,A_LEN*16/8
        db      PAUSE,NLH,A_LEN*16/8
	db	0,0,0

;
; S-END
;LABEL0007H:
s_end_melH:

        db      G3,NLH,A_LEN*16/8
        db      G3,NLH,A_LEN*16/8
        db      G3,NLH,A_LEN*8/8
        db      G3S,NLH,A_LEN*24/8
        db      F3,NLH,A_LEN*16/8
        db      F3,NLH,A_LEN*32/8
        db      F3,NLH,A_LEN*32/8
        db      F3,NLH,A_LEN*32/8
        db      E3,NLH,A_LEN*16/8
        db      F3,NLH,A_LEN*16/8
        db      F3,NLH,A_LEN*32/8
        db      F3,NLH,A_LEN*32/8
        db      F3,NLH,A_LEN*32/8
        db      G3,NLH,A_LEN*16/8
;LABEL0007H:
        db      A3,NLH,A_LEN*16/8
        db      A3,NLH,A_LEN*32/8
        db      A3,NLH,A_LEN*32/8
        db      A3,NLH,A_LEN*32/8
        db      E3,NLH,A_LEN*16/8
        db      A3,NLH,A_LEN*32/8
        db      G3,NLH,A_LEN*16/8
        db      G3,NLH,A_LEN*16/8
        db      G3,NLH,A_LEN*8/8
        db      G3S,NLH,A_LEN*24/8
        db      A3,NLH,A_LEN*32/8
        db      A3,NLH,A_LEN*32/8
	db	0,0,0

;
; OPTION
;LABEL0008H:
option_melH:
        db      E3,NLH,A_LEN*16/8
        db      E4,NLH,A_LEN*16/8
        db      D4,NLH,A_LEN*16/8
        db      C4,NLH,A_LEN*16/8
        db      D4,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*16/8
        db      C4,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*16/8
        db      B4,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*16/8
        db      C4,NLH,A_LEN*16/8
        db      E4,NLH,A_LEN*16/8
        db      D4,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*16/8
        db      E4,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*16/8
        db      E4,NLH,A_LEN*16/8
        db      D4,NLH,A_LEN*16/8
        db      C4,NLH,A_LEN*16/8
        db      D4,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*16/8
        db      C4,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*16/8
;LABEL0008H:
        db      B4,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*16/8
        db      C4,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*16/8
        db      D4,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*16/8
        db      E4,NLH,A_LEN*16/8
        db      E3,NLH,A_LEN*16/8
	db	0,0,0




;LABEL0001L:

game_mel1L:

        db      PAUSE,NLL,A_LEN*16/8
        db      A6,NLL,A_LEN*16/8
        db      A6,NLL,A_LEN*16/8
        db      A6,NLL,A_LEN*16/8
        db      B6,NLL,A_LEN*16/8
        db      A6,NLL,A_LEN*8/8
        db      G6,NLL,A_LEN*8/8
        db      A6,NLL,A_LEN*8/8
        db      G6,NLL,A_LEN*8/8
        db      F6S,NLL,A_LEN*8/8
        db      D6,NLL,A_LEN*8/8
        db      E6,NLL,A_LEN*32/8
        db      E6,NLL,A_LEN*8/8
        db      G6,NLL,A_LEN*8/8
        db      B6,NLL,A_LEN*32/8
        db      B6,NLL,A_LEN*32/8
        db      B5,NLL,A_LEN*8/8
        db      A6,NLL,A_LEN*8/8
        db      G6,NLL,A_LEN*8/8
;LABEL0001L:
        db      A6,NLL,A_LEN*16/8
        db      G6,NLL,A_LEN*8/8
        db      F6S,NLL,A_LEN*8/8
        db      G6,NLL,A_LEN*16/8
        db      F6S,NLL,A_LEN*8/8
        db      E6,NLL,A_LEN*8/8
        db      F6S,NLL,A_LEN*16/8
        db      E6,NLL,A_LEN*8/8
        db      D6,NLL,A_LEN*8/8
        db      E6,NLL,A_LEN*16/8
        db      E6,NLL,A_LEN*8/8
        db      D6,NLL,A_LEN*8/8
        db      E6,NLL,A_LEN*32/8
        db      E6,NLL,A_LEN*32/8
        db      E6,NLL,A_LEN*32/8
        db      E6,NLL,A_LEN*32/8
;LABEL0001L:
        db      PAUSE,NLL,A_LEN*16/8
        db      E6,NLL,A_LEN*8/8
        db      B5,NLL,A_LEN*8/8
        db      D6,NLL,A_LEN*8/8
        db      E6,NLL,A_LEN*8/8
        db      A6,NLL,A_LEN*8/8
        db      B5,NLL,A_LEN*8/8
        db      D6,NLL,A_LEN*8/8
        db      E6,NLL,A_LEN*8/8
        db      A6,NLL,A_LEN*8/8
        db      B6,NLL,A_LEN*8/8
        db      D6,NLL,A_LEN*8/8
        db      E6,NLL,A_LEN*8/8
        db      A6,NLL,A_LEN*16/8
        db      PAUSE,NLL,A_LEN*16/8
        db      A6,NLL,A_LEN*16/8
        db      A6,NLL,A_LEN*16/8
        db      A6,NLL,A_LEN*16/8
        db      G6,NLL,A_LEN*16/8
        db      E6,NLL,A_LEN*8/8
        db      D6,NLL,A_LEN*8/8
        db      E6,NLL,A_LEN*32/8
;LABEL0001L:
        db      PAUSE,NLL,A_LEN*16/8
        db      A6,NLL,A_LEN*16/8
        db      A6,NLL,A_LEN*16/8
        db      A6,NLL,A_LEN*16/8
        db      A6,NLL,A_LEN*16/8
        db      E6,NLL,A_LEN*8/8
        db      D6,NLL,A_LEN*8/8
        db      E6,NLL,A_LEN*32/8
        db      PAUSE,NLL,A_LEN*16/8
        db      A6,NLL,A_LEN*16/8
        db      A6,NLL,A_LEN*16/8
        db      A6,NLL,A_LEN*16/8
        db      G6,NLL,A_LEN*16/8
        db      E6,NLL,A_LEN*8/8
        db      D6,NLL,A_LEN*8/8
        db      E6,NLL,A_LEN*32/8
;LABEL0001L:
        db      PAUSE,NLL,A_LEN*16/8
        db      A6,NLL,A_LEN*16/8
        db      A6,NLL,A_LEN*16/8
        db      A6,NLL,A_LEN*16/8
        db      A6,NLL,A_LEN*16/8
        db      G6,NLL,A_LEN*8/8
        db      E6,NLL,A_LEN*8/8
        db      D6,NLL,A_LEN*8/8
	db	0,0,0



;LABEL0002L:

game_mel2L:

        db      G6,NLL,A_LEN*4/8
        db      A6,NLL,A_LEN*12/8
        db      E6,NLL,A_LEN*16/8
        db      B5,NLL,A_LEN*32/8
        db      B5,NLL,A_LEN*16/8
        db      G5,NLL,A_LEN*16/8
        db      E5,NLL,A_LEN*16/8
        db      G5,NLL,A_LEN*16/8
        db      B5,NLL,A_LEN*16/8
        db      E6,NLL,A_LEN*32/8
        db      A5,NLL,A_LEN*16/8
;LABEL0002L:
        db      A5,NLL,A_LEN*4/8
        db      B5,NLL,A_LEN*12/8
        db      B5,NLL,A_LEN*32/8
        db      G7,NLL,A_LEN*8/8
        db      A6,NLL,A_LEN*8/8
        db      E6,NLL,A_LEN*8/8
        db      G6,NLL,A_LEN*8/8
        db      D6,NLL,A_LEN*8/8
        db      E6,NLL,A_LEN*8/8
        db      A5,NLL,A_LEN*8/8
        db      D6,NLL,A_LEN*8/8
        db      B5,NLL,A_LEN*32/8
        db      G5,NLL,A_LEN*16/8
        db      E5,NLL,A_LEN*16/8
        db      G5,NLL,A_LEN*16/8
        db      B5,NLL,A_LEN*16/8
        db      G5,NLL,A_LEN*16/8
;LABEL0002L:
        db      G6,NLL,A_LEN*4/8
        db      A6,NLL,A_LEN*12/8
        db      E6,NLL,A_LEN*16/8
        db      B5,NLL,A_LEN*32/8
        db      B5,NLL,A_LEN*16/8
        db      G5,NLL,A_LEN*16/8
        db      E5,NLL,A_LEN*16/8
        db      G5,NLL,A_LEN*16/8
        db      B5,NLL,A_LEN*16/8
        db      E6,NLL,A_LEN*32/8
        db      A5,NLL,A_LEN*16/8
;LABEL0002L:
        db      A5,NLL,A_LEN*4/8
        db      B5,NLL,A_LEN*12/8
        db      A5,NLL,A_LEN*32/8
        db      D6,NLL,A_LEN*8/8
        db      E6,NLL,A_LEN*8/8
        db      B5,NLL,A_LEN*8/8
        db      D6,NLL,A_LEN*8/8
        db      G5,NLL,A_LEN*8/8
        db      A5,NLL,A_LEN*8/8
        db      B5,NLL,A_LEN*48/8
        db      G5,NLL,A_LEN*16/8
        db      E5,NLL,A_LEN*16/8
        db      G5,NLL,A_LEN*16/8
        db      B5,NLL,A_LEN*16/8
        db      G5,NLL,A_LEN*16/8
	db	0,0,0



;LABEL0003L:

game_mel3L:

        db      PAUSE,NLL,A_LEN*32/8
        db      A5,NLL,A_LEN*16/8
        db      F5S,NLL,A_LEN*8/8
        db      D5,NLL,A_LEN*8/8
        db      G5,NLL,A_LEN*32/8
        db      PAUSE,NLL,A_LEN*32/8
        db      A5,NLL,A_LEN*16/8
        db      F5S,NLL,A_LEN*8/8
        db      D5,NLL,A_LEN*8/8
        db      G5,NLL,A_LEN*8/8
        db      G5,NLL,A_LEN*8/8
        db      F5S,NLL,A_LEN*16/8
        db      F5,NLL,A_LEN*32/8
;LABEL0003L:
        db      PAUSE,NLL,A_LEN*32/8
        db      A5,NLL,A_LEN*16/8
        db      F5S,NLL,A_LEN*8/8
        db      D5,NLL,A_LEN*8/8
        db      G5,NLL,A_LEN*32/8
        db      F5S,NLL,A_LEN*16/8
        db      G5,NLL,A_LEN*16/8
        db      G5,NLL,A_LEN*32/8
        db      E5,NLL,A_LEN*16/8
        db      F5S,NLL,A_LEN*8/8
        db      G5,NLL,A_LEN*8/8
        db      B5,NLL,A_LEN*32/8
        db      A5,NLL,A_LEN*16/8
        db      G5,NLL,A_LEN*8/8
        db      A5,NLL,A_LEN*8/8
;LABEL0003L:
        db      E5,NLL,A_LEN*32/8
        db      A5,NLL,A_LEN*16/8
        db      F5S,NLL,A_LEN*8/8
        db      D5,NLL,A_LEN*8/8
        db      G5,NLL,A_LEN*32/8
        db      PAUSE,NLL,A_LEN*32/8
        db      A5,NLL,A_LEN*16/8
        db      F5S,NLL,A_LEN*8/8
        db      D5,NLL,A_LEN*8/8
        db      G5,NLL,A_LEN*16/8
        db      F5S,NLL,A_LEN*16/8
        db      G5,NLL,A_LEN*16/8
        db      A5,NLL,A_LEN*16/8
;LABEL0003L:
        db      PAUSE,NLL,A_LEN*32/8
        db      A5,NLL,A_LEN*16/8
        db      F5S,NLL,A_LEN*8/8
        db      D5,NLL,A_LEN*8/8
        db      G5,NLL,A_LEN*32/8
        db      F5S,NLL,A_LEN*16/8
        db      G5,NLL,A_LEN*16/8
        db      G5,NLL,A_LEN*16/8
        db      A5,NLL,A_LEN*8/8
        db      A5S,NLL,A_LEN*8/8
        db      B5,NLL,A_LEN*8/8
        db      E6,NLL,A_LEN*8/8
        db      G6,NLL,A_LEN*8/8
        db      E6,NLL,A_LEN*8/8
        db      G6,NLL,A_LEN*8/8
        db      A6,NLL,A_LEN*8/8
        db      A6S,NLL,A_LEN*8/8
        db      B6,NLL,A_LEN*8/8
        db      A6S,NLL,A_LEN*8/8
        db      A6,NLL,A_LEN*8/8
        db      G6,NLL,A_LEN*8/8
        db      A6,NLL,A_LEN*8/8
	db	0,0,0



;LABEL0004L:

game_mel4L:

        db      G6S,NLL,A_LEN*32/8
        db      G6S,NLL,A_LEN*8/8
        db      E6,NLL,A_LEN*16/8
        db      C6S,NLL,A_LEN*8/8
        db      A6,NLL,A_LEN*48/8
        db      B6,NLL,A_LEN*8/8
        db      C7S,NLL,A_LEN*8/8
        db      D7,NLL,A_LEN*32/8
        db      C7S,NLL,A_LEN*32/8
        db      B6,NLL,A_LEN*16/8
        db      A6,NLL,A_LEN*16/8
        db      A6,NLL,A_LEN*24/8
        db      G6S,NLL,A_LEN*8/8
        db      A6,NLL,A_LEN*24/8
        db      E6,NLL,A_LEN*16/8
        db      E6,NLL,A_LEN*8/8
        db      C6S,NLL,A_LEN*16/8
        db      A5,NLL,A_LEN*48/8
        db      B5,NLL,A_LEN*8/8
        db      C6S,NLL,A_LEN*8/8
;LABEL0004L:
        db      B5,NLL,A_LEN*32/8
        db      E6,NLL,A_LEN*24/8
        db      G6S,NLL,A_LEN*8/8
        db      A6,NLL,A_LEN*32/8
        db      G6S,NLL,A_LEN*32/8
        db      G6S,NLL,A_LEN*8/8
        db      E6,NLL,A_LEN*16/8
        db      C6S,NLL,A_LEN*8/8
        db      A6,NLL,A_LEN*48/8
        db      B6,NLL,A_LEN*8/8
        db      C7S,NLL,A_LEN*8/8
        db      D7,NLL,A_LEN*32/8
        db      C7S,NLL,A_LEN*32/8
        db      B6,NLL,A_LEN*16/8
        db      A6,NLL,A_LEN*16/8
        db      A6,NLL,A_LEN*8/8
        db      E6,NLL,A_LEN*8/8
        db      D6,NLL,A_LEN*8/8
        db      C6S,NLL,A_LEN*8/8
        db      C6,NLL,A_LEN*8/8
;LABEL0004L:
        db      B5,NLL,A_LEN*8/8
        db      A5,NLL,A_LEN*16/8
        db      E6,NLL,A_LEN*8/8
        db      E6,NLL,A_LEN*8/8
        db      A5,NLL,A_LEN*8/8
        db      D6,NLL,A_LEN*8/8
        db      A5,NLL,A_LEN*8/8
        db      C6S,NLL,A_LEN*16/8
        db      A5,NLL,A_LEN*16/8
        db      A5,NLL,A_LEN*16/8
        db      B5,NLL,A_LEN*32/8
        db      B5,NLL,A_LEN*32/8
	db	0,0,0




;LABEL0005L:

open_melL:

        db      D6,NLL,A_LEN*8/8
        db      C6,NLL,A_LEN*8/8
        db      A5,NLL,A_LEN*8/8
        db      G5,NLL,A_LEN*8/8
        db      F5,NLL,A_LEN*8/8
        db      D5,NLL,A_LEN*8/8
        db      A5,NLL,A_LEN*8/8
        db      C6,NLL,A_LEN*8/8
        db      A6,NLL,A_LEN*48/8
        db      A5,NLL,A_LEN*8/8
        db      C6,NLL,A_LEN*24/8
;LABEL0005L:
        db      G6,NLL,A_LEN*48/8
        db      A5,NLL,A_LEN*8/8
        db      C6,NLL,A_LEN*24/8
        db      F6,NLL,A_LEN*48/8
        db      A5,NLL,A_LEN*8/8
        db      C6,NLL,A_LEN*8/8
        db      F6,NLL,A_LEN*8/8
        db      G6,NLL,A_LEN*8/8
;LABEL0005L:
        db      A6,NLL,A_LEN*32/8
        db      A6,NLL,A_LEN*8/8
        db      G6,NLL,A_LEN*8/8
        db      E6,NLL,A_LEN*8/8
        db      D6,NLL,A_LEN*8/8
        db      C6,NLL,A_LEN*8/8
        db      A5,NLL,A_LEN*8/8
        db      A5,NLL,A_LEN*16/8
        db      D6,NLL,A_LEN*32/8
	db	0,0,0



;LABEL0006L:

s_end_melL:

        db      E6,NLL,A_LEN*32/8
        db      A6,NLL,A_LEN*32/8
        db      D6,NLL,A_LEN*32/8
        db      G6,NLL,A_LEN*32/8
        db      D6,NLL,A_LEN*8/8
        db      E6,NLL,A_LEN*16/8
        db      D6,NLL,A_LEN*8/8
        db      E6,NLL,A_LEN*16/8
        db      D6,NLL,A_LEN*8/8
        db      E6,NLL,A_LEN*16/8
        db      D6,NLL,A_LEN*8/8
        db      E6,NLL,A_LEN*16/8
        db      B5,NLL,A_LEN*32/8
;LABEL0006L:
        db      D6,NLL,A_LEN*8/8
        db      E6,NLL,A_LEN*16/8
        db      D6,NLL,A_LEN*8/8
        db      E6,NLL,A_LEN*16/8
        db      D6,NLL,A_LEN*8/8
        db      E6,NLL,A_LEN*16/8
        db      D6,NLL,A_LEN*16/8
        db      A6,NLL,A_LEN*8/8
        db      A6,NLL,A_LEN*32/8
        db      D6,NLL,A_LEN*8/8
        db      E6,NLL,A_LEN*16/8
        db      D6,NLL,A_LEN*8/8
        db      E6,NLL,A_LEN*16/8
        db      D6,NLL,A_LEN*8/8
        db      E6,NLL,A_LEN*16/8
        db      D6,NLL,A_LEN*8/8
        db      E6,NLL,A_LEN*16/8
        db      B5,NLL,A_LEN*32/8
        db      D6,NLL,A_LEN*8/8
        db      E6,NLL,A_LEN*16/8
        db      D6,NLL,A_LEN*8/8
        db      E6,NLL,A_LEN*16/8
        db      D6,NLL,A_LEN*8/8
        db      E6,NLL,A_LEN*16/8
        db      D6,NLL,A_LEN*16/8
        db      A6,NLL,A_LEN*8/8
        db      A6,NLL,A_LEN*32/8
;LABEL0006L:
        db      D6,NLL,A_LEN*8/8
        db      E6,NLL,A_LEN*16/8
        db      D6,NLL,A_LEN*8/8
        db      E6,NLL,A_LEN*16/8
        db      D6,NLL,A_LEN*8/8
        db      E6,NLL,A_LEN*16/8
        db      D6,NLL,A_LEN*8/8
        db      E6,NLL,A_LEN*16/8
        db      B6,NLL,A_LEN*32/8
        db      D6,NLL,A_LEN*8/8
        db      E6,NLL,A_LEN*16/8
        db      D6,NLL,A_LEN*8/8
        db      E6,NLL,A_LEN*16/8
        db      D6,NLL,A_LEN*8/8
        db      A6,NLL,A_LEN*16/8
        db      A6,NLL,A_LEN*16/8
        db      A6,NLL,A_LEN*8/8
        db      A5,NLL,A_LEN*16/8
        db      PAUSE,NLL,A_LEN*16/8
	db	0,0,0





;LABEL0007L:

h_end_melL:

        db      G6,NLL,A_LEN*8/8
        db      PAUSE,NLL,A_LEN*8/8
        db      G6,NLL,A_LEN*8/8
        db      PAUSE,NLL,A_LEN*8/8
        db      G6,NLL,A_LEN*8/8
        db      G6S,NLL,A_LEN*24/8
        db      D7,NLL,A_LEN*8/8
        db      E7,NLL,A_LEN*24/8
        db      E6,NLL,A_LEN*32/8
        db      G6,NLL,A_LEN*8/8
        db      A6,NLL,A_LEN*16/8
        db      A6,NLL,A_LEN*32/8
        db      A6,NLL,A_LEN*32/8
        db      B6,NLL,A_LEN*8/8
        db      C7,NLL,A_LEN*8/8
        db      D7,NLL,A_LEN*16/8
        db      D7,NLL,A_LEN*8/8
        db      E7,NLL,A_LEN*8/8
        db      E7,NLL,A_LEN*16/8
        db      D7,NLL,A_LEN*8/8
        db      C7,NLL,A_LEN*8/8
        db      A6,NLL,A_LEN*16/8
;LABEL0007L:
        db      D7,NLL,A_LEN*8/8
        db      E7,NLL,A_LEN*24/8
        db      E7,NLL,A_LEN*16/8
        db      A6,NLL,A_LEN*8/8
        db      G6,NLL,A_LEN*8/8
        db      A6,NLL,A_LEN*32/8
        db      C7,NLL,A_LEN*8/8
        db      D7,NLL,A_LEN*24/8
        db      G6,NLL,A_LEN*8/8
        db      PAUSE,NLL,A_LEN*8/8
        db      G6,NLL,A_LEN*8/8
        db      PAUSE,NLL,A_LEN*8/8
        db      G6,NLL,A_LEN*8/8
        db      G6S,NLL,A_LEN*24/8
        db      A6,NLL,A_LEN*32/8
        db      A6,NLL,A_LEN*32/8
	db	0,0,0

;LABEL0008L:

option_melL:
        db      G5,NLL,A_LEN*16/8
        db      A5,NLL,A_LEN*48/8
        db      G5,NLL,A_LEN*32/8
        db      F5,NLL,A_LEN*32/8
        db      E5,NLL,A_LEN*32/8
        db      F5,NLL,A_LEN*32/8
        db      G5,NLL,A_LEN*32/8
        db      A5,NLL,A_LEN*32/8
        db      G5,NLL,A_LEN*16/8
        db      A5,NLL,A_LEN*48/8
        db      G5,NLL,A_LEN*32/8
        db      F5,NLL,A_LEN*32/8
;LABEL0008L:
        db      E5,NLL,A_LEN*32/8
        db      A5,NLL,A_LEN*32/8
        db      B5,NLL,A_LEN*32/8
        db      E5,NLL,A_LEN*32/8
	db	0,0,0




	END
