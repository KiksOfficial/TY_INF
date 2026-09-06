f : Bool -> Bool 
f True = False
f False = True 
--VÕI 
F : Bool -> Bool
F b = case b of True => False
                False => True


-- ENNIKUD 
-- 1. Ennikute väärtustamine ja tüübid
-- Enniku tüüp konstrueeritakse selle komponentide tüüpidest.

-- Näide: Paar (Int, Char)
paar : (Int, Char)
paar = (1, 'a')

-- Näide: Kolmik (Int, Char, Bool)
kolmik : (Int, Char, Bool)
kolmik = (1, 'a', False)

-- Näide: Pesastatud ennik ((Double, Int, Char), Bool)
pesastatud : ((Double, Int, Char), Bool)
pesastatud = ((1.1, 8, 'x'), False)


-- 2. Info kättesaamine mustrisobitusega (Pattern Matching)
-- Enniku elementidele pääseb ligi, kui neid funktsiooni parameetris lahti pakkida.

f : (Int, Char, String) -> Int
f (x, c, ys) = x + 1

-- LISTID/JARJENDID
-- Koik elemendid peavad olema sama tyypi => List Int, List Char, List (List Double)...
-- N: [1, 2, 3], [4], []
-- Idris listid on immutable "puu"
-- 1. Puu struktuur mälus (Süntaktiline samaväärsus)
--
--  [1, 2, 3]  ==  1 :: (2 :: (3 :: []))
--
--  Visuaalselt mälupuu kujul:
--
--       ::
--      /  \
--     1    ::
--         /  \
--        2    ::
--            /  \
--           3    []

-- jarjendi loomiseks 2 konstruktorit, mis vastavad puu tippudele
[] -> list a
(::) : a -> list a -> list a
--N:
[3, 2, 1] == 3 :: (2:: (1:: [])) == 3 :: 2 :: 1 :: []

len : List a -> Int
len [] = 0
len [x::xs] = 1 + len xs

-- VÕI 
Len : List a -> Int
Len xs == 
  case xs of
       [] => 0
       (x::xs) => Len xs
