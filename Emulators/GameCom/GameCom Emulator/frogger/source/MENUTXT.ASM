BLOCK_MENU_STR1A:
;ASB       defm     "abbbbbbbbbbbbbbbbbbbbbbbc"
;ASB       defb     0
BLOCK_MENU_STR2A:
;ASB       defm     "d                       e"
;ASB       defb     0
BLOCK_MENU_STR3A:
;ASB       defm     "fgggggggggggggggggggggggh"
;ASB       defb     0



MAIN_MENU_STR0:
;ASB       defm     "GAMExSELECT"
;ASB       defb     0
MAIN_MENU_STR1:
;ASB       defm     "MODE"
;ASB       defb     0
MAIN_MENU_STR2:
;ASB       defm     "RULES"
;ASB       defb     0
MAIN_MENU_STR3:
;ASB       defm     "LEVEL"
;ASB       defb     0
MAIN_MENU_STR4:
;ASB       defm     "QUARTER"
;ASB       defb     0
MAIN_MENU_STR5:
;ASB       defm     "SET OPTIONS"
;ASB       defb     0
MAIN_MENU_STR6:
;ASB       defm     "SET RULES"
;ASB       defb     0
MAIN_MENU_STR7:
;ASB       defm     "ROSTER SETUP"
;ASB       defb     0

MAIN_MENU_OPTIONS:
;ASB       defb     32,16
;ASB       defw     MAIN_MENU_STR1
;ASB       defb     48,16
;ASB       defw     MAIN_MENU_STR2
;ASB       defb     64,16
;ASB       defw     MAIN_MENU_STR3
;ASB       defb     80,16
;ASB       defw     MAIN_MENU_STR4
;ASB       defb     96,16
;ASB       defw     MAIN_MENU_STR5
;ASB       defb     112,16
;ASB       defw     MAIN_MENU_STR6
;ASB       defb     128,16
;ASB       defw     MAIN_MENU_STR7


MMENU_OPT1A:
;ASB       defm     "EXHIBITION"
;ASB       defb     0
MMENU_OPT1B:
;ASB       defm     "SEASON"
;ASB       defb     0
MMENU_OPT1C:
;ASB       defm     "PLAYOFFS"
;ASB       defb     0
MMENU_OPT1D:
;ASB       defm     "CONTINUE"
;ASB       defb     0
MMENU_OPT1:
;ASB       defb     4
;ASB       defw     game_mode
;ASB       defb     32,104
;ASB       defw     MMENU_OPT1A
;ASB       defw     MMENU_OPT1B
;ASB       defw     MMENU_OPT1C
;ASB       defw     MMENU_OPT1D
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,QUIT_OPTIONS,QUIT_OPTIONS,QUIT_OPTIONS,QUIT_OPTIONS
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,QUIT_OPTIONS,QUIT_OPTIONS,QUIT_OPTIONS,QUIT_OPTIONS
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,QUIT_OPTIONS,QUIT_OPTIONS,QUIT_OPTIONS,QUIT_OPTIONS
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,QUIT_OPTIONS,QUIT_OPTIONS,QUIT_OPTIONS,QUIT_OPTIONS


MMENU_OPT2A:
;ASB       defm     "ARCADE"
;ASB       defb     0
MMENU_OPT2B:
;ASB       defm     "SIMULATION"
;ASB       defb     0
MMENU_OPT2C:
;ASB       defm     "CUSTOM"
;ASB       defb     0
MMENU_OPT2:
;ASB       defb     3
;ASB       defw     game_rules
;ASB       defb     48,104
;ASB       defw     MMENU_OPT2A
;ASB       defw     MMENU_OPT2B
;ASB       defw     MMENU_OPT2C
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,NULL_FUNCTION,NULL_FUNCTION,NULL_FUNCTION,NULL_FUNCTION
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,NULL_FUNCTION,NULL_FUNCTION,NULL_FUNCTION,NULL_FUNCTION
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,NULL_FUNCTION,NULL_FUNCTION,NULL_FUNCTION,NULL_FUNCTION



MMENU_OPT3A:
;ASB       defm     "ALL STAR"
;ASB       defb     0
MMENU_OPT3B:
;ASB       defm     "ROOKIE"
;ASB       defb     0
MMENU_OPT3C:
;ASB       defm     "STARTER"
;ASB       defb     0
MMENU_OPT3:
;ASB       defb     3
;ASB       defw     game_level
;ASB       defb     64,104
;ASB       defw     MMENU_OPT3A
;ASB       defw     MMENU_OPT3B
;ASB       defw     MMENU_OPT3C
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,NULL_FUNCTION,NULL_FUNCTION,NULL_FUNCTION,NULL_FUNCTION
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,NULL_FUNCTION,NULL_FUNCTION,NULL_FUNCTION,NULL_FUNCTION
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,NULL_FUNCTION,NULL_FUNCTION,NULL_FUNCTION,NULL_FUNCTION



MMENU_OPT4A:
;ASB       defm     "3 MINUTES"
;ASB       defb     0
MMENU_OPT4B:
;ASB       defm     "5 MINUTES"
;ASB       defb     0
MMENU_OPT4C:
;ASB       defm     "8 MINUTES"
;ASB       defb     0
MMENU_OPT4D:
;ASB       defm     "12 MINUTES"
;ASB       defb     0
MMENU_OPT4:
;ASB       defb     4
;ASB       defw     game_quarter
;ASB       defb     80,104
;ASB       defw     MMENU_OPT4A
;ASB       defw     MMENU_OPT4B
;ASB       defw     MMENU_OPT4C
;ASB       defw     MMENU_OPT4D
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,NULL_FUNCTION,NULL_FUNCTION,NULL_FUNCTION,NULL_FUNCTION
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,NULL_FUNCTION,NULL_FUNCTION,NULL_FUNCTION,NULL_FUNCTION
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,NULL_FUNCTION,NULL_FUNCTION,NULL_FUNCTION,NULL_FUNCTION
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,NULL_FUNCTION,NULL_FUNCTION,NULL_FUNCTION,NULL_FUNCTION

NULL_OPTION_STR:
;ASB       defb     0


MMENU_OPT5:
;ASB       defb     1
;ASB       defw     null_option
;ASB       defb     96,104
;ASB       defw     NULL_OPTION_STR
;ASB       defb     DEC_SELECT,INC_SELECT,NULL_FUNCTION,NULL_FUNCTION,DOWN_TO_OPTIONS,DOWN_TO_OPTIONS,DOWN_TO_OPTIONS,DOWN_TO_OPTIONS

MMENU_OPT6:
;ASB       defb     1
;ASB       defw     null_option
;ASB       defb     96,104
;ASB       defw     NULL_OPTION_STR
;ASB       defb     DEC_SELECT,INC_SELECT,NULL_FUNCTION,NULL_FUNCTION,DOWN_TO_RULES,DOWN_TO_RULES,DOWN_TO_RULES,DOWN_TO_RULES


MMENU_OPT7:
;ASB       defb     1
;ASB       defw     null_option
;ASB       defb     96,104
;ASB       defw     NULL_OPTION_STR
;ASB       defb     DEC_SELECT,INC_SELECT,NULL_FUNCTION,NULL_FUNCTION,DOWN_TO_ROSTER,DOWN_TO_ROSTER,DOWN_TO_ROSTER,DOWN_TO_ROSTER


MAIN_MENU_NAME:
;ASB       defb     0,60
;ASB       defw     MAIN_MENU_STR0

MAIN_MENU_DESC:
;ASB       defw     MAIN_MENU_NAME
;ASB       defw     f_null_function
;ASB       defb     7
;ASB       defw     MAIN_MENU_OPTIONS
;ASB       defw     MMENU_OPT1
;ASB       defw     MMENU_OPT2
;ASB       defw     MMENU_OPT3
;ASB       defw     MMENU_OPT4
;ASB       defw     MMENU_OPT5
;ASB       defw     MMENU_OPT6
;ASB       defw     MMENU_OPT7


OPTION_MENU_STR0:
;ASB       defm     "SETxOPTIONS"
;ASB       defb     0
OPTION_MENU_STR1:
;ASB       defm     "MUSIC"
;ASB       defb     0
OPTION_MENU_STR2:
;ASB       defm     "SOUND FX"
;ASB       defb     0
OPTION_MENU_STR3:
;ASB       defm     "CROWD"
;ASB       defb     0
OPTION_MENU_STR4:
;ASB       defm     "COMPUTER ASSIST"
;ASB       defb     0
OPTION_MENU_STR5:
;ASB       defm     "SLO MO DUNKS"
;ASB       defb     0
OPTION_MENU_STR6:
;ASB       defm     "PLAYER STAR"
;ASB       defb     0
OPTION_MENU_STR7:
;ASB       defm     "SHOT CONTROL"
;ASB       defb     0
OPTION_MENU_STR8:
;ASB       defm     "ON SCREEN HELP"
;ASB       defb     0

OPTION_MENU_OPTIONS:
;ASB       defb     28,16
;ASB       defw     OPTION_MENU_STR1
;ASB       defb     44,16
;ASB       defw     OPTION_MENU_STR2
;ASB       defb     60,16
;ASB       defw     OPTION_MENU_STR3
;ASB       defb     76,16
;ASB       defw     OPTION_MENU_STR4
;ASB       defb     92,16
;ASB       defw     OPTION_MENU_STR5
;ASB       defb     108,16
;ASB       defw     OPTION_MENU_STR6
;ASB       defb     124,16
;ASB       defw     OPTION_MENU_STR7
;ASB       defb     140,16
;ASB       defw     OPTION_MENU_STR8


OMENU_OPT1A:
;ASB       defm     " ON"
;ASB       defb     0
OMENU_OPT1B:
;ASB       defm     "OFF"
;ASB       defb     0

OMENU_OPT6A:
;ASB       defm     "POSITION"
;ASB       defb     0
OMENU_OPT6B:
;ASB       defm     " NUMBER"
;ASB       defb     0

OMENU_OPT7A:
;ASB       defm     " MANUAL"
;ASB       defb     0
OMENU_OPT7B:
;ASB       defm     "AUTOMATIC"
;ASB       defb     0

OMENU_OPT1:
;ASB       defb     2
;ASB       defw     music_option
;ASB       defb     28,136
;ASB       defw     OMENU_OPT1A
;ASB       defw     OMENU_OPT1B
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,BACK_TO_MAIN4,BACK_TO_MAIN4,BACK_TO_MAIN4,BACK_TO_MAIN4
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,BACK_TO_MAIN4,BACK_TO_MAIN4,BACK_TO_MAIN4,BACK_TO_MAIN4

OMENU_OPT2:
;ASB       defb     2
;ASB       defw     sfx_option
;ASB       defb     44,136
;ASB       defw     OMENU_OPT1A
;ASB       defw     OMENU_OPT1B
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,BACK_TO_MAIN4,BACK_TO_MAIN4,BACK_TO_MAIN4,BACK_TO_MAIN4
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,BACK_TO_MAIN4,BACK_TO_MAIN4,BACK_TO_MAIN4,BACK_TO_MAIN4

OMENU_OPT3:
;ASB       defb     2
;ASB       defw     crowd_option
;ASB       defb     60,136
;ASB       defw     OMENU_OPT1A
;ASB       defw     OMENU_OPT1B
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,BACK_TO_MAIN4,BACK_TO_MAIN4,BACK_TO_MAIN4,BACK_TO_MAIN4
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,BACK_TO_MAIN4,BACK_TO_MAIN4,BACK_TO_MAIN4,BACK_TO_MAIN4

OMENU_OPT4:
;ASB       defb     2
;ASB       defw     cassist_option
;ASB       defb     76,136
;ASB       defw     OMENU_OPT1A
;ASB       defw     OMENU_OPT1B
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,BACK_TO_MAIN4,BACK_TO_MAIN4,BACK_TO_MAIN4,BACK_TO_MAIN4
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,BACK_TO_MAIN4,BACK_TO_MAIN4,BACK_TO_MAIN4,BACK_TO_MAIN4

OMENU_OPT5:
;ASB       defb     2
;ASB       defw     slomo_dunks_option
;ASB       defb     92,136
;ASB       defw     OMENU_OPT1A
;ASB       defw     OMENU_OPT1B
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,BACK_TO_MAIN4,BACK_TO_MAIN4,BACK_TO_MAIN4,BACK_TO_MAIN4
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,BACK_TO_MAIN4,BACK_TO_MAIN4,BACK_TO_MAIN4,BACK_TO_MAIN4

OMENU_OPT6:
;ASB       defb     2
;ASB       defw     player_star_option
;ASB       defb     108,120
;ASB       defw     OMENU_OPT6A
;ASB       defw     OMENU_OPT6B
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,BACK_TO_MAIN4,BACK_TO_MAIN4,BACK_TO_MAIN4,BACK_TO_MAIN4
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,BACK_TO_MAIN4,BACK_TO_MAIN4,BACK_TO_MAIN4,BACK_TO_MAIN4

OMENU_OPT7:
;ASB       defb     2
;ASB       defw     shot_control_option
;ASB       defb     124,120
;ASB       defw     OMENU_OPT7A
;ASB       defw     OMENU_OPT7B
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,BACK_TO_MAIN4,BACK_TO_MAIN4,BACK_TO_MAIN4,BACK_TO_MAIN4
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,BACK_TO_MAIN4,BACK_TO_MAIN4,BACK_TO_MAIN4,BACK_TO_MAIN4

OMENU_OPT8:
;ASB       defb     2
;ASB       defw     onscreen_help_option
;ASB       defb     140,136
;ASB       defw     OMENU_OPT1A
;ASB       defw     OMENU_OPT1B
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,BACK_TO_MAIN4,BACK_TO_MAIN4,BACK_TO_MAIN4,BACK_TO_MAIN4
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,BACK_TO_MAIN4,BACK_TO_MAIN4,BACK_TO_MAIN4,BACK_TO_MAIN4


OPTION_MENU_NAME:
;ASB       defb     0,60
;ASB       defw     OPTION_MENU_STR0

OPTION_MENU_DESC:
;ASB       defw     OPTION_MENU_NAME
;ASB       defw     f_null_function
;ASB       defb     8
;ASB       defw     OPTION_MENU_OPTIONS
;ASB       defw     OMENU_OPT1
;ASB       defw     OMENU_OPT2
;ASB       defw     OMENU_OPT3
;ASB       defw     OMENU_OPT4
;ASB       defw     OMENU_OPT5
;ASB       defw     OMENU_OPT6
;ASB       defw     OMENU_OPT7
;ASB       defw     OMENU_OPT8




RULES_MENU_STR0:
;ASB       defm     "SETxRULES"
;ASB       defb     0
RULES_MENU_STR1:
;ASB       defm     "DEFENSIVE FOULS"
;ASB       defb     0
RULES_MENU_STR2:
;ASB       defm     "CHARGING"
;ASB       defb     0
RULES_MENU_STR3:
;ASB       defm     "FOUL OUT"
;ASB       defb     0
RULES_MENU_STR4:
;ASB       defm     "OUT OF BOUNDS"
;ASB       defb     0
RULES_MENU_STR5:
;ASB       defm     "BACKCOURT"
;ASB       defb     0
RULES_MENU_STR6:
;ASB       defm     "TRAVELLING"
;ASB       defb     0
RULES_MENU_STR7:
;ASB       defm     "GOALTENDING"
;ASB       defb     0
RULES_MENU_STR8:
;ASB       defm     "3 IN THE KEY"
;ASB       defb     0
RULES_MENU_STR9:
;ASB       defm     "SHOT CLOCK"
;ASB       defb     0
RULES_MENU_STR10:
;ASB       defm     "INBOUND CLOCK"
;ASB       defb     0
RULES_MENU_STR11:
;ASB       defm     "HALFCOURT CLOCK"
;ASB       defb     0
RULES_MENU_STR12:
;ASB       defm     "INJURIES"
;ASB       defb     0
RULES_MENU_STR13:
;ASB       defm     "FATIGUE"
;ASB       defb     0

RULES_MENU_OPTIONS:
;ASB       defb     24,16
;ASB       defw     RULES_MENU_STR1
;ASB       defb     34,16
;ASB       defw     RULES_MENU_STR2
;ASB       defb     44,16
;ASB       defw     RULES_MENU_STR3
;ASB       defb     54,16
;ASB       defw     RULES_MENU_STR4
;ASB       defb     64,16
;ASB       defw     RULES_MENU_STR5
;ASB       defb     74,16
;ASB       defw     RULES_MENU_STR6
;ASB       defb     84,16
;ASB       defw     RULES_MENU_STR7
;ASB       defb     94,16
;ASB       defw     RULES_MENU_STR8
;ASB       defb     104,16
;ASB       defw     RULES_MENU_STR9
;ASB       defb     114,16
;ASB       defw     RULES_MENU_STR10
;ASB       defb     124,16
;ASB       defw     RULES_MENU_STR11
;ASB       defb     134,16
;ASB       defw     RULES_MENU_STR12
;ASB       defb     144,16
;ASB       defw     RULES_MENU_STR13


RMENU_OPT1A:
;ASB       defm     "0"
;ASB       defb     0
RMENU_OPT1B:
;ASB       defm     "1"
;ASB       defb     0
RMENU_OPT1C:
;ASB       defm     "2"
;ASB       defb     0
RMENU_OPT1D:
;ASB       defm     "3"
;ASB       defb     0
RMENU_OPT1E:
;ASB       defm     "4"
;ASB       defb     0
RMENU_OPT1F:
;ASB       defm     "5"
;ASB       defb     0
RMENU_OPT1G:
;ASB       defm     "6"
;ASB       defb     0
RMENU_OPT1H:
;ASB       defm     "7"
;ASB       defb     0
RMENU_OPT1I:
;ASB       defm     "8"
;ASB       defb     0
RMENU_OPT1J:
;ASB       defm     "9"
;ASB       defb     0

RMENU_OPT3A:
;ASB       defm     "ON"
;ASB       defb     0
RMENU_OPT3B:
;ASB       defm     "OFF"
;ASB       defb     0


RMENU_OPT1:
;ASB       defb     10
;ASB       defw     rule_dfoul
;ASB       defb     24,152
;ASB       defw     RMENU_OPT1A
;ASB       defw     RMENU_OPT1B
;ASB       defw     RMENU_OPT1C
;ASB       defw     RMENU_OPT1D
;ASB       defw     RMENU_OPT1E
;ASB       defw     RMENU_OPT1F
;ASB       defw     RMENU_OPT1G
;ASB       defw     RMENU_OPT1H
;ASB       defw     RMENU_OPT1I
;ASB       defw     RMENU_OPT1J
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5

RMENU_OPT2:
;ASB       defb     10
;ASB       defw     rule_charging
;ASB       defb     34,152
;ASB       defw     RMENU_OPT1A
;ASB       defw     RMENU_OPT1B
;ASB       defw     RMENU_OPT1C
;ASB       defw     RMENU_OPT1D
;ASB       defw     RMENU_OPT1E
;ASB       defw     RMENU_OPT1F
;ASB       defw     RMENU_OPT1G
;ASB       defw     RMENU_OPT1H
;ASB       defw     RMENU_OPT1I
;ASB       defw     RMENU_OPT1J
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5


RMENU_OPT3:
;ASB       defb     2
;ASB       defw     rule_foulout
;ASB       defb     44,152
;ASB       defw     RMENU_OPT3A
;ASB       defw     RMENU_OPT3B
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5

RMENU_OPT4:
;ASB       defb     2
;ASB       defw     rule_outofbounds
;ASB       defb     54,152
;ASB       defw     RMENU_OPT3A
;ASB       defw     RMENU_OPT3B
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5

RMENU_OPT5:
;ASB       defb     2
;ASB       defw     rule_backcourt
;ASB       defb     64,152
;ASB       defw     RMENU_OPT3A
;ASB       defw     RMENU_OPT3B
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5

RMENU_OPT6:
;ASB       defb     2
;ASB       defw     rule_travelling
;ASB       defb     74,152
;ASB       defw     RMENU_OPT3A
;ASB       defw     RMENU_OPT3B
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5

RMENU_OPT7:
;ASB       defb     2
;ASB       defw     rule_goaltending
;ASB       defb     84,152
;ASB       defw     RMENU_OPT3A
;ASB       defw     RMENU_OPT3B
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5

RMENU_OPT8:
;ASB       defb     2
;ASB       defw     rule_3inthekey
;ASB       defb     94,152
;ASB       defw     RMENU_OPT3A
;ASB       defw     RMENU_OPT3B
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5

RMENU_OPT9:
;ASB       defb     2
;ASB       defw     rule_shot_clock
;ASB       defb     104,152
;ASB       defw     RMENU_OPT3A
;ASB       defw     RMENU_OPT3B
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5

RMENU_OPT10:
;ASB       defb     2
;ASB       defw     rule_inbound_clock
;ASB       defb     114,152
;ASB       defw     RMENU_OPT3A
;ASB       defw     RMENU_OPT3B
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5

RMENU_OPT11:
;ASB       defb     2
;ASB       defw     rule_halfcourt_clock
;ASB       defb     124,152
;ASB       defw     RMENU_OPT3A
;ASB       defw     RMENU_OPT3B
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5

RMENU_OPT12:
;ASB       defb     2
;ASB       defw     rule_injuries
;ASB       defb     134,152
;ASB       defw     RMENU_OPT3A
;ASB       defw     RMENU_OPT3B
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5

RMENU_OPT13:
;ASB       defb     2
;ASB       defw     rule_fatigue
;ASB       defb     144,152
;ASB       defw     RMENU_OPT3A
;ASB       defw     RMENU_OPT3B
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5,BACK_TO_MAIN5

RULES_MENU_NAME:
;ASB       defb     0,60
;ASB       defw     RULES_MENU_STR0
;ASB
RULES_MENU_DESC:
;ASB       defw     RULES_MENU_NAME
;ASB       defw     f_null_function
;ASB       defb     13
;ASB       defw     RULES_MENU_OPTIONS
;ASB       defw     RMENU_OPT1
;ASB       defw     RMENU_OPT2
;ASB       defw     RMENU_OPT3
;ASB       defw     RMENU_OPT4
;ASB       defw     RMENU_OPT5
;ASB       defw     RMENU_OPT6
;ASB       defw     RMENU_OPT7
;ASB       defw     RMENU_OPT8
;ASB       defw     RMENU_OPT9
;ASB       defw     RMENU_OPT10
;ASB       defw     RMENU_OPT11
;ASB       defw     RMENU_OPT12
;ASB       defw     RMENU_OPT13



ROSTER_MENU_STR0:
;ASB       defm     "ROSTERxSETUP"
;ASB       defb     0
ROSTER_MENU_STR1:
;ASB       defm     "TRADE PLAYERS"
;ASB       defb     0
ROSTER_MENU_STR2:
;ASB       defm     "REORDER ROSTER"
;ASB       defb     0
ROSTER_MENU_STR3:
;ASB       defm     "CREATE PLAYER"
;ASB       defb     0
ROSTER_MENU_STR4:
;ASB       defm     "EDIT PLAYER"
;ASB       defb     0
ROSTER_MENU_STR5:
;ASB       defm     "DELETE PLAYER"
;ASB       defb     0
ROSTER_MENU_STR6:
;ASB       defm     "RETURN TO MAIN MENU"
;ASB       defb     0

ROSTER_MENU_OPTIONS:
;ASB       defb     32,48
;ASB       defw     ROSTER_MENU_STR1
;ASB       defb     48,44
;ASB       defw     ROSTER_MENU_STR2
;ASB       defb     64,48
;ASB       defw     ROSTER_MENU_STR3
;ASB       defb     80,46
;ASB       defw     ROSTER_MENU_STR4
;ASB       defb     96,48
;ASB       defw     ROSTER_MENU_STR5
;ASB       defb     112,28
;ASB       defw     ROSTER_MENU_STR6


ROSTER_OPT1:
;ASB       defb     1
;ASB       defw     null_option
;ASB       defb     24,152
;ASB       defw     NULL_OPTION_STR
;ASB       defb     DEC_SELECT,INC_SELECT,NULL_FUNCTION,NULL_FUNCTION,DOWN_TO_TRADE,DOWN_TO_TRADE,DOWN_TO_TRADE,DOWN_TO_TRADE

ROSTER_OPT2:
;ASB       defb     1
;ASB       defw     null_option
;ASB       defb     24,152
;ASB       defw     NULL_OPTION_STR
;ASB       defb     DEC_SELECT,INC_SELECT,NULL_FUNCTION,NULL_FUNCTION,DOWN_TO_REORDER,DOWN_TO_REORDER,DOWN_TO_REORDER,DOWN_TO_REORDER

ROSTER_OPT3:
;ASB       defb     1
;ASB       defw     null_option
;ASB       defb     24,152
;ASB       defw     NULL_OPTION_STR
;ASB       defb     DEC_SELECT,INC_SELECT,NULL_FUNCTION,NULL_FUNCTION,DOWN_TO_CREATE,DOWN_TO_CREATE,DOWN_TO_CREATE,DOWN_TO_CREATE

ROSTER_OPT4:
;ASB       defb     1
;ASB       defw     null_option
;ASB       defb     24,152
;ASB       defw     NULL_OPTION_STR
;ASB       defb     DEC_SELECT,INC_SELECT,NULL_FUNCTION,NULL_FUNCTION,NULL_FUNCTION,NULL_FUNCTION,NULL_FUNCTION,NULL_FUNCTION


ROSTER_OPT5:
;ASB       defb     1
;ASB       defw     null_option
;ASB       defb     24,152
;ASB       defw     NULL_OPTION_STR
;ASB       defb     DEC_SELECT,INC_SELECT,NULL_FUNCTION,NULL_FUNCTION,DOWN_TO_DELETE,DOWN_TO_DELETE,DOWN_TO_DELETE,DOWN_TO_DELETE

ROSTER_OPT6:
;ASB       defb     1
;ASB       defw     null_option
;ASB       defb     24,152
;ASB       defw     NULL_OPTION_STR
;ASB       defb     DEC_SELECT,INC_SELECT,NULL_FUNCTION,NULL_FUNCTION,BACK_TO_MAIN6,BACK_TO_MAIN6,BACK_TO_MAIN6,BACK_TO_MAIN6

ROSTER_MENU_NAME:
;ASB       defb     0,52
;ASB       defw     ROSTER_MENU_STR0

ROSTER_MENU_DESC:
;ASB       defw     ROSTER_MENU_NAME
;ASB       defw     f_null_function
;ASB       defb     6
;ASB       defw     ROSTER_MENU_OPTIONS
;ASB       defw     ROSTER_OPT1
;ASB       defw     ROSTER_OPT2
;ASB       defw     ROSTER_OPT3
;ASB       defw     ROSTER_OPT4
;ASB       defw     ROSTER_OPT5
;ASB       defw     ROSTER_OPT6



TRADE_MENU_STR0:
;ASB       defm     "TRADExPLAYERS"
;ASB       defb     0
TRADE_MENU_STR1:
;ASB       defb     0

TRADE_MENU_OPTIONS:
;ASB       defb     48,24
;ASB       defw     TRADE_MENU_STR1


TRADE_OPT1:
;ASB       defb     1
;ASB       defw     null_option
;ASB       defb     24,152
;ASB       defw     NULL_OPTION_STR
;ASB       defb     DEC_PLAYER,INC_PLAYER,DEC_STATLOC,INC_STATLOC,DEC_TEAM,SELECT_4TRADE,INC_TEAM,BACK_TO_ROSTER0

TRADE_MENU_NAME:
;ASB       defb     0,52
;ASB       defw     TRADE_MENU_STR0

TRADE_MENU_DESC:
;ASB       defw     TRADE_MENU_NAME
;ASB       defw     show_trade_info
;ASB       defb     1
;ASB       defw     TRADE_MENU_OPTIONS
;ASB       defw     TRADE_OPT1



REORDER_MENU_STR0:
;ASB       defm     "REORDERxROSTER"
;ASB       defb     0
REORDER_OPT1:
;ASB       defb     1
;ASB       defw     null_option
;ASB       defb     24,152
;ASB       defw     NULL_OPTION_STR
;ASB       defb     DEC_PLAYER,INC_PLAYER,DEC_STATLOC,INC_STATLOC,DEC_TEAMX,SELECT_4REORDER,INC_TEAMX,BACK_TO_ROSTER1

REORDER_MENU_NAME:
;ASB       defb     0,52
;ASB       defw     REORDER_MENU_STR0

REORDER_MENU_DESC:
;ASB       defw     REORDER_MENU_NAME
;ASB       defw     show_trade_info
;ASB       defb     1
;ASB       defw     TRADE_MENU_OPTIONS
;ASB       defw     REORDER_OPT1


CREATE1_MENU_S0:
;ASB       defm     "ENTERxLASTxNAME"
;ASB       defb     0
CREATE1_MENU_S1:
;ASB       defb     0

CREATE1_MENU_OPTIONS:
;ASB       defb     48,24
;ASB       defw     CREATE1_MENU_S1


CREATE1_OPT1:
;ASB       defb     1
;ASB       defw     null_option
;ASB       defb     24,152
;ASB       defw     NULL_OPTION_STR
;ASB       defb     DEC_LETTER10,INC_LETTER10,DEC_LETTER,INC_LETTER,DELETE_LETTER,ENTER_LETTER,BACK_TO_ROSTER2,BACK_TO_ROSTER2

CREATE1_MENU_NAME:
;ASB       defb     0,40
;ASB       defw     CREATE1_MENU_S0

CREATE1_MENU_DESC:
;ASB       defw     CREATE1_MENU_NAME
;ASB       defw     show_keyboard_info
;ASB       defb     1
;ASB       defw     CREATE1_MENU_OPTIONS
;ASB       defw     CREATE1_OPT1



CREATE2_MENU_S0:
;ASB       defm     "ENTERxFIRSTxNAME"
;ASB       defb     0
CREATE2_MENU_S1:
;ASB       defb     0

CREATE2_MENU_OPTIONS:
;ASB       defb     48,24
;ASB       defw     CREATE2_MENU_S1


CREATE2_OPT1:
;ASB       defb     1
;ASB       defw     null_option
;ASB       defb     24,152
;ASB       defw     NULL_OPTION_STR
;ASB       defb     DEC_LETTER10,INC_LETTER10,DEC_LETTER,INC_LETTER,DELETE_LETTER,ENTER_LETTER,BACK_TO_CREATE1,BACK_TO_CREATE1

CREATE2_MENU_NAME:
;ASB       defb     0,40
;ASB       defw     CREATE2_MENU_S0

CREATE2_MENU_DESC:
;ASB       defw     CREATE2_MENU_NAME
;ASB       defw     show_keyboard_info
;ASB       defb     1
;ASB       defw     CREATE2_MENU_OPTIONS
;ASB       defw     CREATE2_OPT1





CREATE3_MENU_S0:
;ASB       defm     "CREATExPLAYER"
;ASB       defb     0
CREATE3_MENU_S1:
;ASB       defm     "NAME:"
;ASB       defb     0
CREATE3_MENU_S2:
;ASB       defm     "HEAD:"
;ASB       defb     0
CREATE3_MENU_S3:
;ASB       defm     "PLAYER:"
;ASB       defb     0
CREATE3_MENU_S4:
;ASB       defm     "JERSEY:"
;ASB       defb     0
CREATE3_MENU_S5:
;ASB       defm     "HEIGHT:"
;ASB       defb     0
CREATE3_MENU_S6:
;ASB       defm     "WEIGHT:"
;ASB       defb     0
CREATE3_MENU_S7:
;ASB       defm     "HAND:"
;ASB       defb     0
CREATE3_MENU_S8:
;ASB       defm     "POSITION:"
;ASB       defb     0
CREATE3_MENU_S9:
;ASB       defm     "SET ATTRIBUTES"
;ASB       defb     0

CREATE3_MENU_OPTIONS:
;ASB       defb     32,24
;ASB       defw     CREATE3_MENU_S1
;ASB       defb     32,24
;ASB       defw     CREATE3_MENU_S1
;ASB       defb     44,24
;ASB       defw     CREATE3_MENU_S2
;ASB       defb     56,24
;ASB       defw     CREATE3_MENU_S3
;ASB       defb     68,24
;ASB       defw     CREATE3_MENU_S4
;ASB       defb     80,24
;ASB       defw     CREATE3_MENU_S5
;ASB       defb     92,24
;ASB       defw     CREATE3_MENU_S6
;ASB       defb     104,24
;ASB       defw     CREATE3_MENU_S7
;ASB       defb     116,24
;ASB       defw     CREATE3_MENU_S8
;ASB       defb     128,24
;ASB       defw     CREATE3_MENU_S9


CREATE3_OPT1F
;ASB       defb     1
;ASB       defw     null_option
;ASB       defb     24,152
;ASB       defw     NULL_OPTION_STR
;ASB       defb     DEC_SELECT,INC_SELECT,NULL_FUNCTION,NULL_FUNCTION,BACK_TO_CREATE2,BACK_TO_CREATE2,BACK_TO_CREATE2,BACK_TO_CREATE2

CREATE3_OPT1L
;ASB       defb     1
;ASB       defw     null_option
;ASB       defb     24,152
;ASB       defw     NULL_OPTION_STR
;ASB       defb     DEC_SELECT,INC_SELECT,NULL_FUNCTION,NULL_FUNCTION,BACK_TO_CREATE1,BACK_TO_CREATE1,BACK_TO_CREATE1,BACK_TO_CREATE1

CREATE3_OPT1:
;ASB       defb     1
;ASB       defw     null_option
;ASB       defb     24,152
;ASB       defw     NULL_OPTION_STR
;ASB       defb     DEC_SELECT,INC_SELECT,NULL_FUNCTION,NULL_FUNCTION,END_CREATE,END_CREATE,END_CREATE,END_CREATE

CMENU3_OPT3A:
;ASB       defm     "1"
;ASB       defb     0
CMENU3_OPT3B:
;ASB       defm     "2"
;ASB       defb     0
CMENU3_OPT3C:
;ASB       defm     "3"
;ASB       defb     0
CMENU3_OPT3D:
;ASB       defm     "4"
;ASB       defb     0

CREATE3_OPT3:
;ASB       defb     4
;ASB       defw     player_stype
;ASB       defb     56,104
;ASB       defw     CMENU3_OPT3A
;ASB       defw     CMENU3_OPT3B
;ASB       defw     CMENU3_OPT3C
;ASB       defw     CMENU3_OPT3D
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,END_CREATE,END_CREATE,END_CREATE,END_CREATE
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,END_CREATE,END_CREATE,END_CREATE,END_CREATE
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,END_CREATE,END_CREATE,END_CREATE,END_CREATE
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,END_CREATE,END_CREATE,END_CREATE,END_CREATE


CREATE3_OPT4:
;ASB       defb     1
;ASB       defw     null_option
;ASB       defb     24,152
;ASB       defw     NULL_OPTION_STR
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_PNUM,INC_PNUM,END_CREATE,END_CREATE,END_CREATE,END_CREATE


CREATE3_OPT5:
;ASB       defb     1
;ASB       defw     null_option
;ASB       defb     24,152
;ASB       defw     NULL_OPTION_STR
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_PHEIGHT,INC_PHEIGHT,END_CREATE,END_CREATE,END_CREATE,END_CREATE


CREATE3_OPT6:
;ASB       defb     1
;ASB       defw     null_option
;ASB       defb     24,152
;ASB       defw     NULL_OPTION_STR
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_PWEIGHT,INC_PWEIGHT,END_CREATE,END_CREATE,END_CREATE,END_CREATE



CMENU3_OPT7A:
;ASB       defm     "RIGHT"
;ASB       defb     0
CMENU3_OPT7B:
;ASB       defm     "LEFT"
;ASB       defb     0

CREATE3_OPT7:
;ASB       defb     2
;ASB       defw     player_handed
;ASB       defb     104,104
;ASB       defw     CMENU3_OPT7A
;ASB       defw     CMENU3_OPT7B
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,END_CREATE,END_CREATE,END_CREATE,END_CREATE
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,END_CREATE,END_CREATE,END_CREATE,END_CREATE


CREATE3_OPT8:
;ASB       defb     1
;ASB       defw     null_option
;ASB       defb     116,104
;ASB       defw     NULL_OPTION_STR
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_POSITION,INC_POSITION,END_CREATE,END_CREATE,END_CREATE,END_CREATE


CREATE3_OPT9:
;ASB       defb     1
;ASB       defw     null_option
;ASB       defb     104,104
;ASB       defw     NULL_OPTION_STR
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_VALUE,INC_VALUE,DOWN_TO_CREATE4,DOWN_TO_CREATE4,DOWN_TO_CREATE4,DOWN_TO_CREATE4


CREATE3_MENU_NAME:
;ASB       defb     0,40
;ASB       defw     CREATE3_MENU_S0

CREATE3_MENU_DESC:
;ASB       defw     CREATE3_MENU_NAME
;ASB       defw     show_create3_info
;ASB       defb     10
;ASB       defw     CREATE3_MENU_OPTIONS
;ASB       defw     CREATE3_OPT1F
;ASB       defw     CREATE3_OPT1L
;ASB       defw     CREATE3_OPT1
;ASB       defw     CREATE3_OPT3
;ASB       defw     CREATE3_OPT4
;ASB       defw     CREATE3_OPT5
;ASB       defw     CREATE3_OPT6
;ASB       defw     CREATE3_OPT7
;ASB       defw     CREATE3_OPT8
;ASB       defw     CREATE3_OPT9




CREATE4_MENU_S0:
;ASB       defm     "SETxATTRIBUTES"
;ASB       defb     0
CREATE4_MENU_S1:
;ASB       defm     "SCORING:"
;ASB       defb     0
CREATE4_MENU_S2:
;ASB       defm     "REBOUND"
;ASB       defb     0
CREATE4_MENU_S3:
;ASB       defm     "CONTROL:"
;ASB       defb     0
CREATE4_MENU_S4:
;ASB       defm     "DEFENSE:"
;ASB       defb     0
CREATE4_MENU_S5:
;ASB       defm     "OVERALL:"
;ASB       defb     0

CREATE4_MENU_OPTIONS:
;ASB       defb     46,24
;ASB       defw     CREATE4_MENU_S1
;ASB       defb     58,24
;ASB       defw     CREATE4_MENU_S2
;ASB       defb     70,24
;ASB       defw     CREATE4_MENU_S3
;ASB       defb     82,24
;ASB       defw     CREATE4_MENU_S4
;ASB       defb     94,24
;ASB       defw     CREATE4_MENU_S5


CREATE4_OPT1:
;ASB       defb     1
;ASB       defw     null_option
;ASB       defb     24,152
;ASB       defw     NULL_OPTION_STR
;ASB       defb     DEC_SELECT,INC_SELECT,DEC_SVALUE,INC_SVALUE,BACK_TO_CREATE3,BACK_TO_CREATE3,BACK_TO_CREATE3,BACK_TO_CREATE3



CREATE4_MENU_NAME:
;ASB       defb     0,40
;ASB       defw     CREATE4_MENU_S0

CREATE4_MENU_DESC:
;ASB       defw     CREATE4_MENU_NAME
;ASB       defw     f_null_function
;ASB       defb     5
;ASB       defw     CREATE4_MENU_OPTIONS
;ASB       defw     CREATE4_OPT1
;ASB       defw     CREATE4_OPT1
;ASB       defw     CREATE4_OPT1
;ASB       defw     CREATE4_OPT1
;ASB       defw     CREATE4_OPT1




DELETE_MENU_STR0:
;ASB       defm     "DELETExPLAYER"
;ASB       defb     0
DELETE_MENU_STR1:
;ASB       defb     0

DELETE_MENU_OPTIONS:
;ASB       defb     48,24
;ASB       defw     DELETE_MENU_STR1


DELETE_OPT1:
;ASB       defb     1
;ASB       defw     null_option
;ASB       defb     24,152
;ASB       defw     NULL_OPTION_STR
;ASB       defb     DEC_PDELETE,INC_PDELETE,NULL_FUNCTION,NULL_FUNCTION,BACK_TO_ROSTER4,BACK_TO_ROSTER4,BACK_TO_ROSTER4,BACK_TO_ROSTER4

DELETE_MENU_NAME:
;ASB       defb     0,52
;ASB       defw     DELETE_MENU_STR0

DELETE_MENU_DESC:
;ASB       defw     DELETE_MENU_NAME
;ASB       defw     show_delete_info
;ASB       defb     1
;ASB       defw     DELETE_MENU_OPTIONS
;ASB       defw     DELETE_OPT1




SEASON_STR0:
;ASB       defm     '98/99 SEASON'
;ASB       defb     0
SEASON_STRING:
;ASB       defb     84,16
;ASB       defw     SEASON_STR0
SEASON_STRING2:
;ASB       defb     68,16
;ASB       defw     SEASON_STR0

STATS_STR0A:
;ASB       defm     'HEIGHT'
;ASB       defb     0
STATS_STR1A:
;ASB       defm     'WEIGHT'
;ASB       defb     0
STATS_STR2A:
;ASB       defm     'GAMES'
;ASB       defb     0
STATS_STR2B:
;ASB       defm     'PLAYED'
;ASB       defb     0
STATS_STR3B:
;ASB       defm     'STARTED'
;ASB       defb     0
STATS_STR4A:
;ASB       defm     'TOTAL'
;ASB       defb     0
STATS_STR4B:
;ASB       defm     'POINTS'
;ASB       defb     0
STATS_STR5A:
;ASB       defm     'POINTS'
;ASB       defb     0
STATS_STR5B:
;ASB       defm     'PER GAME'
;ASB       defb     0
STATS_STR6A:
;ASB       defm     'TOTAL'
;ASB       defb     0
STATS_STR6B:
;ASB       defm     'MINUTES'
;ASB       defb     0
STATS_STR7A:
;ASB       defm     'MINUTES'
;ASB       defb     0
STATS_STR7B:
;ASB       defm     'PER GAME'
;ASB       defb     0
STATS_STR8A:
;ASB       defm     'FG'
;ASB       defb     0
STATS_STR8B:
;ASB       defm     'MADE ATT'
;ASB       defb     0
STATS_STR9B:
;ASB       defm     'PERCENTAGE'
;ASB       defb     0
STATS_STR10A:
;ASB       defm     '3 POINT'
;ASB       defb     0
STATS_STR12A:
;ASB       defm     'FREE THROW'
;ASB       defb     0
STATS_STR14A:
;ASB       defm     'OFFENSIVE'
;ASB       defb     0
STATS_STR14B:
;ASB       defm     'REBOUNDS'
;ASB       defb     0
STATS_STR15A:
;ASB       defm     'DEFENSIVE'
;ASB       defb     0
STATS_STR16A:
;ASB       defm     'BLOCKS'
;ASB       defb     0
STATS_STR17A:
;ASB       defm     'STEALS'
;ASB       defb     0
STATS_STR18A:
;ASB       defm     'ASSISTS'
;ASB       defb     0
STATS_STR19A:
;ASB       defm     'TURNOVERS'
;ASB       defb     0
STATS_STR20A:
;ASB       defm     'FOULS'
;ASB       defb     0
STATS_STR21A:
;ASB       defm     'EJECTIONS'
;ASB       defb     0

stats_stableA:
;ASB       defw     STATS_STR0A
;ASB       defw     STATS_STR1A
;ASB       defw     STATS_STR2A
;ASB       defw     STATS_STR2A
;ASB       defw     STATS_STR4A
;ASB       defw     STATS_STR5A
;ASB       defw     STATS_STR6A
;ASB       defw     STATS_STR7A
;ASB       defw     STATS_STR8A
;ASB       defw     STATS_STR8A
;ASB       defw     STATS_STR10A
;ASB       defw     STATS_STR10A
;ASB       defw     STATS_STR12A
;ASB       defw     STATS_STR12A
;ASB       defw     STATS_STR14A
;ASB       defw     STATS_STR15A
;ASB       defw     STATS_STR16A
;ASB       defw     STATS_STR17A
;ASB       defw     STATS_STR18A
;ASB       defw     STATS_STR19A
;ASB       defw     STATS_STR20A
;ASB       defw     STATS_STR21A

stats_stableB:
;ASB       defw     0
;ASB       defw     0
;ASB       defw     STATS_STR2B
;ASB       defw     STATS_STR3B
;ASB       defw     STATS_STR4B
;ASB       defw     STATS_STR5B
;ASB       defw     STATS_STR6B
;ASB       defw     STATS_STR7B
;ASB       defw     STATS_STR8B
;ASB       defw     STATS_STR9B
;ASB       defw     STATS_STR8B
;ASB       defw     STATS_STR9B
;ASB       defw     STATS_STR8B
;ASB       defw     STATS_STR9B
;ASB       defw     STATS_STR14B
;ASB       defw     STATS_STR14B
;ASB       defw     0
;ASB       defw     0
;ASB       defw     0
;ASB       defw     0
;ASB       defw     0
;ASB       defw     0
