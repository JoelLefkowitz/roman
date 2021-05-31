module Test.Convert where

import Prelude
import Data.Array (range, zip)
import Data.Foldable (foldl)
import Data.Roman.Convert (toRoman, fromRoman)
import Data.String.Common (split)
import Data.String.Pattern (Pattern(..))
import Data.Tuple (Tuple(..))
import Effect (Effect)
import Node.Encoding (Encoding(..))
import Node.FS.Sync (readTextFile)
import Test.Assert (assertEqual)

testConvert :: Effect Unit
testConvert = do
  testToRoman
  testFromRoman

numbers :: Array Int
numbers = range 1 150

loadNumerals :: Effect (Array String)
loadNumerals = do
  csv <- readTextFile UTF8 "test/numerals.csv"
  pure $ split (Pattern ",") csv

testToRoman :: Effect Unit
testToRoman = do
  numerals <- loadNumerals
  resolve
    $ do
        (Tuple x y) <- (zip numbers numerals)
        pure
          $ assertEqual
              { actual: toRoman x
              , expected: y
              }

testFromRoman :: Effect Unit
testFromRoman = do
  numerals <- loadNumerals
  resolve
    $ do
        (Tuple x y) <- (zip numbers numerals)
        pure
          $ assertEqual
              { actual: fromRoman y
              , expected: x
              }

resolve :: Array (Effect Unit) -> Effect Unit
resolve arr = foldl _resolve mempty arr
  where
  _resolve acc x = do
    _ <- acc
    x
