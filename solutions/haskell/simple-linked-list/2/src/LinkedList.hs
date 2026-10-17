module LinkedList
    ( LinkedList
    , datum
    , fromList
    , isNil
    , new
    , next
    , nil
    , reverseLinkedList
    , toList
    ) where

data LinkedList a = Null | Cons a (LinkedList a) deriving (Eq, Show)

datum :: LinkedList a -> a
datum (Cons res _) = res
datum Null = error "List is empty"

fromList :: [a] -> LinkedList a
fromList (x:xs) = (Cons x (fromList xs))
fromList [] = Null

isNil ::  LinkedList a -> Bool
isNil (Cons _ _) = False
isNil Null = True

new :: a -> LinkedList a -> LinkedList a
new x linkedList = Cons x linkedList

next :: LinkedList a -> LinkedList a
next (Cons _ res) = res
next Null = Null

nil :: LinkedList a
nil = Null

reverseLinkedList :: LinkedList a -> LinkedList a
reverseLinkedList = reverseLinkedList' Null

reverseLinkedList' :: LinkedList a -> LinkedList a -> LinkedList a
reverseLinkedList' acc (Cons x xs) = reverseLinkedList' (new x acc) xs
reverseLinkedList' acc Null = acc

toList :: LinkedList a -> [a]
toList Null = [] 
toList (Cons x xs) = (x:(toList xs))

