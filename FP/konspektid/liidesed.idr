--Idrisis tuleb kirjutada funktsioone, mille tüübid erinevad ainult natuke:

equalChar   : Char   -> Char   -> Bool
equalInt    : Int    -> Int    -> Bool
equalString : String -> String -> Bool

--Sellist koodi ei saa kirjutada ühe puhta parameetrilise polümorfse funktsiooniga, kuna funktsioonide implementatsioon on erinev

equal : a -> a -> Bool
equal = ?eq_v  -- pole def. mis töötaks iga tüübi korral

--Selleks saame teha liidese:
infix 6 ==?
interface Equal a where
    (==?) : a -> a -> Bool

Equal Integer where
    a ==? b = ?eq_Integer  -- Integer'ide võrdsus

Equal Bool where
    a ==? b = ?eq_Bool     -- Bool'ide võrdsus

--Idrise standardteegis on defineeritud tüübiklass Eq:
--
interface Eq a where
    (==), (/=) : a -> a -> Bool

-- Minimaalne definitsioon peab sisaldama:
-- (==) või (/=)
  x /= y = not (x == y)  -- vaikedefinitsioon
  x == y = not (x /= y)  -- vaikedefinitsioon

--Võrdlusoperaatori tüüp on:
(==) : Eq a => a -> a -> Bool
--s.t me saame operaatorit kasutada, kui tema argumentitüübil on defineeritud Eq instants!

--Kõikidel polümorfsetel funktsioonidel, mis kasutavad võrdlust peab tüübi kontekstis olema Eq:
lookup : Eq a => a -> List (a, b) -> Maybe b

-- Aritmeetikaga seotud liidesed:
-- Num: +, *, fromInteger
-- Integral: div, mod
-- Fractional: /, recip
-- Neg: -, negate
-- Abs: abs

-- Võrdlemisega seotud liidesed:
-- Eq: ==, /=
-- Ord: <, >, <=, >=, compare, max, min

-- Andmestruktuuridega seotud liidesed:
-- Functor: map
-- Applicative, Monad, Foldable, Alternative, Traversable

-- Tekstiks tegemine Show liidesega: show

-- Liideste vahele ja instantside vahele tekivad seosed

-- Kõik Integral-id on Num-id.
-- Paaride võrdus on defineeritud üldiselt: (Eq a, Eq b) => Eq (a,b)

