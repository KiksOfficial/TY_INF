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

# Püsipunktid

* Termi $M$ nimetatakse *püsipunktikombinaatoriks* kui
  $$\forall F. M F = F (M F)$$

* Curry "paradoksaalne" kombinaator
  $$Y \equiv \lambda f. (\lambda x. f (x x)) (\lambda x. f (x x))$$

* Kombinaator $Y$ on püsipunktikombinaator
  $$Y e \to_\beta (\lambda x. e (x x)) (\lambda x. e (x x))$$
  $$\phantom{Y e} \to_\beta e ((\lambda x. e (x x)) (\lambda x. e (x x)))$$
  $$\phantom{Y e} =_\beta e (Y e)$$

"Tugev" püsipunkti kombinaator

$$\Theta \equiv (\lambda x y.\ y(x x y)) (\lambda x y.\ y(x x y))$$

Püsipunktikombinaatoreid saab kasutada rekursiivsete funktsioonide defineerimiseks.

Näide:
$$
\text{add} = \lambda x\ y.\ \text{cond} (\text{iszero}\ x)\ y\ (\text{add}(\text{pred}\ x)(\text{succ}\ y))
$$

$$
\text{add} \equiv Y (\lambda f\ x\ y.\ \text{cond} (\text{iszero}\ x)\ y\ (f\ (\text{pred}\ x)(\text{succ}\ y)))
$$

