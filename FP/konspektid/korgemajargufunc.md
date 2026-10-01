lambda arvutus: lambda x y z. e 
idrises on \a, b, c => e 

ehk (\ seotud arg => mida seotud argiga tehakse ) [valised args]

liida : Int -> Int -> Int
liida \x, y => x + y 

ja

viis : Int
viis = (\ x, y => x+y) 2 3

korgema jargu func on func  mis votab argumendiks func v tagastab func

map : (a->b) -> List a -> List b 
map f [] = []
map f (x::xs) = f x:: map f xs

map (+1) [a,b,c]
liidab igale elemendile 1

map (\x => x*x) [a,b,c]

filter (\x => x`mod`2 == 0) [1..6]

filter (\x => x > 3) [1..5]

map (\x => filter (\x => x `mod`2 == 0) * 2) [1,2,3,4]

f.g.h.i.j $x => alguses rakenda arg x j ss i ss ss h...

foldr (+) 0 [1..4]
foldl (*) 1 [1..4]

foldl tavaliselt nats efektiivsem kui foldr sst foldr teeb rekursiivselt a foldl teeb vasakult paremale




filter : (a -> Bool) -> List a -> List a
filter p xs = [x | x<-xs, p x]

foldr : (a->b->c) -> b -> List a -> b
foldr f b [] = b 
foldr f b (x::xs) = f x (foldr f b xs)
aka func rakendatakse listi argumentide vahel nt sum(list) sulud on paremal

foldl on nagu foldr a sulud paiknevad vasakul

selle asemel et siduda koik argumendid muutujatega
uusFunc x y z = olemasolevFunx (x+1) y z

saame idrises votta osa argumente ja tagastada funci 
uusFunc x = olemasolevFunc (x+1)

funce saab componeerida .-ga

f xs = sum (takeWhile (!=0) xs)
asemel 
f = sum . takeWhile (!=0)
