import Control.Applicative

data MyMaybe a = MyNothing |
                 MyJust a
    deriving (Eq, Show)

instance Functor MyMaybe where
    fmap g MyNothing  = MyNothing
    fmap g (MyJust a) = MyJust (g a)

test1 = fmap (+5) MyNothing
test2 = fmap (+5) (MyJust 23)


instance Applicative MyMaybe where
    pure a                  = MyJust a
    MyNothing <*> _         = MyNothing
    _         <*> MyNothing = MyNothing
    MyJust g  <*> MyJust a  = MyJust (g a)

test3 = MyJust (+3) <*> MyJust 100


-- instances
test4 :: Num a => IO a
test4 = (+) <$> return 11 <*> return 120

test5 = ("a", (+)) <*> ("b", 10) <*> ("c", 15)
