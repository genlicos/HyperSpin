;============================================================================
;
; Other old stuff
;
;----------------------------------------------------------------------------

KEY_CALL        EQU     1
TEST_MODE       EQU     0
TEST_STR        EQU     0
CHECKHIT_MODE   EQU     1
h2h_mode        equ     0

;ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·
;º  game control sign  º
;ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ½

ini_game        EQU     0   ; INITIAL
exe_game        EQU     1   ; EXECUTE
close_game      EQU     2   ; CLOSE GAME
reset_game      EQU     3   ; RESET
fighter_id      equ     0426h

;ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·
;º  fi_graph constant   º
;ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ½

override        equ     00h
composite       equ     01h
page_a          equ     00h
page_b          equ     02h
current_page    equ     04h
xor_mode        equ     08h
mirror_v        equ     40h
mirror_h        equ     80h

fade_level1     equ     10h
fade_level2     equ     20h
fade_level3     equ     30h

left_right      equ     40h
up_down         equ     80h
lr_up           equ     0c0h
total_energy    equ     75
total_run       equ     20
full_aggressor  equ     70

;ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·
;º    sound data constant     º
;ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ½


punch_snd       equ     00
kick_snd        equ     01
p_k_miss        equ     02
new_screen      equ     03
cursor_click    equ     04
fight           equ     05
ready           equ     06
go              equ     07
time_over       equ     08
excellent       equ     09
ko              equ     10
you_win         equ     11
you_lose        equ     12
silience        equ     13

;ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·
;º   melody constant   º
;ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ½


game_mel1       equ     01
game_mel2       equ     02
game_mel3       equ     03
game_mel4       equ     04
open_mel        equ     05
s_end_mel       equ     06
h_end_mel       equ     07
option_mel      equ     08



;ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·
;º   game mode constant    º
;ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ½

;for Msel_ram

one_player_mode equ     00
vs_mode         equ     04
survival_mode   equ     08
record_mode     equ     12

;ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·
;º   high score constant   º
;ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ½

record_offset   equ     09
internet_offset equ     16
internet_code   equ     2eh

;ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·
;º   constant    º
;ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ½

bit0            equ     00
bit1            equ     01
bit2            equ     02
bit3            equ     03
bit4            equ     04
bit5            equ     05
bit6            equ     06
bit7            equ     07

up_key          equ     83h
down_key        equ     84h
left_key        equ     85h
right_key       equ     86h
menu_key        equ     87h
on_off_key      equ     88h
mute_key        equ     89h
pause_key       equ     8ah
a_key           equ     8bh
b_key           equ     8ch
c_key           equ     8dh
d_key           equ     8eh

punch_key       equ     a_key
kick_key        equ     b_key
guard_key       equ     c_key
turn_key        equ     d_key

p1_init_x       equ     55
p2_init_x       equ     145
init_y          equ     155
min_x           equ     30
max_x           equ     170
min_delta_x     equ     35
max_delta_x     equ     157
left_bound      equ     15
right_bound     equ     185
upper_bound     equ     20
lower_bound     equ     155     ;160
max_width       equ     200
max_height      equ     155     ;160
body_offset_x1  equ     17
body_offset_x2  equ     11
hit_zone_h      equ     9
hit_zone_w      equ     9
min_delta_x2    equ     40
guard_dist      equ     60
full_energy     equ     64
loss_energy0    equ     4
loss_energy1    equ     5
loss_energy2    equ     6
loss_energy3    equ     7
loss_energy4    equ     8
loss_energy5    equ     9
loss_energy6    equ     15
enable_mem      equ     01h
enable_repeat   equ     08h

min_attack_dist equ     60


;ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·
;º   player info ram offset value.    º
;ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ½

decode_ptr      equ     0
plyr_x          equ     2
plyr_y          equ     3
plyr_loopx      equ     4
plyr_loopy      equ     5
plyr_disp_x     equ     6
plyr_disp_y     equ     7
plyr_id         equ     8
plyr_status     equ     9
plyr_info1      equ     10
plyr_info2      equ     11
plyr_seq_no     equ     12
plyr_total_seq  equ     13
plyr_ptr        equ     14
plyr_seq_ptr    equ     16
plyr_ram        equ     18


;ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·
;º  fighter bmp bank number.  º
;ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ½

;80000h - fffffh

bankno_legal1    equ     20h
bankno_nbalogo   equ     bankno_legal1+1
bankno_teamlogo1 equ     bankno_nbalogo+1
bankno_teamlogo2 equ     bankno_teamlogo1+1
bankno_titles0   equ     bankno_teamlogo2+1
bankno_titles1   equ     bankno_titles0+1
bankno_courtA    equ     bankno_titles1+1
bankno_courtB    equ     bankno_courtA+1
bankno_courtC    equ     bankno_courtB+1
bankno_courtD    equ     bankno_courtC+1
bankno_playerA   equ     bankno_courtD+1
bankno_playerB   equ     bankno_playerA+1
bankno_playerC   equ     bankno_playerB+1
bankno_stats     equ     bankno_playerC+1

bankno_GD001    equ     020h
bankno_GD002    equ     bankno_GD001+1
bankno_GD003    equ     bankno_GD002+1
bankno_123R0    equ     bankno_GD003+1
bankno_123R1    equ     bankno_123R0+2
bankno_123R2    equ     bankno_123R1+2
bankno_123R3    equ     bankno_123R2+2
bankno_123R4    equ     bankno_123R3+2
bankno_la1      equ     bankno_123R4+2
bankno_new1     equ     bankno_la1+3

;100000h - 17ffffh

bankno_4M001    equ     40h
bankno_4M002    equ     bankno_4M001+1
bankno_4M003    equ     bankno_4M002+1
bankno_4M004    equ     bankno_4M003+1
bankno_4M005    equ     bankno_4M004+1
bankno_4M006    equ     bankno_4M005+1
bankno_4M007    equ     bankno_4M006+1
bankno_4M008    equ     bankno_4M007+1
bankno_ALL001   equ     bankno_4M008+1          ;4ml001.dat
bankno_ALL002   equ     bankno_ALL001+1         ;4ml002.dat
bankno_ALL003   equ     bankno_ALL002+1         ;4ml003.dat
bankno_ALL004   equ     bankno_ALL003+1
bankno_ALL005   equ     bankno_ALL004+1
bankno_ALL006   equ     bankno_ALL005+1
bankno_ALL007   equ     bankno_ALL006+1
bankno_ALL008   equ     bankno_ALL007+1
bankno_ALL009   equ     bankno_ALL008+1
bankno_ALL010   equ     bankno_ALL009+1
bankno_ALL011   equ     bankno_ALL010+1
bankno_ALL012   equ     bankno_ALL011+1
bankno_ALL013   equ     bankno_ALL012+1
bankno_ALL014   equ     bankno_ALL013+1
bankno_ALL015   equ     bankno_ALL014+1
bankno_ALL016   equ     bankno_ALL015+1
bankno_ALL017   equ     bankno_ALL016+1
bankno_GD004    equ     bankno_ALL017+1
bankno_GD005    equ     bankno_GD004+1
bankno_GD006    equ     bankno_GD005+1
bankno_GD007    equ     bankno_GD006+1
bankno_GD008    equ     bankno_GD007+1
bankno_GD009    equ     bankno_GD008+1
bankno_GD010    equ     bankno_GD009+1


;bankno_all017c  equ     bankno_la1+2
bankno_all017c  equ     bankno_ALL017

;180000h - 1fffffh

bankno_winpic1  equ     60h
bankno_winpic2  equ     bankno_winpic1+2
bankno_winpic3  equ     bankno_winpic2+2
bankno_winpic4  equ     bankno_winpic3+2
bankno_winpic5  equ     bankno_winpic4+2
bankno_winpic6  equ     bankno_winpic5+2
bankno_winpic7  equ     bankno_winpic6+2
bankno_winpic8  equ     bankno_winpic7+2
bankno_winpic9  equ     bankno_winpic8+2
bankno_winpic10 equ     bankno_winpic9+2

;ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·
;º   program bank number   º
;ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ½

program_bank1   equ     020h
program_bank2   equ     021h
program_bank3   equ     023h
program_bank4   equ     024h
program_bank5   equ     025h
program_bank6   equ     026h

;ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·
;º  tabels bank number   º
;ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ½

table1_bank     equ     22h
misc_tbl        equ     22h
table2_bank     equ     24h


;ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·
;º  fighter id number.  º
;ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ½


akira_id        equ     00
pai_id          equ     01
jacky_id        equ     02
kids_id         equ     03
lion_id         equ     04
siba_id         equ     05
hornet_id       equ     06
janet_id        equ     07
bahn_id         equ     08
san_id          equ     09
honey_id        equ     10
mahler_id       equ     11
honeys_id       equ     12


;min_x           equ     21
;max_x           equ     178
;min_delta_x     equ     21
;max_delta_x     equ     157


;ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·
;º   fighters status table    º
;ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ½

st_stance               equ     0
st_walk_F               equ     2
st_walk_B               equ     4
st_run                  equ     6
st_guard                equ     8
st_in_turn              equ     10
st_out_turn             equ     12
st_crouch               equ     14
st_crouch_walk_F        equ     16
st_crouch_walk_B        equ     18
st_crouch_guard         equ     20
st_jump_Up              equ     22
st_jump_F               equ     24
st_jump_B               equ     26
st_punch                equ     28      ;attack
st_kick                 equ     30      ;attack
st_crouch_punch         equ     32      ;attack
st_crouch_kick          equ     34      ;attack
st_jump_kick_Up         equ     36      ;attack
st_jump_kick_F          equ     38      ;attack
st_jump_kick_B          equ     40      ;attack
st_add_attack           equ     42      ;attack
st_SPAA                 equ     44      ;attack
st_get_up               equ     46
st_return               equ     48
st_react1               equ     50
st_react1a              equ     52
st_react2               equ     54
st_react3               equ     56
st_react3a              equ     58
st_react4               equ     60
st_react5               equ     62
st_react6               equ     64
st_react7               equ     66
st_react8               equ     68


;- REACTIONS -
;
;[STANCE]
;
;Punch (Stance)  ---    st_react1
;Kick (Stance)   ---    st_react2
;Punch (Crouch)  ---    st_react3
;Kick (Crouch)   ---    st_react3
;SPAA            ---    st_react4
;
;[CROUCH]
;
;Punch (Stance)  ---    st_react1
;Kick (Stance)   ---    st_react2
;Punch (Crouch)  ---    st_react3
;Kick (Crouch)   ---    st_react3
;SPAA            ---    st_react4
;
;[JUMP]
;
;Punch (Stance)  ---    st_react5
;Kick (Stance)   ---    st_react5
;Punch (Crouch)  ---    st_react5
;Kick (Crouch)   ---    st_react5
;SPAA            ---    st_react4
;
;[LIE DOWN]
;
;Additional      ---    st_react6
;Attack
;
;Dead            ---    st_react7
;



;ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·
;º   key interpreter key2 format    º
;ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ½

;bit 7--Up
;bit 6--Down
;bit 5--Left
;bit 4--Right
;bit 3--A
;bit 2--D
;bit 1--C
;bit 0--B

int_up_bit      equ     bit7
int_down_bit    equ     bit6
int_left_bit    equ     bit5
int_right_bit   equ     bit4
int_punch_bit   equ     bit3
int_kick_bit    equ     bit0
int_guard_bit   equ     bit1
int_turn_bit    equ     bit2

decode_info     equ     0c0h
	;bit0 - 1: plyer decode
	;bit1 - 1: plyer1 face right both plyer2 and background scroll left
	;          (FOR SCROLLING)
	;bit2 - 1: plyer2 face right both plyer1 and background scroll left
	;          (FOR SCROLLING)

decode_info1    equ     decode_info+1
	;bit0-3 : background no.
	;bit4   : 1: plyr1 needs GETUP after the whole sequence
	;bit5   : 1: plyr2 needs GETUP after the whole sequence

plyr1_bankno    equ     decode_info1+1
plyr2_bankno    equ     plyr1_bankno+1

;ÕÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¸
;³      PLYR1 DECODING        ³
;ÔÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¾
decode_ptr1     equ     plyr2_bankno+1  ;(2 bytes)

;ÕÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¸
;³      PLAYER 1 INFO     ³
;ÔÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¾
plyr1_x         equ     decode_ptr1+2
plyr1_y         equ     plyr1_x+1
plyr1_loopx     equ     plyr1_y+1       ;store the old DMG_timer for x_disp
plyr1_loopy     equ     plyr1_loopx+1   ;store the old DMG_timer for y_disp
plyr1_disp_x    equ     plyr1_loopy+1   ;store the x_disp/timer_tick
plyr1_disp_y    equ     plyr1_disp_x+1  ;store the y_disp/timer_tick

plyr1_id        equ     plyr1_disp_y+1
plyr1_status    equ     plyr1_id+1
plyr1_info1     equ     plyr1_status+1  ; bit0 - 1:player 1 action init
					; bit1 - 1: a key history
					; bit2 - 1:
					; bit3 - 1: d key history
					; bit4 - 1: b key history
					; bit5 - 1:
					; bit6 - 1:
					; bit7 - 1:

plyr1_info2     equ     plyr1_info1+1   ;*bit0 - 1:forward movement (Cheung)
					;*bit1 - 1:backward movement (Cheung)
					; bit2 - 1:backward key flag.
					; bit3 - player 1 direction.
					;        1: face right
					;        0: face left
					; bit4 - 0:special move allow flag.
					; bit5 - 1:special case of janet
					; bit6 - 1:SPAA flag of janet
					; bit7 - 1:SPAA flag of Kids & Siba

plyr1_seq_no    equ     plyr1_info2+1   ;
plyr1_total_seq equ     plyr1_seq_no+1  ;
plyr1_ptr       equ     plyr1_total_seq+1       ;(2 bytes)
plyr1_seq_ptr   equ     plyr1_ptr+2             ;(2 bytes)
plyr1_ram       equ     plyr1_seq_ptr+2 ;

;ÕÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¸
;³      PLYR2 DECODING        ³
;ÔÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¾

decode_ptr2     equ     plyr1_ram+2         ;(2 bytes)

;ÕÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¸
;³      PLAYER 2 INFO     ³
;ÔÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¾
plyr2_x         equ     decode_ptr2+2
plyr2_y         equ     plyr2_x+1
plyr2_loopx     equ     plyr2_y+1       ;store the old DMG_timer for x_disp
plyr2_loopy     equ     plyr2_loopx+1   ;store the old DMG_timer for y_disp
plyr2_disp_x    equ     plyr2_loopy+1   ;store the x_disp/timer_tick
plyr2_disp_y    equ     plyr2_disp_x+1  ;store the y_disp/timer_tick

plyr2_id        equ     plyr2_disp_y+1
plyr2_status    equ     plyr2_id+1
plyr2_info1     equ     plyr2_status+1  ; bit0 - 1:player 2 action init
					; bit1 - 1: a key history
					; bit2 - 1:
					; bit3 - 1: d key history
					; bit4 - 1: b key history
					; bit5 - 1:
					; bit6 - 1:
					; bit7 - 1:

plyr2_info2     equ     plyr2_info1+1   ;*bit0 - 1:forward movement (Cheung)
					;*bit1 - 1:backward movement (Cheung)
					; bit2 - 1:backward key flag.
					; bit3 - player 2 direction
					;        1: face right
					;        0: face left
					; bit4 - 0:special move allow flag
					; bit5 - 1:special case of janet
					; bit6 - 1:SPAA flag of janet
					; bit7 - 1:SPAA flag of Kids & Siba

plyr2_seq_no    equ     plyr2_info2+1
plyr2_total_seq equ     plyr2_seq_no+1
plyr2_ptr       equ     plyr2_total_seq+1       ;(2 bytes)
plyr2_seq_ptr   equ     plyr2_ptr+2             ;(2 bytes)
plyr2_ram       equ     plyr2_seq_ptr+2 ;
x1_move         equ     plyr2_ram+1
x2_move         equ     x1_move+1

; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿            ;TEST
; ³    Ram use in Key Interpreter  ³            ;add by Cheung
; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

key1            equ     x2_move+1       ;
key2            equ     key1+1
status1         equ     key2+1          ;
;ASBramBB           equ     status1+1       ;background X-axis location (2 byte)
;ASB
;ASBpicX        equ         ramBB+2         ;animation X & option counter
;ASBpicY        equ         picX+1          ;animation Y & option counter
;ASBtempZ       equ         picY+1          ;ram of animation r8 for refill graphic
;ASBtemp1       equ         tempZ+1         ;temp1 is the ram of fighter selection
;ASB					;change to player 1 value
;ASBtemp2       equ         temp1+1         ;temp2 is the ram of course selection
;ASB					;change to player2 value
;ASBtemp3       equ         temp2+1         ;temp3 is the ram of stage type


;ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·
;º     Two player mode status ram     º
;ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ½


game_info       equ     status1+1
				;bit0 - 1:round end flag.
				;bit1 - 0:p1 win, 1:p2 win
				;bit2 - 1:game end flag.(finish stage)
				;bit3 - 1:opening and option finish flag
				;bit4 - 1:without wall , 0:with wall
				;bit5 - 1:animation finish flag
				;bit6 - 1:timeout display flag.
				;bit7 - 1:melody start again.

game_info2      equ     game_info+1
			;bit0 - survival mode time's up.
			;bit1 - survival mode game end back to fighter selection
			;       screen flag.
			;bit2 - janet fire flag.
			;bit3 - call speech routine flag.
			;bit4 - the background cheat code flag.(cheung)
			;bit5 - first time init.
			;bit6 -
			;bit7 - used by head to head.
			;

game_info3      equ     game_info2+1
			;bit0 - slave speech start flag.
			;bit1 - draw game flag.
			;bit2 - win animation flag.
			;bit3 - show game over flag.
			;bit4 - double ko flag.

speechnum       equ     game_info3+1
uart_info       equ     speechnum+1
				;bit0 - 0:1 player mode.
				;       1:2 players mode.
				;bit1 - 0:master.
				;       1:slave.
				;bit2 - menu key quit h2h flag.
				;bit3 - opponent menu key quit h2h flag.
				;bit4 - slave receive not enough byte or checksum error.
				;bit5 -
				;bit6 -
				;bit7 -


uart_ram        equ     uart_info+1
step_ram        equ     uart_ram+1

            if      step_ram .gt. 0ffh
            this is an error: ran out of 0beh ram
            endif

;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;³        DIFFERENT TIMERS       ³
;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
;plyr1 action timer

plyr1_acttmr0   equ     150h
plyr1_acttmr1a  equ     plyr1_acttmr0+1
plyr1_acttmr1b  equ     plyr1_acttmr1a+1

plyr1_seqtmr0   equ     plyr1_acttmr1b+1
plyr1_seqtmr1a  equ     plyr1_seqtmr0+1
plyr1_seqtmr1b  equ     plyr1_seqtmr1a+1

;plyr2 action timer

plyr2_acttmr0   equ     plyr1_seqtmr1b+1
plyr2_acttmr1a  equ     plyr2_acttmr0+1
plyr2_acttmr1b  equ     plyr2_acttmr1a+1

plyr2_seqtmr0   equ     plyr2_acttmr1b+1
plyr2_seqtmr1a  equ     plyr2_seqtmr0+1
plyr2_seqtmr1b  equ     plyr2_seqtmr1a+1

;game timer

GAME_TIMER0     equ     plyr2_seqtmr1b+1
GAME_TIMER1A    EQU     GAME_TIMER0+1
GAME_TIMER1B    EQU     GAME_TIMER1A+1

;sky timer

sky_timer0      equ     GAME_TIMER1B+1
sky_timer1      equ     sky_timer0+1
sky_timer2      equ     sky_timer1+1

;general timer

gen_timer0      equ     sky_timer2+1
gen_timer1      equ     gen_timer0+1
gen_timer2      equ     gen_timer1+1

;ÕÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¸
;³       NON-ZERO PAGE RAMS (208h - 37Fh)      ³
;ÔÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¾

temp_key        equ     208h
status_buffer   equ     temp_key+1
p1_disp_x1      equ     status_buffer+1
p1_disp_y1      equ     p1_disp_x1+1
p1_disp_x2      equ     p1_disp_y1+1
p1_disp_y2      equ     p1_disp_x2+1
p2_disp_x1      equ     p1_disp_y2+1
p2_disp_y1      equ     p2_disp_x1+1
p2_disp_x2      equ     p2_disp_y1+1
p2_disp_y2      equ     p2_disp_x2+1
x_distance      equ     p2_disp_y2+1
y_distance      equ     x_distance+1
block_flag      equ     y_distance+1    ;bit0 - 1: two players blocking flag.
					;bit1 - 1: player1 hitted.
					;bit2 - 1: player2 hitted.
p1_hit_zonex1   equ     block_flag+1
p1_hit_zoney1   equ     p1_hit_zonex1+1
p1_hit_zonex2   equ     p1_hit_zoney1+1
p1_hit_zoney2   equ     p1_hit_zonex2+1
p2_hit_zonex1   equ     p1_hit_zoney2+1
p2_hit_zoney1   equ     p2_hit_zonex1+1
p2_hit_zonex2   equ     p2_hit_zoney1+1
p2_hit_zoney2   equ     p2_hit_zonex2+1

p1_timerA       equ     p2_hit_zoney2+1
p2_timerA       equ     p1_timerA+1
p1_timerB       equ     p2_timerA+1
p2_timerB       equ     p1_timerB+1

; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
; ³***Background use RAMs*** ³
; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
ramAA           equ     p2_timerB+1             ;sky movement
ramCC           equ     ramAA+1                 ;earth movement
ramEE           equ     ramCC+1                 ;stage movement
ramE_save       equ     ramEE+1
			;bit0 - 1:set player1 turn flag.
			;bit1 - 1:stage move with forward/backward flag.
			;bit2 - 1:set player2 turn flag.
			;bit4 - 1:players F/B move left flag.
			;bit5 - 1:players F/B move right flag.
			;bit6 - 1:player stand stage right side flag.
			;bit7 - 1:player stand stage left side flag.

ramDD           equ     ramE_save+1             ;(2 byte)max. background width
ram_BG          equ     ramDD+2
object_ram      equ     ram_BG+1                 ;object show in BG
pointer_ram     equ     object_ram+1            ;(2 byte)

gtimer1         equ     pointer_ram+2           ;game timer value
gtimer2         equ     gtimer1+1               ;game timer value
tmp_game_info   equ     gtimer2+1
intell_flag1    equ     tmp_game_info+1
		;bit0 - 1: intelligence action start flag.
		;bit1 - 1: continue attack flag.

temp_ram1       equ     intell_flag1+1
temp_ram2       equ     temp_ram1+1
temp_ram3       equ     temp_ram2+1
attack_step     equ     temp_ram3+1
p1_energy       equ     attack_step+1
p1_energy_buf   equ     p1_energy+1
p1_armour1      equ     p1_energy_buf+1
p1_armour2      equ     p1_armour1+1
p2_energy       equ     p1_armour2+1
p2_energy_buf   equ     p2_energy+1
p2_armour1      equ     p2_energy_buf+1
p2_armour2      equ     p2_armour1+1
energy_count    equ     p2_armour2+1
round_num       equ     energy_count+1          ;current round number.
total_round     equ     round_num+1             ;total round will play.
start_word_flag equ     total_round+1           ;
		;bit0 - 1: fight just start flag.
		;bit1 - 1: set timer for start word flag.
		;bit2 - 1: set timer for ko word flag.
		;bit3 - 1: round/game restart flag.
		;bit4 - 1: survival mode game end show record flag.
		;bit5 - 1: count continue flag. (only in 1 player mode.)
start_word_seq  equ     start_word_flag+1
p1_win_round    equ     start_word_seq+1
p2_win_round    equ     p1_win_round+1
xnew_melody_ptr  equ     p2_win_round+1
attack_loop     equ     xnew_melody_ptr+1
cur_key         equ     attack_loop+1
i_kbdflag       equ     cur_key+1
i_sysflag       equ     i_kbdflag+1
quit_flag       equ     i_sysflag+1
			;bit0 - 1:opening press menu key.
			;bit1 - 1:opening press off key.


graph_flag      equ     quit_flag+1        ;27/11/1997 cheung
			;bit0 - 1:the graph fill grey1
			;       0:fill normal
			;bit1 - 1:the DIS_word to run cur_page flag
			;bit3 - 1:the result over 100 wins
			;bit4 - 1:the record of 1P mode
			;       0:the record of survival mode
			;bit5 - 1:the flag of Background load around
			;bit6 - 1:the flag of FB number
			;bit7 - 1:the flag of FC number

wordram         equ     graph_flag+1    ;display word routine(2 byte) cheung

Msel_ram        equ     wordram+2       ;Mode Select Ram (cheung)
; Values show different mode in select mode
;       0 : 1P MODE
;       4 : VS MODE
;       8 : SURVIVAL MODE
;      12 : RECORDS

option_ram      equ     Msel_ram+1      ;2/12/1997      (cheung)
				;bit 0 - 1:the flag of survival1
				;bit 1 - 1:the flag of VS_MODE2
				;bit 2 - 1:the flag of ST_type
				;bit 3 - 1:the flag of P_MODE2
				;bit 4 - 1:the flag of P_MODE
				;bit 5 - 1:the flag of RECORDS
				;bit 6 - 1:the flag of VS_mode1
				;bit 7 - 1:the flag of Mode_SEL


course_ram      equ     option_ram+1      ;1P mode 4/12/1997 (cheung)
				;course a : 0
				;course b : 2
				;course c : 4
				;course d : 6

OPT_ramA        equ     course_ram+1
;value show different option setting
;       0 : difficulty
;       2 : round
;       4 : time
;       6 : 1P life
;       8 : 2P life

plyr1_life      equ     OPT_ramA+1      ;1P LIFE
plyr2_life      equ     plyr1_life+1    ;2P LIFE
;value show the life energy
;       8 : strongest    1 : weakest  (8 steps)

control_ram     equ     plyr2_life+1
				;bit 0 - 1:the flag of survival0
				;bit 1 - 1:the flag of survival result
				;bit 2 - 1:the flag of Cheat_code background
				;bit 3 - 1:the flag of VS mode option
				;bit 4 - 1:the flag of no key
				;bit 5 - 1:the flag of Pstart title screen
				;bit 6 - 1:the flag of VS mode second page
				;bit 7 - 1:the flag of 1P mode option

diff_ram        equ     control_ram+1        ;DIFFICULTY
rnd_ram         equ     diff_ram+1      ;ROUND
time_ram        equ     rnd_ram+1       ;TIME

;value show different choices
;       0 : easy        1       45
;       2 : normal      3       75
;       4 : hard        5       99
;       6 : -           -     no limit

VSM_ram         equ     time_ram+1     ;VS mode 3/12/1997 (cheung)
				;bit 0 - 0:p1 vs cpu.  1:p1 vs p2.
				;bit 6 - 1:the flag of flash selector
				;bit 7 - 1:the flag of double page display

Ltime_ram       equ     VSM_ram+1     ;survival mode time
					;value
					;0 -  3 min
					;1 -  7 min
					;2 - 15 min
stage_num       equ     Ltime_ram+1
game_min        equ     stage_num+1
game_sec        equ     game_min+1
p1_armor_ok     equ     game_sec+1
p2_armor_ok     equ     p1_armor_ok+1
p1_win_times    equ     p2_armor_ok+1
p2_win_times    equ     p1_win_times+1
p1_explose      equ     p2_win_times+1
p2_explose      equ     p1_explose+1
opp_pointer     equ     p2_explose+1
continue_count  equ     opp_pointer+1

;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿                  ;5/1/1998
;³       RECORD RAM          ³                  ;cheung
;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

slave_key       equ     continue_count+1
legal_flag      equ     slave_key+1
pack_count      equ     legal_flag+1
temp_ctrl       equ     pack_count+1
temp_key2       equ     temp_ctrl+1
Pcode_ram       equ     temp_key2+1             ;31/1/1998 (cheung)
Show_rnd        equ     Pcode_ram+1             ;3/2/1998
		;       0 : 1 round
		;       1 : 3 round
		;       2 : 5 round
master_cur_key  equ     Show_rnd+1
slave_cur_key   equ     master_cur_key+1
temp_quit       equ     slave_cur_key+1
cheat_code      equ     temp_quit+1
cheat_flag      equ     cheat_code+1
		;bit0 - cheat code 1 effective. code : "b,a,d,d"
		;bit1 - cheat code 2 effective. code : "d,d,d,d,d,a"
		;bit2 - cheat code 3 effective. code : "d,c,d,c"

internet1       equ     cheat_flag+1    ;01 - no demage
internet2       equ     internet1+1     ;02 - half life
internet3       equ     internet2+1     ;04 - stage select
internet4       equ     internet3+1     ;not use.
high_score      equ     internet4+1
hidden_ram      equ     high_score+1
		;bit0 - 1:the flag of the hidden kids sarah
		;bit1 - 1:the flag of the hidden janet
		;bit2 - 1:the flag of the hidden hornet
		;bit3 - 1:the flag of the hidden siba
		;bit7 - 1:the flag of jump out fighter selection
high_score_flag equ     hidden_ram+1
internet_flag   equ     high_score_flag+1
		;bit0 - 1:the flag of internet download (no demage)
		;bit1 - 1:the flag of internet download (half life)
		;bit2 - 1:the flag of internet download (stage select)
open_con        equ     internet_flag+1
speech_flag     equ     open_con+1
master_hidden   equ     speech_flag+1
slave_hidden    equ     master_hidden+1
sp_time         equ     slave_hidden+1
null_round      equ     sp_time+1

page_ptr0       equ     null_round+1  ;(2 bytes)
hold_byte0      equ     page_ptr0+1
hold_byte1      equ     hold_byte0+1

game_mode       equ     hold_byte1+1
game_rules      equ     game_mode+1
game_level      equ     game_rules+1
game_quarter    equ     game_level+1

oquit_flag      equ     game_quarter+1
menu_selection  equ     oquit_flag+1
icount          equ     menu_selection+1
pres_menu_desc  equ     icount+1  ;2 bytes
menu_base_line  equ     pres_menu_desc+2
null_option     equ     menu_base_line+1

music_option    equ     null_option+1
sfx_option      equ     music_option+1
crowd_option    equ     sfx_option+1
cassist_option          equ     crowd_option+1
slomo_dunks_option      equ     cassist_option+1
player_star_option      equ     slomo_dunks_option+1
shot_control_option     equ     player_star_option+1
onscreen_help_option    equ     shot_control_option+1

rule_dfoul              equ     onscreen_help_option+1
rule_charging           equ     rule_dfoul+1
rule_foulout            equ     rule_charging+1
rule_outofbounds        equ     rule_foulout+1
rule_backcourt          equ     rule_outofbounds+1
rule_travelling         equ     rule_backcourt+1
rule_goaltending        equ     rule_travelling+1
rule_3inthekey          equ     rule_goaltending+1
rule_shot_clock         equ     rule_3inthekey+1
rule_inbound_clock      equ     rule_shot_clock+1
rule_halfcourt_clock    equ     rule_inbound_clock+1
rule_injuries           equ     rule_halfcourt_clock+1
rule_fatigue            equ     rule_injuries+1


team_array              equ     rule_fatigue+1   ;16 words (pids)
player_array            equ     team_array+32    ;64 bytes (various data)

trade_index0            equ     player_array+64
trade_index1            equ     trade_index0+1
trade_index2            equ     trade_index1+1
trade_base              equ     trade_index2+1
trading_slot            equ     trade_base+1
RAM_string0             equ     trading_slot+2    ;16 chars
RAM_string1             equ     RAM_string0+16   ;8 chars
player_stype            equ     RAM_string1+8
player_handed           equ     player_stype+1
player_position         equ     player_handed+1

court_xoff              equ     player_position+1
court_yoff              equ     court_xoff+2


player0_shead           equ     court_yoff+2
player1_shead           equ     player0_shead+9
player2_shead           equ     player1_shead+9
player3_shead           equ     player2_shead+9
player4_shead           equ     player3_shead+9
player5_shead           equ     player4_shead+9
player6_shead           equ     player5_shead+9
player7_shead           equ     player6_shead+9
player8_shead           equ     player7_shead+9
player9_shead           equ     player8_shead+9

sprite_table            equ     player9_shead+9
psprite_xloc            equ     sprite_table+20
psprite_yloc            equ     psprite_xloc+2

;PLAYER shape header
PLAYER_xloc             equ     00h
PLAYER_yloc             equ     02h
PLAYER_direction        equ     04h
PLAYER_motion           equ     05h
PLAYER_action           equ     06h
PLAYER_timing           equ     07h
PLAYER_frame            equ     08h


;Player structure
PLAYER_team             equ     00h
PLAYER_number           equ     01h
PLAYER_Fname            equ     02h
PLAYER_Lname            equ     0ch
PLAYER_position         equ     1ah
PLAYER_height           equ     1bh
PLAYER_weight           equ     1ch
PLAYER_points           equ     1eh
PLAYER_years            equ     20h
PLAYER_games            equ     21h
PLAYER_starts           equ     22h
PLAYER_minutes          equ     23h
PLAYER_fgmade           equ     25h
PLAYER_fgatt            equ     27h
PLAYER_3ptmade          equ     29h
PLAYER_3ptatt           equ     2bh
PLAYER_ftmade           equ     2dh
PLAYER_ftatt            equ     2fh
PLAYER_offreb           equ     31h
PLAYER_defreb           equ     33h
PLAYER_assists          equ     35h
PLAYER_steals           equ     37h
PLAYER_blocks           equ     39h
PLAYER_turnovers        equ     3bh
PLAYER_fouls            equ     3dh
PLAYER_ejections        equ     3fh
