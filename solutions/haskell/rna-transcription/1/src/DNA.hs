module DNA (toRNA) where

import Data.Either

transpose :: Char -> Either Char Char
transpose x
  | x == 'G' = Right 'C'
  | x == 'C' = Right 'G'
  | x == 'T' = Right 'A'
  | x == 'A' = Right 'U'
  | otherwise = Left x
 
transposeStrand :: String -> [Either Char Char]
transposeStrand = map transpose

toRNA :: String -> Either Char String
toRNA xs
  | null errors = Right correct
  | otherwise = Left (head errors)
  where (errors, correct) = partitionEithers $ transposeStrand xs 

