#
# Bass Masters '98
#
# Special instructions:
#
#   file "newbase" in win95 source directory is used to signal the 
#   existance of a new source base received from the win95 code
#   developer.  Touching it forces a remake of all code.
#

libs = libapi.lib libetc.lib libgpu.lib libgte.lib libgs.lib libsnd.lib libspu.lib libsn.lib libcd.lib libpress.lib libc.lib libc2.lib libmath.lib

OPT = -O$(projdebug)
INC  = 
#-Ip:\psx\include
#-IL:\Progra~1\DevStu~1\VC\include

BOOTDEB = -g
GAMEDEB = -g
MENUDEB = -g

#no overlays
MENUSEC = 
GAMESEC = 

#overlays
#MENUSEC = -Wa,smenu
#GAMESEC = -Wa,sgame

irobot = "$(irdrive)\Program Files\Jasc Image Robot"
t  = $(proj)\tools
t2 = p:\tools\bmp2txt\debug
ta = p:\tools\tmd2tmd\debug
tb = p:\tools\buildtmd\debug
th = p:\tools\ppmhalfv\debug
ti = p:\tools\bmp2tim\debug
tk = p:\tools\bmp2blk\debug
tl = p:\tools\lake2txt\debug
tp = p:\tools\ppm2txt\debug
ts = p:\tools\ppmshrnk\debug
tt = p:\tools\tex62txt\debug
fw = $(proj)\sony
fh = $(proj)\sony\h
ww = $(proj)\src
wa = $(proj)\src
wo = $(proj)\src
wm = $(proj)\src\menu
sa = art
sm = art\menu
sc = $(projcd)

OBJS  = \
        menuprcs.obj alfuncs.obj bboot.obj main.obj directx.obj bmovie.obj \
        animals.obj bmenu.obj bgame.obj maingame.obj init.obj \
        avisurf.obj render.obj mem.obj initreg.obj mainmenu.obj \
        menuinfo.obj movie.obj inputs.obj error.obj lakemap.obj \
        fman.obj fishing.obj menuaux.obj anim.obj menusave.obj landscap.obj \
        3dmath.obj sound.obj dsound.obj address.obj dlgbox.obj fish.obj \
        texture.obj cleanup.obj wave.obj \
        menuscr.obj water.obj menudraw.obj menupres.obj

# !if !else !endif

all:    artfiles $(projcd)\psx.exe $(sc)\art\lakedata.bin
#all:    artfiles

        echo hi >$(proj)\candebug
        rem beep

$(projcd)\psx.exe:	$(OBJS) makefile.mak bass.pat
    parmmacs ;-dpsx=$(psx) -dproj=$(proj) -ibass.pat -obass.lnk
	psylink /n2000 /c /m /v @bass.lnk,bboot.cpe,bboot.sym,bass.map 
    echo link >con
	cpe2x bboot.cpe
	copy bboot.exe $(projcd)\psx.exe
	rem copy bmenu.bin $(projcd)
	rem copy bgame.bin $(projcd)
    rem copy bboot.cpe $(projcd)
    rem copy bboot.sym $(projcd)

# 
# address file for overlay modules
# 

address.obj: address.s
    echo assemble address.s >con
	asmpsx /l address,address

# 
# boot module
# 

bboot.obj: bboot.c globals.h projcd.h bass.h
    echo compiling bboot.c >con
	ccpsx $(OPT) $(BOOTDEB) -c bboot.c
	\psxold\bin\dmpsx bboot.obj -b

# 						       
# menu module
# 

bmenu.obj: bmenu.c globals.h projcd.h
    echo compiling bmenu.c >con
	ccpsx $(OPT) $(MENUDEB) -c -DOVERLAY -G0 $(MENUSEC) bmenu.c


# 						       
# sound code
# 

sound.obj: sound.c globals.h projcd.h
    echo compiling sound.c >con
	ccpsx $(OPT) $(BOOTDEB) -c sound.c

# 						       
# movie code
# 

bmovie.obj: bmovie.c globals.h projcd.h
    echo compiling bmovie.c >con
	ccpsx $(OPT) $(BOOTDEB) -c bmovie.c

# 
# game module
# 

bgame.obj: bgame.c globals.h projcd.h
    echo compiling bgame.c >con
	ccpsx $(OPT) $(GAMEDEB) -c -DOVERLAY -G0 $(GAMESEC) bgame.c

#
# set project cd location
#

projcd.h: dosbox.bat
    parmmacs ;-cprojcd=$(projcd) -iprojcd.pat -oprojcd.h

#
# set global defines
#

globals.h: bass.h

    echo touch globals.h >con
    touch globals.h

bass.h: $(fw)\bass.h

    echo copy bass.h >con
    copy $(fw)\bass.h bass.h
    touch bass.h
    
$(fw)\windows.h: $(fw)\bass.h $(fw)\ASBFixed.h

    echo touch windows.h >con
    touch $(fw)\windows.h

#$(fw)\alfuncs.h: $(fw)\lakedata.h
#
#    echo touch alfuncs.h >con
#    touch $(fw)\alfuncs.h

#########################################################################
#
# fishing files from win95: new base problems
#

makebase: $(t)\compare.sno $(ww)\newbase

    echo making new base >con
    touch makebase

#########################################################################
#
# fishing files from win95: compiles
#

3dmath.obj: $(fw)\3dmath.cpp $(fw)\typedefs.h $(fw)\windows.h $(fw)\app.h \
    $(fw)\trigtabs.h $(fw)\flttrig.h $(fw)\fixtrig.h $(fw)\alfuncs.h

    cd $(fw)
    echo compiling 3dmath.cpp >con
	ccpsx $(OPT) $(BOOTDEB) -c -G0 $(INC) 3dmath.cpp
    cd $(proj)
    copy $(fw)\3dmath.obj

alfuncs.obj: $(fw)\alfuncs.cpp $(fw)\windows.h $(fw)\typedefs.h \
    $(fw)\fishing.h $(fw)\alfuncs.h $(fw)\scrndefs.h globals.h \
    $(fw)\directx.h $(fw)\menufncs.h $(fw)\scrntabl.h $(fw)\menu.h \
    $(fw)\menuscr.h $(fw)\lureinfo.h

    cd $(fw)
    echo compiling alfuncs.cpp >con
	ccpsx $(OPT) $(BOOTDEB) -c -G0 $(INC) alfuncs.cpp
	dmpsx alfuncs.obj -b
    cd $(proj)
    copy $(fw)\alfuncs.obj

anim.obj: $(fw)\anim.cpp $(fw)\typedefs.h $(fw)\windows.h $(fw)\app.h \
    $(fw)\alfuncs.h $(fw)\directx.h $(fw)\fishing.h $(fw)\render.h \
    $(fw)\3dmath.h

    cd $(fw)
    echo compiling anim.cpp >con
	ccpsx $(OPT) $(BOOTDEB) -c -G0 $(INC) anim.cpp
    cd $(proj)
    copy $(fw)\anim.obj

animals.obj: $(fw)\animals.cpp $(fw)\typedefs.h $(fw)\windows.h $(fw)\app.h \
    $(fw)\alfuncs.h $(fw)\directx.h $(fw)\fishing.h $(fw)\render.h \
    $(fw)\vulcoord.h $(fw)\logfile.h

    cd $(fw)
    echo compiling animals.cpp >con
	ccpsx $(OPT) $(BOOTDEB) -c -G0 $(INC) animals.cpp
    cd $(proj)
    copy $(fw)\animals.obj

avisurf.obj: $(fw)\avisurf.cpp $(fw)\windows.h $(fw)\avisurf.h

    cd $(fw)
    echo compiling avisurf.cpp >con
	ccpsx $(OPT) $(BOOTDEB) -c -G0 $(INC) avisurf.cpp
    cd $(proj)
    copy $(fw)\avisurf.obj

cleanup.obj: $(fw)\cleanup.cpp $(fw)\app.h $(fw)\typedefs.h $(fw)\3dmath.h \
    $(fw)\directx.h $(fw)\texture.h $(fw)\mem.h $(fw)\sound.h $(fw)\cleanup.h \
    $(fw)\fishing.h $(fw)\main.h $(fw)\menuscr.h $(fw)\inputs.h \
    $(fw)\render.h $(fw)\windows.h $(fw)\render.h $(fw)\alfuncs.h

    cd $(fw)
    echo compiling cleanup.cpp >con
	ccpsx $(OPT) $(BOOTDEB) -c -G0 $(INC) cleanup.cpp
    cd $(proj)
    copy $(fw)\cleanup.obj

directx.obj: $(fw)\directx.cpp $(fw)\windows.h $(fw)\app.h $(fw)\typedefs.h \
    $(fw)\directx.h $(fw)\fishing.h $(fw)\alfuncs.h $(fw)\texture.h \
    $(fw)\sound.h $(fw)\menu.h $(fw)\menuscr.h $(fw)\main.h \
    $(fw)\cleanup.h $(fw)\error.h 

    cd $(fw)
    echo compiling directx.cpp >con
	ccpsx $(OPT) $(BOOTDEB) -c -G0 $(INC) directx.cpp
    cd $(proj)
    copy $(fw)\directx.obj

dlgbox.obj: $(fw)\dlgbox.cpp $(fw)\windows.h $(fw)\app.h $(fw)\typedefs.h \
    $(fw)\directx.h $(fw)\fishing.h $(fw)\dlgbox.h $(fw)\alfuncs.h \
    $(fw)\texture.h $(fw)\sound.h $(fw)\main.h $(fw)\inputs.h $(fw)\render.h \
    $(fw)\menuinfo.h $(fw)\cleanup.h $(fw)\avisurf.h $(fw)\movie.h \
    $(fw)\fish.h $(fw)\init.h $(fw)\lakemap.h 

    cd $(fw)
    echo compiling dlgbox.cpp >con
	ccpsx $(OPT) $(BOOTDEB) -c -G0 $(INC) dlgbox.cpp
    cd $(proj)
    copy $(fw)\dlgbox.obj

dsound.obj: $(fw)\dsound.cpp $(fw)\typedefs.h $(fw)\fishing.h \
    $(fw)\app.h $(fw)\windows.h $(fw)\directx.h \
    $(fw)\sound.h $(fw)\wave.h $(fw)\error.h

    cd $(fw)
    echo compiling dsound.cpp >con
	ccpsx $(OPT) $(BOOTDEB) -c -G0 $(INC) dsound.cpp
    cd $(proj)
    copy $(fw)\dsound.obj

error.obj: $(fw)\error.cpp $(fw)\windows.h $(fw)\error.h

    cd $(fw)
    echo compiling error.cpp >con
	ccpsx $(OPT) $(BOOTDEB) -c -G0 $(INC) error.cpp
    cd $(proj)
    copy $(fw)\error.obj

fish.obj: $(fw)\fish.cpp $(fw)\typedefs.h $(fw)\alfuncs.h \
    $(fw)\app.h $(fw)\windows.h $(fw)\directx.h \
    $(fw)\fishing.h $(fw)\3dmath.h $(fw)\render.h $(fw)\fish.h

    cd $(fw)
    echo compiling fish.cpp >con
	ccpsx $(OPT) $(BOOTDEB) -c -G0 $(INC) fish.cpp
    cd $(proj)
    copy $(fw)\fish.obj

fishing.obj: $(fw)\fishing.cpp $(fw)\windows.h $(fw)\app.h $(fw)\typedefs.h \
    $(fw)\directx.h $(fw)\fishing.h $(fw)\alfuncs.h $(fw)\texture.h \
    $(fw)\sound.h $(fw)\3dmath.h $(fw)\mem.h $(fw)\main.h $(fw)\menuscr.h \
    $(fw)\inputs.h $(fw)\render.h $(fw)\menuinfo.h $(fw)\avisurf.h \
    $(fw)\movie.h $(fw)\initreg.h $(fw)\fman.h $(fw)\lakemap.h \
    $(fw)\ariel8x8.c $(fw)\wingl8x8.c

    cd $(fw)
    echo compiling fishing.cpp >con
	ccpsx $(OPT) $(BOOTDEB) -c -G0 $(INC) fishing.cpp
    cd $(proj)
    copy $(fw)\fishing.obj

fman.obj: $(fw)\fman.cpp $(fw)\windows.h $(fw)\app.h $(fw)\typedefs.h \
    $(fw)\directx.h $(fw)\fishing.h $(fw)\alfuncs.h $(fw)\fman.h \
    $(fw)\sound.h $(fw)\3dmath.h $(fw)\render.h $(fw)\cleanup.h

    cd $(fw)
    echo compiling fman.cpp >con
	ccpsx $(OPT) $(BOOTDEB) -c -G0 $(INC) fman.cpp
    cd $(proj)
    copy $(fw)\fman.obj

init.obj: $(fw)\init.cpp $(fw)\windows.h $(fw)\app.h $(fw)\typedefs.h \
    $(fw)\fishing.h $(fw)\3dmath.h $(fw)\directx.h $(fw)\texture.h \
    $(fw)\mem.h $(fw)\menu.h $(fw)\init.h $(fw)\main.h $(fw)\menuscr.h \
    $(fw)\alfuncs.h $(fw)\menuinfo.h $(fw)\fish.h $(fw)\animals.h \
    $(fw)\error.h $(fw)\lure.h $(fw)\lakemap.h $(fw)\lureinfo.h

    cd $(fw)
    echo compiling init.cpp >con
	ccpsx $(OPT) $(BOOTDEB) -c -G0 $(INC) init.cpp
    cd $(proj)
    copy $(fw)\init.obj

initreg.obj: $(fw)\initreg.cpp $(fw)\windows.h $(fw)\typedefs.h \
    $(fw)\initreg.h $(fw)\error.h

    cd $(fw)
    echo compiling initreg.cpp >con
	ccpsx $(OPT) $(BOOTDEB) -c -G0 $(INC) initreg.cpp
    cd $(proj)
    copy $(fw)\initreg.obj

inputs.obj: $(fw)\inputs.cpp $(fw)\fishing.h $(fw)\typedefs.h \
    $(fw)\inputs.h $(fw)\app.h $(fw)\3dmath.h $(fw)\alfuncs.h \
    $(fw)\main.h $(fw)\directx.h $(fw)\windows.h

    cd $(fw)
    echo compiling inputs.cpp >con
	ccpsx $(OPT) $(BOOTDEB) -c -G0 $(INC) inputs.cpp
    cd $(proj)
    copy $(fw)\inputs.obj

lakemap.obj: $(fw)\lakemap.cpp $(fw)\fishing.h $(fw)\typedefs.h \
    $(fw)\inputs.h $(fw)\app.h $(fw)\texture.h $(fw)\alfuncs.h \
    $(fw)\main.h $(fw)\directx.h $(fw)\windows.h $(fw)\render.h \
    $(fw)\menuinfo.h $(fw)\menu.h $(fw)\lakemap.h $(fw)\lureinfo.h

    cd $(fw)
    echo compiling lakemap.cpp >con
	ccpsx $(OPT) $(BOOTDEB) -c -G0 $(INC) lakemap.cpp
    cd $(proj)
    copy $(fw)\lakemap.obj

landscap.obj: $(fw)\landscap.cpp $(fw)\fishing.h $(fw)\typedefs.h \
    $(fw)\app.h $(fw)\3dmath.h $(fw)\alfuncs.h \
    $(fw)\directx.h $(fw)\windows.h $(fw)\render.h

    cd $(fw)
    echo compiling landscap.cpp >con
	ccpsx $(OPT) $(BOOTDEB) -c -G0 $(INC) landscap.cpp
    cd $(proj)
    copy $(fw)\landscap.obj

main.obj: $(fw)\main.cpp $(fw)\windows.h $(fw)\fishing.h $(fw)\typedefs.h \
    $(fw)\menuscr.h $(fw)\init.h $(fw)\app.h $(fw)\alfuncs.h $(fw)\initreg.h \
    $(fw)\directx.h $(fw)\texture.h $(fw)\menu.h $(fw)\sound.h $(fw)\lure.h \
    $(fw)\resource.h $(fw)\menuinfo.h $(fw)\initavi.h $(fw)\error.h \
    $(fw)\lureinfo.h $(fw)\scrndefs.h

    cd $(fw)
    echo compiling main.cpp >con
	ccpsx $(OPT) $(BOOTDEB) -c -G0 $(INC) main.cpp
    cd $(proj)
    copy $(fw)\main.obj

maingame.obj: $(fw)\maingame.cpp $(fw)\windows.h $(fw)\app.h $(fw)\typedefs.h \
    $(fw)\directx.h $(fw)\texture.h $(fw)\fishing.h $(fw)\menu.h \
    $(fw)\sound.h $(fw)\resource.h $(fw)\menuscr.h $(fw)\init.h \
    $(fw)\alfuncs.h $(fw)\menuinfo.h $(fw)\initavi.h $(fw)\error.h \
    $(fw)\lure.h $(fw)\initreg.h $(fw)\lureinfo.h $(fw)\scrndefs.h

    cd $(fw)
    echo compiling maingame.cpp >con
	ccpsx $(OPT) $(BOOTDEB) -c -G0 $(INC) maingame.cpp
    cd $(proj)
    copy $(fw)\maingame.obj

mainmenu.obj: $(fw)\mainmenu.cpp $(fw)\fishing.h $(fw)\typedefs.h \
    $(fw)\menuscr.h $(fw)\init.h $(fw)\windows.h $(fw)\app.h \
    $(fw)\directx.h $(fw)\texture.h $(fw)\menu.h $(fw)\sound.h \
    $(fw)\resource.h  $(fw)\menuinfo.h $(fw)\alfuncs.h $(fw)\initavi.h \
    $(fw)\error.h $(fw)\lure.h $(fw)\initreg.h $(fw)\lureinfo.h \
    $(fw)\scrndefs.h

    cd $(fw)
    echo compiling mainmenu.cpp >con
	ccpsx $(OPT) $(BOOTDEB) -c -G0 $(INC) mainmenu.cpp
    cd $(proj)
    copy $(fw)\mainmenu.obj

mem.obj: $(fw)\mem.cpp $(fw)\mem.h $(fw)\windows.h $(fw)\mem.h

    cd $(fw)
    echo compiling mem.cpp >con
	ccpsx $(OPT) $(BOOTDEB) -c -G0 $(INC) -Wa,smem mem.cpp
    cd $(proj)
    copy $(fw)\mem.obj

menuaux.obj: $(fw)\menuaux.cpp $(fw)\menu.h $(fw)\windows.h $(fw)\main.h \
    $(fw)\alfuncs.h $(fw)\fishing.h $(fw)\app.h $(fw)\typedefs.h \
    $(fw)\menuscr.h $(fw)\menuinfo.h $(fw)\lure.h $(fw)\lureinfo.h

    cd $(fw)
    echo compiling menuaux.cpp >con
	ccpsx $(OPT) $(BOOTDEB) -c -G0 $(INC) menuaux.cpp
    cd $(proj)
    copy $(fw)\menuaux.obj

menudraw.obj: $(fw)\menudraw.cpp $(fw)\menu.h $(fw)\windows.h $(fw)\main.h \
    $(fw)\alfuncs.h $(fw)\fishing.h $(fw)\app.h $(fw)\typedefs.h \
    $(fw)\menuscr.h $(fw)\menuinfo.h $(fw)\lure.h $(fw)\lureinfo.h

    cd $(fw)
    echo compiling menudraw.cpp >con
	ccpsx $(OPT) $(BOOTDEB) -c -G0 $(INC) menudraw.cpp
    cd $(proj)
    copy $(fw)\menudraw.obj

menuinfo.obj: $(fw)\menuinfo.cpp $(fw)\menu.h $(fw)\windows.h \
    $(fw)\menuinfo.h $(fw)\alfuncs.h $(fw)\app.h $(fw)\typedefs.h \
    $(fw)\fishing.h $(fw)\menuscr.h $(fw)\init.h $(fw)\main.h $(fw)\lure.h \
    $(fw)\initreg.h $(fw)\lureinfo.h

    cd $(fw)
    echo compiling menuinfo.cpp >con
	ccpsx $(OPT) $(BOOTDEB) -c -G0 $(INC) menuinfo.cpp
    cd $(proj)
    copy $(fw)\menuinfo.obj

menupres.obj: $(fw)\menupres.cpp $(fw)\menu.h $(fw)\windows.h $(fw)\main.h \
    $(fw)\alfuncs.h $(fw)\fishing.h $(fw)\app.h $(fw)\typedefs.h \
    $(fw)\menuscr.h $(fw)\menuinfo.h $(fw)\lure.h $(fw)\initreg.h \
    $(fw)\lureinfo.h

    cd $(fw)
    echo compiling menupres.cpp >con
	ccpsx $(OPT) $(BOOTDEB) -c -G0 $(INC) menupres.cpp
    cd $(proj)
    copy $(fw)\menupres.obj

menuprcs.obj: $(fw)\menuprcs.cpp $(fw)\menu.h $(fw)\windows.h $(fw)\main.h \
    $(fw)\alfuncs.h $(fw)\fishing.h $(fw)\app.h $(fw)\typedefs.h \
    $(fw)\menuscr.h $(fw)\menuinfo.h $(fw)\lure.h $(fw)\initreg.h \
    $(fw)\lureinfo.h

    cd $(fw)
    echo compiling menuprcs.cpp >con
	ccpsx $(OPT) $(BOOTDEB) -c -G0 $(INC) menuprcs.cpp
    cd $(proj)
    copy $(fw)\menuprcs.obj

menusave.obj: $(fw)\menusave.cpp $(fw)\menu.h $(fw)\windows.h $(fw)\main.h \
    $(fw)\alfuncs.h $(fw)\fishing.h $(fw)\app.h $(fw)\typedefs.h \
    $(fw)\menuscr.h $(fw)\menuinfo.h $(fw)\lure.h $(fw)\lureinfo.h

    cd $(fw)
    echo compiling menusave.cpp >con
	ccpsx $(OPT) $(BOOTDEB) -c -G0 $(INC) menusave.cpp
    cd $(proj)
    copy $(fw)\menusave.obj

menuscr.obj: $(fw)\menuscr.cpp $(fw)\fishing.h $(fw)\typedefs.h \
    $(fw)\menuscr.h $(fw)\app.h $(fw)\menu.h $(fw)\resource.h \
    $(fw)\main.h $(fw)\directx.h $(fw)\windows.h $(fw)\menuinfo.h \
    $(fw)\alfuncs.h $(fw)\error.h $(fw)\lure.h $(fw)\lureinfo.h

    cd $(fw)
    echo compiling menuscr.cpp >con
	ccpsx $(OPT) $(BOOTDEB) -c -G0 $(INC) menuscr.cpp
    cd $(proj)
    copy $(fw)\menuscr.obj

movie.obj: $(fw)\movie.cpp $(fw)\movie.h $(fw)\windows.h $(fw)\avisurf.h \
    $(fw)\fishing.h $(fw)\app.h $(fw)\typedefs.h $(fw)\render.h \
    $(fw)\directx.h

    cd $(fw)
    echo compiling movie.cpp >con
	ccpsx $(OPT) $(BOOTDEB) -c -G0 $(INC) movie.cpp
    cd $(proj)
    copy $(fw)\movie.obj

render.obj: $(fw)\render.cpp $(fw)\fishing.h $(fw)\typedefs.h \
    $(fw)\render.h $(fw)\app.h $(fw)\inputs.h $(fw)\3dmath.h \
    $(fw)\main.h $(fw)\directx.h $(fw)\windows.h $(fw)\texture.h \
    $(fw)\menuscr.h $(fw)\alfuncs.h $(fw)\lakemap.h

    cd $(fw)
    echo compiling render.cpp >con
	ccpsx $(OPT) $(BOOTDEB) -c -DSTAMPDAY=1$(day) -DSTAMPMONTH=1$(month) -DSTAMPHOUR=1$(hour) -G0 $(INC) render.cpp
    cd $(proj)
    copy $(fw)\render.obj

texture.obj: $(fw)\texture.cpp $(fw)\typedefs.h $(fw)\mem.h \
    $(fw)\windows.h $(fw)\app.h $(fw)\alfuncs.h $(fw)\error.h \
    $(fw)\directx.h $(fw)\texture.h $(fw)\main.h

    cd $(fw)
    echo compiling texture.cpp >con
	ccpsx $(OPT) $(BOOTDEB) -c -G0 $(INC) texture.cpp
    cd $(proj)
    copy $(fw)\texture.obj

water.obj: $(fw)\water.cpp $(fw)\typedefs.h $(fw)\mem.h \
    $(fw)\windows.h $(fw)\app.h $(fw)\init.h $(fw)\alfuncs.h \
    $(fw)\directx.h $(fw)\texture.h $(fw)\main.h

    cd $(fw)
    echo compiling water.cpp >con
	ccpsx $(OPT) $(BOOTDEB) -c -G0 $(INC) water.cpp
    cd $(proj)
    copy $(fw)\water.obj

wave.obj: $(fw)\wave.cpp $(fw)\typedefs.h $(fw)\windows.h $(fw)\app.h\
    $(fw)\directx.h $(fw)\sound.h $(fw)\mem.h $(fw)\alfuncs.h $(fw)\error.h

    cd $(fw)
    echo compiling wave.cpp >con
	ccpsx $(OPT) $(BOOTDEB) -c -G0 $(INC) wave.cpp
    cd $(proj)
    copy $(fw)\wave.obj

#########################################################################
#
# fishing files from win95: c++ conversions
#

$(fw)\3dmath.cpp: $(fw)\3dmath.pat makebase $(ww)\3dmath.cpp

    echo converting 3dmath.pat >con
    $(t)\buildc 1 cpp $(ww) $(fw) 3dmath 3dmath

$(fw)\anim.cpp: $(fw)\anim.pat makebase $(ww)\anim.cpp

    echo converting anim.pat >con
    $(t)\buildc 1 cpp $(ww) $(fw) anim anim

$(fw)\animals.cpp: $(fw)\animals.pat makebase $(ww)\animals.cpp

    echo converting animals.pat >con
    $(t)\buildc 1 cpp $(ww) $(fw) animals animals

$(fw)\avisurf.cpp: $(fw)\avisurf.pat makebase $(ww)\avisurf.cpp

    echo converting avisurf.pat >con
    $(t)\buildc 1 cpp $(ww) $(fw) avisurf avisurf

$(fw)\cleanup.cpp: $(fw)\cleanup.pat makebase $(ww)\cleanup.cpp

    echo converting cleanup.pat >con
    $(t)\buildc 1 cpp $(ww) $(fw) cleanup cleanup

$(fw)\directx.cpp: $(fw)\directx.pat makebase $(ww)\directx.cpp

    echo converting directx.pat >con
    $(t)\buildc 1 cpp $(ww) $(fw) directx directx

$(fw)\dlgbox.cpp: $(fw)\dlgbox.pat makebase $(ww)\dlgbox.cpp

    echo converting dlgbox.pat >con
    $(t)\buildc 1 cpp $(ww) $(fw) dlgbox dlgbox

$(fw)\dsound.cpp: $(fw)\dsound.pat makebase $(ww)\dsound.cpp

    echo converting dsound.pat >con
    $(t)\buildc 1 cpp $(ww) $(fw) dsound dsound

$(fw)\error.cpp: $(fw)\error.pat makebase $(ww)\error.cpp

    echo converting error.pat >con
    $(t)\buildc 1 cpp $(ww) $(fw) error error

$(fw)\fish.cpp: $(fw)\fish.pat makebase $(ww)\fish.cpp

    echo converting fish.pat >con
    $(t)\buildc 1 cpp $(ww) $(fw) fish fish

$(fw)\fishing.cpp: $(fw)\fishing.pat makebase $(ww)\fishing.cpp

    echo converting fishing.pat >con
    $(t)\buildc 1 cpp $(ww) $(fw) fishing fishing

$(fw)\fman.cpp: $(fw)\fman.pat makebase $(ww)\fman.cpp

    echo converting fman.pat >con
    $(t)\buildc 1 cpp $(ww) $(fw) fman fman

$(fw)\init.cpp: $(fw)\init.pat makebase $(ww)\init.cpp

    echo converting init.pat >con
    $(t)\buildc 1 cpp $(ww) $(fw) init init

$(fw)\initreg.cpp: $(fw)\initreg.pat makebase $(ww)\initreg.cpp

    echo converting initreg.pat >con
    $(t)\buildc 1 cpp $(ww) $(fw) initreg initreg

$(fw)\inputs.cpp: $(fw)\inputs.pat makebase $(ww)\inputs.cpp

    echo converting inputs.pat >con
    $(t)\buildc 1 cpp $(ww) $(fw) inputs inputs

$(fw)\lakemap.cpp: $(fw)\lakemap.pat makebase $(ww)\lakemap.cpp

    echo converting lakemap.pat >con
    $(t)\buildc 1 cpp $(ww) $(fw) lakemap lakemap

$(fw)\landscap.cpp: $(fw)\landscap.pat makebase $(ww)\landscap.cpp

    echo converting landscap.pat >con
    $(t)\buildc 1 cpp $(ww) $(fw) landscap landscap

$(fw)\main.cpp: $(fw)\main.pat makebase $(ww)\main.cpp

    echo converting main.pat >con
    $(t)\buildc 3 cpp $(ww) $(fw) main main

$(fw)\maingame.cpp: $(fw)\main.pat makebase $(ww)\main.cpp

    echo converting maingame.pat >con
    $(t)\buildc 2 cpp $(ww) $(fw) main maingame

$(fw)\mainmenu.cpp: $(fw)\main.pat makebase $(ww)\main.cpp

    echo converting mainmenu.pat >con
    $(t)\buildc 1 cpp $(ww) $(fw) main mainmenu

$(fw)\mem.cpp: $(fw)\mem.pat makebase $(ww)\mem.c

    echo converting mem.pat >con
    $(t)\buildc 1 c $(ww) $(fw) mem mem

$(fw)\menuaux.cpp: $(fw)\menuaux.pat makebase $(ww)\menuaux.cpp

    echo converting menuaux.pat >con
    $(t)\buildc 1 cpp $(ww) $(fw) menuaux menuaux

$(fw)\menudraw.cpp: $(fw)\menudraw.pat makebase $(ww)\menudraw.cpp

    echo converting menudraw.pat >con
    $(t)\buildc 1 cpp $(ww) $(fw) menudraw menudraw

$(fw)\menuinfo.cpp: $(fw)\menuinfo.pat makebase $(ww)\menuinfo.cpp

    echo converting menuinfo.pat >con
    $(t)\buildc 1 cpp $(ww) $(fw) menuinfo menuinfo

$(fw)\menupres.cpp: $(fw)\menupres.pat makebase $(ww)\menupres.cpp

    echo converting menupres.pat >con
    $(t)\buildc 1 cpp $(ww) $(fw) menupres menupres

$(fw)\menuprcs.cpp: $(fw)\menuprcs.pat makebase $(ww)\menuprcs.cpp

    echo converting menuprcs.pat >con
    $(t)\buildc 1 cpp $(ww) $(fw) menuprcs menuprcs

$(fw)\menusave.cpp: $(fw)\menusave.pat makebase $(ww)\menusave.cpp

    echo converting menusave.pat >con
    $(t)\buildc 1 cpp $(ww) $(fw) menusave menusave

$(fw)\menuscr.cpp: $(fw)\menuscr.pat makebase $(ww)\menuscr.cpp

    echo converting menuscr.pat >con
    $(t)\buildc 1 cpp $(ww) $(fw) menuscr menuscr

$(fw)\movie.cpp: $(fw)\movie.pat makebase $(ww)\movie.cpp

    echo converting movie.pat >con
    $(t)\buildc 1 cpp $(ww) $(fw) movie movie

$(fw)\render.cpp: $(fw)\render.pat makebase $(ww)\render.cpp

    echo converting render.pat >con
    $(t)\buildc 1 cpp $(ww) $(fw) render render

$(fw)\texture.cpp: $(fw)\texture.pat makebase $(ww)\texture.cpp

    echo converting texture.pat >con
    $(t)\buildc 1 cpp $(ww) $(fw) texture texture

$(fw)\water.cpp: $(fw)\water.pat makebase $(ww)\water.cpp

    echo converting water.pat >con
    $(t)\buildc 1 cpp $(ww) $(fw) water water

$(fw)\wave.cpp: $(fw)\wave.pat makebase $(ww)\wave.cpp

    echo converting wave.pat >con
    $(t)\buildc 1 cpp $(ww) $(fw) wave wave

#########################################################################
#
# fishing files from win95: .h conversions
#

$(fw)\3dmath.h: $(fh)\3dmath.pat makebase $(ww)\3dmath.h

    echo converting h\3dmath.pat >con
    $(t)\buildh 1 $(fh) $(ww) $(fw) 3dmath 3dmath

$(fw)\animals.h: $(fh)\animals.pat makebase $(ww)\animals.h $(fw)\d3dmacs.h

    echo converting h\animals.pat >con
    $(t)\buildh 1 $(fh) $(ww) $(fw) animals animals

$(fw)\app.h: $(fh)\app.pat makebase $(ww)\app.h $(fw)\d3dmacs.h

    echo converting h\app.pat >con
    $(t)\buildh 1 $(fh) $(ww) $(fw) app app

$(fw)\avisurf.h: $(fh)\avisurf.pat makebase $(ww)\avisurf.h $(fw)\d3dmacs.h

    echo converting h\avisurf.pat >con
    $(t)\buildh 1 $(fh) $(ww) $(fw) avisurf avisurf

$(fw)\cleanup.h: $(fh)\cleanup.pat makebase $(ww)\cleanup.h $(fw)\d3dmacs.h

    echo converting h\cleanup.pat >con
    $(t)\buildh 1 $(fh) $(ww) $(fw) cleanup cleanup

$(fw)\d3dmacs.h: $(fh)\d3dmacs.pat makebase $(ww)\d3dmacs.h

    echo converting h\d3dmacs.pat >con
    $(t)\buildh 1 $(fh) $(ww) $(fw) d3dmacs d3dmacs

$(fw)\directx.h: $(fh)\directx.pat makebase $(ww)\directx.h

    echo converting h\directx.pat >con
    $(t)\buildh 1 $(fh) $(ww) $(fw) directx directx

$(fw)\dlgbox.h: $(fh)\dlgbox.pat makebase $(ww)\dlgbox.h

    echo converting h\dlgbox.pat >con
    $(t)\buildh 1 $(fh) $(ww) $(fw) dlgbox dlgbox

$(fw)\error.h: $(fh)\error.pat makebase $(ww)\error.h

    echo converting h\error.pat >con
    $(t)\buildh 1 $(fh) $(ww) $(fw) error error

$(fw)\fish.h: $(fh)\fish.pat makebase $(ww)\fish.h

    echo converting h\fish.pat >con
    $(t)\buildh 1 $(fh) $(ww) $(fw) fish fish

$(fw)\fishing.h: $(fh)\fishing.pat makebase $(ww)\fishing.h

    echo converting h\fishing.pat >con
    $(t)\buildh 1 $(fh) $(ww) $(fw) fishing fishing

$(fw)\fman.h: $(fh)\fman.pat makebase $(ww)\fman.h

    echo converting h\fman.pat >con
    $(t)\buildh 1 $(fh) $(ww) $(fw) fman fman

$(fw)\init.h: $(fh)\init.pat makebase $(ww)\init.h

    echo converting h\init.pat >con
    $(t)\buildh 1 $(fh) $(ww) $(fw) init init

$(fw)\initavi.h: $(fh)\initavi.pat makebase $(ww)\initavi.h

    echo converting h\initavi.pat >con
    $(t)\buildh 1 $(fh) $(ww) $(fw) initavi initavi

$(fw)\initreg.h: $(fh)\initreg.pat makebase $(ww)\initreg.h

    echo converting h\initreg.pat >con
    $(t)\buildh 1 $(fh) $(ww) $(fw) initreg initreg

$(fw)\inputs.h: $(fh)\inputs.pat makebase $(ww)\inputs.h

    echo converting h\inputs.pat >con
    $(t)\buildh 1 $(fh) $(ww) $(fw) inputs inputs

$(fw)\lakemap.h: $(fh)\lakemap.pat makebase $(ww)\lakemap.h

    echo converting h\lakemap.pat >con
    $(t)\buildh 1 $(fh) $(ww) $(fw) lakemap lakemap

$(fw)\logfile.h: $(fh)\logfile.pat makebase $(ww)\logfile.h

    echo converting h\logfile.pat >con
    $(t)\buildh 1 $(fh) $(ww) $(fw) logfile logfile

$(fw)\lure.h: $(fh)\lure.pat makebase $(ww)\lure.h

    echo converting h\lure.pat >con
    $(t)\buildh 1 $(fh) $(ww) $(fw) lure lure

$(fw)\lureinfo.h: $(fh)\lureinfo.pat makebase $(ww)\lureinfo.h

    echo converting h\lureinfo.pat >con
    lf2crlf <$(ww)\lureinfo.h >z:lureinfo.h
    $(t)\buildh 1 $(fh) z: $(fw) lureinfo lureinfo

$(fw)\main.h: $(fh)\main.pat makebase $(ww)\main.h

    echo converting h\main.pat >con
    $(t)\buildh 1 $(fh) $(ww) $(fw) main main

$(fw)\mem.h: $(fh)\mem.pat makebase $(ww)\mem.h

    echo converting h\mem.pat >con
    $(t)\buildh 1 $(fh) $(ww) $(fw) mem mem

$(fw)\menu.h: $(fh)\menu.pat makebase $(ww)\menu.h $(fw)\lureinfo.h \
    $(fw)\menufont.h

    echo converting h\menu.pat >con
    $(t)\buildh 1 $(fh) $(ww) $(fw) menu menu

$(fw)\menufont.h: $(fh)\menufont.pat makebase $(ww)\menufont.h

    echo converting h\menufont.pat >con
    $(t)\buildh 1 $(fh) $(ww) $(fw) menufont menufont

$(fw)\menuinfo.h: $(fh)\menuinfo.pat makebase $(ww)\menuinfo.h

    echo converting h\menuinfo.pat >con
    $(t)\buildh 1 $(fh) $(ww) $(fw) menuinfo menuinfo

$(fw)\menuscr.h: $(fh)\menuscr.pat makebase $(ww)\menuscr.h

    echo converting h\menuscr.pat >con
    $(t)\buildh 1 $(fh) $(ww) $(fw) menuscr menuscr

$(fw)\movie.h: $(fh)\movie.pat makebase $(ww)\movie.h

    echo converting h\movie.pat >con
    $(t)\buildh 1 $(fh) $(ww) $(fw) movie movie

$(fw)\render.h: $(fh)\render.pat makebase $(ww)\render.h

    echo converting h\render.pat >con
    $(t)\buildh 1 $(fh) $(ww) $(fw) render render

$(fw)\resource.h: $(fh)\resource.pat makebase $(ww)\resource.h

    echo converting h\resource.pat >con
    $(t)\buildh 1 $(fh) $(ww) $(fw) resource resource

$(fw)\sound.h: $(fh)\sound.pat makebase $(ww)\sound.h

    echo converting h\sound.pat >con
    $(t)\buildh 1 $(fh) $(ww) $(fw) sound sound

$(fw)\texture.h: $(fh)\texture.pat makebase $(ww)\texture.h

    echo converting h\texture.pat >con
    $(t)\buildh 1 $(fh) $(ww) $(fw) texture texture

$(fw)\typedefs.h: $(fh)\typedefs.pat makebase $(ww)\typedefs.h

    echo converting h\typedefs.pat >con
    $(t)\buildh 1 $(fh) $(ww) $(fw) typedefs typedefs

$(fw)\vulcoord.h: $(fh)\vulcoord.pat makebase $(ww)\vulcoord.h

    echo converting h\vulcoord.pat >con
    $(t)\buildh 1 $(fh) $(ww) $(fw) vulcoord vulcoord

$(fw)\wave.h: $(fh)\wave.pat makebase $(ww)\wave.h

    echo converting h\wave.pat >con
    $(t)\buildh 1 $(fh) $(ww) $(fw) wave wave

#########################################################################
#
# Build lake data file
#

$(sc)\art\lakedata.bin: lakedata.obj lakedata.lnk

    echo linking lakedata.bin >con
    psylink /n2000 /c /m /v @lakedata.lnk,lakedata.cpe,lakedata.sym,lakedata.map
    touch art.flg
    copy lakedata.bin $(sc)\art

lakedata.obj: $(fw)\lakedata.cpp $(fw)\spritmin.h $(fw)\waterlog.h \
    $(fw)\spritlog.h $(fw)\watermea.h $(fw)\spritmea.h $(fw)\waterfor.h \
    $(fw)\spritfor.h $(fw)\waterpra.h $(fw)\spritpra.h $(fw)\loading.h \
    $(fw)\mintest.h $(fw)\logmar.h $(fw)\mead.h $(fw)\fork.h \
    $(fw)\practice.h $(fw)\mapmin.h $(fw)\mapmea.h $(fw)\mapfor.h \
    $(fw)\maplog.h $(fw)\mappra.h $(fw)\lakedata.h $(fw)\watermin.h \
    $(fw)\bass.h

    echo compiling lakedata.obj >con
    cd $(fw)
	ccpsx $(OPT) $(BOOTDEB) -c -G0 $(INC) lakedata.cpp
    cd $(proj)
    copy $(fw)\lakedata.obj

!if $(art) == yes

#########################################################################
#
# convert art
#

artfiles: $(sc)\minn\mintest0.tmd $(sc)\practice\practic0.tmd \
    $(sc)\fork\fork0.tmd $(sc)\art\boatx.ver $(sc)\art\fishx.ver \
    $(sc)\art\fmanx.ver $(sc)\art\loading.tim $(sc)\art\objects.blk \
    $(sc)\art\objects.tmd $(sc)\logmar\logmar0.tmd $(sc)\mead\mead0.tmd \
    $(sc)\art\lurepx.dat $(sc)\art\animpxa.dat \
    $(sc)\art\animpxb.dat livewell.ok water2.ok water1.ok

    echo build art >con
    echo newcd >newprog
    copy newlake.mak artfiles
    touch artfiles
    touch art.flg
    rem beep

newlake.mak: $(ww)\newlake

    echo hi >$(proj)\newlake
    rem force makefile to die
    $(tb)\buildtmd /?

#########################################################################
#
# Process special image files
#

$(sc)\art\lurepx.dat: $(ww)\lurepx.dat

    copy $(ww)\lurepx.dat $(sc)\art\lurepx.dat
    touch $(sc)\art\lurepx.dat

$(sc)\art\animpxa.dat: $(ww)\animpxa.dat

    copy $(ww)\animpxa.dat $(sc)\art\animpxa.dat
    touch $(sc)\art\animpxa.dat

$(sc)\art\animpxb.dat: $(ww)\animpxb.dat

    copy $(ww)\animpxb.dat $(sc)\art\animpxb.dat
    touch $(sc)\art\animpxb.dat

#########################################################################
#
# convert lake to TMD: mintest
#

$(fw)\mintest.h: $(sc)\minn\mintest0.tmd $(t)\structla.sno

    s -b $(t)\structla.sno ;lake(MINN) <$(sa)\w\mintest.dat >$(fw)\mintest.h

$(sc)\minn\mintest0.tmd: $(sa)\mintest.ini $(sa)\w\mintest.txt \
    $(sc)\minn\mintest.tim $(sc)\minn\watermin.tim $(tb)\buildtmd.exe \
    $(ta)\tmd2tmd.exe

    cd $(sa)
    $(tb)\buildtmd -b8 -y- -x+ -r- -m+ -imintest -omintest -pw \
      <w\mintest.txt >w\mintest.dat

    $(ta)\tmd2tmd -l+ -v+ -p+ <mintest1.tmd >$(sc)\minn\mintest1.tmd
    $(ta)\tmd2tmd -l+ -v+ -p+ <mintest0.tmd >$(sc)\minn\mintest0.tmd
    $(ta)\tmd2tmd -l+ -v+ -p+ <mintest2.tmd >$(sc)\minn\mintest2.tmd
    copy mint*.blk $(sc)\minn
    cd $(proj)

$(sa)\w\mintest.txt: minn\mintest.dat $(tl)\lake2txt.exe newlake.mak

    echo build mintest.tmd >con
    $(tl)\lake2txt.exe -iDET1 -iDET2 -iDET3 -t- <minn\mintest.dat >$(sa)\w\junk.txt
    copy /y $(sa)\w\junk.txt $(sa)\w\mintest.txt

#########################################################################
#
# convert lake to TIM: mintest
#

$(sc)\minn\mintest.tim: $(sa)\mintest.cfg $(sa)\w\mintest.log $(ti)\bmp2tim.exe

    cd $(sa)
    $(ti)\bmp2tim -iDET1 -iDET2 -iDET3 -cp:mintest.cfg -pw -tmintest.tim >w\mintest.map 
    copy mintest.tim $(sc)\minn
    cd $(proj)

$(sa)\w\mintest.log: $(sa)\w\mintex16.txt $(sa)\bit8.jsc

    start /w /m $(irdrive)\progra~1\jascim~1\irobot.exe $(sa)\bit8 /r $(sa)\w\x*.ppm /i /l $(sa)\w\mintest.log

$(sa)\w\mintex16.txt: minn\mintex16.dat $(tt)\tex62txt.exe newlake.mak

     echo create mintest.tim >con
     cd $(sa)\w
     $(tt)\tex62txt.exe -cLAND=239 -cLAND=239 -cBOTT=239 -iDET1 -iDET2 -iDET3 -y1 -nx -h- -p3 <$(proj)\minn\mintex16.dat >mintex16.txt
     cd $(proj)

#########################################################################
#
# convert lake to TMD: fork
#

$(fw)\fork.h: $(sc)\fork\fork0.tmd $(t)\structla.sno

    s -b $(t)\structla.sno ;lake(FORK) <$(sa)\w\fork.dat >$(fw)\fork.h

$(sc)\fork\fork0.tmd: $(sa)\fork.ini $(sa)\w\fork.txt \
    $(sc)\fork\forkx.tim $(sc)\fork\waterfor.tim $(tb)\buildtmd.exe \
    $(ta)\tmd2tmd.exe

    cd $(sa)
    $(tb)\buildtmd -b8 -y- -x+ -r- -m+ -ifork -ofork -pw \
      <w\fork.txt >w\fork.dat
    $(ta)\tmd2tmd -l+ -v+ -p+ <fork0.tmd >$(sc)\fork\fork0.tmd
    $(ta)\tmd2tmd -l+ -v+ -p+ <fork1.tmd >$(sc)\fork\fork1.tmd
    $(ta)\tmd2tmd -l+ -v+ -p+ <fork2.tmd >$(sc)\fork\fork2.tmd
    copy fork*.blk $(sc)\fork
    cd $(proj)

$(sa)\w\fork.txt: fork\fork.dat $(tl)\lake2txt.exe newlake.mak

    echo build fork.tmd >con
    $(tl)\lake2txt.exe -iDET1 -iDET2 -iDET3 -t- <fork\fork.dat >$(sa)\w\junk.txt
    copy /y $(sa)\w\junk.txt $(sa)\w\fork.txt

#########################################################################
#
# convert lake to TIM: fork
#

$(sc)\fork\forkx.tim: $(sa)\fork.cfg $(sa)\w\fork.log $(ti)\bmp2tim.exe

    cd $(sa)
    $(ti)\bmp2tim -iDET1 -iDET2 -iDET3 -cp:fork.cfg -pw -tforkx.tim >w\fork.map 
    copy forkx.tim $(sc)\fork
    cd $(proj)

$(sa)\w\fork.log: $(sa)\w\fortex16.txt $(sa)\bit8.jsc

    start /w /m $(irdrive)\progra~1\jascim~1\irobot.exe $(sa)\bit8 /r $(sa)\w\x*.ppm /i /l $(sa)\w\fork.log

$(sa)\w\fortex16.txt: fork\fortex16.dat $(tt)\tex62txt.exe newlake.mak

     echo create forkx.tim >con
     cd $(sa)\w
     $(tt)\tex62txt.exe -cLAND=14 -cLAND=15 -iDET1 -iDET2 -iDET3 -y1 -nx -h- -p3 <$(proj)\fork\fortex16.dat >$(proj)\$(sa)\w\fortex16.txt
     cd $(proj)

#########################################################################
#
# convert lake to TMD: logmar
#

$(fw)\logmar.h: $(sc)\logmar\logmar0.tmd $(t)\structla.sno

    s -b $(t)\structla.sno ;lake(LOGMAR) <$(sa)\w\logmar.dat >$(fw)\logmar.h

$(sc)\logmar\logmar0.tmd: $(sa)\logmar.ini $(sa)\w\logmar.txt \
    $(sc)\logmar\logmar.tim $(sc)\logmar\waterlog.tim $(tb)\buildtmd.exe \
    $(ta)\tmd2tmd.exe

    cd $(sa)
    $(tb)\buildtmd -b8 -y- -x+ -r- -m+ -ilogmar -ologmar -pw \
      <w\logmar.txt >w\logmar.dat
    $(ta)\tmd2tmd -l+ -v+ -p+ <logmar0.tmd >$(sc)\logmar\logmar0.tmd
    $(ta)\tmd2tmd -l+ -v+ -p+ <logmar1.tmd >$(sc)\logmar\logmar1.tmd
    $(ta)\tmd2tmd -l+ -v+ -p+ <logmar2.tmd >$(sc)\logmar\logmar2.tmd
    copy logm*.blk $(sc)\logmar
    cd $(proj)

$(sa)\w\logmar.txt: logmar\logmar.dat $(tl)\lake2txt.exe newlake.mak

    echo build logmar.tmd >con
    $(tl)\lake2txt.exe -iDET1 -iDET2 -iDET3 -t- <logmar\logmar.dat >$(sa)\w\junk.txt
    copy /y $(sa)\w\junk.txt $(sa)\w\logmar.txt

#########################################################################
#
# convert lake to TIM: logmar
#

$(sc)\logmar\logmar.tim: $(sa)\logmar.cfg $(sa)\w\logmar.log \
    $(ti)\bmp2tim.exe

    cd $(sa)
    $(ti)\bmp2tim -iDET1 -iDET2 -iDET3 -cp:logmar.cfg -pw -tlogmar.tim >w\logmar.map 
    copy logmar.tim $(sc)\logmar
    cd $(proj)

$(sa)\w\logmar.log: $(sa)\w\logtex16.txt $(sa)\bit8.jsc

    start /w /m $(irdrive)\progra~1\jascim~1\irobot.exe $(sa)\bit8 /r $(sa)\w\x*.ppm /i /l $(sa)\w\logmar.log

$(sa)\w\logtex16.txt: logmar\logtex16.dat $(tt)\tex62txt.exe \
    newlake.mak

    echo create logmar.tim >con
    cd $(sa)\w
    $(tt)\tex62txt.exe -cLAND=14 -cLAND=15 -iDET1 -iDET2 -iDET3 -y1 -nx -h- -p3 <$(proj)\logmar\logtex16.dat >logtex16.txt
    cd $(proj)

#########################################################################
#
# convert lake to TMD: mead
#

$(fw)\mead.h: $(sc)\mead\mead0.tmd $(t)\structla.sno

    s -b $(t)\structla.sno ;lake(MEAD) <$(sa)\w\mead.dat >$(fw)\mead.h

$(sc)\mead\mead0.tmd: $(sa)\mead.ini $(sa)\w\mead.txt \
    $(sc)\mead\meadx.tim $(sc)\mead\watermea.tim $(tb)\buildtmd.exe \
    $(ta)\tmd2tmd.exe

    cd $(sa)
    $(tb)\buildtmd -b8 -y- -x+ -r- -m+ -imead -omead -pw \
      <w\mead.txt >w\mead.dat
    $(ta)\tmd2tmd -l+ -v+ -p+ <mead0.tmd >$(sc)\mead\mead0.tmd
    $(ta)\tmd2tmd -l+ -v+ -p+ <mead1.tmd >$(sc)\mead\mead1.tmd
    $(ta)\tmd2tmd -l+ -v+ -p+ <mead2.tmd >$(sc)\mead\mead2.tmd
    copy mead*.blk $(sc)\mead
    cd $(proj)

$(sa)\w\mead.txt: mead\mead.dat $(tl)\lake2txt.exe newlake.mak

    echo build mead.tmd >con
    $(tl)\lake2txt.exe -iDET1 -iDET2 -iDET3 -t- <mead\mead.dat >$(sa)\w\junk.txt
    copy /y $(sa)\w\junk.txt $(sa)\w\mead.txt

#########################################################################
#
# convert lake to TIM: mead
#

$(sc)\mead\meadx.tim: $(sa)\mead.cfg $(sa)\w\mead.log $(ti)\bmp2tim.exe

    cd $(sa)
    $(ti)\bmp2tim -iDET1 -iDET2 -iDET3 -cp:mead.cfg -pw -tmeadx.tim >w\mead.map 
    copy meadx.tim $(sc)\mead
    cd $(proj)

$(sa)\w\mead.log: $(sa)\w\meatex16.txt $(sa)\bit8.jsc

    start /w /m $(irdrive)\progra~1\jascim~1\irobot.exe $(sa)\bit8 /r $(sa)\w\x*.ppm /i /l $(sa)\w\mead.log

$(sa)\w\meatex16.txt: mead\meatex16.dat $(tt)\tex62txt.exe newlake.mak

     echo create meadx.tim >con
     cd $(sa)\w
     $(tt)\tex62txt.exe -cLAND=14 -cLAND=15 -iDET1 -iDET2 -iDET3 -y1 -nx -h- -p3 <$(proj)\mead\meatex16.dat >$(proj)\$(sa)\w\meatex16.txt
     cd $(proj)

#########################################################################
#
# convert lake to TMD: practice
#

$(fw)\practice.h: $(sc)\practice\practic0.tmd $(t)\structla.sno

    s -b $(t)\structla.sno ;lake(PRACTICE) <$(sa)\w\practice.dat >$(fw)\practice.h

$(sc)\practice\practic0.tmd: $(sa)\practice.ini $(sa)\w\practice.txt \
    $(sc)\practice\practice.tim $(sc)\practice\waterpra.tim $(tb)\buildtmd.exe \
    $(ta)\tmd2tmd.exe

    cd $(sa)
    $(tb)\buildtmd -b8 -y- -x+ -r- -m+ -ipractice -opractice -pw \
      <w\practice.txt >w\practice.dat
    $(ta)\tmd2tmd -l+ -v+ -p+ <practic0.tmd >$(sc)\practice\practic0.tmd
    $(ta)\tmd2tmd -l+ -v+ -p+ <practic1.tmd >$(sc)\practice\practic1.tmd
    $(ta)\tmd2tmd -l+ -v+ -p+ <practic2.tmd >$(sc)\practice\practic2.tmd
    copy prac*.blk $(sc)\practice
    cd $(proj)

$(sa)\w\practice.txt: practice\practice.dat $(tl)\lake2txt.exe newlake.mak

    echo build practice.tmd >con
    $(tl)\lake2txt.exe -iDET1 -iDET2 -iDET3 -t- <practice\practice.dat >$(sa)\w\junk.txt
    copy /y $(sa)\w\junk.txt $(sa)\w\practice.txt

#########################################################################
#
# convert lake to TIM: practice
#

$(sc)\practice\practice.tim: $(sa)\practice.cfg $(sa)\w\practice.log $(ti)\bmp2tim.exe

    cd $(sa)
    $(ti)\bmp2tim -iDET1 -iDET2 -iDET3 -cp:practice.cfg -pw -tpractice.tim >w\practice.map 
    copy practice.tim $(sc)\practice
    cd $(proj)

$(sa)\w\practice.log: $(sa)\w\pratex16.txt $(sa)\bit8.jsc

    start /w /m $(irdrive)\progra~1\jascim~1\irobot.exe $(sa)\bit8 /r $(sa)\w\p*.ppm /i /l $(sa)\w\practice.log

$(sa)\w\pratex16.txt: practice\pratex16.dat $(tt)\tex62txt.exe newlake.mak

     echo create practice.tim >con
     cd $(sa)\w
     $(tt)\tex62txt.exe -iDET1 -iDET2 -iDET3 -y1 -np -h- -p3 <$(proj)\practice\pratex16.dat >$(proj)\$(sa)\w\pratex16.txt
     cd $(proj)

#########################################################################
#
# convert lake Minn water files to TIM
#

$(fw)\spritmin.h: $(sa)\w\watermin.map $(t)\structs.sno

    s -b $(t)\structs.sno ;bits(8) multi(n) <$(sa)\w\watermin.map >$(fw)\spritmin.h

$(fw)\watermin.h: $(sa)\w\watermin.map $(t)\structp.sno

    s -b $(t)\structp.sno ;bits(8) multi(n) <$(sa)\w\watermin.map >$(fw)\watermin.h

$(sc)\minn\watermin.tim: $(sa)\watermin.cfg $(sa)\w\watermin.txt $(ti)\bmp2tim.exe

    cd $(sa)
    $(ti)\bmp2tim -iDET1 -iDET2 -iDET3 -cp:watermin.cfg -pw -twatermin.tim >w\watermin.map 
    copy watermin.tim $(sc)\minn
    cd $(proj)

$(sa)\w\watermin.txt: $(sa)\watermin.cfg newlake.mak spritesb.bat dosprite.bat \
    minn\waterc1.bmp $(t2)\bmp2txt.exe spritesn.bat sprites.bat \
    minn\treeln1.bmp minn\treeln2.bmp minn\treeln3.bmp \
    minn\treeln4.bmp minn\waterc2.bmp $(wo)\lurdummy.bmp \
    $(wo)\spla0001.ppm $(wo)\spla0002.ppm $(wo)\spla0003.ppm \
    $(wo)\spla0004.ppm $(wo)\spla0005.ppm $(wo)\spla0006.ppm \
    $(wo)\spla0007.ppm $(wo)\spla0008.ppm $(wo)\crank1.ppm \
    $(wo)\crank2.ppm $(wo)\ariel8x8.bmp $(wo)\ariel4x4.bmp \
    $(wo)\skyc1.bmp $(wo)\skyc2.bmp $(wo)\skyc3.bmp $(wo)\skyc4.bmp \
    $(wo)\ffmeter.bmp $(wo)\released.bmp $(wo)\releaseu.bmp \
    $(wo)\okd.bmp $(wo)\oku.bmp $(wo)\rsellbl.bmp $(wo)\clock.bmp \
    $(wo)\lineout.bmp $(wo)\space.bmp $(wo)\gps.bmp $(wo)\depthf.bmp \
    $(wo)\depthf.bmp $(wo)\throttle.bmp $(wo)\cursor0.bmp \
    $(wo)\dfzero.bmp $(wo)\dften.bmp $(wo)\dftwenty.bmp $(wo)\dfthirty.bmp \
    $(wo)\dffourty.bmp $(wo)\dfsixty.bmp $(wo)\redbar.bmp \
    $(wo)\greenbar.bmp $(wo)\ariel.bmp $(wo)\mb_bkg.bmp $(wo)\mb_horiz.bmp \
    $(wo)\mb_ll.bmp $(wo)\mb_lr.bmp $(wo)\mb_ul.bmp $(wo)\mb_ur.bmp \
    $(wo)\mb_vert.bmp $(wo)\castd.bmp $(wo)\casttype.bmp $(wo)\castu.bmp \
    $(wo)\clock2.bmp $(wo)\dflgf.bmp $(wo)\dfmedf.bmp $(wo)\dfsmf.bmp \
    $(wo)\digital.bmp $(wo)\drag.bmp $(wo)\flipd.bmp $(wo)\flipu.bmp \
    $(wo)\geard.bmp $(wo)\gearu.bmp $(wo)\handle.bmp $(wo)\lmapd.bmp \
    $(wo)\lmapu.bmp $(wo)\lwell1d.bmp $(wo)\lwell1u.bmp $(wo)\lwell2d.bmp \
    $(wo)\lwell2u.bmp $(wo)\lwlmb1.bmp $(wo)\nod.bmp $(wo)\nou.bmp \
    $(wo)\overd.bmp $(wo)\overu.bmp $(wo)\pitchd.bmp $(wo)\pitchu.bmp \
    $(wo)\quitd.bmp $(wo)\quitu.bmp $(wo)\saved.bmp $(wo)\saveu.bmp \
    $(wo)\sided.bmp $(wo)\sideu.bmp $(wo)\targetd.bmp $(wo)\targetu.bmp \
    $(wo)\tipsd.bmp $(wo)\tipsu.bmp $(wo)\yesd.bmp $(wo)\yesu.bmp \
    $(wo)\arrowld.bmp $(wo)\arrowlu.bmp $(wo)\arrowrd.bmp $(wo)\arrowru.bmp \
    $(wo)\lakecon.bmp $(wo)\lured.bmp $(wo)\lureu.bmp $(wo)\lureu.bmp \
    $(wo)\lwellbel.bmp $(wo)\mbline.bmp $(wo)\strike.bmp $(wo)\hourgls.bmp \
    $(wo)\returnd.bmp $(wo)\returnu.bmp $(wo)\boats.bmp $(wo)\dockd.bmp \
    $(wo)\docku.bmp $(wo)\dontfish.bmp $(wo)\gofish.bmp 

    echo creating watermin.h >con
    del $(sa)\w\watermin.txt
    dosprite $(wo) $(proj)\minn watermin

#########################################################################
#
# convert lake Mead water files to TIM
#

$(fw)\spritmea.h: $(sa)\w\watermea.map $(t)\structs.sno

    s -b $(t)\structs.sno ;bits(8) multi(n) <$(sa)\w\watermea.map >$(fw)\spritmea.h

$(fw)\watermea.h: $(sa)\w\watermea.map $(t)\structp.sno

    s -b $(t)\structp.sno ;bits(8) multi(n) <$(sa)\w\watermea.map >$(fw)\watermea.h

$(sc)\mead\watermea.tim: $(sa)\watermea.cfg $(sa)\w\watermea.txt $(ti)\bmp2tim.exe

    cd $(sa)
    $(ti)\bmp2tim -iDET1 -iDET2 -iDET3 -cp:watermea.cfg -pw -twatermea.tim >w\watermea.map 
    copy watermea.tim $(sc)\mead
    cd $(proj)

$(sa)\w\watermea.txt: $(sa)\watermea.cfg newlake.mak spritesb.bat dosprite.bat \
    mead\waterc1.bmp $(t2)\bmp2txt.exe spritesn.bat sprites.bat \
    mead\treeln1.bmp mead\treeln2.bmp mead\treeln3.bmp \
    mead\treeln4.bmp mead\waterc2.bmp $(wo)\lurdummy.bmp \
    $(wo)\spla0001.ppm $(wo)\spla0002.ppm $(wo)\spla0003.ppm \
    $(wo)\spla0004.ppm $(wo)\spla0005.ppm $(wo)\spla0006.ppm \
    $(wo)\spla0007.ppm $(wo)\spla0008.ppm $(wo)\crank1.ppm \
    $(wo)\crank2.ppm $(wo)\ariel8x8.bmp $(wo)\ariel4x4.bmp \
    $(wo)\skyc1.bmp $(wo)\skyc2.bmp $(wo)\skyc3.bmp $(wo)\skyc4.bmp \
    $(wo)\ffmeter.bmp $(wo)\released.bmp $(wo)\releaseu.bmp \
    $(wo)\okd.bmp $(wo)\oku.bmp $(wo)\rsellbl.bmp $(wo)\clock.bmp \
    $(wo)\lineout.bmp $(wo)\space.bmp $(wo)\gps.bmp $(wo)\depthf.bmp \
    $(wo)\depthf.bmp $(wo)\throttle.bmp $(wo)\cursor0.bmp \
    $(wo)\dfzero.bmp $(wo)\dften.bmp $(wo)\dftwenty.bmp $(wo)\dfthirty.bmp \
    $(wo)\dffourty.bmp $(wo)\dfsixty.bmp $(wo)\redbar.bmp \
    $(wo)\greenbar.bmp $(wo)\ariel.bmp $(wo)\mb_bkg.bmp $(wo)\mb_horiz.bmp \
    $(wo)\mb_ll.bmp $(wo)\mb_lr.bmp $(wo)\mb_ul.bmp $(wo)\mb_ur.bmp \
    $(wo)\mb_vert.bmp $(wo)\castd.bmp $(wo)\casttype.bmp $(wo)\castu.bmp \
    $(wo)\clock2.bmp $(wo)\dflgf.bmp $(wo)\dfmedf.bmp $(wo)\dfsmf.bmp \
    $(wo)\digital.bmp $(wo)\drag.bmp $(wo)\flipd.bmp $(wo)\flipu.bmp \
    $(wo)\geard.bmp $(wo)\gearu.bmp $(wo)\handle.bmp $(wo)\lmapd.bmp \
    $(wo)\lmapu.bmp $(wo)\lwell1d.bmp $(wo)\lwell1u.bmp $(wo)\lwell2d.bmp \
    $(wo)\lwell2u.bmp $(wo)\lwlmb1.bmp $(wo)\nod.bmp $(wo)\nou.bmp \
    $(wo)\overd.bmp $(wo)\overu.bmp $(wo)\pitchd.bmp $(wo)\pitchu.bmp \
    $(wo)\quitd.bmp $(wo)\quitu.bmp $(wo)\saved.bmp $(wo)\saveu.bmp \
    $(wo)\sided.bmp $(wo)\sideu.bmp $(wo)\targetd.bmp $(wo)\targetu.bmp \
    $(wo)\tipsd.bmp $(wo)\tipsu.bmp $(wo)\yesd.bmp $(wo)\yesu.bmp \
    $(wo)\arrowld.bmp $(wo)\arrowlu.bmp $(wo)\arrowrd.bmp $(wo)\arrowru.bmp \
    $(wo)\lakecon.bmp $(wo)\lured.bmp $(wo)\lureu.bmp $(wo)\lureu.bmp \
    $(wo)\lwellbel.bmp $(wo)\mbline.bmp $(wo)\strike.bmp $(wo)\hourgls.bmp \
    $(wo)\returnd.bmp $(wo)\returnu.bmp $(wo)\boats.bmp $(wo)\dockd.bmp \
    $(wo)\docku.bmp $(wo)\dontfish.bmp $(wo)\gofish.bmp 

    echo creating watermea.h >con
    del $(sa)\w\watermea.txt
    dosprite $(wo) $(proj)\mead watermea

#########################################################################
#
# convert lake Fork water files to TIM
#

$(fw)\spritfor.h: $(sa)\w\waterfor.map $(t)\structs.sno

    s -b $(t)\structs.sno ;bits(8) multi(n) <$(sa)\w\waterfor.map >$(fw)\spritfor.h

$(fw)\waterfor.h: $(sa)\w\waterfor.map $(t)\structp.sno

    s -b $(t)\structp.sno ;bits(8) multi(n) <$(sa)\w\waterfor.map >$(fw)\waterfor.h

$(sc)\fork\waterfor.tim: $(sa)\waterfor.cfg $(sa)\w\waterfor.txt $(ti)\bmp2tim.exe

    cd $(sa)
    $(ti)\bmp2tim -iDET1 -iDET2 -iDET3 -cp:waterfor.cfg -pw -twaterfor.tim >w\waterfor.map 
    copy waterfor.tim $(sc)\fork
    cd $(proj)

$(sa)\w\waterfor.txt: $(sa)\waterfor.cfg newlake.mak spritesb.bat dosprite.bat \
    fork\waterc1.bmp $(t2)\bmp2txt.exe spritesn.bat sprites.bat \
    fork\treeln1.bmp fork\treeln2.bmp fork\treeln3.bmp \
    fork\treeln4.bmp fork\waterc2.bmp $(wo)\lurdummy.bmp \
    $(wo)\spla0001.ppm $(wo)\spla0002.ppm $(wo)\spla0003.ppm \
    $(wo)\spla0004.ppm $(wo)\spla0005.ppm $(wo)\spla0006.ppm \
    $(wo)\spla0007.ppm $(wo)\spla0008.ppm $(wo)\crank1.ppm \
    $(wo)\crank2.ppm $(wo)\ariel8x8.bmp $(wo)\ariel4x4.bmp \
    $(wo)\skyc1.bmp $(wo)\skyc2.bmp $(wo)\skyc3.bmp $(wo)\skyc4.bmp \
    $(wo)\ffmeter.bmp $(wo)\released.bmp $(wo)\releaseu.bmp \
    $(wo)\okd.bmp $(wo)\oku.bmp $(wo)\rsellbl.bmp $(wo)\clock.bmp \
    $(wo)\lineout.bmp $(wo)\space.bmp $(wo)\gps.bmp $(wo)\depthf.bmp \
    $(wo)\depthf.bmp $(wo)\throttle.bmp $(wo)\cursor0.bmp \
    $(wo)\dfzero.bmp $(wo)\dften.bmp $(wo)\dftwenty.bmp $(wo)\dfthirty.bmp \
    $(wo)\dffourty.bmp $(wo)\dfsixty.bmp $(wo)\redbar.bmp \
    $(wo)\greenbar.bmp $(wo)\ariel.bmp $(wo)\mb_bkg.bmp $(wo)\mb_horiz.bmp \
    $(wo)\mb_ll.bmp $(wo)\mb_lr.bmp $(wo)\mb_ul.bmp $(wo)\mb_ur.bmp \
    $(wo)\mb_vert.bmp $(wo)\castd.bmp $(wo)\casttype.bmp $(wo)\castu.bmp \
    $(wo)\clock2.bmp $(wo)\dflgf.bmp $(wo)\dfmedf.bmp $(wo)\dfsmf.bmp \
    $(wo)\digital.bmp $(wo)\drag.bmp $(wo)\flipd.bmp $(wo)\flipu.bmp \
    $(wo)\geard.bmp $(wo)\gearu.bmp $(wo)\handle.bmp $(wo)\lmapd.bmp \
    $(wo)\lmapu.bmp $(wo)\lwell1d.bmp $(wo)\lwell1u.bmp $(wo)\lwell2d.bmp \
    $(wo)\lwell2u.bmp $(wo)\lwlmb1.bmp $(wo)\nod.bmp $(wo)\nou.bmp \
    $(wo)\overd.bmp $(wo)\overu.bmp $(wo)\pitchd.bmp $(wo)\pitchu.bmp \
    $(wo)\quitd.bmp $(wo)\quitu.bmp $(wo)\saved.bmp $(wo)\saveu.bmp \
    $(wo)\sided.bmp $(wo)\sideu.bmp $(wo)\targetd.bmp $(wo)\targetu.bmp \
    $(wo)\tipsd.bmp $(wo)\tipsu.bmp $(wo)\yesd.bmp $(wo)\yesu.bmp \
    $(wo)\arrowld.bmp $(wo)\arrowlu.bmp $(wo)\arrowrd.bmp $(wo)\arrowru.bmp \
    $(wo)\lakecon.bmp $(wo)\lured.bmp $(wo)\lureu.bmp $(wo)\lureu.bmp \
    $(wo)\lwellbel.bmp $(wo)\mbline.bmp $(wo)\strike.bmp $(wo)\hourgls.bmp \
    $(wo)\returnd.bmp $(wo)\returnu.bmp $(wo)\boats.bmp $(wo)\dockd.bmp \
    $(wo)\docku.bmp $(wo)\dontfish.bmp $(wo)\gofish.bmp 

    echo creating waterfor.h >con
    del $(sa)\w\waterfor.txt
    dosprite $(wo) $(proj)\fork waterfor

#########################################################################
#
# convert lake Logmar water files to TIM
#

$(fw)\spritlog.h: $(sa)\w\waterlog.map $(t)\structs.sno

    s -b $(t)\structs.sno ;bits(8) multi(n) <$(sa)\w\waterlog.map >$(fw)\spritlog.h

$(fw)\waterlog.h: $(sa)\w\waterlog.map $(t)\structp.sno

    s -b $(t)\structp.sno ;bits(8) multi(n) <$(sa)\w\waterlog.map >$(fw)\waterlog.h

$(sc)\logmar\waterlog.tim: $(sa)\waterlog.cfg $(sa)\w\waterlog.txt $(ti)\bmp2tim.exe

    cd $(sa)
    $(ti)\bmp2tim -iDET1 -iDET2 -iDET3 -cp:waterlog.cfg -pw -twaterlog.tim >w\waterlog.map 
    copy waterlog.tim $(sc)\logmar
    cd $(proj)

$(sa)\w\waterlog.txt: $(sa)\waterlog.cfg newlake.mak spritesb.bat dosprite.bat \
    logmar\waterc1.bmp $(t2)\bmp2txt.exe spritesn.bat sprites.bat \
    logmar\treeln1.bmp logmar\treeln2.bmp logmar\treeln3.bmp \
    logmar\treeln4.bmp logmar\waterc2.bmp $(wo)\lurdummy.bmp \
    $(wo)\spla0001.ppm $(wo)\spla0002.ppm $(wo)\spla0003.ppm \
    $(wo)\spla0004.ppm $(wo)\spla0005.ppm $(wo)\spla0006.ppm \
    $(wo)\spla0007.ppm $(wo)\spla0008.ppm $(wo)\crank1.ppm \
    $(wo)\crank2.ppm $(wo)\ariel8x8.bmp $(wo)\ariel4x4.bmp \
    $(wo)\skyc1.bmp $(wo)\skyc2.bmp $(wo)\skyc3.bmp $(wo)\skyc4.bmp \
    $(wo)\ffmeter.bmp $(wo)\released.bmp $(wo)\releaseu.bmp \
    $(wo)\okd.bmp $(wo)\oku.bmp $(wo)\rsellbl.bmp $(wo)\clock.bmp \
    $(wo)\lineout.bmp $(wo)\space.bmp $(wo)\gps.bmp $(wo)\depthf.bmp \
    $(wo)\depthf.bmp $(wo)\throttle.bmp $(wo)\cursor0.bmp \
    $(wo)\dfzero.bmp $(wo)\dften.bmp $(wo)\dftwenty.bmp $(wo)\dfthirty.bmp \
    $(wo)\dffourty.bmp $(wo)\dfsixty.bmp $(wo)\redbar.bmp \
    $(wo)\greenbar.bmp $(wo)\ariel.bmp $(wo)\mb_bkg.bmp $(wo)\mb_horiz.bmp \
    $(wo)\mb_ll.bmp $(wo)\mb_lr.bmp $(wo)\mb_ul.bmp $(wo)\mb_ur.bmp \
    $(wo)\mb_vert.bmp $(wo)\castd.bmp $(wo)\casttype.bmp $(wo)\castu.bmp \
    $(wo)\clock2.bmp $(wo)\dflgf.bmp $(wo)\dfmedf.bmp $(wo)\dfsmf.bmp \
    $(wo)\digital.bmp $(wo)\drag.bmp $(wo)\flipd.bmp $(wo)\flipu.bmp \
    $(wo)\geard.bmp $(wo)\gearu.bmp $(wo)\handle.bmp $(wo)\lmapd.bmp \
    $(wo)\lmapu.bmp $(wo)\lwell1d.bmp $(wo)\lwell1u.bmp $(wo)\lwell2d.bmp \
    $(wo)\lwell2u.bmp $(wo)\lwlmb1.bmp $(wo)\nod.bmp $(wo)\nou.bmp \
    $(wo)\overd.bmp $(wo)\overu.bmp $(wo)\pitchd.bmp $(wo)\pitchu.bmp \
    $(wo)\quitd.bmp $(wo)\quitu.bmp $(wo)\saved.bmp $(wo)\saveu.bmp \
    $(wo)\sided.bmp $(wo)\sideu.bmp $(wo)\targetd.bmp $(wo)\targetu.bmp \
    $(wo)\tipsd.bmp $(wo)\tipsu.bmp $(wo)\yesd.bmp $(wo)\yesu.bmp \
    $(wo)\arrowld.bmp $(wo)\arrowlu.bmp $(wo)\arrowrd.bmp $(wo)\arrowru.bmp \
    $(wo)\lakecon.bmp $(wo)\lured.bmp $(wo)\lureu.bmp $(wo)\lureu.bmp \
    $(wo)\lwellbel.bmp $(wo)\mbline.bmp $(wo)\strike.bmp $(wo)\hourgls.bmp \
    $(wo)\returnd.bmp $(wo)\returnu.bmp $(wo)\boats.bmp $(wo)\dockd.bmp \
    $(wo)\docku.bmp $(wo)\dontfish.bmp $(wo)\gofish.bmp 

    echo creating waterlog.h >con
    del $(sa)\w\waterlog.txt
    dosprite $(wo) $(proj)\logmar waterlog

#########################################################################
#
# convert lake Practice water files to TIM
#

$(fw)\spritpra.h: $(sa)\w\waterpra.map $(t)\structs.sno

    s -b $(t)\structs.sno ;bits(8) multi(n) <$(sa)\w\waterpra.map >$(fw)\spritpra.h

$(fw)\waterpra.h: $(sa)\w\waterpra.map $(t)\structp.sno

    s -b $(t)\structp.sno ;bits(8) multi(n) <$(sa)\w\waterpra.map >$(fw)\waterpra.h

$(sc)\practice\waterpra.tim: $(sa)\waterpra.cfg $(sa)\w\waterpra.txt $(ti)\bmp2tim.exe

    cd $(sa)
    $(ti)\bmp2tim -iDET1 -iDET2 -iDET3 -cp:waterpra.cfg -pw -twaterpra.tim >w\waterpra.map 
    copy waterpra.tim $(sc)\practice
    cd $(proj)

$(sa)\w\waterpra.txt: $(sa)\waterpra.cfg newlake.mak spritesb.bat dosprite.bat \
    practice\waterc1.bmp $(t2)\bmp2txt.exe spritesn.bat sprites.bat \
    practice\treeln1.bmp practice\treeln2.bmp practice\treeln3.bmp \
    practice\treeln4.bmp practice\waterc2.bmp $(wo)\lurdummy.bmp \
    $(wo)\spla0001.ppm $(wo)\spla0002.ppm $(wo)\spla0003.ppm \
    $(wo)\spla0004.ppm $(wo)\spla0005.ppm $(wo)\spla0006.ppm \
    $(wo)\spla0007.ppm $(wo)\spla0008.ppm $(wo)\crank1.ppm \
    $(wo)\crank2.ppm $(wo)\ariel8x8.bmp $(wo)\ariel4x4.bmp \
    $(wo)\skyc1.bmp $(wo)\skyc2.bmp $(wo)\skyc3.bmp $(wo)\skyc4.bmp \
    $(wo)\ffmeter.bmp $(wo)\released.bmp $(wo)\releaseu.bmp \
    $(wo)\okd.bmp $(wo)\oku.bmp $(wo)\rsellbl.bmp $(wo)\clock.bmp \
    $(wo)\lineout.bmp $(wo)\space.bmp $(wo)\gps.bmp $(wo)\depthf.bmp \
    $(wo)\depthf.bmp $(wo)\throttle.bmp $(wo)\cursor0.bmp \
    $(wo)\dfzero.bmp $(wo)\dften.bmp $(wo)\dftwenty.bmp $(wo)\dfthirty.bmp \
    $(wo)\dffourty.bmp $(wo)\dfsixty.bmp $(wo)\redbar.bmp \
    $(wo)\greenbar.bmp $(wo)\ariel.bmp $(wo)\mb_bkg.bmp $(wo)\mb_horiz.bmp \
    $(wo)\mb_ll.bmp $(wo)\mb_lr.bmp $(wo)\mb_ul.bmp $(wo)\mb_ur.bmp \
    $(wo)\mb_vert.bmp $(wo)\castd.bmp $(wo)\casttype.bmp $(wo)\castu.bmp \
    $(wo)\clock2.bmp $(wo)\dflgf.bmp $(wo)\dfmedf.bmp $(wo)\dfsmf.bmp \
    $(wo)\digital.bmp $(wo)\drag.bmp $(wo)\flipd.bmp $(wo)\flipu.bmp \
    $(wo)\geard.bmp $(wo)\gearu.bmp $(wo)\handle.bmp $(wo)\lmapd.bmp \
    $(wo)\lmapu.bmp $(wo)\lwell1d.bmp $(wo)\lwell1u.bmp $(wo)\lwell2d.bmp \
    $(wo)\lwell2u.bmp $(wo)\lwlmb1.bmp $(wo)\nod.bmp $(wo)\nou.bmp \
    $(wo)\overd.bmp $(wo)\overu.bmp $(wo)\pitchd.bmp $(wo)\pitchu.bmp \
    $(wo)\quitd.bmp $(wo)\quitu.bmp $(wo)\saved.bmp $(wo)\saveu.bmp \
    $(wo)\sided.bmp $(wo)\sideu.bmp $(wo)\targetd.bmp $(wo)\targetu.bmp \
    $(wo)\tipsd.bmp $(wo)\tipsu.bmp $(wo)\yesd.bmp $(wo)\yesu.bmp \
    $(wo)\arrowld.bmp $(wo)\arrowlu.bmp $(wo)\arrowrd.bmp $(wo)\arrowru.bmp \
    $(wo)\lakecon.bmp $(wo)\lured.bmp $(wo)\lureu.bmp $(wo)\lureu.bmp \
    $(wo)\lwellbel.bmp $(wo)\mbline.bmp $(wo)\strike.bmp $(wo)\hourgls.bmp \
    $(wo)\returnd.bmp $(wo)\returnu.bmp $(wo)\boats.bmp $(wo)\dockd.bmp \
    $(wo)\docku.bmp $(wo)\dontfish.bmp $(wo)\gofish.bmp 

    echo creating waterpra.h >con
    del $(sa)\w\waterpra.txt
    dosprite $(wo) $(proj)\practice waterpra

#########################################################################
#
# convert lake fork map file to TIM
#

$(fw)\mapfor.h: $(sc)\fork\mapfor.tim $(t)\structp.sno

    s -b $(t)\structp.sno ;bits(8) multi(y) <$(sa)\w\mapfor.map >$(fw)\mapfor.h

$(sc)\fork\mapfor.tim: $(sa)\mapfor.cfg $(sa)\w\mapfor.txt $(ti)\bmp2tim.exe

    cd $(sa)
    $(ti)\bmp2tim -cp:mapfor.cfg -pw -tmapfor.tim >w\mapfor.map 
    copy mapfor.tim $(sc)\fork
    cd $(proj)

$(sa)\w\mapfor.txt: $(sa)\mapfor.cfg $(proj)\fork\fork.bmp \
    $(t2)\bmp2txt.exe spritesb.bat newlake.mak

    echo create mapfor.tim >con
    del $(sa)\w\mapfor.txt
    spritesb $(proj)\fork fork XMAP mapfor 256

#########################################################################
#
# convert lake mead map file to TIM
#

$(fw)\mapmea.h: $(sc)\mead\mapmea.tim $(t)\structp.sno

    s -b $(t)\structp.sno ;bits(8) multi(y) <$(sa)\w\mapmea.map >$(fw)\mapmea.h

$(sc)\mead\mapmea.tim: $(sa)\mapmea.cfg $(sa)\w\mapmea.txt $(ti)\bmp2tim.exe

    cd $(sa)
    $(ti)\bmp2tim -cp:mapmea.cfg -pw -tmapmea.tim >w\mapmea.map 
    copy mapmea.tim $(sc)\mead
    cd $(proj)

$(sa)\w\mapmea.txt: $(sa)\mapmea.cfg $(proj)\mead\mead.bmp \
    $(t2)\bmp2txt.exe spritesb.bat newlake.mak

    echo create mapmea.tim >con
    del $(sa)\w\mapmea.txt
    spritesb $(proj)\mead mead XMAP mapmea 256

#########################################################################
#
# convert lake minn map file to TIM
#

$(fw)\mapmin.h: $(sc)\minn\mapmin.tim $(t)\structp.sno

    s -b $(t)\structp.sno ;bits(8) multi(y) <$(sa)\w\mapmin.map >$(fw)\mapmin.h

$(sc)\minn\mapmin.tim: $(sa)\mapmin.cfg $(sa)\w\mapmin.txt $(ti)\bmp2tim.exe

    cd $(sa)
    $(ti)\bmp2tim -cp:mapmin.cfg -pw -tmapmin.tim >w\mapmin.map 
    copy mapmin.tim $(sc)\minn
    cd $(proj)

$(sa)\w\mapmin.txt: $(sa)\mapmin.cfg $(proj)\minn\minn.bmp \
    $(t2)\bmp2txt.exe spritesb.bat newlake.mak

    echo create mapmin.tim >con
    del $(sa)\w\mapmin.txt
    spritesb $(proj)\minn minn XMAP mapmin 256

#########################################################################
#
# convert lake logmar map file to TIM
#

$(fw)\maplog.h: $(sc)\logmar\maplog.tim $(t)\structp.sno

    s -b $(t)\structp.sno ;bits(8) multi(y) <$(sa)\w\maplog.map >$(fw)\maplog.h

$(sc)\logmar\maplog.tim: $(sa)\maplog.cfg $(sa)\w\maplog.txt $(ti)\bmp2tim.exe

    cd $(sa)
    $(ti)\bmp2tim -cp:maplog.cfg -pw -tmaplog.tim >w\maplog.map 
    copy maplog.tim $(sc)\logmar
    cd $(proj)

$(sa)\w\maplog.txt: $(sa)\maplog.cfg $(proj)\logmar\logmar.bmp \
    $(t2)\bmp2txt.exe spritesb.bat newlake.mak

    echo create maplog.tim >con
    del $(sa)\w\maplog.txt
    spritesb $(proj)\logmar logmar XMAP maplog 256

#########################################################################
#
# convert lake Practice map file to TIM
#

$(fw)\mappra.h: $(sc)\practice\mappra.tim $(t)\structp.sno

    s -b $(t)\structp.sno ;bits(8) multi(y) <$(sa)\w\mappra.map >$(fw)\mappra.h

$(sc)\practice\mappra.tim: $(sa)\mappra.cfg $(sa)\w\mappra.txt $(ti)\bmp2tim.exe

    cd $(sa)
    $(ti)\bmp2tim -cp:mappra.cfg -pw -tmappra.tim >w\mappra.map 
    copy mappra.tim $(sc)\practice
    cd $(proj)

$(sa)\w\mappra.txt: $(sa)\mappra.cfg $(proj)\practice\practice.bmp \
    $(t2)\bmp2txt.exe spritesb.bat newlake.mak

    echo create mappra.tim >con
    del $(sa)\w\mappra.txt
    spritesb $(proj)\practice practice XMAP mappra 16

#########################################################################
#
# convert loading image to TIM
#

$(fw)\loading.h: $(sa)\w\loading.map $(t)\structp.sno

    s -b $(t)\structp.sno ;bits(8) multi(y) <$(sa)\w\loading.map >$(fw)\loading.h

$(sa)\w\loading.map: $(sa)\loading.cfg $(sa)\w\loading.txt $(ti)\bmp2tim.exe

    cd $(sa)
    $(ti)\bmp2tim -cp:loading.cfg -pw -tloading.tim >w\loading.map 
    copy loading.tim $(sc)\art
    cd $(proj)

$(sa)\w\loading.txt: $(sa)\loading.cfg  \
    $(t2)\bmp2txt.exe spritesb.bat newlake.mak

    echo create loading.h >con
    del $(sa)\w\loading.txt
    spritesb $(wo) loading LOAD loading
#    spritesb $(wo) reel1   LOAD loading
#    spritesb $(wo) reel2   LOAD loading
#    spritesb $(wo) reel3   LOAD loading
#    spritesb $(wo) reel4   LOAD loading
#    spritesb $(wo) reel5   LOAD loading
#    spritesb $(wo) reel6   LOAD loading
#    spritesb $(wo) reel7   LOAD loading
#    spritesb $(wo) reel8   LOAD loading

#########################################################################
#
# process special blk files
#

livewell.ok: $(sc)\livewell\lwlmb3.ppm $(sc)\livewell\lwsmb3.ppm \
    $(sc)\livewell\lwspb3.ppm $(sc)\livewell\lwwal.ppm \
    $(sc)\livewell\lwntp.ppm $(sc)\livewell\lwrbt.ppm \
    $(sc)\livewell\lwlkt.ppm $(sc)\livewell\lwchc.ppm \
    $(sc)\livewell\lwwhb.ppm $(sc)\livewell\lwcra.ppm \
    $(sc)\livewell\lwblg.ppm $(sc)\livewell\lwgsf.ppm \
    $(sc)\livewell\lwres.ppm $(sc)\livewell\lwper.ppm 

    echo hi >livewell.ok

$(sc)\livewell\lwlmb3.ppm: $(wa)\lwlmb3.bmp $(tk)\bmp2blk.exe

    $(tk)\bmp2blk -i$(wa)\lwlmb3.bmp -o$(sc)\livewell\lwlmb3.ppm


$(sc)\livewell\lwsmb3.ppm: $(wa)\lwsmb3.bmp $(tk)\bmp2blk.exe

    $(tk)\bmp2blk -i$(wa)\lwsmb3.bmp -o$(sc)\livewell\lwsmb3.ppm


$(sc)\livewell\lwspb3.ppm: $(wa)\lwspb3.bmp $(tk)\bmp2blk.exe

    $(tk)\bmp2blk -i$(wa)\lwspb3.bmp -o$(sc)\livewell\lwspb3.ppm


$(sc)\livewell\lwwal.ppm: $(wa)\lwwal.bmp $(tk)\bmp2blk.exe

    $(tk)\bmp2blk -i$(wa)\lwwal.bmp -o$(sc)\livewell\lwwal.ppm


$(sc)\livewell\lwntp.ppm: $(wa)\lwntp.bmp $(tk)\bmp2blk.exe

    $(tk)\bmp2blk -i$(wa)\lwntp.bmp -o$(sc)\livewell\lwntp.ppm


$(sc)\livewell\lwrbt.ppm: $(wa)\lwrbt.bmp $(tk)\bmp2blk.exe

    $(tk)\bmp2blk -i$(wa)\lwrbt.bmp -o$(sc)\livewell\lwrbt.ppm


$(sc)\livewell\lwlkt.ppm: $(wa)\lwlkt.bmp $(tk)\bmp2blk.exe

    $(tk)\bmp2blk -i$(wa)\lwlkt.bmp -o$(sc)\livewell\lwlkt.ppm


$(sc)\livewell\lwchc.ppm: $(wa)\lwchc.bmp $(tk)\bmp2blk.exe

    $(tk)\bmp2blk -i$(wa)\lwchc.bmp -o$(sc)\livewell\lwchc.ppm


$(sc)\livewell\lwwhb.ppm: $(wa)\lwwhb.bmp $(tk)\bmp2blk.exe

    $(tk)\bmp2blk -i$(wa)\lwwhb.bmp -o$(sc)\livewell\lwwhb.ppm


$(sc)\livewell\lwcra.ppm: $(wa)\lwcra.bmp $(tk)\bmp2blk.exe

    $(tk)\bmp2blk -i$(wa)\lwcra.bmp -o$(sc)\livewell\lwcra.ppm


$(sc)\livewell\lwblg.ppm: $(wa)\lwblg.bmp $(tk)\bmp2blk.exe

    $(tk)\bmp2blk -i$(wa)\lwblg.bmp -o$(sc)\livewell\lwblg.ppm


$(sc)\livewell\lwgsf.ppm: $(wa)\lwgsf.bmp $(tk)\bmp2blk.exe

    $(tk)\bmp2blk -i$(wa)\lwgsf.bmp -o$(sc)\livewell\lwgsf.ppm


$(sc)\livewell\lwres.ppm: $(wa)\lwres.bmp $(tk)\bmp2blk.exe

    $(tk)\bmp2blk -i$(wa)\lwres.bmp -o$(sc)\livewell\lwres.ppm


$(sc)\livewell\lwper.ppm: $(wa)\lwper.bmp $(tk)\bmp2blk.exe

    $(tk)\bmp2blk -i$(wa)\lwper.bmp -o$(sc)\livewell\lwper.ppm


water2.ok: $(sc)\practice\waterc2.ppm $(sc)\practice\waterm2.ppm \
    $(sc)\practice\waters2.ppm $(sc)\fork\waterc2.ppm \
    $(sc)\fork\waterm2.ppm $(sc)\fork\waters2.ppm \
    $(sc)\logmar\waterc2.ppm $(sc)\logmar\waterm2.ppm \
    $(sc)\logmar\waters2.ppm $(sc)\mead\waterc2.ppm \
    $(sc)\mead\waterm2.ppm $(sc)\mead\waters2.ppm \
    $(sc)\minn\waterc2.ppm $(sc)\minn\waterm2.ppm $(sc)\minn\waters2.ppm 

    echo hi >water2.ok

$(sc)\practice\waterc2.ppm: practice\waterc2.bmp $(tk)\bmp2blk.exe

    $(tk)\bmp2blk -ipractice\waterc2.bmp -o$(sc)\practice\waterc2.ppm

 
$(sc)\practice\waterm2.ppm: practice\waterm2.bmp $(tk)\bmp2blk.exe

    $(tk)\bmp2blk -ipractice\waterm2.bmp -o$(sc)\practice\waterm2.ppm

 
$(sc)\practice\waters2.ppm: practice\waters2.bmp $(tk)\bmp2blk.exe

    $(tk)\bmp2blk -ipractice\waters2.bmp -o$(sc)\practice\waters2.ppm

 
$(sc)\fork\waterc2.ppm: fork\waterc2.bmp $(tk)\bmp2blk.exe

    $(tk)\bmp2blk -ifork\waterc2.bmp -o$(sc)\fork\waterc2.ppm

 
$(sc)\fork\waterm2.ppm: fork\waterm2.bmp $(tk)\bmp2blk.exe

    $(tk)\bmp2blk -ifork\waterm2.bmp -o$(sc)\fork\waterm2.ppm

 
$(sc)\fork\waters2.ppm: fork\waters2.bmp $(tk)\bmp2blk.exe

    $(tk)\bmp2blk -ifork\waters2.bmp -o$(sc)\fork\waters2.ppm

 
$(sc)\logmar\waterc2.ppm: logmar\waterc2.bmp $(tk)\bmp2blk.exe

    $(tk)\bmp2blk -ilogmar\waterc2.bmp -o$(sc)\logmar\waterc2.ppm

 
$(sc)\logmar\waterm2.ppm: logmar\waterm2.bmp $(tk)\bmp2blk.exe

    $(tk)\bmp2blk -ilogmar\waterm2.bmp -o$(sc)\logmar\waterm2.ppm

 
$(sc)\logmar\waters2.ppm: logmar\waters2.bmp $(tk)\bmp2blk.exe

    $(tk)\bmp2blk -ilogmar\waters2.bmp -o$(sc)\logmar\waters2.ppm

 
$(sc)\mead\waterc2.ppm: mead\waterc2.bmp $(tk)\bmp2blk.exe

    $(tk)\bmp2blk -imead\waterc2.bmp -o$(sc)\mead\waterc2.ppm

 
$(sc)\mead\waterm2.ppm: mead\waterm2.bmp $(tk)\bmp2blk.exe

    $(tk)\bmp2blk -imead\waterm2.bmp -o$(sc)\mead\waterm2.ppm

 
$(sc)\mead\waters2.ppm: mead\waters2.bmp $(tk)\bmp2blk.exe

    $(tk)\bmp2blk -imead\waters2.bmp -o$(sc)\mead\waters2.ppm

 
$(sc)\minn\waterc2.ppm: minn\waterc2.bmp $(tk)\bmp2blk.exe

    $(tk)\bmp2blk -iminn\waterc2.bmp -o$(sc)\minn\waterc2.ppm

 
$(sc)\minn\waterm2.ppm: minn\waterm2.bmp $(tk)\bmp2blk.exe

    $(tk)\bmp2blk -iminn\waterm2.bmp -o$(sc)\minn\waterm2.ppm

 
$(sc)\minn\waters2.ppm: minn\waters2.bmp $(tk)\bmp2blk.exe

    $(tk)\bmp2blk -iminn\waters2.bmp -o$(sc)\minn\waters2.ppm

water1.ok: $(sc)\practice\waterc1.ppm $(sc)\practice\waterm1.ppm \
    $(sc)\practice\waters1.ppm $(sc)\fork\waterc1.ppm \
    $(sc)\fork\waterm1.ppm $(sc)\fork\waters1.ppm \
    $(sc)\logmar\waterc1.ppm $(sc)\logmar\waterm1.ppm \
    $(sc)\logmar\waters1.ppm $(sc)\mead\waterc1.ppm \
    $(sc)\mead\waterm1.ppm $(sc)\mead\waters1.ppm \
    $(sc)\minn\waterc1.ppm $(sc)\minn\waterm1.ppm $(sc)\minn\waters1.ppm 

    echo hi >water1.ok

$(sc)\practice\waterc1.ppm: practice\waterc1.bmp $(tk)\bmp2blk.exe

    $(tk)\bmp2blk -ipractice\waterc1.bmp -o$(sc)\practice\waterc1.ppm

 
$(sc)\practice\waterm1.ppm: practice\waterm1.bmp $(tk)\bmp2blk.exe

    $(tk)\bmp2blk -ipractice\waterm1.bmp -o$(sc)\practice\waterm1.ppm

 
$(sc)\practice\waters1.ppm: practice\waters1.bmp $(tk)\bmp2blk.exe

    $(tk)\bmp2blk -ipractice\waters1.bmp -o$(sc)\practice\waters1.ppm

 
$(sc)\fork\waterc1.ppm: fork\waterc1.bmp $(tk)\bmp2blk.exe

    $(tk)\bmp2blk -ifork\waterc1.bmp -o$(sc)\fork\waterc1.ppm

 
$(sc)\fork\waterm1.ppm: fork\waterm1.bmp $(tk)\bmp2blk.exe

    $(tk)\bmp2blk -ifork\waterm1.bmp -o$(sc)\fork\waterm1.ppm

 
$(sc)\fork\waters1.ppm: fork\waters1.bmp $(tk)\bmp2blk.exe

    $(tk)\bmp2blk -ifork\waters1.bmp -o$(sc)\fork\waters1.ppm

 
$(sc)\logmar\waterc1.ppm: logmar\waterc1.bmp $(tk)\bmp2blk.exe

    $(tk)\bmp2blk -ilogmar\waterc1.bmp -o$(sc)\logmar\waterc1.ppm

 
$(sc)\logmar\waterm1.ppm: logmar\waterm1.bmp $(tk)\bmp2blk.exe

    $(tk)\bmp2blk -ilogmar\waterm1.bmp -o$(sc)\logmar\waterm1.ppm

 
$(sc)\logmar\waters1.ppm: logmar\waters1.bmp $(tk)\bmp2blk.exe

    $(tk)\bmp2blk -ilogmar\waters1.bmp -o$(sc)\logmar\waters1.ppm

 
$(sc)\mead\waterc1.ppm: mead\waterc1.bmp $(tk)\bmp2blk.exe

    $(tk)\bmp2blk -imead\waterc1.bmp -o$(sc)\mead\waterc1.ppm

 
$(sc)\mead\waterm1.ppm: mead\waterm1.bmp $(tk)\bmp2blk.exe

    $(tk)\bmp2blk -imead\waterm1.bmp -o$(sc)\mead\waterm1.ppm

 
$(sc)\mead\waters1.ppm: mead\waters1.bmp $(tk)\bmp2blk.exe

    $(tk)\bmp2blk -imead\waters1.bmp -o$(sc)\mead\waters1.ppm

 
$(sc)\minn\waterc1.ppm: minn\waterc1.bmp $(tk)\bmp2blk.exe

    $(tk)\bmp2blk -iminn\waterc1.bmp -o$(sc)\minn\waterc1.ppm

 
$(sc)\minn\waterm1.ppm: minn\waterm1.bmp $(tk)\bmp2blk.exe

    $(tk)\bmp2blk -iminn\waterm1.bmp -o$(sc)\minn\waterm1.ppm

 
$(sc)\minn\waters1.ppm: minn\waters1.bmp $(tk)\bmp2blk.exe

    $(tk)\bmp2blk -iminn\waters1.bmp -o$(sc)\minn\waters1.ppm

########################################################################
#
# process menu art
#

$(fw)\scrndefs.h: $(t)\menu.sno $(fw)\menufncs.h $(sa)\menu.txt \
    $(sm)\gamesel.tim $(sm)\careers.tim $(sm)\careinfo.tim \
    $(sm)\gameplay.tim $(sm)\lakesel.tim $(sm)\options.tim \
    $(sm)\EntrName.tim $(sm)\memcard.tim $(sm)\keyconf.tim \
    $(sm)\LKCond.tim $(sm)\equSetup.tim $(sm)\leaderB.tim

    echo build menu data files >con
    s -b $(t)\menu.sno <$(sa)\menu.txt

########################################################################
#
# process menu art: Game Select Screen
#

$(sm)\gamesel.tim: $(sm)\gamesel.txt $(sa)\menu.cfg $(ti)\bmp2tim.exe

    echo build gamesel.tim file >con
    cd $(sm)
    copy gamesel.txt menu.txt
    $(ti)\bmp2tim -c..\menu.cfg -tgamesel.tim >gamesel.map
    cd $(proj)

########################################################################
#
# process menu art: Options Screen
#

$(sm)\options.tim: $(sm)\options.txt $(sa)\menu.cfg $(ti)\bmp2tim.exe

    echo build options.tim file >con
    cd $(sm)
    copy options.txt menu.txt
    $(ti)\bmp2tim -c..\menu.cfg -toptions.tim >options.map
    cd $(proj)

########################################################################
#
# process menu art: Key Config Screen
#

$(sm)\keyconf.tim: $(sm)\keyconf.txt $(sa)\menu.cfg $(ti)\bmp2tim.exe

    echo build keyconf.tim file >con
    cd $(sm)
    copy keyconf.txt menu.txt
    $(ti)\bmp2tim -c..\menu.cfg -tkeyconf.tim >keyconf.map
    cd $(proj)

########################################################################
#
# process menu art: Memory Card Screen
#

$(sm)\memcard.tim: $(sm)\memcard.txt $(sa)\menu.cfg $(ti)\bmp2tim.exe

    echo build memcard.tim file >con
    cd $(sm)
    copy memcard.txt menu.txt
    $(ti)\bmp2tim -c..\menu.cfg -tmemcard.tim >memcard.map
    cd $(proj)

########################################################################
#
# process menu art: Careers Screen
#

$(sm)\careers.tim: $(sm)\careers.txt $(sa)\menu.cfg $(ti)\bmp2tim.exe

    echo build careers tim file >con
    cd $(sm)
    copy careers.txt menu.txt
    $(ti)\bmp2tim -c..\menu.cfg -tcareers.tim >careers.map
    cd $(proj)

########################################################################
#
# process menu art: EnterName Screen
#

$(sm)\EntrName.tim: $(sm)\EntrName.txt $(sa)\menu.cfg $(ti)\bmp2tim.exe

    echo build EntrName tim file >con
    cd $(sm)
    copy EntrName.txt menu.txt
    $(ti)\bmp2tim -c..\menu.cfg -tEntrName.tim >EntrName.map
    cd $(proj)

########################################################################
#
# process menu art: Career Info
#

$(sm)\careinfo.tim: $(sm)\careinfo.txt $(sa)\menu.cfg $(ti)\bmp2tim.exe

    echo build careinfo tim file >con
    cd $(sm)
    copy careinfo.txt menu.txt
    $(ti)\bmp2tim -c..\menu.cfg -tcareinfo.tim >careinfo.map
    cd $(proj)

########################################################################
#
# process menu art: Game Play
#

$(sm)\gameplay.tim: $(sm)\gameplay.txt $(sa)\menu.cfg $(ti)\bmp2tim.exe

    echo build gameplay tim file >con
    cd $(sm)
    copy gameplay.txt menu.txt
    $(ti)\bmp2tim -c..\menu.cfg -tgameplay.tim >gameplay.map
    cd $(proj)

########################################################################
#
# process menu art: Lake Select Screen
#

$(sm)\lakesel.tim: $(sm)\lakesel.txt $(sa)\menu.cfg $(ti)\bmp2tim.exe

    echo build lakesel.tim file >con
    cd $(sm)
    copy lakesel.txt menu.txt
    $(ti)\bmp2tim -c..\menu.cfg -tlakesel.tim >lakesel.map
    cd $(proj)

########################################################################
#
# process menu art: Lake conditions Screen
#

$(sm)\LKCond.tim: $(sm)\LKCond.txt $(sa)\menu.cfg $(ti)\bmp2tim.exe

    echo build LKCond.tim file >con
    cd $(sm)
    copy LKCond.txt menu.txt
    $(ti)\bmp2tim -c..\menu.cfg -tLKCond.tim >LKCond.map
    cd $(proj)

########################################################################
#
# process menu art: Equipment Setup Screen
#

$(sm)\equSetup.tim: $(sm)\equSetup.txt $(sa)\menu.cfg $(ti)\bmp2tim.exe

    echo build equSetup.tim file >con
    cd $(sm)
    copy equSetup.txt menu.txt
    $(ti)\bmp2tim -c..\menu.cfg -tequSetup.tim >equSetup.map
    cd $(proj)

########################################################################
#
# process menu art: Leader Board
#

$(sm)\leaderB.tim: $(sm)\leaderB.txt $(sa)\menu.cfg $(ti)\bmp2tim.exe

    echo build leaderB.tim file >con
    cd $(sm)
    copy leaderB.txt menu.txt
    $(ti)\bmp2tim -c..\menu.cfg -tleaderB.tim >leaderB.map
    cd $(proj)

########################################################################
#
# process menu art: Process Menu Screens
#

$(sm)\gamesel.txt: $(sm)\menubmp.txt $(t)\menutim.sno $(sa)\menu.txt

    echo build the tim txt control files >con
    s -b $(t)\menutim.sno ;bmptxt($(sm)\menubmp.txt) <$(sa)\menu.txt

$(sm)\menubmp.txt:  menubmp.bat $(wm)\goldfont.bmp \
    $(wm)\GameSel.bmp $(wm)\optionDN.bmp $(wm)\strgamDN.bmp \
    $(wm)\careers.bmp $(wm)\fieldbut.bmp $(wm)\career~1.bmp \
    $(wm)\GamePlay.bmp $(wm)\amatDN.bmp $(wm)\archDN.bmp \
    $(wm)\pracDN.bmp $(wm)\proDN.bmp $(wm)\SelectLk.bmp \
    $(wm)\Forko.bmp $(wm)\MINNEo.bmp $(wm)\Meado.bmp $(wm)\LKCond.bmp \
    $(wm)\AirTempO.bmp $(wm)\sonyALT.bmp $(wm)\TimeO.bmp $(wm)\WaterO.bmp \
    $(wm)\WatTmpO.bmp $(wm)\WeatherO.bmp $(wm)\WindO.bmp $(wm)\options.bmp \
    $(wm)\Audio.bmp $(wm)\Diff.bmp $(wm)\Easy.bmp $(wm)\Expert.bmp \
    $(wm)\Memcardo.bmp $(wm)\Musicvol.bmp $(wm)\SlidBut.bmp \
    $(wm)\Sndfx.bmp $(wm)\Stereo.bmp $(wm)\EntrName.bmp $(wm)\texnameo.bmp \
    $(wm)\equSetup.bmp $(wm)\BladColD.bmp $(wm)\BladcolO.bmp \
    $(wm)\BladtypD.bmp $(wm)\BladtypO.bmp $(wm)\LineO.bmp $(wm)\LurcolrO.bmp \
    $(wm)\LurTypeO.bmp $(wm)\RatleD.bmp $(wm)\RatleO.bmp $(wm)\RodactO.bmp \
    $(wm)\RodnumO.bmp $(wm)\RodtypeO.bmp $(wm)\SizeO.bmp $(wm)\SubtypeO.bmp \
    $(wm)\TrailD.bmp $(wm)\TrailO.bmp $(wm)\Keyconf.bmp $(wm)\config1.bmp \
    $(wm)\config2.bmp $(wm)\config3.bmp $(wm)\Castcont.bmp \
    $(wm)\Dragcast.bmp $(wm)\Gear.bmp $(wm)\Livewell.bmp $(wm)\Map.bmp \
    $(wm)\Tips.bmp $(wm)\Memcard.bmp $(wm)\Load.bmp $(wm)\Delete.bmp \
    $(wm)\Save.bmp $(wm)\KeyconfO.bmp $(wm)\FORKbut.bmp $(wm)\FontBut.bmp \
    $(wm)\MINNbut.bmp $(wm)\MEADbut.bmp $(wm)\lurepic.bmp

    echo copy menu bmp files >con
    del $(sm)\menubmp.txt
    rem GAMESELECT
    menubmp 1 1 $(wm)\GameSel.bmp $(sm)\GameSel.bmp $(sm)\menubmp.txt
    menubmp 1 1 $(wm)\optionDN.bmp $(sm)\optionDN.bmp $(sm)\menubmp.txt
    menubmp 1 1 $(wm)\strgamDN.bmp $(sm)\strgamDN.bmp $(sm)\menubmp.txt
    menubmp 1 1 $(wm)\goldfont.bmp $(sm)\goldfont.bmp $(sm)\menubmp.txt
    rem CAREERS
    menubmp 1 1 $(wm)\careers.bmp $(sm)\careers.bmp $(sm)\menubmp.txt
    menubmp 1 1 $(wm)\fieldbut.bmp $(sm)\fieldbut.bmp $(sm)\menubmp.txt
    rem CAREERINFO
    menubmp 1 1 $(wm)\Career_info.bmp $(sm)\careinfo.bmp $(sm)\menubmp.txt
    rem GAMEPLAY
    menubmp 1 1 $(wm)\GamePlay.bmp $(sm)\GamePlay.bmp $(sm)\menubmp.txt
    menubmp 1 1 $(wm)\amatDN.bmp $(sm)\amatDN.bmp $(sm)\menubmp.txt
    menubmp 1 1 $(wm)\archDN.bmp $(sm)\archDN.bmp $(sm)\menubmp.txt
    menubmp 1 1 $(wm)\pracDN.bmp $(sm)\pracDN.bmp $(sm)\menubmp.txt
    menubmp 1 1 $(wm)\proDN.bmp $(sm)\proDN.bmp $(sm)\menubmp.txt
    rem LAKESELECT
    menubmp 1 1 $(wm)\SelectLk.bmp $(sm)\SelectLk.bmp $(sm)\menubmp.txt
    menubmp 1 1 $(wm)\Forko.bmp $(sm)\Forko.bmp $(sm)\menubmp.txt
    menubmp 1 1 $(wm)\MINNEo.bmp $(sm)\MINNEo.bmp $(sm)\menubmp.txt
    menubmp 1 1 $(wm)\Meado.bmp $(sm)\Meado.bmp $(sm)\menubmp.txt
    menubmp 1 1 $(wm)\FORKbut.bmp $(sm)\FORKbut.bmp $(sm)\menubmp.txt
    menubmp 1 1 $(wm)\MEADbut.bmp $(sm)\MEADbut.bmp $(sm)\menubmp.txt
    menubmp 1 1 $(wm)\MINNbut.bmp $(sm)\MINNbut.bmp $(sm)\menubmp.txt
    rem LAKECONDITIONS
    menubmp 1 1 $(wm)\LKCond.bmp $(sm)\LKCond.bmp $(sm)\menubmp.txt
    menubmp 1 1 $(wm)\AirTempO.bmp $(sm)\AirTempO.bmp $(sm)\menubmp.txt
    menubmp 1 1 $(wm)\sonyALT.bmp $(sm)\sonyALT.bmp $(sm)\menubmp.txt
    menubmp 1 1 $(wm)\TimeO.bmp $(sm)\TimeO.bmp $(sm)\menubmp.txt
    menubmp 1 1 $(wm)\WaterO.bmp $(sm)\WaterO.bmp $(sm)\menubmp.txt
    menubmp 1 1 $(wm)\WatTmpO.bmp $(sm)\WatTmpO.bmp $(sm)\menubmp.txt
    menubmp 1 1 $(wm)\WeatherO.bmp $(sm)\WeatherO.bmp $(sm)\menubmp.txt
    menubmp 1 1 $(wm)\WindO.bmp $(sm)\WindO.bmp $(sm)\menubmp.txt
    rem OPTIONS
    menubmp 1 1 $(wm)\options.bmp $(sm)\options.bmp $(sm)\menubmp.txt
    menubmp 1 1 $(wm)\Audio.bmp $(sm)\Audio.bmp $(sm)\menubmp.txt
    menubmp 1 1 $(wm)\Diff.bmp $(sm)\Diff.bmp $(sm)\menubmp.txt
    menubmp 1 1 $(wm)\Easy.bmp $(sm)\Easy.bmp $(sm)\menubmp.txt
    menubmp 1 1 $(wm)\Expert.bmp $(sm)\Expert.bmp $(sm)\menubmp.txt
    menubmp 1 1 $(wm)\Memcardo.bmp $(sm)\Memcardo.bmp $(sm)\menubmp.txt
    menubmp 1 1 $(wm)\Musicvol.bmp $(sm)\Musicvol.bmp $(sm)\menubmp.txt
    menubmp 1 1 $(wm)\SlidBut.bmp $(sm)\SlidBut.bmp $(sm)\menubmp.txt
    menubmp 1 1 $(wm)\Sndfx.bmp $(sm)\Sndfx.bmp $(sm)\menubmp.txt
    menubmp 1 1 $(wm)\Stereo.bmp $(sm)\Stereo.bmp $(sm)\menubmp.txt
    menubmp 1 1 $(wm)\KeyconfO.bmp $(sm)\KeyconfO.bmp $(sm)\menubmp.txt
    rem ENTERNAME
    menubmp 1 1 $(wm)\EntrName.bmp $(sm)\EntrName.bmp $(sm)\menubmp.txt
    menubmp 1 1 $(wm)\texnameo.bmp $(sm)\texnameo.bmp $(sm)\menubmp.txt
    menubmp 1 1 $(wm)\select.bmp $(sm)\select.bmp $(sm)\menubmp.txt
    rem EQUIPMENT
    menubmp 1 1 $(wm)\equSetup.bmp $(sm)\equSetup.bmp $(sm)\menubmp.txt
    menubmp 1 1 $(wm)\BladColD.bmp $(sm)\BladColD.bmp $(sm)\menubmp.txt
    menubmp 1 1 $(wm)\BladcolO.bmp $(sm)\BladcolO.bmp $(sm)\menubmp.txt
    menubmp 1 1 $(wm)\BladtypD.bmp $(sm)\BladtypD.bmp $(sm)\menubmp.txt
    menubmp 1 1 $(wm)\BladtypO.bmp $(sm)\BladtypO.bmp $(sm)\menubmp.txt
    menubmp 1 1 $(wm)\LineO.bmp $(sm)\LineO.bmp $(sm)\menubmp.txt
    menubmp 1 1 $(wm)\LurcolrO.bmp $(sm)\LurcolrO.bmp $(sm)\menubmp.txt
    menubmp 1 1 $(wm)\LurTypeO.bmp $(sm)\LurTypeO.bmp $(sm)\menubmp.txt
    menubmp 1 1 $(wm)\RatleD.bmp $(sm)\RatleD.bmp $(sm)\menubmp.txt
    menubmp 1 1 $(wm)\RatleO.bmp $(sm)\RatleO.bmp $(sm)\menubmp.txt
    menubmp 1 1 $(wm)\RigD.bmp $(sm)\RigD.bmp $(sm)\menubmp.txt
    menubmp 1 1 $(wm)\RigO.bmp $(sm)\RigO.bmp $(sm)\menubmp.txt
    menubmp 1 1 $(wm)\RodactO.bmp $(sm)\RodactO.bmp $(sm)\menubmp.txt
    menubmp 1 1 $(wm)\RodnumO.bmp $(sm)\RodnumO.bmp $(sm)\menubmp.txt
    menubmp 1 1 $(wm)\RodtypeO.bmp $(sm)\RodtypeO.bmp $(sm)\menubmp.txt
    menubmp 1 1 $(wm)\SizeO.bmp $(sm)\SizeO.bmp $(sm)\menubmp.txt
    menubmp 1 1 $(wm)\SubtypeO.bmp $(sm)\SubtypeO.bmp $(sm)\menubmp.txt
    menubmp 1 1 $(wm)\TrailD.bmp $(sm)\TrailD.bmp $(sm)\menubmp.txt
    menubmp 1 1 $(wm)\TrailO.bmp $(sm)\TrailO.bmp $(sm)\menubmp.txt
    menubmp 1 1 $(wm)\lurepic.bmp $(sm)\lurepic.bmp $(sm)\menubmp.txt
    rem KEYCONFIG
    menubmp 1 1 $(wm)\Keyconf.bmp $(sm)\Keyconf.bmp $(sm)\menubmp.txt
    menubmp 1 1 $(wm)\config1.bmp $(sm)\config1.bmp $(sm)\menubmp.txt
    menubmp 1 1 $(wm)\config2.bmp $(sm)\config2.bmp $(sm)\menubmp.txt
    menubmp 1 1 $(wm)\config3.bmp $(sm)\config3.bmp $(sm)\menubmp.txt
    menubmp 1 1 $(wm)\Castcont.bmp $(sm)\Castcont.bmp $(sm)\menubmp.txt
    menubmp 1 1 $(wm)\Dragcast.bmp $(sm)\Dragcast.bmp $(sm)\menubmp.txt
    menubmp 1 1 $(wm)\Gear.bmp $(sm)\Gear.bmp $(sm)\menubmp.txt
    menubmp 1 1 $(wm)\Livewell.bmp $(sm)\Livewell.bmp $(sm)\menubmp.txt
    menubmp 1 1 $(wm)\Map.bmp $(sm)\Map.bmp $(sm)\menubmp.txt
    menubmp 1 1 $(wm)\Tips.bmp $(sm)\Tips.bmp $(sm)\menubmp.txt
    rem MEMORYCARD
    menubmp 1 1 $(wm)\Memcard.bmp $(sm)\Memcard.bmp $(sm)\menubmp.txt
    menubmp 1 1 $(wm)\Load.bmp $(sm)\Load.bmp $(sm)\menubmp.txt
    menubmp 1 1 $(wm)\Delete.bmp $(sm)\Delete.bmp $(sm)\menubmp.txt
    menubmp 1 1 $(wm)\Save.bmp $(sm)\Save.bmp $(sm)\menubmp.txt
    rem LEADERBOARD
    menubmp 1 1 $(wm)\leaderB.bmp $(sm)\LeaderB.bmp $(sm)\menubmp.txt

!endif
