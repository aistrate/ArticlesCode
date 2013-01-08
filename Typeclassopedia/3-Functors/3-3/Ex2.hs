{-
Functor laws:
    fmap id = id
    fmap (g . h) = (fmap g) . (fmap h)

Evil Functor instance:
    instance Functor [] where
      fmap _ [] = []
      fmap g (x:xs) = g x : g x : fmap g xs

Question: Which laws are violated by the evil Functor instance for list shown above:
          both laws, or the first law alone? Give specific counterexamples.
-}


-- Rewrite list type, so that it can coexist with []
newtype List a = List { list :: [a] }
               deriving (Show, Eq)


-- Rewrite Evil Functor instance
instance Functor List where
  fmap _ (List [])     = List []
  fmap g (List (x:xs)) = List (g x : g x : list (fmap g (List xs)))


main = do
  let g = (+1)
      h = (*10)
      ls = List [1..3]
  print $ fmap (g . h) ls
  print $ (fmap g . fmap h) ls
  print $ fmap (g . h) ls == (fmap g . fmap h) ls


{-
Output:

    List {list = [11,11,21,21,31,31]}
    List {list = [11,11,11,11,21,21,21,21,31,31,31,31]}
    False

Answer: The Evil Functor instance breaks BOTH functor laws.
-}
