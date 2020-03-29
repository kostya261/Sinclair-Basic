10 DIM t$(16, 12): REM Type commands
20 FOR i=1 TO 16
25 READ a$
30 LET t$(i)=a$
40 NEXT i
50 PRINT AT 18,0; "E (OR 0) - Edit Cell"; AT 19,0;"C - Clear Cell"; AT 20,0;"X - Clear Stack"
2000 REM Menu Stack Command
2010 LET StackCmd = 64000: REM Start addres for stack
2020 LET EndStackCmd = 16
2030 LET PosMenu = 0
2040 LET PosCursor = 0
2050 LET Scroll = 0
2100 FOR i=StackCmd+Scroll TO StackCmd+5+Scroll
2110 PRINT AT PosMenu, 19; t$(PEEK (i)+1)
2190 LET PosMenu=PosMenu+1: NEXT i: LET PosMenu = 0
2200 LET a$ = INKEY$
2205 PRINT AT PosCursor-1, 18;" "; AT PosCursor, 18;">"; AT PosCursor+1,18;" "
2210 IF a$="" THEN GO TO 2200
2220 IF a$="9" THEN LET PosCursor=PosCursor-(PosCursor>0): IF PosCursor<=0 THEN LET Scroll=Scroll-(Scroll>0)
2230 IF a$="8" THEN LET PosCursor=PosCursor+(PosCursor<5): IF PosCursor>=5 THEN LET Scroll=Scroll+((Scroll+5)<EndStackCmd)
2240 IF a$="0" THEN LET a$="": PAUSE 10: GO SUB 3000
2250 IF a$="e" OR a$="E" THEN PAUSE 10: GO SUB 3000 
2260 IF a$="c" OR a$="C" THEN POKE StackCmd+PosCursor+Scroll, 0
2270 IF a$="x" OR a$="X" THEN FOR i=StackCmd TO StackCmd+EndStackCmd: POKE i, 0: NEXT i
2990 GO TO 2100
3000 LET cell=PEEK(StackCmd+PosCursor+Scroll)
3010 LET a$=INKEY$: PAUSE 5
3015 PRINT INK 2; AT PosCursor+PosMenu, 19; t$(cell+1)
3020 IF a$="" THEN GO TO 3010
3030 IF a$="9" THEN LET cell=cell+(cell<15)
3040 IF a$="8" THEN LET cell=cell-(cell>0)
3050 IF a$="0" THEN POKE StackCmd+PosCursor+Scroll, cell: PAUSE 10: RETURN
3060 GO TO 3010
9000 DATA "non","Move Up", "Move Down", "Rotate Right", "Rotate Left", "6","7","8","9","10","11","12","13","14","15","16"