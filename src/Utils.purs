module Utils where

import Prelude
import Data.Foldable (foldl)
import Data.List (head, toUnfoldable)
import Data.Map (Map, filter, values)
import Data.Map.Internal (keys)
import Data.Maybe (Maybe(..), fromMaybe)
import Data.String.CodePoints (length)
import Data.String.CodeUnits (slice)
import Data.String.Utils (startsWith)

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

trimStart :: String -> String -> String
trimStart x str
  | x == str = ""
  | startsWith x str = fromMaybe str $ slice (length x) (length str) str
  | otherwise = str

getKeys :: forall k v. Map k v -> Array k
getKeys map = toUnfoldable $ keys map

getValues :: forall k v. Map k v -> Array v
getValues map = toUnfoldable $ values map

reverseLookup :: forall k v. Eq v => Ord k => v -> Map k v -> Maybe k
reverseLookup x = head <<< keys <<< filter (\v -> v == x)
