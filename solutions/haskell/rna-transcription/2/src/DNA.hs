module DNA (toRNA) where

import Data.Either()

transpose :: Char -> Either Char Char
transpose x
  | x == 'G' = Right 'C'
  | x == 'C' = Right 'G'
  | x == 'T' = Right 'A'
  | x == 'A' = Right 'U'
  | otherwise = Left x
 
toRNA :: String -> Either Char String
toRNA = traverse transpose
