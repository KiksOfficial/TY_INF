module K5

filter' : (a -> Bool) -> List a -> List a
filter' f xs = foldr (\x, acc => if f x then x::acc else acc) [] xs

nullid1 : List Int -> Int
nullid1 [] = 0
nullid1 (x::xs) = (if x == 0 then 1 else 0) + nullid1 xs

nullid2 : List Int -> Int
nullid2 xs = foldr (\x, acc => if x == 0 then acc + 1 else acc) 0 xs

nullid3 : List Int -> Int
nullid3 xs = sum (map (\x => if x == 0 then 1 else 0) xs)

nullid4 : List Int -> Nat
nullid4 xs = length (filter' (==0)xs)

nullid5 : List Int -> Int
nullid5 xs = cast (length ([x|x<-xs, x==0]))

length' : List a -> Int
length' xs = foldl (\acc, x => acc+1) 0 xs

productList : List Int -> Int
productList = foldr (\x, acc => acc*x) 1

append' : List a -> List a -> List a
append' xs ys = foldr (\x, acc => x::acc) ys xs

isEven : Nat -> Bool
isEven Z         = True
isEven (S Z)     = False
isEven (S (S n)) = isEven n
 
all' : (a -> Bool) -> List a -> Bool
all' f xs = foldr (\x, acc => f x && True) True xs

reverse' : List a -> List a
reverse' = foldl rev df
  where
    df : List a
    df = []
    rev : List a -> a -> List a
    rev x y = (y::x)

eemaldaNullid : List Int -> List Int
eemaldaNullid = foldr rem df
  where
    df : List Int
    df = []
    rem : Int -> List Int -> List Int
    rem x y = if x == 0 then y else x::y

allEqual : List Int -> Bool
allEqual [] = True
allEqual (x::xs) = foldr (\y, acc => acc && (y==x)) True xs

unzip' : List (a, b) -> (List a, List b)
unzip' = foldr f z
  where
    z : (List a, List b)
    z = ([], [])
    f : (a, b) -> (List a, List b) -> (List a, List b)
    f (x,y) (xs,ys) = (x::xs, y::ys)

removeAll1 : Int -> List Int -> List Int
removeAll1 n xs = foldr (\x, acc => if x /= n then x::acc else acc) [] xs

removeAll2 : Int -> List Int -> List Int
removeAll2 n xs = filter (\x => x /= n) xs
removeAll3 : Int -> List Int -> List Int
removeAll3 n xs = [x | x<-xs , x /= n]

any' : (a -> Bool) -> List a -> Bool
any' p xs = foldr (\x, acc => p x || acc) False xs

map' : (a -> b) -> List a -> List b
map' f xs = foldr (\x, acc => (f x)::acc) [] xs 
