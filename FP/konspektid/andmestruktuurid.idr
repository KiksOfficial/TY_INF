module Konspektid.Andmestruktuurid

notBool : Bool -> Bool
notBool True = False
notBool False = True

notBoolCase : Bool -> Bool
notBoolCase b = case b of
    True => False
    False => True


-- ENNIKUD

paar : (Int, Char)
paar = (1, 'a')

kolmik : (Int, Char, Bool)
kolmik = (1, 'a', False)

pesastatud : ((Double, Int, Char), Bool)
pesastatud = ((1.1, 8, 'x'), False)


-- Enniku elementidele pääseb ligi mustrisobitusega.

tupleFirst : (Int, Char, String) -> Int
tupleFirst (x, c, ys) = x + 1


-- LISTID

len : List a -> Int
len [] = 0
len (x :: xs) = 1 + len xs


listLen : List a -> Int
listLen xs =
    case xs of
        [] => 0
        (x :: xs) => 1 + listLen xs
