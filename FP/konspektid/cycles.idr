--funktsionaliseerimine ja rekursioon

--TSYKLITTE ASEME TULEB KASUTADA REKURSIOONI
sum100 : Int
sum100 = f 10 0 where
  f : Int -> Int -> Int
  f i s = if i <= 100 then f (i + 1) (i + s) else s
{-
See on sama mis 
int s = 0;
for (int i = 0; i <= 100; i++) {
  s = i + s
  }

1. tsykli muutujad teisenda abifunktsiooni parameetriteks => f i s = ...
2. muutujate algvaartused anna abifunktsioonide argumentideks => f 10 0 where ...
3. loo hargnemine vastaval tsyklisse jaamise tingimusele => if <= 100 ... else ...
4. tsyklisse jaamisel tee rekursiivne kutse uute vaartustega => f (i + 1) (s + i)
5. tsyklist lahkumisel tagasta arvutatud vaartus(t)e tulemused =>> ... else s
-}
