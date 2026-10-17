module Matrix (saddlePoints) where

import qualified Data.Array as A
                   
type Coordinates = (Int, Int)
type Matrix2D e = A.Array Coordinates e
type Matrix2DL e = [[e]]

convert :: Matrix2D e -> Matrix2DL e
convert mat = [ [ (A.!) mat (x, y)  | y <- [ymin..ymax] ] | x <- [xmin..xmax] ]
  where (xmin, ymin, xmax, ymax) = getBounds mat

getBounds :: Matrix2D e -> (Int, Int, Int, Int)
getBounds array = (xmin, ymin, xmax, ymax)
  where ((xmin, ymin), (xmax, ymax)) = A.bounds array 

saddlePoints :: (Ord e) => Matrix2D e -> [Coordinates]
saddlePoints matrix = filter (isSaddlePoint matrix) $ (A.indices matrix)

isSaddlePoint :: (Ord e) => Matrix2D e -> Coordinates -> Bool
isSaddlePoint matrix (x, y) = hMax && vMin
  where hMax = and [ el <= line_elem | line_elem <- (getLineElements (x,y) matrix)]
        vMin = and [ el >= col_elem | col_elem <- (getColumnElements (x,y) matrix)]
        el = (A.!) matrix (x, y)
  
getColumnCoordinates :: Coordinates -> Matrix2D e -> [Coordinates]
getColumnCoordinates (x, _) matrix = zip (repeat x) [ymin..ymax]
  where (_, ymin, _, ymax) = getBounds matrix

getColumnElements :: Coordinates -> Matrix2D e -> [e]
getColumnElements (x, y) matrix = map ((A.!) matrix) (getColumnCoordinates (x, y) matrix)

getLineCoordinates :: Coordinates -> Matrix2D e -> [Coordinates]
getLineCoordinates (_, y) matrix = zip [xmin..xmax] (repeat y)
  where (xmin, _, xmax, _) = getBounds matrix

getLineElements :: Coordinates -> Matrix2D e -> [e]
getLineElements (x, y) matrix = map ((A.!) matrix) (getLineCoordinates (x, y) matrix)

