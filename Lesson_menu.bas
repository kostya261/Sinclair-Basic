10 REM Lesson 2 - Menu!
11 CLEAR 32768
12 BORDER 0: PAPER 0: INK 7: CLS
13 RANDOMIZE USR 15619: REM: LOAD "font" CODE 64000
14 LET a = 64000 - 256: POKE 23606, a - 256 * INT (a/ 256): POKE 23607, INT (a/ 256)
20 DIM m$(3, 13): LET keys = 1: LET cur = 0: LET inv = 0
25 DIM k$(3, 5): LET k$(1) = "qaopm": LET k$(2) = "98670": LET k$(3) = "76580"
30 LET m$(1) = "Keyboard": LET m$(2) = "Interface II" Z LET m$(3) = "Cursor keys"
35 RANDOMIZE USR 15619: REM: LOAD "Space" CODE 16384
40 PRINT PAPER 1; AT 1, 3; "Menu"; AT 3, 1; "1) Start"; " AT 4, 1; "2) "; m$(keys); AT 5, 1; "3) About"
45 PRINT PAPER 1; AT 3 + cur, 3; ">"
50 LET a$ = INKEY$: PAUSE 10: LET inv = NOT inv
51 IF inv THEN POKE 22649, 113: POKE 22651, 81
52 IF inv = 0 THEN POKE 22649, 81: POKE 22651, 113
60 IF a$ = "" THEN GO TO 50
65 LET cur = cur - (cur > 0 AND a$= k$(keys, 1)) + (cur < 2 AND a$= k$(keys, 2))
70 IF a$ = "1" OR a$ = k$(keys, 5 AND cur = 0) THEN GO TO 1000
80 IF a$ = "2" OR a$ = k$(keys, 5 AND cur = 1) THEN LET keys = keys + 1: IF keys > 3 THEN LET keys = 1
90 IF a$ = "3" OR a$ = k$(keys, 5 AND cur = 2) THEN GO TO 1500
100 GO TO 40
1000 CLS: LET x = 10: LET y = 10
1010 PRINT AT y, x; "X"
1020 LET a$ = INKEY$: PAUSE 10: IF a$ = "" THEN GO TO 1020
1030 PRINT AT y, x; OVER 1; "X"
1040 LET y = y - (a$ = k$(keys, 1) AND y > 0) + (a$ = k$(keys, 2) AND y < 20)
1050 LET x = x - (a$ = k$(keys, 3) AND x > 0) + (a$ = k$(keys, 4) AND x < 31)
1060 IF a$ = k$(keys, 5) THEN GO TO 35
1100 GO TO 1010
1499 STOP
1500 CLS: PRINT AT 8, 13; "About"; AT 10, 1; "This menu write Sinclair Basic": PAUSE 10000: CLS: GO TO 35
