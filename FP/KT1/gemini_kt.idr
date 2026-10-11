-- 1. (λx.λy.yx)xy(λy.xy) => y x
--
-- 2.(a) (λx.add xx)= α (λy.add xx) ei
--   (b) (λx.add xy)= α (λy.add yx) ei
--   (c) (λxy.add xy)= α (λyx.add yx) jah
--
-- 3.  sum [ x - y | (x,y) <- zip [5, 6] [1..4] ] => ([5,1], [6,2]) => (4,4) => 8
--
-- 5. Kasutades foldr-i, kirjuta mitterekursiivne funktsioon countTruePairs : List (Bool, Int) -> Int,
-- mis loendab kokku, mitmes paaris on esimene komponent True.
--
-- Main> countTruePairs [(True, 1), (False, 2), (True, 3)]
-- 2
-- Main> countTruePairs [(False, 1), (False, 2)]
-- 0

yl5 : List (Bool, Int) -> Int
yl5 xs = foldr (\(x,y), acc => if x then 1 + acc else acc) 0 xs
