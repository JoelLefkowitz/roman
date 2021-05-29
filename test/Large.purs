module Test.Large where

import Prelude
import Effect (Effect)
import Test.Assert (assert)

testLarge :: Effect Unit
testLarge = assert true
