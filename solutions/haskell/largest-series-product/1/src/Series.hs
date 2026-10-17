module Series (Error(..), largestProduct) where

import qualified Data.Char
import qualified Data.List
import qualified Data.Maybe

data Error = InvalidSpan | InvalidDigit Char deriving (Show, Eq)

chunkNumber :: Int -> String -> Int
chunkNumber n str = (length str) - (n - 1)

largestProduct :: Int -> String -> Either Error Int
largestProduct n str
  | n == 0 = Right 1
  | n < 0 = Left InvalidSpan
  | not $ validateLength n str = Left InvalidSpan
  | nonDigitChar == Nothing = Right (maximum (explodProducts n (integers str)))
  | otherwise = Left (InvalidDigit (Data.Maybe.fromJust nonDigitChar))
  where nonDigitChar = nonDigit str

validateLength :: Int -> String -> Bool
validateLength n str = (chunkNumber n str) > 0

nonDigit :: String -> Maybe Char
nonDigit str = Data.List.find (not.(Data.Char.isDigit)) str

integers :: String -> [Int]
integers = map (Data.Char.digitToInt)

explodProducts :: Int -> [Int] -> [Int]
explodProducts n (x:xs) 
  | (length following) == (n-1) = ((foldl (*) x following):explodProducts n xs)
  | otherwise = []
  where following = take (n-1) xs



