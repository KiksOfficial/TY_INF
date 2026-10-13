module Kt1_2026_b
-- Ülesanne 1: listifunktsioon foldr-ga

-- Kasutades foldr-i, kirjuta mitterekursiivne funkstsioon yl1, mis arvutab 
-- True siis ja ainult siis, kui listis leidub paar (a,b), kus a ja b on 
-- võrdsed.
-- 
-- Vaata näiteid.

-- Main> yl1 [(1,2),(2,3),(4,4)] 
-- True
-- Main>  yl1 [(1,2),(2,3),(4,5),(1,3)] 
-- False

yl1 : Eq a => List (a,a) -> Bool
yl1 xs = foldr (\(a,b), acc => if a == b then True else acc) False xs

-- Ülesanne 2: puu

-- Vaata andmetüübi  BinTree a  definitsiooni.
-- 
-- Kirjuta funktsioon sumTreeIf : (a -> Bool) -> BinTree (a, Double) -> Double, 
-- mis liidab kokku puus leiduvate paaride teised komponendid, kui esimene 
-- argument tagastab paari esimesel komponendil True.
-- 
-- Vaata näiteid.

data BinTree a = Leaf | Branch (BinTree a) a (BinTree a)

tree1 : BinTree (Int, Double)
tree1 = Branch (Branch Leaf (1,0.5) Leaf) (5,1.5) (Branch Leaf (7,2.5) Leaf)

-- Main> sumTreeIf (/=3) tree1
-- 4.5
-- Main> sumtreeIf (/=5) tree1
-- 3.0
-- Main> sumTreeIf (\ _ => False) tree1
-- 0.0

sumTreeIf : (a -> Bool) -> BinTree (a, Double) -> Double
sumTreeIf f Leaf = 0
sumTreeIf f (Branch left (v,y) right) = sumTreeIf f left + (if f v then y else 0) + sumTreeIf f right

-- Ülesanne 7: kahendotsimine

-- Kirjuta funktsioon findInTree : Ord a => a -> BinTree (a, b) -> Maybe b,
-- mis otsib puust paari, mille esimeseks komponendiks on antud väärtus.
-- Kui selline paar leitakse, tagastatakse selle teise komponendi ümber
-- pakitud väärtus Just abil. Kui sellist paari puus ei leidu, tagastatakse 
-- Nothing.

-- Funktsioon eeldab, et argument on kahendotsimise puu.
-- See tähendab, et iga sõlme puhul kehtib, et tema vasakpoole
-- olevate sõlmede esimesed komponendid on väiksemad kui tema
-- esimene komponent ja tema parempoolsete sõlmede esimesed komponendid
-- on suuremad kui tema esimene komponent.

-- Vaata näiteid.
-- Main> findInTree 5 tree1
-- Just 1.5
-- Main> findInTree 7 tree1
-- Just 2.5
-- Main> findInTree 3 tree1
-- Nothing

findInTree : Ord a => a -> BinTree (a, b) -> Maybe b
findInTree n Leaf = Nothing
findInTree n (Branch left (v,y) right) =
  case compare n v of 
       LT => findInTree n left
       EQ => Just y
       GT => findInTree n right
