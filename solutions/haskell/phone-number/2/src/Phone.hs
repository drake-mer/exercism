module Phone (number) where

number :: String -> Maybe String
number xs = if (isValid result) then Just result else Nothing 
  where result = if ((head result') == '1') then tail result' else result' 
        result' = filter (`elem` ['0'..'9']) xs

isValid :: String -> Bool
isValid phoneNumber = totalLength == 10 && digit00 `elem` ['2'..'9'] && digit03 `elem` ['2'..'9']
  where (digit00:_:_:digit03:_) = phoneNumber
        totalLength = length phoneNumber

