module LeapYear (isLeapYear) where

isDivisibleBy' :: Integer -> Integer -> Bool
isDivisibleBy' integer = (==0).(flip rem integer)

isLeapYear :: Integer -> Bool
isLeapYear year = ((isDivisibleBy 4) && (not (isDivisibleBy 100))) || (isDivisibleBy 400)
    where isDivisibleBy n = isDivisibleBy' n year
