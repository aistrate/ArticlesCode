data MyEither e a = MyLeft e |
                    MyRight a
    deriving (Eq, Show)

instance Functor (MyEither e) where
    fmap g (MyLeft e)  = MyLeft e
    fmap g (MyRight a) = MyRight (g a)

test1 = fmap (+5) (MyLeft "abc")
test2 = fmap (+5) (MyRight 23)


-- Pair stands for (,)
data Pair e a = Pair e a
    deriving (Eq, Show)

instance Functor (Pair e) where
    fmap g (Pair e a) = Pair e (g a)
    -- fmap g (e, a) = (e, g a)

test3 = fmap (+5) (Pair "abc" 23)


data Func a b = Func {
    func :: a -> b
}

instance Functor (Func e) where
    --fmap g (Func f) = Func (g . f)
    fmap g f = Func (g . func f)

test4 = func (fmap (+1) (Func (*2))) 10


class Functor f => Pointed f where
    pure :: a -> f a    -- aka singleton, return, unit, point

instance Pointed (Func e) where
    pure a = Func (const a)

test5 = (func $ pure 17) 3


{-
instance Functor [] where
fmap _ [] = []
fmap g (x:xs) = g x : fmap g xs

instance Functor Maybe where
fmap _ Nothing = Nothing
fmap g (Just a) = Just (g a)
-}
