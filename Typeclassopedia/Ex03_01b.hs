instance Functor ((->) a) where
  fmap g h = \x -> g (h x)
