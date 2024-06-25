# Roman

Convert between Roman numerals and base 10.

![Review](https://img.shields.io/github/actions/workflow/status/JoelLefkowitz/roman/review.yml)
![Version](https://pursuit.purescript.org/packages/purescript-roman/badge)
![Quality](https://img.shields.io/codacy/grade/ec61f81349714facb1a2d53d317c77d6)

## Installing

```bash
spago install roman
```

## Documentation

Documentation and more detailed examples are hosted on [Pursuit](https://pursuit.purescript.org/packages/purescript-roman).

## Usage

<!-- spellchecker: disable -->

```purs
import Data.Roman.Convert (toRoman, fromRoman)

> toRoman 145
"CXLV"

> fromRoman "CXLV"
145
```

<!-- spellchecker: enable -->

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

## Tooling

### Dependencies

To install dependencies:

```bash
yarn install
yarn spago install
```

### Tests

To run tests:

```bash
yarn spago test
```

### Documentation

To generate the documentation locally:

```bash
yarn spago docs
```

### Linters

To run linters:

```bash
yarn lint
```

### Formatters

To run formatters:

```bash
yarn format
```

## Contributing

Please read this repository's [Code of Conduct](CODE_OF_CONDUCT.md) which outlines our collaboration standards and the [Changelog](CHANGELOG.md) for details on breaking changes that have been made.

This repository adheres to semantic versioning standards. For more information on semantic versioning visit [SemVer](https://semver.org).

Bump2version is used to version and tag changes. For example:

```bash
bump2version patch
```

### Contributors

- [Joel Lefkowitz](https://github.com/joellefkowitz) - Initial work

## Remarks

Lots of love to the open source community!

<div align='center'>
    <img width=200 height=200 src='https://media.giphy.com/media/osAcIGTSyeovPq6Xph/giphy.gif' alt='Be kind to your mind' />
    <img width=200 height=200 src='https://media.giphy.com/media/KEAAbQ5clGWJwuJuZB/giphy.gif' alt='Love each other' />
    <img width=200 height=200 src='https://media.giphy.com/media/WRWykrFkxJA6JJuTvc/giphy.gif' alt="It's ok to have a bad day" />
</div>
