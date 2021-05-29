module Utils.Strings where

import Prelude
import Data.Maybe (fromMaybe)
import Data.String.CodePoints (length)
import Data.String.CodeUnits (slice)
import Data.String.Utils (startsWith)

trimStart :: String -> String -> String
trimStart x str
  | x == str = ""
  | startsWith x str = fromMaybe str $ slice (length x) (length str) str
  | otherwise = str
