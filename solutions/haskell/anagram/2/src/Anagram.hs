module Anagram (anagramsFor) where

import Data.List
import Data.Char

anagramsFor :: String -> [String] -> [String]
anagramsFor xs = filter (isAnagram xs)

isAnagram :: String -> String -> Bool
isAnagram x y = isAnagram' && (not isSameWord')
    where isAnagram' = (sort upperCaseX) == (sort upperCaseY)
          isSameWord' = upperCaseX == upperCaseY
          upperCaseX = map toUpper x
          upperCaseY = map toUpper y
