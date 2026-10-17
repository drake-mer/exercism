module Phone (number) where

number :: String -> Maybe String
number xs = if (isValid result) then Just result else Nothing 
  where result = if ((head result') == '1') then tail result' else result' 
        result' = filter (`elem` ['0'..'9']) xs

isValid :: String -> Bool
isValid phoneNumber = (length phoneNumber) == 10 && (phoneNumber !! 0)`elem`['2'..'9'] && (phoneNumber !! 3)`elem`['2'..'9']

