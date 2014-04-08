;============================================================================
;
;           Demo Data
;
;	83h = UP
;	84h = Down
;	85h = Left
;	86h = right
;
;	  0      = end of demo
;	1 to 127 = ignore that many input requests
;
;----------------------------------------------------------------------------

DemoInput:	global	DemoInput
	defb	100
	defb	83h
	defb	100
	defb	85h
	defb	100
	defb	83h
	defb	100
	defb	0

	end
