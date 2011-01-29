fib n = fib' n 1 0
  where fib' 1 _ _ = 1
        fib' 2 p q = p + q
        fib' n p q = fib' (n-1) (p+q) p
