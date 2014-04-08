del link85.err
del source\std.err
del source\asm85.err
set ooo=out
if NOT x%1==x set ooo=%1
make.exe -Dproj=d:\frogger -fd:frogger /Dday=%day% /Dmonth=%month% /Dhour=%hour% >>makefile.%ooo%

