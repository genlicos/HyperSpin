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

; Songs for NBA live
;
; Main Menu Song
; tempo: aprrox. 87.48 ticks per measure originally
; now 5 ticks per sixteenth note, 80 per bar
; tempo goes 111.5 to 122

;
game_mel1L:
        db      E5,NLH,5
        db      PAUSE,NLH,10
        db      E5,NLH,5
        db      PAUSE,NLH,10
        db      E5,NLH,5
        db      PAUSE,NLH,10
        db      E5,NLH,5
        db      PAUSE,NLH,10
        db      E5,NLH,5
        db      PAUSE,NLH,5
        db      E5,NLH,5
        db      E5,NLH,5

        db      E5,NLH,5
        db      PAUSE,NLH,10
        db      E5,NLH,5
        db      PAUSE,NLH,10
        db      E5,NLH,5
        db      PAUSE,NLH,10
        db      E5,NLH,5
        db      PAUSE,NLH,10
        db      E5,NLH,5
        db      PAUSE,NLH,5
        db      E5,NLH,5
        db      E5,NLH,5

        db      E5,NLH,5
        db      PAUSE,NLH,10
        db      E5,NLH,5
        db      PAUSE,NLH,10
        db      E5,NLH,5
        db      PAUSE,NLH,10
        db      E5,NLH,5
        db      PAUSE,NLH,10
        db      E5,NLH,5
        db      PAUSE,NLH,5
        db      E5,NLH,5
        db      E5,NLH,5

        db      E5,NLH,5
        db      PAUSE,NLH,10
        db      E5,NLH,5
        db      PAUSE,NLH,10
        db      E5,NLH,5
        db      PAUSE,NLH,10
        db      E5,NLH,5
        db      PAUSE,NLH,10
        db      E5,NLH,5
        db      PAUSE,NLH,5
        db      E5,NLH,5
        db      E5,NLH,5

        db      E5,NLH,5
        db      PAUSE,NLH,10
        db      E5,NLH,5
        db      PAUSE,NLH,10
        db      E5,NLH,5
        db      PAUSE,NLH,10
        db      E5,NLH,5
        db      PAUSE,NLH,10
        db      E5,NLH,5
        db      PAUSE,NLH,5
        db      E5,NLH,5
        db      E5,NLH,5

        db      E5,NLH,5
        db      PAUSE,NLH,10
        db      E5,NLH,5
        db      PAUSE,NLH,10
        db      E5,NLH,5
        db      PAUSE,NLH,10
        db      E5,NLH,5
        db      PAUSE,NLH,10
        db      E5,NLH,5
        db      PAUSE,NLH,5
        db      E5,NLH,5
        db      E5,NLH,5

        db      E5,NLH,5
        db      PAUSE,NLH,10
        db      E5,NLH,5
        db      PAUSE,NLH,10
        db      E5,NLH,5
        db      PAUSE,NLH,10
        db      E5,NLH,5
        db      PAUSE,NLH,10
        db      E5,NLH,5
        db      PAUSE,NLH,5
        db      E5,NLH,5
        db      E5,NLH,5

        db      E5,NLH,5
        db      PAUSE,NLH,10
        db      E5,NLH,5
        db      PAUSE,NLH,10
        db      E5,NLH,5
        db      PAUSE,NLH,10
        db      E5,NLH,5
        db      PAUSE,NLH,10
        db      E5,NLH,5
        db      PAUSE,NLH,5
        db      E5,NLH,5
        db      E5,NLH,5


        db      E5,NLH,20
        db      E5,NLH,10
        db      D5,NLH,20
        db      C5S,NLH,20
        db      B4,NLH,10

        db      A4,NLH,5
        db      B4,NLH,5
        db      C5S,NLH,5
        db      B4,NLH,15
        db      E4,NLH,50

        db      E5,NLH,20
        db      E5,NLH,10
        db      D5,NLH,20
        db      C5S,NLH,20
        db      B4,NLH,10

        db      A4,NLH,5
        db      B4,NLH,5
        db      C5S,NLH,5
        db      B4,NLH,65

        db      E5,NLH,20
        db      E5,NLH,10
        db      D5,NLH,20
        db      C5S,NLH,20
        db      B4,NLH,10

        db      A4,NLH,5
        db      B4,NLH,5
        db      C5S,NLH,5
        db      B4,NLH,15
        db      E4,NLH,20
        db      F4S,NLH,10
        db      G4,NLH,10
        db      D5,NLH,10

        db      E5,NLH,20
        db      E5,NLH,10
        db      D5,NLH,20
        db      C5S,NLH,20
        db      B4,NLH,10

        db      A4,NLH,5
        db      B4,NLH,5
        db      C5S,NLH,5
        db      E5,NLH,65

        db	0,0,0



;
; "Pause"
; tempo: 131.6
; 74.11 ticks per bar, but now 5 ticks per 16th like above
; 

game_mel2L:
        db      E3,NLH,10
        db      E3,NLH,5
        db      E3,NLH,5
        db      D4,NLH,5
        db      E4,NLH,5
        db      E3,NLH,5
        db      E3,NLH,5

        db      G3S,NLH,5
        db      D5,NLH,5
        db      E3,NLH,5
        db      B3,NLH,10
        db      E3,NLH,5
        db      G3S,NLH,10

        db      E3,NLH,10
        db      E3,NLH,5
        db      E3,NLH,5
        db      D4,NLH,5
        db      E4,NLH,5
        db      E3,NLH,5
        db      E3,NLH,5

        db      G3S,NLH,5
        db      D5,NLH,5
        db      E3,NLH,5
        db      B3,NLH,10
        db      E3,NLH,5
        db      G3S,NLH,10

        db      E3,NLH,10
        db      E3,NLH,5
        db      E3,NLH,5
        db      D4,NLH,5
        db      E4,NLH,5
        db      E3,NLH,5
        db      E3,NLH,5

        db      G3S,NLH,5
        db      D5,NLH,5
        db      E3,NLH,5
        db      B3,NLH,10
        db      E3,NLH,5
        db      G3S,NLH,10

        db      E3,NLH,10
        db      E3,NLH,5
        db      E3,NLH,5
        db      D4,NLH,5
        db      E4,NLH,5
        db      E3,NLH,5
        db      E3,NLH,5

        db      C4S,NLH,10
        db      E3,NLH,5
        db      E3,NLH,5
        db      E3,NLH,5
        db      E3,NLH,5
        db      D4,NLH,5
        db      E4,NLH,5

; now the melody

        db      D5,NLH,15
        db      D5,NLH,5
        db      PAUSE,NLH,50
        db      C5S,NLH,10

        db      D5,NLH,15
        db      D5,NLH,5
        db      PAUSE,NLH,10
        db      D5,NLH,50

        db      D5,NLH,15
        db      D5,NLH,5
        db      PAUSE,NLH,50
        db      C5S,NLH,10

        db      D5,NLH,15
        db      D5,NLH,5
        db      PAUSE,NLH,10
        db      D5,NLH,50

; percussive part
        db      G5,NLH,2
        db      PAUSE,NLH,8
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,8
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,8

        db      G5,NLH,2
        db      PAUSE,NLH,8
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,8
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,8

        db      G5,NLH,2
        db      PAUSE,NLH,8
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,8
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,8

        db      G5,NLH,2
        db      PAUSE,NLH,8
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,8
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,8

        db      G5,NLH,2
        db      PAUSE,NLH,8
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,8
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,8

        db      G5,NLH,2
        db      PAUSE,NLH,8
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,8
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,8

        db      G5,NLH,2
        db      PAUSE,NLH,8
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,8
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,8

        db      G5,NLH,2
        db      PAUSE,NLH,8
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,8
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,3
        db      G5,NLH,2
        db      PAUSE,NLH,8


	db	0,0,0

; 
; 
;
game_mel3H:
	db	0,0,0

;
; 
;
game_mel4H:
        db	0,0,0

;
; 
; 
open_melH:
        db	0,0,0

;
;
;
s_end_melH:
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



; Main Menu Song
; Low part (bass line)
game_mel1H:
        db      D4,NLL,5
        db      E4,NLL,5
        db      E3,NLL,5
        db      E3,NLL,10
        db      E3,NLL,5
        db      E3,NLL,10
        db      E3,NLL,10
        db      G3,NLL,10
        db      A3,NLL,20

        db      D4,NLL,5
        db      E4,NLL,5
        db      E3,NLL,5
        db      E3,NLL,10
        db      E3,NLL,5
        db      E3,NLL,10
        db      E3,NLL,10
        db      A3,NLL,10
        db      G3,NLL,20

        db      D4,NLL,5
        db      E4,NLL,5
        db      E3,NLL,5
        db      E3,NLL,10
        db      E3,NLL,5
        db      E3,NLL,10
        db      E3,NLL,10
        db      G3,NLL,10
        db      A3,NLL,20

        db      D4,NLL,5
        db      E4,NLL,5
        db      PAUSE,NLL,5
        db      G4,NLL,5
        db      F4S,NLL,5
        db      D4,NLL,5
        db      B3,NLL,5
        db      D4,NLL,5
        db      D4,NLL,5
        db      E4,NLL,5
        db      D4,NLL,5
        db      B3,NLL,5
        db      A3,NLL,5
        db      B3,NLL,5
        db      G3,NLL,10
 

        db      D4,NLL,5
        db      E4,NLL,5
        db      E3,NLL,5
        db      E3,NLL,10
        db      E3,NLL,5
        db      E3,NLL,10
        db      E3,NLL,10
        db      G3,NLL,10
        db      A3,NLL,20

        db      D4,NLL,5
        db      E4,NLL,5
        db      E3,NLL,5
        db      E3,NLL,10
        db      E3,NLL,5
        db      E3,NLL,10
        db      E3,NLL,10
        db      A3,NLL,10
        db      G3,NLL,20

        db      D4,NLL,5
        db      E4,NLL,5
        db      E3,NLL,5
        db      E3,NLL,10
        db      E3,NLL,5
        db      E3,NLL,10
        db      E3,NLL,10
        db      G3,NLL,10
        db      A3,NLL,20

        db      D4,NLL,5
        db      E4,NLL,5
        db      PAUSE,NLL,5
        db      G4,NLL,5
        db      F4S,NLL,5
        db      D4,NLL,5
        db      B3,NLL,5
        db      D4,NLL,5
        db      D4,NLL,5
        db      E4,NLL,5
        db      D4,NLL,5
        db      B3,NLL,5
        db      A3,NLL,5
        db      B3,NLL,5
        db      G3,NLL,10
 
        db      D4,NLL,5
        db      E4,NLL,5
        db      E3,NLL,5
        db      E3,NLL,10
        db      E3,NLL,5
        db      E3,NLL,10
        db      E3,NLL,10
        db      G3,NLL,10
        db      A3,NLL,20

        db      D4,NLL,5
        db      E4,NLL,5
        db      E3,NLL,5
        db      E3,NLL,10
        db      E3,NLL,5
        db      E3,NLL,10
        db      E3,NLL,10
        db      A3,NLL,10
        db      G3,NLL,20

        db      D4,NLL,5
        db      E4,NLL,5
        db      E3,NLL,5
        db      E3,NLL,10
        db      E3,NLL,5
        db      E3,NLL,10
        db      E3,NLL,10
        db      G3,NLL,10
        db      A3,NLL,20

        db      D4,NLL,5
        db      E4,NLL,5
        db      PAUSE,NLL,5
        db      G4,NLL,5
        db      F4S,NLL,5
        db      D4,NLL,5
        db      B3,NLL,5
        db      D4,NLL,5
        db      D4,NLL,5
        db      E4,NLL,5
        db      D4,NLL,5
        db      B3,NLL,5
        db      A3,NLL,5
        db      B3,NLL,5
        db      G3,NLL,10
 

        db      D4,NLL,5
        db      E4,NLL,5
        db      E3,NLL,5
        db      E3,NLL,10
        db      E3,NLL,5
        db      E3,NLL,10
        db      E3,NLL,10
        db      G3,NLL,10
        db      A3,NLL,20

        db      D4,NLL,5
        db      E4,NLL,5
        db      E3,NLL,5
        db      E3,NLL,10
        db      E3,NLL,5
        db      E3,NLL,10
        db      E3,NLL,10
        db      A3,NLL,10
        db      G3,NLL,20

        db      D4,NLL,5
        db      E4,NLL,5
        db      E3,NLL,5
        db      E3,NLL,10
        db      E3,NLL,5
        db      E3,NLL,10
        db      E3,NLL,10
        db      G3,NLL,10
        db      A3,NLL,20

        db      D4,NLL,5
        db      E4,NLL,5
        db      PAUSE,NLL,5
        db      G4,NLL,5
        db      F4S,NLL,5
        db      D4,NLL,5
        db      B3,NLL,5
        db      D4,NLL,5
        db      D4,NLL,5
        db      E4,NLL,5
        db      D4,NLL,5
        db      B3,NLL,5
        db      A3,NLL,5
        db      B3,NLL,5
        db      G3,NLL,10
 

        db	0,0,0




; "Pause"
; Low part (bass line)


game_mel2H:
        db      E3,NLL,10
        db      E3,NLL,5
        db      E3,NLL,5
        db      D4,NLL,5
        db      E4,NLL,5
        db      E3,NLL,5
        db      E3,NLL,5

        db      G3S,NLL,5
        db      D5,NLL,5
        db      E3,NLL,5
        db      B3,NLL,10
        db      E3,NLL,5
        db      G3S,NLL,10

        db      E3,NLL,10
        db      E3,NLL,5
        db      E3,NLL,5
        db      D4,NLL,5
        db      E4,NLL,5
        db      E3,NLL,5
        db      E3,NLL,5

        db      G3S,NLL,5
        db      D5,NLL,5
        db      E3,NLL,5
        db      B3,NLL,10
        db      E3,NLL,5
        db      G3S,NLL,10

        db      E3,NLL,10
        db      E3,NLL,5
        db      E3,NLL,5
        db      D4,NLL,5
        db      E4,NLL,5
        db      E3,NLL,5
        db      E3,NLL,5

        db      G3S,NLL,5
        db      D5,NLL,5
        db      E3,NLL,5
        db      B3,NLL,10
        db      E3,NLL,5
        db      G3S,NLL,10

        db      E3,NLL,10
        db      E3,NLL,5
        db      E3,NLL,5
        db      D4,NLL,5
        db      E4,NLL,5
        db      E3,NLL,5
        db      E3,NLL,5

        db      C4S,NLL,10
        db      E3,NLL,5
        db      E3,NLL,5
        db      E3,NLL,5
        db      E3,NLL,5
        db      D4,NLL,5
        db      E4,NLL,5

         
        db      E3,NLL,10
        db      E3,NLL,5
        db      E3,NLL,5
        db      D4,NLL,5
        db      E4,NLL,5
        db      E3,NLL,5
        db      E3,NLL,5

        db      G3S,NLL,5
        db      D5,NLL,5
        db      E3,NLL,5
        db      B3,NLL,10
        db      E3,NLL,5
        db      G3S,NLL,10

        db      E3,NLL,10
        db      E3,NLL,5
        db      E3,NLL,5
        db      D4,NLL,5
        db      E4,NLL,5
        db      E3,NLL,5
        db      E3,NLL,5

        db      G3S,NLL,5
        db      D5,NLL,5
        db      E3,NLL,5
        db      B3,NLL,10
        db      E3,NLL,5
        db      G3S,NLL,10

        db      E3,NLL,10
        db      E3,NLL,5
        db      E3,NLL,5
        db      D4,NLL,5
        db      E4,NLL,5
        db      E3,NLL,5
        db      E3,NLL,5

        db      G3S,NLL,5
        db      D5,NLL,5
        db      E3,NLL,5
        db      B3,NLL,10
        db      E3,NLL,5
        db      G3S,NLL,10

        db      E3,NLL,10
        db      E3,NLL,5
        db      E3,NLL,5
        db      D4,NLL,5
        db      E4,NLL,5
        db      E3,NLL,5
        db      E3,NLL,5

        db      C4S,NLL,10
        db      E3,NLL,5
        db      E3,NLL,5
        db      E3,NLL,5
        db      E3,NLL,5
        db      D4,NLL,5
        db      E4,NLL,5

         
        db      E3,NLL,10
        db      E3,NLL,5
        db      E3,NLL,5
        db      D4,NLL,5
        db      E4,NLL,5
        db      E3,NLL,5
        db      E3,NLL,5

        db      G3S,NLL,5
        db      D5,NLL,5
        db      E3,NLL,5
        db      B3,NLL,10
        db      E3,NLL,5
        db      G3S,NLL,10

        db      E3,NLL,10
        db      E3,NLL,5
        db      E3,NLL,5
        db      D4,NLL,5
        db      E4,NLL,5
        db      E3,NLL,5
        db      E3,NLL,5

        db      G3S,NLL,5
        db      D5,NLL,5
        db      E3,NLL,5
        db      B3,NLL,10
        db      E3,NLL,5
        db      G3S,NLL,10

        db      E3,NLL,10
        db      E3,NLL,5
        db      E3,NLL,5
        db      D4,NLL,5
        db      E4,NLL,5
        db      E3,NLL,5
        db      E3,NLL,5

        db      G3S,NLL,5
        db      D5,NLL,5
        db      E3,NLL,5
        db      B3,NLL,10
        db      E3,NLL,5
        db      G3S,NLL,10

        db      E3,NLL,10
        db      E3,NLL,5
        db      E3,NLL,5
        db      D4,NLL,5
        db      E4,NLL,5
        db      E3,NLL,5
        db      E3,NLL,5

        db      C4S,NLL,10
        db      E3,NLL,5
        db      E3,NLL,5
        db      E3,NLL,5
        db      E3,NLL,5
        db      D4,NLL,5
        db      E4,NLL,5

         
        db      E3,NLL,10
        db      E3,NLL,5
        db      E3,NLL,5
        db      D4,NLL,5
        db      E4,NLL,5
        db      E3,NLL,5
        db      E3,NLL,5

        db      G3S,NLL,5
        db      D5,NLL,5
        db      E3,NLL,5
        db      B3,NLL,10
        db      E3,NLL,5
        db      G3S,NLL,10

        db      E3,NLL,10
        db      E3,NLL,5
        db      E3,NLL,5
        db      D4,NLL,5
        db      E4,NLL,5
        db      E3,NLL,5
        db      E3,NLL,5

        db      G3S,NLL,5
        db      D5,NLL,5
        db      E3,NLL,5
        db      B3,NLL,10
        db      E3,NLL,5
        db      G3S,NLL,10

        db      E3,NLL,10
        db      E3,NLL,5
        db      E3,NLL,5
        db      D4,NLL,5
        db      E4,NLL,5
        db      E3,NLL,5
        db      E3,NLL,5

        db      G3S,NLL,5
        db      D5,NLL,5
        db      E3,NLL,5
        db      B3,NLL,10
        db      E3,NLL,5
        db      G3S,NLL,10

        db      E3,NLL,10
        db      E3,NLL,5
        db      E3,NLL,5
        db      D4,NLL,5
        db      E4,NLL,5
        db      E3,NLL,5
        db      E3,NLL,5

        db      C4S,NLL,10
        db      E3,NLL,5
        db      E3,NLL,5
        db      E3,NLL,5
        db      E3,NLL,5
        db      D4,NLL,5
        db      E4,NLL,5

         
         
        db	0,0,0



; 

game_mel3L:
	db	0,0,0



;

game_mel4L:
	db	0,0,0




;
open_melL:
	db	0,0,0



;
s_end_melL:
	db	0,0,0





;

h_end_melL:
	db	0,0,0

option_melL:
	db	0,0,0




	END
