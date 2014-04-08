	global  display_menu

center_align:
       movw     rr0,page_ptr1
       mov      r3,index1
center_aloop:
       mov      r2,(rr0)+
       cmp      r2,#0
       br       eq,center_aexit
       sub      r3,#4
       br       center_aloop
center_aexit:
       mov      index1,r3
       ret


; r0 = team #
get_team_list:
       push     mmu4
       mov      r1,#table2_bank
       mov      mmu4,r1
       clr      r1
       clrc
       rrc      r0
       rrc      r1
       rrc      r0
       rrc      r1
       rrc      r0
       rrc      r1
       addw     rr0,#team_pids
       movw     rr2,#team_array

       clr      r6
get_team_loop:
       cmp      r6,#10h
       br       eq,get_team_exit

       movw     rr4,@rr0
       movw     @rr2,rr4
       addw     rr0,#2
       addw     rr2,#2
       add      r6,#1
       br       get_team_loop

get_team_exit:
       pop      mmu4
       ret



;rr0 = pid#
get_player_info:
       clrc
       rlc      r1
       rlc      r0
       mov      r2,r0
       clr      r0
       add      r2,#bankno_stats
    add      r2,#bankno_stats
       rlc      r1
       rlc      r0
       rlc      r1
       rlc      r0
       rlc      r1
       rlc      r0
       rlc      r1
       rlc      r0
       rlc      r1
       rlc      r0
       addw     rr0,#8000h
       push     mmu4
       mov      mmu4,r2
       movw     rr2,#player_array

       clr      r6
get_player_loop:
       cmp      r6,#20h
       br       eq,get_player_exit

       movw     rr4,@rr0
       movw     @rr2,rr4
       addw     rr0,#2
       addw     rr2,#2
       add      r6,#1
       br       get_player_loop

get_player_exit:
       pop      mmu4
       ret




; in rr4
hex2bncW:
       clr      r6
       clr      r7
hex2bncW_loop1:
       cmpw     rr4,#1000
       br       ult,hex2bncW_exit1
       addw     rr6,#01000h
       subw     rr4,#1000
       jmp      hex2bncW_loop1
hex2bncW_exit1:
hex2bncW_loop2:
       cmpw     rr4,#100
       br       ult,hex2bncW_exit2
       addw     rr6,#0100h
       subw     rr4,#100
       jmp      hex2bncW_loop2
hex2bncW_exit2:
hex2bncW_loop3:
       cmp      r5,#10
       br       ult,hex2bncW_exit3
       add      r7,#010h
       sub      r5,#10
       jmp      hex2bncW_loop3
hex2bncW_exit3:
       addw     rr4,rr6
       ret

; in r4
hex2bncB:
       clr      r5
hex2bnc_loop:
       cmp      r4,#10
       br       ult,hex2bnc_exit
       add      r5,#010h
       sub      r4,#10
       jmp      hex2bnc_loop

hex2bnc_exit:
       add      r4,r5

       ret




; output @rr0
; byte in r4
printBYTE_SP:
       mov      r5,r4
       srl      r5
       srl      r5
       srl      r5
       srl      r5
       or       r5,r5
       br       z,pBYTE_leadSP0
       add      r5,#'0'
       br       pBYTE_leadSP1
pBYTE_leadSP0:
       mov      r5,#' '
pBYTE_leadSP1:
       mov      (rr0)+,r5
       mov      r5,r4
       and      r5,#0fh
       add      r5,#'0'
       mov      (rr0)+,r5
       ret


; output @rr0
; byte in r4
printBYTE_w0:
       mov      r5,r4
       srl      r5
       srl      r5
       srl      r5
       srl      r5
       add      r5,#'0'
       mov      (rr0)+,r5
       mov      r5,r4
       and      r5,#0fh
       add      r5,#'0'
       mov      (rr0)+,r5
       ret

; output @rr0
; byte in r4
printBYTE:
       mov      r5,r4
       srl      r5
       srl      r5
       srl      r5
       srl      r5
       or       r5,r5
       br       z,pBYTE_lead0
       add      r5,#'0'
       mov      (rr0)+,r5
pBYTE_lead0:
       mov      r5,r4
       and      r5,#0fh
       add      r5,#'0'
       mov      (rr0)+,r5
       ret


; output @rr0
; byte in rr4
printWORD:
       pushw    rr4
       clr      r9
       mov      r5,r4
       srl      r5
       srl      r5
       srl      r5
       srl      r5
       or       r9,r5
       br       z,pWORD_lead0a
       add      r5,#'0'
       mov      (rr0)+,r5
pWORD_lead0a:
       mov      r5,r4
       and      r5,#0fh
       or       r9,r5
       br       z,pWORD_lead0b
       add      r5,#'0'
       mov      (rr0)+,r5
pWORD_lead0b:
       popw     rr4
       pushw    rr4
       mov      r4,r5
       srl      r5
       srl      r5
       srl      r5
       srl      r5
       or       r9,r5
       br       z,pWORD_lead0c
       add      r5,#'0'
       mov      (rr0)+,r5
pWORD_lead0c:
       mov      r5,r4
       and      r5,#0fh
       add      r5,#'0'
       mov      (rr0)+,r5
       popw     rr4
       ret








pstat_pnum:
       mov      r4,PLAYER_number(rr2)
       br       pstats_byte
pstat_weight:
       movw     rr4,PLAYER_weight(rr2)
       br       pstats_word
pstat_pgames:
       mov      r4,PLAYER_games(rr2)
       br       pstats_byte
pstat_sgames:
       mov      r4,PLAYER_starts(rr2)
       br       pstats_byte
pstat_points:
       movw     rr4,PLAYER_points(rr2)
       br       pstats_word
pstat_minutes:
       movw     rr4,PLAYER_minutes(rr2)
       br       pstats_word
pstat_offreb:
       movw     rr4,PLAYER_offreb(rr2)
       br       pstats_word
pstat_defreb:
       movw     rr4,PLAYER_defreb(rr2)
       br       pstats_word
pstat_blocks:
       movw     rr4,PLAYER_blocks(rr2)
       br       pstats_word
pstat_steals:
       movw     rr4,PLAYER_steals(rr2)
       br       pstats_word
pstat_assists:
       movw     rr4,PLAYER_assists(rr2)
       br       pstats_word
pstat_turnovers:
       movw     rr4,PLAYER_turnovers(rr2)
       br       pstats_word
pstat_fouls:
       movw     rr4,PLAYER_fouls(rr2)
       br       pstats_word
pstat_ejections:
       mov      r4,PLAYER_ejections(rr2)
       br       pstats_byte
pstats_word:
       call     hex2bncW
       call     printWORD
       clr      r4
       mov      (rr0)+,r4
       ret
pstats_byte:
       call     hex2bncB
       call     printBYTE
       clr      r4
       mov      (rr0)+,r4
       ret



pstat_height:
       clr      r4
       mov      r5,PLAYER_height(rr2)
       movw     rr6,#0ch
       div      rr4,rr6
       mov      r4,r5
       call     hex2bncB
       call     printBYTE
       mov      r4,#027h ;'
       mov      (rr0)+,r4
       mov      r4,r6
       call     hex2bncB
       call     printBYTE
       mov      r4,#022h ;"
       mov      (rr0)+,r4
       clr      r4
       mov      (rr0)+,r4
       ret

pstat_ptspgame:
       movw    rr4,PLAYER_points(rr2)
       clr     r6
       mov     r7,PLAYER_games(rr2)
       br      pstat_average
pstat_minpgame:
       movw    rr4,PLAYER_minutes(rr2)
       clr     r6
       mov     r7,PLAYER_games(rr2)
       br      pstat_average
pstat_average:
       div     rr4,rr6
       mov     r4,r5
       call    hex2bncB
       call    printBYTE
       mov     r4,#'.'
       mov     (rr0)+,r4
       clr     r4
       mov     r5,r6
       mult    rr4,#0ah
       div     rr4,rr6
       add     r5,#'0'
       mov     (rr0)+,r5
       clr     r4
       mov     (rr0)+,r4
       ret

pstat_fgoals:
       addw    rr2,#PLAYER_fgmade
       br      pstat_madeatt
pstat_3points:
       addw    rr2,#PLAYER_3ptmade
       br      pstat_madeatt
pstat_fthrows:
       addw    rr2,#PLAYER_ftmade
       br      pstat_madeatt
pstat_madeatt:
       movw    rr4,@rr2
       call    hex2bncW
       call    printWORD
       mov     r4,#'/'
       mov     (rr0)+,r4
       movw    rr4,2(rr2)
       call    hex2bncW
       call    printWORD
       clr     r4
       mov     (rr0)+,r4
       movw    rr2,#player_array
       ret



pstat_fgoalp:
       addw    rr2,#PLAYER_fgmade
       br      pstat_perc
pstat_3pointp:
       addw    rr2,#PLAYER_3ptmade
       br      pstat_perc
pstat_fthrowp:
       addw    rr2,#PLAYER_ftmade
       br      pstat_perc
pstat_perc:
       movw    rr4,@rr2
       movw    rr6,2(rr2)
       call    print_perc
       clr     r4
       mov     (rr0)+,r4
       movw    rr2,#player_array
       ret

print_perc:
       cmpw    rr6,#0
       br      ne,valid_perc
       mov     r2,#'-'
       mov     (rr0)+,r2
       br      pperc_exit
valid_perc:
       clr     r9
       call    pperc_digit
       mov     r2,#'.'
       mov     (rr0)+,r2
       mov     r9,#1
       call    pperc_digit
       call    pperc_digit
       call    pperc_digit
pperc_exit:
       clr     r2
       mov     (rr0)+,r2
       ret


pperc_digit:
       clr     r2
pperc_loop1:
       cmpw    rr4,rr6
       br      ult,pperc_exit1
       subw    rr4,rr6
       inc     r2
       br      pperc_loop1
pperc_exit1:
       or      r9,r2
       br      z,pperc_cont1
       add     r2,#'0'
       mov     (rr0)+,r2
pperc_cont1:
       movw    rr2,rr4
       addw    rr4,rr4
       addw    rr4,rr4
       addw    rr4,rr2
       addw    rr4,rr4
       ret




build_pstat_tab:
       defw     pstat_height
       defw     pstat_weight
       defw     pstat_pgames
       defw     pstat_sgames
       defw     pstat_points
       defw     pstat_ptspgame
       defw     pstat_minutes
       defw     pstat_minpgame
       defw     pstat_fgoals
       defw     pstat_fgoalp
       defw     pstat_3points
       defw     pstat_3pointp
       defw     pstat_fthrows
       defw     pstat_fthrowp
       defw     pstat_offreb
       defw     pstat_defreb
       defw     pstat_blocks
       defw     pstat_steals
       defw     pstat_assists
       defw     pstat_turnovers
       defw     pstat_fouls
       defw     pstat_ejections


position_strtable:
       defm     'CFG'

build_pstring0:
       movw     rr0,#RAM_string0
       movw     rr2,#player_array
       mov      r4,PLAYER_number(rr2)
       call     hex2bncB
       call     printBYTE_SP
       mov      r5,#' '
       mov      (rr0)+,r5

       mov      r5,PLAYER_position(rr2)
       clr      r4
       addw     rr4,#position_strtable
       mov      r4,@rr4
       mov      (rr0)+,r4
       mov      r4,#' '
       mov      (rr0)+,r4

       movw     rr4,rr2
       addw     rr4,#PLAYER_Lname

       mov      r7,#0
build_ploop:
       mov      r6,(rr4)+
       and      r6,#0dfh
       mov      (rr0)+,r6
       add      r7,#1
       cmp      r7,#0dh
       br       lt,build_ploop

       ret

build_pstring1:
       movw     rr0,#RAM_string1
       clr      r6
       mov      r7,trade_index1
       sll      r7
       addw     rr6,#build_pstat_tab
       movw     rr6,@rr6
       call     @rr6

       ret





show_trade_info:
       movw     rr0,trading_slot
       cmpw     rr0,#0
       br       eq,not_trading0

       call     get_player_info
       movw     rr2,#player_array
       mov      r0,PLAYER_team(rr2)
       sub      r0,#1h

       mov      r8,#0a0h
       cmp      r0,trade_index0
       br       eq,reorder_flag
       mov      r9,#028h
       mov      r8,#0a0h
       call     draw_team_logo

       mov      r8,#040h
reorder_flag:
       mov      r0,trade_index0
       mov      r9,#028h
       call     draw_team_logo

       movw     rr0,#SEASON_STRING2
       movw     page_ptr1,rr0
       call     print_string

       mov      r0,#0fch
       mov      hold_byte1,r0     ;dmpl
       mov      r0,#054h
       mov      index2,r0
       movw     rr0,trading_slot
       call     print_all_pstat

       mov      r0,#044h
       mov      index2,r0
       mov      r0,trade_index1
       call     print_stat_string
       br       yes_trading0

not_trading0:
       mov      r0,trade_index0
       mov      r9,#028h
       mov      r8,#0a0h
       call     draw_team_logo

       movw     rr0,#SEASON_STRING
       movw     page_ptr1,rr0
       call     print_string

       mov      r0,#054h
       mov      index2,r0
       mov      r0,trade_index1
       call     print_stat_string

yes_trading0:
       mov      r0,trade_index0
       call     get_team_list

       clr      r1
       mov      index3,r1
show_trade_loop:
       mov      r1,index3
       cmp      r1,#5
       br       ge,show_trade_exit

       mov      r0,#003h          ;palette
       mov      r2,trade_base
       add      r1,r2
       mov      r2,trade_index2
       cmp      r1,r2
       br       ne,show_tcont
       mov      r0,#0fch
show_tcont:
       mov      hold_byte1,r0     ;dmpl

       mov      r0,index3         ;yloc for info
       sll      r0
       sll      r0
       sll      r0
       add      r0,#064h
       mov      index2,r0

       mov      r1,index3
       add      r1,trade_base
       clr      r0
       sll      r1
       addw     rr0,#team_array
       movw     rr0,@rr0
       call     print_all_pstat

       mov      r1,index3
       add      r1,#1
       mov      index3,r1
       br       show_trade_loop
show_trade_exit:

       ret



f_select_4trade:
       movw     rr0,trading_slot
       cmpw     rr0,#0
       br       eq,start_trade

       call     get_player_info
       movw     rr2,#player_array
       mov      r0,PLAYER_team(rr2)
       sub      r0,#1h
       mov      trade_index0,r0
       movw     rr2,#0
       movw     trading_slot,rr2
       br       finalize_trade

start_trade:
       mov      r1,trade_index2
       add      r1,trade_base
       clr      r0
       sll      r1
       addw     rr0,#team_array
       movw     rr0,@rr0
       movw     trading_slot,rr0

       mov      r0,trade_index0
       sub      r0,#01h
       cmp      r0,#0
       br       ge,strade_cont0
       mov      r0,#28
strade_cont0:
       mov      trade_index0,r0

finalize_trade:
       ret


f_select_4reorder:
       movw     rr0,trading_slot
       cmpw     rr0,#0
       br       eq,start_reorder

       movw     rr2,#0
       movw     trading_slot,rr2
       br       finalize_reorder

start_reorder:
       mov      r1,trade_index2
       add      r1,trade_base
       clr      r0
       sll      r1
       addw     rr0,#team_array
       movw     rr0,@rr0
       movw     trading_slot,rr0

finalize_reorder:
       ret



;pid# in rr0
print_all_pstat:
;ASB       call     get_player_info
;ASB
;ASB       call     build_pstring0
;ASB       call     build_pstring1
;ASB
;ASB       mov      r0,#010h
;ASB       mov      index1,r0
;ASB       movw     rr2,#RAM_string0
;ASB       movw     page_ptr1,rr2
;ASB
;ASB       call     pstring_loop
;ASB
;ASB       mov      r0,#0a0h
;ASB       mov      index1,r0
;ASB       movw     rr2,#RAM_string1
;ASB       movw     page_ptr1,rr2
;ASB       call     center_align
;ASB       call     pstring_loop

       ret




print_stat_string:
;ASB       mov      r1,r0
;ASB       clr      r0
;ASB       sll      r1
;ASB       addw     rr0,#stats_stableB
;ASB       movw     rr2,@rr0
;ASB       cmpw     rr2,#0
;ASB       br       eq,only_1stat_str
;ASB
;ASB       pushw    rr0
;ASB       subw     rr0,#stats_stableB
;ASB       addw     rr0,#stats_stableA
;ASB       movw     rr2,@rr0
;ASB       movw     page_ptr1,rr2
;ASB       mov      r0,#003h
;ASB       mov      hold_byte1,r0     ;dmpl
;ASB       mov      r0,#0a0h
;ASB       mov      index1,r0
;ASB       mov      r0,index2
;ASB       sub      r0,#4
;ASB       mov      index2,r0
;ASB       call     center_align
;ASB       call     pstring_loop
;ASB       popw     rr0
;ASB
;ASB       movw     rr2,@rr0
;ASB       movw     page_ptr1,rr2
;ASB       mov      r0,index2
;ASB       add      r0,#8
;ASB       mov      index2,r0
;ASB       mov      r0,#0a0h
;ASB       mov      index1,r0
;ASB       call     center_align
;ASB       call     pstring_loop
;ASB
;ASB       br       done_stat_str

only_1stat_str:
;ASB       subw     rr0,#stats_stableB
;ASB       addw     rr0,#stats_stableA
;ASB       movw     rr2,@rr0
;ASB       movw     page_ptr1,rr2
;ASB       mov      r0,#03h
;ASB       mov      hold_byte1,r0     ;dmpl
;ASB       mov      r0,#0a0h
;ASB       mov      index1,r0
;ASB       call     center_align
;ASB       call     pstring_loop

done_stat_str:
       ret




draw_team_logo:
       mov      r1,r0
       sll      r1
       sll      r1
       add      r1,r0
       clr      r0
       addw     rr0,#teamlogo_table
       push     mmu4
       mov      r2,#table2_bank
       mov      mmu4,r2
       mov      r2,@rr0
       mov      r14,r2        ;ROM page
       clr      r13
       addw     rr0,#1
       movw     rr10,@rr0     ;xstart,ystart
       addw     rr0,#2
       movw     rr12,@rr0     ;xsize,ysize
       mov      r15,r12       ;center the image
       srl      r15
       sub      r8,r15
       mov      r15,r13
       srl      r15
       sub      r9,r15

       mov      r15,#00       ;1=trans/0=rep
       pop      mmu4
       call     CK_page
       push     dmpl
       mov      r0,#1bh
       mov      dmpl,r0
       call     Fi_graph
       pop      dmpl

       ret



block_menu:
;ASB       mov      r0,#03h
;ASB       mov      hold_byte1,r0     ;dmpl
;ASB       clr      r0
;ASB       mov      index2,r0
;ASB       mov      index1,r0
;ASB       mov      r1,r0
;ASB       movw     rr2,#BLOCK_MENU_STR1A
;ASB       movw     page_ptr1,rr2
;ASB       call     pstring_loop
;ASB
;ASB
;ASB       clr      r0
;ASB       mov      index0,r0
;ASBblock_loop1:
;ASB       mov      r0,index0
;ASB       cmp      r0,#152
;ASB       br       uge,block_exit1
;ASB
;ASB       mov      index2,r0
;ASB       add      r0,#8
;ASB       mov      index0,r0
;ASB       clr      r0
;ASB       mov      index1,r0
;ASB       movw     rr2,#BLOCK_MENU_STR2A
;ASB       movw     page_ptr1,rr2
;ASB       call     pstring_loop
;ASB
;ASB       br       block_loop1
;ASBblock_exit1:
;ASB
;ASB       mov      r0,#152
;ASB       mov      index2,r0
;ASB       clr      r0
;ASB       mov      index1,r0
;ASB       mov      r1,r0
;ASB       movw     rr2,#BLOCK_MENU_STR3A
;ASB       movw     page_ptr1,rr2
;ASB       call     pstring_loop

       ret


; index0 - str count
; page_ptr0 - menu_ptr
display_menu:
       movw     page_ptr0,rr2
       mov      hold_byte0,r0

       push     dmpl
       call     block_menu

       movw     rr2,page_ptr0
       movw     rr0,@rr2
       addw     rr2,#02
       movw     page_ptr0,rr2
       movw     page_ptr1,rr0
       mov      r0,#03h
       mov      hold_byte1,r0   ;palette
       call     print_string

       movw     rr2,page_ptr0
       movw     rr0,@rr2
       addw     rr2,#2
       movw     page_ptr0,rr2
       call     @rr0

       movw     rr2,page_ptr0
       mov      r0,(rr2)+
       mov      index0,r0
       clr      r0
       mov      icount,r0
       movw     rr0,@rr2
       movw     page_ptr0,rr0
       addw     rr2,#02
       pushw    rr2

tstring_loop:
       mov      r0,index0
       or       r0,r0
       br       z,tstring_exit

       movw     rr2,page_ptr0
       movw     page_ptr1,rr2
       addw     rr2,#4
       movw     page_ptr0,rr2
       mov      r0,#01bh
       mov      r1,menu_selection
       cmp      r1,icount
       br       ne,tstring_cont
       mov      r0,#0e4h
tstring_cont:
       mov      hold_byte1,r0   ;palette
       call     print_string

       mov      r0,index0
       dec      r0
       mov      index0,r0
       mov      r0,icount
       inc      r0
       mov      icount,r0
       br       tstring_loop
tstring_exit:

       popw     rr2
       mov      r0,icount
       call     display_options

       pop      dmpl
       ret







display_options:
;ASB       movw     page_ptr0,rr2
;ASB       mov      index0,r0
;ASB
;ASB       mov      r0,#03h
;ASB       mov      hold_byte1,r0     ;dmpl
;ASB
;ASBoptions_loop:
;ASB       mov      r0,index0
;ASB       or       r0,r0
;ASB       br       z,options_exit
;ASB       dec      r0
;ASB       mov      index0,r0
;ASB
;ASB       movw     rr2,page_ptr0
;ASB       movw     rr0,@rr2
;ASB       addw     rr2,#02
;ASB       movw     page_ptr0,rr2
;ASB       movw     rr2,rr0
;ASB
;ASB       mov      r1,(rr2)+
;ASB       or       r1,r1
;ASB       br       z,options_cont
;ASB
;ASB       movw     rr0,@rr2
;ASB       mov      r1,@rr0
;ASB       addw     rr2,#02
;ASB       mov      r0,(rr2)+
;ASB       mov      index2,r0
;ASB       mov      r0,(rr2)+
;ASB       mov      index1,r0
;ASB       clr      r0
;ASB       sll      r1
;ASB       addw     rr2,rr0
;ASB       movw     rr2,@rr2
;ASB       movw     page_ptr1,rr2
;ASB       call     pstring_loop
;ASBoptions_cont:
;ASB       br       options_loop
;ASB
;ASBoptions_exit:
       ret



;ASBprint_char:
;ASB       call     get_font_info
;ASB       mov      r0,index2
;ASB       mov      r9,r0          ;yloc
;ASB       mov      r0,index1
;ASB       mov      r8,r0          ;xloc
;ASB       mov      r15,#01        ;1=trans/0=rep
;ASB       call     CK_page
;ASB       push     dmpl
;ASB       mov      r0,#0e4h ;hold_byte1
;ASB       mov      dmpl,r0
;ASB       call     Fi_graph
;ASB       pop      dmpl
;ASB       ret



; index1 - xloc
; index2 - yloc
; page_ptr1 - string loc
; hold_byte1 - dmpl

;           Was y,x,addr.  I changed it to x,y,addr

            end
