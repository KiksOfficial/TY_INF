module K2
import Data.Monoid.Exponentiation

fst' : (a, b) -> a
fst' (a, b) = a

length' : List a -> Int
length' [] = 0
length' (x::xs) = 1 + length' xs


export
infixr 7 +++
(+++) : List a -> List a -> List a
(+++) [] ys = ys
(+++) (x::xs) ys = x :: (xs+++ys)

replicate' : Int -> a -> List a
replicate' 0 x = []
replicate' num x = x :: replicate' (num - 1) x

take' : Int -> List a -> List a
take' _ [] = []
take' 0 _ = []
take' num (x::xs) = x :: take' (num-1) xs
-- 3 [1,2,3,4,5]
-- 1 take 2 [2,3,4,5]
-- 1 2


sum' : List Integer -> Integer
sum' [] = 0
sum' (x::xs) = x + sum xs

drop' : Int -> List a -> List a
drop' 0 (x::xs) = (x::xs)
drop' _ [] = []
drop' num (x::xs) = drop' (num-1) xs

reverse' : List a -> List a
reverse' [] = []
reverse' (x::xs) = reverse' xs ++ [x]

esimesed : List (a,b) -> List a
esimesed [] = []
esimesed ((a,b)::xs) = a:: esimesed xs

leidub : Integer -> List Integer -> Bool
leidub _ [] = False
leidub n (x::xs) = 
  if x == n then True
  else leidub n xs

dropLast : List a -> List a
dropLast [] = []
dropLast (x::[]) = []
dropLast (x::xs) = x :: dropLast(xs)

-- pack = "".join(...)
-- unpack = list(...)
lisa : Int -> Char -> String -> String
lisa i x ys = pack(lisa' i x (unpack ys)) 
  where
    lisa' : Int -> Char -> List Char -> List Char
    lisa' i x ys =
      if i <= 0 then x :: ys
      else case ys of
                [] => [x]
                (y::ys') => y :: lisa' (i-1) x ys'


arvuta : List (Double, Nat) -> Double -> Double
arvuta [] _ = 0
arvuta ((a,b)::xs) x = a * x ^ b + arvuta xs x

pikkus : List a -> Nat
pikkus [] = 0
pikkus(x::xs) = 1 + pikkus xs

tagurpidi : List a -> List a
tagurpidi [] = []
tagurpidi (x :: xs) = tagurpidi xs ++ [x]

viimane : List a -> Maybe a
viimane [] = Nothing
viimane (x::[]) = Just x
viimane (x::xs) = viimane xs

igaTeine : List a -> List a
igaTeine [] = []
igaTeine [x] = []
igaTeine (x::y::ys) = y :: igaTeine ys

zip' : List a -> List b -> List (a, b)
zip' [] _ = []
zip' _ [] = []
zip' (x::xs) (y::ys) = (x,y) :: zip' xs ys

loenda : Integer -> List Integer -> Nat
loenda _ [] = 0
loenda n (x::xs) =
  if n == x then 1 + loenda n xs
  else loenda n xs

asenda : Char -> Char -> String -> String
asenda vana uus sona = pack (lisa_s (unpack sona)) where
  lisa_s : List Char -> List Char
  lisa_s [] = []
  lisa_s (x::xs) = if x == vana then uus :: lisa_s xs
    else x :: lisa_s xs

paarid : List a -> List (a,a)
paarid [] = []
paarid [x] = []
paarid (x::y::xs) = (x,y) :: paarid (y::xs)
