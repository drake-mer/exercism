module LeapYear (isLeapYear) where

isDivisibleBy4 :: Integer -> Bool
isDivisibleBy4 = \x -> x `mod` 4 == 0

isDivisibleBy100 :: Integer -> Bool
isDivisibleBy100 = \x -> x `mod` 100 == 0

isDivisibleBy400 :: Integer -> Bool
isDivisibleBy400 = \x -> x `mod` 400 == 0

isLeapYear :: Integer -> Bool
isLeapYear x = let
 condition1 = (isDivisibleBy4 x) && (not$isDivisibleBy100 x)
 condition2 = (isDivisibleBy4 x) && (isDivisibleBy400 x) 
 in condition1 || condition2
