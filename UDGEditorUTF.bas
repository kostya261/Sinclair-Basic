1 REM UDG Editor (R)2020 Writen by Konstantin Kosarew :-)
2 BORDER 1: PAPER 7: INK 0: BRIGHT 1: FLASH 0: CLS
10 DIM u(8, 8)
15 DIM b(8)
30 LET x = 1: LET y = 1: LET v$ = "": LET timer = 0
80 GO SUB 1100
90 GO SUB 630
100 PRINT AT y, x; "+"
101 LET timer=timer-(timer > 0)
105 LET a$ = INKEY$
110 IF a$ = "" OR a$ = v$ THEN GO TO 100
112 IF timer = 0 THEN LET v$ = ""
115 IF u(y, x) THEN PRINT AT y, x;"█"
116 IF NOT u(y, x) THEN PRINT AT y, x;" "
200 LET x = x + (x < 8 AND a$ = "7") - (x > 1 AND a$ = "6")
210 LET y = y + (y < 8 AND a$ = "8") - (y > 1 AND a$ = "9")
220 IF a$ = "0" THEN LET u(y, x) = NOT u(y, x): LET v$ = a$: LET timer = 6: PAUSE 1000
225 IF a$ = "1" THEN GO SUB 830
226 IF a$ = "2" THEN GO SUB 800
230 IF a$ = "3" THEN GO SUB 600
240 IF a$ = "4" THEN GO SUB 700
245 IF a$ = "5" THEN GO SUB 2200
250 IF a$ = " " THEN GO SUB 2080
500 GO TO 100
600 RANDOMIZE USR 15619: REM: CAT
610 PAUSE 0: CLS
630 PRINT INK 2; AT 0, 10; "UDG Editor"; INK 0; AT 2, 15; "1) LOAD"; AT 3, 15; "2) SAVE"; 
		 AT 4, 15; "3) Catalog"; AT 5, 15; "4) Select Char"; AT 6, 15; "5) Clear Char"; 
		 AT 7, 14; "Sp) Enter Char"
635 PRINT AT 13, 2; "Move cursor: Interface II"; INK 2; AT 14, 2; "6 - Left 7 - Right"; 
	  AT 15, 2; "8 - Down 9 - Up"; AT 16, 2; "0 - Select"
640 INK 1: PLOT 14, 33: DRAW 220, 0: DRAW 0, -26: DRAW -220, 0: DRAW 0, 26: INK 0
642 PRINT AT 18, 2; " A-A B-B C-C D-D E-E F-F G-G"; AT 19, 2; " H-H I-I J-J K-K L-L M-M N-N"; 
	  AT 20, 2; " O-O P-P Q-Q R-R S-S T-T U-U";
645 INK 1: PLOT 6, 169: DRAW 67, 0: DRAW 0, -67: DRAW -67, 0: DRAW 0, 67: INK 0
650 GO SUB 1000
660 RETURN
700 INPUT "Enter Char from list: "; LINE c$
705 IF c$ = "" THEN LET c$ = "A"
710 LET addr = USR c$
720 GO SUB 1110
730 CLS: GO SUB 630
740 RETURN
800 INPUT "Enter name for Save: "; LINE n$
805 IF n$ = "" THEN CLS: PRINT AT 10, 10; "Empity name! ": PAUSE 0: CLS: GO SUB 630: RETURN
810 RANDOMIZE USR 15619: REM: SAVE n$ CODE USR "A", 168
820 GO SUB 630: RETURN
830 INPUT "Enter name for Load: "; LINE n$
835 IF n$ = "" THEN CLS: PRINT AT 10, 10; "Empity name! ": PAUSE 0: CLS: GO SUB 630: RETURN
840 RANDOMIZE USR 15619: REM: LOAD n$ CODE USR "A"
850 GO SUB 630: RETURN
998 REM Out screen char
1000 FOR i = 1 TO 8: FOR j = 1 TO 8
1010 IF u(i, j) THEN PRINT AT i, j; "█"
1020 NEXT j: NEXT i
1030 RETURN
1090 REM Fill Char dimension
1100 LET addr = USR "B"
1110 FOR k = 0 TO 7
1120 LET number = PEEK (addr+k): GO SUB 2000
1130 FOR j = 1 TO 8
1140 LET u(k+1, j) = b(j)
1150 NEXT j: NEXT k
1160 RETURN
1999 REM Convert DEC to BIN
2010 FOR i = 8 TO 1 STEP -1
2020 LET number = INT (number)/ 2
2030 LET b(i) = NOT (number = INT (number))
2040 NEXT i
2045 RETURN
2050 FOR i = 1 TO 8: PRINT AT 10, i; b(i): NEXT i
2060 REM RETURN
2080 REM Convert BIN to DEC
2085 FOR k = 0 TO 7
2090 LET number = 0: LET temp = 128
2100 FOR i = 1 TO 8
2110 LET number = number + (u(k+1, i) * temp): LET temp = temp/ 2
2120 NEXT i
2121 POKE addr + k, number
2122 NEXT k
2125 GO SUB 630
2130 RETURN
2190 REM Clear char
2200 FOR i = 1 TO 8: FOR j = 1 TO 8: LET u(i, j) = 0: NEXT j: NEXT i: CLS: GO SUB 630: GO SUB 1000: RETURN
