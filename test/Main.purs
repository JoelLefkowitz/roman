module Test.Main where

import Prelude
import Effect (Effect)
import Test.Convert (testConvert)
import Test.Generate (testGenerate)
import Test.Symbols (testSymbols)
import Test.Letters (testLetters)

main :: Effect Unit
main = do
  testSymbols
  testConvert
  testLetters
  testGenerate
