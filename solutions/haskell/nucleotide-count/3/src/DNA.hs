module DNA (nucleotideCounts, Nucleotide(..)) where

import Data.Map (Map, fromList, adjust)
import Data.Either (Either(..))

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts x = do
    nucList <- transpose x
    return (countNucleotides nucList)
  where countNucleotides = foldr (adjust (+1)) counter

transpose :: String -> Either String [Nucleotide]
transpose x = traverse transpose' x
 where transpose' l
        | l == 'A' = Right A
        | l == 'C' = Right C
        | l == 'G' = Right G
        | l == 'T' = Right T
        | otherwise = Left x

counter :: Map Nucleotide Int
counter = fromList [(A, 0), (C, 0), (G, 0), (T, 0)]

