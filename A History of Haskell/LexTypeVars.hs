-- Lexically scoped type variables

prefix :: a -> [[a]] -> [[a]]
prefix x yss = map xcons yss
  where
    --xcons :: [a] -> [a] -- BAD!
    xcons ys = x : ys
