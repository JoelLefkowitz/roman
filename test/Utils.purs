module Test.Utils where

import Prelude
import Data.Map (Map, fromFoldable)
import Data.Maybe (Maybe(..))
import Data.Tuple (Tuple(..))
import Effect (Effect)
import Test.Assert (assertEqual)
import Utils.Arrays (largestLessThan, latestSatisfying)
import Utils.Maps (getKeys, getValues, reverseLookup)
import Utils.Strings (trimStart)

testUtils :: Effect Unit
testUtils = do
  testLargestLessThan
  testLatestSatisfying
  testTrimStart
  testGetKeys
  testGetValues
  testReverseLookup

mapFixture :: Map String Int
mapFixture =
  fromFoldable
    [ Tuple "a" 1
    , Tuple "b" 2
    , Tuple "c" 3
    ]

testLargestLessThan :: Effect Unit
testLargestLessThan = do
  assertEqual
    { actual: largestLessThan [ 1, 2, 3, 4 ] 3
    , expected: Just 2
    }
  assertEqual
    { actual: largestLessThan [ 1, 2, 3, 4 ] 0
    , expected: Nothing
    }

testLatestSatisfying :: Effect Unit
testLatestSatisfying = do
  assertEqual
    { actual: latestSatisfying [ 1, 2, 3, 4 ] (\x -> mod x 2 == 1)
    , expected: Just 3
    }
  assertEqual
    { actual: latestSatisfying [ 1, 2, 3, 4 ] (\x -> mod x 2 == 3)
    , expected: Nothing
    }

testTrimStart :: Effect Unit
testTrimStart = do
  assertEqual
    { actual: trimStart "a" "abc"
    , expected: "bc"
    }
  assertEqual
    { actual: trimStart "d" "abc"
    , expected: "abc"
    }

testGetKeys :: Effect Unit
testGetKeys =
  assertEqual
    { actual: getKeys mapFixture
    , expected: [ "a", "b", "c" ]
    }

testGetValues :: Effect Unit
testGetValues =
  assertEqual
    { actual: getValues mapFixture
    , expected: [ 1, 2, 3 ]
    }

testReverseLookup :: Effect Unit
testReverseLookup = do
  assertEqual
    { actual: reverseLookup 3 mapFixture
    , expected: Just "c"
    }
  assertEqual
    { actual: reverseLookup 4 mapFixture
    , expected: Nothing
    }
