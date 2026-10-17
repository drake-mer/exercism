module Pangram (isPangram) where


{-
 - Explanation:
 - We build a Set from the whole string
 - Then we check that all alphabet letters are in that set
 - The end
 -}

import qualified Data.Set as Set
import qualified Data.Char as Char


isPangram :: String -> Bool
isPangram input = all (isMemberOf letterSet) alphabet
  where isMemberOf set l = Set.member l set
        letterSet = Set.fromList (map Char.toLower input)

alphabet :: [Char]
alphabet = ['a'..'z']
