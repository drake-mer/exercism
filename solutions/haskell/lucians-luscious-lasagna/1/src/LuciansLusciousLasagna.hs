module LuciansLusciousLasagna (elapsedTimeInMinutes, expectedMinutesInOven, preparationTimeInMinutes) where

-- TODO: define the expectedMinutesInOven constant
--

preparationTimeInMinutes = (* 2)

-- TODO: define the preparationTimeInMinutes function

expectedMinutesInOven = 40
-- TODO: define the elapsedTimeInMinutes function
--
elapsedTimeInMinutes n m = (expectedMinutesInOven - m) + (preparationTimeInMinutes n)
