# PureScript Roman

Convert between Roman numerals and base 10.

## Status

| Source     | Shields                                                       |
| ---------- | ------------------------------------------------------------- |
| Project    | ![latest_release] ![license] ![line_count] ![language_count]  |
| Health     | ![documentation] ![review_action] ![codacy_quality]           |
| Repository | ![open_issues] ![closed_issues] ![open_pulls] ![closed_pulls] |
| Activity   | ![contributors] ![monthly_commits] ![last_commit]             |

## Installation

```bash
bower install purescript-roman
```

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

## Tests

To run tests:

```bash
pulp test
```

## Documentation

This repository's documentation is hosted on [Pursuit](https://pursuit.purescript.org/packages/purescript-roman).

To generate the documentation locally:

```bash
pulp docs
```

## Linters

To run linters:

```bash
nps lint
```

## Formatters

To run formatters:

```bash
nps format
```

## Continuous integration

This repository uses GitHub Actions to lint and test each commit. Each commit should be formatted and its corresponding documentation should be updated.

## Versioning

This repository adheres to semantic versioning standards. For more information on semantic versioning visit [semver](https://semver.org).

Bump2version is used to version and tag changes. For example:

```bash
bump2version patch
```

## Changelog

Please read this repository's [changelog](CHANGELOG.md) for details on changes that have been made.

## Contributing

Please read this repository's guidelines on [contributing](CONTRIBUTING.md) for details on the process for submitting pull requests. Moreover, our [code of conduct](CODE_OF_CONDUCT.md) declares our collaboration standards.

## Contributors

- [Joel Lefkowitz](https://github.com/joellefkowitz) - Initial work

## Remarks

Lots of love to the open source community!

<p align='center'>
    <img width=200 height=200 src='https://media.giphy.com/media/osAcIGTSyeovPq6Xph/giphy.gif' alt='Be kind to your mind' />
    <img width=200 height=200 src='https://media.giphy.com/media/KEAAbQ5clGWJwuJuZB/giphy.gif' alt='Love each other' />
    <img width=200 height=200 src='https://media.giphy.com/media/WRWykrFkxJA6JJuTvc/giphy.gif' alt="It's ok to have a bad day" />
</p>

[latest_release]: https://img.shields.io/github/v/tag/joellefkowitz/purescript-roman "Latest release"
[license]: https://img.shields.io/github/license/joellefkowitz/purescript-roman "License"
[line_count]: https://img.shields.io/tokei/lines/github/joellefkowitz/purescript-roman "Line count"
[language_count]: https://img.shields.io/github/languages/count/joellefkowitz/purescript-roman "Language count"
[documentation]: https://pursuit.purescript.org/packages/purescript-roman/badge "Documentation"
[review_action]: https://img.shields.io/github/actions/workflow/status/JoelLefkowitz/purescript-roman/review.yml "Review action"
[codacy_quality]: https://img.shields.io/codacy/grade/ec61f81349714facb1a2d53d317c77d6 "Codacy quality"
[open_issues]: https://img.shields.io/github/issues/joellefkowitz/purescript-roman "Open issues"
[closed_issues]: https://img.shields.io/github/issues-closed/joellefkowitz/purescript-roman "Closed issues"
[open_pulls]: https://img.shields.io/github/issues-pr/joellefkowitz/purescript-roman "Open pull requests"
[closed_pulls]: https://img.shields.io/github/issues-pr-closed/joellefkowitz/purescript-roman "Closed pull requests"
[contributors]: https://img.shields.io/github/contributors/joellefkowitz/purescript-roman "Contributors"
[monthly_commits]: https://img.shields.io/github/commit-activity/m/joellefkowitz/purescript-roman "Monthly commits"
[last_commit]: https://img.shields.io/github/last-commit/joellefkowitz/purescript-roman "Last commit"
