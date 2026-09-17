{- 
[m..n] sama mis [m, m+1, ... n]

[3,5..15] sama mis [3, 5, 7, 9, 11, 13, 15]

[x*x | x <- [1..10]] == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]

[m | x <- [1..10], let m = x*x, m < 50] == [1, 4, 9, 16, 25, 36, 49]

m = reaalne variable | x <- [1..10] = generaator, let = var arvutamine, m < 50 = valvur (bool)

[(a,b) | a <- [1..2], b <- [1..3]] == [(1,1),(1,2),(1,3),(2,1),(2,2),(2,3)]

kiiremini muutub parem poolsem generaator

list ++ list2 liidab listid
take n votab listist n elementi
drop n eemaldab listist esimesed n elementi

Pythonis {
  list(range(1,5)) = [1,2,3,4]
  list(range(1,9,2)) = [1,3,5,7,9]

 [10x + y for x in X for y in X if x < y]  
  }



-}


