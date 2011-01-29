{-# LANGUAGE ExistentialQuantification #-}

data T = forall a . MkT a (a -> Int)

f :: T -> Int
f (MkT x g) = g x
