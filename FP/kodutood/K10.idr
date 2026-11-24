{-punkt2d : Type
punkt2d = (Double, Double)

punkt : Nat -> Type
punkt Z     = Unit
punkt (S Z) = Double
punkt (S n) = (Double, punkt n)

nullpunkt : (d : Nat) -> punkt d
nullpunkt Z         = ()
nullpunkt (S Z)     = 0.0
nullpunkt (S (S k)) = (0.0, nullpunkt (S k))

add : (d : Nat) -> punkt d -> punkt d -> punkt d
add Z () () = ()
add (S Z) x y = x + y
add (S (S k)) (x1, xs)  (y1, ys) = (x1 + y1, add (S k) xs ys)

sum : (d : Nat) -> List (punkt d) -> punkt d
sum d xs = foldr (add d) (nullpunkt d) xs

data Vect : (k : Nat) -> (a : Type) -> Type where
  Nil  : Vect Z a
  (::) : a -> Vect k a -> Vect (S k) a
 
Eq a => Eq (Vect k a) where
    [] == []             = True
    (x :: y) == (z :: w) = x==z && y==w

append : Vect n a -> Vect m a -> Vect (n + m) a
append []        ys = ys
append (x :: xs) ys = x :: append xs ys

zipVect : Vect n a -> Vect n b -> Vect n (a,b)
zipVect (x::xs) (y::ys) = (x, y) :: zipVect xs ys
zipVect [] _ = []
zipVect _ [] = []

replaceVect : a -> (n : Nat) -> Vect (1 + n + k) a -> Vect (1 + n + k) a
replaceVect val Z     (x :: xs) = val :: xs
replaceVect val (S m) (x :: xs) = x :: replaceVect val m xs

min : Nat -> Nat -> Nat
min 0 y = 0
min (S k) 0 = 0
min (S k) (S j) = S (min k j)
 
takeVec : (n:Nat) -> {m:Nat} -> Vect m a -> Vect (min n m) a
takeVec Z _ = []
takeVec (S n) [] = []
takeVec (S n) (x::xs) = x :: takeVec n xs


data TreeShape : Type where
  LeafShape : TreeShape
  NodeShape : (l : TreeShape) -> (r : TreeShape) -> TreeShape
 
data Tree : TreeShape -> Type -> Type where
  Leaf : Tree LeafShape a
  Node : (left : Tree l a) -> (this : a) -> (right : Tree r a) ->
       Tree (NodeShape l r) a
 
Eq TreeShape where
    LeafShape == LeafShape  = True
    LeafShape == (NodeShape l r)  = False
    (NodeShape l r) == LeafShape  = False
    (NodeShape l r) == (NodeShape x y)  =
        l==x && r==y
 
Eq a => Eq (Tree s a) where
    Leaf == Leaf = True
    (Node left this right) == (Node x y z) =
        left == x && this == y && right == z
 
tr1 : Tree (NodeShape LeafShape (NodeShape LeafShape LeafShape)) Int
tr1 = Node Leaf 1 (Node Leaf 2 Leaf)
 
tr2 : Tree (NodeShape LeafShape (NodeShape LeafShape LeafShape)) Int
tr2 = Node Leaf 3 (Node Leaf 1 Leaf)

-- data Tree : Type -> Type where
--   Leaf : Tree a
--   Node : Tree a -> a -> Tree a -> Tree a
--
-- zip_tree : Tree a -> Tree b -> Tree (a, b)
-- zip_tree Leaf Leaf  =  Leaf
-- zip_tree Leaf (Node left this right)  =  Leaf
-- zip_tree (Node left this right) Leaf  =  Leaf
-- zip_tree (Node left1 this1 right1) (Node left2 this2  right2)  =
--    Node (zip_tree left1 left2) (this1 , this2) (zip_tree right1 right2)
--
zip_tree : Tree shape a -> Tree shape b -> Tree shape (a, b)
zip_tree Leaf Leaf = Leaf
zip_tree (Node x y z) (Node left this right) = Node (zip_tree x left) (y, this) (zip_tree z right)

flip_shape : TreeShape -> TreeShape
flip_shape LeafShape = LeafShape
flip_shape (NodeShape l r) = (NodeShape (flip_shape r) (flip_shape l))
 
flip_tree : Tree shape a -> Tree (flip_shape shape) a
flip_tree Leaf = Leaf
flip_tree (Node left this right) = Node (flip_tree right) this (flip_tree left)
-}


punkt : Nat -> Type
punkt Z     = Unit
punkt (S Z) = Double
punkt (S n) = (Double, punkt n)

nullpunkt : (d : Nat) -> punkt d
nullpunkt 0 = ()
nullpunkt (S (S k)) = (0.0, (nullpunkt (S k)))
nullpunkt (S Z) = 0.0

add: (d:Nat) -> punkt d -> punkt d -> punkt d
add 0 x y = ()
add (S Z) x y = x + y
add (S(S k)) (x1, xs) (y1, ys) = (x1+ y1, add (S k) xs ys)

sum : (d : nat) -> list (punkt d) -> punkt d
sum dim xs = foldr (add dim) (nullpunkt dim) xs
