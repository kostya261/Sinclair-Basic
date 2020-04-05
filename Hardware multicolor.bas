1 REM ZX Hardware multicolor
10 OUT 61431, BIN 00100000
20 FOR i = 0 TO 20: PRINT AT i, 0; "Hello world!": NEXT i
25 LET k = 0: LET x = 0
30 FOR i = 24576 TO 30720
31 LET s = INT (RND * 8)
32 IF k = 0 THEN LET t = s
33 LET k = k + 1: LET x = x + (x < 31)
34 IF k > 31 THEN LET k = 0: LET x = 0
35 IF x > 12 AND X < 31 THEN LET t = INT (RND *62)
40 POKE i, t
50 NEXT i
900 IF INKEY$ = "" THEN GO TO 900
1000 OUT 61431, 0
