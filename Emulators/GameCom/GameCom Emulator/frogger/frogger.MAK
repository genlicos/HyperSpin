#
# Game.Com Frogger Centipede
#
# Special instructions:
#
#   None yet
#

sa = .\art
ss = .\source
st = .\tools
mk = $(proj)

#===========================================================================
#
#   Test game when data and code made
#
#===========================================================================

frogger.tst:        frogger.bin frogger.pro frogger.cmc

                    cside -AS -MIfrogger.cmc

#===========================================================================
#
#   Load data files if they change
#
#===========================================================================

frogger.bin:        $(sa)\frnt000.bin $(sa)\frnt001.bin $(sa)\frnt002.bin \
					$(sa)\sprite00.bin $(sa)\strip00.bin $(sa)\strip01.bin \
					$(sa)\strip02.bin $(sa)\strip03.bin $(sa)\strip04.bin \
					$(sa)\strip05.bin $(sa)\strip06.bin $(sa)\strip07.bin \
					$(sa)\strip08.bin $(sa)\strip09.bin init.cmc

                    echo hi >frogger.bin
                    cside -AS -r -MIINIT.cmc

#===========================================================================
#
#   Build code
#
#===========================================================================

frogger.pro:        $(ss)\game.obj $(ss)\levels.obj $(ss)\sprites.obj \
					$(ss)\frogger.obj $(ss)\fm_key.obj $(ss)\new_sp.obj \
                    $(ss)\option.obj $(ss)\open.obj $(ss)\syscall.obj \
                    $(ss)\misc.obj $(ss)\readword.obj $(ss)\teams.obj \
                    $(ss)\gamecom.obj $(ss)\mel.obj frogger.lnk	\
					$(ss)\demo.obj $(ss)\strips.obj

	                link8521 @frogger.lnk
	                hex8521 -P -a1 -F -B 020,021,022,023,024,025,026 frogger
                    rem echo hi >candebug

$(ss)\demo.obj:   	$(ss)\demo.asm
                
                    cd $(ss)
                    del std.err
                    stderrf std.err \asm85\asm8521.exe "-s16 -W -E -L demo.asm"
                    cd $(mk)

$(ss)\frogger.obj:  $(ss)\frogger.asm $(ss)\equate.inc $(ss)\ram.inc \
                    $(ss)\disp_ram.inc $(ss)\disp_equ.inc $(ss)\frogger.tmp
                
                    cd $(ss)
                    del std.err
                    stderrf std.err \asm85\asm8521.exe "-s16 -W -E -L frogger.asm"
                    cd $(mk)

$(ss)\fm_key.obj:   $(ss)\fm_key.asm $(ss)\equate.inc $(ss)\ram.inc \
                    $(ss)\disp_ram.inc $(ss)\disp_equ.inc $(ss)\frogger.tmp
                
                    cd $(ss)
                    del std.err
                    stderrf std.err \asm85\asm8521.exe "-s16 -W -E -L fm_key.asm"
                    cd $(mk)

$(ss)\game.obj:     $(ss)\game.asm $(ss)\equate.inc $(ss)\ram.inc \
                    $(ss)\disp_ram.inc $(ss)\disp_equ.inc $(ss)\frogger.tmp
                
                    cd $(ss)
                    del std.err
                    stderrf std.err \asm85\asm8521.exe "-s16 -W -E -L game.asm"
                    cd $(mk)

$(ss)\gamecom.obj:  $(ss)\gamecom.asm $(ss)\frogger.tmp $(ss)\disp_ram.inc
                
                    cd $(ss)
                    del std.err
                    stderrf std.err \asm85\asm8521.exe "-s16 -W -E -L gamecom.asm"
                    cd $(mk)

$(ss)\levels.obj:  $(ss)\levels.asm $(ss)\frogger.tmp
                
                    cd $(ss)
                    del std.err
                    stderrf std.err \asm85\asm8521.exe "-s16 -W -E -L levels.asm"
                    cd $(mk)

$(ss)\mel.obj:		$(ss)\mel.asm $(ss)\melody.inc
                
                    cd $(ss)
                    del std.err
                    stderrf std.err \asm85\asm8521.exe "-s16 -W -E -L mel.asm"
                    cd $(mk)

$(ss)\misc.obj:     $(ss)\misc.asm $(ss)\equate.inc $(ss)\ram.inc \
                    $(ss)\disp_ram.inc $(ss)\disp_equ.inc $(ss)\frogger.tmp
                
                    cd $(ss)
                    del std.err
                    stderrf std.err \asm85\asm8521.exe "-s16 -W -E -L misc.asm"
                    cd $(mk)

$(ss)\new_sp.obj:   $(ss)\new_sp.asm $(ss)\frogger.tmp
                
                    cd $(ss)
                    del std.err
                    stderrf std.err \asm85\asm8521.exe "-s16 -W -E -L new_sp.asm"
                    cd $(mk)

$(ss)\open.obj:     $(ss)\open.asm $(ss)\equate.inc $(ss)\ram.inc \
                    $(ss)\disp_ram.inc $(ss)\disp_equ.inc $(ss)\frogger.tmp
                
                    cd $(ss)
                    del std.err
                    stderrf std.err \asm85\asm8521.exe "-s16 -W -E -L open.asm"
                    cd $(mk)

$(ss)\option.obj:   $(ss)\option.asm $(ss)\equate.inc $(ss)\ram.inc \
                    $(ss)\disp_ram.inc $(ss)\disp_equ.inc $(ss)\frogger.tmp \
                    $(ss)\menutxt.asm $(ss)\option2.asm
                
                    cd $(ss)
                    del std.err
                    stderrf std.err \asm85\asm8521.exe "-s16 -W -E -L option.asm"
                    cd $(mk)

$(ss)\readword.obj: $(ss)\readword.asm $(ss)\equate.inc $(ss)\ram.inc \
                    $(ss)\disp_ram.inc $(ss)\disp_equ.inc $(ss)\frogger.tmp
                
                    cd $(ss)
                    del std.err
                    stderrf std.err \asm85\asm8521.exe "-s16 -W -E -L readword.asm"
                    cd $(mk)

$(ss)\sprites.obj:  $(ss)\sprites.asm $(ss)\frogger.tmp
                
                    cd $(ss)
                    del std.err
                    stderrf std.err \asm85\asm8521.exe "-s16 -W -E -L sprites.asm"
                    cd $(mk)

$(ss)\strips.obj:  $(ss)\strips.asm
                
                    cd $(ss)
                    del std.err
                    stderrf std.err \asm85\asm8521.exe "-s16 -W -E -L strips.asm"
                    cd $(mk)

$(ss)\syscall.obj:  $(ss)\syscall.asm $(ss)\frogger.tmp
                
                    cd $(ss)
                    del std.err
                    stderrf std.err \asm85\asm8521.exe "-s16 -W -E -L syscall.asm"
                    cd $(mk)

$(ss)\teams.obj:    $(ss)\teams.asm $(ss)\frogger.tmp
                
                    cd $(ss)
                    del std.err
                    stderrf std.err \asm85\asm8521.exe "-s16 -W -E -L teams.asm"
                    cd $(mk)

$(ss)\frogger.tmp:	$(ss)\frogger.inc $(st)\preproc.sno $(ss)\oldstuff.inc

					s -b $(st)\preproc.sno <$(ss)\frogger.inc >$(ss)\frogger.tmp

#===========================================================================
#
#   Build data
#
#===========================================================================

$(sa)\frnt000.bin:  $(sa)\frnt000.raw

                    packraw -ob -si -pi2 <$(sa)\frnt000.raw >$(sa)\frnt000.bin

$(sa)\frnt001.bin:  $(sa)\frnt001.raw

                    packraw -ob -si -pi2 <$(sa)\frnt001.raw >$(sa)\frnt001.bin

$(sa)\frnt002.bin:  $(sa)\frnt002.raw

                    packraw -ob -si -pi2 <$(sa)\frnt002.raw >$(sa)\frnt002.bin

$(sa)\sprite00.bin: $(sa)\sprite00.raw

                    packraw -ob -pi2 <$(sa)\sprite00.raw >$(sa)\sprite00.bin

$(sa)\strip00.bin:  $(sa)\strip00.raw

                    packraw -ob -si -pi2 <$(sa)\strip00.raw >$(sa)\strip00.bin

$(sa)\strip01.bin:  $(sa)\strip01.raw

                    packraw -ob -si -pi2 <$(sa)\strip01.raw >$(sa)\strip01.bin

$(sa)\strip02.bin:  $(sa)\strip02.raw

                    packraw -ob -si -pi2 <$(sa)\strip02.raw >$(sa)\strip02.bin

$(sa)\strip03.bin:  $(sa)\strip03.raw

                    packraw -ob -si -pi2 <$(sa)\strip03.raw >$(sa)\strip03.bin

$(sa)\strip04.bin:  $(sa)\strip04.raw

                    packraw -ob -si -pi2 <$(sa)\strip04.raw >$(sa)\strip04.bin

$(sa)\strip05.bin:  $(sa)\strip05.raw

                    packraw -ob -si -pi2 <$(sa)\strip05.raw >$(sa)\strip05.bin

$(sa)\strip06.bin:  $(sa)\strip06.raw

                    packraw -ob -si -pi2 <$(sa)\strip06.raw >$(sa)\strip06.bin

$(sa)\strip07.bin:  $(sa)\strip07.raw

                    packraw -ob -si -pi2 <$(sa)\strip07.raw >$(sa)\strip07.bin

$(sa)\strip08.bin:  $(sa)\strip08.raw

                    packraw -ob -si -pi2 <$(sa)\strip08.raw >$(sa)\strip08.bin

$(sa)\strip09.bin:  $(sa)\strip09.raw

                    packraw -ob -si -pi2 <$(sa)\strip09.raw >$(sa)\strip09.bin
