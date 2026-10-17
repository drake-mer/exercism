module Anagram (anagramsFor) where

import Data.List
import Data.Char

anagramsFor :: String -> [String] -> [String]
anagramsFor xs = filter (isAnagram xs)

isAnagram :: String -> String -> Bool
isAnagram x y = isAnagram' && isNotTheSameWord'
    where isAnagram' = (sort (map toUpper x)) == (sort (map toUpper y))
          isNotTheSameWord' = (map toUpper x) /= (map toUpper y)

