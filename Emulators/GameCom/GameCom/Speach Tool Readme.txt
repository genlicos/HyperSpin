

Here is the speech handling procedure :

1. Received .WAV file from Tiger US or other souces. The file must be 22kHz 
sampling or lower, mono, 8-bit.

2. use WAV2RP.EXE attached to convert from .WAV to PCM file

3. use ADPCM.EXE to convert from PCM to ADPCM format :
        ADPCM <infile> <outfile>.ADP 2

        default output extension is .ADP

4. use DMGCUT.EXE to convert from ADPCM to GameCom usable data you can 
check from CONVSND.BAT. In the output file, the first 3 bytes is the length 
of the speech.

thanks & regards,



 