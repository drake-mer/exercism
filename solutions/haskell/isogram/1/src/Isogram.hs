module Isogram (isIsogram) where

import qualified Data.Map as Map
import qualified Data.Char

countSet :: String -> Map.Map Char Integer
countSet input = Prelude.foldr insertKey Map.empty cleanedData
   where cleanedData = (Prelude.filter Data.Char.isLetter (Prelude.map Data.Char.toLower input))

insertKey :: Char -> Map.Map Char Integer -> Map.Map Char Integer
insertKey letter = Map.insertWith (+) letter 1

isIsogram :: String -> Bool
isIsogram input = [] == Prelude.filter (> 1) (Prelude.map snd (Map.toList (countSet input)))
