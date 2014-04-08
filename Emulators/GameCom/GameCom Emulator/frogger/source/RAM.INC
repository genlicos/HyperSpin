RX_head		equ	0a0h
RX_tail		equ	0a2h
STPID		equ	0a4h		
IF .NOT. NEW_SPEECH
sp_end_bank	equ	0a5h
sp_end_address	equ	0a6h
ELSE
UART_new_ibank	equ	0a5h
TMR1_new_ibank	equ	0a6h
PIO_new_ibank	equ	0a7h
ENDIF
sp_control	equ	0a8h		;--------------------------
					;bit 0 : 0 - stop
					;        1 - start
					;bit 1 : 0 - PCM
					;        1 - ADPCM
					;bit 2 : 0 - low nibble
					;	 1 - high nibble
					;bit 3 : 0 - pause disable
					;	 1 - pause enable
					;bit 4 : 0 - play mode
					;        1 - pause mode
					;bit 5 : 0 - enable time out
					;        1 - disable time out
					;bit 6 : 0 - main menu spinning mode
					;        1 - main menu cursor mode
					;bit 7 : 0 - normal
					;        1 - sound selection screen 
					;            entered
					;--------------------------
IF .NOT. NEW_SPEECH
sp_bank		equ	0a9h		;speech data bank
sp_address	equ	0aah		;speech data address
ELSE
TMR0_new_ibank	equ	0a9h
CLK_new_ibank	equ	0aah
INT_new_ibank	equ	0abh
ENDIF
SP_CTR1		equ	0ach		;speech timer
SP_CTR2		equ	0adh		;
TX_head		equ	0aeh		;head pointer of tx queue
;TX_tail		equ	0ach		;tail pointer of tx queue
PVOICE		equ	0b0h
UART_control	equ	0b1h		;-------------------------
					;bit 0 : 0 - TX disable
					;        1 - TX enable
					;bit 1 : 0 - RX disable
					;        1 - RX enable
					;bit 2 : 0 - system UART isr
					;        1 - application defined isr
					;bit 3 : 0 - system TX queue
					;        1 - appl. TX defined queue
					;bit 4 : 0 - system RX queue
					;        1 - appl. RX defined queue
					;------------------------------------
;kstemp0		equ	0b2h		;kernel use temp 0
IF NEW_SPEECH
WDT_new_ibank	equ	0b2h
NMI_new_ibank	equ	0b3h
ENDIF
UT_clk		equ	0b4h		;User timer clock
ScanTMR		equ	0b5h		;Key scan timer
RepeatRate	equ	0b6h		;repeat rate counter
Oldkey		equ	0b7h		;key history
KEYHEAD		equ	0b8h		;head pointer of key buffer
KEYTAIL 	equ	0bah		;tail pointer of key buffer
SYSFLAG		equ	0bch		;--------------------------
					;bit 0 : 1 - initialize from power on
					;        0 - no data destroy
					;bit 1 : 0 - not turn on unit
					;        1 - turn on unit
					;bit 2 : 0 - 3 minute time out
					;        1 - 5 minute time out
					;bit 3 : 0 - even second
					;        1 - odd second
					;bit 4 : 0 - none
					;        1 - warning beep in progress
					;bit 5 : 0 - normal sound output
					;        1 - no sound output (MUTE)
					;bit 6 : 0 - normal timer (4.9152ms)
					;	 1 - Speech processing (41.6us)
					;bit 7 : 0 - ---
					;        1 - quit box asking screen
					;--------------------------
					
KBDFLAG		equ	0bdh		;--------------------------
					;bit 0 : 0 - scan membrane
					;        1 - not to scan membrane
					;bit 1 : 0 - scan keypad
					;        1 - not to scan keypad
					;bit 2 : 0 - sleep if no event
					;        1 - no sleep if no event
					;bit 3 : 0 - scan cycle
					;        1 - not a scan cycle
					;bit 4 : 0 - repeat key is not allowed
					;        1 - repeat key is allowed
					;bit 5 : 0 - 
					;	 1 - Delay of repeat key
					;bit 6 : 0 -
					;	 1 - debounce of the key
					;bit 7 : 0 -
					;        1 - key is held down
					;-------------------------
;**************************************************
;
;	User defined vector table
;
;**************************************************
UART_new_isr	equ	100h
TMR1_new_isr	equ	102h
PIO_new_isr	equ	104h
TMR0_new_isr	equ	106h
CLK_new_isr	equ	108h
INT_new_isr	equ	10ah
NMI_new_isr	equ	10ch
WDT_new_isr	equ	10eh
PRN_PORT	equ	110h	;image of the printer port address
				;default = 0fff0h
DMG_timer	equ	112h
;Attack_Buffer	equ	112h
;Defense_Buffer	equ	114h
;Max_attack	equ	116h
;Max_defense	equ	117h
;hit_infoa	equ	118h
;hit_infod	equ	11ah
cursor_pos	equ	11ch
cursor_tmr	equ	11dh
TX_tail		equ	11eh
SIGN		equ	SKRAM
Year		equ	SIGN+4
Month		equ	Year+1
Day		equ	Month+1
Hour		equ	Day+1
Minute		equ	Hour+1
Second		equ	Minute+1
AYear		equ	Second+1
AMonth		equ	AYear+1
ADay		equ	AMonth+1
AHour		equ	ADay+1
AMinute		equ	AHour+1
ASecond		equ	AMinute+1
KBuff		equ	ASecond+1
;=================================;
Call_dest	equ	AYear
Cart_Prog_Bank	equ	AHour
;----------------------------------;
;	Main/Kernel
;----------------------------------;
UTimer1C	equ	150h		;-------------------------
					;User timer 1 control
					; 00 - Idle
					; 01 - Run
					; 02 - Pause
					;-------------------------
UTimer1H	equ	151h
UTimer1L	equ	152h
appl_no		equ	168h
Melody_Register	equ	169h		;-------------------------
					;bit 0 : channel 0 enable
					;bit 1-2 : channel 0 instrument
					;          00 : piano
					;          01 : organ
					;          10 : -----
					;          11 : -----
					;bit 3 : channel 0 output enable
					;bit 4 : channel 1 enable
					;bit 5,6 : channel 1 instrument
					;          00 : piano
					;          01 : organ
					;          10 : -----
					;          11 : -----
					;bit 7 : channel 1 output enable
					;-------------------------
Mel_address0	equ	16ah
Mel_address1	equ	16ch
Mel_bank0	equ	16eh
Mel_bank1	equ	16fh
ADSR_register	equ	170h		;-------------------------
					;bit 0 - Channel 0 attack
					;bit 1 - channel 0 decay
					;bit 2 - channel 0 sustain
					;bit 3 - channel 0 release
					;bit 4 - channel 1 attack
					;bit 5 - channel 1 decay
					;bit 6 - channel 1 sustain
					;bit 7 - channel 1 release
					;-------------------------
Tone0content	equ	171h		;amplitdue control for channel 0
Tone1content	equ	172h		;amplitude control for channel 1
ToneLength0	equ	173h		;length of the tone in channel 0
ToneLength1	equ	174h		;length of the tone in channel 1
no_of_voice	equ	175h
Melody_timer	equ	176h		;count = 10 --> 49ms per unit
Tone0Holdtimer	equ	177h
Tone1Holdtimer	equ	178h
menu_mode	equ	179h		;--------------------
				; MAIN MENU SPINNING MODE :
					;bit 0 - bit 2 : Timer ID
					;bit 3-6 : starting speech progress
					;  0 : starting speech
					;  1 : screen #1	(00001XXX)
					;  2 : screen #2	(00010XXX)
					;  3 : screen #3	(00011XXX)
					;  4 : screen #4	(00100XXX)
					;  5 : screen #5	(00101XXX)
					;  6 : screen #6	(00110XXX)
					;  7 : screen #7	(00111XXX)
					;  8 : screen #6	(01000XXX)
					;  9 : screen #5	(01001XXX)
					;  a : screen #4	(01010XXX)
					;  b : screen #3	(01011XXX)
					;  c : screen #2	(01100XXX)
					;  10h : icon pressed	(10000XXX)
				; MAIN MENU CURSOR MODE
					;---------------------
Cart_dest	equ	17ah		;Cart jump address
Cart_mode	equ	17ch		;-------------------------
					;bit 0 - 0 no cart in slot #1
					;	 1 cartridge existed in #1
					;bit 1 - 0 no cart in slot #2
					;	 1 cartridge existed in #2
					;bit 2 - 0 current cartridge is #1
					;	 1 current cartridge is #2
					;bit 3 - 0 cart 1 contains program
					;        1 cart 1 contains data only
					;bit 4 - 0 cart 2 contains program
					;        1 cart 2 contains data only
					;-------------------------
Cart_bank1	equ	17dh		;0 - no cart, non-zero, header bank #
Cart_bank2	equ	17eh		;0 - no cart, non-zero, header bank #
KBDTMR		equ	17fh		;keyboard use timer
Sys_TX_queue	equ	180h
Sys_RX_queue	equ	188h
User_TX_qq	equ	190h		;tx queue from user
User_RX_qq	equ	192h		;rx queue from user
User_TX_qsize	equ	194h		;tx queue size from  user
User_RX_qsize	equ	196h		;rx queue size from  user

