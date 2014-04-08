Game.Com Emulator/Debugger W.I.P. (29/12/98)
============================================

Current Requirements
====================
Win'95, Win'98, Win NT (maybe).
DSOUND.DLL, DDRAW.DLL (parts of DirectX).
MAIN.HEX MAIN0S.HEX and BITMAP2.BIN (in the same directory as the EXE).

Supports (tested) 8-bit, 16-bit (565) and 24-bit displays.
Should support (untested) 15-bit (1555) and 32-bit displays.

All windows can be stretched to display more output.
The most useful vertical scrollbars WORK!

Known bugs while running kernel:
* "Solitaire" logo goes down the screen twice.
* When trying to leave Calculator, only the "N" in "NO" flashes.


New (29/12/1998):
* Reset button.
* "Breakpoint crash" bug fixed.
* 32-bit screen code changed.
* Command line path bug fixed.
* Some messageboxes suppressed unless command line option -debug is used. 


Not New (24/12/1998):
* All new faster DMA code.
* Support for symbol files.
* Physical BPs wherever possible.


Not New (11/12/1998 again):
* Messed about with DMA code to get it going a bit faster.


Not New (11/12/1998):
* Physical column in logical view in memory window.
* Load Full & Test Kernel now do a proper hardware reset (for restarting).
* Flags & Stack shown for some instructions in the extra column of
  disassembly.
* More options recorded in the INI file.
* Extended BP & Watch syntax in CMC files (see "CMC Syntax" further down).
* Reg File read / write BPs.
* Timer 0 using fake clock to generate 24Khz at the appropriate time.
* All menu options can be accessed with keypresses.


Not New (08/12/1998):
* F12 PCX Key (see "Prefs").
* Movie Grabber (F12 to start, F11 to stop - see "Prefs").
* MBOX for Write to ROM.
* MBOX for Illegal Instruction.
* New Mem Window (again) which can view all sorts of memory.
* Step Over automatically removes the breakpoint that it sets.
* Added >64K functionality to HEX files.
* Changed timer frequency by a factor of two (less frequent).
* BRAM added to saved state files.


Not New (04/12/1998):
* 8 bit palette.
* 15 bit palette (hopefully).
* DMA X & Y "source wrapping" for Sonic Jam and JP2.
* Did suggested changes to Disasm Window.
* Load HEX offset window.
* BRAM support, use menu option, "bram on" or "bram off" in CMC file.
* "Perfect timer interrupts" (which might be off by a factor of 2!)
* Improved sound emulation (still not perfect).


Not New (30/11/1998):
* Emulator can recover from change of PCs screen mode.
* Load/Save State.
* New Memory Window.
* Scrollbar works on disasm window.
* "View PC" option.
* Faltering attempt at tone and noise channels.
* Fixed (some) window position bugs.
* "Use Labels" option.
* Dec/Hex option moved.
* Load "test" or "full" kernel.
* Remove BP option in disasm window.
* DMA x-flip and y-flip fixed.
* Messy bit removed from main window.
* Macro stack.
* Modify register option.
* Fixed V-flag in DECW.
* Fixed RRC bug.
* Implemented "best guess of" missing instruction - BCMP.
* Fixed disassembly output of BAND/BOR/BXOR/BCMP.
* Optimised screen code.
* Log file updated to have working options.
* Mem read/write BPs.
* 100% / 50% / 25% running speed.
* Sound on / off option.


Not New (17/11/1998):
* First appearance of (off-tune) DAC sound.
* Window sizes remembered (and self-created) in INI file.
* Breakpoints attached to a physical (rather than logical) address.
* Command line script files can be pre-run before GUI.
* Run Script menu option.
* Keys/touch screen done by PIO instead of patch.
* Kernel freezing after period of time fixed (patch to blame).
* Mess after pressing Pause in Solitaire fixed (patch to blame).


Not New (10/11/1998):
* A lot of CPU bugs fixed.
* DMA, LCD and Timer interrupts in place.
* DMA now very nicely done.
* Screen displays things nicely.
* Disasm To File option.
* Save PCX option.
* Easy to use Open Kernel option.
* Keyboard patch allows use of mouse for touch screen and keys for buttons.


Previously Implemented (28/10/1998):
* CPU.
* Interrupts emulated, but not triggered.
* Disassembly view.
* Register view.
* (Terrible) Memory view.
* Simple screen.
* Simple DMA.
* Execution breakpoints.
* Simple log file.


Keys
====
* Cursor keys - up, down, left and right.
* ABCD is emulated using ASZX (which is roughly the same shape as the
  position of the buttons on the Game.Com.
* F1 - Pause.
* F2 - Menu.
* F3 - Mute.
* F4 - On/Off.

* F11 - Stops movie grabbing (make sure that the main window is in focus!)
* F12 - PCX grab (initially off, but can be set to "Single" or "Movie" in
  the Prefs option).  Also make sure that the main window is in focus.

Use the mouse (left button click) to "touch" the screen.


Symbol Files
============
Symbol files are loaded by having the following in a CMC file:

rd file.sym


CMC Syntax
==========

Breakpoints:
------------
bp 1234 - BP on logical execute (as usual).
bp p:123456 - BP on physical execute (as usual).
bp 1234 read FF - BP on reading 0xFF from logical memory address 0x1234.
bp r:40 read any - BP on reading any value from reg file 0x40.
bp r:06 write 34 - BP on writing 0x34 to memory location 6 (registers 0 to F
  are dealt with by mapping onto their underlying memory location, which
  just happens to be in the range 0-F when the emulator first starts.  This
  may be different if you were to load a GCS saved state file before this bp
  was inserted.

"B:" and "V:" syntax are also accepted, but are ineffective.

Watches:
--------
watch 1234 - Watches logical address (0-FFFF).
watch p:123456 - Watches physical address (0-1FFFFF).
watch r:0F - Watches register file (0-7F).
watch v:1234 - Watches Video RAM address (0-3FFF).
watch b:12345 - Watches BRAM address (0-1FFFF).


Main Window
===========
FILE menu
----
* Open ROM (Not implemented).
* Save PCX -> 1x1, 2x2, 3x3, 4x4.

Simply pick a filename to save an 8-bit PCX in the size selected.

* Load State.
* Save State.

* Exit - exits the emu/debugger.

WINDOW menu
------
* Open All Windows (Not implemented).
* Open Disasm Window - Hopefully, these need no explanation.
* Open Register Window - ...
* Open Mem Window - ...
* Open Watch Window - ...
* Open Breakpoint Window - ...

SIZE menu
----
* 1X1 - Sets window size to 1x1.
* 2X2 - ...
* 3X3 - ...
* 4X4 - ...
(Size may also be changed by dragging the bottom right corner of the window).

The Main Window cannot run software yet (in the true emulator style), you
have to open the Disassembly Window, load the kernel and click RUN.

MISC menu
----
* 100% Speed - Emulated speed.
*  50% Speed - ...
*  25% Speed - ...

* Sound On.
* Sound Off.


Disasm Window
=============
FILE menu
----
* Open BIN file - Select a .BIN to load (then enter address).
* Open ROM file - Select a .ROM file, but don't do anything useful.
* Open HEX file - Select a .HEX file.
* Open Kernel >
        * Full Kernel - Loads MAIN.HEX, MAIN0S.HEX and BITMAP2.BIN.
        * Test Kernel - Loads MAIN.HEX, MAIN0.HEX and BITMAP2.BIN.
  (This also sets the PC to 0x1020 ready to run the kernel.)
* Open Script - Select a .CMC to execute.

* Create Log file - Opens the log / trace file (log.log) for writing.

This opens a dialog with a number of options... which have not been
implemented.  Just click OK or CANCEL, they do what you expect.

To get anything into the log file, you must click the RUN button.

NOTE : Things go rather slowly with the log file open and the log file gets
       very big - VERY quickly!

To view the log file, close it and then load log.log into a text viewing
package.

* Close Log file - Closes it.
* Disasm To File - Makes text file of an area of logical memory.
  (After picking filename, enter start and end addresses).
* End Debug - Not implemented.

EDIT menu
----
* Copy - Copies the current disassembly display into the clipboard, where you
  can paste it into Notepad (etc).

OPTIONS menu
-------
* Hex - Use hex in output and input.
* Decimal - Use decimal...
* Use RF labels - Use reg file labels in disassembly.
* No RF labels - Don't use...
* BRAM On - Support BRAM.
* BRAM Off - Switch off BRAM. 
* Preferences - Opens Prefs Window.
        F12 PCX Grab -> Off, Single Snatch, Movie.
        MBOX for Write to Rom.
        MBOX for Non existant Rom (not implemented).
        MBOX for Illegal Instruction.
* Use Symbols - Show symbols, if symbol file loaded.
* No Symbols - Don't show symbols.

View PC button
-------
If not set, this allows you to enter the address to look at in the edit box
below it.

RUN button
---
Runs the CPU (ie not step by step).

STOP button
----
Puts the CPU into 'step' mode.  (One instruction at a time).

STEP button
----
Executes one CPU instruction.

STEP OVER button
---------
The same as STEP, except for the following circumstances:
* BR, BBS, BBC or DBNZ with negative offset.
* CALL or CALS.

Under those circumstances it will set a breakpoint and run the CPU in order
to get over the "looping" instruction.

RESET button
-----
Cleans out the RAM and resets the CPU.


Options via Context Menu
------------------------
Click on an address with the right mouse button for:

* Set PC - Sets PC to this address.
* Breakpoint - Sets breakpoint (by execution) of this address.
* Remove BP - Removes the breakpoint at this address.


Register Window
===============
Context Menu
------------
* INC - Increments the currently selected register.
* DEC - Decrements ....
* Watch - Adds a register to the Watch Window.
* Add BP - Opens the conditional breakpoint window.

There is also an edit box which may be used to modify reg values, click on
the register first then modify it in the box.


Conditional BP Window
=====================
* Read - BP on read.
* Write - BP on write.
* Any Value - Read/Write any value.
* Number Value - Read/Write specific value.
* Memory - BP on memory read / write (logical).
* VRAM - BP on VRAM read / write (doesn't do anything).
* Register - BP on register file read / write.

* OK - Accepts and sets the BP.
* Cancel - Gives up.


Memory Window
=============
Type Menu
---------
* Logical - Logical memory display (64K).
* Physical - Physical memory display (2MB).
* VRAM - Video RAM display (16K).
* BRAM - BRAM display (128K).

Context Menu
------------
* INC - Increments memory contents.
* DEC - Decrements...
* Modify - Ignore, use the edit boxes instead.
* WATCH - Adds a memory location to the Watch Window.
* Add BP - Opens the conditional breakpoint window.
* BYTE - (Default).
* WORD - Not implemented.

There is a "Go To" edit box, where you can type the address that you wish to
view.  The modify box works in the same way as the modify box in the reg
window (click on memory location then edit the text in the box).


Watch Window
============
Context Menu
------------
Remove - Removes the selected item from the Watch Window.
Modify - Not implemented.


Breakpoint Window
=================
Context Menu
------------
Remove - Removes the selected breakpoint.
Modify - Not implemented.

