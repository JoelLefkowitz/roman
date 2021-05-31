```purs
import Data.Roman.Convert (toRoman, fromRoman)

> toRoman 145
"CXLV"

> fromRoman "CXLV"
145
```

```purs
import Data.Map (fromFoldable)
import Data.Tuple (Tuple(..))
import Data.Roman.Symbols (symbolsTable)

> symbolsTable
SymbolsTable
    ( fromFoldable
        [ Tuple "I"  1
        , Tuple "IV" 4
        , Tuple "V"  5
        , Tuple "IX" 9
        , Tuple "X"  10
        , Tuple "XL" 40
        , Tuple "L" 50
        , Tuple "XC" 90
        , Tuple "C" 100
        , Tuple "CD" 400
        , Tuple "D" 500
        , Tuple "CM" 900
        , Tuple "M" 1000
        ]
    )
```

```purs
import Data.Roman.Generate (generateSymbolsTable)

> generateSymbolsTable ["I", "V", "X", "L", "C", "D", "M", "V*", "X*"]
SymbolsTable
    ( fromFoldable
        [ Tuple "I" 1
        , Tuple "IV" 4
        , Tuple "V" 5
        , Tuple "IX" 9
        , Tuple "X" 10
        , Tuple "XL" 40
        , Tuple "L" 50
        , Tuple "XC" 90
        , Tuple "C" 100
        , Tuple "CD" 400
        , Tuple "D" 500
        , Tuple "CM" 900
        , Tuple "M" 1000
        , Tuple "MV*" 4000
        , Tuple "V*" 5000
        , Tuple "MX*" 9000
        , Tuple "X*" 10000
        ]
    )
```
