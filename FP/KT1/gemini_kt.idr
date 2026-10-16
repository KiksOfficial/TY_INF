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
yl5 = foldr (\(x,y), acc => if x then acc + 1 else acc) 0

{-
Kirjuta funktsioon height : BinTree a -> Nat, mis arvutab ja tagastab selle puu kõrguse (sügavuse) Naturaalarvuna (Nat).
Leppigem kokku, et:
Tühja lehe (Leaf) kõrgus on Z (või võid kasutada oma loogikat).
Sõlme kõrgus on 1 + suurim alampuu kõrgustest (kuna max funktsiooni kirjutamine Nat-idele võib tüütu olla,
võid kasutada ka lihtsamat tingimuslausega lähenemist, nt if ... then ... else ...).
-}

data BinTree a = Leaf | Branch (BinTree a) a (BinTree a)

tree1 : BinTree (Int, Double)
tree1 = Branch (Branch Leaf (1,0.5) Leaf) (5,1.5) (Branch Leaf (7,2.5) Leaf)

height : BinTree a -> Nat
height Leaf = 0
height (Branch left _ right) = 1 + max (height left) (height right)


myFilter : (a -> Bool) -> List a -> List a
myFilter f = foldr (\x, acc => if f x then x :: acc else acc) []

-- sum [x*y| (x,y) zip [2..5] [5,1]] [(2,5), (3,1)] => [10,3] => 13


-- alfa ekvivalentsus selle kohta kas on sama struktuur
--
--(lambda f x. f x)(lambda y. mul y 2)(add 1 2) =>  (lambda y. mul y 2 ) add (1 2) => mul add (1 2) 2 => mul 3 2 => 6

allLess : List (Int, Int) -> Bool
allLess = foldr (\(x,y), acc => if x < y then acc else False) True

sumTreeBy : (a->Bool) -> BinTree (a, Double) -> Double
sumTreeBy f Leaf = 0
sumTreeBy f (Branch left (x,y) right) = sumTreeBy f left + (if f x then y else 0) + sumTreeBy f right

-- [ x * x | x <- [1..5], even x] => [2,4] => [4,16]
--
-- sumList [3, 1, 4] => 8
--
-- a. jah
-- b. jah
--
-- (λx.add x y) z (λy.mul y w) vabad: y z w
--
-- (λx.mul x x) (add 2 3) => mul (add 2 3) (add 2 3) => mul 5 5 => 25
--
--
-- Main> allEven [2, 4, 6, 8]
-- True
-- Main> allEven [2, 3, 6]
-- False
-- Main> allEven []
-- True

allEven : List Int -> Bool
allEven = foldr (\x, acc => if x `mod` 2 == 0 then acc else False ) True

tree2 : BinTree Int
tree2 = Branch (Branch Leaf 1 Leaf) 5 (Branch Leaf 7 Leaf)

countNodesIf : (a -> Bool) -> BinTree a -> Int
countNodesIf f Leaf = 0
countNodesIf f (Branch left mid right) = countNodesIf f left + (if f mid then 1 else 0) + countNodesIf f right

sumOddSquares : List Int -> Int
sumOddSquares xs = sum [x*x| x<-xs, x`mod`2 ==1]

--(λx.add x (mul 2 x)) (sub 5 2) => add (sub 5 2) (mul 2 (sub 5 2)) => add 3 (mul 2 (sub 5 2)) => add 3 (mul 2 3) => add 3 6 => 9
--
maxDepth : BinTree a -> Int
maxDepth Leaf = 0
maxDepth (Branch left mid right) = 1 + max (maxDepth left)  (maxDepth right)

treeEx : BinTree Int
treeEx = Branch (Branch Leaf 1 Leaf) 5 (Branch (Branch Leaf 2 Leaf) 7 Leaf)

countOccurrences : Eq a => a -> List a -> Int
countOccurrences _ [] = 0
countOccurrences num (x::xs) = if num == x then 1 + countOccurrences num xs else countOccurrences num xs
