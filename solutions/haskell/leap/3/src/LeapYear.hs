module LeapYear (isLeapYear) where

isDivisibleBy :: Integer -> Integer -> Bool
isDivisibleBy integer = (==0).(flip rem integer)

isLeapYear :: Integer -> Bool
isLeapYear year = 
 ((isDivisibleBy 4 year) && (not$isDivisibleBy 100 year)) || (isDivisibleBy 400 year) 
