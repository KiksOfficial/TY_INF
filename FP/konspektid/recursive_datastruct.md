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

• Termi M nimetatakse püsipunktikombinaatoriks kui
    \forall F. M F = F (M F)[cite: 1]

• Curry "paradoksaalne" kombinaator
    Y \equiv \lambda f. (\lambda x. f (x x)) (\lambda x. f (x x))[cite: 1]

• Kombinaator Y on püsipunktikombinaator
    Y e \to_\beta (\lambda x. e (x x)) (\lambda x. e (x x))[cite: 1]
    \to_\beta e ((\lambda x. e (x x)) (\lambda x. e (x x)))[cite: 1]
    =_\beta e (Y e)[cite: 1]

