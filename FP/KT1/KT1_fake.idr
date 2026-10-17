module K1 

sum [ x-y | (x,y) <- zip [3,4] [1..6] ]


f : List (Int, String) -> String -> String
f [] s = s
f [(n,x)] s = x
f (x::xs) s = f xs s

f [(5,"a"), (6,"b")] "" = ?

vastus on b sst kui listis mitu elementi ss kutsub valja f xs s kui listis 1 element ss viimane


Margi, kas termid on alfa-ekvivalentsed:
(a) (λ x. add x x)= ? α (λ y. add x x) ei

(b) (λ x. add x y)= ? α (λ y. add y x) ei

(c) (λ x y. add x y)= ? α (λ y x. add y x) jah

(d) (λ x. g x)= ? α g ei



Alfa ekvivalentsus - lih muudetakse var nimi


