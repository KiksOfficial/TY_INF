module K7

import Data.Nat
import Data.List

data Tree a = Leaf | Branch (Tree a) a (Tree a)
 
Eq a => Eq (Tree a) where
  Leaf == Leaf = True
  (Branch x y z) == (Branch w v s) =  x==w && y==v && z==s
  _ == _ = False
 
Functor Tree where
  map f Leaf = Leaf
  map f (Branch left mid right) = Branch (map f left) (f mid) (map f right)

tree2list : Tree a -> List a
tree2list Leaf = []
tree2list (Branch left mid right) =  (tree2list left) ++ [mid] ++ (tree2list right)

Foldable Tree where
  foldr f acc tree = foldr f acc (tree2list tree)

len : Foldable t => t a -> Int
len structure = foldr (\x,acc => 1 + acc) 0 structure

infix 7 :/:
data Rat = (:/:) Nat Nat
 
-- normaliseerimine
norm : Rat -> Rat
norm (_   :/:   0) = 0 :/: 0
norm (0   :/:   _) = 0 :/: 1
norm (S a :/: S b) =
    let n = gcd (S a) (S b) in
    (S a) `div` n :/: (S b) `div` n
 
-- muud operatsioonid:
-- (a :/: b) == (c :/: d) = a*d == b*c
-- (a :/: b) +  (c :/: d) = a*d + b*c :/: b*d
-- (a :/: b) *  (c :/: d) = a*c :/: b*d
-- (a :/: b) /  (c :/: d) = a*d :/: b*c
-- pöörd (a :/: b) = (1 :/: 2)  -. (1 :/: 3)  ==  (1 :/: 6)b :/: a
 
neljandik : Rat
neljandik = 1 :/: 4
 
pool : Rat
pool = 1 :/: 2


implementation Eq Rat where
  (a :/: b) == (c :/: d) = (a * d) == (b * c)

implementation Num Rat where
    (a :/: b) +  (c :/: d) = a*d + b*c :/: b*d
    (a :/: b) * (c :/: d) = a*c :/: b*d
    fromInteger x = cast x :/: 1

implementation Fractional Rat where
  (a :/: b) /  (c :/: d) = a*d :/: b*c

implementation Ord Rat where
  compare (a :/: b) (c :/: d) = compare (a * cast d) (b * cast c)

infixl 8 -.
interface Monus t where
  (-.) : t -> t -> t

Neg a => Monus a where
  x -. y = x - y

implementation Monus Nat where
   a -. b = minus a b

implementation Monus Rat where
  (a :/: b) -. (c :/: d) = if (a * d) < (b * c) then 0 :/: 1  else minus (a * d)  (b * c) :/: (b * d)


implementation Range Rat where
  rangeFrom x = norm x :: rangeFrom (norm (x + 1))

  rangeFromThen x y = go (norm x) step
    where
      step : Rat
      step = norm (y -. x)

      go : Rat -> Rat -> Stream Rat
      go curr st = curr :: go (norm (curr + st)) st

  rangeFromTo x y = 
    if x > y 
       then [] 
       else norm x :: rangeFromTo (norm (x + 1)) y

  rangeFromThenTo x y z = 
    if step == (0 :/: 1) || x > z
       then if x == z then [norm x] else []
       else go (norm x) step
    where
      step : Rat
      step = norm (y -. x)

      go : Rat -> Rat -> List Rat
      go curr st = 
        if curr > z 
           then [] 
           else curr :: go (norm (curr + st)) st


main : IO ()
main = do putStr "sisesta nimi"
          nimi<- getLine
          putStrLn ("Tere" ++ nimi ++ "!")
