module K6

import Data.Vect

data Email = E String String
 
varmo     : Email
kalmer    : Email
karoliine : Email
varmo     = E "varmo.vene"       "ut.ee"
kalmer    = E "kalmer.apinis"    "ut.ee"
karoliine = E "karoliine.holter" "ut.ee"

Show Email where
  show (E nimi domeen) = nimi ++ "@" ++ domeen

record Kiri where
  constructor MkKiri
  saatja   : Email
  saajad   : List Email
  pealkiri : String
  sisu     : String


marcus : Email
marcus = E "marcusariston" "ut.ee"
testkiri : Kiri
-- testkiri = MkKiri marcus [varmo, kalmer, karoliine] "Tahtis pealkiri" "Tahtis sisu"
testkiri = MkKiri {
  saatja = marcus
  , saajad = [varmo,kalmer,karoliine]
  , pealkiri = "Mingi pealkiri"
  , sisu = "Mingi sisu"
  }

pealkiriSisu : Kiri -> String
pealkiriSisu (MkKiri saaja saajad pealkiri sisu) = pealkiri ++ ": " ++ sisu

data Tree a = Leaf | Branch (Tree a) a (Tree a)

Eq a => Eq (Tree a) where
  (==) Leaf Leaf = True
  (==) Leaf (Branch l m r) = False
  (==) (Branch l1 m1 r1) (Branch l2 m2 r2)  = l1 == l2 && m1 == m2 && r1 == r2
  (==) (Branch l m r) Leaf = False

height : Tree a -> Int
height Leaf = 0
height (Branch Leaf m Leaf) = 1
height (Branch l m r) = 1 + max (height l)  (height r)

fold : (a -> b -> a -> a) -> a -> Tree b -> a
fold f a Leaf = a 
fold f a (Branch l m r) = f (fold f a l) m (fold f a r)

size : Tree a -> Nat
size Leaf = 0
size (Branch left mid right) = fold (\l, _, r => 1 + l + r) 0 (Branch left mid right)

heightFold : Tree a -> Int
heightFold Leaf = 0
heightFold (Branch Leaf 'x' Leaf) = 1
heightFold (Branch left mid right) = fold (\l, _, r => 1 + max l r) 0 (Branch left mid right)

balanced : Tree a -> Bool
balanced Leaf = True
balanced (Branch left mid right) = abs (heightFold left - heightFold right) <= 1 && balanced left && balanced right

tree2list : Tree a -> List a
tree2list Leaf = []
tree2list (Branch left mid right) = fold (\l, m, r => l ++ [m] ++ r) [] (Branch left mid right) 

bOrs : Bool -> Type
bOrs False = Int
bOrs True = String

hundred : (isString : Bool) -> if isString then String else Int
hundred False = 100
hundred True = "hundred"

reprodT : Nat  -> Type
reprodT 0  = Nat
reprodT (S k)  = Nat -> reprodT k
 
add_all : (k : Nat) -> (acc : Nat) -> reprodT k
add_all Z acc = acc
add_all (S k) acc = \x => add_all k (acc + x)


append : Vect n a -> Vect m a -> Vect (n + m) a
append a b = a ++ b


wreplicate : (n : Nat) -> a -> Vect n a
wreplicate Z _ = []
wreplicate (S k) x = x :: wreplicate k x
