CoordMode, ToolTip, Screen

ErrorConstants := Object(0,"JOYERR_NOERROR",2,"MMSYSERR_BADDEVICEID",6,"MMSYSERR_NODRIVER",11,"MMSYSERR_INVALPARAM",165,"JOYERR_PARMS",167,"JOYERR_UNPLUGGED")

Loop,
{
	Loop,16
	{
		VarSetCapacity(joy_State, 512)
		joy_Error := DllCall("winmm\joyGetPosEx", "ptr", (A_Index - 1), "ptr", &joy_State)
		joy_Err := ErrorConstants[joy_Error]
		string .= A_Index . ": " . joy_Err . "`n"
		Sleep, 5
	}
	tooltip, %string%,0,0
	string := ""
	Sleep, 1000
}

~End::
ExitApp