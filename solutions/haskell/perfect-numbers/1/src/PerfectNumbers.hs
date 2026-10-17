module PerfectNumbers (classify, Classification(..)) where

import qualified Data.Set as Set

data Classification = Deficient | Perfect | Abundant deriving (Eq, Show)

classify :: Int -> Maybe Classification
classify x
 | x < 1 = Nothing
 | x == 1 = Just Deficient -- 3 first prime numbers are deficient by definition
 | x == 2 = Just Deficient 
 | x == 3 = Just Deficient
 | product > x = Just Abundant
 | product == x = Just Perfect
 | product < x = Just Deficient
 where product = productOfMultiples x


multiplesOfNumber :: Int -> [Int]
multiplesOfNumber x = [n | n <- [1..((x + 1) `div` 2)], (x `mod` n) == 0]

productOfMultiples :: Int -> Int
productOfMultiples x = foldl (+) 0 (multiplesOfNumber x)