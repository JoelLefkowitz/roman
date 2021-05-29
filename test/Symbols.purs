module Test.Symbols where

import Prelude
import Data.Map (fromFoldable)
import Data.Maybe (Maybe(..))
import Data.Tuple (Tuple(..))
import Effect (Effect)
import Symbols (getSymbols, getSymbolValues, lookupSymbol, reverseLookupSymbol, SymbolsTable(..))
import Test.Assert (assertEqual)

testSymbols :: Effect Unit
testSymbols = do
  testGetSymbols
  testGetSymbolValues
  testLookupSymbol
  testReverseLookupSymbol

symbolsTableFixture :: SymbolsTable
symbolsTableFixture =
  SymbolsTable
    ( fromFoldable
        [ Tuple "a" 1
        , Tuple "b" 2
        , Tuple "c" 3
        ]
    )

testGetSymbols :: Effect Unit
testGetSymbols =
  assertEqual
    { actual: getSymbols symbolsTableFixture
    , expected: [ "a", "b", "c" ]
    }

testGetSymbolValues :: Effect Unit
testGetSymbolValues =
  assertEqual
    { actual: getSymbolValues symbolsTableFixture
    , expected: [ 1, 2, 3 ]
    }

testLookupSymbol :: Effect Unit
testLookupSymbol = do
  assertEqual
    { actual: lookupSymbol "a" symbolsTableFixture
    , expected: Just 1
    }
  assertEqual
    { actual: lookupSymbol "d" symbolsTableFixture
    , expected: Nothing
    }

testReverseLookupSymbol :: Effect Unit
testReverseLookupSymbol = do
  assertEqual
    { actual: reverseLookupSymbol 1 symbolsTableFixture
    , expected: Just "a"
    }
  assertEqual
    { actual: reverseLookupSymbol 4 symbolsTableFixture
    , expected: Nothing
    }
