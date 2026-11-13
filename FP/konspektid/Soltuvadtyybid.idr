module soltuvad
{-Kui tahame nt listi indekseerida: Nat -> List a -> a

List ei pruugi sisaldada n elemente
List voib olla tyhi
Voib teha: Nat -> List a -> Maybe a
tootab a ple piisavalt optimaalne kui listis on piisavalt elemente
Listi tyyp voiks sisaldada infot pikkuse kohta-}

--Idrises
data List : Type -> Type where
    Nil = List a
    (::) = a -> List a -> List a

data Vec : Nat -> Type -> Type where
  Nil : Vec 0 a
  (::) : a -> Vec n a -> Vec (1+n) a

appendVect : Vect n a -> Vect m a -> Vect (n + m) a
appendVect [] ys = ys
appendVect (x::xs) ys = x :: appendVect xs ys

test5 : Vec 3 Int
test5 = [1,2,3]

--Soltuv on selle prst et func nth : Vec (1+n+m) -> a -> a tyyp soltub n vaartusest

--Soltuvad tyybid voimaldavad teha arvutamist ja toestamist koos

head : Vect (S k) a -> a
head (x::xs) = x

tail : Vect (S k) a -> Vect k a
tail (x::xs) = xs

sumVect Vect k Int -> Int
sumVect (x::xs) = x + sumVect xs
sumVect [] = 0

rev2 : {k:Nat} -> Vect k a -> Vect k a
rev2 [] = []
rev2 {k=S k'}(x::xs) =  ?rhs_dd

myFilter : (a -> Bool) -> Vect n a -> List a
myFilter p [] = []
myFilter p (x::xs) with (p x)
  _ | True = x :: myFilter p xs
  _ | False = myFilter p xs

{-C/C++
-printf("(%s %d\n", "viis", 5)

Idrises- -}

data FArg = FT String | FInt | FString

nimi : String
nimi = "Kalmer"

ea : List FArg
ea = [FT "(", FString, ": ", FInt, FT ")"]

