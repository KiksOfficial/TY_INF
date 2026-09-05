module K1

sumInt : Int -> Int
sumInt n = if n == 0 then 0 else sumInt(n - 1) + n


fib : Int -> Int 
fib x = if x == 0 then 0 else if x == 1 then 1 else fib(x-1) + fib(x-2)
{-
fib 5
fib(4) + fib(3)
(fib(3) + fib(2)) +fib(3)
((fib(2) + fib(1)) + fib(2)) + (fib(2) + fib(1))
((fib(1) + fib(0)) + 1) + (fib(1) + fib(0)) + (fib(1) + fib(0)) + 1
1 + 0 + 1 + 1 + 0 + 1 + 0 + 1 = 5
-}

modulo : Int -> Int -> Int
modulo x y = if x < y then x else lahuta x y
  where
    lahuta : Int -> Int -> Int
    lahuta x y = if x >= y then lahuta(x-y) y else x

syt : Int -> Int -> Int 
syt x y = if y == 0 then x else syt y (mod x y)

hanoi : Int -> Int
hanoi x = 
  if x == 1
     then 1 
  else if x > 1
    then 2 *hanoi(x-1) + 1 
  else 0

ack : Int -> Int -> Int
ack m n =
  if m == 0
     then n + 1
  else if m > 0 && n == 0
    then ack (m-1) 1
  else
      ack (m-1) (ack m (n-1))

aste : Int -> Int -> Int
aste x n = 
  if n > 0
     then x * aste x (n-1) 
  else 1

--O(n)

qaste : Int -> Int -> Int 
qaste x n =
  if n == 0 then 1
  else if n `mod` 2 == 0 then y * y 
  else x * y * y
  where
    y : Int
    y = qaste x (n `div` 2)

--O(log n)

ndiv : Int -> Int -> Int
ndiv x y = f x 0
  where 
    f : Int -> Int -> Int
    f n z = 
      if n < y 
         then z
      else f (n - y) (z + 1)
