Frogger
12-23-98 (sound)
Al Baker

    Mail:

		At least the sound menu works:

		Frogger.inc has variable: NumSounds
		mel.asm is where sounds are placed
		Two labels in frogger.asm: melody_high
			and melody_low are where pointers
			to sounds are placed.  There needs
			to be as many entries in these tables
			as the number for NumSounds.

		Unfortunately, sounds only work in the menu
		(the menu and the sounds share the same bank now.)

		Sounds do not work right in the game-- the game and
		the sounds do not share the same bank.  The code
		switches to the sound bank-- but it doesn't seem
		to help.

		Which means I need more help!

    Done:

			Sounds working in menu only
			animations
			Frog safe animation
			Demo mode in and working.
			Support for five frogs per level
			Control panel installed.
			Installed initial sound driver.

		Milestone 3: 11/16/98

			Game 50% done.

        Milestone 2: 11/05/98

            Complete Front End in Place
            Options Functional

        Milestone 1: 10/22/98

            Menu Structure in Place
            Development Environment in Running

        Milestone 0: 10/15/98 (from memory)

    Waiting For:

        Final Sound system and data

    In Process:

        Milestone 4:

			intermediate screens
            Install sound

    Yet To Do:

        Milestone 8:

            Get Game playing bug free.

        Milestone 9:

            Code Release.

    Making the Product:

        tombox.bat is the name of the bat file to use in the
        "Batch File" field in the MSDOS properties dialog box.

        makeonly.bat is the bat file which makes everything.
