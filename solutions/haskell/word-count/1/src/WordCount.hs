module WordCount (wordCount) where

import qualified Data.Map
import qualified Data.List.Split
import qualified Data.Char
import qualified Data.String.Utils

wordCount :: String -> [(String, Int)]
wordCount xs = Data.Map.toList countMap 
  where countMap = Prelude.foldr (\x -> Data.Map.insertWith (+) x 1) Data.Map.empty elems
        elems = filter (/= []) $ map extractWords $ Data.List.Split.splitOneOf " ," xs
        extractWords = (map Data.Char.toLower).(filter (\x -> Data.Char.isAlphaNum x || x == '\'')).stripQuote.Data.String.Utils.strip 
        stripQuote = (dropWhile (=='\'')).(reverse.(dropWhile (==('\''))).reverse)
