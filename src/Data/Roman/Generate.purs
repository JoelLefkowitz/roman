module Data.Roman.Generate where

import Prelude
import Data.Array (foldl)
import Data.Map (empty)
import Data.Roman.Letters (letterTripletToSymbols, makeLetterTriplets)
import Data.Roman.Symbols (SymbolsTable(..))

generateSymbolsTable :: Array String -> SymbolsTable
generateSymbolsTable letters = foldl joinSets (SymbolsTable empty) (makeLetterTriplets letters)
  where
  joinSets acc x = append acc $ letterTripletToSymbols x
