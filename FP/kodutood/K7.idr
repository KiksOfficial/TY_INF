data Tree a = Leaf | Branch (Tree a) a (Tree a)
 
Eq a => Eq (Tree a) where
  Leaf == Leaf = True
  (Branch x y z) == (Branch w v s) =  x==w && y==v && z==s
  _ == _ = False
 
Functor Tree where
  map f Leaf = Leaf
  map f (Branch left mid right) = Branch (map f left) (f mid) (map f right)

tree2list : Tree a -> List a
tree2list Leaf = []
tree2list (Branch left mid right) =  (tree2list left) ++ [mid] ++ (tree2list right)

Foldable Tree where
  foldr f acc tree = foldr f acc (tree2list tree)
