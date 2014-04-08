;************************************************
;*  CSIDE-SM85  User customize program  V01.01	*
;*                                              *
;*	Copyright (C) 1996 COMPUTEX CO.,LTD.	    *
;************************************************

	type    8504	;Write a target CPU name.

;[ Note ]
;   * This program is inculded in the monitor program
;     which is downloaded to the target system.
;
;   * "CALL" and "JMP" instruction should not be used.
;     It should use the relative jump without fail when it is branched.

;   * Don't change 5lines below.
;
	br	bankrd
	br	bankwt
	br	exec
	br	break
	br	init
;
;   * Don't change or delete 2lines below.
;
bankrd:
	ret
;
;   * Don't change or delete 2 lines below.

bankwt:
	ret


;************************************************************************
;*  Write in this routine if desired to perform any process just	    *
;*  berfore the execution of the user's program.			            *
;************************************************************************
exec:
	ret



;************************************************************************
;*  Write in this routine if desired to perform any process just	    *
;*  after user's program breaks.					                    *
;************************************************************************
break:
	ret



;************************************************************************
;*  Write in this routine if desired to perform any process when	    *
;*  iD-1600A starts up.							                        *
;*  [ Note ]					                            			*
;*     "RET", "JMP xxxx" and so forth are no necessary at end of  		*
;*     the routine.						                             	*
;************************************************************************
init:



	end
