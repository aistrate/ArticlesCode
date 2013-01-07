-- Give an example of a type of kind * -> * which cannot be made
-- an instance of Functor (without using 'undefined').


newtype T a = T (a -> Int)

instance Functor T where
  -- We would need a hypothetical 'inverse' function:
  fmap g (T h) = T (h . (inverse g))

-- g :: a -> b
-- h :: a -> Int

-- inverse g       :: b -> a
-- h . (inverse g) :: b -> Int


-- This cannot be written for the general case
inverse :: (a -> b) -> (b -> a)
inverse = undefined
