lambda arvutus: lambda x y z. e 
idrises on \a, b, c => e 

ehk (\ seotud arg => mida seotud argiga tehakse ) [valised args]

liida : Int -> Int -> Int
liida \x, y => x + y 

ja

viis : Int
viis = (\ x, y => x+y) 2 3

korgema jargi func un func  mis votab argumendiks v tagastab func

map : (a->b) -> List a -> List b 
map f [] = []
map f (x::xs) = f x:: map f xs

filter : (a -> Bool) -> List a -> List a
filter p xs = [x | x<-xs, p x]

folder : (a->b->c) -> b -> List a -> b
folder f b [] = b 
folder f b (x::xs) = f x (folder f b xs)
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
