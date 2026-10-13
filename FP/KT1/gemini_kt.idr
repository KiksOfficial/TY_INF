-- 1. (λx.λy.yx)xy(λy.xy) => x y
--
-- 2.(a) (λx.add xx)= α (λy.add xx) ei
--   (b) (λx.add xy)= α (λy.add yx) ei
--   (c) (λxy.add xy)= α (λyx.add yx) jah
--
-- 3.  sum [ x - y | (x,y) <- zip [5, 6] [1..4] ] => ([5,1] [6,2]) => [4,4] => 8
-- -
-- 5. Kasutades foldr-i, kirjuta mitterekursiivne funktsioon countTruePairs : List (Bool, Int) -> Int,
-- mis loendab kokku, mitmes paaris on esimene komponent True.
--
-- Main> countTruePairs [(True, 1), (False, 2), (True, 3)]
-- 2
-- Main> countTruePairs [(False, 1), (False, 2)]
-- 0

yl5 : List (Bool, Int) -> Int
yl5 xs = foldr (\(a,b), acc => if a then 1 + acc else acc ) 0 xs

{-
Kirjuta funktsioon height : BinTree a -> Nat, mis arvutab ja tagastab selle puu kõrguse (sügavuse) Naturaalarvuna (Nat).
Leppigem kokku, et:
Tühja lehe (Leaf) kõrgus on Z (või võid kasutada oma loogikat).
Sõlme kõrgus on 1 + suurim alampuu kõrgustest (kuna max funktsiooni kirjutamine Nat-idele võib tüütu olla,
võid kasutada ka lihtsamat tingimuslausega lähenemist, nt if ... then ... else ...).
-}

data BinTree a = Leaf | Node (BinTree a) a (BinTree a)

height : BinTree a -> Nat


myFilter : (a -> Bool) -> List a -> List a
myFilter f [] = []
myFilter f (x::xs) = if f x then x :: myFilter f xs else myFilter f xs
