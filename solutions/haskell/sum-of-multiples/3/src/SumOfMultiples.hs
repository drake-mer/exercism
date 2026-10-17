module SumOfMultiples (sumOfMultiples) where

import qualified Data.Set as Set


sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = sum $ multiples factors limit

multiples :: [Integer] -> Integer -> Set.Set Integer
multiples factors limit = Set.fromList $ concat multiplesLists
  where multiplesLists = map getMultiplesOf factors
        getMultiplesOf 0 = [0]
        getMultiplesOf n = takeWhile (< limit) (map (*n) [1..])

