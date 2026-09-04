a: Double
a = 40.0

b: Double
b = 30.0

c: Double
c = sqrt(a*a + b*b)


--func (arg1) (arg2) ...
--tyybid: Bool (True , False); Int (64 bit taisarv) Integer (suurte arvude puhul) Double (64 bit floating point) Char (1 char) String (collection of chars)
--Moned tyybid on parametriseeritud teiste tyypidega (nt. List Bool aka [bool, bool, bool...])
--func type a->b a on parameeter ja b on tulemus
--mitme parameetriga funce saame nii et func result type on also func nt INt -> (Int -> Bool) sulge ple vaja
liida: Int -> Int -> Int
liida a b = a + b

liidaKaks: Int -> Int
liidaKaks = liida 2

--infix operaatorid on definitsioonid, mis koosnevad ainult jargnevatest symbolitest: :+-*\/=.?|&><!@$%^# neid saab kasutada argumentide vahel
--infix operaatorit saab kasutada ka prefix a ss peab kasutama sulge(nt. 3 + 4 on sama mis (+) 3 4)
--assotsiatiivsus ehk a && b && c == a && (b&&c) ja 2-3-4 == (2-3)-4
--tavalisi func nimesid saab panna ´ ´ vahele ja kasutada kui tava operaatoreid a ´div´ b == a / b
--idris on taandetundlik keel nagu python :(
--sama tasemega definitsioonid peavad algama samalt veerult
--sisemised blockid peavad olema suurema veeruga 

