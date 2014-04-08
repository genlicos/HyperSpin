This is a short document explaining differences between Test 12/5 and previous versions.

Before you run Makaron make sure you have these installed:
 - Microsoft Visual C++ 2008 SP1 Redistributable Package (x86)
http://www.microsoft.com/downloads/details.aspx?familyid=a5c84275-3b97-4ab7-a40d-3802b2af5fc2&displaylang=en
 - DirectX End-User Runtimes (June 2010)
http://www.microsoft.com/downloads/details.aspx?FamilyID=3b170b25-abab-4bc3-ae91-50ceb6d8fa8d&displaylang=en

Don't just drop downloaded DLLs into Makaron directory. That might work for some but DirectX should be properly updated.

Keep T12/5 in separate folder:
 1) There is a new file in ROM folder called FSCA.bin. I can't be bothered to explain its function properly and most of you wouldn't care/undrestand anyway. All you need to know is you should keep it there (though it is optional and Makaron will work without it). Problem is, previous versions of the emulator also look for this file but don't expect it to be as big as it is now - and might throw an error.
 2) Some config options were changed or removed, so it's best not to mix the new INI files with ones from previous versions. In fact you should use only the new config files and only copy the necessary changes from the old ones.
 3) Makaron now has the option of using one, common Dreamcast BIOS file for all regions. I figure it makes sense since most models sold were VA1 type and had the 1.01d BIOS installed. The only difference between regions are the FLASH and a few connections on the the main board. So, if "common_BIOS = 1" (the default value) then Makaron will try to load "Dreamcast_BIOS.bin" file. If this fails it will log a warning and try the old way. In future this will cause a hard error though so get it righ before then :)

Makaron will also show a warning window if the BIOS checksum does not match a known, official variant. This is to discourage people from using hacked or bad dumps since those cause problems. Right now the emulator detects these versions:
* 1.004 - found only (?) on the oldest VA0 models that were sold in Japan
* 1.011 - DEV BIOS with different swirl logo animation
* 1.01d - the BIOS used on VA1 units, so pretty much all Dreamcasts :)

Stick to 1.01d, unless you are familiar with the other ones and know what to expect. If you have the latest (VA2 only?) BIOS that had the Mil-CD booting changed to reject pirate copies, please contat me. Even if you don't want to share it I could use the MD5 checksum. Or maybe you'd like to donate such a Dreamcast to me, I'll take it even broken as long as the mainboard is not fried.

If Makaron crashes often it's probably a renderer issue. The only workaround for now it to set "multithreaded = 0" in PVR2 section. Obviously it affects performance but I guess it's better then nothing. This will be properly fixed one of these days :)
Test 12/5 version might be a bit slower on low-end system - sorry about that but if your PC was struggling to run Makaron before it's too old anyway. On the plus side modern PCs will benefit from the changes, the emulator should run much smoother. Don't use SH4 speed alone as the main performance indicator, this value depends on many factors. As a rule of thumb it's good if SH4 speed is above 200, though some games will still run full speed at 130 or even lower.

Emulator now uses XAudio2 rather than DirectSound. With that Windows 2000 support is officialy dropped and not coming back. It doesn't affect XP users but it does fix all the sound issues that Vista and Windows 7 had. The Direct3D 11 support is compiled in but doesn't do much at the moment, as you only get the old D3D9 renderer. This is just to test if I can safely distribute one executable for all systems.
There are no new features in this version, this is mostly a bugfix release for the broken T12 Dreamcast version. Or wait, there is one actually :) The SH4 recompiler has been modified to generate a faster code for WinCE games. All those optimizations can be turned off as the most aggressive ones break Linux and FreeBSD compatbility - but since I'm the only person on this planet running Linux on Makaron I suppose noone will ever notice.

And, as a small bonus, you can now define video mode that Makaron should use for rendering. All you need to do is set "video_mode = WxH" where W is width (640 to 4096) and H is height (480 to 4096), and W must be not less then H. This works both for windowed and fulls-creen mode. Default it 640x480.
There is also some rudimentary aspect ratio control, you need to set "scaling_mode" to one of the following values:
 1 - Renders with Dreamcast resolution, streches to screen height, width is resized to match Dreamcast aspect ratio, bilinear filter
 2 - Renders with Dreamcast resolution, resizes by an integer factor for best screen fit while maintaing Dreamcast aspect ratio, point filter
 3 - Renders with screen resolution, streches to screen height, width is resized to match Dreamcast aspect ratio, bilinear filter
 4 - Renders with screen resolution, streches to fit the screen so no aspect ratio control, bilinear filter

Default setting is 2, for purists who want the Dreamcast feel. Right now it's a bit ugly though... It's not even the lack of filtering at 2x, it's not that bad, but I guess a scanline effect would help here. In future perhaps.
Setting 1 is for people who want to use 2 but can't bear to look at it right now :) Most will probably use 3 though as it provides extra geometry resolution. 4 is pretty much what you had in older versions but with better resolution, it's ugly squashed anyway so no point in pretending it's a Dreamcast.

This has not been very extensively tested and still has some issues (for example direct framebuffer reads will not be properly resized) but should work fine in-game. Oh, and I feel like pointing out that rendering at higher internal resolution does not improve texture quality. In other words, all bitmap-based sprites, fonts, etc. will look ugly. No way around that, you keep pestering me on my blog about that and I will ignore/ban you. And since we're at it, there won't be keyboard-based gamepad emulation for Dreamcast. EVER. Get over it.

D.