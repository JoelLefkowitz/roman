module Generate where

import Prelude
import Data.Array (foldl, index, length, range)
import Data.Foldable (and)
import Data.Int (pow)
import Data.Map (fromFoldable, empty)
import Data.Maybe (fromMaybe)
import Data.Tuple (Tuple(..))
import Symbols (SymbolsTable(..))

infix 8 range as ..

data MagnitudeSet
  = MagnitudeSet String String String Int

instance eqMagnitudeSet :: Eq MagnitudeSet where
  eq (MagnitudeSet o1 f1 t1 m1) (MagnitudeSet o2 f2 t2 m2) =
    and
      [ eq o1 o2
      , eq f1 f2
      , eq t1 t2
      , eq m1 m2
      ]

instance showMagnitudeSet :: Show MagnitudeSet where
  show (MagnitudeSet o f t m) =
    foldl append " "
      [ "[One:"
      , o
      , " Five:"
      , f
      , " Ten:"
      , t
      , " Magnitude:"
      , show m
      , "]"
      ]

magnitudeSetsFromLetters :: Array String -> Array MagnitudeSet
magnitudeSetsFromLetters letters
  | length letters < 3 = []
  | otherwise = do
    i <- 0 .. ((length letters - 3) / 2)
    pure
      $ MagnitudeSet
          (get letters (2 * i))
          (get letters (2 * i + 1))
          (get letters (2 * i + 2))
          (pow 10 i)
    where
    get arr x = fromMaybe "" $ index arr x

magnitudeSetToSymbols :: MagnitudeSet -> SymbolsTable
magnitudeSetToSymbols (MagnitudeSet o f t m) =
  SymbolsTable
    ( fromFoldable
        [ Tuple o (1 * m)
        , Tuple (o <> f) (4 * m)
        , Tuple f (5 * m)
        , Tuple (o <> t) (9 * m)
        , Tuple (t) (10 * m)
        ]
    )

generateSymbolsTable :: Array String -> SymbolsTable
generateSymbolsTable letters = foldl joinSets (SymbolsTable empty) (magnitudeSetsFromLetters letters)
  where
  joinSets acc x = append acc (magnitudeSetToSymbols x)
