import Data.Monoid


(<$>) :: Functor f => (a -> b) -> f a -> f b
f <$> a = fmap f a

class Functor f => Applicative f where
        pure :: a -> f a
        (<*>) :: f (a -> b) -> f a -> f b

instance Monoid a => Applicative ((,) a) where
        pure x = (mempty, x)
        (u, f) <*> (v, x) = (u `mappend` v, f x)

{-
instance Applicative Maybe where
        pure = return
        (<*>) = ap
-}

instance Applicative Maybe where
    pure a              = Just a
    Nothing <*> _       = Nothing
    _       <*> Nothing = Nothing
    Just g  <*> Just a  = Just (g a)

test3 = Just (+3) <*> Just 100


-- instances
test4 :: Num a => Maybe a
test4 = (+) <$> pure 11 <*> pure 120

test4' :: Num a => Maybe a
test4' = pure (+) <*> pure 11 <*> pure 120

test5 = ("a", (+)) <*> ("b", 10) <*> ("c", 15)

test6 = (+) <$> ("b", 10) <*> ("c", 15)


instance Applicative ((->) a) where
        pure = const
        (<*>) f g x = f x (g x)

add7 a b c d e f g = a + b + c + d + e + f + g

ftest7 :: Int -> Int
ftest7 = add7 <*> (+1) <*> (+2) <*> (+3) <*> (+4) <*> (+5) <*> (+6)

test7 = ftest7 100

test7' = (+) <*> (*2) $ 10
-- (10+) (10*2)

test7'' = (*) <*> (1/) $ 10
-- (10*) (1/10)
