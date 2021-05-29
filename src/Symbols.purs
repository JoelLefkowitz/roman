module Symbols where

import Prelude
import Data.Array (foldl)
import Data.Map (Map, lookup, empty, union)
import Data.Maybe (Maybe)
import Utils.Strings (trimStart)
import Utils.Maps (getKeys, getValues, reverseLookup)

newtype SymbolsTable
  = SymbolsTable (Map String Int)

instance eqSymbolsTable :: Eq SymbolsTable where
  eq (SymbolsTable x) (SymbolsTable y) = eq x y

instance showSymbolsTable :: Show SymbolsTable where
  show s = "Letters: [" <> (trimStart ", " $ foldl (\acc x -> acc <> ", " <> x) "" $ (getSymbols s)) <> "]"

instance monoidSymbolsTable :: Monoid SymbolsTable where
  mempty = SymbolsTable empty

instance semigroupSymbolsTable :: Semigroup SymbolsTable where
  append (SymbolsTable x) (SymbolsTable y) = (SymbolsTable (union x y))

getSymbols :: SymbolsTable -> Array String
getSymbols (SymbolsTable symbolsTable) = getKeys symbolsTable

getSymbolValues :: SymbolsTable -> Array Int
getSymbolValues (SymbolsTable symbolsTable) = getValues symbolsTable

lookupSymbol :: String -> SymbolsTable -> Maybe Int
lookupSymbol key (SymbolsTable symbolsTable) = lookup key symbolsTable

reverseLookupSymbol :: Int -> SymbolsTable -> Maybe String
reverseLookupSymbol key (SymbolsTable symbolsTable) = reverseLookup key symbolsTable
