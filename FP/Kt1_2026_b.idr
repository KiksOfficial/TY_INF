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
-- Main> sumTreeIf (/=5) tree1
-- 3.0
-- Main> sumTreeIf (\ _ => False) tree1
-- 0.0

sumTreeIf : (a -> Bool) -> BinTree (a, Double) -> Double
sumTreeIf p t = ?sumTreeIf_rhs
