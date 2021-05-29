module Main where

import Prelude
import Data.Array (cons, elem, foldl)
import Data.Map (Map, fromFoldable, lookup)
import Data.Maybe (fromMaybe', fromMaybe)
import Data.String.Utils (startsWith)
import Data.Tuple (Tuple(..))
import Utils (getKeys, getValues, largestLessThan, latestSatisfying, reverseLookup, trimStart)

scheme :: Map String Int
scheme =
  fromFoldable
    [ Tuple "I" 1
    , Tuple "IV" 4
    , Tuple "V" 5
    , Tuple "IX" 9
    , Tuple "X" 10
    , Tuple "XL" 40
    , Tuple "L" 50
    , Tuple "XC" 90
    , Tuple "C" 100
    , Tuple "CD" 400
    , Tuple "D" 500
    , Tuple "CM" 900
    , Tuple "M" 1000
    ]

toRoman :: Int -> String
toRoman x = fromMaybe' (\_ -> joinRoman $ toScheme x) (reverseLookup x scheme)

fromRoman :: String -> Int
fromRoman x = fromMaybe' (\_ -> fromScheme $ splitRoman x) (lookup x scheme)

joinRoman :: Array Int -> String
joinRoman = foldl (\acc x -> acc <> toRoman x) ""

splitRoman :: String -> Array String
splitRoman x
  | elem x (getKeys scheme) = [ x ]
  | otherwise = cons chunk (splitRoman remainder)
    where
    chunk = fromMaybe "" $ latestSatisfying (getKeys scheme) (\s -> startsWith s x)

    remainder = trimStart chunk x

toScheme :: Int -> Array Int
toScheme x
  | elem x (getValues scheme) = [ x ]
  | otherwise = cons chunk (toScheme remainder)
    where
    chunk = fromMaybe 0 (largestLessThan (getValues scheme) x)

    remainder = x - chunk

fromScheme :: Array String -> Int
fromScheme = foldl (\acc x -> acc + fromRoman x) 0
