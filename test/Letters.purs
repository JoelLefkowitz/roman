module Test.Letters where

import Prelude
import Data.Map (fromFoldable)
import Data.Roman.Letters (LetterTriplet(..), letterTripletToSymbols, makeLetterTriplets)
import Data.Roman.Symbols (SymbolsTable(..))
import Data.Tuple (Tuple(..))
import Effect (Effect)
import Test.Assert (assertEqual)

testLetters :: Effect Unit
testLetters = do
  testMakeLetterTriplets
  testLetterTripletToSymbols

testMakeLetterTriplets :: Effect Unit
testMakeLetterTriplets = do
  assertEqual
    { actual: makeLetterTriplets []
    , expected: []
    }
  assertEqual
    { actual: makeLetterTriplets [ "I", "V" ]
    , expected: []
    }
  assertEqual
    { actual: makeLetterTriplets [ "I", "V", "X" ]
    , expected: [ LetterTriplet "I" "V" "X" 1 ]
    }
  assertEqual
    { actual: makeLetterTriplets [ "I", "V", "X", "L" ]
    , expected: [ LetterTriplet "I" "V" "X" 1 ]
    }
  assertEqual
    { actual: makeLetterTriplets [ "I", "V", "X", "L", "C" ]
    , expected:
        [ LetterTriplet "I" "V" "X" 1
        , LetterTriplet "X" "L" "C" 10
        ]
    }

testLetterTripletToSymbols :: Effect Unit
testLetterTripletToSymbols = do
  assertEqual
    { actual: letterTripletToSymbols $ LetterTriplet "I" "V" "X" 1
    , expected:
        SymbolsTable
          ( fromFoldable
              [ Tuple "I" 1
              , Tuple "IV" 4
              , Tuple "V" 5
              , Tuple "IX" 9
              , Tuple "X" 10
              ]
          )
    }
  assertEqual
    { actual: letterTripletToSymbols $ LetterTriplet "X" "L" "C" 10
    , expected:
        SymbolsTable
          ( fromFoldable
              [ Tuple "X" 10
              , Tuple "XL" 40
              , Tuple "L" 50
              , Tuple "XC" 90
              , Tuple "C" 100
              ]
          )
    }
