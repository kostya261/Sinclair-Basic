10 LET a$ = "Hello world! "
20 LET b$ = ""
30 LET i = 1
40 FOR j = 31 TO -(LEN a$) STEP -1
50 IF i <=LEN a$ THEN LET b$=b$+a$(i): LET i=i+1
60 IF j>=0 THEN PRINT AT 0, j;b$
60 IF j<=0 THEN LET b$=b$(2 TO): PRINT AT 0, j;b$
80 PAUSE 4
90 NEXT j