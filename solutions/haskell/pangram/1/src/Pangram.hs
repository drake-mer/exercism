module Pangram (isPangram) where


{-
 - Explanation:
 - We build a map from the alphabet
 - Then we use updateWith (+1)
 - Then we check using toList that everything is > 0
 - The end
 -}

import qualified Data.Map as Map
import qualified Data.Char as Char


isPangram :: String -> Bool
isPangram phrase = allLetters letterCount
  where letterCount = updateCount (map Char.toLower phrase) initialSet

allLetters :: Map.Map Char Integer -> Bool
allLetters count = all (0 <) (map snd (Map.toList count)) 

initialSet :: Map.Map Char Integer
initialSet = Map.fromList (zip alphabet (repeat 0))

updateCount :: String -> Map.Map Char Integer -> Map.Map Char Integer 
updateCount (x:xs) initialCount = updateCount xs (Map.adjust (+1) x initialCount)
updateCount [] initialCount = initialCount


alphabet :: [Char]
alphabet = ['a'..'z']
