import Data.IORef
import System.IO.Unsafe

cast :: a -> b
cast x = unsafePerformIO
           (do writeIORef r x
               readIORef r)
  where r :: IORef a
        r = unsafePerformIO
              (newIORef (error "urk"))
