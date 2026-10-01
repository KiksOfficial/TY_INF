module Konspektid.Andmestruktuurid2

--uute tyypide loomine idrises
-- data e. uue algebralise andmetyybi loomine
-- Type e. avaldis, mille tyyp on type 
--
-- saame defineerida tyybisynonyyme ja tyybifunce
Pikkus : Type
Pikkus = Int

l :Pikkus
l = 10

data Bool = True | False
-- data Bool loob uue andmetyybi Bool True | False voimalikud vaartused

||| Naturaalarvud on (standardteegis) defineeritud järgmiselt:
||| Z   - Zero (null)
||| S n - Successor (järgnev arv n-ile)
data Nat = Z | S Nat

||| Kahe naturaalarvu liitmise funktsioon
add : Nat -> Nat -> Nat
add Z y     = y
add (S x) y = S (add x y)

||| Listid on (standardteegis) defineeritud järgmiselt:
||| Nil     - tühi list
||| (::)    - kons-operaator (lisab elemendi listi ette)
data List a = Nil | (::) a (List a)

||| Listi pikkuse arvutamise funktsioon
||| (standardteegis nimega `length`)
len : List a -> Nat
len Nil       = 0
len (_ :: xs) = 1 + len xs

||| Tüübipere Maybe esindab nurjumisvõimalusega arvutusi:
||| Nothing - tulemus puudub (nurjumine)
||| Just a  - tulemus on olemas (väärtus a)
data Maybe a = Nothing | Just a

||| Listist otsimise funktsioon võtme järgi
lookup : Int -> List (Int, b) -> Maybe b
lookup x []           = Nothing
lookup x ((y, z)::ys) = if x == y then Just z else lookup x ys

||| Punkti kirje 3D-ruumis
record Point where
  constructor MkPoint
  x, y, z : Double

||| Sfääri kirje
record Sphere where
  constructor MkSphere
  center : Point
  radius : Double

-- Isendi loomine konstruktoriga ("vana" süntaks)
pt1 : Point
pt1 = MkPoint 10 20 12

-- Isendi loomine nimetatud argumentidega (kirjete süntaks)
sp1 : Sphere
sp1 = MkSphere { radius = 2, center = pt1 }

-- Näide väljade projitseerimisest (saab käivitada nt REPL-is: sp1.center.x)
getCenterX : Sphere -> Double
getCenterX s = s.center.x

add' : Nat -> Nat -> Nat
add' n Z = Just n
add' (S n) m = S (add n m)

-- binaararve saab arvutada kiiremini reversed?

toI : List Bool -> Integer
toI [] = 0
toI (True::xs) = 2 * (toI xs)
toI (False::xs) = 1 + 2 * (toI xs)

fromI : Integer -> List Bool
fromI x = if x <= 0 then []
          else if x `mod` 2 == 0 then False :: fromI ( x`div`2)
          else True :: fromI (x`div`2)

incr : List Bool -> List bool
incr [] = [True]
incr (False::xs) = True :: xs
incr (True::xs) = False :: incr xs

add2 : List Bool -> List Bool -> List Bool
add2 [] ys = ys
add2 (x::xs) [] = x::xs
add2 (False :: xs) (y::ys) = y :: add2 xs ys
add2 ( True :: xs) (False :: ys) = True :: add2 xs ys
add (True :: xs) (False :: ys) = False :: incr (add xs ys)
