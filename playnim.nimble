# Package

version       = "0.1.0"
author        = "Gabben"
description   = "A new awesome Nim playground"
license       = "MIT"
srcDir        = "src"
bin           = @["playnim"]


# Dependencies

requires "nim >= 1.6.10"
requires "nimscripter"

task make, "Do the job":
  exec "nim c -d:release -d:danger -d:emscripten --os:linux --out=index.html src/playnim"
