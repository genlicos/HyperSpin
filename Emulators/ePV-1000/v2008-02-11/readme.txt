Binary archive of retro pc emulator common source code
								1/5/2008

--- What's this ?

This archive includes the binaries of the emulators listed below:

	Emu5		SORD m5 emulator
	EmuGaki		CASIO PV-2000 emulator
	EmuLTI8		MITSUBISHI Elec. MULTI8 emulator
	EmuPIA		TOSHIBA PASOPIA emulator
	EmuPIA7		TOSHIBA PASOPIA7 emulator
	EmuZ-2500	SHARP MZ-2500 emulator
	EmuZ-2800	SHARP MZ-2800 emulator
	ePV-1000	CASIO PV-1000 emulator
	ePyuTa		TOMY PyuTa and PyuTa Jr. emulator
	eRX-78		BANDAI RX-78 emulator
	eSCV		EPOCH Super Cassette Vision emulator
	eX-07		CANON X-07 emulator

These binaries are for Windows 9x/NT4.0/2000/XP and CE.NET 4.x.
For Windows CE.NET binary with GAPI, GAPI for HPC is required:
http://www.wincesoft.de/html/gapi_for_hpc_s.html

They are tested on Windows XP Professional with SP2,
DoCoMo sigmarion3 and PSION NetBookPro.


--- How to use

Common menus:

	Control
		Reset		Reset the virtual machine
		-
		CPU x1		Set CPU clock multipler
		CPU x2
		CPU x4
		CPU x8
		CPU x16
		-
		Paste		Auto key hitting from the clip board text
		Stop		Stop the auto key hitting
		-
		Exit		Terminate the emulator

	Cart
		Open		Insert the cart image
		Close		Remove the cart image
		-
		History		Insert the cart image

	FDD*
		Open		Insert the floppy disk image
		Close		Remove the floppy disk image
		-
		History		Insert the floppy disk image

	Tape
		Play		Insert the cassette tape image to play
		Rec		Insert the cassette tape image to record
		Stop		Remove the cassette tape image
		-
		History		Insert the cassette tape image to play

	Screen
		Rec 30fps	Record the movie to avi and wav files
		Rec 15fps
		Rec 10fps
		Stop		Stop recording the movie
		-
		Window x1	Set the window size
		Window x2
		Fullscreen 640x480	Set the fullscreen size
		Fullscreen 320x240

	Sound
		Rec		Record the sound to wav file
		Stop		Stop recording the sound
		-
		2000Hz		Set the sound frequency
		4000Hz		You need to restart the emulator
		8000Hz
		11025Hz
		22050Hz
		44100Hz
		48000Hz
		-
		100msec		Set the sound buffer size (latency)
		200msec		You need to restart the emulator
		300msec
		400msec

	Video
		Filter		Show the properties of video capture device
		Pin
		Source
		Disconnect	Disconnect the video capture device
		-
		Device		Connect to the video capture device

For Windows PC environment:

	It is recommended to change the screen mode to 16bpp.

	Support Windows PC compatible joystick devices.

	Shortcut key:
		ALT+RETURN  - Switch window / fullscreen
		CTRL+RETURN - Swtich enable / disenable the mouse control

	*) While the mouse control is enabled, the mouse cursor is hidden.

Floppy disk images:

	Supoort D88 or TeleDisk format disk images.
	If the image file is read-only on windows file system,
	its disk is recognaized that is write-protected on emulator.
	(note: the protect flag in D88 header is ignored.)

Cassette tape images:

	Support wav files. (48KHz/8bit/mono)

Video capture devices:

	Support the direct show compatible video capture devices
	to emulate the super impose function.


--- Thanks

- vm/device.h
	XM6
- vm/fmgen/*
	M88/fmgen
- vm/i8259.*
	Neko Project 2 and MESS 8259 core
- vm/mb8877.*
	XM7
- vm/sn76489an.*
	MAME SN76496 core
- vm/tms9918a.*
	MAME TMS9928 core
- vm/tms9995.*
	MAME TMS99xx core
- vm/upd71071.*
	88VA Eternal Grafx
- vm/upd7220.*
	Neko Project 2
- vm/upd765a.*
	M88 fdc/fdu core
- vm/upd7801.*
	MAME uPD7810 core
- vm/x86.*
	MAME x86 ore
- vm/w3100a.*
	Mr.Oh!Ishi for the chip specification info
- vm/z80.*
	MAME Z80 core
- vm/m5/*
	MESS sord driver
	Mr.Moriya for Sord M5 hardware design info
- vm/mz2500/sasi.*
	X millenium
- vm/pv1000/*
	Mr.Enri for CASIO PV-1000 hardware design info
- vm/pv2000/*
	Mr.Enri for CASIO PV-2000 hardware design info
- vm/pyuta/*
	MESS tutor driver
	Mr.Enri for TOMY PyuTa Jr. hardware design info
- vm/scv/*
	Mr.Enri and Mr.333 for Epoch Super Cassette Vision hardware info
- vm/x07/io.*
	x07_emul by Mr.J.Brigaud
- win32_sound.cpp
	XM7 for DirectSound implement
	M88 for wavOut API implement
- res/*.ico
	Mr.Temmaru and Mr.Marukun

- emulation core design
	nester and XM6

----------------------------------------
TAKEDA, toshiya
t-takeda@m1.interq.or.jp
http://www1.interq.or.jp/~t-takeda/top.html
