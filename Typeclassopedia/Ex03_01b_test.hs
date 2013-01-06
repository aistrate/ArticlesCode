import Data.Map (fromList, (!))
import Data.Char (ord)


-- Wrap (->) in a new type, so that its Functor can be tested without conflicts
data Func a b = Func (a -> b)

apply (Func g) = g


instance Functor (Func a) where
  fmap g (Func h) = Func (g . h)


testReader =
  let m = fromList $ zip [1..8] ['a'..'h']
      digitToChar = (m !)
      test n = apply (fmap ord (Func digitToChar)) n == ord 'a' + n - 1
  in all test [1..8]


main = print testReader
