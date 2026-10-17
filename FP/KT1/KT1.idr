-- Ülesanne 1: listifunktsioon foldr-ga

-- Kasutades foldr-i, kirjuta mitterekursiivne funkstsioon yl1, mis arvutab 
-- True siis ja ainult siis, kui listis leidub paar (a,b), kus a==True 
-- ja b on väiksem kui 10.
-- 
-- Vaata näiteid.

-- Main> yl1 (the (List (Bool,Int)) []) 
-- False
-- Main> yl1 [(True,3)] 
-- True
-- Main> yl1 [(False,2),(True,3),(False,4)]
-- True
-- Main> yl1 [(True,20),(False,3),(True,50),(False,2)] 
-- False
--
yl1 :  List (Bool,Int) -> Bool
yl1  = foldr (\(x,y), acc=> if x == True && y < 10 then True else acc) False


-- Ülesanne 2: puu

-- Vaata andmetüübi  BinTree a  definitsiooni.
-- 
-- Ülesandes eeldame, et argument-puu BinTree (Int,a) on järjestatud.
-- Iga `Branch v (x,d) p` puhul puus
--  + `x` on suurem või võrdne kui iga v-s oleva paari esimene element,
--  + `x` on väiksem kui iga p-s oleva paari esimene element.
-- 
-- Näiteks
-- Branch (Branch Leaf (1,0.5) Leaf) (5,1.5) (Branch Leaf (7,2.5) Leaf)
-- on valiidne kuna 1 <= 5 ja 7 > 5
-- 
-- Branch (Branch Leaf (9,0.5) Leaf) (5,1.5) (Branch Leaf (7,2.5) Leaf)
-- ei ole valiidne kuna 5 pole suurem 9-st
-- 
-- Branch (Branch Leaf (1,0.5) Leaf) (5,1.5) (Branch Leaf (3,2.5) Leaf)
-- ei ole valiidne kuna 5 pole väiksem 3-st

-- Kirjuta funktsioon 
--    findClosestSmaller : Int -> BinTree (Int, Double) -> Maybe Double
-- 
-- Väljakutse `findClosestSmaller n t` leiab puus `t` leiduvatest 
-- paarides (x,y) väärtuse `Just y`, kus `x` on suurim arv mis on väikem 
-- kui `n`.
-- 
-- Vaata näiteid.

data BinTree a = Leaf | Branch (BinTree a) a (BinTree a)

tree1 : BinTree (Int, Double)
tree1 = Branch (Branch Leaf (1,0.5) Leaf) (5,1.5) (Branch Leaf (7,2.5) Leaf)

-- Main> findclosestsmaller 0 tree1
-- Nothing
-- Main> findClosestSmaller 1 tree1
-- Nothing
-- Main> findClosestSmaller 2 tree1
-- Just 0.5
-- Main> findClosestSmaller 3 tree1
-- Just 0.5
-- Main> findClosestSmaller 6 tree1
-- Just 1.5
-- Main> findClosestSmaller 7 tree1
-- Just 1.5
-- Main> findClosestSmaller 8 tree1
-- Just 2.5

findClosestSmaller : Int -> BinTree (Int, Double) -> Maybe Double
findClosestSmaller n tree =
    case tree of
        Leaf => Nothing

        Branch l (x, y) r =>
            if x >= n then
                findClosestSmaller n l
            else
                case findClosestSmaller n r of
                    Just val =>
                        Just val

                    Nothing => Just y
