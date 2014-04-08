;****************************************************************************************
;**  Game Definiton tables
;****************************************************************************************
;**
;** Questions/Comments: 
;	Does Level Renumbering reset between classic/updated game levels?
;ASB: Yes.  The first is level 1 through five (or whatever),
;ASB: the second is 1 through 5 (or whatever).
;ASB:
;ASB: Also, the label after the defw opcode must exist, even if it is
;ASB: temporarily refering to another level (as I did with the level tables
;ASB: below.


ClassicGame: global	ClassicGame
	defw	ClassLev1A	;Level Name - up to 16 characters
	defb	1,0		;speed multiplier
	defb	12,9		;Frog Start Position - X position across,Band # Down from top

	defw	ClassLev1B	;Level Name - up to 16 characters
	defb	1,0		;speed multiplier
	defb	12,9		;Frog Start Position - X position across,Band # Down from top

	defw	ClassLev1C	;Level Name - up to 16 characters
	defb	1,0		;speed multiplier
	defb	12,9		;Frog Start Position - X position across,Band # Down from top

	defw	ClassLev1D	;Level Name - up to 16 characters
	defb	1,0		;speed multiplier
	defb	12,9		;Frog Start Position - X position across,Band # Down from top

	defw	ClassLev1E	;Level Name - up to 16 characters
	defb	1,0		;speed multiplier
	defb	12,9		;Frog Start Position - X position across,Band # Down from top

	defw	ClassLev1F	;Level Name - up to 16 characters
	defb	1,0		;speed multiplier
	defb	12,9		;Frog Start Position - X position across,Band # Down from top

	defw	ClassLev1G	;Level Name - up to 16 characters
	defb	1,0		;speed multiplier
	defb	12,9		;Frog Start Position - X position across,Band # Down from top

	;Classic Level 1
	defw	ClassLev1	;Level Name - up to 16 characters
	defb	1,0		;speed multiplier
	defb	12,9		;Frog Start Position - X position across,Band # Down from top



UpdatedGame: global UpdatedGame

	defw	Updated1	;Level Name - up to 16 characters
	defb	1,0		;speed multiplier
	defb	12,9		;Frog Start Position - X position across,Band # Down from top

	;Updated Level 2
	defw	Updated2	;Level Name - up to 16 characters
	defb	1,0		;speed multiplier
	defb	12,9		;Frog Start Position - X position across,Band # Down from top

	;Updated Level 3
	defw	Updated3	;Level Name - up to 16 characters
	defb	1,0		;speed multiplier
	defb	12,9		;Frog Start Position - X position across,Band # Down from top

	;Updated Level 4
	defw	Updated4	;Level Name - up to 16 characters
	defb	1,0		;speed multiplier
	defb	12,9		;Frog Start Position - X position across,Band # Down from top

	;Updated Level 5                                                                     
	defw	Updated5	;Level Name - up to 16 characters                            
	defb	1,0		;speed multiplier                                            
	defb	12,9		;Frog Start Position - X position across,Band # Down from top

;****************************************************************************************
;**  Classic Level 1
;****************************************************************************************
;**	Band Type: 	0 - normal	1 - band moves - art stands still	
;**	Base Speed:	-X move right	0 stationary	+X moves left
;** 	Speed Increase	X/10 Ratio  - 11/10 = 10% increase
;**	Speed Decrease	10/X Ratio  - 10/9  = 10% decrease
;**	Strips Used	Taken from strip table above
;** Questions / Comments:
;
;ASB: each band has four strip numbers, although the last 3 can
;ASB: all be '255' (meaning unused)
;ASB:
;ASB: I also recommend using three digit decimal numbers.




Updated1:	;Street with sidewalk divider
	defb	0,0		;Band Type / Unused
	defw	0		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	001,255,255,255	;strips used

	defb	0,0		;Band Type / Unused
	defw	50		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	32,255,255,255	;strips used

	defb	2,0		;Band Type / Unused
	defw	60		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	045,255,255,255	;strips used

	defb	0,0		;Band Type / Unused
	defw	32		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	046,255,255,255	;strips used

	defb	0,0		;Band Type / Unused
	defw	0		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	004,255,255,255	;strips used

	defb	0,0		;Band Type / Unused
	defw	-60		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	044,255,255,255	;strips used

	defb	0,0		;Band Type / Unused
	defw	-80		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	041,255,255,255	;strips used

	defb	0,0		;Band Type / Unused
	defw	-30		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	040,255,255,255		;strips used

	defb	0,0		;Band Type / Unused
	defw	0		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	004,255,255,255	;strips used


Updated2:  ;All cars no divider
	defb	0,0		;Band Type / Unused
	defw	0		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	001,255,255,255	;strips used

	defb	0,0		;Band Type / Unused
	defw	-50		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	32,255,255,255	;strips used

	defb	2,0		;Band Type / Unused
	defw	100		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	045,255,255,255	;strips used

	defb	0,0		;Band Type / Unused
	defw	-32		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	046,255,255,255	;strips used

	defb	0,0		;Band Type / Unused
	defw	20		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	035,255,255,255	;strips used

	defb	0,0		;Band Type / Unused
	defw	-60		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	044,255,255,255	;strips used

	defb	0,0		;Band Type / Unused
	defw	80		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	041,255,255,255	;strips used

	defb	0,0		;Band Type / Unused
	defw	-30		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	040,255,255,255		;strips used

	defb	0,0		;Band Type / Unused
	defw	0		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	004,255,255,255	;strips used


Updated3:	;Street with sidewalk divider
	defb	0,0		;Band Type / Unused
	defw	0		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	001,255,255,255	;strips used

	defb	0,0		;Band Type / Unused
	defw	60		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	036,035,255,255	;strips used

	defb	0,0		;Band Type / Unused
	defw	20		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	043,042,255,255	;strips used

	defb	0,0		;Band Type / Unused
	defw	-110		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	045,255,255,255	;strips used

	defb	0,0		;Band Type / Unused
	defw	00		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	005,255,255,255	;strips used

	defb	0,0		;Band Type / Unused
	defw	-20		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	042,255,255,255	;strips used

	defb	0,0		;Band Type / Unused
	defw	100		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	041,045,255,255	;strips used

	defb	0,0		;Band Type / Unused
	defw	-60		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	047,255,255,255		;strips used

	defb	0,0		;Band Type / Unused
	defw	0		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	004,255,255,255	;strips used


Updated4:	;Street with sidewalk divider
	defb	0,0		;Band Type / Unused
	defw	0		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	000,255,255,255	;strips used

	defb	2,0		;Band Type / Unused
	defw	60		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	81h,255,255,255	;strips used

	defb	2,0		;Band Type / Unused
	defw	20		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	96,255,255,255	;strips used

	defb	0,0		;Band Type / Unused
	defw	-110		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	111,255,255,255	;strips used

	defb	0,0		;Band Type / Unused
	defw	00		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	009,255,255,255	;strips used

	defb	0,0		;Band Type / Unused
	defw	50		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	81h,255,255,255	;strips used

	defb	0,0		;Band Type / Unused
	defw	100		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	093,255,255,255	;strips used

	defb	2,0		;Band Type / Unused
	defw	-10		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	84h,255,255,255		;strips used

	defb	0,0		;Band Type / Unused
	defw	0		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	007,255,255,255	;strips used



Updated5:	;Street with sidewalk divider
	defb	0,0		;Band Type / Unused
	defw	0		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	000,255,255,255	;strips used

	defb	2,0		;Band Type / Unused
	defw	60		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	81h,255,255,255	;strips used

	defb	2,0		;Band Type / Unused
	defw	20		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	96,255,255,255	;strips used

	defb	0,0		;Band Type / Unused
	defw	-110		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	111,255,255,255	;strips used

	defb	0,0		;Band Type / Unused
	defw	00		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	009,255,255,255	;strips used

	defb	0,0		;Band Type / Unused
	defw	50		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	81h,255,255,255	;strips used

	defb	0,0		;Band Type / Unused
	defw	100		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	093,255,255,255	;strips used

	defb	2,0		;Band Type / Unused
	defw	-10		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	84h,255,255,255		;strips used

	defb	0,0		;Band Type / Unused
	defw	0		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	007,255,255,255	;strips used







ClassLev1A: ; classic level 1
	defb	0,0		;Band Type / Unused
	defw	0		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	000,255,255,255	;strips used

	defb	2,0		;Band Type / Unused
	defw	50		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	81h,255,255,255	;strips used

	defb	0,0		;Band Type / Unused
	defw	60		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	96,255,255,255	;strips used 96

	defb	2,0		;Band Type / Unused
	defw	32		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	80h,255,255,255	;strips used

	defb	0,0		;Band Type / Unused
	defw	0		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	06,255,255,255	;strips used

	defb	0,0		;Band Type / Unused
	defw	60		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	048,255,255,255	;strips used

	defb	0,0		;Band Type / Unused
	defw	-40		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	050,053,255,255	;strips used

	defb	0,0		;Band Type / Unused
	defw	20		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	059,255,255,255		;strips used

	defb	0,0		;Band Type / Unused
	defw	0		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	007,255,255,255	;strips used


ClassLev1B:  ;classic level 02
	defb	0,0		;Band Type / Unused
	defw	0		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	000,255,255,255	;strips used

	defb	2,0		;Band Type / Unused
	defw	50		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	81h,255,255,255	;strips used

	defb	2,0		;Band Type / Unused
	defw	-40		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	089h,255,255,255	;strips used

	defb	2,0		;Band Type / Unused
	defw	32		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	80h,255,255,255	;strips used

	defb	0,0		;Band Type / Unused
	defw	0		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	06,255,255,255	;strips used

	defb	0,0		;Band Type / Unused
	defw	60		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	049,255,255,255	;strips used

	defb	0,0		;Band Type / Unused
	defw	-40		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	053,051,255,255	;strips used

	defb	0,0		;Band Type / Unused
	defw	20		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	059,255,255,255		;strips used

	defb	0,0		;Band Type / Unused
	defw	0		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	007,255,255,255	;strips used

ClassLev1C:	;CLASSIC LEVEL 03
	defb	0,0		;Band Type / Unused
	defw	0		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	000,255,255,255	;strips used

	defb	2,0		;Band Type / Unused
	defw	70		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	81h,255,255,255	;strips used

	defb	2,0		;Band Type / Unused
	defw	-40		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	81,255,255,255	;strips used

	defb	2,0		;Band Type / Unused
	defw	42		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	82h,255,255,255	;strips used

	defb	2,0		;Band Type / Unused
	defw	0		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	06,255,255,255	;strips used

	defb	0,0		;Band Type / Unused
	defw	50		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	049,048,255,255	;strips used

	defb	0,0		;Band Type / Unused
	defw	-30		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	052,255,255,255	;strips used

	defb	0,0		;Band Type / Unused
	defw	128		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	055,255,255,255		;strips used

	defb	0,0		;Band Type / Unused
	defw	0		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	007,255,255,255	;strips used



ClassLev1D:   ;Classic Level 04
	defb	0,0		;Band Type / Unused
	defw	0		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	000,255,255,255	;strips used

	defb	2,0		;Band Type / Unused
	defw	70		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	83h,255,255,255	;strips used

	defb	2,0		;Band Type / Unused
	defw	-60		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	085h,255,255,255	;strips used

	defb	2,0		;Band Type / Unused
	defw	60		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	80h,255,255,255	;strips used

	defb	0,0		;Band Type / Unused
	defw	0		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	06,255,255,255	;strips used

	defb	0,0		;Band Type / Unused
	defw	50		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	054,255,255,255	;strips used

	defb	0,0		;Band Type / Unused
	defw	-30		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	052,255,255,255	;strips used

	defb	0,0		;Band Type / Unused
	defw	128		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	055,255,255,255		;strips used

	defb	0,0		;Band Type / Unused
	defw	0		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	007,255,255,255	;strips used


ClassLev1E:	;classic level 05
	defb	0,0		;Band Type / Unused
	defw	0		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	000,255,255,255	;strips used

	defb	2,0		;Band Type / Unused
	defw	70		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	83h,255,255,255	;strips used

	defb	2,0		;Band Type / Unused
	defw	-60		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	085h,255,255,255	;strips used

	defb	2,0		;Band Type / Unused
	defw	60		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	80h,255,255,255	;strips used

	defb	0,0		;Band Type / Unused
	defw	0		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	06,255,255,255	;strips used

	defb	0,0		;Band Type / Unused
	defw	60		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	049,255,255,255	;strips used

	defb	0,0		;Band Type / Unused
	defw	-20		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	054,255,255,255	;strips used

	defb	0,0		;Band Type / Unused
	defw	128		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	057,255,255,255		;strips used

	defb	0,0		;Band Type / Unused
	defw	0		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	007,255,255,255	;strips used


ClassLev1F:
	defb	0,0		;Band Type / Unused
	defw	0		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	000,255,255,255	;strips used

	defb	2,0		;Band Type / Unused
	defw	70		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	83h,255,255,255	;strips used

	defb	2,0		;Band Type / Unused
	defw	-60		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	085h,255,255,255	;strips used

	defb	0,0		;Band Type / Unused
	defw	60		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	80h,255,255,255	;strips used

	defb	0,0		;Band Type / Unused
	defw	0		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	06,255,255,255	;strips used

	defb	0,0		;Band Type / Unused
	defw	50		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	054,255,255,255	;strips used

	defb	0,0		;Band Type / Unused
	defw	-30		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	052,255,255,255	;strips used

	defb	0,0		;Band Type / Unused
	defw	128		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	055,255,255,255		;strips used

	defb	0,0		;Band Type / Unused
	defw	0		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	007,255,255,255	;strips used

ClassLev1G:
	defb	0,0		;Band Type / Unused
	defw	0		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	000,255,255,255	;strips used

	defb	2,0		;Band Type / Unused
	defw	50		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	81h,255,255,255	;strips used

	defb	2,0		;Band Type / Unused
	defw	-60		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	12,255,255,255	;strips used

	defb	2,0		;Band Type / Unused
	defw	32		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	80h,255,255,255	;strips used

	defb	0,0		;Band Type / Unused
	defw	0		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	06,255,255,255	;strips used

	defb	0,0		;Band Type / Unused
	defw	60		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	048,255,255,255	;strips used

	defb	0,0		;Band Type / Unused
	defw	-40		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	050,255,255,255	;strips used

	defb	0,0		;Band Type / Unused
	defw	100		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	059,255,255,255		;strips used

	defb	0,0		;Band Type / Unused
	defw	0		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	007,255,255,255	;strips used

ClassLev1:	;you can modify this one to make the next classic level!
	defb	0,0		;Band Type / Unused
	defw	0		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	001,255,255,255	;strips used

	defb	2,0		;Band Type / Unused
	defw	-50		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	32,255,255,255	;strips used

	defb	2,0		;Band Type / Unused
	defw	100		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	045,255,255,255	;strips used

	defb	2,0		;Band Type / Unused
	defw	-32		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	046,255,255,255	;strips used

	defb	0,0		;Band Type / Unused
	defw	20		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	035,255,255,255	;strips used

	defb	0,0		;Band Type / Unused
	defw	-60		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	044,255,255,255	;strips used

	defb	0,0		;Band Type / Unused
	defw	80		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	041,255,255,255	;strips used

	defb	0,0		;Band Type / Unused
	defw	-30		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	040,255,255,255		;strips used

	defb	0,0		;Band Type / Unused
	defw	0		;base speed
	defb	0,0		;speed increase - X/10 Ratio - player doing well
	defb	0,0		;speed decrease - X/10 Ratio - player doing poorly
	defb	004,255,255,255	;strips used



StripAnims:	global	StripAnims
	defw	turtle01
	defw	turtle02
	defw	turtle03
	defw	turtle04
	defw	gator01	
	defw	gator02
	defw	gator03
	defw	gator04
	defw	gator05
	defw	gator06

turtle01:
	defb	6	;number of frames
	defb	50	;clock rate
	defb	64,65,66,67,68,69
	

turtle02:
	defb	6
	defb	50
	defb	70,71,72,73,74,75

turtle03:
	defb	6	;number of frames
	defb	50	;clock rate
	defb	80,81,82,83,84,85


turtle04:
	defb	6	;number of frames
	defb	50	;clock rate
	defb	86,87,88,89,90,91


gator01:
	defb	2	;number of frames
	defb	100	;clock rate
	defb	76,77


gator02:
	defb	2	;number of frames
	defb	100	;clock rate
	defb	78,79

gator03:
	defb	2	;number of frames
	defb	100	;clock rate
	defb	98,99

gator04:
	defb	4	;number of frames
	defb	25	;clock rate
	defb	100,101,102,101


gator05:
	defb	3	;number of frames
	defb	100	;clock rate
	defb	103,104,105


gator06:
	defb	2	;number of frames
	defb	100	;clock rate
	defb	106,107

end




















































