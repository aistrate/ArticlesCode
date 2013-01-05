-- import qualified Data.Map as Map (fromList, (!))


-- Ex 3.2.1
instance Functor (Either e) where
  fmap _ (Left  x) = Left  x
  fmap g (Right y) = Right (g y)


testEither01 = (fmap (2*) (Right 5)::Either String Int) == Right 10

testEither02 = (fmap (2*) (Left "some error")::Either String Int) == Left "some error"


instance Functor ((->) a) where
  fmap g h = \x -> g (h x)

-- testReader =
--   let m = Map.fromList $ zip [1..8] ['a'..'h']
--       r = (m Map.!)
--   in r 3


main = do
  print testEither01
  print testEither02
