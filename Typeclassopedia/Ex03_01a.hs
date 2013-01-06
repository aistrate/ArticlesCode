instance Functor (Either e) where
  fmap _ (Left  x) = Left  x
  fmap g (Right y) = Right (g y)


-- Tests
testEither01 = (fmap (2*) (Right 5)::Either String Int) == Right 10

testEither02 = (fmap (2*) (Left "some error")::Either String Int) == Left "some error"


main = do
  print testEither01
  print testEither02
