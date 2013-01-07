import Control.Monad (when)


data ITree a = Leaf (Int -> a) 
             | Node [ITree a]


instance Functor ITree where
  fmap g (Leaf h)  = Leaf (g . h)
  fmap g (Node ts) = Node (map (fmap g) ts)


-- Tests

instance Eq a => Eq (ITree a) where
  Leaf g  == Leaf h    = g 0 == h 0    -- test for arbitrary value 0
  Node ts == Node ts'  = ts  == ts'
  _       == _         = False

v = const


testTree01 = fmap (replicate 2) (Leaf (v 'x')) == Leaf (v "xx")

testTree02 = fmap (replicate 2) (Node ([]::[ITree Char])) == Node ([]::[ITree String])

testTree03 = fmap (replicate 2) (Node [Leaf (v 'x')]) == Node [Leaf (v "xx")]


testTree04 = fmap (replicate 2) (Node [Leaf (v 'x')]) /= Node ([]::[ITree String])

testTree05 = fmap (replicate 2) (Node [Leaf (v 'x')]) /= Leaf (v "xx")


main = do
  let tests = [testTree01, testTree02, testTree03, testTree04, testTree05]
  print tests
  print $ (show . length $ filter id tests) ++ " tests SUCCEEDED"
  when (any not tests) $
    print $ (show . length $ filter not tests) ++ " tests FAILED"
