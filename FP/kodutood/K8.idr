module K8 
import System.Random
import Data.List

t2ring : IO ()
t2ring = do 
  suva <- randomRIO (the  Int32 1, 6)
  putStrLn (show suva)


dialoog : IO ()
dialoog = do
  putStrLn "Sisesta nimi: "
  sisend <- getLine 
  putStrLn ("Tere "  ++ sisend ++ "!") 

prindiArvud : List Int32 -> IO ()
prindiArvud [] = pure ()
prindiArvud (x::xs) = do
  putStrLn (show x)
  prindiArvud xs

trükiNimekiri : Stream String -> List String -> IO ()
trükiNimekiri (y::ys) (x::xs) = do
  putStrLn (y ++ x)
  trükiNimekiri ys xs
trükiNimekiri _ [] = pure ()
 
tärnid : Stream String
tärnid = "* " :: tärnid
 
pannkoogid : List String
pannkoogid = ["3 muna", "30g suhkrut", "100g nisujahu","250g piima", "20g võid", "näpuotsaga soola"]

arvud : Stream String
arvud = nattostring (S Z) where
  nattostring : Nat -> Stream String
  nattostring n = (show n ++ ".") :: nattostring (S n)

readMaybe : IO (Maybe Int32)
readMaybe = do
  input <- getLine
  if all isDigit (unpack input)
    then pure (Just (cast input))
    else pure Nothing
 
loeArv : IO Int32
loeArv = do
  putStrLn "Sisesta arv"
  buffer <- readMaybe
  case buffer of
      Nothing => do 
        putStrLn "Viga! Ei tunne sellist arvu!"
        loeArv
      Just x => pure x

summa2 : IO ()
summa2 = do
  x <- loeArv
  y <- loeArv
  putStrLn (show (x+y))

data Tree k v = E | T (Tree k v) k v (Tree k v)

test124 : Tree Int String
test124 = T (T E 1 "\252ks" (T E 2 "kaks" E)) 4 "neli" E

treeToList : Tree k v -> List (k,v)
treeToList E = []
treeToList (T x y z w) = (y,z) :: treeToList x ++ treeToList w

Eq a => Eq b => Eq (Tree a b) where
  (==) E E = True
  (==) E (T l m n r) = False
  (==) (T l1 m1 n1 r1) (T l2 m2 n2 r2)  = l1 == l2 && m1 == m2 && r1 == r2 && n1 == n2
  (==) (T l m n r) E = False

lookup : Ord k => k -> Tree k v -> Maybe v
lookup x (T l m n r) = if x < m then lookup x l else if x == m then Just n else if x > m then lookup x r else Nothing
lookup _ E = Nothing

insert : Ord k => k -> v -> Tree k v -> Tree k v
insert k v E = T E k v E
insert k v (T l k' v' r) = if k < k' then T (insert k v l) k' v' r else if k == k' then T l k v r else T l k' v' (insert k v r)

fold : Ord k => (k -> v -> a -> a) -> a -> Tree k v -> a
fold f acc (T l k v r) = 
  let acc1 = fold f acc l
      acc2 = f k v acc1
  in fold f acc2 r
fold f acc E = acc

insertAll : Ord k => List (k, v) -> Tree k v -> Tree k v
insertAll xs t = foldr (\(k, v) => insert k v) t xs

combine : Ord k => Tree k v -> Tree k v -> Tree k v
combine puu1 (T l k v r) = (T puu1 k v r)
combine puu1 E = puu1
 
remove : Ord k => k -> Tree k v -> Tree k v
remove _ E = E
remove val (T l k v r) =
  case compare val k of
       LT => T (remove val l) k v r
       GT => T l k v (remove val r) 
       EQ => combine l r

union : Ord k => Tree k v -> Tree k v -> Tree k v
union t1 t2 = fold insert t1 t2


Set : Type -> Type
Set a = Tree a ()
 
empty : Set a
empty = E
 
setToList : Ord a => Set a -> List a
setToList = fold (\x,(),xs=>x::xs) []

add : Ord a => a -> Set a -> Set a
add el set_ = insert el () set_

delete : Ord a => Set a -> Set a -> Set a
delete set1 set2 =  fold (\x, (), acc => remove x acc) set1 set2

intersect : Ord a => Set a -> Set a -> Set a
intersect set1 set2 = 
  let x = delete set2 set1
      y = delete set1 set2
      z = delete (union set1 set2) x
  in delete z y
