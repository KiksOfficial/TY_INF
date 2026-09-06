term saab olla {muutuja, constant, abstraktsioon, aplikatsioon (lambdax. e, kus lambda on nimeta func x on muutuja ja func keha on e)}

N: lambda arg1 arg2 arg 3 .. argn. e =argumendid eraldatakse tyhikuga ja argumendid loppevad punktiga func ise on e 
N2: (lambdax. x 3 2) mul => mul laheb parameeter x asemel mis votab omakorda 3 ja 2ehk arg tulevad mul 3 2 => 6

tglt konstante ple vaja

makrodefinitsioonid on mitte-rekursiivsed vordused

N: liida == lambda x y. add x y 

vabad ja seotud muutujad pmst luh vaata kumb muutuja on lambda "kyljes" see on seotud ja kyi ple kyljes ss vaba KEHTIB AIND SCOPES

FV(x)       = {x}
FV(c)       = ∅
FV(e1 e2)   = FV(e1) ∪ FV(e2)
FV(λx. e)   = FV(e) \ {x}

ilma vabade muutujateta on kinnised terminid

N: lambda (x y). x y 
N2: FV(λx. (λy. x) (λz. y) y on vaba 
