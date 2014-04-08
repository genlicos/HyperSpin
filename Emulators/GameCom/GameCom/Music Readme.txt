Hi.

For the melody development, here is our procedure/steps:

1. Normally we have given the note sheet which is the normal music
sheets, using numbers representing music notes. Gigapet melody is
faxed to TUS for your reference.
** Sandy/Allen: I know you both are not in office, can anyone forward
our fax to Thomas? Please advise so that I can address him/her on the
fax. Anyway, the fax will attend you both and sent today.

2. Then we translate manually into some source file. The reference
file for Gigapet is attached. Here is some notation in the file.

';' at the beginning of the line is comment. Also beginning of new
song.

Since it is dual tone, so each double line represents one segment
on the note sheet paper (you can check with the fax). Each segment is
seperated by one blank line.

Notes are represented by numbers. Symbols are below:

^      one octave up
^^     two octave up
^^^    three octave up
.      one octave down
..     two octave down
...    three octave down
_      1/8 length (normal is 1/4, quad)
__     1/16 length
#      sharp
:      extend to be 1.5 times of period

The note will be coded as : 
  [sharp][note][octave][length][extend]

Key C: (say normal '1' is C4)

  e.g. 4            ;;1/4 length, F4
  e.g  5.._         ;;1/8 length, G2
  e.g. #2^_         ;;1/8 length, D#5
  e.g. 1._:         ;;3/16 length, C3
  
3. Then execute the program 'melcvt.exe' at DOS prompt:

e.g. melcvt gigapet

A output file 'gigapet.psm' is generated. However, there is some
problems in the output format which need modified:

A example is sent as attached.

- You can see some duplicate label, please delete them, just leave
one label at the beginning of one song channel, there is 2 channel,
one is high and one is low.

- At the end of a song (either channel), please add :

     DB   0,0,0          ;; stop code.
     
- Then that is the melody data of songs, please use them for starting
the melody.


4. Knowing it is not a easy process, please advise any questions.


