module DNA (nucleotideCounts, Nucleotide(..)) where

import Data.Map (Map, fromList, adjust)
import Data.Either (Either(..))

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show, Read)

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts x = do
    nucList <- transpose x
    return (countNucleotides nucList)
  where countNucleotides = foldr (adjust (+1)) counter

transpose :: String -> Either String [Nucleotide]
transpose x = traverse transpose' x
 where transpose' l
        | l `elem` concat nucleotides = Right (read [l])
        | otherwise = Left x

nucleotides :: [String]
nucleotides = ["A", "C", "G", "T"]

counter :: Map Nucleotide Int
counter = fromList $ zip (map read nucleotides) (repeat 0)


