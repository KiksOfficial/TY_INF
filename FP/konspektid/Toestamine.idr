module Toestamine

%default total

{-
============================================================
1. INTERAKTIIVNE TEOREEMITÕESTUS JA CURRY-HOWARDI VASTAVUS
============================================================
- Curry-Howardi vastavus ütleb: saame teha tõestusi prog. keelega

Loogikareegel:
              A   B
            ------- nimi
                C

Loogikareegel Idrises:
  nimi : a -> b
        --------
      ->   c

- Töötab, kuna Idrises on puhtad ja täielikud funktsioonid.
- Täielikuse jaoks võtmesõna total või kogu failile %default total
- Kontekstid (Γ) on impltsiitsed. (igal pool sama)
- Motivatsioon: saame tõestada midagi oma programmi kohta.

============================================================
2. KONJUNKTSIOON (conjI, conjE_L, conjE_R)
============================================================
       A   B
      ------- conjI
       A ∧ B

    A ∧ B                   A ∧ B
    ------- conjE_L         ------- conjE_R
      A                       B

============================================================
3. DISJUNKTSIOON (disjI_L, disjI_R, disjE)
============================================================
         A                         B
      ------- disjI_L           ------- disjI_R
       A ∨ B                     A ∨ B

    A ∨ B    A ⊃ C    B ⊃ C
    ----------------------- disjE
               C
============================================================
4. VÄÄRUS (REEGLEID POLE)
============================================================
-}

infixl 10 /\
data (/\) : Type -> Type -> Type where
  ConI : a -> b
        --------
      -> a /\ b

conEl : a /\ b
       --------
     ->   a
conEl (ConI x y) = x

conEr : a /\ b
       --------
     ->   b
conEr (ConI x y) = y

infixl 10 \/
data (\/) : Type -> Type -> Type where
  DisjIL :   a
          -------
       -> a \/ b

  DisjIR :   b
          -------
       -> a \/ b

disjE : a \/ b -> (a -> c) -> (b -> c)
       --------------------------------
     ->               c
disjE (DisjIL x) y z = y x
disjE (DisjIR x) y z = z x

data Void : Type where
  --konstruktoreid pole

falseE : (p: Type) -> Toestamine.Void
                      ----
                    -> p
falseE p v impossible

data (==) : a -> b -> Type where
  Refl: 
        ------
        a == a

plussNull : (n:Nat) -> n+0 = n
plussNull 0 = Refl
plussNull (S k) = 
    --S (plus k 0) = S k
    rewrite (plussNull k) in
      Refl
