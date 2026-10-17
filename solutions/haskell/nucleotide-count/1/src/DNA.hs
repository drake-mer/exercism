module DNA (nucleotideCounts, Nucleotide(..)) where

import Data.Map (Map, fromList, adjust)
import Data.Either (fromRight, isRight, Either(..))

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts x
  | isRight converted = Right (foldr (adjust (+1)) counter $ fromRight [] converted) 
  | otherwise = Left x
  where converted = traverse transpose x

transpose :: Char -> Either Char Nucleotide
transpose x
 | x == 'A' = Right A
 | x == 'C' = Right C
 | x == 'G' = Right G
 | x == 'T' = Right T
 | otherwise = Left x

counter :: Map Nucleotide Int
counter = fromList [(A, 0), (C, 0), (G, 0), (T, 0)]

