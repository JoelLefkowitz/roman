module Test.Main where

import Prelude
import Effect (Effect)
import Test.Convert (testConvert)
import Test.Generate (testGenerate)
import Test.Symbols (testSymbols)
import Test.Utils (testUtils)

main :: Effect Unit
main = do
  testConvert
  testGenerate
  testSymbols
  testUtils
