{ name = "roman"
, dependencies =
  [ "assert"
  , "array-search"
  , "console"
  , "debug"
  , "effect"
  , "maps-eager"
  , "node-fs"
  , "ordered-collections"
  , "psci-support"
  , "repr"
  , "strings"
  , "stringutils"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
