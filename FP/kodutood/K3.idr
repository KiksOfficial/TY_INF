module K3
{-
𝗆𝗎𝗅 (𝖺𝖽𝖽 1 2) 3 = 9
𝗆𝗎𝗅 (𝖺𝖽𝖽 𝗍𝗋𝗎𝖾 𝗍𝗋𝗎𝖾) 3 = ei redutseeru, sest add ei ole bool tüüpi argumentidega
𝖼𝗈𝗇𝖽 (𝗂𝗌𝗓𝖾𝗋𝗈 (𝗌𝗎𝖻 3 2)) 0 4 = 4
𝖺𝖽𝖽 (𝖼𝗈𝗇𝖽 (𝗂𝗌𝗓𝖾𝗋𝗈 0) 0 4) 3 = 3
𝖼𝗈𝗇𝖽 (𝖼𝗈𝗇𝖽 𝗍𝗋𝗎𝖾 3 4) 0 3 = tüübiviga, sest cond esimene arg peab olema bool
𝖼𝗈𝗇𝖽 (𝗂𝗌𝗓𝖾𝗋𝗈 0) 𝖿𝗌𝗍 𝗌𝗇𝖽 (𝗉𝖺𝗂𝗋 𝗍𝗋𝗎𝖾 3) = True
𝖼𝗈𝗇𝖽 (𝗂𝗌𝗓𝖾𝗋𝗈 2) (𝖺𝖽𝖽 1) (𝗆𝗎𝗅 2) 2 3 = tüübiviga, sest arvu rakendatakse arvule, mis pole funktsioon


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

pyths : Int -> List (Int,Int,Int)
pyths n = [(x,(y,z)) | x<-[1..n], y<-[1..n], z<-[1..n], x*x + y*y == z*z]
