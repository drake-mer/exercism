module SumOfMultiples (sumOfMultiples) where

import qualified Data.Set as Set


sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = foldl (+) 0 (Set.toList $ multiples factors limit)

multiples :: [Integer] -> Integer -> Set.Set Integer
multiples factors limit = Set.fromList $ concat multiplesLists
  where multiplesLists = map getMultiplesOf factors
        getMultiplesOf n = if n == 0 then [0] else takeWhile (< limit) (map (*n) [1..])

