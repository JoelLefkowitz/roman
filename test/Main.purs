module Test.Main where

import Prelude
import Effect (Effect)
import Test.Convert (testConvert)
import Test.Generate (testGenerate)
import Test.Letters (testLetters)
import Test.Symbols (testSymbols)

main :: Effect Unit
main = do
  testConvert
  testLetters
  testGenerate
  testSymbols
