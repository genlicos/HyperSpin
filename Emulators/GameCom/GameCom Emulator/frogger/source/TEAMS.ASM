	title   Statistics1
	type    8521


;ASB	include frogger.tmp
;ASB
;ASB	global  team_pids
;ASB	global  team_namesF
;ASB	global  team_namesL
;ASB	global  teamlogo_table
;ASB
;ASB;Team info (player IDs padded to 16 each)
;ASBteam_pids:
;ASB       defw     6, 21, 31, 43, 74, 75,139,155,198,236,251,287,330,   0,  0,  0
;ASB       defw      8, 20, 36, 91,102,111,146,183,186,195,225,233,241,347,363,  0
;ASB       defw     13, 25, 80, 95,130,222,276,290,294,314,373,384,  0,  0,  0,  0
;ASB       defw     35, 45, 49, 51,150,188,191,197,200,208,279,307,325,372,  0,  0
;ASB       defw      9, 40, 53,116,154,170,176,190,196,275,284,346,352,  0,  0,  0
;ASB       defw     11, 38, 63, 82, 89,117,141,253,266,289,292,298,344,353,362,  0
;ASB       defw      4,108,109,119,127,133,172,201,255,339,356,368,392,396,  0,  0
;ASB       defw     99,157,159,168,207,212,243,256,280,291,306,321,335,382,387,  0
;ASB       defw     33, 54, 71, 83, 94,115,122,123,140,175,211,216,219,333,334,369
;ASB       defw     19, 50, 97,106,151,182,184,215,260,285,293,309,400,  0,  0,  0
;ASB       defw     29, 34, 76, 86, 88,161,173,230,238,246,282,313,331,374,397,  0
;ASB       defw     17, 69, 72,220,250,277,295,302,308,329,349,360,361,398,  0,  0
;ASB       defw     22, 24, 27, 32, 48, 57,118,121,164,185,257,311,320,  0,  0,  0
;ASB       defw     15, 23, 42, 62, 73,147,204,213,221,239,245,247,342,  0,  0,  0
;ASB       defw      5, 39, 81,114,132,142,160,162,177,199,273,278,305,  0,  0,  0
;ASB       defw     59, 79,126,138,143,145,187,218,242,268,270,283,299,376,388,  0
;ASB       defw     55, 60, 96,112,128,131,152,194,322,357,358,380,  0,  0,  0,  0
;ASB       defw     37, 67, 78, 90, 98,113,165,178,240,336,367,385,  0,  0,  0,  0
;ASB       defw     10, 14, 28,104,134,148,149,202,261,263,317,345,348,378,  0,  0
;ASB       defw     26, 70, 87,171,231,264,267,286,324,327,332,338,350,379,  0,  0
;ASB       defw     41, 47, 64,180,193,217,226,227,234,235,252,300,319,371,381,  0
;ASB       defw     16, 46, 61, 77,136,137,205,258,297,310,316,341,364,386,  0,  0
;ASB       defw      1,  2, 92,124,156,181,265,281,304,337,370,393,  0,  0,  0,  0
;ASB       defw     52, 93,100,107,129,158,174,179,206,271,274,301,312,390,  0,  0
;ASB       defw     12, 18,110,153,167,192,229,232,269,272,318,383,395,  0,  0,  0
;ASB       defw     30, 44, 56, 68,125,228,237,259,326,351,355,365,389,394,399,  0
;ASB       defw      7, 58,105,120,163,189,214,244,262,315,340,359,  0,  0,  0,  0
;ASB       defw      3, 66, 84,103,169,209,210,223,224,254,288,303,328,375,  0,  0
;ASB       defw     65, 85,101,135,144,166,203,248,249,296,323,343,354,366,377,391
;ASB
;ASB
;ASB;padded to 13
;ASBteam_namesF:
;ASB       defm    'ATLANTA'
;ASB       defb    0,0,0,0,0,0
;ASB       defm    'BOSTON'
;ASB       defb    0,0,0,0,0,0,0
;ASB       defm    'CHARLOTTE'
;ASB       defb    0,0,0,0
;ASB       defm    'CHICAGO'
;ASB       defb    0,0,0,0,0,0
;ASB       defm    'CLEVELAND'
;ASB       defb    0,0,0,0
;ASB       defm    'DALLAS'
;ASB       defb    0,0,0,0,0,0,0
;ASB       defm    'DENVER'
;ASB       defb    0,0,0,0,0,0,0
;ASB       defm    'DETROIT'
;ASB       defb    0,0,0,0,0,0
;ASB       defm    'GOLDEN STATE'
;ASB       defb    0
;ASB       defm    'HOUSTON'
;ASB       defb    0,0,0,0,0,0
;ASB       defm    'INDIANA'
;ASB       defb    0,0,0,0,0,0
;ASB       defm    'LOS ANGELES'
;ASB       defb    0,0
;ASB       defm    'LOS ANGELES'
;ASB       defb    0,0
;ASB       defm    'MIAMI'
;ASB       defb    0,0,0,0,0,0,0,0
;ASB       defm    'MILWAUKEE'
;ASB       defb    0,0,0,0
;ASB       defm    'MINNESOTA'
;ASB       defb    0,0,0,0
;ASB       defm    'NEW JERSEY'
;ASB       defb    0,0,0
;ASB       defm    'NEW YORK'
;ASB       defb    0,0,0,0,0
;ASB       defm    'ORLANDO'
;ASB       defb    0,0,0,0,0,0
;ASB       defm    'PHILIDELPHIA'
;ASB       defb    0
;ASB       defm    'PHOENIX'
;ASB       defb    0,0,0,0,0,0
;ASB       defm    'PORTLAND'
;ASB       defb    0,0,0,0,0
;ASB       defm    'SACRAMENTO'
;ASB       defb    0,0,0
;ASB       defm    'SAN ANTONIO'
;ASB       defb    0,0
;ASB       defm    'SEATTLE'
;ASB       defb    0,0,0,0,0,0
;ASB       defm    'TORONTO'
;ASB       defb    0,0,0,0,0,0
;ASB       defm    'UTAH'
;ASB       defb    0,0,0,0,0,0,0,0,0
;ASB       defm    'VANCOUVER'
;ASB       defb    0,0,0,0
;ASB       defm    'WASHINGTON'
;ASB       defb    0,0,0
;ASB
;ASB
;ASB;padded to 13
;ASBteam_namesL:
;ASB       defm    'HAWKS'
;ASB       defb    0,0,0,0,0,0,0,0
;ASB       defm    'CELTICS'
;ASB       defb    0,0,0,0,0,0
;ASB       defm    'HORNETS'
;ASB       defb    0,0,0,0,0,0
;ASB       defm    'BULLS'
;ASB       defb    0,0,0,0,0,0,0,0
;ASB       defm    'CAVS'
;ASB       defb    0,0,0,0,0,0,0,0,0
;ASB       defm    'MAVERICKS'
;ASB       defb    0,0,0,0
;ASB       defm    'NUGGETS'
;ASB       defb    0,0,0,0,0,0
;ASB       defm    'PISTONS'
;ASB       defb    0,0,0,0,0,0
;ASB       defm    'WARRIORS'
;ASB       defb    0,0,0,0,0
;ASB       defm    'ROCKETS'
;ASB       defb    0,0,0,0,0,0
;ASB       defm    'PACERS'
;ASB       defb    0,0,0,0,0,0,0
;ASB       defm    'CLIPPERS'
;ASB       defb    0,0,0,0,0
;ASB       defm    'LAKERS'
;ASB       defb    0,0,0,0,0,0,0
;ASB       defm    'HEAT'
;ASB       defb    0,0,0,0,0,0,0,0,0
;ASB       defm    'BUCKS'
;ASB       defb    0,0,0,0,0,0,0,0
;ASB       defm    'TIMBERWOLVES'
;ASB       defb    0
;ASB       defm    'NETS'
;ASB       defb    0,0,0,0,0,0,0,0,0
;ASB       defm    'KNICKS'
;ASB       defb    0,0,0,0,0,0,0
;ASB       defm    'MAGIC'
;ASB       defb    0,0,0,0,0,0,0,0
;ASB       defm    'SIXERS'
;ASB       defb    0,0,0,0,0,0,0
;ASB       defm    'SUNS'
;ASB       defb    0,0,0,0,0,0,0,0,0
;ASB       defm    'BLAZERS'
;ASB       defb    0,0,0,0,0,0
;ASB       defm    'KINGS'
;ASB       defb    0,0,0,0,0,0,0,0
;ASB       defm    'SPURS'
;ASB       defb    0,0,0,0,0,0,0,0
;ASB       defm    'SONICS'
;ASB       defb    0,0,0,0,0,0,0
;ASB       defm    'RAPTORS'
;ASB       defb    0,0,0,0,0,0
;ASB       defm    'JAZZ'
;ASB       defb    0,0,0,0,0,0,0,0,0
;ASB       defm    'GRIZZLIES'
;ASB       defb    0,0,0,0
;ASB       defm    'WIZARDS'
;ASB       defb    0,0,0,0,0,0
;ASB
;ASB; team logos page, x,yloc x,ysize
;ASBteamlogo_table:
;ASB       defb    bankno_teamlogo1,   0,  0,  61, 40  ;atlanta hawks
;ASB       defb    bankno_teamlogo1,   0, 41,  43, 47  ;boston celtics
;ASB       defb    bankno_teamlogo1,   0, 88,  45, 55  ;charlotte hornets
;ASB       defb    bankno_teamlogo1,   0,143,  54, 52  ;chicago bulls
;ASB       defb    bankno_teamlogo1,   0,195,  49, 57  ;cleavland cavs
;ASB       defb    bankno_teamlogo1,  62,  0,  52, 49  ;dallas mavericks
;ASB       defb    bankno_teamlogo1,  51, 49,  63, 45  ;denver nuggets
;ASB       defb    bankno_teamlogo1,  62, 94,  49, 50  ;detroit pistons
;ASB       defb    bankno_teamlogo1, 118,  0,  55, 52  ;golden state warriors
;ASB       defb    bankno_teamlogo1, 118, 52,  62, 49  ;houston rockets
;ASB       defb    bankno_teamlogo1, 118,101,  55, 47  ;indiana pacers
;ASB       defb    bankno_teamlogo1, 118,148,  65, 47  ;LA clippers
;ASB       defb    bankno_teamlogo1, 118,195,  65, 41  ;LA lakers
;ASB       defb    bankno_teamlogo1, 183,  0,  40, 52  ;miami heat
;ASB       defb    bankno_teamlogo2, 133,175,  40, 49  ;milwaukee bucks
;ASB       defb    bankno_teamlogo1, 183, 52,  63, 47  ;minnesota timberwolves
;ASB       defb    bankno_teamlogo1, 183, 99,  50, 50  ;new jersey nets
;ASB       defb    bankno_teamlogo1, 183,149,  64, 46  ;new york knicks
;ASB       defb    bankno_teamlogo1, 183,195,  66, 27  ;orlando magic
;ASB       defb    bankno_teamlogo2,   0,  0,  65, 41  ;philidelphia 76ers
;ASB       defb    bankno_teamlogo2,   0, 41,  48, 51  ;phoenix suns
;ASB       defb    bankno_teamlogo2,   0, 92,  67, 22  ;portland blazers
;ASB       defb    bankno_teamlogo2,   0,114,  43, 49  ;sacremento kings
;ASB       defb    bankno_teamlogo2,   0,163,  65, 34  ;san antonio spurs
;ASB       defb    bankno_teamlogo2,   0,197,  50, 47  ;seatle supersonics
;ASB       defb    bankno_teamlogo2,  67,  0,  56, 50  ;toronto raptors
;ASB       defb    bankno_teamlogo2,  67, 50,  63, 46  ;utah jazz
;ASB       defb    bankno_teamlogo2,  67, 96,  66, 51  ;vancouver grizzlies
;ASB       defb    bankno_teamlogo2, 185, 48,  66, 47  ;washington wizards?
;ASB       defb    bankno_teamlogo1,  62,144,  47, 53  ;eastern conference
;ASB       defb    bankno_teamlogo2, 185,  0,  47, 48  ;western division
;ASB       defb    bankno_teamlogo2,  67,196,  47, 43  ;blockers
;ASB       defb    bankno_teamlogo2, 133,  0,  48, 42  ;jammers
;ASB       defb    bankno_teamlogo2, 133, 42,  23, 49  ;nba logo
;ASB       defb    bankno_teamlogo2, 133, 91,  52, 40  ;slammers
;ASB       defb    bankno_teamlogo2, 133,131,  49, 44  ;stealers
;ASB       defb    bankno_teamlogo1,  49,197,  69, 51  ;ea sports
;ASB       defb    bankno_teamlogo2,  67,147,  65, 29  ;washington bullets
;ASB       defb    bankno_teamlogo2, 185, 95,  46, 48  ;ney york nets2
;ASB       defb    bankno_teamlogo2, 185,143,  49, 50  ;golden state warriors2

       end

