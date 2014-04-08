;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;               WORKING RAMs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  00 -  7F : RP = 3, Display
;;  80 -  9F : Display Working RAM (32 bytes)
;; 1A0 - 1BF : Display (32 bytes)

cur_pos_x       equ     80h
cur_pos_y       equ     cur_pos_x+1
win_left_x      equ     cur_pos_y+1
win_left_y      equ     win_left_x+1
win_width       equ     win_left_y+1
win_height      equ     win_width+1
RP_image        equ     win_height+1            ;??
font_x          equ     RP_image+1
font_y          equ     font_x+1      ;font_no??
font_bank       equ     font_y+1      ;reserved space for user defined fonts??
font_offset     equ     font_bank+1

;font_table_hi   equ     font_offset+1             ;??
;font_table_lo   equ     font_table_hi+1         ;??
;text_no_x       equ     font_table_lo+1
;text_no_y       equ     text_no_x+1

temp_left_x     equ     font_offset+1
temp_left_y     equ     temp_left_x+1
temp_width      equ     temp_left_y+1
temp_height     equ     temp_width+1
temp_pos_x      equ     temp_height+1
temp_pos_y      equ     temp_pos_x+1
work_ram1       equ     temp_pos_y+1
work_ram2       equ     work_ram1+1
dmc_image       equ     work_ram2+1
cur_page        equ     dmc_image+1     ;!! for page swapping & block clear
local_global    equ     cur_page+1
local_global_1  equ     local_global+1
local_global_2  equ     local_global_1+1
local_global_3  equ     local_global_2+1
local_global_4  equ     local_global_3+1
temp_1          equ     local_global_4+1
temp_2          equ     temp_1+1
temp_3          equ     temp_2+1        ;!! text background color
cur_status      equ     temp_3+1        ;!! cursor status
font_id         equ     cur_status+1
font_num        equ     font_id+1

font3a          equ     01e8h
font3b          equ     font3a+1
font3c          equ     font3b+1
font4a          equ     font3c+1
font4b          equ     font4a+1
font4c          equ     font4b+1
font5a          equ     font4c+1
font5b          equ     font5a+1
font5c          equ     font5b+1
font6a          equ     font5c+1
font6b          equ     font6a+1
font6c          equ     font6b+1
font7a          equ     font6c+1
font7b          equ     font7a+1
font7c          equ     font7b+1
font8a          equ     font7c+1
font8b          equ     font8a+1
font8c          equ     font8b+1
font9a          equ     font8c+1
font9b          equ     font9a+1
font9c          equ     font9b+1
fontaa          equ     font9c+1
fontab          equ     fontaa+1
fontac          equ     fontab+1
font_start      equ     fontac+1
timer_ovr       equ     font_start+1
inverse         equ     timer_ovr+1
intnet          equ     inverse+1
scroll          equ     intnet+1
scroll1         equ     scroll+1
text_dest       equ     scroll1+1
cart_flag       equ     text_dest+1 ;0: cart1 ;1:cart2

mel_counter     equ     01a8h
mel_counter1    equ     mel_counter+1
mel_flag        equ     mel_counter1+1
mel_flag1       equ     mel_flag+1


