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
; since most of this file is for one-channel songs,
; most of these here are pauses

game_mel1H:
        db	0,0,0




;
; the frog jumping sound

game_mel2H:
        db      D6,NLH,1
        db      F6S,NLH,1
        db      A6,NLH,1
        db      D7,NLH,1
        db      B6,NLH,5
	db	0,0,0

;
; frog double jump (it makes this noise sometimes)
;
game_mel3H:
        db      D6,NLH,1
        db      F6S,NLH,1
        db      A6,NLH,1
        db      D7,NLH,1
        db      B6,NLH,1
        db      D6,NLH,1
        db      F6S,NLH,1
        db      A6,NLH,1
        db      D7,NLH,1
        db      B6,NLH,5
	db	0,0,0

;
; low time warning 
;
game_mel4H:
        db      G4,NLH,4
        db      C4,NLH,3
        db      G3,NLH,3
        db      G4,NLH,4
        db      C4,NLH,3
        db      G3,NLH,3
        db      G4,NLH,4
        db      C4,NLH,3
        db      G3,NLH,3
        db      G4,NLH,4
        db      C4,NLH,3
        db      G3,NLH,3
        db	0,0,0

;
; this is when you successfully leap into an end slot (it cuts off
; the jump sound once you land)
open_melH:
        db      E7,NLH,1
        db      PAUSE,NLH,2
        db      E7,NLH,1
        db      PAUSE,NLH,4
        db      E7,NLH,1
        db	0,0,0

;
;this right now is just for testing something
;
s_end_melH:
        db      C5,1fh,15
        db      C4,1fh,15
   	db	0,0,0


;
;
;
h_end_melH:
        db	0,0,0

;
;
;
option_melH:
	db	0,0,0




;************************************




;
; MAIN GAMEPLAY SONG
; 
game_mel1L:
        db      C6S,NLL,10
        db      PAUSE,NLL,6
        db      A5S,NLL,8
        db      F5S,NLL,8
        db      F6S,NLL,10
        db      PAUSE,NLL,6
        db      F6,NLL,8
        db      D6S,NLL,8
        db      C6S,NLL,10
        db      PAUSE,NLL,6
        db      F6S,NLL,8
        db      A5S,NLL,8
        db      G5S,NLL,8
        db      C6S,NLL,8
        db      PAUSE,NLL,16
  


        db      F4S,NLL,8
        db      C6S,NLL,8
        db      C6S,NLL,8
        db      C6S,NLL,8
        db      C6S,NLL,8
        db      A5S,NLL,8
        db      G5S,NLL,8
        db      F5S,NLL,8

        db      F4S,NLL,8
        db      F6S,NLL,8
        db      F6S,NLL,8
        db      F6S,NLL,8
        db      G6S,NLL,8
        db      F6S,NLL,8
        db      F6,NLL,8
        db      D6S,NLL,8

        db      C6S,NLL,8
        db      A5S,NLL,8
        db      C4S,NLL,8
        db      A5S,NLL,8
        db      F6S,NLL,8
        db      A4S,NLL,8
        db      A5S,NLL,8
        db      A4S,NLL,8

        db      C6S,NLL,8
        db      G5S,NLL,8
        db      C4S,NLL,8
        db      C5S,NLL,8
        db      D4S,NLL,8
        db      C5S,NLL,8
        db      F4,NLL,8
        db      C5S,NLL,8


        db      F4S,NLL,8
        db      A5S,NLL,8
        db      A5S,NLL,8
        db      B5,NLL,8
        db      C6S,NLL,8
        db      D6S,NLL,8
        db      F6,NLL,8
        db      D6S,NLL,8

        db      F4S,NLL,8
        db      B4,NLL,8
        db      D4S,NLL,8
        db      B4,NLL,8
        db      F4S,NLL,8
        db      B4,NLL,8
        db      D4S,NLL,8
        db      B4,NLL,8

        db      B5,NLL,8
        db      B5,NLL,8
        db      C6S,NLL,8
        db      D6S,NLL,8
        db      F4S,NLL,8
        db      F6,NLL,8
        db      F6S,NLL,8
        db      F6,NLL,8

        db      G4S,NLL,8
        db      C5S,NLL,8
        db      C4S,NLL,8
        db      C5S,NLL,8
        db      G4S,NLL,8
        db      C6S,NLL,8
        db      C4S,NLL,8
        db      F6S,NLL,8

        db      F4S,NLL,8
        db      A4S,NLL,8
        db      C4S,NLL,8
        db      F6S,NLL,8
        db      F6,NLL,8
        db      D6S,NLL,8
        db      C6S,NLL,8
        db      F6,NLL,8

        db      F4S,NLL,8
        db      A4S,NLL,8
        db      D4,NLL,8
        db      D6S,NLL,8
        db      D4S,NLL,8
        db      D6S,NLL,8
        db      G4S,NLL,8
        db      C6S,NLL,8

        db      G4S,NLL,8
        db      G6S,NLL,8
        db      C4S,NLL,8
        db      F6S,NLL,8
        db      G4S,NLL,8
        db      F6,NLL,8
        db      C4S,NLL,8
        db      F6S,NLL,8

        db      F4S,NLL,8
        db      A4S,NLL,8
        db      C4S,NLL,8
        db      A4S,NLL,8
        db      F4S,NLL,8
        db      A4S,NLL,8
        db      C4S,NLL,8
        db      F6S,NLL,8


        db      F6S,NLL,8
        db      F6S,NLL,8
        db      F6S,NLL,8
        db      F6S,NLL,8
        db      F6S,NLL,8
        db      F6,NLL,8
        db      D6S,NLL,8
        db      F6S,NLL,8

        db      A4S,NLL,8
        db      PAUSE,NLL,16
        db      C6S,NLL,8
        db      PAUSE,NLL,8
        db      A5S,NLL,8
        db      A5S,NLL,8
        db      G5S,NLL,8
  
        db      PAUSE,NLL,8
        db      G5S,NLL,8
        db      G5S,NLL,8
        db      F6S,NLL,8
        db      F6S,NLL,8
        db      F6,NLL,8
        db      D6S,NLL,8
        db      D6S,NLL,8

        db      PAUSE,NLL,24
        db      C6S,NLL,8
        db      PAUSE,NLL,24
        db      C6S,NLL,8

        db      A5S,NLL,8
        db      A5S,NLL,8
        db      A5S,NLL,8
        db      A5S,NLL,8
        db      PAUSE,NLL,8
        db      G5S,NLL,8
        db      F5S,NLL,8
        db      B5,NLL,8

        db      A5S,NLL,8
        db      B5,NLL,8
        db      C6S,NLL,8
        db      D6S,NLL,8
        db      PAUSE,NLL,24
        db      C6S,NLL,8

        db      B5,NLL,8
        db      G5S,NLL,8
        db      G5S,NLL,8
        db      G5S,NLL,8
        db      PAUSE,NLL,8
        db      F5S,NLL,8
        db      F5,NLL,8
        db      F5S,NLL,8

        db      F5,NLL,8
        db      F5S,NLL,8
        db      G5S,NLL,8
        db      A5S,NLL,8
        db      PAUSE,NLL,24
        db      C6S,NLL,8

        db      A5S,NLL,8
        db      A5S,NLL,8
        db      A5S,NLL,8
        db      A5S,NLL,8
        db      PAUSE,NLL,8
        db      G5S,NLL,8
        db      F5S,NLL,8

        db      B5,NLL,8
        db      A5S,NLL,8
        db      B5,NLL,8
        db      C6S,NLL,8
        db      D6S,NLL,8
        db      PAUSE,NLL,8
        db      F6,NLL,8
        db      D6S,NLL,8

        db      C6S,NLL,8
        db      PAUSE,NLL,8
        db      C6S,NLL,8
        db      D6S,NLL,8
        db      C6S,NLL,8
        db      B5,NLL,8
        db      A5S,NLL,8
        db      G5S,NLL,8

        db      D5S,NLL,8
        db      PAUSE,NLL,24
        db      F5,NLL,8
        db      PAUSE,NLL,8
        db      G5S,NLL,8
        db      PAUSE,NLL,8

        db      F5S,NLL,8
        db      PAUSE,NLL,56

	db	0,0,0




;
; this pause is so I can hear the jump sound correctly, since it's
; just in one channel

game_mel2L:
        db      PAUSE,NLL,9
	db	0,0,0



; same here

game_mel3L:
        db      PAUSE,NLL,14
	db	0,0,0



;

game_mel4L:
        db      PAUSE,NLL,40
	db	0,0,0




;
open_melL:
        db      PAUSE,NLL,36
	db	0,0,0



;
s_end_melL:
        db      PAUSE,NLL,36
	db	0,0,0





;LABEL0007L:

h_end_melL:
        db      PAUSE,NLL,36
	db	0,0,0

option_melL:
        db      PAUSE,NLL,36
	db	0,0,0




	END
