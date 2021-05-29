module Utils.Maps where

import Prelude
import Data.List (head, toUnfoldable)
import Data.Map (Map, filter, values)
import Data.Map.Internal (keys)
import Data.Maybe (Maybe)

reverseLookup :: forall k v. Eq v => Ord k => v -> Map k v -> Maybe k
reverseLookup x = head <<< keys <<< filter (\v -> v == x)

getKeys :: forall k v. Map k v -> Array k
getKeys map = toUnfoldable $ keys map

getValues :: forall k v. Map k v -> Array v
getValues map = toUnfoldable $ values map
