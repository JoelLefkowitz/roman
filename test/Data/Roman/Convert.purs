module Test.Data.Roman.Convert where

import Prelude

import Data.Array (range, zip)
import Data.Roman.Convert (fromRoman, toRoman)
import Data.String.Common (split)
import Data.String.Pattern (Pattern(..))
import Data.Traversable (traverse)
import Data.Tuple (Tuple(..))
import Effect (Effect)
import Node.Encoding (Encoding(..))
import Node.FS.Sync (readTextFile)
import Test.Assert (assertEqual)

testConvert ∷ Effect Unit
testConvert = do
  csv ← readTextFile UTF8 "test/numerals.csv"
  void (traverse convert (zip (range 1 150) (split (Pattern ",") csv)))
  where
  convert (Tuple int numeral) = do
    assertEqual
      { actual: toRoman int
      , expected: numeral
      }
    assertEqual
      { actual: fromRoman numeral
      , expected: int
      }
