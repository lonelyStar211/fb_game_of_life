SCREEN 19

DIM x AS INTEGER = 99, y AS INTEGER = 36
DIM SHARED AS INTEGER grid(0 TO 100,0 TO 37), _new_grid(0 TO 100, 0 TO 37)
DIM As Integer gen, n, nei, was


RANDOMIZE TIMER


FOR x AS INTEGER = 0 TO 100
   FOR y AS INTEGER = 0 TO 37
      grid(x,y) = INT(RND*2)     
   NEXT
NEXT

SUB game(arr() AS INTEGER, was AS INTEGER, nei AS INTEGER, arr2() AS INTEGER)
   DIM n AS INTEGER
   FOR x AS INTEGER =1 TO 99
      FOR y AS INTEGER = 1 TO 36
		  nei = arr( x - 1, y - 1) +arr( x , y - 1)
		  nei = nei + arr( x + 1, y -1)
		  nei = nei + arr( x - 1, y) + arr( x + 1, y)
		  nei = nei + arr( x - 1, y + 1)
		  nei = nei + arr( x, y + 1) +arr( x + 1, y + 1)
		  was =arr( x, y)
      If was =0 Then
        If nei =3 Then n =1 Else n =0
      Else
        If nei =3  Or nei =2 Then n =1 Else n =0
      End IF
      arr2(x,y) = n
      NEXT
   NEXT
END SUB

SUB swap_grid(arr1() AS INTEGER, arr2() AS INTEGER)
   FOR x AS INTEGER = 0 TO 100
      FOR y AS INTEGER = 0 TO 37
         arr1(x,y) = arr2(x,y)
      NEXT
   NEXT
END SUB

SUB PRINT_TO_SCREEN(x AS INTEGER, y AS INTEGER, arr()AS integer)
   IF (arr(x,y)) = 1 THEN
      LOCATE y, x : PRINT CHR(219);
   ELSEIF (arr(x,y)) = 0 THEN
      LOCATE y, x : PRINT " ";
     
   ENDIF
END SUB


SUB print_grid(grid() AS INTEGER)
   FOR x AS INTEGER = 0 TO 100
      FOR y AS INTEGER = 0 TO 37
         PRINT_TO_SCREEN(x,y,grid())
      NEXT
   NEXT
END SUB

DIM s AS STRING = "in memory of JOHN HORTON CONWAY 1937 - 2020"
DIM t AS STRING = "CONWAY'S GAME OF LIFE"
LOCATE 15, (LOWORD(WIDTH) - LEN(s)) SHR 1 : PRINT s
LOCATE 18, (LOWORD(WIDTH) - LEN(t)) SHR 1 : PRINT t
SLEEP
CLS

DO
   GAME(grid(),was,nei, _new_grid())
   sleep 100
   SWAP_GRID(grid(),_new_grid())
   SLEEP 100
   PRINT_GRID(grid())
LOOP UNTIL INKEY = CHR(27)
SLEEP