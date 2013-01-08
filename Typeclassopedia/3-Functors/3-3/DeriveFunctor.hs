{-# LANGUAGE DeriveFunctor #-}

data Tree a = Leaf a | Node [Tree a]
            deriving (Show, Eq, Functor)
 
t :: Tree Integer
t = Node [Leaf 3, Leaf 7, Node [Leaf 4, Leaf 8], Leaf 1]


testDerive = fmap (+1) t == Node [Leaf 4, Leaf 8, Node [Leaf 5, Leaf 9], Leaf 2]

main = do
  print $ fmap (+1) t
  print testDerive
