{ name = "purescript-roman"
, version = "0.2.1"
, repository = "https://github.com/JoelLefkowitz/purescript-roman"
, license = "MIT"
, dependencies = 
    [ "array-search"
    , "maps-eager"
    , "ordered-collections"
    , "prelude"
    , "repr"
    , "stringutils"
    ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs" ]
}
