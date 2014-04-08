GEST v1.1.1 Readme file
-----------------------------------------------
GEST is a Gameboy/Gameboy Color/SGB emulator for Windows.

GEST is written in C/C++ and it's my first and only emulator.

-----------------------------------------------
License
-----------------------------------------------

GEST - Gameboy emulator
Copyright (C) 2010 TM

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.

-------
Any trademarks belong to their rightful owners.

-----------------------------------------------
Requirements
-----------------------------------------------
Any modern computer.

Windows 9x or better, not tested with Windows 7
DirectX 7 or better

-----------------------------------------------
Using it
-----------------------------------------------
1. File->Load Rom...
2. Select a rom file 
3. Play the game 

File:
->GB2->Load GB1 Batt. Save and Reset
  Loads the GB1 battery save "[rom name].sav".
  The GB2 save data ".sv2", if one exists, will be lost.

System:
->Soft reset
  This is the same as if you pressed A+B+START+SELECT.
  On most games this will reset the game (or shows a save screen - Zelda),  however some games do nothing. 
  Included because on some keyboards it can be hard to press all the buttons at once.
->Hard Reset
  Equal to turning the power off and on on a real GB.
->State
  Load state or Save state or choose save slot.
->System Type
  Automatic = Chooses GBC mode if rom has GBC features, otherwise SGB or normal GB.
  GB original = Force GB mode even if rom has GBC or SGB features.
  GB Pocket = Identical to GB original except for CPU register A value at start. (I don't know of any games that have GBP only features)
  GB Color = With GB games a palette can be selected with number keys.
  GBA = Same as GBC. Unlocks GBA only features in some games (e.g. new Zelda games)
  Super GB = Uses SGB mode even if rom has GBC features.

  NOTE: Automatically resets when changed to different system!  
  
  GBC with SGB border = 
  Works only if game has both SGB and GBC features (or system type is set to GBC).
  Emulates both SGB and GBC at the same time. Doesn't work with all games.
  (Use GBC with initial SGB border option in that case)

  GBC with initial SGB border = 
  Emulation is started in SGB mode. When the border is uploaded it resets to GBC mode.                                  
  To show border in games that have "SGB feature: no" in ROM info, but can show a border
  (Pokemon Diamond, Pokemon Crystal, Wetrix GB) set system type to SGB and this option on.
  
  Will take effect when reset (or a rom is loaded).

->External device
  Barcode Boy
  Used only by the game Battle Space.
  The emulation of the barcode boy is not perfect. 
  It will try to generate a random barcode.

->Halt on undefined opcode
  When the emulator encounters an undefined opcode it will show an error message
  and stop emulation. (Real GB stops operation)
  Otherwise it will continue emulation. 

->Game Genie
  You can enter up to 10 Game Genie codes.
  
->Video:
  ->GB Color
    You can select colors to be used in GB mode.
  ->Enable
    Enable or disable drawing of video layers.
  ->Mix Frames
    Mix current frame with previous one. Quickly blinking objects will look transparent 
    (more like on the real GB; very useful in the game 'Angel Marlowe').
  ->Sprite Limit
    Limit sprites to 10 on scanline (as does the real GB).
    Turning this option off can cause graphics thrash in some games.(Action Man, Ken Griffey Jr's Slugfest)
  ->LCD off empty screen
    When this option is on the emulator will draw an empty (white) screen
    when the program turns the LCD off. When the option is off the screen 
    gets drawn anyway (what it was before LCD was turned off).
    Turning this option off prevents blinking in Megaman Xtreme 1 and 2.
  ->Visual rumble
    The screen will shake a little when the game uses the rumble feature (e.g. Pokemon Pinball)
  
->Sound:
  ->Enable
    Enable or disable sound channels.

->Controls:
  Change controls. Controllers 3-4 are for SGB multiplayer only.
  Controller 2 is for the 2nd GB and SGB multiplayer.
  
->Sensor:
  Change keys that control the motion sensor (MBC7/Kirby Tilt'n'Tumble,Command Master).
  
-----------------------------------------------
Default Controls
-----------------------------------------------
Gameboy Controls:
Up     	- Up
Down  	- Down
Left    	- Left
Right  	- Right
Z      	- A
X      	- B
A			- Turbo A
S			- Turbo B
Q      	- L, GBA stretch in GBA mode
W      	- R, GBA unstretch in GBA mode
Enter  	- Start
Backspace - Select

Numpad keys control the motion sensor (MBC7/Kirby Tilt'n'Tumble)

Emulator Controls:
Esc - Exit
Ctrl + P - Pause
Ctrl + R - Hard Reset
Ctrl + F - Soft Reset
Spacebar - Speedup, removes the frame limit
F2 - save state
F3 - increase state slot
F4 - load state

F5 - enable/disable BG
F6 - enable/disable WIN
F7 - enable/disable sprites

Number keys 1-0 and the keys (left to 1) and (right to 0) change the Gameboy Color palette when playing non GBC games in GBC mode.
1 - Left + B  				 (gray)
2 - Right + A				 (green,red) default
3 - Up       					 (brown)
4 - Up + A   				 (red,blue,green)
5 - Up + B    				 (light brown)
6 - Left      				 (blue,green,red)
7 - Left + A  				 (light green, red)
8 - Down    				 (blue,red)
9 - Down + A 				 (yellow,red)
0 - Down + B               (brown,green,blue)
[key left of 1] - Right     (green,red)
[key right of 0] - Right + B (reversed)

-----------------------------------------------
What's NOT emulated
-----------------------------------------------
-four player adapter
-SGB2 link port (used by any games?) 
-some SGB features
-GBC built-in palettes for some GB games e.g. Tennis, Zelda
-external devices:
 *Gameboy printer 
 *Furu Changer (Zok Zok Heroes (J))
 *Barcode Reader (Bardigun (J))
 *Mobile Adapter GB 
   required in: Mobile Trainer (J))
   used in: Gameboy Wars 3 and others

-----------------------------------------------
About the config file
-----------------------------------------------
The config file saves the ROM, save ram, save state paths and other options.
It's located in the emulator directory, called "gest.cfg"

-the ROM directory is automatically saved when you load a rom in the emulator
-delete the config file and the emulator will create a new one using defaults

-----------------------------------------------
About save states
-----------------------------------------------
-save states are located in save state directory ([emu path]/state by default)
-file names are [rom file name].st0 -> .st9 depending on the slot (GB2 save statse are .s20 -> s29)
-the files are NOT compatible with any other emulators save states

-----------------------------------------------
Contact
-----------------------------------------------

Homepage - http://koti.mbnet.fi/gest_emu/
E-mail - gest_emu@mbnet.fi

-----------------------------------------------
Credits & Thanks
-----------------------------------------------
-Pan, GABY, Marat Fayzullin, Pascal Felber, Paul Robson, Martin Korth, kOOPa, Bowser
 for the Game Boy tech docs.
-GeeBee for GB DEV FAQs
-zilmar for EMUBook
-Marat Fayzullin for Emulator writing HOWTO
-Forgotten for the awesome emulator VBA and releasing its source
-Laguna/gnuboy team for gnuboy source
-Dox for releasing Hash source
-Hii for releasing TGB Dual source
