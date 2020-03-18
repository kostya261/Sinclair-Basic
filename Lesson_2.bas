10 LET a$ = "Hello world!   "
20 LET minCh = 1: LET maxCh = 1: LET i = 1: LET e=0
30 FOR j = 31 TO -(LEN a$) STEP -1
40 LET minCh = minCh + (j <= 0 AND minCh < LEN a$)
50 LET maxCh = i
55 LET i = i + (i < LEN a$)
60 LET e = e + (j < 0)
70 PRINT AT 0, j + e; a$ (minCh TO maxCh)
80 PAUSE 5
90 NEXT j
100 GO TO 10