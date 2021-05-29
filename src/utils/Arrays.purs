module Utils.Arrays where

import Prelude
import Data.Foldable (foldl)
import Data.Maybe (Maybe(..))

largestLessThan :: forall a. Ord a => Array a -> a -> Maybe a
largestLessThan arr limit = foldl updateLargest Nothing arr
  where
  updateLargest acc x
    | acc < Just x && x < limit = Just x
    | otherwise = acc

latestSatisfying :: forall a. Array a -> (a -> Boolean) -> Maybe a
latestSatisfying arr cond = foldl updateLatest Nothing arr
  where
  updateLatest acc x
    | cond x = (Just x)
    | otherwise = acc
