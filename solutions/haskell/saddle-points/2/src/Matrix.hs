module Matrix (saddlePoints) where

import qualified Data.Array
                   

getBounds :: Data.Array.Array (Int, Int) e -> (Int, Int, Int, Int)
getBounds array = (xmin, ymin, xmax, ymax)
  where (xmin, ymin) = lowerBound
        (xmax, ymax) = upperBound
        (lowerBound, upperBound) = Data.Array.bounds array 


saddlePoints :: (Ord e) => Data.Array.Array (Int, Int) e -> [(Int, Int)]
saddlePoints matrix = filter ((flip isSaddlePoint) matrix) $ (Data.Array.indices matrix)


isSaddlePoint :: (Ord e) => (Int, Int) -> Data.Array.Array (Int, Int) e -> Bool
isSaddlePoint (x, y) matrix = hMax && vMin
  where hMax = and [ el <= line_elem | line_elem <- (getLineElements (x,y) matrix)]
        vMin = and [ el >= col_elem | col_elem <- (getColumnElements (x,y) matrix)]
        el = (Data.Array.!) matrix (x, y)
  
getColumnCoordinates :: (Int, Int) -> Data.Array.Array (Int, Int) e -> [(Int, Int)]
getColumnCoordinates (x, _) matrix = zip (repeat x) [ymin..ymax]
  where (_, ymin, _, ymax) = getBounds matrix

getColumnElements :: (Int, Int) -> Data.Array.Array (Int, Int) e -> [e]
getColumnElements (x, y) matrix = map ((Data.Array.!) matrix) (getColumnCoordinates (x, y) matrix)

getLineCoordinates :: (Int, Int) -> Data.Array.Array (Int, Int) e -> [(Int, Int)]
getLineCoordinates (_, y) matrix = zip [xmin..xmax] (repeat y)
  where (xmin, _, xmax, _) = getBounds matrix

getLineElements :: (Int, Int) -> Data.Array.Array (Int, Int) e -> [e]
getLineElements (x, y) matrix = map ((Data.Array.!) matrix) (getLineCoordinates (x, y) matrix)

