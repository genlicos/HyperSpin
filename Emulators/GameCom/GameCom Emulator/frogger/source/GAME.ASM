	title   Fighter Mega Mix Common Bank program/Entry Point
	type    8521

	include frogger.tmp
	include equate.inc
	include ram.inc
	include disp_ram.inc
	include disp_equ.inc


	program

;============================================================================
;
; The Game Loop
;
;----------------------------------------------------------------------------

Game:       global  Game

	call	InitGame
	mov	r0,#Game_Next
	mov	GameState,r0

	;call	start_melody

	; Get here when changing player
GameL0:

	; find next player to play
	
	call	InitPlayer
	br	z,GameDone	;no player still has levels to play
	
	; show player a status screen to start from
	
GameL5:
	call	LevelStart
	
	; initialize level for play
	
	call	InitLevel
	mov	r0,#Game_Play
	mov	GameState,r0

	; Standard game playing loop

	bset    sound_flag,#7         ;set start melody flag.
	mov     r0,#04                  ;opening melody.
	mov     new_melody_ptr,r0

	; initialize next frog

GameL4:

	call	InitFrog

GameL1:
	call	cont_melody
            call    GetUser	;user input in r0

	call	UpdateFrog	;everything froggy
	br	mi,GameL2
	br	nz,GameL3 

	call	UpdateBands	;move bands on screen	

	call	UpdateSAnims	;handle strip animations

	call	UpdateAnims	;handle real animations

	Call	DisplayGame	;draw the screen
	
            br      GameL1
	
	; Player finished level or frog well-- Display the fact
	
GameL3:

	call	LevelOK
	br	mi,GameL4
	br	nz,GameL0	;player done, go to next player
	br	GameL5	;player has more levels, stay with him
	
	; player failed to finish level-- Display the fact
	
GameL2:

	call	LevelDie
	br 	GameL0
	
	; Game is completely over-- Display the fact and exit

GameDone:

	call	GameEnd	
	jmp	FromMainMenu

;============================================================================
;
; Initialize a new game
;
;----------------------------------------------------------------------------

InitGame:
	; Set initial player

	clr	r1
	mov	NextPlayer,r1

	; initialize player data

	movw	rr2,#PlayerData
	mov	r6,NumPlayers
	movw	rr0,#0
	mov	r4,StartLevel
	mov	r5,Lives
InitGameL1:
	movw	PlayerScore(rr2),rr0
	mov	PlayerHomeF(rr2),r0
	mov	PlayerLevel(rr2),r4
	mov	PlayerLives(rr2),r5
	addw	rr2,#PlayerVSize
	dec	r6
	br	nz,InitGameL1

	ret

;============================================================================
;
; Initialize the next player
;
;----------------------------------------------------------------------------

InitPlayer:

	; Get Next Player that can still play

	movw	rr2,#PlayerData-PlayerVSize
	mov	r1,NextPlayer	;The player who just played
	mov	r0,NumPlayers	;The Total number of players
	mov	r6,r0	;The total plus one (for testing)
	inc	r6

	; find a player

InitPlayerL0:

	; go to next player

	inc	r1
	cmp	r1,r6
	br	ne,InitPlayerOK
	mov	r1,#1
InitPlayerOK:
	mov	NextPlayer,r1

	; locate player's data

	movw	rr4,#PlayerVSize
	mult	rr4,r1
	addw	rr4,rr2

	; use if lives left not zero

	mov	r6,PlayerLevel(rr4)
	cmp	r6,#MaxLevels+1
	br	eq,InitPlayerDone
	mov	r6,PlayerLives(rr4)
	cmp	r6,#0
	br	ne,InitPlayerE0

	; this player is done, go to next one

InitPlayerDone:

	dec	r0
	br	nz,InitPlayerL0

	; oops-- no more players: flag is zero

	ret

	; found a player: remember table address
	; flag is non-zero

InitPlayerE0:
	movw	PlayerVAddr,rr4
	ret

;============================================================================
;
; Display Level Start Screen
;
;----------------------------------------------------------------------------

LevelStart:
	;ZZZ
	ret
	
;============================================================================
;
; Display Level Won Screen or Game Won Screen
;
;----------------------------------------------------------------------------

LevelOK:

	movw	rr8,PlayerVAddr

	; Exit on level, if fifth frog not landed

	mov	r1,PlayerHomeF(rr8)
	cmp	r1,#01fh
	br	eq,LevelOKFive
	or	r1,#80h
	ret

	; got all five frogs across

LevelOKFive:

	movw	rr2,PlayerScore(rr8)
	movw	rr4,#SCORE_five
	addw	rr2,rr4
	movw	PlayerScore(rr8),rr2

	; go to next level for player
	
	mov	r1,PlayerLevel(rr8)
	inc	r1
	mov	PlayerLevel(rr8),r1

	cmp	r1,#MaxLevels+1
	br	eq,LevelOKWon

	; level won

	; have to do five more on next level

	mov	r2,#0
	mov	PlayerHomeF(rr8),r2

	;ZZZ
	xor	r0,r0
	ret
	
	; game won

LevelOKWon:

	;ZZZ
	or	r1,#1
	ret
	
;============================================================================
;
; Display Level Lost Screen
;
;----------------------------------------------------------------------------

LevelDie:
	; one less life to livw
	
	movw	rr8,PlayerVAddr
	mov	r1,PlayerLives(rr8)
	dec	r1
	mov	PlayerLives(rr8),r1
	
	;ZZZ
	ret
	
;============================================================================
;
; Display Game over Screen
;
;----------------------------------------------------------------------------

GameEnd:
	;ZZZ
	ret
	
;============================================================================
;
; Initialize the next level
;
;----------------------------------------------------------------------------

InitLevel:

	; Clear animation table

	mov	r7,#NumAnims
	movw	rr10,#AnimData
	movw	rr2,#0
InitLevelL2:
	movw	AnimBand(rr10),rr2
	addw	rr10,#AnimVSize
	dec	r7
	br	nz, InitLevelL2

	; get level to play
	
	movw	rr8,PlayerVAddr
	mov	r1,PlayerLevel(rr8)

	; get which game we are playing

	movw	rr12,#ClassicGame
	mov	r0,GameMode
	cmp	r0,#0
	br	eq,InitLevelClassic
	movw	rr12,#UpdatedGame
InitLevelClassic:

	; get offset to level entry in game table

	movw	rr10,#GameSize
	dec	r1
	mult	rr10,r1
	addw	rr10,rr12

	; remember level table location
	movw	rr12,GameLevel(rr10)
	movw	LevelAddr,rr12

	; get speed modifiers

	mov	r6,GameMult(rr10)
	mov	r7,GameDiv(rr10)
	movw	temp0,rr6

	; loop through each level

	mov	r7,#NumBands
	movw	rr10,#LevelData
InitLevelL0:

	mov	r1,#LevelStrips-1
	mov	LevelOffset(rr10),r1
	
	; reset positions of strips
	
	movw	rr0,#0
	movw	LevelXoff1(rr10),rr0

	; get velocity and separate direction

	clr	r6
	movw	rr0,LevelBaseU(rr12)
	btst	r0,#80h
	br	z,InitLevelLeft
	mov	r6,#80h
	xorw	rr0,#0ffffh
	incw	rr0
InitLevelLeft:
	or	r6,LevelFlags(rr12)
	mov	LevelVFlags(rr10),r6

	; get adjusted velocity

	mov	r3,r0	;keep units
	mov	r5,temp0
	mult	rr2,r5
	mov	r2,r3
	mov	r3,0
	mult	rr0,r5
	addw	rr0,rr2

	mov	r5,temp0+1
	cmp	r5,#0
	br	z,InitLevelL1
	div	rr0,rr4
InitLevelL1:	

	movw	LevelSpeedU(rr10),rr0

	; get are location

	mov	r0,LevelStrips(rr12)
	mov	r1,r0
	srl	r0
	srl	r0
	srl	r0
	srl	r0
	add	r0,#bankno_strip
	mov	LevelPageA(rr10),r0

	and	r1,#15
	sll	r1
	sll	r1
	sll	r1
	sll	r1
	mov	LevelYoffA(rr10),r1

	; establich the two data/drawing strips

	call	NextStrip
	call	NextStrip

	; scan strip for animations

	pushw	rr12
	pushw	rr10
	push	r7

	; set up initial conditions

	mov	r5,#9
	sub	r5,r7
	movw	rr6,LevelAddr2(rr10)
	mov	r4,#0
	mov	r1,LevelVFlags(rr10)
	mov	r0,#25

	; for each byte in strip table

InitLevelA0:

	; see if byte inside animation

	mov	r3,0(rr6)
	btst	r3,#80h
	br	z,InitLevelANo

	; see if byte is head or tail

	cmp	r3,#80h
	br	ne,InitLevelAH

	; tail

	and	r1,#255-LevelVFlagH
	or	r1,#LevelVFlagT
	br	InitLevelAE

	; head-- is it already processed?

InitLevelAH:
;	call	abaker1
	btst	r1,#LevelVFlagH
	br	nz,InitLevelAE

	; new animation

	or	r1,#LevelVFlagH
	and	r1,#255-LevelVFlagT

	pushw	rr0
	pushw	rr4
	pushw	rr6
	mov	r2,r3 ;ZZZ
	sll	r3
	cmp	r3,#6
	br	ult,zzz1
	call	abaker2
zzz1:	
	clr	r2
	pushw	rr8
	pushw	rr12
	movw	rr8,InitRoutines(rr2)
	mov	r2,1(rr6)

	; determine if need to reverse side of screen

	mov	r1,LevelVFlags(rr10)
	btst	r1,#LevelVFlagD
	br	z,InitLevelC0
	mov	r1,LevelFlags(rr12)
	btst	r1,#LevelFlagS+LevelFlagH
	br	nz,InitLevelC0

	; art reversed

	;mov	r1,r2
	;sll	r1
	;sll	r1
	;sll	r1
	mov	r1,r4
	mov	r4,#199
	sub	r4,r1
	or	r5,#80h

InitLevelC0:
	call	@rr8
	popw	rr12
	popw	rr8
	popw	rr6
	popw	rr4
	popw	rr0
	br	InitLevelAE

	; outside animation area

InitLevelANo:
	and	r1,#255-LevelVFlagH-LevelVFlagT
	
InitLevelAE:
	incw	rr6
	add	r4,#8
	dec	r0
	br	nz,InitLevelA0

	pop	r7
	popw	rr10
	popw	rr12

	mov	LevelVFlags(rr10),r1
	
	; handle anim flags if moving left to right
	
	and	r1,#LevelVFlagD
	br	z,InitLevelEnd
		
	; may be to right-- see if reversed art
	
	mov	r1,LevelFlags(rr12)
	btst	r1,#LevelFlagS+LevelFlagH
	jmp	z,InitLevelEnd
	
	; art moving left to right without flip

	; assume no animation
	
	mov	r1,LevelVFlags(rr10)
	and	r1,#255-LevelVFlagH-LevelVFlagT
	
	; determine if animation

	movw	rr2,LevelAddr2(rr10)
	mov	r3,0(rr2)
	btst	r3,#80h
	br	z,InitLevelAF
	
	; on animation head
	
	or	r1,#LevelVFlagH

	; restore flag
	
InitLevelAF:

	mov	LevelVFlags(rr10),r1

	; go to next band

InitLevelEnd:
	addw	rr12,#LevelSize
	addw	rr10,#LevelVSize
	dec	r7
	jmp	nz,InitLevelL0

	ret

;============================================================================
;
; Initialize the next frog
;
;----------------------------------------------------------------------------

InitFrog:

	; get level to play
	
	movw	rr8,PlayerVAddr
	mov	r1,PlayerLevel(rr8)

	; get which game we are playing

	movw	rr12,#ClassicGame-GameSize
	mov	r0,GameMode
	cmp	r0,#0
	br	eq,InitFrogClassic
	movw	rr12,#UpdatedGame-GameSize
InitFrogClassic:

	; get offset to level entry in game table

	movw	rr10,#GameSize
	mult	rr10,r1
	addw	rr10,rr12

	; get frog position

	mov	r0,GameFrogX(rr10)
	sll	r0
	sll	r0
	sll	r0
	mov	r1,#0
	movw	FrogX,rr0
	mov	FrogRest,r1
	mov	r0,GameFrogY(rr10)
	dec	r0
	sll	r0
	sll	r0
	sll	r0
	sll	r0
	mov	FrogY,r0
	mov	FrogMinY,r0

	; and other frog parameters

	mov	FrogDir,r1

	; set time to complete level

	movw	rr0,#TimerFull
	movw	Timer,rr0
	
	ret

;============================================================================
;
; Update Bands
;
;----------------------------------------------------------------------------

UpdateBands:

	; get loop information for bands

	movw	rr10,#LevelData
	movw	rr12,LevelAddr
	mov	r7,#NumBands

	; for each band

UpdateBandsL0:

	; get speed and position

	movw	rr2,LevelSpeedU(rr10)
	movw	rr4,LevelXoff1(rr10)

	; determine direction of motion
	
	mov	r1,#199
	mov	temp0,r1

	mov	r1,LevelVFlags(rr10)
	and	r1,#LevelVFlagD
	br	z,UpdateBandsL
		
	; may be to right-- see if reversed art
	
	mov	r1,LevelFlags(rr12)
	btst	r1,#LevelFlagS+LevelFlagH
	jmp	nz,UpdateBandsR
	
	mov	r1,#0
	mov	temp0,r1 
	
	; subtract speed from position

UpdateBandsL:
	movw	rr14,rr4
	decw	rr14
	subw	rr4,rr2
	movw	LevelXoff1(rr10),rr4
	subw	rr14,rr2
	br	nc,UpdateBandsL1

	; ran off left end of strip, get prior one

	call	NextStrip

	; determine if starting an animation 

UpdateBandsL1:

	; is right edge iin first or second strip

	mov	r3,temp0
	call	GetStripByte
	
	cmp	r7,#7	;ZZZ
	br	ne,zzza2	;ZZZ
	mov	ZZZ+6,r3	;ZZZ
	movw	ZZZ+4,rr14	;ZZZ
	mov	r1,LevelVFlags(rr10) ;ZZZ
	mov	ZZZ+8,r1	;ZZZ
	cmp	r1,#2	;ZZZ
	br	ne,zzza2	;ZZZ
	cmp	r3,#80h	;ZZZ
	br	ne,zzza2	;ZZZ
	call	abaker2	;ZZZ
zzza2:			;ZZZ	

	; get the byte and determine if part of an animation

	btst	r3,#80h
	br	z,UpdateBandsLNA  

	; inside animation: Determine if new

	mov	r1,LevelVFlags(rr10)
	btst	r1,#LevelVFlagH+LevelVFlagT
	br	z,UpdateBandsLNew
	
	; we have already processed this animation, wait for it to go by.

	btst	r1,#LevelVFlagH
	br	nz,UpdateBandsLH

	; already seen the tail-- treat as new if head

	cmp	r3,#80h
	br	eq,UpdateBandsE3a

	; here we add a new animation

UpdateBandsLNew:

	cmp	r3,#88h ;ZZZ
	br	eq,zzz12
	cmp	r3,#80h ;ZZZ
	br	ne,zzz11
zzz12:	
	mov	r3,temp0
	call	abaker1
zzz11:	

	; set flag as head

	or	r1,#LevelVFlagH
	mov	LevelVFlags(rr10),r1

	; do animation

	pushw	rr12
	pushw	rr10
	push	r7
	mov	r2,r3 ;ZZZ
	sll	r3
	cmp	r3,#6
	br	ult,zzz2
	call	abaker2
zzz2:	
	clr	r2
	movw	rr12,InitRoutines(rr2)
	mov	r2,1(rr14)
	mov	r4,temp0
	mov	r5,#9
	sub	r5,r7
	or	r5,#80h
	call	@rr12
	pop	r7
	popw	rr10
	popw	rr12
	
	br	UpdateBandsE3a

	; here we are in tail-- look for head

UpdateBandsLH:

	cmp	r3,#80h
	br	ne,UpdateBandsE3a

	and	r1,#255-LevelVFlagH
	or	r1,#LevelVFlagT
	mov	LevelVFlags(rr10),r1
	br	UpdateBandsE3a

	; right most byte not an animation: turn off "inside animation flags"

UpdateBandsLNA:

	mov	r1,LevelVFlags(rr10)
	and	r1,#255-LevelVFlagH-LevelVFlagT
	mov	LevelVFlags(rr10),r1

UpdateBandsE3a:
	jmp	UpdateBandsE3

	; add speed to position

UpdateBandsR:
	addw	rr4,rr2
	movw	LevelXoff1(rr10),rr4
	br	nc,UpdateBandsR1

	; ran off right end of strip, get next one

	call	PriorStrip

	; determine if starting an animation 

UpdateBandsR1:

	; point to leftmost byte of left strip
	; also put number of pixels off screen in r4

	mov	r3,#0
	call	GetStripByte

;	cmp	r3,#88h
;	br	eq,zzz9
;	cmp	r3,#81h
;	br	ne,zzz8
;zzz9:
;	call	abaker3
;zzz8:		

	; get the byte and determine if part of an animation

	btst	r3,#80h
	br	z,UpdateBandsRNA

	; inside animation: Determine if new

	mov	r1,LevelVFlags(rr10)
	btst	r1,#LevelVFlagH+LevelVFlagT
	br	z,UpdateBandsRNew

	; we have already processed this animation, wait for it to go by.

	btst	r1,#LevelVFlagT
	br	nz,UpdateBandsRT

	; already seen the head-- treat as new if tail

	cmp	r3,#80h
	jmp	ne,UpdateBandsE3

	; here we add a new animation

UpdateBandsRNew:

	; set flag based on if this is a 2 or a over 3 byte animation

	cmp	r3,#80h
	br	eq,UpdateBandsRNew0
	or	r1,#LevelVFlagH
	br	UpdateBandsRNew1
UpdateBandsRNew0:
	or	r1,#LevelVFlagT
UpdateBandsRNew1:
	mov	LevelVFlags(rr10),r1

	; loop to find head of animations

UpdateBandsRNew2:
	cmp	r3,#80h
	br	ne,UpdateBandsRNew3
	sub	r4,#8
	decw	rr14
	mov	r3,0(rr14)
	br	UpdateBandsRNew2
UpdateBandsRNew3:
	sub	r4,#8
	decw	rr14
	mov	r3,0(rr14)

	pushw	rr12
	pushw	rr10
	push	r7
	mov	r2,r3 ;ZZZ
	sll	r3
	cmp	r3,#6
	br	ult,zzz3
	call	abaker2
zzz3:	
	clr	r2
	movw	rr12,InitRoutines(rr2)
	mov	r2,1(rr14)
	mov	r5,#9
	sub	r5,r7
	or	r5,#80h
	mov	r4,#0
	call	@rr12
	pop	r7
	popw	rr10
	popw	rr12
	
	br	UpdateBandsE3

	; here we are in tail-- look for head

UpdateBandsRT:

	cmp	r3,#80h
	br	eq,UpdateBandsE3

	and	r1,#255-LevelVFlagT
	or	r1,#LevelVFlagH
	mov	LevelVFlags(rr10),r1
	br	UpdateBandsE3

	; left most byte not an animation: turn off "inside animation flags"

UpdateBandsRNA:

	mov	r1,LevelVFlags(rr10)
	and	r1,#255-LevelVFlagH-LevelVFlagT
	mov	LevelVFlags(rr10),r1

	; loop for next band

UpdateBandsE3:
	cmp	r7,#7	;ZZZ
	br	ne,zzza3	;ZZZ
	mov	r1,LevelVFlags(rr10) ;ZZZ
	mov	ZZZ+9,r1	;ZZZ
	br	zzza4	;ZZZ
zzza3:			;ZZZ
	br	ugt,zzza4	;ZZZ
	pushw	rr10	;ZZZ
	pushw	rr12	;ZZZ
	mov	r1,ZZZ+9	;ZZZ
	cmp	r1,#22h	;ZZZ
	br	ne,zzza5	;ZZZ
	movw	rr10,#LevelData	;ZZZ
	movw	rr12,#LevelVSize	;ZZZ
	sll	r13	;ZZZ
	addw	rr10,rr12	;ZZZ
	mov	r1,LevelVFlags(rr10)	;ZZZ
	cmp	r1,#22h	;ZZZ
	br	eq,zzza5	;ZZZ
	call	abaker3	;ZZZ
zzza5:			;ZZZ
	popw	rr12	;ZZZ
	popw	rr10	;ZZZ
			;ZZZ
zzza4:			;ZZZ	
	addw	rr10,#LevelVSize
	addw	rr12,#LevelSize
	dec	r7
	jmp	nz,UpdateBandsL0
	ret

;============================================================================
;
; Update Strip Anims
;
;----------------------------------------------------------------------------

UpdateSAnims:

	; get loop information for bands

	movw	rr10,#LevelData
	movw	rr12,LevelAddr
	movw	rr6,#NumBands-1
	
	; for each band

UpdateSAnimsL0:

	sll	r7
	sll	r7

	; get left strip number

	mov	r3,LevelOffset(rr10)
	clr	r2
	addw	rr12,rr2
	mov	r5,0(rr12)
	subw	rr12,rr2

	; process animation strip if it is

	pushw	rr2
	mov	r0,#1
	call	UpdateS1Anim
	popw	rr2

	; go to next strip

	add	r7,#2

	; return to first if past four

	inc	r3
	cmp	r3,#LevelStrips+4
	br	nz,UpdateSAnimsL2
	mov	r3,#LevelStrips
UpdateSAnimsL2

	; get strip value

	addw	rr12,rr2
	mov	r5,0(rr12)
	subw	rr12,rr2

	; if strip not valid, use first strip value

	cmp	r5,#255
	br	nz,UpdateSAnimsL3
	mov	r3,#LevelStrips
	addw	rr12,rr2
	mov	r5,0(rr12)
	subw	rr12,rr2
UpdateSAnimsL3:

	; process animation strip if it is

	mov	r0,#2
	call	UpdateS1Anim

	; loop for next band

UpdateSAnimsE:
	srl	r7
	srl	r7
	addw	rr10,#LevelVSize
	addw	rr12,#LevelSize
	dec	r7
	br	pl,UpdateSAnimsL0

	ret

;============================================================================
;
; Update Aimation in single strip
;
;----------------------------------------------------------------------------

UpdateS1Anim:

	; if not animated, bail

	btst	r5,#80h
	jmp	z,UpdateS1AnimE

	; decrement counter

	mov	r1,SAnimData(rr6)
	dec	r1
	mov	SAnimData(rr6),r1
	jmp	nz,UpdateS1AnimE

	; get number of animations and tick

	sll	r5
	clr	r4
	movw	rr14,StripAnims(rr4)
	movw	rr4,0(rr14)

	; store new tick

	mov	SAnimData(rr6),r5

	; increment strip offset

	inc	r7
	mov	r3,SAnimData(rr6)
	inc	r3
	cmp	r3,r4
	br	nz,UpdateS1AnimsL1
	clr	r3
UpdateS1AnimsL1:
	mov	SAnimData(rr6),r3
	dec	r7

	; offset for new table

	clr	r2
	addw	rr14,rr2
	mov	r3,SAnimStrips(rr14)

	cmp	r0,#2
	br	eq,UpdateS1AnimsL2

	; convert into art page number

	mov	r2,r3
	srl	r2
	srl	r2
	srl	r2
	srl	r2
	add	r2,#bankno_strip
	mov	LevelPage1(rr10),r2

	; convert into Y offset

	mov	r2,r3
	and	r2,#15
	sll	r2
	sll	r2
	sll	r2
	sll	r2
	mov	LevelYoff1(rr10),r2

	; convert into strip table address

	clr	r2
	addw	rr2,rr2
	addw	rr2,rr2
	addw	rr2,rr2
	addw	rr2,rr2
	addw	rr2,rr2
	addw	rr2,#StripTable
	movw	LevelAddr1(rr10),rr2

	br	UpdateS1AnimE

UpdateS1AnimsL2:

	; convert into art page number

	mov	r2,r3
	srl	r2
	srl	r2
	srl	r2
	srl	r2
	add	r2,#bankno_strip
	mov	LevelPage2(rr10),r2

	; convert into Y offset

	mov	r2,r3
	and	r2,#15
	sll	r2
	sll	r2
	sll	r2
	sll	r2
	mov	LevelYoff2(rr10),r2

	; convert into strip table address

	clr	r2
	addw	rr2,rr2
	addw	rr2,rr2
	addw	rr2,rr2
	addw	rr2,rr2
	addw	rr2,rr2
	addw	rr2,#StripTable
	movw	LevelAddr2(rr10),rr2

UpdateS1AnimE:
	ret

;============================================================================
;
; Update Frog:
;
;	r0 = user input
;
;----------------------------------------------------------------------------

UpdateFrog:

	call	StartFrog
	
	call	SitFrog	
	br	pl,UpdateFrogE
	
	call	MoveFrog
	
UpdateFrogE:
	ret
	
;============================================================================
;
; Move Frog:
;
;	FrogDir controls motion
;
;----------------------------------------------------------------------------

MoveFrog:
	
	; primary decision is based on what frog is currently doing!
	
	mov	r1,FrogDir
	cmp	r1,#FrogDirS
	br	eq,MoveFrogS	;South
	cmp	r1,#FrogDirN
	br	eq,MoveFrogN	;North
	cmp	r1,#FrogDirE
	br	eq,MoveFrogE	;East
	cmp	r1,#FrogDirW
	br	eq,MoveFrogW	;West
	cmp	r1,#FrogDirXW
	br	eq,MoveFrogXW	;Death by water
	cmp	r1,#FrogDirXL
	br	ne,MoveFrogCont	;Death by non-water (land)
	
	; Death by land or water
	
MoveFrogXL:
MoveFrogXW:
	dec	FrogTick
	br	nz,MoveFrogAdj
	mov	FrogTick,#FrogSpeed*32
	dec	FrogCnt
	br	nz,MoveFrogAdj
	br	MoveFrogDie

	; going south
		
MoveFrogS:
	dec	FrogTick
	br	nz,MoveFrogCont
	mov	FrogTick,#FrogSpeed
	add	FrogY,#FrogMoves
	dec	FrogCnt
	br	nz,MoveFrogCont
	br	MoveFrogStop
	
	; going north
		
MoveFrogN:
	dec	FrogTick
	br	nz,MoveFrogCont
	mov	FrogTick,#FrogSpeed
	sub	FrogY,#FrogMoves
	dec	FrogCnt
	br	nz,MoveFrogCont
	br	MoveFrogStop
	
	; going east
		
MoveFrogE:
	dec	FrogTick
	br	nz,MoveFrogAdj
	mov	FrogTick,#FrogSpeed
	add	FrogX,#FrogMoves
	dec	FrogCnt
	br	nz,MoveFrogAdj
	br	MoveFrogSAdj
	
	; going west
		
MoveFrogW:
	dec	FrogTick
	br	nz,MoveFrogAdj
	mov	FrogTick,#FrogSpeed
	sub	FrogX,#FrogMoves
	dec	FrogCnt
	br	nz,MoveFrogAdj
	
	; Stop but adjust
	
MoveFrogSAdj:

	mov	FrogDir,#0
	
	; Moving east west-- adjust position if moving
	
MoveFrogAdj:
	mov	r1,FrogFlags
	btst	r1,#FrogFlagM
	br	z,MoveFrogCont
	
	movw	rr6,FrogX
	movw	rr2,LevelSpeedU(rr10)
	
	mov	r1,LevelVFlags(rr10)
	btst	r1,#LevelVFlagD
	br	z,MoveFrogL
	
	addw	rr6,rr2	;moving right
	movw	FrogX,rr6
	br	MoveFrogCont
	
MoveFrogL:

	subw	rr6,rr2
	movw	FrogX,rr6

	; continue
	
MoveFrogCont:
	mov	r0,#0
	cmp	r0,#0
	ret
	
	; continue, but stop
	
MoveFrogStop:
	mov	FrogDir,#0
	br	MoveFrogCont
	
	; exit after death
	
MoveFrogDie:
	mov	r0,#255
	cmp	r0,#0
	ret
	
;============================================================================
;
; Start Frog:
;
;	If no current motion, base moves on R0
;
;----------------------------------------------------------------------------

StartFrog:

	; test motion
	
	mov	r1,FrogDir
	cmp	r1,#0
	jmp	ne,StartFrogExit
		
	; not moving
            
StartFrogM:

	; mark frog not moving

	mov	r1,FrogFlags
	and	r1,#255-FrogFlagM
	mov	FrogFlags,r1
	
	; time level

	movw	rr4,Timer
	movw	rr2,#TimerDec
	subw	rr4,rr2
	br	pl,StartFrogMM

	jmp	StartFrogXDie

StartFrogMM:
	movw	Timer,rr4

	; frog ain't moving-- is motion starting?
	
	cmp	r0,#0
	jmp	eq,StartFrogExit
	
	; User pressed something-- see what
	
	cmp	r0,#UserScreen
	jmp	ugt,StartFrogMJ
	
	; get position of left pad on screen row of frog
	
	mov	r7,FrogY
	srl	r7
	srl	r7
	srl	r7
	srl	r7
	movw	rr2,#13
	mult	rr2,r7
	
	cmp	r0,r3
	jmp	ule,StartFrogMU	;go up
	add	r3,#13
	cmp	r0,r3
	jmp	ugt,StartFrogMD	;go down
	sub	r3,#13
	mov	r2,FrogX
	srl	r2
	srl	r2
	srl	r2
	srl	r2
	add	r3,r2
	inc	r3
	cmp	r0,r3
	br	ult,StartFrogML	;go left
	jmp	eq,StartFrogStill	;stay put
	
	;Frog to go right
	
StartFrogMR:

	; get contents to right of frog
	
	mov	r7,FrogY
	mov	r3,FrogX
	add	r3,#24
	mov	r5,r3
	call	GetFrogByte
	
	; if wall, don't go
	
	cmp	r3,#StripWall
	jmp	eq,StartFrogExit
	
	; not wall, so go!
	
	mov	FrogTick,#FrogSpeed
	mov	FrogCnt,#FrogFrames
	mov	FrogDir,#FrogDirE
	jmp	StartFrogExit

	;Frog to go left
	
StartFrogML:
	
	; get contents to left of frog
	
	mov	r7,FrogY
	mov	r3,FrogX
	sub	r3,#8
	mov	r5,r3
	call	GetFrogByte
	
	; if wall, don't go
	
	cmp	r3,#StripWall
	jmp	eq,StartFrogExit
	
	; not wall, so go!
	
	mov	FrogTick,#FrogSpeed
	mov	FrogCnt,#FrogFrames
	mov	FrogDir,#FrogDirW
	jmp	StartFrogExit

	;Frog to go up
	
StartFrogMU:

	; get contents above frog
	
	mov	r7,FrogY
	cmp	r7,#0
	jmp	eq,StartFrogExit
	sub	r7,#16
	mov	r3,FrogX
	add	r3,#8
	mov	r5,r3
	call	GetFrogByte
	
	; if wall, don't go
	
	cmp	r3,#StripWall
	br	eq,StartFrogExit
	
	; not wall, so go!
	
	mov	FrogTick,#FrogSpeed
	mov	FrogCnt,#FrogFrames
	mov	FrogDir,#FrogDirN
	br	StartFrogExit

	;frog to go down
	
StartFrogMD:

	; get contents below frog
	
	mov	r7,FrogY
	cmp	r7,#160-32
	br	eq,StartFrogExit
	add	r7,#16
	mov	r3,FrogX
	add	r3,#8
	mov	r5,r3
	call	GetFrogByte
	
	; if wall, don't go
	
	cmp	r3,#StripWall
	br	eq,StartFrogExit
	
	; not wall, so go!
	
	mov	FrogTick,#FrogSpeed
	mov	FrogCnt,#FrogFrames
	mov	FrogDir,#FrogDirS
	br	StartFrogExit
	
	;Frog to die in water
	
StartFrogWDie:

	mov	FrogTick,#FrogSpeed
	mov	FrogCnt,#FrogFrames
	mov	FrogDir,#FrogDirXW
	br	StartFrogExit
	
	;Frog to die on land
	
StartFrogXDie:

	mov	FrogTick,#FrogSpeed
	mov	FrogCnt,#FrogFrames
	mov	FrogDir,#FrogDirXL
	br	StartFrogExit
	
	; check for joypad motion
	
StartFrogMJ:

	cmp	r0,#UserUp
	br	eq,StartFrogMU	;go up
	
	cmp	r0,#UserDown
	br	eq,StartFrogMD	;go down
	
	cmp	r0,#UserLeft
	jmp	eq,StartFrogML	;go left
	
	cmp	r0,#UserRight
	jmp	eq,StartFrogMR	;go right
	
	; no motion
	
StartFrogStill:

	mov	r0,#0
	
StartFrogExit:

	ret
	
;============================================================================
;
; SitFrog:
;
;	Handle frog not moving or to be moved
;
;----------------------------------------------------------------------------

SitFrog:
	; bail if moving, or motion may start
	
	cmp	r0,#0
	jmp	nz,SitFrogCont
	
	mov	r1,FrogDir
	cmp	r1,#0
	jmp	nz,SitFrogCont
	
	; frog ain't moving and not starting--
	
	; see if new band

	mov	r7,FrogY
	mov	r6,FrogMinY
	cmp	r7,r6
	jmp	uge,SitFrogJ0

	; new band, say so and add to score

	mov	FrogMinY,r7
	movw	rr8,PlayerVAddr
	movw	rr2,PlayerScore(rr8)
	movw	rr4,#SCORE_forward
	addw	rr2,rr4
	movw	PlayerScore(rr8),rr2

SitFrogJ0:
	
	; get Left setting

	mov	r7,FrogY
	mov	r3,FrogX
	add	r3,#8
	call	GetFrogByte     
	
	; handle done safe
	
	cmp	r3,#StripHome
	br	ne,SitFrogS1
	jmp	SitFrogHome
SitFrogS1:

	; handle landing on bad surface
	
	cmp	r3,#StripWDead
	br	eq,SitFrogWDie
	cmp	r3,#StripXDead
	br	eq,SitFrogXDie
	cmp	r3,#StripBDead
	br	eq,SitFrogXDie
	
	; moving surface takes precident over still
	
	cmp	r3,#StripMove
	br	ne,SitFrogS2
	mov	r1,FrogFlags
	or	r1,#FrogFlagM
	mov	FrogFlags,r1
SitFrogS2:	
 
	; handle done safe
	
	cmp	r3,#StripHome
	br	eq,SitFrogHome
	
	; Nothing much is happening-- adjust position if moving
	
	mov	r1,FrogFlags
	btst	r1,#FrogFlagM
	br	z,SitFrogCont
	
	movw	rr6,FrogX
	movw	rr2,LevelSpeedU(rr10)
	
	mov	r1,LevelVFlags(rr10)
	btst	r1,#LevelVFlagD
	br	z,SitFrogL
	
	addw	rr6,rr2	;moving right
	cmp	r6,#199-16
	br	ugt,SitFrogXDie
	movw	FrogX,rr6
	br	SitFrogCont
	
SitFrogL:

	subw	rr6,rr2
	cmp	r6,#199-16
	br	ugt,SitFrogXDie
	movw	FrogX,rr6
	br	SitFrogCont

	;Frog to die in water
	
SitFrogWDie:

	mov	FrogTick,#FrogSpeed
	mov	FrogCnt,#FrogFrames
	mov	FrogDir,#FrogDirXW
	br	SitFrogCont
	
	;Frog to die on land
	
SitFrogXDie:

	mov	FrogTick,#FrogSpeed
	mov	FrogCnt,#FrogFrames
	mov	FrogDir,#FrogDirXL
	
	; exit and continue level
	
SitFrogCont:
	mov	r1,#255
	cmp	r1,#0 	 
	ret
	
	; exit after found home
	
SitFrogHome:

	; see if home occupied-- place if not

	movw	rr8,PlayerVAddr
	mov	r1,FrogX
	mov	r2,#HomeBase1+24
	mov	r7,#1

SitFrogL1:
	cmp	r7,#32
	br	eq,SitFrogXDie

	cmp	r1,r2
	br	ugt,SitFrogJ2
	mov	r3,PlayerHomeF(rr8)
	and	r3,r7
	br	nz,SitFrogXDie

	or	r7,PlayerHomeF(rr8)
	mov	PlayerHomeF(rr8),r7

	sub	r2,#24
	mov	FrogX,r2
	br	SitFrogJ1

SitFrogJ2:
	add	r2,#40
	sll	r7
	br	SitFrogL1

SitFrogJ1:

	movw	rr2,PlayerScore(rr8)
	movw	rr4,#SCORE_home
	addw	rr2,rr4
	movw	rr4,#SCORE_time
	addw	rr2,rr4
	movw	PlayerScore(rr8),rr2

	; bail out saying we are done with "level"
	
	mov	r1,#1
	cmp	r1,#0
	ret

;============================================================================
;
; Get screen or animation byte under frog
;
;----------------------------------------------------------------------------

GetFrogByte:

	; remember target location
	
	mov	TargetX,r3
	mov	TargetY,r7
	
	; get screen byte
 
	call	GetScrnByte

	; handle animations
	
	btst	r3,#80h
	br	z,GetFrogByteJ0

	jmp	FrogAnimation

GetFrogByteJ0:

	ret

;============================================================================
;
; Frog has landed on an animation
;
;----------------------------------------------------------------------------

FrogAnimation:

	; assume the return value if missed animation

	;call	abaker2
	mov	r3,#StripMove

	; protect registers

	pushw	rr14
	pushw	rr12
	pushw	rr6

	; loop through animations

	movw	rr14,#AnimData
	mov	r7,#NumAnims

FrogAnimL0:

	; find an animation

	mov	r6,AnimBand(rr14)
	cmp	r6,#0
	br	z,FrogAnimE0

	; Verify animamtion is on same band

	mov	r6,TargetY ;ZZZ
	mov	r6,AnimYOff(rr14)
	cmp	r6,TargetY
	br	nz,FrogAnimE0

	; See if Animation starts before position
	; (any value over 208 is considered negative)
	
	mov	r6,TargetX ;ZZZ
	mov	r6,AnimXOff(rr14)
	cmp	r6,#208
	br	ugt,FrogAnimJ0
	cmp	r6,TargetX
	br	ugt,FrogAnimE0
FrogAnimJ0:	

	; This is animation if it ends after position
	
	add	r6,AnimRange(rr14)
	cmp	r6,TargetX
	br	ule,FrogAnimE0

	; found animation: protect more registers

	pushw	rr0
	pushw	rr4

	mov	r1,TargetX
	sub	r1,AnimXOff(rr14)
	clr	r0
	mov	r5,AnimXRel(rr14)
	clr	r4
	subw	rr0,rr4
	br	mi,FrogAnimE2

	movw	rr12,AnimAnim(rr14)
	srl	r1
	srl	r1
	srl	r1
	cmp	r1,AnimWidth(rr12)
	br	ge,FrogAnimE2

	; we are on the animation: get distance to correct frame bytes

	mov	r7,AnimWidth(rr12)
	mov	r4,AnimFNum(rr14)
	mult	rr6,r4

	; skip over ticks

	add	r7,AnimNum(rr12)

	; add this to structure base

	addw	rr12,rr6

	; get offset to correct byte

	addw	rr12,rr0

	; get underlying byte

	mov	r3,AnimTicks(rr12)

	; done with animation: get out

FrogAnimE2:

	popw	rr4
	popw	rr0
	br	FrogAnimE1

	; go to next animation

FrogAnimE0:
	addw	rr14,#AnimVSize
	dec	r7
	br	nz,FrogAnimL0

	call	abaker4

	; restore registers and exit

FrogAnimE1:

	popw	rr6
	popw	rr12
	popw	rr14
	ret
	
;============================================================================
;
; Update animations
;
;----------------------------------------------------------------------------

UpdateAnims:

	; loop through animations

	movw	rr14,#AnimData
	mov	r7,#NumAnims

UpdateAnimsL0:

	; see if this animation in use

	mov	r0,AnimBand(rr14)
	cmp	r0,#0
	jmp	eq,UpdateAnimsE0

	; update the position of the strip

	movw	rr12,AnimBand(rr14)

	movw	rr2,AnimXOff(rr14)
	mov	r6,AnimXOffH(rr14)
	movw	rr4,LevelSpeedU(rr12)

	mov	r0,LevelVFlags(rr12)
	btst	r0,#LevelVFlagD
	br	nz,UpdateAnimsJ1

	; level moving left

	subw	rr2,rr4
	sbc	r6,#0
	br	UpdateAnimsJ2

	; level moving right

UpdateAnimsJ1:

	addw	rr2,rr4
	adc	r6,#0

UpdateAnimsJ2:

	movw	AnimXOff(rr14),rr2
	mov	AnimXOffH(rr14),r6

	; see if animation area is off screen

	cmp	r6,#1
	br	eq,UpdateAnimsJ5

	mov	r4,AnimRange(rr14)
	clr	r5
	addw	rr2,rr4
	adc	r6,#0
	cmp	r6,#1
	br	eq,UpdateAnimsJ6

	; clear animation

UpdateAnimsJ7:

	clr	r6
	mov	AnimBand(rr14),r6
	br	UpdateAnimsE0

	; see if off right

UpdateAnimsJ5:

	mov	r4,#200
	clr	r5
	subw	rr2,rr4
	br	nc,UpdateAnimsJ7
	;br	pl,UpdateAnimsJ7

UpdateAnimsJ6:

	; count down on the animation

	mov	r1,AnimFTick(rr14)
	dec	r1
	br	nz,UpdateAnimsJ3

	; Times up, get animation for next frame

	movw	rr12,AnimAnim(rr14)

	; go to next frame

	mov	r6,AnimFNum(rr14)
	inc	r6
	cmp	r6,AnimNum(rr12)
	br	ne,UpdateAnimsJ4

	clr	r6

UpdateAnimsJ4:

	mov	AnimFNum(rr14),r6

	call	UpdateAMove

	; finish animation by copying ticks

	clr	r2
	mov	r3,r6
	addw	rr12,rr2

	mov	r1,AnimTicks(rr12)

UpdateAnimsJ3:

	mov	AnimFTick(rr14),r1

	; go to next animation

UpdateAnimsE0:

	addw	r14,#AnimVSize
	dec	r7
	jmp	nz,UpdateAnimsL0

	ret

UpdateAMove:

	; get motion values

	clr	r10
	mov	r2,AnimMove(rr12)
	mov	r11,r2
	clr	r2
	mov	r3,AnimXRel(rr14)

	; determine current motion direction

	mov	r1,AnimVFlags(rr14)
	btst	r1,#AnimVFlagD
	br	nz,UpdateAMoveR

	; moving left

	subw	rr2,rr10
	br	pl,UpdateAMoveJ0

	clr	r3
	xor	r1,#AnimVFlagD
	mov	AnimVFlags(rr14),r1

UpdateAMoveJ0:

	mov	AnimXRel(rr14),r3
	ret

UpdateAMoveR:

	addw	rr2,rr10

	mov	r0,AnimWidth(rr12)
	sll	r0
	sll	r0
	sll	r0
	mov	r11,r0
	addw	rr10,rr2

	clr	r4
	mov	r5,AnimRange(rr14)

	subw	rr4,rr10
	br	pl,UpdateAMoveRJ0

	xor	r1,#AnimVFlagD
	mov	AnimVFlags(rr14),r1

	mov	r3,AnimRange(rr14)
	sub	r3,r0

UpdateAMoveRJ0:

	mov	AnimXRel(rr14),r3
	ret

;============================================================================
;
; Get byte under address on screen
;
; GetScrnByte:
;
;	r7=y pixel on screen
;   or
;
; GetStripByte:
;
;	r10 = address of band ram table
;	r12 = address of band rom table
;
;     inputes:
;
;	r7 or (rr10 and rr12) as defined above
;	r3 = x pixel on screen
;
;     Output:
;
;	rr10 = address of band's ram table
;	rr12 = address of band's rom table
;	rr14 = address of byte
;	r3   = contents of byte
;	r4   = pixel distance to byte from left edge of screen
;
;----------------------------------------------------------------------------

GetScrnByte:

	push	r7

	srl	r7
	srl	r7
	srl	r7
	srl	r7
	
	movw	rr10,#LevelVSize
	mult	rr10,r7
	addw	rr10,#LevelData
	
	movw	rr12,#LevelSize
	mult	rr12,r7
	addw	rr12,LevelAddr
	
	call	GetStripByte
	
	pop	r7
	ret

GetStripByte:
	pushw	rr0 
	push	r2

	; get offset position
	
	mov	r4,LevelXoff1(rr10)
	
	; if reversed motion, we may reverse positions

	mov	r1,LevelVFlags(rr10)
	and	r1,#LevelVFlagD
	br	z,GetStripByteL1
		
	; may be to right-- see if reversed art
	
	mov	r1,LevelFlags(rr12)
	btst	r1,#LevelFlagS+LevelFlagH
	br	nz,GetStripByteL1
	
	sub	r3,#199
	neg	r3
	
GetStripByteL1: 

	; get distance from left edge of screen
	
	mov	r0,r4	
	and	r0,#7
	neg	r0
	add	r0,r3
	
	; pick the strip

	movw	rr14,LevelAddr1(rr10)
	cmp	r3,r4
	br	ult,GetStripByteR
	movw	rr14,LevelAddr2(rr10)
	
GetStripByteR:

	; get the offset from beginning of strip in pixels

	sub	r3,r4
	srl	r3
	srl	r3
	srl	r3
	clr	r2
	addw	rr14,rr2
	
	; get offset from left edge of screen to this byte
	
	mov	r4,r0
	
	; get out

  	mov	r3,0(rr14)
	pop	r2
	popw	rr0
	ret

;============================================================================
;
; Display Game
;
;----------------------------------------------------------------------------

DisplayGame:

	call	DisplayBands
	call	DisplayAnims
	call	DisplayFrog
	call	DisplayOlays

 	; show page

	call	Swap_page
	
	ret

;============================================================================
;
; Display Overlays
;
;----------------------------------------------------------------------------

DisplayOlays:

	; set up Full background

	movw	rr8,#0090h	;Upper left
	movw	rr10,#0c810h	;XxY
	clr	r12
            cmp     cur_page,#1
            br      eq,DisplayOlaysJ1
            bset    r12,#4
DisplayOlaysJ1:
	push	r12

	call	Fill_blk_colr

	pop	r12

	; set up timer boarder

	movw	rr8,#5798h
	movw	rr10,#5008h
	push	r12
	xor	r12,#3

	call	Fill_blk_colr

	pop	r12

	; set up timer background

	movw	rr8,#5899h
	mov	r2,Timer
	add	r8,r2
	movw	rr10,#4e06h
	sub	r10,r2

	call	Fill_blk_colr

            ; print the fixed text

            mov     r0,#0e4h
            mov     hold_byte1,r0

            movw    rr0,#DisplayOlays1
            movw    page_ptr1,rr0
            call    print_string

            movw    rr0,#DisplayOlays2
            movw    page_ptr1,rr0
            call    print_string

            ; print the player number

            mov     r0,NextPlayer
            or      r0,#'0'
            clr     r1
            movw    temp0w,rr0
            movw    rr0,#DisplayOlays0p
            movw    page_ptr1,rr0
            call    print_string

	; show remaining lives

	clr	r0
	mov	r1,#144
	movw	rr4,#0200h	;frog
	movw	temp0w,rr4
	movw	rr8,PlayerVAddr
	mov	r4,PlayerLives(rr8)
DisplayOlaysL1:
	dec	r4
	br	mi,DisplayOlaysJ2
	pushw	rr0
	push	r4
	movw	rr2,#temp0w
          	call	print_stringv
	pop	r4
	popw	rr0
	add	r0,#8
	br	DisplayOlaysL1
DisplayOlaysJ2:

;	; show remaining whatever
;
;	mov	r0,#192
;	mov	r1,#144
;	movw	rr4,#0100h	;Whatever
;	movw	temp0w,rr4
;	mov	r4,#6
;DisplayOlaysL2:
;	dec	r4
;	br	mi,DisplayOlaysJ3
;	pushw	rr0
;	movw	rr2,#temp0w
;	push	r4
;	call	print_stringv
;	pop	r4
;	popw	rr0
;	sub	r0,#8
;	br	DisplayOlaysL2
;DisplayOlaysJ3:

	; show score

	mov	r0,#40
	mov	r1,#152
	movw	rr8,PlayerVAddr
	movw	rr2,PlayerScore(rr8)
	call	print_score

	ret

DisplayOlays0p:
            defb    0,152
            defw    temp0w

DisplayOlaysT1:
            defm    '-UP'
            defb    0

DisplayOlaysT2:
            defm    'TIME'
            defb    0

DisplayOlays1:
            defb    8,152
            defw    DisplayOlaysT1

DisplayOlays2:
            defb    168,152
            defw    DisplayOlaysT2

;============================================================================
;
; Display Animations
;
;----------------------------------------------------------------------------

DisplayAnims:

	; video type

	mov	r15,#composite
            cmp     cur_page,#1
            br      eq,DisplayAnimsP1
            bset    r15,#1
DisplayAnimsP1:

	; loop through anims

	movw	rr4,#AnimData
	mov	r7,#NumAnims

DisplayAnimsL0:

	; see if animation in use

	mov	r0,AnimBand(rr4)
	cmp	r0,#0
	jmp	z,DisplayAnimsJ0

	; In use, point to animation hard data

	movw	rr2,AnimAnim(rr4)

	; set palette

            push    dmpl
	mov     r0,AnimPal(rr2)
	mov     dmpl,r0

	; Get Raw X,Y of image

	mov	r0,AnimFNum(rr4)
	mov	r11,r0
	mov	r0,AnimWidth(rr2)
	mult	rr10,r0
	mov	r0,AnimStripX(rr2)
	add	r11,r0
	sll	r11
	sll	r11
	sll	r11
	mov	r10,r11

	mov	r0,AnimStrip(rr2)
	mov	r11,r0
	sll	r11
	sll	r11
	sll	r11
	sll	r11

	; Get Raw width and height of animation

	mov	r0,AnimWidth(rr2)
	mov	r12,r0
	sll	r12
	sll	r12
	sll	r12
	mov	r13,#16

	; get raw bank and flags

	push	r15
	mov	r14,#bankno_sprite

	; Get Raw X,Y offset of destination

       	mov	r0,AnimXOff(rr4)
       	mov	r9,r0
	mov	r0,AnimXOffH(rr4)
	mov	r8,r0
	clr	r0
	mov	r1,AnimXRel(rr4)
	addw	rr8,rr0
	mov	r0,r8
	mov	r0,r8
	mov	r8,r9
	mov	r1,AnimYOff(rr4)
	mov	r9,r1

	; determine orientation of animation:

	mov	r1,AnimVFlags(rr4)
	btst	r1,#AnimVFlagD
	br	z,DisplayAnimsJ2

	; going left: reverse animation

	call	DisplayALeft
	br	DisplayAnimsJ1

	; going right: normal animation

DisplayAnimsJ2:

	call	DisplayARight

	; draw the animation

DisplayAnimsJ1:

	; skip animation if off screen

	br	z,DisplayAnimsJ3
	call	Fi_graph
DisplayAnimsJ3:

	pop	r15
            pop	dmpl

	; go to next animation

DisplayAnimsJ0:

	addw	rr4,#AnimVSize
	dec	r7
	jmp	nz,DisplayAnimsL0

	ret

DisplayALeft:

	or	r15,#left_right

	; determine if off left edge

	cmp	r0,#0
	br	ne,DisplayALeftJ0

	; off left edge: chop left side of anim and shorten display

	neg	r8
	sub	r12,r8
	br	z,DisplayALeftJ2
	br	mi,DisplayALeftJ2
	clr	r8
	or	r1,#1
	ret

DisplayALeftJ0:

	mov	r0,#0
	mov	r1,r8
	mov	r2,#0
	mov	r3,r12
	addw	rr0,rr2
	subw	rr0,#200
	br	z,DisplayALeftJ1
	br	mi,DisplayALeftJ1

	; off right edge: shorten width

	sub	r12,r1
	br	z,DisplayALeftJ2
	br	mi,DisplayALeftJ2
	add	r10,r1

DisplayALeftJ1:

	or	r1,#1
	ret

	; go here if not showing animation

DisplayALeftJ2:
	xor	r1,r1
	ret

DisplayARight:

	; determine if off left edge

	cmp	r0,#0
	br	ne,DisplayARightJ0

	; off left edge: chop left side of anim and shorten display

	neg	r8
	sub	r12,r8
	br	z,DisplayARightJ2
	br	mi,DisplayARightJ2
	add	r10,r8
	clr	r8
	or	r1,#1
	ret

DisplayARightJ0:

	mov	r0,#0
	mov	r1,r8
	mov	r2,#0
	mov	r3,r12
	addw	rr0,rr2
	subw	rr0,#200
	br	z,DisplayARightJ1
	br	mi,DisplayARightJ1

	; off right edge: shorten width

	sub	r12,r1
	br	z,DisplayARightJ2
	br	mi,DisplayARightJ2

DisplayARightJ1:

	or	r1,#1
	ret

	; go here if not showing animation

DisplayARightJ2:
	xor	r1,r1
	ret

;============================================================================
;
; Display the silly frog
;
;----------------------------------------------------------------------------

DisplayFrog:

	; establish destination
	
	mov	r8,FrogX
	mov	r9,FrogY
	
	; establish constant source
	
	mov	r11,#0
	
	; establish size
	
	mov	r12,#16
	mov	r13,#16
	
	; establish bank and base format
	
	mov	r14,#bankno_sprite
	mov	r15,#composite
            cmp     cur_page,#1
            br      eq,DisplayFrogP1
            bset    r15,#1
DisplayFrogP1:

	; what is animation
		
	mov	r1,FrogDir
	cmp	r1,#FrogDirS
	br	eq,DisplayFrogS	;South
	cmp	r1,#FrogDirN
	br	eq,DisplayFrogN	;North
	cmp	r1,#FrogDirE
	br	eq,DisplayFrogE	;East
	cmp	r1,#FrogDirW
	br	eq,DisplayFrogW	;West
	cmp	r1,#FrogDirXW
	br	eq,DisplayFrogXW	;Death by water
	cmp	r1,#FrogDirXL
	br	eq,DisplayFrogXL	;Death by non-water (land)
	
	; Frog just sitting
	
	mov	r10,FrogRest
	and	r10,#0c0h
	or	r15,r10
	mov	r10,FrogRest
	and	r10,#03fh
	br	DisplayFrogCont
	
	; Jumping South

DisplayFrogS:	
	mov	FrogRest,#0+up_down
	or	r15,#up_down
	mov	r10,#32
	br	DisplayFrogCont
	
	; Jumping North

DisplayFrogN:	
	mov	FrogRest,#0+up_down
	mov	r10,#32
	br	DisplayFrogCont
	
	; Jumping East

DisplayFrogE:
	mov	FrogRest,#48+left_right
	or	r15,#left_right
	mov	r10,#80
	br	DisplayFrogCont
	
	; Jumping West

DisplayFrogW:	
	mov	FrogRest,#48
	mov	r10,#80
	br	DisplayFrogCont
	
	; Death by Water

DisplayFrogXW:	
	mov	r1,#4
	sub	r1,FrogCnt
	sll	r1
	sll	r1
	sll	r1
	sll	r1
	add	r1,#96
	mov	r10,r1
	br	DisplayFrogCont
	
	; Death by land

DisplayFrogXL:	
	mov	r1,#4
	sub	r1,FrogCnt
	sll	r1
	sll	r1
	sll	r1
	sll	r1
	add	r1,#160
	mov	r10,r1
	
DisplayFrogCont:
	pushw	rr14
            call    Fi_graph
	popw	rr14

	; display homed frogs

	movw	rr4,PlayerVAddr
	mov	r5,PlayerHomeF(rr4)
	mov	r4,#5
	and	r15,#255-lr_up
	mov	r8,#HomeBase1
DisplayFrogL1:

	rrc	r5
	br	nc,DisplayFrogJ0

	mov	r9,0
	movw	r10,#0e000h
	movw	rr12,#1010h

	pushw	rr4
	pushw	rr14
	push	r8
	call	Fi_graph
	pop	r8
	popw	rr14
	popw	rr4

DisplayFrogJ0:
	add	r8,#40
	dec	r4
	br	nz,DisplayFrogL1

	ret

;============================================================================
;
; Display Bands
;
;----------------------------------------------------------------------------

DisplayBands:

	; start at top of screen and work down

	movw	rr6,#LevelData
	movw	rr4,LevelAddr
	mov	r0,#NumBands

	; loop for each band

DisplayBandsL0:
	push	r0
	pushw	rr4
	pushw	rr6
	
	; branch if art is moving

	mov	r1,LevelFlags(rr4)
	and	r1,#LevelFlagS
	br	z,DisplayBandsMov

	; still art: point to destination

	clr	r8
	mov	r9,#9
	sub	r9,r0
	sll	r9
	sll	r9
	sll	r9
	sll	r9

	; point to source

	mov	r1,LevelYoffA(rr6)
	clr	r10
	mov	r11,r1

	; set width and height

	mov	r12,#200
	mov	r13,#16

	; point to page

	mov	r1,LevelPageA(rr6)
	mov	r14,r1

	; set drawing style and location

	mov	r15,#override
            cmp     cur_page,#1
            br      eq,DisplayBandsP1
            bset    r15,#1
DisplayBandsP1:

	; draw the band and exit

            call    Fi_graph
	jmp	DisplayBandsEnd

	; draw one or two moving strips in band

DisplayBandsMov:

	; point to destination

	clr	r8
	mov	r9,#9
	sub	r9,r0
	sll	r9
	sll	r9
	sll	r9
	sll	r9

	; point to source

	mov	r0,LevelXoff1(rr6)
	neg	r0
	mov	r10,r0
	mov	r1,LevelYoff1(rr6)
	mov	r11,r1

	; set width and height

	neg	r0
	mov	r12,#200
	mov	r13,#16

	; point to page

	mov	r1,LevelPage1(rr6)
	mov	r14,r1

	; set drawing style and location

	mov	r15,#override
            cmp     cur_page,#1
            br      eq,DisplayBandsP3
            bset    r15,#1
DisplayBandsP3:

	; see if adjustments are needed: band too short

	;mov	r1,LevelVFlags(rr6)
	;btst	r1,#LevelVFlagD
	;br	z,DisplayBandsP8
	;cmp	r0,#0
	;br	eq,DisplayBandsP4
;DisplayBandsP8:	
	cmp	r0,#199
	br	ugt,DisplayBandsP4

	; shorten first strip draw

	cmp	r0,#0
	br	eq,DisplayBandsP9
	mov	r12,r0

	; determine direction of motion

	mov	r1,LevelFlags(rr4)
	btst	r1,#LevelFlagH+LevelFlagS
	br	nz,DisplayBandsP6
	mov	r1,LevelVFlags(rr6)
	and	r1,#LevelVFlagD
	br	z,DisplayBandsP6
	or	r15,#left_right
	mov	r8,#200
	sub	r8,r0
DisplayBandsP6:

	; draw first strip, saving important information
	push	r0
	push	r9
	call	Fi_graph
	pop	r9
	pop	r0
	popw	rr6
	popw	rr4
	pushw	rr4
	pushw	rr6
	
DisplayBandsP9:

	; adjust destination

	mov	r8,r0

	; point to source

	clr	r10
	mov	r1,LevelYoff2(rr6)
	mov	r11,r1

	; set width and height

	mov	r12,#200
	sub	r12,r0
	mov	r13,#16

	; point to page

	mov	r1,LevelPage2(rr6)
	mov	r14,r1

	; set drawing style and location

	mov	r15,#override
            cmp     cur_page,#1
            br      eq,DisplayBandsP5
            bset    r15,#1
DisplayBandsP5:


	; draw the band and exit

DisplayBandsP4:

	; determine direction of motion

	mov	r1,LevelFlags(rr4)
	btst	r1,#LevelFlagH+LevelFlagS
	br	nz,DisplayBandsP7
	mov	r1,LevelVFlags(rr6)
	and	r1,#LevelVFlagD
	br	z,DisplayBandsP7
	or	r15,#left_right
	clr	r8 
DisplayBandsP7:

            call    Fi_graph

	; we are done, so quit band

DisplayBandsEnd:
	popw	rr6
	popw	rr4
	pop	r0

	; point to next band to draw

	addw	rr6,#LevelVSize
	addw	rr4,#LevelSize
	dec	r0
	jmp	nz,DisplayBandsL0
	
	ret

;============================================================================
;
; Give r8=Rom Level, r10=Ram Level
; rotate strips to right
;
;----------------------------------------------------------------------------

NextStrip:
	; Get next left strip

	dec	r7
	
	sll	r7
	sll	r7
	clr	r6

	add	r7,#2
	movw	rr14,SAnimData(rr6)
	sub	r7,#2
	movw	SAnimData(rr6),rr14
	add	r7,#2

	mov	r3,LevelPage2(rr10)
	mov	LevelPage1(rr10),r3
	mov	r3,LevelYoff2(rr10)
	mov	LevelYoff1(rr10),r3
	movw	rr2,LevelAddr2(rr10)
	movw	LevelAddr1(rr10),rr2

	; get right strip

	; go to next strip

	mov	r3,LevelOffset(rr10)
	inc	r3

	; if too high, go back to first strip

	cmp	r3,#LevelStrips+NumStrips
	br	ne,NextStripL2
	mov	r3,#LevelStrips
NextStripL2:

	; if unused, go back to first strip

	clr	r2
	movw	rr14,rr12
	addw	rr14,rr2
	mov	r4,0(rr14)
	cmp	r4,#255
	br	ne,NextStripL3
	mov	r3,#LevelStrips
NextStripL3:

	mov	LevelOffset(rr10),r3

	; get current strip number

	movw	rr14,rr12
	addw	rr14,rr2
	mov	r3,0(rr14)

	; see if animation strip

	btst	r3,#80h
	br	z,NextStripL4

	; get strip animation table address

	sll	r3
	movw	rr14,StripAnims(rr2)

	; get contents of RAM strip animation table
	
	mov	r2,SAnimTick(rr14)
	mov	r3,#0
	movw	SAnimData(rr6),rr2

	; get value of first strip animation

	mov	r3,SAnimStrips(rr14)
	clr	r2

	; save current offset

NextStripL4:

	; convert into art page number

	mov	r2,r3
	srl	r2
	srl	r2
	srl	r2
	srl	r2
	add	r2,#bankno_strip
	mov	LevelPage2(rr10),r2

	; convert into Y offset

	mov	r2,r3
	and	r2,#15
	sll	r2
	sll	r2
	sll	r2
	sll	r2
	mov	LevelYoff2(rr10),r2

	; convert into strip table address

	clr	r2
	addw	rr2,rr2
	addw	rr2,rr2
	addw	rr2,rr2
	addw	rr2,rr2
	addw	rr2,rr2
	addw	rr2,#StripTable
	movw	LevelAddr2(rr10),rr2

	srl	r7
	srl	r7
	inc	r7

	ret

;============================================================================
;
; Give r8=Rom Level, r10=Ram Level
; rotate strips to left
;
;----------------------------------------------------------------------------

PriorStrip:
	; Get next right strip

	dec	r7
	sll	r7
	sll	r7

	movw	rr14,SAnimData(rr6)
	add	r7,#2
	movw	SAnimData(rr6),rr14
	sub	r7,#2

	mov	r3,LevelPage1(rr10)
	mov	LevelPage2(rr10),r3
	mov	r3,LevelYoff1(rr10)
	mov	LevelYoff2(rr10),r3
	movw	rr2,LevelAddr1(rr10)
	movw	LevelAddr2(rr10),rr2

	; get left strip

	; go to next strip

	mov	r3,LevelOffset(rr10)
	dec	r3

	; if too low, go forward to last strip

	cmp	r3,#LevelStrips-1
	br	ne,PriorStripL2
	mov	r3,#LevelStrips+NumStrips-1
PriorStripL2:

	; if unused, go to prior strip

	clr	r2
	movw	rr14,rr12
	addw	rr14,rr2
PriorStripL1:
	mov	r4,0(rr14)
	cmp	r4,#255
	br	ne,PriorStripL3
	dec	r3
	decw	rr14
	br	PriorStripL1
PriorStripL3:

	; save current offset

	mov	LevelOffset(rr10),r3

	; get current strip number

	movw	rr14,rr12
	addw	rr14,rr2
	mov	r3,0(rr14)

	; see if animation strip

	btst	r3,#80h
	br	z,PriorStripL4

	; get strip animation table address

	sll	r3
	movw	rr14,StripAnims(rr2)

	; get contents of RAM strip animation table
	
	mov	r2,SAnimTick(rr14)
	mov	r3,#0
	movw	SAnimData(rr6),rr2

	; get value of first strip animation

	mov	r3,SAnimStrips(rr14)
	clr	r2

	; save current offset

PriorStripL4:

	; convert into art page number

	mov	r2,r3
	srl	r2
	srl	r2
	srl	r2
	srl	r2
	add	r2,#bankno_strip
	mov	LevelPage1(rr10),r2

	; convert into Y offset

	mov	r2,r3
	and	r2,#15
	sll	r2
	sll	r2
	sll	r2
	sll	r2
	mov	LevelYoff1(rr10),r2

	; convert into strip table address

	clr	r2
	addw	rr2,rr2
	addw	rr2,rr2
	addw	rr2,rr2
	addw	rr2,rr2
	addw	rr2,rr2
	addw	rr2,#StripTable
	movw	LevelAddr1(rr10),rr2

	srl	r7
	srl	r7
	inc	r7

	ret

;============================================================================
;
; Init Strip Anims
;
;	rr10 -> This strips data structure
;	r2 = width | 80h
;	r4 = screen X
;	r5 = screen Y/8
;
;----------------------------------------------------------------------------

InitRoutines:
	defw	abaker4
	defw	InitAnim1
	defw	InitAnim2

;============================================================================
;
; Initialize animation 1
;
;----------------------------------------------------------------------------

InitAnim1:
	push	r14

	; Pick out Animation

	movw	rr6,#snake

	; keep direction importance flag

	mov	r3,r5

	; correct Y pixel value

	sll	r5
	sll	r5
	sll	r5
	sll	r5

	; make sure range isn't zero

	cmp	r5,#0
	br	ne,InitAnim1L1
	mov	r5,#255
InitAnim1L1:

	; find an available animation block

	mov	r14,#NumAnims
	movw	rr12,#AnimData
InitAnim1L0:
	mov	r0,AnimBand(rr12)
	cmp	r0,#0
	br	ne,InitAnim1J0

	; Found one-- initialize it: first, which animation routine am I

	mov	r0,#1
	mov	AnimCall(rr12),r0	; I am routine 1

	; remember band and animation addresses

	movw	AnimBand(rr12),rr10
	movw	AnimAnim(rr12),rr6

	; initialize other initially constant values

	clr	r0
	mov	AnimFNum(rr12),r0
	mov	AnimVFlags(rr12),r0
	clr	r1
	movw	AnimXRel(rr12),rr0
	inc	r0
	mov	AnimFTick(rr12),r0

	; get and store width of animation area

	and	r2,#7fh
	sll	r2
	sll	r2
	sll	r2
	mov	AnimRange(rr12),r2

	; locate upper left edge of animation

	mov	AnimYOff(rr12),r5
	clr	r5
	movw	AnimXOff(rr12),rr4
	inc	r5
	mov	AnimXOffH(rr12),r5
	dec	r5

	; if ignoring direction, we are done

	btst	r3,#80h
	br	z,InitAnim1E0

	; otherwise, adjust upper-left if moving left to right

	mov	r3,LevelVFlags(rr10)
	btst	r3,#LevelVFlagD
	br	z,InitAnim1E0

	dec	r2
	clr	r3
	subw	rr4,rr2
	movw	AnimXOff(rr12),rr4
	mov	r4,AnimXOffH(rr12)
	sbc	r4,#0
	mov	AnimXOffH(rr12),r4

	br	InitAnim1E0

InitAnim1J0:
	addw	rr12,#AnimVSize
	dec	r14
	br	nz,InitAnim1L0

	call	abaker4

InitAnim1E0:
	pop	r14
	ret

;============================================================================
;
; Initialize animation 2
;
;----------------------------------------------------------------------------

InitAnim2:
	;ZZZ
	ret

	end
