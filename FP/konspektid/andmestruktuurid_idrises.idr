module Konspektid.Andmestruktuurid_Idrises

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
