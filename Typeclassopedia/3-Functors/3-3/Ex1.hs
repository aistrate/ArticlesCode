{-
Functor laws:
    fmap id = id
    fmap (g . h) = (fmap g) . (fmap h)

Question: Although it is not possible for a Functor instance to satisfy the first Functor law
          but not the second, the reverse is possible. Give an example of a (bogus) Functor
          instance which satisfies the second law but not the first.
-}


import Prelude hiding (Maybe, Nothing, Just)

data Maybe a = Nothing | Just a
             deriving (Show, Eq)

instance Functor Maybe where
  fmap g _ = Nothing


main = do
  let g = (+1)
      h = (*10)
      x = Just 7
  putStrLn "FIRST LAW:"
  print $ fmap id x
  print $ id x
  print $ fmap id x == id x
  putStrLn "\nSECOND LAW:"
  print $ fmap (g . h) x
  print $ (fmap g . fmap h) x
  print $ fmap (g . h) x == (fmap g . fmap h) x
  putStrLn ""


{-
Output:

FIRST LAW:
Nothing
Just 7
False

SECOND LAW:
Nothing
Nothing
True

-}
