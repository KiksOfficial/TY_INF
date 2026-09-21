{-
𝗆𝗎𝗅 (𝖺𝖽𝖽 1 2) 3 = 9
𝗆𝗎𝗅 (𝖺𝖽𝖽 𝗍𝗋𝗎𝖾 𝗍𝗋𝗎𝖾) 3 = ei redutseeru, sest add ei ole bool tüüpi argumentidega


-}

mod7 : List Int
mod7 = [x | x<-[0..999], x `mod` 7 == 0]

count : Char -> String -> Nat
count c s = length [x | x <- unpack s, x == c]

concat' : List (List a) -> List a
concat' xss = [x | xs<-xss, x<-xs]


factors : Int -> List Int
factors n = [x | x<-[1..n], n `mod` x == 0]

isPrime : Int -> Bool
isPrime n = factors n == [1,n]

primes : Int -> List Int
primes n = [x | x<-[1..n-1], isPrime x]

zip' : List a -> List b -> List (a,b)
zip' [] _ = []
zip' _ [] = []
zip' (x::xs) (y::ys) = (x,y) :: zip' xs ys

pairs : List a -> List (a,a)
pairs (x :: y :: xs) = (x, y) :: pairs (y :: xs)
pairs _ = []

and' : List Bool -> Bool
and' [] = True
and' (x::xs) = x && and' xs

sorted  : List Int -> Bool
sorted xs = and' [x<=y| (x,y) <- pairs xs]
