{-
 lambda alusoperatsiooniks on formaalsete parameetrite asendamine tegelike argumentidega
 (lambda x1. e1) e2 termis e1 tuleb asendada muutuja x koik vabad esinemised termiga e2
 e1 [x -> e2]
e1 on algne avaldis
iga x asemele pane e2

 peab valtima vabade muutujate vangistamist
 (λx. y x)[y->λz. z]= λx. (λz. z) x
 (λx. y x)[x->λz. z]= λx. y x
 (λx. y x)[y->λz. x] != λx. (λz. x) x

 sub definitsioon
 y[x->e] = {
   if x == y then e
    else y
   }

 c[x->e] = c

 (e1 e2)[x->e] = (e1[x->e])(e2[x->e])

 (λy.e1)[x->e] = {
   if x == y then λy.e1
  
   }

 -}
