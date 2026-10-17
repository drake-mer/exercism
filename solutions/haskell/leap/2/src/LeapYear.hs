module LeapYear (isLeapYear) where

isLeapYear :: Integer -> Bool
isLeapYear year = 
 ((isDivisibleBy4 year) && (not$isDivisibleBy100 year)) || (isDivisibleBy400 year) 
 where isDivisibleBy4 = (==0).(flip rem 4)
       isDivisibleBy100 = (==0).(flip rem 100)
       isDivisibleBy400 = (==0).(flip rem 400)
