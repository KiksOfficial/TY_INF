{-
  ====================================================================
  LAMBDA-ARVUTUS: SUBSTITUTSIOON (ASENDUS)
  ====================================================================

  Lambda-arvutuse alusoperatsioon (beeta-reduktsioon) on formaalsete
  parameetrite asendamine tegelike argumentidega:
    (λx. e1) e2  ==>  e1[x -> e2]

  Tähistus e1[x -> e2] tähendab: 
    Avaldises (termis) e1 asendatakse muutuja x KÕIK VABAD ESINEMISED termiga e2.

  --------------------------------------------------------------------
  NÕUE: Vabade muutujate vangistamise vältimine (Capture-Avoiding)
  --------------------------------------------------------------------
  Asenduse käigus ei tohi e2 sees olevad vabad muutujad sattuda 
  e1 sees oleva lambda mõjupiirkonda (saada seotuks).

  Näited:
    1) (λx. y x)[y -> λz. z]  =  λx. (λz. z) x
       (Ohutu: y asendati, x jäi seotuks)

    2) (λx. y x)[x -> λz. z]  =  λx. y x
       (Ohutu: sisemine x on seotud lambda λx poolt, väline asendus teda ei mõjuta)

    3) (λx. y x)[y -> λz. x]  != λx. (λz. x) x   [VALE - vangistamine!]
       Õige: Nimetame enne x ümber uueks muutujaks w (α-konversioon):
       (λw. y w)[y -> λz. x]  =  λw. (λz. x) w  [ÕIGE]

  --------------------------------------------------------------------
  SUBSTITUTSIOONI FORMALNE DEFINITSIOON (subst)
  --------------------------------------------------------------------
  Oletame, et FV(e) tähistab avaldise e vabade muutujate hulka.

  1. Muutuja asendus:
     y[x -> e] = if x == y 
                 then e 
                 else y

  2. Konstandi asendus:
     c[x -> e] = c

  3. Rakenduse (application) asendus:
     (e1 e2)[x -> e] = (e1[x -> e]) (e2[x -> e])

  4. Abstraktsiooni (lambda) asendus:
     (λy. e1)[x -> e] = 
       if x == y then 
         λy. e1                           -- Juhtum A: x on varjutatud (shadowed)
       else if y ∉ FV(e) then 
         λy. (e1[x -> e])                 -- Juhtum B: y ei esine e-s vabalt (ohutu)
       else 
         λz. (e1[y -> z][x -> e])         -- Juhtum C: vangistamise oht!
                                          -- (kus z on täiesti uus muutuja / fresh variable)
-}
