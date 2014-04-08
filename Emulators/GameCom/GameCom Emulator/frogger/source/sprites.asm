;****************************************************************************************
;**  Animation Definition Table
;****************************************************************************************
;**
;** Questions/Comments: 

ANIMATIONS:
	defw	frogger_up
	defw	frogger_left
	defw	frogger_water
	defw	frogger_ground
	defw	frogger_home
	defw	score_100
	defw	score_200
	defw	bonus_bug
	defw	c_slowcar
	defw	c_dozer
	defw	c_fastcar1
	defw	c_truck
	defw	c_fastcar2
	defw	dozer
	defw	transam1
	defw	transam2
	defw	miata
	defw	gmcpickup
	defw	copcar
	defw	limo
	defw	truck
	defw	bus
	defw	bigtruck
	defw	train
	defw	turtle
	defw	otter
	defw	snake
	defw	gator
	defw	gatorhead
	defw	c_gator
	defw	speedboat
	defw	ferry

snake: global snake
	defb	10		;strip containing animation
	defb	04		;width of frame in 8x8 blocks
	defb	03		;frames of animation
	defb	0e4h		;PAL
	defb	00		;Indented by X 8x8 blocks
	defb	4		;Pixels movement per frame
	defb	25,25,25		;how many ticks each frame of animtion is held for
	defb	5,5,5,5		;collsion for each frame of animation (repeat)
	defb	5,5,5,5		;collsion for each frame of animation (repeat)
	defb	5,5,5,5		;collsion for each frame of animation (repeat)

frogger_up: global frogger_up
	defb	00		;strip containing animation
	defb	02		;width of frame in 8x8 blocks
	defb	03		;frames of animation
	defb	0e4h		;PAL
	defb	00		;Indented by X 8x8 blocks
	defb	4		;Pixels moved each frame
	defb	02,02,02	;how many ticks each frame of animtion is held for
	defb	06,06		;collsion for each frame of animation (repeat)
	defb	06,06		;collsion for each frame of animation (repeat)
	defb	06,06		;collsion for each frame of animation (repeat)

frogger_left: global frogger_left
	defb	00		;strip containing animation
	defb	02		;width of frame in 8x8 blocks
	defb	03		;frames of animation
	defb	0e4h		;PAL
	defb	06		;Indented by X 8x8 blocks
	defb	4		;Pixels moved each frame
	defb	02,02,02	;how many ticks each frame of animtion is held for
	defb	06,06		;collsion for each frame of animation (repeat)
	defb	06,06		;collsion for each frame of animation (repeat)
	defb	06,06		;collsion for each frame of animation (repeat)

frogger_water: global frogger_water
	defb	00		;strip containing animation
	defb	02		;width of frame in 8x8 blocks
	defb	04		;frames of animation
	defb	0e4h		;PAL
	defb	12		;Indented by X 8x8 blocks
	defb	4		;Pixels moved each frame
	defb	05,05,05,09	;how many ticks each frame of animtion is held for
	defb	06,06		;collsion for each frame of animation (repeat)
	defb	06,06		;collsion for each frame of animation (repeat)
	defb	06,06		;collsion for each frame of animation (repeat)
	defb	06,06		;collsion for each frame of animation (repeat)

frogger_ground: global frogger_ground
	defb	00		;strip containing animation
	defb	02		;width of frame in 8x8 blocks
	defb	04		;frames of animation
	defb	0e4h		;PAL
	defb	20		;Indented by X 8x8 blocks
	defb	4		;Pixels moved each frame
	defb	05,05,05,09	;how many ticks each frame of animtion is held for
	defb	06,06		;collsion for each frame of animation (repeat)
	defb	06,06		;collsion for each frame of animation (repeat)
	defb	06,06		;collsion for each frame of animation (repeat)
	defb	06,06		;collsion for each frame of animation (repeat)

frogger_home: global frogger_home
	defb	00		;strip containing animation
	defb	02		;width of frame in 8x8 blocks
	defb	01		;frames of animation
	defb	0e4h		;PAL
	defb	28		;Indented by X 8x8 blocks
	defb	4		;Pixels moved each frame
	defb	02		;how many ticks each frame of animtion is held for
	defb	06,06		;collsion for each frame of animation (repeat)

score_100: global score_100
	defb	01		;strip containing animation
	defb	02		;width of frame in 8x8 blocks
	defb	01		;frames of animation
	defb	0e4h		;PAL
	defb	00		;Indented by X 8x8 blocks
	defb	4		;Pixels moved each frame
	defb	10		;how many ticks each frame of animtion is held for
	defb	06,06		;collsion for each frame of animation (repeat)

score_200: global score_200
	defb	01		;strip containing animation
	defb	02		;width of frame in 8x8 blocks
	defb	01		;frames of animation
	defb	0e4h		;PAL
	defb	02		;Indented by X 8x8 blocks
	defb	4		;Pixels moved each frame
	defb	10		;how many ticks each frame of animtion is held for
	defb	06,06		;collsion for each frame of animation (repeat)

bonus_bug: global bonus_bug
	defb	01		;strip containing animation
	defb	02		;width of frame in 8x8 blocks
	defb	01		;frames of animation
	defb	0e4h		;PAL
	defb	04		;Indented by X 8x8 blocks
	defb	4		;Pixels moved each frame
	defb	10		;how many ticks each frame of animtion is held for
	defb	07,07		;collsion for each frame of animation (repeat)

frogger_right: global frogger_right
	defb	01		;strip containing animation
	defb	02		;width of frame in 8x8 blocks
	defb	03		;frames of animation
	defb	0e4h		;PAL
	defb	06		;Indented by X 8x8 blocks
	defb	4		;Pixels moved each frame
	defb	02,02,02	;how many ticks each frame of animtion is held for
	defb	08,08		;collsion for each frame of animation (repeat)
	defb	08,08		;collsion for each frame of animation (repeat)
	defb	08,08		;collsion for each frame of animation (repeat)



c_slowcar: global c_slowcar
	defb	02		;strip containing animation
	defb	02		;width of frame in 8x8 blocks
	defb	02		;frames of animation
	defb	0e4h		;PAL
	defb	00		;Indented by X 8x8 blocks
	defb	4		;Pixels moved each frame
	defb	05,05		;how many ticks each frame of animtion is held for
	defb	05,05		;collsion for each frame of animation (repeat)
	defb	05,05		;collsion for each frame of animation (repeat)

c_dozer: global c_dozer
	defb	02		;strip containing animation
	defb	02		;width of frame in 8x8 blocks
	defb	02		;frames of animation
	defb	0e4h		;PAL
	defb	04		;Indented by X 8x8 blocks
	defb	4		;Pixels moved each frame
	defb	05,05		;how many ticks each frame of animtion is held for
	defb	05,05		;collsion for each frame of animation (repeat)
	defb	05,05		;collsion for each frame of animation (repeat)

c_fastcar1: global c_fastcar1
	defb	02		;strip containing animation
	defb	02		;width of frame in 8x8 blocks
	defb	02		;frames of animation
	defb	0e4h		;PAL
	defb	08		;Indented by X 8x8 blocks
	defb	4		;Pixels moved each frame
	defb	05		;how many ticks each frame of animtion is held for
	defb	05,05		;collsion for each frame of animation (repeat)
	defb	05,05		;collsion for each frame of animation (repeat)

c_truck: global c_truck
	defb	02		;strip containing animation
	defb	04		;width of frame in 8x8 blocks
	defb	02		;frames of animation
	defb	0e4h		;PAL
	defb	12		;number of 8x8 squares of space before animation starts
	defb	4		;Pixels moved each frame
	defb	5,5		;how many ticks each frame of animtion is held for
	defb	5,5,5,5		;collsion for each frame of animation (repeat)
	defb	5,5,5,5		;collsion for each frame of animation (repeat)

c_fastcar2: global c_fastcar2
	defb	02		;strip containing animation
	defb	03		;width of frame in 8x8 blocks
	defb	02		;frames of animation
	defb	0e4h		;PAL
	defb	20		;number of 8x8 squares of space before animation starts
	defb	4		;Pixels moved each frame
	defb	5,5		;how many ticks each frame of animtion is held for
	defb	5,5		;collsion for each frame of animation (repeat)
	defb	5,5		;collsion for each frame of animation (repeat)

dozer: global dozer
	defb	02		;strip containing animation
	defb	03		;width of frame in 8x8 blocks
	defb	02		;frames of animation
	defb	0e4h		;PAL
	defb	24		;number of 8x8 squares of space before animation starts
	defb	4		;Pixels moved each frame
	defb	5,5		;how many ticks each frame of animtion is held for
	defb	5,5,5		;collsion for each frame of animation (repeat)

transam1: global transam1
	defb	03		;strip containing animation
	defb	02		;width of frame in 8x8 blocks
	defb	02		;frames of animation
	defb	0e4h		;PAL
	defb	00		;Indented by X 8x8 blocks
	defb	4		;Pixels moved each frame
	defb	5,5		;how many ticks each frame of animtion is held for
	defb	5,5,5		;collsion for each frame of animation (repeat)
	defb	5,5,5		;collsion for each frame of animation (repeat)


transam2: global transam2
	defb	03		;strip containing animation
	defb	03		;width of frame in 8x8 blocks
	defb	02		;frames of animation
	defb	0e4h		;PAL
	defb	06		;Indented by X 8x8 blocks
	defb	4		;Pixels moved each frame
	defb	5,5		;how many ticks each frame of animtion is held for
	defb	5,5,5		;collsion for each frame of animation (repeat)
	defb	5,5,5		;collsion for each frame of animation (repeat)

miata: global miata
	defb	03		;strip containing animation
	defb	03		;width of frame in 8x8 blocks
	defb	02		;frames of animation
	defb	0e4h		;PAL
	defb	12		;Indented by X 8x8 blocks
	defb	4		;Pixels moved each frame
	defb	5,5		;how many ticks each frame of animtion is held for
	defb	5,5,5		;collsion for each frame of animation (repeat)
	defb	5,5,5		;collsion for each frame of animation (repeat)

gmcpickup: global gmcpickup
	defb	03		;strip containing animation
	defb	03		;width of frame in 8x8 blocks
	defb	02		;frames of animation
	defb	0e4h		;PAL
	defb	18		;Indented by X 8x8 blocks
	defb	4		;Pixels moved each frame
	defb	5,5		;how many ticks each frame of animtion is held for
	defb	5,5,5		;collsion for each frame of animation (repeat)
	defb	5,5,5		;collsion for each frame of animation (repeat)

copcar: global copcar
	defb	03		;strip containing animation
	defb	03		;width of frame in 8x8 blocks
	defb	02		;frames of animation
	defb	0e4h		;PAL
	defb	24		;Indented by X 8x8 blocks
	defb	4		;Pixels moved each frame
	defb	5,5		;how many ticks each frame of animtion is held for
	defb	5,5,5		;collsion for each frame of animation (repeat)
	defb	5,5,5		;collsion for each frame of animation (repeat)

limo: global limo
	defb	04		;strip containing animation
	defb	05		;width of frame in 8x8 blocks
	defb	02		;frames of animation
	defb	0e4h		;PAL
	defb	0		;Indented by X 8x8 blocks
	defb	4		;Pixels moved each frame
	defb	5,5		;how many ticks each frame of animtion is held for
	defb	5,5,5,5,5	;collsion for each frame of animation (repeat)
	defb	5,5,5,5,5	;collsion for each frame of animation (repeat)

truck: global truck
	defb	04		;strip containing animation
	defb	04		;width of frame in 8x8 blocks
	defb	02		;frames of animation
	defb	0e4h		;PAL
	defb	10		;Indented by X 8x8 blocks
	defb	4		;Pixels moved each frame
	defb	5,5		;how many ticks each frame of animtion is held for
	defb	5,5,5,5		;collsion for each frame of animation (repeat)
	defb	5,5,5,5		;collsion for each frame of animation (repeat)

bus: global bus
	defb	04		;strip containing animation
	defb	06		;width of frame in 8x8 blocks
	defb	02		;frames of animation
	defb	0e4h		;PAL
	defb	18		;Indented by X 8x8 blocks
	defb	4		;Pixels moved each frame
	defb	5,5		;how many ticks each frame of animtion is held for
	defb	5,5,5,5,5,5	;collsion for each frame of animation (repeat)
	defb	5,5,5,5,5,5	;collsion for each frame of animation (repeat)


bigtruck: global bigtruck
	defb	05		;strip containing animation
	defb	09		;width of frame in 8x8 blocks
	defb	02		;frames of animation
	defb	0e4h		;PAL
	defb	0		;Indented by X 8x8 blocks
	defb	4		;Pixels moved each frame
	defb	5,5		;how many ticks each frame of animtion is held for
	defb	5,5,5,5,5,5,5,5,5	;collsion for each frame of animation (repeat)
	defb	5,5,5,5,5,5,5,5,5	;collsion for each frame of animation (repeat)

train: global train
	defb	05		;strip containing animation
	defb	05		;width of frame in 8x8 blocks
	defb	02		;frames of animation
	defb	0e4h		;PAL
	defb	18		;Indented by X 8x8 blocks
	defb	4		;Pixels moved each frame
	defb	5,5		;how many ticks each frame of animtion is held for
	defb	5,5,5,5,5	;collsion for each frame of animation (repeat)
	defb	5,5,5,5,5	;collsion for each frame of animation (repeat)

turtle: global turtle
	defb	07		;strip containing animation
	defb	02		;width of frame in 8x8 blocks
	defb	04		;frames of animation
	defb	0e4h		;PAL
	defb	00		;Indented by X 8x8 blocks
	defb	4		;Pixels moved each frame
	defb	5,5,5,5,5	;how many ticks each frame of animtion is held for
	defb	05,05		;collsion for each frame of animation (repeat)
	defb	05,05		;collsion for each frame of animation (repeat)
	defb	05,05		;collsion for each frame of animation (repeat)
	defb	05,05		;collsion for each frame of animation (repeat)

turtle2: global turtle2
	defb	07		;strip containing animation
	defb	02		;width of frame in 8x8 blocks
	defb	09		;frames of animation
	defb	0e4h		;PAL
	defb	08		;Indented by X 8x8 blocks
	defb	4		;Pixels moved each frame
	defb	5,5,5,5,5,5,5,5,5	;how many ticks each frame of animtion is held for
	defb	01,01		;collsion for each frame of animation (repeat)
	defb	01,01		;collsion for each frame of animation (repeat)
	defb	01,01		;collsion for each frame of animation (repeat)
	defb	01,01		;collsion for each frame of animation (repeat)
	defb	04,04		;collsion for each frame of animation (repeat)
	defb	04,04		;collsion for each frame of animation (repeat)
	defb	04,04		;collsion for each frame of animation (repeat)
	defb	04,04		;collsion for each frame of animation (repeat)
	defb	04,04		;collsion for each frame of animation (repeat)

otter2: global otter2
	defb	07		;strip containing animation
	defb	02		;width of frame in 8x8 blocks
	defb	02		;frames of animation
	defb	0e4h		;PAL
	defb	13		;Indented by X 8x8 blocks
	defb	4		;Pixels moved each frame
	defb	09,09		;how many ticks each frame of animtion is held for
	defb	04,04		;collsion for each frame of animation (repeat)
	defb	04,04		;collsion for each frame of animation (repeat)

otter: global otter
	defb	07		;strip containing animation
	defb	02		;width of frame in 8x8 blocks
	defb	02		;frames of animation
	defb	0e4h		;PAL
	defb	13		;Indented by X 8x8 blocks
	defb	4		;Pixels moved each frame
	defb	05,05		;how many ticks each frame of animtion is held for
	defb	05,05		;collsion for each frame of animation (repeat)
	defb	05,05		;collsion for each frame of animation (repeat)

gator: global gator
	defb	08		;strip containing animation
	defb	08		;width of frame in 8x8 blocks
	defb	03		;frames of animation
	defb	0e4h		;PAL
	defb	00		;Indented by X 8x8 blocks
	defb	4		;Pixels moved each frame
	defb	5,5,5		;how many ticks each frame of animtion is held for
	defb	5,5,1,1,1,1,4,4	;collsion for each frame of animation (repeat)
	defb	5,5,1,1,1,1,4,4	;collsion for each frame of animation (repeat)
	defb	5,5,1,1,1,1,4,4	;collsion for each frame of animation (repeat)

gatorhead: global gatorhead
	defb	08		;strip containing animation
	defb	02		;width of frame in 8x8 blocks
	defb	02		;frames of animation
	defb	0e4h		;PAL
	defb	12		;Indented by X 8x8 blocks
	defb	4		;Pixels moved each frame
	defb	5,5		;how many ticks each frame of animtion is held for
	defb	5,5		;collsion for each frame of animation (repeat)
	defb	5,5		;collsion for each frame of animation (repeat)

c_gator: global c_gator
	defb	09		;strip containing animation
	defb	06		;width of frame in 8x8 blocks
	defb	02		;frames of animation
	defb	0e4h		;PAL
	defb	00		;Indented by X 8x8 blocks
	defb	4		;Pixels moved each frame
	defb	5,5		;how many ticks each frame of animtion is held for
	defb	1,1,1,1,1,1	;collsion for each frame of animation (repeat)
	defb	5,5,1,1,1,1	;collsion for each frame of animation (repeat)

speedboat: global speedboat
	defb	09		;strip containing animation
	defb	03		;width of frame in 8x8 blocks
	defb	02		;frames of animation
	defb	0e4h		;PAL
	defb	12		;Indented by X 8x8 blocks
	defb	4		;Pixels moved each frame
	defb	5,5		;how many ticks each frame of animtion is held for
	defb	5,5		;collsion for each frame of animation (repeat)
	defb	5,5		;collsion for each frame of animation (repeat)

ferry: global ferry
	defb	09		;strip containing animation
	defb	05		;width of frame in 8x8 blocks
	defb	02		;frames of animation
	defb	0e4h		;PAL
	defb	18		;Indented by X 8x8 blocks
	defb	4		;Pixels moved each frame
	defb	5,5		;how many ticks each frame of animtion is held for
	defb	5,1,1,1,5	;collsion for each frame of animation (repeat)
	defb	5,1,1,1,5	;collsion for each frame of animation (repeat)

	end
