module Squares (difference, squareOfSum, sumOfSquares) where

difference :: Integral a => a -> a
difference n = ( sum [k * (((n+1)*n - 2*k) `div` 2) | k <- [1..n]] )

squareOfSum :: Integral a => a -> a
squareOfSum n = (sumOfInteger n) * (sumOfInteger n)

sumOfInteger :: Integral a => a -> a
sumOfInteger n = (( n + 1) * n) `div` 2

sumOfSquares :: Integral a => a -> a
sumOfSquares n = (squareOfSum n) - (difference n)
