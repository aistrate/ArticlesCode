-- Definition:
-- data (,) a b = (,) a b


instance Functor ((,) a) where
  fmap g (x, y) = (x, g y)


testCommaSnd = fmap (^2) (5, 7) == (5, 49)

main = print testCommaSnd
