module ProteinTranslation(proteins) where


codons :: String -> [String]
codons (x:y:z:xs) = (x:y:z:[]):(codons xs)
codons [] = []
codons _ = error "string length not a multiple of 3"

protein :: String -> Maybe String
protein codon
  | codon == "AUG" = Just "Methionine"
  | codon `elem` ["UUU", "UUC"] = Just "Phenylalanine" 
  | codon `elem` ["UUA", "UUG"] = Just "Leucine"
  | codon `elem` ["UCU", "UCC", "UCA", "UCG"] = Just "Serine"
  | codon `elem` ["UAU", "UAC"] = Just "Tyrosine"
  | codon `elem` ["UGU", "UGC"] = Just "Cysteine"
  | codon `elem` ["UGG"] = Just "Tryptophan"
  | codon `elem` ["UAA", "UAG", "UGA"] = Just "STOP"
  | otherwise = Nothing

proteins :: String -> Maybe [String]
proteins nucleotideSequence = takeWhile (\prot -> prot /= "STOP") <$> (mapM protein (codons nucleotideSequence))

