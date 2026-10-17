module Bob (responseFor) where

import qualified Data.Text as T
import           Data.Text (Text)
import qualified Data.Char as C

responseFor :: Text -> Text
responseFor sentence
    | empty = T.pack "Fine. Be that way!"
    | shouting && question = T.pack "Calm down, I know what I'm doing!"
    | question = T.pack "Sure."
    | shouting = T.pack "Whoa, chill out!"
    | otherwise = T.pack "Whatever."
    where shouting = isUpperCase sentence && hasAlpha sentence
          question = isQuestion sentence
          empty = isEmpty sentence

hasAlpha :: Text -> Bool
hasAlpha = any C.isAlpha . T.unpack

isEmpty :: Text -> Bool
isEmpty sentence = isNull || onlySpaces || isNull
  where onlySpaces = all C.isSpace . T.unpack $ sentence
        isNull = T.empty == sentence || T.unpack sentence == ""

isUpperCase :: Text -> Bool
isUpperCase sentence = upperCase == sentence
  where upperCase = T.toUpper sentence

isQuestion :: Text -> Bool
isQuestion = (== '?').T.last.T.filter (not.C.isSpace)


