set ooo=ou6
:loop
rem clr 50
cls
call beep
cd \frogger\source
call e ..\makefile.%ooo% ..\frogger.mak 
cd \frogger
del makefile.%ooo%

rem p:
rem del p:\bass\making.net
rem cd \tools\tmd2tmd
rem echo =============cd \tools\tmd2tmd================ >>p:\bass\makefile.out
rem nmake /f "tmd2tmd.mak" /x "makefile.err" CFG="tmd2tmd - Win32 Debug" >>p:\bass\makefile.%ooo%
rem type makefile.err >>p:\bass\makefile.out
rem p:
rem cd p:\bass
rem if not exist making.net goto loop

stamp
call %temp%\temp

call makeonly %ooo%
set day=
set second=
set minute=
set hour=
set month=
set year=
cd \frogger

rem if exist candebug goto debugit

type    source\std.err >>makefile.%ooo%
type  source\asm85.err >>makefile.%ooo%
type link85.err >>makefile.%ooo%
goto loop

rem :debugit
rem set retrn=make
rem xdebug


