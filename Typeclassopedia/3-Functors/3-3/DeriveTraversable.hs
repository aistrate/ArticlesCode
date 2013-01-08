{-# LANGUAGE DeriveFunctor, DeriveFoldable, DeriveTraversable #-}

import Data.Foldable
import Data.Monoid
import Data.Traversable

data Tree a = Leaf a | Node [Tree a]
            deriving (Show, Functor, Foldable, Traversable)

t :: Tree Integer
t = Node [Leaf 3, Leaf 7, Node [Leaf 4, Leaf 8], Leaf 1]


main = print $ traverse (\x -> if x > 6 then [x-1, x] else [x]) t
