module CollatzConjecture (collatz) where

-- import Data.List

collatz :: Integer -> Maybe Integer
collatz start  
  | start > 0 = Just (toInteger (length (takeWhile (> 1) (iterate next start))))
  | otherwise = Nothing



next :: Integer -> Integer
next n = if n `mod` 2 == 0 then (n `div` 2) else if n > 1 then (n * 3 + 1) else n 





