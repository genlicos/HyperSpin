DEMO_ROM	equ	0
;------------------------------------------
;	test program
;------------------------------------------
KEYTEST		equ	0
QWSOUND_TEST	equ	0
NEW_GRAPHIC1	equ	1
HALTTEST	equ	0
SOUND_TEST	EQU	0
CURSOR_ENABLE	EQU	1
FAST_OPEN	EQU	0
NEW_SPEECH	EQU	1		;IMPROVED SPEECH SPEED
MANUEL_TEST	EQU	0
					;ENABLE BANK SWITCH FOR ISR
STARTYR		equ	80		;1994 starting year
SKRAM		equ	120h		;start of the kernel RAM
TBase		equ	5		;about 5ms timebase of Timer #1
MAX_UT		equ	8
;--- Scan key equate -------;
MAXKEY		equ	16
REPEATTM	equ	10		;500ms
SCANFREQ	equ	20/5		;10ms
DEBOU_TM	equ	16
ALARM_ALERT_KEY	equ	0a4h
COMM_ERROR	equ	0a5h
WARN_BEEP	equ	0a8h
UT_CLK_		equ	50/5	;49.152 ms per count

PHONEBOOK_APPL	EQU	1
CALENDAR_APPL	EQU	2
CALCULATOR_APPL	EQU	3
CART_APPL	EQU	4
DLO_APPL	EQU	5
SOLITAIRE_APPL	EQU	6
HISCR_APPL	EQU	7

ENDKEY		EQU	0FFH
KEY_ONOFF	EQU	88H
KEY_MUTE	EQU	89H
KEY_MENU	EQU	87H
KEY_PAUSE	EQU	8AH
SPEECH_END	EQU	0A0H

MainDataBank	equ	5
DSPBANK0	EQU	0ch
DSPBANK1	EQU	0dh
MainProgBank	equ	5
KernelBank	equ	2
MainProgBank2	equ	3

START_HISCR	equ	0fc60h
END_HISCR	equ	0fEE0h
LEN_HISCR	equ	32		;32 bytes per hi score record
NEW_LEN_HISCR	equ	64		;32 bytes per hi score record
DATA_OFFSET	equ	3		;4th position from the record head
SEP_CHAR	equ	01h

SYS_TX_QSIZE	equ	8
SYS_RX_QSIZE	equ	8
UT_STOP		equ	00h
UT_RUN		equ	01h
UT_PAUSE	equ	02h

IF DEMO_ROM
START_STACK	equ	3ffh
ELSE
START_STACK	equ	3c0h
ENDIF

;===============================;
;	RP pre-defined value
;===============================;
KERNEL_RP	equ	00h
DISPLAY_RP	equ	08h
CLOCKISR_RP	equ	18h
UARTISR_RP	equ	28h
SP_TIMER1ISR_RP	equ	38h
N_TIMER1ISR_RP	equ	48h
SYSTEM_RP	equ	58h

