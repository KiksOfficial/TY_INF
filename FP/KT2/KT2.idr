module KT2

import Data.IOArray
import Data.String
import Data.Vect


-- Ülesanne 1

-- Kirjuta funktsioonid addAt ja removeFrom, mis lisavad ja eemaldavad
-- vektorist elemendi antud indeksil.

addAt : (k:Nat) -> a -> Vect (k+n) a -> Vect (k+1+n) a
addAt = ?addAt_rhs

removeFrom : (k:Nat) -> Vect (k+1+n) a -> Vect (k+n) a
removeFrom = ?removeFrom_rhs

-- Näiteks:
-- Main> addAt 4 'x' ['a', 'b', 'c', 'd', 'e']
-- ['a', 'b', 'c', 'd', 'x', 'e']
-- Main> addAt 0 'x' ['a', 'b', 'c', 'd', 'e']
-- ['x', 'a', 'b', 'c', 'd', 'e']    
-- Main> removeFrom 3  ['a', 'b', 'c', 'd', 'e']
-- ['a', 'b', 'c', 'e']
-- Main> removeFrom 1  ['a', 'b', 'c', 'd', 'e']
-- ['a', 'c', 'd', 'e']

-- Ülesanne 2

-- Vaadake etteantud koodi ja defineerige järgnevad 
-- lineaarsete tüüpidega funktsioonid.

-- etteantud kood:
add : (1 _ : Nat) -> (1 _: Nat) -> Nat
add x 0 = x
add 0 (S k) = S k
add (S j) (S k) = 2+j+k
 
mul : (1 _ : Nat) -> (1 _: Nat) -> Nat
mul 0 0 = 0
mul (S k) 0 = 0
mul 0 (S k) = 0
mul (S j) (S k) = (S j)*(S k)

namespace Lin
    public export
    data List : Type -> Type where
        Nil  : Lin.List a
        (::) : (1 _ : a) -> (1 _ : Lin.List a) -> Lin.List a
 
-- a) seqL -- rakendab funktsioonid järjest
seqL : (1 _: Lin.List ((1 _ : a) -> a)) -> (1 _: a) -> a
seqL = ?seqL_rhs
 
-- Näited:
-- Main> seqL [add 1, add 2] 0
-- 3
-- Main> seqL [add 3, mul 0, add 4] 0
-- 4
 
--  b) mapL -- foldr, kus akumulaator ja list on lineaarsed
foldLl : ((1 _ : a) -> (1 _ : b) -> a) -> (1 _ : Lin.List b) -> a -> a
foldLl = ?foldLl_rhs

-- Näited:
-- Main> foldLl (\ x, y => mul x y) [2,0] 1
-- 0
-- Main> foldLl (\ x, y => mul x y) [2,5] 1
-- 10
--

