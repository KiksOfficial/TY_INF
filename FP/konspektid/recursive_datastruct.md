Churchi numbrid

n = λf x.f**n x (**n naitab mitu x func rakendatakse)

3 = λf x.f(f(f(x)))
0 = λf x. x

arv ise teab palju ta on mitte func ei tea mis arv on

Tehted
    n ≡ λf x. f^n x
    succ ≡ λn. λf x. n f (f x)
    iszero ≡ λn. n (λx. false) true

Tehted
    n ≡ λf x. f^n x
    succ ≡ λn. λf x. n f (f x)
    iszero ≡ λn. n (λx. false) true
    add ≡ λm n. λf x. m f (n f x)

Korrutamine ja astendamine
    mul ≡ λm n. λf x. m (n f) x
    exp ≡ λm n. λf x. n m f x

Ühe lahutamine — abifunktsiooni spetsifikatsioon
    prefn f (true, x)  = (false, x)
    prefn f (false, x) = (false, f x)
    (prefn f)^n (false, x) = (false, f^n x)
    (prefn f)^n (true, x)  = (false, f^{n-1} x)

Ühe lahutamine — definitsioon
    prefn ≡ λf p. (false, (cond (fst p) (snd p) (f (snd p))))
    pred  ≡ λn. λf x. snd (n (prefn f) (true, x))


nil   ≡ λz. z               (≡ I)
cons  ≡ λx y. (false, (x, y))
nul  ≡ λz. z true          (≡ fst)
hd    ≡ λz. fst (snd z)
tl    ≡ λz. snd (snd z)

ringimuslause = identsus

not = (lambda x. x false true)

Kombinaator - normaalkujul termid, kus pole vabu muutujaid

Termi M nimetatakse püsipunktikombinaatoriks kui

∀F.MF=F(MF)

Curry "paradoksaalne" kombinaator

Y≡λf.(λx.f(xx))(λx.f(xx))
   
Kombinaator Y on püsipunktikombinaator - saab kasutada rekursiivste func defineerimiseks
Ye→β (λx.e(xx))(λx.e(xx))
  →β e((λx.e(xx))(λx.e(xx)))
  →β e(Ye)

KIab. => (lambda xy. x) (lambda x. x) a b => (lambda x. x) b => b
cond (cond true false true) x y => cond false x y => y

arv nagu lihtne for tsykkel
Churchi nr saab alati 2 arg

