{--idris voimaldab defineerida lopmatuid struktuure, aga neid ei saa taielikult valja arvutada
Lõpmatu arvutamise piiramiseks paneme Returniks Stream a (a voib olla misiganes Int String jne)
Idris teisendab Inf a <-> a

take : Nat -> Stream a -> List a

Sarnaselt Inf tüüpidele saab optimeerimiseks kasutada Lazy tüüpe:

data Lazy : Type -> Type where
    Delay : a -> Lazy a
    
... ja funktsioon

Force : Lazy a -> a

Reeglid:
* Delay argumenti ei väärtustata.
* Force (Delay e) = e
* Idris teisendab väärtusi vastaval tüübile Lazy a <-> a

Soovitus: Pane Lazy argumendi tüübi ümber, kui seda ei pruugi vaja minna.

Näiteks: (&&) : Bool -> Lazy Bool -> Bool.

A Stream on lopmatu Lazy voib olla lopmatu, aga ei pruugi

YLDISELT DELAY JA FORCE PLE VAJA PANNA PIISAB KUI PANNA LAZY OIGETESSE KOHTADESSE

--}

--take : Nat -> Stream a -> List a
--take Z = []
--take (S n) (x::xs) = x::(take n xs)

cond : Bool -> Lazy a -> Lazy a -> a
cond True esimene _ = esimene
cond False _ teine = teine

fact' : Nat -> Nat
fact' Z = 1
fact' (S k) = (S k) * fact' k

fact : Int -> Int
fact n = cond (n==1) 1 n * (fact (n-1))

--foldr (\x, acc => x || acc) false 

filterStream : (a -> Bool) -> Stream a -> Stream a
filterStream p (x :: xs) =
  if p x then x :: filterStream p xs else filterStream p xs

sieve : Stream Int -> Stream Int
sieve (x :: xs) = x::sieve (filterStream (\y => y `mod` x /= 0) xs)

primes : Stream Int
primes = sieve [2..]

--n lipu ylesanne



--Foldable MyList where
  --folr f a [] = a
  --foldr f a (x::xs) = f x (foldr f a xs)

--Functor MyList where
 -- map f 

