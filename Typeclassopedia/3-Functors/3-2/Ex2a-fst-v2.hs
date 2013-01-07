newtype Flip b a = Flip (a, b)
                 deriving (Show, Eq)


instance Functor (Flip b) where
  fmap g (Flip (x, y)) = Flip ((g x), y)


testCommaFst = fmap (^2) (Flip (5, 7)) == Flip (25, 7)

main = print testCommaFst
