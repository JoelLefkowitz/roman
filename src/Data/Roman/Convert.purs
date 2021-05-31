module Data.Roman.Convert where

import Prelude
import Data.Array (cons, elem, foldl)
import Data.Map (fromFoldable)
import Data.Maybe (fromMaybe', fromMaybe)
import Data.Roman.Symbols (SymbolsTable(..), getSymbols, getSymbolValues, lookupSymbol, reverseLookupSymbol)
import Data.String.Utils (startsWith)
import Data.Tuple (Tuple(..))
import Data.Array.Search (largestLessThan, finalSatisfying)
import Data.String.Repr (trimStart)

symbolsTable :: SymbolsTable
symbolsTable =
  SymbolsTable
    ( fromFoldable
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
    )

symbols :: Array String
symbols = getSymbols symbolsTable

symbolValues :: Array Int
symbolValues = getSymbolValues symbolsTable

toRoman :: Int -> String
toRoman x = fromMaybe' (\_ -> joinRoman $ toSymbols x) (reverseLookupSymbol x symbolsTable)

fromRoman :: String -> Int
fromRoman x = fromMaybe' (\_ -> fromSymbols $ splitRoman x) (lookupSymbol x symbolsTable)

joinRoman :: Array Int -> String
joinRoman = foldl (\acc x -> acc <> toRoman x) ""

splitRoman :: String -> Array String
splitRoman x
  | elem x symbols = [ x ]
  | otherwise = cons chunk (splitRoman remainder)
    where
    chunk = fromMaybe "" $ finalSatisfying symbols (\s -> startsWith s x)

    remainder = trimStart chunk x

toSymbols :: Int -> Array Int
toSymbols x
  | elem x symbolValues = [ x ]
  | otherwise = cons chunk (toSymbols remainder)
    where
    chunk = fromMaybe 0 (largestLessThan symbolValues x)

    remainder = x - chunk

fromSymbols :: Array String -> Int
fromSymbols = foldl (\acc x -> acc + fromRoman x) 0
