-- Kontrolltöö 1 (kursuse esimese poole ülesannetest)

-- NB! Päris kontrolltööl antakse esimesed kolm ülesannet ette 
-- paberil. Ülejäänud neli tuleb lahendada arvutis ja esitada 
-- koodifailina Moodlesse. Tehisaru kasutamine on keelatud.

-- Ülesanne 1: vabad muutujad

-- Leia vabad muutujad
-- a. 𝜆𝑥. (𝜆𝑦. 𝑔 𝑥 𝑦) (𝑓 𝑥 𝑦)
-- b. 𝜆𝑥. 𝜆𝑦. 𝑔 𝑥 𝑦 (𝑓 𝑥 𝑦)



-- Ülesanne 2: substitutsioon

-- Tehke järgnevad substitutsioonid:
-- a. (𝜆𝑓. 𝑓 𝑦 (𝜆𝑥. 𝑥))[𝑦→𝜆𝑥 𝑦. 𝑓 𝑥]
-- b. ((𝜆𝑥. 𝑓 (𝑥 𝑥))(𝜆𝑥. 𝑓 (𝑥 𝑥)))[𝑓→𝜆𝑦. 𝑥]



-- Ülesanne 3: redutseeri normaalkujule

-- Kasutades normaaljärjekorda, redutseeri normaalkujule:
-- (𝜆𝑓 𝑥. 𝑓 (𝑓 𝑥)) (add 2) 2


-- Ülesanne 4: listifunktsioon

-- Funkstsioon yl4 arvutab True siis ja ainult siis, kui argumendiks antud 
-- listis leidub paar (a,b), kus a on True.

-- Main> yl4 [(False, 1), (False,6), (True, 4), (False, 3)]
-- True
-- Main> yl4 [(False, 1), (False,6), (False, 3)]
-- False

yl4 : List (Bool,b) -> Bool
yl4 [] = True
yl4 ((a,b)::xs) = if a then yl4 xs else False


-- Ülesanne 5: listifunktsioon foldr-ga

-- Kasutades foldr-i, kirjuta mitterekursiivne funkstsioon yl5, mis arvutab 
-- True siis ja ainult siis, kui listis leidub paar (a,b), kus a ja b on 
-- võrdsed.
--
yl5 : List (Int,Int) -> Bool
yl5 = foldr(\(x,y), zs => if x == y then True else zs) False
-- 
-- Vaata näiteid.

-- Main> yl5 [(1,2),(2,3),(4,4)] 
-- True
-- Main>  yl5 [(1,2),(2,3),(4,5),(1,3)] 
-- False



-- Ülesanne 6: puu

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
sumTreeIf _ Leaf = 0
sumTreeIf p (Branch a (b, c) d) =
  sumTreeIf p a  + (if p b then c else 0) + sumTreeIf p d


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
findInTree x Leaf =  Nothing
findInTree x (Branch a (b,c) d) =
  case compare x b of
       LT => findInTree x a
       EQ => Just c
       GT => findInTree x d

