-- Define separate type
data Pr b a = Pr a b
            deriving (Show, Eq)


instance Functor (Pr b) where
  fmap g (Pr x y) = Pr (g x) y


testCommaFst = fmap (^2) (Pr 5 7) == Pr 25 7

main = print testCommaFst
