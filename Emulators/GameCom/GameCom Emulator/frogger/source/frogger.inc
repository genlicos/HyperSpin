             data

;============================================================================
;
; Game Equates
;
;----------------------------------------------------------------------------

MaxPlayers	equ	8
MaxLevels	equ	12
NumBands	equ	9
NumStrips	equ	4
NumAnims	equ	8
NumSAnims	equ	NumBands*2
NumSounds	equ	19

TimerFull	equ	04e00h	;78*256 is full time per level
TimerDec	equ	7	;timer decrease per loop

;============================================================================
;
; Game Equates: Game.Com Control
;
;----------------------------------------------------------------------------

ini_game        EQU     0   ; INITIAL
exe_game        EQU     1   ; EXECUTE
close_game      EQU     2   ; CLOSE GAME
reset_game      EQU     3   ; RESET
frogger_id      equ     0426h

override        equ     00h
composite       equ     01h
left_right      equ     40h
up_down         equ     80h
lr_up           equ     0c0h

;============================================================================
;
; Game Equates: Scoring
;
;----------------------------------------------------------------------------

SCORE_forward equ	10
SCORE_home	equ	50
SCORE_five	equ	1000
SCORE_lady	equ	200
SCORE_fly	equ	200
SCORE_time	equ	10

;============================================================================
;
; Game Equates: Home Bases
;
;----------------------------------------------------------------------------

HomeBase1	equ	12
HomeBase2	equ	52
HomeBase3	equ	92
HomeBase4	equ	132
HomeBase5	equ	172

;============================================================================
;
; Game Structures
;
;----------------------------------------------------------------------------

; ROM

	; Game Data
	struct
GameLevel	word	1
GameMult	byte	1
GameDiv	byte   	1
GameFrogX	byte	1
GameFrogY	byte	1
GameSize	size

	; Level Data
	struct
LevelFlags	byte	1
	byte	1
LevelBaseU	byte	1
LevelBaseF	byte	1
LevelIncM	byte	1
LevelIncD	byte	1
LevelDecM	byte	1
LevelDecD	byte	1
LevelStrips	byte	4	;NumStrips
LevelSize	size

	;Level Data: strip byte values
	
StripStill	equ	0	;Frog doesn't move and is safe
StripMove	equ	1	;Frog is moving and is safe
StripHome	equ	2	;Frog has reached home
StripWall	equ	3	;Frog can't go here: wall
StripWDead	equ	4	;Frog dies in water
StripXDead	equ	5	;Frog Dies not in water
StripBDead	equ	10	;Frog can't move here, trying dies

	; Anim Data
	struct
AnimStrip	byte	1	;the art strip holding the anim
AnimWidth	byte	1	;width of anim in 8 pixel pieces
AnimNum	byte	1	;Number of frames in animation
AnimPal	byte	1	;Palette
AnimStripX	byte	1	;Number of 8 bit pixels into strip
AnimMove	byte	1	;Number of pixels movement each frame
AnimSize	size		;size of header
AnimTicks	byte	1	;start of frame tickers	

	; Strip Animation
	struct
SAnimNum	byte	1	;number of frames in the animation
SAnimTick	byte	1	;Number of ticks between frames
SAnimStrips	byte	1	;The first strip in the list of animating strips	

; RAM
	; Player Data
	struct
PlayerScore	word	1
PlayerLevel	byte	1
PlayerLives	byte	1
PlayerHomeF	byte	1
PlayerUnused byte	1
PlayerVSize	size

	; Level Data
	struct
LevelSpeedU	byte	1	;composite (current) speed
LevelSpeedF	byte	1	;
LevelVFlags	byte	1
LevelOffset	byte	1	;offset (LevelStrips - +3) to left strip number
LevelPageA	byte	1	;Art page
LevelYoffA	byte	1	;Art yoffset
LevelAddr1	word	1	;Left Strip table address
LevelAddr2	word	1	;Right strip table address
LevelPage1	byte	1	;Left or unmoving art page
LevelPage2	byte	1	;Right or unused art page
LevelYoff1	byte	1	;Left or unmoving art offset
LevelYoff2	byte	1	;Right or unused art offset
LevelXoff1	byte	1	;Left X offset for art (pixels)
LevelXofff	byte	1	;Left X offset fraction (pixels)
LevelVSize	size

	; Animation Data
	struct
AnimBand	word	1	;Band animation is on
AnimAnim	word	1	;which animation am I controlling
AnimXOff	word	1	;offset from left edge of screen (+100h)
AnimXOffH	byte	1	;X offset high value
AnimFNum	byte	1	;the frame number currently diplayed
AnimFTick	byte	1	;how many ticks left till anim changes
AnimRange	byte	1	;width of animation area in pixels
AnimVFlags	byte	1	;flags
AnimXRel	word	1	;relative position in area U.F
AnimYOff	byte	1	;offset from top of screen
AnimCall	byte	1	;routine to call (1 to ...)
AnimVSize	size
	
	;Strip Animation
	struct
SAnimTime	byte	1	;Time left before change
SAnimCur	byte	1	;current strip in animation
SAnimVSize	size  

; these two flags are also copied to LevelVFlag
LevelFlagS	equ	01h  	;Art does not move
LevelFlagH	equ	02h	;Art doesn't h-flip on direction change

LevelVFlagD	equ	80h	;80h= left to right
LevelVFlagH	equ	40h	;last byte processed was anim header
LevelVFlagT	equ	20h	;last byte processed was anim non-header

AnimVFlagD	equ	80h	;anim moving left to right

;============================================================================
;
; Game States
;
;----------------------------------------------------------------------------

Game_Open	equ	0
Game_Menus	equ	1
Game_Init	equ	2
Game_Next	equ	3	;go to next (or first, or only)
Game_Play	equ	4

;============================================================================
;
; Zero Page Ram (0beh-0ffh)
;
;----------------------------------------------------------------------------

            org     0beh
HoldSP      defs    2                   ;hold the game SP
CursorX     defs    1                   ;Cursor X,Y
CursorY     defs    1                   ;
GameState   defs    1                   ;game state
NumPlayers  defs    1                   ;1-MaxPlayers
GameMode    defs    1                   ;0=Arcade, 1=Tiger
Difficulty  defs    1                   ;0=Easy, 1=Arcade
Lives       defs    1                   ;3-5
Continue    defs    1                   ;0=Off, 1=On
StartLevel  defs    1                   ;1-5
Paused      defs    1                   ;1=game paused
SfxOn       defs    1                   ;1=Sound Effects on
MusicOn     defs    1                   ;1=Music On
DemoMode    defs    1                   ;1=Demo, 0=regular
sound_flag	defs	1
Timer	defs	2	;Time on level remaining (4E00h=full time)

temp0w      defs    2                   ;work areas word
temp1w      defs    2                   ;work areas word
temp0       defs    1                   ;work areas
temp1       defs    1                   ;work areas
temp2       defs    1                   ;work areas

	; Game Data

NextPlayer	defs	1
PlayerVAddr	defs	2
LevelAddr	defs	2

	; Frog animation controls
	
FrogX	defs	2	;Current screen X
FrogY	defs	1	;Current screen Y
FrogMinY	defs	1	;Current minimum Y for scoring
FrogTick	defs	1	;Ticks till next move
FrogDir	defs	1	;1=S, 2=N, 3=E, 4=W, 0=sitting
FrogCnt	defs	1	;Count of remaining animations
FrogFlags	defs	1	;Frog Flags
FrogPage	defs	1	;page of frog art
FrogArtX	defs	1	;x of frog art
FrogArtY	defs	1	;y of frog art
FrogRest	defs	1	;resting animation

TargetX	defs	1	;Where Frog will be for texting
TargetY	defs	1	;

LastKey	defs	1	;Last Key entered

hold_byte1	defs	1

FrogFlagM	equ	80h	;on if moving with strip

FrogDirS	equ	1	;moving south
FrogDirN	equ	2	;moving north
FrogDirE	equ	3	;moving east
FrogDirW	equ	4	;moving west
FrogDirXW	equ	5	;dying waterdeath
FrogDirXL	equ	6	;dying landdeath

FrogSpeed	equ	2	;Number of ticks per move
FrogMoves	equ	4	;Number of movement pixels
FrogFrames	equ	4	;Number of frames

ZZZ	defs	10

testff:
            if      testff .gt. 0ffh
            error 	Too much data in zero page ram
            endif

;============================================================================
;
; Non-Zero page Ram (208h-37fh)
;
;----------------------------------------------------------------------------

	org	208h
PlayerData	defs	MaxPlayers*PlayerVSize
LevelData	defs	NumBands*LevelVSize
AnimData	defs	NumAnims*AnimVSize
SAnimData	defs	NumSAnims*SAnimVSize

new_melody_ptr defs 1
DemoPtr	defs	2
DemoCnt	defs	1

page_ptr1	defs	2
index0	defs	1
index1	defs	1
index2	defs	1
index3	defs	1

test37f:
	if	test37f .gt. 37fh
	error	Too much data in non-zero page ram
	endif

;============================================================================
;
; User input equates
;
;----------------------------------------------------------------------------

;	001-013	 ;row 0 of screen, column 0 to 12
;	...	 ;...
;	118-082h ;row 9 of screen, column 0 to 12
;
;	spot on screen = row*13+column+1

UserScreen	equ	082h	;highest screen press

UserUp	equ	083h	;joypad up
UserDown	equ	084h	;joypad down
UserLeft	equ	085h	;joypad left
UserRight	equ	086h	;joypad right

UserMenu	equ	087h	;Menu button
UserSound	equ	089h	;Sound button
UserPause	equ	08ah	;Pause button

UserA	equ	08bh	;A button
UserB	equ	08ch	;B button
UserC	equ	08dh	;C button
UserD	equ	08eh	;D button

;============================================================================
;
; Bank definitions
;
;----------------------------------------------------------------------------

program_bank1   equ     020h
program_bank2   equ     021h
program_bank3   equ     023h
program_bank4   equ     024h
program_bank5   equ     025h
program_bank6   equ     026h

bankno_front0 equ   20h
bankno_front1 equ   21h
bankno_front2 equ   22h
bankno_sprite equ   23h
bankno_strip  equ   24h
bankno_winpic10 equ 72h ;    bankno_winpic9+2

;============================================================================
;
; Macros
;
;----------------------------------------------------------------------------

;	; long conditional branches
;	
;breq:	macro	?dest
;	br	ne,cont???
;	jmp	eq,?dest
;cont???:
;	endm
;	
;brne:	macro	?dest
;	br	eq,cont???
;	jmp	ne,?dest
;cont???:
;	endm
;	
;brnz:	macro	?dest
;	br	z,cont???
;	jmp	nz,?dest
;cont???:
;	endm
;	
;bruge:	macro	?dest
;	br	ult,cont???
;	jmp	uge,?dest
;cont???:
;	endm
;	
;brugt:	macro	?dest
;	br	ule,cont???
;	jmp	ugt,?dest
;cont???:
;	endm
;	
;brule:	macro	?dest
;	br	ugt,cont???
;	jmp	ule,?dest
;cont???:
;	endm
;	
;brz:	macro	?dest
;	br	nz,cont???
;	jmp	z,?dest
;cont???:
;	endm
	
;============================================================================
;
; The old stuff here
;
;----------------------------------------------------------------------------

;ASB	include oldstuff.inc

            program
