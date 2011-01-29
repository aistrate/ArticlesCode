{-# LANGUAGE GADTs #-}

data Term a where
  Lit :: Int -> Term Int
  Pair :: Term a -> Term b -> Term (a,b)

eval :: Term a -> a
eval (Lit i) = i
eval (Pair a b) = (eval a, eval b)
