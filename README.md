# PureScript Roman

Convert between Roman numerals and base 10.

## Status

| Source     | Shields                                                                                                                         |
| ---------- | ------------------------------------------------------------------------------------------------------------------------------- |
| Project    | ![release][release_shield] ![license][license_shield]  ![lines][lines_shield] ![languages][languages_shield]                    |
| Health     | ![codacy][codacy_shield] ![readthedocs][readthedocs_shield] ![travis][travis_shield] ![codacy_coverage][codacy_coverage_shield] |
| Repository | ![issues][issues_shield] ![issues_closed][issues_closed_shield] ![pulls][pulls_shield] ![pulls_closed][pulls_closed_shield]     |
| Activity   | ![contributors][contributors_shield] ![monthly_commits][monthly_commits_shield] ![last_commit][last_commit_shield]              |

## Installing

```bash
spago install roman
```

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

## Tests

To run unit tests and generate a coverage report:

```bash
grunt tests:unit
```

## Documentation

This repository's documentation is hosted on [readthedocs][readthedocs].

To generate the sphinx configuration:

```bash
grunt docs:generate
```

Then build the documentation:

```bash
grunt docs:build
```

## Tooling

To run linters:

```bash
grunt lint
```

To run formatters:

```bash
grunt format
```

Before committing new code:

```bash
grunt precommit
```

This will run linters, formatters, tests, generate a test coverage report and the sphinx configuration.

## Continuous integration

This repository uses Travis CI to build and test each commit. Formatting tasks and writing/generating documentation must be done before committing new code.

## Versioning

This repository adheres to semantic versioning standards.
For more information on semantic versioning visit [SemVer][semver].

Bump2version is used to version and tag changes.
For example:

```bash
bump2version patch
```

## Changelog

Please read this repository's [CHANGELOG](CHANGELOG.md) for details on changes that have been made.

## Contributing

Please read this repository's guidelines on [CONTRIBUTING](CONTRIBUTING.md) for details on our code of conduct and the process for submitting pull requests.

## Contributors

- **Joel Lefkowitz** - _Initial work_ - [Joel Lefkowitz][author]

[![Buy Me A Coffee][coffee_button]][coffee]

## Remarks

Lots of love to the open source community!

![Be kind][be_kind]

<!-- Public links -->
[semver]: http://semver.org/

<!-- External links -->
[readthedocs]: https://purescript-roman.readthedocs.io/en/latest/
[coffee]: https://www.buymeacoffee.com/joellefkowitz
[coffee_button]: https://cdn.buymeacoffee.com/buttons/default-blue.png
[be_kind]: https://media.giphy.com/media/osAcIGTSyeovPq6Xph/giphy.gif

<!-- Acknowledgments -->
[author]: https://github.com/joellefkowitz

<!-- Project shields -->
[release_shield]: https://img.shields.io/github/v/tag/joellefkowitz/purescript-roman
[license_shield]: https://img.shields.io/github/license/joellefkowitz/purescript-roman
[lines_shield]: https://img.shields.io/tokei/lines/github/joellefkowitz/purescript-roman
[languages_shield]: https://img.shields.io/github/languages/count/joellefkowitz/purescript-roman

<!-- Health shields -->
[codacy_shield]: https://img.shields.io/codacy/grade/ec61f81349714facb1a2d53d317c77d6
[readthedocs_shield]: https://img.shields.io/readthedocs/purescript-roman
[travis_shield]: https://img.shields.io/travis/com/joellefkowitz/purescript-roman
[codacy_coverage_shield]: https://img.shields.io/codacy/coverage/ec61f81349714facb1a2d53d317c77d6

<!-- Repository shields -->
[issues_shield]: https://img.shields.io/github/issues/joellefkowitz/purescript-roman
[issues_closed_shield]: https://img.shields.io/github/issues-closed/joellefkowitz/purescript-roman
[pulls_shield]: https://img.shields.io/github/issues-pr/joellefkowitz/purescript-roman
[pulls_closed_shield]: https://img.shields.io/github/issues-pr-closed/joellefkowitz/purescript-roman

<!-- Activity shields -->
[contributors_shield]: https://img.shields.io/github/contributors/joellefkowitz/purescript-roman
[monthly_commits_shield]: https://img.shields.io/github/commit-activity/m/joellefkowitz/purescript-roman
[last_commit_shield]: https://img.shields.io/github/last-commit/joellefkowitz/purescript-roman
