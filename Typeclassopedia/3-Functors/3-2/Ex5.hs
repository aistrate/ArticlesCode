-- Is this statement true or false?
--      "The composition of two Functors is also a Functor."
-- If false, give a counterexample;
-- if true, prove it by exhibiting some appropriate Haskell code.


-- Non-working code:
instance (Functor f, Functor f', c f f') => Functor (c f) where
  fmap g x = undefined

