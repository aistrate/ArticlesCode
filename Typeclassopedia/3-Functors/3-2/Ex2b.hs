data Pair a = Pair a a
            deriving (Show, Eq)

instance Functor Pair where
  fmap g (Pair x y) = Pair (g x) (g y)


testPair = fmap (^2) (Pair 5 7) == Pair 25 49


main = print testPair
