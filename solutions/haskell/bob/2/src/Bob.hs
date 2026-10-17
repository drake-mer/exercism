{-# LANGUAGE OverloadedStrings #-}

module Bob (responseFor) where

import qualified Data.Text as T
import           Data.Text (Text)
import qualified Data.Char as C

responseFor :: Text -> Text
responseFor sentence
    | isEmpty sentence = "Fine. Be that way!"
    | shouting && question = "Calm down, I know what I'm doing!"
    | question = "Sure."
    | shouting = "Whoa, chill out!"
    | otherwise = "Whatever."
    where shouting = isUpperCase sentence && hasAlpha sentence
          question = isQuestion sentence

hasAlpha :: Text -> Bool
hasAlpha = any C.isAlpha . T.unpack

isEmpty :: Text -> Bool
isEmpty sentence = isNull || onlySpaces
  where onlySpaces = all C.isSpace . T.unpack $ sentence
        isNull = T.empty == sentence 

isUpperCase :: Text -> Bool
isUpperCase sentence = upperCase == sentence
  where upperCase = T.toUpper sentence

isQuestion :: Text -> Bool
isQuestion = (== '?').T.last.T.filter (not.C.isSpace)
